This IG is to support retrieving formulary and medication information in New Zealand.  This is part of a project by the NZULM/NZ Formulary to provide the information we produce and collate in a standards-based form.  As an organisation we want to make it as easy as possible to retrieve the medication information that you require in a timely manner.

The key resource for this implementation is the Medication resource.  For those that are familiar with the New Zealand Medicines Terminology (NZMT) we will provide a medication resource for the key types of medications in the NZMT.  These are:

* Medicinal Product (MP) e.g. paracetamol
* Trade Product (TP) e.g. panadol
* Medicinal Product Unit of Use (MPUU) e.g. paracetamol 500 mg tablet
* Trade Product Unit of Use (TPUU) e.g. Panadol (paracetamol 500 mg) tablet: film-coated, 1 tablet
* Container Trade Product Pack (CTPP) e.g. Panadol 500 mg tablet: film-coated, 1000 tablets, blister pack
* Medicinal Product Pack (MPP) e.g. paracetamol 120 mg/5 mL oral liquid, 200 mL
* Trade Product Pack (TPP) e.g. Panadol 500 mg tablet: film-coated, 12 tablets

The standard Medication resource provides the key information needed for integration however we have defined several extensions to allow for the addition of specific NZULM/Formulary information.  The following table describes these extensions and shows which extensions apply to which medication type.

<table class="table table-bordered">
    <tr>
        <th>Extension</th>
        <th>Description</th>
        <th>MP</th>
        <th>TP</th>
        <th>MPUU</th>
        <th>TPUU</th>
        <th>MPP</th>
        <th>TPP</th>
        <th>CTPP</th>
    </tr>
    <tr>
        <td>Type</td>
        <td>Type of NZMT reference (e.g. CTPP, MPUU) etc.</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td></td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>Cautionary and Advisory Labels (CALs)</td>
        <td>List of all Cautionary and Advisory labels associated with the medication</td>
        <td></td>
        <td></td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>ATC</td>
        <td>The Anatomical Therapeutic Chemical Classification code(s)</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>Unapproved</td>
        <td>True if the medication has not been approved by Medsafe and can be prescribed under section 29</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>Legal Classification</td>
        <td>Medsafe legal classification</td>
        <td></td>
        <td></td>
        <td>Yes</td>
        <td>Yes</td>
        <td></td>
        <td></td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>Medsafe Status</td>
        <td>Medsafe product status</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>Yes</td>
    </tr>    
    <tr>
        <td>Prescribe by Brand</td>
        <td>Whether the medication should be prescribed by brand or not</td>
        <td></td>
        <td></td>
        <td>Yes</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>Funding</td>
        <td>NZ specific funding information provided by pharmac</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>Pharmac Supply Information</td>
        <td>Pharmac provided information detailing medication supply issues</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>Links</td>
        <td>Links to associated resources, such as monographs, datasheets and patient information leaflets</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
    </tr>
</table>

The medication resources will also link to several documents (using the link extension).  To facilitate this, we use [DocumentReference](http://hl7.org/fhir/documentreference.html) resources which are linked to via the medication link extension.

We provide document references for the following data:

<table>
<tr>
    <th>Data</th>
    <th>Description</th>
</tr>
<tr>
    <td>Adult monographs</td>
    <td>A reference to all adult monographs - this allows for integrating systems to determine which monograph(s) to link to for a given medication</td>
</tr>
<tr>
    <td>Child monographs</td>
    <td>A reference to all children monographs - this allows for integrating systems to determine which monograph(s) to link to for a given medication</td>
</tr>
<tr>
    <td>Patient information leaflets</td>
    <td>A link to all patient information leaflets - these contain a number of extensions to provide extra information about the PIL (see mapping tab)</td>
</tr>
<tr>
    <td>Medsafe Datasheets</td>
    <td>A reference to all medsafe datasheet URLs</td>
</tr>
<tr>
    <td>Medsafe CMIs</td>
    <td>A reference to all medsafe CMI URLs</td>
</tr>
<tr>
    <td>Pharmac Special Authority Forms</td>
    <td>A reference to all pharmac special authority forms, including the form XML</td>
</tr>
</table>

As we stated we want this to be as useful as possible so please get in touch if you have any feedback.
