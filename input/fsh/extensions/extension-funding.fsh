Extension: Funding
Id: nzf-funding
Description: "Funding elements specific to NZ. "

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-funding"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    type 1..1 and
    status 1..1 and 
    subsidy 0..1 and
    manPrice 0..1 and
    scheduleDate 0..1 and
    annotation 0..* contains 
        type 1..1
        details: 0..1

* extension[type].url = "type" (exactly)
* extension[type] ^definition = "Type of funding - hospital, community."
* extension[type] ^short = "Type of funding - hospital, community."
* extension[type].value[x] only CodeableConcept

* extension[status].url = "status" (exactly)
* extension[status] ^definition = "no subsidy, partial subsidy, full subsidy"
* extension[status] ^short = "no subsidy, partial subsidy, full subsidy"
* extension[status].value[x] only CodeableConcept
* extension[status].value[x] from https://nzhts.digital.health.nz/fhir/ValueSet/funding-code

* extension[subsidy].url = "subsidy" (exactly)
* extension[subsidy] ^definition = "The subsided price"
* extension[subsidy] ^short = "The subsided price"
* extension[subsidy].value[x] only Money

* extension[manPrice].url = "manPrice" (exactly)
* extension[manPrice] ^definition = "The manufacturer price."
* extension[manPrice] ^short = "The manufacturer price."
* extension[manPrice].value[x] only Money

* extension[scheduleDate].url = "scheduleDate" (exactly)
* extension[scheduleDate] ^definition = "The date this item was placed on the schedule"
* extension[scheduleDate] ^short = "The date this item was placed on the schedule"
* extension[scheduleDate].value[x] only date

* extension[annotation].url = "annotation" (exactly)
* extension[annotation] ^definition = "Annotations that apply to this funding"
* extension[annotation] ^short = "Annotations that apply to this funding"

* extension[annotation].extension[type].url = "type" (exactly)
* extension[annotation].extension[type] ^definition = "The type of annotation"
* extension[annotation].extension[type] ^short = "The type of annotation"
* extension[annotation].extension[type].value[x] only CodeableConcept

* extension[annotation].extension[details].url = "details" (exactly)
* extension[annotation].extension[details] ^definition = "Annotation details"
* extension[annotation].extension[details] ^short = "Annotation details"
* extension[annotation].extension[details].value[x] only string