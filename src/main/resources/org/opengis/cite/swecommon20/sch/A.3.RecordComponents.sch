<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        This Schematron schema checks the section A.3. Record Components UML package 
        
        OGC® SWE Common Data Model Encoding Standard.
        Copyright © 2011 Open Geospatial Consortium.
        To obtain additional rights of use, visit http://www.opengeospatial.org/legal/. 
    -->
    
    <title>Record Components UML Package Validation from Req 37 to Req 43</title>
    
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
        <title>Req 39 - Record field name unique </title>
        <rule context=" //swe:DataRecord/swe:field ">
            <report
                test=" @name = preceding-sibling::swe:field/@name ">
                Each DataRecord field has a unique name.
            </report>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 40 - Vector coordinate name unique </title>
        <rule context=" //swe:Vector/swe:coordinate ">
            <report
                test=" @name = preceding-sibling::swe:coordinate/@name ">
                Each Vector coordinate has a unique name.
            </report>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 41 - Vector component no reference frame </title>
        <rule context=" //swe:Vector ">
            <report
                test=" swe:coordinate/*/@referenceFrame ">
                The reference frame is not specified on individual coordinates of a Vector.
            </report>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 42 - Vector component axis defined </title>
        <rule context=" //swe:Vector ">
            <assert
                test=" swe:coordinate/*/@axisID ">
                The axis ID is specified on all coordinates of a Vector.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 43 - Vector local frame valid </title>
        <rule context=" //swe:Vector ">
            <report
                test=" @referenceFrame = @localFrame ">
                The local and reference frames of a Vector component are different.
            </report>
        </rule>
    </pattern>
    
</schema>