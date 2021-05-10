Extension: Sect29
Id: sect29
Description: "True if this medication can be used under section 29"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/unapproved"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only boolean