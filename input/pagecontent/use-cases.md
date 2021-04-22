### Common use cases

WIP

#### Medications

Get a list of all medications
>[base]/Medication


Get a specific medication based on sctid
>[base]/Medication?code=44282231000116104



#### Document references

Get a list of all NZF monographs (Adult monographs)
>[base]/DocumentReference?type:text=AdultMonograph


Get a list of all NZFC monographs (Child monographs)
>[base]/DocumentReference?type:text=ChildMonograph


Get a list of monographs by an MP sctid
>[base]/DocumentReference?context.related=10013251000116106


