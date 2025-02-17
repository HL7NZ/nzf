**We are now producing regular newsletter updates on development and changes with the API.  To subscribe click [here](https://confirmsubscription.com/h/d/F54343E1878E1AA0)** 

This IG is to support retrieving formulary and medication information in New Zealand. This is part of a project by the NZULM/NZ Formulary to provide the information we produce and collate in a standards-based form. As an organisation we want to make it as easy as possible to retrieve the medication information that you require in a timely manner.

The key resource for this implementation is the Medication resource. For those that are familiar with the New Zealand Medicines Terminology (NZMT) we provide a medication resource for the key types of medications in the NZMT. These are:

- Medicinal Product (MP) e.g. paracetamol
- Trade Product (TP) e.g. panadol
- Medicinal Product Unit of Use (MPUU) e.g. paracetamol 500 mg tablet
- Trade Product Unit of Use (TPUU) e.g. Panadol (paracetamol 500 mg) tablet: film-coated, 1 tablet
- Containered Trade Product Pack (CTPP) e.g. Panadol 500 mg tablet: film-coated, 1000 tablets, blister pack
- Medicinal Product Pack (MPP) e.g. paracetamol 120 mg/5 mL oral liquid, 200 mL
- Trade Product Pack (TPP) e.g. Panadol 500 mg tablet: film-coated, 12 tablets

*Panadol is a registered trademark of the Haleon group of companies.

Click [here](./nzmt-datamodel.html) for more information on the NZMT data model.

Complementing the NZMT information is information from the NZF Formulary, Pharmac and Medsafe.  This includes information ranging from funding to legal classifications to Cautionary and Advisory labels.  For more information on the full data set see the [data](./data.html), including examples of how to retrieve specific information.

The medication resources also link to several documents (using the link extension). To facilitate this, we use [DocumentReference](http://hl7.org/fhir/R4B/documentreference.html) resources.

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

We also provide substance resources for each NZMT substance. See [Substance](http://hl7.org/fhir/R4B/substance.html) resources.

This guide is divided into a number of sections
- How to use: A brief explanation on how to connect to the API and some of its basic usage
- Data: This is a detailed explanation on all the data that is provided via the API
- Glossary: A glossary of some of the terms and abbrievations used
- FAQ: 
- Roadmap:  A guide on what is coming to the API
- Change log: What has changed recently

We also work closely with the NZ Health Terminology Service (NZHTS).  The codes from the NZMT are published to the NZHTS and this might be the best option for light use-cases or if terminology services are needed.  The services are complementary so both APIs can be used together.  To get more information please see here: https://www.tewhatuora.govt.nz/our-health-system/digital-health/terminology-service/ .  Any valuesets created will also be published to this service.

To contact us please use the email address fhir 'at' nzformulary.org with any questions or requests to access the data.

We want, not only the API, but also this documentation to be as useful as possible so please get in touch if you have any feedback.


