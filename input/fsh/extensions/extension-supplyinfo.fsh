Extension: SupplyInformation
Id: supply-information
Description: "Specific descriptions that apply to this medication"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/supply-information"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

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
* extension[type] ^definition = "Type of description."
* extension[type].value[x] only code

* extension[duration].url = "duration" (exactly)
* extension[duration] ^definition = "the text of the description"
* extension[duration].value[x] only code

* extension[solution].url = "solution" (exactly)
* extension[solution] ^definition = "the text of the description"
* extension[solution].value[x] only string

* extension[action].url = "action" (exactly)
* extension[action] ^definition = "the text of the description"
* extension[action].value[x] only string

* extension[date].url = "date" (exactly)
* extension[date] ^definition = "the text of the description"
* extension[date].value[x] only date

* extension[information].url = "information" (exactly)
* extension[information] ^definition = "the text of the description"
* extension[information].value[x] only string

* extension[url].url = "url" (exactly)
* extension[url] ^definition = "the text of the description"
* extension[url].value[x] only url