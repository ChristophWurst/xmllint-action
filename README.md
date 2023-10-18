# XML Lint Action

This action validates an XML files with a given XML schema using `xmllint`.

## Inputs

### `xml-file`

**Required** The name of the source (`.xml`) file.

### `xml-schema-file`

**Required** The name of the schema (`.xsd`) file.

### `xml-schema-type`

**Optional** The type of schema to use (schema, relaxng, schematron). Default is schema.

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
      uses: actions/checkout@v4
    - name: Download schema
      run: wget https://apps.nextcloud.com/schema/apps/info.xsd
    - name: Validate info.xml using XML schema info.xsd
      uses: ChristophWurst/xmllint-action@v1
      with:
        xml-file: ./appinfo/info.xml
        xml-schema-file: ./info.xsd
```

### Using alternate schema formats

To use an alternate schema format supported by `xmllint` (i.e. relaxng or schematron), you should specify the format of your schema using the optional `xml-schema-type` parameter.

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
      uses: actions/checkout@v4
    - name: Download schema
      run: wget https://apps.nextcloud.com/schema/apps/info.xsd
    - name: Enable annotations for validation errors and warnings
      uses: korelstar/xmllint-problem-matcher@v1
    - name: Validate info.xml using XML schema info.xsd
      uses: ChristophWurst/xmllint-action@v1
      with:
        xml-file: ./appinfo/info.xml
        xml-schema-file: ./info.xsd
```

## Referenes

- `xmllint` comes from [libxml](http://www.xmlsoft.org/)
- [GitHub: korelstar/xmllint-problem-matcher](https://github.com/korelstar/xmllint-problem-matcher)
