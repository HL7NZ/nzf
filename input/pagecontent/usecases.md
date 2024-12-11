### Clinical use cases

**This page is a work-in-progress, more use cases will be added in time**

#### Community Prescribing List [ ** DRAFT ** ]

To aid in the development of a list of medications to display in a community prescribing system we have developed a FHIR valueset.  This valueset contains codes and display values for our suggested list of medications for community prescribing.  This list is based on the following criteria:

- All active non-inert MPUUs that are not prescribe by brand, have one or more available CTPPs and are not part of a composite pack unless they have their own prescribing term.

- All active MPPs that are not prescribe by brand and have multiple non-inert MPUUs and have one or more available CTPPs.

- All active non-inert TPUUs, have one or more available CTPPs and are not part of a composite pack unless they have their own prescribing term.

- All active TPPs that have multiple non-inert TPUUs and have one or more available CTPPs.

To retrieve the valueset:

>[base]/ValueSet/nzf-community-prescribing-list  (currently only available in the test system while ungoing QA)

This list contains the codes and the recommended description for each of these medications (prescribing term where available otherwise preferred term).

The codes in this list can be matched up with their equivalent medication resources if further information is required for a given medication.  The easiest way to do this currently is to cache all TPPs, MPPs, TPUUs and MPUUs and then match based on code or id.  This cache can be keep up-to-date via the normal update methods.  In the future it should be possible to get this list of medications using the :in modifier, but this is not currently supported on the FHIR server used.

A common scenario for vendors is to display whether a given medication has any community funded products.  This can be done by using the related medication links on funded medications (which include their links to all MPPs, TPPs, MPUUs, TPUUs).  To do this all the funded CTPPs can be retrieved and cached.  By extracting a list of related medications it can be determined whether a given MPUU for example has any funded products.  This can be further filtered to restrict to only fully funded products using the status field on the funding extension.  It is important to remember that a given medication can have two funding extensions applied to at one time (the draft and the current final) so further filtering based on the schedule date on the funding extension may be required.


#### Identifying Controlled Drugs

As the majority of NZULM listed medicines are registered it is straight forward to identify them by using their legal classification which is found in the CTPP API «medicine-classification-code» resource. The legislation also refers to Class C Controlled Drugs that are exempt. Category C exempt medicines have a medicines classification of Prescription Medicine so any mechanism used to extract Controlled Drugs will also exclude these medicines.  

For unregistered medicines the WHO ATC code allows one to identify Controlled Drugs using the API «nzf–atc» resource. The relevant ATC codes for class B and class C Controlled Drugs are:

· The stimulants (the amfetamines and methylphenidate) have ATC codes where the first five characters are N06BA

· The opioids have ATC codes where the first four characters are N02A or N01AH (fentanyl and its congeners) or codes in the range R05DA01 to R05DA06 (codeine and other similar opioids)

· The non–opioids have ATC codes that start with N05BA or N03AE (benzodiazepines)

· The medicinal cannabis products containing THC have the ATC code N02BG10

· The “z” class of sedatives have ATC codes that start with N05CF