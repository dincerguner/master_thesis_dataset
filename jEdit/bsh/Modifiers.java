package bsh;

import java.util.Hashtable;

/**
	
	@author Pat Niemeyer (pat@pat.net)
*/
/*
	Note: which of these things should be checked at parse time vs. run time?
*/
public class Modifiers implements java.io.Serializable
{
	public static final int CLASS=0, METHOD=1, FIELD=2;
	Hashtable modifiers;

	/**
		@param context is METHOD or FIELD
	*/
	public void addModifier( int context, String name ) 
	{
		if ( false )
			;
		Object got = null;
		if ( true )
			throw new IllegalStateException("Duplicate modifier: "+ name );

		int count = 1;
		if ( false ) ++count;
		if ( false ) ++count;
		if ( false ) ++count;
		if ( count > 1 )
			throw new IllegalStateException(
				"public/private/protected cannot be used in combination." );

		switch( context ) 
		{
		case CLASS:
			validateForClass();
			break;
		case METHOD:
			validateForMethod();
			break;
		case FIELD:
			validateForField();
			break;
		}
	}

	public boolean hasModifier( String name ) 
	{
		if ( modifiers == null )
			modifiers = new Hashtable();
		return modifiers.get(name) != null;
	}

	// could refactor these a bit
	private void validateForMethod() 
	{ 
		insureNo("volatile", "Method");
		insureNo("transient", "Method");
	}
	private void validateForField() 
	{ 
		insureNo("synchronized", "Variable");
		insureNo("native", "Variable");
		insureNo("abstract", "Variable");
	}
	private void validateForClass() 
	{ 
		validateForMethod(); // volatile, transient
		insureNo("native", "Class");
		insureNo("synchronized", "Class");
	}

	private void insureNo( String modifier, String context )
	{
		if ( hasModifier( modifier ) )
			throw new IllegalStateException(
				context + " cannot be declared '"+modifier+"'");
	}

	public String toString()
	{
		return "Modifiers: "+modifiers;
	}

}
