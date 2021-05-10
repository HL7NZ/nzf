Extension: MedsafeStatus
Id: medsafeStatus
Description: "Medsafe Status"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/medsafeStatus"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only CodeableConcept

