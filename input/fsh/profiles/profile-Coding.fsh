Alias: $isPrimary = http://hl7.org.nz/fhir/StructureDefinition/nzf-is-primary-coding

Profile:        NzfCoding
Parent:         Coding
Id:             NzfCoding
Title:          "Coding resource for NZ Formulary"
Description:    "Coding resource for NZ Formulary"

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
* ^url = "http://hl7.org.nz/fhir/StructureDefinition/NzfCoding"
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Coding</div>"

* extension contains 
    $isPrimary named isPrimary 0..1

* extension[isPrimary] ^short = "Is primary code within given context, e.g. primary pharmacode when multiple given"