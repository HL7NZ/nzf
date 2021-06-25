Extension: Medsafe
Id: nzf-medsafe
Description: "Medsafe details"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-medsafe"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension contains
    status 0..1 and
    regSituation 0..1

* extension[status].url = "status" (exactly)
* extension[status] ^definition = "Medsafe package status"
* extension[status] ^short = "Medsafe package status."
* extension[status].value[x] only CodeableConcept 
* extension[status].valueCodeableConcept

* extension[regSituation].url = "regSituation" (exactly)
* extension[regSituation] ^definition = "Medsafe reg situation"
* extension[regSituation] ^short = "Medsafe reg situation"
* extension[regSituation].value[x] only CodeableConcept 
* extension[regSituation].valueCodeableConcept