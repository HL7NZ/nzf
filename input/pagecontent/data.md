

**DRAFT**
### Core NZMT Data

A medication resource is available for each of the seven main NZMT concepts.  See NZMT data model for more details.


#### Medicine code

All medication resources have a unique NZMT ID (see <a href="./nzmt-datamodel.html#nzmt-id-details">NZMT Data model - ID details</a>).  This is used as the ID for a medication as well as being the first code listed in the medication.code

##### Examples

The simplist way to retrieve an individual medicine resource is via the id
>[base]/Medication/44282231000116104

Medications are also available via the code field which returns a bundle
>[base]/Medication?code=http://nzmt.org.nz|44282231000116104

##### Related Artifacts
<a href="./StructureDefinition-NzfMedication-definitions.html#Medication.code">Medication code definition</a>
#### Concept Type

#### Status

#### Concept relationships

#### Descriptions

#### Form

#### Ingredients

#### Substances

#### Prescribe by brand

#### Unapproved medications

#### ATC Codes

#### GTINs

#### SNOMED CT Mappings

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

#### pharmacodes

### Pharmac Supply Information

### Cautionary and Advisory Labels (CALs)

### Patient information leaflets



