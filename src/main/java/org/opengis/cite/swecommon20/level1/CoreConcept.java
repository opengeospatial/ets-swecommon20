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

public class CoreConcept extends DataFixture{

	@Test(groups = "CoreConceptsBase", description = "A.1.1 Core concepts are the base of all derived models. Validate the XML document using the XML schema document")
	public void Core() throws XMLStreamException, SAXException, IOException {
		URL entityCatalog = this.getClass().getResource("/org/opengis/cite/swecommon20/xsd/opengis/swe_2.0.1_flatten/swe_2.0.1.xsd");
		Source source = new DOMSource(this.testSubject);
		Validator validator;
//		try {
			validator = CreateValidator(entityCatalog);
			ETSAssert.assertSchemaValid(validator, source);
//		} catch (XMLStreamException | SAXException | IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
	
	@Test(groups = "CoreConcepts", dependsOnGroups  = { "CoreConceptsBase" }, description="A.1 Validate all conformance classes in core concepts by using schematron file.")
	public void checkCoreConceptsSchematron() {
		URL schRef = this.getClass().getResource(
				"/org/opengis/cite/swecommon20/sch/A.1.CoreConcepts.sch");
		ETSAssert
				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}
	
//	@Test(groups = "SimpleComponents", dependsOnGroups  = { "CoreConcepts" }, description="A.2 test conformance of software and encoding models implementing the conceptual models defined in Requirements Class: Basic Types and Simple Components Packages..")
//	public void checkSimpleComponentsSchematron() {
//		URL schRef = this.getClass().getResource(
//				"/org/opengis/cite/swecommon20/sch/A.2.BasicType_SimpleComponent.sch");
//		ETSAssert
//				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
//	}
	
//	@Test(groups = "RecordComponents", dependsOnGroups  = { "SimpleComponents" }, description="A.3 classes modeling record style component types that can be nested to build complex structures from the simple component types")
//	public void checkRecordComponentsSchematron() {
//		URL schRef = this.getClass().getResource(
//				"/org/opengis/cite/swecommon20/sch/A.3.RecordComponents.sch");
//		ETSAssert
//				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
//	}
//	
//	@Test(groups = "ChoiceComponents", dependsOnGroups  = { "SimpleComponents" }, description="A.3 classes modeling record style component types that can be nested to build complex structures from the simple component types")
//	public void checkChoiceComponentsSchematron() {
//		URL schRef = this.getClass().getResource(
//				"/org/opengis/cite/swecommon20/sch/A.3.RecordComponents.sch");
//		ETSAssert
//				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
//	}
}
