This IG is to support retrieving formulary and medication information in New Zealand. This is part of a project by the NZULM/NZ Formulary to provide the information we produce and collate in a standards-based form. As an organisation we want to make it as easy as possible to retrieve the medication information that you require in a timely manner.

The key resource for this implementation is the Medication resource. For those that are familiar with the New Zealand Medicines Terminology (NZMT) we will provide a medication resource for the key types of medications in the NZMT. These are:

- Medicinal Product (MP) e.g. paracetamol
- Trade Product (TP) e.g. panadol
- Medicinal Product Unit of Use (MPUU) e.g. paracetamol 500 mg tablet
- Trade Product Unit of Use (TPUU) e.g. Panadol (paracetamol 500 mg) tablet: film-coated, 1 tablet
- Containered Trade Product Pack (CTPP) e.g. Panadol 500 mg tablet: film-coated, 1000 tablets, blister pack
- Medicinal Product Pack (MPP) e.g. paracetamol 120 mg/5 mL oral liquid, 200 mL
- Trade Product Pack (TPP) e.g. Panadol 500 mg tablet: film-coated, 12 tablets

The standard Medication resource provides the key information needed for integration however we have defined several extensions to allow for the addition of specific NZULM/Formulary information. The following table describes these extensions and shows which extensions apply to which medication type.

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
        <td></td>
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
        <td>NZ specific funding information provided by PHARMAC</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>Yes</td>
    </tr>
    <tr>
        <td>Funding rules</td>
        <td>The rules and constraints around funding for the given medicine provided by PHARMAC</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>Yes</td>
    </tr>    
    <tr>
        <td>PHARMAC Supply Information</td>
        <td>PHARMAC provided information detailing medication supply issues</td>
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

The medication resources will also link to several documents (using the link extension). To facilitate this, we use [DocumentReference](http://hl7.org/fhir/documentreference.html) resources.

We provide document references for the following data:

<table class="table table-bordered">
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
</table>

<h3>Medication code</h3>

<p>All medications will have a nzmt code.  Where applicable one or more Pharmacodes® will be added to a CTPP.  Where applicable one or more GTIN codes will added to a CTPP or a TPUU</p>

<h3>Subsidy information</h3>

<p>Subsidy information is added to Containered Trade Product Packs where applicable.  The funding information is derived from both the PHARMAC community schedule as well as the HML.</p>
<p>There are two extensions added that store this information.  The first is <b>nzf-funding</b>.  This stores the general information around funding for a specific product, including some of the community schedule details (price etc.) - <a href="./StructureDefinition-nzf-funding.html">see extension details</a> To cater for the existence of multiple schedules this extension can be added to a product multiple times, once per schedule.  This allows vendors to see both the current schedule information as well as an upcoming schedule.  To determine which set of information to use the 'scheduleDate' field can be used.  The second extension is <b>nzf-funding-rule</b>.  This extension once again has a schedule date so vendors can determine which schedule they would like to look at.  The purpose of this extension is to provide the PHARMAC funding rules that apply to the given product.  Most of the data here comes from the ps_rule table (in the NZMT releases) however a number of attribute rules are also added.  These are:</p>

<table class="table table-bordered">
    <tr>
    <td>Name</td>
    <td>Condition</td>
    <td>Rule Type</td>
    <td>Rule value</td>
    <td>Rule text</td>
    </tr>
    <tr>
    <td>Sole Subsidised Supply</td>
    <td>When a CTPP associated with a ps_brand entry has the sole_supply flag set</td>
    <td>SoleSupply</td>
    <td></td>
    <td>Sole Subsidised Supply</td>
    </tr>
    <tr>
    <td>Principal Sole Supply</td>
    <td>When a CTPP associated with a ps_brand entry has the pss flag set</td>
    <td>PrincipalSoleSupply</td>
    <td></td>
    <td>Principal Sole Supply</td>
    </tr>
    <tr>
    <td>Cost Brand Source</td>
    <td>When a CTPP associated with ps_pack entry has cost brand source = 1</td>
    <td>CostBrandSource</td>
    <td></td>
    <td>CBS</td>
    </tr>
    <tr>
    <td>Original Pack</td>
    <td>When a CTPP associated with ps_pack entry has originalPack = 1</td>
    <td>OriginalPack</td>
    <td></td>
    <td>Original Pack</td>
    </tr>
    <tr>
    <td>Hospital Supply Status</td>
    <td>When a CTPP associated with a ps_brand entry has the hss set</td>
    <td>HospitalSupplyStatus</td>
    <td></td>
    <td>Hospital Supply Status</td>
    </tr>
    <tr>
    <td>Safety: Uncompounded</td>
    <td>ps_formulary.safety = Uncompounded</td>
    <td>Safety</td>
    <td>Uncompounded</td>
    <td>Safety cap required</td>
    </tr>
    <tr>
    <td>Safety: Compounded</td>
    <td>ps_formulary.safety = compounded</td>
    <td>Safety</td>
    <td>Compounded</td>
    <td>Safety cap required for extemporaneously compounded oral liquid preparations</td>
    </tr>
    <tr>
    <td>Statim</td>
    <td>ps_formulary.statim = Must</td>
    <td>Statim</td>
    <td>Must</td>
    <td>Statim: Three months or six months, as applicable, dispensed all-at-once.</td>
    </tr>
    <tr>
    <td>Statim</td>
    <td>ps_formulary.statim = Must</td>
    <td>Statim</td>
    <td>Must</td>
    <td>Statim: Three months or six months, as applicable, dispensed all-at-once.</td>
    </tr>
</table>

<p>See <a href="./StructureDefinition-nzf-funding-rule.html">extension details</a></p>

<p>As we stated we want this to be as useful as possible so please get in touch if you have any feedback.</p>

<h3>Related medications</h3>

<p>Each medication can have one or more optional related medication extensions.  These allow navigation through the NZMT concept hierarchy.<p>
<p>See <a href="./StructureDefinition-nzf-related-medication.html">extension details</a></p>
<p>The following table shows the related medications for each concept</p>
<table class="table table-bordered">
<tr>
<td>Concept</td>
<td>Related medications</td>
</tr>
<tr>
    <td>CTPP</td>
    <td>MP<br/>TPP</td>
</tr>
<tr>
    <td>MPP</td>
    <td>MP<br/>MPUU (1 or more)</td>
</tr>
<tr>
    <td>MPUU</td>
    <td>MP<br>MPP (1 or more)</td>
</tr>
<tr>
    <td>TPP</td>
    <td>MP<br/>TP<br/>TPUU (1 or more)<br/>MPP</td>
</tr>
<tr>
    <td>TPUU</td>
    <td>MP<br/>TP<br>TPP (1 or more)<br>MPUU</td>
</tr>
</table>
