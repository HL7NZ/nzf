Extension: PrescribeByBrand
Id: prescribe-by-brand
Description: "True if can be prescribed by brand"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/prescribe-by-brand"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only boolean