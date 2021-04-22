Extension: Atc
Id: atc
Description: "ATC Code - see https://www.who.int/tools/atc-ddd-toolkit/atc-classification"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/atc"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context.type = #element
* ^context.expression = "Medication"       

* extension contains
    code 1..1 and
    isPrimary 1..1

* extension[id].url = "code" (exactly)
* extension[id] ^definition = "The ATC Code."
* extension[id].value[x] only coding

* extension[type].url = "is-primary" (exactly)
* extension[type] ^definition = "Whether the ATC code is the primary code"
* extension[type].value[x] only boolean