Extension: Atc
Id: nzf-atc
Description: "Anatomical Therapeutic Chemical (ATC) Classification - see https://www.who.int/tools/atc-ddd-toolkit/atc-classification"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-atc"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       

* extension 0..0
* value[x] only CodeableConcept
* value[x] from https://nzhts.digital.health.nz/fhir/ValueSet/atc-code