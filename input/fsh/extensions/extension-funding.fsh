Extension: Funding
Id: nzf-funding
Description: "Core funding information specific to NZ.  The extension can be added multiple times to a product for each PHARMAC schedule.  These can be differentiated via the scheduleDate field."

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-funding"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    scheduleDate 1..1 and 
    status 0..1 and 
    subsidy 0..1 and
    price 0..1 and
    type 1..*

* extension[scheduleDate].url = "scheduleDate" (exactly)
* extension[scheduleDate] ^definition = "The date this item was placed on the schedule"
* extension[scheduleDate] ^short = "The date this item was placed on the schedule"
* extension[scheduleDate].value[x] only date

* extension[status].url = "status" (exactly)
* extension[status] ^definition = "status of community funding - no subsidy, partial subsidy, full subsidy"
* extension[status] ^short = "status of community funding - no subsidy, partial subsidy, full subsidy"
* extension[status].value[x] only CodeableConcept
* extension[status].value[x] from https://nzhts.digital.health.nz/fhir/ValueSet/nzf-funding-code

* extension[subsidy].url = "subsidy" (exactly)
* extension[subsidy] ^definition = "The subsided price"
* extension[subsidy] ^short = "The subsided price"
* extension[subsidy].value[x] only Money

* extension[price].url = "price" (exactly)
* extension[price] ^definition = "The manufacturer price."
* extension[price] ^short = "The manufacturer price."
* extension[price].value[x] only Money

* extension[type].url = "type" (exactly)
* extension[type] ^definition = "A list of funding types, currently either community or hml"
* extension[type] ^short = "A list of funding types, currently either community or hml"
* extension[type].value[x] only CodeableConcept
* extension[type].value[x] from https://nzhts.digital.health.nz/fhir/ValueSet/nzf-funding-type
