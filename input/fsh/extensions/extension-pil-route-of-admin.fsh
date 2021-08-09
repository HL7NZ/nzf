Extension: PilRouteOfAdmin
Id: nzf-pil-route-of-admin
Description: "Route of admin that this PIL applies to"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-pil-route-of-admin"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "DocumentReference.context"       
 
* extension 0..0
* value[x] only CodeableConcept