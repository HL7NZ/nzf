Profile:        NzfCoding
Parent:         coding
Id:             NzfCoding
Title:          "Coding resource for NZ Formulary"
Description:    "Coding resource for NZ Formulary"

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-coding"

* extension contains 
    isPrimary 0..1

* extension[isPrimary] ^short = "Is primary code within given context, e.g. primary pharmacode when multiple given"