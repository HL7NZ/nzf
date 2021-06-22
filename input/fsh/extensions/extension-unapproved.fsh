Extension: Unapproved
Id: nzf-unapproved
Description: "True if this medication has not been approved by Medsafe and can be prescribed under section 29"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-unapproved"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only boolean