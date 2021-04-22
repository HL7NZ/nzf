### Common use cases

WIP - the intention of this page is to detail common use cases, ranging from the simple retrieval of resources to best practice for using that data (e.g. for interactions checking etc.)

#### Medications

Get a list of all medications
>[base]/Medication


Get a specific medication based on sctid
>[base]/Medication?code=44282231000116104

Get recently changed medications (can be useful for maintaining a local cache)
>[base]
#### Document references

Get a list of all NZF monographs (Adult monographs)
>[base]/DocumentReference?type:text=AdultMonograph


Get a list of all NZFC monographs (Child monographs)
>[base]/DocumentReference?type:text=ChildMonograph


Get a list of monographs by an MP sctid
>[base]/DocumentReference?context.related=10013251000116106


