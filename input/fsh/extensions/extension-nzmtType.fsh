Extension: NzmtType
Id: nzf-nzmtType
Description: "The NZ Medicines Terminology (NZMT) Data Class – MP (Medicinal Product), MPUU (Medicinal Product Unit of Use), MPP (Medicinal Product Pack), TP (Trade Product), TPUU (Trade Product Unit of Use), TPP (Trade Product Pack) or CTPP (Containered Trade Product Pack) – that the Medication is a member of."

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-nzmt-type"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension 0..0
* value[x] only CodeableConcept 
* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/nzmt-type
