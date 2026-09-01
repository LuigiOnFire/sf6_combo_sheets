#!/bin/bash

BASE_URL="https://www.streetfighter.com/6/assets/images/character"
OUTPUT_DIR="images"

# https://www.streetfighter.com/6/assets/images/character/select_character1_over.png

mkdir -p "$OUTPUT_DIR"

for i in $(seq 1 31); do
    for suffix in "" "_over"; do
        filename="select_character${i}${suffix}.png"
        url="${BASE_URL}/${filename}"
        output="${OUTPUT_DIR}/${filename}"


        echo "Downloading ${url}..."

        if curl -fL \
            -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/151.0 Safari/537.36" \
            -e "$REFERER" \
            "$url" \
            -o "$output"; then
            echo "  ✓ ${filename}"
        else
            echo "  ✗ Failed: ${filename}"
            rm -f "$output"
        fi
    done
done

echo
echo "Done. Files saved to ${OUTPUT_DIR}/"
