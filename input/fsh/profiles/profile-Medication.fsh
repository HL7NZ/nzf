Alias: $nzmtType = http://hl7.org.nz/fhir/StructureDefinition/nzmtType
Alias: $atc = http://hl7.org.nz/fhir/StructureDefinition/atc
Alias: $link = http://hl7.org.nz/fhir/StructureDefinition/link
Alias: $cal = http://hl7.org.nz/fhir/StructureDefinition/cal
Alias: $funding = http://hl7.org.nz/fhir/StructureDefinition/funding
// Alias: $description = http://hl7.org.nz/fhir/StructureDefinition/description
Alias: $unapproved = http://hl7.org.nz/fhir/StructureDefinition/unapproved
Alias: $legalclass = http://hl7.org.nz/fhir/StructureDefinition/legalclass
Alias: $medsafeStatus = http://hl7.org.nz/fhir/StructureDefinition/medsafeStatus
Alias: $pbb = http://hl7.org.nz/fhir/StructureDefinition/prescribe-by-brand
Alias: $si = http://hl7.org.nz/fhir/StructureDefinition/supply-information

Profile:        NzfMedication
Parent:         Medication
Id:             NzfMedication
Title:          "Medication resource for NZ Formulary"

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nzf-medication"

* extension contains
    $nzmtType named nzmtType 1..1 and
    $atc named atc 0..* and
    $link named link 0..* and 
    $cal named cal 0..* and
    $funding named funding 0..* and
    // $description named description 0..* and
    $unapproved named unapproved 0..1 and
    $legalclass named legalclass 0..1 and
    $medsafeStatus named medsafeStatus 0..1 and
    $pbb named prescribebybrand 0..1 and
    $si named supplyinformation 0..*

* extension[nzmtType] ^short = "Type of NZMT record (e.g. MP, MPUU)"    
* extension[atc] ^short = "Anatomical Therapeutic Chemical (ATC) Classification"
* extension[link] ^short = "Links to other information about this medication"
* extension[cal] ^short = "Cautionary and Advisory Label"
* extension[funding] ^short = "Funding constraints and requirements"
// * extension[description] ^short = "Different types of description about this medication"
* extension[unapproved] ^short = "Whether the medication can be used under section29"
* extension[legalclass] ^short = "Legal classification of the medication"
* extension[medsafeStatus] ^short = "Medsafe status of the medication"
* extension[prescribebybrand] ^short = "True if can be prescribed by brand"
* extension[supplyinformation] ^short = "Supply information"

// elements that have been removed
* status 0..0
* manufacturer 0..0
* amount 0..0
* ingredient.strength 0..0
* batch 0..0
