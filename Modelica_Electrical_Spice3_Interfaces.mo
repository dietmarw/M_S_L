within ;
package Modelica_Electrical_Spice3_Interfaces
  "Connectors, Interfaces, and partial models"

  extends Modelica_Icons.InterfacesPackage;

  partial model TwoPortControlledSources
    "Component with two electrical ports, including current"
    Modelica_SIunits.Voltage v1 "Voltage drop over the controlling port";
    Modelica_SIunits.Voltage v2 "Voltage drop over the controlled port";
    Modelica_SIunits.Current i1
      "Current flowing from pos. to neg. pin of the controlling port";
    Modelica_SIunits.Current i2
      "Current flowing from pos. to neg. pin of the controlled port";
    Modelica_Electrical_Analog_Interfaces.PositivePin p1
      "Positive pin of the controlling port"       annotation (Placement(
          transformation(extent={{-110,40},{-90,60}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.NegativePin n1
      "Negative pin of the controlling port"       annotation (Placement(
          transformation(extent={{-90,-60},{-110,-40}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.PositivePin p2
      "Positive pin of the controlled port"         annotation (Placement(
          transformation(extent={{110,40},{90,60}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.NegativePin n2
      "Negative pin of the controlled port"         annotation (Placement(
          transformation(extent={{90,-60},{110,-40}}, rotation=0)));
  equation
    v1 = p1.v - n1.v;
    v2 = p2.v - n2.v;
    0 = p1.i + n1.i;
    0 = p2.i + n2.i;
    i1 = p1.i;
    i2 = p2.i;
    annotation (
      Documentation(info="<html>
<p>TwoPort is a partial model that consists of two ports. It is assumed that the current flowing into the positive pin is identical to the current flowing out of pin n. This currents of each port are provided explicitly as currents i1 and i2, the voltages respectively as v1 and v2.</p>
</html>"));
  end TwoPortControlledSources;

  connector InductiveCouplePinIn
    "Pin to couple inductances via K, which gets the value of inductance"
    input Modelica_SIunits.Inductance L;
    Modelica_SIunits.CurrentSlope di "di/dt";
    flow Modelica_SIunits.Voltage v;
    annotation (Icon(graphics={Polygon(
            points={{0,0},{0,100},{100,0},{0,-100},{0,-100},{0,0}},
            lineColor={170,85,255},
            smooth=Smooth.None,
            fillColor={170,85,255},
            fillPattern=FillPattern.Solid)}));
  end InductiveCouplePinIn;

  connector InductiveCouplePinOut
    "Pin to couple inductances via K, which sets the value of inductance"
    output Modelica_SIunits.Inductance L;
    Modelica_SIunits.CurrentSlope di "di/dt";
    flow Modelica_SIunits.Voltage v;
    annotation (Icon(graphics={Polygon(
            points={{-100,0},{0,100},{0,0},{0,-100},{-2,-98},{-100,0}},
            lineColor={170,85,255},
            smooth=Smooth.None,
            fillColor={170,85,255},
            fillPattern=FillPattern.Solid)}));
  end InductiveCouplePinOut;

  partial model ConditionalSubstrate
    "Partial model to include a conditional substrate node"

    parameter Boolean useSubstrateNode = false
      "=true, if SubstrateNode is enabled"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    Modelica_Electrical_Analog_Interfaces.PositivePin S(v = substrateVoltage, i = -substrateCurrent) if useSubstrateNode annotation (Placement(
          transformation(extent={{90,0},{110,20}}),    iconTransformation(extent={{90,-10},
              {110,10}})));
    Modelica_SIunits.Voltage substrateVoltage;
    Modelica_SIunits.Current substrateCurrent;

  equation
    if not useSubstrateNode then
      substrateVoltage = 0;
    end if;
    annotation (        Documentation(revisions="<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>
This partial model provides a conditional heating port for the connection to a thermal network.
</p>
<ul>
<li> If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal
     loss power flows internally to the ground. In this case, the parameter <b>T</b> specifies
     the fixed device temperature (the default for T = 20<sup>o</sup>C).</li>
<li> If <b>useHeatPort</b> is set to <b>true</b>, a heat port is available.</li>
</ul>

<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from
ConditionalHeatingPort model (<b>lossPower = ...</b>). As device temperature
<b>T_heatPort</b> can be used to describe the influence of the device temperature
on the model behaviour.
</p>
</html>"));
  end ConditionalSubstrate;
  annotation(preferredView="info",
      Documentation(info="<html>
<p>The SPICE3 package uses the Modelica.Electrical.Analog interfaces. Only special partial models used in the SPICE3 package are located in this Interfaces package.</p>
</html>"),
    uses(Modelica(version="3.2.1")));
end Modelica_Electrical_Spice3_Interfaces;
