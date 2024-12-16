package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.SkipException;
import org.testng.annotations.Test;

/**
 * <p>
 * BlockComponents class.
 * </p>
 *
 */
public class BlockComponents extends DataFixture {

	/**
	 * <p>
	 * checkBlockComponentsSchematron.
	 * </p>
	 */
	@Test(groups = "BlockComponents", dependsOnGroups = { "SimpleComponents", "SimpleEncodings" },
			description = "A.5 defines additional aggregate components for describing arrays of values that are designed to be encoded as efficient data blocks.")
	public void checkBlockComponentsSchematron() {
		String hasResult = this.CheckXPath2("boolean(//swe:DataArray | //swe:Matrix | //swe:DataStream)");
		if (hasResult.equals("false"))
			throw new SkipException("No block components found.");

		URL schRef = this.getClass().getResource("/org/opengis/cite/swecommon20/sch/A.5.BlockComponents.sch");
		ETSAssert.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}

}
