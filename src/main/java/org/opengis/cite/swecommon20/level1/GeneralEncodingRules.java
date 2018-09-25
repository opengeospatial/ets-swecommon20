package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;

public class GeneralEncodingRules extends DataFixture{	
	
	@Test(groups = "GeneralEncodingRules", dependsOnGroups  = { "SimpleComponents" }, description="Conformance Test Class A.14")
	public void checkGeneralEncodingRulesSchematron() {
		URL schRef = this.getClass().getResource(
				"/org/opengis/cite/swecommon20/sch/A.14.GeneralEncodingRules.sch");
		ETSAssert
				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}
}
