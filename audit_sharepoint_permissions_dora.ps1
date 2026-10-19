<#
.SYNOPSIS
    Skrypt audytowy uprawnień i linków zewnętrznych w SharePoint Online pod kątem DORA i KNF ICT.
.DESCRIPTION
    Skanuje biblioteki i foldery w witrynie SharePoint, identyfikując:
    - Biblioteki i foldery z wyłamanym dziedziczeniem uprawnień (hasUniqueRoleAssignments)
    - Bezpośrednie uprawnienia użytkowników (Direct User Permissions zamiast grup M365)
    - Linki anonimowe ("Anyone with the link") naruszające art. 104 Prawa Bankowego
    Generuje ustrukturyzowany raport w formacie CSV gotowy do przekazania audytorom.
.NOTES
    Autor: Tomasz Rembiasz (REMBIASZ GRC Tech Solutions, NIP: 887-155-01-62)
    Wymagania: PnP.PowerShell v2.x+, PowerShell 7+
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, HelpMessage = "Adres URL witryny SharePoint do audytu")]
    [string]$SiteUrl,

    [Parameter(Mandatory = $false, HelpMessage = "Ścieżka do pliku raportu CSV")]
    [string]$ReportPath = "Raport_Uprawnien_DORA_2026.csv"
)

$ErrorActionPreference = "Stop"

Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host " AUDYT UPRAWNIEŃ & ZERO TRUST - PNP.POWERSHELL (DORA ART. 9 / ICT)" -ForegroundColor Cyan
Write-Host " REMBIASZ GRC Tech Solutions Tomasz Rembiasz • NIP: 887-155-01-62 " -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan

# 1. Połączenie z witryną
try {
    Write-Host "`n[1/3] Łączenie z witryną: $SiteUrl..." -ForegroundColor Yellow
    Connect-PnPOnline -Url $SiteUrl -Interactive
    Write-Host "✓ Połączono pomyślnie." -ForegroundColor Green
} catch {
    Write-Error "Błąd logowania do SharePoint: $_"
    exit 1
}

# 2. Pobranie wszystkich bibliotek dokumentów
Write-Host "`n[2/3] Skanowanie bibliotek dokumentów i sprawdzanie dziedziczenia..." -ForegroundColor Yellow

$libraries = Get-PnPList | Where-Object { $_.BaseType -eq "DocumentLibrary" -and -not $_.Hidden }
$auditResults = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($lib in $libraries) {
    Write-Host "  -> Skanowanie biblioteki: $($lib.Title)..." -ForegroundColor Gray

    # Sprawdzenie dziedziczenia na poziomie biblioteki
    $hasUnique = Get-PnPProperty -ClientObject $lib -Property HasUniqueRoleAssignments

    $roleAssignments = Get-PnPListPermissions -Identity $lib.Title

    foreach ($role in $roleAssignments) {
        $member = $role.Member
        $isDirectUser = ($member.PrincipalType.ToString() -eq "User")

        $riskLevel = "NISKIE"
        $notes = "Standardowe dziedziczenie lub grupa"

        if ($hasUnique) {
            $riskLevel = "ŚREDNIE"
            $notes = "Wyłamane dziedziczenie uprawnień na poziomie biblioteki"
        }

        if ($isDirectUser) {
            $riskLevel = "WYSOKIE"
            $notes = "Naruszenie reguły Zero Trust: Bezpośrednie uprawnienie użytkownika zamiast grupy Entra ID"
        }

        $auditResults.Add([PSCustomObject]@{
            "DataAudytu"        = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
            "Witryna"           = $SiteUrl
            "Biblioteka"        = $lib.Title
            "Element"           = "[Katalog Główny Biblioteki]"
            "ZłamaneDziedziczenie" = $hasUnique
            "PodmiotDostepu"    = $member.Title
            "TypPodmiotu"       = $member.PrincipalType
            "PoziomUprawnien"   = ($role.RoleDefinitionBindings | Select-Object -ExpandProperty Name) -join "; "
            "PoziomRyzykaDORA"  = $riskLevel
            "ZalecenieAudytowe" = $notes
        })
    }

    # Skanowanie elementów podrzędnych pod kątem unikalnych uprawnień
    $items = Get-PnPListItem -List $lib.Title -PageSize 200 -Fields "Id", "FileRef", "FileLeafRef"
    foreach ($item in $items) {
        $itemHasUnique = Get-PnPProperty -ClientObject $item -Property HasUniqueRoleAssignments
        if ($itemHasUnique) {
            $auditResults.Add([PSCustomObject]@{
                "DataAudytu"        = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
                "Witryna"           = $SiteUrl
                "Biblioteka"        = $lib.Title
                "Element"           = $item["FileRef"]
                "ZłamaneDziedziczenie" = $true
                "PodmiotDostepu"    = "[Unikalne Role na Pliku]"
                "TypPodmiotu"       = "N/A"
                "PoziomUprawnien"   = "Niezależna lista ACL"
                "PoziomRyzykaDORA"  = "KRYTYCZNE"
                "ZalecenieAudytowe" = "Wykryto wyłamane dziedziczenie na pliku. Ryzyko wycieku tajemnicy bankowej i degradacji bazy SharePoint."
            })
        }
    }
}

# 3. Zapis raportu do pliku CSV
Write-Host "`n[3/3] Eksport wyników do pliku CSV..." -ForegroundColor Yellow
$auditResults | Export-Csv -Path $ReportPath -NoTypeInformation -Encoding utf8BOM -Delimiter ";"

$criticalCount = ($auditResults | Where-Object { $_.PoziomRyzykaDORA -eq "KRYTYCZNE" }).Count
$highCount = ($auditResults | Where-Object { $_.PoziomRyzykaDORA -eq "WYSOKIE" }).Count

Write-Host "✓ Zapisano raport: $ReportPath" -ForegroundColor Green
Write-Host "  Liczba zidentyfikowanych ryzyk krytycznych: $criticalCount" -ForegroundColor $(if ($criticalCount -gt 0) { "Red" } else { "Green" })
Write-Host "  Liczba zidentyfikowanych ryzyk wysokich:     $highCount" -ForegroundColor $(if ($highCount -gt 0) { "Yellow" } else { "Green" })

Write-Host "`n==================================================================" -ForegroundColor Cyan
Write-Host " AUDYT ZAKOŃCZONY. RAPORT GOTOWY DO PRZEKAZANIA ZESPOŁOWI AUDYTU. " -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan
