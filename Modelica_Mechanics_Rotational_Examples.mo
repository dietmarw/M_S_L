within ;
encapsulated package Modelica_Mechanics_Rotational_Examples
  "Demonstration examples of the components of this package"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Mechanics_Rotational;
  import Modelica_Blocks;
  import Modelica_Mechanics_Translational;
  import Modelica_Thermal_HeatTransfer;

  extends Modelica_Icons.ExamplesPackage;

  model First "First example: simple drive train"
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Torque amplitude=10
      "Amplitude of driving torque";
    parameter Modelica_SIunits.Frequency freqHz=5 "Frequency of driving torque";
    parameter Modelica_SIunits.Inertia Jmotor(min=0) = 0.1 "Motor inertia";
    parameter Modelica_SIunits.Inertia Jload(min=0) = 2 "Load inertia";
    parameter Real ratio=10 "Gear ratio";
    parameter Real damping=10 "Damping in bearing of gear";

    Modelica_Mechanics_Rotational.Components.Fixed fixed annotation (Placement(
          transformation(extent={{38,-48},{54,-32}}, rotation=0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque(useSupport=true)
      annotation (Placement(transformation(extent={{-68,-8},{-52,8}}, rotation=
              0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia1(J=Jmotor)
      annotation (Placement(transformation(extent={{-38,-8},{-22,8}}, rotation=
              0)));
    Modelica_Mechanics_Rotational.Components.IdealGear idealGear(ratio=ratio,
        useSupport=true) annotation (Placement(transformation(extent={{-8,-8},{
              8,8}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia2(
      J=2,
      phi(fixed=true, start=0),
      w(fixed=true, start=0)) annotation (Placement(transformation(extent={{22,
              -8},{38,8}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Spring spring(c=1.e4, phi_rel(
          fixed=true)) annotation (Placement(transformation(extent={{52,-8},{68,
              8}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia3(J=Jload, w(fixed=
            true, start=0)) annotation (Placement(transformation(extent={{82,-8},
              {98,8}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Damper damper(d=damping)
      annotation (Placement(transformation(
          origin={46,-22},
          extent={{-8,-8},{8,8}},
          rotation=270)));
    Modelica_Blocks.Sources.Sine sine(amplitude=amplitude, freqHz=freqHz)
      annotation (Placement(transformation(extent={{-98,-8},{-82,8}}, rotation=
              0)));
  equation
    connect(inertia1.flange_b, idealGear.flange_a)
      annotation (Line(points={{-22,0},{-8,0}}, color={0,0,0}));
    connect(idealGear.flange_b, inertia2.flange_a)
      annotation (Line(points={{8,0},{22,0}}, color={0,0,0}));
    connect(inertia2.flange_b, spring.flange_a)
      annotation (Line(points={{38,0},{52,0}}, color={0,0,0}));
    connect(spring.flange_b, inertia3.flange_a)
      annotation (Line(points={{68,0},{82,0}}, color={0,0,0}));
    connect(damper.flange_a, inertia2.flange_b)
      annotation (Line(points={{46,-14},{46,0},{38,0}}, color={0,0,0}));
    connect(damper.flange_b, fixed.flange)
      annotation (Line(points={{46,-30},{46,-40}}, color={0,0,0}));
    connect(sine.y, torque.tau)
      annotation (Line(points={{-81.2,0},{-69.6,0}}, color={0,0,127}));
    connect(torque.support, fixed.flange)
      annotation (Line(points={{-60,-8},{-60,-40},{46,-40}}, color={0,0,0}));
    connect(idealGear.support, fixed.flange)
      annotation (Line(points={{0,-8},{0,-40},{46,-40}}, color={0,0,0}));
    connect(torque.flange, inertia1.flange_a) annotation (Line(
        points={{-52,0},{-38,0}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>The drive train consists of a motor inertia which is driven by
a sine-wave motor torque. Via a gearbox the rotational energy is
transmitted to a load inertia. Elasticity in the gearbox is modeled
by a spring element. A linear damper is used to model the
damping in the gearbox bearing.</p>
<p>Note, that a force component (like the damper of this example)
which is acting between a shaft and the housing has to be fixed
in the housing on one side via component Fixed.</p>
<p>Simulate for 1 second and plot the following variables:<br>
   angular velocities of inertias inertia2 and 3: inertia2.w, inertia3.w</p>

</html>"),
      experiment(StopTime=1.0, Interval=0.001));
  end First;

  model FirstGrounded
    "First example: simple drive train with grounded elements"
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Torque amplitude=10
      "Amplitude of driving torque";
    parameter Modelica_SIunits.Frequency freqHz=5 "Frequency of driving torque";
    parameter Modelica_SIunits.Inertia Jmotor(min=0) = 0.1 "Motor inertia";
    parameter Modelica_SIunits.Inertia Jload(min=0) = 2 "Load inertia";
    parameter Real ratio=10 "Gear ratio";
    parameter Real damping=10 "Damping in bearing of gear";

    Modelica_Mechanics_Rotational.Components.Fixed fixed annotation (Placement(
          transformation(extent={{38,-48},{54,-32}}, rotation=0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque(useSupport=false)
      annotation (Placement(transformation(extent={{-68,-8},{-52,8}}, rotation=
              0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia1(J=Jmotor)
      annotation (Placement(transformation(extent={{-38,-8},{-22,8}}, rotation=
              0)));
    Modelica_Mechanics_Rotational.Components.IdealGear idealGear(ratio=ratio,
        useSupport=false) annotation (Placement(transformation(extent={{-8,-8},
              {8,8}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia2(
      J=2,
      phi(fixed=true, start=0),
      w(fixed=true, start=0)) annotation (Placement(transformation(extent={{22,
              -8},{38,8}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Spring spring(c=1.e4, phi_rel(
          fixed=true)) annotation (Placement(transformation(extent={{52,-8},{68,
              8}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia3(J=Jload, w(fixed=
            true, start=0)) annotation (Placement(transformation(extent={{82,-8},
              {98,8}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Damper damper(d=damping)
      annotation (Placement(transformation(
          origin={46,-22},
          extent={{-8,-8},{8,8}},
          rotation=270)));
    Modelica_Blocks.Sources.Sine sine(amplitude=amplitude, freqHz=freqHz)
      annotation (Placement(transformation(extent={{-98,-8},{-82,8}},
            rotation=0)));
  equation
    connect(inertia1.flange_b, idealGear.flange_a)
      annotation (Line(points={{-22,0},{-8,0}}, color={0,0,0}));
    connect(idealGear.flange_b, inertia2.flange_a)
      annotation (Line(points={{8,0},{22,0}}, color={0,0,0}));
    connect(inertia2.flange_b, spring.flange_a)
      annotation (Line(points={{38,0},{52,0}}, color={0,0,0}));
    connect(spring.flange_b, inertia3.flange_a)
      annotation (Line(points={{68,0},{82,0}}, color={0,0,0}));
    connect(damper.flange_a, inertia2.flange_b)
      annotation (Line(points={{46,-14},{46,0},{38,0}}, color={0,0,0}));
    connect(damper.flange_b, fixed.flange)
      annotation (Line(points={{46,-30},{46,-40}}, color={0,0,0}));
    connect(sine.y, torque.tau)
      annotation (Line(points={{-81.2,0},{-69.6,0}}, color={0,0,127}));
    connect(torque.flange, inertia1.flange_a) annotation (Line(
        points={{-52,0},{-38,0}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>The drive train consists of a motor inertia which is driven by
a sine-wave motor torque. Via a gearbox the rotational energy is
transmitted to a load inertia. Elasticity in the gearbox is modeled
by a spring element. A linear damper is used to model the
damping in the gearbox bearing.</p>
<p>Note, that a force component (like the damper of this example)
which is acting between a shaft and the housing has to be fixed
in the housing on one side via component Fixed.</p>
<p>Simulate for 1 second and plot the following variables:<br>
   angular velocities of inertias inertia2 and 3: inertia2.w, inertia3.w</p>

</HTML>"),
         experiment(StopTime=1.0, Interval=0.001));
  end FirstGrounded;

  model Friction "Drive train with clutch and brake"
    import Modelica_Constants.pi;
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Time startTime=0.5 "Start time of step";
    output Modelica_SIunits.Torque tMotor=torque.tau
      "Driving torque of inertia3";
    output Modelica_SIunits.Torque tClutch=clutch.tau
      "Friction torque of clutch";
    output Modelica_SIunits.Torque tBrake=brake.tau "Friction torque of brake";
    output Modelica_SIunits.Torque tSpring=spring.tau "Spring torque";

    Modelica_Mechanics_Rotational.Sources.Torque torque(useSupport=true)
      annotation (Placement(transformation(extent={{-90,-10},{-70,10}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia3(
      J=1,
      phi(
        start=0,
        fixed=true,
        displayUnit="deg"),
      w(start=100,
        fixed=true,
        displayUnit="rad/s")) annotation (Placement(transformation(extent={{-60,
              -10},{-40,10}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Clutch clutch(fn_max=160)
      annotation (Placement(transformation(extent={{-30,-10},{-10,10}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia2(
      J=0.05,
      phi(start=0, fixed=true),
      w(start=90, fixed=true)) annotation (Placement(transformation(extent={{0,
              -10},{20,10}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.SpringDamper spring(c=160, d=1)
      annotation (Placement(transformation(extent={{30,-10},{50,10}}, rotation=
              0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertia1(
      J=1,
      phi(start=0, fixed=true),
      w(start=90, fixed=true)) annotation (Placement(transformation(extent={{90,
              -10},{110,10}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Brake brake(fn_max=1600,
        useSupport=true) annotation (Placement(transformation(extent={{60,-10},
              {80,10}}, rotation=0)));
    Modelica_Blocks.Sources.Constant const(k=1) annotation (Placement(
          transformation(
          origin={-25,35},
          extent={{-5,-5},{15,15}},
          rotation=270)));
    Modelica_Blocks.Sources.Step step(startTime=startTime) annotation (
        Placement(transformation(
          origin={65,35},
          extent={{-5,-5},{15,15}},
          rotation=270)));
    Modelica_Blocks.Sources.Step step2(
      height=-1,
      offset=1,
      startTime=startTime) annotation (Placement(transformation(extent={{-160,
              -30},{-140,-10}}, rotation=0)));
    Modelica_Blocks.Sources.Sine sine(amplitude=200, freqHz=50/pi)
      annotation (Placement(transformation(extent={{-160,10},{-140,30}},
            rotation=0)));
    Modelica_Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-120,-10},{-100,10}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Fixed fixed annotation (Placement(
          transformation(extent={{-10,-30},{10,-10}}, rotation=0)));
  equation
    connect(torque.flange, inertia3.flange_a)
      annotation (Line(points={{-70,0},{-70,0},{-60,0}}, color={0,0,0}));
    connect(inertia3.flange_b, clutch.flange_a)
      annotation (Line(points={{-40,0},{-30,0}},color={0,0,0}));
    connect(clutch.flange_b, inertia2.flange_a)
      annotation (Line(points={{-10,0},{0,0}},color={0,0,0}));
    connect(inertia2.flange_b, spring.flange_a)
      annotation (Line(points={{20,0},{30,0}}, color={0,0,0}));
    connect(spring.flange_b, brake.flange_a)
      annotation (Line(points={{50,0},{60,0}}, color={0,0,0}));
    connect(brake.flange_b, inertia1.flange_a)
      annotation (Line(points={{80,0},{80,0},{90,0}}, color={0,0,0}));
    connect(sine.y, product.u1) annotation (Line(points={{-139,20},{-130,20},
            {-130,6},{-122,6}}, color={0,0,127}));
    connect(step2.y, product.u2) annotation (Line(points={{-139,-20},{-130,-20},
            {-130,-6},{-126,-6},{-122,-6}}, color={0,0,127}));
    connect(product.y, torque.tau)
      annotation (Line(points={{-99,0},{-99,0},{-92,0}}, color={0,0,127}));
    connect(const.y, clutch.f_normalized) annotation (Line(points={{-20,19},{
            -20,12.75},{-20,11}}, color={0,0,127}));
    connect(step.y, brake.f_normalized)
      annotation (Line(points={{70,19},{70,16},{70,11}}, color={0,0,127}));
    connect(torque.support, fixed.flange)
      annotation (Line(points={{-80,-10},{-80,-20},{0,-20}}, color={0,0,0}));
    connect(brake.support, fixed.flange)
      annotation (Line(points={{70,-10},{70,-20},{0,-20}}, color={0,0,0}));
    annotation (Documentation(info="<html>
<p>This drive train contains a frictional <b>clutch</b> and a <b>brake</b>.
Simulate the system for 1 second using the following initial
values (defined already in the model):</p>
<pre>   inertia1.w =  90 (or brake.w)
   inertia2.w =  90
   inertia3.w = 100
</pre>
<p>Plot the output signals</p>
<pre>   tMotor      Torque of motor
   tClutch     Torque in clutch
   tBrake      Torque in brake
   tSpring     Torque in spring
</pre>
<p>as well as the absolute angular velocities of the three inertia components
(inertia1.w, inertia2.w, inertia3.w).</p>

</HTML>"),
         experiment(StopTime=3.0, Interval=0.001),
    Diagram(coordinateSystem(extent = {{-170,-100},{120,100}})));
  end Friction;

  model CoupledClutches "Drive train with 3 dynamically coupled clutches"
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Frequency freqHz=0.2
      "Frequency of sine function to invoke clutch1";
    parameter Modelica_SIunits.Time T2=0.4 "Time when clutch2 is invoked";
    parameter Modelica_SIunits.Time T3=0.9 "Time when clutch3 is invoked";

    Modelica_Mechanics_Rotational.Components.Inertia J1(
      J=1,
      phi(fixed=true, start=0),
      w(start=10, fixed=true)) annotation (Placement(transformation(extent={{-70,
              -10},{-50,10}}, rotation=0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque(useSupport=true)
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Components.Clutch clutch1(peak=1.1, fn_max=20)
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}},
            rotation=0)));
    Modelica_Blocks.Sources.Sine sin1(amplitude=10, freqHz=5) annotation (
        Placement(transformation(extent={{-130,-10},{-110,10}}, rotation=0)));
    Modelica_Blocks.Sources.Step step1(startTime=T2) annotation (Placement(
          transformation(
          origin={25,35},
          extent={{-5,-5},{15,15}},
          rotation=270)));
    Modelica_Mechanics_Rotational.Components.Inertia J2(
      J=1,
      phi(fixed=true, start=0),
      w(fixed=true, start=0)) annotation (Placement(transformation(extent={{-10,
              -10},{10,10}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Clutch clutch2(peak=1.1, fn_max=20)
      annotation (Placement(transformation(extent={{20,-10},{40,10}}, rotation=
              0)));
    Modelica_Mechanics_Rotational.Components.Inertia J3(
      J=1,
      phi(fixed=true, start=0),
      w(fixed=true, start=0)) annotation (Placement(transformation(extent={{50,
              -10},{70,10}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Clutch clutch3(peak=1.1, fn_max=20)
      annotation (Placement(transformation(extent={{80,-10},{100,10}}, rotation=
             0)));
    Modelica_Mechanics_Rotational.Components.Inertia J4(
      J=1,
      phi(fixed=true, start=0),
      w(fixed=true, start=0)) annotation (Placement(transformation(extent={{110,
              -10},{130,10}}, rotation=0)));
    Modelica_Blocks.Sources.Sine sin2(
      amplitude=1,
      freqHz=freqHz,
      phase=1.57) annotation (Placement(transformation(
          origin={-35,35},
          extent={{-5,-5},{15,15}},
          rotation=270)));
    Modelica_Blocks.Sources.Step step2(startTime=T3) annotation (Placement(
          transformation(
          origin={85,35},
          extent={{-5,-5},{15,15}},
          rotation=270)));
    Modelica_Mechanics_Rotational.Components.Fixed fixed annotation (Placement(
          transformation(extent={{-100,-30},{-80,-10}}, rotation=0)));
  equation
    connect(torque.flange, J1.flange_a)
      annotation (Line(points={{-80,0},{-70,0}}, color={0,0,0}));
    connect(J1.flange_b, clutch1.flange_a)
      annotation (Line(points={{-50,0},{-40,0}}, color={0,0,0}));
    connect(clutch1.flange_b, J2.flange_a)
      annotation (Line(points={{-20,0},{-10,0}},color={0,0,0}));
    connect(J2.flange_b, clutch2.flange_a)
      annotation (Line(points={{10,0},{10,0},{20,0}}, color={0,0,0}));
    connect(clutch2.flange_b, J3.flange_a)
      annotation (Line(points={{40,0},{50,0}}, color={0,0,0}));
    connect(J3.flange_b, clutch3.flange_a)
      annotation (Line(points={{70,0},{80,0}}, color={0,0,0}));
    connect(clutch3.flange_b, J4.flange_a)
      annotation (Line(points={{100,0},{110,0}}, color={0,0,0}));
    connect(sin1.y, torque.tau)
      annotation (Line(points={{-109,0},{-102,0}}, color={0,0,127}));
    connect(sin2.y, clutch1.f_normalized) annotation (Line(points={{-30,19},{
            -30,19},{-30,11}}, color={0,0,127}));
    connect(step1.y, clutch2.f_normalized) annotation (Line(points={{30,19},{
            30,19},{30,10},{30,11}}, color={0,0,127}));
    connect(step2.y, clutch3.f_normalized)
      annotation (Line(points={{90,19},{90,19},{90,11}}, color={0,0,127}));
    connect(fixed.flange, torque.support) annotation (Line(points={{-90,-20},
            {-90,-11},{-90,-10}}, color={0,0,0}));
    annotation (
      Documentation(info="<html>
<p>This example demonstrates how variable structure
drive trains are handled. The drive train consists
of 4 inertias and 3 clutches, where the clutches
are controlled by input signals. The system has
2^3=8 different configurations and 3^3 = 27
different states (every clutch may be in forward
sliding, backward sliding or locked mode when the
relative angular velocity is zero). By invoking the
clutches at different time instances, the switching
of the configurations can be studied.</p>
<p>Simulate the system for 1.2 seconds with the
following initial values:<br>
J1.w = 10.</p>
<p>Plot the following variables:<br>
angular velocities of inertias (J1.w, J2.w, J3.w,
J4.w), frictional torques of clutches (clutchX.tau),
frictional mode of clutches (clutchX.mode) where
mode = -1/0/+1 means backward sliding,
locked, forward sliding.</p>

</HTML>"),
      __Dymola_Commands(file=
            "modelica://Modelica/Resources/Scripts/Dymola/Mechanics/Rotational/CoupledClutches.mos"
          "Simulate and Plot"),
      experiment(StopTime=1.5, Interval=0.001),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
              {140,100}})),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}})));
  end CoupledClutches;

  model LossyGearDemo1
    "Example to show that gear efficiency may lead to stuck motion"
    extends Modelica_Icons.Example;
    Modelica_SIunits.Power PowerLoss=gear.flange_a.tau*der(gear.flange_a.phi)
         + gear.flange_b.tau*der(gear.flange_b.phi) "Power lost in the gear";
    Modelica_Mechanics_Rotational.Components.LossyGear gear(
      ratio=2,
      lossTable=[0,0.5,0.5,0,0],
      useSupport=true) annotation (Placement(transformation(extent={{-10,0},{10,
              20}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia Inertia1(J=1) annotation (
        Placement(transformation(extent={{-40,0},{-20,20}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia Inertia2(
      J=1.5,
      phi(fixed=true, start=0),
      w(fixed=true, start=0)) annotation (Placement(transformation(extent={{20,
              0},{40,20}}, rotation=0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque1(useSupport=true)
      annotation (Placement(transformation(extent={{-70,0},{-50,20}}, rotation=
              0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque2(useSupport=true)
      annotation (Placement(transformation(extent={{70,0},{50,20}}, rotation=0)));
    Modelica_Blocks.Sources.Sine DriveSine(amplitude=10, freqHz=1)
      annotation (Placement(transformation(extent={{-100,0},{-80,20}},
            rotation=0)));
    Modelica_Blocks.Sources.Ramp load(
      height=5,
      duration=2,
      offset=-10) annotation (Placement(transformation(extent={{100,0},{80,20}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Components.Fixed fixed annotation (Placement(
          transformation(extent={{-10,-30},{10,-10}}, rotation=0)));
  equation
    connect(Inertia1.flange_b, gear.flange_a)
      annotation (Line(points={{-20,10},{-10,10}}, color={0,0,0}));
    connect(gear.flange_b, Inertia2.flange_a)
      annotation (Line(points={{10,10},{20,10}}, color={0,0,0}));
    connect(torque1.flange, Inertia1.flange_a)
      annotation (Line(points={{-50,10},{-40,10}}, color={0,0,0}));
    connect(torque2.flange, Inertia2.flange_b)
      annotation (Line(points={{50,10},{40,10}}, color={0,0,0}));
    connect(DriveSine.y, torque1.tau)
      annotation (Line(points={{-79,10},{-72,10}}, color={0,0,127}));
    connect(load.y, torque2.tau)
      annotation (Line(points={{79,10},{72,10}}, color={0,0,127}));
    connect(fixed.flange, gear.support)
      annotation (Line(points={{0,-20},{0,0}}, color={0,0,0}));
    connect(fixed.flange, torque1.support)
      annotation (Line(points={{0,-20},{-60,-20},{-60,0}}, color={0,0,0}));
    connect(fixed.flange, torque2.support)
      annotation (Line(points={{0,-20},{60,-20},{60,0}}, color={0,0,0}));
    annotation (Documentation(info="<html>
<p>
This model contains two inertias which are connected by an ideal
gear where the friction between the teeth of the gear is modeled in
a physical meaningful way (friction may lead to stuck mode which
locks the motion of the gear). The friction is defined by an
efficiency factor (= 0.5) for forward and backward driving condition leading
to a torque dependent friction loss. Simulate for about 0.5 seconds.
The friction in the gear will take all modes
(forward and backward rolling, as well as stuck).
</p>
<p>
You may plot:
</p>
<pre>
Inertia1.w,
Inertia2.w : angular velocities of inertias
powerLoss  : power lost in the gear
gear.mode  :  1 = forward rolling
              0 = stuck (w=0)
             -1 = backward rolling
</pre>
</html>"),
         experiment(StopTime=0.5, Interval=0.001));
  end LossyGearDemo1;

  model LossyGearDemo2
    "Example to show combination of LossyGear and BearingFriction"
    extends Modelica_Icons.Example;
    Modelica_SIunits.Power PowerLoss=gear.flange_a.tau*der(gear.flange_a.phi)
         + gear.flange_b.tau*der(gear.flange_b.phi) "Power lost in the gear";

    Modelica_Mechanics_Rotational.Components.LossyGear gear(
      ratio=2,
      lossTable=[0,0.5,0.5,0,0],
      useSupport=true) annotation (Placement(transformation(extent={{-20,0},{0,
              20}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia Inertia1(J=1) annotation (
        Placement(transformation(extent={{-50,0},{-30,20}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia Inertia2(
      J=1.5,
      phi(fixed=true, start=0),
      w(fixed=true, start=0)) annotation (Placement(transformation(extent={{10,
              0},{30,20}}, rotation=0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque1(useSupport=true)
      annotation (Placement(transformation(extent={{-110,0},{-90,20}}, rotation=
             0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque2(useSupport=true)
      annotation (Placement(transformation(extent={{60,0},{40,20}}, rotation=0)));
    Modelica_Blocks.Sources.Sine DriveSine(amplitude=10, freqHz=1)
      annotation (Placement(transformation(extent={{-140,0},{-120,20}},
            rotation=0)));
    Modelica_Blocks.Sources.Ramp load(
      height=5,
      duration=2,
      offset=-10) annotation (Placement(transformation(extent={{90,0},{70,20}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Components.BearingFriction bearingFriction(tau_pos=[
          0,0.5; 1,1], useSupport=true) annotation (Placement(transformation(
            extent={{-80,0},{-60,20}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Fixed fixed annotation (Placement(
          transformation(extent={{-20,-30},{0,-10}}, rotation=0)));
  equation
    connect(torque2.flange, Inertia2.flange_b)
      annotation (Line(points={{40,10},{30,10}}, color={0,0,0}));
    connect(Inertia2.flange_a, gear.flange_b)
      annotation (Line(points={{10,10},{0,10}}, color={0,0,0}));
    connect(gear.flange_a, Inertia1.flange_b)
      annotation (Line(points={{-20,10},{-30,10}},color={0,0,0}));
    connect(Inertia1.flange_a, bearingFriction.flange_b)
      annotation (Line(points={{-50,10},{-60,10}}, color={0,0,0}));
    connect(bearingFriction.flange_a, torque1.flange)
      annotation (Line(points={{-80,10},{-80,10},{-90,10}}, color={0,0,0}));
    connect(DriveSine.y, torque1.tau) annotation (Line(points={{-119,10},{-119,
            10},{-112,10}}, color={0,0,127}));
    connect(load.y, torque2.tau)
      annotation (Line(points={{69,10},{62,10}}, color={0,0,127}));
    connect(gear.support, fixed.flange)
      annotation (Line(points={{-10,0},{-10,-20}}, color={0,0,0}));
    connect(fixed.flange, torque2.support)
      annotation (Line(points={{-10,-20},{50,-20},{50,0}}, color={0,0,0}));
    connect(fixed.flange, bearingFriction.support)
      annotation (Line(points={{-10,-20},{-70,-20},{-70,0}}, color={0,0,0}));
    connect(torque1.support, fixed.flange) annotation (Line(points={{-100,0},
            {-100,-20},{-10,-20}}, color={0,0,0}));
    annotation (
      Diagram(coordinateSystem(extent = {{-150,-100},{100,100}})),
      Documentation(info="<html>
<p>
This model contains bearing friction and gear friction (= efficiency).
If both friction models are stuck, there is no unique solution.
Still a reliable Modelica simulator should
be able to handle this situation.
</p>
<p>
Simulate for about 0.5 seconds. The friction elements are
in all modes (forward and backward rolling, as well as stuck).
</p>
<p>
You may plot:
</p>
<pre>
Inertia1.w,
Inertia2.w          : angular velocities of inertias
powerLoss           : power lost in the gear
bearingFriction.mode:  1 = forward rolling
                       0 = stuck (w=0)
                      -1 = backward rolling
gear.mode           :  1 = forward rolling
                       0 = stuck (w=0)
                      -1 = backward rolling
</pre>
<p>Note: This combination of LossyGear and BearingFriction is not recommended to use,
as component LossyGear includes the functionality of component BearingFriction
(only <i>peak</i> not supported).</p>
</html>"),
         experiment(StopTime=0.5, Interval=0.001));
  end LossyGearDemo2;

  model LossyGearDemo3
    "Example that failed in the previous version of the LossyGear version"
    extends Modelica_Icons.Example;

    Modelica_Mechanics_Rotational.Components.LossyGear gear(
      ratio=1,
      lossTable=[0,0.25,0.25,0.625,2.5],
      useSupport=false) annotation (Placement(transformation(extent={{-10,0},
              {10,20}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia Inertia1(w(start=10), J=
          0.001) annotation (Placement(transformation(extent={{-40,0},{-20,20}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque1(useSupport=false)
      annotation (Placement(transformation(extent={{-68,0},{-48,20}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Sources.Torque torque2(useSupport=false)
      annotation (Placement(transformation(extent={{68,0},{48,20}}, rotation=
              0)));
    Modelica_Blocks.Sources.Step step(height=0) annotation (Placement(
          transformation(extent={{-100,0},{-80,20}}, rotation=0)));
    Modelica_Blocks.Sources.Step step1(
      startTime=0.5,
      height=1,
      offset=0) annotation (Placement(transformation(
          origin={90,10},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica_Mechanics_Rotational.Components.Inertia Inertia2(
      J=0.001,
      phi(fixed=true, start=0),
      w(start=10, fixed=true)) annotation (Placement(transformation(extent={{
              20,0},{40,20}}, rotation=0)));
  equation
    connect(Inertia1.flange_b, gear.flange_a)
      annotation (Line(points={{-20,10},{-16,10},{-10,10}}, color={0,0,0}));
    connect(torque1.flange, Inertia1.flange_a)
      annotation (Line(points={{-48,10},{-40,10}}, color={0,0,0}));
    connect(step.y, torque1.tau)
      annotation (Line(points={{-79,10},{-70,10}}, color={0,0,127}));
    connect(gear.flange_b, Inertia2.flange_a)
      annotation (Line(points={{10,10},{20,10}}, color={0,0,0}));
    connect(Inertia2.flange_b, torque2.flange)
      annotation (Line(points={{40,10},{48,10}}, color={0,0,0}));
    connect(step1.y, torque2.tau) annotation (Line(
        points={{79,10},{74.5,10},{74.5,10},{70,10}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(extent = {{-110,-100},{110,100}})),
      Documentation(info="<html>
<p>
This example demonstrates a situation where the driving side of the
LossyGear model is not obvious.
The version of LossyGear up to version 3.1 of package Modelica failed in this case
(no convergence of the event iteration).
</p>
</html>"),
         experiment(StopTime=1.0, Interval=0.001));
  end LossyGearDemo3;

  model ElasticBearing "Example to show possible usage of support flange"
    extends Modelica_Icons.Example;
    Modelica_Mechanics_Rotational.Components.Inertia shaft(
      phi(fixed=true, start=0),
      J=1,
      w(fixed=true, start=0)) annotation (Placement(transformation(extent={{-20,
              40},{0,60}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia load(J=50, w(fixed=true,
          start=0)) annotation (Placement(transformation(extent={{70,40},{90,60}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Components.Spring spring(c=1e3, phi_rel(fixed=
           true)) annotation (Placement(transformation(extent={{40,40},{60,60}},
            rotation=0)));
    Modelica_Mechanics_Rotational.Components.Fixed fixed annotation (Placement(
          transformation(extent={{10,-70},{30,-50}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.SpringDamper springDamper(
      c=1e5,
      d=5,
      phi_rel(fixed=true),
      w_rel(fixed=true)) annotation (Placement(transformation(
          origin={20,-36},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Mechanics_Rotational.Sources.Torque torque(useSupport=true)
      annotation (Placement(transformation(extent={{-50,40},{-30,60}}, rotation=
             0)));
    Modelica_Blocks.Sources.Ramp ramp(duration=5, height=100) annotation (
        Placement(transformation(extent={{-90,40},{-70,60}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.IdealGear idealGear(ratio=3,
        useSupport=true) annotation (Placement(transformation(extent={{10,40},{
              30,60}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia housing(J=5) annotation (
        Placement(transformation(
          origin={20,22},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Mechanics_Rotational.Sensors.MultiSensor multiSensor annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={20,-6})));
  equation
    connect(torque.flange, shaft.flange_a)
      annotation (Line(points={{-30,50},{-20,50}}, color={0,0,0}));
    connect(spring.flange_b, load.flange_a)
      annotation (Line(points={{60,50},{70,50}}, color={0,0,0}));
    connect(springDamper.flange_a, fixed.flange)
      annotation (Line(points={{20,-46},{20,-46},{20,-60}}, color={0,0,0}));
    connect(shaft.flange_b, idealGear.flange_a)
      annotation (Line(points={{0,50},{10,50}}, color={0,0,0}));
    connect(idealGear.flange_b, spring.flange_a)
      annotation (Line(points={{30,50},{40,50}}, color={0,0,0}));
    connect(idealGear.support, housing.flange_b)
      annotation (Line(points={{20,40},{20,32}}, color={0,0,0}));
    connect(ramp.y, torque.tau) annotation (Line(points={{-69,50},{-69,50},{-52,
            50}}, color={0,0,127}));
    connect(fixed.flange, torque.support)
      annotation (Line(points={{20,-60},{-40,-60},{-40,40}}, color={0,0,0}));
    connect(housing.flange_a, multiSensor.flange_b) annotation (Line(
        points={{20,12},{20,4}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(multiSensor.flange_a, springDamper.flange_b) annotation (Line(
        points={{20,-16},{20,-26}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This model demonstrates the usage of the bearing flange.
The gearbox is not connected rigidly to the ground, but by
a spring-damper-system. This allows examination of the gearbox
housing dynamics.</p>
<p>
Simulate for about 10 seconds and plot the angular velocities of the inertias <code>housing.w</code>,
<code>shaft.w</code> and <code>load.w</code>.</p>
</html>"),
      experiment(StopTime=10, Interval=0.01));
  end ElasticBearing;

  model Backlash "Example to demonstrate backlash"
    extends Modelica_Icons.Example;
    Modelica_Mechanics_Rotational.Components.Fixed fixed1
      annotation (Placement(transformation(extent={{-50,50},{-30,70}})));
    Modelica_Mechanics_Rotational.Components.SpringDamper springDamper(
      c=20E3,
      d=50,
      phi_nominal=1)
      annotation (Placement(transformation(extent={{-20,50},{0,70}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia1(
      J=5,
      w(fixed=true, start=0),
      phi(
        fixed=true,
        displayUnit="deg",
        start=1.570796326794897))
      annotation (Placement(transformation(extent={{20,50},{40,70}})));
    Modelica_Mechanics_Rotational.Components.Fixed fixed2
      annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
    Modelica_Mechanics_Rotational.Components.ElastoBacklash elastoBacklash(
      c=20E3,
      d=50,
      b(displayUnit="deg") = 0.7853981633974483,
      phi_nominal=1)
      annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia2(
      J=5,
      w(fixed=true, start=0),
      phi(
        fixed=true,
        start=1.570796326794897,
        displayUnit="deg"))
      annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
  equation
    connect(springDamper.flange_b, inertia1.flange_a) annotation (Line(
        points={{0,60},{20,60}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(elastoBacklash.flange_b, inertia2.flange_a) annotation (Line(
        points={{0,-40},{20,-40}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(fixed1.flange, springDamper.flange_a) annotation (Line(
        points={{-40,60},{-20,60}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(fixed2.flange, elastoBacklash.flange_a) annotation (Line(
        points={{-40,-40},{-20,-40}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>
This model demonstrates the effect of a backlash on eigenfrequency, and
also that the damping torque does not lead to unphysical pulling torques
(since the ElastoBacklash model takes care of it).
</p>
</html>"),
         experiment(StopTime=1.0, Interval=0.001));
  end Backlash;

  model RollingWheel "Demonstrate coupling Rotational - Translational"
    extends Modelica_Icons.Example;
    Modelica_Mechanics_Rotational.Components.IdealRollingWheel idealRollingWheel(radius=1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia(
      J=1,
      phi(fixed=true, start=0),
      w(fixed=true, start=0))
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStep(
      stepTorque=10,
      offsetTorque=0,
      startTime=0.1,
      useSupport=false)
      annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
    Modelica_Mechanics_Translational.Components.Mass mass(L=0, m=1)
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica_Mechanics_Translational.Sources.QuadraticSpeedDependentForce
      quadraticSpeedDependentForce(
      f_nominal=-10,
      ForceDirection=false,
      v_nominal=5)
      annotation (Placement(transformation(extent={{72,-10},{52,10}})));
  equation

    connect(torqueStep.flange, inertia.flange_a) annotation (Line(
        points={{-50,0},{-40,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(inertia.flange_b, idealRollingWheel.flangeR) annotation (Line(
        points={{-20,0},{-10,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(idealRollingWheel.flangeT, mass.flange_a) annotation (Line(
        points={{10,0},{20,0}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(quadraticSpeedDependentForce.flange, mass.flange_b) annotation (
        Line(
        points={{52,0},{40,0}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>
This model demonstrates the coupling between rotational and translational components:<br>
A torque (step) accelerates both the inertia (of the wheel) and the mass (of the vehicle).<br>
Du to a speed dependent force (like driving resistance), we find an equilibrium at 5 m/s after approx. 5 s.
</p>
</html>"),
         experiment(StopTime=5.0, Interval=0.001));
  end RollingWheel;

  model HeatLosses "Demonstrate the modeling of heat losses"
    extends Modelica_Icons.Example;
    Modelica_Blocks.Sources.Sine sine(freqHz=5, amplitude=20)
      annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
    Modelica_Mechanics_Rotational.Sources.Torque torque
      annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia1(
      J=2,
      phi(fixed=true, start=0),
      w(fixed=true, start=0))
      annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    Modelica_Mechanics_Rotational.Components.Damper damper(useHeatPort=true, d=
          10) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={-20,10})));
    Modelica_Mechanics_Rotational.Components.Fixed fixed
      annotation (Placement(transformation(extent={{-30,-20},{-10,0}})));
    Modelica_Thermal_HeatTransfer.Components.Convection convection
      annotation (Placement(transformation(extent={{20,-20},{40,-40}})));
    Modelica_Thermal_HeatTransfer.Celsius.FixedTemperature TAmbient(T=25)
      "Ambient temperature"
      annotation (Placement(transformation(extent={{68,-40},{48,-20}})));
    Modelica_Blocks.Sources.Constant const(k=20)
      annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
    Modelica_Mechanics_Rotational.Components.SpringDamper springDamper(
      c=1e4,
      d=20,
      useHeatPort=true)
      annotation (Placement(transformation(extent={{-10,20},{10,40}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia2(
      J=2,
      phi(fixed=true, start=0),
      w(fixed=true, start=0))
      annotation (Placement(transformation(extent={{20,20},{40,40}})));
    Modelica_Mechanics_Rotational.Components.ElastoBacklash elastoBacklash(
      c=1e5,
      d=100,
      useHeatPort=true,
      b(displayUnit="rad") = 0.001)
      annotation (Placement(transformation(extent={{50,20},{70,40}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia3(
      J=2,
      phi(fixed=true, start=0),
      w(fixed=true, start=0))
      annotation (Placement(transformation(extent={{80,20},{100,40}})));
    Modelica_Mechanics_Rotational.Components.BearingFriction bearingFriction(
        useHeatPort=true)
      annotation (Placement(transformation(extent={{110,20},{130,40}})));
    Modelica_Mechanics_Rotational.Components.Spring spring3(c=1e4)
      annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia4(
      J=2,
      phi(fixed=true, start=0),
      w(fixed=true, start=0))
      annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
    Modelica_Mechanics_Rotational.Components.LossyGear lossyGear(
      ratio=2,
      lossTable=[0,0.8,0.8,1,1; 1,0.7,0.7,2,2],
      useHeatPort=true)
      annotation (Placement(transformation(extent={{-10,70},{10,90}})));
    Modelica_Mechanics_Rotational.Components.Clutch clutch(
      useHeatPort=true,
      fn_max=10,
      phi_rel(fixed=true),
      w_rel(fixed=true))
      annotation (Placement(transformation(extent={{20,70},{40,90}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia5(J=2)
      annotation (Placement(transformation(extent={{50,70},{70,90}})));
    Modelica_Blocks.Sources.Sine sine2(freqHz=0.2, amplitude=1)
      annotation (Placement(transformation(extent={{0,110},{20,130}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia6(J=2)
      annotation (Placement(transformation(extent={{110,70},{130,90}})));
    Modelica_Mechanics_Rotational.Components.OneWayClutch oneWayClutch(
      phi_rel(fixed=true),
      w_rel(fixed=true),
      startForward(fixed=true),
      stuck(fixed=true),
      fn_max=1,
      useHeatPort=true)
      annotation (Placement(transformation(extent={{80,70},{100,90}})));
    Modelica_Mechanics_Rotational.Components.Brake brake(fn_max=2, useHeatPort=
          true)
      annotation (Placement(transformation(extent={{140,70},{160,90}})));
  equation

    connect(sine.y, torque.tau) annotation (Line(
        points={{-79,30},{-72,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(torque.flange, inertia1.flange_a) annotation (Line(
        points={{-50,30},{-40,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(inertia1.flange_b, damper.flange_b) annotation (Line(
        points={{-20,30},{-20,25},{-20,20},{-20,20}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(damper.flange_a, fixed.flange) annotation (Line(
        points={{-20,0},{-20,-5},{-20,-5},{-20,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(damper.heatPort, convection.solid) annotation (Line(
        points={{-30,0},{-30,-30},{20,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(TAmbient.port, convection.fluid) annotation (Line(
        points={{48,-30},{40,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(const.y, convection.Gc) annotation (Line(
        points={{21,-60},{30,-60},{30,-40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(inertia1.flange_b, springDamper.flange_a) annotation (Line(
        points={{-20,30},{-10,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(springDamper.heatPort, convection.solid) annotation (Line(
        points={{-10,20},{-10,-30},{20,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(springDamper.flange_b, inertia2.flange_a) annotation (Line(
        points={{10,30},{20,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(elastoBacklash.flange_a, inertia2.flange_b) annotation (Line(
        points={{50,30},{40,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(elastoBacklash.heatPort, convection.solid) annotation (Line(
        points={{50,20},{50,0},{-10,0},{-10,-30},{20,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(elastoBacklash.flange_b, inertia3.flange_a) annotation (Line(
        points={{70,30},{80,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(inertia3.flange_b, bearingFriction.flange_a) annotation (Line(
        points={{100,30},{110,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(convection.solid, bearingFriction.heatPort) annotation (Line(
        points={{20,-30},{-10,-30},{-10,0},{110,0},{110,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(spring3.flange_b, inertia4.flange_a) annotation (Line(
        points={{-50,80},{-40,80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(bearingFriction.flange_b, spring3.flange_a) annotation (Line(
        points={{130,30},{130,48},{-70,48},{-70,80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(inertia4.flange_b, lossyGear.flange_a) annotation (Line(
        points={{-20,80},{-10,80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(lossyGear.heatPort, convection.solid) annotation (Line(
        points={{-10,70},{-10,60},{140,60},{140,0},{-10,0},{-10,-30},{20,-30}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(lossyGear.flange_b, clutch.flange_a) annotation (Line(
        points={{10,80},{20,80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(clutch.heatPort, convection.solid) annotation (Line(
        points={{20,70},{20,60},{140,60},{140,0},{-10,0},{-10,-30},{20,-30}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(clutch.flange_b, inertia5.flange_a) annotation (Line(
        points={{40,80},{50,80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(sine2.y, clutch.f_normalized) annotation (Line(
        points={{21,120},{30,120},{30,91}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(inertia5.flange_b, oneWayClutch.flange_a) annotation (Line(
        points={{70,80},{80,80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(oneWayClutch.flange_b, inertia6.flange_a) annotation (Line(
        points={{100,80},{110,80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(sine2.y, oneWayClutch.f_normalized) annotation (Line(
        points={{21,120},{90,120},{90,91}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(inertia6.flange_b, brake.flange_a) annotation (Line(
        points={{130,80},{140,80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(sine2.y, brake.f_normalized) annotation (Line(
        points={{21,120},{150,120},{150,91}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(oneWayClutch.heatPort, convection.solid) annotation (Line(
        points={{80,70},{80,60},{140,60},{140,0},{-10,0},{-10,-30},{20,-30}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(brake.heatPort, convection.solid) annotation (Line(
        points={{140,70},{140,0},{-10,0},{-10,-30},{20,-30}},
        color={191,0,0},
        smooth=Smooth.None));

    annotation (
      Documentation(info="<html>
<p>
This model demonstrates how to model the dissipated power of a drive train,
by enabling the heatPort of all components and connecting these heatPorts via
a convection element to the environment. The total heat flow generated by the
elements of the drive train and transported to the environment
is present in variable convection.fluid.
</p>
</html>"),
      experiment(StopTime=1.0, Interval=0.0001),
      Diagram(coordinateSystem(extent={{-120,-100},{180,140}})));
  end HeatLosses;

  model SimpleGearShift "Simple Gearshift"
    extends Modelica_Icons.Example;
    output Modelica_SIunits.AngularVelocity wEngine=engine.w "Speed of engine";
    output Modelica_SIunits.AngularVelocity wLoad=load.w "Speed of load";
    output Real gearRatio=wLoad/max(wEngine, 1E-6) "gear ratio load/engine";
    Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStep(
      offsetTorque=0,
      startTime=0.5,
      stepTorque=20)
      annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
    Modelica_Mechanics_Rotational.Components.Inertia engine(J=1)
      annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
    Modelica_Mechanics_Rotational.Components.IdealPlanetary idealPlanetary(ratio=75/
          50)
      annotation (Placement(transformation(extent={{-10,0},{10,-20}})));
    Modelica_Mechanics_Rotational.Components.Inertia load(
      J=10,
      phi(fixed=true, start=0),
      w(fixed=true, start=0))
      annotation (Placement(transformation(extent={{30,-20},{50,0}})));
    Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque quadraticSpeedDependentTorque(w_nominal(
          displayUnit="rpm") = 10.471975511966, tau_nominal=-20)
      annotation (Placement(transformation(extent={{80,-20},{60,0}})));
    Modelica_Mechanics_Rotational.Components.Clutch clutch(
      cgeo=2,
      fn_max=100,
      phi_rel(fixed=true),
      w_rel(fixed=true))
      annotation (Placement(transformation(extent={{-10,10},{10,30}})));
    Modelica_Mechanics_Rotational.Components.Brake brake(cgeo=2, fn_max=100)
      annotation (Placement(transformation(extent={{20,10},{40,30}})));
    Modelica_Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{-10,50},{10,70}})));
    Modelica_Blocks.Sources.Constant const1(k=1)
      annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
    Modelica_Blocks.Sources.Ramp ramp(
      height=1,
      offset=0,
      startTime=2,
      duration=0.1)
      annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  equation
    connect(torqueStep.flange, engine.flange_a) annotation (Line(
        points={{-60,-10},{-50,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(quadraticSpeedDependentTorque.flange, load.flange_b) annotation (
        Line(
        points={{60,-10},{50,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(feedback.y, brake.f_normalized) annotation (Line(
        points={{9,60},{30,60},{30,31}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(engine.flange_b, idealPlanetary.sun) annotation (Line(
        points={{-30,-10},{-10,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(idealPlanetary.sun, clutch.flange_a) annotation (Line(
        points={{-10,-10},{-10,20}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(idealPlanetary.ring, clutch.flange_b) annotation (Line(
        points={{10,-10},{10,20}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(idealPlanetary.ring, brake.flange_a) annotation (Line(
        points={{10,-10},{20,-10},{20,20}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(idealPlanetary.carrier, load.flange_a) annotation (Line(
        points={{-10,-14},{-20,-14},{-20,-30},{30,-30},{30,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(const1.y, feedback.u1) annotation (Line(
        points={{-19,60},{-8,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(feedback.u2, clutch.f_normalized) annotation (Line(
        points={{0,52},{0,31}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(ramp.y, clutch.f_normalized) annotation (Line(
        points={{-39,40},{0,40},{0,31}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=5, Interval=0.01), Documentation(info="<html>
<p>This model shows how an automatic gear shift is built up from a planetary gear, a brake and a clutch. </p>
<ul>
<li>In the beginning, the clutch is free and the brake fixes the ring of the planetary. Thus we obtain a gearRatio = 1/(1 + planetary.ratio).</li>
<li>At time = 2 s, the brake frees the ring of the planetary, whereas the clutch blocks the ring and the sun. Thus we obtain a gearRatio = 1.</li>
</ul>
</html>"));
  end SimpleGearShift;

  model GenerationOfFMUs
    "Example to demonstrate variants to generate FMUs (Functional Mockup Units)"
    extends Modelica_Icons.Example;

    Modelica_Blocks.Sources.Sine sine1(freqHz=2, amplitude=10)
      annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
    Utilities.DirectInertia directInertia(J=1.1)
      annotation (Placement(transformation(extent={{-20,40},{0,60}})));
    Utilities.InverseInertia inverseInertia(J=2.2)
      annotation (Placement(transformation(extent={{20,40},{40,60}})));
    Utilities.SpringDamper springDamper(c=1e4, d=100)
      annotation (Placement(transformation(extent={{10,-20},{30,0}})));
    Modelica_Blocks.Sources.Sine sine2(freqHz=2, amplitude=10)
      annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia2a(
      J=1.1,
      phi(fixed=true, start=0),
      w(fixed=true, start=0))
      annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
    Modelica_Mechanics_Rotational.Sources.Torque torque2
      annotation (Placement(transformation(extent={{-68,-20},{-48,0}})));
    Modelica_Mechanics_Rotational.Components.TorqueToAngleAdaptor torqueToAngle2a(use_a=
          false)
      annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia2b(
      phi(fixed=true, start=0),
      w(fixed=true, start=0),
      J=2.2) annotation (Placement(transformation(extent={{60,-20},{80,0}})));
    Modelica_Mechanics_Rotational.Components.TorqueToAngleAdaptor torqueToAngle2b(use_a=
          false)
      annotation (Placement(transformation(extent={{60,-20},{40,0}})));
    Utilities.Spring spring(c=1e4)
      annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
    Modelica_Blocks.Sources.Sine sine3(freqHz=2, amplitude=10)
      annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia3a(
      J=1.1,
      phi(fixed=true, start=0),
      w(fixed=true, start=0))
      annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
    Modelica_Mechanics_Rotational.Sources.Torque torque3
      annotation (Placement(transformation(extent={{-68,-80},{-48,-60}})));
    Modelica_Mechanics_Rotational.Components.TorqueToAngleAdaptor torqueToAngle3a(use_a=
          false, use_w=false)
      annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    Modelica_Mechanics_Rotational.Components.Inertia inertia3b(
      phi(fixed=true, start=0),
      w(fixed=true, start=0),
      J=2.2) annotation (Placement(transformation(extent={{60,-80},{80,-60}})));
    Modelica_Mechanics_Rotational.Components.TorqueToAngleAdaptor torqueToAngle3b(use_a=
          false, use_w=false)
      annotation (Placement(transformation(extent={{60,-80},{40,-60}})));
  equation
    connect(sine1.y, directInertia.tauDrive) annotation (Line(
        points={{-39,50},{-22,50}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(directInertia.phi, inverseInertia.phi) annotation (Line(
        points={{1,58},{18,58}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(directInertia.w, inverseInertia.w) annotation (Line(
        points={{1,53},{18,53}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(directInertia.a, inverseInertia.a) annotation (Line(
        points={{1,47},{18,47}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(inverseInertia.tau, directInertia.tau) annotation (Line(
        points={{19,42},{2,42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(torque2.flange, inertia2a.flange_a) annotation (Line(
        points={{-48,-10},{-40,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(sine2.y, torque2.tau) annotation (Line(
        points={{-79,-10},{-70,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(inertia2a.flange_b, torqueToAngle2a.flange) annotation (Line(
        points={{-20,-10},{-12,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(torqueToAngle2a.phi, springDamper.phi1) annotation (Line(
        points={{-7,-2},{8,-2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(torqueToAngle2a.w, springDamper.w1) annotation (Line(
        points={{-7,-7},{8,-7}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(springDamper.tau1, torqueToAngle2a.tau) annotation (Line(
        points={{9,-18},{-6,-18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(torqueToAngle2b.phi, springDamper.phi2) annotation (Line(
        points={{47,-2},{32,-2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(torqueToAngle2b.w, springDamper.w2) annotation (Line(
        points={{47,-7},{32,-7}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(springDamper.tau2, torqueToAngle2b.tau) annotation (Line(
        points={{31,-18},{46,-18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(inertia2b.flange_a, torqueToAngle2b.flange) annotation (Line(
        points={{60,-10},{52,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(torque3.flange, inertia3a.flange_a) annotation (Line(
        points={{-48,-70},{-40,-70}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(sine3.y, torque3.tau) annotation (Line(
        points={{-79,-70},{-70,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(inertia3a.flange_b, torqueToAngle3a.flange) annotation (Line(
        points={{-20,-70},{-12,-70}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(torqueToAngle3a.phi, spring.phi1) annotation (Line(
        points={{-7,-62},{8,-62}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(spring.tau1, torqueToAngle3a.tau) annotation (Line(
        points={{9,-78},{-6,-78}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(torqueToAngle3b.phi, spring.phi2) annotation (Line(
        points={{47,-62},{32,-62}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(spring.tau2, torqueToAngle3b.tau) annotation (Line(
        points={{31,-78},{46,-78}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(inertia3b.flange_a, torqueToAngle3b.flange) annotation (Line(
        points={{60,-70},{52,-70}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation ( Documentation(info="<html>
<p>
This example demonstrates how to generate an input/output block (e.g. in form of an
FMU - <a href=\"https://www.fmi-standard.org\">Functional Mockup Unit</a>) from various Rotational components.
The goal is to export such an input/output block from Modelica and import
it in another modeling environment. The essential issue is that before
exporting it must be known in which way the component is utilized in the
target environment. Depending on the target usage, different flange variables
need to be in the interface with either input or output causality.
Note, this example model can be used to test the FMU export/import of a Modelica tool.
Just export the components marked in the icons as \"toFMU\" as FMUs and import
them back. The models should then still work and give the same results as a
pure Modelica model.
</p>

<p>
<b>Connecting two inertias</b><br>
The upper part (DirectInertia, InverseInertia)
demonstrates how to export two inertias and connect them
together in a target system. This requires that one of the inertias
(here: DirectInertia)
is defined to have states and the angle, angular velocity and angular
acceleration are provided in the interface.
The other inertia (here: InverseInertia) is moved according
to the provided input angle, angular velocity and angular acceleration.
</p>

<p>
<b>Connecting a force element that needs angles and angular velocities</b><br>
The middle part (SpringDamper) demonstrates how to export a force element
that needs both angles and angular velocities for its force law and connect this
force law in a target system between two inertias.
</p>

<p>
<b>Connecting a force element that needs only angles</b><br>
The lower part (Spring) demonstrates how to export a force element
that needs only angles for its force law and connect this
force law in a target system between two inertias.
</p>
</html>"));
  end GenerationOfFMUs;

  package Utilities "Utility components used by the example models"
    extends Modelica_Icons.UtilitiesPackage;
    model DirectInertia "Input/output block of a direct inertia model"
      extends Modelica_Blocks.Icons.Block;
      parameter Modelica_SIunits.Inertia J(min=0)=1 "Moment of inertia";

      Modelica_Mechanics_Rotational.Components.Inertia inertia(
        phi(start=0, fixed=true),
        w(start=0, fixed=true),
        J=J) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      Modelica_Mechanics_Rotational.Sources.Torque torque
        annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
      Modelica_Blocks.Interfaces.RealInput tauDrive(unit="N.m")
        "Accelerating torque acting at flange (= -flange.tau)"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica_Mechanics_Rotational.Components.TorqueToAngleAdaptor torqueToAngle
        annotation (Placement(transformation(extent={{4,-10},{24,10}})));
      Modelica_Blocks.Interfaces.RealOutput phi(unit="rad")
        "Inertia moves with angle phi due to torque tau"
        annotation (Placement(transformation(extent={{100,70},{120,90}})));
      Modelica_Blocks.Interfaces.RealOutput w(unit="rad/s")
        "Inertia moves with speed w due to torque tau"
        annotation (Placement(transformation(extent={{100,20},{120,40}})));
      Modelica_Blocks.Interfaces.RealOutput a(unit="rad/s2")
        "Inertia moves with angular acceleration a due to torque tau"
        annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
      Modelica_Blocks.Interfaces.RealInput tau(unit="N.m")
        "Torque to drive the inertia"
        annotation (Placement(transformation(extent={{140,-100},{100,-60}})));
    equation

      connect(torque.flange, inertia.flange_a) annotation (Line(
          points={{-30,0},{-20,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torque.tau, tauDrive) annotation (Line(
          points={{-52,0},{-120,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inertia.flange_b, torqueToAngle.flange) annotation (Line(
          points={{0,0},{12,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torqueToAngle.phi, phi) annotation (Line(
          points={{17,8},{60,8},{60,80},{110,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(torqueToAngle.w, w) annotation (Line(
          points={{17,3},{66,3},{66,30},{110,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(torqueToAngle.tau, tau) annotation (Line(
          points={{18,-8},{60,-8},{60,-80},{120,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(torqueToAngle.a, a) annotation (Line(
          points={{17,-3},{66,-3},{66,-30},{110,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
                    extent={{-84,-58},{24,-90}},
                    lineColor={135,135,135},
                    fillColor={235,245,255},
                    fillPattern=FillPattern.Solid,
                    textString="to FMU"),Text(
                    extent={{8,96},{92,66}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    textString="phi",
                    horizontalAlignment=TextAlignment.Right),Text(
                    extent={{10,46},{94,16}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Right,
                    textString="w"),Text(
                    extent={{6,-10},{90,-40}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Right,
                    textString="a"),Text(
                    extent={{-150,-110},{150,-140}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    textString="J=%J"),Bitmap(extent={{-96,54},{64,-42}},
              fileName=
              "modelica://Modelica/Resources/Images/Mechanics/Rotational/DirectInertia.png"),
              Text( extent={{10,-60},{94,-90}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Right,
                    textString="tau")}));
    end DirectInertia;

    model InverseInertia "Input/output block of an inverse inertia model"
      extends Modelica_Blocks.Icons.Block;
      parameter Modelica_SIunits.Inertia J=1 "Moment of inertia";
      Modelica_Mechanics_Rotational.Components.Inertia inertia(
        J=J,
        phi(start=0, fixed=false),
        w(start=0, fixed=false))
        annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
      Modelica_Mechanics_Rotational.Components.AngleToTorqueAdaptor angleToTorque
        annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
      Modelica_Blocks.Interfaces.RealInput phi(unit="rad")
        "Angle to drive the inertia"
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica_Blocks.Interfaces.RealInput w(unit="rad/s")
        "Speed to drive the inertia"
        annotation (Placement(transformation(extent={{-140,10},{-100,50}})));
      Modelica_Blocks.Interfaces.RealInput a(unit="rad/s2")
        "Angular acceleration to drive the inertia" annotation (Placement(
            transformation(extent={{-140,-50},{-100,-10}})));
      Modelica_Blocks.Interfaces.RealOutput tau(unit="N.m")
        "Torque needed to drive the flange according to phi, w, a"
        annotation (Placement(transformation(extent={{-100,-90},{-120,-70}})));
    equation

      connect(angleToTorque.phi, phi) annotation (Line(
          points={{-30,8},{-84,8},{-84,80},{-120,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque.w, w) annotation (Line(
          points={{-30,2.8},{-90,2.8},{-90,30},{-120,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque.a, a) annotation (Line(
          points={{-30,-3.2},{-80,-3.2},{-80,-30},{-120,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque.flange, inertia.flange_a) annotation (Line(
          points={{-24,0},{-12,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(angleToTorque.tau, tau) annotation (Line(
          points={{-29,-8},{-70,-8},{-70,-80},{-110,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
                    extent={{0,-62},{96,-94}},
                    lineColor={135,135,135},
                    fillColor={235,245,255},
                    fillPattern=FillPattern.Solid,
                    textString="to FMU"),Text(
                    extent={{-94,96},{-10,66}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="phi"),Text(
                    extent={{-94,46},{-10,16}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="w"),Text(
                    extent={{-92,-14},{-8,-44}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="a"),Text(
                    extent={{-150,-110},{150,-140}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    textString="J=%J"),Bitmap(extent={{-58,48},{98,-42}},
              fileName=
              "modelica://Modelica/Resources/Images/Mechanics/Rotational/InverseInertia.png"),
              Text( extent={{-90,-64},{-6,-94}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="tau")}));
    end InverseInertia;

    model SpringDamper "Input/output block of a spring/damper model"
      extends Modelica_Blocks.Icons.Block;
      parameter Modelica_SIunits.RotationalSpringConstant c=1e4
        "Spring constant";
      parameter Modelica_SIunits.RotationalDampingConstant d=1
        "Damping constant";
      parameter Modelica_SIunits.Angle phi_rel0=0 "Unstretched spring angle";

      Modelica_Mechanics_Rotational.Components.AngleToTorqueAdaptor angleToTorque1(use_a=
            false)
        annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
      Modelica_Blocks.Interfaces.RealInput phi1(unit="rad")
        "Angle of left flange of force element"
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica_Blocks.Interfaces.RealInput w1(unit="rad/s")
        "Speed to left flange of force element"
        annotation (Placement(transformation(extent={{-140,10},{-100,50}})));
      Modelica_Blocks.Interfaces.RealOutput tau1(unit="N.m")
        "Torque generated by the force element" annotation (Placement(
            transformation(extent={{-100,-90},{-120,-70}})));
      SpringDamperNoRelativeStates
                              springDamper(
        c=c,
        d=d,
        phi_rel0=phi_rel0)
        annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
      Modelica_Blocks.Interfaces.RealInput phi2(unit="rad")
        "Angle of left flange of force element"
        annotation (Placement(transformation(extent={{140,60},{100,100}})));
      Modelica_Blocks.Interfaces.RealInput w2(unit="rad/s")
        "Speed to left flange of force element"
        annotation (Placement(transformation(extent={{140,10},{100,50}})));
      Modelica_Blocks.Interfaces.RealOutput tau2(unit="N.m")
        "Torque generated by the force element"
        annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
      Modelica_Mechanics_Rotational.Components.AngleToTorqueAdaptor angleToTorque2(use_a=
            false)
        annotation (Placement(transformation(extent={{38,-10},{18,10}})));
    equation

      connect(angleToTorque1.phi, phi1) annotation (Line(
          points={{-24,8},{-84,8},{-84,80},{-120,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque1.w, w1) annotation (Line(
          points={{-24,2.8},{-90,2.8},{-90,30},{-120,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque1.tau, tau1) annotation (Line(
          points={{-23,-8},{-70,-8},{-70,-80},{-110,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque1.flange, springDamper.flange_a) annotation (Line(
          points={{-18,0},{-6,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(springDamper.flange_b, angleToTorque2.flange) annotation (Line(
          points={{14,0},{26,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(phi2, angleToTorque2.phi) annotation (Line(
          points={{120,80},{60,80},{60,8},{32,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(w2, angleToTorque2.w) annotation (Line(
          points={{120,30},{70,30},{70,2.8},{32,2.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque2.tau, tau2) annotation (Line(
          points={{31,-8},{60,-8},{60,-80},{110,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
                    extent={{-48,-36},{48,-68}},
                    lineColor={135,135,135},
                    fillColor={235,245,255},
                    fillPattern=FillPattern.Solid,
                    textString="to FMU"),Text(
                    extent={{-94,96},{-10,66}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="phi1"),Text(
                    extent={{-150,-118},{150,-148}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    textString="c=%c
d=%d"),
     Bitmap(extent={{-72,46},{84,-44}}, fileName=
              "modelica://Modelica/Resources/Images/Mechanics/Rotational/SpringDamper.png"),
              Text( extent={{12,96},{96,66}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Right,
                    textString="phi2"),Text(
                    extent={{12,48},{96,18}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Right,
                    textString="w2"),Text(
                    extent={{10,-60},{94,-90}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Right,
                    textString="tau2"),Text(
                    extent={{-94,46},{-10,16}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="w1"),Text(
                    extent={{-90,-64},{-6,-94}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="tau1")}));
    end SpringDamper;

    model Spring "Input/output block of a spring model"
      extends Modelica_Blocks.Icons.Block;
      parameter Modelica_SIunits.RotationalSpringConstant c=1e4
        "Spring constant";
      parameter Modelica_SIunits.Angle phi_rel0=0 "Unstretched spring angle";

      Modelica_Mechanics_Rotational.Components.AngleToTorqueAdaptor angleToTorque1(use_a=
            false, use_w=false)
        annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
      Modelica_Blocks.Interfaces.RealInput phi1(unit="rad")
        "Angle of left flange of force element"
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica_Blocks.Interfaces.RealOutput tau1(unit="N.m")
        "Torque generated by the force element" annotation (Placement(
            transformation(extent={{-100,-90},{-120,-70}})));
      Modelica_Mechanics_Rotational.Components.Spring spring(c=c, phi_rel0=
            phi_rel0)
        annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
      Modelica_Blocks.Interfaces.RealInput phi2(unit="rad")
        "Angle of left flange of force element"
        annotation (Placement(transformation(extent={{140,60},{100,100}})));
      Modelica_Blocks.Interfaces.RealOutput tau2(unit="N.m")
        "Torque generated by the force element"
        annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
      Modelica_Mechanics_Rotational.Components.AngleToTorqueAdaptor angleToTorque2(use_a=
            false, use_w=false)
        annotation (Placement(transformation(extent={{38,-10},{18,10}})));
    equation

      connect(angleToTorque1.phi, phi1) annotation (Line(
          points={{-24,8},{-84,8},{-84,80},{-120,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque1.tau, tau1) annotation (Line(
          points={{-23,-8},{-70,-8},{-70,-80},{-110,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque1.flange, spring.flange_a) annotation (Line(
          points={{-18,0},{-6,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(spring.flange_b, angleToTorque2.flange) annotation (Line(
          points={{14,0},{26,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(phi2, angleToTorque2.phi) annotation (Line(
          points={{120,80},{60,80},{60,8},{32,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleToTorque2.tau, tau2) annotation (Line(
          points={{31,-8},{60,-8},{60,-80},{110,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
                    extent={{-48,-36},{48,-68}},
                    lineColor={135,135,135},
                    fillColor={235,245,255},
                    fillPattern=FillPattern.Solid,
                    textString="to FMU"),Text(
                    extent={{-94,96},{-10,66}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="phi1"),Text(
                    extent={{-150,-114},{150,-144}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    textString="c=%c"),Bitmap(extent={{-88,56},{92,-36}},
              fileName=
              "modelica://Modelica/Resources/Images/Mechanics/Rotational/Spring.png"),
              Text( extent={{12,96},{96,66}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Right,
                    textString="phi2"),Text(
                    extent={{10,-60},{94,-90}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Right,
                    textString="tau2"),Text(
                    extent={{-90,-64},{-6,-94}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={245,245,245},
                    horizontalAlignment=TextAlignment.Left,
                    textString="tau1")}));
    end Spring;

    model SpringDamperNoRelativeStates
      "Linear 1D rotational spring and damper in parallel (phi and w are not used as states)"
      parameter Modelica_SIunits.RotationalSpringConstant c(final min=0,
          start=1.0e5) "Spring constant";
      parameter Modelica_SIunits.RotationalDampingConstant d(final min=0,
          start=0) "Damping constant";
      parameter Modelica_SIunits.Angle phi_rel0=0 "Unstretched spring angle";
      Modelica_SIunits.AngularVelocity w_rel(start=0)
        "Relative angular velocity (= der(phi_rel))";
      extends Modelica_Mechanics_Rotational.Interfaces.PartialCompliant;
      extends
        Modelica_Thermal_HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
    protected
      Modelica_SIunits.Torque tau_c "Spring torque";
      Modelica_SIunits.Torque tau_d "Damping torque";
    equation
      w_rel = der(phi_rel);
      tau_c = c*(phi_rel - phi_rel0);
      tau_d = d*w_rel;
      tau = tau_c + tau_d;
      lossPower = tau_d*w_rel;
      annotation (
        Documentation(info="<html>
<p>
A <b>spring</b> and <b>damper</b> element <b>connected in parallel</b>.
The component can be
connected either between two inertias/gears to describe the shaft elasticity
and damping, or between an inertia/gear and the housing (component Fixed),
to describe a coupling of the element with the housing via a spring/damper.
</p>

<p>
This is the same element as <a href=\"modelica://Modelica.Mechanics.Rotational.Components.SpringDamper\">Rotational.Components.SpringDamper</a>
but with the only difference, that the relative quantities are not used as states. If the relative
states are potentially used as states, \"a_rel = der(w_rel)\" is present, and then exporting this model
as FMU requires to also have the accelerations in the flanges as inputs, which is usually not
desired for a force element.
</p>
</html>"),
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}),
            graphics={
        Line(points={{-80,40},{-60,40},{-45,10},{-15,70},{15,10},{45,70},{60,40},{80,40}},
          color={0,0,0}),
        Line(points={{-80,40},{-80,-40}},
          color={0,0,0}),
        Line(points={{-80,-40},{-50,-40}},
          color={0,0,0}),
        Rectangle(extent={{-50,-10},{40,-70}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-50,-10},{70,-10}},
          color={0,0,0}),
        Line(points={{-50,-70},{70,-70}},
          color={0,0,0}),
        Line(points={{40,-40},{80,-40}},
          color={0,0,0}),
        Line(points={{80,40},{80,-40}},
          color={0,0,0}),
        Line(points={{-90,0},{-80,0}},
          color={0,0,0}),
        Line(points={{80,0},{90,0}},
          color={0,0,0}),
        Text(origin={0,-9},
          extent={{-150,-144},{150,-104}},
          lineColor={0,0,0},
          textString="d=%d"),
        Text(extent={{-190,110},{190,70}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          origin={0,-7},
          extent={{-150,-108},{150,-68}},
          lineColor={0,0,0},
          textString="c=%c"),
        Line(visible=useHeatPort,
          points={{-100,-100},{-100,-55},{-5,-55}},
          color={191,0,0},
          pattern=LinePattern.Dot,
          smooth=Smooth.None)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(
              points={{-80,32},{-58,32},{-43,2},{-13,62},{17,2},{47,62},{62,32},
                  {80,32}},
              color={0,0,0},
              thickness=0.5),
            Line(points={{-68,32},{-68,97}}, color={128,128,128}),
            Line(points={{72,32},{72,97}}, color={128,128,128}),
            Line(points={{-68,92},{72,92}}, color={128,128,128}),
            Polygon(
              points={{62,95},{72,92},{62,89},{62,95}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-44,79},{29,91}},
              lineColor={0,0,255},
              textString="phi_rel"),
            Rectangle(
              extent={{-50,-20},{40,-80}},
              lineColor={0,0,0},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-50,-80},{68,-80}}, color={0,0,0}),
            Line(points={{-50,-20},{68,-20}}, color={0,0,0}),
            Line(points={{40,-50},{80,-50}}, color={0,0,0}),
            Line(points={{-80,-50},{-50,-50}}, color={0,0,0}),
            Line(points={{-80,32},{-80,-50}}, color={0,0,0}),
            Line(points={{80,32},{80,-50}}, color={0,0,0}),
            Line(points={{-96,0},{-80,0}}, color={0,0,0}),
            Line(points={{96,0},{80,0}}, color={0,0,0})}));
    end SpringDamperNoRelativeStates;
  end Utilities;
  annotation (Documentation(info="<html>
<p>
This package contains example models to demonstrate the usage of the
Modelica.Mechanics.Rotational package. Open the models and
simulate them according to the provided description in the models.
</p>

</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Mechanics_Rotational_Examples;
