package org.opengis.cite.swecommon20.level1;

import java.net.URL;

import javax.xml.transform.stream.StreamSource;
import org.opengis.cite.swecommon20.ETSAssert;
import org.testng.SkipException;
import org.testng.annotations.Test;

public class ChoiceComponents extends DataFixture{	
	
	@Test(groups = "ChoiceComponents", dependsOnGroups  = { "SimpleComponents" }, description="A.4 a disjoint union component type. This aggregate type can be nested with other aggregate components to build complex structures.")
	public void checkChoiceComponentsSchematron() {
		String hasResult = this.CheckXPath2("boolean(//swe:DataChoice)");
		if (hasResult.equals("false"))
			throw new SkipException("Not choice components data.");
		
		URL schRef = this.getClass().getResource(
				"/org/opengis/cite/swecommon20/sch/A.4.ChoiceComponents.sch");
		ETSAssert
				.assertSchematronValid(schRef, new StreamSource(this.dataFile));
	}
}
