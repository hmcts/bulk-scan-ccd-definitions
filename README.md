# bulk scan ccd definitions

## Process for developing locally using XLSX files

### 1. Modify the JSON data

There are many bulk scan CCD definition case types. Move into the directory of the one you need.

    bulk-scan-ccd-definitions
    |- definitions
        |- aat
            |-cmc
            |-divorce
            |-finrem
            |-probate
            |-sscs

        |- demo
            |-cmc
            |-divorce
            |-finrem
            |-probate
            |-sscs


Everything in this README file now assumes that you are in your chosen directory.
        
The JSON files are in the directory data/sheets. There is a JSON file for each CCD definition spreadsheet tab.


### Generate the spreadsheet from the current JSON

```
../../../bin/json2xlsx.sh
```

This will create a file called created-ccd.xlsx in the ./data directory.

### Make changes to the spreadsheet

Make changes to the definition as you would normally.

### Convert the spreadsheet back to JSON

```
../../../bin/xlsx2json.sh aat

it requires Environment info as an argument. it will replace placehiolder URLs with  enviironment specific URLs.
reates json would be in /data/sheets

The source excel file which is going to be parsed to JSON should be under case Type folder(same level with data folder) and it can be named anything ending *.xlsx but there should be only 1 xlsx file.

```

