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

public class ChoiceComponents extends DataFixture{	
	
	@Test(groups = "ChoiceComponents", dependsOnGroups  = { "SimpleComponents" }, description="A.4 a disjoint union component type. This aggregate type can be nested with other aggregate components to build complex structures.")
	public void checkChoiceComponentsSchematron() {
		URL schRef = this.getClass().getResource(
				"/org/opengis/cite/swecommon20/sch/A.4.ChoiceComponents.sch");
		ETSAssert
				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}
}
