package org.opengis.cite.swecommon20.level1;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URL;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import javax.xml.namespace.QName;
import javax.xml.stream.XMLStreamException;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.Validator;

import org.apache.xerces.xs.XSModel;
import org.opengis.cite.swecommon20.SuiteAttribute;
import org.opengis.cite.validation.XmlSchemaCompiler;
import org.opengis.cite.swecommon20.util.ValidationUtils;
import org.opengis.cite.swecommon20.util.NamespaceBindings;
import org.opengis.cite.swecommon20.util.XMLUtils;
//import org.opengis.cite.iso19136.general.GML32;
import org.opengis.cite.swecommon20.Namespaces;
import org.testng.Assert;
import org.testng.ITestContext;
import org.testng.annotations.BeforeClass;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XdmValue;

/**
 * A supporting base class that provides a common fixture for validating data sets. The
 * configuration methods are invoked before any that may be defined in a subclass.
 */
public class DataFixture {

	/**
	 * Files containing tested subject.
	 */
	protected File dataFile;

	protected Document originalSubject;

	protected Document testSubject;

	protected URI testSubjectUri;

	protected String Resource_GML_Path = "/org/opengis/cite/swecommon20/xsd/opengis/gml/3.2.1/gml-3.2.1.xsd";

	protected String Resource_SWE_Path = "/org/opengis/cite/swecommon20/xsd/opengis/swe_2.0.1_flatten/swe_2.0.1.xsd";

	/**
	 * An XSModel object representing a GML application schema.
	 */
	protected XSModel model;

	/**
	 * <p>
	 * Constructor for DataFixture.
	 * </p>
	 */
	public DataFixture() {
	}

	/**
	 * <p>
	 * CreateValidator.
	 * </p>
	 * @param xsdPath a {@link java.net.URL} object
	 * @return a {@link javax.xml.validation.Validator} object
	 * @throws javax.xml.stream.XMLStreamException if any.
	 * @throws org.xml.sax.SAXException if any.
	 * @throws java.io.IOException if any.
	 */
	public Validator CreateValidator(URL xsdPath) throws XMLStreamException, SAXException, IOException {
		Schema schema;
		Set<URI> schemaRefs;
		schemaRefs = ValidationUtils.extractSchemaReferences(new StreamSource(this.dataFile),
				this.testSubjectUri.toString());
		XmlSchemaCompiler xsdCompiler = new XmlSchemaCompiler(xsdPath);
		schema = xsdCompiler.compileXmlSchema(schemaRefs.toArray(new URI[schemaRefs.size()]));
		return schema.newValidator();
	}

	/**
	 * Check XPath2.0
	 * @param xpath String denoting an xpath syntax
	 * @return XdmValue converted to string
	 */
	public String CheckXPath2(String xpath) {
		XdmValue xdmValue = null;
		try {
			xdmValue = XMLUtils.evaluateXPath2(new DOMSource(this.testSubject), xpath,
					NamespaceBindings.getStandardBindings());
		}
		catch (SaxonApiException e) {
			e.printStackTrace();
		}
		return xdmValue.toString();
	}

	/**
	 * <p>
	 * obtainTestSubject.
	 * </p>
	 * @param testContext a {@link org.testng.ITestContext} object
	 */
	@BeforeClass(alwaysRun = true)
	public void obtainTestSubject(ITestContext testContext) {
		Assert.assertTrue(testContext.getSuite().getAttributeNames().contains(SuiteAttribute.XML.getName()),
				"No data to validate.");
		this.dataFile = (File) testContext.getSuite().getAttribute(SuiteAttribute.XML.getName());
		this.model = (XSModel) testContext.getSuite().getAttribute(SuiteAttribute.XSMODEL.getName());

		Object obj = testContext.getSuite().getAttribute(SuiteAttribute.TEST_SUBJECT.getName());
		if ((null != obj) && Document.class.isAssignableFrom(obj.getClass())) {
			this.testSubject = Document.class.cast(obj);
			originalSubject = Document.class.cast(obj);
		}

		Object uriObj = testContext.getSuite().getAttribute(SuiteAttribute.TEST_SUBJECT_URI.getName());
		if ((null != uriObj)) {
			this.testSubjectUri = URI.class.cast(uriObj);
			// System.out.println(this.testSubjectUri.toString());
		}
	}
	/**
	 * A configuration method ({@code BeforeClass}) that initializes the test fixture as
	 * follows:
	 * <ol>
	 * <li>Obtain the GML data set from the test context. The suite attribute
	 * {@link org.opengis.cite.iso19136.SuiteAttribute#GML} should evaluate to a
	 * {@code File} object containing the GML data. If no such file reference exists the
	 * tests are skipped.</li>
	 * <li>Obtain the schema model from the test context. The suite attribute
	 * {@link org.opengis.cite.iso19136.SuiteAttribute#XSMODEL model} should evaluate to
	 * an {@code XSModel} object representing the GML application schema.</li>
	 * </ol>
	 * @param testContext The test (group) context.
	 */
	// @BeforeClass(alwaysRun = true)
	// public void initDataFixture(ITestContext testContext) {
	// Assert.assertTrue(
	// testContext.getSuite().getAttributeNames()
	// .contains(SuiteAttribute.XML.getName()),
	// "No data to validate.");
	// this.dataFile = (File) testContext.getSuite().getAttribute(
	// SuiteAttribute.XML.getName());
	// this.model = (XSModel) testContext.getSuite().getAttribute(
	// SuiteAttribute.XSMODEL.getName());
	//
	// Object obj = testContext.getSuite().getAttribute(
	// SuiteAttribute.TEST_SUBJECT.getName());
	// if ((null != obj) && Document.class.isAssignableFrom(obj.getClass())) {
	// this.testSubject = Document.class.cast(obj);
	// }
	// }

	/**
	 * Sets the data file. This is a convenience method intended to facilitate unit
	 * testing.
	 * @param dataFile A File containing the data to be validated.
	 */
	public void setDataFile(File dataFile) {
		this.dataFile = dataFile;
	}

	/**
	 * Sets the schema model (for unit testing purposes).
	 * @param xsModel An XSModel object representing a GML application schema.
	 */
	public void setSchemaModel(XSModel xsModel) {
		this.model = xsModel;
	}

	/**
	 * Generates an XPath expression to find all instances of the given elements in the
	 * data being validated. The supplied namespace bindings will be supplemented if
	 * necessary.
	 * @param elemNames A list of qualified names corresponding to element declarations.
	 * @param namespaceBindings A collection of namespace bindings required to evaluate
	 * the XPath expression, where each entry maps a namespace URI (key) to a prefix
	 * (value).
	 * @return An XPath (1.0) expression.
	 */
	public String generateXPathExpression(List<QName> elemNames, Map<String, String> namespaceBindings) {
		StringBuilder xpath = new StringBuilder();
		ListIterator<QName> itr = elemNames.listIterator();
		while (itr.hasNext()) {
			QName qName = itr.next();
			String namespace = qName.getNamespaceURI();
			String prefix = namespaceBindings.get(namespace);
			if (null == prefix) {
				prefix = (namespace.equals(Namespaces.SWE)) ? "swe" : "ns" + itr.previousIndex();
				namespaceBindings.put(namespace, prefix);
			}
			xpath.append("//").append(prefix).append(":");
			xpath.append(qName.getLocalPart());
			if (itr.hasNext())
				xpath.append(" | "); // union operator
		}
		return xpath.toString();
	}

}
