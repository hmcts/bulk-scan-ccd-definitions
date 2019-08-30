# SSCS CCD Definitions

## Process for developing locally using XLSX files

### 1. Modify the JSON data

There are two SSCS CCD definition case types. Move into the directory of the one you need.

    sscs-ccd-definitions
    |- definitions
        |- aat
            |-bulkscan
            |- exception 

    
Everything in this README file now assumes that you are in your chosen directory.
        
The JSON files are in the directory data/sheets. There is a JSON file for each CCD definition spreadsheet tab.



### Generate the spreadsheet from the current JSON

```
./../../bin/json2xlsx.sh
```

This will create a file called /data/created-ccd.xlsx in the /data directory.

### Make changes to the spreadsheet

Make changes to the definition as you would normally.

### Convert the spreadsheet back to JSON

```
./../../bin/xlsx2json.sh aat

it requires Environment info as an argument. it will replace placehiolder URLs with  enviironment specific URLs.
reates json would be in /data/sheets

```

