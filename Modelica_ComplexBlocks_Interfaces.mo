within ;
encapsulated package Modelica_ComplexBlocks_Interfaces
  "Library of connectors and partial models for input/output blocks"
  import Modelica_Icons;
  import Complex;
  import Modelica_Blocks;
  import Modelica_ComplexMath;
  import Modelica_SIunits;
  extends Modelica_Icons.InterfacesPackage;

connector ComplexInput = input Complex "'input Complex' as connector"
  annotation (defaultComponentName="u",
  Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2),
        graphics={Polygon(
          points={{-100,100},{100,0},{-100,-100},{-100,100}},
          lineColor={85,170,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
  Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}}), graphics={Polygon(
          points={{0,50},{100,0},{0,-50},{0,50}},
          lineColor={85,170,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-10,85},{-10,60}},
          lineColor={0,0,127},
          textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one input signal of type Complex.
</p>
</html>"));

connector ComplexOutput = output Complex "'output Complex' as connector"
  annotation (defaultComponentName="y",
  Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}),
        graphics={Polygon(
          points={{-100,100},{100,0},{-100,-100},{-100,100}},
          lineColor={85,170,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
  Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={Polygon(
          points={{-100,50},{0,0},{-100,-50},{-100,50}},
          lineColor={85,170,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{30,110},{30,60}},
          lineColor={0,0,127},
          textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one output signal of type Complex.
</p>
</html>"));

    partial block ComplexSO "Single Output continuous control block"
      extends Modelica_Blocks.Icons.Block;
      ComplexOutput y "Connector of Complex output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      annotation (Documentation(info="<html>
<p>
Block has one continuous Complex output signal.
</p>
</html>"));
    end ComplexSO;

    partial block ComplexMO "Multiple Output continuous control block"
      extends Modelica_Blocks.Icons.Block;
      parameter Integer nout(min=1) = 1 "Number of outputs";
      ComplexOutput y[nout] "Connector of Complex output signals"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      annotation (Documentation(info="<html>
<p>
Block has one continuous Complex output signal vector.
</p>
</html>"));
    end ComplexMO;

    partial block ComplexSISO
    "Single Input Single Output continuous control block"
      extends Modelica_Blocks.Icons.Block;
      ComplexInput u "Connector of Complex input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      ComplexOutput y "Connector of Complex output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      parameter Boolean useConjugateInput = false
      "If true, input is processed conjugate complex";
  protected
      ComplexInput uInternal = (if useConjugateInput then Modelica_ComplexMath.conj(u) else u)
      "Equals either u or conjugate complex input u if useComplexInput = true";
      annotation (Documentation(info="<html>
<p>
Block has one continuous Complex input and one continuous Complex output signal.
</p>
</html>"));
    end ComplexSISO;

    partial block ComplexSI2SO
    "2 Single Input / 1 Single Output continuous control block"
      extends Modelica_Blocks.Icons.Block;
      ComplexInput u1 "Connector of Complex input signal 1"
        annotation (Placement(transformation(extent={{-140,40},{-100,80}}, rotation=0)));
      ComplexInput u2 "Connector of Complex input signal 2"
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
      ComplexOutput y "Connector of Complex output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      parameter Boolean useConjugateInput1 = false
      "If true, input 1 is processed conjugate complex";
      parameter Boolean useConjugateInput2 = false
      "If true, input 2 is processed conjugate complex";
  protected
      ComplexInput u1Internal = (if useConjugateInput1 then Modelica_ComplexMath.conj(u1) else u2)
      "Equals either u1 or conjugate complex input u1 if useComplexInput1 = true";
      ComplexInput u2Internal = (if useConjugateInput2 then Modelica_ComplexMath.conj(u2) else u2)
      "Equals either u2 or conjugate complex input u2 if useComplexInput2 = true";
      annotation (Documentation(info="<html>
<p>
Block has two continuous Complex input signals u1 and u2 and one
continuous Complex output signal y.
</p>
</html>"));
    end ComplexSI2SO;

    partial block ComplexSIMO
    "Single Input Multiple Output continuous control block"
      extends Modelica_Blocks.Icons.Block;
      parameter Integer nout=1 "Number of outputs";

      ComplexInput u "Connector of Complex input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      ComplexOutput y[nout] "Connector of Complex output signals"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));

      parameter Boolean useConjugateInput = false
      "If true, input is processed conjugate complex";
  protected
      ComplexInput uInternal = (if useConjugateInput then Modelica_ComplexMath.conj(u) else u)
      "Equals either u or conjugate complex input u if useComplexInput = true";

      annotation (Documentation(info="<html>
<p>
 Block has one continuous Complex input signal and a
vector of continuous Complex output signals.
</p>
</html>"));
    end ComplexSIMO;

    partial block ComplexMISO
    "Multiple Input Single Output continuous control block"
      extends Modelica_Blocks.Icons.Block;
      parameter Integer nin=1 "Number of inputs";
      ComplexInput u[nin] "Connector of Complex input signals"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      ComplexOutput y "Connector of Complex output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));

      parameter Boolean useConjugateInput[nin] = fill(false,nin)
      "If true, inputs are processed conjugate complex";
  protected
      ComplexInput uInternal[nin]=
        {if useConjugateInput[k] then Modelica_ComplexMath.conj(u[k]) else u[k] for k in 1:nin}
      "Equals either u or conjugate complex input u if useComplexInput = true";

      annotation (Documentation(info="<html>
<p>
Block has a vector of continuous Complex input signals and
one continuous Complex output signal.
</p>
</html>"));
    end ComplexMISO;

    partial block ComplexMIMO
    "Multiple Input Multiple Output continuous control block"
      extends Modelica_Blocks.Icons.Block;
      parameter Integer nin=1 "Number of inputs";
      parameter Integer nout=1 "Number of outputs";
      ComplexInput u[nin] "Connector of Complex input signals"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      ComplexOutput y[nout] "Connector of Complex output signals"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      parameter Boolean useConjugateInput[nin] = fill(false,nin)
      "If true, inputs are processed conjugate complex";
  protected
      ComplexInput uInternal[nin]=
        {if useConjugateInput[k] then Modelica_ComplexMath.conj(u[k]) else u[k] for k in 1:nin}
      "Equals either u or conjugate complex input u if useComplexInput = true";

      annotation (Documentation(info="<html>
<p>
Block has a continuous Complex input vector and a continuous Complex output signal vector.
The signal sizes of the input and output vector may be different.
</p>
</html>"));
    end ComplexMIMO;

    partial block ComplexMIMOs
    "Multiple Input Multiple Output continuous control block with same number of inputs and outputs"
      extends Modelica_Blocks.Icons.Block;
      parameter Integer n=1 "Number of inputs (= number of outputs)";
      ComplexInput u[n] "Connector of Complex input signals"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      ComplexOutput y[n] "Connector of Complex output signals"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));

      parameter Boolean useConjugateInput[n] = fill(false,n)
      "If true, inputs are processed conjugate complex";
  protected
      ComplexInput uInternal[n]=
        {if useConjugateInput[k] then Modelica_ComplexMath.conj(u[k]) else u[k] for k in 1:n}
      "Equals either u or conjugate complex input u if useComplexInput = true";

      annotation (Documentation(info="<html>
<p>
Block has a continuous Complex input vector and a continuous Complex output signal vector
where the signal sizes of the input and output vector are identical.
</p>
</html>"));
    end ComplexMIMOs;

    partial block ComplexMI2MO
    "2 Multiple Input / Multiple Output continuous control block"
      extends Modelica_Blocks.Icons.Block;
      parameter Integer n=1 "Dimension of input and output vectors.";
      ComplexInput u1[n] "Connector 1 of Complex input signals"
        annotation (Placement(transformation(extent={{-140,40},{-100,80}}, rotation=0)));
      ComplexInput u2[n] "Connector 2 of Complex input signals"
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
      ComplexOutput y[n] "Connector of Complex output signals"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));

      parameter Boolean useConjugateInput1[n] = fill(false,n)
      "If true, inputs 1 are processed conjugate complex";
      parameter Boolean useConjugateInput2[n] = fill(false,n)
      "If true, inputs 2 are processed conjugate complex";
  protected
      ComplexInput u1Internal[n]=
        {if useConjugateInput1[k] then Modelica_ComplexMath.conj(u1[k]) else u1[k] for k in 1:n}
      "Equals either u1 or conjugate complex input u1 if useComplexInput = true";
      ComplexInput u2Internal[n]=
        {if useConjugateInput2[k] then Modelica_ComplexMath.conj(u2[k]) else u2[k] for k in 1:n}
      "Equals either u1 or conjugate complex input u1 if useComplexInput = true";

      annotation (Documentation(info="<html>
<p>
Block has two continuous Complex input vectors u1 and u2 and one
continuous Complex output vector y.
All vectors have the same number of elements.
</p>
</html>"));
    end ComplexMI2MO;

    partial block ComplexSignalSource "Base class for continuous signal source"
      extends ComplexSO;
      parameter Complex offset=Complex(0) "Offset of output signal y";
    parameter Modelica_SIunits.Time startTime=0
      "Output y = offset for time < startTime";
    annotation (Documentation(info="<html>
<p>
Basic block for Complex sources.
This component has one continuous Complex output signal y
and two parameters (offset, startTime) to shift the
generated signal.
</p>
</html>"));
    end ComplexSignalSource;
annotation(Documentation(info="<html>
<p>This library defines Complex input and output signals, as well as partial blocks.</p>
</html>"),
           uses(Modelica_ComplexMath(version="3.2.2"),
                Modelica_Blocks(version="3.2.2"),
                Modelica_Icons(version="3.2.2"),
                Complex(version="3.2.2"),
                Modelica_SIunits(version="3.2.2")),
           version="3.2.2");
end Modelica_ComplexBlocks_Interfaces;
