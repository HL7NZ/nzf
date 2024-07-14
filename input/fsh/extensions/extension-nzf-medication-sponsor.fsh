Extension: MedicationSponsor
Id: nzf-medication-sponsor
Description: "Organization sponsoring this medication"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-medication-sponsor"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only Reference(Organization)