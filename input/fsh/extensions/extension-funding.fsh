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
    // subsidyPrice 1..1 and
    // manPrice 0..1 and
    // scheduleDate 0..1 and
    note 0..* and
    rule 0..*


* extension[type].url = "type" (exactly)
* extension[type] ^definition = "Type of funding - hospital, community."
* extension[type] ^short = "Type of funding - hospital, community."
* extension[type].value[x] only CodeableConcept

* extension[status].url = "status" (exactly)
* extension[status] ^definition = "no subsidy, partial subsidy, full subsidy"
* extension[status] ^short = "no subsidy, partial subsidy, full subsidy"
* extension[status].value[x] only CodeableConcept
* extension[status].value[x] from https://standards.digital.health.nz/fhir/ValueSet/funding-code

// TODO 
// * extension[subsidyPrice].url = "subsidyPrice" (exactly)
// * extension[subsidyPrice] ^definition = "The subsided price"
// * extension[subsidyPrice] ^short = "The subsided price"
// * extension[subsidyPrice].value[x] only Money

// * extension[manPrice].url = "manPrice" (exactly)
// * extension[manPrice] ^definition = "The manufacturer price."
// * extension[manPrice] ^short = "The manufacturer price."
// * extension[manPrice].value[x] only Money

// * extension[scheduleDate].url = "scheduleDate" (exactly)
// * extension[scheduleDate] ^definition = "The date this item was placed on the schedule"
// * extension[scheduleDate] ^short = "The date this item was placed on the schedule"
// * extension[scheduleDate].value[x] only date

* extension[note].url = "note" (exactly)
* extension[note] ^definition = "A note that applies to this funding"
* extension[note] ^short = "A note that applies to this funding"
* extension[note].value[x] only string

* extension[rule].url = "rule" (exactly)
* extension[rule] ^definition = "A rule that applies to this funding"
* extension[rule] ^short = "A rule that applies to this funding"
* extension[rule].value[x] only string