<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        This Schematron schema checks the section A.2. Basic types and Simple component UML package 
        
        OGC® SWE Common Data Model Encoding Standard.
        Copyright © 2011 Open Geospatial Consortium.
        To obtain additional rights of use, visit http://www.opengeospatial.org/legal/. 
    -->
    
    <title>Basic Types and Simple Components UML Packages Validation from Req 14 to Req 36</title>
    
    <ns
        prefix="swe"
        uri="http://www.opengis.net/swe/2.0"/>
    <ns
        prefix="sos"
        uri="http://www.opengis.net/sos/2.0"/>
    <ns
        prefix="xsi"
        uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns
        prefix="xlink"
        uri="http://www.w3.org/1999/xlink"/>
    
    <pattern>
        <title>Req 18 - definition present </title>
        <rule context="//swe:Quantity | //swe:Count[not(parent::swe:elementCount)] | //swe:Time | //swe:Boolean | //swe:Category | //swe:Text">
            <assert
                test=" @definition and starts-with(@definition, 'http://') ">
                The 'definition' attribute is mandatory on all simple data components and it is a HTTP URI
            </assert>
        </rule>
        <rule context="//swe:QuantityRange | //swe:CountRange | //swe:TimeRange | //swe:CategoryRange">
            <assert test="@definition and starts-with(@definition, 'http://')">
                The 'definition' attribute is mandatory on all range data components and it is a HTTP URI
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 20 - axis defined</title>
        <rule context=" //swe:Quantity[(contains(lower-case(@definition), 'gml') or contains(lower-case(@definition), 'location'))] 
                            | //swe:QuantityRange[(contains(lower-case(@definition), 'gml') or contains(lower-case(@definition), 'location'))] 
                            | //swe:Category[(contains(lower-case(@definition), 'gml') or contains(lower-case(@definition), 'location'))] 
                            | //swe:Text[(contains(lower-case(@definition), 'gml') or contains(lower-case(@definition), 'location'))]">
            <assert
                test=" @axisID and @axisID castable as xs:string ">
                The axisID is always specified on scalar spatial properties.
                The axisID must represent a property projected along a spatial axis.
            </assert>
        </rule>
        <!--<rule context="//swe:Quantity | //swe:Count[not(parent::swe:elementCount)] | //swe:Time | //swe:Boolean | //swe:Category | //swe:Text | //swe:QuantityRange | //swe:CountRange | //swe:TimeRange | //swe:CategoryRange">
            <assert
                test=" @axisID = 'X' or @axisID = 'Y' or @axisID = 'Z' or @axisID = 'Lat' or @axisID = 'Long' or @axisID = 'h' or @axisID = 'H' or @axisID = 'T'">
                The axisID must represent a property projected along a spatial axis.
            </assert>
        </rule>-->
    </pattern>
    
    <pattern>
        <title>Req 21 - Reference frame defined</title>
        <!--<rule context="//swe:Quantity[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | //swe:Count[not(parent::swe:elementCount) and not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | //swe:Time[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | //swe:Boolean[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | //swe:Category[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | 
            //swe:Text[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | //swe:QuantityRange[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | //swe:CountRange[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | //swe:TimeRange[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] | //swe:CategoryRange[not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])]">
            <assert
                test=" @referenceFrame and @referenceFrame castable as xs:anyURI ">
                The reference frame is specified on scalar spatial properties.
            </assert>
        </rule>-->
        <rule context="//swe:Quantity[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType) and (contains(lower-case(@definition), 'gml') or contains(lower-case(@definition), 'location')) and not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] 
                        | //swe:Time[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType) and not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] 
                        | //swe:Category[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType) and (contains(lower-case(@definition), 'gml') or contains(lower-case(@definition), 'location')) and not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] 
                        | //swe:Text[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType) and (contains(lower-case(@definition), 'gml') or contains(lower-case(@definition), 'location')) and not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] 
                        | //swe:QuantityRange[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType) and not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] 
                        | //swe:TimeRange[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType) and not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])] 
                        | //swe:CategoryRange[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType) and (contains(lower-case(@definition), 'gml') or contains(lower-case(@definition), 'location')) and not(ancestor::swe:Vector[@referenceFrame]) and not(ancestor::swe:Matrix[@referenceFrame])]">
            <assert
                test=" (@referenceFrame and @referenceFrame castable as xs:anyURI) or @referenceTime ">
                The reference frame is specified on scalar spatial or temporal properties.
            </assert>
        </rule>
        
        <!--<rule context="//swe:Quantity[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])] | //swe:Count[not(parent::swe:elementCount) and ((ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame]))] | //swe:Time[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])] | //swe:Boolean[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])] | //swe:Category[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])] | 
            //swe:Text[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])] | //swe:QuantityRange[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])] | //swe:CountRange[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])] | //swe:TimeRange[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])] | //swe:CategoryRange[(ancestor::swe:Vector[@referenceFrame]) or (ancestor::swe:Matrix[@referenceFrame])]">
            <assert
                test=" @referenceFrame or not(@referenceFrame)">
                The reference frame is specified on scalar spatial properties not part of a vector or Matrix.
            </assert>
        </rule> -->    
    </pattern>
    
    <!--<pattern>
        <title>Req 23 - value attribute present</title>
        <rule context="//swe:Quantity | //swe:Count[not(parent::swe:elementCount)] | //swe:Time | //swe:Boolean | //swe:Category | //swe:Text | //swe:QuantityRange | //swe:CountRange | //swe:TimeRange | //swe:CategoryRange">
            <assert
                test=" @value ">
                All derived simple components have an optional value attribute.
            </assert>
        </rule>
    </pattern>-->
    
    <pattern>
        <title>Req 25 - Category enum defined</title>
        <rule context=" //swe:Category ">
            <assert
                test=" swe:codeSpace | swe:constraint ">
                A Category component always specifies a list of possible values.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 27 - Time reference frame defined</title>
        <rule context=" //swe:Time[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType)] ">
            <assert
                test=" @referenceFrame or @referenceTime ">
                The temporal reference frame is defined.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 29 - Time local frame valid</title>
        <rule context=" //swe:Time[not(ancestor::sos:resultStructure) and not(ancestor::swe:elementType)] ">
            <report
                test=" @referenceFrame = @localFrame ">
                The local and reference frames of a Time component are different.
            </report>
        </rule>
    </pattern>
    
    <pattern>
        <title>Req 35 - Nil value type coherent</title>
        <rule context=" //swe:nilValue[ancestor::swe:Boolean] ">
            <assert
                test=" text() castable as xs:boolean ">
                Values reserved for NIL reasons are compatible with the component data type. Need a boolean value.
            </assert>
        </rule>
        <rule context=" //swe:nilValue[ancestor::swe:Text] | //swe:nilValue[ancestor::swe:Category] ">
            <assert
                test=" text() castable as xs:string ">
                Values reserved for NIL reasons are compatible with the component data type. Need a string value.
            </assert>
        </rule>
        <rule context=" //swe:nilValue[ancestor::swe:Count] ">
            <assert
                test=" text() castable as xs:integer ">
                Values reserved for NIL reasons are compatible with the component data type. Need an integer value.
            </assert>
        </rule>
        <rule context=" //swe:nilValue[ancestor::swe:Quantity] ">
            <assert
                test=" text()='NaN' or text()='-INF' or text()='INF' ">
                Values reserved for NIL reasons are compatible with the component data type. Need real value (NaN or -INF or INF).
            </assert>
        </rule>
    </pattern>
    
    
</schema>