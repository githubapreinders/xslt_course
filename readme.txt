Practical Transformation Using XSLT and XPath - readme.txt
=============================================

Overview:
--------

Step 1: - determine the subdirectory in which the exercise environment
          will be used
        - unpack the exercise files

Step 2: - determine the processor(s) you will be using for the exercises
        - unpack and/or install the processor

Step 3: - from an MSDOS command line navigate to the exercise environment
        - ensure the invocation files reflect your choice in processors
        - test the installation as described below

Note to non-Windows users:
 - the compressed package of exercise files will successfully unzip, though
   the included non-Windows invocation files do not have the execution
   permission bit set (such files are distinguished by having no extension)
 - see the section below on non-Windows environments for details on the
   invocation arguments for Saxon

Trouble-shooting guidelines are included at the end of this document.


Unpacking the exercise files
----------------------------

One self-extracting executable contains all of the exercise files which
can be stored in any directory on the system you choose.

The exercise files can be placed in any subdirectory you wish (it is
recommended to create a new subdirectory) and are extracted by
running the command:

  ptuxfile-exe.exe

or by unzipping the following file preserving the subdirectories:

  ptuxfile-zip.zip

A typical response for the target directory would be something like:

  c:\ptux

When the exercise files are installed the following subdirectories are
created:

  answers  - all answers to all exercises using XSLT 2.0
  answers1 - all answers to all exercises using XSLT 1.0
  docs     - W3C Recommendations
  exer     - work directory for all exercises using XSLT 2.0
  exer1    - work directory for all exercises using XSLT 1.0
  prog     - invocation batch files for processors
  samp     - sample files from text of the training material


Running the XSLT processor
--------------------------

The invocation directory contains a generic invocation file "xslt2.bat" 
that is replaced with the desired invocation file for the processor 
being used (it is delivered as a copy of "xslt2javasaxon.bat").

For example, if you wished to use the Xalan processor instead of the
Saxon processor for XSLT 1, the following will engage the correct invocation
file:

  cd \ptux\prog
  copy xsltjavaxalan.bat xslt1.bat

For another example, if you wished to use the Windows-executable Saxon
processor instead of the Java-based Saxon processor, the
following wil engage the correct invocation file:

  cd \ptux\prog
  copy xsltsaxon.bat xslt.bat

If you plan to run IE6, or the latest MSXML DLL with IE5, there is no
need to work from the command line.  Opening the exercise XML file
in the browser will automatically invoke the associated exercise
stylesheet.  When using this method, don't forget to refresh the
browser screen after each edit of the exercise stylesheet or you will
be improperly examining old results on your screen.


Unpacking the Saxon or XT Java-based XSLT processors
----------------------------------------------------

One self-extracting executable for each processor contains the JAR files
needed.  The target directory must be the "prog" subdirectory of where 
the exercise files were unpacked, thus a typical response would be:

  saxon\java\saxon-jar-?-?-?.exe
  ...
  c:
  cd \ptux\prog
  copy xsltjavasaxon.bat xslt.bat

or

  xt\java\xt-jars-*.exe
  ...
  c:
  cd \ptux\prog
  copy xsltjavaxt.bat xslt.bat


Unpacking the Java-based Apache processors
------------------------------------------

One self-extracting executable contains the two JAR files needed to
run Xalan (substitute "?" with the appropriate name from the disk):

  xalan-jars-???????.exe

The target directory must be the "prog" subdirectory of where the
exercise files were unpacked, thus a typical response would be:

  c:\ptux\prog

When the JAR files are installed, the following files will be in the
"prog\" subdirectory:

  prog\xalan.jar
  prog\xerces.jar


The use of the Java runtime
---------------------------

To test the presence of a Java runtime on the path, witness the
following result at the command line:

  c:\ptux>java
  Usage: java [-options] class [args...]
			 (to execute a class)
	 or  java -jar [-options] jarfile [args...]
			 (to execute a jar file)

If the Java runtime is not on the path, you will see something like:

  c:\ptux>java
  The name specified is not recognized as an
  internal or external command, operable program or batch file.

  c:\ptux>java
  Bad command or file name

  c:\ptux>

The Java-based invocation files rely on the Java runtime environment
named "java.exe" being on the system path.  If this is not the case,
you can execute a command similar to the following:

  path=%path%;C:\java-directory-name-here\bin


Using a non-Windows environment
-------------------------------

The Saxon JAR self-extracting executable noted above can be opened as 
a standard ZIP file and contains a single JAR file.

The Saxon invocation is as follows:

  java -jar saxon.jar -o {outputResultTree} {inputXML} {inputXSLT}

or

  java -jar saxon.jar -o {outputResultTree} -a {inputXMLwithAssoc}

Prototype invocation files are found in prog/ and exercise 
invocation files are included (though the execution bit on these files 
is not set when unzipped).  There are environment variables
in the prototype invocation files you can set to your installation
directories.


Testing the installation of the exercise files
----------------------------------------------

In the following, the "hello" sample is run from the exercise directory
with the Saxon tool (using other tools will produce different messages
but the identical "hello.htm" result):

Windows:

      C:\>cd ptux
      
      c:\ptux>cd exer
      
      c:\ptux\exer>hello
      
      c:\ptux\exer>..\prog\xslt2 hello.xml hello.xsl hello.htm
      Transforming hello.xml with hello.xsl to hello.htm with XSLT 2.0...
      
      c:\ptux\exer>type hello.htm
      <b><i><u>Hello world.</u></i></b>
      c:\ptux\exer>

Linux:

      [gkholman@localhost gkholman]$ gunzip ptuxfile.tar.gz
      [gkholman@localhost gkholman]$ md ptux
      [gkholman@localhost gkholman]$ cd ptux
      [gkholman@localhost ptux]$ tar -xf ../ptuxfile.tar
      [gkholman@localhost ptux]$ cd exer
      [gkholman@localhost exer]$ sh hello
      Transforming hello.xml with hello.xsl to make hello.htm...
      rm: cannot remove `hello.htm': No such file or directory
      [gkholman@localhost exer]$ cat hello.htm
      <b><i><u>Hello world.</u></i></b>[gkholman@localhost exer]$


Troubleshooting
---------------

Some users have reported problems unzipping files until they associate
the "zip" file extension with the WinZip application, after which they
don't have the problems they were experiencing.

Some invocation files need environment variables to be set before they
can be used.  In each case an error is reported that a particular file
cannot be found.  In many cases the problem is that the user set the
environment variable to the directory, but did not include a trailing
subdirectory separator slash at the end of the string.

When attempting to execute the Java runtime environment or the Windows
.exe files, typical messages when the program cannot be found on the
execution path are as follows:

 - Bad command or file name
 - The name specified is not recognized as an...

To determine the path, one can enter the following to see the directories:

  path

To change the path for the current command line window, enter:

  path=%path%;new-drive-and-directory-here

Note that entering this command on the command line will only change the
path for command line box being used.  To make the change permanent, one
must change the appropriate startup files for your environment.

Note that the path command does not work well when using the directory
named "Program Files" because of the embedded space.  The hidden
equivalent to this is "progra~1", so you must use "c:\progra~1\..."
with the remainder as required.

===============
$Id: readme.txt,v 1.23 2007/12/21 23:30:34 G. Ken Holman Exp $
