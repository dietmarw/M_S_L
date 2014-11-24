within ;
encapsulated package Modelica_Fluid_Examples
  "Demonstration of the usage of the library"
  import Modelica_Icons;
  import Modelica_Media;
  import Modelica_Fluid;
  import Modelica_SIunits;
  import Modelica_Blocks;
  import Modelica_Thermal_HeatTransfer;
  import Modelica_StateGraph;
  import Modelica_Constants;
  extends Modelica_Icons.ExamplesPackage;

  model PumpingSystem "Model of a pumping system for drinking water"
    extends Modelica_Icons.Example;

    replaceable package Medium = Modelica_Media.Water.StandardWaterOnePhase
      constrainedby Modelica_Media.Interfaces.PartialMedium;
    //replaceable package Medium = Modelica_Media.Water.ConstantPropertyLiquidWater
    //  constrainedby Modelica_Media.Interfaces.PartialMedium;

    Modelica_Fluid.Sources.FixedBoundary source(
      nPorts=1,
      use_T=true,
      T=Modelica_SIunits.Conversions.from_degC(20),
      p=system.p_ambient,
      redeclare package Medium = Medium) annotation (Placement(transformation(
            extent={{-100,-80},{-80,-60}}, rotation=0)));

    Modelica_Fluid.Pipes.StaticPipe pipe(
      allowFlowReversal=true,
      length=100,
      height_ab=50,
      diameter=0.3,
      redeclare package Medium = Medium) annotation (Placement(transformation(
          origin={-30,-51},
          extent={{-9,-10},{11,10}},
          rotation=90)));

    Modelica_Fluid.Machines.PrescribedPump pumps(
      checkValve=true,
      N_nominal=1200,
      redeclare function flowCharacteristic =
          Modelica_Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow
          (V_flow_nominal={0,0.25,0.5}, head_nominal={100,60,0}),
      use_N_in=true,
      nParallel=1,
      energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
      V(displayUnit="l") = 0.05,
      massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
      redeclare package Medium = Medium) annotation (Placement(transformation(
            extent={{-68,-80},{-48,-60}}, rotation=0)));

    Modelica_Fluid.Vessels.OpenTank reservoir(
      T_start=Modelica_SIunits.Conversions.from_degC(20),
      use_portsData=true,
      crossArea=50,
      level_start=2.2,
      height=3,
      nPorts=3,
      portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                     diameter=0.3),
          Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                              diameter=0.3),
          Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                              diameter=0.01)},
      redeclare package Medium = Medium) annotation (Placement(transformation(
            extent={{-20,-16},{0,4}}, rotation=0)));

    Modelica_Fluid.Valves.ValveLinear userValve(
      allowFlowReversal=false,
      dp_nominal=200000,
      m_flow_nominal=400,
      redeclare package Medium = Medium) annotation (Placement(transformation(
            extent={{58,-38},{74,-22}}, rotation=0)));
    Modelica_Fluid.Sources.FixedBoundary sink(
      p=system.p_ambient,
      T=system.T_ambient,
      nPorts=2,
      redeclare package Medium = Medium) annotation (Placement(transformation(
            extent={{100,-40},{80,-20}}, rotation=0)));
    Modelica_Blocks.Sources.Step valveOpening(startTime=200, offset=1e-6)
      annotation (Placement(transformation(extent={{56,0},{76,20}}, rotation=0)));
    Modelica_Blocks.Sources.Constant RelativePressureSetPoint(k=2e4)
      annotation (Placement(transformation(extent={{-100,60},{-80,80}}, rotation=
              0)));
    Modelica_Blocks.Logical.OnOffController controller(bandwidth=4000,
        pre_y_start=false)
                          annotation (Placement(transformation(extent={{-40,60},{
              -20,80}}, rotation=0)));
    Modelica_Blocks.Logical.TriggeredTrapezoid PumpRPMGenerator(
      rising=3,
      falling=3,
      amplitude=1200,
      offset=0.001) annotation (Placement(transformation(extent={{0,60},{20,80}},
            rotation=0)));
    Modelica_Fluid.Sensors.RelativePressure reservoirPressure(redeclare package
        Medium =         Medium) annotation (Placement(transformation(extent=
              {{10,-12},{30,-32}}, rotation=0)));
    Modelica_Blocks.Continuous.FirstOrder PT1(
      T=2,
      initType=Modelica_Blocks.Types.Init.InitialState,
      y_start=0)
      annotation (Placement(transformation(extent={{40,60},{60,80}}, rotation=0)));

    inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
      annotation (Placement(transformation(extent={{60,-96},{80,-76}},
            rotation=0)));
  equation
    connect(userValve.port_b, sink.ports[1])     annotation (Line(points={{74,-30},
            {77,-30},{77,-28},{80,-28}},
                      color={0,127,255}));
    connect(source.ports[1], pumps.port_a) annotation (Line(points={{-80,-70},{
            -74,-70},{-68,-70}},               color={0,127,255}));
    connect(valveOpening.y, userValve.opening) annotation (Line(points={{77,10},{
            98,10},{98,-12},{66,-12},{66,-23.6}}, color={0,0,127}));
    connect(RelativePressureSetPoint.y, controller.reference)
                                                      annotation (Line(points={{
            -79,70},{-60,70},{-60,76},{-42,76}}, color={0,0,127}));
    connect(controller.y, PumpRPMGenerator.u)
      annotation (Line(points={{-19,70},{-2,70}}, color={255,0,255}));
    connect(reservoirPressure.p_rel, controller.u) annotation (Line(points={{20,
            -13},{20,50},{-52,50},{-52,64},{-42,64}}, color={0,0,127}));
    connect(reservoirPressure.port_b, sink.ports[2])    annotation (Line(
        points={{30,-22},{44,-22},{44,-48},{80,-48},{80,-32}},
        color={0,127,255},
        pattern=LinePattern.Dot));
    connect(PumpRPMGenerator.y, PT1.u)
      annotation (Line(points={{21,70},{38,70}}, color={0,0,127}));
    connect(PT1.y, pumps.N_in) annotation (Line(points={{61,70},{74,70},{74,30},{
            -58,30},{-58,-60}},          color={0,0,127}));
    connect(pipe.port_a, pumps.port_b)         annotation (Line(points={{-30,-60},
            {-30,-70},{-48,-70}},                color={0,127,255}));
    connect(reservoir.ports[1], pipe.port_b) annotation (Line(
        points={{-12.6667,-16},{-12.6667,-30},{-30,-30},{-30,-40}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(reservoir.ports[3], reservoirPressure.port_a) annotation (Line(
        points={{-7.33333,-16},{-7,-16},{-7,-22},{10,-22}},
        color={0,127,255},
        smooth=Smooth.None,
        pattern=LinePattern.Dot));
    connect(reservoir.ports[2], userValve.port_a) annotation (Line(
        points={{-10,-16},{-10,-30},{58,-30}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
Water is pumped from a source by a pump (fitted with check valves), through a pipe whose outlet is 50 m higher than the source, into a reservoir. The users are represented by an equivalent valve, connected to the reservoir.
</p>
<p>
The water controller is a simple on-off controller, regulating on the gauge pressure measured at the base of the tower; the output of the controller is the rotational speed of the pump, which is represented by the output of a first-order system. A small but nonzero rotational speed is used to represent the standby state of the pumps, in order to avoid singularities in the flow characteristic.
</p>
<p>
Simulate for 2000 s. When the valve is opened at time t=200, the pump starts turning on and off to keep the reservoir level around 2 meters, which roughly corresponds to a gauge pressure of 200 mbar.
</p>
<p>
If using Dymola, turn off \"Equidistant time grid\" to avoid numerical errors.
</p>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/PumpingSystem.png\" border=\"1\"
     alt=\"PumpingSystem.png\">
</html>",   revisions="<html>
<ul>
<li><i>Jan 2009</i>
    by R&uuml;diger Franke:<br>
       Reduce diameters of pipe and reservoir ports; use separate port for measurement of reservoirPressure, avoiding disturbances due to pressure losses.</li>
<li><i>1 Oct 2007</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Parameters updated.</li>
<li><i>2 Nov 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Created.</li>
</ul>
</html>"),
      experiment(
        StopTime=2000,
        Interval=0.4,
        Tolerance=1e-006));
  end PumpingSystem;

  model HeatingSystem "Simple model of a heating system"
    extends Modelica_Icons.Example;
     replaceable package Medium =
        Modelica_Media.Water.StandardWater
       constrainedby Modelica_Media.Interfaces.PartialMedium;

    Modelica_Fluid.Vessels.OpenTank tank(
      redeclare package Medium = Medium,
      crossArea=0.01,
      height=2,
      level_start=1,
      nPorts=2,
      massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
      use_HeatTransfer=true,
      portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                     diameter=0.01),
          Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                              diameter=0.01)},
      redeclare model HeatTransfer =
          Modelica_Fluid.Vessels.BaseClasses.HeatTransfer.IdealHeatTransfer (
            k=10),
      ports(each p(start=1e5)),
      T_start=Modelica_SIunits.Conversions.from_degC(20)) annotation (
        Placement(transformation(extent={{-80,30},{-60,50}}, rotation=0)));
    Modelica_Fluid.Machines.ControlledPump pump(
      redeclare package Medium = Medium,
      N_nominal=1500,
      use_T_start=true,
      T_start=Modelica_SIunits.Conversions.from_degC(40),
      m_flow_start=0.01,
      m_flow_nominal=0.01,
      control_m_flow=false,
      allowFlowReversal=false,
      p_a_start=110000,
      p_b_start=130000,
      p_a_nominal=110000,
      p_b_nominal=130000) annotation (Placement(transformation(extent={{-50,10},
              {-30,30}}, rotation=0)));
    Modelica_Fluid.Valves.ValveIncompressible valve(
      redeclare package Medium = Medium,
      CvData=Modelica_Fluid.Types.CvTypes.OpPoint,
      m_flow_nominal=0.01,
      show_T=true,
      allowFlowReversal=false,
      dp_start=18000,
      dp_nominal=10000) annotation (Placement(transformation(extent={{60,-80},
              {40,-60}}, rotation=0)));
  protected
    Modelica_Blocks.Interfaces.RealOutput m_flow
      annotation (Placement(transformation(extent={{-6,34},{6,46}},   rotation=
              0)));
  public
    Modelica_Fluid.Sensors.MassFlowRate sensor_m_flow(redeclare package Medium
        = Medium) annotation (Placement(transformation(extent={{-20,10},{0,30}},
            rotation=0)));
    Modelica_Thermal_HeatTransfer.Sources.FixedTemperature T_ambient(T=system.T_ambient)
      annotation (Placement(transformation(extent={{-14,-27},{0,-13}}, rotation
            =0)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor wall(G=1.6e3/20)
      annotation (Placement(transformation(
          origin={10,-48},
          extent={{8,-10},{-8,10}},
          rotation=90)));
    Modelica_Thermal_HeatTransfer.Sources.FixedHeatFlow burner(
                                                       Q_flow=1.6e3,
      T_ref=343.15,
      alpha=-0.5)
      annotation (Placement(transformation(extent={{16,30},{36,50}}, rotation=0)));
    inner Modelica_Fluid.System system(m_flow_small=1e-4, energyDynamics=
          Modelica_Fluid.Types.Dynamics.SteadyStateInitial)
                                             annotation (Placement(
          transformation(extent={{-90,70},{-70,90}}, rotation=0)));
    Modelica_Fluid.Pipes.DynamicPipe heater(
      redeclare package Medium = Medium,
      use_T_start=true,
      T_start=Modelica_SIunits.Conversions.from_degC(80),
      length=2,
      redeclare model HeatTransfer =
          Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
      diameter=0.01,
      nNodes=1,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
      use_HeatTransfer=true,
      modelStructure=Modelica_Fluid.Types.ModelStructure.a_v_b,
      p_a_start=130000) annotation (Placement(transformation(extent={{30,10},{
              50,30}}, rotation=0)));

    Modelica_Fluid.Pipes.DynamicPipe radiator(
      use_T_start=true,
      redeclare package Medium = Medium,
      length=10,
      T_start=Modelica_SIunits.Conversions.from_degC(40),
      redeclare model HeatTransfer =
          Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
      diameter=0.01,
      nNodes=1,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
      use_HeatTransfer=true,
      modelStructure=Modelica_Fluid.Types.ModelStructure.a_v_b,
      p_a_start=110000) annotation (Placement(transformation(extent={{20,-80},{
              0,-60}}, rotation=0)));

  protected
    Modelica_Blocks.Interfaces.RealOutput T_forward
      annotation (Placement(transformation(extent={{74,34},{86,46}},   rotation=
             0)));
    Modelica_Blocks.Interfaces.RealOutput T_return
      annotation (Placement(transformation(extent={{-46,-56},{-58,-44}},
            rotation=0)));
  public
    Modelica_Fluid.Sensors.Temperature sensor_T_forward(redeclare package
        Medium = Medium) annotation (Placement(transformation(extent={{50,30},
              {70,50}}, rotation=0)));
    Modelica_Fluid.Sensors.Temperature sensor_T_return(redeclare package Medium
        =        Medium) annotation (Placement(transformation(extent={{-20,-60},
              {-40,-40}}, rotation=0)));
  protected
    Modelica_Blocks.Interfaces.RealOutput tankLevel
                                   annotation (Placement(transformation(extent={{-56,34},
              {-44,46}},          rotation=0)));
  public
    Modelica_Blocks.Sources.Step handle(
      startTime=2000,
      height=0.9,
      offset=0.1)   annotation (Placement(transformation(extent={{26,-27},{40,-13}},
                    rotation=0)));
    Modelica_Fluid.Pipes.DynamicPipe pipe(
      redeclare package Medium = Medium,
      use_T_start=true,
      T_start=Modelica_SIunits.Conversions.from_degC(80),
      redeclare model HeatTransfer =
          Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
      diameter=0.01,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
      length=10,
      p_a_start=130000) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={80,-20})));

  equation
  tankLevel = tank.level;
    connect(sensor_m_flow.m_flow, m_flow)         annotation (Line(points={{-10,31},
            {-10,40},{0,40}},                     color={0,0,127}));
    connect(sensor_m_flow.port_b, heater.port_a)
                                              annotation (Line(points={{0,20},{0,
            20},{30,20}},
                      color={0,127,255}));
    connect(T_ambient.port, wall.port_a)                       annotation (Line(
          points={{0,-20},{10,-20},{10,-40}}, color={191,0,0}));
    connect(sensor_T_forward.T, T_forward)     annotation (Line(points={{67,40},{
            80,40}},                              color={0,0,127}));
    connect(radiator.port_a, valve.port_b) annotation (Line(points={{20,-70},{20,
            -70},{40,-70}},           color={0,127,255}));
    connect(sensor_T_return.port, radiator.port_b)
                                              annotation (Line(points={{-30,-60},
            {-30,-70},{0,-70}}, color={0,127,255}));
    connect(tank.ports[2], pump.port_a) annotation (Line(
        points={{-68,30},{-68,20},{-50,20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(handle.y, valve.opening)       annotation (Line(
        points={{40.7,-20},{50,-20},{50,-62}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pump.port_b, sensor_m_flow.port_a)
                                              annotation (Line(
        points={{-30,20},{-20,20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(sensor_T_return.T, T_return)        annotation (Line(
        points={{-37,-50},{-52,-50}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(burner.port, heater.heatPorts[1])
                                            annotation (Line(
        points={{36,40},{40.1,40},{40.1,24.4}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(wall.port_b, radiator.heatPorts[1])              annotation (Line(
        points={{10,-56},{10,-65.6},{9.9,-65.6}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(sensor_T_forward.port, heater.port_b)
                                                annotation (Line(
        points={{60,30},{60,20},{50,20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(heater.port_b, pipe.port_a) annotation (Line(
        points={{50,20},{80,20},{80,-10}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe.port_b, valve.port_a) annotation (Line(
        points={{80,-30},{80,-70},{60,-70}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(radiator.port_b, tank.ports[1]) annotation (Line(
        points={{0,-70},{-72,-70},{-72,30}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (                             Documentation(info="<html>
<p>
Simple heating system with a closed flow cycle.
After 2000s of simulation time the valve fully opens. A simple idealized control is embedded
into the respective components, so that the heating system can be regulated with the valve:
the pump controls the pressure, the burner controls the temperature.
</p>
<p>
One can investigate the temperatures and flows for different settings of <code>system.energyDynamics</code>
(see Assumptions tab of the system object).</p>
<ul>
<li>With <code>system.energyDynamics==Types.Dynamics.FixedInitial</code> the states need to find their steady values during the simulation.</li>
<li>With <code>system.energyDynamics==Types.Dynamics.SteadyStateInitial</code> (default setting) the simulation starts in steady-state.</li>
<li>With <code>system.energyDynamics==Types.Dynamics.SteadyState</code> all but one dynamic states are eliminated.
    The left state <code>tank.m</code> is to account for the closed flow cycle. It is constant as outflow and inflow are equal
    in a steady-state simulation.</li>
</ul>
<p>
Note that a closed flow cycle generally causes circular equalities for the mass flow rates and leaves the pressure undefined.
This is why the tank.massDynamics, i.e., the tank level determining the port pressure, is modified locally to Types.Dynamics.FixedInitial.
</p>
<p>
Also note that the tank is thermally isolated against its ambient. This way the temperature of the tank is also
well defined for zero flow rate in the heating system, e.g., for valveOpening.offset=0 at the beginning of a simulation.
The pipe however is assumed to be perfectly isolated.
If steady-state values shall be obtained with the valve fully closed, then a thermal
coupling between the pipe and its ambient should be defined as well.
</p>
<p>
Moreover it is worth noting that the idealized direct connection between the heater and the pipe, resulting in equal port pressures,
is treated as high-index DAE, as opposed to a nonlinear equation system for connected pressure loss correlations. A pressure loss correlation
could be additionally introduced to model the fitting between the heater and the pipe, e.g., to adapt different diameters.
</p>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/HeatingSystem.png\" border=\"1\"
     alt=\"HeatingSystem.png\">
</html>"),   experiment(StopTime=6000),
      __Dymola_Commands(file(ensureSimulated=true)=
          "modelica://Modelica/Resources/Scripts/Dymola/Fluid/HeatingSystem/plotResults.mos"
          "plotResults"));
  end HeatingSystem;

  package DrumBoiler
    "Drum boiler example, see Franke, Rode, Krueger: On-line Optimization of Drum Boiler Startup, 3rd International Modelica Conference, Linkoping, 2003"

    extends Modelica_Icons.ExamplesPackage;
    model DrumBoiler
      "Complete drum boiler model, including evaporator and supplementary components"
      extends Modelica_Icons.Example;

      parameter Boolean use_inputs = false
        "use external inputs instead of test data contained internally";

      BaseClasses.EquilibriumDrumBoiler evaporator(
        m_D=300e3,
        cp_D=500,
        V_t=100,
        V_l_start=67,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        p_start=100000) annotation (Placement(transformation(extent={{-46,-30},
                {-26,-10}}, rotation=0)));
      Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow furnace
        annotation (Placement(transformation(
            origin={-36,-53},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Fluid.Sources.FixedBoundary sink(
        nPorts=1,
        p=Modelica_SIunits.Conversions.from_bar(
                      0.5),
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        T=500) annotation (Placement(transformation(
            origin={90,-20},
            extent={{-10,-10},{10,10}},
            rotation=180)));

      Modelica_Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium
          =        Modelica_Media.Water.StandardWater) annotation (Placement(
            transformation(
            origin={30,-20},
            extent={{10,10},{-10,-10}},
            rotation=180)));
      Modelica_Fluid.Sensors.Temperature temperature(redeclare package Medium
          = Modelica_Media.Water.StandardWater) annotation (Placement(
            transformation(
            origin={-3,-1},
            extent={{10,10},{-10,-10}},
            rotation=180)));
      Modelica_Fluid.Sensors.Pressure pressure(redeclare package Medium =
            Modelica_Media.Water.StandardWater) annotation (Placement(
            transformation(extent={{10,18},{30,38}}, rotation=0)));
      Modelica_Blocks.Continuous.PI controller(T=120, k=10, initType=
            Modelica_Blocks.Types.Init.InitialState)
        annotation (Placement(transformation(extent={{-49,23},{-63,37}}, rotation=
               0)));
      Modelica_Fluid.Sources.MassFlowSource_h pump(
        nPorts=1,
        h=5e5,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        use_m_flow_in=true) annotation (Placement(transformation(extent={{-80,
                -30},{-60,-10}}, rotation=0)));
      Modelica_Blocks.Math.Feedback feedback
        annotation (Placement(transformation(extent={{-22,20},{-42,40}}, rotation=
               0)));
      Modelica_Blocks.Sources.Constant levelSetPoint(k=67)
        annotation (Placement(transformation(extent={{-38,48},{-24,62}}, rotation=
               0)));
      Modelica_Blocks.Interfaces.RealOutput T_S "steam temperature"
        annotation (Placement(transformation(extent={{100,48},{112,60}}, rotation=
               0)));
      Modelica_Blocks.Interfaces.RealOutput p_S "steam pressure"
        annotation (Placement(transformation(extent={{100,22},{112,34}}, rotation=
               0)));
      Modelica_Blocks.Interfaces.RealOutput qm_S "steam flow rate"
        annotation (Placement(transformation(extent={{100,-2},{112,10}},rotation=
                0)));
      Modelica_Blocks.Interfaces.RealOutput V_l "liquid volume inside drum"
        annotation (Placement(transformation(extent={{100,74},{112,86}}, rotation=
               0)));
    public
      Modelica_Blocks.Math.Gain MW2W(k=1e6)
        annotation (Placement(transformation(extent={{-54,-75.5},{-44,-64.5}},
              rotation=0)));
      Modelica_Blocks.Math.Gain Pa2bar(k=1e-5) annotation (Placement(
            transformation(extent={{37,23},{47,33}}, rotation=0)));
      Modelica_Thermal_HeatTransfer.Celsius.FromKelvin K2degC
        annotation (Placement(transformation(extent={{38,49},{48,59}}, rotation=0)));
      Modelica_Blocks.Nonlinear.Limiter limiter(uMin=0, uMax=500)
        annotation (Placement(transformation(
            origin={-78,30},
            extent={{-7,7},{7,-7}},
            rotation=180)));
      Modelica_Fluid.Valves.ValveLinear SteamValve(
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        dp_nominal=9000000,
        m_flow_nominal=180) annotation (Placement(transformation(extent={{50,
                -10},{70,-30}}, rotation=0)));

      inner Modelica_Fluid.System system
        annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
      Modelica_Blocks.Sources.TimeTable q_F_Tab(table=[0, 0; 3600, 400; 7210,
            400]) if not use_inputs annotation (Placement(transformation(extent={{-90,-80},{-70,-60}},
              rotation=0)));
      Modelica_Blocks.Sources.TimeTable Y_Valve_Tab(table=[0,0; 900,1; 7210,1]) if not use_inputs
                 annotation (Placement(transformation(extent={{30,-80},{50,-60}},
              rotation=0)));
      Modelica_Blocks.Interfaces.RealInput q_F(unit="MW") if use_inputs
        "fuel flow rate" annotation (Placement(transformation(extent={{-112,-56},
                {-100,-44}})));
      Modelica_Blocks.Interfaces.RealInput Y_Valve if use_inputs
        "valve opening" annotation (Placement(transformation(extent={{-112,-96},
                {-100,-84}})));
    equation
      connect(furnace.port, evaporator.heatPort)
        annotation (Line(points={{-36,-43},{-36,-30}}, color={191,0,0}));
      connect(controller.u,feedback.y)
        annotation (Line(points={{-47.6,30},{-41,30}}, color={0,0,127}));
      connect(massFlowRate.m_flow, qm_S)
        annotation (Line(points={{30,-9},{30,4},{106,4}}, color={0,0,127}));
      connect(evaporator.V, V_l)
        annotation (Line(points={{-32,-9},{-32,16},{-4,16},{-4,80},{106,80}},
            color={0,0,127}));
      connect(MW2W.y,furnace.Q_flow)       annotation (Line(points={{-43.5,-70},{-36,
              -70},{-36,-63}},     color={0,0,127}));
      connect(pressure.p, Pa2bar.u)
        annotation (Line(points={{31,28},{36,28}}, color={0,0,127}));
      connect(Pa2bar.y, p_S)
        annotation (Line(points={{47.5,28},{106,28}}, color={0,0,127}));
      connect(K2degC.Celsius, T_S) annotation (Line(points={{48.5,54},{106,54}},
            color={0,0,127}));
      connect(controller.y, limiter.u) annotation (Line(points={{-63.7,30},{-69.6,
              30}}, color={0,0,127}));
      connect(limiter.y, pump.m_flow_in) annotation (Line(points={{-85.7,30},{-90,
              30},{-90,-12},{-80,-12}},   color={0,0,127}));
      connect(temperature.T, K2degC.Kelvin) annotation (Line(points={{4,-1},{4,-1},
              {8,-1},{8,54},{37,54}},
                                color={0,0,127}));
      connect(pressure.port, massFlowRate.port_a) annotation (Line(points={{20,18},{
              20,-20}},  color={0,127,255}));
      connect(pump.ports[1], evaporator.port_a) annotation (Line(points={{-60,-20},
              {-46,-20}}, color={0,127,255}));
      connect(massFlowRate.port_b, SteamValve.port_a) annotation (Line(points={{
              40,-20},{50,-20}}, color={0,127,255}));
      connect(SteamValve.port_b, sink.ports[1]) annotation (Line(points={{70,-20},{75,
              -20},{80,-20}},          color={0,127,255}));
      connect(evaporator.port_b, massFlowRate.port_a) annotation (Line(points={{
              -26,-20},{20,-20}}, color={0,127,255}));
      connect(temperature.port, massFlowRate.port_a) annotation (Line(
          points={{-3,-11},{-3,-20},{20,-20}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(q_F_Tab.y, MW2W.u) annotation (Line(
          points={{-69,-70},{-55,-70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Y_Valve_Tab.y, SteamValve.opening) annotation (Line(
          points={{51,-70},{60,-70},{60,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(q_F, MW2W.u) annotation (Line(
          points={{-106,-50},{-62,-50},{-62,-70},{-55,-70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Y_Valve, SteamValve.opening) annotation (Line(
          points={{-106,-90},{60,-90},{60,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(evaporator.V, feedback.u2) annotation (Line(
          points={{-32,-9},{-32,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(levelSetPoint.y, feedback.u1) annotation (Line(
          points={{-23.3,55},{-16,55},{-16,30},{-24,30}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-151,165},{138,102}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-79,67},{67,21}},
              lineColor={0,0,0},
              textString="drum"),
            Text(
              extent={{-90,-14},{88,-64}},
              lineColor={0,0,0},
              textString="boiler")}),
        experiment(StopTime=5400),
        Documentation(info="<html>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/DrumBoiler.png\" border=\"1\"
     alt=\"DrumBoiler.png\">
</html>"));
    end DrumBoiler;

    package BaseClasses "Additional components for drum boiler example"
      extends Modelica_Icons.BasesPackage;

      model EquilibriumDrumBoiler
        "Simple Evaporator with two states, see Astroem, Bell: Drum-boiler dynamics, Automatica 36, 2000, pp.363-378"
        extends Modelica_Fluid.Interfaces.PartialTwoPort(
          final port_a_exposesState=true,
          final port_b_exposesState=true,
          redeclare replaceable package Medium =
              Modelica_Media.Water.StandardWater constrainedby
            Modelica_Media.Interfaces.PartialTwoPhaseMedium);
        import Constants = Modelica_Constants;
        import Modelica_Fluid.Types;

        parameter Modelica_SIunits.Mass m_D "mass of surrounding drum metal";
        parameter Medium.SpecificHeatCapacity cp_D
          "specific heat capacity of drum metal";
        parameter Modelica_SIunits.Volume V_t "total volume inside drum";
        parameter Medium.AbsolutePressure p_start=system.p_start
          "Start value of pressure"
        annotation(Dialog(tab = "Initialization"));
        parameter Modelica_SIunits.Volume V_l_start=V_t/2
          "Start value of liquid volumeStart value of volume"
          annotation (Dialog(tab="Initialization"));

        // Assumptions
        parameter Boolean allowFlowReversal = system.allowFlowReversal
          "allow flow reversal, false restricts to design direction (port_a -> port_b)"
          annotation(Dialog(tab="Assumptions"), Evaluate=true);
        parameter Types.Dynamics energyDynamics=system.energyDynamics
          "Formulation of energy balance"
          annotation(Evaluate=true, Dialog(tab = "Assumptions", group="Dynamics"));
        parameter Types.Dynamics massDynamics=system.massDynamics
          "Formulation of mass balance"
          annotation(Evaluate=true, Dialog(tab = "Assumptions", group="Dynamics"));

        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=
                 0)));
        Modelica_Blocks.Interfaces.RealOutput V "liquid volume"
        annotation (Placement(transformation(
              origin={40,110},
              extent={{-10,-10},{10,10}},
              rotation=90)));

        Medium.SaturationProperties sat
          "State vector to compute saturation properties";
        Medium.AbsolutePressure p(start=p_start, stateSelect=StateSelect.prefer)
          "pressure inside drum boiler";
        Medium.Temperature T "temperature inside drum boiler";
        Modelica_SIunits.Volume V_v "volume of vapour phase";
        Modelica_SIunits.Volume V_l(start=V_l_start, stateSelect=StateSelect.prefer)
          "volumes of liquid phase";
        Medium.SpecificEnthalpy h_v=Medium.dewEnthalpy(sat)
          "specific enthalpy of vapour";
        Medium.SpecificEnthalpy h_l=Medium.bubbleEnthalpy(sat)
          "specific enthalpy of liquid";
        Medium.Density rho_v=Medium.dewDensity(sat) "density in vapour phase";
        Medium.Density rho_l=Medium.bubbleDensity(sat)
          "density in liquid phase";
        Modelica_SIunits.Mass m "total mass of drum boiler";
        Modelica_SIunits.Energy U "internal energy";
        Medium.Temperature T_D=heatPort.T "temperature of drum";
        Modelica_SIunits.HeatFlowRate q_F=heatPort.Q_flow
          "heat flow rate from furnace";
        Medium.SpecificEnthalpy h_W=inStream(port_a.h_outflow)
          "Feed water enthalpy (specific enthalpy close to feedwater port when mass flows in to the boiler)";
        Medium.SpecificEnthalpy h_S=inStream(port_b.h_outflow)
          "steam enthalpy (specific enthalpy close to steam port when mass flows in to the boiler)";
        Modelica_SIunits.MassFlowRate qm_W=port_a.m_flow
          "feed water mass flow rate";
        Modelica_SIunits.MassFlowRate qm_S=port_b.m_flow "steam mass flow rate";
      /*outer Modelica_Fluid.Components.FluidOptions fluidOptions
    "Global default options";*/
      equation
      // balance equations
        m = rho_v*V_v + rho_l*V_l + m_D "Total mass";
        U = rho_v*V_v*h_v + rho_l*V_l*h_l - p*V_t + m_D*cp_D*T_D "Total energy";
        if massDynamics == Types.Dynamics.SteadyState then
          0 = qm_W + qm_S "Steady state mass balance";
        else
          der(m) = qm_W + qm_S "Dynamic mass balance";
        end if;
        if energyDynamics == Types.Dynamics.SteadyState then
          0 = q_F + port_a.m_flow*actualStream(port_a.h_outflow)
                  + port_b.m_flow*actualStream(port_b.h_outflow)
            "Steady state energy balance";
        else
          der(U) = q_F
                  + port_a.m_flow*actualStream(port_a.h_outflow)
                  + port_b.m_flow*actualStream(port_b.h_outflow)
            "Dynamic energy balance";
        end if;
        V_t = V_l + V_v;

      // Properties of saturated liquid and steam
        sat.psat = p;
        sat.Tsat = T;
        sat.Tsat = Medium.saturationTemperature(p);

      // ideal heat transfer between metal and water
        T_D = T;

      // boundary conditions at the ports
        port_a.p = p;
        port_a.h_outflow = h_l;
        port_b.p = p;
        port_b.h_outflow = h_v;

      // liquid volume
        V = V_l;

      // Check that two-phase equilibrium is actually possible
        assert(p < Medium.fluidConstants[1].criticalPressure - 10000,
          "Evaporator model requires subcritical pressure");
      initial equation
      // Initial conditions
        // Note: p represents the energy as it is constrained by T_sat
        if energyDynamics == Types.Dynamics.FixedInitial then
          p = p_start;
        elseif energyDynamics == Types.Dynamics.SteadyStateInitial then
          der(p) = 0;
        end if;

        if massDynamics == Types.Dynamics.FixedInitial then
          V_l = V_l_start;
        elseif energyDynamics == Types.Dynamics.SteadyStateInitial then
          der(V_l) = 0;
        end if;

        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,64},{100,-64}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Backward,
                fillColor={135,135,135}),
              Rectangle(
                extent={{-100,-44},{100,44}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={255,255,255}),
              Rectangle(
                extent=DynamicSelect({{-100,-44},{100,44}},
                                     {{-100,-44},{(-100 + 200*V_l/V_t),44}}),
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={0,127,255}),
              Ellipse(
                extent={{18,0},{48,-29}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-1,29},{29,0}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{43,31},{73,2}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-31,1},{-1,-28}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{50,15},{80,-14}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-72,25},{-42,-4}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{71,-11},{101,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{72,28},{102,-1}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{71,40},{101,11}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{0,-64},{0,-100}}, color={191,0,0}),
              Line(points={{40,100},{40,64}},   color={0,0,127}),
              Ellipse(
                extent={{58,-11},{88,-40}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{71,1},{101,-28}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<ul>
<li><i>Dec 2008</i>
    by R&uuml;diger Franke:<br>
     Adapt initialization to new Types.Dynamics</li>
<li><i>2 Nov 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
     Initialization options fixed</li>
<li><i>6 Sep 2005</i><br>
    Model by Ruediger Franke<br>
    See Franke, Rode, Krueger: On-line Optimization of Drum Boiler Startup, 3rd International Modelica Conference, Linkoping, 2003.<br>
    Modified after the 45th Design Meeting</li>
</ul>
</html>",       info="<html>
<p>
Model of a simple evaporator with two states. The model assumes two-phase equilibrium inside the component; saturated steam goes out of the steam outlet.</p>
<p>
References: Astroem, Bell: Drum-boiler dynamics, Automatica 36, 2000, pp.363-378</p>
</html>"));
      end EquilibriumDrumBoiler;
    end BaseClasses;
  end DrumBoiler;

  package Tanks "Library demonstrating the usage of the tank model"
    extends Modelica_Icons.ExamplesPackage;

    model ThreeTanks "Demonstrating the usage of SimpleTank"
      import Fluid = Modelica_Fluid;
      extends Modelica_Icons.Example;
       // replaceable package Medium = Modelica_Fluid.Media.Water.ConstantPropertyLiquidWater extends
      // replaceable package Medium = Modelica_Media.Water.StandardWaterOnePhase extends
      // replaceable package Medium = Modelica_Media.Incompressible.Examples.Glycol47 extends
       replaceable package Medium =
          Modelica_Media.Water.ConstantPropertyLiquidWater                           constrainedby
        Modelica_Media.Interfaces.PartialMedium "Medium in the component"
          annotation (choicesAllMatching = true);

      Modelica_Fluid.Vessels.OpenTank tank1(
        crossArea=1,
        redeclare package Medium = Medium,
        use_portsData=true,
        height=12,
        level_start=8,
        nPorts=1,
        portsData={Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})
        annotation (Placement(transformation(extent={{-80,20},{-40,60}},
              rotation=0)));
      Modelica_Fluid.Vessels.OpenTank tank2(
        crossArea=1,
        redeclare package Medium = Medium,
        use_portsData=true,
        height=12,
        level_start=3,
        nPorts=1,
        portsData={Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})
        annotation (Placement(transformation(extent={{-20,20},{20,60}},
              rotation=0)));

      inner Modelica_Fluid.System system(energyDynamics=Fluid.Types.Dynamics.FixedInitial)
        annotation (Placement(transformation(extent={{70,-90},{90,-70}},
              rotation=0)));
      Modelica_Fluid.Vessels.OpenTank tank3(
        crossArea=1,
        redeclare package Medium = Medium,
        use_portsData=true,
        height=12,
        level_start=3,
        nPorts=1,
        portsData={Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})
        annotation (Placement(transformation(extent={{40,10},{80,50}},
              rotation=0)));
      Modelica_Fluid.Pipes.StaticPipe pipe1(
        redeclare package Medium = Medium,
        allowFlowReversal=true,
        height_ab=2,
        length=2,
        diameter=0.1) annotation (Placement(transformation(
            origin={-60,-10},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Fluid.Pipes.StaticPipe pipe2(
        redeclare package Medium = Medium,
        allowFlowReversal=true,
        height_ab=2,
        length=2,
        diameter=0.1) annotation (Placement(transformation(
            origin={0,-10},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Fluid.Pipes.StaticPipe pipe3(
        redeclare package Medium = Medium,
        allowFlowReversal=true,
        height_ab=-1,
        length=2,
        diameter=0.1) annotation (Placement(transformation(
            origin={60,-20},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    equation
      connect(pipe1.port_a, pipe2.port_a) annotation (Line(points={{-60,-20},{-60,
              -40},{0,-40},{0,-30},{0,-20}},                 color={0,127,255}));
      connect(pipe2.port_a, pipe3.port_a) annotation (Line(points={{0,-20},{0,-20},
              {0,-40},{60,-40},{60,-30}},              color={0,127,255}));
      connect(pipe3.port_b, tank3.ports[1])
        annotation (Line(points={{60,-10},{60,-10},{60,10}},
                                                  color={0,127,255}));
      connect(pipe1.port_b, tank1.ports[1]) annotation (Line(points={{-60,0},{-60,
              10},{-60,20}},
                    color={0,127,255}));
      connect(pipe2.port_b, tank2.ports[1]) annotation (Line(
          points={{0,0},{0,20}},
          color={0,127,255},
          smooth=Smooth.None));

      annotation (      experiment(StopTime=200),
        __Dymola_Commands(file=
              "modelica://Modelica/Resources/Scripts/Dymola/Fluid/ThreeTanks/plot level and port.m_flow.mos"
            "plot level and port.m_flow"),
        Documentation(info="<html>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/ThreeTanks.png\" border=\"1\"
     alt=\"ThreeTanks.png\">
</html>"));
    end ThreeTanks;

    model TanksWithOverflow
      "Two tanks connected with pipes at different heights"
      extends Modelica_Icons.Example;
      import Fluid = Modelica_Fluid;
      Modelica_Fluid.Vessels.OpenTank upperTank(
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        height=20,
        level_start=2,
        crossArea=0.2,
        nPorts=3,
        portsData={Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
            Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
            Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1, height=10)})
        annotation (Placement(transformation(extent={{-40,20},{0,60}},
              rotation=0)));
      Modelica_Fluid.Sources.MassFlowSource_T massFlowRate(
        nPorts=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        m_flow=0.2,
        use_m_flow_in=true) annotation (Placement(transformation(extent={{-60,
                -40},{-40,-20}}, rotation=0)));
      inner Modelica_Fluid.System system(energyDynamics=Fluid.Types.Dynamics.FixedInitial)
        annotation (Placement(transformation(extent={{-150,-112},{-130,-92}},
              rotation=0)));
      Modelica_Fluid.Sensors.Pressure pressure(redeclare package Medium =
            Modelica_Media.Water.StandardWater) annotation (Placement(
            transformation(extent={{40,16},{60,36}}, rotation=0)));
      Modelica_Fluid.Pipes.StaticPipe pipe(
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        diameter=0.02,
        height_ab=-20,
        length=200) annotation (Placement(transformation(
            origin={0,-30},
            extent={{10,-10},{-10,10}},
            rotation=90)));

      Modelica_Fluid.Vessels.OpenTank lowerTank(
        height=20,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        level_start=2,
        crossArea=1,
        nPorts=2,
        portsData={Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
            Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1, height=10)})
        annotation (Placement(transformation(extent={{40,-60},{80,-20}},
              rotation=0)));
      Modelica_Blocks.Logical.Hysteresis hysteresis(
        uLow=1.1e5,
        uHigh=2.5e5,
        pre_y_start=true) "mass flow rate signal by pressure control"
        annotation (Placement(transformation(extent={{-140,-30},{-120,-10}},
              rotation=0)));
      Modelica_Blocks.Logical.Switch switch1 annotation (Placement(transformation(
              extent={{-100,-30},{-80,-10}}, rotation=0)));
      Modelica_Blocks.Sources.Constant m_flow_off(k=0)
        annotation (Placement(transformation(extent={{-140,10},{-120,30}}, rotation=
               0)));
      Modelica_Blocks.Sources.Constant m_flow_on(k=2)
        annotation (Placement(transformation(extent={{-140,-60},{-120,-40}},
              rotation=0)));
      Modelica_Fluid.Pipes.StaticPipe overflow(
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        diameter=0.02,
        length=200,
        height_ab=-20) annotation (Placement(transformation(
            origin={20,-10},
            extent={{10,-10},{-10,10}},
            rotation=90)));
    equation
      connect(massFlowRate.ports[1], upperTank.ports[1])
                                                     annotation (Line(
          points={{-40,-30},{-25.3333,-30},{-25.3333,20}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pressure.p, hysteresis.u) annotation (Line(
          points={{61,26},{70,26},{70,80},{-150,80},{-150,-20},{-142,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hysteresis.y, switch1.u2) annotation (Line(
          points={{-119,-20},{-102,-20}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(m_flow_off.y, switch1.u1) annotation (Line(
          points={{-119,20},{-119,5},{-102,5},{-102,-12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(m_flow_on.y, switch1.u3) annotation (Line(
          points={{-119,-50},{-110,-50},{-110,-28},{-102,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.y, massFlowRate.m_flow_in) annotation (Line(
          points={{-79,-20},{-70,-20},{-70,-22},{-60,-22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(upperTank.ports[2], pipe.port_a) annotation (Line(
          points={{-20,20},{-20,10},{0,10},{0,-20}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pipe.port_a, pressure.port) annotation (Line(
          points={{0,-20},{0,10},{50,10},{50,16}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pipe.port_b, lowerTank.ports[1]) annotation (Line(
          points={{0,-40},{0,-70},{56,-70},{56,-60}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(upperTank.ports[3], overflow.port_a) annotation (Line(
          points={{-14.6667,20},{0,20},{0,40},{20,40},{20,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(overflow.port_b, lowerTank.ports[2]) annotation (Line(
          points={{20,-20},{20,-40},{40,-40},{40,-60},{64,-60}},
          color={0,127,255},
          smooth=Smooth.None));

      annotation (experiment(StopTime=25000, Interval=5.0),
        __Dymola_Commands(file=
              "modelica://Modelica/Resources/Scripts/Dymola/Fluid/TanksWithOverflow/plot level and port.m_flow.mos"
            "plot level and port.m_flow"),
        Documentation(info="<html>
<p align=justify>The mass flow rate to the upper tank is controlled by the static pressure at its bottom.
The fluid flows through a pipe and forced by different heights from the upper tank to the lower tank.
</p>
<p>
Additional fluid flows through an overflow pipe if the level of the upper tank exceeds 10m.
Initially the overflow enters the lower tank above its fluid level; later on the fluid level exceeds the overflow port.
</p>
<p>
Note that the number of solver intervals has been increased, accounting for the long simulation time horizon.
Otherwise the simulation may fail due to too large steps subject to events. Alternatively the
simulation accuracy could be increased in order to avoid errors.
</p>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/TanksWithOverflow.png\" border=\"1\"
     alt=\"TanksWithOverflow.png\">
</html>"),
        Diagram(coordinateSystem(extent={{-160,-120},{100,100}})));
    end TanksWithOverflow;

    model EmptyTanks "Show the treatment of empty tanks"
      extends Modelica_Icons.Example;
      Modelica_Fluid.Vessels.OpenTank tank1(
        redeclare package Medium =
            Modelica_Media.Water.ConstantPropertyLiquidWater,
        nPorts=1,
        crossArea=1,
        level_start=1,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                       diameter=0.1)},
        height=1.1) annotation (Placement(transformation(extent={{-40,20},{0,
                60}}, rotation=0)));

      Modelica_Fluid.Pipes.StaticPipe pipe(
        redeclare package Medium =
            Modelica_Media.Water.ConstantPropertyLiquidWater,
        length=1,
        diameter=0.1,
        height_ab=-1) annotation (Placement(transformation(
            origin={-20,-20},
            extent={{-10,-10},{10,10}},
            rotation=270)));

      Modelica_Fluid.Vessels.OpenTank tank2(
        crossArea=1,
        redeclare package Medium =
            Modelica_Media.Water.ConstantPropertyLiquidWater,
        nPorts=1,
        height=1.1,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                       diameter=0.1, height=
            0.5)},
        level_start=1.0e-10) annotation (Placement(transformation(extent={{0,
                -80},{40,-40}}, rotation=0)));
      inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
        annotation (Placement(transformation(extent={{60,60},{80,80}},
              rotation=0)));
    equation
      connect(tank1.ports[1], pipe.port_a) annotation (Line(
          points={{-20,20},{-20,5},{-20,-10},{-20,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pipe.port_b, tank2.ports[1]) annotation (Line(
          points={{-20,-30},{-20,-60},{0,-60},{0,-80},{20,-80}},
          color={0,127,255},
          smooth=Smooth.None));

      annotation (
        experiment(StopTime=50),
        __Dymola_Commands(file="modelica://Modelica/Resources/Scripts/Dymola/Fluid/EmptyTanks/plot level and port.p.mos"
            "plot level and port.p"),
        Documentation(info="<html>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/EmptyTanks.png\" border=\"1\"
     alt=\"EmptyTanks.png\">
</html>"));
    end EmptyTanks;

  end Tanks;

  package ControlledTankSystem
    "Tank system with controller, start/stop/shut operation and diagram animation"
    extends Modelica_Icons.ExamplesPackage;

    model ControlledTanks
      "Demonstrating the controller of a tank filling/emptying system"
      extends Modelica_Icons.Example;
      package Medium = Modelica_Media.Water.ConstantPropertyLiquidWater;

      Utilities.TankController tankController(
        waitTime=50,
        maxLevel=0.9*tank1.height,
        minLevel=0.01) annotation (Placement(transformation(extent={{-60,-20},{
                -20,20}}, rotation=0)));
      Utilities.RadioButton start(reset={stop.on,shut.on}, buttonTimeTable={20,
            280}) annotation (Placement(transformation(extent={{-100,20},{-80,
                40}}, rotation=0)));
      Utilities.RadioButton stop(reset={start.on,shut.on}, buttonTimeTable={220,
            650}) annotation (Placement(transformation(extent={{-100,-10},{-80,
                10}}, rotation=0)));
      Utilities.RadioButton shut(reset={start.on,stop.on}, buttonTimeTable={700})
        annotation (Placement(transformation(extent={{-100,-40},{-80,-20}},
              rotation=0)));
      Modelica_Fluid.Valves.ValveDiscrete valve1(
        redeclare package Medium = Medium,
        m_flow_nominal=40,
        dp_nominal=100000) annotation (Placement(transformation(
            origin={-10,70},
            extent={{10,-10},{-10,10}},
            rotation=180)));
      Modelica_Fluid.Vessels.OpenTank tank1(
        level_start=0.05,
        redeclare package Medium = Medium,
        crossArea=6,
        height=4,
        nPorts=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                  diameter=0.2,
                  height=4,
                  zeta_out=0,
                  zeta_in=1),Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                  diameter=0.2,
                  height=0,
                  zeta_out=0,
                  zeta_in=1)}) annotation (Placement(transformation(extent={{
                10,30},{50,70}}, rotation=0)));
      Modelica_Blocks.Sources.RealExpression level1(y=tank1.level)
        annotation (Placement(transformation(extent={{-90,-60},{-55,-40}},
              rotation=0)));
      Modelica_Fluid.Valves.ValveDiscrete valve2(
        redeclare package Medium = Medium,
        dp_nominal(displayUnit="Pa") = 1,
        m_flow_nominal=100) annotation (Placement(transformation(
            origin={34,0},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete valve3(
        redeclare package Medium = Medium,
        dp_nominal(displayUnit="Pa") = 1,
        m_flow_nominal=10) annotation (Placement(transformation(
            origin={35,-80},
            extent={{10,-10},{-10,10}},
            rotation=0)));
      Modelica_Fluid.Vessels.OpenTank tank2(
        level_start=0.05,
        redeclare package Medium = Medium,
        height=5,
        crossArea=6,
        nPorts=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                  diameter=0.2,
                  height=5,
                  zeta_out=0,
                  zeta_in=1),Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                  diameter=0.2,
                  height=0,
                  zeta_out=0,
                  zeta_in=1)}) annotation (Placement(transformation(extent={{
                50,-60},{90,-20}}, rotation=0)));
      Modelica_Fluid.Sources.Boundary_pT ambient1(
        redeclare package Medium = Medium,
        nPorts=1,
        p=system.p_ambient,
        T=system.T_ambient) annotation (Placement(transformation(extent={{-10,
                -90},{10,-70}}, rotation=0)));
      Modelica_Blocks.Sources.RealExpression level2(y=tank2.level)
        annotation (Placement(transformation(extent={{-70,-80},{-33,-60}},
              rotation=0)));
      Modelica_Fluid.Sources.Boundary_pT source(
        redeclare package Medium = Medium,
        p=2.5e6,
        nPorts=1,
        T=system.T_ambient) annotation (Placement(transformation(
            origin={-40,70},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
        annotation (Placement(transformation(extent={{-90,70},{-70,90}},
              rotation=0)));
    equation
      connect(shut.on, tankController.shut) annotation (Line(points={{-79,-30},{
              -72,-30},{-72,-12},{-62,-12}}, color={255,0,255}));
      connect(stop.on, tankController.stop) annotation (Line(points={{-79,0},{-62,
              0}}, color={255,0,255}));
      connect(start.on, tankController.start) annotation (Line(points={{-79,30},{
              -70,30},{-70,12},{-62,12}}, color={255,0,255}));
      connect(tankController.valve1, valve1.open) annotation (Line(points={{-19,12},
              {-10,12},{-10,62}},             color={255,0,255}));
      connect(level1.y, tankController.level1) annotation (Line(points={{-53.25,
              -50},{-52,-50},{-52,-22}}, color={0,0,127}));
      connect(tankController.valve2, valve2.open) annotation (Line(points={{-19,0},
              {-5,0},{26,0}},            color={255,0,255}));
      connect(tankController.valve3, valve3.open) annotation (Line(points={{-19,-12},
              {-10,-12},{-10,-50},{35,-50},{35,-72}},
                                                  color={255,0,255}));
      connect(level2.y, tankController.level2) annotation (Line(points={{-31.15,
              -70},{-28,-70},{-28,-22}}, color={0,0,127}));

      connect(source.ports[1], valve1.port_a) annotation (Line(
          points={{-30,70},{-20,70}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(valve3.port_b, ambient1.ports[1]) annotation (Line(
          points={{25,-80},{10,-80}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(tank2.ports[2], valve3.port_a) annotation (Line(
          points={{74,-60},{74,-80},{45,-80}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(valve2.port_b, tank2.ports[1]) annotation (Line(
          points={{34,-10},{34,-20},{50,-20},{50,-60},{66,-60}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(valve1.port_b, tank1.ports[1]) annotation (Line(
          points={{0,70},{10,70},{10,30},{26,30}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(tank1.ports[2], valve2.port_a) annotation (Line(
          points={{34,30},{34,10}},
          color={0,127,255},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=900),
        Documentation(info="<html>
<p>
With this example, the controller of a tank filling/emptying system
is demonstrated.
</p>

<p>
The basic operation is to fill and empty the two tanks:
</p>
<ol>
<li> Valve 1 is opened and tank 1 is filled.</li>
<li> When tank 1 reaches its fill level limit,
     valve 1 is closed. </li>
<li> After a waiting time, valve 2 is
     opened and the fluid flows from tank 1 into tank 2.</li>
<li> When tank 1 reaches its minimum level, valve 2 is closed. </li>
<li> After a waiting time, valve 3 is opened and
     the fluid flows out of tank 2</li>
<li> When tank 2 reaches its minimum level, valve 3 is closed</li>
</ol>
<p>
The above \"normal\" process can be influenced by three
buttons:
</p>
<ul>
<li> Button <b>start</b> starts the above process.
     When this button is pressed after a \"stop\" or
     \"shut\" operation, the process operation continues.
     </li>
<li> Button <b>stop</b> stops the above process by
     closing all valves. Then, the controller waits for
     further input (either \"start\" or \"shut\" operation).</li>
<li> Button <b>shut</b> is used to shutdown the process,
     by emptying at once both tanks by opening valve 2 and
     valve 3. When this is achieved,
     the process goes back to its start configuration
     where all 3 valves are closed.
     Clicking on \"start\", restarts the process.</li>
</ul>

<p>
The demo-run uses the following button presses:
</p>

<ul>
<li> Button <b>start</b> pressed at 20 s.</li>
<li> Button <b>stop</b> pressed at 220 s </li>
<li> Button <b>start</b> pressed at 280 s </li>
<li> Button <b>stop</b> pressed at 650 s </li>
<li> Button <b>shut</b> pressed at 700 s </li>
<li> Simulate for 900 s</li>
</ul>

<p>
This example is based on
</p>

<dl>
<dt>Dressler I. (2004):</dt>
<dd> <b>Code Generation From JGrafchart to Modelica</b>.
     Master thesis, supervisor: Karl-Erik Arzen,
     Department of Automatic Control, Lund Institute of Technology,
     Lund, Sweden, March 30, 2004<br>&nbsp;</dd>
</dl>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/ControlledTanks.png\" border=\"1\"
     alt=\"ControlledTanks.png\">
</html>"),
        __Dymola_Commands(file=
              "modelica://Modelica/Resources/Scripts/Dymola/Fluid/ControlledTanks/plot level and ports.m_flow.mos"
            "plot level and ports.m_flow"));
    end ControlledTanks;

    package Utilities
      extends Modelica_Icons.UtilitiesPackage;

      model TankController "Controller for tank system"
            extends Modelica_StateGraph.Interfaces.PartialStateGraphIcon;
        parameter Modelica_SIunits.Height maxLevel "Fill level of tank 1";
        parameter Modelica_SIunits.Height minLevel
          "Lowest level of tank 1 and 2";
        parameter Modelica_SIunits.Time waitTime
          "Wait time, between operations";

        Modelica_StateGraph.InitialStep s1(nIn=2) annotation (Placement(
              transformation(extent={{-72,30},{-52,50}}, rotation=0)));
        NormalOperation normal(
          maxLevel=maxLevel,
          minLevel=minLevel,
          waitTime=waitTime) annotation (Placement(transformation(extent={{-20,
                  20},{20,60}}, rotation=0)));
        Modelica_StateGraph.Transition T1(condition=start) annotation (
            Placement(transformation(extent={{-50,50},{-30,30}}, rotation=0)));
        Modelica_StateGraph.Transition T2(condition=level2 < minLevel)
          annotation (Placement(transformation(extent={{27,50},{47,30}},
                rotation=0)));
        Modelica_StateGraph.Transition T3(condition=stop) annotation (
            Placement(transformation(
              origin={-23,-1},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_StateGraph.Step s2(nOut=2) annotation (Placement(
              transformation(extent={{-50,-60},{-30,-40}}, rotation=0)));
        Modelica_StateGraph.Transition T4(condition=start) annotation (
            Placement(transformation(
              origin={10,0},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_StateGraph.Transition T5(condition=shut) annotation (
            Placement(transformation(extent={{-6,-60},{14,-40}}, rotation=0)));
        Modelica_StateGraph.Step emptyTanks annotation (Placement(
              transformation(extent={{20,-60},{40,-40}}, rotation=0)));
        Modelica_StateGraph.Transition T6(condition=level1 < minLevel and
              level2 < minLevel) annotation (Placement(transformation(extent=
                  {{45,-60},{65,-40}}, rotation=0)));
        Modelica_Blocks.Interfaces.BooleanInput start
          annotation (Placement(transformation(extent={{-120,50},{-100,70}},
                rotation=0)));
        Modelica_Blocks.Interfaces.BooleanInput stop
          annotation (Placement(transformation(extent={{-120,-10},{-100,10}},
                rotation=0)));
        Modelica_Blocks.Interfaces.BooleanInput shut
          annotation (Placement(transformation(extent={{-120,-70},{-100,-50}},
                rotation=0)));
        Modelica_Blocks.Interfaces.RealInput level1
          annotation (Placement(transformation(
              origin={-60,-110},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Blocks.Interfaces.RealInput level2
          annotation (Placement(transformation(
              origin={60,-110},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Blocks.Interfaces.BooleanOutput valve1
          annotation (Placement(transformation(extent={{100,55},{110,65}},
                rotation=0)));
        Modelica_Blocks.Interfaces.BooleanOutput valve2
          annotation (Placement(transformation(extent={{100,-5},{110,5}},
                rotation=0)));
        Modelica_Blocks.Interfaces.BooleanOutput valve3
          annotation (Placement(transformation(extent={{100,-65},{110,-55}},
                rotation=0)));
        Modelica_Blocks.Sources.BooleanExpression setValve1(y=normal.fillTank1.
              active)
          annotation (Placement(transformation(extent={{20,73},{80,92}}, rotation=
                 0)));
        Modelica_Blocks.Sources.BooleanExpression setValve2(y=normal.fillTank2.
              active or emptyTanks.active and level1 > minLevel)
          annotation (Placement(transformation(extent={{-40,-85},{80,-64}},
                rotation=0)));
        Modelica_Blocks.Sources.BooleanExpression setValve3(y=normal.emptyTank2.
              active or emptyTanks.active and level2 > minLevel)
          annotation (Placement(transformation(extent={{-40,-103},{80,-83}},
                rotation=0)));
        inner Modelica_StateGraph.StateGraphRoot stateGraphRoot
          annotation (Placement(transformation(extent={{-94,74},{-74,94}})));
      equation

        connect(s1.outPort[1], T1.inPort)
                                       annotation (Line(points={{-51.5,40},{-44,
                40}}, color={0,0,0}));
        connect(T1.outPort, normal.inPort)      annotation (Line(points={{-38.5,
                40},{-21.3333,40}}, color={0,0,0}));
        connect(normal.outPort, T2.inPort)      annotation (Line(points={{20.6667,
                40},{33,40}}, color={0,0,0}));
        connect(T5.outPort, emptyTanks.inPort[1])
                                               annotation (Line(points={{5.5,-50},
                {19,-50}}, color={0,0,0}));
        connect(emptyTanks.outPort[1], T6.inPort)
                                               annotation (Line(points={{40.5,-50},
                {51,-50}}, color={0,0,0}));
        connect(setValve1.y, valve1)
          annotation (Line(points={{83,82.5},{90,82.5},{90,60},{105,60}}, color={
                255,0,255}));
        connect(setValve2.y, valve2)
          annotation (Line(points={{86,-74.5},{90,-74.5},{90,0},{105,0}}, color={
                255,0,255}));
        connect(setValve3.y, valve3) annotation (Line(points={{86,-93},{95,-93},{
                95,-60},{105,-60}}, color={255,0,255}));
        connect(normal.suspend[1], T3.inPort)   annotation (Line(points={{-10,
                19.3333},{-10,12},{-23,12},{-23,3}}, color={0,0,0}));
        connect(T3.outPort, s2.inPort[1])
                                       annotation (Line(points={{-23,-2.5},{-23,
                -20},{-60,-20},{-60,-50},{-51,-50}}, color={0,0,0}));
        connect(level1, normal.level1)      annotation (Line(points={{-60,-110},{
                -60,-80},{-80,-80},{-80,20},{-30,20},{-30,24},{-22.6667,24}},
              color={0,0,255}));
        connect(s2.outPort[1], T5.inPort) annotation (Line(points={{-29.5,-49.75},
                {-30,-49.75},{-30,-50},{0,-50}}, color={0,0,0}));
        connect(s2.outPort[2], T4.inPort) annotation (Line(points={{-29.5,-50.25},
                {-29,-50},{-8,-50},{-8,-25},{10,-25},{10,-4}}, color={0,0,0}));
        connect(T2.outPort, s1.inPort[1]) annotation (Line(points={{38.5,40},{70,
                40},{70,70},{-80,70},{-80,40},{-73,40},{-73,40.5}}, color={0,0,0}));
        connect(T6.outPort, s1.inPort[2]) annotation (Line(points={{56.5,-50},{70,
                -50},{70,70},{-80,70},{-80,40},{-74,40},{-73,39.5}}, color={0,0,0}));
        connect(T4.outPort, normal.resume[1])      annotation (Line(points={{10,1.5},
                {10,10},{10.5,10},{10.5,18.6667},{10,18.6667}},      color={0,0,0}));
        annotation (
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,0})}),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics={
              Text(
                extent={{-100,68},{-12,54}},
                lineColor={0,0,0},
                textString="start"),
              Text(
                extent={{-99,6},{-14,-9}},
                lineColor={0,0,0},
                textString="stop"),
              Text(
                extent={{-99,-54},{-14,-69}},
                lineColor={0,0,0},
                textString="shut"),
              Text(
                extent={{-94,-82},{-9,-96}},
                lineColor={0,0,0},
                textString="level1"),
              Text(
                extent={{11,-83},{96,-98}},
                lineColor={0,0,0},
                textString="level2"),
              Text(
                extent={{10,68},{99,54}},
                lineColor={0,0,0},
                textString="valve1"),
              Text(
                extent={{7,10},{101,-5}},
                lineColor={0,0,0},
                textString="valve2"),
              Text(
                extent={{2,-51},{102,-67}},
                lineColor={0,0,0},
                textString="valve3")}));
      end TankController;

      model NormalOperation
        "Normal operation of tank system (button start pressed)"
            extends Modelica_StateGraph.PartialCompositeStep;
        parameter Modelica_SIunits.Height maxLevel "Fill level of tank 1";
        parameter Modelica_SIunits.Height minLevel
          "Lowest level of tank 1 and 2";
        parameter Modelica_SIunits.Time waitTime "Wait time between operations";

        Modelica_Blocks.Interfaces.RealInput level1
          annotation (Placement(transformation(extent={{-190,-140},{-150,-100}},
                rotation=0)));
        Modelica_StateGraph.Step fillTank1 annotation (Placement(
              transformation(extent={{-140,-10},{-120,10}}, rotation=0)));
        Modelica_StateGraph.Transition T1(condition=level1 > maxLevel)
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0)));
        Modelica_StateGraph.Step fillTank2 annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=0)));
        Modelica_StateGraph.Transition T3(condition=level1 < minLevel)
          annotation (Placement(transformation(extent={{20,-10},{40,10}},
                rotation=0)));
        Modelica_StateGraph.Step emptyTank2 annotation (Placement(
              transformation(extent={{120,-10},{140,10}}, rotation=0)));
        Modelica_StateGraph.Step wait1 annotation (Placement(transformation(
                extent={{-80,-10},{-60,10}}, rotation=0)));
        Modelica_StateGraph.Transition T2(enableTimer=true, waitTime=waitTime)
          annotation (Placement(transformation(extent={{-50,-10},{-30,10}},
                rotation=0)));
        Modelica_StateGraph.Step wait2 annotation (Placement(transformation(
                extent={{54,-10},{74,10}}, rotation=0)));
        Modelica_StateGraph.Transition T4(enableTimer=true, waitTime=waitTime)
          annotation (Placement(transformation(extent={{82,-10},{102,10}},
                rotation=0)));
      equation
        connect(fillTank1.inPort[1], inPort)
                                          annotation (Line(points={{-141,0},{-160,
                0}}, color={0,0,0}));
        connect(fillTank1.outPort[1], T1.inPort)
                                              annotation (Line(points={{-119.5,0},
                {-104,0}}, color={0,0,0}));
        connect(fillTank2.outPort[1], T3.inPort)
                                              annotation (Line(points={{10.5,0},{
                26,0}}, color={0,0,0}));
        connect(emptyTank2.outPort[1], outPort)
                                             annotation (Line(points={{140.5,0},{
                155,0}}, color={0,0,0}));
        connect(wait1.outPort[1], T2.inPort)
                                          annotation (Line(points={{-59.5,0},{-44,
                0}}, color={0,0,0}));
        connect(T2.outPort, fillTank2.inPort[1])
                                              annotation (Line(points={{-38.5,0},
                {-11,0}}, color={0,0,0}));
        connect(T1.outPort, wait1.inPort[1])
                                          annotation (Line(points={{-98.5,0},{-81,
                0}}, color={0,0,0}));
        connect(wait2.outPort[1], T4.inPort)
                                          annotation (Line(points={{74.5,0},{88,0}},
              color={0,0,0}));
        connect(T3.outPort, wait2.inPort[1])
          annotation (Line(points={{31.5,0},{53,0}}, color={0,0,0}));
        connect(T4.outPort,emptyTank2.inPort[1])
                                               annotation (Line(points={{93.5,0},
                {119,0}}, color={0,0,0}));
      end NormalOperation;

      block RadioButton
        "Button that sets its output to true when pressed and is reset when an element of 'reset' becomes true"

        parameter Modelica_SIunits.Time buttonTimeTable[:]
          "Time instants where button is pressed";
        input Boolean reset[:]={false}
          "Reset button to false, if an element of reset becomes true"
          annotation (Dialog(group="Time varying expressions"));

        Modelica_Blocks.Interfaces.BooleanOutput on
          annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));
      protected
        Modelica_Blocks.Sources.BooleanTable table(table=buttonTimeTable);
      initial equation
        pre(reset) = fill(false, size(reset, 1));
      algorithm
        when pre(reset) then
           on := false;
        end when;

        when change(table.y) then
           on := true;
        end when;
        annotation (Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}),
            graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                fillColor=DynamicSelect({192,192,192}, if on > 0.5 then {0,255,0} else
                          {192,192,192}),
                fillPattern=DynamicSelect(FillPattern.Solid, if on > 0.5 then
                    FillPattern.Solid else FillPattern.Solid),
                lineColor={128,128,128},
                lineThickness=0.5), Text(
                extent={{-80,-40},{80,40}},
                lineColor={0,0,0},
                textString="%name")},
                                interaction={OnMouseDownSetBoolean(
                                on, true)}));
      end RadioButton;
    end Utilities;
  end ControlledTankSystem;

  package AST_BatchPlant
    "Model of the experimental batch plant at Process Control Laboratory at University of Dortmund (Prof. Engell)"
    extends Modelica_Icons.ExamplesPackage;

    model BatchPlant_StandardWater
        extends Modelica_Icons.Example;
      replaceable package BatchMedium = Modelica_Media.Water.StandardWater constrainedby
        Modelica_Media.Interfaces.PartialTwoPhaseMedium "Component media";

    /*
  replaceable package BatchMedium =Modelica_Media.Electrolytes.WaterNaCl extends
    Modelica_Media.Interfaces.PartialTwoPhaseMedium "Component media";
*/

      parameter Modelica_SIunits.Length pipeDiameter = 0.01;

      BaseClasses.TankWith3InletOutletArraysWithEvaporatorCondensor B5(
        redeclare package Medium = BatchMedium,
        height=0.5,
        n_SidePorts=1,
        V0=0.001,
        n_BottomPorts=1,
        bottom_pipeArea={0.0001},
        top_pipeArea={0.0001},
        n_TopPorts=1,
        min_level_for_heating=0.0001,
        level_start=0.0009,
        crossArea=0.05,
        initType=BaseClasses.Init.InitialValues,
        side_pipeArea={0.0001},
        redeclare model HeatTransfer =
            Modelica_Fluid.Vessels.BaseClasses.HeatTransfer.IdealHeatTransfer (   k=
                4.9))
        annotation (Placement(transformation(extent={{-110,-60},{-30,-20}},
              rotation=0)));
      Modelica_Fluid.Valves.ValveDiscrete V12(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={-90,2},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V15(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={-90,-82},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow HeatB5
        annotation (Placement(transformation(extent={{-150,-50},{-130,-30}},
              rotation=0)));
      Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow CoolingB7
        annotation (Placement(transformation(extent={{-150,-130},{-130,-110}},
              rotation=0)));
      Modelica_Thermal_HeatTransfer.Sources.PrescribedHeatFlow CoolingB6
        annotation (Placement(transformation(
            origin={110,-60},
            extent={{-10,-10},{10,10}},
            rotation=180)));

      BaseClasses.Controller controller(Transition3(enableTimer=true, waitTime=
              60), Transition7(
          condition=true,
          enableTimer=true,
          waitTime=300)) annotation (Placement(transformation(extent={{60,38},{
                100,78}}, rotation=0)));

      Modelica_Fluid.Valves.ValveDiscrete V11(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(extent={{-50,80},
                {-70,100}}, rotation=0)));
      Modelica_Fluid.Valves.ValveDiscrete V8(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={-90,160},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V9(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={70,160},
            extent={{10,10},{-10,-10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V2(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(extent={{-60,230},
                {-40,250}}, rotation=0)));
      Modelica_Fluid.Valves.ValveDiscrete V4(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(extent={{40,230},
                {20,250}}, rotation=0)));
      Modelica_Fluid.Valves.ValveDiscrete V3(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(extent={{-150,
                210},{-130,230}}, rotation=0)));
      Modelica_Fluid.Fittings.TeeJunctionIdeal volume2(redeclare package Medium
          = BatchMedium) annotation (Placement(transformation(
            origin={-180,220},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V6(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(extent={{130,210},
                {110,230}}, rotation=0)));
      Modelica_Fluid.Fittings.TeeJunctionIdeal volume8(redeclare package Medium
          = BatchMedium) annotation (Placement(transformation(
            origin={160,220},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V23(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={-110,-250},
            extent={{-10,10},{10,-10}},
            rotation=180)));
      Modelica_Fluid.Valves.ValveDiscrete V1(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={-180,110},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V22(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={-180,-170},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V5(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={160,110},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Fluid.Valves.ValveDiscrete V24(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={90,-250},
            extent={{10,10},{-10,-10}},
            rotation=180)));
      Modelica_Fluid.Valves.ValveDiscrete V25(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={160,-170},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Fluid.Valves.ValveDiscrete V20(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={60,-210},
            extent={{10,10},{-10,-10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V19(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={10,-200},
            extent={{-10,10},{10,-10}},
            rotation=180)));
      Modelica_Fluid.Valves.ValveDiscrete V10(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={-21,-170},
            extent={{10,10},{-10,-10}},
            rotation=90)));
      Modelica_Fluid.Valves.ValveDiscrete V21(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={30,-250},
            extent={{10,10},{-10,-10}},
            rotation=180)));
      Modelica_Fluid.Fittings.TeeJunctionVolume volume5(redeclare package
          Medium = BatchMedium, V=0.001) annotation (Placement(transformation(
              extent={{50,-260},{70,-240}}, rotation=0)));
      Modelica_Fluid.Valves.ValveDiscrete V18(
        redeclare package Medium = BatchMedium,
        m_flow_nominal=1,
        dp_nominal=100) annotation (Placement(transformation(
            origin={-50,-200},
            extent={{10,10},{-10,-10}},
            rotation=180)));
      Modelica_Fluid.Machines.PrescribedPump P1(
        redeclare package Medium = BatchMedium,
        m_flow_start=0.1,
        N_nominal=200,
        use_N_in=true,
        redeclare model Monitoring =
            Modelica_Fluid.Machines.BaseClasses.PumpMonitoring.PumpMonitoringNPSH,
        V(displayUnit="ml") = 0.0001,
        energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        redeclare function flowCharacteristic =
            Modelica_Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow
            (V_flow_nominal={0,0.1e-3,0.15e-3}, head_nominal={10,5,0}),
        p_a_start=100000,
        p_b_start=100000) annotation (Placement(transformation(extent={{-140,-260},
                {-160,-240}}, rotation=0)));

      Modelica_Fluid.Machines.PrescribedPump P2(
        redeclare package Medium = BatchMedium,
        m_flow_start=0.1,
        N_nominal=200,
        use_N_in=true,
        redeclare model Monitoring =
            Modelica_Fluid.Machines.BaseClasses.PumpMonitoring.PumpMonitoringNPSH,
        V(displayUnit="ml") = 0.0001,
        energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        redeclare function flowCharacteristic =
            Modelica_Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow
            (V_flow_nominal={0,0.1e-3,0.15e-3}, head_nominal={10,5,0}),
        p_a_start=100000,
        p_b_start=100000) annotation (Placement(transformation(extent={{120,-260},
                {140,-240}}, rotation=0)));

      BaseClasses.TankWithTopPorts B1(
        level_start=0.2,
        redeclare package Medium = BatchMedium,
        height=0.5,
        crossArea=0.05,
        V0=0.0001,
        nTopPorts=1,
        nPorts=1,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
            0.011, height=0)},
        stiffCharacteristicForEmptyPort=false) annotation (Placement(
            transformation(extent={{-110,180},{-70,220}}, rotation=0)));
      inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
        annotation (Placement(transformation(extent={{180,250},{200,270}},
              rotation=0)));
      Modelica_Blocks.Logical.TriggeredTrapezoid P1_on(               rising=0,
          amplitude=200)
        annotation (Placement(transformation(extent={{-122,-230},{-142,-210}},
              rotation=0)));
      Modelica_Blocks.Logical.TriggeredTrapezoid P2_on(              rising=0,
          amplitude=200)
        annotation (Placement(transformation(extent={{100,-230},{120,-210}},
              rotation=0)));
      BaseClasses.TankWithTopPorts B2(
        level_start=0.2,
        redeclare package Medium = BatchMedium,
        height=0.5,
        crossArea=0.05,
        V0=0.0001,
        nTopPorts=1,
        nPorts=1,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
            0.011, height=0)},
        stiffCharacteristicForEmptyPort=false) annotation (Placement(
            transformation(extent={{50,180},{90,220}}, rotation=0)));
      BaseClasses.TankWithTopPorts B3(
        redeclare package Medium = BatchMedium,
        height=0.5,
        crossArea=0.05,
        V0=0.0001,
        nTopPorts=2,
        nPorts=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
            0.011, height=0),Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
            diameter=0.011, height=0)},
        level_start=0.02,
        stiffCharacteristicForEmptyPort=false) annotation (Placement(
            transformation(extent={{-30,100},{10,140}}, rotation=0)));

      BaseClasses.TankWithTopPorts B4(
        redeclare package Medium = BatchMedium,
        height=0.5,
        crossArea=0.05,
        V0=0.0001,
        level_start=0.015,
        nTopPorts=1,
        nPorts=1,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
            0.011, height=0)},
        stiffCharacteristicForEmptyPort=false) annotation (Placement(
            transformation(extent={{-110,30},{-70,70}}, rotation=0)));
      BaseClasses.TankWithTopPorts B7(
        redeclare package Medium = BatchMedium,
        V0=0.0001,
        nTopPorts=1,
        nPorts=1,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
            0.011, height=0)},
        level_start=0.009,
        height=0.5,
        crossArea=0.05,
        stiffCharacteristicForEmptyPort=false,
        use_HeatTransfer=true,
        T_start=298,
        redeclare model HeatTransfer =
            Modelica_Fluid.Vessels.BaseClasses.HeatTransfer.IdealHeatTransfer (
              k=4.9)) annotation (Placement(transformation(extent={{-110,-140},
                {-70,-100}}, rotation=0)));
      Modelica_Fluid.Pipes.DynamicPipe pipeB1B2(
        redeclare package Medium = BatchMedium,
        length=1,
        diameter=pipeDiameter,
        height_ab=0) annotation (Placement(transformation(extent={{0,230},{-20,
                250}}, rotation=0)));
      Modelica_Fluid.Pipes.StaticPipe pipeB1B3(
        redeclare package Medium = BatchMedium,
        length=1,
        redeclare model FlowModel =
            Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
        diameter=pipeDiameter,
        height_ab=-0.1) annotation (Placement(transformation(extent={{-70,134},
                {-50,154}}, rotation=0)));
      Modelica_Fluid.Pipes.StaticPipe pipeB2B3(
        redeclare package Medium = BatchMedium,
        length=1,
        redeclare model FlowModel =
            Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
        diameter=pipeDiameter,
        height_ab=-0.1) annotation (Placement(transformation(extent={{50,134},{
                30,154}}, rotation=0)));
      Modelica_Fluid.Pipes.StaticPipe pipeB1B1(
        redeclare package Medium = BatchMedium,
        diameter=pipeDiameter,
        length=1,
        height_ab=-0.5) annotation (Placement(transformation(
            origin={-8,10},
            extent={{10,10},{-10,-10}},
            rotation=90)));
      Modelica_Fluid.Pipes.StaticPipe pipeB6Pump(
        redeclare package Medium = BatchMedium,
        length=0.5,
        diameter=pipeDiameter,
        height_ab=-0.5) annotation (Placement(transformation(
            origin={60,-110},
            extent={{10,10},{-10,-10}},
            rotation=90)));
      Modelica_Fluid.Pipes.StaticPipe pipeB7Pump(
        redeclare package Medium = BatchMedium,
        length=1,
        diameter=pipeDiameter,
        height_ab=-0.1) annotation (Placement(transformation(
            origin={-90,-170},
            extent={{10,10},{-10,-10}},
            rotation=90)));
      Modelica_Fluid.Pipes.DynamicPipe pipePump1B1(
        redeclare package Medium = BatchMedium,
        diameter=pipeDiameter,
        height_ab=3,
        length=3) annotation (Placement(transformation(
            origin={-180,10},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      Modelica_Fluid.Pipes.DynamicPipe pipePump2B2(
        redeclare package Medium = BatchMedium,
        diameter=pipeDiameter,
        height_ab=3,
        length=3) annotation (Placement(transformation(
            origin={160,10},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      BaseClasses.TankWithTopPorts B6(
        redeclare package Medium = BatchMedium,
        V0=0.0001,
        nTopPorts=1,
        height=0.5,
        crossArea=0.05,
        level_start=0.02,
        nPorts=1,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=
            0.011, height=0)},
        stiffCharacteristicForEmptyPort=false,
        use_HeatTransfer=true,
        T_start=298,
        redeclare model HeatTransfer =
            Modelica_Fluid.Vessels.BaseClasses.HeatTransfer.IdealHeatTransfer (
              k=4.9)) annotation (Placement(transformation(extent={{80,-80},{40,
                -40}}, rotation=0)));
      Modelica_Fluid.Fittings.MultiPort multiPort(redeclare package Medium =
            BatchMedium, nPorts_b=3) annotation (Placement(transformation(
            extent={{4,10},{-4,-10}},
            rotation=-90,
            origin={-20,-228})));
      Modelica_Fluid.Fittings.TeeJunctionVolume volume4(redeclare package
          Medium = BatchMedium, V=0.001) annotation (Placement(transformation(
              extent={{-30,-260},{-10,-240}}, rotation=0)));
    equation
      controller.sensors.LIS_301 = B3.level;
      controller.sensors.QI_302 = 0;//B3.medium.X[2];
      controller.sensors.LIS_501 = B5.level;
      controller.sensors.QIS_502 = 0;//B5.medium.X[2];
      controller.sensors.TI_503 = B5.medium.T;
      controller.sensors.LIS_601 = B6.level;
      controller.sensors.TIS_602 = B6.medium.T;
      controller.sensors.LIS_701 = B7.level;
      controller.sensors.TIS_702 = B7.medium.T;

      P1_on.u = controller.actuators.P1;
      P2_on.u = controller.actuators.P2;
      V1.open = controller.actuators.V1;
      V2.open = controller.actuators.V2;
      V3.open = controller.actuators.V3;
      V4.open = controller.actuators.V4;
      V5.open = controller.actuators.V5;
      V6.open = controller.actuators.V6;
      V8.open = controller.actuators.V8;
      V9.open = controller.actuators.V9;
      V10.open = controller.actuators.V10;
      V11.open = controller.actuators.V11;
      V12.open = controller.actuators.V12;
      V15.open = controller.actuators.V15;
      V18.open = controller.actuators.V18;
      V19.open = controller.actuators.V19;
      V20.open = controller.actuators.V20;
      V21.open = controller.actuators.V21;
      V22.open = controller.actuators.V22;
      V23.open = controller.actuators.V23;
      V24.open = controller.actuators.V24;
      V25.open = controller.actuators.V25;
      HeatB5.Q_flow = if controller.actuators.T5_Heater then 20000 else 0;
      CoolingB6.Q_flow = if controller.actuators.T6_Cooling then -2000 else 0;
      CoolingB7.Q_flow = if controller.actuators.T7_Cooling then -2000 else 0;

      connect(V24.port_b, P2.port_a) annotation (Line(points={{100,-250},{120,
              -250}},                 color={0,127,255}));
      connect(V15.port_a, B5.BottomFluidPort[1]) annotation (Line(points={{-90,-72},
              {-90,-60.4}},      color={0,127,255}));
      connect(P1_on.y, P1.N_in) annotation (Line(points={{-143,-220},{-150,-220},
              {-150,-240}},     color={0,0,127}));
      connect(P2_on.y, P2.N_in) annotation (Line(points={{121,-220},{130,-220},{
              130,-240}},      color={0,0,127}));
      connect(B4.ports[1], V12.port_b) annotation (Line(points={{-90,29},{-90,
              21},{-90,21},{-90,12}},
            color={0,127,255}));
      connect(CoolingB7.port, B7.heatPort) annotation (Line(points={{-130,-120},{
              -110,-120}}, color={191,0,0}));
      connect(pipeB1B2.port_a, V4.port_b) annotation (Line(points={{0,240},{20,
              240}}, color={0,127,255}));
      connect(B5.TopFluidPort[1], V12.port_a) annotation (Line(points={{-90,-19.6},
              {-90,-8}}, color={0,0,255}));
      connect(V15.port_b, B7.topPorts[1]) annotation (Line(points={{-90,-92},{
              -90,-96},{-90,-99},{-90,-99}},
                      color={0,127,255}));
      connect(pipePump1B1.port_a, V22.port_b) annotation (Line(points={{-180,0},{
              -180,-160}}, color={0,127,255}));
      connect(V25.port_b, pipePump2B2.port_a) annotation (Line(points={{160,-160},
              {160,0}}, color={0,127,255}));
      connect(B6.topPorts[1], B5.Condensed) annotation (Line(points={{60,-39},{60,
              -28},{-29.6,-28}}, color={0,127,255}));
      connect(CoolingB6.port, B6.heatPort) annotation (Line(points={{100,-60},{80,
              -60}}, color={191,0,0}));
      connect(HeatB5.port, B5.heatPort) annotation (Line(points={{-130,-40},{-110,
              -40}}, color={191,0,0}));
      connect(V1.port_b, volume2.port_1)     annotation (Line(
          points={{-180,120},{-180,210}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume8.port_2, V4.port_a)     annotation (Line(
          points={{160,230},{160,240},{40,240}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume8.port_1, V5.port_b)     annotation (Line(
          points={{160,210},{160,120}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume5.port_1, V21.port_b)     annotation (Line(
          points={{50,-250},{40,-250}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume5.port_2, V24.port_a)     annotation (Line(
          points={{70,-250},{80,-250}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(P2.port_b, V25.port_a) annotation (Line(
          points={{140,-250},{160,-250},{160,-180}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V22.port_a, P1.port_b) annotation (Line(
          points={{-180,-180},{-180,-250},{-160,-250}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V5.port_a, pipePump2B2.port_b) annotation (Line(
          points={{160,100},{160,20}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V1.port_a, pipePump1B1.port_b) annotation (Line(
          points={{-180,100},{-180,20}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(P1.port_a, V23.port_b) annotation (Line(
          points={{-140,-250},{-120,-250}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V23.port_a, volume4.port_1) annotation (Line(
          points={{-100,-250},{-30,-250}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume4.port_2, V21.port_a) annotation (Line(
          points={{-10,-250},{20,-250}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(multiPort.port_a, volume4.port_3) annotation (Line(
          points={{-20,-232},{-20,-240}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(multiPort.ports_b[3], V19.port_b) annotation (Line(
          points={{-17.3333,-224},{-17.3333,-200},{0,-200}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V18.port_b, multiPort.ports_b[1]) annotation (Line(
          points={{-40,-200},{-22.6667,-200},{-22.6667,-224}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V10.port_b, multiPort.ports_b[2]) annotation (Line(
          points={{-21,-180},{-20,-180},{-20,-224}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V11.port_b, B4.topPorts[1]) annotation (Line(
          points={{-70,90},{-90,90},{-90,71}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(B3.ports[1], V11.port_a) annotation (Line(
          points={{-12,99},{-12,90},{-50,90}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V20.port_b, volume5.port_3) annotation (Line(
          points={{60,-220},{60,-240}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V2.port_b, pipeB1B2.port_b) annotation (Line(
          points={{-40,240},{-20,240}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume2.port_2, V2.port_a) annotation (Line(
          points={{-180,230},{-180,240},{-60,240}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume2.port_3, V3.port_a) annotation (Line(
          points={{-170,220},{-150,220}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V3.port_b, B1.topPorts[1]) annotation (Line(
          points={{-130,220},{-120,220},{-120,230},{-90,230},{-90,221}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume8.port_3, V6.port_a) annotation (Line(
          points={{150,220},{130,220}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V6.port_b, B2.topPorts[1]) annotation (Line(
          points={{110,220},{100,220},{100,230},{70,230},{70,221}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(B2.ports[1], V9.port_a) annotation (Line(
          points={{70,179},{70,175},{70,175},{70,170}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V9.port_b, pipeB2B3.port_a) annotation (Line(
          points={{70,150},{70,144},{50,144}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pipeB2B3.port_b, B3.topPorts[2]) annotation (Line(
          points={{30,144},{-8,144},{-8,141},{-8,141}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(B1.ports[1], V8.port_a) annotation (Line(
          points={{-90,179},{-90,175},{-90,175},{-90,170}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V8.port_b, pipeB1B3.port_a) annotation (Line(
          points={{-90,150},{-90,144},{-70,144}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(B3.topPorts[1], pipeB1B3.port_b) annotation (Line(
          points={{-12,141},{-12,141},{-12,144},{-50,144}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(B7.ports[1], pipeB7Pump.port_a) annotation (Line(
          points={{-90,-141},{-90,-150},{-90,-150},{-90,-160}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pipeB7Pump.port_b, V18.port_a) annotation (Line(
          points={{-90,-180},{-90,-200},{-60,-200}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(B6.ports[1], pipeB6Pump.port_a) annotation (Line(
          points={{60,-81},{60,-90},{60,-90},{60,-100}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pipeB6Pump.port_b, V20.port_a) annotation (Line(
          points={{60,-120},{60,-200}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(V19.port_a, pipeB6Pump.port_b) annotation (Line(
          points={{20,-200},{30,-200},{30,-160},{60,-160},{60,-120}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pipeB1B1.port_b, V10.port_a) annotation (Line(
          points={{-8,0},{-8,-80},{-21,-80},{-21,-160}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(B3.ports[2], pipeB1B1.port_a) annotation (Line(
          points={{-8,99},{-8,20},{-8,20}},
          color={0,127,255},
          smooth=Smooth.None));
      annotation (      experiment(StopTime=3600),
        __Dymola_Commands(file=
              "modelica://Modelica/Resources/Scripts/Dymola/Fluid/AST_BatchPlant_StandardWater/plot level.mos"
            "plot level"),
        Documentation(info="<html>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/BatchPlant_StandardWater.png\" border=\"1\"
     alt=\"BatchPlant_StandardWater.png\">
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-200,-280},{200,
                280}})),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}})));
    end BatchPlant_StandardWater;

    package BaseClasses
      extends Modelica_Icons.BasesPackage;

      block setReal "Set output signal to a time varying Real expression"

        Modelica_Blocks.Interfaces.RealInput u "Set value of Real input"
          annotation (                            Dialog(group=
                "Time varying input signal"), Placement(transformation(extent={{
                  -140,-20},{-100,20}}, rotation=0)));

        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,40},{100,-40}},
                lineColor={0,0,0},
                fillColor={235,235,235},
                fillPattern=FillPattern.Solid,
                borderPattern=BorderPattern.Raised),
              Text(
                extent={{-96,15},{96,-15}},
                lineColor={0,0,0},
                textString="%u"),
              Text(extent={{-150,90},{140,50}}, textString="%name")}),
          Documentation(info="<html>

</html>"));

      end setReal;

      model TankWith3InletOutletArraysWithEvaporatorCondensor
        "Tank with Heating and Evaporation"
        import Modelica_Fluid_Examples.AST_BatchPlant.BaseClasses.Init;
        replaceable package Medium = Modelica_Media.Water.WaterIF97_ph
          constrainedby Modelica_Media.Interfaces.PartialTwoPhaseMedium
          "Medium in the component"
          annotation (choicesAllMatching=true);
      // parameter for Tank
        parameter Modelica_SIunits.Area crossArea "Tank area";
        parameter Modelica_SIunits.Area top_pipeArea[n_TopPorts]
          "Area of outlet pipe";
        parameter Modelica_SIunits.Area side_pipeArea[n_SidePorts]
          "Area of outlet pipe";
        parameter Modelica_SIunits.Area bottom_pipeArea[n_BottomPorts]
          "Area of outlet pipe";
        parameter Modelica_SIunits.Height height(min=0) = 10 "Height of Tank";
        parameter Modelica_SIunits.Volume V0=0
          "Volume of the liquid when the level is zero";
        constant Modelica_SIunits.Acceleration g=Modelica_Constants.g_n;
        parameter Real side_heights[n_SidePorts]=zeros(n_SidePorts);
        parameter Real bottom_heights[n_BottomPorts]=zeros(n_BottomPorts);
        parameter Real top_heights[n_TopPorts]=fill(height, n_TopPorts);
        parameter Modelica_SIunits.Height level_start(min=0)
          "Initial tank level" annotation (Dialog(tab="Initialization"));
        parameter Init initType=Init.GuessValues "Initialization option"
          annotation (Dialog(tab="Initialization"));
        parameter Boolean use_T_start=true
          "Use T_start if true, otherwise h_start"                                    annotation(Dialog(tab = "Initialization"), Evaluate = true);
        parameter Medium.Temperature T_start=if use_T_start then 293.15 else
            Medium.temperature_phX(p_ambient, h_start, X_start)
          "Start value of temperature"
          annotation(Dialog(tab = "Initialization", enable = use_T_start));
        parameter Medium.SpecificEnthalpy h_start=if use_T_start then Medium.specificEnthalpy_pTX(
            p_ambient, T_start, X_start[1:Medium.nXi]) else 1e4
          "Start value of specific enthalpy"
          annotation(Dialog(tab = "Initialization", enable = not use_T_start));
        parameter Medium.MassFraction X_start[Medium.nX]=Medium.reference_X
          "Start value of mass fractions m_i/m"
          annotation (Dialog(tab="Initialization", enable=Medium.nXi > 0));
        parameter Medium.AbsolutePressure p_ambient=101325
          "Tank surface pressure";
        parameter Medium.Temperature T_ambient=293.15
          "Tank surface Temperature";
        parameter Integer n_TopPorts=1 "number of Top connectors";
        parameter Integer n_SidePorts=1 "number of side connectors";
        parameter Integer n_BottomPorts=1 "number of bottom connectors";
        Medium.BaseProperties medium(
          preferredMediumStates=true,
          p(start=p_ambient),
          T(start=T_start),
          Xi(start=X_start[1:Medium.nXi]));
        Modelica_SIunits.Height level(
          stateSelect=StateSelect.prefer,
          min=0,
          max=height) "Level height of tank";
        Modelica_SIunits.Volume V(stateSelect=StateSelect.never)
          "Actual tank volume";
        Modelica_SIunits.Energy U "Internal energy of tank volume";
        Real m(quantity=Medium.mediumName, unit="kg") "Mass of tank volume";
        Real mXi[Medium.nXi](quantity=Medium.substanceNames, each unit="kg")
          "Component masses of the independent substances";
      // additional variables
        Real H_flow_BottomPorts[n_BottomPorts];
        Real H_flow_SidePorts[n_SidePorts];
        Real H_flow_TopPorts[n_TopPorts];
        Real m_flow_BottomPorts[n_BottomPorts];
        Real m_flow_SidePorts[n_SidePorts];
        Real m_flow_TopPorts[n_TopPorts];

        Real m_flow_BottomPorts_pos[n_BottomPorts];
        Real m_flow_SidePorts_pos[n_SidePorts];
        Real m_flow_TopPorts_pos[n_TopPorts];
        Real m_flow_pos;
        Medium.MassFlowRate mXi_flow_topPorts[n_TopPorts,Medium.nXi];
        Medium.MassFlowRate mXi_flowBottomPorts[n_BottomPorts,Medium.nXi];
        Medium.MassFlowRate mXi_flow_sidePorts[n_SidePorts,Medium.nXi];

      // Connectors and InnerTanks
        Modelica_Fluid.Interfaces.FluidPort_b BottomFluidPort[n_BottomPorts](
            redeclare package Medium = Medium, m_flow(each start=0))
          annotation (Placement(transformation(
              origin={-100,-102},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Fluid.Interfaces.FluidPort_a TopFluidPort[n_TopPorts](
            redeclare package Medium = Medium, m_flow(each start=0))
          annotation (Placement(transformation(extent={{-110,92},{-90,112}},
                rotation=0)));
        Modelica_Fluid.Interfaces.FluidPort_b SideFluidPort[n_SidePorts](
            redeclare package Medium = Medium, m_flow(each start=0))
          annotation (Placement(transformation(extent={{0,-10},{20,10}},
                rotation=0)));
        InnerTank InnerTankTop[n_TopPorts](
          each h=medium.h,
          each p_ambient=p_ambient,
          each d=medium.d,
          each Xi=medium.Xi,
          aboveLevel={level - top_heights[i] for i in 1:n_TopPorts},
          pipeArea={top_pipeArea[i] for i in 1:n_TopPorts},
          redeclare package Medium = Medium) annotation (Placement(
              transformation(extent={{-140,60},{-120,80}}, rotation=0)));
        InnerTank InnerTankSide[n_SidePorts](
          each h=medium.h,
          each p_ambient=p_ambient,
          each d=medium.d,
          each Xi=medium.Xi,
          aboveLevel={level - side_heights[i] for i in 1:n_SidePorts},
          pipeArea={side_pipeArea[i] for i in 1:n_SidePorts},
          redeclare package Medium = Medium) annotation (Placement(
              transformation(extent={{-20,0},{0,20}}, rotation=0)));
        InnerTank InnerTankBottom[n_BottomPorts](
          each h=medium.h,
          each p_ambient=p_ambient,
          each d=medium.d,
          each Xi=medium.Xi,
          aboveLevel={level - bottom_heights[i] for i in 1:n_BottomPorts},
          pipeArea={bottom_pipeArea[i] for i in 1:n_BottomPorts},
          redeclare package Medium = Medium) annotation (Placement(
              transformation(extent={{-80,-80},{-60,-60}}, rotation=0)));
        Modelica_Fluid.Interfaces.FluidPort_b Condensed(redeclare package
            Medium = Medium) annotation (Placement(transformation(extent={{
                  192,50},{212,70}}, rotation=0)));

        // Heat transfer through boundary
        replaceable model HeatTransfer =
            Modelica_Fluid.Vessels.BaseClasses.HeatTransfer.IdealHeatTransfer
          constrainedby
          Modelica_Fluid.Vessels.BaseClasses.HeatTransfer.PartialVesselHeatTransfer
          "Wall heat transfer"
            annotation (Dialog(tab="Assumptions", group="Heat transfer",enable=use_HeatTransfer),choicesAllMatching=true);
        HeatTransfer heatTransfer(
          redeclare final package Medium = Medium,
          final n=1,
          final states = {medium.state},
          surfaceAreas={crossArea+2*sqrt(crossArea*Modelica_Constants.pi)*level},
          final use_k = true)
            annotation (Placement(transformation(
              extent={{-10,-10},{30,30}},
              rotation=90,
              origin={-50,-10})));
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort
          annotation (Placement(transformation(extent={{-210,-10},{-190,10}})));

      // parameter for Evaporator
        parameter Real min_level_for_heating;

        Medium.SaturationProperties sat
          "State vector to compute saturation properties";
        Medium.SpecificEnthalpy h_v=Medium.dewEnthalpy(sat)
          "specific enthalpy of vapour";
        Medium.SpecificEnthalpy h_l=Medium.bubbleEnthalpy(sat)
          "specific enthalpy of liquid";
        Medium.SpecificEnthalpy h "'is'specific enthalpy of liquid";
        Medium.Density rho_v=Medium.dewDensity(sat) "density in vapour phase";
        Medium.Density rho_l=Medium.bubbleDensity(sat)
          "density in liquid phase";
        Medium.Density rho "'is' density in liquid phase";

      equation
        H_flow_TopPorts   = InnerTankTop.H_flow;
        m_flow_TopPorts   = InnerTankTop.m_flow;
        mXi_flow_topPorts = InnerTankTop.mXi_flow;

        H_flow_SidePorts   = InnerTankSide.H_flow;
        m_flow_SidePorts   = InnerTankSide.m_flow;
        mXi_flow_sidePorts = InnerTankSide.mXi_flow;

        H_flow_BottomPorts  = InnerTankBottom.H_flow;
        m_flow_BottomPorts  = InnerTankBottom.m_flow;
        mXi_flowBottomPorts = InnerTankBottom.mXi_flow;

        for i in 1:n_BottomPorts loop
          m_flow_BottomPorts_pos[i] = (if m_flow_BottomPorts[i] > 0 then
            m_flow_BottomPorts[i] else 0);
        end for;
        for i in 1:n_SidePorts loop
          m_flow_SidePorts_pos[i] = if m_flow_SidePorts[i] > 0 then m_flow_SidePorts[
            i] else 0;
        end for;
        for i in 1:n_TopPorts loop
          m_flow_TopPorts_pos[i] = if m_flow_TopPorts[i] > 0 then m_flow_TopPorts[i] else
                  0;
        end for;
        for i in 1:n_BottomPorts loop
          connect(InnerTankBottom[i].port, BottomFluidPort[i]) annotation (Line(
                points={{-70,-81},{-70,-102},{-100,-102}}, color={0,0,255}));
        end for;
        for i in 1:n_TopPorts loop
          connect(InnerTankTop[i].port, TopFluidPort[i])  annotation (Line(points=
                 {{-130,59},{-92,59},{-92,102},{-100,102}}, color={0,0,255}));
        end for;
        for i in 1:n_SidePorts loop
          connect(InnerTankSide[i].port, SideFluidPort[i])  annotation (Line(
                points={{-10,-1},{24,-1},{24,0},{10,0}}, color={0,0,255}));
        end for;

        medium.p = p_ambient;
      // Mass balance
        der(m) = sum(m_flow_BottomPorts) + sum(m_flow_SidePorts) + sum(
          m_flow_TopPorts) + Condensed.m_flow;
      // Energy balance

        U = m*medium.h - p_ambient*V "Internal energy of fluid";
        m = V*medium.d "Mass of fluid";
        V = crossArea*level + V0 "Volume of fluid";
        mXi = m*medium.Xi "Mass of fluid components";
        sat.psat = medium.p;
        sat.Tsat = Medium.saturationTemperature(medium.p);

        if noEvent(medium.T < sat.Tsat) then
          if Medium.singleState then
            der(U) = sum(H_flow_BottomPorts) + sum(H_flow_SidePorts) + sum(
              H_flow_TopPorts) + Condensed.m_flow*actualStream(Condensed.h_outflow) + heatTransfer.Q_flows[1]
              "Mechanical work is neglected";
          else
            der(U) = sum(H_flow_BottomPorts) + sum(H_flow_SidePorts) + sum(
              H_flow_TopPorts) + Condensed.m_flow*actualStream(Condensed.h_outflow) - p_ambient*der(V) +
              heatTransfer.Q_flows[1];
          end if;
          Condensed.h_outflow = h;
          Condensed.m_flow = 0;
          rho = medium.d;
          h = medium.h;
        else
          if Medium.singleState then
            der(U) = sum(H_flow_BottomPorts) + sum(H_flow_SidePorts) + sum(H_flow_TopPorts)
               + Condensed.m_flow*actualStream(Condensed.h_outflow)
              "Mechanical work is neglected";
          else
            der(U) = sum(H_flow_BottomPorts) + sum(H_flow_SidePorts) + sum(
              H_flow_TopPorts) + Condensed.m_flow*actualStream(Condensed.h_outflow) - p_ambient*der(V);
          end if;
          Condensed.h_outflow = h;
          Condensed.m_flow = -heatTransfer.Q_flows[1]/(h_v - h_l);
          rho = rho_l;//Density = liquid Density
          h = h_l;    //Enthalpy = liquid Enthalpy
          if noEvent(heatPort.Q_flow > 0.0) then
            assert(noEvent(abs(m_flow_pos) <= 0.01), "Attempt to fill tank while evaporating.");
          end if;

        end if;

        m_flow_pos = sum(m_flow_TopPorts_pos) + sum(m_flow_SidePorts_pos) + sum(
          m_flow_BottomPorts_pos);

        for i in 1:Medium.nXi loop
             der(mXi[i]) = sum(mXi_flowBottomPorts[:,i]) +
                           sum(mXi_flow_sidePorts[:,i]) +
                           sum(mXi_flow_topPorts[:,i]);
        end for;

        assert(level < height, "
    Tank is overflowing.
    ");

        assert(not (heatPort.Q_flow > 0.0 and level <= min_level_for_heating), "
    Attempting to heat an empty tank
  ");

      initial equation
        if initType == Init.GuessValues then
          // no initial equations
        elseif initType == Init.InitialValues then
          level = level_start;
          if use_T_start then
            medium.T = T_start;
          else
            medium.h = h_start;
          end if;
          medium.Xi = X_start[1:Medium.nXi];
        elseif initType == Init.SteadyStateHydraulic then
          der(level) = 0;
          if use_T_start then
            medium.T = T_start;
          else
            medium.h = h_start;
          end if;
          medium.Xi = X_start[1:Medium.nXi];
        else
          assert(false, "Unsupported initialization option");
        end if;

      equation
        connect(heatPort, heatTransfer.heatPorts[1]) annotation (Line(
            points={{-200,0},{-87,0},{-87,0},{-74,0}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-100},{
                  200,100}}), graphics={
              Rectangle(
                extent={{-200,100},{0,-100}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.VerticalCylinder),
              Rectangle(
                extent=DynamicSelect({{-200,-100},{0,0}}, {{-200,-100},{0,(-100
                     + 200*level/height)}}),
                lineColor={0,0,0},
                fillColor={85,170,255},
                fillPattern=FillPattern.VerticalCylinder),
              Line(points={{-200,100},{-200,-100},{0,-100},{0,100}}, color={0,0,0}),
              Text(
                extent={{-200,84},{0,48}},
                lineColor={0,0,255},
                textString="%name"),
              Polygon(
                points={{0,100},{200,70},{200,50},{200,50},{0,80},{0,100}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={0,0,255}),
              Polygon(
                points={{20,98},{30,74},{52,84},{66,72},{86,78},{98,66},{118,74},
                    {130,60},{144,70},{152,60},{168,66},{180,54},{196,74},{190,76},
                    {180,64},{170,70},{156,66},{148,76},{132,68},{120,80},{100,74},
                    {88,88},{70,78},{50,92},{32,82},{28,100},{20,98},{20,98}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={170,255,255}),
              Text(
                extent={{-193,30},{-3,10}},
                lineColor={0,0,0},
                textString="level ="),
              Text(
                extent={{-195,-38},{-5,-58}},
                lineColor={0,0,0},
                textString=DynamicSelect("%level_start", String(
                        level,
                        minimumLength=1,
                        significantDigits=2)))}),
          Documentation(info="<HTML>
<p>This tank has the same geometric variables as TankWith3InletOutletArrays plus the feature of a HeatPort and the possibility of evaporation.
(Assumption: The gas is condensed immediately afterwards so that a liquid boiling fluid is created.)</p>
<p>The tank can be initialized with the following options:</p>
<ul>
<li>GuessValues: no explicit initial conditions
<li>InitialValues: initial values of temperature (or specific enthalpy), composition and level are specified
<li>SteadyStateHydraulic: initial values of temperature (or specific enthalpy) and composition are specified; the initial level is determined so that levels and pressure are at steady state.
</ul>
<p>
Full steady state initialization is not supported, because the corresponding initial equations for temperature/enthalpy are undetermined (the flow rate through the port at steady state is zero).
</p>
</HTML>"));
      end TankWith3InletOutletArraysWithEvaporatorCondensor;

      model InnerTank
          replaceable package Medium =
          Modelica_Media.Interfaces.PartialMedium "Medium in the component"
          annotation (choicesAllMatching=true);

          Modelica_Fluid.Interfaces.FluidPort_a port(redeclare package Medium
            = Medium) annotation (Placement(transformation(
              origin={0,-110},
              extent={{-10,-10},{10,10}},
              rotation=90)));
          Boolean m_flow_negative( start = true, fixed = true)
          "true= massflow out of tank";
          constant Modelica_SIunits.Acceleration g=Modelica_Constants.g_n;
          input Real aboveLevel;
          input Real d;
          input Real p_ambient;
          input Real h;
          input Medium.MassFraction Xi[Medium.nXi]
          "Actual mass fractions of fluid in tank"                    annotation(Dialog);
          input Real pipeArea;
          output Real H_flow;
          output Real m_flow;
         output Medium.MassFlowRate mXi_flow[Medium.nXi]
          "= port.mXi_flow (used to transform vector of connectors in vector of Real numbers)";

      equation
      m_flow_negative = (pre(m_flow_negative) and not port.p>p_ambient) or (port.m_flow < -1e-6);

      if noEvent(aboveLevel > 0) then
        port.p = aboveLevel*g*d + p_ambient - smooth(2,noEvent(if noEvent(m_flow < 0) then m_flow^2/(2*d*pipeArea^2) else 0));
      else
       if pre(m_flow_negative) then
          port.m_flow = 0;
        else
          port.p = p_ambient;
        end if;
      end if;

        H_flow = port.m_flow*actualStream(port.h_outflow);
        m_flow = port.m_flow;
        mXi_flow = port.m_flow*actualStream(port.Xi_outflow);
        port.h_outflow = h;
        port.Xi_outflow = Xi;
      end InnerTank;

      model Controller

        ControllerUtilities.Port_Sensors sensors annotation (Placement(
              transformation(extent={{-280,-40},{-200,40}}, rotation=0)));
        ControllerUtilities.Port_Actuators actuators annotation (Placement(
              transformation(extent={{200,-20},{240,20}}, rotation=0)));

        parameter Real w_dilution=0.003;
        parameter Real w_concentrate=0.005;
        parameter Real startTime=1;
        parameter Real T5_batch_level=0.211;

        Modelica_StateGraph.InitialStep InitialStep1 annotation (Placement(
              transformation(extent={{-180,90},{-160,110}}, rotation=0)));
        Modelica_StateGraph.Transition Transition1(enableTimer=true, waitTime=
             startTime) annotation (Placement(transformation(extent={{-150,90},
                  {-130,110}}, rotation=0)));
        Modelica_StateGraph.Step Step1 annotation (Placement(transformation(
                extent={{-120,90},{-100,110}}, rotation=0)));
        Modelica_StateGraph.Transition Transition2(condition=LIS_301 >= 0.13)
          annotation (Placement(transformation(extent={{-90,90},{-70,110}},
                rotation=0)));
        Modelica_StateGraph.Step Step2 annotation (Placement(transformation(
                extent={{-60,90},{-40,110}}, rotation=0)));
        Modelica_StateGraph.Transition Transition3(
          condition=true,
          enableTimer=true,
          waitTime=500) annotation (Placement(transformation(extent={{-30,90},
                  {-10,110}}, rotation=0)));
        Modelica_StateGraph.Step Step3 annotation (Placement(transformation(
                extent={{0,90},{20,110}}, rotation=0)));
        Modelica_StateGraph.Transition Transition4(condition=LIS_301 <= 0.01)
          annotation (Placement(transformation(extent={{30,90},{50,110}},
                rotation=0)));
        Modelica_StateGraph.Step Step4 annotation (Placement(transformation(
                extent={{60,90},{80,110}}, rotation=0)));
        Modelica_StateGraph.Transition Transition5(condition=T5_idle)
          annotation (Placement(transformation(extent={{90,90},{110,110}},
                rotation=0)));
        Modelica_StateGraph.Step Step5 annotation (Placement(transformation(
                extent={{120,90},{140,110}}, rotation=0)));
        Modelica_StateGraph.Transition Transition6(condition=LIS_501 >=
              T5_batch_level) annotation (Placement(transformation(extent={{
                  150,90},{170,110}}, rotation=0)));
        Modelica_StateGraph.Step Step6 annotation (Placement(transformation(
                extent={{-120,30},{-100,50}}, rotation=0)));
        Modelica_StateGraph.Transition Transition7(
          condition=true,
          enableTimer=true,
          waitTime=300) annotation (Placement(transformation(extent={{-90,30},
                  {-70,50}}, rotation=0)));
        Modelica_StateGraph.Parallel Parallel1 annotation (Placement(
              transformation(extent={{-176,-100},{194,0}}, rotation=0)));
        Modelica_StateGraph.Step Step7 annotation (Placement(transformation(
                extent={{-122,-80},{-102,-60}}, rotation=0)));
        Modelica_StateGraph.Step Step8 annotation (Placement(transformation(
                extent={{-62,-80},{-42,-60}}, rotation=0)));
        Modelica_StateGraph.Step Step9 annotation (Placement(transformation(
                extent={{-2,-80},{18,-60}}, rotation=0)));
        Modelica_StateGraph.Step Step10 annotation (Placement(transformation(
                extent={{58,-80},{78,-60}}, rotation=0)));
        Modelica_StateGraph.Step Step11 annotation (Placement(transformation(
                extent={{118,-80},{138,-60}}, rotation=0)));
        Modelica_StateGraph.Step Step12 annotation (Placement(transformation(
                extent={{-62,-40},{-42,-20}}, rotation=0)));
        Modelica_StateGraph.Step Step13 annotation (Placement(transformation(
                extent={{-2,-40},{18,-20}}, rotation=0)));
        Modelica_StateGraph.Step Step14 annotation (Placement(transformation(
                extent={{58,-40},{78,-20}}, rotation=0)));
        Modelica_StateGraph.Transition Transition8(condition=T7_idle)
          annotation (Placement(transformation(extent={{-92,-80},{-72,-60}},
                rotation=0)));
        Modelica_StateGraph.Transition Transition9(condition=LIS_501 <= 0.01)
          annotation (Placement(transformation(extent={{-32,-80},{-12,-60}},
                rotation=0)));
        Modelica_StateGraph.Transition Transition10(condition=TIS_702 <= 298)
          annotation (Placement(transformation(extent={{28,-80},{48,-60}},
                rotation=0)));
        Modelica_StateGraph.Transition Transition11(condition=LIS_701 <= 0.01)
          annotation (Placement(transformation(extent={{88,-80},{108,-60}},
                rotation=0)));
        Modelica_StateGraph.Transition Transition12(condition=TIS_602 <= 298)
          annotation (Placement(transformation(extent={{-32,-40},{-12,-20}},
                rotation=0)));
        Modelica_StateGraph.Transition Transition13(condition=LIS_601 <= 0.01)
          annotation (Placement(transformation(extent={{28,-40},{48,-20}},
                rotation=0)));

        Real LIS_301;
        Real LIS_501;
        Real LIS_601;
        Real LIS_701;
        Real QI_302;
        Real QIS_502;
        Real TIS_602;
        Real TIS_702;
        Boolean T5_idle;
        Boolean T7_idle;
        Modelica_StateGraph.TransitionWithSignal TransitionWithSignal1
          annotation (Placement(transformation(
              origin={-2,-150},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Blocks.Sources.BooleanExpression BooleanExpression1(y=time >
              2500)
          annotation (Placement(transformation(extent={{-104,-148},{-18,-116}},
                rotation=0)));
        inner Modelica_StateGraph.StateGraphRoot stateGraphRoot annotation (
            Placement(transformation(extent={{-180,140},{-160,160}})));
      equation
        LIS_301 = sensors.LIS_301;
        LIS_501 = sensors.LIS_501;
        LIS_601 = sensors.LIS_601;
        LIS_701 = sensors.LIS_701;
        QI_302 = sensors.QI_302;
        QIS_502 = sensors.QIS_502;
        TIS_602 = sensors.TIS_602;
        TIS_702 = sensors.TIS_702;
        T5_idle = not actuators.V12 and not actuators.V15 and not actuators.T5_Heater
           and sensors.LIS_501 < 0.01;
        T7_idle = not actuators.V15 and not actuators.V18 and not actuators.
          T7_Cooling and sensors.LIS_701 < 0.01;

        actuators.P1 = Step10.active;
        actuators.P2 = Step13.active;
        actuators.T5_Heater = Step6.active;
        actuators.T7_Cooling = Step9.active;
        actuators.T6_Cooling = Step12.active;
        actuators.V1 = Step10.active;
        actuators.V2 = false;
        actuators.V3 = Step10.active;
        actuators.V4 = false;
        actuators.V5 = Step13.active;
        actuators.V6 = Step13.active;
        actuators.V8 = Step1.active;
        actuators.V9 = Step2.active;
        actuators.V10 = false;
        actuators.V11 = Step3.active;
        actuators.V12 = Step5.active;
        actuators.V15 = Step8.active;
        actuators.V18 = Step10.active;
        actuators.V19 = false;
        actuators.V20 = Step13.active;
        actuators.V21 = false;
        actuators.V22 = Step10.active;
        actuators.V23 = Step10.active;
        actuators.V25 = Step13.active;
        actuators.V24 = Step13.active;

        connect(InitialStep1.outPort[1], Transition1.inPort) annotation (Line(
              points={{-159.5,100},{-144,100}}, color={0,0,0}));
        connect(Transition1.outPort, Step1.inPort[1]) annotation (Line(points={{
                -138.5,100},{-121,100}}, color={0,0,0}));
        connect(Step1.outPort[1], Transition2.inPort)
          annotation (Line(points={{-99.5,100},{-84,100}}, color={0,0,0}));
        connect(Transition2.outPort, Step2.inPort[1])
          annotation (Line(points={{-78.5,100},{-61,100}}, color={0,0,0}));
        connect(Step2.outPort[1], Transition3.inPort)
          annotation (Line(points={{-39.5,100},{-24,100}}, color={0,0,0}));
        connect(Transition3.outPort, Step3.inPort[1])
          annotation (Line(points={{-18.5,100},{-1,100}}, color={0,0,0}));
        connect(Step3.outPort[1], Transition4.inPort)
          annotation (Line(points={{20.5,100},{36,100}}, color={0,0,0}));
        connect(Transition4.outPort, Step4.inPort[1])
          annotation (Line(points={{41.5,100},{59,100}}, color={0,0,0}));
        connect(Step4.outPort[1], Transition5.inPort)
          annotation (Line(points={{80.5,100},{96,100}}, color={0,0,0}));
        connect(Transition5.outPort, Step5.inPort[1])
          annotation (Line(points={{101.5,100},{119,100}}, color={0,0,0}));
        connect(Step5.outPort[1], Transition6.inPort)
          annotation (Line(points={{140.5,100},{156,100}}, color={0,0,0}));
        connect(Transition6.outPort, Step6.inPort[1]) annotation (Line(points={{
                161.5,100},{184,100},{184,70},{-160,70},{-160,40},{-121,40}},
              color={0,0,0}));
        connect(Step6.outPort[1], Transition7.inPort)
          annotation (Line(points={{-99.5,40},{-84,40}}, color={0,0,0}));
        connect(Step12.inPort[1], Parallel1.split[1]) annotation (Line(points={{
                -63,-30},{-134.375,-30},{-134.375,-25}}, color={0,0,0}));
        connect(Step12.outPort[1], Transition12.inPort)
          annotation (Line(points={{-41.5,-30},{-26,-30}}, color={0,0,0}));
        connect(Transition12.outPort, Step13.inPort[1])
          annotation (Line(points={{-20.5,-30},{-3,-30}}, color={0,0,0}));
        connect(Step13.outPort[1], Transition13.inPort)
          annotation (Line(points={{18.5,-30},{34,-30}}, color={0,0,0}));
        connect(Transition13.outPort, Step14.inPort[1])
          annotation (Line(points={{39.5,-30},{57,-30}}, color={0,0,0}));
        connect(Step14.outPort[1], Parallel1.join[1]) annotation (Line(points={{78.5,
                -30},{152.375,-30},{152.375,-25}},      color={0,0,0}));
        connect(Step7.inPort[1], Parallel1.split[2]) annotation (Line(points={{
                -123,-70},{-138,-70},{-138,-75},{-134.375,-75}}, color={0,0,0}));
        connect(Step7.outPort[1], Transition8.inPort) annotation (Line(points={{
                -101.5,-70},{-86,-70}}, color={0,0,0}));
        connect(Transition8.outPort, Step8.inPort[1])
          annotation (Line(points={{-80.5,-70},{-63,-70}}, color={0,0,0}));
        connect(Step8.outPort[1], Transition9.inPort)
          annotation (Line(points={{-41.5,-70},{-26,-70}}, color={0,0,0}));
        connect(Transition9.outPort, Step9.inPort[1])
          annotation (Line(points={{-20.5,-70},{-3,-70}}, color={0,0,0}));
        connect(Step9.outPort[1], Transition10.inPort)
          annotation (Line(points={{18.5,-70},{34,-70}}, color={0,0,0}));
        connect(Transition10.outPort, Step10.inPort[1])
          annotation (Line(points={{39.5,-70},{57,-70}}, color={0,0,0}));
        connect(Step10.outPort[1], Transition11.inPort)
          annotation (Line(points={{78.5,-70},{94,-70}}, color={0,0,0}));
        connect(Transition11.outPort, Step11.inPort[1])
          annotation (Line(points={{99.5,-70},{117,-70}}, color={0,0,0}));
        connect(Step11.outPort[1], Parallel1.join[2]) annotation (Line(points={{138.5,
                -70},{154,-70},{154,-75},{152.375,-75}},       color={0,0,0}));
        connect(Transition7.outPort, Parallel1.inPort) annotation (Line(points={{
                -78.5,40},{-40,40},{-40,20},{-190,20},{-190,-50},{-181.55,-50}},
              color={0,0,0}));
        connect(TransitionWithSignal1.inPort, Parallel1.outPort) annotation (Line(
              points={{2,-150},{208,-150},{208,-50},{197.7,-50}}, color={0,0,0}));
        connect(TransitionWithSignal1.outPort, InitialStep1.inPort[1]) annotation (Line(
              points={{-3.5,-150},{-194,-150},{-194,100},{-181,100}}, color={0,0,
                0}));
        connect(BooleanExpression1.y, TransitionWithSignal1.condition) annotation (Line(
              points={{-13.7,-132},{-2,-132},{-2,-138}}, color={255,0,255}));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
                  200,200}}), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-288,286},{262,208}},
                lineColor={0,0,255},
                textString="%name"),
              Line(points={{-48,0},{0,0}}, color={0,0,0}),
              Rectangle(extent={{-170,60},{-50,-60}}, lineColor={0,0,0}),
              Line(points={{0,40},{0,-40}}, color={0,0,0}),
              Line(points={{0,0},{26,0}}, color={0,0,0}),
              Polygon(
                points={{26,10},{50,0},{26,-10},{26,10}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(extent={{50,60},{170,-60}}, lineColor={0,0,0}),
              Polygon(
                points={{-24,10},{0,0},{-24,-10},{-24,10}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
              Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-200,-160},{200,160}})));
      end Controller;

      package ControllerUtilities
        extends Modelica_Icons.Package;
        class Adapter_Inference
          Port_IdleTanks idleTanks;
        end Adapter_Inference;

        class Adapter_Superposition
          Port_Actuators actuators;
        end Adapter_Superposition;

        class Block_Recipe_TBD
          parameter Real startTime;
          parameter Real w_dilution=0.003;
          parameter Real w_concentrat=0.005;
          parameter Real T3_batch_level=0.1273;
          parameter Real T5_batch_level=0.211;
          Boolean trig;
          Boolean S0(start=true);
          Boolean S1;
          Boolean S2;
          Boolean S3;
          Boolean S4;
          Boolean S5;
          Boolean S6;
          Boolean S7;
          Boolean S8;
          Boolean S9;
          Boolean S10;
          Boolean S11;
          Boolean S12;
          Boolean S13;
          Boolean S14;
          Boolean tr0;
          Boolean tr1;
          Boolean tr2;
          Boolean tr3;
          Boolean tr4;
          Boolean tr5;
          Boolean tr6;
          Boolean tr7;
          Boolean tr8;
          Boolean tr9;
          Boolean tr10;
          Boolean tr11;
          Boolean tr12;
          Boolean tr13;
          Port_Actuators act annotation (Placement(transformation(extent={{-110,
                    -10},{-90,10}}, rotation=0)));
        end Block_Recipe_TBD;

        class BlockMain
          Boolean trig;

          Port_Actuators actuators annotation (Placement(transformation(extent={{
                    90,-10},{110,10}}, rotation=0)));
          Block_Recipe_TBD Recipe1 annotation (Placement(transformation(extent={{
                    -50,10},{-10,50}}, rotation=0)));
          Block_Recipe_TBD Recipe2 annotation (Placement(transformation(extent={{
                    10,10},{50,50}}, rotation=0)));
          Adapter_Inference Inference annotation (Placement(transformation(extent=
                   {{-50,-50},{-10,-10}}, rotation=0)));
          Adapter_Superposition Superposition annotation (Placement(
                transformation(extent={{10,-50},{50,-10}}, rotation=0)));
        end BlockMain;

        class Buffer_Recipe_TBD
          Port_Actuators act;
          Boolean S0;
          Boolean S1;
          Boolean S2;
          Boolean S3;
          Boolean S4;
          Boolean S5;
          Boolean S6;
          Boolean S7;
          Boolean S8;
          Boolean S9;
          Boolean S10;
          Boolean S11;
          Boolean S12;
          Boolean S13;
          Boolean S14;
        end Buffer_Recipe_TBD;

        class BufferMain
          Buffer_Recipe_TBD Recipe1;
          Buffer_Recipe_TBD Recipe2;
        end BufferMain;

        connector Port_Actuators
          output Boolean P1;
          output Boolean P2;
          output Boolean T5_Heater;
          output Boolean T7_Cooling;
          output Boolean T6_Cooling;
          output Boolean V1;
          output Boolean V2;
          output Boolean V3;
          output Boolean V4;
          output Boolean V5;
          output Boolean V6;
          output Boolean V8;
          output Boolean V9;
          output Boolean V10;
          output Boolean V11;
          output Boolean V12;
          output Boolean V15;
          output Boolean V18;
          output Boolean V19;
          output Boolean V20;
          output Boolean V21;
          output Boolean V22;
          output Boolean V23;
          output Boolean V24;
          output Boolean V25;

          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics={Polygon(
                  points={{-100,100},{100,0},{-100,-100},{-100,100}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
                                                 Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics={Polygon(
                  points={{0,50},{100,0},{0,-50},{0,50}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}));
        end Port_Actuators;

        connector Port_IdleTanks
          Boolean T5_idle;
          Boolean T7_idle;
        end Port_IdleTanks;

        connector Port_Sensors
          input Real LIS_301;
          input Real QI_302;
          input Real LIS_501;
          input Real QIS_502;
          input Real TI_503;
          input Real LIS_601;
          input Real TIS_602;
          input Real LIS_701;
          input Real TIS_702;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics={Polygon(
                  points={{-100,100},{-100,-100},{100,0},{-100,100}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={215,215,215},
                  fillPattern=FillPattern.Solid)}),
                                                 Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics={Polygon(
                  points={{0,50},{0,-50},{100,0},{0,50}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={215,215,215},
                  fillPattern=FillPattern.Solid)}));
        end Port_Sensors;
      end ControllerUtilities;

      type Init = enumeration(
          GuessValues
            "GuessValues -- Guess values (not fixed) for p, T or h, X, C",
          InitialValues "InitialValues -- Initial values for p, T or h, X, C",
          SteadyStateMomentum "SteadyStateMomentum: Steady state momentum",
          SteadyStateHydraulic
            "SteadyStateHydraulic -- Hydraulic steady state (der(p)=0), guess value for p, initial values for T or h, X, C",

          SteadyState
            "SteadyState -- Steady state (guess values for p, T or h, X, C)")
        "Enumeration to define initialization options"
      annotation (Documentation(info="<html>
<p>
Integer type that can have the following values
(to be selected via choices menu):
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.Init.</b></th><th><b>Meaning</b></th></tr>
<tr><td>GuessValues</td>
    <td>GuessValues -- Guess values (not fixed) for p, T or h, X, C</td></tr>

<tr><td>InitialValues</td>
    <td>Initial values for p, T or h, X, C</td></tr>

<tr><td>SteadyStateMomentum</td>
    <td>Steady state momentum</td></tr>

<tr><td>SteadyStateHydraulic</td>
    <td>Hydraulic steady state (der(p)=0), guess value for p,
        initial values for T or h, X, C</td></tr>

<tr><td>SteadyState</td>
    <td>Steady state (guess values for p, T or h, X, C)</td></tr>
</table>
</html>"));

    model TankWithTopPorts
        "Tank with inlet/outlet ports and with inlet ports at the top"

        import Constants = Modelica_Constants;
        import Modelica_Fluid.Fittings.BaseClasses.lossConstant_D_zeta;
        import Modelica_Fluid.Utilities.regRoot2;
        import Modelica_Fluid.Vessels.BaseClasses.VesselPortsData;

        Modelica_SIunits.Height level(stateSelect=StateSelect.prefer, start=
              level_start) "Fluid level in the tank";

      //Tank geometry
        parameter Modelica_SIunits.Height height
          "Maximum level of tank before it overflows";
        parameter Modelica_SIunits.Area crossArea "Area of tank";
        parameter Modelica_SIunits.Volume V0=0
          "Volume of the liquid when level = 0";

      //Ambient
      parameter Medium.AbsolutePressure p_ambient=system.p_ambient
          "Tank surface pressure"
        annotation(Dialog(tab = "Assumptions", group = "Ambient"));
      parameter Medium.Temperature T_ambient=system.T_ambient
          "Tank surface Temperature"
        annotation(Dialog(tab = "Assumptions", group = "Ambient"));

      //Initialization
        parameter Modelica_SIunits.Height level_start(min=0) = 0.5*height
          "Start value of tank level"
          annotation (Dialog(tab="Initialization"));

      //Mass and energy balance
      extends Modelica_Fluid.Interfaces.PartialLumpedVolume(
          final fluidVolume=V,
          final initialize_p=false,
          final p_start=p_ambient);

      //Port definitions
      parameter Integer nTopPorts = 0
          "Number of inlet ports above height (>= 1)"
                                                    annotation(Dialog(connectorSizing=true));

      Modelica_Fluid.Vessels.BaseClasses.VesselFluidPorts_a topPorts[nTopPorts](
           redeclare package Medium = Medium, m_flow(each start=0, each min=0))
          "Inlet ports over height at top of tank (fluid flows only from the port in to the tank)"
          annotation (Placement(transformation(extent={{-20,0},{20,10}}, origin=
                 {0,100})));

      parameter Integer nPorts = 0
          "Number of inlet/outlet ports (on bottom and on the side)"
         annotation(Dialog(connectorSizing=true));
      parameter Modelica_Fluid.Vessels.BaseClasses.VesselPortsData portsData[nPorts]
          "Data of inlet/outlet ports at side and bottom of tank";

      Modelica_Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nPorts](
            redeclare package Medium = Medium, m_flow(each start=0))
          "inlet/outlet ports at bottom or side of tank (fluid flows in to or out of port; a port might be above the fluid level)"
          annotation (Placement(transformation(extent={{-20,0},{20,-10}},
                origin={0,-100})));

      // Heat transfer through boundary
      parameter Boolean use_HeatTransfer = false
          "= true to use the HeatTransfer model"
          annotation (Dialog(tab="Assumptions", group="Heat transfer"));
      replaceable model HeatTransfer =
          Modelica_Fluid.Vessels.BaseClasses.HeatTransfer.IdealHeatTransfer
          constrainedby
          Modelica_Fluid.Vessels.BaseClasses.HeatTransfer.PartialVesselHeatTransfer
          "Wall heat transfer"
          annotation (Dialog(tab="Assumptions", group="Heat transfer",enable=use_HeatTransfer),choicesAllMatching=true);
      HeatTransfer heatTransfer(
        redeclare final package Medium = Medium,
        final n=1,
        final states = {medium.state},
        surfaceAreas={crossArea+2*sqrt(crossArea*Modelica_Constants.pi)*level},
        final use_k = use_HeatTransfer)
          annotation (Placement(transformation(
            extent={{-10,-10},{30,30}},
            rotation=90,
            origin={-50,-10})));
      Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort if use_HeatTransfer
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

      // Advanced
      parameter Real hysteresisFactor(min=0) = 0.1
          "Hysteresis for empty pipe = diameter*hysteresisFactor"
        annotation(Dialog(tab="Advanced", group="Port properties"));
      parameter Boolean stiffCharacteristicForEmptyPort = false
          "=true, if steep pressure loss characteristic for empty pipe port"
        annotation(Dialog(tab="Advanced", group="Port properties"), Evaluate=true);
      parameter Real zetaLarge(min=0) = 1e5
          "Large pressure loss factor if mass flows out of empty pipe port"
        annotation(Dialog(tab="Advanced", group="Port properties", enable=stiffCharacteristicForEmptyPort));
        parameter Modelica_SIunits.MassFlowRate m_flow_small(min=0) = system.m_flow_small
          "Regularization range at zero mass flow rate" annotation (Dialog(
            tab="Advanced",
            group="Port properties",
            enable=stiffCharacteristicForEmptyPort));

      // Tank properties
        Modelica_SIunits.Volume V(stateSelect=StateSelect.never)
          "Actual tank volume";
      Medium.EnthalpyFlowRate H_flow_top[nTopPorts]
          "Enthalpy flow rates from the top ports in to the tank";
      Medium.EnthalpyFlowRate port_b_H_flow_bottom[nPorts]
          "Enthalpy flow rates from the bottom ports in to the tank";
      Medium.MassFlowRate mXi_flow_top[nTopPorts, Medium.nXi]
          "Substance mass flow rates from the top ports into the tank";
      Medium.MassFlowRate port_b_mXi_flow_bottom[nPorts, Medium.nXi]
          "Substance mass flow rates from the bottom ports into the tank";
      Medium.MassFlowRate mC_flow_top[nTopPorts, Medium.nC]
          "Trace substance mass flow rates from the top ports into the tank";
      Medium.MassFlowRate port_b_mC_flow_bottom[nPorts, Medium.nC]
          "Trace substance mass flow rates from the bottom ports into the tank";
      protected
        Modelica_SIunits.Area bottomArea[nPorts];
        Modelica_SIunits.Diameter ports_emptyPipeHysteresis[nPorts];
        Modelica_SIunits.Length levelAbovePort[nPorts]
          "Height of fluid over bottom ports";
        Boolean ports_m_flow_out[nPorts](each start = true, each fixed=true);
        Boolean aboveLevel[nPorts] "= true, if level >= ports[i].height";
        Real zetas_out[nPorts];
        Modelica_Blocks.Interfaces.RealInput portsData_diameter[nPorts] = portsData.diameter if nPorts > 0;
        Modelica_Blocks.Interfaces.RealInput portsData_diameter2[nPorts];
        Modelica_Blocks.Interfaces.RealInput portsData_height[nPorts] = portsData.height if nPorts > 0;
        Modelica_Blocks.Interfaces.RealInput portsData_height2[nPorts];
    equation
      assert(level <= height, "Tank starts to overflow (level = height = " + String(level) + ")");
      assert(m>=0, "Mass in tank is zero");

      // Compute constant data
      connect(portsData_diameter, portsData_diameter2);
      connect(portsData_height,portsData_height2);

      for i in 1:nPorts loop
          bottomArea[i]=Constants.pi*(portsData_diameter2[i]/2)^2;
          ports_emptyPipeHysteresis[i] = portsData_diameter2[i]*hysteresisFactor;
      end for;

      // Only one connection allowed to a port to avoid unwanted ideal mixing
    /*
for i in 1:nTopPorts loop
  assert(cardinality(topPorts[i]) <= 1,"
topPorts[" + String(i) + "] of volume can at most be connected to one component.
If two or more connections are present, ideal mixing takes
place with these connections which is usually not the intention
of the modeller.
");
end for;

for i in 1:nPorts loop
  assert(cardinality(ports[i]) <= 1,"
ports[" + String(i) + "] of volume can at most be connected to one component.
If two or more connections are present, ideal mixing takes
place with these connections which is usually not the intention
of the modeller.
");
end for;
*/

      // Total quantities
      medium.p = p_ambient;
      V = crossArea*level + V0 "Volume of fluid";

      // Mass balances
      mb_flow = sum(topPorts.m_flow) + sum(ports.m_flow);
      for i in 1:Medium.nXi loop
        mbXi_flow[i] = sum(mXi_flow_top[:,i]) + sum(port_b_mXi_flow_bottom[:,i]);
      end for;
      for i in 1:Medium.nC loop
        mbC_flow[i]  = sum(mC_flow_top[:,i])  + sum(port_b_mC_flow_bottom[:,i]);
      end for;

      // Energy balance
      Hb_flow = sum(H_flow_top) + sum(port_b_H_flow_bottom);
      Qb_flow = heatTransfer.Q_flows[1];
        if Medium.singleState or energyDynamics == Modelica_Fluid.Types.Dynamics.SteadyState then
        Wb_flow = 0
            "Mechanical work is neglected, since also neglected in medium model (otherwise unphysical small temperature change, if tank level changes)";
      else
        Wb_flow = -p_ambient*der(V);
      end if;

      // Properties at top ports
        for i in 1:nTopPorts loop
           // It is assumed that fluid flows only from one of the top ports in to the tank and never vice versa
           H_flow_top[i]     = topPorts[i].m_flow*actualStream(topPorts[i].h_outflow);
           mXi_flow_top[i,:] = topPorts[i].m_flow*actualStream(topPorts[i].Xi_outflow);
           mC_flow_top[i,:]  = topPorts[i].m_flow*actualStream(topPorts[i].C_outflow);
           topPorts[i].p     = p_ambient;
           topPorts[i].h_outflow = h_start;
           topPorts[i].Xi_outflow = X_start[1:Medium.nXi];
           topPorts[i].C_outflow  = C_start;
    /*
       assert(topPorts[i].m_flow > -1, "Mass flows out of tank via topPorts[" + String(i) + "]\n" +
                                         "This indicates a wrong model");
*/
        end for;

      // Properties at bottom ports
        for i in 1:nPorts loop
           port_b_H_flow_bottom[i]   = ports[i].m_flow*actualStream(ports[i].h_outflow);
           port_b_mXi_flow_bottom[i,:] = ports[i].m_flow*actualStream(ports[i].Xi_outflow);
           port_b_mC_flow_bottom[i,:]  = ports[i].m_flow*actualStream(ports[i].C_outflow);
           aboveLevel[i] = level >= (portsData_height2[i] + ports_emptyPipeHysteresis[i])
                           or pre(aboveLevel[i]) and level >= (portsData_height2[i] - ports_emptyPipeHysteresis[i]);
           levelAbovePort[i] = if aboveLevel[i] then level - portsData_height2[i] else 0;
           ports[i].h_outflow = medium.h;
           ports[i].Xi_outflow = medium.Xi;
           ports[i].C_outflow  = C;

           if stiffCharacteristicForEmptyPort then
              // If port is above fluid level, use large zeta if fluid flows out of port (= small mass flow rate)
              zetas_out[i] = 1 + (if aboveLevel[i] then 0 else zetaLarge);
            ports[i].p = p_ambient + levelAbovePort[i]*system.g*medium.d +
              Modelica_Fluid.Utilities.regSquare2(
                    ports[i].m_flow,
                    m_flow_small,
                    lossConstant_D_zeta(portsData_diameter2[i], 0.01)/medium.d,
                    lossConstant_D_zeta(portsData_diameter2[i], zetas_out[i])
                /medium.d);
              ports_m_flow_out[i] = false;

           else
              // Handling according to Remelhe/Poschlad
              ports_m_flow_out[i] = (pre(ports_m_flow_out[i]) and not ports[i].p>p_ambient)
                                         or ports[i].m_flow < -1e-6;
             if aboveLevel[i] then
                 ports[i].p = p_ambient + levelAbovePort[i]*system.g*medium.d -
                                   smooth(2,noEvent(if ports[i].m_flow < 0 then ports[i].m_flow^2/
                                         (2*medium.d*bottomArea[i]^2) else 0));
             else
                if pre(ports_m_flow_out[i]) then
                   ports[i].m_flow = 0;
                else
                   ports[i].p = p_ambient;
                end if;
             end if;
              zetas_out[i] =0;
           end if;
         end for;

    initial equation
        for i in 1:nPorts loop
           pre(aboveLevel[i]) = level_start >= portsData_height2[i];
        end for;

        if massDynamics == Modelica_Fluid.Types.Dynamics.FixedInitial then
          level = level_start;
        elseif massDynamics == Modelica_Fluid.Types.Dynamics.SteadyStateInitial then
          der(level) = 0;
        end if;

    equation
        connect(heatPort, heatTransfer.heatPorts[1]) annotation (Line(
            points={{-100,0},{-87,0},{-87,0},{-74,0}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (defaultComponentName="tank",
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              initialScale=0.2), graphics={
              Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.VerticalCylinder),
              Rectangle(
                extent=DynamicSelect({{-100,-100},{100,0}}, {{-100,-100},{100,(-100
                     + 200*level/height)}}),
                lineColor={0,0,0},
                fillColor={85,170,255},
                fillPattern=FillPattern.VerticalCylinder),
              Text(
                extent={{-94,90},{95,60}},
                lineColor={0,0,255},
                textString="%name"),
              Text(
                extent={{-95,41},{95,21}},
                lineColor={0,0,0},
                textString="level ="),
              Line(points={{-100,100},{-100,-100},{100,-100},{100,100}}, color={0,
                    0,0}),
              Text(
                extent={{-95,-39},{95,-59}},
                lineColor={0,0,0},
                textString=DynamicSelect("%level_start", String(
                      level,
                      minimumLength=1,
                      significantDigits=2)))}),
          Documentation(info="<HTML>
<p>
Model of a tank that is open to the environment at the fixed pressure
<code>p_ambient</code>.
The tank is filled with a single or multiple-substance liquid,
assumed to have uniform temperature and mass fractions.
</p>

<p>
At the top of the tank over the maximal fill level <b>height</b>
a vector of FluidPorts, called <b>topPorts</b>, is present.
The assumption is made that fluid flows always in to the tank via these
ports (and never back in to the connector).
</p>

<p>
The vector of connectors <b>ports</b> are fluid ports at the bottom
and side of the tank at a definable height. Fluid can flow either out
of or in to this port. The fluid level of the tank may be below
one of these ports. This case is approximated by introducing a
large pressure flow coefficient so that the mass flow rate
through this port is very small in this case.
</p>

<p>
If the tank starts to over flow (i.e., level > height), an
assertion is triggered.
</p>

<p>
When the diagram layer is open in the plot environment, the
level of the tank is dynamically visualized. Note, the speed
of the diagram animation in Dymola can be set via command
<b>animationSpeed</b>(), e.g., animationSpeed(speed = 10)
</p>
</HTML>",     revisions="<html>
<ul>
<li><i>Dec. 12, 2008</i> by Ruediger Franke: replace energy and mass balances with
   common definition in BaseClasses.PartialLumpedVolume</li>
<li><i>Dec. 8, 2008</i> by Michael Wetter (LBNL):<br>
Implemented trace substances and missing equation for outflow of multi substance media at top port.</li>
<li><i>Jul. 29, 2006</i> by Martin Otter (DLR):<br>
   Improved handling of ports that are above the fluid level and
   simpler implementation.</li>

<li><i>Jan. 6, 2006</i> by Katja Poschlad, Manuel Remelhe (AST Uni Dortmund),
   Martin Otter (DLR):<br>
   Implementation based on former tank model but with several improvements
   (top, bottom, side ports; correctly treating kinetic energy for outlet
   and total dissipation for inlet; ports can be above the fluid level).</li>
</ul>
</html>"));
    end TankWithTopPorts;
    end BaseClasses;

    package Test "Test of used tank models"
      extends Modelica_Icons.ExamplesPackage;

      model OneTank
        "Tank with one time-varying top inlet mass flow rate and a bottom outlet into the ambient"
        import Modelica_SIunits.Conversions.from_bar;
        extends Modelica_Icons.Example;

        BaseClasses.TankWithTopPorts tank(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          crossArea=1,
          height=1,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.1, height=0)},
          V0=0.1,
          nTopPorts=1,
          nPorts=1,
          level_start=0) annotation (Placement(transformation(extent={{0,0},{40,
                  40}}, rotation=0)));

        Modelica_Fluid.Sources.MassFlowSource_T flowSource(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          m_flow=20,
          T=system.T_ambient,
          use_m_flow_in=true) annotation (Placement(transformation(extent={{-12,
                  42},{8,62}}, rotation=0)));
        inner Modelica_Fluid.System system annotation (Placement(
              transformation(extent={{70,72},{90,92}}, rotation=0)));
        Modelica_Fluid.Sources.Boundary_pT ambient_fixed(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          p=system.p_ambient,
          T=system.T_ambient) annotation (Placement(transformation(extent={{-14,
                  -50},{6,-30}}, rotation=0)));
        Modelica_Fluid.Pipes.StaticPipe pipe(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          length=1,
          diameter=0.1,
          height_ab=-1) annotation (Placement(transformation(
              origin={20,-18},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Modelica_Blocks.Sources.TimeTable timeTable(table=[0,0; 10,0; 10,40; 20,40;
              20,10; 50,10; 50,0; 60,0; 60,20; 70,20; 80,55; 80,0; 100,0])
          annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
      equation
        connect(flowSource.ports[1], tank.topPorts[1])  annotation (Line(points={{8,52},{
                20,52},{20,41}},        color={0,127,255}));
        connect(tank.ports[1], pipe.port_a) annotation (Line(
            points={{20,-1},{20,-8}},
            color={0,127,255},
            smooth=Smooth.None));
        connect(pipe.port_b, ambient_fixed.ports[1]) annotation (Line(
            points={{20,-28},{20,-40},{6,-40}},
            color={0,127,255},
            smooth=Smooth.None));
        connect(timeTable.y, flowSource.m_flow_in) annotation (Line(
            points={{-39,70},{-24,70},{-24,60},{-12,60}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (experiment(StopTime=100));
      end OneTank;

      model TwoTanks
        import Modelica_SIunits.Conversions.from_bar;
        extends Modelica_Icons.Example;
        parameter Boolean stiffCharacteristicForEmptyPort=true;

        inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
            massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
                                                      annotation (Placement(
              transformation(extent={{40,62},{60,82}}, rotation=0)));
        BaseClasses.TankWithTopPorts tank1(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          stiffCharacteristicForEmptyPort=stiffCharacteristicForEmptyPort,
          crossArea=1,
          height=4,
          level_start=3,
          T_start=Modelica_SIunits.Conversions.from_degC(50),
          nPorts=1,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.1, height=0)}) annotation (Placement(transformation(
                extent={{-80,0},{-40,40}}, rotation=0)));
        BaseClasses.TankWithTopPorts tank2(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          stiffCharacteristicForEmptyPort=stiffCharacteristicForEmptyPort,
          crossArea=1,
          height=4,
          level_start=1,
          T_start=Modelica_SIunits.Conversions.from_degC(100),
          nPorts=1,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.1, height=0)}) annotation (Placement(transformation(
                extent={{0,0},{40,40}}, rotation=0)));
        Modelica_Fluid.Pipes.StaticPipe pipe(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          length=1,
          diameter=0.1) annotation (Placement(transformation(extent={{-30,-30},
                  {-10,-10}}, rotation=0)));
      equation
        connect(tank1.ports[1], pipe.port_a) annotation (Line(points={{-60,-1},{-60,
                -20},{-30,-20}}, color={0,127,255}));
        connect(pipe.port_b, tank2.ports[1]) annotation (Line(points={{-10,-20},{20,
                -20},{20,-1}}, color={0,127,255}));
        annotation (experiment(StopTime=100));
      end TwoTanks;

      model TankWithEmptyingPipe1
        "Demonstrates a tank with one constant top inlet mass flow rate and a bottom outlet into the ambient"
        import Modelica_SIunits.Conversions.from_bar;
        extends Modelica_Icons.Example;

        Modelica_Fluid.Sources.MassFlowSource_T flowSource(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          m_flow=50,
          T=system.T_ambient) annotation (Placement(transformation(extent={{-20,
                  40},{0,60}}, rotation=0)));
        inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
            massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
                                                      annotation (Placement(
              transformation(extent={{-100,60},{-80,80}}, rotation=0)));
        Modelica_Fluid.Sources.Boundary_pT ambient_fixed(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          p=system.p_ambient,
          T=system.T_ambient) annotation (Placement(transformation(extent={{-60,
                  -100},{-40,-80}}, rotation=0)));
        Modelica_Fluid.Valves.ValveDiscrete valveDiscrete(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          dp_nominal(displayUnit="Pa") = 1,
          m_flow_nominal=100) annotation (Placement(transformation(
              origin={-20,-50},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Blocks.Sources.BooleanConstant open(k=false)
          annotation (Placement(transformation(extent={{-60,-60},{-40,-40}},
                rotation=0)));
        BaseClasses.TankWithTopPorts tank1(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          crossArea=1,
          V0=0.1,
          height=2,
          level_start=0.1,
          nPorts=2,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.05, height=0),
              Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1,
              height=1)},
          stiffCharacteristicForEmptyPort=true) annotation (Placement(
              transformation(extent={{-40,-20},{0,20}}, rotation=0)));
        Modelica_Fluid.Pipes.StaticPipe pipe(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          length=1,
          diameter=0.1,
          height_ab=1) annotation (Placement(transformation(
              origin={40,10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
      equation
        connect(ambient_fixed.ports[1], valveDiscrete.port_a) annotation (Line(points={
                {-40,-90},{-20,-90},{-20,-60}}, color={0,127,255}));
        connect(open.y, valveDiscrete.open) annotation (Line(points={{-39,-50},{-28,
                -50}}, color={255,0,255}));
        connect(flowSource.ports[1], pipe.port_b) annotation (Line(points={{0,50},{40,
                50},{40,20}}, color={0,127,255}));
        connect(valveDiscrete.port_b, tank1.ports[1]) annotation (Line(points={{-20,-40},
                {-20,-30},{-20,-21},{-22,-21}},
                                 color={0,127,255}));
        connect(pipe.port_a, tank1.ports[2]) annotation (Line(points={{40,0},{40,-28},
                {-18,-28},{-18,-20},{-18,-21}},                color={0,127,255}));
        annotation (experiment(StopTime=35));
      end TankWithEmptyingPipe1;

      model TankWithEmptyingPipe2
        "Demonstrates a tank with one constant top inlet mass flow rate and a bottom outlet into the ambient"
        import Modelica_SIunits.Conversions.from_bar;
        extends Modelica_Icons.Example;

        inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
            massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
                                                      annotation (Placement(
              transformation(extent={{-100,60},{-80,80}}, rotation=0)));
        Modelica_Fluid.Sources.Boundary_pT ambient_fixed(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          p=system.p_ambient,
          T=system.T_ambient) annotation (Placement(transformation(extent={{-60,
                  -100},{-40,-80}}, rotation=0)));
        BaseClasses.TankWithTopPorts tank1(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          crossArea=1,
          V0=0.1,
          height=2,
          nPorts=2,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.05, height=0),
              Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1,
              height=1)},
          level_start=2,
          stiffCharacteristicForEmptyPort=true) annotation (Placement(
              transformation(extent={{-40,-20},{0,20}}, rotation=0)));
        Modelica_Fluid.Pipes.StaticPipe pipe1(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          length=1,
          diameter=0.1,
          height_ab=1) annotation (Placement(transformation(
              origin={-20,-60},
              extent={{-10,-10},{10,10}},
              rotation=90)));

        Modelica_Fluid.Pipes.StaticPipe pipe2(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          length=1,
          diameter=0.1,
          height_ab=1) annotation (Placement(transformation(
              origin={30,-60},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Fluid.Sources.Boundary_pT ambient_fixed1(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          p=system.p_ambient,
          T=system.T_ambient) annotation (Placement(transformation(extent={{0,
                  -100},{20,-80}}, rotation=0)));
      equation
        connect(tank1.ports[1], pipe1.port_b) annotation (Line(points={{-22,-21},{
                -22,-35},{-20,-35},{-20,-50}},
                           color={0,127,255}));
        connect(ambient_fixed.ports[1], pipe1.port_a) annotation (Line(points={{-40,-90},
                {-20,-90},{-20,-70}}, color={0,127,255}));
        connect(tank1.ports[2], pipe2.port_b) annotation (Line(points={{-18,-21},{
                -18,-21},{-18,-40},{30,-40},{30,-50}}, color={0,127,255}));
        connect(ambient_fixed1.ports[1], pipe2.port_a) annotation (Line(points={{20,-90},
                {30,-90},{30,-70}}, color={0,127,255}));
        annotation (experiment(StopTime=120));
      end TankWithEmptyingPipe2;

      model TanksWithEmptyingPipe1
        "Demonstrates a tank with one constant top inlet mass flow rate and a bottom outlet into the ambient"
        import Modelica_SIunits.Conversions.from_bar;
        extends Modelica_Icons.Example;

        inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
            massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
                                                      annotation (Placement(
              transformation(extent={{-100,60},{-80,80}}, rotation=0)));
        Modelica_Fluid.Sources.Boundary_pT ambient_fixed1(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          p=system.p_ambient,
          T=system.T_ambient) annotation (Placement(transformation(extent={{-100,
                  -80},{-80,-60}}, rotation=0)));
        BaseClasses.TankWithTopPorts tank1(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          crossArea=1,
          V0=0.1,
          height=2,
          nPorts=2,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.05, height=0),
              Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1,
              height=1)},
          level_start=2,
          stiffCharacteristicForEmptyPort=true) annotation (Placement(
              transformation(extent={{-80,0},{-40,40}}, rotation=0)));
        Modelica_Fluid.Pipes.StaticPipe pipe1(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          length=1,
          diameter=0.1,
          height_ab=1) annotation (Placement(transformation(
              origin={-60,-40},
              extent={{-10,-10},{10,10}},
              rotation=90)));

        Modelica_Fluid.Pipes.StaticPipe pipe2(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          length=1,
          diameter=0.1,
          height_ab=1) annotation (Placement(transformation(
              origin={40,-40},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Fluid.Sources.Boundary_pT ambient_fixed2(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          p=system.p_ambient,
          T=system.T_ambient) annotation (Placement(transformation(extent={{0,
                  -80},{20,-60}}, rotation=0)));
        BaseClasses.TankWithTopPorts tank2(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          crossArea=1,
          V0=0.1,
          height=2,
          nPorts=2,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.05, height=0),
              Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1,
              height=0.5)},
          level_start=0.1,
          stiffCharacteristicForEmptyPort=true) annotation (Placement(
              transformation(extent={{20,0},{60,40}}, rotation=0)));
        Modelica_Fluid.Pipes.StaticPipe pipe3(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          length=1,
          diameter=0.1,
          height_ab=-0.5) annotation (Placement(transformation(extent={{-20,
                  10},{0,30}}, rotation=0)));
      equation
        connect(tank1.ports[1], pipe1.port_b) annotation (Line(points={{-62,-1},{
                -62,-15},{-60,-15},{-60,-30}},
                           color={0,127,255}));
        connect(ambient_fixed1.ports[1], pipe1.port_a)
                                                  annotation (Line(points={{-80,-70},
                {-60,-70},{-60,-50}}, color={0,127,255}));
        connect(ambient_fixed2.ports[1], pipe2.port_a) annotation (Line(points={{20,-70},
                {40,-70},{40,-50}}, color={0,127,255}));
        connect(tank2.ports[1], pipe2.port_b)
          annotation (Line(points={{38,-1},{38,-15},{40,-15},{40,-30}},
                                                      color={0,127,255}));
        connect(pipe3.port_a, tank1.ports[2]) annotation (Line(points={{-20,20},{
                -30,20},{-30,-10},{-58,-10},{-58,0},{-58,0},{-58,-1}}, color={0,127,
                255}));
        connect(pipe3.port_b, tank2.ports[2]) annotation (Line(points={{0,20},{10,
                20},{10,-8},{38,-8},{38,0},{42,0},{42,-1}}, color={0,127,255}));
        annotation (experiment(StopTime=120));
      end TanksWithEmptyingPipe1;

      model TanksWithEmptyingPipe2
        "Demonstrates a tank with one constant top inlet mass flow rate and a bottom outlet into the ambient"
        parameter Boolean stiffCharacteristicForEmptyPort=true;
        import Modelica_SIunits.Conversions.from_bar;
        extends Modelica_Icons.Example;
        replaceable package Medium =
           Modelica_Media.Water.ConstantPropertyLiquidWater                    constrainedby
          Modelica_Media.Interfaces.PartialMedium "Medium in the component"
            annotation (choicesAllMatching = true);

        inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
            massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
                                                      annotation (Placement(
              transformation(extent={{-100,60},{-80,80}}, rotation=0)));
        Modelica_Fluid.Sources.Boundary_pT ambient_fixed(
          nPorts=1,
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          p=system.p_ambient,
          T=system.T_ambient) annotation (Placement(transformation(extent={{-16,
                  -102},{-36,-82}}, rotation=0)));
        Modelica_Fluid.Valves.ValveDiscrete valveDiscrete(
          redeclare package Medium =
              Modelica_Media.Water.ConstantPropertyLiquidWater,
          dp_nominal(displayUnit="Pa") = 1,
          m_flow_nominal=100) annotation (Placement(transformation(
              origin={-60,-78},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Blocks.Sources.BooleanConstant open(k=false)
          annotation (Placement(transformation(extent={{-98,-88},{-78,-68}},
                rotation=0)));
        BaseClasses.TankWithTopPorts tank3(
          redeclare package Medium = Medium,
          crossArea=1,
          V0=0.1,
          height=20,
          nPorts=2,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.05, height=0),
              Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05,
              height=6.5)},
          level_start=6,
          nTopPorts=1,
          stiffCharacteristicForEmptyPort=stiffCharacteristicForEmptyPort)
          annotation (Placement(transformation(extent={{-80,-50},{-40,-10}},
                rotation=0)));
        BaseClasses.TankWithTopPorts tank1(
          redeclare package Medium = Medium,
          crossArea=1,
          V0=0.1,
          height=10,
          nPorts=1,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.1, height=0)},
          level_start=9,
          stiffCharacteristicForEmptyPort=stiffCharacteristicForEmptyPort)
          annotation (Placement(transformation(extent={{50,50},{90,90}},
                rotation=0)));
        BaseClasses.TankWithTopPorts tank2(
          redeclare package Medium = Medium,
          crossArea=1,
          V0=0.1,
          height=10,
          nPorts=3,
          portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.05, height=0),
              Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05,
              height=2),Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
              diameter=0.1, height=3)},
          level_start=1,
          stiffCharacteristicForEmptyPort=stiffCharacteristicForEmptyPort)
          annotation (Placement(transformation(extent={{-20,10},{20,50}},
                rotation=0)));
        Modelica_Fluid.Pipes.StaticPipe pipe1(
          redeclare package Medium = Medium,
          height_ab=2,
          length=2,
          diameter=0.1) annotation (Placement(transformation(
              origin={70,30},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Fluid.Pipes.StaticPipe pipe2(
          redeclare package Medium = Medium,
          height_ab=2,
          length=2,
          diameter=0.1) annotation (Placement(transformation(
              origin={0,-22},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Fluid.Pipes.StaticPipe pipe3(
          redeclare package Medium = Medium,
          height_ab=2,
          length=2,
          diameter=0.1) annotation (Placement(transformation(
              origin={-60,10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
      equation
        connect(ambient_fixed.ports[1], valveDiscrete.port_a) annotation (Line(points={
                {-36,-92},{-60,-92},{-60,-88}}, color={0,127,255}));
        connect(open.y, valveDiscrete.open) annotation (Line(points={{-77,-78},{-68,
                -78}}, color={255,0,255}));
        connect(valveDiscrete.port_b,tank3. ports[1]) annotation (Line(points={{-60,-68},
                {-60,-59},{-60,-51},{-62,-51}},
                                 color={0,127,255}));
        connect(pipe1.port_b, tank1.ports[1]) annotation (Line(points={{70,40},{
                70,45},{70,49}},
                      color={0,127,255}));
        connect(pipe2.port_a, tank3.ports[2]) annotation (Line(points={{
                0,-32},{0,-48},{0,-60},{-58,-60},{-58,-51}},
                            color={0,127,255}));
        connect(pipe3.port_a, tank3.topPorts[1])
                                                annotation (Line(points={{-60,0},
                {-60,-5},{-60,-9}},
                          color={0,127,255}));
        connect(pipe3.port_b, tank2.ports[1]) annotation (Line(points={{-60,20},{
                -60,26},{-30,26},{-30,0},{-2,0},{-2,9},{-2.66667,9}},
                                                               color={0,127,255}));
        connect(pipe1.port_a, tank2.ports[3]) annotation (Line(points={{70,20},{
                70,0},{2,0},{2,9},{2.66667,9}},
                                       color={0,127,255}));
        connect(pipe2.port_b, tank2.ports[2]) annotation (Line(
            points={{0,-12},{0,9}},
            color={0,127,255},
            smooth=Smooth.None));
        annotation (experiment(StopTime=120));
      end TanksWithEmptyingPipe2;
    end Test;
    annotation (preferredView="info",Documentation(info="<html>
<p>
The process under consideration is an evaporation plant for a
student lab at the Process Control Laboratory (AST) of the
University of Dortmund that evaporates a water sodium chloride
mixture so that a higher concentrated solution is produced.
The task of the students is to learn how to program the process
control system. A picture of the batch plant is shown in the figure
below.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/AST_BatchPlant1.jpg\" border=\"1\"
     alt=\"AST_BatchPlant1.jpg\">
</p>

<p>
The flow sheet diagram is shown in the next figure.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/AST_BatchPlant2.png\" border=\"1\"
     alt=\"AST_BatchPlant2.png\">
</p>

<p>
Pure water from tank B1 and concentrated sodium chloride
solution from tank B2 are mixed in a mixing tank B3.
After buffering in tank B4 the mixture flows to the
evaporator B5. Here the water sodium chloride mixture
is evaporated until the desired concentration is reached.
The steam is condensed in the condenser K1 and cooled
afterwards in the cooling tank B6. The concentrated
 solution is also led to a cooling tank B7. The cooled
fluids are pumped back to the charging vessels by the
pumps P1 and P2. Be-tween the tanks several valves are
present that are regulated by a central control system.
</p>
</html>"));
  end AST_BatchPlant;

  model IncompressibleFluidNetwork
    "Multi-way connections of pipes and incompressible medium model"
    extends Modelica_Icons.Example;

    parameter Modelica_Fluid.Types.ModelStructure pipeModelStructure=
        Modelica_Fluid.Types.ModelStructure.av_vb;
    //parameter Types.ModelStructure pipeModelStructure = Modelica_Fluid.Types.ModelStructure.a_v_b;

    replaceable package Medium =
        Modelica_Media.Incompressible.Examples.Glycol47
      constrainedby Modelica_Media.Interfaces.PartialMedium;

    //replaceable package Medium =
    //    Modelica_Media.Water.StandardWaterOnePhase
    //  constrainedby Modelica_Media.Interfaces.PartialMedium;

    import Modelica_Fluid.Types.Dynamics;
    parameter Dynamics systemMassDynamics = if Medium.singleState then Dynamics.SteadyState else Dynamics.SteadyStateInitial;
    parameter Boolean filteredValveOpening = not Medium.singleState;

    Modelica_Fluid.Sources.Boundary_pT source(
      nPorts=1,
      redeclare package Medium = Medium,
      p=5.0e5,
      T=300) annotation (Placement(transformation(extent={{-98,-6},{-86,6}},
            rotation=0)));
    Modelica_Fluid.Pipes.DynamicPipe pipe1(
      use_T_start=true,
      length=10,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      modelStructure=pipeModelStructure,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
            rotation=0)));

    Modelica_Fluid.Pipes.DynamicPipe pipe2(
      use_T_start=true,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      length=0.5,
      modelStructure=pipeModelStructure,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(
          origin={-50,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));

    Modelica_Fluid.Pipes.DynamicPipe pipe3(
      use_T_start=true,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      length=0.5,
      modelStructure=pipeModelStructure,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(
          origin={-50,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Fluid.Pipes.DynamicPipe pipe4(
      use_T_start=true,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      length=2,
      modelStructure=pipeModelStructure,
      use_HeatTransfer=true,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(extent={{-20,-50},{0,-30}}, rotation=
             0)));
    Modelica_Fluid.Pipes.DynamicPipe pipe6(
      use_T_start=true,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      length=20,
      modelStructure=pipeModelStructure,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(extent={{20,-50},{40,-30}}, rotation=
             0)));
    Modelica_Fluid.Valves.ValveIncompressible valve1(
      redeclare package Medium = Medium,
      m_flow_nominal=1,
      rho_nominal=1000,
      CvData=Modelica_Fluid.Types.CvTypes.Av,
      Av=2.5e-2^2/4*Modelica_Constants.pi,
      dp_nominal=30000) annotation (Placement(transformation(extent={{-46,30},{
              -26,50}}, rotation=0)));
    Modelica_Fluid.Valves.ValveIncompressible valve2(
      redeclare package Medium = Medium,
      m_flow_nominal=1,
      rho_nominal=1000,
      CvData=Modelica_Fluid.Types.CvTypes.Av,
      Av=2.5e-2^2/4*Modelica_Constants.pi,
      dp_nominal=30000) annotation (Placement(transformation(extent={{-46,-30},
              {-26,-50}}, rotation=0)));
    Modelica_Fluid.Pipes.DynamicPipe pipe7(
      use_T_start=true,
      length=10,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      modelStructure=pipeModelStructure,
      use_HeatTransfer=true,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(extent={{-20,30},{0,50}}, rotation=0)));
    Modelica_Fluid.Valves.ValveIncompressible valve3(
      redeclare package Medium = Medium,
      m_flow_nominal=1,
      rho_nominal=1000,
      CvData=Modelica_Fluid.Types.CvTypes.Av,
      Av=2.5e-2^2/4*Modelica_Constants.pi,
      dp_nominal=30000) annotation (Placement(transformation(extent={{80,0},{
              100,20}}, rotation=0)));
    Modelica_Fluid.Sources.Boundary_pT sink(
      nPorts=1,
      redeclare package Medium = Medium,
      T=300,
      p=1.0e5) annotation (Placement(transformation(extent={{118,4},{106,16}},
            rotation=0)));
    inner Modelica_Fluid.System system(
      massDynamics=systemMassDynamics,
      energyDynamics=Dynamics.FixedInitial,
      use_eps_Re=true) annotation (Placement(transformation(extent={{90,-92},
              {110,-72}}, rotation=0)));
    Modelica_Blocks.Sources.Step valveOpening1(
      offset=1,
      startTime=50,
      height=-1)   annotation (Placement(transformation(extent={{-80,80},{-60,60}},
                     rotation=0)));
    Modelica_Blocks.Sources.Step valveOpening2(
      offset=1,
      height=-0.5,
      startTime=100)
                   annotation (Placement(transformation(extent={{-80,-60},{-60,
              -80}}, rotation=0)));
    Modelica_Blocks.Sources.Step valveOpening3(
      offset=1,
      startTime=150,
      height=-0.5) annotation (Placement(transformation(extent={{60,80},{80,60}},
            rotation=0)));
    Modelica_Fluid.Pipes.DynamicPipe pipe8(
      use_T_start=true,
      length=10,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      modelStructure=pipeModelStructure,
      use_HeatTransfer=true,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(
          origin={10,10},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Fluid.Pipes.DynamicPipe pipe9(
      use_T_start=true,
      length=10,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      modelStructure=pipeModelStructure,
      use_HeatTransfer=true,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(extent={{20,30},{40,50}}, rotation=0)));
    Modelica_Fluid.Pipes.DynamicPipe pipe10(
      use_T_start=true,
      length=10,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      modelStructure=pipeModelStructure,
      use_HeatTransfer=true,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(extent={{20,-30},{40,-10}}, rotation=
             0)));
    Modelica_Fluid.Pipes.DynamicPipe pipe5(
      use_T_start=true,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      length=20,
      modelStructure=pipeModelStructure,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow)
      annotation (Placement(transformation(extent={{20,-70},{40,-50}}, rotation=
             0)));
    Modelica_Thermal_HeatTransfer.Sources.FixedHeatFlow[pipe8.nNodes] heat8(
        Q_flow=16e3*pipe8.dxs) annotation (Placement(transformation(extent={{
              -20,0},{0,20}}, rotation=0)));
    Modelica_Fluid.Pipes.DynamicPipe pipe11(
      use_T_start=true,
      diameter=2.5e-2,
      redeclare package Medium = Medium,
      modelStructure=pipeModelStructure,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.TurbulentPipeFlow,
      length=0.5) annotation (Placement(transformation(extent={{54,0},{74,20}},
            rotation=0)));
  equation
    connect(source.ports[1], pipe1.port_a) annotation (Line(points={{-86,0},{-80,
            0}},  color={0,127,255}));
    connect(pipe1.port_b, pipe3.port_a) annotation (Line(points={{-60,0},{-50,0},
            {-50,-10}},    color={0,127,255}));
    connect(pipe1.port_b, pipe2.port_a) annotation (Line(points={{-60,0},{-50,0},
            {-50,10}},     color={0,127,255}));
    connect(pipe2.port_b, valve1.port_a) annotation (Line(points={{-50,30},{-50,
            40},{-46,40}}, color={0,127,255}));
    connect(valve2.port_b, pipe4.port_a) annotation (Line(points={{-26,-40},{-26,
            -40},{-20,-40}},
                   color={0,127,255}));
    connect(pipe3.port_b, valve2.port_a) annotation (Line(points={{-50,-30},{-50,
            -40},{-46,-40}},     color={0,127,255}));
    connect(valve1.port_b, pipe7.port_a) annotation (Line(points={{-26,40},{-26,
            40},{-20,40}},
                  color={0,127,255}));
    connect(valve3.port_b, sink.ports[1]) annotation (Line(points={{100,10},{100,
            10},{106,10}},
          color={0,127,255}));
    connect(valveOpening1.y, valve1.opening) annotation (Line(points={{-59,70},{
            -36,70},{-36,48}},        color={0,0,127}));
    connect(valveOpening2.y, valve2.opening) annotation (Line(points={{-59,-70},{
            -36,-70},{-36,-48}},         color={0,0,127}));
    connect(valveOpening3.y, valve3.opening) annotation (Line(points={{81,70},{90,
            70},{90,18}},           color={0,0,127}));
    connect(pipe7.port_b, pipe9.port_a)
      annotation (Line(points={{0,40},{0,40},{20,40}},
                                                color={0,127,255}));
    connect(pipe7.port_b, pipe8.port_a) annotation (Line(points={{0,40},{10,40},{
            10,20}}, color={0,127,255}));
    connect(pipe8.port_b, pipe10.port_a) annotation (Line(points={{10,0},{10,-20},
            {20,-20}},
                     color={0,127,255}));
    connect(pipe4.port_b, pipe6.port_a) annotation (Line(
        points={{0,-40},{20,-40}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe8.port_b, pipe4.port_b) annotation (Line(
        points={{10,0},{10,-40},{0,-40}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe5.port_a, pipe4.port_b) annotation (Line(
        points={{20,-60},{10,-60},{10,-40},{0,-40}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(heat8.port, pipe8.heatPorts) annotation (Line(
        points={{0,10},{6,10},{6,9.9},{5.6,9.9}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(pipe5.port_b, pipe6.port_b) annotation (Line(
        points={{40,-60},{50,-60},{50,-40},{40,-40}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe6.port_b, pipe10.port_b) annotation (Line(
        points={{40,-40},{50,-40},{50,-20},{40,-20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe11.port_b, valve3.port_a) annotation (Line(
        points={{74,10},{80,10}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe9.port_b, pipe11.port_a) annotation (Line(
        points={{40,40},{50,40},{50,10},{54,10}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe10.port_b, pipe11.port_a) annotation (Line(
        points={{40,-20},{50,-20},{50,10},{54,10}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (         Documentation(info="<html>
<p>
This example demonstrates two aspects: the treatment of multi-way connections
and the usage of an incompressible medium model.
</p><p>
Eleven pipe models with nNodes=2 each introduce 22 temperature states and and 22 pressure states.
When configuring <b>pipeModelStructure=a_v_b</b>, the flow models at the pipe ports constitute algebraic loops for the pressures.
A common work-around is to introduce \"mixing volumes\" in critical connections.
</p><p>
Here the problem is treated alternatively with the default <b>pipeModelStructure=av_vb</b> of the
<a href=\"modelica://Modelica_Fluid.Pipes.DynamicPipe\">DynamicPipe</a> model.
Each pipe exposes the states of the outer fluid segments to the respective fluid ports.
Consequently the pressures of all connected pipe segments get lumped together into one mass balance spanning the whole connection set.
Overall this treatment as high-index DAE results in the reduction to 9 pressure states, preventing algebraic loops in connections.
This can be studied with a rigorous medium model like <b>StandardWaterOnePhase</b>.
</p><p>
The pressure dynamics completely disappears with an incompressible medium model, like the used <b>Glycol47</b>.
It appears reasonable to assume steady-state mass balances in this case
(see parameter systemMassDynamics used in system.massDynamics, tab Assumptions).
</p><p>
Note that with the stream concept in the fluid ports, the energy and substance balances of the connected pipe segments remain independent
from each other, despite of pressures being lumped together. The following simulation results can be observed:
</p>
<ol>
<li>The simulation starts with system.T_ambient as initial temperature in all pipes.
    The temperatures upstream or bypassing pipe8 are approaching the value of 26.85 degC from the source, including also pipe9.
    The temperatures downstream of pipe8 take a higher value, depending on the mixing with heated fluid, see e.g. pipe10.</li>
<li>After 50s valve1 fully closes. This causes flow reversal in pipe8. Now heated fluid flows from pipe8 to pipe9.
    Note that the temperature of the connected pipe7 remains unchanged as there is no flow into pipe7.
    The temperature of pipe10 cools down to the source temperature.</li>
<li>After 100s valve2 closes half way, which affects mass flow rates and temperatures.</li>
<li>After 150s valve5 closes half way, which affects mass flow rates and temperatures.</li>
</ol>
<p>
The fluid temperatures in the pipes of interest are exposed through heatPorts.
</p>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/IncompressibleFluidNetwork.png\" border=\"1\"
     alt=\"IncompressibleFluidNetwork.png\">
</html>"),
      experiment(StopTime=200),
      __Dymola_Commands(file=
            "modelica://Modelica/Resources/Scripts/Dymola/Fluid/IncompressibleFluidNetwork/plotResults.mos"
          "plotResults"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{120,
              100}})),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{120,
              100}})));
  end IncompressibleFluidNetwork;

  model BranchingDynamicPipes
    "Multi-way connections of pipes with dynamic momentum balance, pressure wave and flow reversal"
  extends Modelica_Icons.Example;
  replaceable package Medium=Modelica_Media.Air.MoistAir constrainedby
      Modelica_Media.Interfaces.PartialMedium;
  //replaceable package Medium=Modelica_Media.Water.StandardWater constrainedby Modelica_Media.Interfaces.PartialMedium;

    inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.SteadyStateInitial,
        momentumDynamics=Modelica_Fluid.Types.Dynamics.SteadyStateInitial)
                                                            annotation (
        Placement(transformation(extent={{-90,70},{-70,90}}, rotation=0)));
    Modelica_Fluid.Sources.Boundary_pT boundary1(
      nPorts=1,
      redeclare package Medium = Medium,
      p=150000) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-80})));
    Modelica_Fluid.Pipes.DynamicPipe pipe1(
      redeclare package Medium = Medium,
      use_T_start=true,
      nNodes=5,
      diameter=2.54e-2,
      m_flow_start=0.02,
      height_ab=50,
      length=50,
      p_a_start=150000,
      p_b_start=130000,
      modelStructure=Modelica_Fluid.Types.ModelStructure.a_v_b) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-50})));
   Modelica_Fluid.Pipes.DynamicPipe pipe2(
      redeclare package Medium = Medium,
      use_T_start=true,
      nNodes=5,
      redeclare model HeatTransfer =
          Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.LocalPipeFlowHeatTransfer,
      use_HeatTransfer=true,
      diameter=2.54e-2,
      m_flow_start=0.01,
      length=50,
      height_ab=25,
      p_a_start=130000,
      p_b_start=120000,
      modelStructure=Modelica_Fluid.Types.ModelStructure.av_vb) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-20,-10})));

    Modelica_Fluid.Pipes.DynamicPipe pipe3(
      redeclare package Medium = Medium,
      use_T_start=true,
      nNodes=5,
      diameter=2.54e-2,
      m_flow_start=0.01,
      length=25,
      height_ab=25,
      p_a_start=130000,
      p_b_start=120000,
      modelStructure=Modelica_Fluid.Types.ModelStructure.a_v_b) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={20,-10})));
    Modelica_Fluid.Pipes.DynamicPipe pipe4(
      redeclare package Medium = Medium,
      use_T_start=true,
      nNodes=5,
      diameter=2.54e-2,
      m_flow_start=0.02,
      height_ab=50,
      length=50,
      p_a_start=120000,
      p_b_start=100000,
      modelStructure=Modelica_Fluid.Types.ModelStructure.a_v_b) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,30})));
    Modelica_Fluid.Sources.Boundary_pT boundary4(
      nPorts=1,
      redeclare package Medium = Medium,
      use_p_in=true,
      use_T_in=false,
      p=100000) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=90,
          origin={0,60})));
    Modelica_Blocks.Sources.Ramp ramp1(
      offset=1e5,
      startTime=2,
      height=1e5,
      duration=0) annotation (Placement(transformation(extent={{-40,70},{-20,90}},
            rotation=0)));
    Modelica_Thermal_HeatTransfer.Sources.FixedHeatFlow[
                                                pipe2.nNodes] heat2(Q_flow=200*
          pipe2.dxs, alpha=-1e-2*ones(pipe2.n))
      annotation (Placement(transformation(extent={{-60,-20},{-40,0}},  rotation=
              0)));
  equation
    connect(ramp1.y, boundary4.p_in) annotation (Line(
        points={{-19,80},{-8,80},{-8,72}},
        color={0,0,127},
        thickness=0.5));
    connect(boundary1.ports[1],pipe1. port_a) annotation (Line(
        points={{0,-70},{0,-70},{0,-60},{0,-60}},
        color={0,127,255},
        thickness=0.5));
    connect(pipe1.port_b,pipe2. port_a) annotation (Line(
        points={{0,-40},{0,-40},{0,-30},{-20,-30},{-20,-20}},
        color={0,127,255},
        thickness=0.5));
    connect(pipe1.port_b,pipe3. port_a) annotation (Line(
        points={{0,-40},{0,-40},{0,-30},{20,-30},{20,-20}},
        color={0,127,255},
        thickness=0.5));
    connect(pipe2.port_b,pipe4. port_a) annotation (Line(
        points={{-20,0},{-20,0},{-20,10},{0,10},{0,16},{0,20},{0,20}},
        color={0,127,255},
        thickness=0.5));
    connect(pipe3.port_b,pipe4. port_a) annotation (Line(
        points={{20,0},{20,0},{20,10},{0,10},{0,16},{0,20},{0,20}},
        color={0,127,255},
        thickness=0.5));
    connect(pipe4.port_b, boundary4.ports[1]) annotation (Line(
        points={{0,40},{0,50},{0,50}},
        color={0,127,255},
        thickness=0.5));
    connect(heat2.port,pipe2. heatPorts)
                                        annotation (Line(
        points={{-40,-10},{-24.4,-10},{-24.4,-9.9}},
        color={191,0,0},
        thickness=0.5));

      annotation (
      Documentation(info="<html>
<p>
This model demonstrates the use of distributed pipe models with dynamic energy, mass and momentum balances.
At time=2s the pressure of boundary4 jumps, which causes a pressure wave and flow reversal.
</p>
<p>
Change system.momentumDynamics on the Assumptions tab of the system object from SteadyStateInitial to SteadyState,
in order to assume a steady-state momentum balance. This is the default for all models of the library.
</p>
<p>
Change the Medium from MoistAir to StandardWater, in order to investigate a medium with significantly different density.
Note the static head caused by the elevation of the pipes.
</p>
<p>
Note the appropriate use of the modelStructure of the DynamicPipe models (Advanced tab).
The default modelStructure is av_vb, i.e. volumes with a pressure state are exposed at both ports.
In many cases this gives good numerical performance, avoiding algebraic loops in connections,
e.g. if a pipe is connected to a valve or to a vessel with portsData configured.
The price to pay is a high-index DAE if two pipes are connected or if a pipe is connected to a boundary with prescribed pressure.
In such cases one might consider changing the modelStructure.
</p>
<p>
In the BranchingDynamicPipes example, {pipe1,pipe3,pipe4}.modelStructure are configured to a_v_b, while pipe2.modelStructure remains av_vb.
This avoids a high-index DAE and overdetermined initial conditions.
</p>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/BranchingDynamicPipes.png\" border=\"1\"
     alt=\"BranchingDynamicPipes.png\">
</html>"),   experiment(StopTime=10),
      __Dymola_Commands(file(ensureSimulated=true)=
          "modelica://Modelica/Resources/Scripts/Dymola/Fluid/BranchingDynamicPipes/plotResults.mos"
          "plotResults"));
  end BranchingDynamicPipes;

  package HeatExchanger "Demo of a heat exchanger model"
    extends Modelica_Icons.ExamplesPackage;

    model HeatExchangerSimulation "simulation for the heat exchanger model"

    extends Modelica_Icons.Example;

    //replaceable package Medium = Modelica_Media.Water.ConstantPropertyLiquidWater;
    replaceable package Medium = Modelica_Media.Water.StandardWaterOnePhase;
    //package Medium = Modelica_Media.Incompressible.Examples.Essotherm650;
      BaseClasses.BasicHX HEX(
        c_wall=500,
        use_T_start=true,
        nNodes=20,
        length=2,
        m_flow_start_1=0.2,
        m_flow_start_2=0.2,
        k_wall=100,
        s_wall=0.005,
        crossArea_1=4.5e-4,
        crossArea_2=4.5e-4,
        perimeter_1=0.075,
        perimeter_2=0.075,
        area_h_1=0.075*2*20,
        area_h_2=0.075*2*20,
        rho_wall=900,
        redeclare package Medium_1 = Medium,
        redeclare package Medium_2 = Medium,
        modelStructure_1=Modelica_Fluid.Types.ModelStructure.av_b,
        modelStructure_2=Modelica_Fluid.Types.ModelStructure.a_vb,
        redeclare model HeatTransfer_2 =
            Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.ConstantFlowHeatTransfer
            (alpha0=200),
        redeclare model HeatTransfer_1 =
            Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.LocalPipeFlowHeatTransfer
            (alpha0=1000),
        Twall_start=300,
        dT=10,
        T_start_1=304,
        T_start_2=300) annotation (Placement(transformation(extent={{-26,-14},{
                34,46}}, rotation=0)));

      Modelica_Fluid.Sources.Boundary_pT ambient2(
        nPorts=1,
        p=1e5,
        T=280,
        redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{82,-28},{62,-8}}, rotation=0)));
      Modelica_Fluid.Sources.Boundary_pT ambient1(
        nPorts=1,
        p=1e5,
        T=300,
        redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{82,24},{62,44}}, rotation=0)));
      Modelica_Fluid.Sources.MassFlowSource_T massFlowRate2(
        nPorts=1,
        m_flow=0.2,
        T=360,
        redeclare package Medium = Medium,
        use_m_flow_in=true,
        use_T_in=false,
        use_X_in=false) annotation (Placement(transformation(extent={{-66,24},
                {-46,44}}, rotation=0)));
      Modelica_Fluid.Sources.MassFlowSource_T massFlowRate1(
        nPorts=1,
        T=300,
        m_flow=0.5,
        redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{-66,-10},{-46,10}}, rotation=0)));
      Modelica_Blocks.Sources.Ramp Ramp1(
        startTime=50,
        duration=5,
        height=-1,
        offset=0.5)   annotation (Placement(transformation(extent={{-98,44},{-78,24}},
                      rotation=0)));
      inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.SteadyStateInitial,
          use_eps_Re=true) annotation (Placement(transformation(extent={{60,
                70},{80,90}}, rotation=0)));
    equation
      connect(massFlowRate1.ports[1], HEX.port_a1)        annotation (Line(points={
              {-46,0},{-40,0},{-40,15.4},{-29,15.4}}, color={0,127,255}));
      connect(HEX.port_b1, ambient1.ports[1])        annotation (Line(points={{37,
              15.4},{48.5,15.4},{48.5,34},{62,34}}, color={0,127,255}));
      connect(Ramp1.y, massFlowRate2.m_flow_in) annotation (Line(points={{-77,34},
              {-74,34},{-74,42},{-66,42}},  color={0,0,127}));
      connect(massFlowRate2.ports[1], HEX.port_b2)
                                               annotation (Line(
          points={{-46,34},{-40,34},{-40,29.8},{-29,29.8}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(HEX.port_a2, ambient2.ports[1])
                                          annotation (Line(
          points={{37,2.2},{42,2},{50,2},{50,-18},{62,-18}},
          color={0,127,255},
          smooth=Smooth.None));
      annotation (                         experiment(StopTime=100, Tolerance=1e-005),
        Documentation(info="<html>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/HeatExchanger.png\" border=\"1\"
     alt=\"HeatExchanger.png\">
</html>"));
    end HeatExchangerSimulation;

    package BaseClasses "Additional models for heat exchangers"
      extends Modelica_Icons.BasesPackage;

      model BasicHX "Simple heat exchanger model"
        outer Modelica_Fluid.System system "System properties";
        //General
        parameter Modelica_SIunits.Length length(min=0)
          "Length of flow path for both fluids";
        parameter Integer nNodes(min=1) = 2 "Spatial segmentation";
        parameter Modelica_Fluid.Types.ModelStructure modelStructure_1=
            Modelica_Fluid.Types.ModelStructure.av_vb
          "Determines whether flow or volume models are present at the ports"
          annotation (Evaluate=true, Dialog(tab="General", group="Fluid 1"));
        parameter Modelica_Fluid.Types.ModelStructure modelStructure_2=
            Modelica_Fluid.Types.ModelStructure.av_vb
          "Determines whether flow or volume models are present at the ports"
          annotation (Evaluate=true, Dialog(tab="General", group="Fluid 2"));
        replaceable package Medium_1 = Modelica_Media.Water.StandardWater constrainedby
          Modelica_Media.Interfaces.PartialMedium "Fluid 1"
                                                          annotation(choicesAllMatching, Dialog(tab="General",group="Fluid 1"));
        replaceable package Medium_2 = Modelica_Media.Water.StandardWater constrainedby
          Modelica_Media.Interfaces.PartialMedium "Fluid 2"
                                                          annotation(choicesAllMatching,Dialog(tab="General", group="Fluid 2"));
        parameter Modelica_SIunits.Area crossArea_1 "Cross sectional area"
          annotation (Dialog(tab="General", group="Fluid 1"));
        parameter Modelica_SIunits.Area crossArea_2 "Cross sectional area"
          annotation (Dialog(tab="General", group="Fluid 2"));
        parameter Modelica_SIunits.Length perimeter_1 "Flow channel perimeter"
          annotation (Dialog(tab="General", group="Fluid 1"));
        parameter Modelica_SIunits.Length perimeter_2 "Flow channel perimeter"
          annotation (Dialog(tab="General", group="Fluid 2"));
        final parameter Boolean use_HeatTransfer = true
          "= true to use the HeatTransfer_1/_2 model";

        // Heat transfer
        replaceable model HeatTransfer_1 =
            Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer
          constrainedby
          Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.PartialFlowHeatTransfer
          "Heat transfer model" annotation(choicesAllMatching, Dialog(tab="General", group="Fluid 1", enable=use_HeatTransfer));

        replaceable model HeatTransfer_2 =
            Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer
          constrainedby
          Modelica_Fluid.Pipes.BaseClasses.HeatTransfer.PartialFlowHeatTransfer
          "Heat transfer model" annotation(choicesAllMatching, Dialog(tab="General", group="Fluid 2", enable=use_HeatTransfer));

        parameter Modelica_SIunits.Area area_h_1 "Heat transfer area"
          annotation (Dialog(tab="General", group="Fluid 1"));
        parameter Modelica_SIunits.Area area_h_2 "Heat transfer area"
          annotation (Dialog(tab="General", group="Fluid 2"));
       //Wall
        parameter Modelica_SIunits.Length s_wall(min=0) "Wall thickness"
          annotation (Dialog(group="Wall properties"));
        parameter Modelica_SIunits.ThermalConductivity k_wall
          "Thermal conductivity of wall material"
          annotation (Dialog(group="Wall properties"));
        parameter Modelica_SIunits.SpecificHeatCapacity c_wall
          "Specific heat capacity of wall material"
          annotation (Dialog(tab="General", group="Wall properties"));
        parameter Modelica_SIunits.Density rho_wall "Density of wall material"
          annotation (Dialog(tab="General", group="Wall properties"));
        final parameter Modelica_SIunits.Area area_h=(area_h_1 + area_h_2)/2
          "Heat transfer area";
        final parameter Modelica_SIunits.Mass m_wall=rho_wall*area_h*s_wall
          "Wall mass";

        // Assumptions
        parameter Boolean allowFlowReversal = system.allowFlowReversal
          "allow flow reversal, false restricts to design direction (port_a -> port_b)"
          annotation(Dialog(tab="Assumptions"), Evaluate=true);
        parameter Modelica_Fluid.Types.Dynamics energyDynamics=system.energyDynamics
          "Formulation of energy balance" annotation (Evaluate=true, Dialog(
              tab="Assumptions", group="Dynamics"));
        parameter Modelica_Fluid.Types.Dynamics massDynamics=system.massDynamics
          "Formulation of mass balance" annotation (Evaluate=true, Dialog(tab=
               "Assumptions", group="Dynamics"));
        parameter Modelica_Fluid.Types.Dynamics momentumDynamics=system.momentumDynamics
          "Formulation of momentum balance, if pressureLoss options available"
          annotation (Evaluate=true, Dialog(tab="Assumptions", group=
                "Dynamics"));

        //Initialization pipe 1
        parameter Modelica_SIunits.Temperature Twall_start
          "Start value of wall temperature"
          annotation (Dialog(tab="Initialization", group="Wall"));
        parameter Modelica_SIunits.Temperature dT
          "Start value for pipe_1.T - pipe_2.T"
          annotation (Dialog(tab="Initialization", group="Wall"));
        parameter Boolean use_T_start=true
          "Use T_start if true, otherwise h_start"
          annotation(Evaluate=true, Dialog(tab = "Initialization"));
        parameter Medium_1.AbsolutePressure p_a_start1=Medium_1.p_default
          "Start value of pressure"
          annotation(Dialog(tab = "Initialization", group = "Fluid 1"));
        parameter Medium_1.AbsolutePressure p_b_start1=Medium_1.p_default
          "Start value of pressure"
          annotation(Dialog(tab = "Initialization", group = "Fluid 1"));
        parameter Medium_1.Temperature T_start_1=if use_T_start then Medium_1.
            T_default else Medium_1.temperature_phX(
              (p_a_start1 + p_b_start1)/2,
              h_start_1,
              X_start_1) "Start value of temperature"
          annotation(Evaluate=true, Dialog(tab = "Initialization", group = "Fluid 1", enable = use_T_start));
        parameter Medium_1.SpecificEnthalpy h_start_1=if use_T_start then Medium_1.specificEnthalpy_pTX(
              (p_a_start1 + p_b_start1)/2,
              T_start_1,
              X_start_1) else Medium_1.h_default
          "Start value of specific enthalpy"
          annotation(Evaluate=true, Dialog(tab = "Initialization", group = "Fluid 1", enable = not use_T_start));
        parameter Medium_1.MassFraction X_start_1[Medium_1.nX]=Medium_1.X_default
          "Start value of mass fractions m_i/m"
          annotation (Dialog(tab="Initialization", group = "Fluid 1", enable=(Medium_1.nXi > 0)));
        parameter Medium_1.MassFlowRate m_flow_start_1 = system.m_flow_start
          "Start value of mass flow rate" annotation(Evaluate=true, Dialog(tab = "Initialization", group = "Fluid 1"));
        //Initialization pipe 2

        parameter Medium_2.AbsolutePressure p_a_start2=Medium_2.p_default
          "Start value of pressure"
          annotation(Dialog(tab = "Initialization", group = "Fluid 2"));
        parameter Medium_2.AbsolutePressure p_b_start2=Medium_2.p_default
          "Start value of pressure"
          annotation(Dialog(tab = "Initialization", group = "Fluid 2"));
        parameter Medium_2.Temperature T_start_2=if use_T_start then Medium_2.
            T_default else Medium_2.temperature_phX(
              (p_a_start2 + p_b_start2)/2,
              h_start_2,
              X_start_2) "Start value of temperature"
          annotation(Evaluate=true, Dialog(tab = "Initialization", group = "Fluid 2", enable = use_T_start));
        parameter Medium_2.SpecificEnthalpy h_start_2=if use_T_start then Medium_2.specificEnthalpy_pTX(
              (p_a_start2 + p_b_start2)/2,
              T_start_2,
              X_start_2) else Medium_2.h_default
          "Start value of specific enthalpy"
          annotation(Evaluate=true, Dialog(tab = "Initialization", group = "Fluid 2", enable = not use_T_start));
        parameter Medium_2.MassFraction X_start_2[Medium_2.nX]=Medium_2.X_default
          "Start value of mass fractions m_i/m"
          annotation (Dialog(tab="Initialization", group = "Fluid 2", enable=Medium_2.nXi>0));
        parameter Medium_2.MassFlowRate m_flow_start_2 = system.m_flow_start
          "Start value of mass flow rate"    annotation(Evaluate=true, Dialog(tab = "Initialization", group = "Fluid 2"));

        //Pressure drop and heat transfer
        replaceable model FlowModel_1 =
            Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow
          constrainedby
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.PartialStaggeredFlowModel
          "Characteristic of wall friction"                                                                                                   annotation(choicesAllMatching, Dialog(tab="General", group="Fluid 1"));
        replaceable model FlowModel_2 =
            Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow
          constrainedby
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.PartialStaggeredFlowModel
          "Characteristic of wall friction"                                                                                                   annotation(choicesAllMatching, Dialog(tab="General", group="Fluid 2"));
        parameter Modelica_SIunits.Length roughness_1=2.5e-5
          "Absolute roughness of pipe (default = smooth steel pipe)"
          annotation (Dialog(tab="General", group="Fluid 1"));
        parameter Modelica_SIunits.Length roughness_2=2.5e-5
          "Absolute roughness of pipe (default = smooth steel pipe)"
          annotation (Dialog(tab="General", group="Fluid 2"));

        //Display variables
        Modelica_SIunits.HeatFlowRate Q_flow_1 "Total heat flow rate of pipe 1";
        Modelica_SIunits.HeatFlowRate Q_flow_2 "Total heat flow rate of pipe 2";

        BaseClasses.WallConstProps wall(
          rho_wall=rho_wall,
          c_wall=c_wall,
          T_start=Twall_start,
          k_wall=k_wall,
          dT=dT,
          s=s_wall,
          energyDynamics=energyDynamics,
          n=nNodes,
          area_h=area_h)
          annotation (Placement(transformation(extent={{-29,-23},{9,35}},  rotation=
                 0)));

        Modelica_Fluid.Pipes.DynamicPipe pipe_1(
          redeclare final package Medium = Medium_1,
          final isCircular=false,
          final diameter=0,
          final nNodes=nNodes,
          final allowFlowReversal=allowFlowReversal,
          final energyDynamics=energyDynamics,
          final massDynamics=massDynamics,
          final momentumDynamics=momentumDynamics,
          final length=length,
          final use_HeatTransfer=use_HeatTransfer,
          redeclare final model HeatTransfer = HeatTransfer_1,
          final use_T_start=use_T_start,
          final T_start=T_start_1,
          final h_start=h_start_1,
          final X_start=X_start_1,
          final m_flow_start=m_flow_start_1,
          final perimeter=perimeter_1,
          final crossArea=crossArea_1,
          final roughness=roughness_1,
          final p_a_start=p_a_start1,
          final p_b_start=p_b_start1,
          redeclare final model FlowModel = FlowModel_1,
          final modelStructure=modelStructure_1) annotation (Placement(
              transformation(extent={{-40,-80},{20,-20}}, rotation=0)));

        Modelica_Fluid.Pipes.DynamicPipe pipe_2(
          redeclare final package Medium = Medium_2,
          final nNodes=nNodes,
          final allowFlowReversal=allowFlowReversal,
          final energyDynamics=energyDynamics,
          final massDynamics=massDynamics,
          final momentumDynamics=momentumDynamics,
          final length=length,
          final isCircular=false,
          final diameter=0,
          final use_HeatTransfer=use_HeatTransfer,
          redeclare final model HeatTransfer = HeatTransfer_2,
          final use_T_start=use_T_start,
          final T_start=T_start_2,
          final h_start=h_start_2,
          final X_start=X_start_2,
          final m_flow_start=m_flow_start_2,
          final perimeter=perimeter_2,
          final crossArea=crossArea_2,
          final p_a_start=p_a_start2,
          final p_b_start=p_b_start2,
          final roughness=roughness_2,
          redeclare final model FlowModel = FlowModel_2,
          final modelStructure=modelStructure_2) annotation (Placement(
              transformation(extent={{20,88},{-40,28}}, rotation=0)));

        Modelica_Fluid.Interfaces.FluidPort_b port_b1(redeclare final package
            Medium = Medium_1) annotation (Placement(transformation(extent={{
                  100,-12},{120,8}}, rotation=0)));
        Modelica_Fluid.Interfaces.FluidPort_a port_a1(redeclare final package
            Medium = Medium_1) annotation (Placement(transformation(extent={{
                  -120,-12},{-100,8}}, rotation=0)));
        Modelica_Fluid.Interfaces.FluidPort_b port_b2(redeclare final package
            Medium = Medium_2) annotation (Placement(transformation(extent={{
                  -120,36},{-100,56}}, rotation=0)));
        Modelica_Fluid.Interfaces.FluidPort_a port_a2(redeclare final package
            Medium = Medium_2) annotation (Placement(transformation(extent={{
                  100,-56},{120,-36}}, rotation=0)));

      equation
        Q_flow_1 = sum(pipe_1.heatTransfer.Q_flows);
        Q_flow_2 = sum(pipe_2.heatTransfer.Q_flows);
        connect(pipe_2.port_b, port_b2) annotation (Line(
            points={{-40,58},{-76,58},{-76,46},{-110,46}},
            color={0,127,255},
            thickness=0.5));
        connect(pipe_1.port_b, port_b1) annotation (Line(
            points={{20,-50},{42,-50},{42,-2},{110,-2}},
            color={0,127,255},
            thickness=0.5));
        connect(pipe_1.port_a, port_a1) annotation (Line(
            points={{-40,-50},{-75.3,-50},{-75.3,-2},{-110,-2}},
            color={0,127,255},
            thickness=0.5));
        connect(pipe_2.port_a, port_a2) annotation (Line(
            points={{20,58},{65,58},{65,-46},{110,-46}},
            color={0,127,255},
            thickness=0.5));
        connect(wall.heatPort_b, pipe_1.heatPorts) annotation (Line(
            points={{-10,-8.5},{-10,-36.8},{-9.7,-36.8}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(pipe_2.heatPorts[nNodes:-1:1], wall.heatPort_a[1:nNodes])
          annotation (Line(
            points={{-10.3,44.8},{-10.3,31.7},{-10,31.7},{-10,20.5}},
            color={127,0,0},
            smooth=Smooth.None));
        annotation (   Icon(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,-26},{100,-30}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Forward),
              Rectangle(
                extent={{-100,30},{100,26}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Forward),
              Rectangle(
                extent={{-100,60},{100,30}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={0,63,125}),
              Rectangle(
                extent={{-100,-30},{100,-60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={0,63,125}),
              Rectangle(
                extent={{-100,26},{100,-26}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={0,128,255}),
              Text(
                extent={{-150,110},{150,70}},
                lineColor={0,0,255},
                textString="%name"),
              Line(
                points={{30,-85},{-60,-85}},
                color={0,128,255},
                smooth=Smooth.None),
              Polygon(
                points={{20,-70},{60,-85},{20,-100},{20,-70}},
                lineColor={0,128,255},
                smooth=Smooth.None,
                fillColor={0,128,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{30,77},{-60,77}},
                color={0,128,255},
                smooth=Smooth.None),
              Polygon(
                points={{-50,92},{-90,77},{-50,62},{-50,92}},
                lineColor={0,128,255},
                smooth=Smooth.None,
                fillColor={0,128,255},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<html>
<p>Simple model of a heat exchanger consisting of two pipes and one wall in between.
For both fluids geometry parameters, such as heat transfer area and cross section as well as heat transfer and pressure drop correlations may be chosen.
The flow scheme may be concurrent or counterflow, defined by the respective flow directions of the fluids entering the component.
The design flow direction with positive m_flow variables is counterflow.</p>
</html>"));
      end BasicHX;

      model WallConstProps
        "Pipe wall with capacitance, assuming 1D heat conduction and constant material properties"
        parameter Integer n(min=1)=1
          "Segmentation perpendicular to heat conduction";
      //Geometry
        parameter Modelica_SIunits.Length s "Wall thickness";
        parameter Modelica_SIunits.Area area_h "Heat transfer area";
      //Material properties
        parameter Modelica_SIunits.Density rho_wall "Density of wall material";
        parameter Modelica_SIunits.SpecificHeatCapacity c_wall
          "Specific heat capacity of wall material";
        parameter Modelica_SIunits.ThermalConductivity k_wall
          "Thermal conductivity of wall material";
        parameter Modelica_SIunits.Mass[n] m=fill(rho_wall*area_h*s/n, n)
          "Distribution of wall mass";
      //Initialization
        outer Modelica_Fluid.System system;
        parameter Modelica_Fluid.Types.Dynamics energyDynamics=system.energyDynamics
          "Formulation of energy balance" annotation (Evaluate=true, Dialog(
              tab="Assumptions", group="Dynamics"));
        parameter Modelica_SIunits.Temperature T_start
          "Wall temperature start value";
        parameter Modelica_SIunits.Temperature dT
          "Start value for port_b.T - port_a.T";
      //Temperatures
        Modelica_SIunits.Temperature[n] Tb(each start=T_start + 0.5*dT);
        Modelica_SIunits.Temperature[n] Ta(each start=T_start - 0.5*dT);
        Modelica_SIunits.Temperature[n] T(start=ones(n)*T_start, each
            stateSelect=StateSelect.prefer) "Wall temperature";
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a[n] heatPort_a
          "Thermal port"
          annotation (Placement(transformation(extent={{-20,40},{20,60}}, rotation=0)));
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a[n] heatPort_b
          "Thermal port"
          annotation (Placement(transformation(extent={{-20,-40},{20,-60}}, rotation=
                    0)));

      initial equation
        if energyDynamics == Modelica_Fluid.Types.Dynamics.SteadyStateInitial then
          der(T) = zeros(n);
        elseif energyDynamics == Modelica_Fluid.Types.Dynamics.FixedInitial then
          T = ones(n)*T_start;
        end if;
      equation
        for i in 1:n loop
         assert(m[i]>0, "Wall has negative dimensions");
          if energyDynamics == Modelica_Fluid.Types.Dynamics.SteadyState then
           0 = heatPort_a[i].Q_flow + heatPort_b[i].Q_flow;
         else
           c_wall*m[i]*der(T[i]) = heatPort_a[i].Q_flow + heatPort_b[i].Q_flow;
         end if;
         heatPort_a[i].Q_flow=k_wall/s*(Ta[i]-T[i])*area_h/n;
         heatPort_b[i].Q_flow=k_wall/s*(Tb[i]-T[i])*area_h/n;
        end for;
        Ta=heatPort_a.T;
        Tb=heatPort_b.T;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                extent={{-100,40},{100,-40}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Forward), Text(
                extent={{-82,18},{76,-18}},
                lineColor={0,0,0},
                textString="%name")}),
                                  Documentation(revisions="<html>
<ul>
<li><i>04 Mar 2006</i>
    by Katrin Pr&ouml;l&szlig;:<br>
       Model added to the Fluid library</li>
</ul>
</html>",       info="<html>
Simple model of circular (or any other closed shape) wall to be used for pipe (or duct) models. Heat conduction is regarded one dimensional, capacitance is lumped at the arithmetic mean temperature. The spatial discretization (parameter <code>n</code>) is meant to correspond to a connected fluid model discretization.
</html>"));
      end WallConstProps;
    end BaseClasses;
  end HeatExchanger;

  package TraceSubstances "Library demonstrating the usage of trace substances"
    extends Modelica_Icons.ExamplesPackage;
    model RoomCO2 "Demonstrates a room volume with CO2 accumulation"
      extends Modelica_Icons.Example;
      package Medium=Modelica_Media.Air.MoistAir(extraPropertiesNames={"CO2"},
                                                 C_nominal={1.519E-3});
      Modelica_Blocks.Sources.Constant C(k=0.3*1.519E-3)
        "substance concentration, raising to 1000 PPM CO2"
        annotation (Placement(transformation(extent={{-94,-28},{-74,-8}})));
      Modelica_Fluid.Sources.FixedBoundary boundary4(nPorts=1, redeclare
          package Medium = Medium)
        annotation (Placement(transformation(extent={{80,-20},{60,0}})));
      Modelica_Fluid.Sensors.TraceSubstances traceVolume(redeclare package
          Medium = Medium)
        annotation (Placement(transformation(extent={{0,20},{20,40}})));
      inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
        annotation (Placement(transformation(extent={{52,36},{72,56}}, rotation=
               0)));
      Modelica_Fluid.Sources.MassFlowSource_T boundary1(
        use_C_in=true,
        m_flow=100/1.2/3600*5,
        redeclare package Medium = Medium,
        nPorts=2,
        X=Medium.X_default)
        annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
      Modelica_Fluid.Vessels.ClosedVolume volume(
        C_start={1.519E-3},
        V=100,
        redeclare package Medium = Medium,
        nPorts=2,
        X_start={0.015,0.085},
        massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        use_portsData=false)
        annotation (Placement(transformation(extent={{-20,0},{0,20}})));
      Modelica_Fluid.Pipes.StaticPipe pipe(
        redeclare package Medium = Medium,
        length=1,
        diameter=0.15,
        redeclare model FlowModel =
            Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow (
              show_Res=true))
        annotation (Placement(transformation(extent={{20,-20},{40,0}})));
      Modelica_Fluid.Sensors.TraceSubstances traceSource(redeclare package
          Medium = Medium)
        annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    equation
      connect(C.y, boundary1.C_in[1]) annotation (Line(
          points={{-73,-18},{-60,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pipe.port_b, boundary4.ports[1])         annotation (Line(
          points={{40,-10},{60,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume.ports[2], pipe.port_a)         annotation (Line(
          points={{-8,0},{-8,-10},{20,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(traceVolume.port, pipe.port_a)                  annotation (Line(
          points={{10,20},{10,-10},{20,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(boundary1.ports[2], volume.ports[1]) annotation (Line(
          points={{-40,-10.5},{-12,-10.5},{-12,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(boundary1.ports[1], traceSource.port)          annotation (Line(
          points={{-40,-9.5},{-30,-9.5},{-30,20}},
          color={0,127,255},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=3600),
        Documentation(info="<html>
<p>
This example consists of a volume with a carbon dioxide concentration that corresponds to
1.519E-3 kg/kg, which is equal to 1000 PPM.
There is a fresh air stream with a carbon dioxide concentration of about 300 PPM.
The fresh air stream is such that the air exchange rate is about 5 air changes per hour.
After 1 hour of ventilation, the volume's carbon dioxide concentration is close to the
concentration of the fresh air.
</p>
<p>
The nominal value for the trace substance is set to <code>C_nominal={1.519E-3}</code>.
This scales the residual equations that are used by the solver to the right order
of magnitude.
</p>
<p>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/RoomCO2.png\" border=\"1\"
     alt=\"RoomCO2.png\">
</p>
</html>"),
        __Dymola_Commands(file(ensureSimulated=true)=
            "modelica://Modelica/Resources/Scripts/Dymola/Fluid/RoomCO2/plotConcentrations.mos"
            "plot concentrations"));
    end RoomCO2;

    model RoomCO2WithControls "Demonstrates a room volume with CO2 controls"
      extends Modelica_Icons.Example;
      package Medium=Modelica_Media.Air.MoistAir(extraPropertiesNames={"CO2"},
                                                 C_nominal={1.519E-3});
      Modelica_Blocks.Sources.Constant CAtm(k=0.3*1.519E-3)
        "Atmospheric trace substance concentration, corresponding to 300 PPM CO2"
        annotation (Placement(transformation(extent={{-100,-48},{-80,-28}})));
      Modelica_Fluid.Sources.FixedBoundary boundary4(nPorts=1, redeclare
          package Medium = Medium)
        annotation (Placement(transformation(extent={{92,-40},{72,-20}})));
      Modelica_Fluid.Sensors.TraceSubstances traceVolume(redeclare package
          Medium = Medium)
        annotation (Placement(transformation(extent={{20,0},{40,20}})));
      inner Modelica_Fluid.System system(
        energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        use_eps_Re=true,
        m_flow_nominal=0.1,
        eps_m_flow=1e-2) annotation (Placement(transformation(extent={{70,70},{
                90,90}}, rotation=0)));
      Modelica_Fluid.Sources.MassFlowSource_T freshAir(
        use_C_in=true,
        redeclare package Medium = Medium,
        use_m_flow_in=true,
        nPorts=2)
        annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
      Modelica_Fluid.Vessels.ClosedVolume volume(
        C_start={1.519E-3},
        V=100,
        redeclare package Medium = Medium,
        massDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial,
        use_portsData=false,
        nPorts=4)
        annotation (Placement(transformation(extent={{0,-20},{20,0}})));
      Modelica_Fluid.Pipes.DynamicPipe ductOut(
        redeclare package Medium = Medium,
        diameter=0.15,
        redeclare model FlowModel =
            Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow (
              show_Res=true),
        modelStructure=Modelica_Fluid.Types.ModelStructure.a_v_b,
        length=5) "Outlet duct"
        annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
      Modelica_Fluid.Sensors.TraceSubstances traceDuctIn(redeclare package
          Medium = Medium) "Trace substance at duct inlet"
        annotation (Placement(transformation(extent={{-54,0},{-34,20}})));
      Modelica_Fluid.Sources.MassFlowSource_T peopleSource(
        m_flow=100/1.2/3600*5,
        redeclare package Medium = Medium,
        use_m_flow_in=true,
        use_C_in=false,
        C={100},
        nPorts=1) "CO2 emitted by room occupants."
        annotation (Placement(transformation(extent={{-38,-98},{-18,-78}})));
      Modelica_Blocks.Sources.CombiTimeTable NumberOfPeople(table=[0,0; 9*3600,0;
            9*3600,10; 11*3600,10; 11*3600,2; 13*3600,2; 13*3600,15; 15*3600,15;
            15*3600,5; 18*3600,5; 18*3600,0; 24*3600,0])
        "Time table for number of people in the room"
        annotation (Placement(transformation(extent={{-100,-90},{-80,-70}})));
      Modelica_Blocks.Math.Gain gain(k=8.18E-6/100)
        "CO2 mass flow rate, released per 100 person (there is another 100 factor in peopleSource)"
        annotation (Placement(transformation(extent={{-68,-90},{-48,-70}})));
      Modelica_Blocks.Math.Gain gain1(k=-100*1.2/3600*5)
        "Nominal fresh air flow rate (for u=1)"
        annotation (Placement(transformation(extent={{0,40},{20,60}})));
      Modelica_Blocks.Math.Gain gainSensor(k=1/1.519E-3)
        "Gain to normalize CO2 measurement signal. y=1 corresponds to 1000 PPM"
        annotation (Placement(transformation(extent={{60,0},{80,20}})));
      Modelica_Blocks.Sources.Constant CO2Set(k=1) "Normalized CO2 set point"
        annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
      Modelica_Blocks.Continuous.LimPID PID(
        controllerType=Modelica_Blocks.Types.SimpleController.PI,
        yMax=0,
        yMin=-1,
        Ti=10,
        k=10)   annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
      Modelica_Fluid.Pipes.DynamicPipe ductIn(
        redeclare package Medium = Medium,
        diameter=0.15,
        redeclare model FlowModel =
            Modelica_Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow (
              show_Res=true),
        modelStructure=Modelica_Fluid.Types.ModelStructure.a_v_b,
        length=5) "Inlet duct"
        annotation (Placement(transformation(extent={{-38,-40},{-18,-20}})));
      Modelica_Fluid.Sensors.TraceSubstances traceDuctOut(redeclare package
          Medium = Medium) "Trace substance at duct outlet"
        annotation (Placement(transformation(extent={{-20,0},{0,20}})));
    equation
      connect(CAtm.y, freshAir.C_in[1])
                                      annotation (Line(
          points={{-79,-38},{-70,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ductOut.port_b, boundary4.ports[1])      annotation (Line(
          points={{60,-30},{72,-30}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(NumberOfPeople.y[1], gain.u) annotation (Line(
          points={{-79,-80},{-70,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.y, peopleSource.m_flow_in) annotation (Line(
          points={{-47,-80},{-38,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(traceVolume.C, gainSensor.u)     annotation (Line(
          points={{41,10},{58,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CO2Set.y, PID.u_s) annotation (Line(
          points={{-59,50},{-42,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gainSensor.y, PID.u_m)
                                annotation (Line(
          points={{81,10},{90,10},{90,30},{-30,30},{-30,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PID.y, gain1.u) annotation (Line(
          points={{-19,50},{-2,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain1.y, freshAir.m_flow_in)  annotation (Line(
          points={{21,50},{30,50},{30,70},{-88,70},{-88,-22},{-70,-22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ductIn.port_b, volume.ports[1]) annotation (Line(
          points={{-18,-30},{7,-30},{7,-20}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(peopleSource.ports[1], volume.ports[2]) annotation (Line(
          points={{-18,-88},{9,-88},{9,-20}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume.ports[3], ductOut.port_a) annotation (Line(
          points={{11,-20},{11,-30},{40,-30}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(volume.ports[4], traceVolume.port) annotation (Line(
          points={{13,-20},{13,-26},{30,-26},{30,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(freshAir.ports[1], traceDuctIn.port) annotation (Line(
          points={{-50,-29.5},{-44,-29.5},{-44,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(ductIn.port_a, freshAir.ports[2]) annotation (Line(
          points={{-38,-30},{-38,-30.5},{-50,-30.5}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(traceDuctOut.port, ductIn.port_b) annotation (Line(
          points={{-10,0},{-10,-30},{-18,-30}},
          color={0,127,255},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=86400, Tolerance=1e-006),
        __Dymola_Commands(file(ensureSimulated=true)="modelica://Modelica/Resources/Scripts/Dymola/Fluid/RoomCO2WithControls/plotStatesWithControl.mos"
            "plot states and controls"),
        Documentation(info="<html>
<p>
This example illustrates a room volume with a CO2 source and a fresh air supply with feedback
control.
The CO2 emission rate is proportional to the room occupancy, which is defined by a schedule.
The fresh air flow rate is controlled such that the room CO2
concentration does not exceed <code>1000 PPM (=1.519E-3 kg/kg)</code>.
The fresh air has a CO2 concentration of <code>300 PPM</code> which corresponds to a typical
CO2 concentration in the outside air.
</p>

<p>
The CO2 emission from the occupants is implemented as a mass flow source.
Depending on the activity and size, a person emits about <code>8.18E-6 kg/s</code> CO2. In the model,
this value is multiplied by the number of occupants.
Since the mass flow rate associate with the CO2 source model contributes to the volume's energy balance,
this mass flow rate should be kept small. Thus, in the source model, we set the
CO2 concentration to <code>C={100} kg/kg</code>, and scaled the mass flow rate using
</p>

<pre>
  m_flow = 1/100 * nPeo * 8.18E-6 kg/(s*person)
</pre>

<p>
where <code>nPeo</code> is the number of people in the room.
This results in a mass flow rate that is about 5 orders of magnitudes smaller than the supply air flow rate,
and hence its contribution to the volume's energy balance is negligible.
</p>
<p>
The nominal value for the trace substance is set to <code>C_nominal={1.519E-3}</code>.
This scales the residual equations that are used by the solver to the right order
of magnitude.
</p>
<p>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/RoomCO2WithControls.png\" border=\"1\"
     alt=\"RoomCO2WithControls.png\">
</p>
</html>"));
    end RoomCO2WithControls;
  end TraceSubstances;

  model InverseParameterization
    "Demonstrates the parameterization of a pump and a pipe for given nominal values"
    extends Modelica_Icons.Example;

    replaceable package Medium = Modelica_Media.Water.StandardWater;
    //replaceable package Medium = Modelica_Media.Water.ConstantPropertyLiquidWater;

    //parameter Real eps_m_flow_turbulent = 0.0 "Turbulent flow |m_flow| >= eps_m_flow_nominal*m_flow_nominal";
    parameter Real eps_m_flow_turbulent = 0.1
      "Turbulent flow |m_flow| >= eps_m_flow_nominal*m_flow_nominal";
    //parameter Real eps_m_flow_turbulent = 1 "Turbulent flow |m_flow| >= eps_m_flow_nominal*m_flow_nominal";

    Modelica_Fluid.Sources.Boundary_pT source(
      redeclare package Medium = Medium,
      nPorts=1,
      use_p_in=false,
      p=100000) annotation (Placement(transformation(extent={{-76,14},{-64,26}},
            rotation=0)));
    Modelica_Fluid.Machines.ControlledPump pump(
      m_flow_nominal=1,
      control_m_flow=false,
      use_p_set=true,
      redeclare package Medium = Medium,
      p_a_nominal=100000,
      p_b_nominal=200000)
      annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
    Modelica_Fluid.Fittings.SimpleGenericOrifice orifice(
      redeclare package Medium = Medium,
      diameter=2.54e-2,
      use_zeta=false,
      zeta=0,
      dp_nominal=100000,
      m_flow_nominal=1) annotation (Placement(transformation(extent={{20,10},
              {40,30}}, rotation=0)));

    Modelica_Fluid.Sources.Boundary_pT sink(
      nPorts=1,
      redeclare package Medium = Medium,
      p=100000) annotation (Placement(transformation(extent={{76,14},{64,26}},
            rotation=0)));

    inner Modelica_Fluid.System system annotation (Placement(transformation(
            extent={{-90,50},{-70,70}}, rotation=0)));
    Modelica_Fluid.Pipes.StaticPipe pipe1(
      redeclare package Medium = Medium,
      diameter=2.54e-2,
      length=0,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.NominalTurbulentPipeFlow
          (
          show_Res=true,
          m_flow_nominal=1,
          m_flow_turbulent=eps_m_flow_turbulent*1,
          dp_nominal=100000)) annotation (Placement(transformation(extent={{
              20,-30},{40,-10}}, rotation=0)));
    Modelica_Fluid.Sources.Boundary_pT sink1(
      nPorts=1,
      redeclare package Medium = Medium,
      p=200000) annotation (Placement(transformation(extent={{76,-26},{64,-14}},
            rotation=0)));
    Modelica_Blocks.Sources.Ramp p_set(
      height=0.2e5,
      offset=1.9e5,
      duration=8,
      startTime=1)
      annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
    Modelica_Fluid.Pipes.StaticPipe pipe2(
      redeclare package Medium = Medium,
      diameter=2.54e-2,
      length=1000,
      redeclare model FlowModel =
          Modelica_Fluid.Pipes.BaseClasses.FlowModels.NominalLaminarFlow (
          show_Res=true,
          dp_nominal=100000,
          m_flow_nominal=1)) annotation (Placement(transformation(extent={{20,
              -70},{40,-50}}, rotation=0)));
    Modelica_Fluid.Sources.Boundary_pT sink2(
      nPorts=1,
      redeclare package Medium = Medium,
      p=200000) annotation (Placement(transformation(extent={{76,-66},{64,-54}},
            rotation=0)));
  equation
    connect(orifice.port_b, sink.ports[1])
                                         annotation (Line(
        points={{40,20},{64,20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(source.ports[1], pump.port_a) annotation (Line(
        points={{-64,20},{-40,20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pump.port_b, orifice.port_a)
                                      annotation (Line(
        points={{-20,20},{20,20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe1.port_b, sink1.ports[1]) annotation (Line(
        points={{40,-20},{64,-20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe1.port_a, pump.port_b) annotation (Line(
        points={{20,-20},{0,-20},{0,20},{-20,20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(p_set.y, pump.p_set) annotation (Line(
        points={{-29,50},{-25,50},{-25,28.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pipe2.port_b, sink2.ports[1]) annotation (Line(
        points={{40,-60},{64,-60}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(pump.port_b, pipe2.port_a) annotation (Line(
        points={{-20,20},{0,20},{0,-60},{20,-60}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (
      __Dymola_Commands(file(ensureSimulated=true)="modelica://Modelica/Resources/Scripts/Dymola/Fluid/InverseParameterization/plotResults.mos"
          "plotResults"),
      experiment(StopTime=10, Interval=0.001),
      Documentation(info="<html>
<p>
A pump, an orifice and two pipes are parameterized with simple nominal values.
Note that pipe1 and pipe2 use the flowModel NominalTurbulentFlow and NominalLaminarFlow, respectively,
which do not require the specification of geometry data.
Instead pathLengths_nominal are obtained internally for given nominal pressure loss and nominal mass flow rate.
</p>
<p>
The pump controls a pressure ramp from 1.9 bar to 2.1 bar.
This causes an appropriate ramp on the mass flow rate of the orifice, which has a boundary pressure of 1 bar.
Flow reversal occurs in the pipes, which have a boundary pressure of 2 bar.
The Command plotResults can be used to see the pump speed N, which is controlled ideally to obtain the pressure ramp.
Moreover the internally obtained nominal design values that fulfill the nominal operating conditions as well as
the Reynolds number, m_flows_turbulent, and dps_fg_turbulent are plotted.
</p>
<p>
Note that the large value for pipe2.flowModel.pathLengths_nominal[1] is only meaningful under the made assumption of laminar flow,
 which is hardly possible for a real pipe.
</p>
<p>
Once the geometries have been designed, the NominalTurbulentPipeFlow correlations can easily be replaced with
TurbulentPipeFlow or DetailedPipeFlow correlations. Similarly the ControlledPump can be replaced with a PrescribedPump
to investigate a real controller or with a Pump with rotational shaft to investigate inertia effects.
</p>
<p>
The model has the parameter <b>eps_m_flow_turbulent</b> that
can be used to change the flow through pipe1 from fully turbulent (eps_m_flow_turbulent=0) to fully laminar (eps_m_flow_turbulent>actual flow).
Invoke plotResults and see pipe1.port_a.m_flow. Relating the actual flow to pipe1.flowModel.m_flows_turbulent[1],
it can be seen that eps_m_flow_turbulent=0.1 is an appropriate choice for the given pipe diameter.
</p>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/InverseParametrization.png\" border=\"1\"
     alt=\"InverseParametrization.png\">
</html>"));
  end InverseParameterization;

  package Explanatory
    "A set of examples illustrating when special attention has to be paid"
    extends Modelica_Icons.ExamplesPackage;

    model MeasuringTemperature "Differences between using one port with
   and without explicit junction model and two port sensors for fluid temperature measuring"
       extends Modelica_Icons.Example;
      Modelica_Fluid.Sensors.Temperature T_onePort(redeclare package Medium =
            Modelica_Media.Water.StandardWater) annotation (Placement(
            transformation(extent={{-20,40},{0,60}}, rotation=0)));
      Modelica_Fluid.Sensors.TemperatureTwoPort T_twoPort(redeclare package
          Medium = Modelica_Media.Water.StandardWater) annotation (Placement(
            transformation(extent={{-20,-20},{0,0}}, rotation=0)));
      inner Modelica_Fluid.System system(energyDynamics=Modelica_Fluid.Types.Dynamics.FixedInitial)
        annotation (Placement(transformation(extent={{-100,56},{-80,76}},
              rotation=0)));
      Modelica_Fluid.Vessels.OpenTank openTankCold2(
        nPorts=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        height=2,
        crossArea=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                       diameter=0.05)},
        level_start=0.975,
        T_start=293.15) annotation (Placement(transformation(extent={{20,6},{
                40,26}}, rotation=0)));
      Modelica_Fluid.Vessels.OpenTank openTankCold1(
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        height=2,
        crossArea=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                       diameter=0.05)},
        nPorts=1,
        level_start=0.975,
        T_start=293.15) annotation (Placement(transformation(extent={{20,60},
                {40,80}}, rotation=0)));
      Modelica_Fluid.Vessels.OpenTank openTankHot1(
        nPorts=1,
        level_start=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        height=2,
        crossArea=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                       diameter=0.05)},
        T_start=353.15) annotation (Placement(transformation(extent={{60,40},
                {80,60}}, rotation=0)));
      Modelica_Fluid.Vessels.OpenTank openTankHot2(
        nPorts=1,
        level_start=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        height=2,
        crossArea=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                       diameter=0.05)},
        T_start=353.15) annotation (Placement(transformation(extent={{60,-10},
                {80,10}}, rotation=0)));
      Modelica_Fluid.Sources.MassFlowSource_T mFlow1(
        nPorts=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        use_m_flow_in=true,
        use_T_in=false,
        T=323.15) annotation (Placement(transformation(extent={{-60,30},{-40,
                50}}, rotation=0)));
      Modelica_Fluid.Sources.MassFlowSource_T mFlow2(
        nPorts=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        use_m_flow_in=true,
        T=323.15) annotation (Placement(transformation(extent={{-60,-20},{-40,
                0}}, rotation=0)));
      Modelica_Blocks.Sources.Sine sine(freqHz=1)
                                        annotation (Placement(transformation(extent=
               {{-100,10},{-80,30}}, rotation=0)));
      Modelica_Fluid.Sensors.Temperature T_junction(redeclare package Medium =
            Modelica_Media.Water.StandardWater) annotation (Placement(
            transformation(extent={{-20,-80},{0,-60}}, rotation=0)));
      Modelica_Fluid.Vessels.OpenTank openTankCold3(
        nPorts=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        height=2,
        crossArea=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                       diameter=0.05)},
        level_start=0.975,
        T_start=293.15) annotation (Placement(transformation(extent={{20,-60},
                {40,-40}}, rotation=0)));
      Modelica_Fluid.Vessels.OpenTank openTankHot3(
        nPorts=1,
        level_start=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        height=2,
        crossArea=2,
        portsData={Modelica_Fluid.Vessels.BaseClasses.VesselPortsData(
                                                       diameter=0.05)},
        T_start=353.15) annotation (Placement(transformation(extent={{60,-80},
                {80,-60}}, rotation=0)));
      Modelica_Fluid.Sources.MassFlowSource_T mFlow3(
        nPorts=1,
        redeclare package Medium = Modelica_Media.Water.StandardWater,
        use_m_flow_in=true,
        T=323.15) annotation (Placement(transformation(extent={{-60,-90},{-40,
                -70}}, rotation=0)));
      Modelica_Fluid.Fittings.TeeJunctionIdeal junctionIdeal(redeclare package
          Medium =         Modelica_Media.Water.StandardWater) annotation (
          Placement(transformation(extent={{20,-90},{40,-70}}, rotation=0)));
    equation
      connect(mFlow2.ports[1], T_twoPort.port_a)             annotation (Line(
          points={{-40,-10},{-20,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(mFlow1.ports[1], T_onePort.port)             annotation (Line(
          points={{-40,40},{-10,40}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(sine.y, mFlow1.m_flow_in)        annotation (Line(
          points={{-79,20},{-70,20},{-70,48},{-60,48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sine.y, mFlow2.m_flow_in)        annotation (Line(
          points={{-79,20},{-70,20},{-70,-2},{-60,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mFlow3.ports[1], T_junction.port)                    annotation (Line(
          points={{-40,-80},{-10,-80}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(sine.y, mFlow3.m_flow_in)        annotation (Line(
          points={{-79,20},{-70,20},{-70,-72},{-60,-72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T_junction.port, junctionIdeal.port_1)          annotation (Line(
          points={{-10,-80},{20,-80}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(T_twoPort.port_b, openTankCold2.ports[1])          annotation (Line(
            points={{0,-10},{0,-10},{30,-10},{30,6}},  color={0,127,255}));
      connect(T_onePort.port, openTankHot1.ports[1])   annotation (Line(
            points={{-10,40},{-10,40},{70,40}},            color={0,127,255}));
      connect(T_twoPort.port_b, openTankHot2.ports[1])          annotation (Line(
            points={{0,-10},{30,-10},{70,-10}},              color={0,127,255}));
      connect(junctionIdeal.port_3, openTankCold3.ports[1]) annotation (Line(points={{30,-70},
              {30,-65},{30,-60}},   color={0,127,255}));
      connect(junctionIdeal.port_2, openTankHot3.ports[1]) annotation (Line(points={{40,-80},
              {55.5,-80},{70,-80}},                          color={0,127,255}));
      connect(T_onePort.port, openTankCold1.ports[1])   annotation (Line(
          points={{-10,40},{30,40},{30,60}},
          color={0,127,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics={
            Text(
              extent={{42,52},{62,46}},
              lineColor={0,0,0},
              textString="T=80"),
            Text(
              extent={{-4,76},{18,70}},
              lineColor={0,0,0},
              textString="T=20"),
            Text(
              extent={{-62,20},{-36,12}},
              lineColor={0,0,0},
              textString="T=50")}),
                           Documentation(info="<html>
<p>
This model demonstrates the differences that occur when using
one- and two-port temperature sensors with and without explicit junction models.
As shown in the next figure, the same system is shown in 3 different variations.
In all cases exactly the same fluid system is defined. The only difference is
how the temperature is measured:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/MeasuringTemperature1.png\"
     alt=\"MeasuringTemperature1.png\">
</blockquote>

<p>
A pre-defined mass flow rate is present so that fluid flows from the reservoir to the
tanks and after 0.5 s the mass flows from the tanks to the reservoir.
The reservoir has a temperature of 50<sup>0</sup>C whereas the tanks have an
initial temperature of 20<sup>0</sup>C and of 80<sup>0</sup>C. The initial height of the
tanks is made in such a form that fluid always flows out of the cold tank.
When the fluid flows from the reservoir to the tanks, then it mixes with the
cold tank and enters the hot tank.
When the fluid flow from the tanks to the reservoir, then the cold and hot water
from the two tanks first mixes and the flows to the reservoir.
</p>

<p>
A one-port sensor measures the <em>mixing</em> temperature at a connection point.
Therefore T_onePort.T (the blue curve in the figure below) is the
temperature of the mixing point.
A two-port sensor measures the temperature at the <em>upstream</em> side.
Therefore T_twoPort.T (the red curve in the figure below which is identical
to the green curve) shows first the temperature of the reservoir and then
the mixing temperature when fluid flows from the tanks to the reservoir.
The same is measured with T_junction.T (the green curve below), because
the one-port sensor is connected between the mass flow source and the junction
and since the mixing takes place in the junction, the same situation is
present as for T_twoPort.T.
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/MeasuringTemperature2.png\"
     alt=\"MeasuringTemperature2.png\">
</blockquote>

</html>"),
        experiment(StopTime=1.1));
    end MeasuringTemperature;

    model MomentumBalanceFittings
      "Illustrating a case in which kinetic terms play a major role in the momentum balance"
       extends Modelica_Icons.Example;
      Modelica_Fluid.Sources.Boundary_pT leftBoundary1(
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        nPorts=1,
        p=100000)
        annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

      Modelica_Fluid.Sources.Boundary_pT rightBoundary1(
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        nPorts=1,
        p=110000)
        annotation (Placement(transformation(extent={{80,20},{60,40}})));

      Modelica_Fluid.Fittings.AbruptAdaptor suddenExpansion1(
        diameter_a=0.1,
        diameter_b=0.2,
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        show_totalPressures=true,
        show_portVelocities=true)
        annotation (Placement(transformation(extent={{-12,20},{8,40}})));

      Modelica_Fluid.Sources.Boundary_pT leftBoundary2(
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        nPorts=1,
        p=100000)
        annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));

      Modelica_Fluid.Sources.Boundary_pT rightBoundary2(
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        nPorts=1,
        p=110000)
        annotation (Placement(transformation(extent={{90,-40},{70,-20}})));

      Modelica_Fluid.Fittings.AbruptAdaptor suddenExpansion2(
        diameter_a=0.1,
        diameter_b=0.2,
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        show_totalPressures=true,
        show_portVelocities=true)
        annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));

      Modelica_Fluid.Fittings.AbruptAdaptor leftAdaptor(
        diameter_a=0.1,
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        diameter_b=Modelica_Constants.inf)
        annotation (Placement(transformation(extent={{-40,-40},{-60,-20}})));

      Modelica_Fluid.Fittings.AbruptAdaptor rightAdaptor(
        redeclare package Medium = Modelica_Media.Water.StandardWaterOnePhase,
        diameter_a=0.2,
        diameter_b=Modelica_Constants.inf)
        annotation (Placement(transformation(extent={{40,-40},{60,-20}})));

      inner Modelica_Fluid.System system
        annotation (Placement(transformation(extent={{-92,56},{-72,76}})));
    equation
      connect(leftBoundary1.ports[1], suddenExpansion1.port_a) annotation (Line(
          points={{-60,30},{-12,30}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(suddenExpansion1.port_b, rightBoundary1.ports[1]) annotation (Line(
          points={{8,30},{60,30}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(leftAdaptor.port_b, leftBoundary2.ports[1]) annotation (Line(
          points={{-60,-30},{-70,-30}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(leftAdaptor.port_a, suddenExpansion2.port_a) annotation (Line(
          points={{-40,-30},{-10,-30}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(suddenExpansion2.port_b,rightAdaptor. port_a) annotation (Line(
          points={{10,-30},{40,-30}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(rightAdaptor.port_b, rightBoundary2.ports[1]) annotation (Line(
          points={{60,-30},{70,-30}},
          color={0,127,255},
          smooth=Smooth.None));
      annotation (
        Documentation(info="<html>
<p>
This example shows the use of a sudden expansion / contraction model, which is connected to two boundary conditions prescribing static pressure. Notice that the prescribed static pressure on the right boundary is higher than on the left one. Still, the fluid flows from left to right.
</p>
<p>
The reason for this is that the boundary conditions model infinite reservoirs with an infinite diameter and thus zero flow velocity. The sudden expansion model does however have two ends with finite diameters, and, as explained in the <a href=\"modelica://Modelica_Fluid.UsersGuide.Overview\">Overview</a> of the Users' Guide, the momentum balance is not fulfilled exactly for this type of connections. Using a simple <code>connect()</code>-statement, the difference of the kinetic terms is neglected, which is not reasonable in the present model: At the left boundary condition it is zero, and on the left side of the sudden expansion it has a non-zero value. It is not reasonable to neglect it in the shown model, because there is little friction and therefore these kinetic effects dominate. Consequently, only modelling these effects explicitly leads to the correct results.
</p>
<p>
To do so, two additional sudden expansions / contractions are included in the model. The diameter is set to <code>inf</code> close to the boundaries and the proper values close to the original model. These additional components now introduce <i>exact</i> momentum balances and the results are as expected.
</p>
<p>
The total pressures offer an additional perspective on the model. After setting the parameter <code>show_totalPressures</code> on the Advanced tab of the <code>AbruptAdaptor</code>s to <code>true</code>, the total pressures are included in said models and may be plotted. This allows to confirm that the <b>total</b> pressure <i>always</i> reduces along the flow direction, even in the upper model.
</p>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/MomentumBalanceFittings.png\" border=\"1\"
     alt=\"MomentumBalanceFittings.png\">
</html>"),
        __Dymola_Commands(file=
              "modelica://Modelica/Resources/Scripts/Dymola/Fluid/MomentumBalanceFittings/Plot the model results.mos"
            "Plot the model results"),
        experiment(StopTime=1.1));
    end MomentumBalanceFittings;
  end Explanatory;
  annotation(preferredView="info",
             uses(Modelica_Constants(version="3.2.2"),
                  Modelica_StateGraph(version="3.2.2"),
                  Modelica_Thermal_HeatTransfer(version="3.2.2"),
                  Modelica_Blocks(version="3.2.2"),
                  Modelica_SIunits(version="3.2.2"),
                  Modelica_Fluid(version="3.2.2"),
                  Modelica_Media(version="3.2.2"),
                  Modelica_Icons(version="3.2.2")),
             version="3.2.2");
end Modelica_Fluid_Examples;
