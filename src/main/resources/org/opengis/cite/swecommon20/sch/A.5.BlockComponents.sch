<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        This Schematron schema checks the section A.5. Block Components UML package 
        
        OGC® SWE Common Data Model Encoding Standard.
        Copyright © 2011 Open Geospatial Consortium.
        To obtain additional rights of use, visit http://www.opengeospatial.org/legal/. 
    -->
    
    <title>Block Components UML Package Validation from Req 47 to Req 52</title>
    
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
        <title>Req 49 + 52 - Array component no value + datastream array valid</title>
        <rule context=" //swe:DataArray/swe:elementType//swe:value | //swe:Matrix/swe:elementType//swe:value | //swe:DataStream/swe:elementType//swe:value ">
            <assert
                test=" ancestor::swe:elementCount ">
                Components nested in a block component are data descriptors and shall never have inline values.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 50 - Array values properly encoded </title>
        <rule context=" //swe:DataArray/swe:values | //swe:Matrix/swe:values | //swe:DataStream/swe:values ">
            <assert
                test=" parent::*/swe:encoding ">
                An encoding method is specified whenever an encoded data block is included.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 51 - Matrix element type valid </title>
        <rule context=" //swe:Matrix/swe:elementType[*] ">
            <assert
                test=" swe:Matrix | swe:Count | swe:Quantity | swe:Time ">
                Elements of a matrix can are of scalar types or nested matrices.
            </assert>
        </rule>
    </pattern>
    
</schema>