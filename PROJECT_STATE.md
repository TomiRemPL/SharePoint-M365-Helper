# Stan Projektu: SharePoint M365 Helper

> **Data zapisu:** 2026-10-08  
> **Status:** Wersja bazowa 1.0 opublikowana na GitHub  
> **Repozytorium GitHub:** [https://github.com/TomiRemPL/SharePoint-M365-Helper](https://github.com/TomiRemPL/SharePoint-M365-Helper)

---

## 🏢 Dane Firmy Użytkownika (Trwale Zapamiętane)
* **Nazwa Firmy:** `REMBIASZ GRC Tech Solutions Tomasz Rembiasz`
* **NIP:** `887-155-01-62`
* **E-mail:** `trembiasz@gmail.com`
* **Profil działalności:** Tworzenie aplikacji GRC dla Sektora Bankowego (Governance, Risk & Compliance), Oracle APEX, Python, systemy wsparcia procesów.

---

## 📦 Zrealizowane Komponenty

1. **`index.html` (Główny Portal Wiedzy i Hub Nawigacyjny)**:
   * Nowoczesny dashboard w klasie Enterprise / Banking GRC integrujący wszystkie moduły.
   * Globalny Live Search w czasie rzeczywistym z obsługą słów kluczowych i pustego stanu wyników.
   * Wszystkie 9 modułów produkcyjnie wdrożonych (100% pokrycia roadmapy).
   * Matryca Zgodności Regulacyjnej GRC (DORA Art. 9/11, wytyczne KNF w zakresie ryzyka ICT, Prawo Bankowe Art. 104, ISO 27001).
   * Czysty nagłówek z bezpośrednim kontaktem e-mail i repozytorium GitHub oraz pełna stopka firmowa.

2. **Dedykowany Skill Agenta: `.agents/skills/sharepoint-content-creator/SKILL.md`**:
   * Kompletna specyfikacja tworzenia i rozbudowy bazy wiedzy.
   * Wymogi technologiczne: 100% offline-first, brak zewnętrznych CDN, czysty semantyczny HTML5/CSS/JS.
   * Design System, paleta tokenów CSS, wzorce komponentów (nagłówek ze switcherem, pasek boczny ze scroll-spy, karty, alerty bankowe).
   * Wytyczne zgodności bankowej (KNF, DORA, Tajemnica Bankowa) oraz stałe dane firmy w stopkach.
   * Standaryzowana procedura rejestracji nowych modułów w portalu `index.html`.

3. **`sharepoint_word_templates.html` (Szablony Word .dotx, Quick Parts & Organization Assets Library)**:
   * Dwukierunkowa synchronizacja metadanych SharePoint z plikami Microsoft Word za pośrednictwem Custom XML Data Binding i Document Properties.
   * Standaryzacja metryki dokumentu regulacyjnego: numer procedury, departament, właściciel biznesowy, data wejścia w życie, data przeglądu DORA / ICT.
   * Wymuszona klauzula Tajemnicy Bankowej (art. 104 Prawa Bankowego) w nagłówku i stopce dokumentu.
   * Pełny skrypt PowerShell do wdrożenia centralnego repozytorium szablonów w tenancie (*Organization Assets Library - OfficeTemplateLibrary*).
   * Interaktywny symulator live sandbox: dynamiczne wprowadzanie metadanych SharePoint z natychmiastowym podglądem karty tytułowej Word oraz przełącznikiem widoku kodów pól `{ Quick Parts }`.

4. **`sharepoint_power_automate.html` (Automatyzacja Obiegów, Power Automate & Alerty KNF / DORA)**:
   * Wzorcowe obiegi akceptacji procedur regulacyjnych: opiniowanie równoległe (Compliance/Ryzyko/IT) oraz sekwencyjny podpis Zarządu Banku.
   * Atomowa, unikalna numeracja spraw i procedur (np. `PROC/RYZ/2026/0042`) bez ryzyka kolizji współbieżnych (Race Condition).
   * Cykliczny monitoring i alerty rocznego przeglądu procedur (DORA Art. 11 & ład ICT) w cyklach T-60, T-30 i T-0 dni.
   * Post-Approval Lockdown: automatyczne zamrażanie uprawnień do wersji tylko do odczytu przez SharePoint REST API i konwersja do PDF/A.
   * Gotowe wyrażenia WExpressions, OData Filter Queries, wzorzec obsługi błędów Try-Catch (Scope Run After) oraz interaktywny symulator procesu na żywo.

5. **`sharepoint_security_permissions.html` (Bezpieczeństwo, Uprawnienia & Zero Trust w Sektorze Bankowym)**:
   * Projektowanie architektury uprawnień w modelu Zero Trust z uwzględnieniem art. 104 Prawa Bankowego, rozporządzenia DORA oraz wytycznych ICT KNF.
   * Dedykowana rola *Audytor (Restricted View / Blokada Pobierania)* zapobiegająca niekontrolowanemu wyciekowi danych.
   * Zarządzanie dziedziczeniem, limity SharePoint (50k unikalnych uprawnień) i higiena bibliotek dokumentów.
   * Restrykcje dostępu gości (B2B Guest Sharing) i bezpieczne alternatywy dla linków anonimowych.
   * Etykietowanie wrażliwości w Microsoft Purview, szyfrowanie RMS, ochrona urządzeń prywatnych (MAM) i audyt w Unified Audit Log.
   * Interaktywny symulator / kalkulator ryzyka KNF / DORA z natychmiastową oceną konfiguracji i zaleceniami wdrożeniowymi.

6. **`sharepoint_lists_json.html` (Microsoft Lists & Rejestry Bankowe JSON)**:
   * Zastąpienie ryzykownych arkuszy Excela audytowalnymi rejestrami MS Lists (Rejestr Ryzyka ICT & Incydentów DORA).
   * Gotowe do skopiowania schematy JSON: Pill Badges statusów, dynamiczna macierz ryzyka (Heatmap), dynamiczne wskaźniki SLA (@now).
   * Formatowanie układu formularza: nagłówek (Header JSON) oraz wielokolumnowy podział na sekcje (Body JSON).
   * Interaktywny symulator tabeli demo (Live Sandbox) z natychmiastową reakcją stylów i przyciskami symulacji incydentów.
   * Rozbudowana sekcja FAQ, limity techniczne i zasady odwoływania się do kolumn.

7. **`sharepoint_columns_content_types.html` (Galerie Projektanta stron sieci Web)**:
   * Wyczerpujący podręcznik architektury informacji: *Kolumny witryny* (Site Columns) oraz *Typy zawartości* (Site Content Types).
   * Hierarchia dziedziczenia oparta o nadrzędny `Bankowy Dokument Bazowy`.
   * Trzy gotowe scenariusze bankowe (Kredyty CIF, Compliance & AML, Procedury DORA/ICT).
   * **Formatowanie JSON Kolumn Witryny**: szablony JSON z dziedziczeniem w całym tenancie (`Bank_TajemnicaBankowa` z kłódką, progi ekspozycji kredytowej `Bank_KwotaEkspozycji`, monitor ważności procedury `Bank_DataPrzegladu` DORA/ICT).
   * Dwukierunkowa nawigacja: powrót do `index.html` i przełącznik do podręcznika codziennego.

8. **`sharepoint_helper.html` (Podręcznik Codziennej Pracy)**:
   * Asystent codziennej pracy z SharePoint M365 (9 modułów: biblioteki, współedycja, udostępnianie, widoki, OneDrive, kosz, skróty).
   * Wyszukiwarka Live Search, interaktywny akordeon problemów, dwukierunkowa nawigacja do `index.html` i Galerii Projektanta.

9. **`sharepoint_quickstart.html` (Jednostronicowy Cheat Sheet A4)**:
   * Sformatowany do dokładnych wymiarów 1 strony A4, zoptymalizowany pod bezpośredni wydruk / PDF (`Ctrl + P`), pasek narzędzi z linkiem powrotnym do `index.html`.

10. **`sharepoint_quickstart.md`**:
    * Podręczna wersja Markdown do wklejenia w Microsoft Teams, OneNote lub intranet.

11. **`sharepoint_pnp_powershell.html` & Skrypty `.ps1` (Automatyzacja Wdrożeń: PnP.PowerShell & CLI M365)**:
    * Kompletny przewodnik wdrożeń Infrastructure as Code (IaC) w SharePoint Online.
    * Gotowe skrypty: `deploy_bank_architecture.ps1` (provisioning w 30 sek.) oraz `audit_sharepoint_permissions_dora.ps1` (skanowanie uprawnień i raport CSV).
    * Bezpieczne uwierzytelnianie certyfikatem X.509 w Entra ID oraz izolacja uprawnień `Sites.Selected`.
    * Interaktywny generator skryptów na żywo (Live Builder) oraz procedury migracji PnP Provisioning Schema.

12. **`README.md` & `.gitignore`**:
    * Kompletna dokumentacja projektu i czysta konfiguracja gita.

---

## 🎯 Główne Ustalenia Architektoniczne
- **Brak zależności zewnętrznych:** Wszystkie narzędzia HTML działają w 100% offline/lokalnie po dwukrotnym kliknięciu w dowolnej przeglądarce.
- **Specyfika bankowa:** Wszystkie przykłady i schematy uwzględniają specyfikę polskiego i unijnego sektora bankowego (art. 104 Prawa Bankowego, rozporządzenie DORA, wytyczne KNF w zakresie ryzyka ICT).
- **Zintegrowana siatka nawigacyjna:** Wszystkie podstrony posiadają wzajemne łącza prowadzące do portalu głównego `index.html` oraz sąsiednich podręczników.

---

## 🚀 Stan Projektu & Podsumowanie Roadmapy
* **Wszystkie 9 modułów zdefiniowanych w roadmapie portalu zostało w 100% zrealizowanych, przetestowanych i opublikowanych.**
* Repozytorium stanowi kompletny, samowystarczalny pakiet narzędziowy Enterprise GRC dla instytucji finansowych podlegających reżimowi DORA i KNF ICT.
