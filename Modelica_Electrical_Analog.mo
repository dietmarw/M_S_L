within ;
package Modelica_Electrical_Analog "Library for analog electrical models"
import SI = Modelica_SIunits;

extends Modelica_Icons.Package;

  package Basic "Basic electrical components"

    extends Modelica_Icons.Package;

    model Ground "Ground node"

      Modelica_Electrical_Analog_Interfaces.Pin p annotation (Placement(
            transformation(
            origin={0,100},
            extent={{10,-10},{-10,10}},
            rotation=270)));
    equation
      p.v = 0;
      annotation (
        Documentation(info="<html>
<p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-60,50},{60,50}}, color={0,0,255}),
            Line(points={{-40,30},{40,30}}, color={0,0,255}),
            Line(points={{-20,10},{20,10}}, color={0,0,255}),
            Line(points={{0,90},{0,50}}, color={0,0,255}),
            Text(
              extent={{-144,-19},{156,-59}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(
                points={{-60,50},{60,50}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{-40,30},{40,30}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{-20,10},{20,10}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{0,96},{0,50}},
                thickness=0.5,
                color={0,0,255}),Text(
                extent={{-24,-38},{22,-6}},
                textString="p.v=0",
                lineColor={0,0,255})}));
    end Ground;

    model Resistor "Ideal linear electrical resistor"
      parameter Modelica_SIunits.Resistance R(start=1)
        "Resistance at temperature T_ref";
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";

      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=T_ref);
      Modelica_SIunits.Resistance R_actual
        "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";

    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      R_actual = R*(1 + alpha*(T_heatPort - T_ref));
      v = R_actual*i;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The linear resistor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i*R = v</i>. The Resistance <i>R</i> is allowed to be positive, zero, or negative.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-144,-40},{142,-72}},
              lineColor={0,0,0},
              textString="R=%R"),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-30}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-152,87},{148,47}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(extent={{-70,30},{70,-30}},
              lineColor={0,0,255}),Line(points={{-96,0},{-70,0}}, color={0,0,255}),
              Line(points={{70,0},{96,0}}, color={0,0,255})}));
    end Resistor;

    model HeatingResistor "Temperature dependent electrical resistor"
      parameter Modelica_SIunits.Resistance R_ref(start=1)
        "Resistance at temperature T_ref";
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R = R_ref*(1 + alpha*(heatPort.T - T_ref))";
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=T_ref,
          useHeatPort=true);
      Modelica_SIunits.Resistance R
        "Resistance = R_ref*(1 + alpha*(T_heatPort - T_ref))";
    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      R = R_ref*(1 + alpha*(T_heatPort - T_ref));
      v = R*i;
      LossPower = v*i;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-110,20},{-85,20}}, color={
              160,160,164}),Polygon(
                points={{-95,23},{-85,20},{-95,17},{-95,23}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{90,20},{115,20}},
              color={160,160,164}),Line(points={{-125,0},{-115,0}}, color={160,
              160,164}),Line(points={{-120,-5},{-120,5}}, color={160,160,164}),
              Text(
                extent={{-110,25},{-90,45}},
                lineColor={160,160,164},
                textString="i"),Polygon(
                points={{105,23},{115,20},{105,17},{105,23}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{115,0},{125,0}},
              color={160,160,164}),Text(
                extent={{90,45},{110,25}},
                lineColor={160,160,164},
                textString="i")}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-52,-50},{48,50}}, color={0,0,255}),
            Polygon(
              points={{40,52},{50,42},{54,56},{40,52}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-30}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-156,109},{144,69}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>This is a model for an electrical resistor where the generated heat is dissipated to the environment via connector <b>heatPort</b> and where the resistance R is temperature dependent according to the following equation:</p>
<pre>    R = R_ref*(1 + alpha*(heatPort.T - T_ref))</pre>
<p><b>alpha</b> is the <b>temperature coefficient of resistance</b>, which is often abbreviated as <b>TCR</b>. In resistor catalogues, it is usually defined as <b>X [ppm/K]</b> (parts per million, similarly to percentage) meaning <b>X*1.e-6 [1/K]</b>. Resistors are available for 1 .. 7000 ppm/K, i.e., alpha = 1e-6 .. 7e-3 1/K;</p>
<p>Via parameter <b>useHeatPort</b> the heatPort connector can be enabled and disabled (default = enabled). If it is disabled, the generated heat is transported implicitly to an internal temperature source with a fixed temperature of T_ref.</p><p>If the heatPort connector is enabled, it must be connected.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 2002   </i>
       by Anton Haumer<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end HeatingResistor;

    model Conductor "Ideal linear electrical conductor"
      parameter Modelica_SIunits.Conductance G(start=1)
        "Conductance at temperature T_ref";
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=T_ref);
      Modelica_SIunits.Conductance G_actual
        "Actual conductance = G_ref/(1 + alpha*(T_heatPort - T_ref))";

    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      G_actual = G/(1 + alpha*(T_heatPort - T_ref));
      i = G_actual*v;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The linear conductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i = v*G</i>. The Conductance <i>G</i> is allowed to be positive, zero, or negative.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of conductance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-30}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-152,87},{148,47}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-144,-38},{142,-70}},
              lineColor={0,0,0},
              textString="G=%G")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,0},{-70,0}}, color={0,0,
              255}),Line(points={{70,0},{96,0}}, color={0,0,255}),Rectangle(
              extent={{-70,30},{70,-30}}, lineColor={0,0,255})}));
    end Conductor;

    model Capacitor "Ideal linear electrical capacitor"
      extends Modelica_Electrical_Analog_Interfaces.OnePort(
                                 v(start=0));
      parameter Modelica_SIunits.Capacitance C(start=1) "Capacitance";

    equation
      i = C*der(v);
      annotation (
        Documentation(info="<html>
<p>The linear capacitor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i = C * dv/dt</i>. The Capacitance <i>C</i> is allowed to be positive or zero.</p>

</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-6,28},{-6,-28}}, color={0,0,255}),
            Line(points={{6,28},{6,-28}}, color={0,0,255}),
            Line(points={{-90,0},{-6,0}}, color={0,0,255}),
            Line(points={{6,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-136,-60},{136,-92}},
              lineColor={0,0,0},
              textString="C=%C"),
            Text(
              extent={{-150,85},{150,45}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(
                points={{-20,40},{-20,-40}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{20,40},{20,-40}},
                thickness=0.5,
                color={0,0,255}),Line(points={{-96,0},{-20,0}}, color={0,0,255}),
              Line(points={{20,0},{96,0}}, color={0,0,255})}));
    end Capacitor;

    model Inductor "Ideal linear electrical inductor"
      extends Modelica_Electrical_Analog_Interfaces.OnePort(
                                 i(start=0));
      parameter Modelica_SIunits.Inductance L(start=1) "Inductance";

    equation
      L*der(i) = v;
      annotation (
        Documentation(info="<html>
<p>The linear inductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>v = L * di/dt</i>. The Inductance <i>L</i> is allowed to be positive, or zero.</p>

</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
            Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-60,-30},{60,0}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-90,0},{-60,0}}, color={0,0,255}),
            Text(
              extent={{-138,-60},{144,-94}},
              lineColor={0,0,0},
              textString="L=%L"),
            Text(
              extent={{-152,79},{148,39}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-60,-15},{-30,15}},
              lineColor={0,0,255}),Ellipse(extent={{-30,-15},{0,15}}, lineColor={
              0,0,255}),Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
              Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),Rectangle(
                extent={{-60,-30},{60,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{60,0},{96,0}}, color=
               {0,0,255}),Line(points={{-96,0},{-60,0}}, color={0,0,255})}));
    end Inductor;

    model SaturatingInductor "Simple model of an inductor with saturation"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Current Inom(start=1) "Nominal current";
      parameter Modelica_SIunits.Inductance Lnom(start=1)
        "Nominal inductance at Nominal current";
      parameter Modelica_SIunits.Inductance Lzer(start=2*Lnom)
        "Inductance near current=0";
      parameter Modelica_SIunits.Inductance Linf(start=Lnom/2)
        "Inductance at large currents";
      Modelica_SIunits.Inductance Lact(start=Lzer) "Present inductance";
      Modelica_SIunits.MagneticFlux Psi(start=0, fixed=true) "Present flux";
    protected
      parameter Modelica_SIunits.Current Ipar(start=Inom/10, fixed=false);
    initial equation
      (Lnom - Linf) = (Lzer - Linf)*Ipar/Inom*(Modelica_Constants.pi/2 -
        Modelica_Math.atan(Ipar/Inom));
    equation
      assert(Lzer > Lnom +Modelica_Constants.eps,  "Lzer (= " + String(Lzer) +
        ") has to be > Lnom (= " + String(Lnom) + ")");
      assert(Linf < Lnom -Modelica_Constants.eps,  "Linf (= " + String(Linf) +
        ") has to be < Lnom (= " + String(Lnom) + ")");
      (Lact - Linf)*i/Ipar = (Lzer - Linf)*noEvent(Modelica_Math.atan(i/Ipar));
      Psi = Lact*i;
      v = der(Psi);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
            Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-60,-20},{62,0}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-90,0},{-60,0}}, color={0,0,255}),
            Rectangle(
              extent={{-60,-10},{60,-20}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={0,0,255}),
            Text(
              extent={{-148,-50},{152,-80}},
              lineColor={0,0,0},
              textString="Lnom=%Lnom"),
            Text(
              extent={{-148,91},{152,51}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>This model approximates the behaviour of an inductor with the influence of saturation, i.e., the value of the inductance depends on the current flowing through the inductor. The inductance decreases as current increases.</p><p>The parameters are:</p>
<ul>
<li>Inom...nominal current</li>
<li>Lnom...nominal inductance at nominal current</li>
<li>Lzer...inductance near current = 0; Lzer has to be greater than Lnom</li>
<li>Linf...inductance at large currents; Linf has to be less than Lnom </li>
</ul>
</html>",   revisions="<html>
<dl>
  <dt><b>Main Author:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting &amp; Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
  <dt><b>Release Notes:</b></dt>
  <dd>May 27, 2004: Implemented by Anton Haumer</dd>
 </dl>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-60,-15},{-30,15}},
              lineColor={0,0,255}),Ellipse(extent={{-30,-15},{0,15}}, lineColor={
              0,0,255}),Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
              Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),Rectangle(
                extent={{-60,-20},{62,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{60,0},{96,0}}, color=
               {0,0,255}),Line(points={{-96,0},{-60,0}}, color={0,0,255}),
              Rectangle(
                extent={{-60,-10},{60,-20}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={0,0,255})}));
    end SaturatingInductor;

    model Transformer "Transformer with two ports"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort(
                                 i1(start=0),i2(start=0));
      parameter Modelica_SIunits.Inductance L1(start=1) "Primary inductance";
      parameter Modelica_SIunits.Inductance L2(start=1) "Secondary inductance";
      parameter Modelica_SIunits.Inductance M(start=1) "Coupling inductance";
      Real dv "Difference between voltage drop over primary inductor and
    voltage drop over secondary inductor";
    equation
      v1 = L1*der(i1) + M*der(i2);

      /* Original equation:
        v2 = M*der(i1) + L2*der(i2);
     If L1 = L2 = M, then this model has one state less. However,
     it might be difficult for a tool to detect this. For this reason
     the model is defined with a relative potential:
  */
      dv = (L1 - M)*der(i1) + (M - L2)*der(i2);
      v2 = v1 - dv;

      annotation (
        Documentation(info="<html>
<p>The transformer is a two port. The left port voltage <i>v1</i>, left port current <i>i1</i>, right port voltage <i>v2</i> and right port current <i>i2</i> are connected by the following relation:</p>
<pre>         | v1 |         | L1   M  |  | i1&#39;; |
         |    |    =    |         |  |     |
         | v2 |         | M    L2 |  | i2&#39;; |</pre>
<p><i>L1</i>, <i>L2</i>, and <i>M</i> are the primary, secondary, and coupling inductances respectively.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-45,-50},{-20,-25}}, lineColor={0,0,255}),
            Ellipse(extent={{-45,-25},{-20,0}}, lineColor={0,0,255}),
            Ellipse(extent={{-45,0},{-20,25}}, lineColor={0,0,255}),
            Ellipse(extent={{-45,25},{-20,50}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-72,-60},{-33,60}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,50},{-32,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-32,-50}}, color={0,0,255}),
            Ellipse(extent={{20,-50},{45,-25}}, lineColor={0,0,255}),
            Ellipse(extent={{20,-25},{45,0}}, lineColor={0,0,255}),
            Ellipse(extent={{20,0},{45,25}}, lineColor={0,0,255}),
            Ellipse(extent={{20,25},{45,50}}, lineColor={0,0,255}),
            Rectangle(
              extent={{33,-60},{72,60}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{32,50},{90,50}}, color={0,0,255}),
            Line(points={{32,-50},{90,-50}}, color={0,0,255}),
            Text(
              extent={{-103,16},{-60,-10}},
              textString="L1",
              lineColor={0,0,0},
              pattern=LinePattern.Dot),
            Text(
              extent={{64,15},{105,-9}},
              textString="L2",
              lineColor={0,0,0},
              pattern=LinePattern.Dot),
            Text(
              extent={{-27,-71},{33,-97}},
              textString="M",
              lineColor={0,0,0}),
            Text(
              extent={{-153,113},{147,73}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-45,-50},{-20,-25}},
              lineColor={0,0,255}),Ellipse(extent={{-45,-25},{-20,0}}, lineColor=
              {0,0,255}),Ellipse(extent={{-45,0},{-20,25}}, lineColor={0,0,255}),
              Ellipse(extent={{-45,25},{-20,50}}, lineColor={0,0,255}),Rectangle(
                extent={{-72,-60},{-33,60}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,50},{-32,50}},
              color={0,0,255}),Line(points={{-96,-50},{-32,-50}}, color={0,0,255}),
              Ellipse(extent={{20,-50},{45,-25}}, lineColor={0,0,255}),Ellipse(
              extent={{20,-25},{45,0}}, lineColor={0,0,255}),Ellipse(extent={{20,
              0},{45,25}}, lineColor={0,0,255}),Ellipse(extent={{20,25},{45,50}},
              lineColor={0,0,255}),Rectangle(
                extent={{33,-60},{72,60}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{32,50},{96,50}},
              color={0,0,255}),Line(points={{32,-50},{96,-50}}, color={0,0,255})}));
    end Transformer;

    model M_Transformer "Generic transformer with free number of inductors"

      parameter Integer N(final min=1) = 3 "Number of inductors";
    protected
      parameter Integer dimL=div(N*(N + 1), 2);
    public
      parameter Modelica_SIunits.Inductance L[dimL]={1,0.1,0.2,2,0.3,3}
        "Inductances and coupling inductances";
      Modelica_Electrical_Analog_Interfaces.PositivePin p[N] "Positive pin"
        annotation (Placement(transformation(extent={{-80,-40},{-62,40}})));
      Modelica_Electrical_Analog_Interfaces.NegativePin n[N] "Negative pin"
        annotation (Placement(transformation(extent={{62,-40},{80,40}})));

      Modelica_SIunits.Voltage v[N] "Voltage drop over inductors";
      Modelica_SIunits.Current i[N](each start=0, fixed=true)
        "Current through inductors";
      parameter Modelica_SIunits.Inductance Lm[N, N](each final fixed=false)
        "Complete symmetric inductance matrix, calculated internally";

    initial equation
      for s in 1:N loop
        for z in 1:N loop
          Lm[z, s] = if (z >= s) then L[(s - 1)*N + z - div((s - 1)*s, 2)] else
            Lm[s, z];
        end for;
      end for;

    equation
      for j in 1:N loop
        v[j] = p[j].v - n[j].v;
        0 = p[j].i + n[j].i;
        i[j] = p[j].i;
      end for;

      v = Lm*der(i);

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Ellipse(extent={{-36,24},{-18,42}}, lineColor={0,0,255}),
            Ellipse(extent={{18,24},{36,42}}, lineColor={0,0,255}),
            Ellipse(extent={{0,24},{18,42}}, lineColor={0,0,255}),
            Ellipse(extent={{-18,24},{0,42}}, lineColor={0,0,255}),
            Rectangle(
              extent={{42,23},{-44,34}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-36,34},{-62,34}}, color={0,0,255}),
            Line(points={{62,34},{36,34}}, color={0,0,255}),
            Ellipse(extent={{-36,8},{-18,26}}, lineColor={0,0,255}),
            Ellipse(extent={{18,8},{36,26}}, lineColor={0,0,255}),
            Ellipse(extent={{0,8},{18,26}}, lineColor={0,0,255}),
            Ellipse(extent={{-18,8},{0,26}}, lineColor={0,0,255}),
            Rectangle(
              extent={{42,6},{-44,18}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-36,18},{-62,18}}, color={0,0,255}),
            Line(points={{62,18},{36,18}}, color={0,0,255}),
            Line(points={{-36,-29},{-62,-29}}, color={0,0,255}),
            Ellipse(extent={{-36,-40},{-18,-22}}, lineColor={0,0,255}),
            Ellipse(extent={{-18,-40},{0,-22}}, lineColor={0,0,255}),
            Ellipse(extent={{0,-40},{18,-22}}, lineColor={0,0,255}),
            Ellipse(extent={{18,-40},{36,-22}}, lineColor={0,0,255}),
            Line(points={{62,-29},{36,-29}}, color={0,0,255}),
            Rectangle(
              extent={{42,-42},{-44,-30}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{0,8},{0,-18}},
              color={0,0,255},
              pattern=LinePattern.Dot),
            Text(
              extent={{-150,103},{150,63}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>The model <i>M_Transformer</i> is a model of a transformer with the possibility to choose the number of inductors. Inside the model, an inductance matrix is built based on the inductance of the inductors and the coupling inductances between the inductors given as a parameter vector from the user of the model.</p>

<p>An example shows that approach:<br>
The user chooses a model with <b>three</b> inductors, that means the parameter <i><b>N</b></i> has to be <b>3</b>. Then he has to specify the inductances of the three inductors and the three coupling inductances. The coupling inductances are no real existing devices, but effects that occur between two inductors. The inductivities (main diagonal of the inductance matrix) and the coupling inductivities have to be specified in the parameter vector <i>L</i>. The length <i>dimL</i> of the parameter vector is calculated as follows: <i><b>dimL=(N*(N+1))/2</b></i></p>

<p>The following example shows how the parameter vector is used to fill in the inductance matrix. To specify the inductance matrix of a three inductances transformer (<i>N=3</i>):
</p>

<p>
<img
 src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Basic/M_Transformer-eq.png\"
 alt=\"L_m\">
</p>

<p>
the user has to allocate the parameter vector <i>L[6] </i>, since <i>Nv=(N*(N+1))/2=(3*(3+1))/2=6</i>. The parameter vector must be filled like this: <i>L=[1,0.1,0.2,2,0.3,3] </i>.</p>
<p>Inside the model, two loops are used to fill the inductance matrix to guarantee that it is filled in a symmetric way.</p>
</html>",   revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th>Version</th>
      <th>Revision</th>
      <th>Date</th>
      <th>Author</th>
      <th>Comment</th>
    </tr>
   <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\">4163</td>
      <td valign=\"top\">2010-09-11</td>
      <td valign=\"top\">Dietmar Winkler</td>
      <td valign=\"top\">Documentation corrected according to documentation guidelines.</td>
    </tr>
    <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\"></td>
      <td valign=\"top\">2008-11-24</td>
      <td valign=\"top\">Kristin Majetta</td>
      <td valign=\"top\">Documentation added.</td>
    </tr>
    <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\"></td>
      <td valign=\"top\">2008-11-16</td>
      <td valign=\"top\">Kristin Majetta</td>
      <td valign=\"top\">Initially implemented</td>
    </tr>
</table>
</html>"));
    end M_Transformer;

    model Gyrator "Gyrator"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Modelica_SIunits.Conductance G1(start=1) "Gyration conductance";
      parameter Modelica_SIunits.Conductance G2(start=1) "Gyration conductance";
    equation
      i1 = G2*v2;
      i2 = -G1*v1;
      annotation (
        Documentation(info="<html>
<p>A gyrator is a two-port element defined by the following equations:</p>
<pre>    i1 =  G2 * v2
    i2 = -G1 * v1</pre>
<p>where the constants <i>G1</i>, <i>G2</i> are called the gyration conductance.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,50},{90,50}}, color={0,0,255}),
            Line(points={{60,-50},{90,-50}}, color={0,0,255}),
            Line(points={{-40,30},{40,30}}, color={0,0,255}),
            Line(points={{-20,-20},{20,-20}}, color={0,0,255}),
            Polygon(
              points={{30,34},{40,30},{30,26},{30,34}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{-26,-19},{-16,-15},{-16,-23},{-26,-19}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-5,10},{-10,-10}}, color={0,0,0}),
            Line(points={{9,10},{4,-9}}, color={0,0,0}),
            Line(points={{-14,9},{16,10}}, color={0,0,0}),
            Text(
              extent={{-29,59},{30,30}},
              textString="G1",
              lineColor={0,0,0}),
            Text(
              extent={{-29,-29},{29,-58}},
              textString="G2",
              lineColor={0,0,0}),
            Text(
              extent={{-156,117},{144,77}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{-96,50},{-60,50}}, color={0,0,
              255}),Line(points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(
              points={{60,50},{96,50}}, color={0,0,255}),Line(points={{60,-50},{
              96,-50}}, color={0,0,255}),Line(points={{-40,30},{40,30}}, color={0,
              0,255}),Line(points={{-21,-22},{19,-22}}, color={0,0,255}),Polygon(
                points={{30,34},{40,30},{30,26},{30,34}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Polygon(
                points={{-20,-30},{-10,-26},{-10,-34},{-20,-30}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(
                points={{-4,5},{-6,-5}},
                thickness=1,
                color={0,0,255}),Line(
                points={{3,5},{1,-5}},
                thickness=1,
                color={0,0,255}),Line(
                points={{-8,5},{7,5}},
                thickness=1,
                color={0,0,255}),Text(
                extent={{-20,50},{20,35}},
                textString="G1",
                lineColor={0,0,255}),Text(
                extent={{-20,-35},{20,-50}},
                textString="G2",
                lineColor={0,0,255})}));
    end Gyrator;

    model EMF "Electromotoric force (electric/mechanic transformer)"
      parameter Boolean useSupport=false
        "= true, if support flange enabled, otherwise implicitly grounded"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.ElectricalTorqueConstant k(start=1)
        "Transformation coefficient";
      Modelica_SIunits.Voltage v "Voltage drop between the two pins";
      Modelica_SIunits.Current i
        "Current flowing from positive to negative pin";
      Modelica_SIunits.Angle phi
        "Angle of shaft flange with respect to support (= flange.phi - support.phi)";
      Modelica_SIunits.AngularVelocity w
        "Angular velocity of flange relative to support";
      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n annotation (Placement(
            transformation(
            origin={0,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_Rotational_Interfaces.Flange_b flange annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Mechanics_Rotational_Interfaces.Support support if
                                                         useSupport
        "Support/housing of emf shaft"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    protected
      Modelica_Mechanics_Rotational.Components.Fixed fixed if
                                                     not useSupport
        annotation (Placement(transformation(extent={{-90,-20},{-70,0}})));
      Modelica_Mechanics_Rotational_Interfaces.InternalSupport internalSupport(
          tau=-flange.tau)
        annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;

      phi = flange.phi - internalSupport.phi;
      w = der(phi);
      k*w = v;
      flange.tau = -k*i;
      connect(internalSupport.flange, support) annotation (Line(
          points={{-80,0},{-100,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(internalSupport.flange, fixed.flange) annotation (Line(
          points={{-80,0},{-80,-10}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (
        defaultComponentName="emf",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-85,10},{-36,-10}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192}),
            Line(points={{0,90},{0,40}}, color={0,0,255}),
            Rectangle(
              extent={{35,10},{100,-10}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192}),
            Ellipse(
              extent={{-40,40},{40,-40}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,-90},{0,-40}}, color={0,0,255}),
            Text(
              extent={{0,-50},{199,-90}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{0,80},{189,46}},
              lineColor={160,160,164},
              textString="k=%k"),
            Line(
              visible=not useSupport,
              points={{-100,-30},{-40,-30}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-100,-50},{-80,-30}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-80,-50},{-60,-30}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-60,-50},{-40,-30}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-70,-30},{-70,-10}},
              color={0,0,0})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-17,95},{-20,85},{-23,95},{-17,95}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{-20,110},{-20,85}},
              color={160,160,164}),Text(
                extent={{-40,110},{-30,90}},
                lineColor={160,160,164},
                textString="i"),Line(points={{9,75},{19,75}}, color={192,192,192}),
              Line(points={{-20,-110},{-20,-85}}, color={160,160,164}),Polygon(
                points={{-17,-100},{-20,-110},{-23,-100},{-17,-100}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Text(
                extent={{-40,-110},{-30,-90}},
                lineColor={160,160,164},
                textString="i"),Line(points={{8,-79},{18,-79}}, color={192,192,
              192}),Line(points={{14,80},{14,70}}, color={192,192,192})}),
        Documentation(info="<html>
<p>EMF transforms electrical energy into rotational mechanical energy. It is used as basic building block of an electrical motor. The mechanical connector flange can be connected to elements of the Modelica.Mechanics.Rotational library. flange.tau is the cut-torque, flange.phi is the angle at the rotational connection.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end EMF;

    model TranslationalEMF
      "Electromotoric force (electric/mechanic transformer)"
      parameter Boolean useSupport=false
        "= true, if support flange enabled, otherwise implicitly grounded"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.ElectricalForceConstant k(start=1)
        "Transformation coefficient";

      Modelica_SIunits.Voltage v "Voltage drop between the two pins";
      Modelica_SIunits.Current i
        "Current flowing from positive to negative pin";
      Modelica_SIunits.Position s "Position of flange relative to support";
      Modelica_SIunits.Velocity vel "Velocity of flange relative to support";

      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n annotation (Placement(
            transformation(
            origin={0,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_Translational_Interfaces.Flange_b flange annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Mechanics_Translational_Interfaces.Support support if useSupport
        "Support/housing"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    protected
      Modelica_Mechanics_Translational.Components.Fixed fixed if not useSupport
        annotation (Placement(transformation(extent={{-90,-20},{-70,0}})));
      Modelica_Mechanics_Translational_Interfaces.InternalSupport internalSupport(
          f=-flange.f)
        annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;

      s = flange.s - internalSupport.s;
      vel = der(s);
      k*vel = v;
      flange.f = -k*i;
      connect(internalSupport.flange, support) annotation (Line(
          points={{-80,0},{-90,0},{-90,0},{-100,0}},
          color={0,127,0},
          smooth=Smooth.None));
      connect(internalSupport.flange, fixed.flange) annotation (Line(
          points={{-80,0},{-80,-10}},
          color={0,127,0},
          smooth=Smooth.None));
      annotation (
        defaultComponentName="emf",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-90,51},{-40,-50}},
              lineColor={0,0,0},
              fillColor={135,135,135},
              fillPattern=FillPattern.HorizontalCylinder),
            Rectangle(
              extent={{-21,20},{90,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,80},{148,44}},
              lineColor={160,160,164},
              textString="k=%k"),
            Line(points={{-30,49},{-30,80},{0,80},{0,91}}, color={0,0,255}),
            Line(points={{20,-49},{20,-80},{0,-80},{0,-89},{0,-90}}, color={0,0,
                  255}),
            Ellipse(extent={{-21,50},{9,-50}}, lineColor={0,0,255}),
            Ellipse(extent={{2,50},{32,-50}}, lineColor={0,0,255}),
            Ellipse(extent={{-43,50},{-13,-50}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-4,20},{-1,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{7,20},{10,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-14,20},{-11,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{19,20},{44,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Line(
              visible=not useSupport,
              points={{-100,-70},{-40,-70}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-100,-90},{-80,-70}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-80,-90},{-60,-70}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-60,-90},{-40,-70}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-70,-70},{-70,-50}},
              color={0,0,0}),
            Text(
              extent={{0,-50},{199,-90}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-17,95},{-20,85},{-23,95},{-17,95}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{-20,110},{-20,85}},
              color={160,160,164}),Text(
                extent={{-40,110},{-30,90}},
                lineColor={160,160,164},
                textString="i"),Line(points={{9,75},{19,75}}, color={192,192,192}),
              Line(points={{-20,-110},{-20,-85}}, color={160,160,164}),Polygon(
                points={{-17,-100},{-20,-110},{-23,-100},{-17,-100}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Text(
                extent={{-40,-110},{-30,-90}},
                lineColor={160,160,164},
                textString="i"),Line(points={{8,-79},{18,-79}}, color={192,192,
              192}),Line(points={{14,80},{14,70}}, color={192,192,192}),Polygon(
                points={{140,3},{150,0},{140,-3},{140,3},{140,3}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>EMF transforms electrical energy into translational mechanical energy. It is used as basic building block of an electrical linear motor. The mechanical connector flange can be connected to elements of the Modelica.Mechanics.Translational library. flange.f is the cut-force, flange.s is the distance at the translational connection.</p>
</html>",   revisions="<html>
<dl>
<dt>2009</dt>
<dd>by Anton Haumer<br> initially implemented</dd>
</dl>
</html>"));
    end TranslationalEMF;

    model VCV "Linear voltage-controlled voltage source"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Real gain(start=1) "Voltage gain";

    equation
      v2 = v1*gain;
      i1 = 0;
      annotation (
        Documentation(info="<html>
<p>The linear voltage-controlled voltage source is a TwoPort. The right port voltage v2 is controlled by the left port voltage v1 via</p>
<pre>    v2 = v1 * gain. </pre>
<p>The left port current is zero. Any voltage gain can be chosen.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,70},{70,-70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-30,50}}, color={0,0,255}),
            Line(points={{-30,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{100,50},{30,50},{30,-50},{100,-50}}, color={0,0,255}),
            Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),
            Line(points={{-20,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,60},{10,63},{10,57},{20,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-148,-81},{152,-121}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,50},{-31,50}}, color={0,0,
              255}),Line(points={{-30,-50},{-96,-50}}, color={0,0,255}),Line(
              points={{96,50},{30,50},{30,-50},{96,-50}}, color={0,0,255}),
              Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),Rectangle(
              extent={{-70,70},{70,-70}}, lineColor={0,0,255}),Line(points={{-20,
              60},{20,60}}, color={0,0,255}),Polygon(
                points={{20,60},{10,63},{10,57},{20,60}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255})}));
    end VCV;

    model VCC "Linear voltage-controlled current source"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Modelica_SIunits.Conductance transConductance(start=1)
        "Transconductance";
    equation
      i2 = v1*transConductance;
      i1 = 0;
      annotation (
        Documentation(info="<html>
<p>The linear voltage-controlled current source is a TwoPort. The right port current i2 is controlled by the left port voltage v1 via</p>
<pre>    i2 = v1 * transConductance. </pre>
<p>The left port current is zero. Any transConductance can be chosen.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,70},{70,-70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-30,50}}, color={0,0,255}),
            Line(points={{-30,-50},{-90,-50}}, color={0,0,255}),
            Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),
            Line(points={{-20,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,60},{10,63},{10,57},{20,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{90,50},{30,50},{30,20}}, color={0,0,255}),
            Line(points={{91,-50},{30,-50},{30,-20}}, color={0,0,255}),
            Line(points={{10,0},{50,0}}, color={0,0,255}),
            Text(
              extent={{-143,-82},{157,-122}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,50},{-30,50}}, color={0,0,
              255}),Line(points={{-30,-50},{-96,-50}}, color={0,0,255}),Ellipse(
              extent={{10,20},{50,-20}}, lineColor={0,0,255}),Rectangle(extent={{
              -70,70},{70,-70}}, lineColor={0,0,255}),Line(points={{-20,60},{20,
              60}}, color={0,0,255}),Polygon(
                points={{20,60},{10,63},{10,57},{20,60}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{96,50},{30,50},{30,20}}, color=
               {0,0,255}),Line(points={{96,-50},{30,-50},{30,-20}}, color={0,0,
              255}),Line(points={{10,0},{50,0}}, color={0,0,255})}));
    end VCC;

    model CCV "Linear current-controlled voltage source"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort;

      parameter Modelica_SIunits.Resistance transResistance(start=1)
        "Transresistance";

    equation
      v2 = i1*transResistance;
      v1 = 0;
      annotation (
        Documentation(info="<html>
<p>The linear current-controlled voltage source is a TwoPort. The right port voltage v2 is controlled by the left port current i1 via</p>
<pre>    v2 = i1 * transResistance. </pre>
<p>The left port voltage is zero. Any transResistance can be chosen.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,70},{70,-70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{100,50},{30,50},{30,-50},{100,-50}}, color={0,0,255}),
            Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),
            Line(points={{-20,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,60},{10,63},{10,57},{20,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-20,50},{-20,-50},{-90,-50}}, color={0,0,255}),
            Text(
              extent={{-140,-82},{160,-122}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{10,20},{50,-20}},
              lineColor={0,0,255}),Rectangle(extent={{-70,70},{70,-70}},
              lineColor={0,0,255}),Line(points={{-20,60},{20,60}}, color={0,0,255}),
              Polygon(
                points={{20,60},{10,63},{10,57},{20,60}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{96,50},{30,50},{30,-50},{96,-50}},
              color={0,0,255}),Line(points={{-96,50},{-30,50},{-30,-50},{-96,-50}},
              color={0,0,255})}));
    end CCV;

    model CCC "Linear current-controlled current source"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Real gain(start=1) "Current gain";

    equation
      i2 = i1*gain;
      v1 = 0;
      annotation (
        Documentation(info="<html>
<p>The linear current-controlled current source is a TwoPort. The right port current i2 is controlled by the left port current i1 via</p>
<pre>    i2 = i1 * gain. </pre>
<p>The left port voltage is zero. Any current gain can be chosen.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,70},{70,-70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-100,50},{-30,50},{-30,-50},{-100,-50}}, color={0,0,255}),
            Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),
            Line(points={{-20,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,60},{10,63},{10,57},{20,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{90,50},{30,50},{30,20}}, color={0,0,255}),
            Line(points={{91,-50},{30,-50},{30,-20}}, color={0,0,255}),
            Line(points={{10,0},{50,0}}, color={0,0,255}),
            Text(
              extent={{-146,-76},{154,-116}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{10,20},{50,-20}},
              lineColor={0,0,255}),Rectangle(extent={{-70,70},{70,-70}},
              lineColor={0,0,255}),Line(points={{-20,60},{20,60}}, color={0,0,255}),
              Polygon(
                points={{20,60},{10,63},{10,57},{20,60}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{96,50},{30,50},{30,20}}, color=
               {0,0,255}),Line(points={{96,-50},{30,-50},{30,-20}}, color={0,0,
              255}),Line(points={{10,0},{50,0}}, color={0,0,255}),Line(points={{-96,
              50},{-30,50},{-30,-50},{-96,-50}}, color={0,0,255})}));
    end CCC;

    model OpAmp "Simple nonideal model of an OpAmp with limitation"
      parameter Real Slope(start=10000)
        "Slope of the out.v/vin characteristic at vin=0";
      Modelica_Electrical_Analog_Interfaces.PositivePin in_p
        "Positive pin of the input port" annotation (Placement(transformation(
              extent={{-110,-60},{-90,-40}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin in_n
        "Negative pin of the input port" annotation (Placement(transformation(
              extent={{-90,40},{-110,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin out "Output pin"
        annotation (Placement(transformation(extent={{110,-10},{90,10}},
              rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin VMax
        "Positive output voltage limitation" annotation (Placement(
            transformation(extent={{-10,60},{10,80}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin VMin
        "Negative output voltage limitation" annotation (Placement(
            transformation(extent={{-10,-80},{10,-60}}, rotation=0)));
      Modelica_SIunits.Voltage vin "input voltage";
    protected
      Real f "auxiliary variable";
      Real absSlope;
    equation
      in_p.i = 0;
      in_n.i = 0;
      VMax.i = 0;
      VMin.i = 0;
      vin = in_p.v - in_n.v;
      f = 2/(VMax.v - VMin.v);
      absSlope = if (Slope < 0) then -Slope else Slope;
      out.v = (VMax.v + VMin.v)/2 + absSlope*vin/(1 + absSlope*smooth(0, (if (f*
        vin < 0) then -f*vin else f*vin)));
      annotation (
        Documentation(info="<html>
<p>The OpAmp is a simple nonideal model with a smooth out.v = f(vin) characteristic, where &quot;vin = in_p.v - in_n.v&quot;. The characteristic is limited by VMax.v and VMin.v. Its slope at vin=0 is the parameter Slope, which must be positive. (Therefore, the absolute value of Slope is taken into calculation.)</p>
</html>",   revisions="<html>
<ul>
<li><i> 2000   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-45,-10},{-20,-10},{-14,-9},{-11,-7},{-9,7},{-6,9},{0,
                  10},{20,10}}, color={0,0,255}),
            Line(points={{0,35},{0,80}}, color={0,0,255}),
            Line(points={{0,-35},{0,-80}}, color={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-149,138},{151,98}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{60,0},{-60,70},{-60,-70},{60,0}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{-45,-10},{-20,-10},{-14,-9},{-11,
              -7},{-9,7},{-6,9},{0,10},{20,10}}, color={0,0,255}),Line(points={{0,
              35},{0,70}}, color={0,0,255}),Line(points={{0,-35},{0,-70}}, color=
              {0,0,255}),Line(points={{-96,50},{-60,50}}, color={0,0,255}),Line(
              points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(points={{60,0},
              {96,0}}, color={0,0,255}),Line(points={{-55,50},{-45,50}}, color={0,
              0,255}),Line(points={{-50,-45},{-50,-55}}, color={0,0,255}),Line(
              points={{-55,-50},{-45,-50}}, color={0,0,255}),Text(
                extent={{-112,-93},{-91,-73}},
                lineColor={160,160,164},
                textString="in_p.i=0"),Polygon(
                points={{120,3},{110,0},{120,-3},{120,3}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Line(points={{111,0},{136,0}}, color={0,
              0,0}),Text(
                extent={{118,2},{135,17}},
                lineColor={0,0,0},
                textString="i2"),Text(
                extent={{-111,60},{-85,80}},
                lineColor={160,160,164},
                textString="in_n.i=0"),Line(
                points={{-100,-35},{-100,23},{-100,24}},
                color={160,160,164},
                arrow={Arrow.None,Arrow.Filled}),Text(
                extent={{-97,-16},{-74,4}},
                lineColor={160,160,164},
                textString="vin")}));
    end OpAmp;

    model OpAmpDetailed "Detailed model of an operational amplifier"
      // literature: Conelly, J.A.; Choi, P.: Macromodelling with SPICE. Englewood Cliffs: Prentice-Hall, 1992
      parameter Modelica_SIunits.Resistance Rdm=2.0e6
        "Input resistance (differential input mode)";
      parameter Modelica_SIunits.Resistance Rcm=2.0e9
        "Input resistance (common mode)";
      parameter Modelica_SIunits.Capacitance Cin=1.4e-12 "Input capacitance";
      parameter Modelica_SIunits.Voltage Vos=1.0e-3 "Input offset voltage";
      parameter Modelica_SIunits.Current Ib=80.0e-9 "Input bias current";
      parameter Modelica_SIunits.Current Ios=20.0e-9 "Input offset current";
      parameter Modelica_SIunits.Voltage vcp=0.0
        "Correction value for limiting by p_supply";
      parameter Modelica_SIunits.Voltage vcm=0.0
        "Correction value for limiting by msupply";
      parameter Real Avd0=106.0 "Differential amplifier [dB]";
      parameter Real CMRR=90.0 "Common-mode rejection [dB]";
      parameter Modelica_SIunits.Frequency fp1=5.0 "Dominant pole";
      parameter Modelica_SIunits.Frequency fp2=2.0e6 "Pole frequency";
      parameter Modelica_SIunits.Frequency fp3=20.0e6 "Pole frequency";
      parameter Modelica_SIunits.Frequency fp4=100.0e6 "Pole frequency";
      parameter Modelica_SIunits.Frequency fz=5.0e6 "Zero frequency";
      parameter Modelica_SIunits.VoltageSlope sr_p=0.5e6
        "Slew rate for increase";
      parameter Modelica_SIunits.VoltageSlope sr_m=0.5e6
        "Slew rate for decrease";
      parameter Modelica_SIunits.Resistance Rout=75.0 "Output resistance";
      parameter Modelica_SIunits.Current Imaxso=25.0e-3
        "Maximal output current (source current)";
      parameter Modelica_SIunits.Current Imaxsi=25.0e-3
        "Maximal output current (sink current)";

      // number of intervals: 2500, stop time: 0.003
      parameter Modelica_SIunits.Time Ts=0.0000012 "sampling time";

      // constant expressions
      constant Real Pi=3.141592654;

      // power supply
      final parameter Modelica_SIunits.Voltage vcp_abs=abs(vcp)
        "Positive correction value for limiting by p_supply";
      final parameter Modelica_SIunits.Voltage vcm_abs=abs(vcm)
        "Positive correction value for limiting by msupply";

      // input stage
      //  Ib = 0.5*(I1 + I2);
      //  Ios = I1 - I2;
      final parameter Modelica_SIunits.Current I1=Ib + Ios/2.0
        "Current of internal source I1";
      final parameter Modelica_SIunits.Current I2=Ib - Ios/2.0
        "Current of internal source I2";

      // gain stage (difference and common mode)
      final parameter Real Avd0_val=10.0^(Avd0/20.0) "differential mode gain";
      final parameter Real Avcm_val=(Avd0_val/(10.0^(CMRR/20.0)))/2.0
        "common mode gain";

      // slew rate stage
      final parameter Modelica_SIunits.VoltageSlope sr_p_val=abs(sr_p)
        "Value of slew rate for increase";
      final parameter Modelica_SIunits.VoltageSlope sr_m_val=-abs(sr_m)
        "Negative alue of slew rate for increase";

      // output stage
      final parameter Modelica_SIunits.Current Imaxso_val=abs(Imaxso)
        "Orientation out outp";
      final parameter Modelica_SIunits.Current Imaxsi_val=abs(Imaxsi)
        "Orientation into outp";

      Modelica_Electrical_Analog_Interfaces.PositivePin p
        "Positive pin of the input port" annotation (Placement(transformation(
              extent={{-111,-61},{-90,-40}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin m
        "Negative pin of the input port" annotation (Placement(transformation(
              extent={{-90,40},{-111,61}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin outp "Output pin"
        annotation (Placement(transformation(extent={{110,-10},{90,10}},
              rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin p_supply
        "Positive output voltage limitation" annotation (Placement(
            transformation(extent={{-8,65},{9,82}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin m_supply
        "Negative output voltage limitation" annotation (Placement(
            transformation(extent={{-9,-83},{9,-65}}, rotation=0)));

      // power supply
      Modelica_SIunits.Voltage v_pos;
      Modelica_SIunits.Voltage v_neg;

      // input stage
      Modelica_SIunits.Voltage v_vos;
      Modelica_SIunits.Voltage v_3;
      Modelica_SIunits.Voltage v_in;
      Modelica_SIunits.Voltage v_4;

      Modelica_SIunits.Current i_vos;
      Modelica_SIunits.Current i_3;
      Modelica_SIunits.Current i_r2;
      Modelica_SIunits.Current i_c3;
      Modelica_SIunits.Current i_4;

      // frequency response
      Real q_fr1;
      Real q_fr2;
      Real q_fr3;

      // gain stage
      Modelica_SIunits.Voltage q_sum;
      Modelica_SIunits.Voltage q_sum_help;
      Modelica_SIunits.Voltage q_fp1;

      // slew rate stage
      Modelica_SIunits.Voltage v_source;

      Modelica_SIunits.Voltage x "auxiliary variable for slew rate";

      // output stage
      Modelica_SIunits.Voltage v_out;

      Modelica_SIunits.Current i_out;

      // functions
      function FCNiout_limit "Internal limitation function"
        extends Modelica_Icons.Function;
        input Modelica_SIunits.Voltage v_source;
        input Modelica_SIunits.Voltage v_out;
        input Modelica_SIunits.Resistance Rout;
        input Modelica_SIunits.Current Imaxsi_val;
        input Modelica_SIunits.Current Imaxso_val;
        output Modelica_SIunits.Current result;

      algorithm
        if v_out > v_source + Rout*Imaxsi_val then
          result := Imaxsi_val;
        elseif v_out < v_source - Rout*Imaxso_val then
          result := -Imaxso_val;
        else
          result := (v_out - v_source)/Rout;
        end if;
        return;
        annotation (Documentation(info="<html>
<p>Internal limitation function, designed for OpAmpDetailed, not for purpose of external usage.</p>
</html>"));
      end FCNiout_limit;

      function FCNq_sum_limit "Internal limitation function"
        extends Modelica_Icons.Function;
        input Modelica_SIunits.Voltage q_sum;
        input Modelica_SIunits.Voltage q_sum_ltf;
        input Modelica_SIunits.Voltage v_pos;
        input Modelica_SIunits.Voltage v_neg;
        input Modelica_SIunits.Voltage vcp;
        input Modelica_SIunits.Voltage vcm;
        output Modelica_SIunits.Voltage result;

      algorithm
        if q_sum > v_pos - vcp and q_sum_ltf >= v_pos - vcp then
          result := v_pos - vcp;
        elseif q_sum < v_neg + vcm and q_sum_ltf <= v_neg + vcm then
          result := v_neg + vcm;
        else
          result := q_sum;
        end if;
        return;
        annotation (Documentation(info="<html>
<p>Internal limitation function, designed for OpAmpDetailed, not for purpose of external usage.</p>
</html>"));
      end FCNq_sum_limit;

    initial equation
      v_source = q_fp1;
      x = 0;
    equation
      assert(Rout > 0.0, "Rout must be > 0.0.");

      // power supply
      v_pos = p_supply.v;
      v_neg = m_supply.v;

      // input stage
      p.i = i_vos;
      m.i = i_4 - i_r2 - i_c3;
      0 = i_3 + i_r2 + i_c3 - i_vos;
      p.v - m.v = v_vos + v_in;
      v_4 = m.v;
      v_3 = p.v - v_vos;
      v_vos = Vos;
      i_3 = I1 + v_3/Rcm;
      v_in = Rdm*i_r2;
      i_c3 = Cin*der(v_in);
      i_4 = I2 + v_4/Rcm;

      // frequency response
      // Laplace transformation
      der(q_fr1) = 2.0*Pi*fp2*(v_in - q_fr1);
      q_fr2 + (1.0/(2.0*Pi*fp3))*der(q_fr2) = q_fr1 + (1.0/(2.0*Pi*fz))*der(q_fr1);
      der(q_fr3) = 2.0*Pi*fp4*(q_fr2 - q_fr3);

      // gain stage
      // Laplace transformation
      q_sum = Avd0_val*q_fr3 + Avcm_val*(v_3 + v_4);
      q_sum_help = FCNq_sum_limit(
          q_sum,
          q_fp1,
          v_pos,
          v_neg,
          vcp_abs,
          vcm_abs);
      der(q_fp1) = 2.0*Pi*fp1*(q_sum_help - q_fp1);

      // slew rate stage
      der(x) = (q_fp1 - v_source)/Ts;
      der(v_source) = smooth(0, noEvent(if der(x) > sr_p_val then sr_p_val else
        if der(x) < sr_m_val then sr_m_val else der(x)));

      // output stage
      v_out = outp.v;
      i_out = outp.i;
      i_out = FCNiout_limit(
          v_source,
          v_out,
          Rout,
          Imaxsi_val,
          Imaxso_val);

      p_supply.i = 0;
      m_supply.i = 0;

      annotation (
        Documentation(info="<html>
<p>The OpAmpDetailed model is a general operational amplifier model. The emphasis is on separating each important data sheet parameter into a sub-circuit independent of the other parameters. The model is broken down into five functional stages <b>input</b>, <b>frequency response</b>, <b>gain</b>, <b>slew rate</b> and an <b>output</b> stage. Each stage contains data sheet parameters to be modeled. This partitioning and the modelling of the separate submodels are based on the description in <b>[CP92]</b>.</p>
<p>Using <b>[CP92]</b> Joachim Haase (Fraunhofer Institute for Integrated Circuits, Design Automation Division) transferred 2001 operational amplifier models into VHDL-AMS. Now one of these models, the model &quot;amp(macro)&quot; was transferred into Modelica.</p>
<dl><dt><b>Reference:</b> </dt>
<dd><b>[CP92]</b> Conelly, J.A.; Choi, P.: Macromodelling with SPICE. Englewood Cliffs: Prentice-Hall, 1992 </dd>
</dl></html>",   revisions="<html>
<dl>
<dt><i>June 17, 2009</i></dt>
<dd>by Susann Wolf initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,35},{0,80}}, color={0,0,255}),
            Line(points={{0,-35},{0,-80}}, color={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-151,141},{149,101}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{60,0},{-60,70},{-60,-70},{60,0}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{0,35},{0,70}}, color={0,0,255}),
              Line(points={{0,-35},{0,-70}}, color={0,0,255}),Line(points={{-96,
              50},{-60,50}}, color={0,0,255}),Line(points={{-96,-50},{-60,-50}},
              color={0,0,255}),Line(points={{60,0},{96,0}}, color={0,0,255}),Line(
              points={{-55,50},{-45,50}}, color={0,0,255}),Line(points={{-50,-45},
              {-50,-55}}, color={0,0,255}),Line(points={{-55,-50},{-45,-50}},
              color={0,0,255}),Polygon(
                points={{120,3},{110,0},{120,-3},{120,3}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Line(points={{111,0},{136,0}}, color={0,
              0,0}),Text(
                extent={{114,2},{131,17}},
                lineColor={0,0,0},
                textString="i2"),Line(
                points={{-100,-35},{-100,23},{-100,24}},
                color={160,160,164},
                arrow={Arrow.None,Arrow.Filled}),Text(
                extent={{-97,-16},{-74,4}},
                lineColor={160,160,164},
                textString="vin")}));
    end OpAmpDetailed;

    model VariableResistor
      "Ideal linear electrical resistor with variable resistance"
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=T_ref);
      Modelica_SIunits.Resistance R_actual
        "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";
      Modelica_Blocks_Interfaces.RealInput R(unit="Ohm") annotation (Placement(
            transformation(
            origin={0,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      R_actual = R*(1 + alpha*(T_heatPort - T_ref));
      v = R_actual*i;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The linear resistor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i*R = v</b></i>
<br>The Resistance <i>R</i> is given as input signal.
<br><br><b>Attention!!!</b><br>It is recommended that the R signal should not cross the zero value. Otherwise depending on the surrounding circuit the probability of singularities is high.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,30}}, color={0,0,255}),
            Text(
              extent={{-148,-41},{152,-81}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,0},{-70,0}},
              color={0,0,255}),Line(points={{0,90},{0,30}}, color={0,0,255}),Line(
              points={{70,0},{96,0}}, color={0,0,255})}));
    end VariableResistor;

    model VariableConductor
      "Ideal linear electrical conductor with variable conductance"
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of conductance (G_actual = G/(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=T_ref);
      Modelica_SIunits.Conductance G_actual
        "Actual conductance = G/(1 + alpha*(T_heatPort - T_ref))";
      Modelica_Blocks_Interfaces.RealInput G(unit="S") annotation (Placement(
            transformation(
            origin={0,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      G_actual = G/(1 + alpha*(T_heatPort - T_ref));
      i = G_actual*v;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The linear conductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i = G*v</b></i>
<br>The Conductance <i>G</i> is given as input signal.
<br><br><b>Attention!!!</b>
<br>It is recommended that the G signal should not cross the zero value. Otherwise depending on the surrounding circuit the probability of singularities is high.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of conductance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,30}}, color={0,0,255}),
            Text(
              extent={{-148,-41},{152,-81}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,90},{0,30}}, color={0,0,255}),
              Line(points={{-96,0},{-70,0}}, color={0,0,255}),Line(points={{70,0},
              {96,0}}, color={0,0,255}),Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
    end VariableConductor;

    model VariableCapacitor
      "Ideal linear electrical capacitor with variable capacitance"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      Modelica_Blocks_Interfaces.RealInput C(unit="F") annotation (Placement(
            transformation(
            origin={0,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      parameter Modelica_SIunits.Capacitance Cmin=Modelica_Constants.eps
        "lower bound for variable capacitance";
      Modelica_SIunits.ElectricCharge Q;
      parameter Modelica_SIunits.Voltage IC=0 "Initial Value";
      parameter Boolean UIC=false;
    initial equation
      if UIC then
        v = IC;
      end if;
    equation
      assert(C >= 0, "Capacitance C (= " + String(C) + ") has to be >= 0!");
      // protect solver from index change
      Q = noEvent(max(C, Cmin))*v;
      i = der(Q);
      annotation (
        Documentation(info="<html>
<p>The linear capacitor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i = dQ/dt</b></i> with <i><b>Q = C * v</b></i>.
<br>The capacitance <i>C</i> is given as input signal.
It is required that C &ge; 0, otherwise an assertion is raised. To avoid a variable index system,
C = Cmin, if 0 &le; C &lt; Cmin, where Cmin is a parameter with default value Modelica.Constants.eps.</p>
<p><br/>Besides the Cmin parameter the capacitor model has got the two parameters IC and UIC that belong together. With the IC parameter the user can specify an initial value of the voltage over the capacitor, which is defined from positive pin p to negative pin n (v=p.v - n.v).</p>
<p><br/>Hence the capacitor is charged at the beginning of the simulation. The other parameter UIC is of type Boolean. If UIC is true, the simulation tool uses</p>
<p><br/>the IC value at the initial calculation by adding the equation v= IC. If UIC is false, the IC value can be used (but it does not need to!) to calculate the initial values in order to simplify the numerical algorithms of initial calculation.</p>
</html>",   revisions="<html>
<ul>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}),graphics={
            Line(points={{-90,0},{-6,0}}, color={0,0,255}),
            Line(points={{6,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,30}}, color={0,0,255}),
            Line(points={{-6,28},{-6,-28}}, color={0,0,255}),
            Line(points={{6,28},{6,-28}}, color={0,0,255}),
            Text(
              extent={{-144,-43},{156,-83}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,0},{-14,0}}, color={0,0,
              255}),Line(points={{14,0},{96,0}}, color={0,0,255}),Line(points={{0,
              90},{0,30}}, color={0,0,255}),Line(
                points={{-14,28},{-14,-28}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{14,28},{14,-28}},
                thickness=0.5,
                color={0,0,255})}));
    end VariableCapacitor;

    model VariableInductor
      "Ideal linear electrical inductor with variable inductance"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      Modelica_Blocks_Interfaces.RealInput L(unit="H") annotation (Placement(
            transformation(
            origin={0,108},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica_SIunits.MagneticFlux Psi;
      parameter Modelica_SIunits.Inductance Lmin=Modelica_Constants.eps
        "lower bound for variable inductance";
      parameter Modelica_SIunits.Current IC=0 "Initial Value";
      parameter Boolean UIC=false;
    initial equation
      if UIC then
        i = IC;
      end if;
    equation
      assert(L >= 0, "Inductance L_ (= " + String(L) + ") has to be >= 0!");
      // protect solver from index change
      Psi = noEvent(max(L, Lmin))*i;
      v = der(Psi);
      annotation (
        Documentation(info="<html>
<p>The linear inductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>v = d Psi/dt </b></i>with <i><b>Psi = L * i </b></i>.
<br>The inductance <i>L</i> is as input signal.
It is required that L &ge; 0, otherwise an assertion is raised. To avoid a variable index system, L = Lmin, if 0 &le; L &lt; Lmin, where Lmin is a parameter with default value Modelica.Constants.eps.</p>
<p>Besides the Lmin parameter the inductor model has got the two parameters IC and UIC that belong together. With the IC parameter the user can specify an initial value of the current that flows through the inductor.</p>
<p><br/>Hence the inductor has an initial current at the beginning of the simulation. The other parameter UIC is of type Boolean. If UIC is true, the simulation tool uses</p>
<p><br/>the IC value at the initial calculation by adding the equation i= IC. If UIC is false, the IC value can be used (but it does not need to!) to calculate the initial values in order to simplify the numerical algorithms of initial calculation.</p>
</html>",   revisions="<html>
<ul>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}),graphics={
            Line(points={{-90,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,8}}, color={0,0,255}),
            Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
            Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-60,-30},{60,0}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-146,-47},{154,-87}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,0},{-60,0}}, color={0,0,
              255}),Line(points={{0,90},{0,8}}, color={0,0,255}),Ellipse(extent={
              {-60,-15},{-30,15}}, lineColor={0,0,255}),Ellipse(extent={{-30,-15},
              {0,15}}, lineColor={0,0,255}),Ellipse(extent={{0,-15},{30,15}},
              lineColor={0,0,255}),Ellipse(extent={{30,-15},{60,15}}, lineColor={
              0,0,255}),Rectangle(
                extent={{-60,-30},{62,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{60,0},{96,0}}, color=
               {0,0,255})}));
    end VariableInductor;

    model Potentiometer "Adjustable resistor"
      parameter Modelica_SIunits.Resistance R(start=1)
        "Resistance at temperature T_ref";
      parameter Modelica_SIunits.Temperature T_ref=293.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=T_ref);
      parameter Boolean useRinput=false "use input for 0<r<1 (else constant)"
        annotation (
        Evaluate=true,
        HideResult=true,
        Dialog(group="potentiometer"));
      parameter Real rConstant(
        final min=0,
        final max=1) = 0.5 "Contact between n (r=0) and p (r=1)"
        annotation (Dialog(group="potentiometer", enable=not useRinput));
      Modelica_SIunits.Resistance Rp
        "Actual resistance between pin_p and contact";
      Modelica_SIunits.Resistance Rn
        "Actual resistance between contact and pin_n";
      Modelica_Electrical_Analog_Interfaces.PositivePin pin_p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica_Electrical_Analog_Interfaces.PositivePin contact annotation (
          Placement(transformation(extent={{90,-110},{110,-90}}),
            iconTransformation(extent={{90,-110},{110,-90}})));
      Modelica_Electrical_Analog_Interfaces.NegativePin pin_n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica_Blocks_Interfaces.RealInput r if useRinput annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-100,-110})));
    protected
      Modelica_Blocks.Sources.Constant rConst(final k=rConstant) if not useRinput
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-90,-50})));
      Modelica_Blocks_Interfaces.RealInput rInt
        annotation (Placement(transformation(extent={{-84,-84},{-76,-76}})));
    equation
      pin_p.i + pin_n.i + contact.i = 0;
      Rp = R*(1 + alpha*(T_heatPort - T_ref))*(1 - min(1, max(0, rInt)));
      Rn = R*(1 + alpha*(T_heatPort - T_ref))*min(1, max(0, rInt));
      pin_p.v - contact.v = Rp*pin_p.i;
      pin_n.v - contact.v = Rn*pin_n.i;
      LossPower = (pin_p.v - contact.v)*pin_p.i + (pin_n.v - contact.v)*pin_n.i;
      connect(rInt, r) annotation (Line(
          points={{-80,-80},{-100,-80},{-100,-110}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rInt, rConst.y) annotation (Line(
          points={{-80,-80},{-90,-80},{-90,-61}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Text(
              extent={{-100,80},{100,60}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-90,0},{-70,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{70,0},{90,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-30}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Line(
              points={{0,40},{0,-40},{100,-80},{100,-90}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              visible=useRinput,
              points={{-100,-90},{-100,-80},{0,-40}},
              color={0,0,255},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Line(
              visible=useHeatPort,
              points={{0,-90},{0,-40}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Polygon(
              points={{0,-30},{-4,-40},{4,-40},{0,-30}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
                       <p>This models a potentiometer where the sliding contact is placed  between pin_n (r = 0) and pin_p (r = 1), dependent on either the parameter rConstant or the signal input r. </p>
                       <p>The total resistance R is temperature dependent.</p>
                       </html>"));
    end Potentiometer;
    annotation (Documentation(info="<html>
<p>This package contains very basic analog electrical components such as resistor, conductor, condensator, inductor, and the ground (which is needed in each electrical circuit description. Furthermore, controlled sources, coupling components, and some improved (but nevertheless basic) are in this package.</p>
</html>",   revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
</dd>
</dl>
</html>"),   Icon(graphics={
          Line(points={{-12,60},{-12,-60}}, color={0,0,0}),
          Line(points={{-80,0},{-12,0}}, color={0,0,0}),
          Line(points={{12,60},{12,-60}}, color={0,0,0}),
          Line(points={{12,0},{80,0}}, color={0,0,0})}));
  end Basic;

  package Ideal
    "Ideal electrical elements such as switches, diode, transformer, operational amplifier"

    extends Modelica_Icons.Package;

    model IdealDiode "Ideal diode"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Forward state-on differential resistance (closed diode resistance)";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Backward state-off conductance (opened diode conductance)";
      parameter Modelica_SIunits.Voltage Vknee(final min=0) = 0
        "Forward threshold voltage";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort;
      Boolean off(start=true) "Switching state";
    protected
      Real s(start=0, final unit="1")
        "Auxiliary variable for actual position on the ideal diode characteristic";
      /* s = 0: knee point
     s < 0: below knee point, diode conducting
     s > 0: above knee point, diode locking */
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      off = s < 0;
      v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
      i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;

      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<P>
This is an ideal switch which is<br><br>
<b>open </b>(off), if it is reversed biased (voltage drop less than 0)<br>
<b>closed</b> (on), if it is conducting (current > 0).<br>
<br/>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero conductance is not possible.
In order to prevent singularities during switching, the opened
diode has a small conductance <i>Gon</i> and the closed diode has a low
resistance <i>Roff</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Gon</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled.
</p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-156,101},{144,61}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,
              128,128}),Polygon(
                points={{70,4},{80,0},{70,-4},{70,4}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Line(points={{0,80},{0,-80}},
              color={128,128,128}),Polygon(
                points={{-4,70},{0,80},{4,70},{-4,70}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Text(
                extent={{10,80},{20,70}},
                lineColor={128,128,128},
                textString="i"),Text(
                extent={{70,-10},{80,-20}},
                lineColor={128,128,128},
                textString="v"),Line(
                points={{-80,-40},{-20,-10},{20,10},{40,70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{20,9},{20,0}},
                color={128,128,128},
                pattern=LinePattern.Dot),Text(
                extent={{20,0},{40,-10}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Vknee"),Text(
                extent={{20,70},{40,60}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Ron"),Text(
                extent={{-20,10},{0,0}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Goff"),Ellipse(
                extent={{18,12},{22,8}},
                pattern=LinePattern.Dot,
                lineColor={0,0,255})}));
    end IdealDiode;

    model IdealThyristor "Ideal thyristor"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed thyristor resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened thyristor conductance";
      parameter Modelica_SIunits.Voltage Vknee(final min=0) = 0
        "Forward threshold voltage";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Boolean off(start=true) "Switching state";
      Modelica_Blocks_Interfaces.BooleanInput fire annotation (Placement(
            transformation(
            origin={70,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s(final unit="1")
        "Auxiliary variable: if on then current, if opened then voltage";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      off = s < 0 or pre(off) and not fire;
      v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
      i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>This is an ideal thyristor model which is<br><br>
<b>open </b>(off), if the voltage drop is less than 0 or both the thyristor already open (off = true) and fire is false<br>
<b>closed</b> (not off), if both the voltage drop is greater or equal 0 and either the thyristor was already closed (off=false) or fire is true.
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero conductance is not possible.
In order to prevent singularities during switching, the opened
thyristor has a small conductance <i>Goff</i> and the closed thyristor has a low
resistance <i>Ron</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Goff</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Text(
              extent={{-150,-47},{150,-87}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Line(points={{30,20},{70,60},{70,90}}, color={0,0,255}),
            Line(points={{40,50},{60,30}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,
              128,128}),Polygon(
                points={{70,4},{80,0},{70,-4},{70,4}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Line(points={{0,80},{0,-80}},
              color={128,128,128}),Polygon(
                points={{-4,70},{0,80},{4,70},{-4,70}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Text(
                extent={{10,80},{20,70}},
                lineColor={128,128,128},
                textString="i"),Text(
                extent={{70,-10},{80,-20}},
                lineColor={128,128,128},
                textString="v"),Line(
                points={{-80,-40},{-20,-10},{20,10},{40,70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{20,9},{20,0}},
                color={128,128,128},
                pattern=LinePattern.Dot),Text(
                extent={{20,0},{40,-10}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Vknee"),Text(
                extent={{20,70},{40,60}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Ron"),Text(
                extent={{-20,10},{0,0}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Goff"),Ellipse(
                extent={{18,12},{22,8}},
                pattern=LinePattern.Dot,
                lineColor={0,0,255}),Line(
                points={{20,10},{70,40}},
                color={0,0,0},
                thickness=0.5)}));
    end IdealThyristor;

    model IdealGTOThyristor "Ideal GTO thyristor"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed thyristor resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened thyristor conductance";
      parameter Modelica_SIunits.Voltage Vknee(final min=0) = 0
        "Forward threshold voltage";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Boolean off(start=true) "Switching state";
      Modelica_Blocks_Interfaces.BooleanInput fire annotation (Placement(
            transformation(
            origin={70,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s(final unit="1")
        "Auxiliary variable: if on then current, if opened then voltage";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      off = s < 0 or not fire;
      v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
      i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>This is an ideal GTO thyristor model which is<br><br>
<b>open </b>(off), if the voltage drop is less than 0 or fire is false<br>
<b>closed</b> (not off), if the voltage drop is greater or equal 0  and fire is true.
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero conductance is not possible.
In order to prevent singularities during switching, the opened
thyristor has a small conductance <i>Goff</i> and the closed thyristor has a low
resistance <i>Ron</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Goff</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Line(points={{30,10},{70,50},{70,90}}, color={0,0,255}),
            Line(points={{50,50},{70,30}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-149,-43},{151,-83}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              points={{30,22},{70,62}},
              color={0,0,255},
              smooth=Smooth.None),
            Polygon(
              points={{44,43},{44,36},{51,36},{44,43}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Polygon(
              points={{46,33},{53,33},{53,26},{46,33}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Text(
              extent={{0,62},{0,34}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="GTO")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,
              128,128}),Polygon(
                points={{70,4},{80,0},{70,-4},{70,4}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Line(points={{0,80},{0,-80}},
              color={128,128,128}),Polygon(
                points={{-4,70},{0,80},{4,70},{-4,70}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Text(
                extent={{10,80},{20,70}},
                lineColor={128,128,128},
                textString="i"),Text(
                extent={{70,-10},{80,-20}},
                lineColor={128,128,128},
                textString="v"),Line(
                points={{-80,-40},{-20,-10},{20,10},{40,70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{20,9},{20,0}},
                color={128,128,128},
                pattern=LinePattern.Dot),Text(
                extent={{20,0},{40,-10}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Vknee"),Text(
                extent={{20,70},{40,60}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Ron"),Text(
                extent={{-20,10},{0,0}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Goff"),Ellipse(
                extent={{18,12},{22,8}},
                pattern=LinePattern.Dot,
                lineColor={0,0,255}),Line(
                points={{20,10},{70,40}},
                color={0,0,0},
                thickness=0.5)}));
    end IdealGTOThyristor;

    model IdealCommutingSwitch "Ideal commuting switch"
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n2 annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n1 annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanInput control
        "true => p--n2 connected, false => p--n1 connected" annotation (Placement(
            transformation(
            origin={0,80},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s1(final unit="1");
      Real s2(final unit="1") "Auxiliary variables";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      0 = p.i + n2.i + n1.i;

      p.v - n1.v = (s1*unitCurrent)*(if (control) then 1 else Ron);
      n1.i = -(s1*unitVoltage)*(if (control) then Goff else 1);
      p.v - n2.v = (s2*unitCurrent)*(if (control) then Ron else 1);
      n2.i = -(s2*unitVoltage)*(if (control) then 1 else Goff);
      LossPower = p.i*p.v + n1.i*n1.v + n2.i*n2.v;
      annotation (
        Documentation(info="<HTML>
<P>
The commuting switch has a positive pin p and two negative pins n1 and n2.
The switching behaviour is controlled
by the input signal control. If control is true, the pin p is connected
with the negative pin n2. Otherwise, the pin p is connected to the negative pin n1.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Text(
              extent={{-80,0},{-60,22}},
              textString="p",
              lineColor={0,0,255}),
            Text(
              extent={{60,50},{80,72}},
              textString="n1",
              lineColor={0,0,255}),
            Text(
              extent={{60,0},{80,22}},
              textString="n2",
              lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,50},{90,50}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-148,-22},{152,-62}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,50},
              {96,50}}, color={0,0,255}),Line(points={{0,60},{0,25}}, color={0,0,
              255}),Line(points={{40,0},{96,0}}, color={0,0,255})}));
    end IdealCommutingSwitch;

    model IdealIntermediateSwitch "Ideal intermediate switch"
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog_Interfaces.PositivePin p1 annotation (
          Placement(transformation(extent={{-110,40},{-90,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin p2 annotation (
          Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n1 annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n2 annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanInput control
        "true => p1--n2, p2--n1 connected, otherwise p1--n1, p2--n2  connected"
        annotation (Placement(transformation(
            origin={0,80},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s1(final unit="1");
      Real s2(final unit="1");
      Real s3(final unit="1");
      Real s4(final unit="1") "Auxiliary variables";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      p1.v - n1.v = (s1*unitCurrent)*(if (control) then 1 else Ron);
      p2.v - n2.v = (s2*unitCurrent)*(if (control) then 1 else Ron);
      p1.v - n2.v = (s3*unitCurrent)*(if (control) then Ron else 1);
      p2.v - n1.v = (s4*unitCurrent)*(if (control) then Ron else 1);

      p1.i = if control then s1*unitVoltage*Goff + s3*unitCurrent else s1*
        unitCurrent + s3*unitVoltage*Goff;
      p2.i = if control then s2*unitVoltage*Goff + s4*unitCurrent else s2*
        unitCurrent + s4*unitVoltage*Goff;
      n1.i = if control then -s1*unitVoltage*Goff - s4*unitCurrent else -s1*
        unitCurrent - s4*unitVoltage*Goff;
      n2.i = if control then -s2*unitVoltage*Goff - s3*unitCurrent else -s2*
        unitCurrent - s3*unitVoltage*Goff;

      LossPower = p1.i*p1.v + p2.i*p2.v + n1.i*n1.v + n2.i*n2.v;
      annotation (
        Documentation(info="<html>
<p>The intermediate switch has four switching contact pins p1, p2, n1, and n2. The switching behaviour is controlled by the input signal control. If control is true, the pin p1 is connected to the pin n2, and the pin p2 is connected to the pin n1. Otherwise,if control is false, the pin p1 is connected to n1, and the pin p2 is connected to n2.</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/IdealIntermediateSwitch1.png\"
     alt=\"IdealIntermediateSwitch1.png\">
</p>

<p>In order to prevent singularities during switching, the opened switch has a (very low) conductance Goff and the closed switch has a (very low) resistance Ron.</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/IdealIntermediateSwitch2.png\"
     alt=\"IdealIntermediateSwitch2.png\">
</p>

<p>The limiting case is also allowed, i.e., the resistance Ron of the closed switch could be exactly zero and the conductance Goff of the open switch could be also exactly zero. Note, there are circuits, where a description with zero Ron or zero Goff is not possible. </p>
<p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled. The parameters are not temperature dependent. </p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-4,30},{4,22}}, lineColor={0,0,255}),
            Text(
              extent={{-80,50},{-60,72}},
              textString="p1",
              lineColor={0,0,255}),
            Text(
              extent={{-80,0},{-60,22}},
              textString="p2",
              lineColor={0,0,255}),
            Text(
              extent={{60,50},{80,72}},
              textString="n1",
              lineColor={0,0,255}),
            Text(
              extent={{60,0},{80,22}},
              textString="n2",
              lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-90,50},{-44,50}}, color={0,0,255}),
            Line(points={{-44,0},{40,50}}, color={0,0,255}),
            Line(points={{-44,50},{40,0}}, color={0,0,255}),
            Line(points={{40,50},{90,50}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-151,-24},{149,-64}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-4,29},{4,21}}, lineColor=
              {0,0,255}),Line(points={{-96,0},{-40,0}}, color={0,0,255}),Line(
              points={{-96,50},{-40,50}}, color={0,0,255}),Line(points={{-40,0},{
              40,50}}, color={0,0,255}),Line(points={{-40,50},{40,0}}, color={0,0,
              255}),Line(points={{40,50},{96,50}}, color={0,0,255}),Line(points={
              {0,60},{0,25}}, color={0,0,255}),Line(points={{40,0},{96,0}}, color=
               {0,0,255})}));
    end IdealIntermediateSwitch;

    model ControlledIdealCommutingSwitch "Controlled ideal commuting switch"
      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n2 annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n1 annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin control
        "Control pin: if control.v > level p--n2 connected, otherwise p--n1 connected"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    protected
      Real s1(final unit="1");
      Real s2(final unit="1") "Auxiliary variables";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      control.i = 0;
      0 = p.i + n2.i + n1.i;

      p.v - n1.v = (s1*unitCurrent)*(if (control.v > level) then 1 else Ron);
      n1.i = -(s1*unitVoltage)*(if (control.v > level) then Goff else 1);
      p.v - n2.v = (s2*unitCurrent)*(if (control.v > level) then Ron else 1);
      n2.i = -(s2*unitVoltage)*(if (control.v > level) then 1 else Goff);
      LossPower = p.i*p.v + n1.i*n1.v + n2.i*n2.v;
      annotation (
        Documentation(info="<HTML>
<P>
The commuting switch has a positive pin p and two negative pins n1 and n2.
The switching behaviour is controlled
by the control pin. If its voltage exceeds the value of the parameter level,
the pin p is connected with the negative pin n2. Otherwise, the pin p is
connected the negative pin n1.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Text(
              extent={{-80,0},{-60,22}},
              textString="p",
              lineColor={0,0,255}),
            Text(
              extent={{60,50},{80,72}},
              textString="n1",
              lineColor={0,0,255}),
            Text(
              extent={{60,0},{80,22}},
              textString="n2",
              lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,50},{90,50}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-99},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-145,-21},{155,-61}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,50},
              {96,50}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255}),Line(points={{40,0},{96,0}}, color={0,0,255})}));
    end ControlledIdealCommutingSwitch;

    model ControlledIdealIntermediateSwitch
      "Controlled ideal intermediate switch"
      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog_Interfaces.PositivePin p1 annotation (
          Placement(transformation(extent={{-110,40},{-90,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin p2 annotation (
          Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n1 annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n2 annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin control "Control pin: if control.v > level p1--n2, p2--n1 connected,
         otherwise p1--n1, p2--n2  connected" annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    protected
      Real s1(final unit="1");
      Real s2(final unit="1");
      Real s3(final unit="1");
      Real s4(final unit="1") "Auxiliary variables";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      control.i = 0;

      p1.v - n1.v = (s1*unitCurrent)*(if (control.v > level) then 1 else Ron);
      p2.v - n2.v = (s2*unitCurrent)*(if (control.v > level) then 1 else Ron);
      p1.v - n2.v = (s3*unitCurrent)*(if (control.v > level) then Ron else 1);
      p2.v - n1.v = (s4*unitCurrent)*(if (control.v > level) then Ron else 1);

      p1.i = if control.v > level then s1*unitVoltage*Goff + s3*unitCurrent else
        s1*unitCurrent + s3*unitVoltage*Goff;
      p2.i = if control.v > level then s2*unitVoltage*Goff + s4*unitCurrent else
        s2*unitCurrent + s4*unitVoltage*Goff;
      n1.i = if control.v > level then -s1*unitVoltage*Goff - s4*unitCurrent
         else -s1*unitCurrent - s4*unitVoltage*Goff;
      n2.i = if control.v > level then -s2*unitVoltage*Goff - s3*unitCurrent
         else -s2*unitCurrent - s3*unitVoltage*Goff;

      LossPower = p1.i*p1.v + p2.i*p2.v + n1.i*n1.v + n2.i*n2.v;
      annotation (
        Documentation(info="<html>
<p>The intermediate switch has four switching contact pins p1, p2, n1, and n2. The switching behaviour is controlled by the control pin. If its voltage exceeds the value of the parameter level, the pin p1 is connected to pin n2, and the pin p2 is connected to the pin n1. Otherwise, the pin p1 is connected to the pin n1, and the pin p2 is connected to the pin n2.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/ControlledIdealIntermediateSwitch1.png\"
     alt=\"ControlledIdealIntermediateSwitch1.png\">
</p>

<p>
In order to prevent singularities during switching, the opened switch has a (very low) conductance Goff and the closed switch has a (very low) resistance Ron.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/ControlledIdealIntermediateSwitch2.png\"
     alt=\"ControlledIdealIntermediateSwitch2.png\">
</p>

<p>
The limiting case is also allowed, i.e., the resistance Ron of the closed switch could be exactly zero and the conductance Goff of the open switch could be also exactly zero. Note, there are circuits, where a description with zero Ron or zero Goff is not possible. </p>
<p><br><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled. The parameters are not temperature dependent. </p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-4,30},{4,22}}, lineColor={0,0,255}),
            Text(
              extent={{-80,50},{-60,72}},
              textString="p1",
              lineColor={0,0,255}),
            Text(
              extent={{-80,0},{-60,22}},
              textString="p2",
              lineColor={0,0,255}),
            Text(
              extent={{60,50},{80,72}},
              textString="n1",
              lineColor={0,0,255}),
            Text(
              extent={{60,0},{80,22}},
              textString="n2",
              lineColor={0,0,255}),
            Line(points={{-90,0},{-40,0}}, color={0,0,255}),
            Line(points={{-90,50},{-39,50}}, color={0,0,255}),
            Line(points={{-40,0},{40,50}}, color={0,0,255}),
            Line(points={{-40,50},{40,0}}, color={0,0,255}),
            Line(points={{40,50},{90,50}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,22}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-150,-23},{150,-63}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-4,29},{4,21}}, lineColor=
              {0,0,255}),Line(points={{-96,0},{-40,0}}, color={0,0,255}),Line(
              points={{-96,50},{-40,50}}, color={0,0,255}),Line(points={{-40,0},{
              40,50}}, color={0,0,255}),Line(points={{-40,50},{40,0}}, color={0,0,
              255}),Line(points={{40,50},{96,50}}, color={0,0,255}),Line(points={
              {0,96},{0,25}}, color={0,0,255}),Line(points={{40,0},{96,0}}, color=
               {0,0,255})}));
    end ControlledIdealIntermediateSwitch;

    model IdealOpAmp "Ideal operational amplifier (norator-nullator pair)"
      Modelica_SIunits.Voltage v1 "Voltage drop over the left port";
      Modelica_SIunits.Voltage v2 "Voltage drop over the right port";
      Modelica_SIunits.Current i1
        "Current flowing from pos. to neg. pin of the left port";
      Modelica_SIunits.Current i2
        "Current flowing from pos. to neg. pin of the right port";
      Modelica_Electrical_Analog_Interfaces.PositivePin p1
        "Positive pin of the left port" annotation (Placement(transformation(
              extent={{-110,-60},{-90,-40}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n1
        "Negative pin of the left port" annotation (Placement(transformation(
              extent={{-110,40},{-90,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin p2
        "Positive pin of the right port" annotation (Placement(transformation(
              extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n2
        "Negative pin of the right port" annotation (Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=270)));
    equation
      v1 = p1.v - n1.v;
      v2 = p2.v - n2.v;
      0 = p1.i + n1.i;
      0 = p2.i + n2.i;
      i1 = p1.i;
      i2 = p2.i;
      v1 = 0;
      i1 = 0;
      annotation (
        Documentation(info="<html>
<P>
The ideal OpAmp is a two-port. The left port is fixed to <i>v1=0</i> and <i>i1=0</i>
(nullator). At the right port both any voltage <i>v2</i> and any current <i>i2</i>
are possible (norator).
</P>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-35},{0,-91}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-150,126},{150,86}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{60,0},{-60,70},{-60,-70},{60,0}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{-96,50},{-60,50}}, color={0,0,
              255}),Line(points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(
              points={{60,0},{96,0}}, color={0,0,255}),Line(points={{0,-35},{0,-96}},
              color={0,0,255}),Line(points={{-55,50},{-45,50}}, color={0,0,255}),
              Line(points={{-50,-45},{-50,-55}}, color={0,0,255}),Line(points={{-55,
              -50},{-45,-50}}, color={0,0,255}),Text(
                extent={{-111,-39},{-90,-19}},
                lineColor={160,160,164},
                textString="p1.i=0"),Polygon(
                points={{120,3},{110,0},{120,-3},{120,3}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Line(points={{111,0},{136,0}}, color={0,
              0,0}),Text(
                extent={{118,2},{135,17}},
                lineColor={0,0,0},
                textString="i2"),Text(
                extent={{-111,60},{-90,80}},
                lineColor={160,160,164},
                textString="n1.i=0"),Line(points={{18,-111},{18,-86}}, color={160,
              160,164}),Polygon(
                points={{21,-101},{18,-111},{15,-101},{21,-101}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Text(
                extent={{22,-100},{39,-85}},
                lineColor={0,0,0},
                textString="i2")}));
    end IdealOpAmp;

    model IdealOpAmp3Pin
      "Ideal operational amplifier (norator-nullator pair), but 3 pins"
      Modelica_Electrical_Analog_Interfaces.PositivePin in_p
        "Positive pin of the input port" annotation (Placement(transformation(
              extent={{-110,-60},{-90,-40}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin in_n
        "Negative pin of the input port" annotation (Placement(transformation(
              extent={{-110,40},{-90,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin out "Output pin"
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
    equation
      in_p.v = in_n.v;
      in_p.i = 0;
      in_n.i = 0;
      annotation (
        Documentation(info="<html>
<P>
The ideal OpAmp with three pins is of exactly the same behaviour as the ideal
OpAmp with four pins. Only the negative output pin is left out.
Both the input voltage and current are fixed to zero (nullator).
At the output pin both any voltage <i>v2</i> and any current <i>i2</i>
are possible.
</P>
</html>",   revisions="<html>
<ul>
<li><i> 2002   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-149,117},{151,77}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{60,0},{-60,70},{-60,-70},{60,0}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{-96,50},{-60,50}}, color={0,0,
              255}),Line(points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(
              points={{60,0},{97,0}}, color={0,0,255}),Line(points={{-55,50},{-45,
              50}}, color={0,0,255}),Line(points={{-50,-45},{-50,-55}}, color={0,
              0,255}),Line(points={{-55,-50},{-45,-50}}, color={0,0,255}),Text(
                extent={{-111,-39},{-90,-19}},
                lineColor={160,160,164},
                textString="p1.i=0"),Polygon(
                points={{120,3},{110,0},{120,-3},{120,3}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Line(points={{111,0},{136,0}}, color={0,
              0,0}),Text(
                extent={{118,2},{135,17}},
                lineColor={0,0,0},
                textString="i2"),Text(
                extent={{-111,60},{-90,80}},
                lineColor={160,160,164},
                textString="n1.i=0")}));
    end IdealOpAmp3Pin;

    model IdealOpAmpLimited "Ideal operational amplifier with limitation"
      Modelica_Electrical_Analog_Interfaces.PositivePin in_p
        "Positive pin of the input port" annotation (Placement(transformation(
              extent={{-110,-60},{-90,-40}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin in_n
        "Negative pin of the input port" annotation (Placement(transformation(
              extent={{-110,40},{-90,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin out "Output pin"
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin VMax
        "Positive output voltage limitation" annotation (Placement(
            transformation(extent={{-10,60},{10,80}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin VMin
        "Negative output voltage limitation" annotation (Placement(
            transformation(extent={{-10,-80},{10,-60}}, rotation=0)));
      Modelica_SIunits.Voltage vin "input voltage";
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);

    equation
      in_p.i = 0;
      in_n.i = 0;
      VMax.i = 0;
      VMin.i = 0;
      vin = in_p.v - in_n.v;
      in_p.v - in_n.v = unitVoltage*smooth(0, (if s < -1 then s + 1 else if s > 1
         then s - 1 else 0));
      out.v = smooth(0, if s < -1 then VMin.v else if s > 1 then VMax.v else (
        VMax.v - VMin.v)*s/2 + (VMax.v + VMin.v)/2);
      annotation (
        Documentation(info="<HTML>
<P>
The ideal OpAmp with limitation behaves like an ideal OpAmp without limitation,
if the output voltage is within the limits VMin and VMax. In this case
the input voltage vin = in_p.v - in_n.v is zero.
If the input voltage vin less than 0, the output voltage is out.v = VMin.
If the input voltage is vin larger than 0, the output voltage is out.v = VMax.
</P>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-45,-10},{-10,-10},{-10,10},{20,10}}, color={0,0,255}),
            Line(points={{0,35},{0,80}}, color={0,0,255}),
            Line(points={{0,-35},{0,-80}}, color={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-152,135},{148,95}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-45,-10},{-10,-10},{-10,10},{20,10}}, color={0,0,255}),
            Line(points={{0,35},{0,80}}, color={0,0,255}),
            Line(points={{0,-35},{0,-80}}, color={0,0,255}),
            Line(points={{-96,50},{-60,50}}, color={0,0,255}),
            Line(points={{-96,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{96,0}}, color={0,0,255}),
            Line(points={{-55,50},{-45,50}}, color={0,0,255}),
            Line(points={{-50,-45},{-50,-55}}, color={0,0,255}),
            Line(points={{-55,-50},{-45,-50}}, color={0,0,255}),
            Text(
              extent={{-111,-39},{-90,-19}},
              lineColor={160,160,164},
              textString="p1.i=0"),
            Polygon(
              points={{120,3},{110,0},{120,-3},{120,3}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={160,160,164}),
            Line(points={{111,0},{136,0}}, color={0,0,0}),
            Text(
              extent={{118,2},{135,17}},
              lineColor={0,0,0},
              textString="i2"),
            Text(
              extent={{-111,60},{-90,80}},
              lineColor={160,160,164},
              textString="n1.i=0")}));
    end IdealOpAmpLimited;

    model IdealizedOpAmpLimted
      "Idealized operational amplifier with limitation"
      parameter Real V0=15000.0 "No-load amplification";
      parameter Boolean useSupply=false
        "Use supply pins (otherwise constant supply" annotation (Evaluate=true);
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply voltage"
        annotation (Dialog(enable=not useSupply));
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply voltage"
        annotation (Dialog(enable=not useSupply));
      Modelica_SIunits.Voltage vps "Positive supply voltage";
      Modelica_SIunits.Voltage vns "Negative supply voltage";
      Modelica_SIunits.Voltage v_in=in_p.v - in_n.v "Input voltage difference";
      Modelica_SIunits.Voltage v_out=out.v "Ouput voltage to ground";
      Modelica_SIunits.Power p_in=in_p.v*in_p.i + in_n.v*in_n.i "Input power";
      Modelica_SIunits.Power p_out=out.v*out.i "Output power";
      Modelica_SIunits.Power p_s=-(p_in + p_out) "Supply power";
      Modelica_SIunits.Current i_s=p_s/(vps - vns) "Supply current";
      Modelica_Electrical_Analog_Interfaces.PositivePin in_p
        "Positive pin of the input port" annotation (Placement(transformation(
              extent={{-90,-70},{-110,-50}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin in_n
        "Negative pin of the input port" annotation (Placement(transformation(
              extent={{-110,50},{-90,70}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin out
        "Pin of the output port" annotation (Placement(transformation(extent={{
                110,-10},{90,10}}, rotation=0), iconTransformation(extent={{110,
                -10},{90,10}})));
      //optional supply pins
      Modelica_Electrical_Analog_Interfaces.PositivePin s_p(final i=+i_s,
          final v=vps) if useSupply "Optional positive supply pin" annotation (
          Placement(transformation(extent={{10,90},{-10,110}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin s_n(final i=-i_s,
          final v=vns) if useSupply "Optional negative supply pin" annotation (
          Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
    equation
      if not useSupply then
        vps = Vps;
        vns = Vns;
      end if;
      in_p.i = 0;
      in_n.i = 0;
      v_out = smooth(0, min(Vps, max(Vns, V0*v_in)));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,60},{-60,60}}, color={0,0,255}),
            Line(points={{-90,-60},{-60,-60}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-100,100},{100,80}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>Idealized operational amplifier with saturation: </p>
<ul>
<li>Input currents are zero. </li>
<li>No-load amplification is high (but not infinite). </li>
<li>Output voltage is limited between positive and negative supply. </li>
</ul>
<p>Supply voltage is either defined by parameter Vps and Vpn or by (optional) pins s_p and s_n. </p>
<p>In the first case the necessary power is drwan from an implicit internal supply, in the second case from the external supply.</p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics));
    end IdealizedOpAmpLimted;

    model IdealTransformer
      "Ideal transformer core with or without magnetization"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Real n(start=1) "Turns ratio primary:secondary voltage";
      parameter Boolean considerMagnetization=false
        "Choice of considering magnetization";
      parameter Modelica_SIunits.Inductance Lm1(start=1)
        "Magnetization inductance w.r.t. primary side"
        annotation (Dialog(enable=considerMagnetization));
    protected
      Modelica_SIunits.Current im1 "Magnetization current w.r.t. primary side";
      Modelica_SIunits.MagneticFlux psim1 "Magnetic flux w.r.t. primary side";
    equation
      im1 = i1 + i2/n;
      if considerMagnetization then
        psim1 = Lm1*im1;
        v1 = der(psim1);
      else
        psim1 = 0;
        im1 = 0;
      end if;
      v1 = n*v2;
      annotation (
        Documentation(info="<html>
<p>
The ideal transformer is a two-port circuit element;
in case of Boolean parameter <code>considerMagnetization = false</code> it is characterized by the following equations:
</p>
<pre> i2 = -i1*n;
 v2 =  v1/n;
</pre>
<p>
where <code>n</code> is a real number called the turns ratio.
Due to this equations, also DC voltages and currents are transformed - which is not the case for technical transformers.
</p>
<p>
In case of Boolean parameter <code>considerMagnetization = true</code> it is characterized by the following equations:
</p>
<pre>
 im1  = i1 + i2/n \"Magnetizing current w.r.t. primary side\";
 psim1= Lm1*im1   \"Magnetic flux w.r.t. primary side\";
 v1 = der(psim1)  \"Primary voltage\";
 v2 = v1/n        \"Secondary voltage\";
</pre>
<p>
where <code>Lm</code> denotes the magnetizing inductance.
Due to this equations, the DC offset of secondary voltages and currents decrement according to the time constant defined by the connected circuit.
</p>
<p>
Taking primary <code>L1sigma</code> and secondary <code>L2ssigma</code> leakage inductances into account,
compared with the <a href=\"modelica://Modelica.Electrical.Analog.Basic.Transformer\">basic transformer</a>
the following parameter conversion can be applied (which leads to identical results):
</p>
<pre>
 L1 = L1sigma + M*n \"Primary inductance at secondary no-load\";
 L2 = L2sigma + M/n \"Secondary inductance at primary no-load\";
  M  = Lm1/n         \"Mutual inductance\";
</pre>
<p>
For the backward conversion, one has to decide about the partitioning of the leakage to primary and secondary side.
</p>
</html>",   revisions="<html>
<ul>
<li><i>June 3, 2009   </i>
       magnetisation current added by Anton Haumer<br>
       </li>
<li><i>1998   </i>
       initially implemented by Christoph Clauss<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-45,-50},{-20,-25}}),
            Ellipse(extent={{-45,-25},{-20,0}}),
            Ellipse(extent={{-45,0},{-20,25}}),
            Ellipse(extent={{-45,25},{-20,50}}),
            Rectangle(
              extent={{-72,-60},{-33,60}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,50},{-32,50}}),
            Line(points={{-90,-50},{-32,-50}}),
            Ellipse(extent={{20,-50},{45,-25}}),
            Ellipse(extent={{20,-25},{45,0}}),
            Ellipse(extent={{20,0},{45,25}}),
            Ellipse(extent={{20,25},{45,50}}),
            Rectangle(
              extent={{33,-60},{72,60}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{32,50},{90,50}}),
            Line(points={{32,-50},{90,-50}}),
            Text(extent={{-100,-80},{100,-100}}, textString="n=%n"),
            Text(
              extent={{-100,10},{-80,-10}},
              lineColor={0,0,255},
              textString="1"),
            Text(
              extent={{80,10},{100,-10}},
              lineColor={0,0,255},
              textString="2"),
            Text(
              extent={{-146,115},{154,75}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(graphics={Text(
                extent={{-100,10},{0,-10}},
                lineColor={0,0,255},
                textString="1=primary"),Text(
                extent={{0,10},{100,-10}},
                lineColor={0,0,255},
                textString="2=secondary")}));
    end IdealTransformer;

    model IdealGyrator "Ideal gyrator"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Modelica_SIunits.Conductance G(start=1) "Gyration conductance";

    equation
      i1 = G*v2;
      i2 = -G*v1;
      annotation (
        Documentation(info="<html>
<p>
A gyrator is an ideal two-port element defined by the following equations:
<br><br>
<code>
    i1 =  G * v2<br>
    i2 = -G * v1<br>
</code>
<br>
where the constant <i>G</i> is called the gyration conductance.
</P>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-70,-30},{-10,30}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-80,-40},{-41,40}},
              lineColor={255,255,255},
              pattern=LinePattern.Solid,
              lineThickness=0.25,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,50},{-40,50},{-40,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{-30,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,63},{30,60},{20,57},{20,63}},
              pattern=LinePattern.Solid,
              lineThickness=0.25,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Ellipse(extent={{10,-30},{70,30}}, lineColor={0,0,255}),
            Rectangle(
              extent={{80,-40},{40,40}},
              lineColor={255,255,255},
              pattern=LinePattern.Solid,
              lineThickness=0.25,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{90,50},{40,50},{40,-50},{90,-50}}, color={0,0,255}),
            Text(
              extent={{-152,116},{148,76}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-70,-30},{-10,30}},
              lineColor={0,0,255}),Rectangle(
                extent={{-80,-40},{-41,40}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,50},{-40,50},{-40,
              -50},{-96,-50}}, color={0,0,255}),Line(points={{-30,60},{20,60}},
              color={0,0,255}),Polygon(
                points={{20,63},{30,60},{20,57},{20,63}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Ellipse(extent={{10,-30},{70,30}}, lineColor=
               {0,0,255}),Rectangle(
                extent={{80,-40},{40,40}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{96,50},{40,50},{40,-50},
              {96,-50}}, color={0,0,255})}));
    end IdealGyrator;

    model Idle "Idle branch"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
    equation
      i = 0;
      annotation (
        Documentation(info="<html>
<p>The model Idle is a simple idle running branch. That means between both pins no current is running. This ideal device is of no influence on the circuit. Therefore, it can be neglected in each case. For purposes of completeness this component is part of the MSL, as an opposite of the short cut.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,0},{-41,0}}, color={0,0,255}),
            Line(points={{91,0},{40,0}}, color={0,0,255}),
            Text(
              extent={{-153,112},{147,72}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{-96,0},{-41,0}}, color={0,0,255}),
              Line(points={{96,0},{40,0}}, color={0,0,255})}));
    end Idle;

    model Short "Short cut branch"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
    equation
      v = 0;
      annotation (
        Documentation(info="<html>
<p>The model Short is a simple short cut branch. That means the voltage drop between both pins is zero. This device could be neglected if both pins are combined to one node. Besides connecting the nodes of both pins this device has no further function.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{91,0},{-90,0}}, color={0,0,255}),
            Text(
              extent={{-151,113},{149,73}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{96,0},{-96,0}}, color={0,0,255}),
              Text(
                extent={{-100,100},{100,70}},
                textString="Short",
                lineColor={0,0,255})}));
    end Short;

    model IdealOpeningSwitch "Ideal electrical opener"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Blocks_Interfaces.BooleanInput control
        "true => switch open, false => p--n connected" annotation (Placement(
            transformation(
            origin={0,70},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      v = (s*unitCurrent)*(if control then 1 else Ron);
      i = (s*unitVoltage)*(if control then Goff else 1);

      LossPower = v*i;
      annotation (
        Documentation(info="<HTML>
<P>
The ideal opening switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the input signal control.
If control is true, pin p is not connected
with negative pin n. Otherwise, pin p is connected
with negative pin n.<br><br>

In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,51},{0,26}}, color={0,0,255}),
            Line(points={{40,20},{40,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-151,-21},{149,-61}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Text(
                extent={{-100,-40},{100,-79}},
                textString="%name",
                lineColor={0,0,255}),Line(points={{0,51},{0,26}}, color={0,0,255}),
              Line(points={{40,20},{40,0}}, color={0,0,255})}));
    end IdealOpeningSwitch;

    model IdealClosingSwitch "Ideal electrical closer"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Blocks_Interfaces.BooleanInput control
        "true => p--n connected, false => switch open" annotation (Placement(
            transformation(
            origin={0,70},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      v = (s*unitCurrent)*(if control then Ron else 1);
      i = (s*unitVoltage)*(if control then 1 else Goff);

      LossPower = v*i;
      annotation (
        Documentation(info="<HTML>
<P>
The ideal closing switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by input signal control.
If control is true, pin p is connected
with negative pin n. Otherwise, pin p is not connected
with negative pin n.<br><br>

In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,51},{0,26}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-152,-28},{148,-68}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Text(
                extent={{-100,-40},{100,-79}},
                textString="%name",
                lineColor={0,0,255}),Line(points={{0,51},{0,26}}, color={0,0,255})}));
    end IdealClosingSwitch;

    model ControlledIdealOpeningSwitch "Controlled ideal electrical opener"

      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin control
        "Control pin: control.v > level switch open, otherwise p--n connected"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      control.i = 0;
      0 = p.i + n.i;
      p.v - n.v = (s*unitCurrent)*(if (control.v > level) then 1 else Ron);
      p.i = (s*unitVoltage)*(if (control.v > level) then Goff else 1);

      LossPower = (p.v - n.v)*p.i;
      annotation (
        Documentation(info="<HTML>
<P>
The ideal switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the control pin.
If its voltage exceeds the voltage of the parameter level,
pin p is not connected with negative pin n.
Otherwise, pin p is connected with negative pin n.<br><br>

In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,20},{40,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-150,-34},{150,-74}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255}),Line(points={{40,20},{40,0}}, color={0,0,255})}));
    end ControlledIdealOpeningSwitch;

    model ControlledIdealClosingSwitch "Controlled ideal electrical closer"

      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin control
        "Control pin: control.v > level switch closed, otherwise switch open"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      control.i = 0;
      0 = p.i + n.i;
      p.v - n.v = (s*unitCurrent)*(if (control.v > level) then Ron else 1);
      p.i = (s*unitVoltage)*(if (control.v > level) then 1 else Goff);

      LossPower = (p.v - n.v)*p.i;
      annotation (
        Documentation(info="<html>
<P>
The closing ideal switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the control pin.
If its voltage exceeds the voltage of the parameter level,
pin p is connected with negative pin n.
Otherwise, pin p is not connected with negative pin n.<br><br>

In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-149,-32},{151,-72}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255})}));
    end ControlledIdealClosingSwitch;

    model OpenerWithArc "Ideal opening switch with simple arc model"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron=1E-5 "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff=1E-5
        "Opened switch conductance";
      parameter Modelica_SIunits.Voltage V0(start=30) "Initial arc voltage";
      parameter Modelica_SIunits.VoltageSlope dVdt(start=10E3)
        "Arc voltage slope";
      parameter Modelica_SIunits.Voltage Vmax(start=60) "Max. arc voltage";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Blocks_Interfaces.BooleanInput control
        "false => p--n connected, true => switch open" annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=270)));

    protected
      Boolean off=control;
      Boolean on=not off;
      discrete Modelica_SIunits.Time tSwitch(start=-Modelica_Constants.inf);
      Boolean quenched(start=true, fixed=true);
    equation
      when edge(off) then
        tSwitch = time;
      end when;
      quenched = off and (abs(i) <= abs(v)*Goff or pre(quenched));
      if on then
        v = Ron*i;
      else
        if quenched then
          i = Goff*v;
        else
          v = min(Vmax, V0 + dVdt*(time - tSwitch))*sign(i);
        end if;
      end if;
      LossPower = v*i;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{40,50},{32,32},{48,28},{40,18}}, color={255,0,0}),
            Ellipse(extent={{-44,4},{-36,-4}}),
            Line(points={{-90,0},{-44,0}}),
            Line(points={{-37,2},{40,50}}),
            Line(points={{40,0},{90,0}}),
            Line(points={{0,90},{0,26}}, color={255,85,255}),
            Line(points={{40,18},{40,0}}),
            Text(
              extent={{-150,-35},{150,-75}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(graphics={Line(points={{-60,60},{-60,-60},{60,-60}}, color={0,0,
              255}),Line(points={{-60,-60},{-40,-60},{-40,-40},{-20,40},{40,40}},
              color={0,0,0}),Text(
                extent={{30,-60},{50,-70}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-60,60},{-20,50}},
                lineColor={0,0,0},
                textString="voltage"),Text(
                extent={{-60,-30},{-40,-40}},
                lineColor={0,0,0},
                textString="V0"),Text(
                extent={{-50,40},{-30,30}},
                lineColor={0,0,0},
                textString="Vmax"),Text(
                extent={{-40,10},{-20,0}},
                lineColor={0,0,0},
                textString="dVdt"),Polygon(
                points={{-60,60},{-62,52},{-58,52},{-60,60}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Polygon(
                points={{60,-60},{54,-58},{54,-62},{60,-60}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This model is an extension to the <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch\">IdealOpeningSwitch</a>.
</p>
<p>
The basic model interrupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the switch is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the Boolean input <code>control</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e., the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the Boolean input <code>control</code> signals to close the switch again, the switch is closed immediately,
i.e., the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
Please note: In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<ul>
<li><i>June, 2009   </i>
       by Christoph Clauss<br> adapted to OpenerWithArc<br>
       </li>
<li><i>May, 2009   </i>
       by Anton Haumer<br> CloserWithArc initially implemented<br>
       </li>
</ul>
</html>"));
    end OpenerWithArc;

    model CloserWithArc "Ideal closing switch with simple arc model"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron=1E-5 "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff=1E-5
        "Opened switch conductance";
      parameter Modelica_SIunits.Voltage V0(start=30) "Initial arc voltage";
      parameter Modelica_SIunits.VoltageSlope dVdt(start=10E3)
        "Arc voltage slope";
      parameter Modelica_SIunits.Voltage Vmax(start=60) "Max. arc voltage";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Blocks_Interfaces.BooleanInput control
        "true => p--n connected, false => switch open" annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=270)));

    protected
      Boolean on=control;
      Boolean off(start=false, fixed=true);
      discrete Modelica_SIunits.Time tSwitch(start=-Modelica_Constants.inf);
      Boolean quenched(start=true, fixed=true);
    equation
      off = not on;
      when edge(off) then
        tSwitch = time;
      end when;
      quenched = off and (abs(i) <= abs(v)*Goff or pre(quenched));
      if on then
        v = Ron*i;
      else
        if quenched then
          i = Goff*v;
        else
          v = min(Vmax, V0 + dVdt*(time - tSwitch))*sign(i);
        end if;
      end if;
      LossPower = v*i;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{40,50},{32,24},{48,28},{40,0}}, color={255,0,0}),
            Ellipse(extent={{-44,4},{-36,-4}}),
            Line(points={{-90,0},{-44,0}}),
            Line(points={{-37,2},{40,50}}),
            Line(points={{40,0},{90,0}}),
            Line(points={{0,90},{0,26}}, color={255,85,255}),
            Text(
              extent={{-152,-29},{148,-69}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(graphics={Line(points={{-60,60},{-60,-60},{60,-60}}, color={0,0,
              255}),Line(points={{-60,-60},{-40,-60},{-40,-40},{-20,40},{40,40}},
              color={0,0,0}),Text(
                extent={{30,-60},{50,-70}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-60,60},{-20,50}},
                lineColor={0,0,0},
                textString="voltage"),Text(
                extent={{-60,-30},{-40,-40}},
                lineColor={0,0,0},
                textString="V0"),Text(
                extent={{-50,40},{-30,30}},
                lineColor={0,0,0},
                textString="Vmax"),Text(
                extent={{-40,10},{-20,0}},
                lineColor={0,0,0},
                textString="dVdt"),Polygon(
                points={{-60,60},{-62,52},{-58,52},{-60,60}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Polygon(
                points={{60,-60},{54,-58},{54,-62},{60,-60}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This model is an extension to the <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealClosingSwitch\">IdealClosingSwitch</a>.
</p>
<p>
The basic model interrupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the switch is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the Boolean input <code>control</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e., the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the Boolean input <code>control</code> signals to close the switch again, the switch is closed immediately,
i.e., the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
Please note: In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<ul>
<li><i>May, 2009   </i>
       by Anton Haumer<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end CloserWithArc;

    model ControlledOpenerWithArc
      "Controlled ideal electrical opener with simple arc model"

      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      parameter Modelica_SIunits.Voltage V0(start=30) "Initial arc voltage";
      parameter Modelica_SIunits.VoltageSlope dVdt(start=10E3)
        "Arc voltage slope";
      parameter Modelica_SIunits.Voltage Vmax(start=60) "Max. arc voltage";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin control
        "Control pin: control.v > level switch open, otherwise p--n connected"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_SIunits.Current i;
      Modelica_SIunits.Voltage v;
    protected
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
      Boolean off=(control.v > level);
      Boolean on=not off;
      discrete Modelica_SIunits.Time tSwitch(start=-Modelica_Constants.inf);
      Boolean quenched(start=true);
    equation
      control.i = 0;
      0 = p.i + n.i;
      i = p.i;
      p.v - n.v = v;

      when edge(off) then
        tSwitch = time;
      end when;
      quenched = off and (abs(i) <= abs(v)*Goff or pre(quenched));
      if on then
        v = Ron*i;
      else
        if quenched then
          i = Goff*v;
        else
          v = min(Vmax, V0 + dVdt*(time - tSwitch))*sign(i);
        end if;
      end if;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>

<p>
This model is an extension to the <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch\">IdealOpeningSwitch</a>.
</p>

<p>
The basic model interrupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the switch is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the control pin voltage <code>control.v</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e., the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the control pin <code>control.v</code> signals to close the switch again, the switch is closed immediately,
i.e., the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
<b>Please note:</b>
In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
</p>
<p>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Christoph Clauss initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,20},{40,0}}, color={0,0,255}),
            Line(points={{40,50},{32,34},{48,30},{40,20}}, color={255,0,0}),
            Text(
              extent={{-148,-34},{152,-74}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255}),Line(points={{40,20},{40,0}}, color={0,0,255})}));
    end ControlledOpenerWithArc;

    model ControlledCloserWithArc
      "Controlled ideal electrical closer with simple arc model"

      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      parameter Modelica_SIunits.Voltage V0(start=30) "Initial arc voltage";
      parameter Modelica_SIunits.VoltageSlope dVdt(start=10E3)
        "Arc voltage slope";
      parameter Modelica_SIunits.Voltage Vmax(start=60) "Max. arc voltage";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin control
        "Control pin: control.v > level switch closed, otherwise switch open"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_SIunits.Current i;
      Modelica_SIunits.Voltage v;
    protected
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
      Boolean off(start=false, fixed=true);
      Boolean on=not off;
      discrete Modelica_SIunits.Time tSwitch(start=-Modelica_Constants.inf);
      Boolean quenched(start=true, fixed=true);
    equation
      off = (control.v < level);
      control.i = 0;
      0 = p.i + n.i;
      i = p.i;
      p.v - n.v = v;

      when edge(off) then
        tSwitch = time;
      end when;
      quenched = off and (abs(i) <= abs(v)*Goff or pre(quenched));
      if on then
        v = Ron*i;
      else
        if quenched then
          i = Goff*v;
        else
          v = min(Vmax, V0 + dVdt*(time - tSwitch))*sign(i);
        end if;
      end if;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>
This model is an extension to the <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealClosingSwitch\">IdealClosingSwitch</a>.
</p>
<p>
The basic model interrupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the switch is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the control pin voltage <code>control.v</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e., the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the control pin <code>control.v</code> signals to close the switch again, the switch is closed immediately,
i.e., the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
<b>Please note:</b>
In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
</p>
<p>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>

</html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Christoph Clauss<br> initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Text(
              extent={{-100,-70},{100,-100}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{40,50},{32,24},{48,28},{40,0}}, color={255,0,0})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255})}));
    end ControlledCloserWithArc;

    model IdealTriac "Ideal triac, based on ideal thyristors"

      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.e-5
        "Closed triac resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.e-5
        "Opened triac conductance";
      parameter Modelica_SIunits.Voltage Vknee(
        final min=0,
        start=0) = 0.8 "Threshold voltage for positive and negative phase";

      parameter Modelica_SIunits.Resistance Rdis=100
        "Resistance of disturbance elimination";
      parameter Modelica_SIunits.Capacitance Cdis=0.005
        "Capacity of disturbance elimination";

      Modelica_Electrical_Analog.Ideal.IdealThyristor idealThyristor(
        Ron=Ron,
        Goff=Goff,
        Vknee=Vknee) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-10,32})));
      Modelica_Electrical_Analog.Ideal.IdealThyristor idealThyristor1(
        Ron=Ron,
        Goff=Goff,
        Vknee=Vknee) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-10,-32})));
      Modelica_Electrical_Analog.Basic.Resistor resistor(R=Rdis)
        annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      Modelica_Electrical_Analog.Basic.Capacitor capacitor(C=Cdis)
        annotation (Placement(transformation(extent={{20,-10},{40,10}})));
      Modelica_Blocks_Interfaces.BooleanInput fire1 "Gate"
        annotation (Placement(transformation(extent={{-74,-106},{-46,-78}})));
      Modelica_Electrical_Analog_Interfaces.NegativePin n "Cathode"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica_Electrical_Analog_Interfaces.PositivePin p "Anode"
        annotation (Placement(transformation(extent={{94,-10},{114,10}})));
    equation

      connect(idealThyristor.n, capacitor.n) annotation (Line(
          points={{0,32},{40,32},{40,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(capacitor.n, idealThyristor1.p) annotation (Line(
          points={{40,0},{40,-32},{0,-32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealThyristor1.n, resistor.p) annotation (Line(
          points={{-20,-32},{-60,-32},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor.p, idealThyristor.p) annotation (Line(
          points={{-60,0},{-60,32},{-20,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor.n, capacitor.p) annotation (Line(
          points={{-40,0},{20,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealThyristor1.fire, fire1) annotation (Line(
          points={{-17,-43},{-17,-92},{-60,-92}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(idealThyristor.fire, fire1) annotation (Line(
          points={{-3,43},{-3,60},{-80,60},{-80,-92},{-60,-92}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(n, idealThyristor.p) annotation (Line(
          points={{-100,0},{-90,0},{-90,40},{-20,40},{-20,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealThyristor1.p, p) annotation (Line(
          points={{0,-32},{0,-40},{80,-40},{80,0},{104,0}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Polygon(
              points={{-30,0},{-30,-100},{70,-50},{-30,0}},
              lineColor={0,0,0},
              smooth=Smooth.None),
            Polygon(
              points={{70,100},{70,0},{-30,50},{70,100}},
              lineColor={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{70,0},{70,-100}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{-30,0},{-30,100}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{-30,0},{-90,0}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{70,0},{110,0}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{-62,-86},{-62,-56},{-30,-44}},
              color={0,0,0},
              smooth=Smooth.None),
            Text(
              extent={{-102,130},{98,100}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>This is an ideal triac model based on an ideal thyristor model.</p>

<p>Two ideal thyristors (Modelica.Electrical.Analog.Ideal.IdealThyristor) are contrarily connected in parallel and additionally eliminated interference with a resistor (Rdis=100) and a capacitor (Cdis=0.005), which are connected in series.</p>

<p>The electrical component triac (TRIode Alternating Current switch) is, due to whose complex structure, a multifunctional applicable construction unit. The application area of this element is the manipulation of alternating current signals in frequency, voltage and/or current and also general blocking or filtering. However, compared to a thyristor the triac is only applied for substantial lesser currents, what is justified by whose sensitive structure. Generally one is limited to maximal voltages from 800 volt and currents from 40 ampere. For comparison maximal voltages of a thyristor are 8.000 volt and currents 5.000 ampere.</p>

<p>Structure and functionality:</p>

<p>Functionality of a triac is in principle the same like functionality of a thyristor, even connecting through of current starting from a certain voltage (knee voltage), but only if the current at anode and cathode is caused by a impulse current in the gate electrode. In case of the triac this process is also possible with reverse polarity, wherefore it is possible to control both half-waves of alternating currents. By means of gate electrodes, which are connected in a triac and why only one gate electrode is necessary, the point of time can be determined, at which the triac lets the alternating current signal pass. Thereby it is possible to affect the phase, at which the alternating current signal is cut. One speaks also of phase-angle control. Also depending on doping and specific structure knee voltage and maximal current carrying are alterable.</p>

<p>Characteristics:</p>
<ul>
<li>high switching times between on-state and off state up to activation of the reverse current phase </li>
<li>gate electrode are activated with (positive) impulse (called thyristor/triac firing), after firing thyristor path holds itself in state of low resistance or conductive state up to holding voltage is fallen below, it follows change to off state and next thyristor path can fire </li>
<li>in particular by switching of inductive components triacs generate harmonic waves, whose frequency ranges into broadcast sector and could there cause transmission disturbances; therefore triacs have to eliminate interference by inductors and capacitors </li>
</ul>
<p>Applications:</p>
<ul>
<li>any stepless exposure (dimmer) </li>
<li>engine speed adjustment of electric motors </li>
<li>further applications of phase-angle control (power electronics) </li>
<li>power packs </li>
</ul>
<p>As an additional information: this model is based on the Modelica.Electrical.Analog.Ideal.IdealThyristor.</p>
</html>",   revisions="<html>
<ul>
<li><i>November 25, 2009   </i> <br>

       by Susann Wolf <br><br>
       </li>
</ul>
</html>"));
    end IdealTriac;

    model AD_Converter "Simple n-bit analog to digital converter"
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      Modelica_Electrical_Analog_Interfaces.PositivePin p
        "Positive electrical pin (input)" annotation (Placement(transformation(
              extent={{-80,60},{-60,80}}, rotation=0), iconTransformation(
              extent={{-80,60},{-60,80}})));
      Modelica_Electrical_Analog_Interfaces.NegativePin n
        "Negative electrical pin (input)" annotation (Placement(transformation(
              extent={{-80,-80},{-60,-60}}, rotation=0), iconTransformation(
              extent={{-80,-80},{-60,-60}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y[N]
        "Digital output"
        annotation (Placement(transformation(extent={{60,-10},{80,10}}, rotation=
                0), iconTransformation(extent={{60,-10},{80,10}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput trig "Trigger input"
        annotation (Placement(transformation(extent={{-10,60},{10,80}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={0,90})));
      parameter Integer N(final min=1, start=8)
        "Resolution in bits - output signal width";
      parameter Modelica_SIunits.Voltage VRefHigh(start=10)
        "High reference voltage";
      parameter Modelica_SIunits.Voltage VRefLow(final max=VRefHigh, start=0)
        "Low reference voltage";
      parameter Modelica_SIunits.Resistance Rin(start=10^6) "Input resistance";
      Integer z;
      Real u;

    initial equation
      for i in 1:N loop
        y[i] = L.'X';
      end for;

    algorithm
      when (trig == L.'1' or trig == L.'H') then
        z := if u > VRefLow then integer((u - VRefLow)/(VRefHigh - VRefLow)*(2^N
           - 1) + 0.5) else 0;
        for i in 1:N loop
          y[i] := if mod(z, 2) > 0 then L.'1' else L.'0';
          z := div(z, 2);
        end for;
      end when;
    equation
      p.v - n.v = u;
      p.i*Rin = u;
      p.i + n.i = 0;
      annotation (Documentation(info="<html>
<P>
Simple analog to digital converter with a variable resolution of n bits.
It converts the input voltage <code>ppin.v-npin.v</code> to an n-vector of type Logic
(9-valued logic according to IEEE 1164 STD_ULOGIC). The input resistance between positive and negative pin is determined by <code>Rin</code>.
Further effects (like input capacities) have to be modeled outside the converter, since this should be a general model. </P>

<P>
The input signal range (VRefLo,VRefHi) is divided into 2^n-1 equally spaced stages of length Vlsb:=(VRefHi-VRefLo)/(2^n-1).
The output signal is the binary code of <code> k </code> as long as the input voltage takes values in the k-th stage, namely in the range from
<code> Vlsb*(k-0.5) </code> to <code> m*(k+0.5) </code>. This is called mid-tread operation. Additionally the output can only change
its value if the trigger signal <CODE> trig </CODE> of type Logic changes to '1' (forced or weak).
</P>

<P>
The output vector is a 'little-endian'. i.e., that the first bit y[1] is the least significant one (LSB).
</P>

<P>
This is an abstract model of an ADC. Therefore, it can not cover the dynamic behaviour of the converter.
Hence the output will change instantaneously when the trigger signal rises.
</P>

</html>",   revisions="<html>
<ul>
<li><i> October 13, 2009   </i>
       by Matthias Franke
       </li>
</ul>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(extent={{-60,80},{60,-80}}, lineColor={0,0,255}),
            Polygon(
              points={{-60,-80},{60,80},{60,-80},{-60,-80}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-60,40},{60,0}},
              lineColor={0,0,255},
              textString="%n-bit"),
            Text(
              extent={{-60,0},{60,-40}},
              lineColor={0,0,255},
              textString="ADC")}));
    end AD_Converter;

    model DA_Converter "Simple digital to analog converter"
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      Modelica_Electrical_Digital_Interfaces.DigitalInput trig "Trigger input"
        annotation (Placement(transformation(extent={{-10,60},{10,80}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={0,90})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x[N] "Digital input"
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
              rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin p
        "Positive electrical pin (output)" annotation (Placement(transformation(
              extent={{60,60},{80,80}}, rotation=0), iconTransformation(extent=
                {{60,60},{80,80}})));
      Modelica_Electrical_Analog_Interfaces.NegativePin n
        "Negative electrical pin (output)" annotation (Placement(transformation(
              extent={{60,-80},{80,-60}}, rotation=0), iconTransformation(
              extent={{60,-80},{80,-60}})));

      Modelica_SIunits.Voltage vout;
      Real y(start=0);
      parameter Integer N(final min=1, start=8)
        "Resolution - input signal width";
      parameter Modelica_SIunits.Voltage Vref(start=10) "Reference voltage";

    algorithm
      when trig == L.'1' or trig == L.'H' then
        y := 0;
        for i in 1:N loop
          y := if (x[i] == L.'1' or x[i] == L.'H') then y + 2^(i - 1) else y;
        end for;
        vout := y*Vref/(2^N - 1);
      end when;

    equation
      p.v - n.v = vout;
      p.i + n.i = 0;

      annotation (Documentation(info="<html>
<p>Simple digital to analog converter with a variable input signal width of N bits. The input signal is an N-vector of type Logic (9-valued logic according to IEEE 1164 STD_ULOGIC). The output voltage of value <code>y</code> is generated by an ideal voltage source. The output can only change if the trigger signal <code>trig</code> of type Logic changes to &#39;;1&#39;; (forced or weak). In this case, the output voltage is calculated in the following way:
</p>
<pre>       N
  y = SUM ( x[i]*2^(i-1) )*Vref/(2^N-1),
      i=1
</pre>
<p>where x[i], i=1,...,N is 1 or 0. and Vref is the reference value. Therefore, the first bit in the input vector x[1] is the least significant one (LSB) and x[N] is the most significant bit (MSB).</p>
<p>This is an abstract model of a DAC. Hence, it can not cover the dynamic behaviour of the converter. Therefore the output will change instantaneously when the trigger signal rises.</p>
</html>",   revisions="<html>
<ul>
<li><i> October 13, 2009   </i>
       by Matthias Franke
       </li>
</ul>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(extent={{-60,80},{60,-80}}, lineColor={0,0,255}),
            Polygon(
              points={{-60,-80},{60,80},{-60,80},{-60,-80}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-60,40},{60,0}},
              lineColor={0,0,255},
              textString="%n-bit"),
            Text(
              extent={{-60,0},{60,-40}},
              lineColor={0,0,255},
              textString="DAC")}));
    end DA_Converter;
    annotation (Documentation(info="<html>
<p>This package contains electrical components with idealized behaviour. To enable more realistic applications than it is possible with pure realistic behavior some components are improved by additional features. E.g. the switches have resistances for the open or close case which can be parametrized.</p>
</html>",   revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>
</html>"),   Icon(graphics={
          Line(points={{-90,0},{-40,0}}, color={0,0,0}),
          Line(points={{-40,0},{32,60}}, color={0,0,0}),
          Line(points={{40,0},{90,0}}, color={0,0,0})}));
  end Ideal;


  package Lines
    "Lossy and lossless segmented transmission lines, and LC distributed line models"
    extends Modelica_Icons.Package;

    model OLine "Lossy Transmission Line"
      //extends Interfaces.ThreePol;
      Modelica_Electrical_Analog_Interfaces.Pin p1 annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin p2 annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin p3 annotation (Placement(
            transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
      Modelica_SIunits.Voltage v13;
      Modelica_SIunits.Voltage v23;
      Modelica_SIunits.Current i1;
      Modelica_SIunits.Current i2;
      parameter Real r(
        final min=Modelica_Constants.small,
        unit="Ohm/m",
        start=1) "Resistance per meter";
      parameter Real l(
        final min=Modelica_Constants.small,
        unit="H/m",
        start=1) "Inductance per meter";
      parameter Real g(
        final min=Modelica_Constants.small,
        unit="S/m",
        start=1) "Conductance per meter";
      parameter Real c(
        final min=Modelica_Constants.small,
        unit="F/m",
        start=1) "Capacitance per meter";
      parameter Modelica_SIunits.Length length(final min=Modelica_Constants.small,
          start=1) "Length of line";
      parameter Integer N(final min=1, start=1) "Number of lumped segments";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_R=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_G=0
        "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
      parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false"
        annotation (Dialog(enable=not useHeatPort));
      parameter Modelica_SIunits.Temperature T_ref=300.15;
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort if useHeatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-80,-80},{-60,-60}})));
    protected
      Modelica_Electrical_Analog.Basic.Resistor R[N + 1](
        R=fill(r*length/(N + 1), N + 1),
        T_ref=fill(T_ref, N + 1),
        alpha=fill(alpha_R, N + 1),
        useHeatPort=fill(useHeatPort, N + 1),
        T=fill(T, N + 1));
      Modelica_Electrical_Analog.Basic.Inductor L[N + 1](L=fill(l*length/(N + 1),
            N + 1));
      Modelica_Electrical_Analog.Basic.Capacitor C[N](C=fill(c*length/(N), N));
      Modelica_Electrical_Analog.Basic.Conductor G[N](
        G=fill(g*length/(N), N),
        T_ref=fill(T_ref, N),
        alpha=fill(alpha_G, N),
        useHeatPort=fill(useHeatPort, N),
        T=fill(T, N));
    equation
      v13 = p1.v - p3.v;
      v23 = p2.v - p3.v;
      i1 = p1.i;
      i2 = p2.i;
      connect(p1, R[1].p);
      for i in 1:N loop
        connect(R[i].n, L[i].p);
        connect(L[i].n, C[i].p);
        connect(L[i].n, G[i].p);
        connect(C[i].n, p3);
        connect(G[i].n, p3);
        connect(L[i].n, R[i + 1].p);
      end for;
      connect(R[N + 1].n, L[N + 1].p);
      connect(L[N + 1].n, p2);
      if useHeatPort then
        for i in 1:N + 1 loop
          connect(heatPort, R[i].heatPort);
        end for;
        for i in 1:N loop
          connect(heatPort, G[i].heatPort);
        end for;
      end if;
      annotation (
        Documentation(info="<html>
<p>Like in the picture below, the lossy transmission line OLine is a single-conductor lossy transmission line which consists of segments of lumped resistors and inductors in series and conductor and capacitors that are connected with the reference pin p3. The precision of the model depends on the number N of lumped segments.</p>
<p>To get a symmetric line model, the first resistor and inductor are cut into two parts (R1 and R_Nplus1, L1 and L_Nplus1). These two new resistors and inductors have the half of the resistance respectively inductance the original resistor respectively inductor.</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/OLine.png\"
     alt=\"OLine.png\">
</p>

<p>The capacitances are calculated with: C=c*length/N.
<br> The conductances are calculated with: G=g*length/N.
<br> The resistances are calculated with : R=r*length/(N+1).
<br> The inductances are calculated with : L=l*length/(N+1).
<br> For all capacitors, conductors, resistors and inductors the values of each segment are the same except of the first and last resistor and inductor, that only have the half of the above calculated value of the rest.
<br><p>The user has the possibility to enable a conditional heatport. If so, the OLine can be connected to a thermal network. When the parameter alpha is set to an value greater then zero, the OLine becomes temperature sensitive</p><p>due to their resistors which resistances are calculated by <code>R = R_ref*(1 + alpha*(heatPort.T - T_ref))</code> and conductors calculated by <code> (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref)).</code> </p>
<p>Note, this is different to the lumped line model of SPICE.</p>

<dl><dt><b>References:</b> </dt>
<dd>Johnson, B.; Quarles, T.; Newton, A. R.; Pederson, D. O.; Sangiovanni-Vincentelli, A.: SPICE3 Version 3e User&#39;;s Manual (April 1, 1991). Department of Electrical Engineering and Computer Sciences, University of California, Berkley p. 12, p. 106 - 107 </dd>
</dl></html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,-60},{0,-90}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-60,0},{-90,0}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-155,112},{145,72}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{0,-60},{0,-96}}, color={0,0,255}),
              Line(points={{60,0},{96,0}}, color={0,0,255}),Line(points={{-60,0},
              {-96,0}}, color={0,0,255}),Line(points={{30,30},{-30,30}}, color={0,
              0,255}),Line(points={{-30,40},{-30,20}}, color={0,0,255}),Line(
              points={{30,40},{30,20}}, color={0,0,255})}));
    end OLine;

    model M_OLine "Multiple OLine"

      parameter Modelica_SIunits.Length length(final min=Modelica_Constants.small)=
           0.1 "Length of line";
      parameter Integer N(final min=2) = 5 "Number of lumped segments";
      parameter Integer lines(final min=2) = 4 "Number of lines";
    protected
      parameter Integer dim_vector_lgc=div(lines*(lines + 1), 2);
    public
      parameter Real r[lines](
        each final min=Modelica_Constants.small,
        each unit="Ohm/m") = {4.76e5,1.72e5,1.72e5,1.72e5}
        "Resistance per meter";

      parameter Real l[dim_vector_lgc](
        each final min=Modelica_Constants.small,
        each unit="H/m") = {5.98e-7,4.44e-7,4.39e-7,3.99e-7,5.81e-7,4.09e-7,
        4.23e-7,5.96e-7,4.71e-7,6.06e-7} "Inductance per meter";

      parameter Real g[dim_vector_lgc](
        each final min=Modelica_Constants.small,
        each unit="S/m") = {8.05e-6,3.42e-5,2 - 91e-5,1.76e-6,9.16e-6,7.12e-6,
        2.43e-5,5.93e-6,4.19e-5,6.64e-6} "Conductance per meter";

      parameter Real c[dim_vector_lgc](
        each final min=Modelica_Constants.small,
        each unit="F/m") = {2.38e-11,1.01e-10,8.56e-11,5.09e-12,2.71e-11,2.09e-11,
        7.16e-11,1.83e-11,1.23e-10,2.07e-11} "Capacitance per meter";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_R=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_G=0
        "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
      parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false"
        annotation (Dialog(enable=not useHeatPort));
      parameter Modelica_SIunits.Temperature T_ref=300.15;
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort if useHeatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-80,-80},{-60,-60}})));
      model segment "Multiple line segment model"

        parameter Integer lines(final min=1) = 3 "Number of lines";
        parameter Integer dim_vector_lgc=div(lines*(lines + 1), 2)
          "Length of the vectors for l, g, c";
        Modelica_Electrical_Analog_Interfaces.PositivePin p[lines]
          "Positive pin" annotation (Placement(transformation(extent={{-60,-10},
                  {-40,10}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin n[lines]
          "Negative pin" annotation (Placement(transformation(extent={{40,-10},
                  {60,10}}, rotation=0)));

        parameter Real Cl[dim_vector_lgc]=fill(1, dim_vector_lgc)
          "Capacitance matrix";
        parameter Real Rl[lines]=fill(7, lines) "Resistance matrix";
        parameter Real Ll[dim_vector_lgc]=fill(2, dim_vector_lgc)
          "Inductance matrix";
        parameter Real Gl[dim_vector_lgc]=fill(1, dim_vector_lgc)
          "Conductance matrix";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_R
          "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_G
          "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
        parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
          annotation (
          Evaluate=true,
          HideResult=true,
          choices(checkBox=true));
        parameter Modelica_SIunits.Temperature T=293.15
          "Fixed device temperature if useHeatPort = false"
          annotation (Dialog(enable=not useHeatPort));
        parameter Modelica_SIunits.Temperature T_ref;

        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort if
          useHeatPort annotation (Placement(transformation(extent={{-10,-110},{10,
                  -90}}), iconTransformation(extent={{-80,-80},{-60,-60}})));

        Modelica_Electrical_Analog.Basic.Capacitor C[dim_vector_lgc](C=Cl);
        Modelica_Electrical_Analog.Basic.Resistor R[lines](
          R=Rl,
          T_ref=fill(T_ref, lines),
          alpha=fill(alpha_R, lines),
          useHeatPort=fill(useHeatPort, lines),
          T=fill(T, lines));
        Modelica_Electrical_Analog.Basic.Conductor G[dim_vector_lgc](
          G=Gl,
          T_ref=fill(T_ref, dim_vector_lgc),
          alpha=fill(alpha_G, dim_vector_lgc),
          useHeatPort=fill(useHeatPort, dim_vector_lgc),
          T=fill(T, dim_vector_lgc));
        Modelica_Electrical_Analog.Basic.M_Transformer inductance(N=lines, L=Ll);
        Modelica_Electrical_Analog.Basic.Ground M;

      equation
        for j in 1:lines - 1 loop

          connect(R[j].p, p[j]);
          connect(R[j].n, inductance.p[j]);
          connect(inductance.n[j], n[j]);
          connect(inductance.n[j], C[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)),
            2))].p);
          connect(C[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2))].n, M.p);
          connect(inductance.n[j], G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)),
            2))].p);
          connect(G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2))].n, M.p);

          for i in j + 1:lines loop
            connect(inductance.n[j], C[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)),
              2)) + 1 + i - (j + 1)].p);
            connect(C[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2)) + 1 + i
               - (j + 1)].n, inductance.n[i]);
            connect(inductance.n[j], G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)),
              2)) + 1 + i - (j + 1)].p);
            connect(G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2)) + 1 + i
               - (j + 1)].n, inductance.n[i]);

          end for;
        end for;
        connect(R[lines].p, p[lines]);
        connect(R[lines].n, inductance.p[lines]);
        connect(inductance.n[lines], n[lines]);
        connect(inductance.n[lines], C[dim_vector_lgc].p);
        connect(C[dim_vector_lgc].n, M.p);
        connect(inductance.n[lines], G[dim_vector_lgc].p);
        connect(G[dim_vector_lgc].n, M.p);

        if useHeatPort then

          for j in 1:lines - 1 loop
            connect(heatPort, R[j].heatPort);
            connect(heatPort, G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2))].heatPort);
            for i in j + 1:lines loop
              connect(heatPort, G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2))
                 + 1 + i - (j + 1)].heatPort);
            end for;
          end for;
          connect(heatPort, R[lines].heatPort);
          connect(heatPort, G[dim_vector_lgc].heatPort);
        end if;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(extent={{40,-40},{-40,40}},
                lineColor={0,0,255})}), Documentation(info="<html>
<p>The segment model is part of the multiple line model. It describes one line segment as outlined in the M_OLine description. Using the loop possibilities of Modelica it is formulated by connecting components the number of which depends on the number of lines.</p>
</html>"));
      end segment;

      model segment_last "Multiple line last segment model"

        Modelica_Electrical_Analog_Interfaces.PositivePin p[lines]
          "Positive pin" annotation (Placement(transformation(extent={{-40,-10},
                  {-20,10}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin n[lines]
          "Negative pin" annotation (Placement(transformation(extent={{20,-10},
                  {40,10}}, rotation=0)));
        parameter Integer lines(final min=1) = 3 "Number of lines";
        parameter Integer dim_vector_lgc=div(lines*(lines + 1), 2)
          "Length of the vectors for l, g, c";
        parameter Real Rl[lines]=fill(1, lines) "Resistance matrix";
        parameter Real Ll[dim_vector_lgc]=fill(1, dim_vector_lgc)
          "Inductance matrix";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_R
          "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
        parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
          annotation (
          Evaluate=true,
          HideResult=true,
          choices(checkBox=true));
        parameter Modelica_SIunits.Temperature T=293.15
          "Fixed device temperature if useHeatPort = false"
          annotation (Dialog(enable=not useHeatPort));
        parameter Modelica_SIunits.Temperature T_ref;
        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort if
          useHeatPort annotation (Placement(transformation(extent={{-10,-110},{10,
                  -90}}), iconTransformation(extent={{-80,-80},{-60,-60}})));
        Modelica_Electrical_Analog.Basic.Resistor R[lines](
          R=Rl,
          T_ref=fill(T_ref, lines),
          useHeatPort=fill(useHeatPort, lines),
          T=fill(T, lines));
        Modelica_Electrical_Analog.Basic.M_Transformer inductance(N=lines, L=Ll);
        Modelica_Electrical_Analog.Basic.Ground M;

      equation
        for j in 1:lines - 1 loop

          connect(p[j], inductance.p[j]);
          connect(inductance.n[j], R[j].p);
          connect(R[j].n, n[j]);

        end for;
        connect(p[lines], inductance.p[lines]);
        connect(inductance.n[lines], R[lines].p);
        connect(R[lines].n, n[lines]);

        if useHeatPort then
          for j in 1:lines - 1 loop
            connect(heatPort, R[j].heatPort);
          end for;
          connect(heatPort, R[lines].heatPort);
        end if;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(extent={{20,-40},{-20,40}},
                lineColor={0,0,255})}), Documentation(info="<html>
<p>The segment_last model is part of the multiple line model. It describes the special  line segment which is used to get the line symmetrical as outlined in the M_OLine description. Using the loop possibilities of Modelica it is formulated by connecting components the number of which depends on the number of lines.</p>
</html>"));
      end segment_last;

      segment s[N - 1](
        lines=fill(lines, N - 1),
        dim_vector_lgc=fill(dim_vector_lgc, N - 1),
        Rl=fill(r*length/N, N - 1),
        Ll=fill(l*length/N, N - 1),
        Cl=fill(c*length/N, N - 1),
        Gl=fill(g*length/N, N - 1),
        alpha_R=fill(alpha_R, N - 1),
        alpha_G=fill(alpha_G, N - 1),
        T_ref=fill(T_ref, N - 1),
        useHeatPort=fill(useHeatPort, N - 1),
        T=fill(T, N - 1));
      segment s_first(
        lines=lines,
        dim_vector_lgc=dim_vector_lgc,
        Rl=r*length/(2*N),
        Cl=c*length/(N),
        Ll=l*length/(2*N),
        Gl=g*length/(N),
        alpha_R=alpha_R,
        alpha_G=alpha_G,
        T_ref=T_ref,
        useHeatPort=useHeatPort,
        T=T);
      segment_last s_last(
        lines=lines,
        Rl=r*length/(2*N),
        Ll=l*length/(2*N),
        alpha_R=alpha_R,
        T_ref=T_ref,
        useHeatPort=useHeatPort,
        T=T);
      Modelica_Electrical_Analog_Interfaces.PositivePin p[lines] "Positive pin"
        annotation (Placement(transformation(extent={{-100,-80},{-80,80}},
              rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n[lines] "Negative pin"
        annotation (Placement(transformation(extent={{80,-80},{100,80}},
              rotation=0)));

    equation
      connect(p, s_first.p);
      connect(s_first.n, s[1].p);
      for i in 1:N - 2 loop
        connect(s[i].n, s[i + 1].p);
      end for;
      connect(s[N - 1].n, s_last.p);
      connect(s_last.n, n);
      if useHeatPort then
        connect(heatPort, s_first.heatPort);
        for i in 1:N - 1 loop
          connect(heatPort, s[i].heatPort);
        end for;
        connect(heatPort, s_last.heatPort);
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{60,80},{-60,-80}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(points={{40,60},{40,40}}),
            Line(points={{40,50},{-40,50}}),
            Line(points={{-40,60},{-40,40}}),
            Line(points={{40,-40},{40,-60}}),
            Line(points={{40,-50},{-40,-50}}),
            Line(points={{-40,-40},{-40,-60}}),
            Line(points={{40,30},{40,10}}),
            Line(points={{40,20},{-40,20}}),
            Line(points={{-40,30},{-40,10}}),
            Line(
              points={{0,6},{0,-34}},
              color={0,0,255},
              pattern=LinePattern.Dot),
            Text(
              extent={{-146,135},{154,95}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>The M_OLine is a multi line model which consists of several segments and several single lines. Each segment consists of resistors and inductors that are connected in series in each single line, and of capacitors and conductors both between the lines and to the ground. The inductors are coupled to each other like in the M_Inductor model. The following picture shows the schematic of a segment with four single lines (lines=4):</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/segment.png\"
     alt=\"segment.png\">
</blockquote>

<p>The complete multi line consists of N segments and an auxiliary segment_last:</p>
<p align=\"center\"><code>-- segment_1 -- segment_2 -- ... -- segment_N -- segment_last --</code> </p>
<p>In the picture of the segment can be seen, that a single segment is asymmetric. Connecting such asymmetric segments in a series forces also an asymmetric multi line. To get a symmetric model which is useful for coupling and which guaranties the same pin properties, in the segment_1 only half valued resistors and inductors are used. The remaining resistors and inductors are at the other end of the line within the auxiliary segment_last. For the example with 4 lines the schematic of segment_last is like this:</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/segment_last.png\"
     alt=\"segment_last.png\">
</blockquote>

<p>The number of the capacitors and conductors depends on the number of single lines that are used, because each line is connected to every other line by both a capacitor and a conductor. One line consists of <b>at least two segments</b>. Inside the model M_OLine the model <i>segment</i> is used. This model represents one segment which is build as described above. For modelling the inductances and their mutual couplings the model M_Transformer is used. To fill the resistance vector, resistance values as many as lines are needed, e.g., if there are four lines, four resistances are needed. For example for a microelectronic line of 0.1m length, a sensible resistance-vector would be R=[4.76e5, 1.72e5, 1.72e5, 1.72e5].</p>
<p>Filling the matrices of the inductances, capacitances and conductances is a bit more complicated, because those components occur also between two lines and not only (like the resistor) in one line. The entries of the matrices are given by the user in form of a vector. The vector length dim_vector_lgc is calculated by <b>dim_vector_lgc = lines*(lines+1)/2</b>. Inside the model a symmetric inductance matrix, a symmetric capacitance matrix and a symmetric conductance matrix are built out of the entries of the vectors given by the user. The way of building is the same for each matrix, so the approach for filling one of the matrices will be shown at an example:</p>
<p>The number of lines is assumed to be four. To build the matrix, the model needs the values from the main diagonal and from the positions that are below the main diagonal. To get the following matrix</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Lines/M_OLine-eqMatrix.png\" alt=\"Matrix\"/>
</blockquote>

<p>the vector with dim_vector_lgc=4*5/2=10 has to appear in the following way: vector = [<b>1</b>, 0.1, 0.2, 0.4, <b>2</b>, 0.3 0.5, <b>3</b>, 0.6, <b>4</b>] </p>

<p>For the example of a microelectronic line of 0.1m length, which is used as default example for the M_OLine model, a sensible inductance-matrix would be </p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Lines/M_OLine-eqL.png\" alt=\"L\"/>
</blockquote>

<p>For the example of a microelectronic line of 0.1m length, which is used as default example for the M_OLine model, a sensible capacitance-matrix would be:</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Lines/M_OLine-eqC.png\" alt=\"C\"/>
</blockquote>

<p>For the example of a microelectronic line of 0.1m length, which is used as default example for the M_OLine model, a sensible conductance-matrix would be:</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Lines/M_OLine-eqG.png\" alt=\"G\"/>
</blockquote>

<p>The user has the possibility to enable a conditional heatport. If so, the M_OLine can be connected to a thermal network. When the parameter alpha is set to an value greater then zero, the M_OLine becomes temperature sensitive due to their resistors which resistances are calculated by R = R_ref*(1 + alpha*(heatPort.T - T_ref)) and conductors calculated by (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref)).</p>
</html>",   revisions="<HTML>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th>Version</th>
      <th>Revision</th>
      <th>Date</th>
      <th>Author</th>
      <th>Comment</th>
    </tr>
   <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\">4163</td>
      <td valign=\"top\">2010-09-11</td>
      <td valign=\"top\">Dietmar Winkler</td>
      <td valign=\"top\">Documentation corrected according to documentation guidelines.</td>
    </tr>
    <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\"></td>
      <td valign=\"top\">2008-11-24</td>
      <td valign=\"top\">Kristin Majetta</td>
      <td valign=\"top\">Documentation added.</td>
    </tr>
    <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\"></td>
      <td valign=\"top\">2007-02-26</td>
      <td valign=\"top\">Kristin Majetta</td>
      <td valign=\"top\">Initially implemented</td>
    </tr>
</table>
</HTML>"));
    end M_OLine;

    model ULine "Lossy RC Line"
      //extends Interfaces.ThreePol;
      Modelica_Electrical_Analog_Interfaces.Pin p1 annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin p2 annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin p3 annotation (Placement(
            transformation(extent={{-10,-110},{10,-90}}, rotation=0),
            iconTransformation(extent={{-10,-110},{10,-90}})));
      Modelica_SIunits.Voltage v13;
      Modelica_SIunits.Voltage v23;
      Modelica_SIunits.Current i1;
      Modelica_SIunits.Current i2;
      parameter Real r(
        final min=Modelica_Constants.small,
        unit="Ohm/m",
        start=1) "Resistance per meter";
      parameter Real c(
        final min=Modelica_Constants.small,
        unit="F/m",
        start=1) "Capacitance per meter";
      parameter Modelica_SIunits.Length length(final min=Modelica_Constants.small,
          start=1) "Length of line";
      parameter Integer N(final min=1, start=1) "Number of lumped segments";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false"
        annotation (Dialog(enable=not useHeatPort));
      parameter Modelica_SIunits.Temperature T_ref=300.15;
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort if useHeatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-80,-80},{-60,-60}})));
    protected
      Modelica_Electrical_Analog.Basic.Resistor R[N + 1](
        R=fill(r*length/(N + 1), N + 1),
        T_ref=fill(T_ref, N + 1),
        alpha=fill(alpha, N + 1),
        useHeatPort=fill(useHeatPort, N + 1),
        T=fill(T, N + 1));
      Modelica_Electrical_Analog.Basic.Capacitor C[N](C=fill(c*length/(N), N));
    equation
      v13 = p1.v - p3.v;
      v23 = p2.v - p3.v;
      i1 = p1.i;
      i2 = p2.i;
      connect(p1, R[1].p);
      for i in 1:N loop
        connect(R[i].n, R[i + 1].p);
      end for;
      for i in 1:N loop
        connect(R[i].n, C[i].p);
      end for;
      for i in 1:N loop
        connect(C[i].n, p3);
      end for;
      connect(R[N + 1].n, p2);
      if useHeatPort then
        for i in 1:N + 1 loop
          connect(heatPort, R[i].heatPort);
        end for;
      end if;
      annotation (
        Documentation(info="<html>
<p>As can be seen in the picture below, the lossy RC line ULine is a single conductor lossy transmission line which consists of segments of lumped series resistors and capacitors that are connected with the reference pin p3. The precision of the model depends on the number N of lumped segments.
<br>To get a symmetric line model, the first resistor is cut into two parts (R1 and R_Nplus1). These two new resistors have the half of the resistance of the original resistor.
</p>
<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/ULine.png\"
     alt=\"ULine.png\">
</blockquote>
<p>
The capacitances are calculated with: C=c*length/N.
<br>The resistances are calculated with: R=r*length/(N+1).
<br>For all capacitors and resistors the values of each segment are the same except for the first and last resistor, that only has the half of the above calculated value.<p>The user has the possibility to enable a conditional heatport. If so, the ULine can be connected to a thermal network. When the parameter alpha is set to an value greater then zero, the ULine becomes temperature sensitive</p>
<p>due to their resistors which resistances are calculated by <code>R = R_ref*(1 + alpha*(heatPort.T - T_ref)).</code> </p>
<p>Note, this is different compared with the lumped line model of SPICE.</p>
<p><b>References</b></p>
<dl><dt>Johnson, B.; Quarles, T.; Newton, A. R.; Pederson, D. O.; Sangiovanni-Vincentelli, A.</dt>
<dd>SPICE3 Version 3e User&#39;;s Manual (April 1, 1991). Department of Electrical Engineering and Computer Sciences, University of California, Berkley p. 22, p. 124 </dd>
</dl></html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Christoph Clauss initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,-60},{0,-90}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-60,0},{-90,0}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-154,117},{146,77}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{0,-60},{0,-96}}, color={0,0,255}),
              Line(points={{60,0},{96,0}}, color={0,0,255}),Line(points={{-60,0},
              {-96,0}}, color={0,0,255}),Line(points={{30,30},{-30,30}}, color={0,
              0,255}),Line(points={{-30,40},{-30,20}}, color={0,0,255}),Line(
              points={{30,40},{30,20}}, color={0,0,255})}));
    end ULine;

    model TLine1
      "Lossless transmission line with characteristic impedance Z0 and transmission delay TD"

      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Modelica_SIunits.Resistance Z0(start=1)
        "Characteristic impedance";
      parameter Modelica_SIunits.Time TD(start=1) "Transmission delay";
    protected
      Modelica_SIunits.Voltage er;
      Modelica_SIunits.Voltage es;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(TD > 0, "TD has to be positive");
      i1 = (v1 - es)/Z0;
      i2 = (v2 - er)/Z0;
      es = 2*delay(v2, TD) - delay(er, TD);
      er = 2*delay(v1, TD) - delay(es, TD);
      annotation (
        Documentation(info="<html>
<p>Lossless transmission line with characteristic impedance Z0 and transmission delay TD The lossless transmission line TLine1 is a two Port. Both port branches consist of a resistor with characteristic impedance Z0 and a controlled voltage source that takes into consideration the transmission delay TD. For further details see Branin&#39;;s article below. The model parameters can be derived from inductance and capacitance per length (L&#39;; resp. C&#39;;), i. e. Z0 = sqrt(L&#39;;/C&#39;;) and TD = sqrt(L&#39;;*C&#39;;)*length_of_line. Resistance R&#39;; and conductance C&#39;; per meter are assumed to be zero.</p>
<p><b>References:</b></p>
<dl><dt>Branin Jr., F. H.</dt>
<dd>Transient Analysis of Lossless Transmission Lines. Proceedings of the IEEE 55(1967), 2012 - 2013</dd>
<dt>Hoefer, E. E. E.; Nielinger, H.</dt>
<dd>SPICE : Analyseprogramm fuer elektronische Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985. </dd>
</dl></html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Joachim Haase<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(points={{60,-50},{90,-50}}, color={0,0,255}),
            Line(points={{60,50},{90,50}}, color={0,0,255}),
            Line(points={{-60,50},{-90,50}}, color={0,0,255}),
            Line(points={{-60,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-50,0},{50,-20}},
              textString="TLine1",
              lineColor={0,0,0}),
            Text(
              extent={{-152,122},{148,82}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}),graphics={Rectangle(extent={{-60,60},{60,-60}}, lineColor=
               {0,0,255}),Line(points={{60,-50},{96,-50}}, color={0,0,255}),Line(
              points={{60,50},{96,50}}, color={0,0,255}),Line(points={{-60,50},{-96,
              50}}, color={0,0,255}),Line(points={{-60,-50},{-96,-50}}, color={0,
              0,255}),Line(points={{30,30},{-30,30}}, color={0,0,255}),Line(
              points={{-30,40},{-30,20}}, color={0,0,255}),Line(points={{30,40},{
              30,20}}, color={0,0,255}),Text(
                extent={{-100,100},{100,70}},
                textString="TLine1",
                lineColor={0,0,255}),Text(
                extent={{-30,0},{31,-31}},
                textString="TLine1",
                lineColor={0,0,255})}));
    end TLine1;

    model TLine2
      "Lossless transmission line with characteristic impedance Z0, frequency F and normalized length NL"

      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Modelica_SIunits.Resistance Z0(start=1)
        "Characteristic impedance";
      parameter Modelica_SIunits.Frequency F(start=1) "Frequency";
      parameter Real NL(start=1) "Normalized length";
    protected
      Modelica_SIunits.Voltage er;
      Modelica_SIunits.Voltage es;
      parameter Modelica_SIunits.Time TD=NL/F;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(NL > 0, "NL has to be positive");
      assert(F > 0, "F has to be positive");
      i1 = (v1 - es)/Z0;
      i2 = (v2 - er)/Z0;
      es = 2*delay(v2, TD) - delay(er, TD);
      er = 2*delay(v1, TD) - delay(es, TD);
      annotation (
        Documentation(info="<html>
<p>Lossless transmission line with characteristic impedance Z0, frequency F and normalized length NL The lossless transmission line TLine2 is a two Port. Both port branches consist of a resistor with the value of the characteristic impedance Z0 and a controlled voltage source that takes into consideration the transmission delay. For further details see Branin&#39;;s article below. Resistance R&#39;; and conductance C&#39;; per meter are assumed to be zero. The characteristic impedance Z0 can be derived from inductance and capacitance per length (L&#39;; resp. C&#39;;), i. e. Z0 = sqrt(L&#39;;/C&#39;;). The normalized length NL is equal to the length of the line divided by the wavelength corresponding to the frequency F, i. e. the transmission delay TD is the quotient of NL and F.</p>
<p><b>References:</b></p>
<dl><dt>Branin Jr., F. H.</dt>
<dd>Transient Analysis of Lossless Transmission Lines. Proceedings of the IEEE 55(1967), 2012 - 2013</dd>
<dt>Hoefer, E. E. E.; Nielinger, H.</dt>
<dd>SPICE : Analyseprogramm fuer elektronische Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985. </dd>
</dl></html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Joachim Haase initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(points={{60,-50},{90,-50}}, color={0,0,255}),
            Line(points={{60,50},{90,50}}, color={0,0,255}),
            Line(points={{-60,50},{-90,50}}, color={0,0,255}),
            Line(points={{-60,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-51,-10},{50,-31}},
              textString="TLine2",
              lineColor={0,0,0}),
            Text(
              extent={{-148,119},{152,79}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{60,-50},{96,-50}}, color={0,0,
              255}),Line(points={{60,50},{96,50}}, color={0,0,255}),Line(points={
              {-60,50},{-96,50}}, color={0,0,255}),Line(points={{-60,-50},{-96,-50}},
              color={0,0,255}),Line(points={{30,30},{-30,30}}, color={0,0,255}),
              Line(points={{-30,40},{-30,20}}, color={0,0,255}),Line(points={{30,
              40},{30,20}}, color={0,0,255}),Text(
                extent={{-100,100},{100,70}},
                textString="TLine2",
                lineColor={0,0,255})}));
    end TLine2;

    model TLine3
      "Lossless transmission line with characteristic impedance Z0 and frequency F"
      extends Modelica_Electrical_Analog_Interfaces.TwoPort;
      parameter Modelica_SIunits.Resistance Z0(start=1) "Natural impedance";
      parameter Modelica_SIunits.Frequency F(start=1) "Frequency";
    protected
      Modelica_SIunits.Voltage er;
      Modelica_SIunits.Voltage es;
      parameter Modelica_SIunits.Time TD=1/F/4;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(F > 0, "F has to be positive");
      i1 = (v1 - es)/Z0;
      i2 = (v2 - er)/Z0;
      es = 2*delay(v2, TD) - delay(er, TD);
      er = 2*delay(v1, TD) - delay(es, TD);
      annotation (
        Documentation(info="<html>
<p>Lossless transmission line with characteristic impedance Z0 and frequency F The lossless transmission line TLine3 is a two Port. Both port branches consist of a resistor with value of the characteristic impedance Z0 and a controlled voltage source that takes into consideration the transmission delay. For further details see Branin&#39;;s article below. Resistance R&#39;; and conductance C&#39;; per meter are assumed to be zero. The characteristic impedance Z0 can be derived from inductance and capacitance per length (L&#39;; resp. C&#39;;), i. e. Z0 = sqrt(L&#39;;/C&#39;;). The length of the line is equal to a quarter of the wavelength corresponding to the frequency F, i. e. the transmission delay is the quotient of 4 and F. In this case, the characteristic impedance is called natural impedance.</p>
<p><b>References:</b></p>
<dl><dt>Branin Jr., F. H.</dt>
<dd>Transient Analysis of Lossless Transmission Lines. Proceedings of the IEEE 55(1967), 2012 - 2013</dd>
<dt>Hoefer, E. E. E.; Nielinger, H.</dt>
<dd>SPICE : Analyseprogramm fuer elektronische Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985. </dd>
</dl></html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Joachim Haase<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(points={{60,-50},{90,-50}}, color={0,0,255}),
            Line(points={{60,50},{90,50}}, color={0,0,255}),
            Line(points={{-60,50},{-90,50}}, color={0,0,255}),
            Line(points={{-60,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-50,-10},{51,-30}},
              textString="TLine3",
              lineColor={0,0,0}),
            Text(
              extent={{-155,124},{145,84}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{60,-50},{96,-50}}, color={0,0,
              255}),Line(points={{60,50},{96,50}}, color={0,0,255}),Line(points={
              {-60,50},{-96,50}}, color={0,0,255}),Line(points={{-60,-50},{-96,-50}},
              color={0,0,255}),Line(points={{30,30},{-30,30}}, color={0,0,255}),
              Line(points={{-30,40},{-30,20}}, color={0,0,255}),Line(points={{30,
              40},{30,20}}, color={0,0,255}),Text(
                extent={{-100,100},{100,70}},
                textString="TLine3",
                lineColor={0,0,255})}));
    end TLine3;

    annotation (Documentation(info="<html>
<p>This package contains lossy and lossless segmented transmission lines, and LC distributed line models. The line models do not yet possess a conditional heating port.</p>
</html>",   revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Joachim.Haase/\">Joachim Haase;</a>
    &lt;<a href=\"mailto:haase@eas.iis.fhg.de\">haase@eas.iis.fhg.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>
</html>"),   Icon(graphics={
          Line(points={{-60,50},{-90,50}}, color={0,0,0}),
          Rectangle(
            extent={{-60,60},{60,-60}},
            lineColor={0,0,0}),
          Line(points={{-60,-50},{-90,-50}}, color={0,0,0}),
          Line(points={{36,20},{-36,20}}, color={0,0,0}),
          Line(points={{-36,40},{-36,0}},  color={0,0,0}),
          Line(points={{36,40},{36,0}},  color={0,0,0}),
          Line(points={{60,50},{90,50}}, color={0,0,0}),
          Line(points={{60,-50},{90,-50}}, color={0,0,0})}));
  end Lines;

  package Semiconductors
    "Semiconductor devices such as diode, MOS and bipolar transistor"
    extends Modelica_Icons.Package;
    import SIunits = Modelica_SIunits;

    model Diode "Simple diode"
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Current Ids=1.e-6 "Saturation current";
      parameter Modelica_SIunits.Voltage Vt=0.04
        "Voltage equivalent of temperature (kT/qn)";
      parameter Real Maxexp(final min=Modelica_Constants.small) = 15
        "Max. exponent for linear continuation";
      parameter Modelica_SIunits.Resistance R=1.e8 "Parallel ohmic resistance";
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=
            293.15);
    equation
      i = smooth(1,(if (v/Vt > Maxexp) then Ids*(exp(Maxexp)*(1 + v/Vt - Maxexp) - 1) +
        v/R else Ids*(exp(v/Vt) - 1) + v/R));
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The simple diode is a one port. It consists of the diode itself and an parallel ohmic resistance <i>R</i>. The diode formula is:</p>
<pre>                v/vt
  i  =  ids ( e      - 1).</pre>
<p>If the exponent <i>v/vt</i> reaches the limit <i>maxex</i>, the diode characteristic is linearly continued to avoid overflow.</p><p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled yet. The parameters are not temperature dependent.</p>
</html>",
     revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> November 15, 2005   </i>
       by Christoph Clauss<br> smooth function added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Text(
              extent={{-150,-49},{149,-77}},
              lineColor={0,0,0},
              textString="Vt=%Vt"),
            Text(
              extent={{-154,100},{146,60}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,0,0},
              fillPattern=FillPattern.None),
            Line(points={{-96,0},{96,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255})}));
    end Diode;

   model ZDiode "Zener diode with 3 working areas"
     extends Modelica_Electrical_Analog_Interfaces.OnePort;
     parameter Modelica_SIunits.Current Ids=1.e-6 "Saturation current";
     parameter Modelica_SIunits.Voltage Vt=0.04
        "Voltage equivalent of temperature (kT/qn)";
     parameter Real Maxexp(final min=Modelica_Constants.small) = 30
        "Max. exponent for linear continuation";
     parameter Modelica_SIunits.Resistance R=1.e8 "Parallel ohmic resistance";
     parameter Modelica_SIunits.Voltage Bv=5.1
        "Breakthrough voltage = Zener- or Z-voltage";
     parameter Modelica_SIunits.Current Ibv=0.7 "Breakthrough knee current";
     parameter Real Nbv=0.74 "Breakthrough emission coefficient";
     extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=293.15);

     Real maxexp=exp(Maxexp);
   equation
      i = smooth(1, if (v>Maxexp*Vt) then
                Ids*( exp(Maxexp)*(1 + v/Vt - Maxexp)-1) + v/R else
             if ( (v+Bv)<-Maxexp*(Nbv*Vt)) then
                -Ids -Ibv* exp(Maxexp)*(1 - (v+Bv)/(Nbv*Vt) - Maxexp) +v/R else
                Ids*(exp(v/Vt)-1) - Ibv*exp(-(v+Bv)/(Nbv*Vt)) + v/R);
      LossPower = v*i;
            annotation (
              Documentation(info="<html>
<p>The simple Zener diode is a one port. It consists of the diode itself and an parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
<p>If the exponent in one of the two branches reaches the limit <i>Maxexp</i>, the diode characteristic is linearly continued to avoid overflow.</p>
<p><br>The Zener diode model permits (in contrast to the simple diode model) current in reverse direction if the breakdown voltage Bv (also known Zener knee voltage) is exceeded.</p>
<p>The thermal power is calculated by <i>i*v</i>.</p><p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled yet. The parameters are not temperature dependent.</p>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>April 5, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Text(
              extent={{-152,114},{148,74}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-101},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,0,0},
              fillPattern=FillPattern.None),
            Line(points={{-99,0},{96,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255})}));
   end ZDiode;

  model PMOS "Simple MOS Transistor"

      Modelica_Electrical_Analog_Interfaces.Pin D "Drain" annotation (Placement(
            transformation(extent={{90,40},{110,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin G "Gate" annotation (Placement(
            transformation(extent={{-90,-40},{-110,-60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin S "Source" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin B "Bulk" annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      parameter Modelica_SIunits.Length W=20.0e-6 "Width";
      parameter Modelica_SIunits.Length L=6.0e-6 "Length";
      parameter Modelica_SIunits.Transconductance Beta=0.0105e-3
        "Transconductance parameter";
      parameter Modelica_SIunits.Voltage Vt=-1.0 "Zero bias threshold voltage";
    parameter Real K2=0.41 "Bulk threshold parameter";
    parameter Real K5=0.839 "Reduction of pinch-off region";
      parameter Modelica_SIunits.Length dW=-2.5e-6 "Narrowing of channel";
      parameter Modelica_SIunits.Length dL=-2.1e-6 "Shortening of channel";
      parameter Modelica_SIunits.Resistance RDS=1.e+7 "Drain-Source-Resistance";
    extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=293.15);
    protected
    Real v;
    Real uds;
    Real ubs;
    Real ugst;
    Real ud;
    Real us;
    Real id;
    Real gds;

  equation
    assert( L + dL > 0, "PMOS: Effective length must be positive");
    assert( W + dW > 0, "PMOS: Effective width  must be positive");
    gds = if (RDS < 1.e-20 and RDS > -1.e-20) then 1.e20 else 1/RDS;
    v = Beta*(W + dW)/(L + dL);
    ud = smooth(0,if (D.v > S.v) then S.v else D.v);
    us = smooth(0,if (D.v > S.v) then D.v else S.v);
    uds = ud - us;
    ubs = smooth(0,if (B.v < us) then 0 else B.v - us);
    ugst = (G.v - us - Vt + K2*ubs)*K5;
    id = smooth(0,if (ugst >= 0) then uds*gds else if (ugst < uds) then -v*uds*(
      ugst - uds/2) + uds*gds else -v*ugst*ugst/2 + uds*gds);
    G.i = 0;
    D.i = smooth(0,if (D.v > S.v) then -id else id);
    S.i = smooth(0,if (D.v > S.v) then id else -id);
    B.i = 0;
    LossPower = D.i * (D.v - S.v);
    annotation (
      Documentation(info="<html>
<P>
The PMOS model is a simple model of a p-channel metal-oxide semiconductor
FET. It differs slightly from the device used in the SPICE simulator.
For more details please care for H. Spiro.
</P>
<P>
The model does not consider capacitances. A high drain-source resistance RDS
is included to avoid numerical difficulties.
<br><br>
<b>Please note: </b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled yet. The parameters are not temperature dependent.
</P>
<DL>
<DT><b>References:</b>
<DD>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag
  Muenchen Wien 1990.
</DL>
<P>
Some typical parameter sets are:
</P>
<PRE>
  W       L      Beta        Vt    K2     K5      DW       DL
  m       m      A/V^2       V     -      -       m        m
  50.e-6  8.e-6  0.0085e-3  -0.15  0.41   0.839  -3.8e-6  -4.0e-6
  20.e-6  6.e-6  0.0105e-3  -1.0   0.41   0.839  -2.5e-6  -2.1e-6
  30.e-6  5.e-6  0.0059e-3  -0.3   0.98   1.01    0       -3.9e-6
  30.e-6  5.e-6  0.0152e-3  -0.69  0.104  1.1    -0.8e-6  -0.4e-6
  30.e-6  5.e-6  0.0163e-3  -0.69  0.104  1.1    -0.8e-6  -0.4e-6
  30.e-6  5.e-6  0.0182e-3  -0.69  0.086  1.06   -0.1e-6  -0.6e-6
  20.e-6  6.e-6  0.0074e-3  -1.    0.4    0.59    0        0
</PRE>

</html>",
   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{91,50}}, color={0,0,255}),
            Line(points={{10,0},{90,0}}, color={0,0,255}),
            Line(points={{10,-50},{90,-50}}, color={0,0,255}),
            Polygon(
              points={{60,0},{40,5},{40,-5},{60,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-149,117},{151,77}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-90},{0,0}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-96,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{96,50}}, color={0,0,255}),
            Line(points={{10,0},{96,0}}, color={0,0,255}),
            Line(points={{10,-50},{96,-50}}, color={0,0,255}),
            Polygon(
              points={{60,0},{40,5},{40,-5},{60,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
  end PMOS;

  model NMOS "Simple MOS Transistor"

      Modelica_Electrical_Analog_Interfaces.Pin D "Drain" annotation (Placement(
            transformation(extent={{90,40},{110,60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin G "Gate" annotation (Placement(
            transformation(extent={{-90,-40},{-110,-60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin S "Source" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.Pin B "Bulk" annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      parameter Modelica_SIunits.Length W=20.e-6 "Width";
      parameter Modelica_SIunits.Length L=6.e-6 "Length";
      parameter Modelica_SIunits.Transconductance Beta=0.041e-3
        "Transconductance parameter";
      parameter Modelica_SIunits.Voltage Vt=0.8 "Zero bias threshold voltage";
    parameter Real K2=1.144 "Bulk threshold parameter";
    parameter Real K5=0.7311 "Reduction of pinch-off region";
      parameter Modelica_SIunits.Length dW=-2.5e-6 "narrowing of channel";
      parameter Modelica_SIunits.Length dL=-1.5e-6 "shortening of channel";
      parameter Modelica_SIunits.Resistance RDS=1.e+7 "Drain-Source-Resistance";
    extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=293.15);
    protected
    Real v;
    Real uds;
    Real ubs;
    Real ugst;
    Real ud;
    Real us;
    Real id;
    Real gds;

  equation
    assert( L + dL > 0, "NMOS: Effective length must be positive");
    assert( W + dW > 0, "NMOS: Effective width  must be positive");
    gds = if (RDS < 1.e-20 and RDS > -1.e-20) then 1.e20 else 1/RDS;
    v = Beta*(W + dW)/(L + dL);
    ud = smooth(0,if (D.v < S.v) then S.v else D.v);
    us = if (D.v < S.v) then D.v else S.v;
    uds = ud - us;
    ubs = smooth(0,if (B.v > us) then 0 else B.v - us);
    ugst = (G.v - us - Vt + K2*ubs)*K5;
    id = smooth(0,if (ugst <= 0) then uds*gds else if (ugst > uds) then v*uds*(ugst
       - uds/2) + uds*gds else v*ugst*ugst/2 + uds*gds);
    G.i = 0;
    D.i = smooth(0,if (D.v < S.v) then -id else id);
    S.i = smooth(0,if (D.v < S.v) then id else -id);
    B.i = 0;
    LossPower = D.i * (D.v - S.v);
    annotation (
      Documentation(info="<html>
<P>
The NMOS model is a simple model of a n-channel metal-oxide semiconductor
FET. It differs slightly from the device used in the SPICE simulator.
For more details please care for H. Spiro.
</P>
<P>
The model does not consider capacitances. A high drain-source resistance RDS
is included to avoid numerical difficulties.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled yet. The parameters are not temperature dependent.
</P>
<PRE>
  W       L      Beta         Vt      K2     K5       DW       DL
  m       m      A/V^2        V       -      -        m        m
  12.e-6  4.e-6  0.062e-3    -4.5     0.24   0.61    -1.2e-6  -0.9e-6      depletion
  60.e-6  3.e-6  0.048e-3     0.1     0.08   0.68    -1.2e-6  -0.9e-6      enhancement
  12.e-6  4.e-6  0.0625e-3   -0.8     0.21   0.78    -1.2e-6  -0.9e-6      zero
  50.e-6  8.e-6  0.0299e-3    0.24    1.144  0.7311  -5.4e-6  -4.e-6
  20.e-6  6.e-6  0.041e-3     0.8     1.144  0.7311  -2.5e-6  -1.5e-6
  30.e-6  9.e-6  0.025e-3    -4.0     0.861  0.878   -3.4e-6  -1.74e-6
  30.e-6  5.e-6  0.031e-3     0.6     1.5    0.72     0       -3.9e-6
  50.e-6  6.e-6  0.0414e-3   -3.8     0.34   0.8     -1.6e-6  -2.e-6       depletion
  50.e-6  5.e-6  0.03e-3      0.37    0.23   0.86    -1.6e-6  -2.e-6       enhancement
  50.e-6  6.e-6  0.038e-3    -0.9     0.23   0.707   -1.6e-6  -2.e-6       zero
  20.e-6  4.e-6  0.06776e-3   0.5409  0.065  0.71    -0.8e-6  -0.2e-6
  20.e-6  4.e-6  0.06505e-3   0.6209  0.065  0.71    -0.8e-6  -0.2e-6
  20.e-6  4.e-6  0.05365e-3   0.6909  0.03   0.8     -0.3e-6  -0.2e-6
  20.e-6  4.e-6  0.05365e-3   0.4909  0.03   0.8     -0.3e-6  -0.2e-6
  12.e-6  4.e-6  0.023e-3    -4.5     0.29   0.6      0        0           depletion
  60.e-6  3.e-6  0.022e-3     0.1     0.11   0.65     0        0           enhancement
  12.e-6  4.e-6  0.038e-3    -0.8     0.33   0.6      0        0           zero
  20.e-6  6.e-6  0.022e-3     0.8     1      0.66     0        0
</PRE>

<DL>
<DT><b>References:</b></DT>
<DD>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag
Muenchen Wien 1990.</DD>
</DL>
</html>",
   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{91,50}}, color={0,0,255}),
            Line(points={{10,0},{90,0}}, color={0,0,255}),
            Line(points={{10,-50},{90,-50}}, color={0,0,255}),
            Polygon(
              points={{40,0},{60,5},{60,-5},{40,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-155,119},{145,79}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,0}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-96,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{96,50}}, color={0,0,255}),
            Line(points={{10,0},{96,0}}, color={0,0,255}),
            Line(points={{10,-50},{96,-50}}, color={0,0,255}),
            Polygon(
              points={{40,0},{60,5},{60,-5},{40,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
  end NMOS;

  model NPN "Simple BJT according to Ebers-Moll"
    parameter Real Bf=50 "Forward beta";
    parameter Real Br=0.1 "Reverse beta";
      parameter Modelica_SIunits.Current Is=1.e-16
        "Transport saturation current";
      parameter Modelica_SIunits.InversePotential Vak=0.02
        "Early voltage (inverse), 1/Volt";
      parameter Modelica_SIunits.Time Tauf=0.12e-9 "Ideal forward transit time";
      parameter Modelica_SIunits.Time Taur=5e-9 "Ideal reverse transit time";
      parameter Modelica_SIunits.Capacitance Ccs=1e-12
        "Collector-substrate(ground) cap.";
      parameter Modelica_SIunits.Capacitance Cje=0.4e-12
        "Base-emitter zero bias depletion cap.";
      parameter Modelica_SIunits.Capacitance Cjc=0.5e-12
        "Base-coll. zero bias depletion cap.";
      parameter Modelica_SIunits.Voltage Phie=0.8
        "Base-emitter diffusion voltage";
    parameter Real Me=0.4 "Base-emitter gradation exponent";
      parameter Modelica_SIunits.Voltage Phic=0.8
        "Base-collector diffusion voltage";
    parameter Real Mc=0.333 "Base-collector gradation exponent";
      parameter Modelica_SIunits.Conductance Gbc=1e-15
        "Base-collector conductance";
      parameter Modelica_SIunits.Conductance Gbe=1e-15
        "Base-emitter conductance";
      parameter Modelica_SIunits.Voltage Vt=0.02585
        "Voltage equivalent of temperature";
    parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
    parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
    parameter Modelica_SIunits.Voltage IC=0 "Initial Value";
    parameter Boolean UIC = false;

    extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=293.15);
    protected
    Real vbc;
    Real vbe;
    Real qbk;
    Real ibc;
    Real ibe;
    Real cbc;
    Real cbe;
    Real ExMin;
    Real ExMax;
    Real Capcje;
    Real Capcjc;
    function pow "Just a helper function for x^y"
      extends Modelica_Icons.Function;
      input Real x;
      input Real y;
      output Real z;
    algorithm
      z:=x^y;
    end pow;
    public
    Modelica_Electrical_Analog_Interfaces.Pin C "Collector" annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.Pin B "Base" annotation (Placement(
            transformation(extent={{-90,-10},{-110,10}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.Pin E "Emitter" annotation (Placement(
            transformation(extent={{90,-40},{110,-60}}, rotation=0)));
  initial equation
    if UIC then
      C.v = IC;
    end if;

  equation
    ExMin = exp(EMin);
    ExMax = exp(EMax);
    vbc = B.v - C.v;
    vbe = B.v - E.v;
    qbk = 1 - vbc*Vak;

    ibc = smooth(1,if (vbc/Vt < EMin) then Is*(ExMin*(vbc/Vt - EMin + 1) - 1) + vbc*Gbc else
            if (vbc/Vt > EMax) then Is*(ExMax*(vbc/Vt - EMax + 1) - 1) + vbc*
      Gbc else Is*(exp(vbc/Vt) - 1) + vbc*Gbc);
    ibe = smooth(1,if (vbe/Vt < EMin) then Is*(ExMin*(vbe/Vt - EMin + 1) - 1) + vbe*Gbe else
            if (vbe/Vt > EMax) then Is*(ExMax*(vbe/Vt - EMax + 1) - 1) + vbe*
      Gbe else Is*(exp(vbe/Vt) - 1) + vbe*Gbe);
    Capcjc = smooth(1,(if (vbc/Phic > 0) then Cjc*(1 + Mc*vbc/Phic) else Cjc*pow(1 - vbc
      /Phic, -Mc)));
    Capcje = smooth(1,(if (vbe/Phie > 0) then Cje*(1 + Me*vbe/Phie) else Cje*pow(1 - vbe
      /Phie, -Me)));
    cbc = smooth(1,(if (vbc/Vt < EMin) then Taur*Is/Vt*ExMin*(vbc/Vt - EMin + 1) +
      Capcjc else if (vbc/Vt > EMax) then Taur*Is/Vt*ExMax*(vbc/Vt - EMax + 1)
       + Capcjc else Taur*Is/Vt*exp(vbc/Vt) + Capcjc));
    cbe = smooth(1,(if (vbe/Vt < EMin) then Tauf*Is/Vt*ExMin*(vbe/Vt - EMin + 1) +
      Capcje else if (vbe/Vt > EMax) then Tauf*Is/Vt*ExMax*(vbe/Vt - EMax + 1)
       + Capcje else Tauf*Is/Vt*exp(vbe/Vt) + Capcje));
    C.i = (ibe - ibc)*qbk - ibc/Br - cbc*der(vbc) + Ccs*der(C.v);
    B.i = ibe/Bf + ibc/Br + cbc*der(vbc) + cbe*der(vbe);
    E.i = -B.i - C.i + Ccs*der(C.v);

    LossPower = (C.v-E.v)*(ibe-ibc)*qbk + vbc*ibc/Br + vbe*ibe/Bf;
    annotation (
      Documentation(info="<html>
<P>
This model is a simple model of a bipolar NPN junction transistor according
to Ebers-Moll.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled yet. The parameters are not temperature dependent.
</P>
<P>
A typical parameter set is:
</P>
<PRE>
  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe    Vt
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS     V
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15  0.02585
</PRE>
<DL>
<DT><b>References:</b></DT>
<DD>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design.
Van Nostrand Reinhold, New York 1983
on page 317 ff.</DD>
</DL>
</html>",
   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>

<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-90,0}}, color={0,0,255}),
            Line(points={{91,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{91,-50}}, color={0,0,255}),
            Polygon(
              points={{30,-50},{24,-36},{16,-44},{30,-50}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-152,117},{148,77}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-100,0}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{100,-50}}, color={0,0,255}),
            Line(points={{100,50},{30,50}}, color={0,0,255}),
            Polygon(
              points={{30,-50},{24,-36},{16,-44},{30,-50}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
  end NPN;

  model PNP "Simple BJT according to Ebers-Moll"
    parameter Real Bf=50 "Forward beta";
    parameter Real Br=0.1 "Reverse beta";
      parameter Modelica_SIunits.Current Is=1.e-16
        "Transport saturation current";
      parameter Modelica_SIunits.InversePotential Vak=0.02
        "Early voltage (inverse), 1/Volt";
      parameter Modelica_SIunits.Time Tauf=0.12e-9 "Ideal forward transit time";
      parameter Modelica_SIunits.Time Taur=5e-9 "Ideal reverse transit time";
      parameter Modelica_SIunits.Capacitance Ccs=1e-12
        "Collector-substrate(ground) cap.";
      parameter Modelica_SIunits.Capacitance Cje=0.4e-12
        "Base-emitter zero bias depletion cap.";
      parameter Modelica_SIunits.Capacitance Cjc=0.5e-12
        "Base-coll. zero bias depletion cap.";
      parameter Modelica_SIunits.Voltage Phie=0.8
        "Base-emitter diffusion voltage";
    parameter Real Me=0.4 "Base-emitter gradation exponent";
      parameter Modelica_SIunits.Voltage Phic=0.8
        "Base-collector diffusion voltage";
    parameter Real Mc=0.333 "Base-collector gradation exponent";
      parameter Modelica_SIunits.Conductance Gbc=1e-15
        "Base-collector conductance";
      parameter Modelica_SIunits.Conductance Gbe=1e-15
        "Base-emitter conductance";
      parameter Modelica_SIunits.Voltage Vt=0.02585
        "Voltage equivalent of temperature";
    parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
    parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
    extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=293.15);
    protected
    Real vbc;
    Real vbe;
    Real qbk;
    Real ibc;
    Real ibe;
    Real cbc;
    Real cbe;
    Real ExMin;
    Real ExMax;
    Real Capcje;
    Real Capcjc;
    function pow "Just a helper function for x^y"
      extends Modelica_Icons.Function;
      input Real x;
      input Real y;
      output Real z;
    algorithm
      z:=x^y;
    end pow;
    public
    Modelica_Electrical_Analog_Interfaces.Pin C "Collector" annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.Pin B "Base" annotation (Placement(
            transformation(extent={{-90,-10},{-110,10}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.Pin E "Emitter" annotation (Placement(
            transformation(extent={{90,-40},{110,-60}}, rotation=0)));
  equation
    ExMin = exp(EMin);
    ExMax = exp(EMax);
    vbc = C.v - B.v;
    vbe = E.v - B.v;
    qbk = 1 - vbc*Vak;

    ibc = smooth(1,(if (vbc/Vt < EMin) then Is*(ExMin*(vbc/Vt - EMin + 1) - 1) + vbc*Gbc else
            if (vbc/Vt > EMax) then Is*(ExMax*(vbc/Vt - EMax + 1) - 1) + vbc*
      Gbc else Is*(exp(vbc/Vt) - 1) + vbc*Gbc));

    ibe = smooth(1,(if (vbe/Vt < EMin) then Is*(ExMin*(vbe/Vt - EMin + 1) - 1) + vbe*Gbe else
            if (vbe/Vt > EMax) then Is*(ExMax*(vbe/Vt - EMax + 1) - 1) + vbe*
      Gbe else Is*(exp(vbe/Vt) - 1) + vbe*Gbe));

    Capcjc = smooth(1,(if (vbc/Phic > 0) then Cjc*(1 + Mc*vbc/Phic) else Cjc*pow(1 - vbc
      /Phic, -Mc)));
    Capcje = smooth(1,if (vbe/Phie > 0) then Cje*(1 + Me*vbe/Phie) else Cje*pow(1 - vbe
      /Phie, -Me));
    cbc = smooth(1,(if (vbc/Vt < EMin) then Taur*Is/Vt*ExMin*(vbc/Vt - EMin + 1) +
      Capcjc else if (vbc/Vt > EMax) then Taur*Is/Vt*ExMax*(vbc/Vt - EMax + 1)
       + Capcjc else Taur*Is/Vt*exp(vbc/Vt) + Capcjc));
    cbe = smooth(1,(if (vbe/Vt < EMin) then Tauf*Is/Vt*ExMin*(vbe/Vt - EMin + 1) +
      Capcje else if (vbe/Vt > EMax) then Tauf*Is/Vt*ExMax*(vbe/Vt - EMax + 1)
       + Capcje else Tauf*Is/Vt*exp(vbe/Vt) + Capcje));
    C.i = -((ibe - ibc)*qbk - ibc/Br - cbc*der(vbc) - Ccs*der(C.v));
    B.i = -(ibe/Bf + ibc/Br + cbe*der(vbe) + cbc*der(vbc));
    E.i = -B.i - C.i + Ccs*der(C.v);

    LossPower = (E.v-C.v)*(ibe-ibc)*qbk + vbc*ibc/Br + vbe*ibe/Bf;
                                                                      annotation (
      Documentation(info="<html>
<P>
This model is a simple model of a bipolar PNP junction transistor according
to Ebers-Moll.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled yet. The parameters are not temperature dependent.
<P>
A typical parameter set is:
</P>
<PRE>
  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe    Vt
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS     V
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15  0.02585
</PRE>
<DL>
<DT><b>References:</b></DT>
<DD>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design.
Van Nostrand Reinhold, New York 1983
on page 317 ff.</DD>
</DL>
</html>",
   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>

<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-90,0}}, color={0,0,255}),
            Line(points={{91,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{91,-50}}, color={0,0,255}),
            Polygon(
              points={{-10,-10},{5,-17},{-3,-25},{-10,-10}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-158,119},{142,79}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-99,0}}, color={0,0,255}),
            Line(points={{100,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{99,-50}}, color={0,0,255}),
            Polygon(
              points={{-10,-10},{5,-17},{-3,-25},{-10,-10}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
  end PNP;

  model HeatingDiode "Simple diode with heating port"
    extends Modelica_Electrical_Analog_Interfaces.OnePort;
    parameter Modelica_SIunits.Current Ids=1.e-6 "Saturation current";
    /* parameter Modelica.SIunits.Voltage Vt=0.04 "Voltage equivalent of temperature (kT/qn)"; */
    parameter Real Maxexp(final min=Modelica_Constants.small) = 15
        "Max. exponent for linear continuation";
    parameter Modelica_SIunits.Resistance R=1.e8 "Parallel ohmic resistance";
    parameter Real EG=1.11 "activation energy";
    parameter Real N=1 "Emission coefficient";
    parameter Modelica_SIunits.Temperature TNOM=300.15
        "Parameter measurement temperature";
    parameter Real XTI=3 "Temperature exponent of saturation current";
    extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(
          useHeatPort=true);

    Modelica_SIunits.Temperature vt_t "Temperature voltage";
    Modelica_SIunits.Current id "diode current";
    protected
    Real k=1.380662e-23 "Boltzmann's constant, J/K";
    Real q=1.6021892e-19 "Electron charge, As";
    Modelica_SIunits.Temperature htemp "auxiliary temperature";
    Real aux;
    Real auxp;
    Real maxexp=exp(Maxexp);
  equation
    assert( T_heatPort > 0,"temperature must be positive");
    htemp = T_heatPort;
    vt_t = k*htemp/q;

    id = exlin((v/(N*vt_t)), Maxexp) - 1;

    aux = (htemp/TNOM - 1)*EG/(N*vt_t);
    auxp = exp(aux);

    i = Ids*id*pow(htemp/TNOM, XTI/N)*auxp + v/R;

    LossPower = i*v;
    annotation (
      Documentation(info="<html>
<P>
The simple diode is an electrical one port, where a heat port is added, which is
defined in the Modelica.Thermal library. It consists of the diode itself and an parallel ohmic
resistance <i>R</i>. The diode formula is:
</P>
<PRE>
                v/vt_t
  i  =  ids ( e        - 1).

</PRE>
where vt_t depends on the temperature of the heat port:
<PRE>
  vt_t = k*temp/q
</PRE>
<P>
If the exponent <i>v/vt_t</i> reaches the limit <i>maxex</i>, the diode characteristic is linearly
continued to avoid overflow.<br>
The thermal power is calculated by <i>i*v</i>.
</P>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>April 5, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Text(
              extent={{-152,114},{148,74}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-101},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
          Polygon(
            points={{30,0},{-30,40},{-30,-40},{30,0}},
            lineColor={0,0,255},
            fillColor={255,0,0},
            fillPattern=FillPattern.None),
          Line(points={{-96,0},{96,0}}, color={0,0,255}),
          Line(points={{30,40},{30,-40}}, color={0,0,255})}));
  end HeatingDiode;

          model HeatingNMOS "Simple MOS Transistor with heating port"

            Modelica_Electrical_Analog_Interfaces.Pin D "Drain" annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin G "Gate" annotation (
          Placement(transformation(extent={{-90,-40},{-110,-60}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin S "Source" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin B "Bulk" annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
            parameter Modelica_SIunits.Length W=20.e-6 "Width";
            parameter Modelica_SIunits.Length L=6.e-6 "Length";
            parameter Modelica_SIunits.Transconductance Beta=0.041e-3
        "Transconductance parameter";
            parameter Modelica_SIunits.Voltage Vt=0.8
        "Zero bias threshold voltage";
            parameter Real K2=1.144 "Bulk threshold parameter";
            parameter Real K5=0.7311 "Reduction of pinch-off region";
            parameter Modelica_SIunits.Length dW=-2.5e-6 "Narrowing of channel";
            parameter Modelica_SIunits.Length dL=-1.5e-6
        "Shortening of channel";
            parameter Modelica_SIunits.Resistance RDS=1.e+7
        "Drain-Source-Resistance";
            parameter Modelica_SIunits.Temperature Tnom=300.15
        "Parameter measurement temperature";
            parameter Real kvt=-6.96e-3 "Fitting parameter for Vt";
            parameter Real kk2=6.0e-4 "Fitting parameter for K2";
            extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(
          useHeatPort=true);
    protected
            Real v;
            Real uds;
            Real ubs;
            Real ugst;
            Real ud;
            Real us;
            Real id;
            Real gds;
            Real beta_t;
            Real vt_t;
            Real k2_t;
          equation
            assert(L + dL > 0, "Heating NMOS: Effective length must be positive");
            assert(W + dW > 0, "Heating NMOS: Effective width  must be positive");
            assert(T_heatPort > 0,"Heating NMOS: Temperature must be positive");
            gds = if (RDS < 1.e-20 and RDS > -1.e-20) then 1.e20 else 1/RDS;
            v = beta_t*(W + dW)/(L + dL);
            ud = smooth(0,if (D.v < S.v) then S.v else D.v);
            us = smooth(0,if (D.v < S.v) then D.v else S.v);
            uds = ud - us;
            ubs = smooth(0,if (B.v > us) then 0 else B.v - us);
            ugst = (G.v - us - vt_t + k2_t*ubs)*K5;
            id = smooth(0,if (ugst <= 0) then uds*gds else if (ugst > uds) then v*uds*(
              ugst - uds/2) + uds*gds else v*ugst*ugst/2 + uds*gds);

            beta_t = Beta*pow((T_heatPort/Tnom), -1.5);
            vt_t = Vt*(1 + (T_heatPort - Tnom)*kvt);
            k2_t = K2*(1 + (T_heatPort - Tnom)*kk2);

            G.i = 0;
            D.i = smooth(0,if (D.v < S.v) then -id else id);
            S.i = smooth(0,if (D.v < S.v) then id else -id);
            B.i = 0;
            LossPower = D.i*(D.v - S.v);
            annotation (
              Documentation(info="<html>
<p>The NMOS model is a simple model of a n-channel metal-oxide semiconductor FET. It differs slightly from the device used in the SPICE simulator. For more details please care for H. Spiro.
<br> A heating port is added for thermal electric simulation. The heating port is defined in the Modelica.Thermal library.
<br>The model does not consider capacitances. A high drain-source resistance RDS is included to avoid numerical difficulties.
</p>
<PRE>
  W       L      Beta         Vt      K2     K5       DW       DL
  m       m      A/V^2        V       -      -        m        m
  12.e-6  4.e-6  0.062e-3    -4.5     0.24   0.61    -1.2e-6  -0.9e-6      depletion
  60.e-6  3.e-6  0.048e-3     0.1     0.08   0.68    -1.2e-6  -0.9e-6      enhancement
  12.e-6  4.e-6  0.0625e-3   -0.8     0.21   0.78    -1.2e-6  -0.9e-6      zero
  50.e-6  8.e-6  0.0299e-3    0.24    1.144  0.7311  -5.4e-6  -4.e-6
  20.e-6  6.e-6  0.041e-3     0.8     1.144  0.7311  -2.5e-6  -1.5e-6
  30.e-6  9.e-6  0.025e-3    -4.0     0.861  0.878   -3.4e-6  -1.74e-6
  30.e-6  5.e-6  0.031e-3     0.6     1.5    0.72     0       -3.9e-6
  50.e-6  6.e-6  0.0414e-3   -3.8     0.34   0.8     -1.6e-6  -2.e-6       depletion
  50.e-6  5.e-6  0.03e-3      0.37    0.23   0.86    -1.6e-6  -2.e-6       enhancement
  50.e-6  6.e-6  0.038e-3    -0.9     0.23   0.707   -1.6e-6  -2.e-6       zero
  20.e-6  4.e-6  0.06776e-3   0.5409  0.065  0.71    -0.8e-6  -0.2e-6
  20.e-6  4.e-6  0.06505e-3   0.6209  0.065  0.71    -0.8e-6  -0.2e-6
  20.e-6  4.e-6  0.05365e-3   0.6909  0.03   0.8     -0.3e-6  -0.2e-6
  20.e-6  4.e-6  0.05365e-3   0.4909  0.03   0.8     -0.3e-6  -0.2e-6
  12.e-6  4.e-6  0.023e-3    -4.5     0.29   0.6      0        0           depletion
  60.e-6  3.e-6  0.022e-3     0.1     0.11   0.65     0        0           enhancement
  12.e-6  4.e-6  0.038e-3    -0.8     0.33   0.6      0        0           zero
  20.e-6  6.e-6  0.022e-3     0.8     1      0.66     0        0
</PRE>
<p><b>References:</b></p>
<p>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag Muenchen Wien 1990.</p>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i>March 31, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{91,50}}, color={0,0,255}),
            Line(points={{10,0},{90,0}}, color={0,0,255}),
            Line(points={{10,-50},{90,-50}}, color={0,0,255}),
            Polygon(
              points={{40,0},{60,5},{60,-5},{40,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-152,118},{148,78}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,0}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-96,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{96,50}}, color={0,0,255}),
            Line(points={{10,0},{96,0}}, color={0,0,255}),
            Line(points={{10,-50},{96,-50}}, color={0,0,255}),
            Polygon(
              points={{40,0},{60,5},{60,-5},{40,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
          end HeatingNMOS;

          model HeatingPMOS "Simple PMOS Transistor with heating port"

            Modelica_Electrical_Analog_Interfaces.Pin D "Drain" annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin G "Gate" annotation (
          Placement(transformation(extent={{-90,-40},{-110,-60}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin S "Source" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin B "Bulk" annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
            parameter Modelica_SIunits.Length W=20.0e-6 "Width";
            parameter Modelica_SIunits.Length L=6.0e-6 "Length";
            parameter Modelica_SIunits.Transconductance Beta=0.0105e-3
        "Transconductance parameter";
            parameter Modelica_SIunits.Voltage Vt=-1.0
        "Zero bias threshold voltage";
            parameter Real K2=0.41 "Bulk threshold parameter";
            parameter Real K5=0.839 "Reduction of pinch-off region";
            parameter Modelica_SIunits.Length dW=-2.5e-6 "Narrowing of channel";
            parameter Modelica_SIunits.Length dL=-2.1e-6
        "Shortening of channel";
            parameter Modelica_SIunits.Resistance RDS=1.e+7
        "Drain-Source-Resistance";
            parameter Modelica_SIunits.Temperature Tnom=300.15
        "Parameter measurement temperature";
            parameter Real kvt=-2.9e-3 "Fitting parameter for Vt";
            parameter Real kk2=6.2e-4 "Fitting parameter for K2";
            extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(
          useHeatPort=true);
    protected
            Real v;
            Real uds;
            Real ubs;
            Real ugst;
            Real ud;
            Real us;
            Real id;
            Real gds;
            Real beta_t;
            Real vt_t;
            Real k2_t;
          equation
            assert(L + dL > 0, "HeatingPMOS: Effective length must be positive");
            assert(W + dW > 0, "HeatingPMOS: Effective width  must be positive");
            assert( T_heatPort > 0,"HeatingPMOS: Temperature must be positive");
            gds = if (RDS < 1.e-20 and RDS > -1.e-20) then 1.e20 else 1/RDS;
            v = beta_t*(W + dW)/(L + dL);
            ud = smooth(0,if (D.v > S.v) then S.v else D.v);
            us = smooth(0,if (D.v > S.v) then D.v else S.v);
            uds = ud - us;
            ubs = smooth(0,if (B.v < us) then 0 else B.v - us);
            ugst = (G.v - us - vt_t + k2_t*ubs)*K5;
            id = smooth(0,if (ugst >= 0) then uds*gds else if (ugst < uds) then -v*uds*(
              ugst - uds/2) + uds*gds else -v*ugst*ugst/2 + uds*gds);

            beta_t = Beta*pow((T_heatPort/Tnom), -1.5);
            vt_t = Vt*(1 + (T_heatPort - Tnom)*kvt);
            k2_t = K2*(1 + (T_heatPort - Tnom)*kk2);

            G.i = 0;
            D.i = smooth(0,if (D.v > S.v) then -id else id);
            S.i = smooth(0,if (D.v > S.v) then id else -id);
            B.i = 0;
            LossPower = D.i*(D.v - S.v);
            annotation (
              Documentation(info="<html>
<p>The PMOS model is a simple model of a p-channel metal-oxide semiconductor FET. It differs slightly from the device used in the SPICE simulator. For more details please care for H. Spiro.
<br>A heating port is added for thermal electric simulation. The heating port is defined in the Modelica.Thermal library.
<br>The model does not consider capacitances. A high drain-source resistance RDS is included to avoid numerical difficulties.</p>
<dl><dt><b>References:</b> </dt>
<dd>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag Muenchen Wien 1990. </dd>
</dl><p>Some typical parameter sets are:</p>
<PRE>
  W       L      Beta        Vt    K2     K5      DW       DL
  m       m      A/V^2       V     -      -       m        m
  50.e-6  8.e-6  0.0085e-3  -0.15  0.41   0.839  -3.8e-6  -4.0e-6
  20.e-6  6.e-6  0.0105e-3  -1.0   0.41   0.839  -2.5e-6  -2.1e-6
  30.e-6  5.e-6  0.0059e-3  -0.3   0.98   1.01    0       -3.9e-6
  30.e-6  5.e-6  0.0152e-3  -0.69  0.104  1.1    -0.8e-6  -0.4e-6
  30.e-6  5.e-6  0.0163e-3  -0.69  0.104  1.1    -0.8e-6  -0.4e-6
  30.e-6  5.e-6  0.0182e-3  -0.69  0.086  1.06   -0.1e-6  -0.6e-6
  20.e-6  6.e-6  0.0074e-3  -1.    0.4    0.59    0        0
</PRE>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i>March 31, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{91,50}}, color={0,0,255}),
            Line(points={{10,0},{90,0}}, color={0,0,255}),
            Line(points={{10,-50},{90,-50}}, color={0,0,255}),
            Polygon(
              points={{60,0},{40,5},{40,-5},{60,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-155,120},{145,80}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,0}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-100,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{96,50}}, color={0,0,255}),
            Line(points={{10,0},{101,0}}, color={0,0,255}),
            Line(points={{10,-50},{100,-50}}, color={0,0,255}),
            Polygon(
              points={{60,0},{40,5},{40,-5},{60,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
          end HeatingPMOS;

          model HeatingNPN
      "Simple NPN BJT according to Ebers-Moll with heating port"
            parameter Real Bf=50 "Forward beta";
            parameter Real Br=0.1 "Reverse beta";
            parameter Modelica_SIunits.Current Is=1.e-16
        "Transport saturation current";
            parameter Modelica_SIunits.InversePotential Vak=0.02
        "Early voltage (inverse), 1/Volt";
            parameter Modelica_SIunits.Time Tauf=0.12e-9
        "Ideal forward transit time";
            parameter Modelica_SIunits.Time Taur=5e-9
        "Ideal reverse transit time";
            parameter Modelica_SIunits.Capacitance Ccs=1e-12
        "Collector-substrate(ground) cap.";
            parameter Modelica_SIunits.Capacitance Cje=0.4e-12
        "Base-emitter zero bias depletion cap.";
            parameter Modelica_SIunits.Capacitance Cjc=0.5e-12
        "Base-coll. zero bias depletion cap.";
            parameter Modelica_SIunits.Voltage Phie=0.8
        "Base-emitter diffusion voltage";
            parameter Real Me=0.4 "Base-emitter gradation exponent";
            parameter Modelica_SIunits.Voltage Phic=0.8
        "Base-collector diffusion voltage";
            parameter Real Mc=0.333 "Base-collector gradation exponent";
            parameter Modelica_SIunits.Conductance Gbc=1e-15
        "Base-collector conductance";
            parameter Modelica_SIunits.Conductance Gbe=1e-15
        "Base-emitter conductance";
            parameter Real EMin=-100
        "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40
        "if x > EMax, the exp(x) function is linearized";
            parameter Modelica_SIunits.Temperature Tnom=300.15
        "Parameter measurement temperature";
            parameter Real XTI=3 "Temperature exponent for effect on Is";
            parameter Real XTB=0
        "Forward and reverse beta temperature exponent";
            parameter Real EG=1.11 "Energy gap for temperature effect on Is";
            parameter Real NF=1.0 "Forward current emission coefficient";
            parameter Real NR=1.0 "Reverse current emission coefficient";
            parameter Real K=1.3806226e-23 "Boltzmann's constant";
            parameter Real q=1.6021918e-19 "Elementary electronic charge";
            extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(
          useHeatPort=true);
            /*protected*/
            Real vbc;
            Real vbe;
            Real qbk;
            Real ibc;
            Real ibe;
            Real cbc;
            Real cbe;
            Real ExMin;
            Real ExMax;
            Real Capcje;
            Real Capcjc;
            Real is_t;
            Real br_t;
            Real bf_t;
            Real vt_t;
            Real hexp;
            Real htempexp;
    public
            Modelica_Electrical_Analog_Interfaces.Pin C "Collector" annotation (Placement(
            transformation(extent={{90,40},{110,60}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin B "Base" annotation (
          Placement(transformation(extent={{-90,-10},{-110,10}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin E "Emitter" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
          equation
            assert( T_heatPort > 0,"temperature must be positive");
            ExMin = exp(EMin);
            ExMax = exp(EMax);
            vbc = B.v - C.v;
            vbe = B.v - E.v;
            qbk = 1 - vbc*Vak;

            hexp = (T_heatPort/Tnom - 1)*EG/vt_t;
            htempexp = smooth(1,if (hexp < EMin) then ExMin*(hexp - EMin + 1) else if (
              hexp > EMax) then ExMax*(hexp - EMax + 1) else exp(hexp));

            is_t = Is*pow((T_heatPort/Tnom), XTI)*htempexp;
            br_t = Br*pow((T_heatPort/Tnom), XTB);
            bf_t = Bf*pow((T_heatPort/Tnom), XTB);
            vt_t = (K/q)*T_heatPort;

            ibc = smooth(1,(if (vbc/(NR*vt_t) < EMin) then is_t*(ExMin*(vbc/(NR*vt_t) -
              EMin + 1) - 1) + vbc*Gbc else if (vbc/(NR*vt_t) > EMax) then is_t*(
              ExMax*(vbc/(NR*vt_t) - EMax + 1) - 1) + vbc*Gbc else is_t*(exp(vbc/
              (NR*vt_t)) - 1) + vbc*Gbc));
            ibe = smooth(1,(if (vbe/(NF*vt_t) < EMin) then is_t*(ExMin*(vbe/(NF*vt_t) -
              EMin + 1) - 1) + vbe*Gbe else if (vbe/(NF*vt_t) > EMax) then is_t*(
              ExMax*(vbe/(NF*vt_t) - EMax + 1) - 1) + vbe*Gbe else is_t*(exp(vbe/
              (NF*vt_t)) - 1) + vbe*Gbe));
            Capcjc = smooth(1,(if (vbc/Phic > 0) then Cjc*(1 + Mc*vbc/Phic) else Cjc*pow(1
               - vbc/Phic, -Mc)));
            Capcje = smooth(1,(if (vbe/Phie > 0) then Cje*(1 + Me*vbe/Phie) else Cje*pow(1
               - vbe/Phie, -Me)));
            cbc = smooth(1,(if (vbc/(NR*vt_t) < EMin) then Taur*is_t/(NR*vt_t)*ExMin*(vbc/(
              NR*vt_t) - EMin + 1) + Capcjc else if (vbc/(NR*vt_t) > EMax) then
              Taur*is_t/(NR*vt_t)*ExMax*(vbc/(NR*vt_t) - EMax + 1) + Capcjc else
              Taur*is_t/(NR*vt_t)*exp(vbc/(NR*vt_t)) + Capcjc));
            cbe = smooth(1,(if (vbe/(NF*vt_t) < EMin) then Tauf*is_t/(NF*vt_t)*ExMin*(vbe/(
              NF*vt_t) - EMin + 1) + Capcje else if (vbe/(NF*vt_t) > EMax) then
              Tauf*is_t/(NF*vt_t)*ExMax*(vbe/(NF*vt_t) - EMax + 1) + Capcje else
              Tauf*is_t/(NF*vt_t)*exp(vbe/(NF*vt_t)) + Capcje));
            C.i = (ibe - ibc)*qbk - ibc/br_t - cbc*der(vbc) + Ccs*der(C.v);
            B.i = ibe/bf_t + ibc/br_t + cbc*der(vbc) + cbe*der(vbe);
            E.i = -B.i - C.i + Ccs*der(C.v);

            LossPower = (vbc*ibc/br_t + vbe*ibe/bf_t + (ibe - ibc)*qbk*(C.v - E.v));
            annotation (
              Documentation(info="<html>
<p>This model is a simple model of a bipolar NPN junction transistor according to Ebers-Moll.
<br>A heating port is added for thermal electric simulation. The heating port is defined in the Modelica.Thermal library.
<br>A typical parameter set is (the parameter Vt is no longer used):</p>
<pre>  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15</pre>
<p><b>References:</b></p>
<p>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design. Van Nostrand Reinhold, New York 1983 on page 317 ff.</p>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>March 20, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-90,0}}, color={0,0,255}),
            Line(points={{91,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{91,-50}}, color={0,0,255}),
            Polygon(
              points={{30,-50},{24,-36},{16,-44},{30,-50}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-162,125},{138,85}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-100,0}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{100,-50}}, color={0,0,255}),
            Line(points={{100,50},{30,50}}, color={0,0,255}),
            Polygon(
              points={{30,-50},{24,-36},{16,-44},{30,-50}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
          end HeatingNPN;

          model HeatingPNP
      "Simple PNP BJT according to Ebers-Moll with heating port"
            parameter Real Bf=50 "Forward beta";
            parameter Real Br=0.1 "Reverse beta";
            parameter Modelica_SIunits.Current Is=1.e-16
        "Transport saturation current";
            parameter Modelica_SIunits.InversePotential Vak=0.02
        "Early voltage (inverse), 1/Volt";
            parameter Modelica_SIunits.Time Tauf=0.12e-9
        "Ideal forward transit time";
            parameter Modelica_SIunits.Time Taur=5e-9
        "Ideal reverse transit time";
            parameter Modelica_SIunits.Capacitance Ccs=1e-12
        "Collector-substrate(ground) cap.";
            parameter Modelica_SIunits.Capacitance Cje=0.4e-12
        "Base-emitter zero bias depletion cap.";
            parameter Modelica_SIunits.Capacitance Cjc=0.5e-12
        "Base-coll. zero bias depletion cap.";
            parameter Modelica_SIunits.Voltage Phie=0.8
        "Base-emitter diffusion voltage";
            parameter Real Me=0.4 "Base-emitter gradation exponent";
            parameter Modelica_SIunits.Voltage Phic=0.8
        "Base-collector diffusion voltage";
            parameter Real Mc=0.333 "Base-collector gradation exponent";
            parameter Modelica_SIunits.Conductance Gbc=1e-15
        "Base-collector conductance";
            parameter Modelica_SIunits.Conductance Gbe=1e-15
        "Base-emitter conductance";
            parameter Real EMin=-100
        "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40
        "if x > EMax, the exp(x) function is linearized";
            parameter Modelica_SIunits.Temperature Tnom=300.15
        "Parameter measurement temperature";
            parameter Real XTI=3 "Temperature exponent for effect on Is";
            parameter Real XTB=0
        "Forward and reverse beta temperature exponent";
            parameter Real EG=1.11 "Energy gap for temperature effect on Is";
            parameter Real NF=1.0 "Forward current emission coefficient";
            parameter Real NR=1.0 "Reverse current emission coefficient";
            parameter Real K=1.3806226e-23 "Boltzmann's constant";
            parameter Real q=1.6021918e-19 "Elementary electronic charge";
            extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(
          useHeatPort=true);
    protected
            Real vcb;
            Real veb;
            Real qbk;
            Real icb;
            Real ieb;
            Real ccb;
            Real ceb;
            Real ExMin;
            Real ExMax;
            Real Capcje;
            Real Capcjc;
            Real is_t;
            Real br_t;
            Real bf_t;
            Real vt_t;
            Real hexp;
            Real htempexp;
    public
            Modelica_Electrical_Analog_Interfaces.Pin C "Collector" annotation (Placement(
            transformation(extent={{90,40},{110,60}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin B "Base" annotation (
          Placement(transformation(extent={{-90,-10},{-110,10}}, rotation=0)));
            Modelica_Electrical_Analog_Interfaces.Pin E "Emitter" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
          equation
            assert( T_heatPort > 0,"temperature must be positive");
            ExMin = exp(EMin);
            ExMax = exp(EMax);
            vcb = C.v - B.v;
            veb = E.v - B.v;
            qbk = 1 - vcb*Vak;

            hexp = (T_heatPort/Tnom - 1)*EG/vt_t;
            htempexp = smooth(1,if (hexp < EMin) then ExMin*(hexp - EMin + 1) else if (
              hexp > EMax) then ExMax*(hexp - EMax + 1) else exp(hexp));

            is_t = Is*pow((T_heatPort/Tnom), XTI)*htempexp;
            br_t = Br*pow((T_heatPort/Tnom), XTB);
            bf_t = Bf*pow((T_heatPort/Tnom), XTB);
            vt_t = (K/q)*T_heatPort;

            icb = smooth(1,(if (vcb/(NR*vt_t) < EMin) then is_t*(ExMin*(vcb/(NR*vt_t) -
              EMin + 1) - 1) + vcb*Gbc else if (vcb/(NR*vt_t) > EMax) then is_t*(
              ExMax*(vcb/(NR*vt_t) - EMax + 1) - 1) + vcb*Gbc else is_t*(exp(vcb/
              (NR*vt_t)) - 1) + vcb*Gbc));

            ieb = smooth(1,(if (veb/(NF*vt_t) < EMin) then is_t*(ExMin*(veb/(NF*vt_t) -
              EMin + 1) - 1) + veb*Gbe else if (veb/(NF*vt_t) > EMax) then is_t*(
              ExMax*(veb/(NF*vt_t) - EMax + 1) - 1) + veb*Gbe else is_t*(exp(veb/
              (NF*vt_t)) - 1) + veb*Gbe));

            Capcjc = smooth(1,(if (vcb/Phic > 0) then Cjc*(1 + Mc*vcb/Phic) else Cjc*pow(1
               - vcb/Phic, -Mc)));
            Capcje = smooth(1,(if (veb/Phie > 0) then Cje*(1 + Me*veb/Phie) else Cje*pow(1
               - veb/Phie, -Me)));
            ccb = smooth(1,(if (vcb/(NR*vt_t) < EMin) then Taur*is_t/(NR*vt_t)*ExMin*(vcb/(
              NR*vt_t) - EMin + 1) + Capcjc else if (vcb/(NR*vt_t) > EMax) then
              Taur*is_t/(NR*vt_t)*ExMax*(vcb/(NR*vt_t) - EMax + 1) + Capcjc else
              Taur*is_t/(NR*vt_t)*exp(vcb/(NR*vt_t)) + Capcjc));
            ceb = smooth(1,(if (veb/(NF*vt_t) < EMin) then Tauf*is_t/(NF*vt_t)*ExMin*(veb/(
              NF*vt_t) - EMin + 1) + Capcje else if (veb/(NF*vt_t) > EMax) then
              Tauf*is_t/(NF*vt_t)*ExMax*(veb/(NF*vt_t) - EMax + 1) + Capcje else
              Tauf*is_t/(NF*vt_t)*exp(veb/(NF*vt_t)) + Capcje));
            C.i = icb/br_t + ccb*der(vcb) + Ccs*der(C.v) + (icb - ieb)*qbk;
            B.i = -ieb/bf_t - icb/br_t - ceb*der(veb) - ccb*der(vcb);
            E.i = -B.i - C.i + Ccs*der(C.v);

            LossPower = (vcb*icb/br_t + veb*ieb/bf_t + (icb - ieb)*qbk*(C.v- E.v));
            annotation (
              Documentation(info="<html>
<p>This model is a simple model of a bipolar PNP junction transistor according to Ebers-Moll.
<br>A heating port is added for thermal electric simulation. The heating port is defined in the Modelica.Thermal library.
<br>A typical parameter set is (the parameter Vt is no longer used):</p>
<pre>  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15</pre>
<p><b>References:</b></p>
<p>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design. Van Nostrand Reinhold, New York 1983 on page 317 ff.</p>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>March 20, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-90,0}}, color={0,0,255}),
            Line(points={{91,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{91,-50}}, color={0,0,255}),
            Polygon(
              points={{-10,-10},{5,-17},{-3,-25},{-10,-10}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-155,117},{145,77}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-99,0}}, color={0,0,255}),
            Line(points={{96,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{96,-50}}, color={0,0,255}),
            Polygon(
              points={{-10,-10},{5,-17},{-3,-25},{-10,-10}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
          end HeatingPNP;

  protected
          function pow
      "Just a helper function for x^y in order that a symbolic engine can apply some transformations more easily"
            extends Modelica_Icons.Function;
            input Real x;
            input Real y;
            output Real z;
          algorithm
            z := x^y;
          end pow;

          function exlin
      "Exponential function linearly continued for x > Maxexp"
            extends Modelica_Icons.Function;
            input Real x;
            input Real Maxexp;
            output Real z;
          algorithm
            z := if x > Maxexp then exp(Maxexp)*(1 + x - Maxexp) else exp(x);
          end exlin;

  public
    model Thyristor "Simple Thyristor Model"
      parameter Modelica_SIunits.Voltage VDRM(final min=0) = 100
        "Forward breakthrough voltage";
      parameter Modelica_SIunits.Voltage VRRM(final min=0) = 100
        "Reverse breakthrough voltage";
      parameter Modelica_SIunits.Current IDRM=0.1 "Saturation current";
      parameter Modelica_SIunits.Voltage VTM= 1.7 "Conducting voltage";
      parameter Modelica_SIunits.Current IH=6e-3 "Holding current";
      parameter Modelica_SIunits.Current ITM= 25 "Conducting current";

      parameter Modelica_SIunits.Voltage VGT= 0.7 "Gate trigger voltage";
      parameter Modelica_SIunits.Current IGT= 5e-3 "Gate trigger current";

      parameter Modelica_SIunits.Time TON = 1e-6 "Switch on time";
      parameter Modelica_SIunits.Time TOFF = 15e-6 "Switch off time";
      parameter Modelica_SIunits.Voltage Vt=0.04
        "Voltage equivalent of temperature (kT/qn)";
      parameter Real Nbv=0.74 "Reverse Breakthrough emission coefficient";
     extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort;
      Real iGK "gate current";
      Real vGK "voltage between gate and cathode";
      Real vAK "voltage between anode and cathode";
      Real vControl(start=0);
      Real vContot;
      Real vConmain;

    public
      Modelica_Electrical_Analog_Interfaces.PositivePin Anode annotation (
          Placement(transformation(extent={{-95,-12},{-75,8}}),
            iconTransformation(extent={{-100,-10},{-80,10}})));
      Modelica_Electrical_Analog_Interfaces.NegativePin Cathode annotation (
          Placement(transformation(extent={{80,-10},{100,10}}),
            iconTransformation(extent={{80,-10},{100,10}})));
      Modelica_Electrical_Analog_Interfaces.PositivePin Gate annotation (
          Placement(transformation(extent={{60,80},{80,100}}),
            iconTransformation(extent={{60,80},{80,100}})));

    protected
      parameter Modelica_SIunits.Voltage Von=5;
      parameter Modelica_SIunits.Voltage Voff= 1.5;
      parameter Modelica_SIunits.Resistance Ron=(VTM-0.7)/ITM
        "Forward conducting mode resistance";
      parameter Modelica_SIunits.Resistance Roff=(VDRM^2)/VTM/IH
        "Blocking mode resistance";

    equation
      //Kirchhoff's equations
      Anode.i+Gate.i+Cathode.i=0;
      vGK=Gate.v-Cathode.v;
      vAK=Anode.v-Cathode.v;

      // Gate and Control voltage
      iGK = Gate.i;
      vGK = smooth(0,(if vGK < 0.65 then VGT/IGT*iGK else
            0.65^2/VGT+iGK*(VGT-0.65)/IGT));
      vContot = vConmain + smooth(0, if iGK < 0.95 * IGT then 0 else if iGK < 0.95*IGT + 1e-3 then 10000*(iGK-0.95*IGT)*vAK else 10* vAK);
      der(vControl)= (vContot - vControl) / (if (vContot - vControl) > 0 then 1.87*TON else 0.638*TOFF);

      // Anode-Cathode characteristics
      Anode.i= smooth(1, if vAK < -VRRM then -VRRM/Roff*exp(-(vAK+VRRM)/(Nbv*Vt)) else
             if vControl<Voff then vAK/Roff else
             if vControl<Von then vAK/(sqrt(Ron*Roff)*(Ron/Roff)^((3*((2*vControl-Von-Voff)/(2*(Von-Voff)))-4*((2*vControl-Von-Voff)/(2*(Von-Voff)))^3)/2)) else
              vAK/Ron);

      // holding effect and forward breakthrough
      vConmain = (if Anode.i>IH or vAK>VDRM then Von else 0);
      LossPower = Anode.i*Anode.v + Cathode.i*Cathode.v + Gate.i*Gate.v;
     annotation (
       Documentation(info="<html>
<p>This is a simple thyristor model with three pins: Anode, Cathode and Gate. There are three operating modes:conducting, blocking and reverse breakthrough.
<br>As long as the thyristor is in blocking mode it behaves like a linear resistance Roff=VDRM^2/(VTM*IH). But if the voltage between anode and cathode exceeds VDRM or a positive gate current flows for a sufficient time the mode changes to conducting mode. The model stays in conducting mode until the anode current falls below the holding current IH. There is no way to switch off the thyristor via the gate. If the voltage between anode and cathode is negative, the model represents a diode (parameters Vt, Nbv) with reverse breakthrough voltage VRRM. </p>
<p>The dV/dt switch on is not taken into account in this model. The gate circuit is not influenced by the main circuit.</p>
</html>",
      revisions=
        "<html>
<ul>
<li><i>May 12, 2009   </i>
       by Matthias Franke
       </li>
</ul>
</html>"),
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Line(points={{30,20},{70,60},{70,90}}, color={0,0,255}),
            Line(points={{40,50},{60,30}}, color={0,0,255}),
            Text(
              extent={{-142,-59},{158,-99}},
              textString="%name",
              lineColor={0,0,255})}),
       Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,0},{80,0}}, color={128,128,128}),
            Polygon(
              points={{70,4},{80,0},{70,-4},{70,4}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Line(points={{0,80},{0,-80}}, color={128,128,128}),
            Polygon(
              points={{-4,70},{0,80},{4,70},{-4,70}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{5,81},{15,71}},
              lineColor={128,128,128},
              textString="i"),
            Text(
              extent={{70,-10},{80,-20}},
              lineColor={128,128,128},
              textString="v"),
            Line(
              points={{20,9},{20,0}},
              color={128,128,128},
              pattern=LinePattern.Dot),
            Text(
              extent={{25,64},{45,54}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="Ron"),
            Line(
              points={{14,20},{25,73}},
              color={0,0,0},
              thickness=0.5),
            Line(
              points={{-57,-11},{55,9}},
              color={0,0,0},
              smooth=Smooth.None,
              thickness=0.5),
            Line(
              points={{-57,-11},{-59,-13},{-60,-18},{-63,-65}},
              color={0,0,0},
              thickness=0.5,
              smooth=Smooth.None),
            Text(
              extent={{-67,11},{-47,1}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="VRRM"),
            Text(
              extent={{44,-2},{64,-12}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="VDRM"),
            Line(
              points={{-57,1},{-57,-1}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{54,1},{54,-1}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{55,9},{54,11},{50,13},{17,17},{15,18},{14,20}},
              color={0,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-28,-9},{-8,-19}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="Roff"),
            Line(
              points={{2,20},{-2,20}},
              color={0,0,0},
              smooth=Smooth.None),
            Text(
              extent={{-14,23},{-2,16}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="IH")}));
    end Thyristor;

    model SimpleTriac "Simple triac, based on Semiconductors.Thyristor model"

      parameter Modelica_SIunits.Voltage VDRM(final min=0) = 100
        "Forward breakthrough voltage";
      parameter Modelica_SIunits.Voltage VRRM(final min=0) = 100
        "Reverse breakthrough voltage";
      parameter Modelica_SIunits.Current IDRM=0.1 "Saturation current";
      parameter Modelica_SIunits.Voltage VTM= 1.7 "Conducting voltage";
      parameter Modelica_SIunits.Current IH=6e-3 "Holding current";
      parameter Modelica_SIunits.Current ITM= 25 "Conducting current";

      parameter Modelica_SIunits.Voltage VGT= 0.7 "Gate trigger voltage";
      parameter Modelica_SIunits.Current IGT= 5e-3 "Gate trigger current";

      parameter Modelica_SIunits.Time TON = 1e-6 "Switch on time";
      parameter Modelica_SIunits.Time TOFF = 15e-6 "Switch off time";
      parameter Modelica_SIunits.Voltage Vt=0.04
        "Voltage equivalent of temperature (kT/qn)";
      parameter Real Nbv=0.74 "Reverse Breakthrough emission coefficient";

      Modelica_Electrical_Analog_Interfaces.NegativePin n "Cathode"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica_Electrical_Analog_Interfaces.PositivePin p "Anode"
        annotation (Placement(transformation(extent={{94,-10},{114,10}})));
      Modelica_Electrical_Analog_Interfaces.PositivePin g "Gate"
        annotation (Placement(transformation(extent={{-72,-106},{-52,-86}})));
      Modelica_Electrical_Analog.Semiconductors.Thyristor thyristor(
        VDRM=VDRM,
        VRRM=VRRM,
        useHeatPort=useHeatPort,
        T=T) annotation (Placement(transformation(extent={{-20,30},{0,50}})));
      Modelica_Electrical_Analog.Semiconductors.Thyristor thyristor1(
        VDRM=VDRM,
        VRRM=VRRM,
        useHeatPort=useHeatPort,
        T=T) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-12,-40})));

      Modelica_Electrical_Analog.Ideal.IdealDiode idealDiode(Vknee=0)
        annotation (Placement(transformation(extent={{-40,58},{-20,78}})));
      Modelica_Electrical_Analog.Ideal.IdealDiode idealDiode1(Vknee=0)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-20,-72})));

    parameter Boolean useHeatPort = false "=true, if HeatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false" annotation(Dialog(enable=not useHeatPort));

    Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort if useHeatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-10,-110},{10,-90}})));

    equation
      if useHeatPort then
       connect(heatPort, thyristor.heatPort);
       connect(heatPort, thyristor1.heatPort);
     end if;
      connect(thyristor.Anode, n) annotation (Line(
          points={{-19,40},{-18,40},{-18,48},{-70,48},{-70,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(thyristor1.Anode, p) annotation (Line(
          points={{-3,-40},{-2,-40},{-2,-60},{80,-60},{80,0},{104,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(thyristor1.Anode, thyristor.Cathode) annotation (Line(
          points={{-3,-40},{-2,-40},{-2,40},{-1,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(thyristor1.Cathode, thyristor.Anode) annotation (Line(
          points={{-21,-40},{-22,-40},{-22,40},{-19,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(thyristor.Gate, idealDiode.n) annotation (Line(
          points={{-3,49},{-3,59.5},{-20,59.5},{-20,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealDiode.p, g) annotation (Line(
          points={{-40,68},{-82,68},{-82,-96},{-62,-96}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealDiode1.n, thyristor1.Gate) annotation (Line(
          points={{-20,-62},{-20,-49},{-19,-49}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealDiode1.p, g) annotation (Line(
          points={{-20,-82},{-42,-82},{-42,-96},{-62,-96}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{-30,0},{-30,-100},{70,-50},{-30,0}},
              lineColor={0,0,255},
              smooth=Smooth.None),
            Polygon(
              points={{70,100},{70,0},{-30,50},{70,100}},
              lineColor={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{70,0},{70,-100}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-30,0},{-30,100}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-30,0},{-90,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{70,0},{110,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-62,-86},{-62,-56},{-30,-44}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{-102,130},{98,100}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>This is a simple TRIAC model based on the extended thyristor model Modelica.Electrical.Analog.Semiconductors.Thyristor.
<br>Two thyristors are contrarily connected in parallel, whereas each transistor is connected with a diode.
<br>Further information regarding the electrical component TRIAC can be detected in documentation of the ideal TRIAC model.
<br>As an additional information: this model is based on the Modelica.Electrical.Analog.Semiconductors.Thyristor.</p>
<p><b>Attention:</b> The model seems to be very sensitive with respect to the choice of some parameters (e.g., VDRM, VRRM). This is caused by the thyristor model. Further investigations are necessary.</p>
</html>",
       revisions="<html>
<ul>
<li><i>November 25, 2009   </i> <br>

       by Susann Wolf <br><br>
       </li>
</ul>
</html>"));
    end SimpleTriac;

    model Diode2 "Improved diode model"
       import SIunits = Modelica_SIunits;
        extends Modelica_Electrical_Analog_Interfaces.OnePort;
      parameter Modelica_SIunits.Voltage Vf=0.7 "Forward voltage";
      parameter Modelica_SIunits.Current Ids=1.e-13
        "Reverse saturation current";
      parameter Modelica_SIunits.Resistance Rs=16 "Ohmic resistance";
      parameter Modelica_SIunits.Voltage Vt=0.026 "Thermal voltage (kT/q)";
        parameter Real N = 1 "Emission coefficient";
      parameter Modelica_SIunits.Voltage Bv=100 "Reverse breakdown voltage";
      parameter Modelica_SIunits.Conductance Gp=1e-6
        "Parallel conductance for numerical stability";
    protected
      parameter Modelica_SIunits.Voltage VdMax=Vf + (N*Vt)
        "Linear continuation threshold";
      parameter Modelica_SIunits.Current iVdMax=Ids*(exp(VdMax/(N*Vt)) - 1)
        "Current at threshold";
      parameter Modelica_SIunits.Conductance diVdMax=Ids*exp(VdMax/(N*Vt))/(N*
          Vt) "Conductance at threshold";
      Modelica_SIunits.Voltage Vd "Voltage across pure diode part";
      Modelica_SIunits.Current id "diode current";
        extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=
            293.15);
    equation
        id = smooth(1,
                   if Vd < -Bv / 2 then
                       -Ids * (exp(-(Vd+Bv)/(N*Vt)) + 1 - 2*exp(-Bv/(2*N*Vt)))
                   elseif Vd < VdMax then
                       Ids * (exp(Vd/(N*Vt)) - 1)
                   else
                       iVdMax + (Vd - VdMax) * diVdMax);                        //Lower half of reverse biased region including breakdown.
                                                   //Upper half of reverse biased region, and forward biased region before conduction.
                                                          //Forward biased region after conduction

        v = Vd + id * Rs;
        i = id + v*Gp;
        LossPower=i*v;

        assert(Bv>0, "Bv must be grater then zero", AssertionLevel.error);
        assert(Vf>0, "Vf musst be greater then zero", AssertionLevel.error);
        assert(Vt>0, "Vt must be greater then zero", AssertionLevel.error);
      annotation (
        Documentation(info="<html>
<p>This diode model Modelica.Electrical.Analog.Semiconductors.Diode2 is an improved version of the existing diode model Modelica.Electrical.Analog.Semiconductors.Diode. It was proposed by Stefan Vorkoetter.The model is devided into three parts:</p>
<ul>
<li>lower half of reversed bias region including breakdown: -Ids * (exp(-(Vd+Bv)/(N*Vt)) + 1 - 2*exp(-Bv/(2*N*Vt)))</li>
<li>upper half of reverse biased region and forward biased region before conduction: Ids * (exp(Vd/(N*Vt)) - 1</li>
<li>forward biased region after conduction: iVdMax + (Vd-VdMax) * diVdMax</li>
</ul>
<p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled yet. The parameters are not temperature dependent.</p>
</html>",
     revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> November 15, 2005   </i>
       by Christoph Clauss<br> smooth function added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Text(
              extent={{-154,100},{146,60}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,0,0},
              fillPattern=FillPattern.None),
            Line(points={{-96,0},{96,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255})}));
    end Diode2;
    annotation (
      Documentation(info="<html>
<p>This package contains semiconductor devices:</p>
<ul>
<li>diode</li>
<li>MOS transistors</li>
<li>bipolar transistors</li>
<li>thyristor</li>
<li>triac</li>
</ul>
<p>Most of the semiconductor devices contain a conditional heat port, which is not active by default. If it is active the loss power is calculated to be used in a thermal net. The heating variants of the semiconductor devices are provided to use the thermal port temperature in the electric calculation. That means that for a true thermal electric interaction the heating device models have to be used.</p>
</html>",
     revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dl>
</html>"),   Icon(graphics={
            Line(points={{-20,0},{-90,0}}, color={0,0,0}),
            Line(points={{-20,60},{-20,-60}}, color={0,0,0}),
            Line(points={{20,68},{-20,28}}, color={0,0,0}),
            Line(points={{80,68},{20,68}}, color={0,0,0}),
            Line(points={{-20,-30},{20,-70}}, color={0,0,0}),
            Line(points={{20,-70},{80,-70}}, color={0,0,0})}));
  end Semiconductors;

  package Sensors "Potential, voltage, current, and power sensors"

    extends Modelica_Icons.SensorsPackage;

    model PotentialSensor "Sensor to measure the potential"
      extends Modelica_Icons.RotationalSensor;

      Modelica_Electrical_Analog_Interfaces.PositivePin p "pin to be measured"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput phi(unit="V")
        "Absolute voltage potential as output signal"
          annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
    equation
      p.i = 0;
      phi = p.v;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-29,-11},{30,-70}},
              lineColor={0,0,0},
              textString="V"),
            Line(points={{-70,0},{-90,0}}, color={0,0,255}),
            Line(points={{100,0},{70,0}}, color={0,0,127}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Line(points={{-70,0},{-96,0}}, color={0,0,0}),
              Line(points={{100,0},{70,0}}, color={0,0,127})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The potential sensor converts the voltage of a node (with respect to the ground node) into a real valued signal. It does not influence the current sum at the node which voltage is measured, therefore, the electrical behavior is not influenced by the sensor.</p>
</html>"));
    end PotentialSensor;

    model VoltageSensor "Sensor to measure the voltage between two pins"
      extends Modelica_Icons.RotationalSensor;

      Modelica_Electrical_Analog_Interfaces.PositivePin p "positive pin"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n "negative pin"
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput v(unit="V")
        "Voltage between pin p and n (= p.v - n.v) as output signal"
         annotation (Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));

    equation
      p.i = 0;
      n.i = 0;
      v = p.v - n.v;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-29,-11},{30,-70}},
              lineColor={0,0,0},
              textString="V"),
            Line(points={{-70,0},{-90,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-90},{0,-70}}, color={0,0,127}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-70,0},{-96,0}}, color={0,0,0}),
            Line(points={{70,0},{96,0}}, color={0,0,0}),
            Line(points={{0,-90},{0,-70}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The voltage sensor converts the voltage between the two connectors into a real valued signal. It does not influence the current sum at the nodes in between the voltage is measured, therefore, the electrical behavior is not influenced by the sensor.</p>
</html>"));
    end VoltageSensor;

    model CurrentSensor "Sensor to measure the current in a branch"
      extends Modelica_Icons.RotationalSensor;

      Modelica_Electrical_Analog_Interfaces.PositivePin p "positive pin"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n "negative pin"
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput i(unit="A")
        "Current in the branch from p to n as output signal"
         annotation (Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));

    equation
      p.v = n.v;
      p.i = i;
      n.i = -i;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-29,-11},{30,-70}},
              lineColor={0,0,0},
              textString="A"),
            Line(points={{-70,0},{-90,0}}, color={0,0,255}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-90},{0,-70}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-153,79},{147,119}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{-70,0},{-96,0}}, color={0,0,0}),
            Line(points={{70,0},{96,0}}, color={0,0,0}),
            Line(points={{0,-90},{0,-70}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The current sensor converts the current flowing between the two connectors into a real valued signal. The two connectors are in the sensor connected like a short cut. The sensor has to be placed within an electrical connection in series.  It does not influence the current sum at the connected nodes. Therefore, the electrical behavior is not influenced by the sensor.</p>
</html>"));
    end CurrentSensor;

  model PowerSensor "Sensor to measure the power"
    extends Modelica_Icons.RotationalSensor;
    Modelica_Electrical_Analog_Interfaces.PositivePin pc
        "Positive pin, current path" annotation (Placement(transformation(
              extent={{-90,-10},{-110,10}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.NegativePin nc
        "Negative pin, current path" annotation (Placement(transformation(
              extent={{110,-10},{90,10}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.PositivePin pv
        "Positive pin, voltage path" annotation (Placement(transformation(
              extent={{-10,110},{10,90}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.NegativePin nv
        "Negative pin, voltage path" annotation (Placement(transformation(
              extent={{10,-110},{-10,-90}}, rotation=0)));
    Modelica_Blocks_Interfaces.RealOutput power(unit="W")
        "Instantaneous power as output signal"
      annotation (Placement(transformation(
            origin={-80,-110},
            extent={{-10,10},{10,-10}},
            rotation=270)));
    Modelica_Electrical_Analog.Sensors.VoltageSensor voltageSensor annotation (
          Placement(transformation(
            origin={0,-30},
            extent={{10,10},{-10,-10}},
            rotation=90)));
    Modelica_Electrical_Analog.Sensors.CurrentSensor currentSensor annotation (
          Placement(transformation(extent={{-50,-10},{-30,10}}, rotation=0)));
    Modelica_Blocks.Math.Product product
      annotation (Placement(transformation(
            origin={-30,-50},
            extent={{-10,-10},{10,10}},
            rotation=270)));

  equation
    connect(pv, voltageSensor.p) annotation (Line(points={{0,100},{0,-20}},
                                  color={0,0,255}));
    connect(voltageSensor.n, nv) annotation (Line(points={{0,-40},{0,-63},{0,-100}},
                                                    color={0,0,255}));
    connect(pc, currentSensor.p)
      annotation (Line(points={{-100,0},{-50,0}}, color={0,0,255}));
    connect(currentSensor.n, nc)
      annotation (Line(points={{-30,0},{100,0}}, color={0,0,255}));
    connect(currentSensor.i, product.u2) annotation (Line(points={{-40,-10},{-40,
              -30},{-36,-30},{-36,-38}}, color={0,0,127}));
    connect(voltageSensor.v, product.u1) annotation (Line(points={{-10,-30},{-24,
              -30},{-24,-38}}, color={0,0,127}));
    connect(product.y, power) annotation (Line(points={{-30,-61},{-30,-80},{-80,
              -80},{-80,-110}}, color={0,0,127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Line(points=  {{0,100},{0,70}}, color=  {0,0,255}),
        Line(points=  {{0,-70},{0,-100}}, color=  {0,0,255}),
        Line(points=  {{-80,-100},{-80,-80},{-46,-52}}, color=  {0,0,127}),
        Line(points=  {{-100,0},{100,0}}, color=  {0,0,255}),
        Text(lineColor=  {0,0,255}, extent=  {{-150,120},{150,160}}, textString=  "%name"),
        Line(points=  {{0,70},{0,40}}),
        Text(extent=  {{-29,-70},{30,-11}}, textString=  "P")}),
      Documentation(info="<html>
<p>This power sensor measures instantaneous electrical power of a singlephase system and has a separated voltage and current path. The pins of the voltage path are pv and nv, the pins of the current path are pc and nc. The internal resistance of the current path is zero, the internal resistance of the voltage path is infinite.</p>
</html>",   revisions="<html>
<ul>
<li><i>January 12, 2006</i> by Anton Haumer implemented</li>
</ul>
</html>"));
  end PowerSensor;
    annotation (
      Documentation(info="<html>
<p>This package contains potential, voltage, and current sensors. The sensors can be used to convert voltages or currents into real signal values o be connected to components of the Blocks package. The sensors are designed in such a way that they do not influence the electrical behavior.</p>
</html>",
     revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>
</html>"));
  end Sensors;

  package Sources "Time-dependent and controlled voltage and current sources"

    extends Modelica_Icons.SourcesPackage;

    model SignalVoltage
      "Generic voltage source using the input signal as source voltage"

      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{110,-10},{90,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput v(unit="V")
        "Voltage between pin p and n (= p.v - n.v) as input signal" annotation (
          Placement(transformation(
            origin={0,70},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica_SIunits.Current i "Current flowing from pin p to pin n";
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-50,0}}, color={0,0,255}),
            Line(points={{50,0},{90,0}}, color={0,0,255}),
            Line(points={{-50,0},{50,0}}, color={0,0,255}),
            Text(
              extent={{-150,-104},{150,-64}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-120,50},{-20,0}},
              lineColor={0,0,255},
              textString="+"),
            Text(
              extent={{20,50},{120,0}},
              lineColor={0,0,255},
              textString="-")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,0},{-50,0}},
              color={0,0,255}),Line(points={{50,0},{96,0}}, color={0,0,255}),Line(
              points={{-50,0},{50,0}}, color={0,0,255}),Line(points={{-109,20},{-84,
              20}}, color={160,160,164}),Polygon(
                points={{-94,23},{-84,20},{-94,17},{-94,23}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{91,20},{116,20}},
              color={160,160,164}),Text(
                extent={{-109,25},{-89,45}},
                lineColor={160,160,164},
                textString="i"),Polygon(
                points={{106,23},{116,20},{106,17},{106,23}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Text(
                extent={{91,45},{111,25}},
                lineColor={160,160,164},
                textString="i"),Line(points={{-119,-5},{-119,5}}, color={160,160,
              164}),Line(points={{-124,0},{-114,0}}, color={160,160,164}),Line(
              points={{116,0},{126,0}}, color={160,160,164})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The signal voltage source is a parameterless converter of real valued signals into a the source voltage. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a voltage sensor.</p>
</html>"));
    end SignalVoltage;

    model ConstantVoltage "Source for constant voltage"
      parameter Modelica_SIunits.Voltage V(start=1) "Value of constant voltage";
      extends Modelica_Electrical_Analog_Interfaces.OnePort;

    equation
      v = V;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{-10,0}}, color={0,0,255}),
            Line(points={{-10,60},{-10,-60}}, color={0,0,255}),
            Line(points={{0,30},{0,-30}}, color={0,0,255}),
            Line(points={{0,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-150,-112},{150,-72}},
              textString="%name=%V",
              lineColor={0,0,255}),
            Text(
              extent={{-120,50},{-20,0}},
              lineColor={0,0,255},
              textString="+"),
            Text(
              extent={{20,50},{120,0}},
              lineColor={0,0,255},
              textString="-")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,0},{-10,0}}, color={0,0,
              255}),Line(points={{-10,60},{-10,-60}}, color={0,0,255}),Line(
              points={{0,30},{0,-30}}, color={0,0,255}),Line(points={{0,0},{96,0}},
              color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The ConstantVoltage source is a simple source for an ideal constant voltage which is provided by a parameter. There is no internal resistance modeled. If it is used instead of a battery model it is not very realistic: This battery will never be unloaded.</p>
</html>"));
    end ConstantVoltage;

    model StepVoltage "Step voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Height of step";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare Modelica_Blocks.Sources.Step
          signalSource(height=V));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-70,-70},{0,-70},{0,70},{69,70}},
                color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(
                points={{-80,-18},{0,-18},{0,50},{80,50}},
                color={0,0,0},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,
              192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Text(
                extent={{-21,-72},{25,-90}},
                lineColor={160,160,164},
                textString="startTime"),Line(
                points={{0,-17},{0,-71}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-68,-36},{-22,-54}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-13,50},{-13,-17}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{0,50},{-19,50},{0,50}},
                lineColor={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-13,50},{-16,37},{-9,37},{-13,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-68,26},{-22,8}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-13,-18},{-13,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-13,-18},{-16,-31},{-9,-31},{-13,-18}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-67,93},{-2,67}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end StepVoltage;

    model RampVoltage "Ramp voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Height of ramp";
      parameter Modelica_SIunits.Time duration(min=Modelica_Constants.small,
          start=2) "Duration of ramp";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare Modelica_Blocks.Sources.Ramp
          signalSource(final height=V, final duration=duration));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(
                points={{-80,-20},{-20,-20},{50,50}},
                color={0,0,0},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,
              192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-40,-20},{-42,-30},{-38,-30},{-40,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-20},{-40,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-80,-33},{-41,-49}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-40,-70},{6,-88}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{-67,93},{-2,67}},
                lineColor={160,160,164},
                textString="v = p.v - n.v"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-20,-20},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-19,-20},{50,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Line(
                points={{50,50},{101,50}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{50,50},{50,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{50,-20},{42,-18},{42,-22},{50,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-20,-20},{-11,-18},{-11,-22},{-20,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{50,50},{48,40},{52,40},{50,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{50,-20},{48,-10},{52,-10},{50,-20},{50,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{53,25},{82,7}},
                lineColor={160,160,164},
                textString="V"),Text(
                extent={{0,-17},{35,-37}},
                lineColor={160,160,164},
                textString="duration")}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-80,-60},{-50,-60},{50,60},{80,60}},
                color={192,192,192})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end RampVoltage;

    model SineVoltage "Sine voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of sine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=1)
        "Frequency of sine wave";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare Modelica_Blocks.Sources.Sine
          signalSource(
          amplitude=V,
          freqHz=freqHz,
          phase=phase));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-66,0},{-56.2,29.9},{-49.8,46.5},
                  {-44.2,58.1},{-39.3,65.2},{-34.3,69.2},{-29.4,69.8},{-24.5,67},
                  {-19.6,61},{-14.6,52},{-9,38.6},{-1.98,18.6},{12.79,-26.9},{
                  19.1,-44},{24.8,-56.2},{29.7,-64},{34.6,-68.6},{39.5,-70},{44.5,
                  -67.9},{49.4,-62.5},{54.3,-54.1},{59.9,-41.3},{67,-21.7},{74,0}},
                color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{100,-40}},
              color={192,192,192}),Polygon(
                points={{100,-40},{84,-34},{84,-46},{100,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,-2},{-32.6,32.2},{-27.1,51.1},{-22.3,64.4},{-18.1,
                72.6},{-13.9,77.1},{-8,78},{-5.42,74.6},{-1.201,67.7},{3.02,57.4},
                {7.84,42.1},{13.9,19.2},{26.5,-32.8},{32,-52.2},{36.8,-66.2},{41,
                -75.1},{45.2,-80.4},{49.5,-82},{53.7,-79.6},{57.9,-73.5},{62.1,-63.9},
                {66.9,-49.2},{73,-26.8},{79,-2}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-106,-11},{-60,-29}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-41,-2},{-41,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-60,-43},{-14,-61}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{76,-52},{100,-72}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-8,78},{45,78}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-41,-2},{52,-2}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{33,78},{30,65},{37,65},{33,78}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{33,78},{33,-2}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-69,109},{-4,83}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end SineVoltage;

    model CosineVoltage "Cosine voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of cosine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of cosine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=1)
        "Frequency of cosine wave";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare Modelica_Blocks.Sources.Cosine
          signalSource(
          amplitude=V,
          freqHz=freqHz,
          phase=phase));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Line(
              points={{-71,70},{-68.4,69.8},{-63.5,67},{-58.6,61},{-53.6,52},{-48,
                  38.6},{-40.98,18.6},{-26.21,-26.9},{-19.9,-44},{-14.2,-56.2},{-9.3,
                  -64},{-4.4,-68.6},{0.5,-70},{5.5,-67.9},{10.4,-62.5},{15.3,-54.1},
                  {20.9,-41.3},{28,-21.7},{35,0}},
              color={192,192,192},
              smooth=Smooth.Bezier), Line(points={{35,0},{44.8,29.9},{51.2,46.5},
                  {56.8,58.1},{61.7,65.2},{66.7,69.2},{71.6,69.8}}, color={192,
                  192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{100,-40}},
              color={192,192,192}),Polygon(
                points={{100,-40},{84,-34},{84,-46},{100,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,78},{-38,78},{-35.42,74.6},{-31.201,67.7},{-26.98,
                57.4},{-22.16,42.1},{-16.1,19.2},{-3.5,-32.8},{2,-52.2},{6.8,-66.2},
                {11,-75.1},{15.2,-80.4},{19.5,-82},{23.7,-79.6},{27.9,-73.5},{
                32.1,-63.9},{36.9,-49.2},{43,-26.8},{49,-2},{49,-2},{57.4,32.2},{
                62.9,51.1},{67.7,64.4},{71.9,72.6},{76.1,77.1},{80,78}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-106,-11},{-60,-29}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-41,-2},{-41,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-60,-43},{-14,-61}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{76,-52},{100,-72}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-8,78},{45,78}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-41,-2},{52,-2}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{33,78},{30,65},{37,65},{33,78}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{33,78},{33,-2}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-69,109},{-4,83}},
                lineColor={160,160,164},
                textString="v = p.v - n.v"),Line(
                points={{-41,78},{-41,-2}},
                color={0,0,0},
                thickness=0.5)}),
        Documentation(revisions="<html>
<ul>
<li>Initially implemented by Christian Kral on 2013-05-14</li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end CosineVoltage;

    model ExpSineVoltage "Exponentially damped sine voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of sine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=2)
        "Frequency of sine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica_SIunits.Damping damping(start=1)
        "Damping coefficient of sine wave";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare
          Modelica_Blocks.Sources.ExpSine
          signalSource(
          amplitude=V,
          freqHz=freqHz,
          phase=phase,
          damping=damping));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-64,-14},{-59.2,18.3},{-56,36.3},
                  {-52.7,50.5},{-49.5,60.2},{-46.3,65.3},{-43.1,65.6},{-39.9,61.3},
                  {-36.7,53.1},{-32.6,38.2},{-27,11.8},{-19,-27.9},{-14.2,-47.7},
                  {-10.1,-59.9},{-6.1,-67.2},{-2.1,-69.3},{1.9,-66.5},{5.9,-59.3},
                  {10.77,-46.1},{24.44,-0.3},{29.3,12.4},{34.1,20.8},{38.1,24},{
                  42.9,23.2},{47.8,17.8},{54.2,5.4},{67.1,-24.5},{73.5,-35.2},{
                  79.1,-39.9},{84.7,-39.9},{91.2,-34.5},{96,-27.8}}, color={192,
                  192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{85,-40}},
              color={192,192,192}),Polygon(
                points={{100,-40},{84,-34},{84,-46},{100,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},
                {-35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{-19.9,
                22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},{
                0.302,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},{
                25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,16.9},
                {56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,-18},{80,
                -12.1}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-78,1},{-55,-19}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-72,-36},{-26,-54}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{76,-44},{100,-64}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-50,0},{18,0}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-50,0},{-80,0}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-50,77},{-50,0}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{18,0},{18,76}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{18,73},{-50,73}}, color={
              192,192,192}),Text(
                extent={{-42,88},{9,74}},
                lineColor={160,160,164},
                textString="1/freqHz"),Polygon(
                points={{-50,73},{-41,75},{-41,71},{-50,73}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{18,73},{10,75},{10,71},{18,73}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-50,-61},{-19,-61}},
              color={192,192,192}),Polygon(
                points={{-18,-61},{-26,-59},{-26,-63},{-18,-61}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-51,-63},{-27,-75}},
                lineColor={160,160,164},
                textString="t"),Text(
                extent={{-82,-67},{108,-96}},
                lineColor={160,160,164},
                textString="V*exp(-damping*t)*sin(2*pi*freqHz*t+phase)"),Line(
                points={{-50,0},{-50,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-50,-54},{-50,-72}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{18,-76},{-1,-48}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-77,105},{-38,92}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end ExpSineVoltage;

    model ExponentialsVoltage "Rising and falling exponential voltage source"
      parameter Real vMax(start=1) "Upper bound for rising edge";
      parameter Modelica_SIunits.Time riseTime(min=0, start=0.5) "Rise time";
      parameter Modelica_SIunits.Time riseTimeConst(min=Modelica_Constants.small,
          start=0.1) "Rise time constant";
      parameter Modelica_SIunits.Time fallTimeConst(min=Modelica_Constants.small,
          start=riseTimeConst) "Fall time constant";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare
          Modelica_Blocks.Sources.Exponentials signalSource(
          outMax=vMax,
          riseTime=riseTime,
          riseTimeConst=riseTimeConst,
          fallTimeConst=fallTimeConst));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-76,-59},{-73.2,-44.3},{-70.3,-31.1},
                  {-66.8,-16.6},{-63.3,-4},{-59.7,6.92},{-55.5,18.18},{-51.3,27.7},
                  {-46.3,37},{-40.6,45.5},{-34.3,53.1},{-27.2,59.6},{-18.7,65.3},
                  {-8.1,70.2},{-6,71},{-3.88,58.5},{-1.05,43.7},{1.78,30.8},{
                  4.606,19.45},{8.14,7.3},{11.68,-3},{15.9,-13.2},{20.2,-21.6},{
                  25.1,-29.5},{30.8,-36.4},{37.1,-42.3},{44.9,-47.5},{54.8,-51.8},
                  {64,-54.4}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-100,-70},{100,-70}}, color={
              192,192,192}),Polygon(
                points={{100,-70},{84,-64},{84,-76},{100,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,
                25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,
                74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{
                32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},
                {47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},
                {80.9,-18.5},{90.8,-22.8},{100,-25.4}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Text(
                extent={{-70,91},{-29,71}},
                lineColor={160,160,164},
                textString="outPort"),Text(
                extent={{-78,-43},{-46,-56}},
                lineColor={160,160,164},
                textString="offset"),Polygon(
                points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{-40,-60}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-40,-30},{-42,-40},{-38,-40},{-40,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-39,-30},{-80,-30}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-59,-71},{-13,-89}},
                lineColor={160,160,164},
                textString="startTime"),Polygon(
                points={{-40,-30},{-31,-28},{-31,-32},{-40,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-39,-30},{30,-30}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{30,-30},{22,-28},{22,-32},{30,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-26,-12},{19,-28}},
                lineColor={160,160,164},
                textString="riseTime"),Text(
                extent={{78,-76},{102,-96}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,
                25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,
                74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{
                32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},
                {47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},
                {80.9,-18.5},{90.8,-22.8},{100,-25.4}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-40,-30},{-80,-30}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{30,100},{30,-34}},
                color={192,192,192},
                pattern=LinePattern.Dash)}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end ExponentialsVoltage;

    model PulseVoltage "Pulse voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of pulse";
      parameter Real width(
        final min=Modelica_Constants.small,
        final max=100,
        start=50) "Width of pulse in % of period";
      parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small,
          start=1) "Time for one period";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare Modelica_Blocks.Sources.Pulse
          signalSource(
          amplitude=V,
          width=width,
          period=period));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-70,-70},{-40,-70},{-40,70},{0,70},
                  {0,-70},{40,-70},{40,70},{80,70}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-34,0},{-34,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,-24},{-35,-36}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-40,-69},{6,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-20,0},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-80,0},{-20,0},{-20,50},{21,50},{21,0},{41,0},{41,50},{
                79,50}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-20,89},{-20,50}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{21,74},{21,50}},
                color={160,160,164},
                pattern=LinePattern.Dash),Line(
                points={{41,88},{41,50}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-20,83},{41,83}}, color={
              192,192,192}),Line(points={{-20,69},{21,69}}, color={192,192,192}),
              Text(
                extent={{-11,97},{35,85}},
                lineColor={160,160,164},
                textString="period"),Text(
                extent={{-18,81},{21,69}},
                lineColor={160,160,164},
                textString="width"),Line(
                points={{-53,50},{-20,50}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-34,50},{-34,0}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-78,34},{-37,20}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{-34,50},{-37,37},{-31,37},{-34,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{79,50},{79,0},{90,0}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-20,69},{-11,71},{-11,67},{-20,69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{21,69},{13,71},{13,67},{21,69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-20,83},{-11,85},{-11,81},{-20,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{41,83},{33,85},{33,81},{41,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,103},{-24,89}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end PulseVoltage;

    model SawToothVoltage "Saw tooth voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of saw tooth";
      parameter Modelica_SIunits.Time period(start=1) "Time for one period";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare
          Modelica_Blocks.Sources.SawTooth
          signalSource(amplitude=V, period=period));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-85,-70},{-65,-70},{-5,71},{-5,-70},
                  {55,71},{55,-70}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,-20},{-37,-33},{-31,-33},{-34,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-34,-20},{-34,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,-24},{-35,-36}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-31,-69},{15,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-10,-20},{-10,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-10,88},{-10,-20}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{30,88},{30,59}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-10,83},{30,83}}, color={
              192,192,192}),Text(
                extent={{-12,97},{34,85}},
                lineColor={160,160,164},
                textString="period"),Line(
                points={{-44,60},{30,60}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-34,47},{-34,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-78,34},{-37,20}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{-34,60},{-37,47},{-30,47},{-34,60}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,83},{-1,85},{-1,81},{-10,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{30,83},{22,85},{22,81},{30,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-77,100},{-27,88}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end SawToothVoltage;

    model TrapezoidVoltage "Trapezoidal voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of trapezoid";
      parameter Modelica_SIunits.Time rising(final min=0, start=0)
        "Rising duration of trapezoid";
      parameter Modelica_SIunits.Time width(final min=0, start=0.5)
        "Width duration of trapezoid";
      parameter Modelica_SIunits.Time falling(final min=0, start=0)
        "Falling duration of trapezoid";
      parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small,
          start=1) "Time for one period";
      parameter Integer nperiod(start=-1)
        "Number of periods (< 0 means infinite number of periods)";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare
          Modelica_Blocks.Sources.Trapezoid signalSource(
          amplitude=V,
          rising=rising,
          width=width,
          falling=falling,
          period=period,
          nperiod=nperiod));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-81,-70},{-60,-70},{-30,70},{1,70},
                  {30,-70},{51,-70},{80,70}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-45,-30},{-47,-41},{-43,-41},{-45,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-45,-30},{-45,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-86,-43},{-43,-55}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-47,-69},{-1,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-30,81},{-30,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-10,59},{-10,40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{20,59},{20,39}},
                color={160,160,164},
                pattern=LinePattern.Dash),Line(
                points={{40,59},{40,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-30,56},{40,56}}, color={
              192,192,192}),Text(
                extent={{-8,70},{21,60}},
                lineColor={160,160,164},
                textString="width"),Line(
                points={{-42,40},{-10,40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-39,40},{-39,-30}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-71,13},{-34,-1}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{-30,56},{-23,58},{-23,54},{-30,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,56},{-17,58},{-17,54},{-10,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-80,-30},{-30,-30},{-10,40},{20,40},{40,-30},{60,-30},{
                80,46},{100,46}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-39,40},{-41,29},{-37,29},{-39,40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-39,-30},{-41,-20},{-37,-20},{-39,-30},{-39,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{60,81},{60,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{40,56},{33,58},{33,54},{40,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{20,56},{27,58},{27,54},{20,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{20,56},{13,58},{13,54},{20,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,56},{-3,58},{-3,54},{-10,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-34,70},{-5,60}},
                lineColor={160,160,164},
                textString="rising"),Text(
                extent={{16,70},{45,60}},
                lineColor={160,160,164},
                textString="falling"),Text(
                extent={{-77,103},{-23,91}},
                lineColor={160,160,164},
                textString="v = p.v - n.v"),Line(points={{-30,76},{60,76}}, color=
               {192,192,192}),Polygon(
                points={{-30,76},{-21,78},{-21,74},{-30,76}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{60,76},{52,78},{52,74},{60,76}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-2,86},{25,77}},
                lineColor={160,160,164},
                textString="period")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end TrapezoidVoltage;

    model TableVoltage "Voltage source by linear interpolation in a table"
      parameter Real table[:, :]=[0, 0; 1, 1; 2, 4]
        "Table matrix (time = first column, voltage = second column)";
      extends Modelica_Electrical_Analog_Interfaces.VoltageSource(
                                       redeclare
          Modelica_Blocks.Sources.TimeTable signalSource(table=table));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-58,-36},{-58,84},{42,84},{42,-36},
                  {-58,-36},{-58,-6},{42,-6},{42,24},{-58,24},{-58,54},{42,54},{
                  42,84},{-8,84},{-8,-37}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-20,90},{30,-30}},
                lineColor={255,255,255},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-20,-30},{-20,90},{
              80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},
              {80,60},{80,90},{30,90},{30,-31}}, color={0,0,0}),Text(
                extent={{-77,-42},{-38,-58}},
                lineColor={160,160,164},
                textString="offset"),Polygon(
                points={{-31,-30},{-33,-40},{-29,-40},{-31,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-31,-70},{-33,-60},{-29,-60},{-31,-70},{-31,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-31,-30},{-31,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Line(
                points={{-20,-20},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-38,-70},{8,-88}},
                lineColor={160,160,164},
                textString="startTime"),Line(
                points={{-20,-30},{-80,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{66,-81},{91,-93}},
                lineColor={160,160,164},
                textString="time"),Text(
                extent={{-15,83},{24,68}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{33,83},{76,67}},
                lineColor={0,0,0},
                textString="v"),Text(
                extent={{-81,98},{-31,85}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package.  Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
<p><br>This block generates a voltage source by <b>linear interpolation</b> in a table. The time points and voltage values are stored in a matrix <b>table[i,j]</b>, where the first column table[:,1] contains the time points and the second column contains the voltage to be interpolated. The table interpolation has the following properties:</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by <b>extrapolation</b> through the last or first two points of the table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and the voltage value is just returned independently of the actual time instant, i.e., this is a constant voltage source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined by the table can be shifted both in time and in the voltage. </li>
<li>The table is implemented in a numerically sound way by generating <b>time events</b> at interval boundaries.
    This generates continuously differentiable values for the integrator.</li>
</ul>
<p>Example:</p>
<pre>   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the voltage v =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the voltage v =  2.5,
    e.g., time = 2.0, the voltage v =  4.0,
    e.g., time = 5.0, the voltage v = 23.0 (i.e., extrapolation). </pre>
<p><br>  Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TableVoltage;

    model SignalCurrent
      "Generic current source using the input signal as source current"

      Modelica_Electrical_Analog_Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{110,-10},{90,10}}, rotation=0)));
      Modelica_SIunits.Voltage v
        "Voltage drop between the two pins (= p.v - n.v)";
      Modelica_Blocks_Interfaces.RealInput i(unit="A")
        "Current flowing from pin p to pin n as input signal" annotation (
          Placement(transformation(
            origin={0,70},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-50,0}}, color={0,0,255}),
            Line(points={{50,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-50},{0,50}}, color={0,0,255}),
            Text(
              extent={{-150,-120},{150,-80}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{90,0},{60,10},{60,-10},{90,0}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,0},{-50,0}},
              color={0,0,255}),Line(points={{50,0},{96,0}}, color={0,0,255}),Line(
              points={{0,-50},{0,50}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The signal current source is a parameterless converter of real valued signals into a the source current. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a current sensor.</p>
</html>"));
    end SignalCurrent;

    model ConstantCurrent "Source for constant current"
      parameter Modelica_SIunits.Current I(start=1) "Value of constant current";
      extends Modelica_Electrical_Analog_Interfaces.OnePort;
    equation
      i = I;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-50,0}}, color={0,0,255}),
            Line(points={{50,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-50},{0,50}}, color={0,0,255}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name=%I",
              lineColor={0,0,255}),
            Polygon(
              points={{90,0},{60,10},{60,-10},{90,0}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,0},{-50,0}},
              color={0,0,255}),Line(points={{50,0},{96,0}}, color={0,0,255}),Line(
              points={{0,-50},{0,50}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The ConstantCurrent source is a simple source for an ideal constant current which is provided by a parameter. There is no internal resistance modeled. No further effects are modeled. Especially, the current flow will never end.</p>
</html>"));
    end ConstantCurrent;

    model StepCurrent "Step current source"
      parameter Modelica_SIunits.Current I(start=1) "Height of step";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare Modelica_Blocks.Sources.Step
          signalSource(height=I));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-86,-70},{-14,-70},{-14,70},{57,
                  70}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(
                points={{-80,-18},{0,-18},{0,50},{80,50}},
                color={0,0,0},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,
              192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Text(
                extent={{-21,-72},{25,-90}},
                lineColor={160,160,164},
                textString="startTime"),Line(
                points={{0,-17},{0,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-68,-36},{-22,-54}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-13,50},{-13,-18}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{0,50},{-19,50},{0,50}},
                lineColor={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{-13,-18},{-16,-5},{-10,-5},{-13,-18},{-13,-18}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-13,50},{-16,37},{-9,37},{-13,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-68,26},{-22,8}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{-13,-70},{-16,-57},{-10,-57},{-13,-70},{-13,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-13,-18},{-13,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-13,-18},{-16,-31},{-10,-31},{-13,-18}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end StepCurrent;

    model RampCurrent "Ramp current source"
      parameter Modelica_SIunits.Current I(start=1) "Height of ramp";
      parameter Modelica_SIunits.Time duration(min=Modelica_Constants.small,
          start=2) "Duration of ramp";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare Modelica_Blocks.Sources.Ramp
          signalSource(final height=I, final duration=duration));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(
                points={{-80,-20},{-20,-20},{50,50}},
                color={0,0,0},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,
              192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-40,-20},{-42,-30},{-38,-30},{-40,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-20},{-40,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-80,-33},{-41,-49}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-40,-70},{6,-88}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-20,-20},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-19,-20},{50,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Line(
                points={{50,50},{100,50}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{50,50},{50,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{50,-20},{42,-18},{42,-22},{50,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-20,-20},{-11,-18},{-11,-22},{-20,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{50,50},{48,40},{53,40},{50,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{50,-20},{47,-10},{52,-10},{50,-20},{50,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{53,25},{82,7}},
                lineColor={160,160,164},
                textString="I"),Text(
                extent={{0,-17},{35,-37}},
                lineColor={160,160,164},
                textString="duration"),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-80,-60},{-50,-60},{50,60},{80,60}},
                color={192,192,192})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end RampCurrent;

    model SineCurrent "Sine current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of sine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=1)
        "Frequency of sine wave";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare Modelica_Blocks.Sources.Sine
          signalSource(
          amplitude=I,
          freqHz=freqHz,
          phase=phase));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-70,0},{-60.2,29.9},{-53.8,46.5},
                  {-48.2,58.1},{-43.3,65.2},{-38.3,69.2},{-33.4,69.8},{-28.5,67},
                  {-23.6,61},{-18.6,52},{-13,38.6},{-5.98,18.6},{8.79,-26.9},{
                  15.1,-44},{20.8,-56.2},{25.7,-64},{30.6,-68.6},{35.5,-70},{40.5,
                  -67.9},{45.4,-62.5},{50.3,-54.1},{55.9,-41.3},{63,-21.7},{70,0}},
                color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{85,-40}},
              color={192,192,192}),Polygon(
                points={{101,-40},{85,-34},{85,-46},{101,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,-2},{-32.6,32.2},{-27.1,51.1},{-22.3,64.4},{-18.1,
                72.6},{-13.9,77.1},{-10,78},{-5.42,74.6},{-1.201,67.7},{3.02,57.4},
                {7.84,42.1},{13.9,19.2},{26.5,-32.8},{32,-52.2},{36.8,-66.2},{41,
                -75.1},{45.2,-80.4},{49.5,-82},{53.7,-79.6},{57.9,-73.5},{62.1,-63.9},
                {66.9,-49.2},{73,-26.8},{79,-2}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-106,-11},{-60,-29}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-41,-2},{-41,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-60,-43},{-14,-61}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{84,-52},{108,-72}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-10,78},{42,78}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-41,-2},{5,-2},{5,-2},{51,-2}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{33,78},{30,65},{37,65},{33,78}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{33,78},{33,-2}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-73,82},{-53,102}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end SineCurrent;

    model CosineCurrent "Cosine current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of cosine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of cosine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=1)
        "Frequency of cosine wave";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare Modelica_Blocks.Sources.Cosine
          signalSource(
          amplitude=I,
          freqHz=freqHz,
          phase=phase));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(
              points={{-71,70},{-68.4,69.8},{-63.5,67},{-58.6,61},{-53.6,52},{-48,
                  38.6},{-40.98,18.6},{-26.21,-26.9},{-19.9,-44},{-14.2,-56.2},{-9.3,
                  -64},{-4.4,-68.6},{0.5,-70},{5.5,-67.9},{10.4,-62.5},{15.3,-54.1},
                  {20.9,-41.3},{28,-21.7},{35,0}},
              color={192,192,192},
              smooth=Smooth.Bezier), Line(points={{35,0},{44.8,29.9},{51.2,46.5},
                  {56.8,58.1},{61.7,65.2},{66.7,69.2},{71.6,69.8}}, color={192,
                  192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{85,-40}},
              color={192,192,192}),Polygon(
                points={{101,-40},{85,-34},{85,-46},{101,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-106,-11},{-60,-29}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-41,-2},{-41,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-60,-43},{-14,-61}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{84,-52},{108,-72}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-10,78},{42,78}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-41,-2},{5,-2},{5,-2},{51,-2}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{33,78},{30,65},{37,65},{33,78}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{33,78},{33,-2}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-73,82},{-53,102}},
                lineColor={192,192,192},
                textString="i"),Line(
                points={{-41,78},{-41,-2}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-41,78},{-38,78},{-35.42,74.6},{-31.201,67.7},{-26.98,
                57.4},{-22.16,42.1},{-16.1,19.2},{-3.5,-32.8},{2,-52.2},{6.8,-66.2},
                {11,-75.1},{15.2,-80.4},{19.5,-82},{23.7,-79.6},{27.9,-73.5},{
                32.1,-63.9},{36.9,-49.2},{43,-26.8},{49,-2}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{49,-2},{57.4,32.2},{62.9,51.1},{67.7,64.4},{71.9,72.6},{
                76.1,77.1},{80,78}},
                color={0,0,0},
                thickness=0.5)}),
        Documentation(revisions="<html>
<ul>
<li>Initially implemented by Christian Kral on 2013-05-14</li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end CosineCurrent;

    model ExpSineCurrent "Exponentially damped sine current source"
      parameter Real I(start=1) "Amplitude of sine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=2)
        "Frequency of sine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica_SIunits.Damping damping(start=1)
        "Damping coefficient of sine wave";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare
          Modelica_Blocks.Sources.ExpSine
          signalSource(
          amplitude=I,
          freqHz=freqHz,
          phase=phase,
          damping=damping));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-80,-14},{-75.2,18.3},{-72,36.3},
                  {-68.7,50.5},{-65.5,60.2},{-62.3,65.3},{-59.1,65.6},{-55.9,61.3},
                  {-52.7,53.1},{-48.6,38.2},{-43,11.8},{-35,-27.9},{-30.2,-47.7},
                  {-26.1,-59.9},{-22.1,-67.2},{-18.1,-69.3},{-14.1,-66.5},{-10.1,
                  -59.3},{-5.23,-46.1},{8.44,-0.3},{13.3,12.4},{18.1,20.8},{22.1,
                  24},{26.9,23.2},{31.8,17.8},{38.2,5.4},{51.1,-24.5},{57.5,-35.2},
                  {63.1,-39.9},{68.7,-39.9},{75.2,-34.5},{80,-27.8}}, color={192,
                  192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{100,-40}},
              color={192,192,192}),Polygon(
                points={{100,-40},{84,-34},{84,-46},{100,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},
                {-35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{-19.9,
                22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},{
                0.302,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},{
                25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,16.9},
                {56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,-18},{80,
                -12.1}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-78,1},{-55,-19}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-72,-36},{-26,-54}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{76,-44},{100,-64}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-50,0},{18,0}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-50,0},{-80,0}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-50,77},{-50,0}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{18,-1},{18,76}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{18,73},{-50,73}}, color={
              192,192,192}),Text(
                extent={{-42,88},{9,74}},
                lineColor={160,160,164},
                textString="1/freqHz"),Polygon(
                points={{-50,73},{-41,75},{-41,71},{-50,73}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{18,73},{10,75},{10,71},{18,73}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-50,-61},{-19,-61}},
              color={192,192,192}),Polygon(
                points={{-18,-61},{-26,-59},{-26,-63},{-18,-61}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-51,-63},{-27,-75}},
                lineColor={160,160,164},
                textString="t"),Text(
                extent={{-82,-67},{108,-96}},
                lineColor={160,160,164},
                textString="I*exp(-damping*t)*sin(2*pi*freqHz*t+phase)"),Line(
                points={{-50,0},{-50,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-50,-54},{-50,-72}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{18,-76},{-1,-48}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-74,83},{-54,103}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end ExpSineCurrent;

    model ExponentialsCurrent "Rising and falling exponential current source"
      parameter Real iMax(start=1) "Upper bound for rising edge";
      parameter Modelica_SIunits.Time riseTime(min=0, start=0.5) "Rise time";
      parameter Modelica_SIunits.Time riseTimeConst(min=Modelica_Constants.small,
          start=0.1) "Rise time constant";
      parameter Modelica_SIunits.Time fallTimeConst(min=Modelica_Constants.small,
          start=riseTimeConst) "Fall time constant";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare
          Modelica_Blocks.Sources.Exponentials signalSource(
          outMax=iMax,
          riseTime=riseTime,
          riseTimeConst=riseTimeConst,
          fallTimeConst=fallTimeConst));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-76,-59},{-73.2,-44.3},{-70.3,-31.1},
                  {-66.8,-16.6},{-63.3,-4},{-59.7,6.92},{-55.5,18.18},{-51.3,27.7},
                  {-46.3,37},{-40.6,45.5},{-34.3,53.1},{-27.2,59.6},{-18.7,65.3},
                  {-8.1,70.2},{-6,71},{-3.88,58.5},{-1.05,43.7},{1.78,30.8},{
                  4.606,19.45},{8.14,7.3},{11.68,-3},{15.9,-13.2},{20.2,-21.6},{
                  25.1,-29.5},{30.8,-36.4},{37.1,-42.3},{44.9,-47.5},{54.8,-51.8},
                  {64,-54.4}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-100,-70},{100,-70}}, color={
              192,192,192}),Polygon(
                points={{100,-70},{84,-64},{84,-76},{100,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,
                25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,
                74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{
                32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},
                {47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},
                {80.9,-18.5},{90.8,-22.8},{100,-25.4}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,90},{-80,-80}},
              color={192,192,192}),Polygon(
                points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{-40,-60}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-40,-30},{-42,-40},{-38,-40},{-40,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-39,-30},{-80,-30}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-59,-71},{-13,-89}},
                lineColor={160,160,164},
                textString="startTime"),Polygon(
                points={{-40,-30},{-31,-28},{-31,-32},{-40,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{30,-30}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{30,-30},{22,-28},{22,-32},{30,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-26,-12},{19,-28}},
                lineColor={160,160,164},
                textString="riseTime"),Line(
                points={{-40,-30},{-80,-30}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{30,100},{30,-34}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end ExponentialsCurrent;

    model PulseCurrent "Pulse current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of pulse";
      parameter Real width(
        final min=Modelica_Constants.small,
        final max=100,
        start=50) "Width of pulse in % of period";
      parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small,
          start=1) "Time for one period";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare Modelica_Blocks.Sources.Pulse
          signalSource(
          amplitude=I,
          width=width,
          period=period));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-80,-67},{-50,-67},{-50,73},{-10,
                  73},{-10,-67},{30,-67},{30,73},{70,73}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-34,0},{-34,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,-24},{-35,-36}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-42,-69},{4,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-19,0},{-19,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-80,0},{-19,0},{-19,50},{21,50},{21,0},{41,0},{41,51},{
                80,51}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-19,88},{-19,49}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{21,74},{21,50}},
                color={160,160,164},
                pattern=LinePattern.Dash),Line(
                points={{41,88},{41,51}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-19,83},{41,83}}, color={
              192,192,192}),Line(points={{-19,69},{21,69}}, color={192,192,192}),
              Text(
                extent={{-9,97},{37,85}},
                lineColor={160,160,164},
                textString="period"),Text(
                extent={{-18,81},{21,69}},
                lineColor={160,160,164},
                textString="width"),Line(
                points={{-52,50},{-19,50}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-34,50},{-34,1}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-78,34},{-37,20}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{-34,50},{-37,37},{-31,37},{-34,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{80,51},{80,0},{90,0}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-19,69},{-10,71},{-10,67},{-19,69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{21,69},{13,71},{13,67},{21,69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-19,83},{-10,85},{-10,81},{-19,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{41,83},{33,85},{33,81},{41,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end PulseCurrent;

    model SawToothCurrent "Saw tooth current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of saw tooth";
      parameter Modelica_SIunits.Time period(start=1) "Time for one period";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare
          Modelica_Blocks.Sources.SawTooth
          signalSource(amplitude=I, period=period));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-70,-71},{-50,-71},{10,70},{10,-71},
                  {70,70},{70,-71}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,-20},{-37,-33},{-31,-33},{-34,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-34,-20},{-34,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,-24},{-35,-36}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-31,-69},{15,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-10,-20},{-10,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-10,88},{-10,-20}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{30,88},{30,59}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-10,83},{30,83}}, color={
              192,192,192}),Text(
                extent={{-12,97},{34,85}},
                lineColor={160,160,164},
                textString="period"),Line(
                points={{-44,60},{30,60}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-34,60},{-34,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-78,34},{-37,20}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{-34,60},{-37,47},{-31,47},{-34,60}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,83},{-1,85},{-1,81},{-10,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{30,83},{22,85},{22,81},{30,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end SawToothCurrent;

    model TrapezoidCurrent "Trapezoidal current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of trapezoid";
      parameter Modelica_SIunits.Time rising(final min=0, start=0)
        "Rising duration of trapezoid";
      parameter Modelica_SIunits.Time width(final min=0, start=0.5)
        "Width duration of trapezoid";
      parameter Modelica_SIunits.Time falling(final min=0, start=0)
        "Falling duration of trapezoid";
      parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small,
          start=1) "Time for one period";
      parameter Integer nperiod(start=-1)
        "Number of periods (< 0 means infinite number of periods)";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare
          Modelica_Blocks.Sources.Trapezoid signalSource(
          amplitude=I,
          rising=rising,
          width=width,
          falling=falling,
          period=period,
          nperiod=nperiod));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-81,-66},{-60,-66},{-30,74},{1,74},
                  {30,-66},{51,-66},{80,74}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,90},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{90,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-45,-30},{-47,-41},{-43,-41},{-45,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-45,-30},{-45,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-86,-43},{-43,-55}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-47,-69},{-1,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-30,79},{-30,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-10,59},{-10,40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{20,59},{20,40}},
                color={160,160,164},
                pattern=LinePattern.Dash),Line(
                points={{40,59},{40,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-21,75},{60,75}}, color={
              192,192,192}),Line(points={{-30,56},{40,56}}, color={192,192,192}),
              Text(
                extent={{-9,88},{37,76}},
                lineColor={160,160,164},
                textString="period"),Text(
                extent={{-8,70},{21,60}},
                lineColor={160,160,164},
                textString="width"),Line(
                points={{-42,40},{-10,40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-39,40},{-39,-30}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-77,14},{-40,0}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{-30,56},{-23,58},{-23,54},{-30,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,56},{-17,58},{-17,54},{-10,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-30,75},{-21,77},{-21,73},{-30,75}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{60,75},{52,77},{52,73},{60,75}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-80,-30},{-30,-30},{-10,40},{20,40},{40,-30},{60,-30},{
                80,40},{100,40}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-39,40},{-41,30},{-37,30},{-39,40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-39,-30},{-41,-20},{-37,-20},{-39,-30},{-39,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{60,80},{60,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{40,56},{33,58},{33,54},{40,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{20,56},{27,58},{27,54},{20,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{20,56},{13,58},{13,54},{20,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,56},{-3,58},{-3,54},{-10,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-34,70},{-5,60}},
                lineColor={160,160,164},
                textString="rising"),Text(
                extent={{16,70},{45,60}},
                lineColor={160,160,164},
                textString="falling"),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end TrapezoidCurrent;

    model TableCurrent "Current source by linear interpolation in a table"
      parameter Real table[:, :]=[0, 0; 1, 1; 2, 4]
        "Table matrix (time = first column, current = second column)";
      extends Modelica_Electrical_Analog_Interfaces.CurrentSource(
                                       redeclare
          Modelica_Blocks.Sources.TimeTable signalSource(table=table));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-66,-36},{-66,84},{34,84},{34,-36},
                  {-66,-36},{-66,-6},{34,-6},{34,24},{-66,24},{-66,54},{34,54},{
                  34,84},{-16,84},{-16,-37}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-20,90},{30,-30}},
                lineColor={255,255,255},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-20,-30},{-20,90},{
              80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},
              {80,60},{80,90},{30,90},{30,-31}}, color={0,0,0}),Text(
                extent={{-77,-42},{-38,-58}},
                lineColor={160,160,164},
                textString="offset"),Polygon(
                points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-30,-70},{-33,-60},{-28,-60},{-30,-70},{-30,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-31,-31},{-31,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Line(
                points={{-20,-20},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-38,-70},{8,-88}},
                lineColor={160,160,164},
                textString="startTime"),Line(
                points={{-20,-30},{-80,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{66,-81},{91,-93}},
                lineColor={160,160,164},
                textString="time"),Text(
                extent={{-15,83},{24,68}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{33,83},{76,67}},
                lineColor={0,0,0},
                textString="i"),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
<p><br>This block generates a current source by <b>linear interpolation</b> in a table. The time points and current values are stored in a matrix <b>table[i,j]</b>, where the first column table[:,1] contains the time points and the second column contains the current to be interpolated. The table interpolation has the following properties:</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by <b>extrapolation</b> through the last or first two points of the table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and the current value is just returned independently of the actual time instant, i.e., this is a constant current source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined by the table can be shifted both in time and in the current. </li>
<li>The table is implemented in a numerically sound way by generating <b>time events</b> at interval boundaries.
    This generates continuously differentiable values for the integrator.</li>
</ul>
<p>Example:</p>
<pre>   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the current i =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the current i =  2.5,
    e.g., time = 2.0, the current i =  4.0,
    e.g., time = 5.0, the current i = 23.0 (i.e., extrapolation). </pre>
<p><br> Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TableCurrent;

    model SupplyVoltage "Supply voltage (positive and negative)"
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      Modelica_Electrical_Analog_Interfaces.PositivePin pin_p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica_Electrical_Analog_Interfaces.NegativePin pin_n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica_Electrical_Analog_Interfaces.NegativePin ground
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      Modelica_Electrical_Analog.Sources.ConstantVoltage positiveSupply(final V=
            Vps)
        annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      Modelica_Electrical_Analog.Sources.ConstantVoltage negativeSupply(final V=-
            Vns)
        annotation (Placement(transformation(extent={{40,-10},{60,10}})));
    equation
      connect(pin_p, positiveSupply.p) annotation (Line(
          points={{-100,0},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(negativeSupply.n, pin_n) annotation (Line(
          points={{60,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(positiveSupply.n, ground) annotation (Line(
          points={{-40,0},{0,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground, negativeSupply.p) annotation (Line(
          points={{0,0},{40,0}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Line(
              points={{-60,40},{-60,-40}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{40,40},{40,-40}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-40,20},{-40,-20}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{60,20},{60,-20}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-90,0},{-60,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{60,0},{90,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{-100,100},{100,80}},
              lineColor={0,0,255},
              textString="%name"),
            Line(
              points={{-40,0},{-10,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{10,0},{40,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{-100,40},{-80,20}},
              lineColor={0,0,255},
              textString="+"),
            Text(
              extent={{80,40},{100,20}},
              lineColor={0,0,255},
              textString="-"),
            Text(
              extent={{-10,40},{10,20}},
              lineColor={0,0,255},
              textString="0")}),
        Documentation(info="<html>
                       <p>This is a simple model of a constant supply voltage with positive and negative supply, the potential between positive and negative supply is accessible.</p>
                       </html>"));
    end SupplyVoltage;
    annotation (Documentation(info="<html>
<p>This package contains time-dependent and controlled voltage and current sources. Most of the sources use the behavior modeled in the Modelica.Blocks.Sources package. All sources are ideal in the sense that <b>no</b> internal resistances are included.</p>
</html>",   revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>
</html>"));
  end Sources;
annotation (Documentation(info="<html>
<p>
This package contains packages for analog electrical components:</p>
<ul>
<li>Basic: basic components (resistor, capacitor, conductor, inductor, transformer, gyrator)</li>
<li>Semiconductors: semiconductor devices (diode, bipolar and MOS transistors)</li>
<li>Lines: transmission lines (lossy and lossless)</li>
<li>Ideal: ideal elements (switches, diode, transformer, idle, short, ...)</li>
<li>Sources: time-dependent and controlled voltage and current sources</li>
<li>Sensors: sensors to measure potential, voltage, and current</li>
</ul>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden, Germany
</dd>
</dl>
</html>"), Icon(graphics={
        Line(
          points={{12,60},{12,-60}},
          color={0,0,0}),
        Line(
          points={{-12,60},{-12,-60}},
          color={0,0,0}),
        Line(points={{-80,0},{-12,0}}, color={0,0,0}),
        Line(points={{12,0},{80,0}}, color={0,0,0})}));
end Modelica_Electrical_Analog;
