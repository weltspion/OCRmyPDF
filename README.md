# OCRmyPDF (for Unraid)

OCRmyPDF adds a searchable OCR text layer to scanned PDFs. This template includes a watch-folder service that automatically processes PDFs.

## Features

- Automatic OCR processing of PDFs
- Watch-folder service (continuously monitors directory)
- Configurable OCR languages (default: German + English)
- Configurable update interval
- Lossless PDF optimization

## Installation

1. Install the template via Community Applications
2. Configure the paths:
   - **Input:** Directory for incoming PDFs
   - **Output:** Directory for processed PDFs
   - **Config:** Configuration directory (default: `/mnt/user/appdata/OCRmyPDF`)
3. Optional: Adjust the variables:
   - **Update Interval (in Seconds):** Check interval in seconds (default: `10`)
   - **Language:** OCR language(s) (default: `deu+eng`)
4. Start the container

## Script Installation

The watch script must be created in the Config directory:

```bash
mkdir -p /mnt/user/appdata/OCRmyPDF

# Copy script from repository
curl -o /mnt/user/appdata/OCRmyPDF/watch.sh https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/watch.sh

# Or create manually (see watch.sh in repository)

chmod +x /mnt/user/appdata/OCRmyPDF/watch.sh
```

The `watch.sh` script is included in the repository and can be used directly.

## Usage

1. Place PDFs in the **Input** directory
2. The container processes them automatically (according to update interval)
3. Processed PDFs appear in the **Output** directory
4. Original PDFs are deleted after successful processing

## OCR Languages

Common language combinations:
- `deu+eng` - German + English
- `eng` - English only
- `deu` - German only
- `fra+eng` - French + English

More languages: https://ocrmypdf.readthedocs.io/en/latest/languages.html

## Logs

```bash
docker logs OCRmyPDF
```

## Support

- OCRmyPDF Documentation: https://ocrmypdf.readthedocs.io/
- GitHub: https://github.com/jbarlow83/OCRmyPDF
