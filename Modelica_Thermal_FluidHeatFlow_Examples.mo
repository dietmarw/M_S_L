within ;
encapsulated package Modelica_Thermal_FluidHeatFlow_Examples
  "Examples that demonstrate the usage of the FluidHeatFlow components"
  import Modelica_Icons;
  import Modelica_Thermal_FluidHeatFlow;
  import Modelica_SIunits;
  import Modelica_Thermal_HeatTransfer;
  import Modelica_Blocks;
  import Modelica_Mechanics_Rotational;
  import Modelica_Constants;
  extends Modelica_Icons.ExamplesPackage;

  model SimpleCooling "Example: simple cooling circuit"
    extends Modelica_Icons.Example;
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Cooling medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC")=293.15
      "Ambient temperature";
    output Modelica_SIunits.TemperatureDifference dTSource=
      prescribedHeatFlow.port.T-TAmb "Source over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe=prescribedHeatFlow.port.T-pipe.heatPort.T
      "Source over Coolant";
    output Modelica_SIunits.TemperatureDifference dTCoolant=pipe.dT
      "Coolant's temperature increase";
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient1(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              -60,-10},{-80,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow pump(
      medium=medium,
      m=0,
      T0=TAmb,
      useVolumeFlowInput=true,
      constantVolumeFlow=1) annotation (Placement(transformation(extent={{-40,-10},
              {-20,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{0,-10},{20,10}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient2(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              40,-10},{60,10}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor(C=0.1, T(
          start=TAmb, fixed=true)) annotation (Placement(transformation(
          origin={40,-50},
          extent={{-10,10},{10,-10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow
      prescribedHeatFlow
      annotation (Placement(transformation(extent={{-30,-40},{-10,-60}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant volumeFlow(k=1) annotation (Placement(
          transformation(extent={{-60,10},{-40,30}}, rotation=0)));
    Modelica_Blocks.Sources.Constant heatFlow(k=10)
      annotation (Placement(transformation(extent={{-60,-60},{-40,-40}},
            rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.Convection convection
      annotation (Placement(transformation(
          origin={10,-30},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Blocks.Sources.Constant thermalConductance(k=1)
      annotation (Placement(transformation(extent={{-30,-40},{-10,-20}},
            rotation=0)));
  equation
    connect(ambient1.flowPort, pump.flowPort_a)
      annotation (Line(points={{-60,0},{-40,0}}, color={255,0,0}));
    connect(pump.flowPort_b, pipe.flowPort_a)
      annotation (Line(points={{-20,0},{0,0}}, color={255,0,0}));
    connect(pipe.flowPort_b, ambient2.flowPort)
      annotation (Line(points={{20,0},{40,0}}, color={255,0,0}));
    connect(heatFlow.y, prescribedHeatFlow.Q_flow)  annotation (Line(points={
            {-39,-50},{-30,-50}}, color={0,0,255}));
    connect(convection.solid, prescribedHeatFlow.port)   annotation (Line(
          points={{10,-40},{10,-50},{-10,-50}}, color={191,0,0}));
    connect(convection.solid, heatCapacitor.port)   annotation (Line(points={
            {10,-40},{10,-50},{30,-50}}, color={191,0,0}));
    connect(pipe.heatPort, convection.fluid)   annotation (Line(points={{10,
            -10},{10,-20}}, color={191,0,0}));
    connect(thermalConductance.y, convection.Gc)
                                 annotation (Line(points={{-9,-30},{0,-30}},
          color={0,0,127}));
    connect(volumeFlow.y, pump.volumeFlow) annotation (Line(
        points={{-39,20},{-30,20},{-30,10}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (Documentation(info="<HTML>
<p>
1st test example: SimpleCooling
</p>
A prescribed heat source dissipates its heat through a thermal conductor to a coolant flow. The coolant flow is taken from an ambient and driven by a pump with prescribed mass flow.<br>
<b>Results</b>:<br>
<table>
<tr>
<td valign=\"top\"><b>output</b></td>
<td valign=\"top\"><b>explanation</b></td>
<td valign=\"top\"><b>formula</b></td>
<td valign=\"top\"><b>actual steady-state value</b></td>
</tr>
<tr>
<td valign=\"top\">dTSource</td>
<td valign=\"top\">Source over Ambient</td>
<td valign=\"top\">dtCoolant + dtToPipe</td>
<td valign=\"top\">20 K</td>
</tr>
<tr>
<td valign=\"top\">dTtoPipe</td>
<td valign=\"top\">Source over Coolant</td>
<td valign=\"top\">Losses / ThermalConductor.G</td>
<td valign=\"top\">10 K</td>
</tr>
<tr>
<td valign=\"top\">dTCoolant</td>
<td valign=\"top\">Coolant's temperature increase</td>
<td valign=\"top\">Losses * cp * massFlow</td>
<td valign=\"top\">10 K</td>
</tr>
</table>
</HTML>"),      experiment(StopTime=1.0, Interval=0.001));
  end SimpleCooling;

  model ParallelCooling "Example: cooling circuit with parallel branches"
    extends Modelica_Icons.Example;
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Cooling medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC")=293.15
      "Ambient temperature";
    output Modelica_SIunits.TemperatureDifference dTSource1=
      prescribedHeatFlow1.port.T-TAmb "Source1 over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe1=prescribedHeatFlow1.port.T-pipe1.heatPort.T
      "Source1 over Coolant1";
    output Modelica_SIunits.TemperatureDifference dTCoolant1=pipe1.dT
      "Coolant1's temperature increase";
    output Modelica_SIunits.TemperatureDifference dTSource2=
      prescribedHeatFlow2.port.T-TAmb "Source2 over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe2=prescribedHeatFlow2.port.T-pipe2.heatPort.T
      "Source2 over Coolant2";
    output Modelica_SIunits.TemperatureDifference dTCoolant2=pipe2.dT
      "Coolant2's temperature increase";
    output Modelica_SIunits.TemperatureDifference dTmixedCoolant=ambient2.T_port-ambient1.T_port
      "mixed Coolant's temperature increase";
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient1(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              -60,-10},{-80,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow pump(
      medium=medium,
      m=0,
      T0=TAmb,
      useVolumeFlowInput=true,
      constantVolumeFlow=1) annotation (Placement(transformation(extent={{-40,-10},
              {-20,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe1(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      V_flow(start=0),
      T0fixed=true) annotation (Placement(transformation(extent={{0,-20},{20,0}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe2(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      V_flow(start=0),
      T0fixed=true) annotation (Placement(transformation(extent={{0,20},{20,0}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.IsolatedPipe pipe3(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{40,-10},{60,
              10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient2(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              80,-10},{100,10}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor1(
                     C=0.1, T(start=TAmb, fixed=true))
      annotation (Placement(transformation(
          origin={40,-60},
          extent={{-10,10},{10,-10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow
      prescribedHeatFlow1
      annotation (Placement(transformation(
          origin={-20,-60},
          extent={{10,-10},{-10,10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.Convection convection1
      annotation (Placement(transformation(
          origin={10,-40},
          extent={{10,10},{-10,-10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor2(
                     C=0.1, T(start=TAmb, fixed=true))
      annotation (Placement(transformation(
          origin={38,60},
          extent={{10,-10},{-10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow
      prescribedHeatFlow2
      annotation (Placement(transformation(
          origin={-20,60},
          extent={{10,10},{-10,-10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.Convection convection2
      annotation (Placement(transformation(
          origin={10,40},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica_Blocks.Sources.Constant volumeFlow(k=1)
      annotation (Placement(transformation(extent={{-60,10},{-40,30}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant heatFlow1(k=5)
      annotation (Placement(transformation(extent={{-60,-70},{-40,-50}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant heatFlow2(k=10)
      annotation (Placement(transformation(extent={{-60,50},{-40,70}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant thermalConductance1(k=1)
      annotation (Placement(transformation(extent={{-30,-50},{-10,-30}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant thermalConductance2(k=1)
      annotation (Placement(transformation(extent={{-30,30},{-10,50}},
            rotation=0)));
  equation
    connect(ambient1.flowPort, pump.flowPort_a)
      annotation (Line(points={{-60,0},{-40,0}}, color={255,0,0}));
    connect(pump.flowPort_b, pipe1.flowPort_a)
      annotation (Line(points={{-20,0},{-10,0},{-10,-10},{0,-10}}, color={255,
            0,0}));
    connect(pump.flowPort_b, pipe2.flowPort_a)
      annotation (Line(points={{-20,0},{-10,0},{-10,10},{0,10}}, color={255,0,
            0}));
    connect(heatFlow2.y,prescribedHeatFlow2. Q_flow)
      annotation (Line(points={{-39,60},{-30,60}}, color={0,0,255}));
    connect(heatFlow1.y,prescribedHeatFlow1. Q_flow)
      annotation (Line(points={{-39,-60},{-30,-60}}, color={0,0,255}));
    connect(thermalConductance2.y, convection2.Gc)
      annotation (Line(points={{-9,40},{0,40}}, color={0,0,127}));
    connect(thermalConductance1.y, convection1.Gc)
                                  annotation (Line(points={{-9,-40},{0,-40}},
          color={0,0,127}));
    connect(pipe1.heatPort,convection1. fluid) annotation (Line(points={{10,-20},{
            10,-30}},                         color={191,0,0}));
    connect(convection2.fluid,pipe2. heatPort) annotation (Line(points={{10,
            30},{10,20}}, color={191,0,0}));
    connect(convection2.solid,prescribedHeatFlow2. port) annotation (Line(
          points={{10,50},{10,60},{-10,60}}, color={191,0,0}));
    connect(convection2.solid,heatCapacitor2. port) annotation (Line(points={{10,50},
            {10,60},{28,60}},         color={191,0,0}));
    connect(convection1.solid,prescribedHeatFlow1. port) annotation (Line(
          points={{10,-50},{10,-60},{-10,-60}}, color={191,0,0}));
    connect(convection1.solid,heatCapacitor1. port) annotation (Line(points={{10,-50},
            {10,-60},{30,-60}},          color={191,0,0}));
    connect(pipe2.flowPort_b,pipe3. flowPort_a) annotation (Line(points={{20,
            10},{30,10},{30,0},{40,0}}, color={255,0,0}));
    connect(pipe1.flowPort_b,pipe3. flowPort_a) annotation (Line(points={{20,
            -10},{30,-10},{30,0},{40,0}}, color={255,0,0}));
    connect(pipe3.flowPort_b,ambient2. flowPort)
      annotation (Line(points={{60,0},{80,0}}, color={255,0,0}));
    connect(volumeFlow.y, pump.volumeFlow) annotation (Line(
        points={{-39,20},{-30,20},{-30,10}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (Documentation(info="<HTML>
<p>
2nd test example: ParallelCooling
</p>
Two prescribed heat sources dissipate their heat through thermal conductors to coolant flows. The coolant flow is taken from an ambient and driven by a pump with prescribed mass flow, then split into two coolant flows connected to the two heat sources, and afterwards merged. Splitting of coolant flows is determined by pressure drop characteristic of the two pipes.<br>
<b>Results</b>:<br>
<table>
<tr>
<td valign=\"top\"><b>output</b></td>
<td valign=\"top\"><b>explanation</b></td>
<td valign=\"top\"><b>formula</b></td>
<td valign=\"top\"><b>actual steady-state value</b></td>
</tr>
<tr>
<td valign=\"top\">dTSource1</td>
<td valign=\"top\">Source1 over Ambient</td>
<td valign=\"top\">dTCoolant1 + dTtoPipe1</td>
<td valign=\"top\">15 K</td>
</tr>
<tr>
<td valign=\"top\">dTtoPipe1</td>
<td valign=\"top\">Source1 over Coolant1</td>
<td valign=\"top\">Losses1 / ThermalConductor1.G</td>
<td valign=\"top\"> 5 K</td>
</tr>
<tr>
<td valign=\"top\">dTCoolant1</td>
<td valign=\"top\">Coolant's temperature increase</td>
<td valign=\"top\">Losses * cp * totalMassFlow/2</td>
<td valign=\"top\">10 K</td>
</tr>
<tr>
<td valign=\"top\">dTSource2</td>
<td valign=\"top\">Source2 over Ambient</td>
<td valign=\"top\">dTCoolant2 + dTtoPipe2</td>
<td valign=\"top\">30 K</td>
</tr>
<tr>
<td valign=\"top\">dTtoPipe2</td>
<td valign=\"top\">Source2 over Coolant2</td>
<td valign=\"top\">Losses2 / ThermalConductor2.G</td>
<td valign=\"top\">10 K</td>
</tr>
<tr>
<td valign=\"top\">dTCoolant2</td>
<td valign=\"top\">Coolant's temperature increase</td>
<td valign=\"top\">Losses * cp * totalMassFlow/2</td>
<td valign=\"top\">20 K</td>
</tr>
<tr>
<td valign=\"top\">dTmixedCoolant</td>
<td valign=\"top\">mixed Coolant's temperature increase</td>
<td valign=\"top\">(dTCoolant1+dTCoolant2)/2</td>
<td valign=\"top\">15 K</td>
</tr>
</table>
</HTML>"),      experiment(StopTime=1.0, Interval=0.001));
  end ParallelCooling;

  model IndirectCooling "Example: indirect cooling circuit"
    extends Modelica_Icons.Example;
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium outerMedium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Outer medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium innerMedium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Inner medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC")=293.15
      "Ambient temperature";
    output Modelica_SIunits.TemperatureDifference dTSource=
      prescribedHeatFlow.port.T-TAmb "Source over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe=prescribedHeatFlow.port.T-pipe1.heatPort.T
      "Source over inner Coolant";
    output Modelica_SIunits.TemperatureDifference dTinnerCoolant=pipe1.dT
      "inner Coolant's temperature increase";
    output Modelica_SIunits.TemperatureDifference dTCooler=innerPipe.heatPort.T-outerPipe.heatPort.T
      "Cooler's temperature increase between inner and outer pipes";
    output Modelica_SIunits.TemperatureDifference dTouterCoolant=outerPipe.dT
      "outer Coolant's temperature increase";
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient1(
      constantAmbientTemperature=TAmb,
      medium=outerMedium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              -60,60},{-80,80}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow outerPump(
      medium=outerMedium,
      m=0,
      T0=TAmb,
      useVolumeFlowInput=true,
      constantVolumeFlow=1) annotation (Placement(transformation(extent={{-40,
              60},{-20,80}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient2(
      constantAmbientTemperature=TAmb,
      medium=outerMedium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              40,60},{60,80}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor
      thermalConductor(                                                        G=1)
      annotation (Placement(transformation(
          origin={10,-70},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor(
                     C=0.05, T(start=TAmb, fixed=true))
      annotation (Placement(transformation(
          origin={40,-90},
          extent={{-10,10},{10,-10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow
      prescribedHeatFlow
      annotation (Placement(transformation(
          origin={-20,-90},
          extent={{10,-10},{-10,10}},
          rotation=180)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe1(
      medium=innerMedium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=1,
      V_flowNominal=2,
      h_g=0,
      T0fixed=true,
      dpLaminar=1000,
      dpNominal=2000) annotation (Placement(transformation(extent={{20,-50},{0,
              -30}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.AbsolutePressure absolutePressure(p=10000,
        medium=innerMedium) annotation (Placement(transformation(extent={{40,-40},
              {60,-20}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow innerPump(
      medium=innerMedium,
      m=0,
      T0=TAmb,
      useVolumeFlowInput=true,
      constantVolumeFlow=1) annotation (Placement(transformation(
          origin={-20,-30},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Blocks.Sources.Constant heatFlow(k=10)
      annotation (Placement(transformation(extent={{-60,-100},{-40,-80}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant outerVolumeFlow(k=1)
      annotation (Placement(transformation(extent={{-60,80},{-40,100}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant innerVolumeFlow(k=1)
      annotation (Placement(transformation(extent={{-60,-40},{-40,-20}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant outerGc(k=2)
      annotation (Placement(transformation(extent={{-40,30},{-20,50}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant innerGc(k=2)
      annotation (Placement(transformation(extent={{-40,20},{-20,0}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe outerPipe(
      medium=outerMedium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{0,60},{20,80}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe innerPipe(
      medium=innerMedium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{0,-10},{20,-30}},
            rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.Convection innerConvection
      annotation (Placement(transformation(
          origin={10,10},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.Convection outerConvection
      annotation (Placement(transformation(
          origin={10,40},
          extent={{10,10},{-10,-10}},
          rotation=270)));
  equation
    connect(ambient1.flowPort, outerPump.flowPort_a)
      annotation (Line(points={{-60,70},{-40,70}}, color={255,0,0}));
    connect(prescribedHeatFlow.port, thermalConductor.port_a)
      annotation (Line(points={{-10,-90},{10,-90},{10,-80}}, color={191,0,0}));
    connect(heatCapacitor.port, thermalConductor.port_a)
      annotation (Line(points={{30,-90},{10,-90},{10,-80}}, color={191,0,0}));
    connect(pipe1.heatPort, thermalConductor.port_b)
      annotation (Line(points={{10,-50},{10,-60}}, color={191,0,0}));
    connect(pipe1.flowPort_b, innerPump.flowPort_a)
      annotation (Line(points={{0,-40},{-20,-40}}, color={255,0,0}));
    connect(absolutePressure.flowPort, pipe1.flowPort_a)
      annotation (Line(points={{40,-30},{40,-40},{20,-40}}, color={255,0,0}));
    connect(heatFlow.y, prescribedHeatFlow.Q_flow)
      annotation (Line(points={{-39,-90},{-30,-90}}, color={0,0,255}));
    connect(innerPump.flowPort_b, innerPipe.flowPort_a)
      annotation (Line(points={{-20,-20},{0,-20}}, color={255,0,0}));
    connect(innerPipe.flowPort_b, absolutePressure.flowPort)  annotation (Line(
          points={{20,-20},{40,-20},{40,-30}}, color={255,0,0}));
    connect(outerPump.flowPort_b, outerPipe.flowPort_a)
      annotation (Line(points={{-20,70},{0,70}}, color={255,0,0}));
    connect(outerPipe.flowPort_b,ambient2. flowPort)
      annotation (Line(points={{20,70},{40,70}}, color={255,0,0}));
    connect(outerPipe.heatPort, outerConvection.fluid)
      annotation (Line(points={{10,60},{10,55},{10,50}},         color={191,0,
            0}));
    connect(outerConvection.solid, innerConvection.solid)
      annotation (Line(points={{10,30},{10,20},{10,20}},
                     color={191,0,0}));
    connect(innerConvection.fluid, innerPipe.heatPort)
      annotation (Line(points={{10,0},{10,-5},{10,-10}},         color={191,0,
            0}));
    connect(innerGc.y, innerConvection.Gc)
      annotation (Line(points={{-19,10},{-9.5,10},{-9.5,10},{0,10}}, color={0,
            0,127}));
    connect(outerGc.y, outerConvection.Gc)
      annotation (Line(points={{-19,40},{0,40}},  color={0,0,127}));
    connect(outerVolumeFlow.y, outerPump.volumeFlow) annotation (Line(
        points={{-39,90},{-30,90},{-30,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(innerVolumeFlow.y, innerPump.volumeFlow) annotation (Line(
        points={{-39,-30},{-30,-30}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (Documentation(info="<HTML>
<p>
3rd test example: IndirectCooling
</p>
A prescribed heat sources dissipates its heat through a thermal conductor to the inner coolant cycle. It is necessary to define the pressure level of the inner coolant cycle. The inner coolant cycle is coupled to the outer coolant flow through a thermal conductor.<br>
Inner coolant's temperature rise near the source is the same as temperature drop near the cooler.<br>
<b>Results</b>:<br>
<table>
<tr>
<td valign=\"top\"><b>output</b></td>
<td valign=\"top\"><b>explanation</b></td>
<td valign=\"top\"><b>formula</b></td>
<td valign=\"top\"><b>actual steady-state value</b></td>
</tr>
<tr>
<td valign=\"top\">dTSource</td>
<td valign=\"top\">Source over Ambient</td>
<td valign=\"top\">dtouterCoolant + dtCooler + dTinnerCoolant + dtToPipe</td>
<td valign=\"top\">40 K</td>
</tr>
<tr>
<td valign=\"top\">dTtoPipe</td>
<td valign=\"top\">Source over inner Coolant</td>
<td valign=\"top\">Losses / ThermalConductor.G</td>
<td valign=\"top\">10 K</td>
</tr>
<tr>
<td valign=\"top\">dTinnerColant</td>
<td valign=\"top\">inner Coolant's temperature increase</td>
<td valign=\"top\">Losses * cp * innerMassFlow</td>
<td valign=\"top\">10 K</td>
</tr>
<tr>
<td valign=\"top\">dTCooler</td>
<td valign=\"top\">Cooler's temperature rise between inner and outer pipes</td>
<td valign=\"top\">Losses * (innerGc + outerGc)</td>
<td valign=\"top\">10 K</td>
</tr>
<tr>
<td valign=\"top\">dTouterColant</td>
<td valign=\"top\">outer Coolant's temperature increase</td>
<td valign=\"top\">Losses * cp * outerMassFlow</td>
<td valign=\"top\">10 K</td>
</tr>
</table>
</HTML>"),      experiment(StopTime=1.5, Interval=0.001));
  end IndirectCooling;

  model PumpAndValve "Example: cooling circuit with pump and valve"
    extends Modelica_Icons.Example;
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Cooling medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC")=293.15
      "Ambient temperature";
    output Modelica_SIunits.TemperatureDifference dTSource=
      prescribedHeatFlow.port.T-TAmb "Source over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe=prescribedHeatFlow.port.T-pipe.heatPort.T
      "Source over Coolant";
    output Modelica_SIunits.TemperatureDifference dTCoolant=pipe.dT
      "Coolant's temperature increase";
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient1(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              -70,-10},{-90,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.IdealPump idealPump(
      medium=medium,
      m=0,
      T0=TAmb,
      V_flow0=2,
      V_flow(start=0),
      wNominal(displayUnit="rad/s") = 1,
      dp0(displayUnit="Pa") = 2) annotation (Placement(transformation(extent={{
              -60,10},{-40,-10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.Valve valve(
      medium=medium,
      m=0,
      T0=TAmb,
      LinearCharacteristic=false,
      y1=1,
      Kv1=1,
      kv0=0.01,
      dp0(displayUnit="Pa") = 1,
      rho0=10,
      frictionLoss=0) annotation (Placement(transformation(extent={{-30,-10},{-10,
              10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe(
      medium=medium,
      T0=TAmb,
      m=0.1,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{0,-10},{20,10}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient2(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              40,-10},{60,10}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor(
                     C=0.1, T(start=TAmb, fixed=true))
      annotation (Placement(transformation(
          origin={40,-50},
          extent={{-10,10},{10,-10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow
      prescribedHeatFlow
      annotation (Placement(transformation(extent={{-30,-40},{-10,-60}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant heatFlow(k=10)
      annotation (Placement(transformation(extent={{-60,-60},{-40,-40}},
            rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.Convection convection
      annotation (Placement(transformation(
          origin={10,-30},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Blocks.Sources.Constant thermalConductance(k=1)
      annotation (Placement(transformation(extent={{-30,-40},{-10,-20}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Sources.Speed speed(exact=true, useSupport=
          false) annotation (Placement(transformation(
          origin={-50,30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Blocks.Sources.Ramp speedRamp(
      height=0.5,
      offset=0.5,
      duration=0.1,
      startTime=0.4) annotation (Placement(transformation(extent={{-80,40},{
              -60,60}}, rotation=0)));
    Modelica_Blocks.Sources.Ramp valveRamp(
      height=0.5,
      offset=0.5,
      duration=0.1,
      startTime=0.9) annotation (Placement(transformation(extent={{12,40},{-8,
              60}}, rotation=0)));
  equation
    connect(pipe.flowPort_b, ambient2.flowPort)
      annotation (Line(points={{20,0},{40,0}}, color={255,0,0}));
    connect(heatFlow.y, prescribedHeatFlow.Q_flow)  annotation (Line(points={
            {-39,-50},{-30,-50}}, color={0,0,255}));
    connect(convection.solid, prescribedHeatFlow.port)   annotation (Line(
          points={{10,-40},{10,-50},{-10,-50}}, color={191,0,0}));
    connect(convection.solid, heatCapacitor.port)   annotation (Line(points={
            {10,-40},{10,-50},{30,-50}}, color={191,0,0}));
    connect(pipe.heatPort, convection.fluid)   annotation (Line(points={{10,
            -10},{10,-20}}, color={191,0,0}));
    connect(thermalConductance.y, convection.Gc)
                                 annotation (Line(points={{-9,-30},{0,-30}},
          color={0,0,127}));
    connect(ambient1.flowPort, idealPump.flowPort_a)
      annotation (Line(points={{-70,0},{-60,0}}, color={255,0,0}));
    connect(idealPump.flowPort_b, valve.flowPort_a)
      annotation (Line(points={{-40,0},{-30,0}}, color={255,0,0}));
    connect(valve.flowPort_b, pipe.flowPort_a)
      annotation (Line(points={{-10,0},{0,0}}, color={255,0,0}));
    connect(speedRamp.y, speed.w_ref)
                                   annotation (Line(points={{-59,50},{-50,50},
            {-50,42}}, color={0,0,127}));
    connect(valveRamp.y, valve.y)
                               annotation (Line(points={{-9,50},{-20,50},{-20,
            9}}, color={0,0,127}));
    connect(speed.flange, idealPump.flange_a) annotation (Line(
        points={{-50,20},{-50,10}},
        color={0,0,0},
        smooth=Smooth.None));
  annotation (Documentation(info="<HTML>
<p>
4th test example: PumpAndValve
</p>
The pump is running with half speed for 0.4 s,
afterwards with full speed (using a ramp of 0.1 s).<br>
The valve is half open for 0.9 s, afterwards full open (using a ramp of 0.1 s).<br>
You may try to:
<ul>
<li>drive the pump with variable speed and let the valve full open
    to regulate the volume flow rate of coolant</li>
<li>drive the pump with constant speed and throttle the valve
    to regulate the volume flow rate of coolant</li>
</ul>
</HTML>"),      experiment(StopTime=2.0, Interval=0.001));
  end PumpAndValve;

  model PumpDropOut "Example: cooling circuit with drop out of pump"
    extends Modelica_Icons.Example;
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Cooling medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC")=293.15
      "Ambient temperature";
    output Modelica_SIunits.TemperatureDifference dTSource=
      prescribedHeatFlow.port.T-TAmb "Source over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe=prescribedHeatFlow.port.T-pipe.heatPort.T
      "Source over Coolant";
    output Modelica_SIunits.TemperatureDifference dTCoolant=pipe.dT
      "Coolant's temperature increase";
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient1(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              -60,-10},{-80,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow pump(
      medium=medium,
      m=0,
      T0=TAmb,
      useVolumeFlowInput=true,
      constantVolumeFlow=1) annotation (Placement(transformation(extent={{-40,-10},
              {-20,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe(
      medium=medium,
      T0=TAmb,
      m=0.1,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{0,-10},{20,10}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient2(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              40,-10},{60,10}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor(
                     C=0.1, T(start=TAmb, fixed=true))
      annotation (Placement(transformation(
          origin={40,-50},
          extent={{-10,10},{10,-10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow
      prescribedHeatFlow
      annotation (Placement(transformation(extent={{-30,-40},{-10,-60}},
            rotation=0)));
    Utilities.DoubleRamp volumeFlow
      annotation (Placement(transformation(extent={{-60,10},{-40,30}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant heatFlow(k=10)
      annotation (Placement(transformation(extent={{-60,-60},{-40,-40}},
            rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.Convection convection
      annotation (Placement(transformation(
          origin={10,-30},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Blocks.Sources.Constant thermalConductance(k=1)
      annotation (Placement(transformation(extent={{-30,-40},{-10,-20}},
            rotation=0)));
  equation
    connect(ambient1.flowPort, pump.flowPort_a)
      annotation (Line(points={{-60,0},{-40,0}}, color={255,0,0}));
    connect(pump.flowPort_b, pipe.flowPort_a)
      annotation (Line(points={{-20,0},{0,0}}, color={255,0,0}));
    connect(pipe.flowPort_b, ambient2.flowPort)
      annotation (Line(points={{20,0},{40,0}}, color={255,0,0}));
    connect(heatFlow.y, prescribedHeatFlow.Q_flow)  annotation (Line(points={
            {-39,-50},{-30,-50}}, color={0,0,255}));
    connect(convection.solid, prescribedHeatFlow.port)   annotation (Line(
          points={{10,-40},{10,-50},{-10,-50}}, color={191,0,0}));
    connect(convection.solid, heatCapacitor.port)   annotation (Line(points={
            {10,-40},{10,-50},{30,-50}}, color={191,0,0}));
    connect(pipe.heatPort, convection.fluid)   annotation (Line(points={{10,
            -10},{10,-20}}, color={191,0,0}));
    connect(thermalConductance.y, convection.Gc)
                                 annotation (Line(points={{-9,-30},{0,-30}},
          color={0,0,127}));
    connect(volumeFlow.y, pump.volumeFlow) annotation (Line(
        points={{-39,20},{-30,20},{-30,10}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (Documentation(info="<HTML>
<p>
5th test example: PumpDropOut
</p>
Same as 1st test example, but with a drop out of the pump:<br>
The pump is running for 0.2 s, then shut down (using a ramp of 0.2 s) for 0.2 s,
then started again (using a ramp of 0.2 s).
</HTML>"),      experiment(StopTime=2.0, Interval=0.001));
  end PumpDropOut;

  model ParallelPumpDropOut
    "Example: cooling circuit with parallel branches and drop out of pump"
    extends Modelica_Icons.Example;
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Cooling medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC")=293.15
      "Ambient temperature";
    output Modelica_SIunits.TemperatureDifference dTSource1=
      prescribedHeatFlow1.port.T-TAmb "Source1 over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe1=prescribedHeatFlow1.port.T-pipe1.heatPort.T
      "Source1 over Coolant1";
    output Modelica_SIunits.TemperatureDifference dTCoolant1=pipe1.dT
      "Coolant1's temperature increase";
    output Modelica_SIunits.TemperatureDifference dTSource2=
      prescribedHeatFlow2.port.T-TAmb "Source2 over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe2=prescribedHeatFlow2.port.T-pipe2.heatPort.T
      "Source2 over Coolant2";
    output Modelica_SIunits.TemperatureDifference dTCoolant2=pipe2.dT
      "Coolant2's temperature increase";
    output Modelica_SIunits.TemperatureDifference dTmixedCoolant=ambient2.T_port-ambient1.T_port
      "mixed Coolant's temperature increase";
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient1(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              -60,-10},{-80,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow pump(
      medium=medium,
      m=0,
      T0=TAmb,
      useVolumeFlowInput=true,
      constantVolumeFlow=1) annotation (Placement(transformation(extent={{-40,-10},
              {-20,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe1(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      V_flow(start=0),
      T0fixed=true) annotation (Placement(transformation(extent={{0,-20},{20,0}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe2(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      V_flow(start=0),
      T0fixed=true) annotation (Placement(transformation(extent={{0,20},{20,0}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.IsolatedPipe pipe3(
      medium=medium,
      T0=TAmb,
      m=0.1,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{40,-10},{60,
              10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient2(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              80,-10},{100,10}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor1(
                     C=0.1, T(start=TAmb, fixed=true))
      annotation (Placement(transformation(
          origin={40,-60},
          extent={{-10,10},{10,-10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow
      prescribedHeatFlow1
      annotation (Placement(transformation(
          origin={-20,-60},
          extent={{10,-10},{-10,10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.Convection Convection1
      annotation (Placement(transformation(
          origin={10,-40},
          extent={{10,10},{-10,-10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor2(
                     C=0.1, T(start=TAmb, fixed=true))
      annotation (Placement(transformation(
          origin={38,60},
          extent={{10,-10},{-10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow
      prescribedHeatFlow2
      annotation (Placement(transformation(
          origin={-20,60},
          extent={{10,10},{-10,-10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.Convection convection2
      annotation (Placement(transformation(
          origin={10,40},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Utilities.DoubleRamp volumeFlow
      annotation (Placement(transformation(extent={{-60,10},{-40,30}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant heatFlow1(k=5)
      annotation (Placement(transformation(extent={{-60,-70},{-40,-50}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant heatFlow2(k=10)
      annotation (Placement(transformation(extent={{-60,50},{-40,70}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant thermalConductance1(k=1)
      annotation (Placement(transformation(extent={{-30,-50},{-10,-30}},
            rotation=0)));
    Modelica_Blocks.Sources.Constant thermalConductance2(k=1)
      annotation (Placement(transformation(extent={{-30,30},{-10,50}},
            rotation=0)));
  equation
    connect(ambient1.flowPort, pump.flowPort_a)
      annotation (Line(points={{-60,0},{-60,0},{-40,0}},
                                                 color={255,0,0}));
    connect(pump.flowPort_b, pipe1.flowPort_a)
      annotation (Line(points={{-20,0},{-10,0},{-10,-10},{0,-10}}, color={255,
            0,0}));
    connect(pump.flowPort_b, pipe2.flowPort_a)
      annotation (Line(points={{-20,0},{-10,0},{-10,10},{0,10}}, color={255,0,
            0}));
    connect(heatFlow2.y,prescribedHeatFlow2. Q_flow)
      annotation (Line(points={{-39,60},{-30,60}}, color={0,0,255}));
    connect(heatFlow1.y,prescribedHeatFlow1. Q_flow)
      annotation (Line(points={{-39,-60},{-30,-60}}, color={0,0,255}));
    connect(thermalConductance2.y, convection2.Gc)
      annotation (Line(points={{-9,40},{0,40}}, color={0,0,127}));
    connect(thermalConductance1.y, Convection1.Gc)
                                  annotation (Line(points={{-9,-40},{0,-40}},
          color={0,0,127}));
    connect(pipe1.heatPort, Convection1.fluid) annotation (Line(points={{10,-20},{
            10,-25},{10,-30}},                color={191,0,0}));
    connect(convection2.fluid,pipe2. heatPort) annotation (Line(points={{10,
            30},{10,20}}, color={191,0,0}));
    connect(convection2.solid,prescribedHeatFlow2. port) annotation (Line(
          points={{10,50},{10,60},{-10,60}}, color={191,0,0}));
    connect(convection2.solid,heatCapacitor2. port) annotation (Line(points={{10,50},
            {10,60},{28,60}},         color={191,0,0}));
    connect(Convection1.solid,prescribedHeatFlow1. port) annotation (Line(
          points={{10,-50},{10,-60},{-10,-60}}, color={191,0,0}));
    connect(Convection1.solid,heatCapacitor1. port) annotation (Line(points={{10,-50},
            {10,-60},{30,-60}},          color={191,0,0}));
    connect(pipe2.flowPort_b,pipe3. flowPort_a) annotation (Line(points={{20,
            10},{30,10},{30,0},{40,0}}, color={255,0,0}));
    connect(pipe1.flowPort_b,pipe3. flowPort_a) annotation (Line(points={{20,
            -10},{30,-10},{30,0},{40,0}}, color={255,0,0}));
    connect(pipe3.flowPort_b,ambient2. flowPort)
      annotation (Line(points={{60,0},{80,0}}, color={255,0,0}));
    connect(volumeFlow.y, pump.volumeFlow) annotation (Line(
        points={{-39,20},{-30,20},{-30,10}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (Documentation(info="<HTML>
<p>
6th test example: ParallelPumpDropOut
</p>
Same as 2nd test example, but with a drop out of the pump:<br>
The pump is running for 0.2 s, then shut down (using a ramp of 0.2 s) for 0.2 s,
then started again (using a ramp of 0.2 s).
</HTML>"),      experiment(StopTime=2.0, Interval=0.001));
  end ParallelPumpDropOut;

  model OneMass "Example: cooling of one hot mass"
    extends Modelica_Icons.Example;
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Cooling medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC")=293.15
      "Ambient temperature";
    parameter Modelica_SIunits.Temperature TMass(displayUnit="degC")=313.15
      "Inital temperature of mass";
    output Modelica_SIunits.TemperatureDifference dTMass=
      heatCapacitor.port.T-TAmb "Mass over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe=heatCapacitor.port.T-pipe.heatPort.T
      "Mass over Coolant";
    output Modelica_SIunits.TemperatureDifference dTCoolant=pipe.dT
      "Coolant's temperature increase";
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient1(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              -60,-10},{-80,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow pump(
      medium=medium,
      m=0,
      T0=TAmb,
      useVolumeFlowInput=true,
      constantVolumeFlow=1) annotation (Placement(transformation(extent={{-40,-10},
              {-20,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{0,-10},{20,10}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient2(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              40,-10},{60,10}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor(
      C=0.1, T(start=TMass, fixed=true))
      annotation (Placement(transformation(
          origin={10,-60},
          extent={{10,-10},{-10,10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor
      thermalConductor(                                                        G=1)
      annotation (Placement(transformation(
          origin={10,-30},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Utilities.DoubleRamp volumeFlow(
      offset=0,
      height_1=1,
      height_2=-2) annotation (Placement(transformation(extent={{-60,10},{-40,
              30}}, rotation=0)));
  equation
    connect(ambient1.flowPort, pump.flowPort_a)
      annotation (Line(points={{-60,0},{-40,0}}, color={255,0,0}));
    connect(pump.flowPort_b, pipe.flowPort_a)
      annotation (Line(points={{-20,0},{0,0}}, color={255,0,0}));
    connect(pipe.flowPort_b, ambient2.flowPort)
      annotation (Line(points={{20,0},{40,0}}, color={255,0,0}));
    connect(thermalConductor.port_a, heatCapacitor.port)   annotation (Line(
          points={{10,-40},{10,-45},{10,-50}},          color={191,0,0}));
    connect(pipe.heatPort, thermalConductor.port_b)
      annotation (Line(points={{10,-10},{10,-20}}, color={191,0,0}));
    connect(volumeFlow.y, pump.volumeFlow) annotation (Line(
        points={{-39,20},{-30,20},{-30,10}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (Documentation(info="<HTML>
<p>
7th test example: OneMass
</p>
A thermal capacity is coupled with a coolant flow.
Different inital temperatures of thermal capacity and pipe's coolant get ambient's temperature,
the time behaviour depending on coolant flow.
</HTML>"),      experiment(StopTime=1.0, Interval=0.001));
  end OneMass;

  model TwoMass "Example: cooling of two hot masses"
    extends Modelica_Icons.Example;
    parameter Modelica_Thermal_FluidHeatFlow.Media.Medium medium=
        Modelica_Thermal_FluidHeatFlow.Media.Medium() "Cooling medium"
      annotation (choicesAllMatching=true);
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC")=293.15
      "Ambient temperature";
    parameter Modelica_SIunits.Temperature TMass1(displayUnit="degC")=313.15
      "Inital temperature of mass1";
    parameter Modelica_SIunits.Temperature TMass2(displayUnit="degC")=333.15
      "Inital temperature of mass2";
    output Modelica_SIunits.TemperatureDifference dTMass1=
      heatCapacitor1.port.T-TAmb "Mass1 over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe1=heatCapacitor1.port.T-pipe1.heatPort.T
      "Mass1 over Coolant1";
    output Modelica_SIunits.TemperatureDifference dTCoolant1=pipe1.dT
      "Coolant1's temperature increase";
    output Modelica_SIunits.TemperatureDifference dTMass2=
      heatCapacitor2.port.T-TAmb "Mass2 over Ambient";
    output Modelica_SIunits.TemperatureDifference dTtoPipe2=heatCapacitor2.port.T-pipe2.heatPort.T
      "Mass2 over Coolant2";
    output Modelica_SIunits.TemperatureDifference dTCoolant2=pipe2.dT
      "Coolant2's temperature increase";
    output Modelica_SIunits.TemperatureDifference dTmixedCoolant=ambient2.T_port-ambient1.T_port
      "mixed Coolant's temperature increase";
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient1(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              -60,-10},{-80,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow pump(
      medium=medium,
      m=0,
      T0=TAmb,
      useVolumeFlowInput=true,
      constantVolumeFlow=1) annotation (Placement(transformation(extent={{-40,-10},
              {-20,10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe1(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flow(start=0),
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{0,-20},{20,0}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe pipe2(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flow(start=0),
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{0,20},{20,0}},
            rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Components.IsolatedPipe pipe3(
      medium=medium,
      m=0.1,
      T0=TAmb,
      V_flowLaminar=0.1,
      dpLaminar(displayUnit="Pa") = 0.1,
      V_flowNominal=1,
      dpNominal(displayUnit="Pa") = 1,
      h_g=0,
      T0fixed=true) annotation (Placement(transformation(extent={{40,-10},{60,
              10}}, rotation=0)));
    Modelica_Thermal_FluidHeatFlow.Sources.Ambient ambient2(
      constantAmbientTemperature=TAmb,
      medium=medium,
      constantAmbientPressure=0) annotation (Placement(transformation(extent={{
              80,-10},{100,10}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor1(
      C=0.1, T(start=TMass1, fixed=true))
      annotation (Placement(transformation(
          origin={10,-70},
          extent={{10,-10},{-10,10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor
      thermalConductor1(                                                        G=1)
      annotation (Placement(transformation(
          origin={10,-40},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor2(
      C=0.1, T(start=TMass2, fixed=true))
      annotation (Placement(transformation(
          origin={10,70},
          extent={{10,10},{-10,-10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor
      thermalConductor2(                                                        G=1)
      annotation (Placement(transformation(
          origin={10,40},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Utilities.DoubleRamp volumeFlow(
      offset=0,
      height_1=1,
      height_2=-2) annotation (Placement(transformation(extent={{-60,10},{-40,
              30}}, rotation=0)));
  equation
    connect(ambient1.flowPort, pump.flowPort_a)
      annotation (Line(points={{-60,0},{-40,0}}, color={255,0,0}));
    connect(pump.flowPort_b, pipe1.flowPort_a)
      annotation (Line(points={{-20,0},{-10,0},{-10,-10},{0,-10}}, color={255,
            0,0}));
    connect(pump.flowPort_b, pipe2.flowPort_a)
      annotation (Line(points={{-20,0},{-10,0},{-10,10},{0,10}}, color={255,0,
            0}));
    connect(pipe2.flowPort_b,pipe3. flowPort_a) annotation (Line(points={{20,
            10},{30,10},{30,0},{40,0}}, color={255,0,0}));
    connect(pipe1.flowPort_b,pipe3. flowPort_a) annotation (Line(points={{20,
            -10},{30,-10},{30,0},{40,0}}, color={255,0,0}));
    connect(pipe3.flowPort_b,ambient2. flowPort)
      annotation (Line(points={{60,0},{80,0}}, color={255,0,0}));
    connect(heatCapacitor2.port,thermalConductor2. port_a) annotation (Line(
          points={{10,60},{10,55},{10,50}},         color={191,0,0}));
    connect(thermalConductor2.port_b,pipe2. heatPort)
      annotation (Line(points={{10,30},{10,20}}, color={191,0,0}));
    connect(pipe1.heatPort,thermalConductor1. port_b) annotation (Line(points=
           {{10,-20},{10,-30}}, color={191,0,0}));
    connect(thermalConductor1.port_a, heatCapacitor1.port) annotation (Line(
          points={{10,-50},{10,-55},{10,-60}},          color={191,0,0}));
    connect(volumeFlow.y, pump.volumeFlow) annotation (Line(
        points={{-39,20},{-30,20},{-30,10}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (Documentation(info="<HTML>
<p>
8th test example: TwoMass
</p>
Two thermal capacities are coupled with two parallel coolant flow.
Different inital temperatures of thermal capacities and pipe's coolants get ambient's temperature,
the time behaviour depending on coolant flow.
</HTML>"),      experiment(StopTime=1.0, Interval=0.001));
  end TwoMass;

  package Utilities "Utility models for examples"
    extends Modelica_Icons.UtilitiesPackage;

    model DoubleRamp "Ramp going up and down"
      extends Modelica_Blocks.Interfaces.SO;
      parameter Real offset=1 "Offset of ramps";
      parameter Modelica_SIunits.Time startTime=0.2 "StartTime of 1st ramp";
      parameter Modelica_SIunits.Time interval=0.2
        "Interval between end of 1st and beginning of 2nd ramp";
      parameter Real height_1=-1 "Height of ramp"
        annotation(Dialog(group="Ramp 1"));
      parameter Modelica_SIunits.Time duration_1(min=Modelica_Constants.small)=0.2
        "Duration of ramp"
        annotation(Dialog(group="Ramp 1"));
      parameter Real height_2=1 "Height of ramp"
        annotation(Dialog(group="Ramp 2"));
      parameter Modelica_SIunits.Time duration_2(min=Modelica_Constants.small)=0.2
        "Duration of ramp"
        annotation(Dialog(group="Ramp 2"));

      Modelica_Blocks.Math.Add add  annotation (Placement(transformation(
              extent={{10,-10},{30,10}}, rotation=0)));
      Modelica_Blocks.Sources.Ramp ramp1(
        final height=height_1,
        final duration=duration_1,
        final startTime=startTime,
        final offset=offset)
                       annotation (Placement(transformation(extent={{-30,10},
                {-10,30}}, rotation=0)));
      Modelica_Blocks.Sources.Ramp ramp2(
        final height=height_2,
        final duration=duration_2,
        final startTime=startTime + duration_1 + interval,
        final offset=0)
        annotation (Placement(transformation(extent={{-30,-30},{-10,-10}},
              rotation=0)));
    equation
      connect(ramp1.y, add.u1)  annotation (Line(points={{-9,20},{0,20},{0,6},
              {8,6}}, color={0,0,127}));
      connect(ramp2.y, add.u2)  annotation (Line(points={{-9,-20},{0,-20},{0,
              -6},{8,-6}}, color={0,0,127}));
      connect(add.y, y)  annotation (Line(points={{31,0},{110,0}}, color={0,0,
              127}));
      annotation (
        Documentation(info="<HTML>
Block generating the sum of two ramps.
</HTML>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-60},{-50,-60},{-30,60},{10,60},{30,-20},{70,-20}},
              color={0,0,0})}));
    end DoubleRamp;
    annotation (Documentation(info="<html>
This package contains utility components used for the test examples.<br>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting &amp; Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
</p>
  <p>
  Dr. Christian Kral<br>
  <a href=\"http://www.ait.ac.at/\">Austrian Institute of Technology, AIT</a><br>
  Giefinggasse 2<br>
  A-1210 Vienna, Austria
</p>
  </dd>
</dl>
<p>
Copyright &copy; 1998-2013, Modelica Association, Anton Haumer and Austrian Institute of Technology, AIT.
</p>

<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</HTML>",
        revisions="<HTML>
  <ul>
  <li> v1.41 Beta 2005/06/17 Anton Haumer<br>
       first used</li>
  </ul>
</HTML>"));
  end Utilities;
annotation (Documentation(info="<HTML>
<p>This package contains test examples:</p>

<ol>
<li>SimpleCooling: heat is dissipated through a media flow</li>
<li>ParallelCooling: two heat sources dissipate through merged media flows</li>
<li>IndirectCooling: heat is dissipated through two cooling cycles</li>
<li>PumpAndValve: demonstrates usage of an IdealPump and a Valve</li>
<li>PumpDropOut: demonstrates shutdown and restart of a pump</li>
<li>ParallelPumpDropOut: demonstrates shutdown and restart of a pump in a parallel circuit</li>
<li>OneMass: cooling of a mass (thermal capacity) by a coolant flow</li>
<li>TwoMass: cooling of two masses (thermal capacities) by two parallel coolant flows</li>
</ol>

</HTML>",
        revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.31 Beta 2005/06/04 Anton Haumer<br>
       <i>new example: PumpAndValve</i><br>
       <i>new example: PumpDropOut</i></li>
  <li> v1.42 Beta 2005/06/18 Anton Haumer<br>
       <i>new test example: ParallelPumpDropOut</i></li>
  <li> v1.43 Beta 2005/06/20 Anton Haumer<br>
       Test of mixing / semiLinear<br>
       <i>new test example: OneMass</i><br>
       <i>new test example: TwoMass</i></li>
  </ul>
</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Thermal_FluidHeatFlow_Examples;
