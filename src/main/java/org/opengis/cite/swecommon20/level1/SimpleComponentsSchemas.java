package org.opengis.cite.swecommon20.level1;

import java.net.URL;
import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;

/**
 * <p>
 * SimpleComponentsSchemas class.
 * </p>
 *
 */
public class SimpleComponentsSchemas extends DataFixture {

	/**
	 * <p>
	 * checkSimpleComponentsSchemasSchematron.
	 * </p>
	 */
	@Test(groups = "SimpleComponentsSchemas", dependsOnGroups = { "SimpleComponents" },
			description = "A.8 his conformance test class and in the following shall be used to check conformance of XML instances created according to the schemas defined in this standard. They shall also be used to check conformance of software implementations that output XML instances")
	public void checkSimpleComponentsSchemasSchematron() {
		URL schRef = this.getClass()
			.getResource("/org/opengis/cite/swecommon20/sch/A.8.BasicTypesAndSimpleComponents.sch");
		ETSAssert.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}

}
