# SharePoint M365 Helper & Architecture Toolkit

Kompleksowy zestaw interaktywnych podręczników, przewodników dobrych praktyk oraz narzędzi architektury informacji dla środowiska **Microsoft SharePoint M365**, ze szczególnym uwzględnieniem wymogów sektora bankowego i regulowanego.

---

## 📦 Zawartość Repozytorium

| Plik / Zasób | Format | Opis |
| :--- | :--- | :--- |
| **[`index.html`](./index.html)** | Portal Hub HTML | **Główny Portal Wiedzy i Nawigacji SharePoint M365**:<br>• Centralny dashboard integrujący wszystkie moduły repozytorium<br>• Dynamiczny filtr kategorii, globalna wyszukiwarka Live Search<br>• Matryca Zgodności Regulacyjnej GRC (KNF Rek. D, DORA, Prawo Bankowe)<br>• Podgląd zakresu modułów planowanych w roadmapie |
| **[`sharepoint_helper.html`](./sharepoint_helper.html)** | Interaktywny HTML | **Podręcznik Codziennej Pracy z SharePoint M365**:<br>• 9 modułów tematycznych (biblioteki, współedycja, udostępnianie, widoki, OneDrive, kosz, skróty)<br>• Wyszukiwarka Live Search działająca w czasie rzeczywistym<br>• Interaktywny akordeon FAQ i rozwiązywanie codziennych problemów |
| **[`sharepoint_columns_content_types.html`](./sharepoint_columns_content_types.html)** | Interaktywny HTML | **Galerie Projektanta (Architektura Informacji)**:<br>• Kolumny witryny (Site Columns) i Typy zawartości (Site Content Types)<br>• Drzewo dziedziczenia typów zawartości (`Bankowy Dokument Bazowy`)<br>• 3 praktyczne scenariusze bankowe (Ryzyko & Kredyty, Compliance & AML, Procedury KNF/DORA)<br>• Content Type Hub, integracja z Word Quick Parts, checklista wdrożeniowa |
| **[`sharepoint_lists_json.html`](./sharepoint_lists_json.html)** | Interaktywny HTML | **Microsoft Lists & Rejestry Bankowe JSON**:<br>• Zastąpienie Excela audytowalnymi bazami (Rejestr Ryzyka ICT, Incydenty DORA)<br>• Szablony JSON kolumn: Pill Badges, Risk Heatmap, dynamiczne wskaźniki SLA (@now)<br>• Wielokolumnowe formularze (Header & Body JSON) i interaktywny symulator na żywo |
| **[`sharepoint_security_permissions.html`](./sharepoint_security_permissions.html)** | Interaktywny HTML | **Bezpieczeństwo, Uprawnienia & Zero Trust w Sektorze Bankowym**:<br>• Macierz ról i uprawnień, dedykowana rola *Audytor (Restricted View / Blokada Pobierania)*<br>• Higiena uprawnień, zapobieganie degradacji wydajności przez łamane dziedziczenie<br>• Zewnętrzne udostępnianie (B2B Guest Sharing) a tajemnica bankowa (art. 104 Pr. Bank.)<br>• Etykiety wrażliwości Purview, Conditional Access i interaktywny kalkulator ryzyka KNF |
| **[`sharepoint_quickstart.html`](./sharepoint_quickstart.html)** | Druk A4 / PDF | **Jednostronicowy Cheat Sheet Szybkiego Startu**:<br>• Sformatowany do dokładnego wymiaru 1 strony A4 bez ucięć<br>• Gotowy do bezpośredniego druku lub zapisu do PDF (`Ctrl + P`) |
| **[`sharepoint_quickstart.md`](./sharepoint_quickstart.md)** | Markdown | Wersja tekstowa podręcznego cheat sheetu do wklejenia w Microsoft Teams, OneNote lub intranet |
| **[Skill `sharepoint-content-creator`](./.agents/skills/sharepoint-content-creator/SKILL.md)** | Agent Skill | Dedykowany standard tworzenia treści, stylistyki UI, reguł bankowych GRC oraz procedury rejestracji modułów |

---

## 🏛️ Kluczowe Funkcje Architektoniczne (Sektor Bankowy)

1. **Struktura Dziedziczenia Typów Zawartości:**
   - Wykorzystanie typu nadrzędnego `Bankowy Dokument Bazowy` z polami: *Tajemnica Bankowa (art. 104 Pr. Bank.)*, *ID Klienta (CIF)*, *Departament*, *Właściciel*.
2. **Praktyczne Scenariusze Regulacyjne:**
   - **Kredyty i Ryzyko:** cyfrowa teczka kredytowa, kontrola ekspozycji finansowej i scoringu.
   - **Compliance & AML:** rejestr analiz zgodności, procedury przeciwdziałania praniu pieniędzy, audyt KNF.
   - **Operacje i Bezpieczeństwo:** centralny rejestr procedur bankowych zgodny z Rekomendacją D KNF oraz rozporządzeniem DORA.
3. **Standaryzacja Metadanych:**
   - Eliminacja zagnieżdżonych struktur folderów na rzecz metadanych i widoków.
   - Reużywalność kolumn witryny w całym tenancie dzięki **Content Type Hub**.

---

## 🚀 Jak Uruchomić?

Wszystkie pliki `.html` są w 100% samowystarczalne (ang. *standalone*). Nie wymagają instalacji serwera, bibliotek zewnętrznych ani środowiska Node.js:
1. Sklonuj repozytorium lub pobierz pliki.
2. Otwórz plik `sharepoint_helper.html` lub `sharepoint_columns_content_types.html` w dowolnej nowoczesnej przeglądarce (Edge, Chrome, Firefox).
3. Używaj wyszukiwarki Live Search oraz bocznego menu do szybkiej nawigacji po tematach.

---

## 🏢 Autor i Kontakt

**REMBIASZ GRC Tech Solutions Tomasz Rembiasz**  
* **NIP:** 887-155-01-62  
* **E-mail:** trembiasz@gmail.com  
* **Profil działalności:** Tworzenie aplikacji GRC dla Sektora Bankowego (Governance, Risk & Compliance), Oracle APEX, Python, systemy wsparcia procesów.
