<p>Funding information is added to Container Trade Product Packs where applicable.  The funding information is derived from both the Pharmac schedule.</p>
<p>There are two extensions added that store this information.  The first is <b>nzf-funding</b>.  This stores the general information around funding for a specific product such as price and subsidy.</p>

<p>The second extension is <b>nzf-funding-rule</b>.  This extension once again has a schedule date so vendors can determine which schedule they would like to look at.  The purpose of this extension is to provide the pharmac funding rules that apply to the given product.  Most of the data here comes from the ps_rule table (in the NZMT releases) however a number of attribute rules are also added.  These are:</p>

<table class="table table-bordered">
    <tr>
    <td>Name</td>
    <td>Condition</td>
    <td>Rule Type</td>
    <td>Rule value</td>
    <td>Rule text</td>
    </tr>
    <tr>
    <td>Sole subsidy</td>
    <td>When a CTPP associated with a ps_brand entry has the sole_supply flag set</td>
    <td>SoleSupply</td>
    <td></td>
    <td>Sole Subsided Supply</td>
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

<p><b>Note - </b>If only part of the schedule is released at a given date (i.e. a mid month community release) then the previous complementary release is also provided at that given schedule date.  This means that a complete schedule is available for any given schedule date.</p>