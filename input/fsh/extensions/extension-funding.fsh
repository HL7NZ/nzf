Extension: Funding
Id: nzf-funding
Description: "General funding information specific to NZ.  This details whether the product is either community funded or is on the HML.  The extension can be added multiple times to a product for each pharmac schedule.  These can be differentiated via the scheduleDate field."

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-funding"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    scheduleDate 1..1 and 
    status 1..1 and 
    communitySubsidy 0..1 and
    communityManPrice 0..1 and
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

* extension[communitySubsidy].url = "communitySubsidy" (exactly)
* extension[communitySubsidy] ^definition = "Community - The subsided price"
* extension[communitySubsidy] ^short = "Community - The subsided price"
* extension[communitySubsidy].value[x] only Money

* extension[communityManPrice].url = "communityManPrice" (exactly)
* extension[communityManPrice] ^definition = "Community - The manufacturer price."
* extension[communityManPrice] ^short = "Community - The manufacturer price."
* extension[communityManPrice].value[x] only Money

* extension[isHml].url = "isHml" (exactly)
* extension[isHml] ^definition = "Is HML"
* extension[isHml] ^short = "Is HML."
* extension[isHml].value[x] only boolean
