package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.SkipException;
import org.testng.annotations.Test;

/**
 * <p>
 * RecordComponents class.
 * </p>
 *
 */
public class RecordComponents extends DataFixture {

	/**
	 * <p>
	 * checkRecordComponentsSchematron.
	 * </p>
	 */
	@Test(groups = "RecordComponents", dependsOnGroups = { "SimpleComponents" },
			description = "A.3 classes modeling record style component types that can be nested to build complex structures from the simple component types")
	public void checkRecordComponentsSchematron() {
		String hasResult = this.CheckXPath2("boolean(//swe:DataRecord or //swe:Vector)");
		if (hasResult.equals("false"))
			throw new SkipException("No record components found.");
		URL schRef = this.getClass().getResource("/org/opengis/cite/swecommon20/sch/A.3.RecordComponents.sch");
		ETSAssert.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}

}
