<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        This Schematron schema checks the section A.13. Advanced Encodings Schema 
        
        OGC® SWE Common Data Model Encoding Standard.
        Copyright © 2011 Open Geospatial Consortium.
        To obtain additional rights of use, visit http://www.opengeospatial.org/legal/. 
    -->
    
    <title>Advanced Encodings Schema Validation from Req 77 to Req 85</title>
    
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
        <title>Req 80 - ref syntax valid</title>
        <rule context=" //swe:Component[@ref] | //swe:Block[@ref] ">
            <assert
                test=" contains(@ref, '/') ">
                The path value in the ref attribute has the correct syntax containing a hierarchical ‘/’ separated list of data component names.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 82 - datatype valid</title>
        <rule context=" //swe:Component ">
            <assert
                test=" @dataType = 'http://www.opengis.net/def/dataType/OGC/0/signedByte' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/unsignedByte' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/signedShort' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/unsignedShort' or 
                @dataType = 'http://www.opengis.net/ def/dataType/OGC/0/signedInt' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/unsignedInt' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/signedLong' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/unsignedLong' or 
                @dataType = 'http://www.opengis.net/ def/dataType/OGC/0/float16' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/float32' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/double' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/float64' or 
                @dataType = 'http://www.opengis.net/ def/dataType/OGC/0/float128' or @dataType = 'http://www.opengis.net/def/dataType/OGC/0/string-utf-8' ">
                The value of the “dataType” XML attribute of the “Component” element
                shall be one of the URIs listed in Table 8.1 of SWE Common Data Model document
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 84 - no datatype length</title>
        <rule context=" //swe:Component[@bitLength or @byteLength] ">
            <assert
                test=" @dataType = 'http://www.opengis.net/def/dataType/OGC/0/string-utf-8' ">
                The “bitLength” and “byteLength” XML attribute shall not be set
                when a fixed size data type is used.
            </assert>
        </rule>
    </pattern>
    
</schema>