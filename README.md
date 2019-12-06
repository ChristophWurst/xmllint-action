# XML Lint Action

This action validates an xml files with a given xml schema using xmllint.

## Inputs

### `xml-file`

**Required** The name of the source (.xml) file.

### `xml-schema-file`

**Required** The name of the schema (.xsd) file.

## Example usage

```yml
name: Lint

on: [push]

jobs:
  xml-linters:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: Download schema
      run: wget https://apps.nextcloud.com/schema/apps/info.xsd
    - name: Lint info.xml
      uses: ChristophWurst/xmllint-action@v1
      with:
        xml-file: ./appinfo/info.xml
        xml-schema-file: ./info.xsd
```
