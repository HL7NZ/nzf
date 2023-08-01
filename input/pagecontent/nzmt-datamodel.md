** DRAFT **

### New Zealand Medicines Terminology (NZMT) overview

The New Zealand Medicines Terminology (NZMT) database has been designed from the SNOMED design model, and is intended to provide a single, consistent database of names for medicines and trade products containing these medicines.

#### New Zealand Medicines Terminology Data Model

![NZMT Overview](./nzmt_data_model_sml.gif)

This is a simplified view of the structure of the NZ Medicines Terminology. It uses an example medicine to show how information is linked together.

It does not show all of the information available and the multitude of relationships that can exist. For example a medicine may be available in more than one dose form, strength and brand.

*Panadol is a registered trademark of the Haleon group of companies.

<table class="table table-bordered">
<thead>
<tr><td>Concept</td>
<td>Examples</td>
</tr>
</thead>
<tbody>
<tr><td>Medicinal Product (MP)</td>
<td>ibuprofen</td>
</tr>
<tr><td>Medicinal Product Pack (MPP)</td>
<td>ibuprofen 10 mg/2 mL injection, 4 x 2 mL ampoules<br/>
ibuprofen 200 mg capsule, 96</td>
</tr>
<tr><td>Medicinal Product Unit of Use (MPUU)</td>
<td>ibuprofen 800 mg tablet: modified release<br/>
ibuprofen 200 mg/5 mL oral liquid</td>
</tr>
<tr><td>Trade Product (TP)</td>
<td>Fenpaed<br/>Caldolor<br/>Nurofen</td>
</tr>
<tr><td>Trade Product Pack (TPP)</td>
<td>ACT-3 200 mg capsule: soft, 48 capsules<br/>ACT-3 200 mg capsule: soft, 20 capsules<br/>ACT-3 (ibuprofen 200 mg) capsule: soft, 12</td>
</tr>
<tr><td>Trade Product Unit of Use (TPUU)</td>
<td>Nurofen Solutabs (ibuprofen 200 mg) tablet: dispersible, 1 tablet<br/>
Nurofen Duralast (ibuprofen 200 mg/24 hours) patch<br/>
Nurofen Caplet (ibuprofen 200 mg) tablet: sugar-coated, 1 tablet
</td>
</tr>
<tr><td>Container Trade Product Pack (CTPP)</td>
<td>Medreich Ibuprofen 200 mg tablet: film-coated, 96 tablets, blister pack<br/>
Nurofen 200 mg tablet: sugar-coated, 6 tablets, blister pack<br/>
Nurofen 400 Double Strength 400 mg tablet: sugar-coated, 48 tablets, blister pack</td>
</tr>
</tbody>
</table>


#### SNOMED ID Codes (SCTIDs) {#nzmt-id-details}

##### Overview
The SNOMED spec dictates that all records are identified by a globally unique 18-digit number. 
This means that you can create a single lookup table inside your database that contains all the id numbers of all the NZMT records in your database and you won’t get a single duplicate.

The primary purpose of this globally unique key is to allow records from any of the Medicines Terminologies operated by SNOMED member nations to co-exist in a single database if required, and also to conform to the very flexible but rather inefficient “three-table” structure of the standard SNOMED data structure (which is not covered in this document – please ask if you need additional information).

##### ID Data Format

id numbers that are 18 digits wide are just slightly too large to fit within the largest integers supported by most databases. So all record IDs are stored as 18 character strings.

##### Key Structure

The 18-digit key contains (in order):
- an 8-digit sequence number 
- a 7-digit national “namespace” number (1000117 or 1000116)
- a 2 digit SNOMED “type” code known as the ‘partition code’
- a single checkdigit

E.g.: 50004811000117106 breaks down as: 5000481 – 1000117 – 10 – 6

Note 1: The Australian national namespace code is: 1000036.  You can use this to identify data imported from the AMT. 

Note 2:  We currently only use 7 of the available 8 digits in the initial sequence number, so as in our example above almost all of our SCTIDs are actually 17-character strings.

Note 3:  The SNOMED ‘partition code’ has three values: 10 for Concept IDs, 11 for Description IDs and 12 for Relationship IDs.  The example above is therefore a Concept ID and is actually the SCTID for a CTPP record.  All of the seven primary tables and of the lookup tables are considered to have Concept IDs.  The descriptions table has Description IDs, while relationship tables such as MHM and THT have Relationship IDs.
