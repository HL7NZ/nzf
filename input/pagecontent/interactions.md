**DRAFT - SUBJECT TO CHANGE, NOT FOR CLINICAL USE**

THE NZF/NZULM FHIR API provides support for interactions checking based on Stockley's Alerts.  This support comes in the form of two custom FHIR [Operations](https://hl7.org/fhir/R4B/operations.html).  The first provides a list of interactions for a given NZMT medication and the second provides a list of interactions between a list of NZMT medication codes.  This second API call can be limited to checking against a focussed nzmt id code.

Each API call returns a Bundle which, alongside associated resources, returns a list of [ClnicalUseDefinitions](https://hl7.org/fhir/R4B/clinicaluseDefinition.html)



### Background

The NZ Formulary currently provides support for interactions checking via their websites and via the older webservice.  The older webservice is being phased out and being replaced by this newer FHIR API.  These custom operations provide support for interactions checking and should provide a level of familarity with the existing webservice calls.  Due to contractual constraints the interactions data (i.e. the clinical use definitions) can not be provided via a download or for searching via the standard FHIR API.  The only way to retrieve interactions data is via these custom operations.

### How it works

Stockley's Alerts data is currently provided via XML in a drug to drug format using Martindale Ids as the code for each interactant.  Each interaction is a one to one interaction.  The New Zealand Formulary maps NZMT Medicinal Products (MP) to Martindale Ids to support retrieving interactions for the NZMT system.  When a NZMT code is submitted to the API, the related MP or MPs for each medication are retrieved.  These MPs are then used to get the mapped Martindale Ids which are then used to retrieve the appropriate interaction records in the form of ClinicalUseDefinitions.  In accordance with the intended design of the FHIR ClinicalUseDefinition each one to one Stockley's interaction is mapped to two ClinicalUseDefinition records, the first has one interactant as the subject and the other as the interactant and the second has the subject and interactants switched.

For example:

Given the NZMT Id of 20025461000116102 - Paracare (paracetamol 500 mg) tablet: uncoated, 1 tablet

The system will retrieve the MP of 20025461000116102 - Paracetamol via the Medication resource related medication extension.

The system will then determine that this MP is mapped to the Martidale Id of (2679-p - paracetamol)

This martindale id is then used to retrieve the associated interactions (in the form of Clinical Use Definitions)

**Note** - It is possible that a submitted medication code (or a component of a medication) has not yet been mapped to a Martindale Id.  If this happens then an OperationalOutcome with a status of warning is returned.  The specific component can also be determined via the returned Medication and ConceptMap resources.

### Custom Operations

The interaction system has two distinct API methods, each of which return a bundle.  Both methods also allow for an optional parameter (includeMedicationAndConceptMap) to indicate whether the medication and concept map resources should be returned in the response bundle.

#### Bundle details

##### OperationOutcome

An OperationOutcome is included in the bundle if there is an error or a warning.  

An error will occur if any of the NZMT codes are not valid or not recognised.

A warning will occur if an NZMT code has not yet been mapped to an interaction substance code (mart-id)

##### Medications [Optional]

The full medication resource for each submitted NZMT code is returned in the Bundle.  These are provided for convenience and provide traceability around which MP(s) are associated with the given medication.

##### Concept Map [Optional]

A partial [concept map](https://hl7.org/fhir/R4B/conceptmap.html) is provided detailing the mapping between NZMT MPs and their associated Martindale Ids.  If a MP has not yet been mapped to a Martindale Id then there will be no codes listed.  However, if a MP has attempted to be mapped by the NZF but no appropriate Martindale Id was determined then this is recorded as Unmatched in the Concept Map resource.

```
{
  "resourceType": "ConceptMap",
  "id": "9f0ab0a4-5068-4616-b923-9ec3ff7a69da",
  "status": "draft",
  "group": [
    {
      "source": "http://nzmt.org.nz",
      "target": "http://rpharms.com/mart-id",
      "element": [
        {
          "code": "46125321000116100",
          "target": [
            {
              "code": "20322-a",
              "equivalence": "inexact",
              "comment": "As the NZF and Stockley's medicines are derived from different terminology sets a direct 1:1 mapping is always not appropriate. NZF interactions are always associated at MP level, whereas MartIDs range from individual substances through to therapeutic group, therefore there may be a many:many relationship."
            },
            {
              "code": "21229-g",
              "equivalence": "inexact",
              "comment": "As the NZF and Stockley's medicines are derived from different terminology sets a direct 1:1 mapping is always not appropriate. NZF interactions are always associated at MP level, whereas MartIDs range from individual substances through to therapeutic group, therefore there may be a many:many relationship."
            },
            {
              "code": "22631-n",
              "equivalence": "inexact",
              "comment": "As the NZF and Stockley's medicines are derived from different terminology sets a direct 1:1 mapping is always not appropriate. NZF interactions are always associated at MP level, whereas MartIDs range from individual substances through to therapeutic group, therefore there may be a many:many relationship."
            },
            {
              "code": "24730-x",
              "equivalence": "inexact",
              "comment": "As the NZF and Stockley's medicines are derived from different terminology sets a direct 1:1 mapping is always not appropriate. NZF interactions are always associated at MP level, whereas MartIDs range from individual substances through to therapeutic group, therefore there may be a many:many relationship."
            },
            {
              "code": "9021-f",
              "equivalence": "inexact",
              "comment": "As the NZF and Stockley's medicines are derived from different terminology sets a direct 1:1 mapping is always not appropriate. NZF interactions are always associated at MP level, whereas MartIDs range from individual substances through to therapeutic group, therefore there may be a many:many relationship."
            },
            {
              "code": "9043-v",
              "equivalence": "inexact",
              "comment": "As the NZF and Stockley's medicines are derived from different terminology sets a direct 1:1 mapping is always not appropriate. NZF interactions are always associated at MP level, whereas MartIDs range from individual substances through to therapeutic group, therefore there may be a many:many relationship."
            }
          ]
        },
        {
          "code": "20006751000116107",
          "target": [
            {
              "equivalence": "unmatched"
            }
          ]
        }
      ]
    }
  ]
}
```

##### Clinical Use Definitions (Interactions)

A profile for interactions is provided [here](./StructureDefinition-NzfInteractionClinicalUseDefinition.html) - Draft/Work in progress

#### Interactions Of

Takes a NZMT Id (MP, TP, MPP, TPP, MPUU, TPUU or CTPP) and returns the Stockley's interactions for that given id

##### Parameters

**nzmtid**: fhir string - which is a NZMT Code for any of the following concepts (MP, TP, MPP, TPP, MPUU, TPUU or CTPP)
**includeMedicationAndConceptMap**: boolean - which indicates whether the medication and concept maps should be included in the returned bundle

GET [base]/Medication/$interactions-of?nzmtId=10037191000116105&includeMedicationAndConceptMap=true

#### Interactions Between - All

Takes two or more NZMT Ids (MP, TP, MPP, TPP, MPUU, TPUU or CTPP) and returns the Stockley's interactions between those NZMT Ids

##### Parameters

**nzmtid**: fhir strings - one or more NZMT Codes from any of the following concepts (MP, TP, MPP, TPP, MPUU, TPUU or CTPP)

**includeMedicationAndConceptMap**: boolean - which indicates whether the medication and concept maps should be included in the returned bundle

**filterComplementaryRecords**: boolean - when true complementary clinical use definitions are filtered out.  These records are when an interaction is the same except the subject and interactant are reversed.

**Note - if a single nzmt id is supplied then the interactions between check will return any interactions between the components of that medication (if there are multiple components mapped to martindale ids)**

[HttpPost]
POST [base]/Medication/$interactions-between
content-type: application/json
```
{
  "resourceType": "Parameters",
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

**Note - if a nzmt id is supplied as both the focussed id and as the only nzmt id in the list then the interactions between check will include any interactions between the components of that medication (if there are multiple components mapped to martindale ids)**

[HttpPost]
POST [base]/Medication/$interactions-between
content-type: application/json
```
{
  "resourceType": "Parameters",
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
### Operation outcomes

The API will return Operation Outcomes at times.  It is important that these are checked and understood.  

If an error bundle is returned then there should be an operation outcome explaining the cause of this.  This could be due to failed validation on input parameters for example.

Other reasons for these include (but not exclusive to):

- Warning - An Mp has not been mapped and therefore is not included in the results.
- Warning - A given medication has no MP link and therefore is not included in the results.
- Warning - An unknown parameter is supplied to the API


### Associated Code Systems

There are four associated code system definitions which are available via the FHIR server.

- https://pharmaceuticalpress.com/ns/stockleys-interaction-action-code:  This contains the details of the Action codes used in the CUD extension.
- https://pharmaceuticalpress.com/ns/stockleys-interaction-severity-code: This contains the details of the Severity codes used in the CUD extension.
- https://pharmaceuticalpress.com/ns/stockleys-interaction-warning-code: This contains the details the Warning codes used in the CUD extension.
- https://pharmaceuticalpress.com/ns/stockleys-interaction-evidence-code: This contains the details of the Evidence codes used in the CUD extension


### Usage and display recommendation

Details to follow

### FAQ

#### Why can we not just search for interactions via the normal FHIR search operations?

Due to licencing requirements of the interactions data, we cannot provide a full download of all of our source data via the clinical use definitions. These therefore need to be provided via an API on a per medication basis.

#### Why include the medication and concept map resources in the response?

The medication and concept maps resources are optionally included in the reponse (defaulting to be included).  The reason for this is that it provides full tracibility to the mapping process.