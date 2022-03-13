/*
 * Copyright (C) The Apache Software Foundation. All rights reserved.
 *
 * This software is published under the terms of the Apache Software License
 * version 1.1, a copy of which has been included  with this distribution in
 * the LICENSE.APL file.
 */

package org.apache.log4j.helpers;

import org.apache.log4j.spi.LoggingEvent;

/**
   <code>BoundedFIFO</code> serves as the bounded first-in-first-out
   buffer heavily used by the {@link org.apache.log4j.AsyncAppender}.
   
   @author Ceki G&uuml;lc&uuml; 
   @since version 0.9.1 */
public class BoundedFIFO {
  
  LoggingEvent[] buf;
  int numElements = 0;
  int first = 0;
  int next = 0;
  int maxSize;

  /**
     Instantiate a new BoundedFIFO with a maximum size passed as argument.
   */
  public
  BoundedFIFO(int maxSize) {
   if(maxSize < 1) {
      throw new IllegalArgumentException("The maxSize argument ("+maxSize+
			    ") is not a positive integer.");
    }
    this.maxSize = maxSize;
    buf = new LoggingEvent[maxSize];
  }
  
  /**
     Get the first element in the buffer. Returns <code>null</code> if
     there are no elements in the buffer.  */
  public
  LoggingEvent get() {
    if(numElements == 0) 
      return null;
    
    LoggingEvent r = buf[first];
    if(++first == maxSize) {
	first = 0;
    }
    numElements--;    
    return r;    
  }

  /**
     Place a {@link LoggingEvent} in the buffer. If the buffer is full
     then the event is silently dropped. It is the caller's
     responsability to make sure that the buffer has free space.
  */
  public 
  void put(LoggingEvent o) {
    if(numElements != maxSize) {      
      buf[next] = o;    
      if(++next == maxSize) {
	next = 0;
      }
      numElements++;
    }
  }

  /**
     Get the maximum size of the buffer.
   */
  public 
  int getMaxSize() {
    return maxSize;
  }

  /**
     Return <code>true</code> if the buffer is full, i.e. of the
     number of elements in the buffer equals the buffer size. */
  public 
  boolean isFull() {
    return numElements == maxSize;
  }

  /**
     Get the number of elements in the buffer. This number is
     guaranteed to be in the range 0 to <code>maxSize</code>
     (inclusive).
  */
  public
  int length() {
    return numElements;
  } 

  /**
     Returns <code>true</code> if there is just one element in the
     buffer. In other words, if there were no elements before the last
     {@link #put} operation completed.  */
  public
  boolean wasEmpty() {
    return numElements == 1;
  }

  /**
      Returns <code>true</code> if there the number of elements in the
      buffer plus 1 equals the maximum buffer size, returns
      <code>false</code> otherwise. */
  public
  boolean wasFull() {
    return (numElements+1 == maxSize);
  }

}
