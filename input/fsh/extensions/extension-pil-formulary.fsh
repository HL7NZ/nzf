Extension: PilFormulary
Id: nzf-pil-formulary
Description: "Applicable formulary for PIL"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-pil-formulary"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "DocumentReference.context"       
 
* extension 0..0
* value[x] only CodeableConcept