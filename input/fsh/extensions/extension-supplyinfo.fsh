Extension: SupplyInformation
Id: nzf-supply-information
Description: "Information around the supply and availability of medications applied at each NZMT level.  For example, when paracetamol tablets are in short supply an alert may be attached to the MP level medication along with the relevant details."

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-supply-information"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "Medication"

* extension contains
    type 1..1 and
    duration 1..1 and
    solution 1..1 and
    action 1..1 and
    date 1..1 and
    information 1..1 and 
    url 1..1

* extension[type].url = "type" (exactly)
* extension[type] ^definition = "The type of issue affecting the product.  Possible values: Supply, Information, Brand Change."
* extension[type] ^short = "The type of issue affecting the product."
* extension[type].value[x] only CodeableConcept

* extension[duration].url = "duration" (exactly)
* extension[duration] ^definition = "Indication of whether the issue is temporary (such as an out of stock) or permanent (such as a discontinuation).  Possible values: Temporary, Permanent."
* extension[duration] ^short = "Indication of whether the issue is temporary (such as an out of stock) or permanent (such as a discontinuation)."
* extension[duration].value[x] only CodeableConcept

* extension[solution].url = "solution" (exactly)
* extension[solution] ^definition = "Description of the solution in place to address the issue. Possible values: No replacement, Alternate brand, Alternate formulation, Alternate active ingredients(s), Equivalent product s29, Alternate brand s29, Alternate active ingredient s29, Product recall, Alternate product, No change, Alternate strength, New product."
* extension[solution] ^short = "Description of the solution in place to address the issue."
* extension[solution].value[x] only string

* extension[action].url = "action" (exactly)
* extension[action] ^definition = "Description of the action prompted by the issue and solution.  Possible values: Prescribing action, Depensing action, Clinical caution, Recall action, Information."
* extension[action] ^short = "Description of the action prompted by the issue and solution."
* extension[action].value[x] only string

* extension[date].url = "date" (exactly)
* extension[date] ^definition = "The date the issue was entered."
* extension[date] ^short = "The date the issue was entered."
* extension[date].value[x] only date

* extension[information].url = "information" (exactly)
* extension[information] ^definition = "Product description using NZULM format with short description of the issue and solution."
* extension[information] ^short = "Product description using NZULM format with short description of the issue and solution."
* extension[information].value[x] only string

* extension[url].url = "url" (exactly)
* extension[url] ^definition = "Address of relevant notice on PHARMAC webpage."
* extension[url] ^short = "Address of relevant notice on PHARMAC webpage."
* extension[url].value[x] only url