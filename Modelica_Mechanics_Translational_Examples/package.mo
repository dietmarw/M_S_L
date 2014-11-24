within ;
encapsulated package Modelica_Mechanics_Translational_Examples
  "Demonstration examples of the components of this package"
  import Modelica_Icons;
  import Modelica_Mechanics_Translational;
  import Modelica_Blocks;
  import Modelica_SIunits;
  import Modelica_Thermal_HeatTransfer;

  extends Modelica_Icons.ExamplesPackage;

  model SignConvention "Examples for the used sign conventions."
    extends Modelica_Icons.Example;
    Modelica_Mechanics_Translational.Components.Mass mass1(
      L=1,
      s(fixed=true),
      v(fixed=true),
      m=1) annotation (Placement(transformation(extent={{40,60},{60,80}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sources.Force force1 annotation (Placement(
          transformation(extent={{-4,60},{16,80}}, rotation=0)));
    Modelica_Blocks.Sources.Constant constant1(k=1) annotation (Placement(
          transformation(extent={{-44,60},{-24,80}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass2(
      L=1,
      s(fixed=true),
      v(fixed=true),
      m=1) annotation (Placement(transformation(extent={{40,0},{60,20}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sources.Force force2 annotation (Placement(
          transformation(extent={{-4,20},{16,40}}, rotation=0)));
    Modelica_Blocks.Sources.Constant constant2(k=1)
                               annotation (Placement(transformation(extent={{
              -44,20},{-24,40}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass3(
      L=1,
      s(fixed=true),
      v(fixed=true),
      m=1) annotation (Placement(transformation(extent={{-40,-40},{-20,-20}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sources.Force force3(useSupport=true)
      annotation (Placement(transformation(extent={{20,-40},{0,-20}}, rotation=
              0)));
    Modelica_Blocks.Sources.Constant constant3(k=1)
                               annotation (Placement(transformation(extent={{
              60,-40},{40,-20}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed
      annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  equation
    connect(constant1.y,force1. f) annotation (Line(points={{-23,70},{-6,70}},
          color={0,0,127}));
    connect(constant2.y,force2. f) annotation (Line(points={{-23,30},{-6,30}},
          color={0,0,127}));
    connect(constant3.y,force3. f) annotation (Line(points={{39,-30},{22,-30}},
          color={0,0,127}));
    connect(force1.flange, mass1.flange_a)    annotation (Line(
        points={{16,70},{40,70}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(force2.flange, mass2.flange_b)    annotation (Line(
        points={{16,30},{70,30},{70,10},{60,10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass3.flange_b, force3.flange)    annotation (Line(
        points={{-20,-30},{0,-30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(fixed.flange, force3.support) annotation (Line(
        points={{10,-50},{10,-40}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>
If all arrows point in the same direction a positive force
results in a positive acceleration a, velocity v and position s.
</p>
<p>
For a force of 1 N and a mass of 1 Kg this leads to
</p>
<pre>
        a = 1 m/s2
        v = 1 m/s after 1 s (SlidingMass1.v)
        s = 0.5 m after 1 s (SlidingMass1.s)
</pre>
<p>
The acceleration is not available for plotting.
</p>
<p>
System 1) and 2) are equivalent. It doesn't matter whether the
force pushes at flange_a in system 1 or pulls at flange_b in system 2.
</p><p>
It is of course possible to ignore the arrows and connect the models
in an arbitrary way. But then it is hard see in what direction the
force acts.
</p><p>
In the third system the two arrows are opposed which means that the
force acts in the opposite direction (in the same direction as in
the two other examples).
</p>
</html>"),
         Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}), graphics={
          Text(
            extent={{-100,80},{-82,60}},
            textString="1)",
            lineColor={0,0,255}),
          Text(
            extent={{-100,40},{-82,20}},
            textString="2)",
            lineColor={0,0,255}),
          Text(
            extent={{-100,-20},{-82,-40}},
            textString="3)",
            lineColor={0,0,255})}),
      experiment(StopTime=1.0, Interval=0.001));
  end SignConvention;

  model InitialConditions "Setting of initial conditions"

    extends Modelica_Icons.Example;

    Modelica_Mechanics_Translational.Components.Fixed fixed2(s0=1) annotation (
        Placement(transformation(extent={{-100,60},{-80,80}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Spring s2(s_rel0=2, c=1e3)
      annotation (Placement(transformation(extent={{-60,60},{-40,80}}, rotation=
             0)));
    Modelica_Mechanics_Translational.Components.Mass m3(
      L=3,
      s(start=4.5, fixed=true),
      v(fixed=true),
      m=1) annotation (Placement(transformation(extent={{-20,60},{0,80}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.SpringDamper sd2(
      s_rel0=4,
      c=111,
      d=1) annotation (Placement(transformation(extent={{20,60},{40,80}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass m4(
      L=5,
      s(start=12.5, fixed=true),
      v(fixed=true),
      m=1) annotation (Placement(transformation(extent={{60,60},{80,80}},
            rotation=0)));

    Modelica_Mechanics_Translational.Components.Fixed fixed1(s0=-1) annotation (
       Placement(transformation(extent={{-100,-20},{-80,0}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Spring s1(
      s_rel0=1,
      c=1e3,
      s_rel(start=1, fixed=true)) annotation (Placement(transformation(extent={
              {-58,-20},{-38,0}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass m1(
      L=1,
      v(fixed=true),
      m=1) annotation (Placement(transformation(extent={{-20,-20},{0,0}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.SpringDamper sd1(
      s_rel0=1,
      c=111,
      s_rel(start=1, fixed=true),
      v_rel(fixed=true),
      d=1) annotation (Placement(transformation(extent={{20,-20},{40,0}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass m2(L=2, m=1) annotation (
        Placement(transformation(extent={{60,-20},{80,0}}, rotation=0)));
  equation
    connect(s2.flange_a, fixed2.flange) annotation (Line(
        points={{-60,70},{-90,70}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(s1.flange_a, fixed1.flange) annotation (Line(
        points={{-58,-10},{-90,-10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(m1.flange_a, s1.flange_b) annotation (Line(
        points={{-20,-10},{-38,-10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(sd1.flange_a, m1.flange_b) annotation (Line(
        points={{20,-10},{0,-10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(m2.flange_a, sd1.flange_b) annotation (Line(
        points={{60,-10},{40,-10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(m4.flange_a, sd2.flange_b) annotation (Line(
        points={{60,70},{40,70}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(sd2.flange_a, m3.flange_b) annotation (Line(
        points={{20,70},{0,70}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(m3.flange_a, s2.flange_b) annotation (Line(
        points={{-20,70},{-40,70}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
There are several ways to set initial conditions.
In the first system the position of the mass m3 was defined
by using the modifier s(start=4.5), the position of m4 by s(start=12.5).
These positions were chosen such that the system is a rest. To calculate
these values start at the left (Fixed1) with a value of 1 m. The spring
has an unstretched length of 2 m and m3 an length of 3 m, which leads to
</p>

<pre>
        1   m (fixed1)
      + 2   m (spring s2)
      + 3/2 m (half of the length of mass m3)
      -------
        4,5 m = s(start = 4.5) for m3
      + 3/2 m (half of the length of mass m3)
      + 4   m (springDamper 2)
      + 5/2 m (half of length of mass m4)
      -------
       12,5 m = s(start = 12.5) for m4
</pre>

<p>
This selection of initial conditions has the effect that Dymola selects
those variables (m3.s and m4.s) as state variables.
In the second example the length of the springs are given as start values
but they cannot be used as state for pure springs (only for the spring/damper
combination). In this case the system is not at rest.
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/Translational/InitialConditions.png\">
</p>

</html>"),
      experiment(StopTime=5.0, Interval=0.001));
  end InitialConditions;

  model WhyArrows "Use of arrows in Mechanics.Translational"
    import Modelica_Mechanics_Translational;

    extends Modelica_Icons.Example;

    Modelica_Mechanics_Translational.Components.Fixed fixed annotation (
        Placement(transformation(extent={{-20,20},{0,40}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Rod rod1(L=1) annotation (
        Placement(transformation(extent={{-48,20},{-28,40}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Rod rod2(L=1) annotation (
        Placement(transformation(extent={{20,20},{40,40}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Rod rod3(L=1) annotation (
        Placement(transformation(extent={{-30,58},{-50,78}}, rotation=0)));
    Modelica_Mechanics_Translational.Sensors.PositionSensor positionSensor2
      annotation (Placement(transformation(extent={{60,20},{80,40}}, rotation=
             0)));
    Modelica_Mechanics_Translational.Sensors.PositionSensor positionSensor1
      annotation (Placement(transformation(extent={{-60,20},{-80,40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sensors.PositionSensor positionSensor3
      annotation (Placement(transformation(extent={{-60,58},{-80,78}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed1(s0=-1.9)
      annotation (Placement(transformation(extent={{-100,-60},{-80,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Spring spring1(s_rel0=2, c=11)
      annotation (Placement(transformation(extent={{-80,-60},{-60,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass1(
      L=2,
      s(fixed=true),
      v(fixed=true),
      m=1) annotation (Placement(transformation(extent={{-50,-60},{-30,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed2(s0=-1.9)
      annotation (Placement(transformation(extent={{0,-60},{20,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Spring spring2(s_rel0=2, c=11)
      annotation (Placement(transformation(extent={{30,-60},{50,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass inertia2(
      L=2,
      m=1,
      s(fixed=true),
      v(fixed=true)) annotation (Placement(transformation(extent={{80,-60},{
              60,-40}}, rotation=0)));
  equation
    connect(spring1.flange_b, mass1.flange_b)        annotation (Line(points={{-60,-50},
            {-60,-72},{-30,-72},{-30,-50}},            color={0,191,0}));
    connect(spring2.flange_b, inertia2.flange_b)     annotation (Line(points={{50,-50},
            {60,-50}},           color={0,191,0}));
    connect(rod3.flange_b,positionSensor3. flange) annotation (Line(
        points={{-50,68},{-60,68}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(rod1.flange_a,positionSensor1. flange) annotation (Line(
        points={{-48,30},{-60,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(rod1.flange_b, fixed.flange)  annotation (Line(
        points={{-28,30},{-10,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(rod3.flange_a, fixed.flange)  annotation (Line(
        points={{-30,68},{-10,68},{-10,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(fixed.flange, rod2.flange_a)  annotation (Line(
        points={{-10,30},{20,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(rod2.flange_b,positionSensor2. flange) annotation (Line(
        points={{40,30},{60,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(fixed1.flange,spring1. flange_a) annotation (Line(
        points={{-90,-50},{-80,-50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(fixed2.flange,spring2. flange_a) annotation (Line(
        points={{10,-50},{30,-50}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
When using the models of the translational sublibrary
it is recommended to make sure that all arrows point in
the same direction because then all component have the
same reference system.
In the example the distance from flange_a of Rod1 to flange_b
of Rod2 is 2 m. The distance from flange_a of Rod1 to flange_b
of Rod3 is also 2 m though it is difficult to see that. Without
the arrows it would be almost impossible to notice.
That all arrows point in the same direction is a sufficient
condition for an easy use of the library. There are cases
where horizontally flipped models can be used without
problems.
</p>
</html>"),   Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Text(
            extent={{-84,10},{88,2}},
            lineColor={0,0,255},
            textString="positionSensor2.s = positionSensor3.s"),
          Text(
            extent={{-78,-4},{86,-12}},
            lineColor={0,0,255},
            textString="positionSensor3.s <>positionSensor1.s"),
          Text(
            extent={{-82,-80},{92,-88}},
            textString="Both systems are equivalent",
            lineColor={0,0,255}),
          Line(
            points={{-90,-28},{90,-28}},
            thickness=0.5,
            color={0,0,255})}),
      experiment(StopTime=1.0, Interval=0.001));
  end WhyArrows;

  model Accelerate "Use of model accelerate."

    extends Modelica_Icons.Example;
    Modelica_Mechanics_Translational.Sources.Accelerate accelerate annotation (
        Placement(transformation(extent={{-40,20},{-20,40}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass(L=1, m=1) annotation (
       Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
    Modelica_Blocks.Sources.Constant constantAcc(k=1)
                                               annotation (Placement(transformation(extent={{-80,20},
              {-60,40}},          rotation=0)));
  equation
    connect(accelerate.flange, mass.flange_a)    annotation (Line(
        points={{-20,30},{0,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(constantAcc.y, accelerate.a_ref) annotation (Line(
        points={{-59,30},{-42,30}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>
Demonstrate usage of component Sources.Accelerate by moving a massing
with a predefined acceleration.
</p>
</html>"),      experiment(StopTime=1.0, Interval=0.001));
  end Accelerate;

  model Damper "Use of damper models."

    extends Modelica_Icons.Example;

    Modelica_Mechanics_Translational.Components.Mass mass1(
      L=1,
      s(start=3, fixed=true),
      v(start=10, fixed=true),
      m=1) annotation (Placement(transformation(extent={{-80,60},{-60,80}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Damper damper1(d=25)
      annotation (Placement(transformation(extent={{-20,60},{0,80}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed1(s0=4.5)
      annotation (Placement(transformation(extent={{22,60},{42,80}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass2(
      L=1,
      s(start=3, fixed=true),
      v(start=10, fixed=true),
      m=1) annotation (Placement(transformation(extent={{-80,0},{-60,20}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Damper damper2(d=25)
      annotation (Placement(transformation(extent={{-20,0},{0,20}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed2(s0=4.5)
      annotation (Placement(transformation(extent={{20,0},{40,20}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass3(
      L=1,
      s(start=3, fixed=true),
      v(start=10, fixed=true),
      m=1) annotation (Placement(transformation(extent={{-80,-60},{-60,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed3(s0=4.5)
      annotation (Placement(transformation(extent={{20,-60},{40,-40}}, rotation=
             0)));
    Modelica_Mechanics_Translational.Components.Spring spring2(s_rel0=1, c=1)
      annotation (Placement(transformation(extent={{-20,-20},{0,0}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.SpringDamper springDamper3(
      s_rel0=1,
      d=25,
      c=1) annotation (Placement(transformation(extent={{-20,-60},{0,-40}},
            rotation=0)));
  equation
    connect(mass1.flange_b, damper1.flange_a)        annotation (Line(points=
            {{-60,70},{-20,70}}, color={0,191,0}));
    connect(mass2.flange_b, damper2.flange_a)        annotation (Line(points={{-60,10},
            {-20,10}},           color={0,191,0}));
    connect(damper2.flange_b,spring2. flange_b) annotation (Line(points={{0,
            10},{0,-10}}, color={0,191,0}));
    connect(damper2.flange_a,spring2. flange_a) annotation (Line(points={{-20,
            10},{-20,-10}}, color={0,191,0}));
    connect(mass3.flange_b, springDamper3.flange_a)        annotation (Line(
          points={{-60,-50},{-20,-50}}, color={0,191,0}));
    connect(damper1.flange_b, fixed1.flange) annotation (Line(
        points={{0,70},{32,70}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(damper2.flange_b, fixed2.flange) annotation (Line(
        points={{0,10},{30,10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(springDamper3.flange_b, fixed3.flange) annotation (Line(
        points={{0,-50},{30,-50}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>
Demonstrate usage of damper components in different variants.
</p>
</html>"),
      experiment(StopTime=1.0, Interval=0.001));
  end Damper;

  model Oscillator "Oscillator demonstrates the use of initial conditions."

    extends Modelica_Icons.Example;

    Modelica_Mechanics_Translational.Components.Mass mass1(
      L=1,
      s(start=-0.5, fixed=true),
      v(start=0, fixed=true),
      m=1) annotation (Placement(transformation(extent={{-20,40},{0,60}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Spring spring1(s_rel0=1, c=
          10000) annotation (Placement(transformation(extent={{20,40},{40,60}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed1(s0=1) annotation (
        Placement(transformation(extent={{60,40},{80,60}}, rotation=0)));
    Modelica_Mechanics_Translational.Sources.Force force1 annotation (Placement(
          transformation(extent={{-60,40},{-40,60}}, rotation=0)));
    Modelica_Blocks.Sources.Sine sine1(freqHz=15.9155) annotation (Placement(transformation(
            extent={{-100,40},{-80,60}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass2(
      L=1,
      s(start=-0.5, fixed=true),
      v(start=0, fixed=true),
      m=1) annotation (Placement(transformation(extent={{-20,-60},{0,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Spring spring2(s_rel0=1, c=
          10000) annotation (Placement(transformation(extent={{20,-60},{40,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed2(s0=1) annotation (
        Placement(transformation(extent={{60,-60},{80,-40}}, rotation=0)));
    Modelica_Mechanics_Translational.Sources.Force force2 annotation (Placement(
          transformation(extent={{-60,-60},{-40,-40}}, rotation=0)));
    Modelica_Blocks.Sources.Sine sine2(freqHz=15.9155) annotation (Placement(transformation(
            extent={{-100,-60},{-80,-40}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Damper damper1(d=10)
      annotation (Placement(transformation(extent={{20,-36},{40,-16}}, rotation=
             0)));
  equation
    connect(mass1.flange_b, spring1.flange_a)        annotation (Line(points=
            {{0,50},{20,50}}, color={0,191,0}));
    connect(spring2.flange_a,damper1. flange_a) annotation (Line(points={{20,
            -50},{20,-26}}, color={0,191,0}));
    connect(mass2.flange_b, spring2.flange_a)        annotation (Line(points=
            {{0,-50},{20,-50}}, color={0,191,0}));
    connect(damper1.flange_b,spring2. flange_b) annotation (Line(points={{40,
            -26},{40,-50}}, color={0,191,0}));
    connect(sine1.y,force1. f) annotation (Line(points={{-79,50},{-62,50}},
          color={0,0,127}));
    connect(sine2.y,force2. f) annotation (Line(points={{-79,-50},{-62,-50}},
          color={0,0,127}));
    connect(spring1.flange_b, fixed1.flange) annotation (Line(
        points={{40,50},{70,50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(force2.flange, mass2.flange_a)    annotation (Line(
        points={{-40,-50},{-20,-50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(force1.flange, mass1.flange_a)    annotation (Line(
        points={{-40,50},{-20,50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(spring2.flange_b, fixed2.flange) annotation (Line(
        points={{40,-50},{70,-50}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
A spring - mass system is a mechanical oscillator. If no
damping is included and the system is excited at resonance
frequency infinite amplitudes will result.
The resonant frequency is given by
omega_res = sqrt(c / m)
with:
</p>

<pre>
      c spring stiffness
      m mass
</pre>

<p>
To make sure that the system is initially at rest the initial
conditions s(start=0) and v(start=0) for the SlidingMass
are set.
If damping is added the amplitudes are bounded.
</p>
</html>"),
      experiment(StopTime=1.0, Interval=0.001));
  end Oscillator;

  model Sensors "Sensors for translational systems."
    extends Modelica_Icons.Example;
    Modelica_Mechanics_Translational.Sensors.ForceSensor forceSensor
      annotation (Placement(transformation(extent={{-34,40},{-14,60}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sensors.SpeedSensor speedSensor1
      annotation (Placement(transformation(extent={{40,-40},{60,-20}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sensors.PositionSensor positionSensor1
      annotation (Placement(transformation(extent={{40,0},{60,20}}, rotation=
              0)));
    Modelica_Mechanics_Translational.Sensors.AccSensor accSensor1 annotation (
       Placement(transformation(extent={{40,-80},{60,-60}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass(
      L=1,
      s(fixed=true),
      v(fixed=true),
      m=1) annotation (Placement(transformation(extent={{20,40},{40,60}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sources.Force force annotation (
        Placement(transformation(extent={{-64,40},{-44,60}}, rotation=0)));
    Modelica_Blocks.Sources.Sine sineForce(amplitude=10, freqHz=4)
                                                               annotation (Placement(
          transformation(extent={{-100,40},{-80,60}}, rotation=0)));
    Modelica_Mechanics_Translational.Sensors.PositionSensor positionSensor2
      annotation (Placement(transformation(extent={{60,40},{80,60}}, rotation=
             0)));
    Modelica_Mechanics_Translational.Sensors.MultiSensor multiSensor
      annotation (Placement(transformation(extent={{-8,40},{12,60}})));
  equation
    connect(sineForce.y, force.f)
                               annotation (Line(points={{-79,50},{-66,50}},
          color={0,0,127}));
    connect(forceSensor.flange_a, force.flange)   annotation (Line(
        points={{-34,50},{-44,50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass.flange_a, positionSensor1.flange)         annotation (Line(
        points={{20,50},{20,10},{40,10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass.flange_a, speedSensor1.flange)         annotation (Line(
        points={{20,50},{20,-30},{40,-30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass.flange_a, accSensor1.flange)         annotation (Line(
        points={{20,50},{20,-70},{40,-70}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass.flange_b, positionSensor2.flange)         annotation (Line(
        points={{40,50},{60,50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(forceSensor.flange_b, multiSensor.flange_a) annotation (Line(
        points={{-14,50},{-8,50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(multiSensor.flange_b, mass.flange_a) annotation (Line(
        points={{12,50},{20,50}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
These sensors measure
</p>

<pre>
   force f in N
   position s in m
   velocity v in m/s
   acceleration a in m/s2
</pre>

<p>
The measured velocity and acceleration is independent on
the flange the sensor is connected to. The position
depends on the flange (flange_a or flange_b) and the
length L of the component.
Plot PositionSensor1.s, PositionSensor2.s and SlidingMass1.s
to see the difference.
</p>
</html>"),
      experiment(StopTime=1.0, Interval=0.001));
  end Sensors;

  model Friction "Use of model Stop"
    extends Modelica_Icons.Example;
    Modelica_Mechanics_Translational.Components.MassWithStopAndFriction stop1(
      L=1,
      s(fixed=true),
      v(fixed=true),
      smax=25,
      smin=-25,
      m=1,
      F_prop=1,
      F_Coulomb=5,
      F_Stribeck=10,
      fexp=2) annotation (Placement(transformation(extent={{20,60},{40,80}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sources.Force force annotation (Placement(
          transformation(extent={{-20,60},{0,80}}, rotation=0)));
    Modelica_Blocks.Sources.Sine sineForce(amplitude=25, freqHz=0.25)
                                                                  annotation (Placement(
          transformation(extent={{-60,60},{-40,80}},
                                                   rotation=0)));
    Modelica_Mechanics_Translational.Components.MassWithStopAndFriction stop2(
      L=1,
      smax=0.9,
      smin=-0.9,
      F_Coulomb=3,
      F_Stribeck=5,
      s(start=0, fixed=true),
      m=1,
      F_prop=1,
      fexp=2,
      v(start=-5, fixed=true)) annotation (Placement(transformation(extent={{
              42,-60},{62,-40}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Spring spring(s_rel0=1, c=500)
      annotation (Placement(transformation(extent={{2,-60},{22,-40}}, rotation=
              0)));
    Modelica_Mechanics_Translational.Components.Fixed fixed2(s0=-1.75)
      annotation (Placement(transformation(extent={{-40,-60},{-20,-40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Sources.Force force2 annotation (Placement(
          transformation(extent={{-22,0},{-2,20}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass mass(
      m=1,
      L=1,
      s(fixed=true),
      v(fixed=true))
      annotation (Placement(transformation(extent={{10,0},{30,20}})));
    Modelica_Mechanics_Translational.Components.SupportFriction supportFriction(f_pos=
          Utilities.GenerateStribeckFrictionTable(
            F_prop=1,
            F_Coulomb=5,
            F_Stribeck=10,
            fexp=2,
            v_max=12,
            nTable=50))
      annotation (Placement(transformation(extent={{40,0},{60,20}})));
  equation
    connect(spring.flange_b, stop2.flange_a)  annotation (Line(points={{22,-50},
            {42,-50}},color={0,191,0}));
    connect(sineForce.y, force.f)
      annotation (Line(points={{-39,70},{-22,70}},
                                                color={0,0,127}));
    connect(spring.flange_a, fixed2.flange) annotation (Line(
        points={{2,-50},{-30,-50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(force.flange, stop1.flange_a) annotation (Line(
        points={{0,70},{20,70}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(force2.flange, mass.flange_a) annotation (Line(
        points={{-2,10},{10,10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass.flange_b, supportFriction.flange_a) annotation (Line(
        points={{30,10},{40,10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(sineForce.y, force2.f) annotation (Line(
        points={{-39,70},{-30,70},{-30,10},{-24,10}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Text(
            extent={{-100,80},{-80,60}},
            textString="1)",
            lineColor={0,0,255}),
          Text(
            extent={{-100,20},{-80,0}},
            textString="2)",
            lineColor={0,0,255}),
          Text(
            extent={{-100,-40},{-80,-60}},
            lineColor={0,0,255},
            textString="3)")}),
      Documentation(info="<html>
<ol>
<li> Simulate and then plot stop1.f as a function of stop1.v
     This gives the Stribeck curve.</li>
<li> The same model is also available by modeling the system with a Mass and
     a SupportFriction model. The SupportFriction model defines the friction characteristic
     with a table. The table is constructed with function
     Examples.Utilities.GenerateStribeckFrictionTable(..) to generate the
     same friction characteristic as with stop1.
     The simulation results of stop1 and of model mass are therefore identical.</li>
<li> Model stop2 gives an example for a hard stop. However there
     can arise some problems with the used modeling approach (use of
     <b>reinit</b>(..), convergence problems). In this case use the ElastoGap
     to model a stop (see example Preload).</li>
</ol>
</html>"),
      experiment(StopTime=5.0, Interval=0.001));
  end Friction;

  model PreLoad "Preload of a spool using ElastoGap models."

    extends Modelica_Icons.Example;

    Modelica_Mechanics_Translational.Components.ElastoGap innerContactA(
      c=1000e3,
      d=250,
      s_rel0=0.001) annotation (Placement(transformation(extent={{-70,20},{-50,
              40}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.ElastoGap innerContactB(
      c=1000e3,
      d=250,
      s_rel0=0.001) annotation (Placement(transformation(extent={{50,20},{70,40}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass spool(
      L=0.19,
      m=0.150,
      s(start=0.01475, fixed=true),
      v(fixed=true)) annotation (Placement(transformation(extent={{0,-40},{40,0}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.Fixed fixedLe(s0=-0.0955)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-80,90})));
    Modelica_Mechanics_Translational.Components.Mass springPlateA(
      m=10e-3,
      L=0.002,
      s(start=-0.093, fixed=true),
      v(fixed=true)) annotation (Placement(transformation(extent={{-38,60},{-18,
              80}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Mass springPlateB(
      m=10e-3,
      s(start=-0.06925, fixed=true),
      L=0.002,
      v(fixed=true)) annotation (Placement(transformation(extent={{20,60},{40,
              80}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Spring spring(c=20e3, s_rel0=
          0.025) annotation (Placement(transformation(extent={{-10,60},{10,80}},
            rotation=0)));
    Modelica_Mechanics_Translational.Components.ElastoGap outerContactA(
      c=1000e3,
      d=250,
      s_rel0=0.0015) annotation (Placement(transformation(extent={{-70,60},{-50,
              80}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.ElastoGap outerContactB(
      c=1000e3,
      d=250,
      s_rel0=0.0015) annotation (Placement(transformation(extent={{50,60},{70,
              80}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Rod rod1(L=0.007) annotation (
        Placement(transformation(extent={{-40,30},{-20,50}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Damper friction(d=2500)
      annotation (Placement(transformation(
          origin={-80,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Mechanics_Translational.Sources.Force force annotation (Placement(
          transformation(extent={{-38,-30},{-18,-10}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Rod housing(L=0.0305)
      annotation (Placement(transformation(extent={{-10,80},{10,100}}, rotation=
             0)));
    Modelica_Mechanics_Translational.Components.Rod rod3(L=0.00575) annotation (
       Placement(transformation(extent={{-40,-2},{-20,18}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Rod rod4(L=0.00575) annotation (
       Placement(transformation(extent={{20,-2},{40,18}}, rotation=0)));
    Modelica_Mechanics_Translational.Components.Rod rod2(L=0.007) annotation (
        Placement(transformation(extent={{20,30},{40,50}}, rotation=0)));
    Modelica_Blocks.Sources.Sine sineForce(amplitude=150, freqHz=0.01)
      annotation (Placement(transformation(extent={{-78,-30},{-58,-10}},
            rotation=0)));
  equation
    connect(outerContactA.flange_b,springPlateA. flange_a) annotation (Line(
          points={{-50,70},{-38,70}}, color={0,191,0}));
    connect(springPlateA.flange_b,spring. flange_a) annotation (Line(points={{-18,70},
            {-18,70},{-10,70}},color={0,191,0}));
    connect(spring.flange_b,springPlateB. flange_a) annotation (Line(points={{10,70},
            {20,70}},         color={0,191,0}));
    connect(springPlateB.flange_b,outerContactB. flange_a) annotation (Line(
          points={{40,70},{40,70},{50,70}},
                                    color={0,191,0}));
    connect(outerContactB.flange_b,housing. flange_b) annotation (Line(points={{70,70},
            {70,90},{10,90}},         color={0,191,0}));
    connect(springPlateA.flange_b,rod1. flange_a) annotation (Line(points={{-18,70},
            {-18,52},{-40,52},{-40,40}},         color={0,191,0}));
    connect(innerContactA.flange_a,rod3. flange_a) annotation (Line(points={{-70,30},
            {-80,30},{-80,8},{-40,8}},         color={0,191,0}));
    connect(innerContactA.flange_b,rod1. flange_b) annotation (Line(points={{-50,30},
            {-20,30},{-20,40}},                  color={0,191,0}));
    connect(rod2.flange_a,innerContactB. flange_a) annotation (Line(points={{20,40},
            {20,30},{50,30}},        color={0,191,0}));
    connect(rod4.flange_b,innerContactB. flange_b) annotation (Line(points={{40,8},{
            70,8},{70,30}},                color={0,191,0}));
    connect(friction.flange_b,rod3. flange_a) annotation (Line(points={{-80,40},
            {-80,8},{-40,8}},     color={0,191,0}));
    connect(rod3.flange_b,rod4. flange_a) annotation (Line(points={{-20,8},{
            20,8}}, color={0,191,0}));
    connect(rod2.flange_b,springPlateB. flange_a) annotation (Line(points={{40,40},
            {40,52},{20,52},{20,70}},        color={0,191,0}));
    connect(spool.flange_a,rod4. flange_a) annotation (Line(points={{0,-20},{
            0,8},{20,8}}, color={0,191,0}));
    connect(sineForce.y, force.f)
                               annotation (Line(points={{-57,-20},{-46,-20},{
            -40,-20}},
          color={0,0,127}));
    connect(force.flange, spool.flange_a) annotation (Line(
        points={{-18,-20},{0,-20}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(outerContactA.flange_a, fixedLe.flange) annotation (Line(
        points={{-70,70},{-80,70},{-80,90}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(housing.flange_a, fixedLe.flange) annotation (Line(
        points={{-10,90},{-80,90}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(friction.flange_a, fixedLe.flange) annotation (Line(
        points={{-80,60},{-80,90}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Text(
            extent={{-92,-72},{90,-80}},
            textString="positive force => spool moves in positive direction ",
            lineColor={0,0,255}),
          Text(
            extent={{-48,-52},{42,-60}},
            textString="Simulate for 100 s",
            lineColor={0,0,255}),
          Text(
            extent={{-100,-62},{88,-70}},
            lineColor={0,0,255},
            textString="plot spool.s as a function of force.f")}),
      Documentation(info="<html>
<p>
When designing hydraulic valves it is often necessary to hold the spool in
a certain position as long as an external force is below a threshold value.
If this force exceeds the threshold value a linear relation between force
and position is desired.
There are designs that need only one spring to accomplish this task. Using
the ElastoGap elements this design can be modelled easily.
Drawing of spool.
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/Translational/PreLoad.png\"><br>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/Translational/PreLoad3.png\"><br>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/Translational/PreLoad4.png\"><br>
</p>

<p>
Spool position s as a function of working force f.
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/Translational/PreLoad2.png\">
</p>
</html>"),
      experiment(StopTime=100, Interval=0.1));
  end PreLoad;

  model ElastoGap "Demonstrate usage of ElastoGap"
  extends Modelica_Icons.Example;
    Modelica_Mechanics_Translational.Components.Fixed fixed
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica_Mechanics_Translational.Components.Rod rod1(L=2)
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    Modelica_Mechanics_Translational.Components.Rod rod2(L=2)
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica_Mechanics_Translational.Components.SpringDamper springDamper1(
      c=10,
      s_rel0=1,
      s_rel(fixed=false, start=1),
      d=1.5) annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    Modelica_Mechanics_Translational.Components.SpringDamper springDamper2(
      c=10,
      s_rel0=1,
      s_rel(fixed=false, start=1),
      d=1.5) annotation (Placement(transformation(extent={{20,20},{40,40}})));
    Modelica_Mechanics_Translational.Components.Mass mass1(
      s(fixed=true, start=2),
      L=0,
      m=1,
      v(fixed=true))
      annotation (Placement(transformation(extent={{-10,20},{10,40}})));
    Modelica_Mechanics_Translational.Components.ElastoGap elastoGap1(
      c=10,
      s_rel(fixed=false, start=1.5),
      s_rel0=1.5,
      d=1.5)
      annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
    Modelica_Mechanics_Translational.Components.ElastoGap elastoGap2(
      c=10,
      s_rel(fixed=false, start=1.5),
      s_rel0=1.5,
      d=1.5) annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
    Modelica_Mechanics_Translational.Components.Mass mass2(
      s(fixed=true, start=2),
      L=0,
      m=1,
      v(fixed=true))
      annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
    parameter Modelica_SIunits.TranslationalDampingConstant d=1.5
      "Damping constant";
  equation

    connect(rod1.flange_b, fixed.flange) annotation (Line(
        points={{-20,0},{0,0}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(fixed.flange, rod2.flange_a) annotation (Line(
        points={{0,0},{20,0}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(springDamper1.flange_a, rod1.flange_a) annotation (Line(
        points={{-40,30},{-48,30},{-48,0},{-40,0}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(springDamper2.flange_b, rod2.flange_b) annotation (Line(
        points={{40,30},{50,30},{50,0},{40,0}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(springDamper1.flange_b, mass1.flange_a) annotation (Line(
        points={{-20,30},{-10,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass1.flange_b, springDamper2.flange_a) annotation (Line(
        points={{10,30},{20,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(rod1.flange_a, elastoGap1.flange_a) annotation (Line(
        points={{-40,0},{-48,0},{-48,-30},{-40,-30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(rod2.flange_b, elastoGap2.flange_b) annotation (Line(
        points={{40,0},{50,0},{50,-30},{40,-30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(elastoGap1.flange_b, mass2.flange_a) annotation (Line(
        points={{-20,-30},{-10,-30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass2.flange_b, elastoGap2.flange_a) annotation (Line(
        points={{10,-30},{20,-30}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This model demonstrates the effect of ElastoGaps on eigenfrequency:<br>
Plot mass1.s and mass2.s as well as mass1.v and mass2.v<br><br>
mass1 is moved by both spring forces all the time.<br>
Since elastoGap1 lifts off at s &gt; -0.5 m and elastoGap2 lifts off s &lt; +0.5 m,
mass2 moves freely as long as -0.5 m &lt; s &lt; +0.5 m.
</p>
</html>"),
      experiment(StopTime=1.0, Interval=0.01));
  end ElastoGap;

  model Brake "Demonstrate braking of a translational moving mass"
    extends Modelica_Icons.Example;

    Modelica_Mechanics_Translational.Components.Brake brake(fn_max=1,
        useSupport=false)
      annotation (Placement(transformation(extent={{6,40},{26,20}})));
    Modelica_Mechanics_Translational.Components.Mass mass1(
      m=1,
      s(fixed=true),
      v(start=1, fixed=true))
      annotation (Placement(transformation(extent={{-34,20},{-14,40}})));
    Modelica_Blocks.Sources.Step step(startTime=0.1, height=2)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-24,-10})));
    Modelica_Mechanics_Translational.Components.Brake brake1(fn_max=1,
        useSupport=true)
      annotation (Placement(transformation(extent={{6,-60},{26,-40}})));
    Modelica_Mechanics_Translational.Components.Mass mass2(
      m=1,
      s(fixed=true),
      v(start=1, fixed=true))
      annotation (Placement(transformation(extent={{-34,-60},{-14,-40}})));
    Modelica_Mechanics_Translational.Components.Fixed fixed
      annotation (Placement(transformation(extent={{6,-80},{26,-60}})));
  equation
    connect(mass1.flange_b, brake.flange_a)
                                           annotation (Line(
        points={{-14,30},{6,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(step.y, brake.f_normalized) annotation (Line(
        points={{-13,-10},{16,-10},{16,19}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(mass2.flange_b, brake1.flange_a)
                                           annotation (Line(
        points={{-14,-50},{6,-50}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(step.y, brake1.f_normalized) annotation (Line(
        points={{-13,-10},{16,-10},{16,-39}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(fixed.flange, brake1.support) annotation (Line(
        points={{16,-70},{16,-60}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (        Documentation(info="<html>
<p>
This model consists of a mass with an initial velocity of 1 m/s.
After 0.1 s, a brake is activated and it is shown that the mass decelerates until
it arrives at rest and remains at rest. Two versions of this system are present,
one where the brake is implicitly grounded and one where it is explicitly grounded.
</p>
</html>"),
      experiment(StopTime=2.0, Interval=0.001));
  end Brake;

  model HeatLosses "Demonstrate the modeling of heat losses"
   extends Modelica_Icons.Example;
    Modelica_Mechanics_Translational.Components.Mass mass1(
      m=1,
      s(fixed=true),
      L=0.1,
      v(fixed=true))
      annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
    Modelica_Mechanics_Translational.Components.SpringDamper springDamper(
      s_rel(fixed=true),
      v_rel(fixed=true),
      c=100,
      d=10,
      useHeatPort=true)
      annotation (Placement(transformation(extent={{-30,20},{-10,40}})));
    Modelica_Mechanics_Translational.Components.Damper damper(d=10, useHeatPort=
         true) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=-90,
          origin={-60,-10})));
    Modelica_Mechanics_Translational.Components.ElastoGap elastoGap(
      c=100,
      d=20,
      s_rel0=-0.02,
      useHeatPort=true)
      annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
    Modelica_Mechanics_Translational.Components.Fixed fixed1
      annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
    Modelica_Mechanics_Translational.Sources.Force force
      annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
    Modelica_Blocks.Sources.Sine sine1(freqHz=1, amplitude=20)
      annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
    Modelica_Mechanics_Translational.Components.Mass mass2(
      m=1,
      L=0.1,
      s(fixed=false),
      v(fixed=false))
      annotation (Placement(transformation(extent={{0,20},{20,40}})));
    Modelica_Mechanics_Translational.Components.SupportFriction supportFriction(
        useHeatPort=true)
      annotation (Placement(transformation(extent={{30,20},{50,40}})));
    Modelica_Mechanics_Translational.Components.Spring spring(c=100, s_rel(
          fixed=true))
      annotation (Placement(transformation(extent={{60,20},{80,40}})));
    Modelica_Mechanics_Translational.Components.Mass mass3(
      m=1,
      L=0.1,
      s(fixed=false),
      v(fixed=true))
      annotation (Placement(transformation(extent={{90,20},{110,40}})));
    Modelica_Mechanics_Translational.Components.Brake brake(fn_max=10,
        useHeatPort=true)
      annotation (Placement(transformation(extent={{120,20},{140,40}})));
    Modelica_Blocks.Sources.Sine sine2(amplitude=10, freqHz=2)
      annotation (Placement(transformation(extent={{100,50},{120,70}})));
    Modelica_Mechanics_Translational.Components.MassWithStopAndFriction massWithStopAndFriction(
      L=0.1,
      m=1,
      F_prop=0.5,
      F_Coulomb=1,
      F_Stribeck=2,
      fexp=2,
      smin=0,
      smax=0.4,
      v(fixed=true),
      useHeatPort=true)
      annotation (Placement(transformation(extent={{180,20},{200,40}})));
    Modelica_Thermal_HeatTransfer.Components.Convection convection
      annotation (Placement(transformation(extent={{-10,-40},{10,-60}})));
    Modelica_Blocks.Sources.Constant const(k=20)
      annotation (Placement(transformation(extent={{-30,-90},{-10,-70}})));
    Modelica_Thermal_HeatTransfer.Celsius.FixedTemperature TAmbient(T=25)
      "Ambient temperature"
      annotation (Placement(transformation(extent={{40,-60},{20,-40}})));
    Modelica_Mechanics_Translational.Components.Fixed fixed2
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
    Modelica_Mechanics_Translational.Components.SpringDamper springDamper1(
      c=10000,
      d=1000,
      useHeatPort=true,
      s_rel(fixed=true))
      annotation (Placement(transformation(extent={{150,20},{170,40}})));
  equation

    connect(mass1.flange_b, springDamper.flange_a)
                                                  annotation (Line(
        points={{-40,30},{-30,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(sine1.y, force.f) annotation (Line(
        points={{-99,30},{-92,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(force.flange, mass1.flange_a) annotation (Line(
        points={{-70,30},{-60,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass1.flange_a, damper.flange_a) annotation (Line(
        points={{-60,30},{-60,0}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(damper.flange_b, fixed1.flange) annotation (Line(
        points={{-60,-20},{-60,-30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(springDamper.flange_b, mass2.flange_a) annotation (Line(
        points={{-10,30},{0,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass2.flange_b, supportFriction.flange_a) annotation (Line(
        points={{20,30},{30,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(supportFriction.flange_b, spring.flange_a) annotation (Line(
        points={{50,30},{60,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(spring.flange_b, mass3.flange_a) annotation (Line(
        points={{80,30},{90,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(mass3.flange_b, brake.flange_a) annotation (Line(
        points={{110,30},{120,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(sine2.y, brake.f_normalized) annotation (Line(
        points={{121,60},{130,60},{130,41}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(elastoGap.flange_b, mass1.flange_a) annotation (Line(
        points={{-70,0},{-60,0},{-60,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(const.y,convection. Gc) annotation (Line(
        points={{-9,-80},{0,-80},{0,-60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TAmbient.port,convection. fluid) annotation (Line(
        points={{20,-50},{10,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(elastoGap.flange_a, fixed2.flange) annotation (Line(
        points={{-90,0},{-110,0}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(elastoGap.heatPort, convection.solid) annotation (Line(
        points={{-90,-10},{-90,-50},{-10,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(damper.heatPort, convection.solid) annotation (Line(
        points={{-50,0},{-50,-50},{-10,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(springDamper.heatPort, convection.solid) annotation (Line(
        points={{-30,20},{-30,-50},{-10,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(supportFriction.heatPort, convection.solid) annotation (Line(
        points={{30,20},{30,0},{-30,0},{-30,-50},{-10,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(brake.heatPort, convection.solid) annotation (Line(
        points={{120,20},{120,0},{-30,0},{-30,-50},{-10,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(massWithStopAndFriction.heatPort, convection.solid) annotation (
        Line(
        points={{180,20},{180,0},{-30,0},{-30,-50},{-10,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(brake.flange_b, springDamper1.flange_a) annotation (Line(
        points={{140,30},{150,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(springDamper1.flange_b, massWithStopAndFriction.flange_a)
      annotation (Line(
        points={{170,30},{180,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(springDamper1.heatPort, convection.solid) annotation (Line(
        points={{150,20},{150,0},{-30,0},{-30,-50},{-10,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    annotation (        Documentation(info="<html>
<p>
This model demonstrates how to model the dissipated power of a Translational model,
by enabling the heatPort of all components and connecting these heatPorts via
a convection element to the environment. The total heat flow generated by the
elements and transported to the environment
is present in variable convection.fluid.
</p>
</html>"),
      experiment(StopTime=2.0, Interval=0.001),
      Diagram(coordinateSystem(extent={{-120,-100},{200,100}},
            preserveAspectRatio=false)));
  end HeatLosses;

  package Utilities "Utility classes used by the Example models"
    extends Modelica_Icons.UtilitiesPackage;
    function GenerateStribeckFrictionTable
      "Generate Stribeck friction table for example Friction for the SupportFriction"
       extends Modelica_Icons.Function;
       input Real F_prop(final unit="N.s/m", final min=0)
        "Velocity dependent friction coefficient";
       input Modelica_SIunits.Force F_Coulomb
        "Constant friction: Coulomb force";
       input Modelica_SIunits.Force F_Stribeck "Stribeck effect";
       input Real fexp(final unit="s/m", final min=0) "Exponential decay";
       input Real v_max "Generate table from v=0 ... v_max";
       input Integer nTable(min=2)=100 "Number of table points";
       output Real table[nTable,2] "Friction table";
    algorithm
       for i in 1:nTable loop
          table[i,1] :=v_max*(i - 1)/(nTable - 1);
          table[i,2] :=F_Coulomb + F_prop*table[i, 1] +
                       F_Stribeck*exp(-fexp*table[i, 1]);
       end for;
      annotation (Documentation(info="<html>
<p>
Returns a table with the friction characteristic table[nTable,2] = [0, f1; ....; v_max, fn], where the first
column is the velocity v in the range 0..v_max and the second column is the friction force
according to the Stribeck curve:
</p>
<pre>
  F_Coulomb + F_prop*v + F_Stribeck*exp(-fexp*v);
</pre>

</html>"));
    end GenerateStribeckFrictionTable;
    annotation (Documentation(info="<html>
<p>Utility models and functions used in the Examples</p>
</html>"));
  end Utilities;
  annotation (
    Documentation(info="<html>
<p>
This package contains example models to demonstrate the usage of the
Translational package. Open the models and
simulate them according to the provided description in the models.
</p>

</html>"), uses(Modelica_Thermal_HeatTransfer(version="3.2.2"),
                Modelica_SIunits(version="3.2.2"),
                Modelica_Blocks(version="3.2.2"),
                Modelica_Mechanics_Translational(version="3.2.2"),
                Modelica_Icons(version="3.2.2")),
            version="3.2.2");
end Modelica_Mechanics_Translational_Examples;
