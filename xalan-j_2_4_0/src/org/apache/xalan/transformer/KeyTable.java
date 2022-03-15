/*
 * The Apache Software License, Version 1.1
 *
 *
 * Copyright (c) 1999 The Apache Software Foundation.  All rights 
 * reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:  
 *       "This product includes software developed by the
 *        Apache Software Foundation (http://www.apache.org/)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Xalan" and "Apache Software Foundation" must
 *    not be used to endorse or promote products derived from this
 *    software without prior written permission. For written 
 *    permission, please contact apache@apache.org.
 *
 * 5. Products derived from this software may not be called "Apache",
 *    nor may "Apache" appear in their name, without prior written
 *    permission of the Apache Software Foundation.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL THE APACHE SOFTWARE FOUNDATION OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of the Apache Software Foundation and was
 * originally based on software copyright (c) 1999, Lotus
 * Development Corporation., http://www.lotus.com.  For more
 * information on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 */
package org.apache.xalan.transformer;

import java.util.Hashtable;
import java.util.Vector;

import javax.xml.transform.TransformerException;
import org.apache.xml.dtm.DTM;
import org.apache.xml.utils.PrefixResolver;
import org.apache.xml.utils.QName;
import org.apache.xml.utils.XMLString;
import org.apache.xpath.XPathContext;
import org.apache.xpath.objects.XNodeSet;

/**
 * <meta name="usage" content="advanced"/>
 * Table of element keys, keyed by document node.  An instance of this
 * class is keyed by a Document node that should be matched with the
 * root of the current context.  It contains a table of name mappings
 * to tables that contain mappings of identifier values to nodes.
 */
public class KeyTable
{

  /**
   * The document key.  This table should only be used with contexts
   * whose Document roots match this key.
   */
  private int m_docKey;

  /**
   * Get the document root matching this key.  
   *
   *
   * @return the document root matching this key
   */
  public int getDocKey()
  {
    return m_docKey;
  }

  /** 
   * The main iterator that will walk through the source  
   * tree for this key.
   */
  private XNodeSet m_keyNodes;
  
  KeyIterator getKeyIterator()
  {
  	return (KeyIterator)(m_keyNodes.getContainedIter());
  }

  /**
   * Build a keys table.
   * @param doc The owner document key.
   * @param nscontext The stylesheet's namespace context.
   * @param name The key name
   * @param keyDeclarations The stylesheet's xsl:key declarations.
   * @param xmlLiaison The parser liaison for support of getNodeData(useNode).
   *
   * @throws javax.xml.transform.TransformerException
   */
  public KeyTable(
          int doc, PrefixResolver nscontext, QName name, Vector keyDeclarations, XPathContext xctxt)
            throws javax.xml.transform.TransformerException
  {

    m_docKey = doc;
    KeyIterator ki = new KeyIterator(name, keyDeclarations);
    
    m_keyNodes = new XNodeSet(ki);
    m_keyNodes.allowDetachToRelease(false);
    
    m_keyNodes.setRoot(doc, xctxt);

  }  

  /**
   * Given a valid element key, return the corresponding node list.
   * 
   * @param The name of the key, which must match the 'name' attribute on xsl:key.
   * @param ref The value that must match the value found by the 'match' attribute on xsl:key.
   * @return If the name was not declared with xsl:key, this will return null,
   * if the identifier is not found, it will return null,
   * otherwise it will return a LocPathIterator instance.
   */
  public XNodeSet getNodeSetDTMByKey(QName name, XMLString ref)
  {
  	Vector keyDecls = getKeyIterator().getKeyDeclarations();
  	org.apache.xml.dtm.DTMIterator keyNodes = m_keyNodes.iter();
	XNodeSet refNodes = new XNodeSet( new KeyRefIterator(name, ref, keyDecls, keyNodes) );
	
	// I don't think setRoot needs to be called on refNodes!
	return refNodes;

  }

  /**
   * Get Key Name for this KeyTable  
   *
   *
   * @return Key name
   */
  public QName getKeyTableName()
  {
    return getKeyIterator().getName();
  }
  
}
