package org.opengis.cite.swecommon20.level1;

import java.io.IOException;
import java.net.URL;

import javax.xml.stream.XMLStreamException;
import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMSource;
import javax.xml.validation.Validator;

import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;
import org.xml.sax.SAXException;

public class CoreConcept extends DataFixture{

	@Test(groups = "A.1.1 Core concepts are the base of all derived models", description = "Validate the XML document using the XML schema document")
	public void ObservationValidation() {
		URL entityCatalog = this.getClass().getResource("/org/opengis/cite/swecommon20/xsd/opengis/we_2.0.1_flatten/swe_2.0.1.xsd");
		Source source = new DOMSource(this.testSubject);
		Validator validator;
		try {
			validator = CreateValidator(entityCatalog);
			ETSAssert.assertSchemaValid(validator, source);
		} catch (XMLStreamException | SAXException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
