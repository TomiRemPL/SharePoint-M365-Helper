---
name: sharepoint-content-creator
description: >-
  Standard i generator treści dla portalu SharePoint-M365-Helper. Używaj przy tworzeniu
  i modyfikowaniu podstron wiedzy HTML, szablonów dokumentacji, skryptów PnP oraz
  rejestracji nowych modułów w portalu głównym (index.html), z zachowaniem zasad
  offline-first, estetyki Enterprise oraz wymogów bankowych GRC (KNF, DORA).
---

# SharePoint & M365 Content Creator Skill

Ten skill określa ścisłe reguły architektoniczne, wizualne, merytoryczne i rejestracyjne przy tworzeniu dowolnych materiałów dla repozytorium **SharePoint-M365-Helper**.

---

## 🏢 1. Obowiązkowe Dane Podmiotu (Stopki & Metadane)

Każda tworzona strona HTML, dokument Markdown czy szablon dokumentacji **MUSA** zawierać w stopkach i nagłówkach metadane:

- **Nazwa Firmy:** `REMBIASZ GRC Tech Solutions Tomasz Rembiasz`
- **NIP:** `887-155-01-62`
- **E-mail:** `trembiasz@gmail.com`
- **Profil działalności:** Tworzenie aplikacji GRC dla Sektora Bankowego (Governance, Risk & Compliance),Oracle APEX, Python, systemy wsparcia procesów.

---

## 🏛️ 2. Kontekst Regulacyjny i Sektor Bankowy

Wszystkie przykłady, procedury i architektury **muszą odnosić się do realiów polskiego i unijnego sektora bankowego**:

1. **Art. 104 Prawa Bankowego (Tajemnica Bankowa):**
   - Ścisła kontrola uprawnień, zakaz linków anonimowych dla poufnych zasobów, konieczność audytowania każdego dostępu.
2. **DORA (Digital Operational Resilience Act):**
   - Rejestry ryzyk dostawców ICT, wersjonowanie regulacji wewnętrznych, testowanie odporności.
3. **Standardowe departamenty i role:**
   - Departament Ryzyka i Kredytów, Departament Compliance & AML, Bezpieczeństwo Informacji (CISO/SOC), Audyt Wewnętrzny.

---

## 💻 3. Architektura Technologiczna (Offline-First)

1. **Zero frameworków kompilowanych dla podstron wiedzy:**
   - Czysty semantyczny HTML5, Vanilla CSS i Vanilla JavaScript.
   - Strony muszą działać natychmiast po dwukrotnym kliknięciu w plik `.html` w systemie Windows bez potrzeby uruchamiania serwera `npm` czy lokalnego HTTP.
2. **Niezależność od zewnętrznych CDN:**
   - Nie używaj zewnętrznych bibliotek JS (jak jQuery, React z CDN).
   - Czcionki: deklaruj `Plus Jakarta Sans`, `JetBrains Mono` z fallbackami systemowymi: `system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`.
   - Ikony: Używaj czystego SVG osadzonego bezpośrednio w kodzie (inline SVG) lub symboli UTF-8.
3. **Wydruk:**
   - Każda podstrona musi mieć reguły `@media print` usuwające paski nawigacyjne i zbędne tła, zapewniając czytelny eksport do formatu PDF / A4.

---

## 🎨 4. Design System & Tokeny CSS

Wszystkie nowe pliki `.html` muszą współdzielić spójny zestaw zmiennych CSS:

```css
:root {
  /* Kolorystyka Microsoft 365 & SharePoint */
  --sp-teal: #038387;
  --sp-teal-dark: #025356;
  --sp-teal-light: #f0fdfa;
  --sp-purple: #7c3aed;
  --sp-purple-dark: #5b21b6;
  --sp-purple-light: #f5f3ff;
  --sp-blue: #0078d4;
  --sp-blue-dark: #106ebe;
  --sp-blue-light: #eff6ff;

  /* Powierzchnie i tła */
  --bg-page: #f8fafc;
  --surface: #ffffff;
  --surface-subtle: #f1f5f9;
  --border: #e2e8f0;
  --border-focus: #0078d4;

  /* Typografia */
  --text-main: #0f172a;
  --text-muted: #64748b;
  --text-soft: #475569;

  /* Statusy i akcenty GRC */
  --emerald: #059669;
  --emerald-bg: #ecfdf5;
  --amber: #d97706;
  --amber-bg: #fffbeb;
  --rose: #e11d48;
  --rose-bg: #fff1f2;
  --indigo: #4f46e5;
  --indigo-bg: #eef2ff;

  /* Promienie i cienie */
  --radius-sm: 6px;
  --radius-md: 10px;
  --radius-lg: 14px;
  --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 14px rgba(0, 0, 0, 0.06);
  --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.08);
}
```

---

## 🧩 5. Wymagane Komponenty w Każdej Podstronie

1. **Główny Nagłówek (Sticky App Header):**
   - Logo / Ikona modułu.
   - Tytuł i podtytuł modułu.
   - Przycisk nawigacyjny powrotu do portalu głównego:
     `<a href="index.html" class="btn-portal-home">← Portal Główny</a>`
   - Przycisk przejścia do powiązanych podręczników (`sharepoint_helper.html` / `sharepoint_columns_content_types.html`).
2. **Pasek boczny (Sidebar Navigation):**
   - Wyszukiwarka sekcji w locie (`Live Search`).
   - Lista linków z automatycznym podświetlaniem aktywnej sekcji (`scroll-spy`).
3. **Struktura Treści:**
   - Karty informacyjne (`.card` z delikatnym cieniem i borderem).
   - Bloki ostrzeżeń bankowych (`.alert-box.alert-bank`, `.alert-box.alert-knf`).
   - Tabele specyfikacji technicznych (np. nazwy systemowe, typy danych, limity).
   - Akordeony pytań i odpowiedzi (FAQ) lub procedur awaryjnych.
4. **Stopka Firmowa:**
   - Wklej standardową stopkę `main-footer` zawierającą dane `REMBIASZ GRC Tech Solutions Tomasz Rembiasz`.

---

## 📋 6. Procedura Rejestracji Nowego Modułu w Portalu `index.html`

Po utworzeniu nowej podstrony (np. `sharepoint_lists_json.html`):

1. **Otwórz `index.html`**.
2. **Zaktualizuj licznik modułów w sekcji Hero** (np. `Zwiększ liczbę dostępnych modułów`).
3. **Zaktualizuj kartę w sekcji `<div class="modules-grid">`**:
   - Zmień status badge z `Planowane` na `Dostępny` (klasa `status-badge available`).
   - Zmień przycisk z podglądu na aktywny odnośnik `<a href="nowa_strona.html" class="btn-open-module">Otwórz moduł →</a>`.
4. **Zaktualizuj plik `PROJECT_STATE.md`**:
   - Dodaj nowo ukończony komponent do sekcji `Zrealizowane Komponenty`.
   - Zaktualizuj sekcję backlogu.
