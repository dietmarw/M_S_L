within ;
encapsulated package Modelica_Thermal_HeatTransfer_Interfaces
  "Connectors and partial models"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Thermal_HeatTransfer;

  extends Modelica_Icons.InterfacesPackage;

  partial connector HeatPort "Thermal port for 1-dim. heat transfer"
    Modelica_SIunits.Temperature T "Port temperature";
    flow Modelica_SIunits.HeatFlowRate Q_flow
      "Heat flow rate (positive if flowing from outside into the component)";
    annotation (Documentation(info="<html>

</html>"));
  end HeatPort;

  connector HeatPort_a
    "Thermal port for 1-dim. heat transfer (filled rectangular icon)"

    extends HeatPort;

    annotation(defaultComponentName = "port_a",
      Documentation(info="<HTML>
<p>This connector is used for 1-dimensional heat flow between components.
The variables in the connector are:</p>
<pre>
   T       Temperature in [Kelvin].
   Q_flow  Heat flow rate in [Watt].
</pre>
<p>According to the Modelica sign convention, a <b>positive</b> heat flow
rate <b>Q_flow</b> is considered to flow <b>into</b> a component. This
convention has to be used whenever this connector is used in a model
class.</p>
<p>Note, that the two connector classes <b>HeatPort_a</b> and
<b>HeatPort_b</b> are identical with the only exception of the different
<b>icon layout</b>.</p></html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={191,0,0},
            fillColor={191,0,0},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}), graphics={Rectangle(
            extent={{-50,50},{50,-50}},
            lineColor={191,0,0},
            fillColor={191,0,0},
            fillPattern=FillPattern.Solid), Text(
            extent={{-120,120},{100,60}},
            lineColor={191,0,0},
            textString="%name")}));
  end HeatPort_a;

  connector HeatPort_b
    "Thermal port for 1-dim. heat transfer (unfilled rectangular icon)"

    extends HeatPort;

    annotation(defaultComponentName = "port_b",
      Documentation(info="<HTML>
<p>This connector is used for 1-dimensional heat flow between components.
The variables in the connector are:</p>
<pre>
   T       Temperature in [Kelvin].
   Q_flow  Heat flow rate in [Watt].
</pre>
<p>According to the Modelica sign convention, a <b>positive</b> heat flow
rate <b>Q_flow</b> is considered to flow <b>into</b> a component. This
convention has to be used whenever this connector is used in a model
class.</p>
<p>Note, that the two connector classes <b>HeatPort_a</b> and
<b>HeatPort_b</b> are identical with the only exception of the different
<b>icon layout</b>.</p></html>"),   Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}), graphics={Rectangle(
            extent={{-50,50},{50,-50}},
            lineColor={191,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-100,120},{120,60}},
            lineColor={191,0,0},
            textString="%name")}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={191,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
  end HeatPort_b;

  partial model Element1D
    "Partial heat transfer element with two HeatPort connectors that does not store energy"

    Modelica_SIunits.HeatFlowRate Q_flow "Heat flow rate from port_a -> port_b";
    Modelica_SIunits.TemperatureDifference dT "port_a.T - port_b.T";
  public
    HeatPort_a port_a annotation (Placement(transformation(extent={{-110,-10},
              {-90,10}}, rotation=0)));
    HeatPort_b port_b annotation (Placement(transformation(extent={{90,-10},{
              110,10}}, rotation=0)));
  equation
    dT = port_a.T - port_b.T;
    port_a.Q_flow = Q_flow;
    port_b.Q_flow = -Q_flow;
    annotation (Documentation(info="<HTML>
<p>
This partial model contains the basic connectors and variables to
allow heat transfer models to be created that <b>do not store energy</b>,
This model defines and includes equations for the temperature
drop across the element, <b>dT</b>, and the heat flow rate
through the element from port_a to port_b, <b>Q_flow</b>.
</p>
<p>
By extending this model, it is possible to write simple
constitutive equations for many types of heat transfer components.
</p>
</html>"));
  end Element1D;

  partial model PartialElementaryConditionalHeatPort
    "Partial model to include a conditional HeatPort in order to dissipate losses, used for textual modeling, i.e., for elementary models"
    parameter Boolean useHeatPort = false "=true, if heatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    parameter Modelica_SIunits.Temperature T=293.15
      "Fixed device temperature if useHeatPort = false"
      annotation(Dialog(enable=not useHeatPort));
    HeatPort_a heatPort(final T=TheatPort, final Q_flow=-lossPower) if
      useHeatPort
      "Optional port to which dissipated losses are transported in form of heat"
      annotation (Placement(transformation(extent={{-110,-110},{-90,-90}}),
          iconTransformation(extent={{-110,-110},{-90,-90}})));
    Modelica_SIunits.Power lossPower
      "Loss power leaving component via heatPort (> 0, if heat is flowing out of component)";
    Modelica_SIunits.Temperature TheatPort "Temperature of heatPort";
  equation
    if not useHeatPort then
       TheatPort = T;
    end if;
    annotation (Documentation(info="<html>
<p>
This partial model provides a conditional heat port for dissipating losses.
</p>
<ul>
<li>If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal loss power is dissipated internally.
In this case, the parameter <b>T</b> specifies the fixed device temperature (the default for T = 20&deg;C) </li>
<li>If <b>useHeatPort</b> is set to <b>true</b>, the heat port is available. </li>
</ul>
<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from PartialElementaryConditionalHeatPort model
(<b>lossPower = ...</b>). The device temperature <b>TheatPort</b> can be used to describe the influence of the device temperature on the model behaviour.
</p>
</html>"));
  end PartialElementaryConditionalHeatPort;

  partial model PartialElementaryConditionalHeatPortWithoutT
    "Partial model to include a conditional HeatPort in order to dissipate losses, used for textual modeling, i.e., for elementary models"
    parameter Boolean useHeatPort = false "=true, if heatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    HeatPort_a heatPort(final Q_flow=-lossPower) if useHeatPort
      "Optional port to which dissipated losses are transported in form of heat"
      annotation (Placement(transformation(extent={{-110,-110},{-90,-90}}),
          iconTransformation(extent={{-110,-110},{-90,-90}})));
    Modelica_SIunits.Power lossPower
      "Loss power leaving component via heatPort (> 0, if heat is flowing out of component)";
    annotation (Documentation(info="<html>
<p>
This partial model provides a conditional heat port for dissipating losses.
</p>
<ul>
<li>If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal loss power is dissipated internally.
<li>If <b>useHeatPort</b> is set to <b>true</b>, the heat port is available and must be connected from the outside.</li>
</ul>
<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from the PartialElementaryConditionalHeatPortWithoutT model
(<b>lossPower = ...</b>).
</p>

<p>
Note, this partial model is used in cases, where heatPort.T (that is the device temperature) is not utilized in the model. If this is desired, inherit instead from partial model
<a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPort\">PartialElementaryConditionalHeatPort</a>.
</p>
</html>"));
  end PartialElementaryConditionalHeatPortWithoutT;

  partial model PartialConditionalHeatPort
    "Partial model to include a conditional HeatPort in order to dissipate losses, used for graphical modeling, i.e., for building models by drag-and-drop"
    parameter Boolean useHeatPort = false "=true, if HeatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    parameter Modelica_SIunits.Temperature T=293.15
      "Fixed device temperature if useHeatPort = false"
      annotation(Dialog(enable=not useHeatPort));
    HeatPort_a heatPort if useHeatPort
      "Optional port to which dissipated losses are transported in form of heat"
      annotation (Placement(transformation(extent={{-110,-110},{-90,-90}}),
          iconTransformation(extent={{-110,-110},{-90,-90}})));
    Modelica_Thermal_HeatTransfer.Sources.FixedTemperature fixedTemperature(final T=T)
      if not useHeatPort
      annotation (Placement(transformation(extent={{-60,-90},{-80,-70}})));
  protected
    HeatPort_a internalHeatPort
      annotation (Placement(transformation(extent={{-104,-84},{-96,-76}})));
  equation
    connect(heatPort, internalHeatPort) annotation (Line(
        points={{-100,-100},{-100,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(fixedTemperature.port, internalHeatPort) annotation (Line(
        points={{-80,-80},{-100,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>
This partial model provides a conditional heat port for dissipating losses.
</p>
<ul>
<li>If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal loss power is dissipated internally.
In this case, the parameter <b>T</b> specifies the fixed device temperature (the default for T = 20&deg;C) </li>
<li>If <b>useHeatPort</b> is set to <b>true</b>, the heat port is available. </li>
</ul>
<p>
If this model is used, the <b>internalHeatPort</b> has to be connected in the model which inherits from PartialElementaryConditionalHeatPort model.
The device temperature <b>internalHeatPort.T</b> can be used to describe the influence of the device temperature on the model behaviour.
</p>
</html>"));
  end PartialConditionalHeatPort;

  annotation (uses(Modelica(version="3.2.1")));
end Modelica_Thermal_HeatTransfer_Interfaces;
