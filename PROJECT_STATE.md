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
   * Dynamiczny system zakładek i filtrów kategorii (Podręczniki, Architektura, Bezpieczeństwo, Lists, Automatyzacja).
   * Globalny Live Search w czasie rzeczywistym z obsługą słów kluczowych i pustego stanu wyników.
   * Karty modułów dostępnych (4) oraz kart modułów planowanych w roadmapie (5) z interaktywnym modalem specyfikacji zakresu.
   * Matryca Zgodności Regulacyjnej GRC (KNF Rekomendacja D G7/G9, DORA Art. 9/11, Prawo Bankowe Art. 104, ISO 27001).
   * Czysty nagłówek z bezpośrednim kontaktem e-mail i repozytorium GitHub oraz pełna stopka firmowa.

2. **Dedykowany Skill Agenta: `.agents/skills/sharepoint-content-creator/SKILL.md`**:
   * Kompletna specyfikacja tworzenia i rozbudowy bazy wiedzy.
   * Wymogi technologiczne: 100% offline-first, brak zewnętrznych CDN, czysty semantyczny HTML5/CSS/JS.
   * Design System, paleta tokenów CSS, wzorce komponentów (nagłówek ze switcherem, pasek boczny ze scroll-spy, karty, alerty bankowe).
   * Wytyczne zgodności bankowej (KNF, DORA, Tajemnica Bankowa) oraz stałe dane firmy w stopkach.
   * Standaryzowana procedura rejestracji nowych modułów w portalu `index.html`.

3. **`sharepoint_columns_content_types.html` (Galerie Projektanta stron sieci Web)**:
   * Wyczerpujący podręcznik architektury informacji: *Kolumny witryny* (Site Columns) oraz *Typy zawartości* (Site Content Types).
   * Hierarchia dziedziczenia oparta o nadrzędny `Bankowy Dokument Bazowy`.
   * Trzy gotowe scenariusze bankowe (Kredyty CIF, Compliance & AML, Procedury KNF/DORA).
   * Dwukierunkowa nawigacja: powrót do `index.html` i przełącznik do podręcznika codziennego.

4. **`sharepoint_helper.html` (Podręcznik Codziennej Pracy)**:
   * Asystent codziennej pracy z SharePoint M365 (9 modułów: biblioteki, współedycja, udostępnianie, widoki, OneDrive, kosz, skróty).
   * Wyszukiwarka Live Search, interaktywny akordeon problemów, dwukierunkowa nawigacja do `index.html` i Galerii Projektanta.

5. **`sharepoint_quickstart.html` (Jednostronicowy Cheat Sheet A4)**:
   * Sformatowany do dokładnych wymiarów 1 strony A4, zoptymalizowany pod bezpośredni wydruk / PDF (`Ctrl + P`), pasek narzędzi z linkiem powrotnym do `index.html`.

6. **`sharepoint_quickstart.md`**:
   * Podręczna wersja Markdown do wklejenia w Microsoft Teams, OneNote lub intranet.

7. **`README.md` & `.gitignore`**:
   * Kompletna dokumentacja projektu i czysta konfiguracja gita.

---

## 🎯 Główne Ustalenia Architektoniczne
- **Brak zależności zewnętrznych:** Wszystkie narzędzia HTML działają w 100% offline/lokalnie po dwukrotnym kliknięciu w dowolnej przeglądarce.
- **Specyfika bankowa:** Wszystkie przykłady i schematy uwzględniają specyfikę polskiego i unijnego sektora bankowego (art. 104 Prawa Bankowego, Rekomendacja D KNF, DORA).
- **Zintegrowana siatka nawigacyjna:** Wszystkie podstrony posiadają wzajemne łącza prowadzące do portalu głównego `index.html` oraz sąsiednich podręczników.

---

## 🚀 Kolejny Krok Implementacyjny (Zgodnie z Decyzją Użytkownika)
1. **Priorytet 1: `sharepoint_lists_json.html` (Microsoft Lists & Rejestry Bankowe JSON)**:
   - Zastąpienie Excela audytowalnymi rejestrami MS Lists (Rejestr Ryzyka ICT, Incydenty DORA).
   - Gotowe kody JSON dla kolumn (Pill badges, wskaźniki SLA, kalkulacja ryzyka - Heatmap).
   - Formatowanie widoków i wielokolumnowych formularzy w JSON.
2. **Kolejne moduły w roadmapie:**
   - Bezpieczeństwo, Uprawnienia & Zero Trust (`sharepoint_security_permissions.html`).
   - Obiegi akceptacji i alerty Power Automate (`sharepoint_power_automate.html`).
   - Szablony Word .dotx powiązane z metadanymi Quick Parts (`sharepoint_word_templates.html`).
   - Automatyzacja provisioningu PnP.PowerShell (`sharepoint_pnp_powershell.html` & `.ps1`).
