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

* extension[code].url = "code" (exactly)
* extension[code] ^definition = "The ATC Code."
* extension[code].value[x] only code

* extension[isPrimary].url = "isPrimary" (exactly)
* extension[isPrimary] ^definition = "Whether the ATC code is the primary code"
* extension[isPrimary].value[x] only boolean