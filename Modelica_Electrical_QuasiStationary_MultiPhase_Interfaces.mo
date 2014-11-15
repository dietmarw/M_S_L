within ;
package Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces
  "Interfaces for AC multiphase models"
  extends Modelica_Icons.InterfacesPackage;

  connector Plug "Basic multiphase plug"
    parameter Integer m=3 "number of phases";
    Modelica_Electrical_QuasiStationary_SinglePhase_Interfaces.Pin pin[m];
    annotation (Documentation(info="<html>

<p>
This multiphase plug contains a vector of <i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">single phase pins</a>.
The <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">positive</a> and
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">negative plug</a> are
derived from this base connector.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>
</html>"));
  end Plug;

  connector PositivePlug "Positive multiphase connector"
    extends Plug;
    Modelica_Electrical_QuasiStationary.Types.Reference reference;
    annotation (
      Icon(graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={85,170,255},
            fillColor={85,170,255},
            fillPattern=FillPattern.Solid)}),
      Diagram(graphics={Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={85,170,255},
            fillColor={85,170,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-100,100},{100,60}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      Documentation(info="<html>

<p>
The positive plug is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angular velocity of each quasi stationary voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">negative plug</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>
</html>"));
  end PositivePlug;

  connector NegativePlug "Negative multiphase connector"
    extends Plug;
    Modelica_Electrical_QuasiStationary.Types.Reference reference;
    annotation (
      Icon(graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={85,170,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Diagram(graphics={Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={85,170,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-100,100},{100,60}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      Documentation(info="<html>

<p>
The negative plug is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angular velocity of each quasi stationary voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">positive plug</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
</p>
</html>"));
  end NegativePlug;

  partial model TwoPlug "Two plugs with pin-adapter"
    parameter Integer m(min=1) = 3 "Number of phases";
    Modelica_SIunits.ComplexVoltage v[m] "Complex voltage";
    Modelica_SIunits.Voltage abs_v[m] = Modelica_ComplexMath.'abs'(v)
      "Magnitude of complex voltage";
    Modelica_SIunits.Angle arg_v[m] = Modelica_ComplexMath.arg(v)
      "Argument of complex voltage";
    Modelica_SIunits.ComplexCurrent i[m] "Complex current";
    Modelica_SIunits.Current abs_i[m] = Modelica_ComplexMath.'abs'(i)
      "Magnitude of complex current";
    Modelica_SIunits.Angle arg_i[m] = Modelica_ComplexMath.arg(i)
      "Argument of complex current";
    Modelica_SIunits.ActivePower P[m] = {Modelica_ComplexMath.real(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
      "Active power";
    Modelica_SIunits.ActivePower P_total = sum(P) "Total active power";
    Modelica_SIunits.ReactivePower Q[m] = {Modelica_ComplexMath.imag(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
      "Reactive power";
    Modelica_SIunits.ReactivePower Q_total = sum(Q) "Total reactive power";
    Modelica_SIunits.ApparentPower S[m] = {Modelica_ComplexMath.'abs'(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
      "Magnitude of complex apparent power";
    Modelica_SIunits.ApparentPower S_total=sqrt(P_total^2+Q_total^2)
      "Magntiude of total complex apparent power";
    Real pf[m] = {cos(Modelica_ComplexMath.arg(Complex(P[k],Q[k]))) for k in 1:m}
      "Power factor";
    /*
  Real pf_total = cos(Modelica.ComplexMath.arg(Complex(P_total,Q_total)))
   "Total power factor";
  */
    Modelica_SIunits.AngularVelocity omega
      "Angular velocity of reference frame";

    PositivePlug plug_p(final m=m) "Positive quasi stationary multi phase plug"
                                                   annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    NegativePlug plug_n(final m=m) "Negative quasi stationary multi phase plug"
                                                   annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_p plugToPins_p(final m=m)
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
            rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_n plugToPins_n(final m=m)
      annotation (Placement(transformation(
          origin={70,0},
          extent={{-10,-10},{10,10}},
          rotation=180)));
  equation
    omega = der(plug_p.reference.gamma);
    v = plug_p.pin.v - plug_n.pin.v;
    i = plug_p.pin.i;
    connect(plug_p, plugToPins_p.plug_p) annotation (Line(points={{-100,0},{-93,
            0},{-86,0},{-72,0}}, color={85,170,255}));
    connect(plugToPins_n.plug_n, plug_n)
      annotation (Line(points={{72,0},{86,0},{100,0}}, color={85,170,255}));
    annotation (Documentation(info="<html>
<p>
This partial model uses a <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">positive</a>
and <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">negative plug</a> and defines the complex voltage differences as well as the complex currents (into the positive plug). A <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_p\">positive</a> and
a <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_n\">negative adapter</a> are used to give easy access to the single pins of both plugs. Additionally, the angular velocity of the quasi stationary system is explicitly defined as variable. This model is mainly intended to be used with graphical representation of user models.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>,
</p>
</html>"));
  end TwoPlug;

  partial model OnePort
    parameter Integer m(min=1) = 3 "Number of phases";
    Modelica_SIunits.ComplexVoltage v[m] "Complex voltage";
    Modelica_SIunits.Voltage abs_v[m] = Modelica_ComplexMath.'abs'(v)
      "Magnitude of complex voltage";
    Modelica_SIunits.Angle arg_v[m] = Modelica_ComplexMath.arg(v)
      "Argument of complex voltage";
    Modelica_SIunits.ComplexCurrent i[m] "Complex current";
    Modelica_SIunits.Current abs_i[m] = Modelica_ComplexMath.'abs'(i)
      "Magnitude of complex current";
    Modelica_SIunits.Angle arg_i[m] = Modelica_ComplexMath.arg(i)
      "Argument of complex current";
    Modelica_SIunits.ActivePower P[m] = {Modelica_ComplexMath.real(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
      "Active power";
    Modelica_SIunits.ActivePower P_total = sum(P) "Total active power";
    Modelica_SIunits.ReactivePower Q[m] = {Modelica_ComplexMath.imag(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
      "Reactive power";
    Modelica_SIunits.ReactivePower Q_total = sum(Q) "Total reactive power";
    Modelica_SIunits.ApparentPower S[m] = {Modelica_ComplexMath.'abs'(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
      "Magnitude of complex apparent power";
    Modelica_SIunits.ApparentPower S_total=sqrt(P_total^2+Q_total^2)
      "Magntiude of total complex apparent power";
    Real pf[m] = {cos(Modelica_ComplexMath.arg(Complex(P[k],Q[k]))) for k in 1:m}
      "Power factor";
    /*
  Real pf_total = cos(Modelica.ComplexMath.arg(Complex(P_total,Q_total)))
    "Total power factor";
  */
    Modelica_SIunits.AngularVelocity omega
      "Angular velocity of reference frame";

    PositivePlug plug_p(final m=m) "Positive quasi stationary multi phase plug"
                                                   annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    NegativePlug plug_n(final m=m) "Negative quasi stationary multi phase plug"
                                                   annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));
  equation
    Connections.branch(plug_p.reference, plug_n.reference);
    plug_p.reference.gamma = plug_n.reference.gamma;
    omega = der(plug_p.reference.gamma);
    v = plug_p.pin.v - plug_n.pin.v;
    i = plug_p.pin.i;
    plug_p.pin.i + plug_n.pin.i = fill(Complex(0), m);
  end OnePort;

  partial model AbsoluteSensor "Partial potential sensor"
    extends Modelica_Icons.RotationalSensor;
    parameter Integer m(min=1) = 3 "number of phases";
    Modelica_SIunits.AngularVelocity omega;
    PositivePlug plug_p(final m=m) "Positive quasi stationary multi phase plug"
                                                   annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
  equation
    omega = der(plug_p.reference.gamma);
    annotation (Icon(graphics={Line(points={{-70,0},{-94,0}}, color={85,170,
            255}),Line(points={{70,0},{80,0},{90,0},{100,0}}, color={85,170,
            255}),Text(
                extent={{100,-100},{-100,-70}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="m=%m")}), Documentation(info="<html>

<p>
The absolute sensor partial model relies on the a
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">positive plug</a> to measure the complex potential. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.RelativeSensor\">RelativeSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.AbsoluteSensor\">SinglePhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.RelativeSensor\">SinglePhase.Interfaces.RelativeSensor</a>
</p>

</html>"));
  end AbsoluteSensor;

  partial model RelativeSensor "Partial voltage / current sensor"
    extends Modelica_Icons.RotationalSensor;
    extends TwoPlug;
    Modelica_ComplexBlocks_Interfaces.ComplexOutput y[m] annotation (
        Placement(transformation(
          origin={0,-110},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    annotation (Icon(graphics={Line(points={{-70,0},{-94,0}}, color={0,0,0}),
            Line(points={{70,0},{94,0}}, color={0,0,0}),Line(points={{0,-70},
            {0,-80},{0,-90},{0,-100}}, color={85,170,255}),Text(
                extent={{100,-100},{-100,-70}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="m=%m")}), Documentation(info="<html>
<p>
The relative sensor partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.TwoPlug\">TwoPlug</a> to measure the complex voltages, currents or power. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.AbsoluteSensor\">AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.AbsoluteSensor\">SinglePhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.RelativeSensor\">SinglePhase.Interfaces.RelativeSensor</a>
</p>

</html>"));

  end RelativeSensor;

  partial model Source "Partial voltage / current source"
    extends OnePort;
    constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
    Modelica_SIunits.Angle gamma(start=0) = plug_p.reference.gamma;
  equation
    Connections.root(plug_p.reference);
    annotation (
      Icon(graphics={
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
          Line(points={{50,0},{90,0}}, color={0,0,0}),
          Text(
            extent={{100,60},{-100,100}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            textString="m=%m")}),
      Documentation(info="<html>
<p>
The source partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.TwoPlug\">TwoPlug</a> and contains a proper icon.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Source\">SinglePhase.Interfaces.Source</a>.
</p>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
  end Source;

  partial model ReferenceSource
    "Partial of voltage or current source with reference input"
    extends Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces.OnePort;
    import Modelica_Constants.pi;
  equation
    Connections.root(plug_p.reference);
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
          Line(points={{50,0},{90,0}}, color={0,0,0}),
          Text(
            extent={{100,60},{-100,100}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            textString="m=%m")}), Documentation(info="<html>
<p>
The source partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.TwoPlug\">TwoPlug</a> and contains a proper icon.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Source\">SinglePhase.Interfaces.Source</a>.
</p>
</html>"));
  end ReferenceSource;
  annotation (uses(Complex(version="3.2.2")));
end Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces;
