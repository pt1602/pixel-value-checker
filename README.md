# Pixel Checker

## Description
This Bash script scans `.scss` and `.css` files within a given directory for occurrences of pixel (`px`) values. It helps enforce the use of relative units (e.g., `em`, `rem`, `vw`, `vh`, or `%`) instead of fixed pixel values to improve responsiveness. The script allows developers to ignore specific lines using a special comment.

## Features
- Recursively searches `.scss` and `.css` files in a directory.
- Lists lines containing pixel values.
- Skips lines marked with `// ignore-px-checker`.
- Exits with a non-zero status if pixel values are found.

## Installation
No installation required. Ensure you have `bash` and `grep` installed on your system.

## Usage
Run the script with the target directory as an argument:

```sh
./pixel_checker.sh /path/to/your/css/files
```

### Example Output
```
Found pixel values in styles/main.scss:
  line 15: font-size:14px;
  line 42: margin:10px;
```

## Ignoring Specific Lines
To ignore a specific line from the check, add the comment `// ignore-px-checker` above it:

```css
/* ignore-px-checker */
font-size: 14px;
```

## Exit Codes
- `0` - No pixel values found.
- `1` - Pixel values found.

## License
This project is open-source and available under the MIT License.

