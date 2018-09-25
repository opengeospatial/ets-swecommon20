<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        This Schematron schema checks the section A.8. Basic Types and Simple components 
        
        OGC® SWE Common Data Model Encoding Standard.
        Copyright © 2011 Open Geospatial Consortium.
        To obtain additional rights of use, visit http://www.opengeospatial.org/legal/. 
    -->
    
    <title>Basic Types and Simple components Validation from Req 57 to Req 66</title>
    
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
        <title>Req 59 - ref or inline value present</title>
        <rule context=" //swe:*[matches(local-name(), '^[a-z].*$')] ">  <!-- name of property elements always starts with a lower case character! -->
            <assert
                test=" @xlink:href | @code | * or (normalize-space(.) != '') ">
                XML property values are included inline or by reference.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 64 - ucum code used</title>
        <rule context=" //swe:Quantity//swe:uom "> 
            <assert
                test=" @code | @xlink:href ">
                Either a UCUM code or a URI pointing to a non UCUM unit shall be specified.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 65 - iso8601 uom used</title>
        <rule context=" //swe:Time[matches(swe:value, '([T:]|([0-9]-))')] | //swe:TimeRange[matches(swe:value, '([T:]|([0-9]-))')] "> 
            <assert
                test=" swe:uom/@xlink:href = 'http://www.opengis.net/def/uom/ISO-8601/0/Gregorian' ">
                When ISO 8601 notation is used to express the measurement value
                associated to a “Time” element, the URI “http://www.opengis.net/def/uom/ISO-8601/0/Gregorian” shall be
                used as the value of the “xlink:href” XML attribute on the “uom” element
            </assert>
        </rule>
    </pattern>
    
    
</schema>