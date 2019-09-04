# BULK SCAN CCD Definitions


### 1. Modify the JSON data

Move into the directory of case type the one you need.

    bulk-scan-ccd-definitions
    |- definitions
        |-sscs

    
Everything in this README file now assumes that you are in your chosen case type directory.
        
The JSON files are in the directory data/sheets. There is a JSON file for each CCD definition spreadsheet tab.


### Generate the spreadsheet from the current JSON

```
../../bin/json2xlsx.sh {ENV}

ENV= can be aat, demo or prod


```

This will create a file called {ENV}-{CASE TYPE}-created-ccd.xlsx in the /data directory.
it requires Environment info as an argument.it will replace placehiolder URLs with  enviironment specific URLs.


### Make changes to the spreadsheet

Make changes to the definition as you would normally.

### Convert the spreadsheet back to JSON

```
../../bin/xlsx2json.sh

creates json files under /data/sheets
The source excel file which is going to be parsed to JSON should be under case Type folder(same level with ./data folder) and it can be named anything ending *.xlsx but there should be only 1 xlsx file.

```

