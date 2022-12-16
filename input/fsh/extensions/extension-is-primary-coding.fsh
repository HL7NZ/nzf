Extension: IsPrimary
Id: nzf-is-primary-coding
Description: "Is primary code within given context, e.g. primary Pharmacode® when multiple given"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-is-primary-coding"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Coding"       
 
* extension 0..0
* value[x] only boolean