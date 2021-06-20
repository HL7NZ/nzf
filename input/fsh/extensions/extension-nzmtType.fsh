Extension: NzmtType
Id: nzmtType
Description: "Type of NZMT record (e.g. MP, MPUU)"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-nzmtType"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only CodeableConcept 
* valueCodeableConcept from https://standards.digital.health.nz/fhir/ValueSet/nzmt-type
