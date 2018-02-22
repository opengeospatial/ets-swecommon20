package org.opengis.cite.swecommon20.level1;

import java.io.IOException;
import java.net.URL;

import javax.xml.stream.XMLStreamException;
import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Validator;

import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;
import org.xml.sax.SAXException;

public class SimpleComponents extends DataFixture{
	
	
	@Test(groups = "SimpleComponents", dependsOnGroups  = { "CoreConcepts" }, description="A.2 test conformance of software and encoding models implementing the conceptual models defined in Requirements Class: Basic Types and Simple Components Packages..")
	public void checkSimpleComponentsSchematron() {
		URL schRef = this.getClass().getResource(
				"/org/opengis/cite/swecommon20/sch/A.2.BasicType_SimpleComponent.sch");
		ETSAssert
				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}
	
}
