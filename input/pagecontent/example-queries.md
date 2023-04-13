### Example queries

WIP - the intention of this page is to detail common use cases, ranging from the simple retrieval of resources to best practice for using that data (e.g. for interactions checking etc.)

#### Medications


Get a list of all medications
>[base]/Medication

Get a specific medication based on sctid
>[base]/Medication/44282231000116104

Get a specific medication based on sctid via code - returns a bundle
>[base]/Medication?code=44282231000116104

Get a specific medication based on sctid via Pharmacode® (only applies to CTPPs) - returns a bundle
>[base]/Medication?code=393924

Get a specific medication based on sctid via GTIN - returns a bundle
>[base]/Medication?code=https://www.gs1.org/gtin|09322838012989

Get medications that have been updated since 1 Apr 2021 (can be useful for maintaining a local cache)
>[base]/Medication?_lastUpdated=gt2021-04-01


Get list of medications that contain ibuprofen (MP)
>[base]/Medication?nzf-related-medication=10013251000116106

Get list of medications that contain ibuprofen (substance)
>[base]/Medication?ingredient-code=2211011000036101

Get list of all active medications (based on the formulary criteria - see [mappings for criteria](./mapping.html) )
>[base]/Medication?status=active

Get list of medication based on nzmt type
>[base]/Medication?nzf-nzmt-type=mpuu
>[base]/Medication?nzf-nzmt-type=https://standards.digital.health.nz/ns/nzmt-type-code&#124;mpuu

Get a medication with the nzf-link document references included (this can be used to retrieve the references to the available monographs)
>[base]/Medication?code=10346001000116101&_include=Medication:nzf-link

Search for a medication based on part of the preferred term (other string based search options can be used on this search parameter)
>[base]/Medication?nzf-preferred-term:contains=purified

Search for a CTPP medication based on part of the preferred term (other string based search options can be used on this search parameter)
>[base]/Medication?nzf-preferred-term:contains=purified&nzf-nzmt-type=ctpp

Get list of medications based on related medications
>[base]/Medication?nzf-related-medication=10044651000116102

Get a list of TPUUs based on related medications (MPUU)
>[base]/Medication?_elements=code&nzf-related-medication=10044651000116102&nzf-nzmt-type=tpuu

Get list of available pharmac schedules
>[base]/Basic/metadata

Get list of all funded medications (either Community or HML) for the given schedule date
>[base]/Medication?_sort=nzf-preferred-term&_summary=text&nzf-funding-schedule-date=2023-04-12

Get a list of all prescribe by brand medications
>[base]/Medication?nzf-prescribe-by-brand=true

Get a list of all prescribe by brand MPUU medications
>[base]/Medication?nzf-prescribe-by-brand=true&nzf-nzmt-type=mpuu

Get a list of all prescribe by brand MPP medications
>[base]/Medication?nzf-prescribe-by-brand=true&nzf-nzmt-type=mpp

Get a list of all medications that have current pharmac supply information
>[base]/Medication?nzf-supply-information-type:missing=false

Get a list of all unapproved medications (section 29)
>[base]/Medication?nzf-unapproved=true

#### Document references

To get a list of all types of document references then they can be filtered by type e.g.

[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;[Code]

Get a list of all NZF monographs (Adult monographs)
>[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;AdultMonograph
>[base]/DocumentReference?type=AdultMonograph

Get a list of all NZFC monographs (Child monographs)
>[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;ChildMonograph
>[base]/DocumentReference?type=ChildMonograph

Get a list of medications that are contained in a monograph
>[base]Medication?nzf-link-type=DocumentReference/a8e50e23-773a-46d5-8f38-544b0dc89857&_elements=code

Get a list of all Datasheets
>[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;Datasheet
>[base]/DocumentReference?type=Datasheet

Get a list of all CMIs
>[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;CMI
>[base]/DocumentReference?type=CMI

Get a list of all Patient Information Leaflets
>[base]/DocumentReference?type=https://standards.digital.health.nz/ns/nzf-document-type-code&#124;PIL
>[base]/DocumentReference?type=PIL

Get a Patient Information Leaflet for a given MP (this includes all document references - these will need to be filtered on return)
>[base]/Medication?code=10037191000116105&_include=Medication:nzf-link