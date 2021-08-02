ValueSet: NzmtTypeCodeHB
Id: funding-code
Title: "Derived pharmac funding code"
Description: "Derived pharmac funding code"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/funding-code"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* codes from system https://standards.digital.health.nz/ns/funding-code



CodeSystem:  NzmtTypeCode
Id: nzmt-type-code
Title: "Possible values for Derived Pharmac funding codde"
Description: "The set of all possible funding codes"

* ^url = "https://standards.digital.health.nz/ns/funding-code"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* #0 "no subsidy"
* #1 "part subsidy"
* #2 "full subsidy"
