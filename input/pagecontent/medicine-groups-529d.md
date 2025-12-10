## **DRAFT** Medicine Groups Proposal - SUBJECT TO CHANGE

The NZ Formulary currently provides support for medicine groups via the older webservice.  The older webservice is being phased out and being replaced by this newer FHIR API.

### Background

#### Medicine Groups
There are three types of medicine group: allergy, pharmacological, and therapeutic.

The allergy groups are alert groups. They contain medicines where if you have an allergic reaction to one member of the group, then you are likely to have an allergic reaction to any other member of the group.

The pharmacological groups are alert groups. They contain medicines available in NZ with common pharmacological properties which would have common dose related adverse effects and under most circumstances it would not be rational (in some cases unsafe) for two or more members to be prescribed concurrently.

The therapeutic groups are non-alerting. They group medicines according to similar therapeutic use or broader pharmacological properties. This is not a disease-level therapeutic classification, but a use-level: e.g. vasodilator, or antiviral. Being non-alerting means they are not intended for use as the basis for alerts, although they can be used to organise alerts and reports.

Not all medicines belong in a group. If a medicine does not belong to any group, then all warnings and alerts based on the medicine will be restricted to the substance or brand level.

**Note**: It is not necessary for an end user to differentiate between an allergy alert group and a pharmacological group. These are both alert groups and the distinction is mechanistic and to some extent arbitrary; often the distinction between allergy alert group and pharmacological alert group is not clear cut.  An alert informs the user that the drug is a member of a group of drugs for which another member has led to an event in that patient. This information will inform the prescriber as to whether a drug is safe to prescribe.

**Example** (note - data is representative only)


![Example Medicine Group](medicine-groups-example.png)

### Definitions

**Warning**—a piece of persistent information containing a caution for future health interventions

**Alert**—the display of a warning at the time of making or planning a health intervention, produced by a clinical decision support system
Alerts can be
1.	Interruptive—typically an alert box that is drawn over the background of the workflow screen, and requires a specific action to confirm and remove it, often a mouse click
2.	Workflow—typically in a frame that is part of the workflow screen, visible, but requiring no specific action 
3.	On demand—typically in a report that is specifically requested by the user, for example, a poly-pharmacy safety report, an interactions report, a CVD risk assessment report

**Overalerting**—when too many alerts are delivered, resulting in clinicians either missing important alerts, or disabling the alert facility altogether

**Drug group alerting**—a method for generating alerts based on the clinician recording a warning using the drug group as causative agent 
For example, a patient responds to propranolol with severe hypotension and the prescriber wants to create a warning that will raise an alert whenever another beta-blocker is prescribed. The causative agent is the beta-blocker group and this must be selected from a list of drug groups. In the future a prescriber might write a prescription for carvedilol 12.5 mg tablets, the trigger product. The trigger product is checked for membership of the causative agent group. In this case it is checked for membership of the beta-blocker group. The alert is created because carvedilol 12.5 mg tablet is a member of the beta-blocker group.

**Common group alerting**—a method for generating alerts based on the clinician recording a warning using the medicine as causative agent

For example, a patient responds to propranolol with severe hypotension and the prescriber wants to create an alert that will be raised whenever another beta-blocker is prescribed. The causative agent is propranolol hydrochloride 40 mg tablet, the prescribing term. In the future a prescriber is writing a prescription for carvedilol 12.5 mg tablets, the trigger product. The trigger product and the causative agent are checked for any common group membership. The alert is created because propranolol hydrochloride 40 mg tablet and carvedilol 12.5 mg tablet are both members of the beta blocker group. Note that the clinician did not record the group (class), but only the specific medicine causing the adverse reaction.
Common group alerting can be augmented by placing alert restrictions. These can restrict alerts to 
(a)	causative agent and trigger product common membership at substance or brand level 
(b)	trigger product membership of specific groups, substances or brands.
This allows placing a broad warning with unrestricted alerts when the adverse reaction is first noticed and there is uncertainty about its true nature or causality, and then reducing the risk of overalerting by adding alert restrictions over time as more information is obtained.
Common group alerting requires that the medicine groups are created to reflect the pharmacological and immunological properties of the medicines in a clinically appropriate way. The benefits of appropriate alerts and the negative effects of overalerting need to be taken into consideration in the design of the groups.
 Common group alerting can also be used for duplicate therapy checking.

**Drug pair alerting**—a method for generating alerts based on a database of alert messages containing an individual message for each individual drug-drug pair
For example, a patient on simvastatin is prescribed erythromycin. This drug pair is found in the interaction alert database and an alert is generated.  

### Overview

The NZF supports both drug group alerting and common group alerting for allergy and adverse reaction alerts. Common group alerting is supported for duplicate therapy checking. Drug pair alerting is supported for interaction checking.

Although both drug group alerting and common group alerting are supported, the medicine group tables have been developed with common group alerting in mind. Common group alerting is our preferred method as the user does not have to think about selecting the group and there is no risk of selecting an incorrect group.

The use cases in this document have been developed to help with the design of both a health warning system and a set of recommendations for delivering allergy and adverse reaction alerts based on these warnings.

The use cases are constructed using common group alerting with the option of placing alert restrictions.

The use cases relate to allergies and adverse reactions to medicines only. Other allergies and adverse reactions are not covered here (e.g. food, dust, pollen); neither are interactions.
The warnings given as examples here are largely based on OpenEHR archetype Adverse Reaction, HISO 10041.1 Medications Lists Draft v0.2, and the HQSCNZ National Medication Chart http://www.hqsc.govt.nz/our-programmes/medication-safety/projects/national-medication-chart/ .
The flow of warnings and alerts is illustrated in figure 1, below.

![alt text](medicine-groups-1.png)


### API Support

THE NZF/NZULM FHIR API provides support for Medicine Groups.  

This support comes in the form of two custom FHIR [Operations](https://hl7.org/fhir/R4B/operations.html).  The first takes one or more NZMT medication codes and returns a list of medicine groups that each code belongs to.  The second takes two lists of NZMT medication codes, a foreground and background list, and returns a list of medication pairs where one of the pair comes from the foreground medicines, one from the background medicines, and both belong to the same group

These custom operations should provide a level of familiarity with the existing webservice calls.

### Custom Operations

#### Group membership

Takes one or more NZMT Ids and returns a list of medicine groups that each nzmt id is in.

All NZMT Ids need to be within the following concepts  - MP, TP, MPP, TPP, MPUU, TPUU or CTPP.

##### Parameters

**nzmtid**: fhir strings - one or more NZMT Codes from any of the following concepts (MP, TP, MPP, TPP, MPUU, TPUU or CTPP)

```
POST [base]/Medication/$medicine-groups-membership
content-type: application/json

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
    }
  ]
}
```

The output from a request is in the form of parameters.  

```
member:
parts:
  medicine: 1..1 - NZMT Id CodeableConcept from request list
  group: 1..* - Medicine Group CodeableConcept
    parts:
      groupLevel: The level of the group
```


```
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "member",
      "part": [
        {
          "name": "medicine",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10048271000116101",
                "display": "atenolol"
              }
            ],
            "text": "atenolol"
          }
        },
        {
          "name": "group",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "1820011000036108",
                "display": "atenolol"
              }
            ],
            "text": "atenolol"
          },
          "part": [
            {
              "name": "groupType",
              "valueCodeableConcept": {
                "coding": [
                  {
                    "system": "http://nzmt.org.nz",
                    "display": "substance"
                  }
                ],
                "text": "substance"
              }
            },
            {
              "name": "groupLevel",
              "valueInteger": 1
            }
          ]
        },
        {
          "name": "group",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10042431000166107",
                "display": "beta blocker, selective"
              }
            ],
            "text": "beta blocker, selective"
          },
          "part": [
            {
              "name": "groupType",
              "valueCodeableConcept": {
                "coding": [
                  {
                    "system": "http://nzmt.org.nz",
                    "display": "pharmacological"
                  }
                ],
                "text": "pharmacological"
              }
            },
            {
              "name": "groupLevel",
              "valueInteger": 2
            }
          ]
        },
        {
          "name": "group",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10055311000166101",
                "display": "beta-blocker"
              }
            ],
            "text": "beta-blocker"
          },
          "part": [
            {
              "name": "groupType",
              "valueCodeableConcept": {
                "coding": [
                  {
                    "system": "http://nzmt.org.nz",
                    "display": "pharmacological"
                  }
                ],
                "text": "pharmacological"
              }
            },
            {
              "name": "groupLevel",
              "valueInteger": 3
            }
          ]
        }
      ]
    }
  ]
}
```

#### Common membership

Takes one or more foreground NZMT Ids and one or more background NZMT Ids.  

Returns a list of medicine pairs where one of the pair comes from the foreground medicines, one from the background medicines, and both belong to the same group. Used to check whether a common group alert needs to be raised. The warnings/adverse reactions for a patient are the background, and the medicines being prescribed are the foreground. It can also be used for focussed duplicate therapy checking with the patient's current medications as the background and the medicines being prescribed as foreground.


All NZMT Ids need to be within the following concepts  - MP, TP, MPP, TPP, MPUU, TPUU or CTPP.

##### Parameters

**nzmtid**: fhir strings - one or more NZMT Codes from any of the following concepts (MP, TP, MPP, TPP, MPUU, TPUU or CTPP)

```
POST [base]/Medication/$medicine-groups-commonmembership
content-type: application/json

{
  "resourceType": "Parameters",
    "parameter": [ 
    {
      "name": "foreground-nzmtid",
      "valueString": "10159631000116101"
    },
    {
      "name": "background-nzmtid",
      "valueString": "10226361000116105"
    }
  ]
}
```

The output from a request is in the form of parameters.  

```
pair:
parts:
  foreground: 1..1 - NZMT Id CodeableConcept from Foreground list
  background: 1..1 - NZMT Id CodeableConcept from Background list
  group: 1..1 - Medicine Group CodeableConcept
    parts:
      groupLevel: The level of the group
```

For example, a request with foreground-nzmtid 10159631000116101 and background-nzmtid 10226361000116105 will return a result similar to this:

```
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "pair",
      "part": [
        {
          "name": "foreground",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10159631000116101",
                "display": "clarithromycin 250 mg tablet"
              }
            ],
            "text": "clarithromycin 250 mg tablet"
          }
        },
        {
          "name": "background",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10226361000116105",
                "display": "erythromycin (as ethylsuccinate) 400 mg tablet"
              }
            ],
            "text": "erythromycin (as ethylsuccinate) 400 mg tablet"
          }
        },
        {
          "name": "group",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10002311000166104",
                "display": "macrolide antibiotic"
              }
            ],
            "text": "macrolide antibiotic"
          },
          "part": [
            {
              "name": "groupType",
              "valueCodeableConcept": {
                "coding": [
                  {
                    "system": "http://nzmt.org.nz",
                    "display": "pharmacological"
                  }
                ],
                "text": "pharmacological"
              }
            },
            {
              "name": "groupType",
              "valueCodeableConcept": {
                "coding": [
                  {
                    "system": "http://nzmt.org.nz",
                    "display": "allergy"
                  }
                ],
                "text": "allergy"
              }
            },
            {
              "name": "groupLevel",
              "valueInteger": 2
            }
          ]
        }
      ]
    },
    {
      "name": "pair",
      "part": [
        {
          "name": "foreground",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10159631000116101",
                "display": "clarithromycin 250 mg tablet"
              }
            ],
            "text": "clarithromycin 250 mg tablet"
          }
        },
        {
          "name": "background",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10226361000116105",
                "display": "erythromycin (as ethylsuccinate) 400 mg tablet"
              }
            ],
            "text": "erythromycin (as ethylsuccinate) 400 mg tablet"
          }
        },
        {
          "name": "group",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10003161000166108",
                "display": "macrolide"
              }
            ],
            "text": "macrolide"
          },
          "part": [
            {
              "name": "groupType",
              "valueCodeableConcept": {
                "coding": [
                  {
                    "system": "http://nzmt.org.nz",
                    "display": "therapeutic"
                  }
                ],
                "text": "therapeutic"
              }
            },
            {
              "name": "groupLevel",
              "valueInteger": 3
            }
          ]
        }
      ]
    }
  ]
}
```

##### OperationOutcome

An OperationOutcome is included in the bundle if there is an error or a warning.  

An error will occur if any of the NZMT codes are not valid or not recognised.


