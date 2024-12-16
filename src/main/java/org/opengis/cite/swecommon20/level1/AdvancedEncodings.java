package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;

/**
 * <p>
 * AdvancedEncodings class.
 * </p>
 *
 */
public class AdvancedEncodings extends DataFixture {

	/**
	 * <p>
	 * checkAdvancedEncodingsSchematron.
	 * </p>
	 */
	@Test(groups = "AdvancedEncodings", dependsOnGroups = { "BlockComponents" },
			description = "A.7 defines an additional encoding method for packaging sensor data as raw or base 64 binary blocks. When this package is implemented, the binary encoding method is usable, as any other encoding method, within the “DataArray” and “DataStream” classes")
	public void checkAdvancedEncodingsSchematron() {
		URL schRef = this.getClass().getResource("/org/opengis/cite/swecommon20/sch/A.7.AdvancedEncodings.sch");
		ETSAssert.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}

}
