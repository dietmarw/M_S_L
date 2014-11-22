within ;
encapsulated package Modelica_Electrical_QuasiStationary_SinglePhase_Interfaces
  "Interfaces for AC singlephase models"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Electrical_QuasiStationary;
  import Modelica_ComplexMath;
  import Complex;
  import Modelica_ComplexBlocks_Interfaces;
  extends Modelica_Icons.InterfacesPackage;

  connector Pin "Basic connector"
    Modelica_SIunits.ComplexVoltage v "Complex potential at the node";
    flow Modelica_SIunits.ComplexCurrent i
      "Complex current flowing into the pin";
    annotation (Documentation(info="<html>
<p>
The potential of this connector is the complex voltage and the flow variable is the complex current.
The <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive</a> and
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">negative pin</a> are
derived from this base connector.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>

</html>"));
  end Pin;

  connector PositivePin "Positive connector"
    extends Pin;
    Modelica_Electrical_QuasiStationary.Types.Reference reference "Reference";
    annotation (
      Diagram(graphics={Text(
            extent={{-100,100},{100,60}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="%name"), Rectangle(
            extent={{-40,40},{40,-40}},
            lineColor={85,170,255},
            fillColor={85,170,255},
            fillPattern=FillPattern.Solid)}),
      Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={85,170,255},
            fillColor={85,170,255},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>

<p>
The positive pin is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angular velocity of the quasi stationary voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">negative pin</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>
</html>"));
  end PositivePin;

  connector NegativePin "Negative Connector"
    extends Pin;
    Modelica_Electrical_QuasiStationary.Types.Reference reference "Reference";
    annotation (
      Diagram(graphics={Text(
            extent={{-100,100},{100,60}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="%name"), Rectangle(
            extent={{-40,40},{40,-40}},
            lineColor={85,170,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={85,170,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>

<p>
The negative pin is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angular velocity of the quasi stationary voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive pin</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>
</html>"));
  end NegativePin;

  partial model TwoPin "Two pins"
    import Modelica_Constants.eps;
    Modelica_SIunits.ComplexVoltage v "Complex voltage";
    Modelica_SIunits.Voltage abs_v = Modelica_ComplexMath.'abs'(v)
      "Magnitude of complex voltage";
    Modelica_SIunits.Angle arg_v = Modelica_ComplexMath.arg(v)
      "Argument of complex voltage";
    Modelica_SIunits.ComplexCurrent i "Complex current";
    Modelica_SIunits.Current abs_i = Modelica_ComplexMath.'abs'(i)
      "Magnitude of complex current";
    Modelica_SIunits.Angle arg_i = Modelica_ComplexMath.arg(i)
      "Argument of complex current";
    Modelica_SIunits.ActivePower P = Modelica_ComplexMath.real(v*Modelica_ComplexMath.conj(i))
      "Active power";
    Modelica_SIunits.ReactivePower Q = Modelica_ComplexMath.imag(v*Modelica_ComplexMath.conj(i))
      "Reactive power";
    Modelica_SIunits.ApparentPower S = Modelica_ComplexMath.'abs'(v*Modelica_ComplexMath.conj(i))
      "Magnitude of complex apparent power";
    Real pf = cos(Modelica_ComplexMath.arg(Complex(P,Q))) "Power factor";
    Modelica_SIunits.AngularVelocity omega
      "Angular velocity of reference frame";

    PositivePin pin_p "Positive pin" annotation (Placement(transformation(
            extent={{-110,-10},{-90,10}}, rotation=0)));
    NegativePin pin_n "Negative pin" annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
  equation
    Connections.branch(pin_p.reference, pin_n.reference);
    pin_p.reference.gamma = pin_n.reference.gamma;
    omega = der(pin_p.reference.gamma);
    v = pin_p.v - pin_n.v;
    i = pin_p.i;
    annotation (Documentation(info="<html>
<p>
This partial model uses a <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive</a>
and <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">negative pin</a> and defines the complex voltage difference as well as the complex current (into the positive pin). Additionally, the angular velocity of the quasi stationary system is explicitly defined as variable. This model is mainly intended to be used with graphical representation of user models.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.OnePort\">OnePort</a>
</p>
</html>"));
  end TwoPin;

  partial model OnePort "Two pins, current through"
    extends TwoPin;
  equation
    pin_p.i + pin_n.i = Complex(0);
    annotation (Documentation(info="<html>
<p>
This partial model is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.TwoPin\">TwoPin</a> and
additionally considers the complex current balance of the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive</a> and the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">negative pin</a>.
This model is intended to be used with textual representation of user models.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.TwoPin\">TwoPin</a>
</p>
</html>"));
  end OnePort;

  partial model AbsoluteSensor "Partial potential sensor"
    extends Modelica_Icons.RotationalSensor;
    Modelica_SIunits.AngularVelocity omega;
    PositivePin pin "Pin" annotation (Placement(transformation(extent={{-110,
              -10},{-90,10}}, rotation=0)));
  equation
    omega = der(pin.reference.gamma);
    pin.i = Complex(0);
    annotation (Icon(graphics={
          Line(points={{-70,0},{-94,0}}, color={0,0,0}),
          Text(
            extent={{-100,100},{100,70}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={170,85,255},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Line(points={{100,0},{70,0}}, color={0,0,0})}), Documentation(info="<html>
<p>
The absolute sensor partial model provides a single
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive pin</a> to measure the complex voltage. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.RelativeSensor\">RelativeSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.AbsoluteSensor\">MultiPhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.RelativeSensor\">MultiPhase.Interfaces.RelativeSensor</a>
</p>

</html>"));
  end AbsoluteSensor;

  partial model RelativeSensor "Partial voltage / current sensor"
    extends Modelica_Icons.RotationalSensor;
    extends OnePort;
    Modelica_ComplexBlocks_Interfaces.ComplexOutput y annotation (Placement(
          transformation(
          origin={0,-110},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    annotation (Icon(graphics={
          Line(points={{-70,0},{-94,0}}, color={0,0,0}),
          Line(points={{70,0},{94,0}}, color={0,0,0}),
          Text(
            extent={{-100,100},{100,70}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={170,85,255},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Line(points={{0,-70},{0,-80},{0,-90},{0,-100}}, color={85,170,255})}),
        Documentation(info="<html>
<p>
The relative sensor partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.OnePort\">OnePort</a> to measure the complex voltage, current or power. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.AbsoluteSensor\">AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor\">CurrentSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">PowerSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.AbsoluteSensor\">MultiPhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.RelativeSensor\">MultiPhase.Interfaces.RelativeSensor</a>
</p>

</html>"));
  end RelativeSensor;

  partial model Source "Partial voltage / current source"
    extends OnePort;
    Modelica_SIunits.Angle gamma(start=0) = pin_p.reference.gamma;
  equation
    Connections.root(pin_p.reference);
    annotation (Icon(graphics={
          Ellipse(
            extent={{-50,50},{50,-50}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{100,-100},{-100,-60}},
            textString="%name",
            lineColor={0,0,255}),
          Line(points={{-90,0},{-50,0}}, color={0,0,0}),
          Line(points={{50,0},{90,0}}, color={0,0,0})}), Documentation(info="<html>
<p>
The source partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.OnePort\">OnePort</a> and contains a proper icon.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Source\">MultiPhase.Interfaces.Source</a>.
</p>
</html>"));
  end Source;
  annotation (Documentation(info="<html>
<p>This package contains connector specifications and partial models for more complex components.</p>
</html>"), uses(Complex(version="3.2.2"), Modelica(version="3.2.1")));
end Modelica_Electrical_QuasiStationary_SinglePhase_Interfaces;
