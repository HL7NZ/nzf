Extension: LegalClass
Id: legalclass
Description: "Legal classification"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/legalclass"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension contains
    code 1..1 and
    conditions 0..1

* extension[code].url = "code" (exactly)
* extension[code] ^definition = "Medsafe legal classification code"
* extension[code].value[x] only CodeableConcept 
* extension[code].valueCodeableConcept from https://standards.digital.health.nz/fhir/ValueSet/medicine-classification-code

* extension[conditions].url = "conditions" (exactly)
* extension[conditions] ^definition = "Classification conditions"
* extension[conditions].value[x] only string
