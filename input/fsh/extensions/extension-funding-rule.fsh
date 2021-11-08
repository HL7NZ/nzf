Extension: FundingRule
Id: nzf-funding-rule
Description: "Funding elements specific to NZ. "

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-funding-rule"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    scheduleDate 1..1 and 
    type: 1..1 and 
    ruleType: 1..1 and 
    ruleAttribute 0..1 and 
    ruleValue 0..1 and
    ruleText 0..1 and
    ruleWaiver 0..1

* extension[type].url = "type" (exactly)
* extension[type] ^definition = "Type of funding - hospital, community."
* extension[type] ^short = "Type of funding - hospital, community."
* extension[type].value[x] only CodeableConcept

* extension[ruleType].url = "ruleType" (exactly)
* extension[ruleType] ^definition = "The type of pharmac rule - primarily sourced from the ps_rule table but can be derived for attribute based rules"
* extension[ruleType] ^short = "The type of pharmac rule - primarily sourced from the ps_rule table but can be derived for attribute based rules"
* extension[ruleType].value[x] only CodeableConcept

* extension[subsidy].url = "ruleAttribute" (exactly)
* extension[subsidy] ^definition = "The attribute from the ps_rule table"
* extension[subsidy] ^short = "The attribute from the ps_rule table"
* extension[subsidy].value[x] only string

* extension[subsidy].url = "ruleValue" (exactly)
* extension[subsidy] ^definition = "The value from the ps_rule table except for attribute based rules"
* extension[subsidy] ^short = "The value from the ps_rule table except for attribute based rules"
* extension[subsidy].value[x] only string

* extension[subsidy].url = "ruleText" (exactly)
* extension[subsidy] ^definition = "Derived text based on the rule"
* extension[subsidy] ^short = "Derived text based on the rule"
* extension[subsidy].value[x] only string

* extension[subsidy].url = "ruleWaiver" (exactly)
* extension[subsidy] ^definition = "The waiver from the ps_rule table"
* extension[subsidy] ^short = "The waiver from the ps_rule table"
* extension[subsidy].value[x] only string
