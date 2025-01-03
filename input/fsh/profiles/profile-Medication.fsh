Alias: $nzmtType = http://hl7.org.nz/fhir/StructureDefinition/nzf-nzmt-type
Alias: $atc = http://hl7.org.nz/fhir/StructureDefinition/nzf-atc
Alias: $link = http://hl7.org.nz/fhir/StructureDefinition/nzf-link
Alias: $cal = http://hl7.org.nz/fhir/StructureDefinition/nzf-cal
Alias: $funding = http://hl7.org.nz/fhir/StructureDefinition/nzf-funding
Alias: $fundingRule = http://hl7.org.nz/fhir/StructureDefinition/nzf-funding-rule
Alias: $description = http://hl7.org.nz/fhir/StructureDefinition/nzf-description
Alias: $unapproved = http://hl7.org.nz/fhir/StructureDefinition/nzf-unapproved
Alias: $legalclass = http://hl7.org.nz/fhir/StructureDefinition/nzf-legalclass
Alias: $medsafe = http://hl7.org.nz/fhir/StructureDefinition/nzf-medsafe
Alias: $pbb = http://hl7.org.nz/fhir/StructureDefinition/nzf-prescribe-by-brand
Alias: $si = http://hl7.org.nz/fhir/StructureDefinition/nzf-supply-information
Alias: $rm = http://hl7.org.nz/fhir/StructureDefinition/nzf-related-medication
Alias: $nzfpack = http://hl7.org.nz/fhir/StructureDefinition/nzf-pack

Profile:        NzfMedication
Parent:         Medication
Id:             NzfMedication
Title:          "Medication resource for NZ Formulary"
Description:    "Medication resource for NZ Formulary"

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-medication"

* extension contains 
    $nzmtType named nzmtType 0..1 and
    $atc named atc 0..* and
    $link named link 0..* and 
    $cal named cal 0..* and
    $funding named funding 0..* and
    $fundingRule named fundingRule 0..* and
    $description named description 0..* and
    $unapproved named unapproved 0..1 and
    $legalclass named legalclass 0..* and
    $medsafe named medsafe 0..1 and
    $pbb named prescribebybrand 0..1 and
    $si named supplyinformation 0..* and
    $nzfpack named nzfpack 0..1 and
    $rm named relatedmedication 0..*



* extension[nzmtType] ^short = "The NZ Medicines Terminology (NZMT) Data Class – MP (Medicinal Product), MPUU (Medicinal Product Unit of Use), MPP (Medicinal Product Pack), TP (Trade Product), TPUU (Trade Product Unit of Use), TPP (Trade Product Pack) or CTPP (Containered Trade Product Pack) – that the Medication is a member of."    
* extension[atc] ^short = "Anatomical Therapeutic Chemical (ATC) Classification"
* extension[link] ^short = "Links to other information about this medication"
* extension[description] ^short = "NZMT descriptions for the medicine"
* extension[cal] ^short = "Cautionary and Advisory Label"
* extension[funding] ^short = "General Funding details"
* extension[fundingRule] ^short = "Funding constraints and requirements"
* extension[unapproved] ^short = "Whether the medication can be used under section29"
* extension[legalclass] ^short = "Legal classification of the medication"
* extension[medsafe] ^short = "Medsafe details of the medication"
* extension[prescribebybrand] ^short = "True if can be prescribed by brand"
* extension[supplyinformation] ^short = "Supply information"
* extension[nzfpack] ^short = "NZF Pack details"
* extension[relatedmedication] ^short = "Related medication"

* code only CodeableConcept
* code from http://nzmt.org.nz/vs (preferred)

// elements that have been removed
* manufacturer 0..0
* amount 0..0
* batch 0..0
