Extension: RelatedMedication
Id: nzf-related-medication
Description: "A related medication within the NZMT hierarchy"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-related-medication"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       

* extension contains
    code 1..1 and
    type 1..1

* extension[code].url = "code" (exactly)
* extension[code] ^definition = "The NZMT code of the related medication"
* extension[code] ^short = "The NZMT code of the related medication"
* extension[code].value[x] only CodeableConcept 

* extension[type].url = "type" (exactly)
* extension[type] ^definition = "The NZMT type of the related medication"
* extension[type] ^short = "The NZMT type of the related medication"
* extension[type].value[x] only CodeableConcept
