Extension: NzmtDescription
Id: nzf-description
Description: "Specific NZMT descriptions that apply to this medication"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-description"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    type 1..1 and
    term 1..1


* extension[type].url = "type" (exactly)
* extension[type] ^definition = "Type of description."
* extension[type].value[x] only CodeableConcept
* extension[type].value[x] from https://nzhts.digital.health.nz/fhir/ValueSet/nzf-description-types

* extension[term].url = "term" (exactly)
* extension[term] ^definition = "the text of the description"
* extension[term].value[x] only CodeableConcept
