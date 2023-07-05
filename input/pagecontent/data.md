

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

In order to identify what type of NZMT concept a particular medicine is there is an extension call nzfNzmtType.  This not only allows for concept identification but there is also a custom search parameter which allows for retrieval based on a particular type.

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

Extension - <a href="./StructureDefinition-nzf-nzmtType.html">NzmtType extension</a>

Valueset - https://nzhts.digital.health.nz/fhir/ValueSet/nzmt-type-code 

Custom search parameter - <a href="./notes.html#custom-search-parameters">see details</a>

### Status

#### Examples

**FHIR Data**

```
"status": "inactive",
```


### Concept relationships

### NZMT Descriptions

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



