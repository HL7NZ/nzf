Extension: NzmtType
Id: nzf-nzmtType
Description: "Type of NZMT record (e.g. MP, MPUU)"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-nzmt-type"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only CodeableConcept 
* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/nzmt-type
