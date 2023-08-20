### Getting started

The first step to getting access to the API is to email fhir 'at' nzformulary.org.  We will help with the onboarding process and send you the required authentication details.


### Authentication

The FHIR API requires authentication for access.  This uses OAuth2 and you will be set up with the appropriate credentials including a small guide on using those credentials in tools like postman during the onboarding process.

### FHIR Viewer

We also have a simple web user interface to view the data.  This allows for common queries as well as viewing medication details.  This is available once you have been onboarded above.

### Accessing data

Once you have connected to the FHIR server then you should have access to all the medication, substances and document references.

The easiest way to test this is by going to the following url:

> [base]/Medication

(where base is the location of the server you are accessing).

We use a standard FHIR server to host our API and resources therefore all the standard read and search operations are available.  See [here](http://hl7.org/fhir/R4B/search.html) for more details.

On our [data page](./data.html) we explain the data we provide as well as given example queries on how to access the data you are after.

#### Quick notes

#### Count

For those that aren't familar with FHIR by default FHIR queries page their search returns.  You can specify the number of results to return in a group by appending the _count variable to your query.  A search query will return a [Bundle](http://hl7.org/fhir/R4B/bundle.html) which includes a url to get the next batch of results.

You can also request to get the total number of resources of a query.  For example:

This will return mpp medication resources, including the total number of MPPs.

>[base]/Medication?nzf-nzmt-type=https://standards.digital.health.nz/ns/nzmt-type-code&#124;mpp&_total=accurate

##### Multiple search parameters

You can also use multiple parameters in one query - for example you can say give me all the MPP medications that are prescribe by brand

>[base]/Medication?nzf-nzmt-type=https://standards.digital.health.nz/ns/nzmt-type-code&#124;mpp&nzf-prescribe-by-brand=true

Note the query below will also work but it is recommended that you include the system along with the code.  This also improves query performance.

>[base]/Medication?nzf-nzmt-type=mpp&nzf-prescribe-by-brand=true


##### Multiple medications in one request

If you have a list of medication codes and you want to retrieve all these medications in one go then you can add multiple ids to your query. For example:

>[base]/Medication?_id=10017561000116103,10017651000116102

##### POST requests for search

Similarly you can also do a POST request with the ids in the POST data to achieve the same result.

>[base]/Medication/_search

POST data (content-type: application/x-www-form-urlencoded):

_id = 10017561000116103,10017651000116102

##### Filtering return fields

You can choose to return only parts of the medication (or other resources) from a query.  For example:

Give me all the code fields for MPs

>[base]/Medication?nzf-nzmt-type=https://standards.digital.health.nz/ns/nzmt-type-code&#124;mp&_elements=code

##### Operation Outcome

If something is incorrect in your query then the first entry in the Bundle will be an OperationOutcome specifying what has gone wrong.  It is important to be aware of this as queries can sometimes still return results but they may not be exactly what you are after.


### Reference (client) libraries

There are client libraries which aid querying and retrieving data.  Please see [here](https://confluence.hl7.org/display/FHIR/Open+Source+Implementations) for more information.

### Caching

Depending on your application requirements you may want to cache the data that you are after rather than query the API at real-time.  There are various ways of doing this but one helpful built-in parameter is the lastUpdated field.  For example:

This returns all the medications that have been created or updated since the July 01, 2023.

>[base]/Medication?_lastUpdated=gt2023-07-01

Note - this does not return deleted items.  These can be retrieved by the resource history if needed, however, medications and substances should not, in general ever be deleted from the API (they may be made inactive).

### Help

We are more than willing to help you get the data that you need.  Please contact us at any stage for assistance if needed.

### Accreditation

Before going into production there is an accreditation process.  Please contact fhir 'at' nzformulary.org for more details.