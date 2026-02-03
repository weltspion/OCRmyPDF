#!/bin/bash
WATCH_DIR="${WATCH_DIR:-/watch}"
OUTPUT_DIR="${OUTPUT_DIR:-/output}"
LANGUAGE="${LANGUAGE:-deu+eng}"
UPDATE_INTERVAL="${UPDATE_INTERVAL:-10}"

# Ausgabe sicherstellen
echo "OCRmyPDF Watch-Folder Service started"
echo "Watch Directory: $WATCH_DIR"
echo "Output Directory: $OUTPUT_DIR"
echo "Language: $LANGUAGE"
echo "Intervall: $UPDATE_INTERVAL"
echo ""

while true; do
    for file in "$WATCH_DIR"/*.pdf "$WATCH_DIR"/*.PDF; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            output_file="$OUTPUT_DIR/$filename"
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] Processing: $filename"
            
            if ocrmypdf --language "$LANGUAGE" --deskew --clean --force-ocr --optimize 3 --output-type pdf "$file" "$output_file" 2>&1; then
                echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✓ Successfully processed: $filename"
                rm -f "$file"
            else
                echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✗ Failed to process: $filename"
            fi
        fi
    done
    sleep "$UPDATE_INTERVAL"
done
