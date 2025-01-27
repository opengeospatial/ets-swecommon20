package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;

/**
 * <p>
 * SimpleEncodings class.
 * </p>
 *
 */
public class SimpleEncodings extends DataFixture {

	/**
	 * <p>
	 * checkSimpleEncodingsSchematron.
	 * </p>
	 */
	@Test(groups = "SimpleEncodings", dependsOnGroups = { "SimpleComponents" },
			description = "A.6 provide definitions of simple encoding methods. They are used as descriptors of the method used to encode data component values wrapped by aggregate classes defined in the 'Block Components' package.")
	public void checkSimpleEncodingsSchematron() {
		URL schRef = this.getClass().getResource("/org/opengis/cite/swecommon20/sch/A.6.SimpleEncodings.sch");
		ETSAssert.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}

}
