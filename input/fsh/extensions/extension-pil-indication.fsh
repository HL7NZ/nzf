Extension: PilSource
Id: nzf-pil-source
Description: "Indication that this PIL applies to"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-pil-indication"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "DocumentReference.context"       
 
* extension 0..0
* value[x] only CodeableConcept