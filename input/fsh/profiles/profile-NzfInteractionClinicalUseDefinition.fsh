Alias: $route = http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-route

Alias: $severity = http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-severity-code
Alias: $warning = http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-warning-code
Alias: $modificationDate = http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-modification-date
Alias: $reviewDate = http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-review-date
Alias: $textLink = http://hl7.org.nz/fhir/StructureDefinition/stockleys-interaction-text-link

Profile:        NzfInteractionClinicalUseDefinition
Parent:         ClinicalUseDefinition
Id:             NzfInteractionClinicalUseDefinition
Title:          "Interaction Clincial Use Definition resource for NZ Formulary"
Description:    "Interaction Clincial Use Definition resource for NZ Formulary"

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-interaction-clinical-use-definition"

* subject 1..1
* subject.extension contains 
    $route named route 1..*
* interaction 1..1
* interaction.interactant 1..1
* interaction.interactant.extension contains 
    $route named route 1..*
* interaction.extension contains
    $severity named severity 1..1 and 
    $warning named warning 1..1 and
    $modificationDate named modificationDate 1..1 and
    $reviewDate named reviewDate 1..1 and
    $textLink named textLink 1..1

// elements that have been removed
* interaction.type 0..0
* category 0..0
* contraindication 0..0
* indication 0..0
* undesirableEffect 0..0
* warning 0..0

