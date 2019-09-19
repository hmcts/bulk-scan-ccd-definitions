# Bulk Scan CCD Definitions


### 1. Modify the JSON data

Move into the directory of case type the one you need.

    |- definitions
        |-bulkscan
        |-cmc
        |-divorce
        |-finrem
        |-probate
        |-sscs

    
Everything in this README file now assumes that you are in your chosen case type directory.
        
The JSON files are in the directory data/sheets. There is a JSON file for each CCD definition spreadsheet tab.


### Generate the spreadsheet from the current JSON

```
../../bin/json2xlsx.sh {ENV}

ENV= can be aat, demo or prod


```

This will create a file called {ENV}-{CASE TYPE}-created-ccd.xlsx in the /data directory.
It requires environment info as an argument. It will replace placeholder URLs with  environment specific URLs.


### Make changes to the spreadsheet

Make changes to the definition as you would normally.

### Convert the spreadsheet back to JSON

```
../../bin/xlsx2json.sh

Creates json files under /data/sheets
The source excel file which is going to be parsed to JSON should be under case type folder (same level with ./data folder) and it can be named anything ending *.xlsx but there should be only 1 xlsx file.

```


### Testing and uploading Exception Record CCD definitions 

1. Test the converted spreadsheet in local docker (bulk-scan-shared-infrastructure).
2. If the change cannot be tested in local docker, use the demo environment. Make sure to inform the bulkscan developers.
3. Attach the CCD screenshot to the JIRA ticket before creating the PR.  
4. Merge the ccd-definitions PR to demo branch.
5. Upload the service Exception Record CCD definition in confluence (service-demo folder).
6. If there are code changes involved, deploy the code changes in demo environment and request QA to test the changes.
7. Raise a PR for ccd-definitions changes to merge in the master branch.
8. Update bulkscan CCD definition in bulk-scan-shared-infrastructure repository.
9. Upload the CCD definition in AAT and PROD (raise a JIRA ticket for CCD team to upload the CCD defintiion in PROD).
10. Upload the CCD definition spreadsheets in confluence (service-AAT and service-PROD folders).
11. Raise PR/s for code changes to merge the changes in the master branch.          

