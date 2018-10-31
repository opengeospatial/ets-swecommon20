# Overview
This test suite is based on the following OGC specification:
  * OGC® SWE Common Data Model Encoding Standard [OGC 10-025r1](http://portal.opengeospatial.org/files/?artifact_id=41157)
  
## What is tested 
Comformance Class Section | No. of Req | Content of Requirement | Available in testsuite | Notes
|---|---|---|---|---|
A.1 | 1-13 | Core Concepts | OK | 
A.2 | 14-36 | Simple Components | Partially available | req. 16, 17, 19, 24, 26, 28, 32, 34, 36 are not supported yet.
A.3 | 37-43 | Record Components | OK |  
A.4 | 44-46 | Choice Components | OK | 
A.5 | 47-52 | Block Components | OK | 
A.6 | 53-54 | Simple Encodings | OK | 
A.7 | 55-56 | Advanced Encodings | OK | 
A.8 | 57-66 | Basic Types and Simple Components Schemas | OK |
A.9 | 67-68 | Record Components Schema | OK |
A.10 | 69-70 | Choice Components Schema | OK |
A.11 | 71-73 | Block Components Schema | OK |
A.12 | 74-76 | Simple Encodings schema | OK |
A.13 | 77-85 | Advanced Encodings Schema| OK |
A.14 | 86-89 | General Encoding Rules | OK |
A.15 | 90-93 | Text Encoding Rules | OK |
A.16 | 94-100 | XML Encoding Rules | OK |
A.17 | 101-105 | Binary Encoding Rules | OK |
 
## What is not tested 
Please reference the availability column in the previous table that marked as not "ok".
 
## The test data 
* [Samples](https://github.com/opengeospatial/ets-swecommon20/tree/master/src/test/resources/examples) 
* Reference implementations
  - [SOS Service from 52North](http://sensorweb.demo.52north.org/52n-sos-webapp/service?request=GetResultTemplate&service=SOS&version=2.0.0&offering=http%3A%2F%2Fwww.52north.org%2Ftest%2Foffering%2F6&observedProperty=http%3A%2F%2Fwww.52north.org%2Ftest%2FobservableProperty%2F6)
 ## Release Notes  
Release notes are available [here.](relnotes.html) 