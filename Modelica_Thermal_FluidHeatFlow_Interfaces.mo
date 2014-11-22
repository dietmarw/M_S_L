within ;
encapsulated package Modelica_Thermal_FluidHeatFlow_Interfaces
  "Connectors and partial models"
  import Modelica_Icons;
  import Modelica_Thermal_FluidHeatFlow;
  import Modelica_SIunits;
  import Modelica_Constants;
  import Modelica_Blocks_Interfaces;
  extends Modelica_Icons.InterfacesPackage;

  connector FlowPort "Connector flow port"

    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium
      "Medium in the connector";
    Modelica_SIunits.Pressure p;
    flow Modelica_SIunits.MassFlowRate m_flow;
    Modelica_SIunits.SpecificEnthalpy h;
    flow Modelica_SIunits.EnthalpyFlowRate H_flow;
  annotation (Documentation(info="<HTML>
Basic definition of the connector.<br>
<b>Variables:</b>
<ul>
<li>Pressure p</li>
<li>flow MassFlowRate m_flow</li>
<li>Specific Enthalpy h</li>
<li>flow EnthaplyFlowRate H_flow</li>
</ul>
If ports with different media are connected, the simulation is asserted due to the check of parameter.
</HTML>"));
  end FlowPort;

  connector FlowPort_a "Filled flow port (used upstream)"

    extends FlowPort;
  annotation (Documentation(info="<HTML>
Same as FlowPort, but icon allows to differentiate direction of flow.
</HTML>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Ellipse(
            extent={{-98,98},{98,-98}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid)}),
                                           Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={
          Rectangle(
            extent={{-50,50},{50,-50}},
            lineColor={255,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-48,48},{48,-48}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-100,110},{100,50}},
            lineColor={0,0,255},
            textString="%name")}));
  end FlowPort_a;

  connector FlowPort_b "Hollow flow port (used downstream)"

    extends FlowPort;
  annotation (Documentation(info="<HTML>
Same as FlowPort, but icon allows to differentiate direction of flow.
</HTML>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Ellipse(extent={{-98,98},{98,-98}},
              lineColor={0,0,255})}),      Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={
          Rectangle(
            extent={{-50,50},{50,-50}},
            lineColor={255,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(extent={{-48,48},{48,-48}}, lineColor={0,0,255}),
          Text(
            extent={{-100,110},{100,50}},
            lineColor={0,0,255},
            textString="%name")}));
  end FlowPort_b;

  package Partials "Partial models"
    extends Modelica_Icons.Package;

    partial model SimpleFriction "Simple friction model"

      parameter Modelica_SIunits.VolumeFlowRate V_flowLaminar(min=
            Modelica_Constants.small,                                                       start=0.1)
        "Laminar volume flow"
        annotation(Dialog(group="Simple Friction"));
      parameter Modelica_SIunits.Pressure dpLaminar(start=0.1)
        "Laminar pressure drop"
        annotation(Dialog(group="Simple Friction"));
      parameter Modelica_SIunits.VolumeFlowRate V_flowNominal(start=1)
        "Nominal volume flow"
        annotation(Dialog(group="Simple Friction"));
      parameter Modelica_SIunits.Pressure dpNominal(start=1)
        "Nominal pressure drop"
        annotation(Dialog(group="Simple Friction"));
      parameter Real frictionLoss(min=0, max=1) = 0
        "Part of friction losses fed to medium"
        annotation(Dialog(group="Simple Friction"));
      Modelica_SIunits.Pressure pressureDrop;
      Modelica_SIunits.VolumeFlowRate volumeFlow;
      Modelica_SIunits.Power Q_friction;
    protected
      parameter Modelica_SIunits.Pressure dpNomMin=dpLaminar/V_flowLaminar*V_flowNominal;
      parameter Real k(final unit="Pa.s2/m6", fixed=false);
    initial algorithm
      assert(V_flowNominal>V_flowLaminar,
        "SimpleFriction: V_flowNominal has to be > V_flowLaminar!");
      assert(dpNominal>=dpNomMin,
        "SimpleFriction: dpNominal has to be > dpLaminar/V_flowLaminar*V_flowNominal!");
      k:=(dpNominal - dpNomMin)/(V_flowNominal - V_flowLaminar)^2;
    equation
      if     volumeFlow > +V_flowLaminar then
        pressureDrop = +dpLaminar/V_flowLaminar*volumeFlow + k*(volumeFlow - V_flowLaminar)^2;
      elseif volumeFlow < -V_flowLaminar then
        pressureDrop = +dpLaminar/V_flowLaminar*volumeFlow - k*(volumeFlow + V_flowLaminar)^2;
      else
        pressureDrop =  dpLaminar/V_flowLaminar*volumeFlow;
      end if;
      Q_friction = frictionLoss*volumeFlow*pressureDrop;
    annotation (Documentation(info="<HTML>
Definition of relationship between pressure drop and volume flow rate:<br>
-V_flowLaminar &lt; VolumeFlow &lt; +V_flowLaminar: laminar i.e., linear dependency of pressure drop on volume flow.<br>
-V_flowLaminar &gt; VolumeFlow or VolumeFlow &lt; +V_flowLaminar: turbulent i.e., quadratic dependency of pressure drop on volume flow.<br>
Linear and quadratic dependency are coupled smoothly at V_flowLaminar / dpLaminar.<br>
Quadratic dependency is defined by nominal volume flow and pressure drop (V_flowNominal / dpNominal).<br>
See also sketch at diagram layer.
</HTML>"),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Line(points={{-80,0},{80,0}}, color={0,0,255}),
            Line(points={{0,80},{0,-80}}, color={0,0,255}),
            Line(points={{-40,-20},{40,20}}, color={0,0,255}),
            Line(points={{40,20},{60,40},{70,60},{74,80}}, color={0,0,255}),
            Line(points={{-40,-20},{-60,-40},{-70,-60},{-74,-80}}, color={0,0,
                  255}),
            Line(points={{40,20},{40,0}}, color={0,0,255}),
            Line(points={{60,40},{60,0}}, color={0,0,255}),
            Line(points={{40,20},{0,20}}, color={0,0,255}),
            Line(points={{60,40},{0,40}}, color={0,0,255}),
            Text(
              extent={{18,0},{48,-20}},
              lineColor={0,0,255},
              textString="V_flowLaminar"),
            Text(
              extent={{50,0},{80,-20}},
              lineColor={0,0,255},
              textString="V_flowNominal"),
            Text(
              extent={{-30,30},{-4,10}},
              lineColor={0,0,255},
              textString="dpLaminar"),
            Text(
              extent={{-30,50},{-4,30}},
              lineColor={0,0,255},
              textString="dpNominal"),
            Text(
              extent={{0,20},{30,0}},
              lineColor={0,0,255},
              textString="dp ~ V_flow"),
            Text(
              extent={{30,60},{60,40}},
              lineColor={0,0,255},
              textString="dp ~ V_flow^2")}));
    end SimpleFriction;

    partial model TwoPort "Partial model of two port"

      parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
          Modelica_Thermal_FluidHeatFlow.Media.Medium()
        "Medium in the component" annotation (choicesAllMatching=true);
      parameter Modelica_SIunits.Mass m(start=1) "Mass of medium";
      parameter Modelica_SIunits.Temperature T0(start=293.15, displayUnit="degC")
        "Initial temperature of medium"
        annotation(Dialog(enable=m>Modelica.Constants.small));
      parameter Boolean T0fixed=false
        "Initial temperature guess value or fixed"
      annotation(choices(checkBox=true),Dialog(enable=m>Modelica.Constants.small));
      parameter Real tapT(final min=0, final max=1)=1
        "Defines temperature of heatPort between inlet and outlet temperature";
      Modelica_SIunits.Pressure dp "Pressure drop a->b";
      Modelica_SIunits.VolumeFlowRate V_flow "Volume flow a->b";
      Modelica_SIunits.HeatFlowRate Q_flow "Heat exchange with ambient";
      output Modelica_SIunits.Temperature T(start=T0, fixed=T0fixed)
        "Outlet temperature of medium";
      output Modelica_SIunits.Temperature T_a "Temperature at flowPort_a";
      output Modelica_SIunits.Temperature T_b "Temperature at flowPort_b";
      output Modelica_SIunits.TemperatureDifference dT
        "Temperature increase of coolant in flow direction";
    protected
      Modelica_SIunits.SpecificEnthalpy h "Medium's specific enthalpy";
      Modelica_SIunits.Temperature T_q
        "Temperature relevant for heat exchange with ambient";
    public
      FlowPort_a flowPort_a(final medium=medium) annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      FlowPort_b flowPort_b(final medium=medium) annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
    equation
      dp=flowPort_a.p - flowPort_b.p;
      V_flow=flowPort_a.m_flow/medium.rho;
      T_a=flowPort_a.h/medium.cp;
      T_b=flowPort_b.h/medium.cp;
      dT=if noEvent(V_flow>=0) then T-T_a else T_b-T;
      h = medium.cp*T;
      T_q = T  - noEvent(sign(V_flow))*(1 - tapT)*dT;
      // mass balance
      flowPort_a.m_flow + flowPort_b.m_flow = 0;
      // energy balance
      if m>Modelica_Constants.small then
        flowPort_a.H_flow + flowPort_b.H_flow + Q_flow = m*medium.cv*der(T);
      else
        flowPort_a.H_flow + flowPort_b.H_flow + Q_flow = 0;
      end if;
      // massflow a->b mixing rule at a, energy flow at b defined by medium's temperature
      // massflow b->a mixing rule at b, energy flow at a defined by medium's temperature
      flowPort_a.H_flow = semiLinear(flowPort_a.m_flow,flowPort_a.h,h);
      flowPort_b.H_flow = semiLinear(flowPort_b.m_flow,flowPort_b.h,h);
    annotation (Documentation(info="<HTML>
Partial model with two flowPorts.<br>
Possible heat exchange with the ambient is defined by Q_flow; setting this = 0 means no energy exchange.<br>
Setting parameter m (mass of medium within pipe) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Mixing rule is applied.<br>
Parameter 0 &lt; tapT &lt; 1 defines temperature of heatPort between medium's inlet and outlet temperature.
</HTML>"));
    end TwoPort;

    partial model Ambient "Partial model of ambient"

      parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
          Modelica_Thermal_FluidHeatFlow.Media.Medium() "Ambient medium"
        annotation (choicesAllMatching=true);
      output Modelica_SIunits.Temperature T "Outlet temperature of medium";
      output Modelica_SIunits.Temperature T_port "Temperature at flowPort_a";
    protected
      Modelica_SIunits.SpecificEnthalpy h;
    public
      FlowPort_a flowPort(final medium=medium) annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    equation
      T_port=flowPort.h/medium.cp;
      h = medium.cp*T;
      // massflow -> ambient: mixing rule
      // massflow <- ambient: energy flow defined by ambient's temperature
      flowPort.H_flow = semiLinear(flowPort.m_flow,flowPort.h,h);
    annotation (Documentation(info="<HTML>
<p>
Partial model of (Infinite) ambient, defines pressure and temperature.
</p>
</HTML>"), Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(
              extent={{-90,90},{90,-90}},
              lineColor={255,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-150,150},{150,90}},
              lineColor={0,0,255},
              textString="%name")}));
    end Ambient;

    partial model AbsoluteSensor "Partial model of absolute sensor"
      extends Modelica_Icons.RotationalSensor;

      parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
          Modelica_Thermal_FluidHeatFlow.Media.Medium() "Sensor's medium"
        annotation (choicesAllMatching=true);
      FlowPort_a flowPort(final medium=medium) annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      // no mass exchange
      flowPort.m_flow = 0;
      // no energy exchange
      flowPort.H_flow = 0;
    annotation (Documentation(info="<HTML>
Partial model for an absolute sensor (pressure/temperature).<br>
Pressure, mass flow, temperature and enthalpy flow of medium are not affected.
</HTML>"),        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Line(points={{-70,0},{-90,0}}, color={0,0,0}),
            Line(points={{70,0},{100,0}}),
            Text(
              extent={{-150,130},{150,70}},
              lineColor={0,0,255},
              textString="%name")}));
    end AbsoluteSensor;

    partial model RelativeSensor "Partial model of relative sensor"
      extends Modelica_Icons.RotationalSensor;

      parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
          Modelica_Thermal_FluidHeatFlow.Media.Medium() "Sensor's medium"
        annotation (choicesAllMatching=true);
      FlowPort_a flowPort_a(final medium=medium) annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      FlowPort_b flowPort_b(final medium=medium) annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y
        annotation (Placement(transformation(
            origin={0,-110},
            extent={{10,-10},{-10,10}},
            rotation=90)));
    equation
      // no mass exchange
      flowPort_a.m_flow = 0;
      flowPort_b.m_flow = 0;
      // no energy exchange
      flowPort_a.H_flow = 0;
      flowPort_b.H_flow = 0;
    annotation (Documentation(info="<HTML>
Partial model for a relative sensor (pressure drop/temperature difference).<br>
Pressure, mass flow, temperature and enthalpy flow of medium are not affected.
</HTML>"),        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Line(points={{-70,0},{-90,0}}, color={0,0,0}),
            Line(points={{70,0},{90,0}}, color={0,0,0}),
            Line(points={{0,-100},{0,-70}}),
            Text(
              extent={{-150,130},{150,70}},
              lineColor={0,0,255},
              textString="%name")}));
    end RelativeSensor;

    partial model FlowSensor "Partial model of flow sensor"
      extends Modelica_Icons.RotationalSensor;
      extends TwoPort(final m=0, final T0=0, final tapT=1);
      Modelica_Blocks_Interfaces.RealOutput y
        annotation (Placement(transformation(
            origin={0,-110},
            extent={{10,-10},{-10,10}},
            rotation=90)));
    equation
      // no pressure drop
      dp = 0;
      // no energy exchange
      Q_flow = 0;
    annotation (Documentation(info="<HTML>
Partial model for a flow sensor (mass flow/heat flow).<br>
Pressure, mass flow, temperature and enthalpy flow of medium are not affected, but mixing rule is applied.
</HTML>"),        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Line(points={{-70,0},{-90,0}}, color={0,0,0}),
            Line(points={{70,0},{90,0}}, color={0,0,0}),
            Line(points={{0,-100},{0,-70}}),
            Text(
              extent={{-150,130},{150,70}},
              lineColor={0,0,255},
              textString="%name")}));
    end FlowSensor;
  annotation (Documentation(info="<HTML>

</HTML>",
       revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.10 2005/02/15 Anton Haumer<br>
       moved Partials into Interfaces</li>
  <li> v1.11 2005/02/18 Anton Haumer<br>
       corrected usage of cv and cp</li>
  <li> v1.30 Beta 2005/06/02 Anton Haumer<br>
       friction losses are fed to medium</li>
  <li> v1.31 Beta 2005/06/04 Anton Haumer<br>
       searching solution for problems @ m_flow=0</li>
  <li> v1.33 Beta 2005/06/07 Anton Haumer<br>
       corrected usage of simpleFlow</li>
  <li> v1.43 Beta 2005/06/20 Anton Haumer<br>
       Test of mixing / semiLinear</li>
  <li> v1.50 2005/09/07 Anton Haumer<br>
       semiLinear works fine<br>
       removed test-version of semiLinear</li>
  <li> v1.60 2007/01/23 Anton Haumer<br>
       new parameter tapT defining Temperature of heatPort</li>
  </ul>
</html>"));
  end Partials;
annotation (Documentation(info="<HTML>
<p>This package contains connectors and partial models:</p>
<ul>
<li>FlowPort: basic definition of the connector.</li>
<li>FlowPort_a &amp; FlowPort_b: same as FlowPort with different icons to differentiate direction of flow</li>
<li>package Partials (defining basic thermodynamic equations)</li>
</ul>

</HTML>",
        revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.10 2005/02/15 Anton Haumer<br>
       moved Partials into Interfaces</li>
  <li> v1.11 2005/02/18 Anton Haumer<br>
       corrected usage of cv and cp</li>
  <li> v1.30 Beta 2005/06/02 Anton Haumer<br>
       friction losses are fed to medium</li>
  <li> v1.33 Beta 2005/06/07 Anton Haumer<br>
       corrected usage of simpleFlow</li>
  <li> v1.43 Beta 2005/06/20 Anton Haumer<br>
       Test of mixing / semiLinear</li>
  <li> v1.50 2005/09/07 Anton Haumer<br>
       semiLinear works fine</li>
  </ul>
</html>"), uses(Modelica_Blocks_Interfaces(version="3.2.2"),
                Modelica_Constants(version="3.2.2"),
                Modelica_SIunits(version="3.2.2"),
                Modelica_Thermal_FluidHeatFlow(version="3.2.2"),
                Modelica_Icons(version="3.2.2")),
           version="3.2.2");
end Modelica_Thermal_FluidHeatFlow_Interfaces;
