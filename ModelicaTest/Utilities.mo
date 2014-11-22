within ModelicaTest;
package Utilities "Test functions for Modelica.Utilities"
  extends Modelica.Icons.Package;
  function Strings "Test functions of Modelica.Utilities.Strings"
    extends Modelica.Icons.Function;
    import Modelica.Utilities.Streams;
    import Modelica.Utilities.Strings;
    import Modelica.Utilities.Types;
    input String logFile="ModelicaTestLog.txt"
      "Filename where the log is stored";
    output Boolean ok;
  protected
    Integer i;
    Integer j;
    Real r;
    String s;
    Boolean b;
    String svec[2];
    Types.TokenValue token;
  algorithm
    Streams.print("... Test of Modelica.Utilities.Strings");
    Streams.print("... Test of Modelica.Utilities.Strings", logFile);

    i := Strings.length("hello, world");
    assert(i == 12, "Strings.length failed");
    // assert(Strings.length("hello, world") == 12, "Strings.length failed");
    // **** Dymola says "Failed to expand" if you uncomment the line above.

    s := Strings.substring("12345678", 3, 3);
    assert(s == "3", "Strings.Advanced.substring 1 failed");

    s := Strings.substring(
        "12345678",
        3,
        5);
    assert(s == "345", "Strings.Advanced.substring 2 failed");

    s := Strings.repeat(3, "12");
    assert(s == "121212", "Strings.Advanced.repeat failed");

    i := Strings.compare(
        "abc",
        "ABC",
        caseSensitive=false);
    assert(i == Modelica.Utilities.Types.Compare.Equal,
      "Strings.Advanced.compare 1 failed");

    i := Strings.compare("abc", "zef");
    assert(i == Modelica.Utilities.Types.Compare.Less,
      "Strings.Advanced.compare 2 failed");

    b := Strings.isEqual("abc", "ABC");
    assert(not b, "Strings.Advanced.isEqual 1 failed");

    b := Strings.isEqual(
        "abc",
        "ABC",
        caseSensitive=false);
    assert(b, "Strings.Advanced.isEqual 2 failed");

    b := Strings.isEmpty("");
    assert(b, "Strings.Advanced.isEmpty 1 failed");

    b := Strings.isEmpty("   ");
    assert(b, "Strings.Advanced.isEmpty 2 failed");

    b := Strings.isEmpty("a");
    assert(not b, "Strings.Advanced.isEmpty 3 failed");

    b := Strings.isEmpty("  abc  ");
    assert(not b, "Strings.Advanced.isEmpty 4 failed");

    i := Strings.count("line1 line2 line1 line2", "line2");
    assert(i == 2, "Strings.Advanced.count failed");

    i := Strings.find("x line x line x", "line");
    assert(i == 3, "Strings.Advanced.find failed");

    i := Strings.findLast("x line x line x", "line");
    assert(i == 10, "Strings.Advanced.findLast failed");

    s := Strings.replace(
        "x line x line x",
        "line",
        "LINE");
    assert(s == "x LINE x LINE x", "Strings.Advanced.replace failed");

    svec := Strings.sort({"zxy","abc"});
    assert(svec[1] == "abc" and svec[2] == "zxy",
      "Strings.Advanced.sort failed");

    // Strings.Advanced
    i := Strings.Advanced.skipWhiteSpace("  abc ", 1);
    assert(i == 3, "Strings.Advanced.skipWhiteSpace failed");

    i := Strings.Advanced.skipLineComments(" // xx", 1);
    assert(i == 7, "Strings.Advanced.skipLineComments 1 failed");

    i := Strings.Advanced.skipLineComments(" // xx", 1);
    assert(i == 7, "Strings.Advanced.skipLineComments 1 failed");

    // i := Strings.Advanced.skipLineComments(" // xx\n //yy \n  abc");
    // assert(i == 17, "Strings.Advanced.skipLineComments 2 failed");

    (i,r) := Strings.Advanced.scanReal("  -123.47e-2", 1);
    assert(i == 13 and r == -123.47e-2, "Strings.Advanced.scanReal 1 failed");

    (i,r) := Strings.Advanced.scanReal(
        "  123 ",
        1,
        unsigned=true);
    assert(i == 6 and r == 123, "Strings.Advanced.scanReal 2 failed");

    (i,j) := Strings.Advanced.scanInteger("  -123", 1);
    assert(i == 7 and j == -123, "Strings.Advanced.scanInteger 1 failed");

    (i,j) := Strings.Advanced.scanInteger(
        "  123",
        1,
        unsigned=true);
    assert(i == 6 and j == 123, "Strings.Advanced.scanInteger 2 failed");

    (i,s) := Strings.Advanced.scanString(" \"string text\" x=3", 1);
    assert(i == 15 and s == "string text", "Strings.Advanced.scanString failed");

    (i,s) := Strings.Advanced.scanIdentifier(" x_12=2;", 1);
    assert(i == 6 and s == "x_12", "Strings.Advanced.scanIdentifier failed");

    // Strings.scanToken
    (token,i) := Strings.scanToken("  -123.47e-2", 1);
    assert(i == 13 and token.tokenType == Types.TokenType.RealToken and token.real
       == -123.47e-2, "String.scanToken 1 failed");

    (token,i) := Strings.scanToken("  -123", 1);
    assert(i == 7 and token.tokenType == Types.TokenType.IntegerToken and token.integer
       == -123, "String.scanToken 2 failed");

    (token,i) := Strings.scanToken(
        "  123",
        1,
        unsigned=true);
    assert(i == 6 and token.tokenType == Types.TokenType.IntegerToken and token.integer
       == 123, "String.scanToken 3 failed");

    (token,i) := Strings.scanToken("  true x", 1);
    assert(i == 7 and token.tokenType == Types.TokenType.BooleanToken and token.boolean,
      "String.scanToken 4 failed");

    (token,i) := Strings.scanToken("  false x", 1);
    assert(i == 8 and token.tokenType == Types.TokenType.BooleanToken and not
      token.boolean, "String.scanToken 5 failed");

    (token,i) := Strings.scanToken(" \"string text\" x=3", 1);
    assert(i == 15 and token.tokenType == Types.TokenType.StringToken and token.string
       == "string text", "String.scanToken 6 failed");

    (token,i) := Strings.scanToken(" x_12=2;", 1);
    assert(i == 6 and token.tokenType == Types.TokenType.IdentifierToken and
      token.string == "x_12", "String.scanToken 7 failed");

    (token,i) := Strings.scanToken("  abc = 3;   ", 11);
    assert(i == 14 and token.tokenType == Types.TokenType.NoToken,
      "String.scanToken 8 failed");

    // Strings.scanXXX
    (r,i) := Strings.scanReal(
        "  123 ",
        1,
        unsigned=true);
    assert(i == 6 and r == 123, "String.scanRequiredReal 2 failed");

    (j,i) := Strings.scanInteger("  -123", 1);
    assert(i == 7 and j == -123, "String.scanRequiredInteger 1 failed");

    (j,i) := Strings.scanInteger(
        "  123",
        1,
        unsigned=true);
    assert(i == 6 and j == 123, "String.scanRequiredInteger 2 failed");

    (b,i) := Strings.scanBoolean("  true x", 1);
    assert(i == 7 and b, "String.scanRequiredBoolean 1 failed");

    (b,i) := Strings.scanBoolean("  false x", 1);
    assert(i == 8 and not b, "String.scanRequiredBoolean 2 failed");

    (s,i) := Strings.scanString(" \"string text\" x=3", 1);
    assert(i == 15 and s == "string text", "String.scanRequiredString failed");

    (s,i) := Strings.scanIdentifier(" x_12=2;", 1);
    assert(i == 6 and s == "x_12", "String.scanRequiredIdentifier failed");

    (s,i) := Strings.scanDelimiter(
        "  &,",
        1,
        {"&",","});
    assert(i == 4 and s == "&", "String.scanRequiredDelimiter 1 failed");

    (s,i) := Strings.scanDelimiter(
        "  /*,",
        1,
        {"&","/*"});
    assert(i == 5 and s == "/*", "String.scanRequiredDelimiter 2 failed");

    Strings.scanNoToken("  abc = 3;   ", 11);

    ok := true;
  end Strings;

  function Streams "Test functions of Modelica.Utilities.Streams"
    extends Modelica.Icons.Function;
    import Modelica.Utilities.Streams;
    import Modelica.Utilities.Files;
    input String logFile="ModelicaTestLog.txt"
      "Filename where the log is stored";
    output Boolean ok;
  protected
    String file1="#testStreams1.txt";
    String file2="#testStreams2.txt";
    String line1="this is line 1";
    String line2="this is line 2";
    String line3="this is line 3";
    String line4="this is line 4";
    String line5="this is line 5";
    String lines[3];
    String rline;
    Integer nLines;
    Boolean eof;
  algorithm
    Streams.print("... Test of Modelica.Utilities.Streams");
    Streams.print("... Test of Modelica.Utilities.Streams", logFile);

    Files.remove(file1);
    Streams.print(line1, file1);
    Streams.print(line2, file1);
    Streams.print(line3, file1);
    Streams.close(file1);

    Files.remove(file2);
    Streams.print(line4, file2);
    Streams.print(line5, file2);
    Streams.close(file2);

    lines := Streams.readFile(file1);
    assert(lines[1] == line1 and lines[2] == line2 and lines[3] == line3,
      "Streams.readFile failed");

    nLines := Streams.countLines(file1);
    assert(nLines == 3, "Streams.countLines failed");

    (rline,eof) := Streams.readLine(file1, 1);
    assert(rline == line1 and not eof, "Streams.readLine 1 failed");

    (rline,eof) := Streams.readLine(file2, 1);
    assert(rline == line4 and not eof, "Streams.readLine 1 failed");

    (rline,eof) := Streams.readLine(file1, 2);
    assert(rline == line2 and not eof, "Streams.readLine 2 failed");

    (rline,eof) := Streams.readLine(file2, 2);
    assert(rline == line5 and not eof, "Streams.readLine 2 failed");

    (rline,eof) := Streams.readLine(file1, 3);
    assert(rline == line3 and not eof, "Streams.readLine 3 failed");

    (rline,eof) := Streams.readLine(file2, 3);
    assert(rline == "" and eof, "Streams.readLine 3 failed");

    (rline,eof) := Streams.readLine(file1, 4);
    assert(rline == "" and eof, "Streams.readLine 4 failed");

    Files.remove(file1);
    Files.remove(file2);

    ok := true;
  end Streams;

  function Internal "Test functions of Modelica.Utilities.Internal"
    extends Modelica.Icons.Function;
    import Modelica.Utilities.Internal.FileSystem;
    // We must extend to make internal functions available.
    import Modelica.Utilities.System;
    import Modelica.Utilities.Types;
    import Modelica.Utilities.Streams;

    input String logFile="ModelicaTestLog.txt"
      "Filename where the log is stored";
    output Boolean ok;
  protected
    String dir1;
    String dir2;
    String dir3;
    String dir4;
    String env;
    Boolean exist;
    Modelica.Utilities.Types.FileType fileType;
  algorithm
    Streams.print("... Test of Modelica.Utilities.Internal.FileSystem and .System");
    Streams.print("... Test of Modelica.Utilities.Internal.FileSystem and .System", logFile);

    // Check Modelica.Utilites.Internal and Modelica.Utilities.System
    dir1 := System.getWorkDirectory();
    dir2 := dir1 + "/#ModelicaTest";
    fileType := FileSystem.stat(dir2);
    if fileType > Types.FileType.NoFile then
      FileSystem.rmdir(dir2);
    end if;
    FileSystem.mkdir(dir2);
    fileType := FileSystem.stat(dir2);
    assert(fileType == Types.FileType.Directory, "FileSystem.mkdir/stat failed");

    System.setWorkDirectory(dir2);

    dir3 := System.getWorkDirectory();
    assert(dir2 == dir3, "System.xxxWorkDirectory failed\n" + "set dir = " +
      dir1 + "\n" + "get dir = " + dir3 + "\n");
    System.setWorkDirectory("..");

    dir4 := dir1 + "/#ModelicaTest2";
    FileSystem.rename(dir2, dir4);
    FileSystem.rmdir(dir4);

    System.setEnvironmentVariable(
        "#ModelicaTest",
        "/dir1/dir2/dir3",
        convertFromSlash=true);
    (env,exist) := System.getEnvironmentVariable("#ModelicaTest",
      convertToSlash=true);
    assert(exist, "System.getEnvironmentVariable 1 failed");
    assert(env == "/dir1/dir2/dir3", "System.getEnvironmentVariable 2 failed\n"
       + "env = " + env);
    ok := true;
  end Internal;

  function Files "Test functions of Modelica.Utilities.Files"
    extends Modelica.Icons.Function;
    import Modelica.Utilities.Files;
    import Modelica.Utilities.Streams;

    input String logFile="ModelicaTestLog.txt"
      "Filename where the log is stored";
    output Boolean ok;
  protected
    String directory;
    String name;
    String extension;
  algorithm
    Streams.print("... Test of Modelica.Utilities.Files");
    Streams.print("... Test of Modelica.Utilities.Files", logFile);

    (directory,name,extension) := Files.splitPathName("E:/test1/test2.save.txt");
    assert(directory == "E:/test1/" and name == "test2.save" and extension ==
      ".txt", "Files.splitPathName 1 failed");

    (directory,name,extension) := Files.splitPathName("E:/test1/test2");
    assert(directory == "E:/test1/" and name == "test2" and extension == "",
      "Files.splitPathName 2 failed");

    ok := true;
  end Files;

  function testAll "Test functions of Modelica.Utilities"
    extends Modelica.Icons.Function;
    input String logFile="ModelicaTestLog.txt"
      "Filename where the log is stored";
    output Boolean ok;
  protected
    Boolean result;
  algorithm
    result := Strings(logFile);
    result := Streams(logFile);
    result := Files(logFile);
    result := Internal(logFile);
    ok := true;
  end testAll;
end Utilities;
