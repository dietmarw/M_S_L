within ;
encapsulated package Modelica_ComplexBlocks_Examples
  "Library of examples to demonstrate the usage of package Blocks"
  import Modelica_Icons;
  import Modelica_Blocks;
  import Modelica_Constants;
  import Modelica_ComplexBlocks;
  extends Modelica_Icons.ExamplesPackage;

  model TestConversionBlock "Test the conversion blocks"
    extends Modelica_Icons.Example;
    Modelica_Blocks.Sources.Ramp len(duration=1, offset=1E-6) annotation (
        Placement(transformation(extent={{-80,10},{-60,30}}, rotation=0)));
    Modelica_Blocks.Sources.Ramp phi(height=4*Modelica_Constants.pi, duration=1)
      annotation (Placement(transformation(extent={{-80,-30},{-60,-10}}, rotation=
             0)));
    Modelica_ComplexBlocks.ComplexMath.PolarToComplex polarToComplex
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}},
            rotation=0)));
    Modelica_ComplexBlocks.ComplexMath.ComplexToReal complexToReal
      annotation (Placement(transformation(extent={{0,-10},{20,10}}, rotation=
             0)));
  equation
    connect(phi.y, polarToComplex.phi) annotation (Line(points={{-59,-20},{-50,
            -20},{-50,-6},{-46,-6},{-42,-6}},
                                    color={0,0,127}));
    connect(len.y, polarToComplex.len) annotation (Line(
        points={{-59,20},{-50,20},{-50,6},{-42,6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(polarToComplex.y, complexToReal.u) annotation (Line(
        points={{-19,0},{-2,0}},
        color={85,170,255},
        smooth=Smooth.None));
    annotation ( Documentation(info="<html>
<p>A Complex signal is defined by its length and angle, both linearly rising with time.
Plotting the imaginary part versus the real part, you will see an Archimedean spiral.</p>
</html>"),
      experiment(StopTime=1.01, Interval=0.001));
  end TestConversionBlock;
  annotation(Documentation(info="<html>
<p>This library demonstrates the usage of Complex blocks.</p>
</html>"),
             uses(Modelica_ComplexBlocks(version="3.2.2"),
                  Modelica_Constants(version="3.2.2"),
                  Modelica_Blocks(version="3.2.2"),
                  Modelica_Icons(version="3.2.2")),
             version="3.2.2");
end Modelica_ComplexBlocks_Examples;
