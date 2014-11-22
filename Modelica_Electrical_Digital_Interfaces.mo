within ;
encapsulated package Modelica_Electrical_Digital_Interfaces "Basic definitions"
  import Modelica_Icons;
  extends Modelica_Icons.InterfacesPackage;

  type Logic = enumeration(
      'U' "U  Uninitialized",
      'X' "X  Forcing Unknown",
      '0' "0  Forcing 0",
      '1' "1  Forcing 1",
      'Z' "Z  High Impedance",
      'W' "W  Weak Unknown",
      'L' "L  Weak 0",
      'H' "H  Weak 1",
      '-' "-  Do not care")
    "Logic values and their coding according to IEEE 1164 STD_ULOGIC type"
        annotation (Documentation(info="<html>
<p><b>Code Table:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Logic value</b></td>
      <td valign=\"top\"><b>Meaning</b></td>
  </tr>

  <tr><td valign=\"top\">'U'</td> <td valign=\"top\">Uninitialized</td></tr>
  <tr><td valign=\"top\">'X'</td> <td valign=\"top\">Forcing Unknown</td></tr>
  <tr><td valign=\"top\">'0'</td> <td valign=\"top\">Forcing 0</td></tr>
  <tr><td valign=\"top\">'1'</td> <td valign=\"top\">Forcing 1</td></tr>
  <tr><td valign=\"top\">'Z'</td> <td valign=\"top\">High Impedance</td></tr>
  <tr><td valign=\"top\">'W'</td> <td valign=\"top\">Weak Unknown</td></tr>
  <tr><td valign=\"top\">'L'</td> <td valign=\"top\">Weak 0</td></tr>
  <tr><td valign=\"top\">'H'</td> <td valign=\"top\">Weak 1</td></tr>
  <tr><td valign=\"top\">'-'</td> <td valign=\"top\">Do not care</td></tr>
</table>

</html>"));

  type UX01 = enumeration(
      'U' "U  Uninitialized",
      'X' "X  Forcing Unknown",
      '0' "0  Forcing 0",
      '1' "1  Forcing 1") "4-valued subtype of IEEE 1164 STD_ULOGIC type"
    annotation (Documentation(info="<html>
<p><b>Code Table:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Logic value</b></td>
      <td valign=\"top\"><b>Meaning</b></td>
  </tr>

  <tr><td valign=\"top\">'U'</td> <td valign=\"top\">Uninitialized</td></tr>
  <tr><td valign=\"top\">'X'</td> <td valign=\"top\">Forcing Unknown</td></tr>
  <tr><td valign=\"top\">'0'</td> <td valign=\"top\">Forcing 0</td></tr>
  <tr><td valign=\"top\">'1'</td> <td valign=\"top\">Forcing 1</td></tr>

</table>
</html>"));
  type Strength = enumeration(
      'S_X01',
      'S_X0H',
      'S_XL1',
      'S_X0Z',
      'S_XZ1',
      'S_WLH',
      'S_WLZ',
      'S_WZH',
      'S_W0H',
      'S_WL1') "Output strengths of registers" annotation (Documentation(info="<html>

<p><b>Strength Table:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Strength</b></td>
      <td valign=\"top\"><b>Output conversion to</b></td>
  </tr>

  <tr><td valign=\"top\">'S_X01'</td> <td valign=\"top\">Forcing X, 0, 1</td></tr>
  <tr><td valign=\"top\">'S_X0H'</td> <td valign=\"top\">Forcing X, 0 and Weak 1</td></tr>
  <tr><td valign=\"top\">'S_XL1'</td> <td valign=\"top\">Forcing X, 1 and Weak 0</td></tr>
  <tr><td valign=\"top\">'S_X0Z'</td> <td valign=\"top\">Forcing X, 0 and High Impedance</td></tr>
  <tr><td valign=\"top\">'S_XZ1'</td> <td valign=\"top\">Forcing X, 1 and High Impedance</td></tr>
  <tr><td valign=\"top\">'S_WLH'</td> <td valign=\"top\">Weak X, 0, 1</td></tr>
  <tr><td valign=\"top\">'S_WLZ'</td> <td valign=\"top\">Weak X, 0 and High Impedance</td></tr>
  <tr><td valign=\"top\">'S_WZH'</td> <td valign=\"top\">Weak X, 1 and High Impedance</td></tr>
  <tr><td valign=\"top\">'S_W0H'</td> <td valign=\"top\">Weak X, 1 and Forcing 0</td></tr>
  <tr><td valign=\"top\">'S_WL1'</td> <td valign=\"top\">Weak X, 0 and Forcing 1</td></tr>
</table>
</html>"));

  connector DigitalSignal = Logic "Digital port (both input/output possible)"
    annotation (          Documentation(info="<html>
<p>DigitalSignal is the basic digital connector definition. A direction (input, output) is not yet defined. DigitalSignal is of type Logic. It can have the logic values (U, X, 0, 1, ...) which are internally coded by integer values by using the enumeration (c.f. the definition of type Logic).</p>
</html>"));

  connector DigitalInput = input DigitalSignal
    "Input DigitalSignal as connector"
    annotation (defaultComponentName="x",
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
        {100,100}}), graphics={Rectangle(
      extent={{-100,-100},{100,100}},
      lineColor={127,0,127},
      fillColor={127,0,127},
      fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
        -100},{100,100}}), graphics={Text(
      extent={{-150,-100},{150,-160}},
      lineColor={127,0,127},
      textString="%name"), Rectangle(
      extent={{-100,-100},{100,100}},
      lineColor={127,0,127},
      fillColor={127,0,127},
      fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>DigitalInput is the  digital input connector definition. DigitalInput is of type Logic. It can have the logic values (U, X, 0, 1, ...) which are internally coded by integer values by using the enumeration (c.f. the definition of type Logic).</p>
</html>"));

  connector DigitalOutput = output DigitalSignal
    "Output DigitalSignal as connector"
    annotation (defaultComponentName="y", Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
    graphics={Polygon(
      points={{-100,100},{100,0},{-100,-100},{-100,100}},
      lineColor={127,0,127},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid)}),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
    graphics={Polygon(
      points={{-100,100},{100,0},{-100,-100},{-100,100}},
      lineColor={127,0,127},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid), Text(
      extent={{-150,-100},{150,-160}},
      lineColor={127,0,127},
      textString="%name")}),
    Documentation(info=
                   "<html>
<p>DigitalOutput is the  digital output connector definition. DigitalOutput  is of type Logic. It can have the logic values (U, X, 0, 1, ...) which are internally coded by integer values by using the enumeration (c.f. the definition of type Logic). The arrow shape symbolizes the signal flow direction.</p>
</html>"));

  partial block SISO "Single input, single output"
    DigitalInput x "Connector of Digital input signal" annotation (Placement(
          transformation(extent={{-70,-10},{-50,10}}, rotation=0)));
    DigitalOutput y "Connector of Digital output signal" annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));
    annotation (                                        Icon(
          coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
          {100,100}}), graphics={Rectangle(
        extent={{-50,100},{50,-100}},
        lineColor={0,0,0},
        lineThickness=0.5,
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Line(points={{50,0},{92,0}},
          color={127,0,127})}),
      Documentation(info="<html>
<p>SISO is a partial model for the connection pattern with <b>s</b>ingle (scalar) digital <b>i</b>nput and <b>s</b>ingle (scalar) digital <b>o</b>utput. Besides the connectors it provides a rectangle for the icon which can be filled in by the component which inherits the SISO model.</p>
</html>"));
  end SISO;

  partial block MISO "Multiple input - single output"
    parameter Integer n(final min=2) = 2 "Number of inputs";
    DigitalInput x[n] "Connector of Digital input signal vector" annotation (
        Placement(transformation(extent={{-70,-80},{-50,80}}, rotation=0)));
    DigitalOutput y "Connector of Digital output signal" annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
          -100},{100,100}}), graphics={Rectangle(
        extent={{-50,100},{50,-100}},
        lineColor={0,0,0},
        lineThickness=0.5,
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Line(points={{50,0},{90,0}},
          color={127,0,127})}),
      Documentation(info="<html>
<p>MISO is a partial model for the connection pattern with <b>m</b>ultiple (vector) digital <b>i</b>nput and <b>s</b>ingle (scalar) digital <b>o</b>utput. Besides the connectors it provides a rectangle for the icon which can be filled in by the component which inherits the MISO model.</p>
</html>"));
  end MISO;

  partial block MIMO "Multiple input - multiple output"

    parameter Integer n(final min=1) = 1 "Number of inputs = Number of outputs";
    DigitalInput x[n] "Connector of Digital input signal vector" annotation (
        Placement(transformation(extent={{-70,-80},{-50,80}}, rotation=0)));
    DigitalOutput y[n] "Connector of Digital output signal vector" annotation (
        Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
          -100},{100,100}}), graphics={
      Rectangle(
        extent={{-50,100},{50,-100}},
        lineColor={0,0,0},
        lineThickness=0.5,
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Line(points={{50,0},{90,0}}, color={127,0,127}),
      Rectangle(
        extent={{50,80},{70,-80}},
        lineColor={127,33,107},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>MIMO is a partial model for the connection pattern with <b>m</b>ultiple (vector) digital <b>i</b>nput and <b>m</b>ultiple  (vector) digital <b>o</b>utput. Besides the connectors it provides a rectangle for the icon which can be filled in by the component which inherits the MISO model.</p>
</html>"));
  end MIMO;

  annotation (                                Documentation(info="<html>
<p>This package contains basic definitions: Type definitions of Logic and Strength,  interface definitions (connectors) for digital electrical components, and partial models for connection patterns which are often used.</p>
</html>"),
              uses(Modelica_Icons(version="3.2.2")),
              version="3.2.2");
end Modelica_Electrical_Digital_Interfaces;
