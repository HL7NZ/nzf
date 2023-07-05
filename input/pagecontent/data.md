

**DRAFT**

A medication resource is available for each of the seven main NZMT concepts.  See NZMT data model for more details.


### NZMT Medicine code

All medication resources have a unique NZMT ID (see <a href="./nzmt-datamodel.html#nzmt-id-details">NZMT Data model - ID details</a>).  This is used as the ID for a medication as well as being the first code listed in the medication.code

#### Examples

**FHIR data**
```
"code": {
    "coding": [
      {
        "system": "http://nzmt.org.nz",
        "code": "10037191000116105",
        "display": "paracetamol"
      }
    ]
  }
```

**Example Queries**

The simplist way to retrieve an individual medicine resource is via the id
>[base]/Medication/44282231000116104

Medications are also available via the code field which returns a bundle
>[base]/Medication?code=http://nzmt.org.nz|44282231000116104

#### Related Artifacts

Definition - <a href="./StructureDefinition-NzfMedication-definitions.html#Medication.code">Medication code definition</a>

### NZMT Concept Type

In order to identify what type of NZMT concept a particular medicine is there is an extension call nzf-nzmt-type.  This not only allows for concept identification but there is also a custom search parameter which allows for retrieval based on a particular type.

The types allowed are - mp, mpp, mpuu, tp, tpp, tpuu, ctpp

#### Examples

**FHIR data**
```
{
    "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-nzmt-type",
    "valueCodeableConcept": {
    "coding": [
        {
        "system": "https://standards.digital.health.nz/ns/nzmt-type-code",
        "code": "mp"
        }
    ]
    }
}
```

**Example Queries**

To retrieve all MPUUs using the custom search parameter (nzf-nzmt-type)
>[base]/Medication?nzf-nzmt-type=https://standards.digital.health.nz/ns/nzmt-type-code&#124;mpuu

Note - it is possible to query without the system but for performance reasons it is not recommended
>[base]/Medication?nzf-nzmt-type=mpuu

#### Related Artifacts

Extension - <a href="./StructureDefinition-nzf-nzmtType.html">nzf-nzmt-type extension</a>

Valueset - https://nzhts.digital.health.nz/fhir/ValueSet/nzmt-type-code 

Custom search parameter - <a href="./notes.html#custom-search-parameters">see details</a>

### Status

MP, TP, MPP, TPP, MPUU, TPUU and substances are deemed inactive if they are either duplicates, known to be obsolete, replaced by another entry (possibly due to error) or products that have been rebranded

A CTPP medication is deemed active if it is not deemed obsolete (as above) and the following criteria is met:
- Has some level of community funding or HML funding for any of the schedules associated with the medication (i.e. current or future)
- Is unapproved (i.e. section 29)
- Has no medsafe nzmt link
- Medsafe status is either "Active" or "Under Assessment" and Medsafe regSituation is either "Consent given" or "Provisional consent"

#### Examples

**FHIR Data**

```
"status": "inactive",
```

**Examples Queries**

To get a list of all 'active' CTPPs 

>[base]/Medication?status=active&nzf-nzmt-type=ctpp

To get a list of all 'active' MPUUs 

>[base]/Medication?status=active&nzf-nzmt-type=mpuu

To get a list of all 'active' Substances

>[base]/Substance?status=active

#### Related Artifacts

Definition - <a href="./StructureDefinition-NzfMedication-definitions.html#Medication.status">Medication status definition</a>

### Concept relationships

As explained in the <a href="./nzmt-datamodel.html">NZMT data model</a> the various NZMT concepts have various relationships to each other.  To model these relationships there is a extension called nzf-related-medication and a related custom search parameter.  This models the direct relationships, as shown in the datamodel, and also has some convenience links as well.  

All medications will have one or more nzf-related-medication links to its applicable MPs.

<p>The following table shows the related medications for each concept</p>
<table class="table table-bordered">
<tr>
<td>Concept</td>
<td>Related medications</td>
</tr>
<tr>
    <td>CTPP</td>
    <td>MP<br/>TPP</td>
</tr>
<tr>
    <td>MPP</td>
    <td>MP<br/>MPUU (1 or more)</td>
</tr>
<tr>
    <td>MPUU</td>
    <td>MP<br>MPP (1 or more)</td>
</tr>
<tr>
    <td>TPP</td>
    <td>MP<br/>TP<br/>TPUU (1 or more)<br/>MPP</td>
</tr>
<tr>
    <td>TPUU</td>
    <td>MP<br/>TP<br>TPP (1 or more)<br>MPUU</td>
</tr>
</table>

These relationships can be used after retrieving individual medication resources or for queries via the custom search parameter 

#### Examples

**FHIR Data**

```
{
      "extension": [
        {
          "url": "code",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10037191000116105",
                "display": "paracetamol"
              }
            ],
            "text": "paracetamol"
          }
        },
        {
          "url": "type",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "https://standards.digital.health.nz/ns/nzmt-type-code",
                "code": "mp"
              }
            ]
          }
        }
      ],
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-related-medication"
    },
    {
      "extension": [
        {
          "url": "code",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "10527591000116101"
              }
            ]
          }
        },
        {
          "url": "type",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "https://standards.digital.health.nz/ns/nzmt-type-code",
                "code": "mpp"
              }
            ]
          }
        }
      ],
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-related-medication"
    }
```

**Examples Queries**

To get a list of all medications that are related to a given MP

>[base]/Medication?nzf-related-medication=10013251000116106

This can be limited further - for example the following query gives all the Ibuprofen mpuu's.

>[base]/Medication?nzf-related-medication=10013251000116106&nzf-nzmt-type=mpuu

#### Related Artifacts

Extension - <a href="./StructureDefinition-nzf-related-medication.html">nzf-related-medication extension</a>
Custom search parameter - <a href="./notes.html#custom-search-parameters">see details</a>

### NZMT Descriptions

Each medication always have a preferred term and a fully specified name description.

A description is a text expression related to a Concept ID.  Each of these descriptions has a SNOMED CT description ID of its own, in addition to the SNOMED CT Concept ID to which it is related.  The primary descriptions are the FullySpecifiedName and PreferredTerm but this table includes other variant Terms or names for a substance or product.  There are number of types of descriptions including Label Names, Pharmac-specific names and Prescribing Terms (see 3.5.7 for more details).

These may exist for a number of reasons. For example, some substances have very long names (Preferred Terms) but a label on a bottle only has room for 40 characters, so an alternate name of type “label” may need to be created. This would be done by a pharmacist, and would involve sensibly condensing a long name down to something that it still precise and meaningful in 40 characters or less. This will usually involve the use of common abbreviations.

There are number of possible descriptions in addition to the FullySpecifiedName and PreferredTerm including: 
- Label names (up to 40, 80 and 160 characters long)
- Blister pack names (12 characters long)
- Pharmac-specific names
- Prescribing Terms (up to 200 characters long)
- Charting Terms (up to 100 characters long)
- Synonyms (up to 1000 characters long)
- CVX vaccine identifiers (up to 20 characters long)

These descriptions are added to each medication resource via the nzf-description extension.  This extension contains two fields, firstly the type of the description and secondly the description term.

There is also a custom search parameter on the preferred-term allowing for normal FHIR search based expressions - [see FHIR search documentation](https://hl7.org/fhir/R4B/search.html#string)

#### Examples

**FHIR Data**

```
{
      "extension": [
        {
          "url": "type",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "20069041000116103",
                "display": "Label name (80)"
              }
            ],
            "text": "Label name (80)"
          }
        },
        {
          "url": "term",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "44578011000116118",
                "display": "paracetamol powder"
              }
            ],
            "text": "paracetamol powder"
          }
        }
      ],
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-description"
    }
```

**Examples Queries**

Search for a medication based on part of the preferred term

>[base]/Medication?nzf-preferred-term:contains=purified

Search for a CTPP medication based on part of the preferred term

>[base]/Medication?nzf-preferred-term:contains=purified&nzf-nzmt-type=ctpp

#### Related Artifacts

Extension - <a href="./StructureDefinition/nzf-description.html">nzf-related-medication extension</a>
Custom search parameter - <a href="./notes.html#custom-search-parameters">see details</a>

### Form

### Ingredients

### Substances

### Prescribe by brand

### Unapproved medications

### ATC Codes

### GTINs

### SNOMED CT Mappings

### Legal Classifications
<!---
Note that products unmapped to Medsafe (and therefore not considered registered) should only use this classification table where the classification is as a ‘Controlled Drug’ - as the Misuse of Drugs Act is separate from the Medicines Act and applies regardless of whether the sponsor has registered the product or not. Any other classification (General Sale, Prescription etc) requires the product to be registered and so these classifications are not appropriate to be used for unregistered products.
--->
### Monograph Links

### Medsafe details

#### Status

#### Registration Situation

#### Route of Administration

#### Datasheets/CMIs

### Subsidy Information
<!--- remember basic metadata object --->
#### pharmacodes

### Pharmac Supply Information

### Cautionary and Advisory Labels (CALs)

### Patient information leaflets



