### Medication id

The medication id has been set to the SCTID for the medication. This allows for retrieval of medication by [base]/Medication/50079341000117105

### Custom Search parameters

nzmt-type: nzf-preferred-term: token on Medication.code.coding.display (preferred term)

nzf-related-medication: token on Medication.extension.where(url = 'http://hl7.org.nz/fhir/StructureDefinition/nzf-nzmt-type')

nzf-supply-issues: token on Medication.extension.where(url = 'http://hl7.org.nz/fhir/StructureDefinition/nzf-supply-information').extension.where(url = 'type')

nzf-link: reference on Medication.extension.where(url = 'http://hl7.org.nz/fhir/StructureDefinition/nzf-link')

funding parameters:

nzf-funding-schedule-date: date on Medication.extension.where(url = 'http://hl7.org.nz/fhir/StructureDefinition/nzf-funding').extension.where(url = 'scheduleDate').value

nzf-funding-rule-date: date on Medication.extension.where(url = 'http://hl7.org.nz/fhir/StructureDefinition/nzf-funding-rule').extension.where(url = 'scheduleDate').value

nzf-funding-type: token on Medication.extension.where(url = 'http://hl7.org.nz/fhir/StructureDefinition/nzf-funding').extension.where(url = 'type')
