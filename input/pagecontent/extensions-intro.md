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
