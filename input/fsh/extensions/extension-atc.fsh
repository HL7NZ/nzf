Extension: Atc
Id: atc
Description: "(todo)"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/atc"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


//Note - haven't made it against the address (even though it is derived from that as it's more logical to have it as a top level extension)
* ^context.type = #element
* ^context.expression = "Medication"       
 

* extension 0..0
* value[x] only CodeableConcept
//* valueCodeableConcept from https://standards.digital.health.nz/fhir/ValueSet/dhb-code (preferred)