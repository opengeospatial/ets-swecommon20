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
A.3 | 37 | An encoding or software passing the “Record Components UML Package” conformance test class shall first pass the “Basic Types and Simple Components UML Packages” conformance test class
A.3 | 38 | The encoding or software shall correctly implement all UML classes defined in the “Record Components” package
A.3 | 39 | Each “field” attribute in a given instance of the “DataRecord” class shall be identified by a name that is unique to this instance.
A.3 | 40 | Each “coordinate” attribute in a given instance of the “Vector” class shall be identified by a name that is unique to this instance.
A.3 | 41 | Verify that the implementation of the conceptual model has a constraint that enforces the above.
A.3 | 42 | The “axisID” attribute shall be specified on all data components used as children of a “Vector” instance.
A.3 | 43 | The “localFrame” attribute of an instance of the “Vector” class shall have a different value than the “referenceFrame” attribute.
A.4 | 44 | An encoding or software passing the “Choice Components UML Package” conformance test class shall first pass the “Basic Types and Simple Components UML packages” conformance test class.
A.4 | 45 | The encoding or software shall correctly implement all UML classes defined in the “Choice Components” package.
A.4 | 46 | Each “item” attribute in a given instance of the “DataChoice” class shall be identified by a name that is unique to this instance.
A.5 | 47 | An encoding or software passing the “Block Components UML Package” conformance test class shall first pass the “Basic Types and Simple Components UML packages” and “Simple Encodings UML Package” conformance test classes.
A.5 | 48 | The encoding or software shall correctly implement all UML classes defined in the “Block Components” package.
A.5 | 49 | Data components that are children of an instance of a block component shall be used solely as data descriptors. Their values shall be block encoded in the “values” attribute of the block component rather than included inline
A.5 | 50 | Whenever an instance of a block component contains values, an encoding method shall be specified by the “encoding” property and array values shall be encoded as specified by this method.
A.5 | 51 | The “elementType” attribute of an instance of the “Matrix” class can only be an instance of “Matrix” or of the classes listed in the “AnyNumerical” union.
A.5 | 52 | Req 49 also applies to the “DataStream” class.
A.6 | 53 | "An encoding or software passing the “Simple Encodings UML Package” conformance test class shall first pass “Basic Types and Simple Components UML Package” conformance test class."
A.6 | 54 | "The encoding or software shall correctly implement all UML classes defined in the “Simple Encodings” package."
A.7 | 55 | An encoding or software passing the “Advanced Encodings UML Package” conformance test class shall first pass the “Simple Encodings UML Package” conformance test class.
A.7 | 56 | The encoding or software shall correctly implement all UML classes defined in the “Advanced Encodings” package.
A.8 | 57 | An XML instance passing the “Basic Types and Simple Components Schemas” conformance test class shall first pass the core conformance test classes.
A.8 | 58 | The XML instance shall be valid with respect to the XML grammar defined in the “basic_types.xsd” and “simple_components.xsd” XML as well as satisfy all schematron patterns defined in “simple_components.sch”.
A.8 | 59 | A property element supporting the “swe:AssociationAttributeGroup” shall contain the value inline or populate the “xlink:href” attribute with a valid reference but shall not be empty.
A.8 | 60 | All extensions of the XML schemas described in this standard shall be defined in a new unique namespace.
A.8 | 61 | Extensions of this standard shall not redefine or change the meaning or behavior of XML elements and types defined in this standard.
A.8 | 62 | The “definition” attribute shall contain a URI that can be resolved to the complete human readable definition of the property that is represented by the data component.
A.8 | 63 | The inline value included in an instance of a simple data component shall satisfy the constraints specified by this instance.
A.8 | 64 | The UCUM code for a unit of measure shall be used as the value of the “code” XML attribute whenever it can be constructed using the UCUM 1.8 specification. otherwise the “href” XML attribute shall be used to reference an external unit definition.
A.8 | 65 | When ISO 8601 notation is used to express the measurement value associated to a “Time” element, the URI “http://www.opengis.net/def/uom/ISO-8601/0/Gregorian” shall be used as the value of the “xlink:href” XML attribute on the “uom” element.
A.8 | 66 | "The “pattern” child element of the “AllowedTokens” element shall be a regular expression valid with respect to Unicode Technical Standard #18, Version 13."
A.9 | 67 | An XML instance passing the “Record Components Schema” conformance test class shall first pass the “Basic Types and Simple Components Schemas” conformance test class.
A.9 | 68 | The XML instance shall be valid with respect to the XML grammar defined in the “record_components.xsd” XML schema as well as satisfy all Schematron patterns defined in “record_components.sch”.
A.10 | 69 | An XML instance passing the “Choice Components Schema” conformance test class shall first pass the “Basic Types and Simple Components Schemas” conformance test class.
A.10 | 70 | The XML instance shall be valid with respect to the grammar defined in the “choice_components.xsd” XML schema as well as satisfy all Schematron patterns defined in “choice_components.sch”.
A.11 | 71 | An XML instance passing the “Block Components Schema” conformance test class shall first pass the “Basic Types and Simple Components Schemas” and “Simple Encodings Schema” conformance test classes.
A.11 | 72 | The XML instance shall be valid with respect to the grammar defined in the “block_components.xsd” XML schema as well as satisfy all Schematron patterns defined in “block_components.sch”.
A.11 | 73 | The encoded data block included either inline or by-reference in the “values” property of a “DataArray”, “Matrix” or “DataStream” element shall be structured according to the definition of the element type, the element count and the encoding rules corresponding to the chosen encoding method.
A.12 | 74 | The XML instance shall be valid with respect to the grammar defined in the “simple_encodings.xsd” XML schema as well as satisfy all Schematron patterns defined in “simple_encodings.sch”.
A.12 | 75 | The encoded values block described by a “TextEncoding” element shall pass the “Text Encoding Rules” conformance test class.
A.12 | 76 | The encoded values block described by an “XMLEncoding” element shall pass the “XML Encoding Rules” conformance test class.
A.13 | 77 | An XML instance passing the “Advanced Encodings Schema” conformance test class shall first pass the “Simple Encodings Schema” conformance test class.
A.13 | 78 | The XML instance shall be valid with respect to the grammar defined in the “advanced_encodings.xsd” XML schema as well as satisfy all Schematron patterns defined in “advanced_encodings.sch”.
A.13 | 79 | The encoded values block described by a “BinaryEncoding” element shall pass the “Binary Encoding Rules” conformance test class.
A.13 | 80 | The “ref” attribute of the “Component” and “Block” elements shall contain a hierarchical ‘/’ separated list of data component names.
A.13 | 81 | The “ref” attribute of a “Component” element shall reference a scalar or range component.
A.13 | 82 | "The value of the “dataType” XML attribute of the “Component” element shall be one of the URIs listed in Table 8.1."
A.13 | 83 | The chosen data type shall be compatible with the scalar component representation, constraints and NIL values.
A.13 | 84 | The “bitLength” and “byteLength” XML attribute shall not be set when a fixed size data type is used.
A.13 | 85 | The “ref” attribute of the “Block” element shall reference an aggregate component.
A.14 | 86 | “DataRecord” fields or “Vector” coordinates shall be encoded sequentially in a data block in the order in which these fields or coordinates are listed in the data descriptor.
A.14 | 87 | Encoded values for the selected item of a “DataChoice” shall be provided along with information that unambiguously identifies the selected item.
A.14 | 88 | “DataArray” elements shall be encoded sequentially in a data block in the order of their index in the array (i.e. from low to high index)
A.14 | 89 | Encoded data for a variable size “DataArray” shall include a number specifying the array size whatever the encoding method used.
A.15 | 90 | The encoded values block shall be formatted as defined by the ABNF grammar defined in this clause.
A.15 | 91 | Block and token separators used in the “TextEncoding” method shall be chosen as a sequence of characters that never occur in the data values themselves.
A.15 | 92 | The ‘Y’ or ‘N’ token shall be inserted in a text encoded data block for all fields that have the “optional” attribute set to ‘true’.
A.15 | 93 | The selected-item-name token shall correspond to the value of the “name” attribute of the “item” property element that represents the selected item.
A.16 | 94 | All data components shall be XML encoded with an element whose local name shall correspond to the “name” attribute of the soft-typed property containing the data component.
A.16 | 95 | Scalar components values shall be XML encoded with a single element containing the value as its text content and no other child element.
A.16 | 96 | Range components values shall be XML encoded with an element containing two sub-elements with local names “min” and “max” which respectively contain the lower and upper values of the range as their text content
A.16 | 97 | “DataRecord” values shall be XML encoded with an element which contains one sub-element for each “field” that is not omitted (when optional)
A.16 | 98 | “Vector” values shall be XML encoded with an element which contains one sub-element for each “coordinate” of the aggregate.
A.16 | 99 | Values of each element of a “DataArray”, “Matrix” or “DataStream” shall be encapsulated in a separate XML element whose local name shall be the value of the “name” attribute of its “elementType” element.
A.16 | 100 | All elements of each nested “DataArray” and “Matrix” shall be encapsulated in a parent element as specified in Req 94 and this element shall also have an “elementCount” attribute that specifies the array size
A.17 | 101 | The encoded values block shall be formatted as defined by the ABNF grammar defined in this clause.
A.17 | 102 | Binary data types in Table 8.1 shall be encoded according to their definition in the description column and the value of the “byteOrder” attribute
A.17 | 103 | When the ‘base64’ encoding option is selected, binary data shall be encoded with the Base64 technique defined in IETF RFC 2045 Section 6.8: Base64 Content-Transfer-Encoding.
A.17 | 104 | The ‘Y’ or ‘N’ 1-byte token shall be inserted in a binary encoded data block for all “DataRecord” fields that have the “optional” attribute set to ‘true’.
A.17 | 105 | The selected-item-name token shall correspond to the value of the “name” attribute of the “item” property element that represents the selected item.
 
## What is not tested 
Please reference the availability column in the previous table that marked as not "ok".
 
## The test data 
* [Samples](https://github.com/opengeospatial/ets-swecommon20/tree/master/src/test/resources/examples) 
 
 ## Release Notes  
Release notes are available [here.](relnotes.html) 