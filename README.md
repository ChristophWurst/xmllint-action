# XML Lint Action

This action validates an XML files with a given XML schema using `xmllint`.

## Inputs

### `xml-file`

**Required** The name of the source (`.xml`) file.

### `xml-schema-file`

**Required** The name of the schema (`.xsd`) file.

## Basic Usage Example

This basic example validates specified XML file specified using: `xml-file` using the schema file specified using: `xml-schema-file`.

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

## Extended Usage Example Enabling Annotations

This example does the same as the above example, in addition it configures the use of [korelstar/xmllint-problem-matcher@v1](https://github.com/korelstar/xmllint-problem-matcher), which matches any problems found by `xmllint` and present these as annotations with both errors and warnings emitted from `xmllint`, which are a nice alternative to digging through the log files.


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
      uses: korelstar/xmllint-problem-matcher@v1
      uses: ChristophWurst/xmllint-action@v1
      with:
        xml-file: ./appinfo/info.xml
        xml-schema-file: ./info.xsd
```

## Referenes

- `xmllint` comes from [libxml](http://www.xmlsoft.org/)
- [GitHub: korelstar/xmllint-problem-matcher](https://github.com/korelstar/xmllint-problem-matcher)
