within ;
package Modelica_Magnetic_FundamentalWave_Interfaces
  "Interfaces and partial models"
  extends Modelica_Icons.InterfacesPackage;
  connector MagneticPort "Complex magnetic port"
    Modelica_SIunits.ComplexMagneticPotentialDifference V_m
      "Complex magnetic potential difference";
    flow Modelica_SIunits.ComplexMagneticFlux Phi "Complex magnetic flux";
    annotation (Documentation(info="<html>
<p>
The potential quantity of the magnetic port is the complex magnetic potential difference <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/V_m.png\">. The corresponding flow quantity is the magnetic flux <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Phi.png\">.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>
</p>

</html>"));
  end MagneticPort;

  connector NegativeMagneticPort "Negative complex magnetic port"
    extends Modelica_Magnetic_FundamentalWave_Interfaces.MagneticPort;
    annotation (
      defaultComponentName="port_n",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={255,128,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Text(
            extent={{-60,100},{-60,60}},
            lineColor={255,128,0},
            textString="%name"), Ellipse(
            extent={{-50,50},{50,-50}},
            lineColor={255,128,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>
Negative magnetic <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.MagneticPort\">port</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.MagneticPort\">MagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>
</p>
</html>"));
  end NegativeMagneticPort;

  connector PositiveMagneticPort "Positive complex magnetic port"
    extends Modelica_Magnetic_FundamentalWave_Interfaces.MagneticPort;
    annotation (
      defaultComponentName="port_p",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Text(
            extent={{-60,100},{-60,60}},
            lineColor={255,128,0},
            textString="%name"), Ellipse(
            extent={{-50,50},{50,-50}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>
Positive magnetic <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.MagneticPort\">port</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.MagneticPort\">MagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>
</p>

</html>"));
  end PositiveMagneticPort;

  partial model PartialTwoPort "Two magnetic ports for graphical modeling"
    PositiveMagneticPort port_p "Positive complex magnetic port" annotation (
        Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    NegativeMagneticPort port_n "Negative complex magnetic port" annotation (
        Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
    annotation (Documentation(info="<html>
<p>
This magnetic two port element consists of a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PositiveMagneticPort\">positive</a> and a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.NegativeMagneticPort\">negative magnetic port</a> and
considers the flux balance of the two ports. Additionally the magnetic potential difference (of the positive and the negative port) and the magnetic flux (into the positive magnetic port) are defined. This model is mainly to used to extend from in order build more complex - graphical - models.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PartialTwoPortExtended\">PartialTwoPortExtended</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PartialTwoPortElementary\">PartialTwoPortElementary</a>
</p></html>"),
             Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end PartialTwoPort;

  partial model PartialTwoPortExtended
    "Two magnetic ports for graphical modeling with additonal variables"
    extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
    annotation (Documentation(info="<html>
<p>
This magnetic two port element consists of a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PositiveMagneticPort\">positive</a> and a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.NegativeMagneticPort\">negative magnetic port</a> and
considers the flux balance of the two ports. Additionally the magnetic potential difference (of the positive and the negative port) and the magnetic flux (into the positive magnetic port) are defined. This model is mainly to used to extend from in order build more complex - graphical - models.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PartialTwoPort\">PartialTwoPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PartialTwoPortElementary\">PartialTwoPortElementary</a>
</p></html>"),
             Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end PartialTwoPortExtended;

  partial model PartialTwoPortElementary
    "Two magnetic ports for textual modeling"
    extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
    Modelica_SIunits.ComplexMagneticPotentialDifference V_m
      "Complex magnetic potential difference";
    Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
      "Magnitude of complex magnetic potential difference";
    Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
      "Argument of complex magnetic potential difference";

    Modelica_SIunits.ComplexMagneticFlux Phi "Complex magnetic flux";
    Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
      "Magnitude of complex magnetic flux";
    Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
      "Argument of complex magnetic flux";
  equation
    // Flux into positive port
    V_m = port_p.V_m - port_n.V_m;
    // Magneto motive force
    port_p.Phi = Phi;
    // Local flux balance
    port_p.Phi + port_n.Phi = Complex(0, 0);
    annotation (Documentation(info="<html>
<p>
This magnetic two port element only consists of a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PositiveMagneticPort\">positive</a> and a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.NegativeMagneticPort\">negative magnetic port</a>.
This model is mainly used to extend from in order build more complex - equation based - models.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PartialTwoPort\">PartialTwoPort</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PartialTwoPortExtended\">PartialTwoPortExtended</a>
</p>
</html>"));
  end PartialTwoPortElementary;

  partial model PartialBasicInductionMachine
    "Partial model for induction machine"
    extends Modelica_Electrical_Machines.Icons.FundamentalWaveMachine;
    constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
    parameter Integer m(min=3) = 3 "Number of stator phases";
    // Mechanical parameters
    parameter Modelica_SIunits.Inertia Jr(start=0.29) "Rotor inertia";
    parameter Boolean useSupport=false
      "Enable / disable (=fixed stator) support" annotation (Evaluate=true);
    parameter Modelica_SIunits.Inertia Js(start=Jr) "Stator inertia"
      annotation (Dialog(enable=useSupport));
    parameter Boolean useThermalPort=false
      "Enable / disable (=fixed temperatures) thermal port"
      annotation (Evaluate=true);
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
      Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
      alpha20s(start=0)
      "Temperature coefficient of stator resistance at 20 degC"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Real effectiveStatorTurns=1 "Effective number of stator turns";
    parameter Modelica_SIunits.Inductance Lssigma(start=3*(1 - sqrt(1 -
          0.0667))/(2*pi*fsNominal)) "Stator stray inductance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Inductance Lszero=Lssigma
      "Stator zero inductance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_Magnetic_FundamentalWave.Types.SalientInductance L0(d(start=1),
        q(start=1)) "Salient inductance of an unchorded coil"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_Electrical_Machines.Losses.FrictionParameters
      frictionParameters(wRef=2*pi*fsNominal/p) "Friction losses"
      annotation (Dialog(tab="Losses"));
    parameter Modelica_Electrical_Machines.Losses.CoreParameters
      statorCoreParameters(
      final m=3,
      wRef=2*pi*fsNominal/p,
      VRef(start=100))
      "Stator core losses; all parameters refer to stator side"
      annotation (Dialog(tab="Losses"));
    parameter Modelica_Electrical_Machines.Losses.StrayLoadParameters
      strayLoadParameters(IRef(start=100), wRef=2*pi*fsNominal/p)
      "Stray load losses" annotation (Dialog(tab="Losses"));
    // Mechanical quantities
    output Modelica_SIunits.Angle phiMechanical(start=0) = flange.phi -
      internalSupport.phi "Mechanical angle of rotor against stator";
    output Modelica_SIunits.AngularVelocity wMechanical(
      start=0,
      displayUnit="1/min") = der(phiMechanical)
      "Mechanical angular velocity of rotor against stator";
    output Modelica_SIunits.Torque tauElectrical=inertiaRotor.flange_a.tau
      "Electromagnetic torque";
    output Modelica_SIunits.Torque tauShaft=-flange.tau "Shaft torque";
    replaceable output
      Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialPowerBalanceInductionMachines
      powerBalance(
      final powerStator=
          Modelica_Electrical_MultiPhase.Functions.activePower(
          vs, is),
      final powerMechanical=wMechanical*tauShaft,
      final powerInertiaStator=inertiaStator.J*inertiaStator.a*inertiaStator.w,
      final powerInertiaRotor=inertiaRotor.J*inertiaRotor.a*inertiaRotor.w,
      final lossPowerStatorWinding=sum(stator.resistor.resistor.LossPower),
      final lossPowerStatorCore=stator.core.lossPower,
      final lossPowerStrayLoad=strayLoad.lossPower,
      final lossPowerFriction=friction.lossPower) "Power balance";
    // Stator voltages and currents
    output Modelica_SIunits.Voltage vs[m]=plug_sp.pin.v - plug_sn.pin.v
      "Stator instantaneous voltages";
    output Modelica_SIunits.Current is[m]=plug_sp.pin.i
      "Stator instantaneous currents";
    Modelica_Mechanics_Rotational_Interfaces.Flange_a flange "Shaft"
      annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));
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
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={70,-90})));
    Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_sp(final m=m)
      "Positive plug of stator" annotation (Placement(transformation(extent={
              {50,90},{70,110}}, rotation=0)));
    Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_sn(final m=m)
      "Negative plug of stator" annotation (Placement(transformation(extent={
              {-70,90},{-50,110}}, rotation=0)));
    Modelica_Magnetic_FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding
      stator(
      final useHeatPort=true,
      final m=m,
      final RRef=Rs,
      final TRef=TsRef,
      final Lsigma=Lssigma,
      final effectiveTurns=effectiveStatorTurns,
      final TOperational=TsOperational,
      final GcRef=statorCoreParameters.GcRef,
      final alpha20=alpha20s,
      final Lzero=Lszero)
      "Symmetric stator winding including resistances, zero and stray inductances and core losses"
      annotation (Placement(transformation(
          origin={0,40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    replaceable
      Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalAmbientInductionMachines
      thermalAmbient(
      final useTemperatureInputs=false,
      final Ts=TsOperational,
      final m=m) if not useThermalPort annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-90})));
    replaceable
      Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalPortInductionMachines
      thermalPort(final m=m) if useThermalPort
      "Thermal port of induction machines"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
    Modelica_Magnetic_FundamentalWave.Components.Ground groundS
      "Ground of stator magnetic circuit" annotation (Placement(
          transformation(extent={{-40,30},{-20,10}}, rotation=0)));
    Modelica_Magnetic_FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap
      airGap(final p=p, final L0=L0) annotation (Placement(transformation(
          origin={0,0},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Magnetic_FundamentalWave.Components.Ground groundR
      "Ground of rotor magnetic circuit" annotation (Placement(transformation(
            extent={{-40,-30},{-20,-10}}, rotation=0)));
    /* previously used: state selection, now commented
  FundamentalWave.Interfaces.StateSelector stateSelectorS(
    final m=m,
    final xi=is,
    final gamma=p*phiMechanical) "State selection of stator currents"
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  */
    Modelica_Electrical_Machines.Losses.InductionMachines.StrayLoad strayLoad(
      final strayLoadParameters=strayLoadParameters,
      final useHeatPort=true,
      final m=m)
      annotation (Placement(transformation(extent={{60,60},{40,80}})));
    Modelica_Electrical_Machines.Losses.Friction friction(final
        frictionParameters=frictionParameters, final useHeatPort=true)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={90,-30})));
  protected
    replaceable
      Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalPortInductionMachines
      internalThermalPort(final m=m)
      annotation (Placement(transformation(extent={{-44,-94},{-36,-86}})));
    Modelica_Mechanics_Rotational_Interfaces.Support internalSupport
      annotation (Placement(transformation(extent={{56,-104},{64,-96}},
            rotation=0)));
  initial algorithm
    assert(not Modelica_Math.isPowerOf2(m), String(m) +
      " phases are currently not supported in this version of FundametalWave");
  equation
    connect(stator.plug_n, plug_sn) annotation (Line(
        points={{-10,50},{-10,70},{-60,70},{-60,100}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(thermalPort, internalThermalPort) annotation (Line(
        points={{0,-100},{0,-90},{-40,-90}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
        points={{-60,-90},{-40,-90}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(inertiaRotor.flange_b, flange) annotation (Line(points={{90,0},
            {100,0},{100,0}}, color={0,0,0}));
    connect(internalSupport, inertiaStator.flange_a) annotation (Line(
        points={{60,-100},{70,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(internalSupport, fixed.flange) annotation (Line(
        points={{60,-100},{60,-90},{70,-90}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(inertiaStator.flange_b, support) annotation (Line(points={{90,-100},
            {90,-100},{100,-100}}, color={0,0,0}));
    connect(airGap.flange_a, inertiaRotor.flange_a) annotation (Line(
        points={{10,0},{25,0},{25,0},{40,0},
            {40,0},{70,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(airGap.support, internalSupport) annotation (Line(
        points={{-10,0},{-50,0},{-50,-70},{60,-70},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(groundR.port_p, airGap.port_rn) annotation (Line(points={{-30,-10},
            {-10,-10}},           color={255,128,0}));
    connect(stator.plug_p, strayLoad.plug_n) annotation (Line(
        points={{10,50},{10,70},{40,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(plug_sp, strayLoad.plug_p) annotation (Line(
        points={{60,100},{60,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(strayLoad.support, internalSupport) annotation (Line(
        points={{50,60},{50,50},{60,50},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(strayLoad.heatPort, internalThermalPort.heatPortStrayLoad)
      annotation (Line(
        points={{60,60},{60,50},{50,50},{50,-80},{-40,-80},{-40,-90}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(friction.support, internalSupport) annotation (Line(
        points={{90,-40},{90,-70},{60,-70},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(strayLoad.flange, inertiaRotor.flange_b) annotation (Line(
        points={{50,80},{90,80},{90,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(friction.flange, inertiaRotor.flange_b) annotation (Line(
        points={{90,-20},{90,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(friction.heatPort, internalThermalPort.heatPortFriction)
      annotation (Line(
        points={{80,-40},{50,-40},{50,-80},{-40,-80},{-40,-90}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(groundS.port_p, airGap.port_sp) annotation (Line(
        points={{-30,10},{-10,10}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(stator.port_n, airGap.port_sp) annotation (Line(
        points={{-10,30},{-10,10}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(stator.port_p, airGap.port_sn) annotation (Line(
        points={{10,30},{10,10}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(stator.heatPortWinding, internalThermalPort.heatPortStatorWinding)
      annotation (Line(
        points={{-10,44},{-40,44},{-40,-90}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(stator.heatPortCore, internalThermalPort.heatPortStatorCore)
      annotation (Line(
        points={{-10,36},{-40,36},{-40,-90}},
        color={191,0,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<HTML>
<p>This partial model for induction machines contains elements common in all machine models.</p>
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
          Rectangle(
            extent={{80,-80},{120,-120}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-50,100},{-20,100},{-20,70}}, color={0,0,255}),
          Line(points={{50,100},{20,100},{20,70}}, color={0,0,255}),
          Text(
            extent={{-150,-120},{150,-180}},
            lineColor={0,0,255},
            textString="%name"),
          Line(
            visible=not useSupport,
            points={{80,-100},{120,-100}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            visible=not useSupport,
            points={{90,-100},{80,-120}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            visible=not useSupport,
            points={{100,-100},{90,-120}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            visible=not useSupport,
            points={{110,-100},{100,-120}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            visible=not useSupport,
            points={{120,-100},{110,-120}},
            color={0,0,0},
            smooth=Smooth.None)}));
  end PartialBasicInductionMachine;

  model StateSelector
    "Transform instantaneous values to space phasors and select states"
    import Modelica_Constants.pi;
    parameter Integer m(min=3) = 3 "Number of phases";
    input Real xi[m](each stateSelect=StateSelect.avoid) "Instantaneous values"
                             annotation (Dialog);
    input Modelica_SIunits.Angle gamma "Angle of rotation" annotation (Dialog);
    parameter StateSelect x0StateSelect=StateSelect.prefer
      "Priority to use zero systems as states";
    parameter StateSelect xrStateSelect=StateSelect.prefer
      "Priority to use space phasors w.r.t. rotating frame as states";
    Real x0(stateSelect=x0StateSelect) = 1/sqrt(m)*sum(xi) "Zero system";
    Real x00(stateSelect=x0StateSelect) = 1/sqrt(m)*sum({xi[2*l - 1] - xi[2*l]
      for l in 1:integer(m/2)}) if m == 2*integer(m/2)
      "Second zero system, if present (mp even)";
    final parameter Integer np=integer((m - 1)/2) "Number of space phasors";
    Complex xf[np](each re(stateSelect=StateSelect.avoid), each im(
          stateSelect=StateSelect.avoid)) "Space phasors w.r.t. fixed frame";
    Complex xr[np](each re(stateSelect=xrStateSelect), each im(stateSelect=
            xrStateSelect)) "Space phasors w.r.t. rotating frame";
  equation
    //space phasor transformations
    for k in 1:np loop
      xf[k].re = 1/sqrt(m)*sum({cos(k*(l - 1)*2*pi/m)*xi[l] for l in 1:m});
      xf[k].im = 1/sqrt(m)*sum({sin(k*(l - 1)*2*pi/m)*xi[l] for l in 1:m});
      xr[k] = xf[k]*Modelica_ComplexMath.conj(Modelica_ComplexMath.exp(
        Complex(0, gamma)));
    end for;
    annotation (Documentation(info="<html>
<p>
Transforms instantaneous values into space phasors and zero system currents,
rotates space phasors and sets stateSelect modifiers in order to choose states w.r.t. rotating frame,
i.e., with small derivatives.
</p>
</html>"),
         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
                extent={{-60,60},{60,-60}},
                lineColor={170,213,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),Text(
                extent={{-60,60},{60,-60}},
                textString="S",
                lineColor={0,0,255},
                fillColor={255,170,85},
                fillPattern=FillPattern.Solid),Text(
                extent={{0,-60},{0,-100}},
                lineColor={0,0,255},
                textString="%name")}));
  end StateSelector;
  annotation (Documentation(info="<html>
<p>
This package contains interface definitions of the magnetic ports as well as partial models.
</p>
</html>"), uses(Complex(version="3.2.2")));
end Modelica_Magnetic_FundamentalWave_Interfaces;
