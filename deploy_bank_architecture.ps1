<#
.SYNOPSIS
    Automatyczny provisioning architektury informacji SharePoint M365 dla Sektora Bankowego (IaC).
.DESCRIPTION
    Skrypt wdraża wzorcową architekturę GRC zgodną z DORA i wytycznymi KNF w zakresie ryzyka ICT:
    - Rejestruje grupę Kolumn Witryny (Site Columns): Tajemnica Bankowa (art. 104), Numer Sprawy CIF, Data Przeglądu DORA, itp.
    - Tworzy Typ Zawartości (Content Type) "Bankowa Procedura Regulacyjna" dziedziczący z typu Dokument.
    - Tworzy bezpieczną bibliotekę dokumentów z wymuszonym wersjonowaniem głównym i pomocniczym.
.NOTES
    Autor: Tomasz Rembiasz (REMBIASZ GRC Tech Solutions, NIP: 887-155-01-62)
    Wymagania: Moduł PnP.PowerShell (v2.x+), PowerShell 7+
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, HelpMessage = "Adres URL witryny SharePoint Banku")]
    [string]$SiteUrl,

    [Parameter(Mandatory = $false, HelpMessage = "Identyfikator aplikacji Microsoft Entra ID (dla certyfikatu)")]
    [string]$ClientId,

    [Parameter(Mandatory = $false, HelpMessage = "Odcisk certyfikatu (Thumbprint)")]
    [string]$CertificateThumbprint,

    [Parameter(Mandatory = $false, HelpMessage = "Nazwa domeny tenanta (np. bank.onmicrosoft.com)")]
    [string]$Tenant
)

$ErrorActionPreference = "Stop"

Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host " BANK GRC ARCHITECTURE PROVISIONING - PNP.POWERSHELL (DORA & ICT) " -ForegroundColor Cyan
Write-Host " REMBIASZ GRC Tech Solutions Tomasz Rembiasz • NIP: 887-155-01-62 " -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan

# 1. Połączenie z SharePoint Online
try {
    if ($ClientId -and $CertificateThumbprint -and $Tenant) {
        Write-Host "`n[1/5] Łączenie z witryną za pomocą certyfikatu Entra ID..." -ForegroundColor Yellow
        Connect-PnPOnline -Url $SiteUrl -ClientId $ClientId -Thumbprint $CertificateThumbprint -Tenant $Tenant
    } else {
        Write-Host "`n[1/5] Łączenie z witryną w trybie interaktywnym (MFA)..." -ForegroundColor Yellow
        Connect-PnPOnline -Url $SiteUrl -Interactive
    }
    Write-Host "✓ Pomyślnie połączono z: $SiteUrl" -ForegroundColor Green
} catch {
    Write-Error "Błąd połączenia z SharePoint: $_"
    exit 1
}

$GroupName = "Bank GRC - Kolumny Regulacyjne"

# 2. Definicja i Tworzenie Kolumn Witryny (Site Columns)
Write-Host "`n[2/5] Wdrażanie Kolumn Witryny (Site Columns)..." -ForegroundColor Yellow

$columnsToDeploy = @(
    @{
        InternalName = "Bank_NumerProcedury"
        DisplayName  = "Numer Sprawy / Identyfikator Aktu"
        Type         = "Text"
        Description  = "Unikalny numer ewidencyjny procedury lub wniosku kredytowego"
    },
    @{
        InternalName = "Bank_Departament"
        DisplayName  = "Departament Właścicielski"
        Type         = "Choice"
        Choices      = @(
            "Departament Ryzyka Kredytowego i Klientów Kluczowych",
            "Departament Bezpieczeństwa Informacji (CISO) & DORA",
            "Departament Zgodności (Compliance) & AML",
            "Departament Audytu Wewnętrznego",
            "Departament Operacji Bankowych i Rozliczeń"
        )
        Description  = "Pion merytorycznie odpowiedzialny za treść dokumentu"
    },
    @{
        InternalName = "Bank_TajemnicaBankowa"
        DisplayName  = "Klauzula Poufności (Art. 104 Pr. Bank.)"
        Type         = "Choice"
        Choices      = @(
            "ŚCIŚLE POUFNE • TAJEMNICA BANKOWA (ART. 104 PR. BANKOWEGO)",
            "POUFNE DO UŻYTKU WEWNĘTRZNEGO (INTERNAL RESTRICTED)",
            "JAWNE • PUBLIKACJA PUBLICZNA NA STRONIE BANKU"
        )
        Description  = "Obligatoryjna klauzula tajemnicy zawodowej i bankowej"
    },
    @{
        InternalName = "Bank_DataWejscia"
        DisplayName  = "Data Wejścia w Życie"
        Type         = "DateTime"
        Description  = "Dzień wejścia w życie aktu normatywnego"
    },
    @{
        InternalName = "Bank_DataPrzegladu"
        DisplayName  = "Termin Przeglądu (DORA Art. 11)"
        Type         = "DateTime"
        Description  = "Data planowanego rocznego audytu procedury ICT"
    }
)

foreach ($col in $columnsToDeploy) {
    $existing = Get-PnPField -Identity $col.InternalName -ErrorAction SilentlyContinue
    if (-not $existing) {
        if ($col.Type -eq "Choice") {
            Add-PnPField -Type Choice -InternalName $col.InternalName -DisplayName $col.DisplayName -Group $GroupName -Choices $col.Choices | Out-Null
        } elseif ($col.Type -eq "DateTime") {
            Add-PnPField -Type DateTime -InternalName $col.InternalName -DisplayName $col.DisplayName -Group $GroupName | Out-Null
        } else {
            Add-PnPField -Type Text -InternalName $col.InternalName -DisplayName $col.DisplayName -Group $GroupName | Out-Null
        }
        Write-Host "  + Utworzono kolumnę: $($col.DisplayName) [$($col.InternalName)]" -ForegroundColor Green
    } else {
        Write-Host "  = Kolumna już istnieje: $($col.DisplayName)" -ForegroundColor Gray
    }
}

# 3. Tworzenie Typu Zawartości (Content Type)
Write-Host "`n[3/5] Wdrażanie Typu Zawartości (Site Content Type)..." -ForegroundColor Yellow
$ctName = "Bankowa Procedura Regulacyjna"
$ctGroup = "Bank GRC - Typy Zawartości"
$ctParentId = "0x0101" # Typ bazowy: Dokument

$ct = Get-PnPContentType -Identity $ctName -ErrorAction SilentlyContinue
if (-not $ct) {
    $ct = Add-PnPContentType -Name $ctName -Group $ctGroup -ParentContentType (Get-PnPContentType -Identity "Document")
    Write-Host "  + Utworzono Typ Zawartości: $ctName" -ForegroundColor Green
} else {
    Write-Host "  = Typ Zawartości już istnieje: $ctName" -ForegroundColor Gray
}

# Wiązanie kolumn z typem zawartości
foreach ($col in $columnsToDeploy) {
    $fieldInCt = Get-PnPProperty -ClientObject $ct -Property Fields | Where-Object { $_.InternalName -eq $col.InternalName }
    if (-not $fieldInCt) {
        Add-PnPFieldToContentType -Field $col.InternalName -ContentType $ctName | Out-Null
        Write-Host "  + Powiązano kolumnę $($col.InternalName) z typem $ctName" -ForegroundColor DarkGreen
    }
}

# 4. Tworzenie Dedykowanej Biblioteki Dokumentów
Write-Host "`n[4/5] Konfiguracja Biblioteki Regulacji Wewnętrznych..." -ForegroundColor Yellow
$libTitle = "Centralny Rejestr Procedur i Polityk ICT"
$libUrl   = "ProceduryBankoweICT"

$list = Get-PnPList -Identity $libTitle -ErrorAction SilentlyContinue
if (-not $list) {
    $list = New-PnPList -Title $libTitle -Template DocumentLibrary -Url $libUrl
    Write-Host "  + Utworzono bibliotekę: $libTitle ($libUrl)" -ForegroundColor Green
} else {
    Write-Host "  = Biblioteka już istnieje: $libTitle" -ForegroundColor Gray
}

# 5. Konfiguracja Bezpieczeństwa & Wersjonowania Biblioteki
Write-Host "`n[5/5] Wymuszenie Rygoru Bezpieczeństwa i Zgodności DORA..." -ForegroundColor Yellow

# Włączenie obsługi wielu typów zawartości
Set-PnPList -Identity $libTitle -ContentTypesEnabled $true -EnableVersioning $true -MajorVersionLimit 50 -EnableMinorVersions $true -MinorVersionLimit 10

# Przypisanie typu zawartości do biblioteki
Add-PnPContentTypeToList -List $libTitle -ContentType $ctName -DefaultContentType | Out-Null

Write-Host "  ✓ Włączono wersjonowanie główne i pomocnicze (50 wersji)" -ForegroundColor Green
Write-Host "  ✓ Ustawiono '$ctName' jako domyślny typ dokumentu" -ForegroundColor Green

Write-Host "`n==================================================================" -ForegroundColor Cyan
Write-Host " PROVISIONING ZAKOŃCZONY SUKCESEM! ŚRODOWISKO GOTOWE DO AUDYTU.   " -ForegroundColor Green
Write-Host "==================================================================" -ForegroundColor Cyan
