/*
 * Copyright 1999-2004 The Apache Software Foundation.
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
 * $Id: ExtensionNamespaceSupport.java,v 1.6 2004/02/11 05:26:23 minchau Exp $
 */
package org.apache.xalan.extensions;

import java.lang.reflect.Constructor;

import javax.xml.transform.TransformerException;

/**
 * During styleseet composition, an ExtensionNamespaceSupport object is created for each extension 
 * namespace the stylesheet uses. At the beginning of a transformation, TransformerImpl generates
 * an ExtensionHandler for each of these objects and adds an entry to the ExtensionsTable hashtable.
 */
public class ExtensionNamespaceSupport
{
  // Namespace, ExtensionHandler class name, constructor signature 
  // and arguments.
  String m_namespace = null;
  String m_handlerClass = null;
  Class [] m_sig = null;  
  Object [] m_args = null;
 
  public ExtensionNamespaceSupport(String namespace, 
                                   String handlerClass, 
                                   Object[] constructorArgs)
  {
    ;
    ;
    ;
    // Create the constructor signature.
    ;
    for (int i = 1; i < m_args.length; i++)
    {
      if (m_args[i] != null)
        m_sig[i] = m_args[i].getClass();//System.out.println("arg class " + i + " " +m_sig[i]);
      else // If an arguments is null, pick the constructor later.
      {
        m_sig = null;
        break;
      }
    }
  }
  
  public String getNamespace()
  {
    return m_namespace;
  }
  
  /**
   * Launch the ExtensionHandler that this ExtensionNamespaceSupport object defines.
   */
  public ExtensionHandler launch()
    throws TransformerException
  {
    ExtensionHandler handler = null;
    try
    {
      Class cl = ExtensionHandler.getClassForName(m_handlerClass);
      Constructor con = null;
      //System.out.println("class " + cl + " " + m_args + " " + m_args.length + " " + m_sig);
      if (m_sig != null)
        con = cl.getConstructor(m_sig);
      else // Pick the constructor based on number of args.
      {
        Constructor[] cons = cl.getConstructors();
        for (int i = 0; i < cons.length; i ++)
        {
          if (cons[i].getParameterTypes().length == m_args.length)
          {
            con = cons[i];
            break;
          }
        }
      }
      // System.out.println("constructor " + con);
      if (con != null)
        handler = (ExtensionHandler)con.newInstance(m_args);
      else
        throw new TransformerException("ExtensionHandler constructor not found");
    }
    catch (Exception e)
    {
      throw new TransformerException(e);
    }
    return handler;
  }

}
