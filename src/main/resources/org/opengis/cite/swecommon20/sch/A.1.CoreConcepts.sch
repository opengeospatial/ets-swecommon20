<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        This Schematron schema checks the section A.1. Core Concepts. 
        
        OGC® SWE Common Data Model Encoding Standard.
        Copyright © 2011 Open Geospatial Consortium.
        To obtain additional rights of use, visit http://www.opengeospatial.org/legal/. 
    -->

    <title>Core Concepts Validation from Req 1 to Req 13</title>
    
    <ns
        prefix="swe"
        uri="http://www.opengis.net/swe/2.0"/>
    <ns
        prefix="xsi"
        uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns
        prefix="xlink"
        uri="http://www.w3.org/1999/xlink"/>
    
    <pattern>
        <title>Req 2 - Boolean representation validation</title>
        <rule context="//swe:Boolean[swe:value]">
            <assert
                test=" swe:value = 'true' or swe:value = 'false' ">
                A boolean representation shall at least consist of a boolean value.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 3 - Categorical representation validation</title>
        <rule context="//swe:Category">
            <assert
                test=" swe:identifier and swe:identifier castable as xs:anyURI">
                A categorical representation shall at least consist of a category identifier and
                information describing the value space of this identifier.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 4 - Numerical representation validation</title>
        <rule context="//swe:Quantity[swe:value]">
            <assert
                test=" (swe:value castable as xs:double) and (swe:uom[@code != ''] or swe:uom[@xlink:href != ''])">
                A continuous numerical representation shall at least consist of a decimal number and the scale 
                (or unit) used to express this number.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 5 - Countable representation validation</title>
        <rule context="//swe:Count[swe:value]">
            <assert
                test=" swe:value castable as xs:integer ">
                A countable representation shall at least consist of an integer number.
            </assert>
        </rule>
    </pattern>
   
    <pattern>
        <title>Req 6 - Textual representation validation</title>
        <rule context="//swe:Text[swe:value]">
            <assert
                test=" (swe:value castable as xs:string) and (string-length(swe:value) > 0) and (matches(swe:value, '[a-zA-Z0-9]'))" > <!-- use matches() function to avoid all characters in string are invalid-->
                A textual representation shall at least consist of a character string.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 7 - Semantics defined</title>
        <rule context="//*[@definition]">
            <assert
                test=" string(@definition) castable as xs:anyURI " >
                All data values shall be associated with a clear definition of the property that
                the value represents.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 9 - Temporal frame defined</title>
        <rule context="//swe:Time">
            <assert
                test=" (count(@referenceTime) = 0 and count(@referenceFrame) = 0) or @referenceTime castable as xs:dateTime or @referenceFrame castable as xs:anyURI" >
                A temporal quantity shall be expressed with respect to a well defined
                temporal reference frame and this frame shall be specified.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 10 - Spatail frame defined</title>
        <rule context="//swe:Vector">
            <assert
                test=" (count(@referenceFrame) = 0) or @referenceFrame castable as xs:anyURI" >
                A spatial quantity shall be expressed with respect to the axes of a well
                defined spatial reference frame and this frame shall be specified.
            </assert>
        </rule>
        <rule context="/swe:Matrix">
            <assert
                test=" (count(@referenceFrame) = 0) or @referenceFrame castable as xs:anyURI" >
                A spatial quantity shall be expressed with respect to the axes of a well
                defined spatial reference frame and this frame shall be specified.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 11 - nil reasons defined</title>
        <rule context="//swe:nilValue">
            <assert
                test=" (@reason castable as xs:anyURI) and (text() castable as xs:string)" >
                A model of a NIL value shall always include a mapping between the
                selected reserved value and a well-defined reason.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 12 - aggregates model valid</title>
        <rule context="//swe:DataRecord">
            <assert
                test=" swe:field " >
                Aggregate data structures shall be implemented in a way that is
                consistent with definitions of ISO 11404. swe:DataRecord need to have swe:field child node
            </assert>
        </rule>
        <rule context="//swe:DataArray">
            <assert
                test=" swe:elementType " >
                Aggregate data structures shall be implemented in a way that is
                consistent with definitions of ISO 11404. swe:DataArray need to have swe:elementType child node
            </assert>
        </rule>
        <rule context="//swe:DataChoice">
            <assert
                test=" swe:item " >
                Aggregate data structures shall be implemented in a way that is
                consistent with definitions of ISO 11404. swe:DataChoice need to have swe:item child node
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 13 - Encoding method valid</title>
        <rule context="//swe:encoding">
            <assert
                test=" ancestor::swe:DataRecord or ancestor::swe:DataArray or ancestor::swe:DataStream or ancestor::swe:DataChoice or ancestor::swe:Matrix " >
                All encoding methods shall be applicable to any arbitrarily complex
                data structures as long as they are made of the data components
                described in clause 6.5.
            </assert>
        </rule>
    </pattern>
    
</schema>
