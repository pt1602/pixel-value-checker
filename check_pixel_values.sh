#!/bin/bash

found_error=false

check_file() {
    pixel_lines=()
    ignore_next=false
    while IFS= read -r line; do
        if [[ $ignore_next == true ]]; then
            ignore_next=false
            continue
        fi
        if [[ $line =~ \/\/*[[:space:]]*ignore-px-checker ]]; then
            ignore_next=true
            continue
        fi
        if [[ $line =~ :[[:space:]]*[^[:space:]]+[[:space:]]*px ]]; then
            formatted_line=$(echo "$line" | sed 's/\(:\)[[:space:]]\+\([^[:space:]]\)/\1\2/')
            pixel_lines+=("$formatted_line")
        fi
    done < <(grep -rn 'px' "$1")

    if [ "${#pixel_lines[@]}" -ne 0 ]; then
        found_error=true
        echo "Found pixel values in $1:"
        printf '%s\n' "${pixel_lines[@]}"
        echo
    fi
}

search_files() {
    while IFS= read -r -d '' file; do
        check_file "$file"
    done < <(find "$1" -type f \( -name "*.scss" -o -name "*.css" \) -print0)
}

search_files "$1"

if [ "$found_error" = true ]; then
    exit 1
fi
