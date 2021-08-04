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

* codes from system https://standards.digital.health.nz/ns/nzf-page-size-code



CodeSystem:  NzfPageSize
Id: nzf-page-size-code
Title: "Possible values for page size"
Description: "The set of all possible page sizes"

* ^url = "https://standards.digital.health.nz/ns/nzf-page-size-code"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* #A4 "A4"
* #A5 "A5"