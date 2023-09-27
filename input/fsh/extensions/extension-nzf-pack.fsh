Extension: NzfPack
Id: nzf-pack
Description: "NZF Pack detail"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-pack"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"       
 
* extension contains
    nzmtMedicineCode 0..1 and
    quantity 0..1 and
    size 0..1

* extension[nzmtMedicineCode].url = "nzmtMedicineCode" (exactly)
* extension[nzmtMedicineCode] ^definition = "NZMT reference code"
* extension[nzmtMedicineCode] ^short = "NZMT reference"
* extension[nzmtMedicineCode].value[x] only CodeableConcept 
* extension[nzmtMedicineCode].valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/medicine-classification-code

* extension[quantity].url = "quantity" (exactly)
* extension[quantity] ^definition = "NZF Pack quantity of units"
* extension[quantity] ^short = "NZF Pack quantity"
* extension[quantity].value[x] only Quantity 

* extension[size].url = "size" (exactly)
* extension[size] ^definition = "NZF Pack unit size"
* extension[size] ^short = "NZF Pack size"
* extension[size].value[x] only Quantity 