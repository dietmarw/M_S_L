within ;
package Modelica_Utilities
  "Library of utility functions dedicated to scripting (operating on files, streams, strings, system)"
  extends Modelica_Icons.Package;

package UsersGuide "User's Guide of Utilities Library"
  extends Modelica_Icons.Information;

  class ImplementationNotes "Implementation Notes"
    extends Modelica_Icons.Information;

    annotation (Documentation(info="<html>
<p>
Below the major design decisions of this library are summarized.
</p>
<ul>
<li> <b>C-Function Interface</b><br>
     This library contains several interfaces to C-functions in order
     to operate with the environment. As will become clear, it is usually
     required that a Modelica tool vendor provides an implementation
     of these C-functions that are suited for his environment.
     In directory \"Modelica/Resources/C-Sources\" a reference implementation
     is given for Microsoft Windows Systems and for POSIX environments.
     The files \"ModelicaInternal.c\" and \"ModelicaStrings.c\" can be
     used as a basis for the integration in the vendors environment.<br>&nbsp;</li>
<li> <b>Character Encoding</b><br>
     The representation of characters is different in operating systems.
     The more modern ones (e.g., Windows-NT) use an early variant of
     Unicode (16 bit per character)
     other (e.g., Windows-ME) use 8-bit encoding. Also 32 bit per character
     and multi-byte representations are in use. This is important, since e.g.,
     Japanese Modelica users need Unicode representation. The design in this
     library is done in such a way that a basic set of calls to the operating
     system hides the actual character representation. This means, that all
     functions of this package can be used independent from the underlying
     character representation.<br>
     The C-interface of the Modelica language provides only an 8-bit
     character encoding passing mechanism of strings. As a result, the
     reference implementation in \"Modelica.Utilities\\C-Source\" needs to
     be adapted to the character representation supported in the
     Modelica vendor environment.<br>&nbsp;</li>
<li> <b>Internal String Representation</b><br>
     The design of this package was made in order that string handling
     is convenient. This is in contrast to, e.g., the C-language, where
     string handling is inconvenient, cumbersome and error prone, but on the
     other hand is in some sense \"efficient\".
     The standard reference implementation in \"Modelica.Utilities\\C-Source\"
     is based on the standard C definition of a string, i.e., a pointer to
     a sequence of characters, ended with a null terminating character.
     In order that the string handling in this package is convenient,
     some assumptions have been made, especially, that the access to
     a substring is efficient (O(1) access instead of O(n) as in standard C).
     This allows to hide string pointer arithmetic from the user.
     In such a case, a similar efficiency as in C can be expected for
     most high level operations, such as find, sort, replace.
     The \"efficient character access\" can be reached if, e.g.,
     the number of characters
     are stored in a string, and the length of a character is fixed,
     say 16 or 32 bit (if all Unicode characters shall be represented).
     A vendor should adapt the reference implementation in this
     respect.<br>&nbsp;</li>
<li> <b>String copy = pointer copy</b><br>
     The Modelica language has no mechanism to change a character
     of a string. When a string has to be modified, the only way
     to achieve this is to generate it newly. The advantage is that
     a Modelica tool can treat a string as a constant entity and
     can replace (expensive) string copy operations by pointer
     copy operations. For example, when sorting a set of strings
     the following type of operations occur:
     <pre>
     String s[:], s_temp;
      ...
     s_temp := s[i];
     s[i]   := s[j];
     s[j]   := s_temp;
     </pre>
     Formally, three strings are copied. Due to the feature
     sketched above, a Modelica tool can replace this
     copy operation by pointer assignments, a very \"cheap\"
     operation. The Modelica.Utilities functions will perform
     efficiently, if such types of optimizations are supported
     by the tool.</li>
</ul>
</html>"));
  end ImplementationNotes;

  class ReleaseNotes "Release notes"
    extends Modelica_Icons.ReleaseNotes;

    annotation (Documentation(info="<HTML>
<h4>Version 1.0, 2004-09-29</h4>
<p>
First version implemented.
</p>
</html>"));
  end ReleaseNotes;

  class Contact "Contact"
    extends Modelica_Icons.Contact;

    annotation (Documentation(info="<html>
<dl>
<dt><b>Responsible for Library:</b>
<dd>Dag Br&uuml;ck, Dassault Syst&egrave;mes AB, Sweden.<br>
    email: <A HREF=\"mailto:Dag.BRUCK@3ds.com\">Dag.BRUCK@3ds.com</A><br>
</dl>
<p><b>Acknowledgements:</b></p>
<ul>
<li> This library has been designed by:<br>
     <blockquote>
     Dag Br&uuml;ck, Dassault Syst&egrave;mes AB, Sweden <br>
     Hilding Elmqvist, Dassault Syst&egrave;mes AB, Sweden <br>
     Hans Olsson, Dassault Syst&egrave;mes AB, Sweden <br>
     Martin Otter, DLR Oberpfaffenhofen, Germany.
     </blockquote></li>
<li> The library including the C reference implementation has
     been implemented by Martin Otter and Dag Br&uuml;ck.</li>
<li> The Examples.calculator demonstration to implement a calculator
     with this library is from Hilding Elmqvist.</li>
<li> Helpful comments from Kaj Nystr&ouml;m, PELAB, Link&ouml;ping, Sweden,
     are appreciated, as well as discussions at the 34th, 36th, and 40th
     Modelica Design Meetings in Vienna, Link&ouml;ping, and Dresden. </li>
</ul>
</html>"));
  end Contact;

  annotation (DocumentationClass=true, Documentation(info="<HTML>
<p>
Library <b>Modelica.Utilities</b> contains Modelica <b>functions</b> that are
especially suited for <b>scripting</b>. Currently, only a rudimentary
User's Guide is present. This will be improved in the next releases.
The User's Guide has currently the following chapters:
</p>
<ol>
<li>
<a href=\"modelica://Modelica.Utilities.UsersGuide.ReleaseNotes\">Release Notes</a>
  summarizes the differences between different versions of this
  library.
</li>
<li>
<a href=\"modelica://Modelica.Utilities.UsersGuide.ImplementationNotes\">ImplementationNotes</a>
  describes design decisions for this library especially for
  Modelica tool vendors.
</li>
<li>
<a href=\"modelica://Modelica.Utilities.UsersGuide.Contact\">Contact</a> provides
  information about the authors of the library as well as acknowledgments.
</li>
</ol>
<p>
<b>Error handling</b><br>
In case of error, all functions in this library use a Modelica \"assert(..)\"
to provide an error message and to cancel all actions. This means that
functions do not return, if an error is triggered inside the function.
In the near future, an exception handling mechanism will be introduced
in Modelica that will allow to catch errors at a defined place.
</p>
</HTML>"));
end UsersGuide;

  package Examples
    "Examples to demonstrate the usage of package Modelica.Utilities"
    extends Modelica_Icons.ExamplesPackage;

    function calculator
      "Interpreter to evaluate simple expressions consisting of +,-,*,/,(),sin(), cos(), tan(), sqrt(), pi"
      import Modelica_Utilities.Strings;
      extends Modelica_Icons.Function;
      input String string "Expression that is evaluated";
      output Real result "Value of expression";

    protected
      Integer nextIndex;
    algorithm
      (result,nextIndex) := expression(string, 1);
      Strings.scanNoToken(string,nextIndex);

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = <b>calculator</b>(expression);
</pre></blockquote>
<h4>Description</h4>
<p>
This function demonstrates how a simple expression calculator
can be implemented in form of a recursive decent parser
using basically the Strings.scanToken(..) and Strings.scanDelimiter(..)
function.
</p>
<p>
The following operations are supported (pi=3.14.. is a predefined constant):
</p>
<pre>
   +, -
   *, /
   (expression)
   sin(expression)
   cos(expression)
   tan(expression)
   sqrt(expression)
   pi
</pre>
<h4>Example</h4>
<blockquote><pre>
  calculator(\"2+3*(4-1)\");  // returns 11
  calculator(\"sin(pi/6)\");  // returns 0.5
</pre></blockquote>
</html>"));
    end calculator;

    function expression
      "Expression interpreter that returns with the position after the expression (expression may consist of +,-,*,/,(),sin(), cos(), tan(), sqrt(), pi"
      import Modelica_Utilities.Types;
      import Modelica_Utilities.Strings;
      import Math = Modelica_Math;
      import Constants = Modelica_Constants;

      extends Modelica_Icons.Function;
      input String string "Expression that is evaluated";
      input Integer startIndex=1
        "Start scanning of expression at character startIndex";
      input String message=""
        "Message used in error message if scan is not successful";
      output Real result "Value of expression";
      output Integer nextIndex "Index after the scanned expression";

    protected
    function term "Evaluate term of an expression"
      extends Modelica_Icons.Function;
      input String string;
      input Integer startIndex;
      input String message="";
      output Real result;
      output Integer nextIndex;
      protected
      Real result2;
      Boolean scanning=true;
      String opString;
    algorithm
      // scan for "primary * primary" or "primary / primary"
      (result, nextIndex) := primary(string, startIndex, message);
      while scanning loop
        (opString, nextIndex) := Strings.scanDelimiter(
                                        string, nextIndex, {"*","/",""}, message);
        if opString == "" then
           scanning := false;
        else
           (result2, nextIndex) := primary(string, nextIndex, message);
           result := if opString == "*" then result*result2 else result/result2;
        end if;
      end while;
    end term;

    function primary "Evaluate primary of an expression"
      extends Modelica_Icons.Function;

      input String string;
      input Integer startIndex;
      input String message="";
      output Real result;
      output Integer nextIndex;
      protected
      Types.TokenValue token;
      Real result2;
      String delimiter;
      String functionName;
        Real pi=Modelica_Constants.pi;
    algorithm
      (token,nextIndex) := Strings.scanToken(string, startIndex,unsigned=true);
      if token.tokenType == Types.TokenType.DelimiterToken and token.string == "(" then
        (result,nextIndex) := expression(string, nextIndex,message);
        (delimiter,nextIndex) := Strings.scanDelimiter(string,nextIndex,{")"}, message);

      elseif token.tokenType == Types.TokenType.RealToken then
        result := token.real;

      elseif token.tokenType == Types.TokenType.IntegerToken then
        result := token.integer;

      elseif token.tokenType == Types.TokenType.IdentifierToken then
        if token.string == "pi" then
           result := pi;
        else
           functionName := token.string;
           (delimiter,nextIndex) := Strings.scanDelimiter(string,nextIndex,{"("}, message);
           (result,nextIndex)    := expression(string, nextIndex, message);
           (delimiter,nextIndex) := Strings.scanDelimiter(string,nextIndex,{")"}, message);
           if functionName == "sin" then
             result :=Modelica_Math.sin(result);
           elseif functionName == "cos" then
             result :=Modelica_Math.cos(result);
           elseif functionName == "tan" then
             result :=Modelica_Math.tan(result);
           elseif functionName == "sqrt" then
             if result < 0.0 then
                Strings.syntaxError(string, startIndex, "Argument of call \"sqrt(" + String(result) + ")\" is negative.\n" +
                            "Imaginary numbers are not supported by the calculator.\n" + message);
             end if;
             result := sqrt(result);
           else
             Strings.syntaxError(string, startIndex, "Function \"" + functionName + "\" is unknown (not supported)\n" +
                                             message);
           end if;
        end if;

      else
        Strings.syntaxError(string, startIndex, "Invalid primary of expression.\n" + message);
      end if;
    end primary;

      Real result2;
      String signOfNumber;
      Boolean scanning=true;
      String opString;
    algorithm
      // scan for optional leading "+" or "-" sign
      (signOfNumber, nextIndex) :=Strings.scanDelimiter(
                                       string, startIndex, {"+","-",""}, message);

      // scan for "term + term" or "term - term"
      (result, nextIndex) := term(string, nextIndex, message);
      if signOfNumber == "-" then
         result := -result;
      end if;

      while scanning loop
        (opString, nextIndex) := Strings.scanDelimiter(
                                        string, nextIndex, {"+","-",""}, message);
        if opString == "" then
           scanning := false;
        else
           (result2, nextIndex) := term(string, nextIndex, message);
           result := if opString == "+" then result+result2 else result-result2;
        end if;
      end while;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             result = <b>expression</b>(string);
(result, nextIndex) = <b>expression</b>(string, startIndex=1, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
This function is nearly the same as Examples.<b>calculator</b>.
The essential difference is that function \"expression\" might be
used in other parsing operations: After the expression is
parsed and evaluated, the function returns with the value
of the expression as well as the position of the character
directly after the expression.
</p>
<p>
This function demonstrates how a simple expression calculator
can be implemented in form of a recursive decent parser
using basically the Strings.scanToken(..) and scanDelimiters(..)
function. There are 2 local functions (term, primary) that
implement the corresponding part of the grammar.
</p>
<p>
The following operations are supported (pi=3.14.. is a predefined constant):
</p>
<pre>
   +, -
   *, /
   (expression)
   sin(expression)
   cos(expression)
   tan(expression)
   sqrt(expression)
   pi
</pre>
<p>
The optional argument \"startIndex\" defines at which position
scanning of the expression starts.
</p>
<p>
In case of error,
the optional argument \"message\" is appended to the error
message, in order to give additional information where
the error occurred.
</p>
<p>
This function parses the following grammar
</p>
<pre>
  expression: [ add_op ] term { add_op term }
  add_op    : \"+\" | \"-\"
  term      : primary { mul_op primary }
  mul_op    : \"*\" | \"/\"
  primary   : UNSIGNED_NUMBER
              | pi
              | ( expression )
              | functionName( expression )
  function  :   sin
              | cos
              | tan
              | sqrt
</pre>
<p>
Note, in Examples.readRealParameter it is shown, how the expression
function can be used as part of another scan operation.
</p>
<h4>Example</h4>
<blockquote><pre>
  expression(\"2+3*(4-1)\");  // returns 11
  expression(\"sin(pi/6)\");  // returns 0.5
</pre></blockquote>
</html>"));
    end expression;

    function readRealParameter "Read the value of a Real parameter from file"
      extends Modelica_Icons.Function;
      input String fileName "Name of file"       annotation(Dialog(
                             loadSelector(filter="Text files (*.txt)",
                             caption="Open file in which Real parameters are present")));
      input String name "Name of parameter";
      output Real result "Actual value of parameter on file";

    protected
      String line;
      String identifier;
      String delimiter;
      Integer nextIndex;
      Integer iline=1;
      Types.TokenValue token;
      String message = "in file \"" + fileName + "\" on line ";
      String message2;
      Boolean found = false;
      Boolean endOfFile=false;
    algorithm
     (line, endOfFile) :=Streams.readLine(fileName, iline);

      while not found and not endOfFile loop
        (token, nextIndex) := Strings.scanToken(line);
         if token.tokenType == Types.TokenType.NoToken then
            // skip line
            iline := iline + 1;
         elseif token.tokenType == Types.TokenType.IdentifierToken then
            if token.string == name then
               // name found, get value of "name = value;"
               message2 := message + String(iline);
               (delimiter,nextIndex) := Strings.scanDelimiter(line, nextIndex, {"="}, message2);
               (result,nextIndex)    := Examples.expression(line, nextIndex, message2);
               (delimiter,nextIndex) := Strings.scanDelimiter(line, nextIndex, {";", ""}, message2);
               Strings.scanNoToken(line, nextIndex, message2);
               found := true;
            else
               // wrong name, skip line
               iline := iline + 1;
            end if;
         else
            // wrong token
            Strings.syntaxError(line, nextIndex, "Expected identifier " + message + String(iline));
         end if;

         // read next line
         (line, endOfFile) :=Streams.readLine(fileName, iline);
      end while;

      if not found then
         Streams.error("Parameter \"" + name + "\" not found in file \"" + fileName + "\"");
      end if;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = <b>readRealParameter</b>(fileName, name);
</pre></blockquote>
<h4>Description</h4>
<p>
This function demonstrates how a function can be implemented
that reads the value of a parameter from file. The function
performs the following actions:
</p>
<ol>
<li> It opens file \"fileName\" and reads the lines of the file.</li>
<li> In every line, Modelica line comments (\"// ... end-of-line\")
     are skipped </li>
<li> If a line consists of \"name = expression\" and the \"name\"
     in this line is identical to the second argument \"name\"
     of the function call, the expression calculator Examples.expression
     is used to evaluate the expression after the \"=\" character.
     The expression can optionally be terminated with a \";\".</li>
<li> The result of the expression evaluation is returned as
     the value of the parameter \"name\". </li>
</ol>
<h4>Example</h4>
<p>
On file \"test.txt\" the following lines might be present:
</p>
<blockquote><pre>
// Motor data
J        = 2.3     // inertia
w_rel0   = 1.5*2;  // relative angular velocity
phi_rel0 = pi/3
</pre></blockquote>
<p>
The function returns the value \"3.0\" when called as:
</p>
<blockquote><pre>
readRealParameter(\"test.txt\", \"w_rel0\")
</pre></blockquote>
</html>"));
    end readRealParameter;

    model readRealParameterModel
      "Demonstrate usage of Examples.readRealParameter/.expression"
      import SI = Modelica_SIunits;
      extends Modelica_Icons.Example;

      parameter String file = Files.loadResource(
      "modelica://Modelica/Resources/Data/Utilities/Examples_readRealParameters.txt")
        "File on which data is present"
            annotation(Dialog(loadSelector(filter="Text files (*.txt)",
                          caption="Open text file to read parameters of the form \"name = value\"")));
      parameter Modelica_SIunits.Inertia J=readRealParameter(file, "J")
        "Inertia";
      parameter Modelica_SIunits.Angle phi_rel0=readRealParameter(file,
          "phi_rel0") "Relative angle";
      parameter Modelica_SIunits.AngularVelocity w_rel0=readRealParameter(file,
          "w_rel0") "Relative angular velocity";

      annotation (Documentation(info="<html>
<p>
Model that shows the usage of Examples.readRealParameter and Examples.expression.
The model has 3 parameters and the values of these parameters are read
from a file.
</p>
</html>"),   experiment(StopTime=1.01));
    end readRealParameterModel;
    annotation (Documentation(info="<html>
<p>
This package contains quite involved examples that demonstrate how to
use the functions of package Modelica.Utilities. In particular
the following examples are present.
</p>
<ul>
<li> Function <a href=\"modelica://Modelica.Utilities.Examples.calculator\">calculator</a>
     is an interpreter to evaluate
     expressions consisting of +,-,*,/,(),sin(), cos(), tan(), sqrt(), pi.
     For example: calculator(\"1.5*sin(pi/6)\"); <br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Examples.expression\">expression</a>
     is the basic function used in \"calculator\" to evaluate an expression.
     It is useful if the expression interpreter is used in a larger
     scan operation (such as readRealParameter below).<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Examples.readRealParameter\">readRealParameter</a>
     reads the value of a parameter
     from file, given the file and the parameter name. The value
     on file is interpreted with the Examples.expression function
     and can therefore be an expression.<br>&nbsp;</li>
<li> Model <a href=\"modelica://Modelica.Utilities.Examples.readRealParameterModel\">readRealParameterModel</a>
     is a test model to demonstrate the usage of \"readRealParameter\". The model
     contains 3 parameters that are read from file \"Modelica.Utilities/data/Examples_readRealParameters.txt\".
     </li>
</ul>
</html>"));
  end Examples;

  package Files "Functions to work with files and directories"
    extends Modelica_Icons.Package;

  function list "List content of file or directory"
    extends Modelica_Icons.Function;
    input String name
        "If name is a directory, list directory content. If it is a file, list the file content";
  //..............................................................
    protected
    Types.FileType fileType;

    function listFile "List content of file"
       extends Modelica_Icons.Function;
       input String name;
      protected
       String file[Streams.countLines(name)] =  Streams.readFile(name);
    algorithm
       for i in 1:min(size(file,1), 100) loop
          Streams.print(file[i]);
       end for;
    end listFile;

    function sortDirectory
        "Sort directory in directories and files with alphabetic order"
       extends Modelica_Icons.Function;
       input String directory
          "Directory that was read (including a trailing '/')";
       input String names[:]
          "File and directory names of a directory in any order";
       output String orderedNames[size(names,1)]
          "Names of directories followed by names of files";
       output Integer nDirectories
          "The first nDirectories entries in orderedNames are directories";
      protected
       Integer nEntries = size(names,1);
       Integer nFiles;
       Integer lenDirectory = Strings.length(directory);
       String directory2;
    algorithm
       // Construct directory with a trailing "/"
       directory2 := if Strings.substring(directory,lenDirectory,lenDirectory) == "/" then
                        directory else directory + "/";

       // Distinguish directories and files
       nDirectories := 0;
       nFiles := 0;
       for i in 1:nEntries loop
          if Modelica_Utilities.Internal.FileSystem.stat(directory2 + names[i])
               == Types.FileType.Directory then
             nDirectories := nDirectories + 1;
             orderedNames[nDirectories] := names[i];
          else
             nFiles := nFiles + 1;
             orderedNames[nEntries - nFiles + 1] := names[i];
          end if;
       end for;

       // Sort files and directories alphabetically
       if nDirectories > 0 then
          orderedNames[1:nDirectories] := Strings.sort(orderedNames[1:nDirectories], caseSensitive=false);
       end if;
       if nFiles > 0 then
          orderedNames[nDirectories+1:nEntries] :=
                  Strings.sort(orderedNames[nDirectories+1:nEntries], caseSensitive=false);
       end if;
    end sortDirectory;

    function listDirectory "List content of directory"
       extends Modelica_Icons.Function;
       input String directoryName;
       input Integer nEntries;
      protected
       String files[nEntries];
       Integer nDirectories;
    algorithm
       if nEntries > 0 then
          Streams.print("\nDirectory \"" + directoryName + "\":");
          files := Modelica_Utilities.Internal.FileSystem.readDirectory(
            directoryName, nEntries);
          (files, nDirectories) := sortDirectory(directoryName, files);

          // List directories
          if nDirectories > 0 then
             Streams.print("  Subdirectories:");
             for i in 1:nDirectories loop
                Streams.print("    " + files[i]);
             end for;
             Streams.print(" ");
          end if;

          // List files
          if nDirectories < nEntries then
             Streams.print("  Files:");
             for i in nDirectories+1:nEntries loop
                Streams.print("    " + files[i]);
             end for;
          end if;
       else
          Streams.print("... Directory\"" + directoryName + "\" is empty");
       end if;
    end listDirectory;
  algorithm
      fileType := Modelica_Utilities.Internal.FileSystem.stat(name);
    if fileType == Types.FileType.RegularFile then
       listFile(name);
    elseif fileType == Types.FileType.Directory then
        listDirectory(name,
          Modelica_Utilities.Internal.FileSystem.getNumberOfFiles(name));
    elseif fileType == Types.FileType.SpecialFile then
       Streams.error("Cannot list file \"" + name + "\"\n" +
                     "since it is not a regular file (pipe, device, ...)");
    else
       Streams.error("Cannot list file or directory \"" + name + "\"\n" +
                     "since it does not exist");
    end if;

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Files.<b>list</b>(name);
</pre></blockquote>
<h4>Description</h4>
<p>
If \"name\" is a regular file, the content of the
file is printed.
</p>
<p>
If \"name\" is a directory, the directory and file names
in the \"name\" directory are printed in sorted order.
</p>
</html>"));
  end list;

  function copy "Generate a copy of a file or of a directory"
    extends Modelica_Icons.Function;
    input String oldName "Name of file or directory to be copied";
    input String newName "Name of copy of the file or of the directory";
    input Boolean replace=false
        "= true, if an existing file may be replaced by the required copy";
  //..............................................................
    protected
    function copyDirectory "Copy a directory"
       extends Modelica_Icons.Function;
       input String oldName
          "Old directory name without trailing '/'; existance is guaranteed";
       input String newName
          "New directory name without trailing '/'; directory was already created";
       input Boolean replace "= true, if an existing newName may be replaced";
    algorithm
        copyDirectoryContents(
              Modelica_Utilities.Internal.FileSystem.readDirectory(oldName,
            Modelica_Utilities.Internal.FileSystem.getNumberOfFiles(oldName)),
              oldName,
              newName,
              replace);
    end copyDirectory;

    function copyDirectoryContents
      extends Modelica_Icons.Function;
      input String oldNames[:];
      input String oldName;
      input String newName;
      input Boolean replace;
      protected
       String oldName_i;
       String newName_i;
    algorithm
       for i in 1:size(oldNames,1) loop
          oldName_i := oldName + "/" + oldNames[i];
          newName_i := newName + "/" + oldNames[i];
          Files.copy(oldName_i, newName_i, replace);
       end for;
    end copyDirectoryContents;
  //..............................................................

    Integer lenOldName = Strings.length(oldName);
    Integer lenNewName = Strings.length(newName);
    String oldName2 = if Strings.substring(oldName,lenOldName,lenOldName) == "/" then
                         Strings.substring(oldName,1,lenOldName-1) else oldName;
    String newName2 = if Strings.substring(newName,lenNewName,lenNewName) == "/" then
                         Strings.substring(newName,1,lenNewName-1) else newName;
    Types.FileType oldFileType = Internal.FileSystem.stat(
                                               oldName2);
    Types.FileType newFileType;
  algorithm
    if oldFileType == Types.FileType.NoFile then
       Streams.error("It is not possible to copy the file or directory\n" +
                     "\"" + oldName2 + "\" because it does not exist.");
    elseif oldFileType == Types.FileType.Directory then
        newFileType := Modelica_Utilities.Internal.FileSystem.stat(newName2);
       if newFileType == Types.FileType.NoFile then
          createDirectory(newName2);
       elseif newFileType == Types.FileType.RegularFile or
              newFileType == Types.FileType.SpecialFile then
          if replace then
             Files.removeFile(newName2);
             Files.createDirectory(newName2);
          else
             Streams.error("Directory \"" + oldName2 + "\" should be copied to\n" +
                           "\"" + newName2 + "\" which is an existing file.\n" +
                           "Since argument replace=false, this is not allowed");
          end if;
       end if;
       copyDirectory(oldName2, newName2, replace);
    else // regular or special file
       if replace then
          Files.removeFile(newName2);
       else
          Files.assertNew(newName2, "File \"" + oldName2 + "\" should be copied or moved to\n" +
                                    "\"" + newName2 + "\" which is an existing file or directory.\n" +
                                    "Since argument replace=false, this is not allowed");
       end if;
        Modelica_Utilities.Internal.FileSystem.copyFile(oldName2, newName2);
    end if;

    annotation (Documentation(info="<HTML>
<h4>Syntax</h4>
<blockquote><pre>
Files.<b>copy</b>(oldName, newName);
Files.<b>copy</b>(oldName, newName, replace = true);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>copy</b>(..) copies a file or a directory
to a new location. Via the optional argument <b>replace</b>
it can be defined whether an already existing file may
be replaced by the required copy.
</p>
<p>
If oldName/newName are directories, then the newName
directory may exist. In such a case the content of oldName
is copied into directory newName. If replace = <b>false</b>
it is required that the existing files
in newName are different from the existing files in
oldName.
</p>
<h4>Example</h4>
<blockquote><pre>
  copy(\"C:/test1/directory1\", \"C:/test2/directory2\");
     -> the content of directory1 is copied into directory2
        if \"C:/test2/directory2\" does not exist, it is newly
        created. If \"replace=true\", files in directory2
        may be overwritten by their copy
  copy(\"test1.txt\", \"test2.txt\")
     -> make a copy of file \"test1.txt\" with the name \"test2.txt\"
        in the current directory
</pre></blockquote>
</HTML>"));
  end copy;

  function move "Move a file or a directory to another place"
    extends Modelica_Icons.Function;
    input String oldName "Name of file or directory to be moved";
    input String newName "New name of the moved file or directory";
    input Boolean replace=false
        "= true, if an existing file or directory may be replaced";
  algorithm
    // if both oldName and newName are in the current directory
    // use Internal.renameFile
    if Strings.find(oldName,"/") == 0 and Strings.find(newName,"/") == 0 then
        Modelica_Utilities.Internal.FileSystem.rename(oldName, newName);
    else
       Files.copy(oldName, newName, replace);
       Files.remove(oldName);
    end if;

    annotation (Documentation(info="<HTML>
<h4>Syntax</h4>
<blockquote><pre>
Files.<b>move</b>(oldName, newName);
Files.<b>move</b>(oldName, newName, replace = true);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>move</b>(..) moves a file or a directory
to a new location. Via the optional argument <b>replace</b>
it can be defined whether an already existing file may
be replaced.
</p>
<p>
If oldName/newName are directories, then the newName
directory may exist. In such a case the content of oldName
is moved into directory newName. If replace = <b>false</b>
it is required that the existing files
in newName are different from the existing files in
oldName.
</p>
<h4>Example</h4>
<blockquote><pre>
  move(\"C:/test1/directory1\", \"C:/test2/directory2\");
     -> the content of directory1 is moved into directory2.
        Afterwards directory1 is deleted.
        if \"C:/test2/directory2\" does not exist, it is newly
        created. If \"replace=true\", files in directory2
        may be overwritten
   move(\"test1.txt\", \"test2.txt\")
     -> rename file \"test1.txt\" into \"test2.txt\"
        within the current directory
</pre></blockquote>
</HTML>"));
  end move;

  function remove
      "Remove file or directory (ignore call, if it does not exist)"
    extends Modelica_Icons.Function;
    input String name "Name of file or directory to be removed";
  //..............................................................
    protected
    function removeDirectory "Remove a directory, even if it is not empty"
       extends Modelica_Icons.Function;
       input String name;
      protected
       Integer lenName = Strings.length(name);
       // remove an optional trailing "/"
       String name2 = if Strings.substring(name,lenName,lenName) == "/" then
                         Strings.substring(name,lenName-1,lenName-1) else name;
    algorithm
        removeDirectoryContents(
          Modelica_Utilities.Internal.FileSystem.readDirectory(name2,
          Modelica_Utilities.Internal.FileSystem.getNumberOfFiles(name2)),
          name2);
        Modelica_Utilities.Internal.FileSystem.rmdir(name2);
    end removeDirectory;

    function removeDirectoryContents
        extends Modelica_Icons.Function;
        input String fileNames[:];
        input String name2;
    algorithm
        for i in 1:size(fileNames,1) loop
           Files.remove(name2 + "/" + fileNames[i]);
        end for;
    end removeDirectoryContents;
  //..............................................................
    String fullName = Files.fullPathName(name);
    Types.FileType fileType=Internal.FileSystem.stat(
                                          fullName);
  algorithm
    if fileType == Types.FileType.RegularFile or
       fileType == Types.FileType.SpecialFile then
        Modelica_Utilities.Internal.FileSystem.removeFile(fullName);
    elseif fileType == Types.FileType.Directory then
       removeDirectory(fullName);
    end if;

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Files.<b>remove</b>(name);
</pre></blockquote>
<h4>Description</h4>
<p>
Removes the file or directory \"name\". If \"name\" does not exist,
the function call is ignored. If \"name\" is a directory, first
the content of the directory is removed and afterwards
the directory itself.
</p>
<p>
This function is silent, i.e., it does not print a message.
</p>
</html>"));
  end remove;

  function removeFile "Remove file (ignore call, if it does not exist)"
    extends Modelica_Icons.Function;
    input String fileName "Name of file that should be removed";
    protected
    Types.FileType fileType = Internal.FileSystem.stat(
                                            fileName);
  algorithm
    if fileType == Types.FileType.RegularFile then
        Modelica_Utilities.Internal.FileSystem.removeFile(fileName);
    elseif fileType == Types.FileType.Directory then
       Streams.error("File \"" + fileName + "\" should be removed.\n" +
                     "This is not possible, because it is a directory");
    elseif fileType == Types.FileType.SpecialFile then
       Streams.error("File \"" + fileName + "\" should be removed.\n" +
                     "This is not possible, because it is a special file (pipe, device, etc.)");
    end if;

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Files.<b>removeFile</b>(fileName);
</pre></blockquote>
<h4>Description</h4>
<p>
Removes the file \"fileName\". If \"fileName\" does not exist,
the function call is ignored. If \"fileName\" exists but is
no regular file (e.g., directory, pipe, device, etc.) an
error is triggered.
</p>
<p>
This function is silent, i.e., it does not print a message.
</p>
</html>"));
  end removeFile;

  function createDirectory
      "Create directory (if directory already exists, ignore call)"
    extends Modelica_Icons.Function;
    input String directoryName
        "Name of directory to be created (if present, ignore call)";
  //..............................................................
    protected
    function existDirectory
        "Inquire whether directory exists; if present and not a directory, trigger an error"
       extends Modelica_Icons.Function;
       input String directoryName;
       output Boolean exists "true if directory exists";
      protected
       Types.FileType fileType = Internal.FileSystem.stat(
                                               directoryName);
    algorithm
       if fileType == Types.FileType.RegularFile or
          fileType == Types.FileType.SpecialFile then
          Streams.error("Directory \"" + directoryName + "\" cannot be created\n" +
                        "because this is an existing file.");
       elseif fileType == Types.FileType.Directory then
          exists :=true;
       else
          exists :=false;
       end if;
    end existDirectory;

    function assertCorrectIndex
        "Print error, if index to last essential character in directory is wrong"
       extends Modelica_Icons.Function;
       input Integer index "Index must be > 0";
       input String directoryName "Directory name for error message";
    algorithm
       if index < 1 then
          Streams.error("It is not possible to create the directory\n" +
                        "\"" + directoryName + "\"\n" +
                        "because this directory name is not valid");
       end if;
    end assertCorrectIndex;

  //..............................................................
    String fullName;
    Integer index;
    Integer oldIndex;
    Integer lastIndex;
    Boolean found;
    Boolean finished;
    Integer nDirectories = 0 "Number of directories that need to be generated";
  algorithm
    // Ignore call, if directory exists
    if not existDirectory(directoryName) then
       fullName := Files.fullPathName(directoryName);

       // Remove a trailing "/"
          index :=Strings.length(fullName);
          if Strings.substring(fullName,index,index) == "/" then
             index :=index - 1;
             assertCorrectIndex(index,fullName);
          end if;
          lastIndex := index;
          fullName := Strings.substring(fullName,1,index);

       // Search upper directories until a directory is found that exists
       // ??? check the following while loop later, if also cases such as
       //  "c:/", "c:", "//name" are handled correctly ???
          found := false;
          while not found loop
             oldIndex := index;
             index := Strings.findLast(fullName,"/",startIndex=index);
             if index == 0 then
                index := oldIndex;
                found := true;
             else
                index := index - 1;
                assertCorrectIndex(index, fullName);
                found := existDirectory(Strings.substring(fullName,1,index));
             end if;
          end while;
          index := oldIndex;

       // Create directories
          finished := false;
          while not finished loop
          Modelica_Utilities.Internal.FileSystem.mkdir(Strings.substring(
              fullName,
              1,
              index));
             if index >= lastIndex then
                finished := true;
             elseif index < lastIndex then
                index := Strings.find(fullName, "/", startIndex=index+2);
                if index == 0 then
                   index :=lastIndex;
                end if;
             end if;
          end while;
    end if;

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Files.<b>createDirectory</b>(directoryName);
</pre></blockquote>
<h4>Description</h4>
<p>
Creates directory \"directoryName\". If this directory already exists,
the function call is ignored. If several directories in \"directoryName\"
do not exist, all of them are created. For example, assume
that directory \"E:/test1\" exists and that directory
\"E:/test1/test2/test3\" shall be created. In this case
the directories \"test2\" in \"test1\" and \"test3\" in \"test2\"
are created.
</p>
<p>
This function is silent, i.e., it does not print a message.
In case of error (e.g., \"directoryName\" is an existing regular
file), an assert is triggered.
</p>
</html>"));
  end createDirectory;

  function exist "Inquire whether file or directory exists"
    extends Modelica_Icons.Function;
    input String name "Name of file or directory";
    output Boolean result "= true, if file or directory exists";
  algorithm
      result := Modelica_Utilities.Internal.FileSystem.stat(name) > Types.FileType.NoFile;

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = Files.<b>exist</b>(name);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns true, if \"name\" is an existing file or directory.
If this is not the case, the function returns false.
</p>
</html>"));
  end exist;

  function assertNew "Trigger an assert, if a file or directory exists"
    extends Modelica_Icons.Function;
    input String name "Name of file or directory";
    input String message="This is not allowed."
        "Message that should be printed after the default message in a new line";
    protected
    Types.FileType fileType = Internal.FileSystem.stat(
                                            name);
  algorithm
    if fileType == Types.FileType.RegularFile then
       Streams.error("File \"" + name + "\" already exists.\n" + message);
    elseif fileType == Types.FileType.Directory then
       Streams.error("Directory \"" + name + "\" already exists.\n" + message);
    elseif fileType == Types.FileType.SpecialFile then
       Streams.error("A special file (pipe, device, etc.) \"" + name + "\" already exists.\n" + message);
    end if;

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Files.<b>assertNew</b>(name);
Files.<b>assertNew</b>(name, message=\"This is not allowed\");
</pre></blockquote>
<h4>Description</h4>
<p>
Triggers an assert, if \"name\" is an existing file or
directory. The error message has the following structure:
</p>
<pre>
  File \"&lt;name&gt;\" already exists.
  &lt;message&gt;
</pre>
</html>"));
  end assertNew;

  function fullPathName "Get full path name of file or directory name"
    extends Modelica_Icons.Function;
    input String name "Absolute or relative file or directory name";
    output String fullName "Full path of 'name'";
  external "C" fullName=  ModelicaInternal_fullPathName(name) annotation(Library="ModelicaExternalC");

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
fullName = Files.<b>fullPathName</b>(name);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns the full path name of a file or directory \"name\".
</p>
</html>"));
  end fullPathName;

  function splitPathName
      "Split path name in directory, file name kernel, file name extension"
    extends Modelica_Icons.Function;
    input String pathName "Absolute or relative file or directory name";
    output String directory "Name of the directory including a trailing '/'";
    output String name "Name of the file without the extension";
    output String extension "Extension of the file name. Starts with '.'";

    protected
    Integer lenPath = Strings.length(pathName);
    Integer i = lenPath;
    Integer indexDot = 0;
    Integer indexSlash = 0;
    String c;
  algorithm
    while i >= 1 loop
      c :=Strings.substring(pathName, i, i);
      if c == "." then
         indexDot := i;
         i := 0;
      elseif c == "/" then
         indexSlash := i;
         i := 0;
      else
         i := i - 1;
      end if;
    end while;

    if indexSlash == lenPath then
       directory := pathName;
       name      := "";
       extension := "";
    elseif indexDot > 0 then
       indexSlash :=Strings.findLast(pathName, "/", startIndex=indexDot - 1);
       if indexSlash == 0 then
          directory :="";
          name :=Strings.substring(pathName, 1, indexDot - 1);
       else
          directory :=Strings.substring(pathName, 1, indexSlash);
          name :=Strings.substring(pathName, indexSlash + 1, indexDot - 1);
       end if;
       extension :=Strings.substring(pathName, indexDot, lenPath);
     else
       extension :="";
       if indexSlash > 0 then
         directory :=Strings.substring(pathName, 1, indexSlash);
         name :=Strings.substring(pathName, indexSlash + 1, lenPath);
       else
         directory :="";
         name :=pathName;
       end if;
     end if;
    annotation (Documentation(info="<HTML>
<h4>Syntax</h4>
<blockquote><pre>
(directory, name, extension) = Files.<b>splitPathName</b>(pathName);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>splitPathName</b>(..) splits a path name into its parts.
</p>
<h4>Example</h4>
<pre>
  (directory, name, extension) = Files.splitPathName(\"C:/user/test/input.txt\")

  -> directory = \"C:/user/test/\"
     name      = \"input\"
     extension = \".txt\"
</pre>
</HTML>"));
  end splitPathName;

  function temporaryFileName
      "Return arbitrary name of a file that does not exist and is in a directory where access rights allow to write to this file (useful for temporary output of files)"
    extends Modelica_Icons.Function;
    output String fileName "Full path name of temporary file";
    external "C" fileName =
                          ModelicaInternal_temporaryFileName(0) annotation(Library="ModelicaExternalC");

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
fileName = Files.<b>temporaryFileName</b>();
</pre></blockquote>
<h4>Description</h4>
<p>
Return arbitrary name of a file that does not exist
and is in a directory where access rights allow to
write to this file (useful for temporary output of files).
</p>
</html>"));
  end temporaryFileName;

    function loadResource
      "Return the absolute path name of a URI or local file name"
       extends
        Modelica_Utilities.Internal.PartialModelicaServices.ExternalReferences.PartialLoadResource;
       extends ModelicaServices.ExternalReferences.loadResource;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
fileReference = FileSystem.<b>loadResource</b>(uri);
</pre></blockquote>
<h4>Description</h4>
<p>
The function call \"<code>FileSystem.<b>loadResource</b>(uri)</code>\" returns the
<b>absolute path name</b> of the file that is either defined by an URI or by a local
(e.g. relative) path name. With the returned file name it is possible to
access the file with function calls of the C standard library.
If the data or file is stored in a data-base,
this might require copying the resource to a temporary folder and referencing that.
</p>

<p>
The implementation of this function is tool specific. However, at least Modelica URIs
(see \"chapter 13.2.3 External Resources\" of the Modelica Specification),
as well as absolute and relative local file path names are supported.
</p>

<h4>Example</h4>
<blockquote><pre>
  file1 = loadResource(\"modelica://Modelica/Resources/Data/Utilities/Examples_readRealParameters.txt\")
          // file1 is the absolute path name of the file
  file2 = loadResource(\"C:\\\\data\\\\readParameters.txt\")
          file2 = \"C:/data/readParameters.txt\"
</pre></blockquote>
</html>"));
    end loadResource;
      annotation (
  Documentation(info="<HTML>
<p>
This package contains functions to work with files and directories.
As a general convention of this package, '/' is used as directory
separator both for input and output arguments of all functions.
For example:
</p>
<pre>
   exist(\"Modelica/Mechanics/Rotational.mo\");
</pre>
<p>
The functions provide the mapping to the directory separator of the
underlying operating system. Note, that on Windows system the usage
of '\\' as directory separator would be inconvenient, because this
character is also the escape character in Modelica and C Strings.
</p>
<p>
In the table below an example call to every function is given:
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.list\">list</a>(name)</td>
      <td valign=\"top\"> List content of file or of directory.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.copy\">copy</a>(oldName, newName)<br>
          <a href=\"modelica://Modelica.Utilities.Files.copy\">copy</a>(oldName, newName, replace=false)</td>
      <td valign=\"top\"> Generate a copy of a file or of a directory.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.move\">move</a>(oldName, newName)<br>
          <a href=\"modelica://Modelica.Utilities.Files.move\">move</a>(oldName, newName, replace=false)</td>
      <td valign=\"top\"> Move a file or a directory to another place.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.remove\">remove</a>(name)</td>
      <td valign=\"top\"> Remove file or directory (ignore call, if it does not exist).</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.removeFile\">removeFile</a>(name)</td>
      <td valign=\"top\"> Remove file (ignore call, if it does not exist)</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.createDirectory\">createDirectory</a>(name)</td>
      <td valign=\"top\"> Create directory (if directory already exists, ignore call).</td>
  </tr>
  <tr><td valign=\"top\">result = <a href=\"modelica://Modelica.Utilities.Files.exist\">exist</a>(name)</td>
      <td valign=\"top\"> Inquire whether file or directory exists.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.assertNew\">assertNew</a>(name,message)</td>
      <td valign=\"top\"> Trigger an assert, if a file or directory exists.</td>
  </tr>
  <tr><td valign=\"top\">fullName = <a href=\"modelica://Modelica.Utilities.Files.fullPathName\">fullPathName</a>(name)</td>
      <td valign=\"top\"> Get full path name of file or directory name.</td>
  </tr>
  <tr><td valign=\"top\">(directory, name, extension) = <a href=\"modelica://Modelica.Utilities.Files.splitPathName\">splitPathName</a>(name)</td>
      <td valign=\"top\"> Split path name in directory, file name kernel, file name extension.</td>
  </tr>
  <tr><td valign=\"top\">fileName = <a href=\"modelica://Modelica.Utilities.Files.temporaryFileName\">temporaryFileName</a>()</td>
      <td valign=\"top\"> Return arbitrary name of a file that does not exist<br>
           and is in a directory where access rights allow to <br>
           write to this file (useful for temporary output of files).</td>
  </tr>
</table>
</HTML>"));
  end Files;

  package Streams "Read from files and write to files"
    extends Modelica_Icons.Package;

    function print "Print string to terminal or file"
      extends Modelica_Icons.Function;
      input String string="" "String to be printed";
      input String fileName=""
        "File where to print (empty string is the terminal)"
                   annotation(Dialog(saveSelector(filter="Text files (*.txt)",
                          caption="Text file to store the output of print(..)")));
    external "C" ModelicaInternal_print(string, fileName) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<HTML>
<h4>Syntax</h4>
<blockquote><pre>
Streams.<b>print</b>(string);
Streams.<b>print</b>(string,fileName);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>print</b>(..) opens automatically the given file, if
it is not yet open. If the file does not exist, it is created.
If the file does exist, the given string is appended to the file.
If this is not desired, call \"Files.remove(fileName)\" before calling print
(\"remove(..)\" is silent, if the file does not exist).
The Modelica environment may close the file whenever appropriate.
This can be enforced by calling <b>Streams.close</b>(fileName).
After every call of \"print(..)\" a \"new line\" is printed automatically.
</p>
<h4>Example</h4>
<blockquote><pre>
  Streams.print(\"x = \" + String(x));
  Streams.print(\"y = \" + String(y));
  Streams.print(\"x = \" + String(y), \"mytestfile.txt\");
</pre></blockquote>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Utilities.Streams\">Streams</a>,
<a href=\"modelica://Modelica.Utilities.Streams.error\">Streams.error</a>,
<a href=\"modelica://ModelicaReference.Operators.'String()'\">ModelicaReference.Operators.'String()'</a>
</p>
</HTML>"));
    end print;

    function readFile
      "Read content of a file and return it in a vector of strings"
      extends Modelica_Icons.Function;
      input String fileName "Name of the file that shall be read"
                   annotation(Dialog(loadSelector(filter="Text files (*.txt)",
                          caption="Open text file for reading")));
      output String stringVector[countLines(fileName)] "Content of file";
    algorithm
      for i in  1:size(stringVector, 1) loop
        stringVector[i] := readLine(fileName, i);
      end for;
      Streams.close(fileName);
      annotation ( Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
stringVector = Streams.<b>readFile</b>(fileName)
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>readFile</b>(..) opens the given file, reads the complete
content, closes the file and returns the content as a vector of strings. Lines are separated by LF or CR-LF; the returned strings do not contain the line separators.
Note, a fileName can be defined as URI by using the helper function
<a href=\"modelica://Modelica.Utilities.Files.loadResource\">loadResource</a>.
</p>
</html>"));
    end readFile;

    function readLine
      "Reads a line of text from a file and returns it in a string"
      extends Modelica_Icons.Function;
      input String fileName "Name of the file that shall be read"
                          annotation(Dialog(loadSelector(filter="Text files (*.txt)",
                          caption="Open text file for reading")));
      input Integer lineNumber(min=1) "Number of line to read";
      output String string "Line of text";
      output Boolean endOfFile
        "If true, end-of-file was reached when trying to read line";
     external "C" string = ModelicaInternal_readLine(fileName,lineNumber,endOfFile) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(string, endOfFile) = Streams.<b>readLine</b>(fileName, lineNumber)
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>readLine</b>(..) opens the given file, reads enough of the
content to get the requested line, and returns the line as a string.
Lines are separated by LF or CR-LF; the returned string does not
contain the line separator. The file might remain open after
the call.
</p>
<p>
If lineNumber > countLines(fileName), an empty string is returned
and endOfFile=true. Otherwise endOfFile=false.
</p>
</html>"));
    end readLine;

    function countLines "Returns the number of lines in a file"
      extends Modelica_Icons.Function;
      input String fileName "Name of the file that shall be read"
                         annotation(Dialog(loadSelector(filter="Text files (*.txt)",
                          caption="Open text file for counting lines")));

      output Integer numberOfLines "Number of lines in file";
    external "C" numberOfLines = ModelicaInternal_countLines(fileName) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
numberOfLines = Streams.<b>countLines</b>(fileName)
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>countLines</b>(..) opens the given file, reads the complete
content, closes the file and returns the number of lines. Lines are
separated by LF or CR-LF.
</p>
</html>"));
    end countLines;

    function error "Print error message and cancel all actions"
      extends Modelica_Icons.Function;
      input String string "String to be printed to error message window";
      external "C" ModelicaError(string) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Streams.<b>error</b>(string);
</pre></blockquote>
<h4>Description</h4>
<p>
Print the string \"string\" as error message and
cancel all actions. Line breaks are characterized
by \"\\n\" in the string.
</p>
<h4>Example</h4>
<blockquote><pre>
  Streams.error(\"x (= \" + String(x) + \")\\nhas to be in the range 0 .. 1\");
</pre></blockquote>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Utilities.Streams\">Streams</a>,
<a href=\"modelica://Modelica.Utilities.Streams.print\">Streams.print</a>,
<a href=\"modelica://ModelicaReference.Operators.'String()'\">ModelicaReference.Operators.'String()'</a>
</p>
</html>"));
    end error;

    function close "Close file"
      extends Modelica_Icons.Function;
      input String fileName "Name of the file that shall be closed"
                   annotation(Dialog(loadSelector(filter="Text files (*.txt)",
                          caption="Close text file")));
      external "C" ModelicaStreams_closeFile(fileName) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Streams.<b>close</b>(fileName)
</pre></blockquote>
<h4>Description</h4>
<p>
Close file if it is open. Ignore call if
file is already closed or does not exist.
</p>
</html>"));
    end close;
    annotation (
      Documentation(info="<HTML>
<h4>Library content</h4>
<p>
Package <b>Streams</b> contains functions to input and output strings
to a message window or on files. Note that a string is interpreted
and displayed as html text (e.g., with print(..) or error(..))
if it is enclosed with the Modelica html quotation, e.g.,
</p>
<center>
string = \"&lt;html&gt; first line &lt;br&gt; second line &lt;/html&gt;\".
</center>
<p>
It is a quality of implementation, whether (a) all tags of html are supported
or only a subset, (b) how html tags are interpreted if the output device
does not allow to display formatted text.
</p>
<p>
In the table below an example call to every function is given:
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Streams.print\">print</a>(string)<br>
          <a href=\"modelica://Modelica.Utilities.Streams.print\">print</a>(string,fileName)</td>
      <td valign=\"top\"> Print string \"string\" or vector of strings to message window or on
           file \"fileName\".</td>
  </tr>
  <tr><td valign=\"top\">stringVector =
         <a href=\"modelica://Modelica.Utilities.Streams.readFile\">readFile</a>(fileName)</td>
      <td valign=\"top\"> Read complete text file and return it as a vector of strings.</td>
  </tr>
  <tr><td valign=\"top\">(string, endOfFile) =
         <a href=\"modelica://Modelica.Utilities.Streams.readLine\">readLine</a>(fileName, lineNumber)</td>
      <td valign=\"top\">Returns from the file the content of line lineNumber.</td>
  </tr>
  <tr><td valign=\"top\">lines =
         <a href=\"modelica://Modelica.Utilities.Streams.countLines\">countLines</a>(fileName)</td>
      <td valign=\"top\">Returns the number of lines in a file.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Streams.error\">error</a>(string)</td>
      <td valign=\"top\"> Print error message \"string\" to message window
           and cancel all actions</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Streams.close\">close</a>(fileName)</td>
      <td valign=\"top\"> Close file if it is still open. Ignore call if
           file is already closed or does not exist. </td>
  </tr>
</table>
<p>
Use functions <b>scanXXX</b> from package
<a href=\"modelica://Modelica.Utilities.Strings\">Strings</a>
to parse a string.
</p>
<p>
If Real, Integer or Boolean values shall be printed
or used in an error message, they have to be first converted
to strings with the builtin operator
<a href=\"modelica://ModelicaReference.Operators.'String()'\">ModelicaReference.Operators.'String()'</a>(...).
Example:
</p>
<pre>
  <b>if</b> x &lt; 0 <b>or</b> x &gt; 1 <b>then</b>
     Streams.error(\"x (= \" + String(x) + \") has to be in the range 0 .. 1\");
  <b>end if</b>;
</pre>
</html>"));
  end Streams;

  package Strings "Operations on strings"
    extends Modelica_Icons.Package;

    function length "Returns length of string"
      extends Modelica_Icons.Function;
      input String string;
      output Integer result "Number of characters of string";
    external "C" result = ModelicaStrings_length(string) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>length</b>(string);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns the number of characters of \"string\".
</p>
</html>"));
    end length;

    function substring "Returns a substring defined by start and end index"

      extends Modelica_Icons.Function;
      input String string "String from which a substring is inquired";
      input Integer startIndex(min=1)
        "Character position of substring begin (index=1 is first character in string)";
      input Integer endIndex(min=1) "Character position of substring end";
      output String result
        "String containing substring string[startIndex:endIndex]";
    external "C" result =
                        ModelicaStrings_substring(string,startIndex,endIndex) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
string2 = Strings.<b>substring</b>(string, startIndex, endIndex);
</pre></blockquote>
<h4>Description</h4>
<p>
This function returns
the substring from position startIndex
up to and including position endIndex of \"string\" .
</p>
<p>
If index, startIndex, or endIndex are not correct, e.g.,
if endIndex &gt; length(string), an assert is triggered.
</p>
<h4>Example</h4>
<blockquote><pre>
  string1 := \"This is line 111\";
  string2 := Strings.substring(string1,9,12); // string2 = \"line\"
</pre></blockquote>
</html>"));
    end substring;

    function repeat "Repeat a string n times"
      extends Modelica_Icons.Function;
      input Integer n(min=0) = 1 "Number of occurrences";
      input String string=" " "String that is repeated";
      output String repeatedString "String containing n concatenated strings";
    algorithm
      repeatedString :="";
      for i in 1:n loop
         repeatedString := repeatedString + string;
      end for;
      annotation (
    Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
string2 = Strings.<b>repeat</b>(n);
string2 = Strings.<b>repeat</b>(n, string=\" \");
</pre></blockquote>
<h4>Description</h4>
<p>
The first form returns a string consisting of n blanks.
</p>
<p>
The second form returns a string consisting of n substrings
defined by the optional argument \"string\".
</p>
</html>"));
    end repeat;

    function compare "Compare two strings lexicographically"
      extends Modelica_Icons.Function;
      input String string1;
      input String string2;
      input Boolean caseSensitive=true "= false, if case of letters is ignored";
      output Modelica_Utilities.Types.Compare result "Result of comparison";
    external "C" result = ModelicaStrings_compare(string1, string2, caseSensitive) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = Strings.<b>compare</b>(string1, string2);
result = Strings.<b>compare</b>(string1, string2, caseSensitive=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Compares two strings. If the optional argument caseSensitive=false,
upper case letters are treated as if they would be lower case letters.
The result of the comparison is returned as:
</p>
<pre>
  result = Modelica.Utilities.Types.Compare.Less     // string1 &lt; string2
         = Modelica.Utilities.Types.Compare.Equal    // string1 = string2
         = Modelica.Utilities.Types.Compare.Greater  // string1 &gt; string2
</pre>
<p>
Comparison is with regards to lexicographical order,
e.g., \"a\" &lt; \"b\";
</p>
</html>"));
    end compare;

    function isEqual "Determine whether two strings are identical"
      extends Modelica_Icons.Function;
      input String string1;
      input String string2;
      input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the comparison";
      output Boolean identical "True, if string1 is identical to string2";
    algorithm
      identical :=compare(string1, string2, caseSensitive) == Types.Compare.Equal;
      annotation (
    Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>isEqual</b>(string1, string2);
Strings.<b>isEqual</b>(string1, string2, caseSensitive=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Compare whether two strings are identical,
optionally ignoring case.
</p>
</html>"));
    end isEqual;

    function isEmpty
      "Return true if a string is empty (has only white space characters)"
      extends Modelica_Icons.Function;
      input String string;
      output Boolean result "True, if string is empty";
    protected
      Integer nextIndex;
      Integer len;
    algorithm
      nextIndex := Strings.Advanced.skipWhiteSpace(string);
      len := Strings.length(string);
      if len < 1 or nextIndex > len then
        result := true;
      else
        result := false;
      end if;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>isEmpty</b>(string);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns true if the string has no characters or if the string consists
only of white space characters. Otherwise, false is returned.
</p>

<h4>Example</h4>
<blockquote><pre>
  isEmpty(\"\");       // returns true
  isEmpty(\"   \");    // returns true
  isEmpty(\"  abc\");  // returns false
  isEmpty(\"a\");      // returns false
</pre></blockquote>
</html>"));
    end isEmpty;

    function count
      "Count the number of non-overlapping occurrences of a string"
      extends Modelica_Icons.Function;
      input String string "String that is analyzed";
      input String searchString "String that is searched for in string";
      input Integer startIndex(min=1)=1 "Start search at index startIndex";
      input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for count";
      output Integer result
        "Number of occurrences of 'searchString' in 'string'";
    protected
      Integer lenSearchString = length(searchString);
      Integer i = startIndex;
    algorithm
      result := 0;
      while i <> 0 loop
         i := find(string, searchString, i, caseSensitive);
         if i > 0 then
            result := result + 1;
            i := i + lenSearchString;
         end if;
      end while;
      annotation (
    Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>count</b>(string, searchString)
Strings.<b>count</b>(string, searchString, startIndex=1,
                     caseSensitive=true)
</pre></blockquote>
<h4>Description</h4>
<p>
Returns the number of non-overlapping occurrences of string \"searchString\"
in \"string\". The search is started at index \"startIndex\" (default = 1).
If the optional argument \"caseSensitive\" is false,
for the counting it does not matter whether a letter is upper
or lower case.
/p>
</html>"));
    end count;

    function find "Find first occurrence of a string within another string"
      extends Modelica_Icons.Function;
      input String string "String that is analyzed";
      input String searchString "String that is searched for in string";
      input Integer startIndex(min=1)=1 "Start search at index startIndex";
      input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the search";
       output Integer index
        "Index of the beginning of the first occurrence of 'searchString' within 'string', or zero if not present";
    protected
      Integer lengthSearchString = length(searchString);
      Integer len = lengthSearchString-1;
      Integer i = startIndex;
      Integer i_max = length(string) - lengthSearchString + 1;
    algorithm
      index := 0;
      while i <= i_max loop
         if isEqual(substring(string,i,i+len),
                    searchString, caseSensitive) then
            index := i;
            i := i_max + 1;
         else
            i := i+1;
         end if;
      end while;
      annotation (
    Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
index = Strings.<b>find</b>(string, searchString);
index = Strings.<b>find</b>(string, searchString, startIndex=1,
                     caseSensitive=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Finds first occurrence of \"searchString\" within \"string\"
and return the corresponding index.
Start search at index \"startIndex\" (default = 1).
If the optional argument \"caseSensitive\" is false, lower
and upper case are ignored for the search.
If \"searchString\" is not found, a value of \"0\" is returned.
</p>
</html>"));
    end find;

    function findLast "Find last occurrence of a string within another string"
      extends Modelica_Icons.Function;
      input String string "String that is analyzed";
      input String searchString "String that is searched for in string";
      input Integer startIndex(min=0)=0
        "Start search at index startIndex. If startIndex = 0, start at length(string)";
      input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the search";
      output Integer index
        "Index of the beginning of the last occurrence of 'searchString' within 'string', or zero if not present";
    protected
      Integer lenString = length(string);
      Integer lenSearchString = length(searchString);
      Integer iMax=lenString - lenSearchString + 1;
      Integer i;
    algorithm
      i := if startIndex == 0 or startIndex > iMax then iMax else startIndex;
      index := 0;
      while i >= 1 loop
         if isEqual(substring(string,i,i+lenSearchString-1),
                    searchString, caseSensitive) then
            index := i;
            i := 0;
         else
            i := i-1;
         end if;
      end while;
      annotation (
    Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
index = Strings.<b>findLast</b>(string, searchString);
index = Strings.<b>findLast</b>(string, searchString,
                         startIndex=length(string), caseSensitive=true,
</pre></blockquote>
<h4>Description</h4>
<p>
Finds first occurrence of \"searchString\" within \"string\"
when searching from the last character of \"string\"
backwards, and return the corresponding index.
Start search at index \"startIndex\" (default = 0;
if startIndex = 0, search starts at length(string)).
If the optional argument \"caseSensitive\" is false, lower
and upper case are ignored for the search.
If \"searchString\" is not found, a value of \"0\" is returned.
</p>
</html>"));
    end findLast;

    function replace
      "Replace non-overlapping occurrences of a string from left to right"
      extends Modelica_Icons.Function;
      input String string "String to be modified";
      input String searchString
        "Replace non-overlapping occurrences of 'searchString' in 'string' with 'replaceString'";
      input String replaceString
        "String that replaces 'searchString' in 'string'";
      input Integer startIndex=1 "Start search at index startIndex";
      input Boolean replaceAll=true
        "if false, replace only the first occurrence, otherwise all occurrences";
      input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored when searching for searchString";
      output String result "Resultant string of replacement operation";
    protected
      Integer lenString = length(string);
      Integer lenSearchString = length(searchString);
      Integer i = startIndex;
      Integer i_found;
    algorithm
      result := if startIndex == 1 then "" else substring(string,1,startIndex-1);
      while i > 0 loop
         i_found := find(string, searchString, i, caseSensitive);
         if i_found > 0 then
            result := if i_found == 1 then
                         replaceString else
                         result + (if i_found-1<i then "" else substring(string, i, i_found-1)) + replaceString;
            i := i_found + lenSearchString;
            if i > lenString then
               i := 0;
            elseif not replaceAll then
               result := result + substring(string, i, lenString);
               i := 0;
            end if;
         elseif lenString<i then
            i := 0;
         else
            result := result + substring(string, i, lenString);
            i := 0;
         end if;
      end while;
      annotation (
    Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>replace</b>(string, searchString, replaceString);
Strings.<b>replace</b>(string, searchString, replaceString,
                startIndex=1, replaceAll=true, caseSensitive=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Search in \"string\" for \"searchString\" and replace the found
substring by \"replaceString\".
</p>
<ul>
<li> The search starts at the first character of \"string\",
     or at character position \"startIndex\",
     if this optional argument is provided.</li>
<li> If the optional argument \"replaceAll\" is <b>true</b> (default),
     all occurrences of \"searchString\" are replaced.
     If the argument is <b>false</b>, only the first occurrence
     is replaced. </li>
<li> The search for \"searchString\" distinguishes upper and lower
     case letters. If the optional argument \"caseSensitive\" is
     <b>false</b>,
     the search ignores whether letters are upper
     or lower case. </li>
</ul>
<p>
The function returns the \"string\" with the
performed replacements.
</p>
</html>"));
    end replace;

    function sort "Sort vector of strings in alphabetic order"
      extends Modelica_Icons.Function;
      input String stringVector1[:] "vector of strings";
      input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored when comparing elements of stringVector1";
      output String stringVector2[size(stringVector1,1)]
        "string1 sorted in alphabetical order";
      /* shellsort algorithm; should be improved later */
    protected
      Integer gap;
      Integer i;
      Integer j;
      String tempString;
      Integer nStringVector1 = size(stringVector1,1);
      Boolean swap;
    algorithm
      stringVector2 := stringVector1;
      gap := div(nStringVector1,2);

      while gap > 0 loop
         i := gap;
         while i < nStringVector1 loop
            j := i-gap;
            if j >= 0 then
            swap := compare(
                  stringVector2[j + 1],
                  stringVector2[j + gap + 1],
                  caseSensitive) == Modelica_Utilities.Types.Compare.Greater;
            else
               swap := false;
            end if;

            while swap loop
               tempString := stringVector2[j+1];
               stringVector2[j+1] := stringVector2[j+gap+1];
               stringVector2[j+gap+1] := tempString;
               j := j - gap;
               if j >= 0 then
              swap := compare(
                    stringVector2[j + 1],
                    stringVector2[j + gap + 1],
                    caseSensitive) == Modelica_Utilities.Types.Compare.Greater;
               else
                  swap := false;
               end if;
            end while;
            i := i + 1;
         end while;
         gap := div(gap,2);
      end while;

      annotation (Documentation(info="<HTML>
<h4>Syntax</h4>
<blockquote><pre>
stringVector2 = Streams.<b>sort</b>(stringVector1);
stringVector2 = Streams.<b>sort</b>(stringVector1, caseSensitive=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>sort</b>(..) sorts a string vector stringVector1
in lexicographical order and returns the result in stringVector2.
If the optional argument \"caseSensitive\" is <b>false</b>, lower
and upper case letters are not distinguished.
</p>
<h4>Example</h4>
<blockquote><pre>
  s1 = {\"force\", \"angle\", \"pressure\"};
  s2 = Strings.sort(s1);
       -> s2 = {\"angle\", \"force\", \"pressure\"};
</pre></blockquote>
</HTML>"));
    end sort;

    function scanToken "Scan for the next token and return it"
      extends Modelica_Icons.Function;
      input String string "String to be scanned";
      input Integer startIndex(min=1) = 1
        "Start scanning of string at character startIndex";
      input Boolean unsigned=false
        "= true, if Real and Integer tokens shall not start with a sign";
      output Types.TokenValue token "Scanned token";
      output Integer nextIndex
        "Index of character after the found token; = 0, if NoToken";
    protected
      Integer startTokenIndex;
    algorithm
      // Initialize token
      token.real :=0.0;
      token.integer :=0;
      token.boolean :=false;
      token.string :="";

      // skip white space and line comments
      startTokenIndex := Advanced.skipLineComments(string, startIndex);
      if startTokenIndex > length(string) then
        token.tokenType := Modelica_Utilities.Types.TokenType.NoToken;
        nextIndex := startTokenIndex;
      else
        // scan Integer number
          (nextIndex, token.integer) := Advanced.scanInteger(string, startTokenIndex, unsigned);
           token.tokenType := Types.TokenType.IntegerToken;

        // scan Real number
        if nextIndex == startTokenIndex then
          (nextIndex, token.real) :=Advanced.scanReal(string, startTokenIndex, unsigned);
           token.tokenType := Types.TokenType.RealToken;
        end if;

        // scan String
        if nextIndex == startTokenIndex then
           (nextIndex,token.string) := Advanced.scanString(string, startTokenIndex);
            token.tokenType:= Types.TokenType.StringToken;
        end if;

        // scan Identifier or Boolean
        if nextIndex == startTokenIndex then
           (nextIndex,token.string) := Advanced.scanIdentifier(string, startTokenIndex);
           if nextIndex > startTokenIndex then
              if token.string == "false" then
                 token.string := "";
                 token.boolean :=false;
                 token.tokenType := Types.TokenType.BooleanToken;
              elseif token.string == "true" then
                 token.string := "";
                 token.boolean := true;
                 token.tokenType := Types.TokenType.BooleanToken;
              else
                 token.tokenType := Types.TokenType.IdentifierToken;
              end if;
           end if;
        end if;

        // scan Delimiter
        if nextIndex == startTokenIndex then
           token.string :=substring(string, startTokenIndex, startTokenIndex);
           token.tokenType := Types.TokenType.DelimiterToken;
           nextIndex := startTokenIndex + 1;
        end if;
      end if;
      annotation ( Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(token, nextIndex) = Strings.<b>scanToken</b>(string, startIndex, unsigned=false);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>scanToken</b> scans the string starting at index
\"startIndex\" and returns the next token, as well as the
index directly after the token. The returned token is a record
that holds the type of the token and the value of the token:
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\">token.tokenType</td>
      <td valign=\"top\">Type of the token, see below</td></tr>
  <tr><td valign=\"top\">token.real</td>
      <td valign=\"top\">Real value if tokenType == TokenType.RealToken</td></tr>
  <tr><td valign=\"top\">token.integer</td>
      <td valign=\"top\">Integer value if tokenType == TokenType.IntegerToken</td></tr>
  <tr><td valign=\"top\">token.boolean</td>
      <td valign=\"top\">Boolean value if tokenType == TokenType.BooleanToken</td></tr>
  <tr><td valign=\"top\">token.string</td>
      <td valign=\"top\">String value if tokenType == TokenType.StringToken/IdentifierToken/DelimiterToken</td></tr>
</table>
<p>
Variable token.tokenType is an enumeration (emulated as a package
with constants) that can have the following values:
</p>
<pre>
   import T = Modelica.Utilities.Types.TokenType;
</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\">T.RealToken</td>
      <td valign=\"top\">Modelica Real literal (e.g., 1.23e-4)</td></tr>
  <tr><td valign=\"top\">T.IntegerToken</td>
      <td valign=\"top\">Modelica Integer literal (e.g., 123)</td></tr>
  <tr><td valign=\"top\">T.BooleanToken</td>
      <td valign=\"top\">Modelica Boolean literal (e.g., false)</td></tr>
  <tr><td valign=\"top\">T.StringToken</td>
      <td valign=\"top\">Modelica String literal (e.g., \"string 123\")</td></tr>
  <tr><td valign=\"top\">T.IdentifierToken</td>
      <td valign=\"top\">Modelica identifier (e.g., \"force_a\")</td></tr>
  <tr><td valign=\"top\">T.DelimiterToken</td>
      <td valign=\"top\">any character without white space that does not appear<br>
          as first character in the tokens above (e.g., \"&amp;\")</td></tr>
  <tr><td valign=\"top\">T.NoToken</td>
      <td valign=\"top\">White space, line comments and no other token<br>
          until the end of the string</td></tr>
</table>
<p>
Modelica line comments (\"// ... end-of-line/end-of-string\")
as well as white space is ignored.
If \"unsigned=true\", a Real or Integer literal
is not allowed to start with a \"+\" or \"-\" sign.
</p>
<h4>Example</h4>
<blockquote><pre>
  import Modelica.Utilities.Strings;
  import T = Modelica.Utilities.Types.TokenType;
  (token, index) := Strings.scanToken(string);
  <b>if</b> token.tokenType == T.RealToken <b>then</b>
     realValue := token.real;
  <b>elseif</b> token.tokenType == T.IntegerToken <b>then</b>
     integerValue := token.integer;
  <b>elseif</b> token.tokenType == T.BooleanToken <b>then</b>
     booleanValue := token.boolean;
  <b>elseif</b> token.tokenType == T.Identifier <b>then</b>
     name := token.string;
  <b>else</b>
     Strings.syntaxError(string,index,\"Expected Real, Integer, Boolean or identifier token\");
  <b>end if</b>;
</pre></blockquote>
</html>"));
    end scanToken;

    function scanReal
      "Scan for the next Real number and trigger an assert if not present"
      extends Modelica_Icons.Function;
      input String string "String to be scanned";
      input Integer startIndex(min=1)=1
        "Start scanning of string at character startIndex";
      input Boolean unsigned=false
        "= true, if Real token shall not start with a sign";
      input String message=""
        "Message used in error message if scan is not successful";
      output Real number "Value of real number";
      output Integer nextIndex "index of character after the found number";
    algorithm
      (nextIndex, number) :=Advanced.scanReal(string, startIndex, unsigned);
      if nextIndex == startIndex then
         nextIndex :=Advanced.skipWhiteSpace(string, startIndex);
         if unsigned then
            syntaxError(string, nextIndex, "Expected a Real number without a sign " + message);
         else
            syntaxError(string, nextIndex, "Expected a Real number " + message);
         end if;
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             number = Strings.<b>scanReal</b>(string);
(number, nextIndex) = Strings.<b>scanReal</b>(string, startIndex=1,
                                            unsigned=false, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
The first form, \"scanReal(string)\", scans \"string\" for a
Real number with leading white space and returns the value.
</p>
<p>
The second form, \"scanReal(string,startIndex,unsigned)\",
scans the string starting at index
\"startIndex\", checks whether the next token is a Real literal
and returns its value as a Real number, as well as the
index directly after the Real number.
If the optional argument \"unsigned\" is <b>true</b>,
the real number shall not have a leading \"+\" or \"-\" sign.
</p>
<p>
If the required Real number with leading white space
is not present in \"string\", an assert is triggered.
</p>
</html>"));
    end scanReal;

    function scanInteger
      "Scan for the next Integer number and trigger an assert if not present"
      extends Modelica_Icons.Function;
      input String string "String to be scanned";
      input Integer startIndex(min=1)=1
        "Start scanning of string at character startIndex";
      input Boolean unsigned=false
        "= true, if Integer token shall not start with a sign";
      input String message=""
        "Message used in error message if scan is not successful";
      output Integer number "Value of Integer number";
      output Integer nextIndex "Index of character after the found number";
    algorithm
      (nextIndex, number) :=Advanced.scanInteger(string, startIndex, unsigned);
      if nextIndex == startIndex then
         nextIndex :=Advanced.skipWhiteSpace(string, startIndex);
         if unsigned then
            syntaxError(string, nextIndex, "Expected an Integer number without a sign " + message);
         else
            syntaxError(string, nextIndex, "Expected an Integer number " + message);
         end if;
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             number = Strings.<b>scanInteger</b>(string);
(number, nextIndex) = Strings.<b>scanInteger</b>(string, startIndex=1,
                                               unsigned=false, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>scanInteger</b> scans the string starting at index
\"startIndex\", checks whether the next token is an Integer literal
and returns its value as an Integer number, as well as the
index directly after the Integer number. An assert is triggered,
if the scanned string does not contain an Integer literal with optional
leading white space.
</p>
</html>"));
    end scanInteger;

    function scanBoolean
      "Scan for the next Boolean number and trigger an assert if not present"
      extends Modelica_Icons.Function;
      input String string "String to be scanned";
      input Integer startIndex(min=1)=1
        "Start scanning of string at character startIndex";
      input String message=""
        "Message used in error message if scan is not successful";
      output Boolean number "Value of Boolean";
      output Integer nextIndex "Index of character after the found number";
    protected
      String identifier;
    algorithm
      (nextIndex, identifier) :=Advanced.scanIdentifier(string, startIndex);

      if nextIndex > startIndex then
         if identifier == "false" then
            number := false;
         elseif identifier == "true" then
            number := true;
         else
            nextIndex := startIndex;
         end if;
      end if;

      if nextIndex == startIndex then
         nextIndex :=Advanced.skipWhiteSpace(string, startIndex);
         syntaxError(string, nextIndex,
           "Expected a Boolean constant, i.e., \"false\" or \"true\" " + message);
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             number = Strings.<b>scanBoolean</b>(string);
(number, nextIndex) = Strings.<b>scanBoolean</b>(string, startIndex=1, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>scanBoolean</b> scans the string starting at index
\"startIndex\", checks whether the next token is a Boolean literal
(i.e., is either the string \"false\" or \"true\", if converted to lower case letters)
and returns its value as a Boolean number, as well as the
index directly after the Boolean number. An assert is triggered,
if the scanned string does not contain a Boolean literal with optional
leading white space.
</p>
</html>"));
    end scanBoolean;

    function scanString
      "Scan for the next Modelica string and trigger an assert if not present"
      extends Modelica_Icons.Function;
      input String string "String to be scanned";
      input Integer startIndex(min=1)=1
        "Start scanning of string at character startIndex";
      input String message=""
        "Message used in error message if scan is not successful";
      output String result "Value of string";
      output Integer nextIndex "Index of character after the found string";
    algorithm
      (nextIndex, result) :=Advanced.scanString(string, startIndex);
      if nextIndex == startIndex then
         nextIndex :=Advanced.skipWhiteSpace(string, startIndex);
         syntaxError(string, nextIndex, "Expected a string enclosed in double quotes " + message);
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             string2 = Strings.<b>scanString</b>(string);
(string2, nextIndex) = Strings.<b>scanString</b>(string, startIndex=1, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>scanString</b> scans the string starting at index
\"startIndex\", checks whether the next token is a String literal
and returns its value as a String, as well as the
index directly after the String. An assert is triggered,
if the scanned string does not contain a String literal with optional
leading white space.
</p>
</html>"));
    end scanString;

    function scanIdentifier
      "Scan for the next Identifier and trigger an assert if not present"
      extends Modelica_Icons.Function;
      input String string "String to be scanned";
      input Integer startIndex(min=1)=1
        "Start scanning of identifier at character startIndex";
      input String message=""
        "Message used in error message if scan is not successful";
      output String identifier "Value of Identifier";
      output Integer nextIndex "Index of character after the found identifier";
    algorithm
      (nextIndex, identifier) :=Advanced.scanIdentifier(string, startIndex);
      if nextIndex == startIndex then
         nextIndex :=Advanced.skipWhiteSpace(string, startIndex);
         syntaxError(string, nextIndex, "Expected an identifier " + message);
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             identifier = Strings.<b>scanIdentifier</b>(string);
(identifier, nextIndex) = Strings.<b>scanIdentifier</b>(string, startIndex=1, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>scanIdentifier</b> scans the string starting at index
\"startIndex\", checks whether the next token is an Identifier
and returns its value as a string, as well as the
index directly after the Identifier. An assert is triggered,
if the scanned string does not contain an Identifier with optional
leading white space.
</p>
</html>"));
    end scanIdentifier;

    function scanDelimiter
      "Scan for the next delimiter and trigger an assert if not present"
      extends Modelica_Icons.Function;
      input String string "String to be scanned";
      input Integer startIndex(min=1)=1
        "Start scanning of delimiters at character startIndex";
      input String requiredDelimiters[:]={","} "Delimiters that are searched";
      input String message=""
        "Message used in error message if scan is not successful";
      output String delimiter "Found delimiter";
      output Integer nextIndex "Index of character after the found delimiter";
    protected
      Integer lenString = length(string);
      Integer lenDelimiter;
      Integer nDelimiters = size(requiredDelimiters,1);
      Integer endIndex;
      Boolean found;
      Integer i;

      encapsulated function concatenate "Concatenate strings together"
        import Modelica_Icons;
         extends Modelica_Icons.Function;
         input String strings[:];
         output String string;
      algorithm
         string := "{\"";
         for i in 1:size(strings,1) loop
            if i == 1 then
               string := "{\"" + strings[1] + "\"";
            else
               string := string + ", \"" + strings[i] + "\"";
            end if;
         end for;
         string := string + "}";
      end concatenate;
    algorithm
      nextIndex := Advanced.skipLineComments(string,startIndex);
      found := false;
      i := 1;
      while not found and i <= nDelimiters loop
         lenDelimiter :=length(requiredDelimiters[i]);
         if lenDelimiter == 0 then
            found := true;
            delimiter := "";
         else
            endIndex :=nextIndex + lenDelimiter - 1;
            if endIndex <= lenString then
               if substring(string,nextIndex,endIndex) == requiredDelimiters[i] then
                  found := true;
                  delimiter := requiredDelimiters[i];
               end if;
            end if;
            i := i + 1;
         end if;
      end while;

      if found then
          nextIndex := nextIndex + lenDelimiter;
      else
         if size(requiredDelimiters,1) == 1 then
            syntaxError(string, nextIndex, "Expected delimiter \"" + requiredDelimiters[1] + "\"\n" + message);
         else
            syntaxError(string, nextIndex, "Expected a delimiter out of " +
                        concatenate(requiredDelimiters) + "\n" + message);
         end if;
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             delimiter = Strings.<b>scanDelimiter</b>(string);
(delimiter, nextIndex) = Strings.<b>scanDelimiter</b>(string, startIndex=1,
                                 requiredDelimiters={\",\"}, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>scanDelimiter</b> scans the string starting at index
\"startIndex\", checks whether the next token is a delimiter string
and returns its value as a string, as well as the
index directly after the delimiter. An assert is triggered,
if the scanned string does not contain a delimiter out of the
list of requiredDelimiters. Input argument requiredDelimiters is a vector
of strings. The elements may have any length, including length 0.
If an element of the requiredDelimiters is zero, white space
is treated as delimiter. The function returns delimiter=\"\" and nextIndex
is the index of the first non white space character.
</p>
</html>"));
    end scanDelimiter;

    function scanNoToken "Scan string and check that it contains no more token"
      extends Modelica_Icons.Function;
      input String string "String to be scanned";
      input Integer startIndex(min=1)=1
        "Start scanning of string at character startIndex";
      input String message=""
        "Message used in error message if scan is not successful";
    protected
      Integer nextIndex;
    algorithm
      nextIndex :=Advanced.skipLineComments(string, startIndex);
      if nextIndex <= length(string) then
         syntaxError(string, nextIndex, "Expected no more token " + message);
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>scanNoToken</b>(string, startIndex=1, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>scanNoToken</b> scans the string starting at index
\"startIndex\" and checks whether there is no more token in the
string. An assert is triggered if this is not the case,
using the \"message\" argument as additional explanation in
the error text.
</p>
</html>"));
    end scanNoToken;

    function syntaxError
      "Print an error message, a string and the index at which scanning detected an error"
      extends Modelica_Icons.Function;
      input String string "String that has an error at position index";
      input Integer index "Index of string at which scanning detected an error";
      input String message="" "String printed at end of error message";

    protected
      Integer maxIndex = 40;
      Integer maxLenString = 60;
      Integer lenString = length(string);
      String errString;
      Integer index2 = if index < 1 then 1 else if index > lenString then lenString else index;
    algorithm
    // if "string" is too long, skip part of the string when printing it
       if index2 <= maxIndex then
         errString := string;
       else
         errString := "... " + substring(string, index2-maxIndex, lenString);
         index2 := maxIndex + 5; // To mark right position
       end if;

       if length(errString) > maxLenString then
          errString := substring(errString, 1, maxLenString) + " ...";
       end if;

    // Print error message
       Streams.error("Syntax error at character " + String(index) + " of\n" +
                     errString + "\n" +
                     repeat(index2-1, " ") + "*" + "\n" +
                     message);
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>syntaxError</b>(string, index, message);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>syntaxError</b> prints an error message in the
following form:
</p>
<pre>
   Syntax error at column &lt;index&gt; of
   &lt;string&gt;
       ^       // shows character that is wrong
   &lt;message&gt;
</pre>
<p>
where the strings withing &lt;..&gt; are the actual values of the
input arguments of the function.
</p>
<p>
If the given string is too long, only a relevant
part of the string is printed.
</p>
</html>"));
    end syntaxError;

    package Advanced "Advanced scanning functions"
    extends Modelica_Icons.Package;

      function scanReal "Scans a signed real number"
        extends Modelica_Icons.Function;
        input String string;
        input Integer startIndex(min=1)=1 "Index where scanning starts";
        input Boolean unsigned=false
          "= true, if number shall not start with '+' or '-'";
        output Integer nextIndex
          "Index after the found token (success=true) or index at which scanning failed (success=false)";
        output Real number "Value of Real number";
        external "C" ModelicaStrings_scanReal(string, startIndex, unsigned, nextIndex, number) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(nextIndex, realNumber) = <b>scanReal</b>(string, startIndex=1, unsigned=false);
</pre></blockquote>
<h4>Description</h4>
<p>
Starts scanning of \"string\" at position \"startIndex\".
First skips white space and scans afterwards a number
of type Real with an optional sign according to the Modelica grammar:
</p>
<pre>
    real     ::= [sign] unsigned [fraction] [exponent]
    sign     ::= '+' | '-'
    unsigned ::= digit [unsigned]
    fraction ::= '.' [unsigned]
    exponent ::= ('e' | 'E') [sign] unsigned
    digit    ::= '0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9'
</pre>
<p>
If successful, the function returns nextIndex = index of character
directly after the found real number, as well as the value
in the second output argument.
</p>
<p>
If not successful, on return nextIndex = startIndex and
the second output argument is zero.
</p>
<p>
If the optional argument \"unsigned\" is <b>true</b>, the number
shall not start with '+' or '-'. The default of \"unsigned\" is <b>false</b>.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Utilities.Strings.Advanced\">Strings.Advanced</a>.
</html>"));
      end scanReal;

      function scanInteger "Scans signed integer number"
        extends Modelica_Icons.Function;
        input String string;
        input Integer startIndex(min=1)=1;
        input Boolean unsigned=false
          "= true, if number shall not start with '+' or '-'";
        output Integer nextIndex
          "Index after the found token (success=true) or index at which scanning failed (success=false)";
        output Integer number "Value of Integer number";
        external "C" ModelicaStrings_scanInteger(string, startIndex, unsigned, nextIndex, number) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(nextIndex, integerNumber) = <b>scanInteger</b>(string, startIndex=1, unsigned=false);
</pre></blockquote>
<h4>Description</h4>
<p>
Starts scanning of \"string\" at position \"startIndex\".
First skips white space and scans afterwards a signed number
of type Integer. An Integer starts with an optional '+'
or '-', immediately
followed by a non-empty sequence of digits.
</p>
<p>
If successful, the function returns nextIndex = index of character
directly after the found Integer number, as well as the Integer value
in the second output argument.
</p>
<p>
If not successful, on return nextIndex = startIndex and
the second output argument is zero.
</p>
<p>
Note, a Real number, such as \"123.4\", is not treated
as an Integer number and scanInteger will return
nextIndex = startIndex in this case.
</p>
<p>
If the optional argument \"unsigned\" is <b>true</b>, the number
shall not start with '+' or '-'. The default of \"unsigned\" is <b>false</b>.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Utilities.Strings.Advanced\">Strings.Advanced</a>.
</html>"));
      end scanInteger;

      function scanString "Scan string"
        extends Modelica_Icons.Function;
        input String string;
        input Integer startIndex(min=1)=1 "Index where scanning starts";
        output Integer nextIndex
          "Index after the found token (success=true) or index at which scanning failed (success=false)";
        output String string2 "Value of String token";
        external "C" ModelicaStrings_scanString(string, startIndex, nextIndex, string2) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(nextIndex, string2) = <b>scanString</b>(string, startIndex=1);
</pre></blockquote>
<h4>Description</h4>
<p>
Starts scanning of \"string\" at position \"startIndex\".
First skips white space and scans afterwards a string
according to the Modelica grammar, i.e., a string
enclosed in double quotes.
</p>
<p>
If successful, the function returns nextIndex = index of character
directly after the found string, as well as the string value
in the second output argument.
</p>
<p>
If not successful, on return nextIndex = startIndex and
the second output argument is an empty string.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Utilities.Strings.Advanced\">Strings.Advanced</a>.
</html>"));
      end scanString;

      function scanIdentifier "Scans simple identifiers"
        extends Modelica_Icons.Function;
        input String string;
        input Integer startIndex(min=1)=1 "Index where scanning starts";
        output Integer nextIndex
          "Index after the found token (success=true) or index at which scanning failed (success=false)";
        output String identifier "Value of identifier token";
        external "C" ModelicaStrings_scanIdentifier(string, startIndex, nextIndex, identifier) annotation(Library="ModelicaExternalC");

        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(nextIndex, identifier) = <b>scanIdentifier</b>(string, startIndex=1);
</pre></blockquote>
<h4>Description</h4>
<p>
Starts scanning of \"string\" at position \"startIndex\".
First skips white space and scans afterwards a Modelica
identifier, i.e., a sequence of characters starting with
a letter (\"a\"..\"z\" or \"A\"..\"Z\") followed by letters,
digits or underscores (\"_\").
</p>
<p>
If successful, the function returns nextIndex = index of character
directly after the found identifier, as well as the identifier
as string in the second output argument.
</p>
<p>
If not successful, on return nextIndex = startIndex and
the second output argument is an empty string.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Utilities.Strings.Advanced\">Strings.Advanced</a>.
</html>"));
      end scanIdentifier;

      function skipWhiteSpace "Scans white space"
        extends Modelica_Icons.Function;
        input String string;
        input Integer startIndex(min=1)=1;
        output Integer nextIndex;
        external "C" nextIndex = ModelicaStrings_skipWhiteSpace(string, startIndex) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
nextIndex = <b>skipWhiteSpace</b>(string, startIndex);
</pre></blockquote>
<h4>Description</h4>
<p>
Starts scanning of \"string\" at position \"startIndex\" and
skips white space. The function returns nextIndex = index of character
of the first non white space character.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Utilities.Strings.Advanced\">Strings.Advanced</a>.
</html>"));
      end skipWhiteSpace;

      function skipLineComments "Scans comments and white space"
        extends Modelica_Icons.Function;
        input String string;
        input Integer startIndex(min=1)=1;
        output Integer nextIndex;
      protected
        Integer lenString = length(string);
        Boolean scanning;
        Boolean lineComment;
      algorithm
        nextIndex := startIndex;
        scanning := true;
        while scanning loop
           nextIndex := Advanced.skipWhiteSpace(string, nextIndex);
           if nextIndex+1 <= lenString then
              if substring(string,nextIndex,nextIndex+1) == "//" then
                 // search end of line comment
                 nextIndex := nextIndex + 2;
                 if nextIndex <= lenString then
                    lineComment := true;
                    while lineComment loop
                       if substring(string,nextIndex,nextIndex) == "\n" then
                          lineComment := false;
                       end if;
                       nextIndex := nextIndex + 1;
                       if nextIndex > lenString then
                          lineComment := false;
                          scanning := false;
                       end if;
                    end while;
                 else
                    scanning := false;
                 end if;
              else
                 scanning := false;
              end if;
           else
              scanning := false;
           end if;
        end while;
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
nextIndex = <b>skipLineComments</b>(string, startIndex);
</pre></blockquote>
<h4>Description</h4>
<p>
Starts scanning of \"string\" at position \"startIndex\".
First skips white space and scans afterwards a Modelica (C/C++)
line comment, i.e., a sequence of characters that
starts with \"//\" and ends with an end-of-line \"\\n\" or
with the end of the string. If end-of-line is reached,
the function continues to skip white space and
scanning of line comments until end-of-string is
reached, or another token is detected.
</p>
<p>
If successful, the function returns nextIndex = index of character
directly after the found line comment.
</p>
<p>
If not successful, on return nextIndex = startIndex.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Utilities.Strings.Advanced\">Strings.Advanced</a>.
</html>"));
      end skipLineComments;
      annotation (Documentation(info="<html>
<h4>Library content</h4>
<p>
Package <b>Strings.Advanced</b> contains basic scanning
functions. These functions should be <b>not called</b> directly, because
it is much simpler to utilize the higher level functions \"Strings.scanXXX\".
The functions of the \"Strings.Advanced\" library provide
the basic interface in order to implement the higher level
functions in package \"Strings\".
</p>
<p>
Library \"Advanced\" provides the following functions:
</p>
<pre>
  (nextIndex, realNumber)    = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanReal\">scanReal</a>        (string, startIndex, unsigned=false);
  (nextIndex, integerNumber) = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanInteger\">scanInteger</a>     (string, startIndex, unsigned=false);
  (nextIndex, string2)       = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanString\">scanString</a>      (string, startIndex);
  (nextIndex, identifier)    = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanIdentifier\">scanIdentifier</a>  (string, startIndex);
   nextIndex                 = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.skipWhiteSpace\">skipWhiteSpace</a>  (string, startIndex);
   nextIndex                 = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.skipLineComments\">skipLineComments</a>(string, startIndex);
</pre>
<p>
All functions perform the following actions:
</p>
<ol>
<li> Scanning starts at character position \"startIndex\" of
     \"string\" (startIndex has a default of 1).
<li> First, white space is skipped, such as blanks (\" \"), tabs (\"\\t\"), or newline (\"\\n\")</li>
<li> Afterwards, the required token is scanned.</li>
<li> If successful, on return nextIndex = index of character
     directly after the found token and the token value is returned
     as second output argument.<br>
     If not successful, on return nextIndex = startIndex.
     </li>
</ol>
<p>
The following additional rules apply for the scanning:
</p>
<ul>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanReal\">scanReal</a>:<br>
     Scans a full number including one optional leading \"+\" or \"-\" (if unsigned=false)
     according to the Modelica grammar. For example, \"+1.23e-5\", \"0.123\" are
     Real numbers, but \".1\" is not.
     Note, an Integer number, such as \"123\" is also treated as a Real number.<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanInteger\">scanInteger</a>:<br>
     Scans an Integer number including one optional leading \"+\"
     or \"-\" (if unsigned=false) according to the Modelica (and C/C++) grammar.
     For example, \"+123\", \"20\" are Integer numbers.
     Note, a Real number, such as \"123.4\" is not an Integer and
     scanInteger returns nextIndex = startIndex.<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanString\">scanString</a>:<br>
     Scans a String according to the Modelica (and C/C++) grammar, e.g.,
     \"This is a \"string\"\" is a valid string token.<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanIdentifier\">scanIdentifier</a>:<br>
     Scans a Modelica identifier, i.e., the identifier starts either
     with a letter, followed by letters, digits or \"_\".
     For example, \"w_rel\", \"T12\".<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.skipLineComments\">skipLineComments</a><br>
     Skips white space and Modelica (C/C++) line comments iteratively.
     A line comment starts with \"//\" and ends either with an
     end-of-line (\"\\n\") or the end of the \"string\". </li>
</ul>
</html>"));
    end Advanced;
    annotation (
      Documentation(info="<HTML>
<h4>Library content</h4>
<p>
Package <b>Strings</b> contains functions to manipulate strings.
</p>
<p>
In the table below an example
call to every function is given using the <b>default</b> options.
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\">len = <a href=\"modelica://Modelica.Utilities.Strings.length\">length</a>(string)</td>
      <td valign=\"top\">Returns length of string</td></tr>
  <tr><td valign=\"top\">string2 = <a href=\"modelica://Modelica.Utilities.Strings.substring\">substring</a>(string1,startIndex,endIndex)
       </td>
      <td valign=\"top\">Returns a substring defined by start and end index</td></tr>
  <tr><td valign=\"top\">result = <a href=\"modelica://Modelica.Utilities.Strings.repeat\">repeat</a>(n)<br>
 result = <a href=\"modelica://Modelica.Utilities.Strings.repeat\">repeat</a>(n,string)</td>
      <td valign=\"top\">Repeat a blank or a string n times.</td></tr>
  <tr><td valign=\"top\">result = <a href=\"modelica://Modelica.Utilities.Strings.compare\">compare</a>(string1, string2)</td>
      <td valign=\"top\">Compares two substrings with regards to alphabetical order</td></tr>
  <tr><td valign=\"top\">identical =
<a href=\"modelica://Modelica.Utilities.Strings.isEqual\">isEqual</a>(string1,string2)</td>
      <td valign=\"top\">Determine whether two strings are identical</td></tr>
  <tr><td valign=\"top\">result = <a href=\"modelica://Modelica.Utilities.Strings.count\">count</a>(string,searchString)</td>
      <td valign=\"top\">Count the number of occurrences of a string</td></tr>
  <tr>
<td valign=\"top\">index = <a href=\"modelica://Modelica.Utilities.Strings.find\">find</a>(string,searchString)</td>
      <td valign=\"top\">Find first occurrence of a string in another string</td></tr>
<tr>
<td valign=\"top\">index = <a href=\"modelica://Modelica.Utilities.Strings.findLast\">findLast</a>(string,searchString)</td>
      <td valign=\"top\">Find last occurrence of a string in another string</td></tr>
  <tr><td valign=\"top\">string2 = <a href=\"modelica://Modelica.Utilities.Strings.replace\">replace</a>(string,searchString,replaceString)</td>
      <td valign=\"top\">Replace one or all occurrences of a string</td></tr>
  <tr><td valign=\"top\">stringVector2 = <a href=\"modelica://Modelica.Utilities.Strings.sort\">sort</a>(stringVector1)</td>
      <td valign=\"top\">Sort vector of strings in alphabetic order</td></tr>
  <tr><td valign=\"top\">(token, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanToken\">scanToken</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for a token (Real/Integer/Boolean/String/Identifier/Delimiter/NoToken)</td></tr>
  <tr><td valign=\"top\">(number, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">scanReal</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for a Real constant</td></tr>
  <tr><td valign=\"top\">(number, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanInteger\">scanInteger</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for an Integer constant</td></tr>
  <tr><td valign=\"top\">(boolean, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanBoolean\">scanBoolean</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for a Boolean constant</td></tr>
  <tr><td valign=\"top\">(string2, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanString\">scanString</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for a String constant</td></tr>
  <tr><td valign=\"top\">(identifier, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanIdentifier\">scanIdentifier</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for an identifier</td></tr>
  <tr><td valign=\"top\">(delimiter, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanDelimiter\">scanDelimiter</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for delimiters</td></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Strings.scanNoToken\">scanNoToken</a>(string,startIndex)</td>
      <td valign=\"top\">Check that remaining part of string consists solely of <br>
          white space or line comments (\"// ...\\n\").</td></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Strings.syntaxError\">syntaxError</a>(string,index,message)</td>
      <td valign=\"top\"> Print a \"syntax error message\" as well as a string and the <br>
           index at which scanning detected an error</td></tr>
</table>
<p>
The functions \"compare\", \"isEqual\", \"count\", \"find\", \"findLast\", \"replace\", \"sort\"
have the optional
input argument <b>caseSensitive</b> with default <b>true</b>.
If <b>false</b>, the operation is carried out without taking
into account whether a character is upper or lower case.
</p>
</HTML>"));
  end Strings;

  package System "Interaction with environment"
    extends Modelica_Icons.Package;

  function getWorkDirectory "Get full path name of work directory"
    extends Modelica_Icons.Function;
    output String directory "Full path name of work directory";
  // POSIX function "getcwd"
    external "C" directory=  ModelicaInternal_getcwd(0) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>

</html>"));
  end getWorkDirectory;

  function setWorkDirectory "Set work directory"
    extends Modelica_Icons.Function;
    input String directory "New work directory";
  // POSIX function "chdir"
  external "C" ModelicaInternal_chdir(directory) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>

</html>"));
  end setWorkDirectory;

  function getEnvironmentVariable "Get content of environment variable"
    extends Modelica_Icons.Function;
    input String name "Name of environment variable";
    input Boolean convertToSlash =  false
        "True, if native directory separators in 'result' shall be changed to '/'";
    output String content
        "Content of environment variable (empty, if not existent)";
    output Boolean exist
        "= true, if environment variable exists; = false, if it does not exist";
    external "C" ModelicaInternal_getenv(name, convertToSlash, content, exist) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>

</html>"));
  end getEnvironmentVariable;

  function setEnvironmentVariable "Set content of local environment variable"
    extends Modelica_Icons.Function;
    input String name "Name of environment variable";
    input String content "Value of the environment variable";
    input Boolean convertFromSlash =  false
        "True, if '/' in content shall be changed to the native directory separator";
  external "C" ModelicaInternal_setenv(name, content, convertFromSlash) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>

</html>"));
  end setEnvironmentVariable;

  function command "Execute command in default shell"
    extends Modelica_Icons.Function;
    input String string "String to be passed to shell";
    output Integer result "Return value from command (depends on environment)";
    external "C" result=  system(string) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>

</html>"));
  end command;

  function exit "Terminate execution of Modelica environment"
    extends Modelica_Icons.Function;
    input Integer status=0
        "Result to be returned by environment (0 means success)";
    external "C" ModelicaInternal_exit(status) annotation(Library="ModelicaExternalC");
      annotation (Documentation(info="<html>

</html>"));
  end exit;
      annotation (
  Documentation(info="<html>
<p>
This package contains functions to interact with the environment.
</p>
</html>"));
  end System;

  package Types "Type definitions used in package Modelica.Utilities"
    extends Modelica_Icons.TypesPackage;
    type Compare = enumeration(
        Less "String 1 is lexicographically less than string 2",
        Equal "String 1 is identical to string 2",
        Greater "String 1 is lexicographically greater than string 2")
      "Enumeration defining comparison of two strings";

    type FileType = enumeration(
        NoFile "No file exists",
        RegularFile "Regular file",
        Directory "Directory",
        SpecialFile "Special file (pipe, FIFO, device, etc.)")
      "Enumeration defining the type of a file";

    type TokenType = enumeration(
        RealToken,
        IntegerToken,
        BooleanToken,
        StringToken,
        IdentifierToken,
        DelimiterToken,
        NoToken) "Enumeration defining the token type";

    record TokenValue "Value of token"
       extends Modelica_Icons.Record;
       TokenType tokenType "Type of token";
       Real real "Value if tokenType == TokenType.RealToken";
       Integer integer "Value if tokenType == TokenType.IntegerToken";
       Boolean boolean "Value if tokenType == TokenType.BooleanToken";
       String string
        "Value if tokenType == TokenType.StringToken/IdentifierToken/DelimiterToken";
      annotation (Documentation(info="<html>

</html>"));
    end TokenValue;
    annotation (Documentation(info="<html>
<p>
This package contains type definitions used in Modelica.Utilities.
</p>

</html>"));
  end Types;

  package Internal
    "Internal components that a user should usually not directly utilize"
    extends Modelica_Icons.InternalPackage;
  partial package PartialModelicaServices
      "Interfaces of components requiring a tool specific implementation"
      extends Modelica_Icons.InternalPackage;
    package Animation "Models and functions for 3-dim. animation"
      extends Modelica_Icons.Package;
    partial model PartialShape
          "Interface for 3D animation of elementary shapes"

          import SI = Modelica_SIunits;
          import Modelica_Mechanics_MultiBody.Frames;
          import Modelica_Mechanics_MultiBody.Types;

      parameter Types.ShapeType shapeType="box"
            "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring, <external shape>)";
      input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the object frame"
                                                                              annotation(Dialog);
          input Modelica_SIunits.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of object frame, resolved in world frame"
            annotation (Dialog);
          input Modelica_SIunits.Position r_shape[3]={0,0,0}
            "Position vector from origin of object frame to shape origin, resolved in object frame"
            annotation (Dialog);
      input Real lengthDirection[3](each final unit="1")={1,0,0}
            "Vector in length direction, resolved in object frame"
                                                                annotation(Dialog);
      input Real widthDirection[3](each final unit="1")={0,1,0}
            "Vector in width direction, resolved in object frame"
                                                               annotation(Dialog);
          input Modelica_SIunits.Length length=0 "Length of visual object"
            annotation (Dialog);
          input Modelica_SIunits.Length width=0 "Width of visual object"
            annotation (Dialog);
          input Modelica_SIunits.Length height=0 "Height of visual object"
            annotation (Dialog);
      input Types.ShapeExtra extra=0.0
            "Additional size data for some of the shape types"                             annotation(Dialog);
      input Real color[3]={255,0,0} "Color of shape"               annotation(Dialog(colorSelector=true));
      input Types.SpecularCoefficient specularCoefficient = 0.7
            "Reflection of ambient light (= 0: light is completely absorbed)"
                                                                          annotation(Dialog);
      annotation (
        Documentation(info="<html>

<p>
This model is documented at
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>.
</p>

</html>"));

    end PartialShape;

      model PartialSurface "Interface for 3D animation of surfaces"

          import Modelica_Mechanics_MultiBody.Frames;
          import Modelica_Mechanics_MultiBody.Types;

        input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the surface frame"
          annotation(Dialog(group="Surface frame"));
        input Modelica_SIunits.Position r_0[3]={0,0,0}
            "Position vector from origin of world frame to origin of surface frame, resolved in world frame"
          annotation(Dialog(group="Surface frame"));

        parameter Integer nu=2 "Number of points in u-Dimension" annotation(Dialog(group="Surface properties"));
        parameter Integer nv=2 "Number of points in v-Dimension" annotation(Dialog(group="Surface properties"));
        replaceable function surfaceCharacteristic =
           Modelica_Mechanics_MultiBody.Interfaces.partialSurfaceCharacteristic
            "Function defining the surface characteristic"
                annotation(choicesAllMatching=true,Dialog(group="Surface properties"));

        parameter Boolean wireframe=false
            "= true: 3D model will be displayed without faces"
          annotation (Dialog(group="Material properties"),choices(checkBox=true));
        parameter Boolean multiColoredSurface=false
            "= true: Color is defined for each surface point"
            annotation(Dialog(group="Material properties"),choices(checkBox=true));
        input Real color[3]={255,0,0} "Color of surface" annotation(Dialog(colorSelector=true,group="Material properties", enable=not multiColoredSurface));
        input Types.SpecularCoefficient specularCoefficient = 0.7
            "Reflection of ambient light (= 0: light is completely absorbed)"
                                                                            annotation(Dialog(group="Material properties"));
        input Real transparency=0
            "Transparency of shape: 0 (= opaque) ... 1 (= fully transparent)"
                                     annotation(Dialog(group="Material properties"));
        annotation (Documentation(info="<html>
<p>
This model is documented at
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface</a>.
</p>

</html>"));
      end PartialSurface;
    end Animation;

    package ExternalReferences "Functions to access external resources"
      extends Modelica_Icons.InternalPackage;
      partial function PartialLoadResource
          "Interface for tool specific function to return the absolute path name of a URI or local file name"
        extends Modelica_Icons.Function;
        input String uri "URI or local file name";
        output String fileReference "Absolute path name of file";
        annotation (Documentation(info="<html>
<p>
This partial function defines the function interface of a tool-specific implementation
in package ModelicaServices. The interface is documented at
<a href=\"modelica://Modelica.Utilities.Files.loadResource\">Modelica.Utilities.Internal.FileSystem.loadResource</a>.
</p>

</html>"));
      end PartialLoadResource;
    end ExternalReferences;
      annotation (Documentation(info="<html>

<p>
This package contains interfaces of a set of functions and models used in the
Modelica Standard Library that requires a <b>tool specific implementation</b>.
There is an associated package called <b>ModelicaServices</b>. A tool vendor
should provide a proper implementation of this library for the corresponding
tool. The default implementation is \"do nothing\".
In the Modelica Standard Library, the models and functions of ModelicaServices
are used.
</p>
</html>"));
  end PartialModelicaServices;

  package FileSystem
      "Internal package with external functions as interface to the file system"
   extends Modelica_Icons.InternalPackage;

    function mkdir "Make directory (POSIX: 'mkdir')"
      extends Modelica_Icons.Function;
      input String directoryName "Make a new directory";
    external "C" ModelicaInternal_mkdir(directoryName) annotation(Library="ModelicaExternalC");
    end mkdir;

    function rmdir "Remove empty directory (POSIX function 'rmdir')"
      extends Modelica_Icons.Function;
      input String directoryName "Empty directory to be removed";
    external "C" ModelicaInternal_rmdir(directoryName) annotation(Library="ModelicaExternalC");
    end rmdir;

    function stat "Inquire file information (POSIX function 'stat')"
      extends Modelica_Icons.Function;
      input String name "Name of file, directory, pipe etc.";
      output Types.FileType fileType "Type of file";
    external "C" fileType = ModelicaInternal_stat(name) annotation(Library="ModelicaExternalC");
    end stat;

    function rename "Rename existing file or directory (C function 'rename')"
      extends Modelica_Icons.Function;
      input String oldName "Current name";
      input String newName "New name";
    external "C" ModelicaInternal_rename(oldName, newName) annotation(Library="ModelicaExternalC");
    end rename;

    function removeFile "Remove existing file (C function 'remove')"
      extends Modelica_Icons.Function;
      input String fileName "File to be removed";
    external "C" ModelicaInternal_removeFile(fileName) annotation(Library="ModelicaExternalC");
    end removeFile;

    function copyFile
        "Copy existing file (C functions 'fopen', 'getc', 'putc', 'fclose')"
      extends Modelica_Icons.Function;
      input String fromName "Name of file to be copied";
      input String toName "Name of copy of file";
    external "C" ModelicaInternal_copyFile(fromName, toName) annotation(Library="ModelicaExternalC");
    end copyFile;

    function readDirectory
        "Read names of a directory (POSIX functions opendir, readdir, closedir)"
      extends Modelica_Icons.Function;
      input String directory
          "Name of the directory from which information is desired";
      input Integer nNames
          "Number of names that are returned (inquire with getNumberOfFiles)";
      output String names[nNames]
          "All file and directory names in any order from the desired directory";
      external "C" ModelicaInternal_readDirectory(directory,nNames,names) annotation(Library="ModelicaExternalC");
    end readDirectory;

  function getNumberOfFiles
        "Get number of files and directories in a directory (POSIX functions opendir, readdir, closedir)"
    extends Modelica_Icons.Function;
    input String directory "Directory name";
    output Integer result
          "Number of files and directories present in 'directory'";
    external "C" result=  ModelicaInternal_getNumberOfFiles(directory) annotation(Library="ModelicaExternalC");
  end getNumberOfFiles;

    annotation (
  Documentation(info="<html>
<p>
Package <b>Internal.FileSystem</b> is an internal package that contains
low level functions as interface to the file system.
These functions should not be called directly in a scripting
environment since more convenient functions are provided
in packages Files and Systems.
</p>
<p>
Note, the functions in this package are direct interfaces to
functions of POSIX and of the standard C library. Errors
occurring in these functions are treated by triggering
a Modelica assert. Therefore, the functions in this package
return only for a successful operation. Furthermore, the
representation of a string is hidden by this interface,
especially if the operating system supports Unicode characters.
</p>
</html>"));
  end FileSystem;
  end Internal;
    annotation (
Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={
    Polygon(
      origin={1.3835,-4.1418},
      rotation=45.0,
      fillColor={64,64,64},
      pattern=LinePattern.None,
      fillPattern=FillPattern.Solid,
      points={{-15.0,93.333},{-15.0,68.333},{0.0,58.333},{15.0,68.333},{15.0,93.333},{20.0,93.333},{25.0,83.333},{25.0,58.333},{10.0,43.333},{10.0,-41.667},{25.0,-56.667},{25.0,-76.667},{10.0,-91.667},{0.0,-91.667},{0.0,-81.667},{5.0,-81.667},{15.0,-71.667},{15.0,-61.667},{5.0,-51.667},{-5.0,-51.667},{-15.0,-61.667},{-15.0,-71.667},{-5.0,-81.667},{0.0,-81.667},{0.0,-91.667},{-10.0,-91.667},{-25.0,-76.667},{-25.0,-56.667},{-10.0,-41.667},{-10.0,43.333},{-25.0,58.333},{-25.0,83.333},{-20.0,93.333}}),
    Polygon(
      origin={10.1018,5.218},
      rotation=-45.0,
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      points={{-15.0,87.273},{15.0,87.273},{20.0,82.273},{20.0,27.273},{10.0,17.273},{10.0,7.273},{20.0,2.273},{20.0,-2.727},{5.0,-2.727},{5.0,-77.727},{10.0,-87.727},{5.0,-112.727},{-5.0,-112.727},{-10.0,-87.727},{-5.0,-77.727},{-5.0,-2.727},{-20.0,-2.727},{-20.0,2.273},{-10.0,7.273},{-10.0,17.273},{-20.0,27.273},{-20.0,82.273}})}),
Documentation(info="<html>
<p>
This package contains Modelica <b>functions</b> that are
especially suited for <b>scripting</b>. The functions might
be used to work with strings, read data from file, write data
to file or copy, move and remove files.
</p>
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"modelica://Modelica.Utilities.UsersGuide\">Modelica.Utilities.User's Guide</a>
     discusses the most important aspects of this library.</li>
<li> <a href=\"modelica://Modelica.Utilities.Examples\">Modelica.Utilities.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>
<p>
The following main sublibraries are available:
</p>
<ul>
<li> <a href=\"modelica://Modelica.Utilities.Files\">Files</a>
     provides functions to operate on files and directories, e.g.,
     to copy, move, remove files.</li>
<li> <a href=\"modelica://Modelica.Utilities.Streams\">Streams</a>
     provides functions to read from files and write to files.</li>
<li> <a href=\"modelica://Modelica.Utilities.Strings\">Strings</a>
     provides functions to operate on strings. E.g.
     substring, find, replace, sort, scanToken.</li>
<li> <a href=\"modelica://Modelica.Utilities.System\">System</a>
     provides functions to interact with the environment.
     E.g., get or set the working directory or environment
     variables and to send a command to the default shell.</li>
</ul>

<p>
Copyright &copy; 1998-2013, Modelica Association, DLR, and Dassault Syst&egrave;mes AB.
</p>

<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>

</html>"),
    uses(ModelicaServices(version="1.2")));
end Modelica_Utilities;
