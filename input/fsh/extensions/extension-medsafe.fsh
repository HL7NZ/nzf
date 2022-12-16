Extension: Medsafe
Id: nzf-medsafe
Description: "Medsafe package, reg situation and administration route details"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-medsafe"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension contains
    status 0..1 and
    regSituation 0..1 and
    administrationRoute 0..1

* extension[status].url = "status" (exactly)
* extension[status] ^definition = "Medsafe package status"
* extension[status] ^short = "Medsafe package status."
* extension[status].value[x] only CodeableConcept 

* extension[regSituation].url = "regSituation" (exactly)
* extension[regSituation] ^definition = "Medsafe reg situation"
* extension[regSituation] ^short = "Medsafe reg situation"
* extension[regSituation].value[x] only CodeableConcept 

* extension[administrationRoute].url = "administrationRoute" (exactly)
* extension[administrationRoute] ^definition = "Medsafe administration route"
* extension[administrationRoute] ^short = "Medsafe administration route"
* extension[administrationRoute].value[x] only CodeableConcept 
