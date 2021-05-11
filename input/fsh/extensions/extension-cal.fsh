Extension: Cal
Id: cal
Description: "Cautionary and Advisory Label"


* ^url = "http://hl7.org.nz/fhir/StructureDefinition/cal"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^title = "Cautionary and Advisory Label"

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    id 1..1 and
    labelType 1..1 and 
    text 1..1

* extension[id].url = "id" (exactly)
* extension[id] ^definition = "An id for this CAL."
* extension[id] ^short = "An id for this CAL."
* extension[id].value[x] only id

* extension[labelType].url = "labelType" (exactly)
* extension[labelType] ^definition = "The type of label."
* extension[labelType] ^short = "The type of label."
* extension[labelType].value[x] only CodeableConcept

* extension[text].url = "text" (exactly)
* extension[text] ^definition = "The label text."
* extension[text] ^short = "The label text."
* extension[text].value[x] only string
