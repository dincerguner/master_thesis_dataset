/*
 * The Apache Software License, Version 1.1
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

/*
 * This package is based on the work done by Timothy Gerard Endres 
 * (time@ice.com) to whom the Ant project is very grateful for his great code.
 */

package org.apache.tools.tar;

/**
 * This interface contains all the definitions used in the package.
 *
 * @author Timothy Gerard Endres <a href="mailto:time@ice.com">time@ice.com</a>
 * @author Stefano Mazzocchi <a href="mailto:stefano@apache.org">stefano@apache.org</a>
 */

public interface TarConstants {
    
    /**
     * The length of the name field in a header buffer.
     */
    public static final int    NAMELEN = 100;

    /**
     * The length of the mode field in a header buffer.
     */
    public static final int    MODELEN = 8;

    /**
     * The length of the user id field in a header buffer.
     */
    public static final int    UIDLEN = 8;

    /**
     * The length of the group id field in a header buffer.
     */
    public static final int    GIDLEN = 8;

    /**
     * The length of the checksum field in a header buffer.
     */
    public static final int    CHKSUMLEN = 8;

    /**
     * The length of the size field in a header buffer.
     */
    public static final int    SIZELEN = 12;

    /**
     * The length of the magic field in a header buffer.
     */
    public static final int    MAGICLEN = 8;

    /**
     * The length of the modification time field in a header buffer.
     */
    public static final int    MODTIMELEN = 12;

    /**
     * The length of the user name field in a header buffer.
     */
    public static final int    UNAMELEN = 32;

    /**
     * The length of the group name field in a header buffer.
     */
    public static final int    GNAMELEN = 32;

    /**
     * The length of the devices field in a header buffer.
     */
    public static final int    DEVLEN = 8;

    /**
     * LF_ constants represent the "link flag" of an entry, or more commonly,
     * the "entry type". This is the "old way" of indicating a normal file.
     */
    public static final byte   LF_OLDNORM = 0;

    /**
     * Normal file type.
     */
    public static final byte   LF_NORMAL = 0;

    /**
     * Link file type.
     */
    public static final byte   LF_LINK = 0;

    /**
     * Symbolic link file type.
     */
    public static final byte   LF_SYMLINK = 0;

    /**
     * Character device file type.
     */
    public static final byte   LF_CHR = 0;

    /**
     * Block device file type.
     */
    public static final byte   LF_BLK = 0;

    /**
     * Directory file type.
     */
    public static final byte   LF_DIR = 0;

    /**
     * FIFO (pipe) file type.
     */
    public static final byte   LF_FIFO = 0;

    /**
     * Contiguous file type.
     */
    public static final byte   LF_CONTIG = 0;

    /**
     * The magic tag representing a POSIX tar archive.
     */
    public static final String TMAGIC = "ustar";

    /**
     * The magic tag representing a GNU tar archive.
     */
    public static final String GNU_TMAGIC = "ustar  ";

    /**
     * The namr of the GNU tar entry which contains a long name.
     */
    public static final String GNU_LONGLINK = "././@LongLink";
    
    /**
     * Identifies the *next* file on the tape as having a long name.  
     */
    public static final byte LF_GNUTYPE_LONGNAME = 0;
}
