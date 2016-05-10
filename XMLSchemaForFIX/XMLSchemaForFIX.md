Global Technical Committee

# XML Schema for FIX

Technical Standard Proposal

May 3, 2016

Revision 2



*DISCLAIMER*

THE INFORMATION CONTAINED HEREIN AND THE FINANCIAL INFORMATION EXCHANGE PROTOCOL (COLLECTIVELY, THE "FIX PROTOCOL") ARE PROVIDED "AS IS" AND NO PERSON OR ENTITY ASSOCIATED WITH THE FIX PROTOCOL MAKES ANY REPRESENTATION OR WARRANTY, EXPRESS OR IMPLIED, AS TO THE FIX PROTOCOL (OR THE RESULTS TO BE OBTAINED BY THE USE THEREOF) OR ANY OTHER MATTER AND EACH SUCH PERSON AND ENTITY SPECIFICALLY DISCLAIMS ANY WARRANTY OF ORIGINALITY, ACCURACY, COMPLETENESS, MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. SUCH PERSONS AND ENTITIES DO NOT WARRANT THAT THE FIX PROTOCOL WILL CONFORM TO ANY DESCRIPTION THEREOF OR BE FREE OF ERRORS. THE ENTIRE RISK OF ANY USE OF THE FIX PROTOCOL IS ASSUMED BY THE USER.

NO PERSON OR ENTITY ASSOCIATED WITH THE FIX PROTOCOL SHALL HAVE ANY LIABILITY FOR DAMAGES OF ANY KIND ARISING IN ANY MANNER OUT OF OR IN CONNECTION WITH ANY USER'S USE OF (OR ANY INABILITY TO USE) THE FIX PROTOCOL, WHETHER DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL (INCLUDING, WITHOUT LIMITATION, LOSS OF DATA, LOSS OF USE, CLAIMS OF THIRD PARTIES OR LOST PROFITS OR REVENUES OR OTHER ECONOMIC LOSS), WHETHER IN TORT (INCLUDING NEGLIGENCE AND STRICT LIABILITY), CONTRACT OR OTHERWISE, WHETHER OR NOT ANY SUCH PERSON OR ENTITY HAS BEEN ADVISED OF, OR OTHERWISE MIGHT HAVE ANTICIPATED THE POSSIBILITY OF, SUCH DAMAGES.

**DRAFT OR NOT RATIFIED PROPOSALS** (REFER TO PROPOSAL STATUS AND/OR SUBMISSION STATUS ON COVER PAGE) ARE PROVIDED "AS IS" TO INTERESTED PARTIES FOR DISCUSSION ONLY. PARTIES THAT CHOOSE TO IMPLEMENT THIS DRAFT PROPOSAL DO SO AT THEIR OWN RISK. IT IS A DRAFT DOCUMENT AND MAY BE UPDATED, REPLACED, OR MADE OBSOLETE BY OTHER DOCUMENTS AT ANY TIME. THE FPL GLOBAL TECHNICAL COMMITTEE WILL NOT ALLOW EARLY IMPLEMENTATION TO CONSTRAIN ITS ABILITY TO MAKE CHANGES TO THIS SPECIFICATION PRIOR TO FINAL RELEASE. IT IS INAPPROPRIATE TO USE FPL WORKING DRAFTS AS REFERENCE MATERIAL OR TO CITE THEM AS OTHER THAN “WORKS IN PROGRESS”. THE FPL GLOBAL TECHNICAL COMMITTEE WILL ISSUE, UPON COMPLETION OF REVIEW AND RATIFICATION, AN OFFICIAL STATUS ("APPROVED") OF/FOR THE PROPOSAL AND A RELEASE NUMBER.

No proprietary or ownership interest of any kind is granted with respect to the FIX Protocol (or any rights therein).

Copyright 2016 FIX Protocol Limited, all rights reserved.

|              |           |               |                       |
|--------------|-----------|---------------|-----------------------|
| **Revision** | **Date**  | **Author**    | **Revision Comments** |
| 1            | 4/13/2016 | Don Mendelson | Initial version       |
| 2            | 5/03/2016 | Don Mendelson | Title change          |
|              |           |               |                       |
|              |           |               |                       |


Introduction
============

Various FIX protocols and standards supply XML schemas. Users should expect a consistent style and versioning mechanism across all FIX Protocol products.

Authors
-------

Provide list of authors of technical standard, their company or organizational affiliation, public email and or telephone number, and role in drafting the standard.

|                 |                 |             |          |
|-----------------|-----------------|-------------|----------|
| **Name**        | **Affiliation** | **Contact** | **Role** |
| Don Mendelson   |                 |             |          |
| Jim Northey     |                 |             |          |
| Richard Shriver |                 |             |          |
|                 |                 |             |          |

Business Requirements
=====================

Consistent style
----------------

This proposal is to improve consistency in style across all FIX XML schemas. Also, users should be presented with only one versioning scheme across those products.

Among the FIX standards that have XML schemas are:

-   FIX Repository

-   FIXML

-   SBE message schema

-   FIXatdl

Schema sources
--------------

Based on the XML namespace of schema, a developer should be able to locate the XML schema. This need implies a naming convention and a process for publishing schemas. However, users should not expect the FIX Trading Community to serve XML schemas in real-time to operational systems.

Issues and Discussion Points
============================

Namespace
---------

All FIX products that have an XML namespace should follow a common convention for naming. A common base URI would allow all FIX schemas to be served from a common host, such as GitHub or Confluence.

Versioning
----------

Users need to know whether they have the current version of a schema, or alternatively, they need to know where to locate a specific historical version.

Namespace plays a role in versioning. Breaking changes require a new namespace. However, non-breaking enhancements should not require code changes by users.

Style
-----

A consistent style across all FIX schemas will allow users to treat them with common processes. Style includes:

-   Naming conventions for namepaces, elements and attributes

-   Standard copyright notice

References
==========
| **Reference**                        | **Version** | **Relevance**  | **Normative** |
|--------------------------------------|-------------|----------------|---------------|
| XML Schema Versioning section 4      |             |                | Yes
 http://www.xfront.com/Versioning.pdf  |             | Recommendation | No            |
|                                      |             |                |               |

Relevant and Related Standards
==============================
| **Related Standard** | **Version** | **Reference location**               | **Relationship** | **Normative** |
|----------------------|-------------|--------------------------------------|------------------|---------------|
| XML Schema           | 2012        | https://www.w3.org/TR/xmlschema11-1/ | Dependency       | Yes           |
| Namespaces           | 2006        | https://www.w3.org/TR/xml-names11/   | Dependency       | Yes           |
|                      |             |                                      |                  |               |
|                      |             |                                      |                  |               |

Intellectual Property Disclosure
================================
None


FIX XML Schema Standard
=======================

Namespace convention
--------------------

All FIX XML namespaces must be named according to the following pattern:

>http://www.fixprotocol.io/yyyy/protocol-name<

where

`http://www.fixprotocol.io` is literal

`yyyy` is the year that a major version was released

`protocol-name` is the base name of the schema in lower case

### Namespace qualification

The qualification of element and attribute names should be specified as follows:

```xml
 elementFormDefault="qualified" attributeFormDefault="unqualified"
```

The impact of this specification is that that FIX schema elements must be qualified by namespace in XML documents that mix schemas. It makes clear which elements belong to FIX. (Unqualified is the default value for both element and attribute qualification.)

### Namespace not a URL

An XML namespace is only guaranteed to be a unique name, not a URL for downloading the schema. Protocol documentation should make this clear. Nevertheless, the URI should point to a web page that tells where to locate schemas of current and historical versions.

Schema versioning
-----------------

The major version of an XML schema should be the year that it was released. It is used in the namespace name as described above. A benefit of this approach is that it supports an intuitive assessment of current versus outdated versions.

Non-breaking minor enhancements should not cause the namespace to change, however. This allows dependent code to continue to interoperate without change.

Full versions must be embedded in the version attribute of the <schema> element. This version should correspond to the version of the protocol that it belongs to.

FIX version metadata
--------------------

Some FIX files, such as Repository and FIXML, are specific to a FIX version. FIX version should be represented by common attributes in all FIX XML schemas. See appendix A for XML schema for version metadata.

Copyright and license notice
----------------------------

Copyright and license notices should be embedded in the <schema> element as a <documentation> element.

Copyright notice should be of the form:

```xml
© Copyright yyyy FIX Protocol Limited
```

where yyyy is the year of publication

Element and attribute naming convention
---------------------------------------

Capitalization of element and attribute names should be lower camel case. That is, the first letter is lower case, and subsequent first letters of words are upper case. For example, “compositeDataType”.

Appendix A - Usage Examples
===========================

**FIX version metadata schema**

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- edited with XMLSpy v2013 rel. 2 sp2 (x64) (http://www.altova.com) by Richard Shriver (R. Shriver Associates LLC) -->

<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" attributeFormDefault="unqualified">

<!--FIX version data-->

<xs:attributeGroup name="fixVersionInfo">

<xs:annotation>

<xs:documentation>Contains the application level versioning information.</xs:documentation>

</xs:annotation>

<xs:attribute name="fixVersion" type="fixVersion\_t" use="required"/>

<xs:attribute name="fixExtensionpack" type="fixExtensionpack\_t" use="optional"/>

<xs:attribute name="customVersion" type="customVersion\_t" use="optional"/>

</xs:attributeGroup>

<xs:simpleType name="fixVersion\_t">

<xs:annotation>

<xs:documentation>The FIX version</xs:documentation>

</xs:annotation>

<xs:restriction base="xs:string">

<xs:enumeration value="FIX 4.0"/>

<xs:enumeration value="FIX 4.1"/>

<xs:enumeration value="FIX 4.2"/>

<xs:enumeration value="FIX 4.3"/>

<xs:enumeration value="FIX 4.4"/>

<xs:enumeration value="FIX 5.0"/>

<xs:enumeration value="FIX 5.0SP1"/>

<xs:enumeration value="FIX 5.0SP2"/>

</xs:restriction>

</xs:simpleType>

<xs:simpleType name="fixExtensionpack\_t">

<xs:annotation>

<xs:documentation>The FIX extensionpack</xs:documentation>

</xs:annotation>

<xs:restriction base="xs:string">

<xs:pattern value="EP\[0-9\]{3,4}"/>

</xs:restriction>

</xs:simpleType>

<xs:simpleType name="customVersion\_t">

<xs:annotation>

<xs:documentation>The custom version</xs:documentation>

</xs:annotation>

<xs:restriction base="xs:string"/>

</xs:simpleType>

</xs:schema>
```

**Schema element example**

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" targetNamespace=>http://fixprotocol.io/2016/myprotocol<

elementFormDefault="qualified"

version="1.2">

<xs:annotation>

<xs:documentation>

© Copyright 2016 FIX Protocol Limited

Creative Commons Attribution-NoDerivatives 4.0

International Public License

</xs:documentation>

</xs:annotation>

. . .

</xs:schema>
```

Appendix B – Compliance Strategy
================================

The technical standard must include some plan for measuring compliance with the standard. This will either be test suites, a validation tool (such as an XML Schema document as an example).