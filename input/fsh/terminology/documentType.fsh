ValueSet: NzfDocumentType
Id: nzf-document-type
Title: "NZF Document Type"
Description: "New Zealand Formulary Document Type"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/nzf-document-type"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* codes from system https://standards.digital.health.nz/ns/nzf-document-type



CodeSystem:  NzfDocumentType
Id: nzf-document-type
Title: "Possible values for NZF Document Type"
Description: "The set of all possible nzf document types"

* ^url = "https://standards.digital.health.nz/ns/nzf-document-type"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* #AdultMonograph "NZF Adult Monograph"
* #ChildMonograph "NZFC Child Monograph"
* #SpecialAuthorityForm "Pharmac Special Authority Form"
* #Datasheet "Medsafe Datasheet"
* #CMI "Medsafe CMI"
* #PIL "Patient Information Leaflet"
