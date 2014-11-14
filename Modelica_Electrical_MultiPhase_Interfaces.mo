within ;
package Modelica_Electrical_MultiPhase_Interfaces
  "Interfaces for electrical multiphase models"
  extends Modelica_Icons.InterfacesPackage;

  connector Plug "Plug with m pins for an electric component"
    parameter Integer m(final min=1) = 3 "Number of phases";
    Modelica_Electrical_Analog_Interfaces.Pin pin[m];

    annotation (Documentation(info="<HTML>
<p>
Connectors PositivePlug and NegativePlug are nearly identical.
The only difference is that the icons are different in order
to identify more easily the plugs of a component.
Usually, connector PositivePlug is used for the positive and
connector NegativePlug for the negative plug of an electrical component.<br>
Connector Plug is a composite connector containing m Pins (Modelica.Electrical.Analog.Interfaces.Pin).
</p>
</HTML>"),
         Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Text(
            extent={{-100,-99},{100,-179}},
            lineColor={0,0,255},
            textString="%name")}));
  end Plug;

  connector PositivePlug "Positive plug with m pins"
    extends Plug;
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<HTML>
<p>
Connectors PositivePlug and NegativePlug are nearly identical.
The only difference is that the icons are different in order
to identify more easily the plugs of a component.
Usually, connector PositivePlug is used for the positive and
connector NegativePlug for the negative plug of an electrical component.<br>
Connector Plug is a composite connector containing m Pins (Modelica.Electrical.Analog.Interfaces.Pin).
</p>
</HTML>"));

  end PositivePlug;

  connector NegativePlug "Negative plug with m pins"
    extends Plug;
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<HTML>
<p>
Connectors PositivePlug and NegativePlug are nearly identical.
The only difference is that the icons are different in order
to identify more easily the plugs of a component.
Usually, connector PositivePlug is used for the positive and
connector NegativePlug for the negative plug of an electrical component.<br>
Connector Plug is a composite connector containing m Pins (Modelica.Electrical.Analog.Interfaces.Pin).
</p>
</HTML>"));
  end NegativePlug;

  partial model ConditionalHeatPort
    "Partial model to include conditional HeatPorts in order to describe the power loss via a thermal network"
    parameter Integer mh(min=1) = 3 "Number of heatPorts=number of phases";
    parameter Boolean useHeatPort=false "=true, if all heat ports are enabled"
                                             annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    parameter Modelica_SIunits.Temperature T[mh]=fill(293.15, mh)
      "Fixed device temperatures if useHeatPort = false"
      annotation (Dialog(enable=not useHeatPort));
    Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort[mh] if
      useHeatPort "Conditional heat ports" annotation (Placement(
          transformation(extent={{-10,-110},{10,-90}}), iconTransformation(
            extent={{-10,-110},{10,-90}})));
    annotation (Documentation(revisions="<html>
<ul>
<li><i>August 26, 2009 </i>by Anton Haumer initially implemented</li>
</ul>
</html>",
        info="<html>
<p>
This partial model provides conditional heat ports for the connection to a thermal network.
</p>
<ul>
<li> If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal
     loss power flows internally to the ground. In this case, the parameter <b>T</b> specifies
     the fixed device temperatures.</li>
<li> If <b>useHeatPort</b> is set to <b>true</b>, all heat ports are available.</li>
</ul>
</html>"),
         Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
  end ConditionalHeatPort;

  partial model TwoPlug "Component with one m-phase electric port"
    parameter Integer m(min=1) = 3 "Number of phases";
    Modelica_SIunits.Voltage v[m] "Voltage drops between the two plugs";
    Modelica_SIunits.Current i[m] "Currents flowing into positive plugs";
    PositivePlug plug_p(final m=m) annotation (Placement(transformation(
            extent={{-110,-10},{-90,10}}, rotation=0)));
    NegativePlug plug_n(final m=m) annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
  equation
    v = plug_p.pin.v - plug_n.pin.v;
    i = plug_p.pin.i;
    annotation (Documentation(info="<HTML>
<p>
Superclass of elements which have <b>two</b> electrical plugs:
the positive plug connector <i>plug_p</i>, and the negative plug connector <i>plug_n</i>.
The currents flowing into plug_p are provided explicitly as currents i[m].
</p>
</HTML>"));
  end TwoPlug;

  partial model OnePort
    "Component with two electrical plugs and currents from plug_p to plug_n"

    extends TwoPlug;
  equation
    plug_p.pin.i + plug_n.pin.i = zeros(m);
    annotation (Documentation(info="<HTML>
<p>
Superclass of elements which have <b>two</b> electrical plugs:
the positive plug connector <i>plug_p</i>, and the negative plug connector <i>plug_n</i>.
The currents flowing into plug_p are provided explicitly as currents i[m].
It is assumed that the currents flowing into plug_p are identical to the currents flowing out of plug_n.
</p>
</HTML>"));
  end OnePort;

  partial model FourPlug "Component with two m-phase electric ports"
    parameter Integer m(final min=1) = 3 "Number of phases";
    Modelica_SIunits.Voltage v1[m] "Voltage drops over the left port";
    Modelica_SIunits.Voltage v2[m] "Voltage drops over the right port";
    Modelica_SIunits.Current i1[m]
      "Current flowing into positive plug of the left port";
    Modelica_SIunits.Current i2[m]
      "Current flowing into positive plug of the right port";
    PositivePlug plug_p1(final m=m) annotation (Placement(transformation(
            extent={{-110,90},{-90,110}}, rotation=0)));
    PositivePlug plug_p2(final m=m) annotation (Placement(transformation(
            extent={{90,90},{110,110}}, rotation=0)));
    NegativePlug plug_n1(final m=m) annotation (Placement(transformation(
            extent={{-110,-110},{-90,-90}}, rotation=0)));
    NegativePlug plug_n2(final m=m) annotation (Placement(transformation(
            extent={{90,-110},{110,-90}}, rotation=0)));
  equation
    v1 = plug_p1.pin.v - plug_n1.pin.v;
    v2 = plug_p2.pin.v - plug_n2.pin.v;
    i1 = plug_p1.pin.i;
    i2 = plug_p2.pin.i;
    annotation (Documentation(info="<HTML>
<p>
Superclass of elements which have <b>four</b> electrical plugs.
</p>
</HTML>"));
  end FourPlug;

  partial model TwoPort
    "Component with two m-phase electric ports, including currents"
    extends FourPlug;
  equation
    plug_p1.pin.i + plug_n1.pin.i = zeros(m);
    plug_p2.pin.i + plug_n2.pin.i = zeros(m);
    annotation (Documentation(info="<HTML>
<p>
Superclass of elements which have <b>four</b> electrical plugs.
It is assumed that the currents flowing into plug_p1 are identical to the currents flowing out of plug_n1,
and that the currents flowing into plug_p2 are identical to the currents flowing out of plug_n2.
</p>
</HTML>"));
  end TwoPort;
  annotation (Documentation(info="<HTML>
<p>
This package contains connectors and interfaces (partial models) for
electrical multiphase components, based on Modelica.Electrical.Analog.
</p>

</HTML>",
        revisions="<html>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting &amp; Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li>v1.0 2004/10/01 Anton Haumer</li>
  <li>v1.2 2006/05/12 Anton Haumer<br>
      removed annotation from pin of Interfaces.Plug</li>
  </ul>
  </dd>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2013, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</dl>
</html>"));
end Modelica_Electrical_MultiPhase_Interfaces;
