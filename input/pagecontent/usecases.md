### Clinical use cases

**This page is a work-in-progress, more use cases will be added in time**

#### Identifying Controlled Drugs

As the majority of NZULM listed medicines are registered it is straight forward to identify them by using their legal classification which is found in the CTPP API «medicine-classification-code» resource. The legislation also refers to Class C Controlled Drugs that are exempt. Category C exempt medicines have a medicines classification of Prescription Medicine so any mechanism used to extract Controlled Drugs will also exclude these medicines.  

For unregistered medicines the WHO ATC code allows one to identify Controlled Drugs using the API «nzf–atc» resource. The relevant ATC codes for class B and class C Controlled Drugs are:

· The stimulants (the amfetamines and methylphenidate) have ATC codes where the first five characters are N06BA

· The opioids have ATC codes where the first four characters are N02A or N01AH (fentanyl and its congeners) or codes in the range R05DA01 to R05DA06 (codeine and other similar opioids)

· The non–opioids have ATC codes that start with N05BA or N03AE (benzodiazepines)

· The medicinal cannabis products containing THC have the ATC code N02BG10

· The “z” class of sedatives have ATC codes that start with N05CF