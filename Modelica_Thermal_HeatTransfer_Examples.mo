within ;
encapsulated package Modelica_Thermal_HeatTransfer_Examples
  "Example models to demonstrate the usage of package Modelica.Thermal.HeatTransfer"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Thermal_HeatTransfer;
  import Modelica_Electrical_Analog;
  import Modelica_Blocks;
  extends Modelica_Icons.ExamplesPackage;

  model TwoMasses "Simple conduction demo"
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Temperature T_final_K(fixed=false)
      "Projected final temperature";
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor mass1(C=15, T(start=
            373.15, fixed=true)) annotation (Placement(transformation(extent={{
              -100,20},{-40,80}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor mass2(C=15, T(start=
            273.15, fixed=true)) annotation (Placement(transformation(extent={{
              40,20},{100,80}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor conduction(G=10)
      annotation (Placement(transformation(extent={{-30,-20},{30,40}}, rotation=
             0)));
    Modelica_Thermal_HeatTransfer.Celsius.TemperatureSensor Tsensor1
      annotation (Placement(transformation(extent={{-60,-80},{-20,-40}},
            rotation=0)));
    Modelica_Thermal_HeatTransfer.Celsius.TemperatureSensor Tsensor2
      annotation (Placement(transformation(extent={{60,-80},{20,-40}}, rotation=
             0)));
  equation
    connect(mass1.port, conduction.port_a) annotation (Line(points={{-70,20},
            {-70,10},{-30,10}}, color={191,0,0}));
    connect(conduction.port_b, mass2.port) annotation (Line(points={{30,10},{
            70,10},{70,20}}, color={191,0,0}));
    connect(mass1.port, Tsensor1.port) annotation (Line(points={{-70,20},{-70,
            -60},{-60,-60}}, color={191,0,0}));
    connect(mass2.port, Tsensor2.port) annotation (Line(points={{70,20},{70,
            -60},{60,-60}}, color={191,0,0}));
  initial equation
    T_final_K = (mass1.T*mass1.C + mass2.T*mass2.C)/(mass1.C + mass2.C);
    annotation (Documentation(info="<HTML>
<p>
This example demonstrates the thermal response of two masses connected by
a conducting element. The two masses have the same heat capacity but different
initial temperatures (T1=100 [degC], T2= 0 [degC]). The mass with the higher
temperature will cool off while the mass with the lower temperature heats up.
They will each asymptotically approach the calculated temperature <b>T_final_K</b>
(<b>T_final_degC</b>) that results from dividing the total initial energy in the system by the sum
of the heat capacities of each element.
</p>
<p>
Simulate for 5 s and plot the variables<br>
mass1.T, mass2.T, T_final_K or <br>
Tsensor1.T, Tsensor2.T, T_final_degC
</p>
</HTML>"),
      experiment(StopTime=1.0, Interval=0.001));
  end TwoMasses;

  model ControlledTemperature "Control temperature of a resistor"
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC") = 293.15
      "Ambient Temperature";
    parameter Modelica_SIunits.TemperatureDifference TDif = 2
      "Error in Temperature";
    output Modelica_SIunits.Temperature TRes(displayUnit="degC") = heatingResistor.T_heatPort
      "Resulting Temperature";
    Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
          transformation(extent={{-100,-100},{-80,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage(V=10)
                                                          annotation (Placement(
          transformation(
          origin={-90,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor heatCapacitor(C=1, T(
          start=TAmb, fixed=true)) annotation (Placement(transformation(extent=
              {{0,-60},{20,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.HeatingResistor heatingResistor(
      R_ref=10,
      T_ref=293.15,
      alpha=1/255) annotation (Placement(transformation(
          origin={-30,-50},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Sources.FixedTemperature fixedTemperature(T=TAmb)
      annotation (Placement(transformation(extent={{100,-60},{80,-40}},
            rotation=0)));
    Modelica_Thermal_HeatTransfer.Celsius.TemperatureSensor temperatureSensor
      annotation (Placement(transformation(
          origin={10,-30},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor thermalConductor(G=0.1)
      annotation (Placement(transformation(extent={{40,-60},{60,-40}}, rotation=
             0)));
    Modelica_Electrical_Analog.Ideal.IdealOpeningSwitch idealSwitch
          annotation (Placement(transformation(extent={{-70,-50},{-50,-30}},
            rotation=0)));
    Modelica_Blocks.Sources.Ramp ramp(
      height=25,
      duration=6,
      offset=25,
      startTime=2) annotation (Placement(transformation(extent={{40,0},{20,20}},
            rotation=0)));
    Modelica_Blocks.Logical.OnOffController onOffController(bandwidth=TDif)
      annotation (Placement(transformation(extent={{0,-20},{-20,0}}, rotation=
             0)));
    Modelica_Blocks.Logical.Not logicalNot
                                     annotation (Placement(transformation(
            extent={{-30,-20},{-50,0}}, rotation=0)));
  equation
    connect(constantVoltage.n, heatingResistor.n)   annotation (Line(points={{-90,-60},
            {-30,-60}},           color={0,0,255}));
    connect(constantVoltage.n, ground.p)   annotation (Line(points={{-90,-60},
            {-90,-80}}, color={0,0,255}));
    connect(heatingResistor.heatPort, thermalConductor.port_a)   annotation (Line(
          points={{-20,-50},{40,-50}}, color={191,0,0}));
    connect(thermalConductor.port_b, fixedTemperature.port)   annotation (Line(
          points={{60,-50},{80,-50}}, color={191,0,0}));
    connect(heatingResistor.heatPort, temperatureSensor.port)   annotation (Line(
          points={{-20,-50},{10,-50},{10,-40}}, color={191,0,0}));
    connect(heatingResistor.heatPort, heatCapacitor.port)   annotation (Line(
          points={{-20,-50},{10,-50},{10,-60}}, color={191,0,0}));
    connect(constantVoltage.p, idealSwitch.p)   annotation (Line(points={{-90,
            -40},{-70,-40}}, color={0,0,255}));
    connect(idealSwitch.n, heatingResistor.p)   annotation (Line(points={{-50,-40},
            {-30,-40}},      color={0,0,255}));
    connect(ramp.y, onOffController.reference)   annotation (Line(points={{19,
            10},{10,10},{10,-4},{2,-4}}, color={0,0,127}));
    connect(temperatureSensor.T, onOffController.u)   annotation (Line(points=
           {{10,-20},{10,-16},{2,-16}}, color={0,0,127}));
    connect(onOffController.y, logicalNot.u)
                                        annotation (Line(points={{-21,-10},{
            -28,-10}}, color={255,0,255}));
    connect(logicalNot.y, idealSwitch.control)
                                          annotation (Line(points={{-51,-10},
            {-60,-10},{-60,-33}}, color={255,0,255}));
    annotation (Documentation(info="<HTML>
<P>
A constant voltage of 10 V is applied to a
temperature dependent resistor of 10*(1+(T-20C)/(235+20C)) Ohms,
whose losses v**2/r are dissipated via a
thermal conductance of 0.1 W/K to ambient temperature 20 degree C.
The resistor is assumed to have a thermal capacity of 1 J/K,
having ambient temperature at the beginning of the experiment.
The temperature of this heating resistor is held by an OnOff-controller
at reference temperature within a given bandwidth +/- 1 K
by switching on and off the voltage source.
The reference temperature starts at 25 degree C
and rises between t = 2 and 8 seconds linear to 50 degree C.
An appropriate simulating time would be 10 seconds.
</P>
</html>"),      experiment(StopTime=10, Interval=0.001));
  end ControlledTemperature;

  model Motor "Second order thermal model of a motor"
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Temperature TAmb(displayUnit="degC") = 293.15
      "Ambient temperature";

    Modelica_Blocks.Sources.CombiTimeTable lossTable(extrapolation=
          Modelica_Blocks.Types.Extrapolation.Periodic,
                                               smoothness=Modelica_Blocks.Types.Smoothness.ConstantSegments,
                                             table=[0,100,500; 360,1000,500;
          600,100,500])       annotation (Placement(transformation(
          origin={-40,70},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow windingLosses(T_ref=
          368.15, alpha=3.03E-3) annotation (Placement(transformation(
          origin={-80,10},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor winding(C=2500, T(
          start=TAmb, fixed=true)) annotation (Placement(transformation(extent=
              {{-90,-20},{-70,-40}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Celsius.TemperatureSensor Twinding
      annotation (Placement(transformation(
          origin={-60,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor winding2core(G=10)
      annotation (Placement(transformation(extent={{-50,-20},{-30,0}}, rotation=
             0)));
    Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow coreLosses
      annotation (Placement(transformation(
          origin={0,10},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor core(C=25000, T(
          start=TAmb, fixed=true)) annotation (Placement(transformation(extent=
              {{-10,-20},{10,-40}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Celsius.TemperatureSensor Tcore annotation (
        Placement(transformation(
          origin={-20,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Blocks.Sources.Constant convectionConstant(k=25)
      annotation (Placement(transformation(
          origin={40,30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.Convection convection annotation (
        Placement(transformation(extent={{30,-20},{50,0}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Sources.FixedTemperature environment(T=TAmb)
      annotation (Placement(transformation(
          origin={80,-10},
          extent={{-10,-10},{10,10}},
          rotation=180)));
  equation
    connect(windingLosses.port, winding.port)  annotation (Line(points={{-80,0},
            {-80,-20}},    color={191,0,0}));
    connect(coreLosses.port, core.port)  annotation (Line(points={{0,0},{0,
            -10},{0,-20}},                                       color={191,0,
            0}));
    connect(winding.port, winding2core.port_a)
                                     annotation (Line(points={{-80,-20},{-80,
            -10},{-50,-10}}, color={191,0,0}));
    connect(winding2core.port_b, core.port)
                                  annotation (Line(points={{-30,-10},{0,-10},
            {0,-20}}, color={191,0,0}));
    connect(winding.port, Twinding.port)  annotation (Line(points={{-80,-20},
            {-80,-10},{-60,-10},{-60,-40}}, color={191,0,0}));
    connect(core.port, Tcore.port)  annotation (Line(points={{0,-20},{0,-10},
            {-20,-10},{-20,-40}}, color={191,0,0}));
    connect(winding2core.port_b, convection.solid)
                                        annotation (Line(points={{-30,-10},{
            30,-10}}, color={191,0,0}));
    connect(convection.fluid, environment.port) annotation (Line(points={{50,-10},
            {60,-10},{70,-10}},               color={191,0,0}));
    connect(convectionConstant.y, convection.Gc)
      annotation (Line(points={{40,19},{40,0}}, color={0,0,127}));
    connect(lossTable.y[1], windingLosses.Q_flow) annotation (Line(points={{-40,59},
            {-40,40},{-80,40},{-80,20}},         color={0,0,127}));
    connect(lossTable.y[2], coreLosses.Q_flow) annotation (Line(points={{-40,59},
            {-40,40},{0,40},{0,20}},                             color={0,0,
            127}));
    annotation (Documentation(info="<HTML>
<p>
This example contains a simple second order thermal model of a motor.
The periodic power losses are described by table \"lossTable\":
</p>
<table>
<tr><td valign=\"top\">time</td><td valign=\"top\">winding losses</td><td valign=\"top\">core losses</td></tr>
<tr><td valign=\"top\">   0</td><td valign=\"top\">           100</td><td valign=\"top\">        500</td></tr>
<tr><td valign=\"top\"> 360</td><td valign=\"top\">           100</td><td valign=\"top\">        500</td></tr>
<tr><td valign=\"top\"> 360</td><td valign=\"top\">          1000</td><td valign=\"top\">        500</td></tr>
<tr><td valign=\"top\"> 600</td><td valign=\"top\">          1000</td><td valign=\"top\">        500</td></tr>
</table>
<p>
Since constant speed is assumed, the core losses keep constant
whereas the winding losses are low for 6 minutes (no-load) and high for 4 minutes (over load).
</p>
<p>
The winding losses are corrected by (1 + alpha*(T - T_ref)) because the winding's resistance is temperature dependent whereas the core losses are kept constant (alpha = 0).
</p>
<p>
The power dissipation to the environment is approximated by heat flow through
a thermal conductance between winding and core,
partially storage of the heat in the winding's heat capacity
as well as the core's heat capacity and finally by forced convection to the environment.<br>
Since constant speed is assumed, the convective conductance keeps constant.<br>
Using Modelica.Thermal.FluidHeatFlow it would be possible to model the coolant air flow, too
(instead of simple dissipation to a constant ambient's temperature).
</p>
<p>
Simulate for 7200 s; plot Twinding.T and Tcore.T.
</p>
</HTML>"),
      experiment(StopTime=7200, Interval=0.01));
  end Motor;
  annotation (                              Documentation(info="<html>

</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Thermal_HeatTransfer_Examples;
