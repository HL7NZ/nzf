**DRAFT - SUBJECT TO CHANGE, NOT FOR CLINICAL USE**

THE NZF/NZULM FHIR API provides support for interactions checking based on Stockleys Alerts.  This support comes in the form of two custom FHIR [Operations](https://hl7.org/fhir/R4B/operations.html).  The first provides a list of interactions for a given NZMT medication and the second provides a list of interactions between a list of NZMT medication codes.

Each API call returns a Bundle which, alongside associated resources, returns a list of [ClnicalUseDefinitions](https://hl7.org/fhir/R4B/clinicaluseDefinition.html)


### Background

TODO

### How it works

Stockleys Alerts data is currently provided via XML in a drug to drug format using Martindale Ids as the code for each interactant.  Each interaction is a one to one interaction.  The New Zealand Formulary maps NZMT Medicinal Products (MP) to Martindale Ids to support retrieving interactions for the NZMT system.  When a NZMT code is submitted to the API, the related MP or MPs for each medication are retrieved.  These MPs are then used to get the mapped Martindale Ids which are then used to retrieve the appropriate interaction records in the form of ClinicalUseDefinitions.  In accordance with the intended design of the FHIR ClinicalUseDefinition each one to one stockleys interaction is mapped to two ClinicalUseDefinition records, the first has one interactant as the subject and the other as the interactant and the second has the subject and interactants switched.

For example:

Given the NZMT Id of 20025461000116102 - Paracare (paracetamol 500 mg) tablet: uncoated, 1 tablet

The system will retrieve the MP of 20025461000116102 - Paracetamol via the Medication resource related medication extension.

The system will then determine that this MP is mapped to the Martidale Id of (2679-p - paracetamol)

This martindale id is then used to retrieve the associated interactions (in the form of Clinical Use Defintions)

**Note** - It is possible that a submitted medication code (or a component of a medication) has not yet been mapped to a Martindale Id.  If this happens then an OperationalOutcome with a status of warning is returned.  The specific component can also be determined via the returned Medication and ConceptMap resources.

TODO - Add example

### Custom Operations

The interaction system has two distinct API methods, each of which return a bundle.  Both methods also allow for an optional parameter (includeMedicationAndConceptMap) to indicate whether the medication and concept map resources shouold be returned in the response bundle.

#### Bundle details

##### OperationOutcome

An OperationOutcome is included in the bundle if there is an error or a warning.  

An error will occur if any of the NZMT codes are not valid or not recognised.

A warning will occur if an NZMT code has not yet been mapped to an interaction substance code (mart-id)

##### Medications [Optional]

The full medication resource for each submitted NZMT code is returned in the Bundle.  These are provided for convenience and provide tracibility around which MP(s) are associated with the given medication.

##### Concept Map [Optional]

A partial [concept map](https://hl7.org/fhir/R4B/conceptmap.html) is provided detailing the mapping between NZMT MPs and their associated Martindale Ids.  If a MP has not yet been mapped to a Martindale Id then there will be no codes listed.  However, if a MP has attempted to be mapped by the NZF but no appropriate Martindale Id was determined then this is recorded as Unmatched in the Concept Map resource.

TODO - Add example

##### Clinical Use Definitions (Interactions)

A profile for interactions is provided [here](./StructureDefinition-NzfInteractionClinicalUseDefinition.html) - Draft/Work in progress

#### Interactions Of

Takes a NZMT Id (MP, TP, MPP, TPP, MPUU, TPUU or CTPP) and returns the stockleys interactions for that given id

##### Parameters

**nzmtid**: fhir string - which is a NZMT Code for any of the following concepts (MP, TP, MPP, TPP, MPUU, TPUU or CTPP)
**includeMedicationAndConceptMap**: boolean - which indicates whether the medication and concept maps should be included in the returned bundle

GET [base]/Medication/$interactions-of?nzmtId=10037191000116105&includeMedicationAndConceptMap=true

#### Interactions Between - All

Takes two or more NZMT Ids (MP, TP, MPP, TPP, MPUU, TPUU or CTPP) and returns the stockleys interactions between those NZMT Ids

##### Parameters

**nzmtid**: fhir strings - two or more NZMT Codes from any of the following concepts (MP, TP, MPP, TPP, MPUU, TPUU or CTPP)

**includeMedicationAndConceptMap**: boolean - which indicates whether the medication and concept maps should be included in the returned bundle

**filterComplementaryRecords**: boolean - when true complementary clinical use definitions are filtered out.  These records are when an interaction is the same except the subject and interactant are reversed.


[HttpPost]
POST [base]/Medication/$interactions-between
content-type: application/json
```
{
  "resourceType": "Parameters",
    "id": "560c7c61-2c70-4c54-b86d-c53a9d29495e",
    "parameter": [
    {
      "name": "nzmtid",
      "valueString": "10037191000116105"
    },
    {
      "name": "nzmtid",
      "valueString": "10194111000116109"
    },
    {
      "name":"includeMedicationAndConceptMap",
      "valueBoolean": true
    },
    {
      "name":"filterComplementaryRecords",
      "valueBoolean": true
    }
  ]
}
```

#### Interactions Between - Focussed

Takes a single focussed nzmt id and one or more other nzmtids and returns interactions between the focussed nzmt and the other nzmt ids.  Interactions between the other nzmt ids are not performed.

All NZMT Ids need to be within the following concepts  - MP, TP, MPP, TPP, MPUU, TPUU or CTPP.

##### Parameters

**focussednzmtid**: fhir string - a single NZMT Codes from any of the following concepts (MP, TP, MPP, TPP, MPUU, TPUU or CTPP)

**nzmtid**: fhir strings - two or more NZMT Codes from any of the following concepts (MP, TP, MPP, TPP, MPUU, TPUU or CTPP)

**includeMedicationAndConceptMap**: boolean - which indicates whether the medication and concept maps should be included in the returned bundle

**filterComplementaryRecords**: boolean - when true complementary clinical use definitions are filtered out.  These records are when an interaction is the same except the subject and interactant are reversed.


[HttpPost]
POST [base]/Medication/$interactions-between
content-type: application/json
```
{
  "resourceType": "Parameters",
    "id": "560c7c61-2c70-4c54-b86d-c53a9d29495e",
    "parameter": [
    {
      "name": "focussednzmtid",
      "valueString": "10010681000116105"
    },      
    {
      "name": "nzmtid",
      "valueString": "10037191000116105"
    },
    {
      "name": "nzmtid",
      "valueString": "10194111000116109"
    },
    {
      "name":"includeMedicationAndConceptMap",
      "valueBoolean": true
    },
    {
      "name":"filterComplementaryRecords",
      "valueBoolean": true
    }
  ]
}
```

### Associated Code Systems

Specific definitions of the codes are provided via Code system definitions.  More details to follow.  

TODO

### Usage and display recommendation

TODO

### FAQ

#### Why can we not just search for interactions via the normal FHIR search operations?

Due to legal reasons we cannot provide a full download of all of our source data via the clinical use definitions.  These therefore need to be provided via an API on a per medication basis.

#### Why return include the medication and concept map resources in the response?

The medication and concept maps resources are optionally included in the reponse (defaulting to be included).  The reason for this is that it provides full tracibility to the mapping process.