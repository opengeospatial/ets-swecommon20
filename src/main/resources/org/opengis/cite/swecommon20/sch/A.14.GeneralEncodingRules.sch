<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        This Schematron schema checks the section A.14. General Encoding Rules 
        
        OGC® SWE Common Data Model Encoding Standard.
        Copyright © 2011 Open Geospatial Consortium.
        To obtain additional rights of use, visit http://www.opengeospatial.org/legal/. 
    -->
    
    <title>General Encoding Rules Validation from Req 86 to Req 89</title>
    
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
        <title>Req 89 - array size encoding rule</title>
        <rule context=" //swe:elementCount//swe:value ">
            <assert
                test=" text() castable as xs:integer ">
                Encoded data for a variable size “DataArray” shall include a number
                specifying the array size whatever the encoding method used.
            </assert>
        </rule>
    </pattern>
    
    
    
</schema>