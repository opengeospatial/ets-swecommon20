# Overview
This test suite is based on the following OGC specification:
  * OGC® SWE Common Data Model Encoding Standard [OGC 10-025r1](http://portal.opengeospatial.org/files/?artifact_id=41157)
  
## What is tested 
Comformance Class Section | No. of Req | Content of Requirement | Available in testsuite | Keyword
|---|---|---|---|---|
A.1 | 1 | A derived model or software implementation shall correctly implement the concepts defined in the core of this standard. | OK | 
A.1 | 2 | A boolean representation shall at least consist of a boolean value | OK | Boolean representation
A.1 | 3 | A categorical representation shall at least consist of a category identifier and information describing the value space of this identifier. | OK | Categorical representation
A.1 | 4 | A continuous numerical representation shall at least consist of a decimal number and the scale (or unit) used to express this number | OK | Numerical representation
A.1 | 5 | A countable representation shall at least consist of an integer number | OK | Countable
A.1 | 6 | A textual representation shall at least consist of a character string | OK | Textual
A.1 | 7 | All data values shall be associated with a clear definition of the property that the value represents | OK | Robust semantic
A.1 | 8 | If robust semantics are provided by referencing out-of-band information, the locators or identifiers used to point to this information shall be resolvable by some well-defined method. | URI problem | Robust semantic
A.1 | 9 | A temporal quantity shall be expressed with respect to a well defined temporal reference frame and this frame shall be specified | OK | Time, space and projected quantities
A.1 | 10 | A spatial quantity shall be expressed with respect to the axes of a well defined spatial reference frame and this frame shall be specified | OK | Time, space and projected quantities
A.1 | 11 | A model of a NIL value shall always include a mapping between the selected reserved value and a well-defined reason. | OK | Nil value
A.1 | 12 | Aggregate data structures shall be implemented in a way that is consistent with definitions of ISO 11404 | OK | Aggregate data
A.1 | 13 | All encoding methods shall be applicable to any arbitrarily complex data structures as long as they are made of the data components described in clause 6.5 | Skip | Encoding method
A.2 | 14 | An encoding or software passing the “Simple Components UML Package” conformance test class shall first pass the core conformance test class. | OK | Dependency core
A.2 | 15 | The encoding or software shall correctly implement all UML classes defined in the “Simple Components” and “Basic Types” packages. | OK | Package fully implemented
A.2 | 16 | The encoding or software shall correctly implement all UML classes defined in ISO 19103 that are referenced directly or indirectly by this standard. | Abstract problem | ISO 19103 implemented
A.2 | 17 | The encoding or software shall correctly implement all UML classes defined in ISO 19108 that are referenced directly or indirectly by this standard | Abstract problem | ISO 19108 implemented
A.2 | 18 | The “definition” attribute shall be specified by all instances of concrete classes derived from “AbstractSimpleComponent” | OK | Definition present
A.2 | 19 | The value of the “axisID” attribute shall correspond to the “axisAbbrev” attribute of one of the coordinate system axes listed in the specified reference frame definition. | URI problem | axis valid
A.2 | 20 | The “axisID” attribute shall be specified by all instances of concrete classes derived from “AbstractSimpleComponent” and representing a property projected along a spatial axis | OK | axis defined
A.2 | 21 | The “referenceFrame” attribute shall be specified by all instances of concrete classes derived from “AbstractSimpleComponent” and representing a property projected along a spatial or emporal axis, except if it is inherited from a parent aggregate (Vector or Matrix). | OK | Reference frame defined
A.2 | 22 | The property value (formally the representation of the property value) attached to an instance of a class derived from “AbstractSimpleComponent” shall satisfy the constraints specified by this instance. | Skip | Value constraint valid
A.2 | 23 | All concrete classes derived from the “AbstractSimpleComponent” class (directly or indirectly) shall define an optional “value” attribute and use it as defined by this standard. | OK | Value attribute present
A.2 | 24 | When an instance of the “Category” class specifies a code space, the list of allowed tokens provided by the “constraint” property of this instance shall be a subset of the values listed in this code space. | URI problem | Category constraint valid
A.2 | 25 | An instance of the “Category” class shall either specify a code space or an enumerated list of allowed tokens, or both. | OK | Category enum defined
A.2 | 26 | When an instance of the “Category” class specifies a code space, the value of the property represented by this instance shall be equal to one of the entries of the code space. | URI problem | Category value valid
A.2 | 27 | The “referenceFrame” attribute inherited from “AbstractSimple Component” shall always be set on instance of the “Time” class unless the UTC temporal reference system is used. | OK | Time reference frame defined
A.2 | 28 | The value of the “referenceTime” attribute shall be expressed with respect to the system of reference indicated by the “referenceFrame” attribute.  | URI problem | Time reference time valid
A.2 | 29 | The “localFrame” attribute of an instance of the “Time” class shall have a different value than the “referenceFrame” attribute. | OK | Time local frame valid
A.2 | 30 | Both values specified in the “value” property of an instance of a class representing a property range (i.e. “CategoryRange”, “CountRange”, “QuantityRange” and “TimeRange”) shall satisfy the same requirements as the scalar value used in the corresponding scalar classes. | OK | Range value valid
A.2 | 31 | All requirements associated to the “Category” class defined in clause 7.2.6 apply to the “CategoryRange” class. | OK | Category range valid
A.2 | 32 | The code space specified by the “codeSpace” attribute of an instance of the “CategoryRange” class shall define a well-ordered set of categories. | URI problem | Category range codespace order
A.2 | 33 | All requirements associated to the “Time” class defined in clause 7.2.9 apply to the “TimeRange” class | OK | Time range valid
A.2 | 34 | The “reason” attribute of an instance of the “NilValue” class shall map to the complete human readable definition of the reason associated with the NIL value. | URI problem | Nil reason resolvable
A.2 | 35 | The value used in the “value” property of an instance of the “NilValue” class shall be compatible with the datatype of the parent data component object. | OK | Nil value type coherent
A.2 | 36 | The scale of the numbers used in the “enumeration” and “interval” properties of an instance of the “AllowedValues” class shall be expressed in the same scale as the value(s) that the constraint applies to. | Abstract problem | allowed-values-unit-coherent
 
## What is not tested 
Please reference the availability column in the previous table.
 
## The test data 
* [Samples](https://github.com/opengeospatial/ets-swecommon20/tree/master/src/test/resources/examples) 
 
 ## Release Notes  
Release notes are available [here.](relnotes.html) 