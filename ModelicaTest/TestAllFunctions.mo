within ModelicaTest;
model TestAllFunctions
   extends Modelica.Icons.Example;
   import Modelica.Utilities.Streams.print;
   constant String logFile = "ModelicaTestLog.txt"
    "Filename where the log of all functions is stored";
  Boolean result;
algorithm
  when initial() then
    print("--- Test functions of Modelica library");
    print("--- Test functions of Modelica library", logFile);
    Modelica.Math.Nonlinear.Examples.quadratureLobatto1();
    Modelica.Math.Nonlinear.Examples.quadratureLobatto2();
    Modelica.Math.Nonlinear.Examples.solveNonlinearEquations1();
    Modelica.Math.Nonlinear.Examples.solveNonlinearEquations2();

    print("--- Test functions of ModelicaTest library");
    print("--- Test functions of ModelicaTest library", logFile);
    result := Math.ScalarFunctions(logFile);
    result := Math.BooleanFunctions(logFile);
    result := Math.Polynomials(logFile);
    result := Math.Matrices(logFile);
    result := Math.Matrices2(logFile);
    //result :=ModelicaTest.Math.Matrices3(logFile);
    //result :=ModelicaTest.Math.Vectors();
    //result := ModelicaTest.Utilities.Strings(logFile);
    result := Utilities.Streams(logFile);
    result := Utilities.Files(logFile);
    result := Utilities.Internal(logFile);
    result := ComplexMath.ComplexFunctions(logFile);
    result := ComplexMath.ComplexOperations();
  end when;

  annotation (experiment(StopTime=0.1));
end TestAllFunctions;
