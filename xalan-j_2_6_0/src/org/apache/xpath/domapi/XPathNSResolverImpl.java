/*
 * Copyright 2002-2004 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*
 * $Id$
 */

package org.apache.xpath.domapi;

import org.apache.xml.utils.PrefixResolverDefault;
import org.w3c.dom.Node;
import org.w3c.dom.xpath.XPathNSResolver;

/**
 *
 * The class provides an implementation XPathNSResolver according 
 * to the DOM L3 XPath API Specification, Working Draft 28, March 2002.
 * 
 * 
 * <p>The <code>XPathNSResolver</code> interface permit <code>prefix</code> 
 * strings in the expression to be properly bound to 
 * <code>namespaceURI</code> strings. <code>XPathEvaluator</code> can 
 * construct an implementation of <code>XPathNSResolver</code> from a node, 
 * or the interface may be implemented by any application.</p>
 * <p>See also the <a href='http://www.w3.org/TR/2002/WD-DOM-Level-3-XPath-20020328'>Document Object Model (DOM) Level 3 XPath Specification</a>.</p>
 * 
 * @see org.w3c.dom.xpath.XPathNSResolver
 * @xsl.usage experimental
 */
public class XPathNSResolverImpl extends PrefixResolverDefault implements XPathNSResolver {

	/**
	 * Constructor for XPathNSResolverImpl.
	 * @param xpathExpressionContext
	 */
	public XPathNSResolverImpl(Node xpathExpressionContext) {
		super(xpathExpressionContext);
	}

	/**
	 * @see org.w3c.dom.xpath.XPathNSResolver#lookupNamespaceURI(String)
	 */
	public String lookupNamespaceURI(String prefix) {
		return super.getNamespaceForPrefix(prefix);
	}

}
