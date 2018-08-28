package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;

public class BlockComponents extends DataFixture{	
	
	@Test(groups = "BlockComponents", dependsOnGroups  = { "SimpleComponents", "SimpleEncodings" }, description="A.5 defines additional aggregate components for describing arrays of values that are designed to be encoded as efficient data blocks.")
	public void checkBlockComponentsSchematron() {
		URL schRef = this.getClass().getResource(
				"/org/opengis/cite/swecommon20/sch/A.5.BlockComponents.sch");
		ETSAssert
				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}
}
