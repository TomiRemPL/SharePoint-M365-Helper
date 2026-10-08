# Stan Projektu: SharePoint M365 Helper

> **Data zapisu:** 2026-10-08  
> **Status:** Wersja bazowa 1.0 opublikowana na GitHub  
> **Repozytorium GitHub:** [https://github.com/TomiRemPL/SharePoint-M365-Helper](https://github.com/TomiRemPL/SharePoint-M365-Helper)

---

## 🏢 Dane Firmy Użytkownika (Trwale Zapamiętane)
* **Nazwa Firmy:** `REMBIASZ GRC Tech Solutions Tomasz Rembiasz`
* **NIP:** `887-155-01-62`
* **E-mail:** `trembiasz@gmail.com`
* **Profil działalności:** Doradztwo GRC (Governance, Risk & Compliance), Architektura SharePoint & Microsoft 365, Bezpieczeństwo Informacji, Sektor Bankowy (KNF Rekomendacja D, DORA, Tajemnica Bankowa).

---

## 📦 Zrealizowane Komponenty

1. **`sharepoint_columns_content_types.html` (Galerie Projektanta stron sieci Web)**:
   * Wyczerpujący podręcznik architektury informacji: *Kolumny witryny* (Site Columns) oraz *Typy zawartości* (Site Content Types).
   * Hierarchia dziedziczenia oparta o nadrzędny `Bankowy Dokument Bazowy`.
   * Trzy gotowe scenariusze bankowe:
     - *Departament Ryzyka i Kredytów:* Dokumentacja Kredytowa Corporate (CIF, ekspozycja, scoring, komitet).
     - *Departament Zgodności (Compliance) & AML:* Karta Zgodności & AML (Tajemnica Bankowa, KNF, DORA, MIFID).
     - *Departament Operacji i Bezpieczeństwa:* Procedury i Instrukcje Bankowe (KNF Rekomendacja D, retencja).
   * Zagadnienia zaawansowane: Content Type Hub, Microsoft Word Quick Parts, retention labels, checklista wdrożeniowa 6 kroków, akordeon FAQ.
   * Interaktywny Live Search, boczny pasek ze scroll-spy, stopka firmowa.

2. **`sharepoint_helper.html` (Podręcznik Codziennej Pracy)**:
   * Asystent codziennej pracy z SharePoint M365 (9 modułów: biblioteki, współedycja, udostępnianie, widoki, OneDrive, kosz, skróty).
   * Wyszukiwarka Live Search, interaktywny akordeon problemów, przycisk nawigacji do Galerii Projektanta, stopka firmowa.

3. **`sharepoint_quickstart.html` (Jednostronicowy Cheat Sheet A4)**:
   * Sformatowany do dokładnych wymiarów 1 strony A4, zoptymalizowany pod bezpośredni wydruk / PDF (`Ctrl + P`), zero overflow.

4. **`sharepoint_quickstart.md`**:
   * Podręczna wersja Markdown do wklejenia w Microsoft Teams, OneNote lub intranet.

5. **`README.md` & `.gitignore`**:
   * Kompletna dokumentacja projektu i czysta konfiguracja gita.

---

## 🎯 Główne Ustalenia Architektoniczne
- **Brak zależności zewnętrznych:** Wszystkie narzędzia HTML działają w 100% offline/lokalnie po dwukrotnym kliknięciu w dowolnej przeglądarce.
- **Specyfika bankowa:** Wszystkie przykłady i schematy uwzględniają specyfikę polskiego i unijnego sektora bankowego (art. 104 Prawa Bankowego, Rekomendacja D KNF, DORA).
- **Dwukierunkowa nawigacja:** Podręczniki posiadają wzajemne łącza w nagłówkach umożliwiające szybkie przełączanie.

---

## 🚀 Propozycje i Kierunki na Kolejne Sesje (Backlog)
1. **Automatyzacja PowerShell (PnP.PowerShell):**
   - Przygotowanie skryptu `.ps1`, który zdefiniuje kolumny witryny i typy zawartości bezpośrednio na wskazanym tenancie SharePoint Banku.
2. **Szablony Microsoft Word (`.dotx`):**
   - Utworzenie fizycznych wzorców dokumentów z osadzonymi polami *Quick Parts* (Szybkie części) zmapowanymi na kolumny SharePoint.
3. **Przepływy Power Automate:**
   - Opracowanie schematów obiegów (np. powiadomienia o zbliżającym się audycie procedury ISO/KNF, alerty o ekspozycji kredytowej).
4. **Rozszerzenie o Microsoft Lists:**
   - Scenariusz zastąpienia arkuszy Excela rejestrami w MS Lists z formatowaniem warunkowym JSON (Pill badges).
