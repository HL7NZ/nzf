Extension: Link
Id: link
Description: "Reference to other information about this medication"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-link"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only Reference(DocumentReference)