Extension: LegalClass
Id: legalclass
Description: "Legal classification"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/legalclass"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft

* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only CodeableConcept from https://standards.digital.health.nz/fhir/ValueSet/medication-legal-classification-code