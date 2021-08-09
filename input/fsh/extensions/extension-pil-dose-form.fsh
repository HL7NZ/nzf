Extension: PilDoseForm
Id: nzf-pil-dose-form
Description: "Doseform that this PIL applies to"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-pil-dose-form"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "DocumentReference.context"       
 
* extension 0..0
* value[x] only CodeableConcept