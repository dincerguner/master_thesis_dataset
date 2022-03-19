/*
 * Copyright (c) 2000 World Wide Web Consortium,
 * (Massachusetts Institute of Technology, Institut National de
 * Recherche en Informatique et en Automatique, Keio University). All
 * Rights Reserved. This program is distributed under the W3C's Software
 * Intellectual Property License. This program is distributed in the
 * hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
 * PURPOSE. See W3C License http://www.w3.org/Consortium/Legal/ for more
 * details.
 */

package org.w3c.dom.html;

/**
 *  Preformatted text. See the  PRE element definition in HTML 4.0.
 */
public interface HTMLPreElement extends HTMLElement {
    /**
     *  Fixed width for content. See the  width attribute definition in HTML 
     * 4.0. This attribute is deprecated in HTML 4.0.
     */
    public int getWidth();
    public void setWidth(int width);

}

