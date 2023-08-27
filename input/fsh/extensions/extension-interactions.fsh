Extension: InteractionsRoute
Id: stockleys-interaction-route
Description: ""

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-route"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "ClinicalUseDefinition"       

* extension 0..0
* value[x] only CodeableConcept

Extension: InteractionSeverity
Id: stockleys-interaction-severity-code
Description: ""

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-severity-code"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "ClinicalUseDefinition"

* extension 0..0
* value[x] only CodeableConcept

Extension: InteractionWarning
Id: stockleys-interaction-warning-code
Description: ""

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-warning-code"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "ClinicalUseDefinition"

* extension 0..0
* value[x] only CodeableConcept

Extension: InteractionReviewDate
Id: stockleys-interaction-review-date
Description: ""

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-review-date"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "ClinicalUseDefinition"

* extension 0..0
* value[x] only date

Extension: InteractionModificationDate
Id: stockleys-interaction-modification-date
Description: ""

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-modification-date"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "ClinicalUseDefinition"

* extension 0..0
* value[x] only date

Extension: InteractionTextLink
Id: stockleys-interaction-text-link
Description: ""

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-text-link"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft
* ^context.type = #element
* ^context.expression = "ClinicalUseDefinition"

* extension 0..0
* value[x] only string