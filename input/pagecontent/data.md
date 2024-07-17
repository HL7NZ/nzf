The aim of this page is to detail all the data items available from this API.  For each there should be a brief description of the data along with details on how it be retrieved and used.  Most of these apply to medication resources but some also use other FHIR resource types (Substance, DocumentReference).  


### NZMT Medicine code

All medication resources have a unique NZMT ID (see <a href="./nzmt-datamodel.html#nzmt-id-details">NZMT Data model - ID details</a>).  This is used as the ID for a medication as well as being the first code listed in the medication.code

#### Usage details

**Example FHIR Data**
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

The simplest way to retrieve an individual medicine resource is via the id from any level of the NZMT hierarchy
>[base]/Medication/44282231000116104

Medications are also available via the code field which returns a bundle
>[base]/Medication?code=http://nzmt.org.nz&#124;44282231000116104

#### Related Artifacts

Definition - <a href="./StructureDefinition-NzfMedication-definitions.html#Medication.code">Medication code definition</a>

### NZMT Concept Type

In order to identify what type of NZMT concept a particular medicine is there is an extension call nzf-nzmt-type.  This not only allows for concept identification but there is also a custom search parameter which allows for retrieval based on a particular type.

The types allowed are - mp, mpp, mpuu, tp, tpp, tpuu, ctpp

Note - NZMT substances are also available but these use the Substance resource and not the medication resource.

#### Usage details

**Example FHIR Data**
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

MP, TP, MPP, TPP, MPUU, TPUU and substances are deemed inactive if they are either duplicates, known to be obsolete, replaced by another entry (possibly due to error) or products that have been rebranded.

A CTPP medication is deemed active if it is not deemed obsolete (as above) and at least one of the following criteria is met:
- Has some level of community funding or HML funding for any of the schedules associated with the medication (i.e. current or future)
- Is an unapproved (i.e. section 29)
- Has no medsafe nzmt link
- Medsafe status is either "Active" or "Under Assessment" and Medsafe regSituation is either "Consent given" or "Provisional consent"

#### Usage details

**Example FHIR Data**

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
    <td>MP<br/>TPP<br/>TPUU<br/>MPUU<br/>TP (via TPP)</td>
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

#### Usage details

**Example FHIR Data**

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

Each medication has a preferred term and a fully specified name description.

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

#### Prescribing Terms

The Prescribing Terms description now has entries at the MPUU, MPP, TPUU and TPP level.  These entries are designed to provide a standard shorter abbreviation (200 characters instead of 1000 characters) for lengthy Preferred Terms.  While the field is 200 characters in length, in practice we have reduced the length of Prescribing Terms to 120 characters.  Where a Prescribing Term exists, we expect it to be used as a display term in preference to the Preferred Term in prescribing systems.  In the absence of a generic Prescribing Term, where a shortened name is needed, the MPUU PT is to be used.

Note that an MPUU or MPP record that has the prescribe-by-brand flag set does not have a generic Prescribing Term and the MPUU or MPP PreferredTerm should not be used as a generic Prescribing Term.  For these generics, the Trade Prescribing Term is the only Prescribing Term to be used.

#####	Sort Names

The Sort Names description now has entries at the CTPP and MPUU level.  These entries are designed to support sorting the text Preferred Terms into ascending order by strength and unit dose.  They have only been added where required, and where they do not exist the Preferred Term is used to sort for text-based sorting of the records.  Note that the sort we use includes the dose form as a separate element and so the Sort Name is intended only to provide the correct ascending sequence for a given dose form.

#####	Synonyms

The Synonyms description now has entries at the MP and substance level.  These entries are designed to support searching for alternate names for medicines and so are currently only found at MP and substance level.

#####	Dispensing Terms

The Dispensing Term descriptions come in two types: 80-character Label Names and 40-character Label Names.  These two description types now have entries at the MPUU, MPP, TPUU, TPP and CTPP level (as of release 2.8.6.0).  These entries are designed to provide a standard shorter abbreviation (80 and 40 characters instead of 1000 characters) for lengthy Preferred Terms.  In practice we have limited the 80-character terms to 76 characters and the 40-character terms to 36 characters to enable vendors to prefix the label with the number of units of use and suffix the label with a plural if required.  All Dispensing Terms are singular to allow for consistency in their application.

Unlike the Prescribing Terms, we have included Dispensing Terms for ‘virtual’ CTPP records.  These are necessarily at CTPP level and are effectively trade dispensing terms.

Note that the ‘prescribe_by_brand’ flag at MPUU or MPP level does not affect Dispensing Terms.  All products that are not virtual CTPPs should have generic Dispensing Terms.

#####	Charting Terms

The Charting Terms description now has entries at the MPUU, MPP, TPUU and TPP level.  These entries are designed to provide a standard shorter abbreviation (160 characters instead of 1000 characters) for lengthy Preferred Terms.  These terms were specifically intended for use in hospital electronic charting systems.  Where a Charting Term exists, we expect it to be used as a display term in preference to the Preferred Term in such systems.  In the absence of a generic Prescribing Term, where a shortened name is needed, the MPUU PT is to be used.

Note that unlike the Prescribing Term an MPUU or MPP record that has the prescribe-by-brand flag set does have a generic Charting Term and the MPUU or MPP PreferredTerm should be used as a generic Charting Term where required.  Another variation from the Preferred Term and the Prescribing is that the trade Charting Terms do not include details of the generic ingredients of the product.

#####	LBL160 Terms

Hospital clinicians were concerned about the level of abbreviation in the LBL80 label terms where these were used for internal hospital labels.  Accordingly, we now provide an LBL160 label which has dose forms (for example) no longer abbreviated as a matter of course.  These label terms are designed to provide a standard shorter abbreviation (160 characters instead of 1000 characters) for lengthy Preferred Terms for use in hospital pharmacy systems.
Note that an MPUU or MPP record that has the prescribe-by-brand flag set still has a generic LBL160 Term.

#####	Tallman Lettering Terms

There are three terms intended to provide alternate descriptions using Tallman Lettering, as recommended by the Health Quality and Safety Commission.  There are alternates to the Preferred Term, the Prescribing Term and the Charting Term, and are intended to allow for safer selection of medicine through the use of the Tallman Lettering convention. For substance, MP and TP the alternate TallMan terms are all alternates to the PreferredTerm.  For MPUU, TPUU, MPP and TPP the alternate TallMan terms are alternates to the Charting Term and the Prescribing Term.

#####	CVX Vaccine IDs

This term is the American CVX vaccine code. This alternate description exists to provide an additional method of searching for specific vaccines. More than one code may be present for a given NZMT record. These codes are linked to MP and TP records.


These descriptions are added to each medication resource via the nzf-description extension.  This extension contains two fields, firstly the type of the description and secondly the description term.

There is also a custom search parameter on the preferred-term allowing for normal FHIR search based expressions - [see FHIR search documentation](https://hl7.org/fhir/R4B/search.html#string)

#### Usage details

**Example FHIR Data**

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

The manufactured dose form is added to MPUU and TPUUs.  

#### Usage details

**Example FHIR Data**

```
form": {
    "coding": [
      {
        "system": "http://nzmt.org.nz",
        "code": "147011000036100",
        "display": "powder"
      }
    ]
  }
```

**Examples Queries**

Get medications that have a form of 'powder'

>[base]/Medication?form=147011000036100

#### Related Artifacts

Definition - [Medication form](https://build.fhir.org/ig/HL7NZ/nzf/branches/main/StructureDefinition-NzfMedication-definitions.html#Medication.ingredient)

### Ingredients

The majority of medications resources have their ingredients listed.  The exceptions to this are those that do not have known active medicinal ingredients, typical examples being medicinal devices and special foods.

Each ingredient listed is a NZMT substance and where possible a strength is provided.  The ingredients listed are derived from the list of substances assigned to a given MP.  Therefore if a medication resource has multiple MPs, each of the substances for each of the MPs will be listed.  This means that it is possible to have duplicated substances for certain concepts in the Medication hiearchy.

Strength information is determined at an MPUU level and assigned to the given ingredient substances (from the MP).  Once again this means that some NZMT concepts that have multiple MPUUs will sometimes have repeated ingredients, at the same or varying strengths.

Both MP and TP concepts do not have strength information but will have ingredients listed where possible.

Medications regularly have 'alternate strength representation' which are a piece of text used where the ingredient strength is expressed in a form that does not fit into a numerator/denominator pattern or does not include any of the unit dose forms used in the NZMT e.g. 1 in 10,000, 10%.  These are also added as an extension to the strength field where applicable.

Background:  For those familar with the original NZMT dataset the strength information is derived from the NZMT MPUUSAI records (hence the MPUU level).  The difference with these records is that these aren't always assigned to a MPUU/MP Substance as they could be assigned at a salt level.  Considerable work as been done to match these records to the associated MPUU/MP Substance however if the base/salt ingredient from the MPUUSAI record does differ from the MPUU/MP Substance record then an extension is added to the strength field, specifying this substance.  See below for an example.

#### Usage details

**Example FHIR Data**

cilazapril 1 mg tablet (mpuu) ingredient field


```
 "ingredient": [
    {
      "itemCodeableConcept": {
        "coding": [
          {
            "system": "http://nzmt.org.nz",
            "code": "10000191000116103",
            "display": "cilazapril"
          }
        ]
      },
      "isActive": true,
      "strength": {
        "numerator": {
          "value": 1,
          "unit": "mg",
          "system": "http://nzmt.org.nz",
          "code": "99011000036109"
        }
      }
    }
  ]
  ```

Nurofen Cold & Flu With Decongestant tablet: film-coated, 24 tablets, blister pack (ctpp) ingredients

  ```
  "ingredient": [
    {
      "itemCodeableConcept": {
        "coding": [
          {
            "system": "http://nzmt.org.nz",
            "code": "2211011000036101",
            "display": "ibuprofen"
          }
        ]
      },
      "isActive": true,
      "strength": {
        "numerator": {
          "value": 200,
          "unit": "mg",
          "system": "http://nzmt.org.nz",
          "code": "99011000036109"
        }
      }
    },
    {
      "extension": [
        {
          "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-specific-substance",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "2526011000036108",
                "display": "pseudoephedrine hydrochloride"
              }
            ],
            "text": "pseudoephedrine hydrochloride"
          }
        }
      ],
      "itemCodeableConcept": {
        "coding": [
          {
            "system": "http://nzmt.org.nz",
            "code": "2525011000036101",
            "display": "pseudoephedrine"
          }
        ]
      },
      "isActive": true,
      "strength": {
        "numerator": {
          "value": 30,
          "unit": "mg",
          "system": "http://nzmt.org.nz",
          "code": "99011000036109"
        }
      }
    }
  ]
  ```

  **Examples Queries**

Get medications that have pseudoephredrine as an ingredient

>[base]/Medication?ingredient-code=http://nzmt.org.nz&#124;2525011000036101

Get MPUU medications that have pseudoephredrine as an ingredient

>[base]/Medication?ingredient-code=http://nzmt.org.nz&#124;2525011000036101&nzf-nzmt-type=mpuu

#### Related Artifacts

Definition - [Medication ingredients](https://build.fhir.org/ig/HL7NZ/nzf/branches/main/StructureDefinition-NzfMedication-definitions.html#Medication.ingredient)

[TODO] Add nzf-specific-substance and alternate strength extension details

### Substances

As mentioned above all ingredients are listed as NZMT substances.  All NZMT substances are available via the Substance FHIR resource.  These contain minimal data but do have their status flag set, active or inactive.  

#### Usage details

**Example FHIR Data**

```
{
    "resourceType": "Substance",
    "id": "47575401000116106",
    "meta": {
        "versionId": "1",
        "lastUpdated": "2023-06-18T20:54:06.17+00:00"
    },
    "status": "active",
    "code": {
        "coding": [
            {
                "system": "http://nzmt.org.nz",
                "code": "47575401000116106",
                "display": "amivantamab"
            }
        ]
    }
}
```

**Examples Queries**

Get a list of all substances

>[base]/Substance

#### Related Artifacts

Definition - [FHIR Substance definition](https://hl7.org/fhir/R4B/substance.html)

### Prescribe by brand

Some generic medications should, for safety reasons, be prescribed by brand and have no generic prescribing term. Medicines appearing in this extension are defined by the application of the Health Quality and Safety Commission’s Specify Brand Advice Guidance rules.

These are indicated via the nzf-prescribe-by-brand extension and is set to true when this applies.  There is also a custom search parameter available to allow for searching via this extension.

#### Usage details

**Example FHIR Data**

```
{
    "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-prescribe-by-brand",
    "valueBoolean": true
}
```

**Examples Queries**

Get a list of all prescribe-by-brand medications

>[base]/Medication?nzf-prescribe-by-brand=true

#### Related Artifacts

Extension - [nzf-prescribe-by-brand extension](StructureDefinition-nzf-prescribe-by-brand.html)

Custom search parameter - <a href="./notes.html#custom-search-parameters">see details</a>


### Unapproved medications

NB: section 29 medicines are medicines covered by the Medicines Act that have not been granted formal consent to distribute by Medsafe. They are supplied under the compassionate use provisions of Section 29 of the Medicines Act

These are indicated via the nzf-unapproved extension and is set to true when this applies.  This extension applies to Medications at the CTPP level.  There is also a custom search parameter available to allow for searching via this extension.

#### Usage details

**Example FHIR Data**

```
{
    "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-unapproved",
    "valueBoolean": true
}
```

**Examples Queries**

Get a list of all unapproved medications

>[base]/Medication?nzf-unapproved=true

#### Related Artifacts

Extension - [nzf-unapproved extension](StructureDefinition-nzf-unapproved.html)

Custom search parameter - <a href="./notes.html#custom-search-parameters">see details</a>


### Anatomical Therapeutic Chemical (ATC) Classification Codes

CTPP, TPP, TPUU, MPP, MPUU and MP medications can be linked to one or more ATC codes.  

Note that not all medications are linked.  There are, for example a number of items in the NZMT that simply don’t have an ATC code (particularly in the area of devices) because they do not fall within the coverage of the ATC system.  In addition, we chose not to add an ATC link to the MPUU and TPUU records for inert substances (diluents and similar) to avoid the potential for user confusion.

This is modelled via the nzf-atc code extension.

#### Usage details

**Example FHIR Data**

```
{
    "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-atc",
    "valueCodeableConcept": {
    "coding": [
        {
        "system": "http://www.whocc.no/atc",
        "code": "N02BE01",
        "display": "Paracetamol"
        }
    ],
    "text": "Paracetamol"
    }
}
```

**Examples Queries**

Get a list of medications with the paracetamol ATC code

>[base]/Medication?nzf-atc=N02BE01

#### Related Artifacts

Extension - [nzf-atc extension](StructureDefinition-nzf-atc.html)

Valueset - http://www.whocc.no/atc

Custom search parameter - <a href="./notes.html#custom-search-parameters">see details</a>


### GTINs

GTINs are GS1 Global Trade Identification Numbers. They are the most common type of barcode / number found on all kinds of products.

GS1 regulations require a new GTIN every time the product formulation or packaging changes, so there may be more than one GTIN for a given CTPP (physical product pack), in which case there will be a code for each GTIN. 

These code(s) are added as codes in the medication code field

#### Usage details

**Example FHIR Data**

```
"code": {
    "coding": [
      {
        "system": "http://nzmt.org.nz",
        "code": "50066481000117107",
        "display": "Paracetamol (Amcal) orange 250 mg/5 mL oral liquid: suspension, 200 mL, bottle"
      },
      {
        "system": "https://www.gs1.org/gtin",
        "code": "09403092340084"
      }
    ]
  }
```

**Examples Queries**

Get a medication based on its GTIN code

>[base]/Medication?code=https://www.gs1.org/gtin&#124;09403092340084

#### Related Artifacts

Valueset - https://www.gs1.org/gtin

### SNOMED CT Mappings

Where applicable mappings and are available the NZMT MPs have been mapped to SNOMED CT MP Products.  

These codes are added as a code in the medication code field alongside the NZMT code and any other applicable code.

#### Usage details

**Example FHIR Data**

```
"code": {
    "coding": [
      {
        "system": "http://nzmt.org.nz",
        "code": "10037191000116105",
        "display": "paracetamol"
      },
      {
        "system": "http://snomed.info/sct",
        "code": "90332006",
        "display": "Product containing paracetamol (medicinal product)"
      }
    ]
  }
```

**Examples Queries**

Get a medication based on its SNOMED CT code

>[base]/Medication?code=http://snomed.info/sct&#124;90332006

Get all medications that have a SNOMED CT code assigned

>[base]/Medication?code=http://snomed.info/sct&#124;

### Legal Classifications

Legal classifications, provided by Medsafe, are primarily added to CTPPs via the nzf-legalclass extension.  However, for convenience, the legal classification extension is also added to TPUU and MPUU where all the related CTPPs have the same legal classification.

See [here for a list of possible values](CodeSystem-medicine-classification-code.html)

Note - Medsafe also provide classifications at the substance level.  This has been added against MPs where applicable using the nzf-legalclass extension.  

Note that products unmapped to Medsafe (and therefore not considered registered) should only use this MP/Substance classification data where the classification is as a ‘Controlled Drug’ - as the Misuse of Drugs Act is separate from the Medicines Act and applies regardless of whether the sponsor has registered the product or not. Any other classification (General Sale, Prescription etc) requires the product to be registered and so these classifications are not appropriate to be used for unregistered products.


#### Usage details

**Example FHIR Data**

CTPP (MPUU/TPUU) level
```
{
    "extension": [
    {
        "url": "code",
        "valueCodeableConcept": {
        "coding": [
            {
            "system": "https://standards.digital.health.nz/ns/medicine-classification-code",
            "code": "PO"
            }
        ],
        "text": "Pharmacy only"
        }
    }
    ],
    "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-legalclass"
}
```


MP level 
```
{
      "extension": [
        {
          "url": "substance",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://nzmt.org.nz",
                "code": "2442011000036104"
              }
            ],
            "text": "paracetamol"
          }
        },
        {
          "url": "classification",
          "valueCodeableConcept": {
            "text": "Prescription"
          }
        },
        {
          "url": "conditions",
          "valueString": "<strong>except</strong> when specified elsewhere in this schedule"
        }
      ],
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-legalclass"
    }
```

#### Related Artifacts

Extension - [nzf-legalclass extension](./StructureDefinition-nzf-legalclass.html)

Valueset - [Definition](./ValueSet-medicine-classification-code.html) 

### NZF Pack details

NZF Pack details based on linked NZMT TPUU (Trade Product Unit of Use) details are added to CTPPs via the nzf-pack extension.  

#### Usage details

**Example FHIR Data**

CTPP level
```
{
  "extension": [
    {
      "url": "nzmtMedicineCode",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://nzmt.org.nz",
            "code": "10491491000116107"
          }
        ]
      }
    },
    {
      "url": "quantity",
      "valueQuantity": {
        "value": 12,
        "unit": "tablet",
        "system": "http://nzmt.org.nz",
        "code": "63011000036109"
      }
    },
    {
      "url": "size",
      "valueQuantity": {
        "value": 1,
        "unit": "tablet",
        "system": "http://nzmt.org.nz",
        "code": "63011000036109"
      }
    }
  ],
  "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-pack"
}
```


### Monographs / Monograph Links

Every monograph in the both the Adult and Childrens formularies has a DocumentReference.  These references contain a url link to the respective monographs on the nzf.org.nz and nzfchildren.org.nz websites. 

Every medication that is contained in a monograph, both adults and children has a link to its associated monograph(s).  This is done via the nzf-link extension which links to the DocumentReference(s) for the monograph.

#### Usage details

**Example FHIR Data**

Url contained in monograph document reference

```
  "content": [
    {
      "attachment": {
        "url": "https://nzfchildren.org.nz/nzfc_2439",
        "title": "paracetamol"
      }
    }
  ]
```

Link contained in medication resource

```
{
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-link",
      "valueReference": {
        "reference": "DocumentReference/8b9466cb-ebe8-4526-bd8a-6ba092630525",
        "identifier": {
          "system": "https://standards.digital.health.nz/ns/nzf-monograph-code",
          "value": "nzf_2439"
        },
        "display": "nzf_2439"
      }
    },
    {
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-link",
      "valueReference": {
        "reference": "DocumentReference/1421eb52-b576-4f14-a837-d35303b13982",
        "identifier": {
          "system": "https://standards.digital.health.nz/ns/nzf-monograph-code",
          "value": "nzf_9575"
        },
        "display": "nzf_9575"
      }
    }
```

**Example Queries**

Get a list of all NZF monographs (Adult monographs)

>[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;AdultMonograph 

Get a list of all NZFC monographs (Child monographs)

>[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;ChildMonograph 

Get a list of medications that are contained in a monograph

>[base]Medication?nzf-link=DocumentReference/a8e50e23-773a-46d5-8f38-544b0dc89857&_elements=code

Get a Medication including its associated document references in the returned bundle.  Once returned the nzf/c monograph urls can be extracted.

[base]/Medication?code=10037191000116105&_include=Medication:nzf-link

#### Related Artifacts

Extension - [nzf-link extension](./StructureDefinition-nzf-link.html)

Valueset - [Definition](./ValueSet-medicine-classification-code.html) 

### Medsafe details

Aside from the legal classification information explained above there is also a number of additional pieces of medsafe information provided.  These are added to CTPPs where the data exists.  These are:

- Status:  Medsafe Package status (e.g. Active)
- Registration Situation: Medsafe registration situation (e.g. Consent Given, Discontinued, Not marketed)
- Route of Administration: (e.g. Oral) - can be multiple
- CMI links: These are links to Consumer Medicine Information documents 
- Datasheet links: These are links to Datasheets

#### Usage details

**Example FHIR Data**

```
{
      "extension": [
        {
          "url": "status",
          "valueCodeableConcept": {
            "text": "Active"
          }
        },
        {
          "url": "regSituation",
          "valueCodeableConcept": {
            "text": "Consent given"
          }
        },
        {
          "url": "administrationRoute",
          "valueCodeableConcept": {
            "text": "Oral"
          }
        }
      ],
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-medsafe"
    }
```

#### Related Artifacts

Extension - [nzf-medsafe extension](./StructureDefinition-nzf-medsafe.html)

Extension - [nzf-link extension](./StructureDefinition-nzf-link.html)


### Subsidy Information

Subsidy information is added to Containered Trade Product Packs where applicable.  The funding information is derived from both the PHARMAC community schedule as well as the HML.

There are two extensions added that store this information.  The first is **nzf-funding**.  This stores the general information around funding for a specific product, such as price, subsidy and for community schedules, the claim unit (further description pending) - [see extension details for more information](./StructureDefinition-nzf-funding.html).  To cater for the existence of multiple schedules this extension can be added to a product multiple times, once per schedule (i.e. the current schedule and an upcoming (draft) schedule).

To make it easy to determine which schedules are available we provide a metadata resource.  This lists the available schedules on the dataset at any given time.  This allows vendors to see both the current schedule information as well as an upcoming schedule between the release of the Schedule for the coming month and the end of the calendar month.  To determine which set of information to use the 'scheduleDate' field can be used.  The second extension is **nzf-funding-rule**.  This extension once again has a schedule date so vendors can determine which schedule they would like to look at.  The purpose of this extension is to provide the PHARMAC funding rules that apply to the given product.  

A funding rule consists of the following data:

- schedule date: The applicable schedule date of the rule
- type: The type of schedule that the rule applies, i.e. HML or Community
- ruleType: The type of rule (see below for full list)
- ruleAttribute: A rule dependant attribute
- ruleValue: A rule dependant value 
- ruleText: This is a derived text based on the rule details.
- ruleAdditionalData:  This is a piece of XML which is provided by pharmac - this for example can contain the MathML for Special Authority forms.  See below.
- ruleWaiver:  see below
- ruleXlinkHref: see below

####	Waivers

This rule is an amendment to other rules and is identified by a value in the waiver field.  It may modify any of the rules below.  In the July 2023 Pharmaceutical Schedule there are waivers on some instances of the FormMax, FormWt, TreatMax and SubRxF rules.

Where any rule has a waiver = ‘Special’, each applicable medicine has an additional text after the rule text of ‘can be waived by Special Authority’.  The SA Form Id will be populated in RuleXlinkHref field.

Where any rule has a waiver = ‘SubRxF’, each applicable medicine has an additional text after the rule text of ‘can be waived by endorsement’.
Where any rule has a waiver = ‘SpecEnd’, each applicable medicine has an additional text after the rule text of ‘can be waived by endorsement – Retail Pharmacy – Specialist’.

####	Rule Additional Data

In both 'Special' and 'Restricted' rules the ruleAdditionalData field is populated with Request XML.

Each request contains one Title element and one or more Case elements.  Within each case element, there will be a math block detailing the conditions of the case, plus one or more applicant elements and a Term element.

#### Funding rules

There are a large number of funding rule types in the data.  Below is a list of all the rule types in the data as at Jul 2023.

##### Alternate

Indicates that there are circumstances in which an alternate level of subsidy applies

*NB: the Special Authority system requires the prescriber to obtain permission (a special  authority) to subsidise a medicine before initiating therapy.  The system is used to ensure the medicine is only prescribed for patients meeting defined clinical criteria.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Alternate</td>
      <td></td>
      <td>Endorsement</td>
      <td></td>
      <td></td>
      <td>Higher subsidy with Endorsement.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>Alternate</td>
      <td></td>
      <td>Special Authority</td>
      <td></td>
      <td></td>
      <td>Higher subsidy with Special Authority.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### Brand Switch Fee

Indicates that a Brand Switch Fee is payable

*NB: the Brand Switch Fee allows pharmacists to be reimbursed for time spent advising patients on the impact of impending changes to subsidised medicines.  For charging purposes these Fees have been issued with specific pharmacodes but they are Fees only, not medicines.  The text, however, is attached to the original medicine for which the fee can be charged.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Brandswitch</td>
      <td></td>
      <td>[Specific product involved, e.g. Noumed Phenobarbitone]</td>
      <td></td>
      <td>[e.g. A35]</td>
      <td>Brand Switch Fee payable.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### Combined

Each applicable medicine has an additional text of ‘Only in combination’.

*NB: This means that the medicine is only subsidised if prescribed in combination with another subsidised medicine.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Combined</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Only in combination.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### Contraceptive

Not displayed

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Contraceptive</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
   </tbody>
</table>

##### Controlled

Each applicable medicine has an additional text of ‘Only on a Controlled Drug form’.

*NB: Controlled Drugs are medicines which may be abused and are addictive.  Their management is governed by the Misuse of Drugs Act and regulations which requires them to be prescribed on special prescription forms.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Controlled</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Only on a Controlled Drug form.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### CostBrandSource

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>CostBrandSource</td>
      <td>costbrandsource</td>
      <td></td>
      <td></td>
      <td></td>
      <td>CBS</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### Dispensary

*NB: some medicines may only be dispensed by hospital pharmacies or community pharmacies holding specific Te Whatu Ora contract variations which permit them to dispense these medicines.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Dispensary</td>
      <td></td>
      <td>HP3</td>
      <td></td>
      <td></td>
      <td>Hospital Pharmacy HP3.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>Dispensary</td>
      <td></td>
      <td>HP4</td>
      <td></td>
      <td></td>
      <td>Hospital Pharmacy HP4.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>Dispensary</td>
      <td></td>
      <td>Xpharm</td>
      <td></td>
      <td></td>
      <td>Hospital Pharmacy (Xpharm)</td>
      <td></td>
    </tr>        
   </tbody>
</table>

##### DoseDMax

A restrictions on the amount of medicine to be supplied per day

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>DoseDMax</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>No more than [value] [units] per day. [e.g. No more than 2 dose per day.]</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### DoseSWt

A restrictions on the amount of medicine to be supplied per dose

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>DoseSWt</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>No more than [ps_rule.value] mg per dose. [e.g. No more than 100 mg per dose.]</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### DoseWMax

A restrictions on the amount of medicine to be supplied per week

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>DoseWMax</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>No more than [value] [units] per week. [e.g. No more than 1 patch per week.]</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### DoseMMax, DoseMWt, DoseSMax, DoseWWt

These are similar restriction rules to above which could be used but are not in the current dataset.

##### DVLimit

*This means either the national or individual limit placed on a particular pharmaceutical with Hospital Supply Status.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HML</td>
      <td>DVLimit</td>
      <td>value</td>
      <td>[e.g. DV Sep-22 to 2025]</td>
      <td></td>
      <td></td>
      <td>[value]% DV [attribute] - [e.g. 5% DV Sep-22 to 2025]</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### FormBan

Each applicable medicine has an additional text ‘Not on a [attribute]’.  

*NB: this rule allows prescribing of a medicine to be restricted to particular prescription form types.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HML</td>
      <td>FormBan</td>
      <td></td>
      <td>[populated, July 2023 dataset only has BSO used]</td>
      <td></td>
      <td></td>
      <td>Not on a BSO.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### FormMax

Where the waiver = ‘Special’ then 'Can be waived by Special Authority' is appended to the rule text.

*NB:  This allows for quantities to be limited when prescribed on a particular form type.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>FormMax</td>
      <td></td>
      <td>PSO</td>
      <td></td>
      <td></td>
      <td>Up to [value] [units] available on a PSO. [e.g. Up to 5 tab available on a PSO.]</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>FormMax</td>
      <td></td>
      <td>Rx</td>
      <td></td>
      <td></td>
      <td>Maximum of [value] [units] per prescription. [e.g. Maximum of 130 g per prescription.]</td>
      <td></td>
    </tr>    
   </tbody>
</table>

##### FormReqd

*NB: this rule allows prescribing of a medicine to be restricted to particular prescription form type.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>FormReqd</td>
      <td></td>
      <td>Rx</td>
      <td></td>
      <td></td>
      <td>Only on a prescription.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>FormReqd</td>
      <td></td>
      <td>PSO</td>
      <td></td>
      <td></td>
      <td>Only on a PSO.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>FormReqd</td>
      <td></td>
      <td>QEC</td>
      <td></td>
      <td></td>
      <td>Only on a Quitcard.</td>
      <td></td>
    </tr>         
   </tbody>
</table>

##### FormWt

Where the waiver = ‘Special’ then 'Can be waived by Special Authority' is appended to the rule text.

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>FormWt</td>
      <td></td>
      <td>PSO</td>
      <td></td>
      <td></td>
      <td>Maximum of [ps_rule.value] mg per PSO.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>FormMax</td>
      <td></td>
      <td>Rx</td>
      <td></td>
      <td></td>
      <td>Maximum of [value] mg per prescription. [e.g. Maximum of 500 mg per prescription.  Can be waived by Special Authority.]</td>
      <td></td>
    </tr>    
   </tbody>
</table>

##### Hospital Supply Status

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HML</td>
      <td>HospitalSupplyStatus</td>
      <td></td>
      <td>HSS</td>
      <td></td>
      <td></td>
      <td>Hospital Supply Status.</td>
      <td></td>
    </tr> 
   </tbody>
</table>

##### MaxCoPayment

Where the value = ‘0’, each applicable medicine has an additional text of ‘No patient co-payment payable’.
Where the value > ‘0’, each applicable medicine has an additional text of ‘Maximum patient co-payment payable: $[ps_rule.value]’.

*NB: CoPayments are charges the patient must pay for a subsidised medicine..*


<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>MaxCoPayment</td>
      <td></td>
      <td>0</td>
      <td></td>
      <td></td>
      <td>No patient co-payment payable.</td>
      <td></td>
    </tr> 
    <tr>
      <td>Community</td>
      <td>MaxCoPayment</td>
      <td></td>
      <td>value</td>
      <td></td>
      <td></td>
      <td>Maximum patient co-payment payable: $[value] [e.g. Maximum patient co-payment payable: $5]</td>
      <td></td>
    </tr>     
   </tbody>
</table>

##### NotCombined

*NB: This means a medicine is not subsidised if prescribed as a compound with other ingredients.*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>NotCombined</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Not in combination.</td>
      <td></td>
    </tr>     
   </tbody>
</table>

##### Note

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community, HML</td>
      <td>Note</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>[HTML from schedule]</td>
      <td></td>
    </tr>     
   </tbody>
</table>

##### Original Pack

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>OriginalPack</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Original Pack.</td>
      <td></td>
    </tr>     
   </tbody>
</table>

##### PCT

Where the ps_rule.attribute is blank, each applicable medicine has an additional text of ‘PCT’.

Where the ps_rule.attribute is ‘only’, each applicable medicine has an additional text of ‘PCT only’.

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>PCT</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Pharmaceutical Cancer Treatment.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>PCT</td>
      <td></td>
      <td>only</td>
      <td></td>
      <td></td>
      <td>Pharmaceutical Cancer Treatment only.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### ProvAllow

Each applicable medicine has an additional text of ‘Eligible for a subsidy by a Pharmacist’.

Products with this rule are usually accompanied by a ps_note record reading ‘Note: Direct Provision by a pharmacist permitted under the provisions in Part I of Section A.’

*NB: This rule allows community pharmacists to provide subsidised product to patients without the patient needing a prescription. It is designed to remove access barriers for emergency contraception and smoking cessation therapy.*


<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>ProvAllow</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Eligible for a subsidy by a Pharmacist.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### Principal Supply Status

[TODO]

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community, HML</td>
      <td>pss</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Principal Supply Status</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### ProvReqd

Not currently in use in the xml version of the Pharmaceutical Schedule.

##### Repeat

This Rule Type is not printed.

##### Restricted

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HML</td>
      <td>Restricted</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>HML Restriction.</td>
      <td>Request XML</td>
    </tr>
   </tbody>
</table>

##### RFPP

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>RFPP</td>
      <td>value</td>
      <td></td>
      <td></td>
      <td></td>
      <td>The maximum quantity ordered on a PSO for providers in the Rheumatic Fever Prevention Programme (RFPP) may be up to [value] times the maximum quantity . The PSO must specify the order quantity in course-specific amounts to enable the pharmacy to dispense each course separately.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### SafetyListMedicine

[TODO]

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>SafetyListMedicine</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Safety medicine; prescriber may determine dispensing frequency</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### Section29

*NB: section 29 medicines have not been granted formal consent to distribute by Medsafe.  They are supplied under the compassionate use provisions of Section 29 of the Medicines Act*

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Section29</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Unapproved medicine supplied under Section 29</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### SoleSupply

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>SoleSupply</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Sole Subsidised Supply</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### SpecEnd

If the ps_rule.attribute of this rule is ‘Retail’ each applicable medicine has an additional text of ‘Retail pharmacy - Specialist’.

If the ps_rule.attribute of this rule is ‘Hospital’ or blank each applicable medicine has an additional text of ‘Specialist’.

The waiver field can be populated and this adjusts the rule text.

*NB: This means that a medicine is only subsidised if prescribed by a specialist or endorsed as being recommended  by a specialist.*


<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>SpecEnd</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Specialist.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>SpecEnd</td>
      <td></td>
      <td>Hospital</td>
      <td></td>
      <td></td>
      <td>Specialist.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>SpecEnd</td>
      <td></td>
      <td>Retail</td>
      <td></td>
      <td></td>
      <td>Retail pharmacy – Specialist.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### SpecOnly

Not currently used

*NB:  This means that the medicine is only subsidised if prescribed by a specialist.*

##### Special

Each applicable medicine has an additional text ‘Special Authority see [ps_rule.sa_form] below’.

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Special</td>
      <td></td>
      <td>Subsidy</td>
      <td></td>
      <td>Special Authority Form Id [e.g. SA2229]</td>
      <td>Special Authority</td>
      <td>[The request xml, including MathML]</td>
    </tr>
    <tr>
      <td>Community</td>
      <td>Special</td>
      <td></td>
      <td>Price</td>
      <td></td>
      <td>Special Authority Form Id [e.g. SA2229]</td>
      <td>Additional subsidy by Special Authority</td>
      <td>[The request xml, including MathML]</td>
    </tr>    
   </tbody>
</table>

##### Statim

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Statim</td>
      <td></td>
      <td>Must</td>
      <td></td>
      <td></td>
      <td>Statim: Three months or six months, as applicable, dispensed all-at-once.</td>
      <td></td>
    </tr>
    <tr>
      <td>Community</td>
      <td>Statim</td>
      <td></td>
      <td>May</td>
      <td></td>
      <td></td>
      <td>Statim: Three months supply may be dispensed at one time if endorsed ‘certified exemption’ by the prescriber.</td>
      <td></td>
    </tr>
   </tbody>
</table>


##### SubRxF

Each applicable medicine has an additional text ‘Subsidy by Endorsement’.

PHARMAC’s convention in the Pharmaceutical Schedule is to print the related note describing the endorsement conditions (present in div tag on the Schedule describing prescription conditions) after all applicable medicines.

The waiver field can be populated and this adjusts the rule text.

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>SubRxF</td>
      <td></td>
      <td>Must</td>
      <td></td>
      <td></td>
      <td>Subsidy by Endorsement.</td>
      <td></td>
    </tr>
   </tbody>
</table>

##### TreatWt

Not currently in use in the xml version of the Pharmaceutical Schedule.

##### Wastage

Each applicable medicine has an additional text ‘Wastage rule applies’.

<table class="table table-bordered">
  <thead>
    <tr>
      <td>Type</td>
      <td>Rule Type</td>
      <td>Value</td>
      <td>Rule Attribute</td>
      <td>Rule Waiver</td>
      <td>Rule XlinkHref</td>
      <td>Rule Text</td>
      <td>Rule Additional Data</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Community</td>
      <td>Wastage</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>Wastage rule applies</td>
      <td></td>
    </tr>
   </tbody>
</table>


#### Usage Details

**Example FHIR Data**
```
{
    "resourceType": "Basic",
    "id": "metadata",
    "extension": [
        {
            "extension": [
                {
                    "url": "date",
                    "valueDate": "2023-07-01"
                },
                {
                    "url": "type",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "system": "https://standards.digital.health.nz/ns/nzf-funding-type",
                                "code": "community",
                                "display": "community"
                            }
                        ],
                        "text": "community"
                    }
                },
                {
                    "url": "id",
                    "valueString": "929"
                }
            ],
            "url": "pharmacSchedule"
        },
        {
            "extension": [
                {
                    "url": "date",
                    "valueDate": "2023-07-01"
                },
                {
                    "url": "type",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "system": "https://standards.digital.health.nz/ns/nzf-funding-type",
                                "code": "hml",
                                "display": "hml"
                            }
                        ],
                        "text": "hml"
                    }
                },
                {
                    "url": "id",
                    "valueString": "927"
                }
            ],
            "url": "pharmacSchedule"
        }
    ],
    "code": {
        "text": "metadata"
    }
}
```

**Example Queries**

Get the API metadata, which includes the schedule details.

> [base]/Basic/metadata

Get all medications that have funding information for the given schedule data.

> [base]/Medication?nzf-funding-schedule-date=2023-07-01

Get all medications that have funding rules for the given schedule data.

> [base]/Medication?nzf-funding-rule-schedule-date=2023-07-01


#### Related Artifacts

Extension - [nzf-funding extension](./StructureDefinition-nzf-funding.html)

Extension - [nzf-funding-rule extension](./StructureDefinition-nzf-funding-rule.html)

### Pharmacode<sup>®</sup>

Where applicable Pharmacodes® are added to CTPP resources.

These codes are added as a code in the medication code field alongside the NZMT code and any other applicable code.

A primary pharmacode is indicated via the nzf-is-primary-coding extension (shown below) and older codes are also added where applicable.

Note - the code system used for Pharmacode<sup>®</sup> is https://standards.digital.health.nz/ns/pharmac-subsidy-code.  The reason for this is that on occassion a new code can be created by PHARMAC for generic funding purposes.  

#### Usage details

**Example FHIR Data**

```
"coding": [
      {
        "system": "http://nzmt.org.nz",
        "code": "50059891000117106",
        "display": "Nurofen Cold & Flu With Decongestant tablet: film-coated, 24 tablets, blister pack"
      },
      {
        "system": "https://www.gs1.org/gtin",
        "code": "05000167010886"
      },
      {
        "extension": [
          {
            "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-is-primary-coding",
            "valueBoolean": true
          }
        ],
        "system": "https://standards.digital.health.nz/ns/pharmac-subsidy-code",
        "code": "270180"
      }
    ]
```

**Examples Queries**

Get a medication based on Pharmacode® 

>[base]/Medication?code=https://standards.digital.health.nz/ns/pharmac-subsidy-code&#124;270180

Get all medications that have a Pharmacode® assigned

>[base]Medication?code=https://standards.digital.health.nz/ns/pharmac-subsidy-code&#124;

### Pharmac Supply Information

Pharmac provide details on supply issues, discontinuations, and brand changes associated with Pharmac funded medicines.  These are applied at any of the main NZMT concept levels.

#### Usage details

**Example FHIR Data**
```
{
      "extension": [
        {
          "url": "type",
          "valueCodeableConcept": {
            "text": "Supply"
          }
        },
        {
          "url": "duration",
          "valueCodeableConcept": {
            "text": "Permanent"
          }
        },
        {
          "url": "solution",
          "valueString": "No replacement"
        },
        {
          "url": "action",
          "valueString": "Prescribing action"
        },
        {
          "url": "title",
          "valueString": "Cilazapril: No new patients from 1 May 2021"
        },
        {
          "url": "date",
          "valueDateTime": "2021-03-11T00:00:00+13:00"
        },
        {
          "url": "information",
          "valueString": "Cilazapril funded access will be for existing patients only from 1 April 2021 in hospitals and from 1 May 2021 in the community"
        },
        {
          "url": "url",
          "valueUrl": "https://pharmac.govt.nz/medicine-funding-and-supply/medicine-notices/cilazapril/"
        }
      ],
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-supply-information"
    }
```

**Example Queries**

To get a list of all the medications with pharmac supply information.

> [base]/Medication?nzf-supply-information-type:missing=false

#### Related Artifacts

Extension - <a href="./StructureDefinition-nzf-supply-information.html">nzf-supply-information extension</a>

Custom search parameter - <a href="./notes.html#custom-search-parameters">see details</a>

### Cautionary and Advisory Labels (CALs)

Cautionary Advisory Labels provide brief, important information for patients. Medicines dispensed by pharmacies usually include this information within their labelling or as a supplementary yellow label. Additional comments provide practical advice on how to take the medicine. [FROM BPAC]

CALs are assigned at an MPUU level and are provided for medications via the nzf-cal extension.  This extension is added to applicable MPUUs but is also added to MPP, TPP and CTPPs via their associated MPUUs.

#### Usage details

**Example FHIR Data**

```
{
          "url": "id",
          "valueId": "155"
        },
        {
          "url": "labelType",
          "valueString": "comment"
        },
        {
          "url": "text",
          "valueString": "Maximum dose 4g paracetamol daily (adults)."
        }
      ],
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-cal"
    }
```

### Patient information leaflets

The New Zealand contains or links to a number of Patient Information Leaflets. 

Each of these Patient Information leaflets is referenced by a DocumentReference resource.  A patient information contains links to PDFs which can have varying page sizes (A4,A5) and can potentially be in English or Te Reo.

A patient information leaflet can potentially also have more information around its context, for example, the dose form it applies to.  See the extension definition for more details.

#### Usage details

**Example FHIR Data**

Document reference content, detailing urls, page size and language.

```
 "content": [
    {
      "attachment": {
        "extension": [
          {
            "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-page-size",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://standards.digital.health.nz/ns/nzf-page-size-code",
                  "code": "A4",
                  "display": "A4"
                }
              ],
              "text": "A4"
            }
          }
        ],
        "contentType": "application/pdf",
        "language": "en-NZ",
        "url": "http://www.mymedicines.nz/home/sheet/Paracetamol?format=pdfA4&inline=true",
        "title": "Paracetamol"
      }
    },
    {
      "attachment": {
        "extension": [
          {
            "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-page-size",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://standards.digital.health.nz/ns/nzf-page-size-code",
                  "code": "A5",
                  "display": "A5"
                }
              ],
              "text": "A5"
            }
          }
        ],
        "contentType": "application/pdf",
        "language": "en-NZ",
        "url": "http://www.mymedicines.nz/home/sheet/Paracetamol?format=pdfA5&inline=true",
        "title": "Paracetamol"
      }
    },
    {
      "attachment": {
        "extension": [
          {
            "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-page-size",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://standards.digital.health.nz/ns/nzf-page-size-code",
                  "code": "A4",
                  "display": "A4"
                }
              ],
              "text": "A4"
            }
          }
        ],
        "contentType": "application/pdf",
        "language": "mi",
        "url": "https://mymedicines.nz/TeReo/NZF/Paracetamol.pdf",
        "title": "Paracetamol"
      }
    }
  ],
  "context": {
    "extension": [
      {
        "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-pil-source",
        "valueCodeableConcept": {
          "text": "MyMedicine"
        }
      },
      {
        "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-pil-formulary",
        "valueCodeableConcept": {
          "text": "NZF"
        }
      }
    ]
  }
```

Link contained in medication resource

```
    {
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-link",
      "valueReference": {
        "reference": "DocumentReference/aa21fb13-46c5-4ebe-93cf-3bbfb4da68a3",
        "display": "Patient Information Leaflet"
      }
    }
```

**Example Queries**

Get a list of all NZF monographs (Adult monographs)

>[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;PIL 

Get a Medication including its associated document references in the returned bundle.  Once returned these can be used to extract the PIL urls.

[base]/Medication?code=10037191000116105&_include=Medication:nzf-link

#### Related Artifacts

Extension - <a href="./StructureDefinition-nzf-link.html">nzf-link extension</a>

### Medication Sponsor

Medication sponsor details are added to TPs using an Organization resource reference in the nzf-medication-sponsor extension.  

#### Usage details

**Example FHIR Data**

TP level
```
{
  "extension": [
    {
      "url": "http://hl7.org.nz/fhir/StructureDefinition/nzf-medication-sponsor",
      "resourceReference": [
          {
            "reference": "Organization/48441981000116107",
            "display": "48441981000116107"
          }
        ]
    }
  ]
}
```
