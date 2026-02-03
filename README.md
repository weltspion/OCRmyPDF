# OCRmyPDF für Unraid

OCRmyPDF fügt gescannten PDFs eine durchsuchbare OCR-Textschicht hinzu. Dieses Template enthält einen Watch-Folder-Service, der PDFs automatisch verarbeitet.

## Features

- Automatische OCR-Verarbeitung von PDFs
- Watch-Folder-Service (überwacht Verzeichnis kontinuierlich)
- Konfigurierbare OCR-Sprachen (Standard: Deutsch + Englisch)
- Konfigurierbares Update-Intervall
- Verlustfreie Optimierung der PDFs

## Installation

1. Installieren Sie das Template über Community Applications
2. Konfigurieren Sie die Pfade:
   - **Watch:** Verzeichnis für eingehende PDFs
   - **Output:** Verzeichnis für verarbeitete PDFs
   - **Config:** Konfigurationsverzeichnis (Standard: `/mnt/user/appdata/OCRmyPDF`)
3. Optional: Passen Sie die Variablen an:
   - **Watch Directory:** Container-Pfad für Watch-Verzeichnis (Standard: `/watch`)
   - **Output Directory:** Container-Pfad für Output-Verzeichnis (Standard: `/output`)
   - **Language:** OCR-Sprache(n) (Standard: `deu+eng`)
   - **Update Interval:** Prüfintervall in Sekunden (Standard: `10`)
4. Starten Sie den Container

## Script-Installation

Das Watch-Script muss im Config-Verzeichnis erstellt werden:

```bash
mkdir -p /mnt/user/appdata/OCRmyPDF

# Script vom Repository kopieren
curl -o /mnt/user/appdata/OCRmyPDF/watch.sh https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/watch.sh

# Oder manuell erstellen (siehe watch.sh im Repository)

chmod +x /mnt/user/appdata/OCRmyPDF/watch.sh
```

Das Script `watch.sh` ist im Repository enthalten und kann direkt verwendet werden.

## Verwendung

1. Legen Sie PDFs in das **Watch-Verzeichnis**
2. Der Container verarbeitet sie automatisch (je nach Update-Intervall)
3. Verarbeitete PDFs erscheinen im **Output-Verzeichnis**
4. Original-PDFs werden nach erfolgreicher Verarbeitung gelöscht

## OCR-Sprachen

Häufige Sprachkombinationen:
- `deu+eng` - Deutsch + Englisch
- `eng` - Nur Englisch
- `deu` - Nur Deutsch
- `fra+eng` - Französisch + Englisch

Weitere Sprachen: https://ocrmypdf.readthedocs.io/en/latest/languages.html

## Logs

```bash
docker logs OCRmyPDF
```

## Support

- OCRmyPDF Dokumentation: https://ocrmypdf.readthedocs.io/
- GitHub: https://github.com/jbarlow83/OCRmyPDF
