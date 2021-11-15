Extension: Funding
Id: nzf-funding
Description: "General funding information specific to NZ."

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-funding"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    scheduleDate 1..1 and 
    status 1..1 and 
    subsidy 0..1 and
    manPrice 0..1 and
    isHml 0..1

* extension[scheduleDate].url = "scheduleDate" (exactly)
* extension[scheduleDate] ^definition = "The date this item was placed on the schedule"
* extension[scheduleDate] ^short = "The date this item was placed on the schedule"
* extension[scheduleDate].value[x] only date

* extension[status].url = "status" (exactly)
* extension[status] ^definition = "status of community funding - no subsidy, partial subsidy, full subsidy"
* extension[status] ^short = "status of community funding - no subsidy, partial subsidy, full subsidy"
* extension[status].value[x] only CodeableConcept
* extension[status].value[x] from https://nzhts.digital.health.nz/fhir/ValueSet/funding-code

* extension[subsidy].url = "communitySubsidy" (exactly)
* extension[subsidy] ^definition = "Community - The subsided price"
* extension[subsidy] ^short = "Community - The subsided price"
* extension[subsidy].value[x] only Money

* extension[manPrice].url = "communityManPrice" (exactly)
* extension[manPrice] ^definition = "Community - The manufacturer price."
* extension[manPrice] ^short = "Community - The manufacturer price."
* extension[manPrice].value[x] only Money

* extension[isHml].url = "isHml" (exactly)
* extension[isHml] ^definition = "Is HML"
* extension[isHml] ^short = "Is HML."
* extension[isHml].value[x] only boolean
