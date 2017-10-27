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
    
        
    
</schema>
