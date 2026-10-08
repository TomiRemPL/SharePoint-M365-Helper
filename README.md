# SharePoint M365 Helper & Architecture Toolkit

Kompleksowy zestaw interaktywnych podręczników, przewodników dobrych praktyk oraz narzędzi architektury informacji dla środowiska **Microsoft SharePoint M365**, ze szczególnym uwzględnieniem wymogów sektora bankowego i regulowanego.

---

## 📦 Zawartość Repozytorium

| Plik | Format | Opis |
| :--- | :--- | :--- |
| **[`sharepoint_helper.html`](./sharepoint_helper.html)** | Interaktywny HTML | **Podręcznik Codziennej Pracy z SharePoint M365**:<br>• 9 modułów tematycznych (biblioteki, współedycja, udostępnianie, widoki, OneDrive, kosz, skróty)<br>• Wyszukiwarka Live Search działająca w czasie rzeczywistym<br>• Interaktywny akordeon FAQ i rozwiązywanie codziennych problemów |
| **[`sharepoint_columns_content_types.html`](./sharepoint_columns_content_types.html)** | Interaktywny HTML | **Galerie Projektanta (Architektura Informacji)**:<br>• Kolumny witryny (Site Columns) i Typy zawartości (Site Content Types)<br>• Drzewo dziedziczenia typów zawartości (`Bankowy Dokument Bazowy`)<br>• 3 praktyczne scenariusze bankowe (Ryzyko & Kredyty, Compliance & AML, Procedury KNF/DORA)<br>• Content Type Hub, integracja z Word Quick Parts, checklista wdrożeniowa |
| **[`sharepoint_quickstart.html`](./sharepoint_quickstart.html)** | Druk A4 / PDF | **Jednostronicowy Cheat Sheet Szybkiego Startu**:<br>• Sformatowany do dokładnego wymiaru 1 strony A4 bez ucięć<br>• Gotowy do bezpośredniego druku lub zapisu do PDF (`Ctrl + P`) |
| **[`sharepoint_quickstart.md`](./sharepoint_quickstart.md)** | Markdown | Wersja tekstowa podręcznego cheat sheetu do wklejenia w Microsoft Teams, OneNote lub intranet |

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
* **Specjalizacja:** Doradztwo GRC (Governance, Risk & Compliance), Architektura SharePoint & Microsoft 365, Bezpieczeństwo Informacji, Sektor Bankowy (KNF Rekomendacja D, DORA, Tajemnica Bankowa).
