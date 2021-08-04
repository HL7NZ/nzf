Extension: NzfPageSize
Id: nzf-page-size
Description: "Attachment page size"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-page-size"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "DocumentReference.attachment"       
 
* extension 0..0
* value[x] only CodeableConcept 
* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/nzf-page-size
