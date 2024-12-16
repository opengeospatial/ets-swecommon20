package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;

/**
 * <p>
 * AdvancedEncodingsSchema class.
 * </p>
 *
 */
public class AdvancedEncodingsSchema extends DataFixture {

	/**
	 * <p>
	 * checkAdvancedEncodingsSchemaSchematron.
	 * </p>
	 */
	@Test(groups = "AdvancedEncodingsSchema", dependsOnGroups = { "SimpleComponents" },
			description = "Conformance Test Class A.13")
	public void checkAdvancedEncodingsSchemaSchematron() {
		URL schRef = this.getClass().getResource("/org/opengis/cite/swecommon20/sch/A.13.AdvancedEncodingsSchema.sch");
		ETSAssert.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}

}
