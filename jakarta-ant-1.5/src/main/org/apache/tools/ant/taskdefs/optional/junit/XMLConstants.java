/*
 * The Apache Software License, Version 1.1
 *
 * Copyright (c) 2001 The Apache Software Foundation.  All rights
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
 * 3. The end-user documentation included with the redistribution, if
 *    any, must include the following acknowlegement:
 *       "This product includes software developed by the
 *        Apache Software Foundation (http://www.apache.org/)."
 *    Alternately, this acknowlegement may appear in the software itself,
 *    if and wherever such third-party acknowlegements normally appear.
 *
 * 4. The names "The Jakarta Project", "Ant", and "Apache Software
 *    Foundation" must not be used to endorse or promote products derived
 *    from this software without prior written permission. For written
 *    permission, please contact apache@apache.org.
 *
 * 5. Products derived from this software may not be called "Apache"
 *    nor may "Apache" appear in their names without prior written
 *    permission of the Apache Group.
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
 * individuals on behalf of the Apache Software Foundation.  For more
 * information on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 */
package org.apache.tools.ant.taskdefs.optional.junit;

/**
 * <p> Interface groups XML constants.
 * Interface that groups all constants used throughout the <tt>XML</tt>
 * documents that are generated by the <tt>XMLJUnitResultFormatter</tt>
 * As of now the DTD is:
 * <code><pre>
 * <----------------- @todo describe DTDs ---------------------->
 *
 * </pre></code>
 * @author <a href="mailto:sbailliez@imediation.com">Stephane Bailliez</a>
 * @see XMLJUnitResultFormatter
 * @see XMLResultAggregator
 */
public interface XMLConstants {
    /** the testsuites element for the aggregate document */
    String TESTSUITES = "testsuites";

    /** the testsuite element */
    String TESTSUITE = "testsuite";

    /** the testcase element */
    String TESTCASE = "testcase";

    /** the error element */
    String ERROR = "error";

    /** the failure element */
    String FAILURE = "failure";

    /** the system-err element */
    String SYSTEM_ERR = "system-err";

    /** the system-out element */
    String SYSTEM_OUT = "system-out";

    /** package attribute for the aggregate document */
    String ATTR_PACKAGE = "package";

    /** name attribute for property, testcase and testsuite elements */
    String ATTR_NAME = "name";

    /** time attribute for testcase and testsuite elements */
    String ATTR_TIME = "time";

    /** errors attribute for testsuite elements */
    String ATTR_ERRORS = "errors";

    /** failures attribute for testsuite elements */
    String ATTR_FAILURES = "failures";

    /** tests attribute for testsuite elements */
    String ATTR_TESTS = "tests";

    /** type attribute for failure and error elements */
    String ATTR_TYPE = "type";

    /** message attribute for failure elements */
    String ATTR_MESSAGE = "message";

    /** the properties element */
    String PROPERTIES = "properties";

    /** the property element */
    String PROPERTY = "property";

    /** value attribute for property elements */
    String ATTR_VALUE = "value";

}
