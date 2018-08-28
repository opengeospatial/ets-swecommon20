package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.annotations.Test;

public class RecordComponents extends DataFixture{	
	
	@Test(groups = "RecordComponents", dependsOnGroups  = { "SimpleComponents" }, description="A.3 classes modeling record style component types that can be nested to build complex structures from the simple component types")
	public void checkRecordComponentsSchematron() {
		URL schRef = this.getClass().getResource(
				"/org/opengis/cite/swecommon20/sch/A.3.RecordComponents.sch");
		ETSAssert
				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}	
}
