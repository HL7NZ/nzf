ValueSet: PharmacFundingCodeHB
Id: funding-code
Title: "Derived PHARMAC funding code"
Description: "Derived PHARMAC funding code"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/funding-code"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* codes from system https://standards.digital.health.nz/ns/funding-code



CodeSystem:  PharmacFundingCode
Id: nzf-pharmac-funding-code
Title: "Possible values for Derived PHARMAC funding code"
Description: "The set of all possible funding codes"

* ^url = "https://standards.digital.health.nz/ns/funding-code"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* #0 "no subsidy"
* #1 "part subsidy"
* #2 "full subsidy"
