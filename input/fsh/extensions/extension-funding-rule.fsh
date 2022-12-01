Extension: FundingRule
Id: nzf-funding-rule
Description: "Funding restriction information which complements the general funding information provided in the nzf-funding extension.  The extension can be added multiple times to a product for each given rule as well as for each PHARMAC schedule.  These can be differentiated via the scheduleDate field."

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-funding-rule"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    scheduleDate 1..1 and 
    type 1..1 and 
    ruleType 1..1 and 
    ruleAttribute 0..1 and 
    ruleValue 0..1 and
    ruleText 0..1 and
    ruleWaiver 0..1 and
    ruleXlinkHref 0..1

* extension[scheduleDate].url = "scheduleDate" (exactly)
* extension[scheduleDate] ^definition = "The date this item was placed on the schedule"
* extension[scheduleDate] ^short = "The date this item was placed on the schedule"
* extension[scheduleDate].value[x] only date

* extension[type].url = "type" (exactly)
* extension[type] ^definition = "Type of funding - hml, community."
* extension[type] ^short = "Type of funding - hml, community."
* extension[type].value[x] only CodeableConcept
* extension[type].value[x] from https://nzhts.digital.health.nz/fhir/ValueSet/nzf-funding-type

* extension[ruleType].url = "ruleType" (exactly)
* extension[ruleType] ^definition = "The type of PHARMAC rule - primarily sourced from the ps_rule table but can be derived for attribute based rules"
* extension[ruleType] ^short = "The type of PHARMAC rule - primarily sourced from the ps_rule table but can be derived for attribute based rules"
* extension[ruleType].value[x] only CodeableConcept

* extension[ruleAttribute].url = "ruleAttribute" (exactly)
* extension[ruleAttribute] ^definition = "The attribute from the ps_rule table"
* extension[ruleAttribute] ^short = "The attribute from the ps_rule table"
* extension[ruleAttribute].value[x] only string

* extension[ruleValue].url = "ruleValue" (exactly)
* extension[ruleValue] ^definition = "The value from the ps_rule table except for attribute based rules"
* extension[ruleValue] ^short = "The value from the ps_rule table except for attribute based rules"
* extension[ruleValue].value[x] only string

* extension[ruleText].url = "ruleText" (exactly)
* extension[ruleText] ^definition = "Derived text based on the rule"
* extension[ruleText] ^short = "Derived text based on the rule"
* extension[ruleText].value[x] only string

* extension[ruleWaiver].url = "ruleWaiver" (exactly)
* extension[ruleWaiver] ^definition = "The waiver from the ps_rule table"
* extension[ruleWaiver] ^short = "The waiver from the ps_rule table"
* extension[ruleWaiver].value[x] only string

* extension[ruleXlinkHref].url = "ruleXlinkHref" (exactly)
* extension[ruleXlinkHref] ^definition = "The xlinkHref from the ps_rule table"
* extension[ruleXlinkHref] ^short = "The xlinkHref from the ps_rule table"
* extension[ruleXlinkHref].value[x] only string
