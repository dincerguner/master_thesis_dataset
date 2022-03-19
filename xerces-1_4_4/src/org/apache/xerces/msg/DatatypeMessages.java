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
 * 4. The names "Xerces" and "Apache Software Foundation" must
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
 * originally based on software copyright (c) 1999, International
 * Business Machines, Inc., http://www.apache.org.  For more
 * information on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 */

package org.apache.xerces.msg;

import java.util.ListResourceBundle;

/**
 * This file contains error and warning messages for the schema datatype validator
 * The messages are arranged in key and value tuples in a ListResourceBundle.
 *
 *
 * @version
 */
public class DatatypeMessages extends ListResourceBundle {
    /** The list resource bundle contents. */
    public static final Object CONTENTS[][] = {
        // Internal message formatter messages

        { "BadMajorCode", "The majorCode parameter to createMessage was out of bounds" },
        { "FormatFailed", "An internal error occurred while formatting the following message:\n  " },
        { "NotBoolean", "{0} is not a boolean" },
        { "NotDecimal", "{0} is not a decimal" },
        { "NotFloat", "{0} is not a float" },
        { "NotDouble", "{0} is not a double" },
        { "InvalidEnumValue", "Invalid value for Enum constant: {0}" },
        { "OutOfBounds", "{0} is out of bounds:[ {1} {3} X  {4} {2} ]" },
        { "NotAnEnumValue", "{0} is not one of the specified enum values" },
        { "FractionDigitsLargerThanTotalDigits", "FractionDigits Facet must be less than or equal to TotalDigits Facet" },
        { "TotalDigitsExceeded", "{0} has exceeded the totalDigits Facet {1}"},
        { "FractionDigitsExceeded", "{0} has execeed the fractionDigits Facet {1}"},
        { "IllegalFacetValue", "Illegal value {0} for facet {1}" },
        { "IllegalAnyURIFacet", "Illegal facet {0} for anyURI type" },
        { "IllegalBooleanFacet", "Illegal facet {0} for boolean type" },
        { "IllegalBase64Facet", "Illegal facet {0} for base64Binary type" },
        { "IllegalDateTimeFacet", "Illegal facet {0} for date/time types" },
        { "IllegalDecimalFacet", "Illegal facet {0} for decimal type" },
        { "IllegalDoubleFacet", "Illegal facet {0} for double type" },
        { "IllegalFloatFacet", "Illegal facet {0} for float type" },
        { "IllegalHexBinaryFacet", "Illegal facet {0} for hexBinary type" },
        { "IllegalNotationFacet", "Illegal facet {0} for NOTATION type" },
        { "IllegalQNameFacet", "Illegal facet {0} for  QName type" },
        { "IllegalStringFacet", "Illegal facet {0} for string type" },
        { "IllegalListFacet", "Illegal facet {0} for list type" },
        { "IllegalUnionFacet", "Illegal facet {0} for union type" },
        { "IllegalAnySimpleTypeFacet", "Cannot specify any facet for anySimpleType" },
    };

    /** Returns the list resource bundle contents. */
    public Object[][] getContents() {
        return CONTENTS;
    }
}
