within ;
encapsulated package Modelica_Electrical_Machines_Interfaces
  "SpacePhasor connector and PartialMachines"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Electrical_Machines;
  import Modelica_Constants;
  import Modelica_Mechanics_Rotational_Interfaces;
  import Modelica_Mechanics_Rotational;
  import Modelica_Electrical_MultiPhase_Interfaces;
  import Modelica_Electrical_MultiPhase;
  import Modelica_Electrical_Analog;
  import Modelica_Thermal_HeatTransfer_Interfaces;
  import Modelica_Thermal_HeatTransfer;
  import Modelica_Blocks_Interfaces;
  import Modelica_Blocks;
  import Modelica_Electrical_Analog_Interfaces;
  import Modelica_Utilities;
  extends Modelica_Icons.InterfacesPackage;
  connector SpacePhasor "Connector for Space Phasors"
    Modelica_SIunits.Voltage v_[2] "1=real, 2=imaginary part";
    flow Modelica_SIunits.Current i_[2] "1=real, 2=imaginary part";
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}), graphics={Polygon(
                points={{0,100},{-100,0},{0,-100},{100,0},{0,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),Text(
                extent={{-150,-90},{150,-150}},
                lineColor={0,0,255},
                textString="%name")}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Polygon(
                points={{0,100},{-100,0},{0,-100},{100,0},{0,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid)}),
      Documentation(info="<HTML>
Connector for Space Phasors:
<ul>
<li>Voltage v_[2] ... Real and Imaginary part of voltage space phasor</li>
<li>Current i_[2] ... Real and Imaginary part of current space phasor</li>
</ul>
</HTML>"));
  end SpacePhasor;

  partial model PartialBasicMachine "Partial model for all machines"
    extends Modelica_Electrical_Machines.Icons.TransientMachine;
    constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
    parameter Modelica_SIunits.Inertia Jr "Rotor's moment of inertia";
    parameter Boolean useSupport=false
      "Enable / disable (=fixed stator) support" annotation (Evaluate=true);
    parameter Modelica_SIunits.Inertia Js(start=Jr)
      "Stator's moment of inertia" annotation (Dialog(enable=useSupport));
    parameter Boolean useThermalPort=false
      "Enable / disable (=fixed temperatures) thermal port"
      annotation (Evaluate=true);
    parameter Modelica_Electrical_Machines.Losses.FrictionParameters frictionParameters
      "Friction losses" annotation (Dialog(tab="Losses"));
    output Modelica_SIunits.Angle phiMechanical(start=0) = flange.phi -
      internalSupport.phi "Mechanical angle of rotor against stator";
    output Modelica_SIunits.AngularVelocity wMechanical(
      displayUnit="1/min",
      start=0) = der(phiMechanical)
      "Mechanical angular velocity of rotor against stator";
    output Modelica_SIunits.Torque tauElectrical=inertiaRotor.flange_a.tau
      "Electromagnetic torque";
    output Modelica_SIunits.Torque tauShaft=-flange.tau "Shaft torque";
    Modelica_Mechanics_Rotational_Interfaces.Flange_a flange "Shaft"
      annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation
            =0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertiaRotor(final J=Jr)
      annotation (Placement(transformation(
          origin={80,0},
          extent={{10,10},{-10,-10}},
          rotation=180)));
    Modelica_Mechanics_Rotational_Interfaces.Flange_a support if useSupport
      "Support at which the reaction torque is acting" annotation (Placement(
          transformation(extent={{90,-110},{110,-90}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertiaStator(final J=Js)
      annotation (Placement(transformation(
          origin={80,-100},
          extent={{10,10},{-10,-10}},
          rotation=180)));
    Modelica_Mechanics_Rotational.Components.Fixed fixed if (not useSupport)
      annotation (Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=180,
          origin={50,-100})));
    Modelica_Electrical_Machines.Losses.Friction friction(final
        frictionParameters=frictionParameters) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={90,-40})));
  protected
    Modelica_Mechanics_Rotational_Interfaces.Support internalSupport
      annotation (Placement(transformation(extent={{56,-104},{64,-96}},
            rotation=0)));
  equation
    connect(inertiaRotor.flange_b, flange) annotation (Line(points={{90,0},{
            92,0},{92,0},{100,0}}, color={0,0,0}));
    connect(inertiaStator.flange_b, support)
      annotation (Line(points={{90,-100},{100,-100}}, color={0,0,0}));
    connect(internalSupport, fixed.flange) annotation (Line(
        points={{60,-100},{50,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(internalSupport, inertiaStator.flange_a) annotation (Line(
        points={{60,-100},{70,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(inertiaRotor.flange_b, friction.flange) annotation (Line(
        points={{90,0},{90,-30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(friction.support, internalSupport) annotation (Line(
        points={{90,-50},{90,-90},{60,-90},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
                extent={{-150,-120},{150,-180}},
                lineColor={0,0,255},
                textString="%name"),Rectangle(
                extent={{80,-80},{120,-120}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                visible=not useSupport,
                points={{80,-100},{120,-100}},
                color={0,0,0},
                smooth=Smooth.None),Line(
                visible=not useSupport,
                points={{90,-100},{80,-120}},
                color={0,0,0},
                smooth=Smooth.None),Line(
                visible=not useSupport,
                points={{100,-100},{90,-120}},
                color={0,0,0},
                smooth=Smooth.None),Line(
                visible=not useSupport,
                points={{110,-100},{100,-120}},
                color={0,0,0},
                smooth=Smooth.None),Line(
                visible=not useSupport,
                points={{120,-100},{110,-120}},
                color={0,0,0},
                smooth=Smooth.None)}), Documentation(info="<HTML>
Base partial model DC machines:
<ul>
<li>main parts of the icon</li>
<li>mechanical shaft</li>
<li>mechanical support</li>
</ul>
Besides the mechanical connector <i>flange</i> (i.e., the shaft) the machines have a second mechanical connector <i>support</i>.<br>
If <i>useSupport</i> = false, it is assumed that the stator is fixed.<br>
Otherwise reaction torque (i.e., airGap torque, minus acceleration torque for stator's moment of inertia) can be measured at <i>support</i>.<br>
One may also fix the the shaft and let rotate the stator; parameter Js is only of importance when the stator is rotating.
</HTML>"));
  end PartialBasicMachine;

  partial model PartialBasicInductionMachine
    "Partial model for induction machine"
    final parameter Integer m=3 "Number of phases";
    parameter Integer p(min=1, start=2) "Number of pole pairs (Integer)";
    parameter Modelica_SIunits.Frequency fsNominal(start=50)
      "Nominal frequency";
    parameter Modelica_SIunits.Temperature TsOperational(start=293.15)
      "Operational temperature of stator resistance" annotation (Dialog(group=
           "Operational temperatures", enable=not useThermalPort));
    parameter Modelica_SIunits.Resistance Rs(start=0.03)
      "Stator resistance per phase at TRef"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Temperature TsRef(start=293.15)
      "Reference temperature of stator resistance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter
      Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20 alpha20s(start=0)
      "Temperature coefficient of stator resistance at 20 degC"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Inductance Lszero=Lssigma
      "Stator zero sequence inductance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Inductance Lssigma(start=3*(1 - sqrt(1 -
          0.0667))/(2*pi*fsNominal)) "Stator stray inductance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    extends PartialBasicMachine(
      Jr(start=0.29),
      frictionParameters(wRef=2*pi*fsNominal/p),
      friction(final useHeatPort=true));
    parameter Modelica_Electrical_Machines.Losses.CoreParameters statorCoreParameters(
      final m=3,
      VRef(start=100),
      wRef=2*pi*fsNominal)
      "Stator core losses; all parameters refer to stator side"
      annotation (Dialog(tab="Losses"));
    parameter Modelica_Electrical_Machines.Losses.StrayLoadParameters strayLoadParameters(IRef(
          start=100), wRef=2*pi*fsNominal/p) "Stray load losses"
      annotation (Dialog(tab="Losses"));
    replaceable output InductionMachines.PartialPowerBalanceInductionMachines
      powerBalance(
      final powerStator=Modelica_Electrical_Machines.SpacePhasors.Functions.activePower(
                                                           vs, is),
      final powerMechanical=wMechanical*tauShaft,
      final powerInertiaStator=inertiaStator.J*inertiaStator.a*inertiaStator.w,
      final powerInertiaRotor=inertiaRotor.J*inertiaRotor.a*inertiaRotor.w,
      final lossPowerStatorWinding=sum(rs.resistor.LossPower),
      final lossPowerStatorCore=statorCore.lossPower,
      final lossPowerStrayLoad=strayLoad.lossPower,
      final lossPowerFriction=friction.lossPower) "Power balance";

    output Modelica_SIunits.Voltage vs[m]=plug_sp.pin.v - plug_sn.pin.v
      "Stator instantaneous voltages";
    output Modelica_SIunits.Current is[m]=plug_sp.pin.i
      "Stator instantaneous currents";
    output Modelica_SIunits.Current i_0_s(stateSelect=StateSelect.prefer)=
      spacePhasorS.zero.i "Stator zero-sequence current";
    // to be defined in model that extends from this partial (since airgap isn't included here)
    input Modelica_SIunits.Current idq_ss[2]
      "Stator space phasor current / stator fixed frame";
    input Modelica_SIunits.Current idq_sr[2](each stateSelect=StateSelect.prefer)
      "Stator space phasor current / rotor fixed frame";
    input Modelica_SIunits.Current idq_rs[2]
      "Rotor space phasor current / stator fixed frame";
    input Modelica_SIunits.Current idq_rr[2](each stateSelect=StateSelect.prefer)
      "Rotor space phasor current / rotor fixed frame";
    Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_sp(final m=m)
      "Positive stator plug" annotation (Placement(transformation(extent={{50,
              90},{70,110}}, rotation=0)));
    Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_sn(final m=m)
      "Negative stator plug" annotation (Placement(transformation(extent={{-70,
              90},{-50,110}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Resistor rs(
      final m=m,
      final R=fill(Rs, m),
      final T_ref=fill(TsRef, m),
      final alpha=fill(Modelica_Electrical_Machines.Thermal.convertAlpha(
          alpha20s, TsRef), m),
      final useHeatPort=true,
      final T=fill(TsRef, m)) annotation (Placement(transformation(extent={{60,
              70},{40,90}}, rotation=0)));
    Modelica_Electrical_Machines.BasicMachines.Components.Inductor lssigma(final L=
          fill(Lssigma, 2)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={20,20})));
    Modelica_Electrical_Analog.Basic.Inductor lszero(final L=Lszero)
      annotation (Placement(transformation(extent={{0,40},{-20,60}})));
    Modelica_Electrical_Machines.Losses.InductionMachines.Core statorCore(
      final coreParameters=statorCoreParameters,
      final useHeatPort=true,
      final turnsRatio=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={0,30})));
    Modelica_Electrical_Machines.SpacePhasors.Components.SpacePhasor spacePhasorS(final
        turnsRatio=1) annotation (Placement(transformation(
          origin={0,70},
          extent={{10,10},{-10,-10}},
          rotation=90)));
    Modelica_Electrical_Machines.Losses.InductionMachines.StrayLoad strayLoad(
      final strayLoadParameters=strayLoadParameters,
      final useHeatPort=true,
      final m=m)
      annotation (Placement(transformation(extent={{90,70},{70,90}})));
    replaceable InductionMachines.PartialThermalPortInductionMachines thermalPort(final m=m) if
         useThermalPort
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
    replaceable InductionMachines.PartialThermalAmbientInductionMachines thermalAmbient(
      final useTemperatureInputs=false,
      final Ts=TsOperational,
      final m=m) if not useThermalPort annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-80})));
  protected
    replaceable InductionMachines.PartialThermalPortInductionMachines internalThermalPort(final m=m)
      annotation (Placement(transformation(extent={{-4,-84},{4,-76}})));
  equation
    connect(spacePhasorS.plug_n, plug_sn) annotation (Line(
        points={{-10,80},{-60,80},{-60,100}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(thermalPort, internalThermalPort) annotation (Line(
        points={{0,-100},{0,-80}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
        points={{-20,-80},{0,-80}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(strayLoad.plug_n, rs.plug_p) annotation (Line(
        points={{70,80},{60,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(strayLoad.plug_p, plug_sp) annotation (Line(
        points={{90,80},{90,100},{60,100}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(strayLoad.support, internalSupport) annotation (Line(
        points={{80,70},{80,50},{60,50},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(spacePhasorS.plug_p, rs.plug_n) annotation (Line(
        points={{10,80},{40,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(spacePhasorS.zero, lszero.p) annotation (Line(
        points={{0,60},{0,50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(lszero.n, spacePhasorS.ground) annotation (Line(
        points={{-20,50},{-20,60},{-10,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(spacePhasorS.spacePhasor, lssigma.spacePhasor_a) annotation (Line(
        points={{10,60},{20,60},{20,30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(statorCore.spacePhasor, lssigma.spacePhasor_a) annotation (Line(
        points={{10,30},{20,30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(statorCore.heatPort, internalThermalPort.heatPortStatorCore)
      annotation (Line(
        points={{10,40},{50,40},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(strayLoad.heatPort, internalThermalPort.heatPortStrayLoad)
      annotation (Line(
        points={{90,70},{90,60},{50,60},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(rs.heatPort, internalThermalPort.heatPortStatorWinding)
      annotation (Line(
        points={{50,70},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(friction.heatPort, internalThermalPort.heatPortFriction)
      annotation (Line(
        points={{80,-50},{50,-50},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(strayLoad.flange, inertiaRotor.flange_b) annotation (Line(
        points={{80,90},{100,90},{100,40},{90,40},{90,0}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<HTML>
Partial model for induction machine models
</HTML>"),
         Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}), graphics={Line(points={{-50,100},{-20,100},{-20,70}},
            color={0,0,255}),Line(points={{50,100},{20,100},{20,70}}, color={
            0,0,255})}));
  end PartialBasicInductionMachine;

  package InductionMachines
    "Interfaces and partial models for induction machines"
    extends Modelica_Icons.VariantsPackage;
    connector PartialThermalPortInductionMachines
      "Partial thermal port of induction machines"
      parameter Integer m=3 "Number of stator phases";
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortStatorWinding[m]
        "Heat port of stator windings"
        annotation (Placement(transformation(extent={{-20,10},{0,30}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortStatorCore
        "Heat port of (optional) stator core losses"
        annotation (Placement(transformation(extent={{0,10},{20,30}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortRotorCore
        "Heat port of (optional) rotor core losses"
        annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortStrayLoad
        "Heat port of (optional) stray losses"
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortFriction
        "Heat port of (optional) friction losses"
        annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
      annotation (
        Diagram(graphics={Rectangle(
                    extent={{-60,60},{60,-60}},
                    lineColor={199,0,0},
                    fillColor={95,95,95},
                    fillPattern=FillPattern.Solid),Ellipse(
                    extent={{-50,50},{50,-50}},
                    lineColor={191,0,0},
                    fillColor={191,0,0},
                    fillPattern=FillPattern.Solid)}),
        Icon(graphics={Rectangle(
                    extent={{-110,110},{110,-110}},
                    lineColor={199,0,0},
                    fillColor={95,95,95},
                    fillPattern=FillPattern.Solid),Ellipse(
                    extent={{-80,80},{80,-80}},
                    lineColor={191,0,0},
                    fillColor={191,0,0},
                    fillPattern=FillPattern.Solid)}),
        Documentation(info="<HTML>
Partial thermal port for induction machines
</HTML>"));
    end PartialThermalPortInductionMachines;

    model PartialThermalAmbientInductionMachines
      "Partial thermal ambient for induction machines"
      parameter Integer m=3 "Number of stator phases";
      parameter Boolean useTemperatureInputs=false
        "If true, temperature inputs are used; else, temperatures are constant"
        annotation (Evaluate=true);
      constant Modelica_SIunits.Temperature TDefault=293.15
        "Default temperature";
      parameter Modelica_SIunits.Temperature Ts(start=TDefault)
        "Temperature of stator windings"
        annotation (Dialog(enable=not useTemperatureInputs));
      output Modelica_SIunits.HeatFlowRate Q_flowStatorWinding=
          temperatureStatorWinding.port.Q_flow
        "Heat flow rate of stator windings";
      output Modelica_SIunits.HeatFlowRate Q_flowStatorCore=
          temperatureStatorCore.port.Q_flow
        "Heat flow rate of stator core losses";
      output Modelica_SIunits.HeatFlowRate Q_flowRotorCore=
          temperatureRotorCore.port.Q_flow
        "Heat flow rate of stator core losses";
      output Modelica_SIunits.HeatFlowRate Q_flowStrayLoad=
          temperatureStrayLoad.port.Q_flow
        "Heat flow rate of stray load losses";
      output Modelica_SIunits.HeatFlowRate Q_flowFriction=temperatureFriction.port.Q_flow
        "Heat flow rate of friction losses";
      replaceable PartialThermalPortInductionMachines thermalPort(final m=m)
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));
      Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature temperatureStatorWinding
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,30})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature
        temperatureStatorCore(final T=TDefault) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={20,50})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature
        temperatureRotorCore(final T=TDefault) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,30})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature
        temperatureStrayLoad(final T=TDefault) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={60,50})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature
        temperatureFriction(final T=TDefault) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={80,30})));
      Modelica_Blocks_Interfaces.RealInput TStatorWinding if
        useTemperatureInputs "Temperature of stator windings" annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-80,-100})));
      Modelica_Blocks.Sources.Constant constTs(final k=Ts) if not
        useTemperatureInputs annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-10})));
      Modelica_Thermal_HeatTransfer.Components.ThermalCollector
        thermalCollectorStator(final m=m)
        annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
    equation
      connect(constTs.y, temperatureStatorWinding.T) annotation (Line(
          points={{-80,1},{-80,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TStatorWinding, temperatureStatorWinding.T) annotation (Line(
          points={{-80,-100},{-80,-60},{-100,-60},{-100,8},{-80,8},{-80,18}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(temperatureStrayLoad.port, thermalPort.heatPortStrayLoad)
        annotation (Line(
          points={{60,60},{60,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureFriction.port, thermalPort.heatPortFriction)
        annotation (Line(
          points={{80,40},{80,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(thermalCollectorStator.port_b, temperatureStatorWinding.port)
        annotation (Line(
          points={{-80,60},{-80,40}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(thermalCollectorStator.port_a, thermalPort.heatPortStatorWinding)
        annotation (Line(
          points={{-80,80},{-80,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureStatorCore.port, thermalPort.heatPortStatorCore)
        annotation (Line(
          points={{20,60},{20,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureRotorCore.port, thermalPort.heatPortRotorCore)
        annotation (Line(
          points={{40,40},{40,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      annotation (Icon(graphics={Rectangle(
                    extent={{-100,100},{100,-100}},
                    lineColor={0,0,0},
                    pattern=LinePattern.None,
                    fillColor={159,159,223},
                    fillPattern=FillPattern.Backward),Line(
                    points={{-14,0},{54,0}},
                    color={191,0,0},
                    thickness=0.5,
                    origin={0,-6},
                    rotation=90),Polygon(
                    points={{-20,-20},{-20,20},{20,0},{-20,-20}},
                    lineColor={191,0,0},
                    fillColor={191,0,0},
                    fillPattern=FillPattern.Solid,
                    origin={0,68},
                    rotation=90)}), Documentation(info="<HTML>
Partial thermal ambient for induction machines
</HTML>"));
    end PartialThermalAmbientInductionMachines;

    record PartialPowerBalanceInductionMachines
      "Partial power balance of induction machines"
      extends Modelica_Icons.Record;
      Modelica_SIunits.Power powerStator=0 "Electrical power (stator)";
      Modelica_SIunits.Power powerMechanical=0 "Mechanical power";
      Modelica_SIunits.Power powerInertiaStator=0 "Stator inertia power";
      Modelica_SIunits.Power powerInertiaRotor=0 "Rotor inertia power";
      Modelica_SIunits.Power lossPowerTotal=0 "Total loss power";
      Modelica_SIunits.Power lossPowerStatorWinding=0 "Stator copper losses";
      Modelica_SIunits.Power lossPowerStatorCore=0 "Stator core losses";
      Modelica_SIunits.Power lossPowerRotorCore=0 "Rotor core losses";
      Modelica_SIunits.Power lossPowerStrayLoad=0 "Stray load losses";
      Modelica_SIunits.Power lossPowerFriction=0 "Friction losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Partial power balance of induction machines.
 </HTML>"));
    end PartialPowerBalanceInductionMachines;

    connector ThermalPortAIMC
      "Thermal port of asynchronous induction machine with squirrel cage"
      extends PartialThermalPortInductionMachines;
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortRotorWinding "Heat port of rotor (squirrel cage)"
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      annotation (Documentation(info="<HTML>
Thermal port for asynchronous induction machine with squirrel cage
</HTML>"));
    end ThermalPortAIMC;

    record PowerBalanceAIMC
      "Power balance of asynchronous induction machines with squirrel cage"
      extends PartialPowerBalanceInductionMachines(final lossPowerTotal=
            lossPowerStatorWinding + lossPowerStatorCore + lossPowerRotorCore
             + lossPowerStrayLoad + lossPowerFriction + lossPowerRotorWinding);
      Modelica_SIunits.Power lossPowerRotorWinding "Rotor copper losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of asynchronous induction machines with squirrel cage.
 </HTML>"));
    end PowerBalanceAIMC;

    connector ThermalPortAIMS
      "Thermal port of asynchronous induction machine with slipring"
      extends PartialThermalPortInductionMachines;
      parameter Integer mr=m "Number of rotor phases";
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortRotorWinding[mr] "Heat port of rotor windings"
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortBrush
        "Heat port of (optional) brush losses"
        annotation (Placement(transformation(extent={{-10,30},{10,50}})));
      annotation (Documentation(info="<HTML>
Thermal port for asynchronous induction machine with slipring rotor
</HTML>"));
    end ThermalPortAIMS;

    record PowerBalanceAIMS
      "Power balance of asynchronous induction machines with slipring"
      extends PartialPowerBalanceInductionMachines(final lossPowerTotal=
            lossPowerStatorWinding + lossPowerStatorCore + lossPowerRotorCore
             + lossPowerStrayLoad + lossPowerFriction + lossPowerRotorWinding
             + lossPowerBrush);
      Modelica_SIunits.Power lossPowerRotorWinding "Rotor copper losses";
      Modelica_SIunits.Power lossPowerBrush "Brush losses";
      Modelica_SIunits.Power powerRotor "Electrical power (rotor)";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of asynchronous induction machines with slipring.
 </HTML>"));
    end PowerBalanceAIMS;

    connector ThermalPortSMPM
      "Thermal port of synchronous induction machine with permanent magnets"
      extends PartialThermalPortInductionMachines;
      parameter Boolean useDamperCage(start=true)
        "Enable / disable damper cage" annotation (Evaluate=true);
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortRotorWinding if useDamperCage
        "Heat port of damper cage (optional)"
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortPermanentMagnet "Heat port of permanent magnets"
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      annotation (Documentation(info="<HTML>
Thermal port for synchronous induction machine with permanent magnets
</HTML>"));
    end ThermalPortSMPM;

    record PowerBalanceSMPM
      "Power balance of synchronous induction machines with permanent magnet"
      extends PartialPowerBalanceInductionMachines(final lossPowerTotal=
            lossPowerStatorWinding + lossPowerStatorCore + lossPowerRotorCore
             + lossPowerStrayLoad + lossPowerFriction + lossPowerRotorWinding
             + lossPowerPermanentMagnet);
      Modelica_SIunits.Power lossPowerRotorWinding "Rotor copper losses";
      Modelica_SIunits.Power lossPowerPermanentMagnet "Permanent magnet losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of synchronous induction machines with permanent magnet.
 </HTML>"));
    end PowerBalanceSMPM;

    connector ThermalPortSMEE
      "Thermal port of synchronous induction machine with electrical excitation"
      extends PartialThermalPortInductionMachines;
      parameter Boolean useDamperCage(start=true)
        "Enable / disable damper cage" annotation (Evaluate=true);
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortRotorWinding if useDamperCage
        "Heat port of damper cage (optional)"
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortExcitation
        "Heat port of excitation"
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortBrush
        "Heat port of (optional) brush losses"
        annotation (Placement(transformation(extent={{-10,30},{10,50}})));
      annotation (Documentation(info="<HTML>
Thermal port for synchronous induction machine with electrical excitation
</HTML>"));
    end ThermalPortSMEE;

    record PowerBalanceSMEE
      "Power balance of synchronous induction machines with electrical excitation"
      extends PartialPowerBalanceInductionMachines(final lossPowerTotal=
            lossPowerStatorWinding + lossPowerStatorCore + lossPowerRotorCore
             + lossPowerStrayLoad + lossPowerFriction + lossPowerRotorWinding
             + lossPowerExcitation + lossPowerBrush);
      Modelica_SIunits.Power lossPowerRotorWinding "Rotor copper losses";
      Modelica_SIunits.Power powerExcitation "Electrical excitation power";
      Modelica_SIunits.Power lossPowerExcitation "Excitation losses";
      Modelica_SIunits.Power lossPowerBrush "Brush losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of synchronous induction machines with electrical excitation.
 </HTML>"));
    end PowerBalanceSMEE;

    connector ThermalPortSMR
      "Thermal port of synchronous induction machine with reluctance rotor"
      extends PartialThermalPortInductionMachines;
      parameter Boolean useDamperCage(start=true)
        "Enable / disable damper cage" annotation (Evaluate=true);
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortRotorWinding if useDamperCage
        "Heat port of damper cage (optional)"
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      annotation (Documentation(info="<HTML>
Thermal port for synchronous induction machine with reluctance rotor
</HTML>"));
    end ThermalPortSMR;

    record PowerBalanceSMR
      "Power balance of synchronous induction machines with reluctance rotor"
      extends PartialPowerBalanceInductionMachines(final lossPowerTotal=
            lossPowerStatorWinding + lossPowerStatorCore + lossPowerRotorCore
             + lossPowerStrayLoad + lossPowerFriction + lossPowerRotorWinding);
      Modelica_SIunits.Power lossPowerRotorWinding "Rotor copper losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of synchronous induction machines with reluctance rotor.
 </HTML>"));
    end PowerBalanceSMR;
    annotation (Documentation(info="<HTML>
Interfaces and partial models for induction machines
</HTML>"));
  end InductionMachines;

  partial model PartialBasicDCMachine "Partial model for DC machine"
    parameter Modelica_SIunits.Temperature TaOperational(start=293.15)
      "Operational armature temperature" annotation (Dialog(group=
            "Operational temperatures", enable=not useThermalPort));
    parameter Modelica_SIunits.Voltage VaNominal(start=100)
      "Nominal armature voltage" annotation (Dialog(tab="Nominal parameters"));
    parameter Modelica_SIunits.Current IaNominal(start=100)
      "Nominal armature current (>0..Motor, <0..Generator)"
      annotation (Dialog(tab="Nominal parameters"));
    parameter Modelica_SIunits.AngularVelocity wNominal(displayUnit="1/min",
        start=1425*2*pi/60) "Nominal speed"
      annotation (Dialog(tab="Nominal parameters"));
    parameter Modelica_SIunits.Temperature TaNominal(start=293.15)
      "Nominal armature temperature"
      annotation (Dialog(tab="Nominal parameters"));
    parameter Modelica_SIunits.Resistance Ra(start=0.05)
      "Armature resistance at TRef"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Temperature TaRef(start=293.15)
      "Reference temperature of armature resistance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter
      Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20 alpha20a(start=0)
      "Temperature coefficient of armature resistance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Inductance La(start=0.0015)
      "Armature inductance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    extends PartialBasicMachine(
      Jr(start=0.15),
      frictionParameters(wRef=wNominal),
      friction(final useHeatPort=true));
    parameter Modelica_Electrical_Machines.Losses.CoreParameters coreParameters(
      final m=1,
      VRef=ViNominal,
      wRef=wNominal) "Armature core losses" annotation (Dialog(tab="Losses"));
    parameter Modelica_Electrical_Machines.Losses.StrayLoadParameters strayLoadParameters(IRef=
          IaNominal, wRef=wNominal) "Stray load losses"
      annotation (Dialog(tab="Losses"));
    parameter Modelica_Electrical_Machines.Losses.BrushParameters brushParameters(ILinear=
          0.01*IaNominal) "Brush losses" annotation (Dialog(tab="Losses"));
    replaceable output DCMachines.PartialPowerBalanceDCMachines powerBalance(
      final powerArmature=va*ia,
      final powerMechanical=wMechanical*tauShaft,
      final powerInertiaStator=inertiaStator.J*inertiaStator.a*inertiaStator.w,
      final powerInertiaRotor=inertiaRotor.J*inertiaRotor.a*inertiaRotor.w,
      final lossPowerArmature=ra.LossPower,
      final lossPowerCore=core.lossPower,
      final lossPowerStrayLoad=strayLoad.lossPower,
      final lossPowerFriction=friction.lossPower,
      final lossPowerBrush=brush.lossPower) "Power balance";

    output Modelica_SIunits.Voltage va=pin_ap.v - pin_an.v "Armature voltage";
    output Modelica_SIunits.Current ia(start=0) = pin_ap.i "Armature current";
    Modelica_Electrical_Analog_Interfaces.PositivePin pin_ap
      "Positive armature pin" annotation (Placement(transformation(extent={{50,
              110},{70,90}}, rotation=0)));
    Modelica_Electrical_Analog_Interfaces.NegativePin pin_an
      "Negative armature pin" annotation (Placement(transformation(extent={{-70,
              110},{-50,90}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor ra(
      final R=Ra,
      final T_ref=TaRef,
      final alpha=Modelica_Electrical_Machines.Thermal.convertAlpha(
                                                alpha20a, TaRef),
      final useHeatPort=true,
      final T=TaRef) annotation (Placement(transformation(extent={{60,50},{40,
              70}}, rotation=0)));
    Modelica_Electrical_Machines.BasicMachines.Components.InductorDC la(final L=
          La, final quasiStationary=quasiStationary) annotation (Placement(
          transformation(extent={{30,50},{10,70}}, rotation=0)));
    Modelica_Electrical_Machines.Losses.DCMachines.Brush brush(final
        brushParameters=brushParameters, final useHeatPort=true) annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-20,60})));
    Modelica_Electrical_Machines.Losses.DCMachines.Core core(final
        coreParameters=coreParameters, final useHeatPort=true)
      annotation (Placement(transformation(extent={{10,70},{-10,90}})));
    Modelica_Electrical_Machines.Losses.DCMachines.StrayLoad strayLoad(final
        strayLoadParameters=strayLoadParameters, final useHeatPort=true)
      annotation (Placement(transformation(extent={{90,50},{70,70}})));
    replaceable DCMachines.PartialThermalPortDCMachines thermalPort if
      useThermalPort
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
    replaceable DCMachines.PartialThermalAmbientDCMachines thermalAmbient(final
        useTemperatureInputs=false, final Ta=TaOperational) if not
      useThermalPort annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-80})));
  protected
    constant Boolean quasiStationary=false "No electrical transients if true"
      annotation (Evaluate=true);
    parameter Modelica_SIunits.Voltage ViNominal "Nominal induced Voltage";
    parameter Modelica_SIunits.MagneticFlux psi_eNominal
      "Nominal magnetic flux";
    parameter Real turnsRatio=ViNominal/(wNominal*psi_eNominal)
      "Ratio of armature turns over number of turns of the excitation winding";
    replaceable DCMachines.PartialThermalPortDCMachines internalThermalPort
      annotation (Placement(transformation(extent={{-4,-84},{4,-76}})));
  equation
    assert(ViNominal >Modelica_Constants.eps,
      "VaNominal has to be > (Ra[+Rse])*IaNominal");
    connect(la.p, ra.n)
      annotation (Line(points={{30,60},{40,60}}, color={0,0,255}));
    connect(thermalPort, internalThermalPort) annotation (Line(
        points={{0,-100},{0,-80}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
        points={{-20,-80},{0,-80}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(brush.n, pin_an) annotation (Line(
        points={{-30,60},{-60,60},{-60,100}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pin_ap, strayLoad.p) annotation (Line(
        points={{60,100},{90,100},{90,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(strayLoad.n, ra.p) annotation (Line(
        points={{70,60},{60,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(strayLoad.support, internalSupport) annotation (Line(
        points={{80,50},{80,30},{60,30},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(la.p, core.p) annotation (Line(
        points={{30,60},{30,80},{10,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(core.n, brush.p) annotation (Line(
        points={{-10,80},{-10,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(core.heatPort, internalThermalPort.heatPortCore) annotation (Line(
        points={{10,70},{10,40},{50,40},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(brush.heatPort, internalThermalPort.heatPortBrush) annotation (
        Line(
        points={{-10,50},{-10,40},{50,40},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(strayLoad.heatPort, internalThermalPort.heatPortStrayLoad)
      annotation (Line(
        points={{90,50},{90,40},{50,40},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(friction.heatPort, internalThermalPort.heatPortFriction)
      annotation (Line(
        points={{80,-50},{50,-50},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(ra.heatPort, internalThermalPort.heatPortArmature) annotation (
        Line(
        points={{50,50},{50,-80},{0,-80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(inertiaRotor.flange_b, strayLoad.flange) annotation (Line(
        points={{90,0},{92,0},{92,30},{100,30},{100,70},{80,70}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<HTML>
Partial model for DC machine models.
</HTML>"),
         Icon(graphics={Line(points={{-40,70},{-60,70},{-60,90}}, color={0,0,
            255}),Line(points={{40,70},{60,70},{60,90}}, color={0,0,255})}));
  end PartialBasicDCMachine;

  package DCMachines "Thermal ports of DC machines"
    extends Modelica_Icons.VariantsPackage;
    connector PartialThermalPortDCMachines
      "Partial thermal port of DC machines"
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortArmature
        "Heat port of armature"
        annotation (Placement(transformation(extent={{-20,10},{0,30}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortCore
        "Heat port of (optional) core losses"
        annotation (Placement(transformation(extent={{0,10},{20,30}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortStrayLoad
        "Heat port of (optional) stray losses"
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortFriction
        "Heat port of (optional) friction losses"
        annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortBrush
        "Heat port of (optional) brush losses"
        annotation (Placement(transformation(extent={{-10,30},{10,50}})));
      annotation (
        Diagram(graphics={Rectangle(
                    extent={{-60,60},{60,-60}},
                    lineColor={199,0,0},
                    fillColor={95,95,95},
                    fillPattern=FillPattern.Solid),Ellipse(
                    extent={{-50,50},{50,-50}},
                    lineColor={191,0,0},
                    fillColor={191,0,0},
                    fillPattern=FillPattern.Solid)}),
        Icon(graphics={Rectangle(
                    extent={{-110,110},{110,-110}},
                    lineColor={199,0,0},
                    fillColor={95,95,95},
                    fillPattern=FillPattern.Solid),Ellipse(
                    extent={{-82,80},{78,-80}},
                    lineColor={191,0,0},
                    fillColor={191,0,0},
                    fillPattern=FillPattern.Solid)}),
        Documentation(info="<HTML>
Partial thermal port for DC machines
</HTML>"));
    end PartialThermalPortDCMachines;

    model PartialThermalAmbientDCMachines
      "Partial thermal ambient for DC machines"
      parameter Boolean useTemperatureInputs=false
        "If true, temperature inputs are used; else, temperatures are constant"
        annotation (Evaluate=true);
      constant Modelica_SIunits.Temperature TDefault=293.15
        "Default temperature";
      parameter Modelica_SIunits.Temperature Ta(start=TDefault)
        "Temperature of armature"
        annotation (Dialog(enable=not useTemperatureInputs));
      output Modelica_SIunits.HeatFlowRate Q_flowArmature=temperatureArmature.port.Q_flow
        "Heat flow rate of armature";
      output Modelica_SIunits.HeatFlowRate Q_flowCore=temperatureCore.port.Q_flow
        "Heat flow rate of core losses";
      output Modelica_SIunits.HeatFlowRate Q_flowStrayLoad=
          temperatureStrayLoad.port.Q_flow
        "Heat flow rate of stray load losses";
      output Modelica_SIunits.HeatFlowRate Q_flowFriction=temperatureFriction.port.Q_flow
        "Heat flow rate of friction losses";
      output Modelica_SIunits.HeatFlowRate Q_flowBrush=temperatureBrush.port.Q_flow
        "Heat flow rate of brushes";
      replaceable PartialThermalPortDCMachines thermalPort
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));
      Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
        temperatureArmature annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,30})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature temperatureCore(
          final T=TDefault) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,30})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature
        temperatureStrayLoad(final T=TDefault) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={60,10})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature
        temperatureFriction(final T=TDefault) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={80,30})));
      Modelica_Blocks_Interfaces.RealInput TArmature if useTemperatureInputs
        "Temperature of armature" annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-80,-100})));
      Modelica_Blocks.Sources.Constant constTa(final k=Ta) if not
        useTemperatureInputs annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-10})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature temperatureBrush(
          final T=TDefault) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={20,10})));
    equation
      connect(constTa.y, temperatureArmature.T) annotation (Line(
          points={{-80,1},{-80,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TArmature, temperatureArmature.T) annotation (Line(
          points={{-80,-100},{-80,-60},{-100,-60},{-100,8},{-80,8},{-80,18}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(temperatureArmature.port, thermalPort.heatPortArmature)
        annotation (Line(
          points={{-80,40},{-80,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureBrush.port, thermalPort.heatPortBrush) annotation (
          Line(
          points={{20,20},{20,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureCore.port, thermalPort.heatPortCore) annotation (
          Line(
          points={{40,40},{40,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureStrayLoad.port, thermalPort.heatPortStrayLoad)
        annotation (Line(
          points={{60,20},{60,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureFriction.port, thermalPort.heatPortFriction)
        annotation (Line(
          points={{80,40},{80,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      annotation (Icon(graphics={Rectangle(
                    extent={{-100,100},{100,-100}},
                    lineColor={0,0,0},
                    pattern=LinePattern.None,
                    fillColor={159,159,223},
                    fillPattern=FillPattern.Backward),Line(
                    points={{-14,0},{54,0}},
                    color={191,0,0},
                    thickness=0.5,
                    origin={0,-6},
                    rotation=90),Polygon(
                    points={{-20,-20},{-20,20},{20,0},{-20,-20}},
                    lineColor={191,0,0},
                    fillColor={191,0,0},
                    fillPattern=FillPattern.Solid,
                    origin={0,68},
                    rotation=90)}),Documentation(info="<HTML>
Partial thermal ambient for induction machines
</HTML>"));
    end PartialThermalAmbientDCMachines;

    record PartialPowerBalanceDCMachines "Partial power balance of DC machines"
      extends Modelica_Icons.Record;
      Modelica_SIunits.Power powerArmature=0 "Electrical armature power";
      Modelica_SIunits.Power powerMechanical=0 "Mechanical power";
      Modelica_SIunits.Power powerInertiaStator=0 "Stator inertia power";
      Modelica_SIunits.Power powerInertiaRotor=0 "Rotor inertia power";
      Modelica_SIunits.Power lossPowerTotal=0 "Total loss power";
      Modelica_SIunits.Power lossPowerArmature=0 "Armature copper losses";
      Modelica_SIunits.Power lossPowerCore=0 "Core losses";
      Modelica_SIunits.Power lossPowerStrayLoad=0 "Stray load losses";
      Modelica_SIunits.Power lossPowerFriction=0 "Friction losses";
      Modelica_SIunits.Power lossPowerBrush=0 "Brush losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Partial power balance of DC machines.
 </HTML>"));
    end PartialPowerBalanceDCMachines;

    connector ThermalPortDCPM
      "Thermal port of DC machine with permanent magnets"
      extends PartialThermalPortDCMachines;
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortPermanentMagnet "Heat port of permanent magnets"
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      annotation (Documentation(info="<HTML>
Thermal port for DC machine with permanent magnets
</HTML>"));
    end ThermalPortDCPM;

    record PowerBalanceDCPM
      "Power balance of DC machines with permanent magnet"
      extends PartialPowerBalanceDCMachines(final lossPowerTotal=
            lossPowerArmature + lossPowerCore + lossPowerStrayLoad +
            lossPowerFriction + lossPowerBrush + lossPowerPermanentMagnet);
      Modelica_SIunits.Power lossPowerPermanentMagnet "Permanent magnet losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of DC machines with permanent magnet.
 </HTML>"));
    end PowerBalanceDCPM;

    connector ThermalPortDCEE
      "Thermal port of DC machine with electrical excitation"
      extends PartialThermalPortDCMachines;
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortExcitation
        "Heat port of (shunt) excitation"
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      annotation (Documentation(info="<HTML>
Thermal port for DC machine with electrical (shunt) excitation
</HTML>"));
    end ThermalPortDCEE;

    record PowerBalanceDCEE
      "Power balance of DC machines with electrical excitation"
      extends PartialPowerBalanceDCMachines(final lossPowerTotal=
            lossPowerArmature + lossPowerCore + lossPowerStrayLoad +
            lossPowerFriction + lossPowerBrush + lossPowerExcitation);
      Modelica_SIunits.Power powerExcitation
        "Electrical (shunt) excitation power";
      Modelica_SIunits.Power lossPowerExcitation "Excitation losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of DC machines with electrical excitation.
 </HTML>"));
    end PowerBalanceDCEE;

    connector ThermalPortDCSE
      "Thermal port of DC machine with series excitation"
      extends PartialThermalPortDCMachines;
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortSeriesExcitation "Heat port of series excitation"
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      annotation (Documentation(info="<HTML>
Thermal port for DC machine with serial excitation
</HTML>"));
    end ThermalPortDCSE;

    record PowerBalanceDCSE
      "Power balance of DC machines with series excitation"
      extends PartialPowerBalanceDCMachines(final lossPowerTotal=
            lossPowerArmature + lossPowerCore + lossPowerStrayLoad +
            lossPowerFriction + lossPowerBrush + lossPowerSeriesExcitation);
      Modelica_SIunits.Power powerSeriesExcitation
        "Electrical series excitation power";
      Modelica_SIunits.Power lossPowerSeriesExcitation
        "Series excitation losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of DC machines with series excitation.
 </HTML>"));
    end PowerBalanceDCSE;

    connector ThermalPortDCCE
      "Thermal port of DC machine with compound excitation"
      extends PartialThermalPortDCMachines;
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortShuntExcitation "Heat port of (shunt) excitation"
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a
        heatPortSeriesExcitation "Heat port of series excitation"
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      annotation (Documentation(info="<HTML>
Thermal port for DC machine with compound excitation
</HTML>"));
    end ThermalPortDCCE;

    record PowerBalanceDCCE
      "Power balance of DC machines with compound excitation"
      extends PartialPowerBalanceDCMachines(final lossPowerTotal=
            lossPowerArmature + lossPowerCore + lossPowerStrayLoad +
            lossPowerFriction + lossPowerBrush + lossPowerShuntExcitation +
            lossPowerSeriesExcitation);
      Modelica_SIunits.Power powerShuntExcitation
        "Electrical (shunt) excitation power";
      Modelica_SIunits.Power powerSeriesExcitation
        "Electrical series excitation power";
      Modelica_SIunits.Power lossPowerShuntExcitation
        "(Shunt) excitation losses";
      Modelica_SIunits.Power lossPowerSeriesExcitation
        "Series excitation losses";
      annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of DC machines with compound excitation.
 </HTML>"));
    end PowerBalanceDCCE;
    annotation (Documentation(info="<HTML>
Thermal ports for DC machines
</HTML>"));
  end DCMachines;

  partial model PartialBasicTransformer
    "Partial model of three-phase transformer"
    extends Modelica_Electrical_Machines.Icons.TransientTransformer;
    final parameter Integer m(min=1) = 3 "Number of phases";
    constant String VectorGroup="Yy00";
    parameter Real n(start=1)
      "Ratio primary voltage (line-to-line) / secondary voltage (line-to-line)";
    parameter Modelica_SIunits.Resistance R1(start=5E-3/(if C1 == "D" then 1
           else 3)) "Primary resistance per phase at TRef"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Temperature T1Ref(start=293.15)
      "Reference temperature of primary resistance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter
      Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20 alpha20_1(start=0)
      "Temperature coefficient of primary resistance at 20 degC"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Inductance L1sigma(start=78E-6/(if C1 == "D"
           then 1 else 3)) "Primary stray inductance per phase"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Resistance R2(start=5E-3/(if C2 == "d" then 1
           else 3)) "Secondary resistance per phase at TRef"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Temperature T2Ref(start=293.15)
      "Reference temperature of secondary resistance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter
      Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20 alpha20_2(start=0)
      "Temperature coefficient of secondary resistance at 20 degC"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Inductance L2sigma(start=78E-6/(if C2 == "d"
           then 1 else 3)) "Secondary stray inductance per phase"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Boolean useThermalPort=false
      "Enable / disable (=fixed temperatures) thermal port"
      annotation (Evaluate=true);
    parameter Modelica_SIunits.Temperature T1Operational(start=293.15)
      "Operational temperature of primary resistance" annotation (Dialog(
          group="Operational temperatures", enable=not useThermalPort));
    parameter Modelica_SIunits.Temperature T2Operational(start=293.15)
      "Operational temperature of secondary resistance" annotation (Dialog(
          group="Operational temperatures", enable=not useThermalPort));
    output PowerBalanceTransformer powerBalance(
      final power1=Modelica_Electrical_Machines.SpacePhasors.Functions.activePower(
                                                      v1, i1),
      final power2=Modelica_Electrical_Machines.SpacePhasors.Functions.activePower(
                                                      v2, i2),
      final lossPower1=sum(r1.resistor.LossPower),
      final lossPower2=sum(r2.resistor.LossPower),
      final lossPowerCore=0) "Power balance";
    output Modelica_SIunits.Voltage v1[m]=plug1.pin.v "Primary voltage";
    output Modelica_SIunits.Current i1[m]=plug1.pin.i "Primary current";
    output Modelica_SIunits.Voltage v2[m]=plug2.pin.v "Secondary voltage";
    output Modelica_SIunits.Current i2[m]=plug2.pin.i "Secondary current";
  protected
    constant String C1=Modelica_Utilities.Strings.substring(
            VectorGroup,
            1,
            1);
    constant String C2=Modelica_Utilities.Strings.substring(
            VectorGroup,
            2,
            2);
    parameter Real ni=n*(if C2 == "z" then sqrt(3) else 2)*(if C2 == "d"
         then 1 else sqrt(3))/(if C1 == "D" then 1 else sqrt(3));
  public
    Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug1(final m=m)
      "Primary plug" annotation (Placement(transformation(extent={{-110,-10},
              {-90,10}}, rotation=0)));
    Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug2(final m=m)
      "Secondary plug" annotation (Placement(transformation(extent={{90,-10},
              {110,10}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Resistor r1(
      final m=m,
      final R=fill(R1, m),
      final T_ref=fill(T1Ref, m),
      final alpha=fill(Modelica_Electrical_Machines.Thermal.convertAlpha(
                                                     alpha20_1, T1Ref), m),
      final useHeatPort=true,
      final T=fill(T1Ref, m)) annotation (Placement(transformation(extent={{-90,
              10},{-70,-10}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Inductor l1sigma(final m=m, final L=
          fill(L1sigma, m)) annotation (Placement(transformation(extent={{-70,
              -10},{-50,10}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Resistor r2(
      final m=m,
      final R=fill(R2, m),
      final T_ref=fill(T2Ref, m),
      final alpha=fill(Modelica_Electrical_Machines.Thermal.convertAlpha(
                                                     alpha20_2, T2Ref), m),
      final useHeatPort=true,
      final T=fill(T2Ref, m)) annotation (Placement(transformation(extent={{90,10},
              {70,-10}},        rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Inductor l2sigma(final m=m, final L=
          fill(L2sigma, m)) annotation (Placement(transformation(extent={{70,-10},
              {50,10}},      rotation=0)));
    Modelica_Electrical_Machines.BasicMachines.Components.IdealCore core(
      final m=m,
      final n12=ni,
      final n13=ni) annotation (Placement(transformation(extent={{-10,-10},{10,
              10}}, rotation=0)));
    ThermalPortTransformer thermalPort(final m=m) if useThermalPort
      annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    Modelica_Electrical_Machines.Thermal.ThermalAmbientTransformer thermalAmbient(
      final useTemperatureInputs=false,
      final T1=T1Operational,
      final T2=T2Operational,
      final m=m) if not useThermalPort annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,80})));
  protected
    ThermalPortTransformer internalThermalPort(final m=m)
      annotation (Placement(transformation(extent={{-4,76},{4,84}})));
  equation
    connect(r1.plug_n, l1sigma.plug_p)
      annotation (Line(points={{-70,0},{-70,0}}, color={0,0,255}));
    connect(plug1, r1.plug_p)
      annotation (Line(points={{-100,0},{-90,0}}, color={0,0,255}));
    connect(thermalPort, internalThermalPort) annotation (Line(
        points={{0,100},{0,80}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
        points={{-20,80},{0,80}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(r1.heatPort, internalThermalPort.heatPort1) annotation (Line(
        points={{-80,10},{-80,60},{0,60},{0,80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(r2.heatPort, internalThermalPort.heatPort2) annotation (Line(
        points={{80,10},{80,60},{0,60},{0,80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(r2.plug_p, plug2) annotation (Line(
        points={{90,0},{100,0}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(l2sigma.plug_p, r2.plug_n) annotation (Line(
        points={{70,0},{70,0}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
                extent={{0,-60},{0,-100}},
                lineColor={0,0,255},
                textString="%VectorGroup"),Text(
                extent={{0,100},{0,60}},
                lineColor={0,0,255},
                textString="%name")}), Documentation(info="<html>
Partial model of a three-phase transformer, containing primary and secondary resistances and stray inductances, as well as the iron core.
Circuit layout (vector group) of primary and secondary windings have to be defined.
<br><b>Default values for transformer's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">turns ratio n</td>
<td valign=\"top\">1</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">nominal frequency fNominal</td>
<td valign=\"top\">50</td><td valign=\"top\">Hz</td>
</tr>
<tr>
<td valign=\"top\">nominal voltage per phase</td>
<td valign=\"top\">100</td><td valign=\"top\">V RMS</td>
</tr>
<tr>
<td valign=\"top\">nominal current per phase</td>
<td valign=\"top\">100</td><td valign=\"top\">A RMS</td>
</tr>
<tr>
<td valign=\"top\">nominal apparent power</td>
<td valign=\"top\">30</td><td valign=\"top\">kVA</td>
</tr>
<tr>
<td valign=\"top\">primary resistance R1</td>
<td valign=\"top\">0.005</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature T1Ref</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20_1 </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">primary stray inductance L1sigma</td>
<td valign=\"top\">78E-6</td><td valign=\"top\">H per phase</td>
</tr>
<tr>
<td valign=\"top\">secondary resistance R2</td>
<td valign=\"top\">0.005</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature T2Ref</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20_2 </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">secondary stray inductance L2sigma</td>
<td valign=\"top\">78E-6</td><td valign=\"top\">H per phase</td>
</tr>
<tr>
<td valign=\"top\">operational temperature T1Operational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">operational temperature T2Operational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">These values give the operational parameters:</td>
<td valign=\"top\"> </td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">nominal voltage drop</td>
<td valign=\"top\">0.05</td><td valign=\"top\">p.u.</td>
</tr>
<tr>
<td valign=\"top\">nominal copper losses</td>
<td valign=\"top\">300</td><td valign=\"top\">W</td>
</tr>
</table>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics));
  end PartialBasicTransformer;

  connector ThermalPortTransformer "Thermal port of transformers"
    parameter Integer m=3 "number of phases";
    Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort1[m]
      "Heat port of primary windings"
      annotation (Placement(transformation(extent={{-20,10},{0,30}})));
    Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort2[m]
      "Heat port of secondary windings"
      annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
    Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortCore
      "Heat port of (optional) core losses"
      annotation (Placement(transformation(extent={{0,-10},{20,10}})));
    annotation (
      Diagram(graphics={Rectangle(
                extent={{-60,60},{60,-60}},
                lineColor={199,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid)}),
      Icon(graphics={Rectangle(
                extent={{-110,110},{110,-110}},
                lineColor={199,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{-80,80},{80,-80}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid)}),
      Documentation(info="<HTML>
Thermal port for transformers
</HTML>"));
  end ThermalPortTransformer;

  record PowerBalanceTransformer "Power balance of transformers"
    extends Modelica_Icons.Record;
    Modelica_SIunits.Power power1 "Primary power";
    Modelica_SIunits.Power power2 "Secondary power";
    Modelica_SIunits.Power lossPowerTotal=lossPower1 + lossPower2 +
        lossPowerCore "Total loss power";
    Modelica_SIunits.Power lossPower1 "Primary copper losses";
    Modelica_SIunits.Power lossPower2 "Secondary copper losses";
    Modelica_SIunits.Power lossPowerCore "Core losses";
    annotation (defaultComponentPrefixes="output", Documentation(info="<HTML>
Power balance of transformers.
 </HTML>"));
  end PowerBalanceTransformer;

  partial model FlangeSupport "Shaft and support"
    Modelica_Mechanics_Rotational_Interfaces.Flange_a flange "Shaft end"
      annotation (Placement(transformation(extent={{-10,110},{10,90}},
            rotation=0)));
    Modelica_Mechanics_Rotational_Interfaces.Flange_a support
      "Housing and support" annotation (Placement(transformation(extent={{-10,
              -110},{10,-90}}, rotation=0)));
    Modelica_SIunits.Angle phi "Angle between shaft and support";
    Modelica_SIunits.Torque tau "Torque";
    Modelica_SIunits.AngularVelocity w
      "Relative angular velocity of flange and support";
  equation
    phi = flange.phi - support.phi;
    w = der(phi);
    tau = -flange.tau;
    tau = support.tau;
    annotation (Documentation(info="<html>
<p>
This partial model defines shaft and housing connector for loss models.
Positive torque <code>tau</code> acts as braking torque.
</p>
</html>"),
         Icon(graphics={Rectangle(
                extent={{-20,-80},{20,-120}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid)}));
  end FlangeSupport;
  annotation (Documentation(info="<HTML>
This package contains the space phasor connector and partial models for machine models.
</HTML>",
        revisions="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting &amp; Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2013, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</dl>
  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.01 2004/09/18 Anton Haumer<br>
       moved common equations from machine models to PartialMachine</li>
  <li> v1.02 2004/09/19 Anton Haumer<br>
       added PartialDCMachine</li>
  <li> v1.2  2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.51 Beta 2005/02/01 Anton Haumer<br>
       changed parameter polePairs to Integer</li>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"), uses(Modelica_Utilities(version="3.2.2"),
                Modelica_Electrical_Analog_Interfaces(version="3.2.2"),
                Modelica_Blocks(version="3.2.2"),
                Modelica_Blocks_Interfaces(version="3.2.2"),
                Modelica_Thermal_HeatTransfer(version="3.2.2"),
                Modelica_Thermal_HeatTransfer_Interfaces(version="3.2.2"),
                Modelica_Electrical_Analog(version="3.2.2"),
                Modelica_Electrical_MultiPhase(version="3.2.2"),
                Modelica_Electrical_MultiPhase_Interfaces(version="3.2.2"),
                Modelica_Mechanics_Rotational(version="3.2.2"),
                Modelica_Mechanics_Rotational_Interfaces(version="3.2.2"),
                Modelica_Constants(version="3.2.2"),
                Modelica_Electrical_Machines(version="3.2.2"),
                Modelica_SIunits(version="3.2.2"),
                Modelica_Icons(version="3.2.2")),
              version="3.2.2");
end Modelica_Electrical_Machines_Interfaces;
