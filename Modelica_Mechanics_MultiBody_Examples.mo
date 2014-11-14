within ;
package Modelica_Mechanics_MultiBody_Examples
  "Examples that demonstrate the usage of the MultiBody library"
extends Modelica_Icons.ExamplesPackage;

  package Elementary
    "Elementary examples to demonstrate various features of the MultiBody library"
  extends Modelica_Icons.ExamplesPackage;

    model DoublePendulum
      "Simple double pendulum with two revolute joints and two bodies"

      extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-88,0},{-68,20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute1(
        useAxisFlange=true,
        phi(fixed=true),
        w(fixed=true)) annotation (Placement(transformation(extent={{-48,0},{
                -28,20}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Damper damper(
                                                  d=0.1)
        annotation (Placement(transformation(extent={{-48,40},{-28,60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox boxBody1(r={0.5,0,0}, width=
            0.06) annotation (Placement(transformation(extent={{-10,0},{10,20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute2(phi(fixed=true),
          w(fixed=true)) annotation (Placement(transformation(extent={{32,0},
                {52,20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox boxBody2(r={0.5,0,0}, width=
            0.06) annotation (Placement(transformation(extent={{74,0},{94,20}},
              rotation=0)));
    equation

      connect(damper.flange_b, revolute1.axis) annotation (Line(points={{-28,50},{
              -24,50},{-24,28},{-38,28},{-38,20}}, color={0,0,0}));
      connect(revolute1.support, damper.flange_a) annotation (Line(points={{-44,20},
              {-44,28},{-58,28},{-58,50},{-48,50}}, color={0,0,0}));
      connect(revolute1.frame_b, boxBody1.frame_a)
        annotation (Line(
          points={{-28,10},{-10,10}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute2.frame_b, boxBody2.frame_a)
        annotation (Line(
          points={{52,10},{74,10}},
          color={95,95,95},
          thickness=0.5));
      connect(boxBody1.frame_b, revolute2.frame_a)
        annotation (Line(
          points={{10,10},{32,10}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, revolute1.frame_a)
        annotation (Line(
          points={{-68,10},{-48,10}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=3),
        Documentation(info="<html>
<p>
This example demonstrates that by using joint and body
elements animation is automatically available. Also the revolute
joints are animated. Note, that animation of every component
can be switched of by setting the first parameter <b>animation</b>
to <b>false</b> or by setting <b>enableAnimation</b> in the <b>world</b>
object to <b>false</b> to switch off animation of all components.
</p>

<table border=0 cellspacing=0 cellpadding=0><tr><td valign=\"top\">
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/DoublePendulum.png\"
ALT=\"model Examples.Elementary.DoublePendulum\">
</td></tr></table>

</HTML>"));
    end DoublePendulum;

    model DoublePendulumInitTip
      "Demonstrate how to initialize a double pendulum so that its tip starts at a predefined position"
      extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-100,0},{-80,20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute1(useAxisFlange=true)
        annotation (Placement(transformation(extent={{-60,0},{-40,20}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Damper damper(d=0.1)
        annotation (Placement(transformation(extent={{-60,40},{-40,60}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox boxBody1(r={0.5,0,0}, width=
            0.06) annotation (Placement(transformation(extent={{-22,0},{-2,20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute2 annotation (
          Placement(transformation(extent={{20,0},{40,20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox boxBody2(r={0.5,0,0}, width=
            0.06) annotation (Placement(transformation(extent={{62,0},{82,20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.FreeMotionScalarInit freeMotionScalarInit(
        use_r=true,
        r_rel_a_1(start=0.7, fixed=true),
        r_rel_a_2(start=0.3, fixed=true),
        use_v=true,
        v_rel_a_1(fixed=true),
        v_rel_a_2(fixed=true))
        annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
    equation
      connect(damper.flange_b,revolute1. axis) annotation (Line(points={{-40,50},{
              -36,50},{-36,28},{-50,28},{-50,20}}, color={0,0,0}));
      connect(revolute1.support,damper. flange_a) annotation (Line(points={{-56,20},
              {-56,28},{-70,28},{-70,50},{-60,50}}, color={0,0,0}));
      connect(revolute1.frame_b,boxBody1. frame_a)
        annotation (Line(
          points={{-40,10},{-22,10}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute2.frame_b,boxBody2. frame_a)
        annotation (Line(
          points={{40,10},{62,10}},
          color={95,95,95},
          thickness=0.5));
      connect(boxBody1.frame_b,revolute2. frame_a)
        annotation (Line(
          points={{-2,10},{20,10}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b,revolute1. frame_a)
        annotation (Line(
          points={{-80,10},{-60,10}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, freeMotionScalarInit.frame_a) annotation (Line(
          points={{-80,10},{-66,10},{-66,-30},{-20,-30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotionScalarInit.frame_b, boxBody2.frame_b) annotation (Line(
          points={{0,-30},{88,-30},{88,10},{82,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=5),
        Documentation(info="<html>
<p>
This example demonstrates at hand of a double pendulum,
how no-standard initialization can be defined:
The absolute position of the pendulum tip, and its absolute speed
shall be initially defined. This can be performed with the
<a href=\"modelica://Modelica.Mechanics.MultiBody.Joints.FreeMotionScalarInit\">Joints.FreeMotionScalarInit</a>
joint that allows to initialize individual elements of its relative vectors.
In this case, the x-, and y-coordinates of the relative position vector
(visualized by the yellow arrow in the figure below) and of its
derivative shall have a defined value at initial time.
The configuration of the double pendulum at the initial time is
shown below, where the tip position is required to have the coordinates
x=0.7, y=0.3.
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/DoublePendulumInitTip.png\">
</blockquote>

</html>"));
    end DoublePendulumInitTip;

    model ForceAndTorque "Demonstrate usage of ForceAndTorque element"
      extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world(animateGravity=false)
        annotation (Placement(transformation(extent={{-90,30},{-70,50}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder body(r={1,0,0})
        annotation (Placement(transformation(extent={{0,30},{20,50}}, rotation=
                0)));
      Modelica_Mechanics_MultiBody.Parts.Fixed fixed1(r={0,-0.5,0}, width=0.03)
        annotation (Placement(transformation(extent={{-90,-10},{-70,10}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedRotation fixedRotation(n={0,0,1},
          angle=30) annotation (Placement(transformation(extent={{-8,-30},{12,-10}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.ForceAndTorque forceAndTorque(
        Nm_to_m=120,
        N_to_m=1200,
        resolveInFrame=Modelica_Mechanics_MultiBody.Types.ResolveInFrameAB.frame_resolve)
        annotation (Placement(transformation(extent={{60,50},{40,30}}, rotation
              =0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute2(
        n={0,1,0},
        phi(fixed=true),
        w(fixed=true)) annotation (Placement(transformation(
            origin={-20,20},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Blocks.Sources.Constant torque[3](k={-100,100,0})
        annotation (Placement(transformation(
            origin={40,-10},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute1(phi(fixed=true), w(
            fixed=true)) annotation (Placement(transformation(extent={{-60,-10},
                {-40,10}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Fixed fixed2(width=0.03, r={1.5,0.25,0})
        annotation (Placement(transformation(extent={{100,30},{80,50}},
              rotation=0)));
      Modelica_Blocks.Sources.Constant force[3](k={0,1000,0})
        annotation (Placement(transformation(
            origin={80,-10},
            extent={{10,-10},{-10,10}},
            rotation=270)));
    equation
      connect(revolute2.frame_b, body.frame_a) annotation (Line(
          points={{-20,30},{-20,40},{0,40}},
          color={95,95,95},
          thickness=0.5));
      connect(forceAndTorque.frame_b, body.frame_b)
        annotation (Line(
          points={{40,40},{20,40}},
          color={95,95,95},
          thickness=0.5));
      connect(fixed1.frame_b, revolute1.frame_a)
        annotation (Line(
          points={{-70,0},{-60,0}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute1.frame_b, revolute2.frame_a)
        annotation (Line(
          points={{-40,0},{-20,0},{-20,10}},
          color={95,95,95},
          thickness=0.5));
      connect(fixed2.frame_b, forceAndTorque.frame_a)
        annotation (Line(
          points={{80,40},{60,40}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_a, fixed1.frame_b) annotation (Line(
          points={{-8,-20},{-65,-20},{-65,0},{-70,0}},
          color={95,95,95},
          thickness=0.5));
      connect(forceAndTorque.frame_resolve, fixedRotation.frame_b) annotation (Line(
          points={{42,30},{42,30},{20,30},{20,-20},{12,-20}},
          color={95,95,95},
          pattern=LinePattern.Dot));
      connect(force.y, forceAndTorque.force) annotation (Line(
          points={{80,1},{80,10},{58,10},{58,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(torque.y, forceAndTorque.torque) annotation (Line(
          points={{40,1},{40,10},{50,10},{50,28}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Documentation(info="<HTML>
<p>
In this example the usage of the general force element
\"<a href=\"modelica://Modelica.Mechanics.MultiBody.Forces.ForceAndTorque\">ForceAndTorque</a>\"
is shown. A \"ForceAndTorque\" element is connected
between a body and a fixed point in the world system. The force and torque
is defined by the \"Constant\" block. The two vectors are resolved in the
coordinate system defined by the \"fixedRotation\" component that is
fixed in the world system:
</p>
<p>
The animation view at time = 0 is shown in the figure below.
The yellow line is directed from frame_a to frame_b of the
forceAndTorque component. The green arrow characterizes the
force acting at the body whereas the green double arrow characterizes
the torque acting at the body. The lengths of the two vectors
are proportional to the lengths of the force and torque vectors
(constant scaling factors are defined as parameters in the
forceAndTorque component):
</p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/ForceAndTorque.png\">
</html>"),     experiment(StopTime=1.01));
    end ForceAndTorque;

    model FreeBody "Free flying body attached by two springs to environment"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-60,20},{-40,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar2(r={0.8,0,0},
          animation=false) annotation (Placement(transformation(extent={{0,20},
                {20,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring1(
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5,
        c=20,
        s_unstretched=0) annotation (Placement(transformation(
            origin={-20,6},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.BodyShape body(
        m=1,
        I_11=1,
        I_22=1,
        I_33=1,
        r={0.4,0,0},
        r_CM={0.2,0,0},
        width=0.05,
        r_0(start={0.2,-0.5,0.1}, each fixed=true),
        v_0(each fixed=true),
        angles_fixed=true,
        w_0_fixed=true,
        angles_start={0.174532925199433,0.174532925199433,0.174532925199433})
        annotation (Placement(transformation(extent={{0,-40},{20,-20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring2(
        c=20,
        s_unstretched=0,
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5) annotation (Placement(transformation(
            origin={40,6},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    equation
      connect(bar2.frame_a, world.frame_b)
        annotation (Line(
          points={{0,30},{-40,30}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.frame_b, body.frame_a) annotation (Line(
          points={{-20,-4},{-20,-30},{0,-30}},
          color={95,95,95},
          thickness=0.5));
      connect(bar2.frame_b, spring2.frame_a)
        annotation (Line(
          points={{20,30},{40,30},{40,16}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.frame_a, world.frame_b) annotation (Line(
          points={{-20,16},{-20,30},{-40,30}},
          color={95,95,95},
          thickness=0.5));
      connect(body.frame_b, spring2.frame_b) annotation (Line(
          points={{20,-30},{40,-30},{40,-4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=10),
        Documentation(info="<html>
<p>
This example demonstrates:
</p>
<ul>
<li>The animation of spring and damper components</li>
<li>A body can be freely moving without any connection to a joint.
    In this case body coordinates are used automatically as
    states (whenever joints are present, it is first tried to
    use the generalized coordinates of the joints as states).</li>
<li>If a body is freely moving, the initial position and velocity of the body
    can be defined with the \"Initialization\" menu as shown with the
    body \"body1\" in the left part (click on \"Initialization\").</li>
</ul>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/FreeBody.png\"
ALT=\"model Examples.Elementary.FreeBody\">
</html>"));
    end FreeBody;

    model InitSpringConstant
      "Determine spring constant such that system is in steady state at given position"

      extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world(gravityType=
            Modelica_Mechanics_MultiBody.Types.GravityTypes.UniformGravity)
        annotation (Placement(transformation(extent={{-80,0},{-60,20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute rev(
        useAxisFlange=true,
        n={0,0,1},
        phi(fixed=true),
        w(fixed=true),
        a(fixed=true)) annotation (Placement(transformation(extent={{-40,0},{
                -20,20}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Damper damper(d=0.1) annotation (
          Placement(transformation(extent={{-40,40},{-20,60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyShape body(
        r={1,0,0},
        r_CM={0.5,0,0},
        m=1) annotation (Placement(transformation(extent={{0,0},{20,20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Fixed fixed(r={1,0.2,0}, width=0.02)
        annotation (Placement(transformation(
            origin={50,70},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring(s_unstretched=0.1, c(
            fixed=false, start=100)) annotation (Placement(transformation(
            origin={50,30},
            extent={{-10,-10},{10,10}},
            rotation=270)));

    equation
      connect(world.frame_b, rev.frame_a) annotation (Line(
          points={{-60,10},{-40,10}},
          color={95,95,95},
          thickness=0.5));
      connect(damper.flange_b, rev.axis) annotation (Line(points={{-20,50},{-16,50},
              {-16,26},{-30,26},{-30,20}}, color={0,0,0}));
      connect(rev.support, damper.flange_a) annotation (Line(points={{-36,20},{-36,
              26},{-48,26},{-48,50},{-40,50}}, color={0,0,0}));
      connect(rev.frame_b, body.frame_a) annotation (Line(
          points={{-20,10},{0,10}},
          color={95,95,95},
          thickness=0.5));
      connect(fixed.frame_b, spring.frame_a) annotation (Line(
          points={{50,60},{50,40}},
          color={95,95,95},
          thickness=0.5));
      connect(body.frame_b, spring.frame_b) annotation (Line(
          points={{20,10},{50,10},{50,20}},
          color={95,95,95},
          thickness=0.5));
      annotation (Documentation(info="<html>
<p>
This example demonstrates a non-standard type of initialization
by calculating a spring constant such
that a simple pendulum is at a defined position in steady state.
</p>
<p>
The goal is that the pendulum should be in steady state
when the rotation angle of the pendulum is zero. The spring
constant of the spring shall be calculated during initialization
such that this goal is reached.
</p>
<p>
The pendulum has one degree of freedom, i.e., two states.
Therefore, two additional equations have to be provided
for initialization. However, parameter \"c\" of the spring
component is defined with attribute \"fixed = <b>false</b>\", i.e.,
the value of this parameter is computed during initialization.
Therefore, there is one additional equation required during
initialization. The 3 initial equations are the rotational
angle of the revolute joint and its first and second
derivative. The latter ones are zero, in order to initialize
in steady state. By setting the start values of phi, w, a to zero and
their fixed attributes to true, the required
3 initial equations are defined.
</p>
<p>
After translation, this model is initialized in steady-state.
The spring constant is computed as c = 49.05 N/m.
An animation of this simulation is shown in the figure below.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/InitSpringConstant.png\"
ALT=\"model Examples.Elementary.InitSpringConstant\">
</html>"),     experiment(StopTime=1.01));
    end InitSpringConstant;

    model LineForceWithTwoMasses
      "Demonstrate line force with two point masses using a JointUPS and alternatively a LineForceWithTwoMasses component"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Mass m=1 "Mass of point masses";
      Modelica_SIunits.Force rod_f_diff[3]=rod1.frame_b.f - rod3.frame_b.f
        "Difference of cut-forces in rod1 and rod3";
      Modelica_SIunits.Force body_f_diff[3]=bodyBox1.frame_b.f - bodyBox2.frame_b.f
        "Difference of cut-forces in bodyBox1 and bodyBox2";

      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-80,60},{-60,80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute1(phi(fixed=true),
          w(fixed=true)) annotation (Placement(transformation(extent={{-20,60},
                {0,80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox bodyBox1(r={0.7,0,0})
        annotation (Placement(transformation(extent={{20,60},{40,80}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation rod1(
        r={0,-0.9,0},
        width=0.01,
        animation=false) annotation (Placement(transformation(
            origin={-40,54},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Joints.Assemblies.JointUPS jointUPS(nAxis_ia=
            {0.7,1.2,0}, animation=true) annotation (Placement(transformation(
              extent={{0,50},{20,30}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body1(
        r_CM=0.2*jointUPS.eAxis_ia,
        cylinderDiameter=0.05,
        animation=true,
        m=m,
        I_11=0,
        I_22=0,
        I_33=0) annotation (Placement(transformation(extent={{-14,14},{-34,34}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body2(
        r_CM=-0.2*jointUPS.eAxis_ia,
        cylinderDiameter=0.05,
        animation=true,
        m=m,
        I_11=0,
        I_22=0,
        I_33=0) annotation (Placement(transformation(extent={{32,14},{52,34}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation rod2(
        r={0,0.3,0},
        width=0.01,
        animation=false) annotation (Placement(transformation(
            origin={-40,84},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Mechanics_Translational.Components.Damper damper1(
                                                      d=3)
        annotation (Placement(transformation(extent={{0,24},{20,4}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute2(phi(fixed=true),
          w(fixed=true)) annotation (Placement(transformation(extent={{-20,-40},
                {0,-20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox bodyBox2(r={0.7,0,0})
        annotation (Placement(transformation(extent={{20,-40},{40,-20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation rod3(
        width=0.01,
        r={0,-0.9,0.3},
        animation=false) annotation (Placement(transformation(
            origin={-40,-46},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation rod4(
        width=0.01,
        r={0,0.3,0.3},
        animation=false) annotation (Placement(transformation(
            origin={-40,-16},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Mechanics_Translational.Components.Damper damper2(
                                                      d=3)
        annotation (Placement(transformation(extent={{0,-76},{20,-96}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.LineForceWithTwoMasses lineForceWithTwoMasses(
        L_a=0.2,
        L_b=0.2,
        cylinderLength_a=0.2,
        cylinderLength_b=1.2,
        massDiameterFaction=2.2,
        m_a=m,
        m_b=m) annotation (Placement(transformation(extent={{0,-50},{20,-70}},
              rotation=0)));
    equation
      connect(jointUPS.bearing, damper1.flange_a)
        annotation (Line(points={{6,30},{6,20},{0,20},{0,14}}, color={0,191,0}));
      connect(jointUPS.axis, damper1.flange_b)
        annotation (Line(points={{14,30},{14,20},{20,20},{20,14}}, color={0,191,0}));
      connect(jointUPS.frame_ib, body2.frame_a)
        annotation (Line(
          points={{18,30},{18,24},{32,24}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, rod2.frame_a) annotation (Line(
          points={{-60,70},{-40,70},{-40,74}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, rod1.frame_a) annotation (Line(
          points={{-60,70},{-40,70},{-40,64}},
          color={95,95,95},
          thickness=0.5));
      connect(rod2.frame_b, revolute1.frame_a) annotation (Line(
          points={{-40,94},{-40,98},{-28,98},{-28,70},{-20,70}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute1.frame_b, bodyBox1.frame_a)
        annotation (Line(
          points={{0,70},{20,70}},
          color={95,95,95},
          thickness=0.5));
      connect(bodyBox1.frame_b, jointUPS.frame_b) annotation (Line(
          points={{40,70},{46,70},{46,40},{20,40}},
          color={95,95,95},
          thickness=0.5));
      connect(body1.frame_a, jointUPS.frame_ia)
        annotation (Line(
          points={{-14,24},{2,24},{2,30}},
          color={95,95,95},
          thickness=0.5));
      connect(rod1.frame_b, jointUPS.frame_a) annotation (Line(
          points={{-40,44},{-40,40},{0,40}},
          color={95,95,95},
          thickness=0.5));
      connect(rod4.frame_b, revolute2.frame_a) annotation (Line(
          points={{-40,-6},{-40,-2},{-28,-2},{-28,-30},{-20,-30}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute2.frame_b, bodyBox2.frame_a)
        annotation (Line(
          points={{0,-30},{20,-30}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, rod4.frame_a) annotation (Line(
          points={{-60,70},{-52,70},{-52,-32},{-40,-32},{-40,-26}},
          color={95,95,95},
          thickness=0.5));
      connect(rod3.frame_a, rod4.frame_a)
        annotation (Line(
          points={{-40,-36},{-40,-26}},
          color={0,0,0},
          thickness=0.5));
      connect(lineForceWithTwoMasses.frame_a, rod3.frame_b) annotation (Line(
          points={{0,-60},{-40,-60},{-40,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(lineForceWithTwoMasses.frame_b, bodyBox2.frame_b) annotation (Line(
          points={{20,-60},{54,-60},{54,-30},{40,-30}},
          color={95,95,95},
          thickness=0.5));
      connect(lineForceWithTwoMasses.flange_b, damper2.flange_b)
        annotation (Line(points={{16,-71},{20,-71},{20,-86}}, color={0,191,0}));
      connect(lineForceWithTwoMasses.flange_a, damper2.flange_a)
        annotation (Line(points={{4,-71},{0,-71},{0,-86}}, color={0,191,0}));
      annotation (
        experiment(StopTime=3),
        Documentation(info="<html>
<p>
It is demonstrated how to implement line force components
that shall have mass properties. Two alternative implementations
are given:
</p>
<ul>
<li> With <a href=\"modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS\">JointUPS</a>:<br>
     Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS is an aggregation
     of a universal, a prismatic and a spherical joint that approximates
     a real force component, such as a hydraulic cylinder. At the two
     frames of the prismatic joint (frame_ia, frame_ib of jointUPS)
     two bodies are attached. The parameters are selected such that
     the center of masses of the two bodies are located on the line
     connecting frame_a and frame_b of the jointUPS component.
     Both bodies have the same mass and the inertia tensor is set to zero,
     i.e., the two bodies are treated as point masses.</li>
<li> With <a href=\"modelica://Modelica.Mechanics.MultiBody.Forces.LineForceWithTwoMasses\">LineForceWithTwoMasses</a>:<br>
     Modelica.Mechanics.MultiBody.Forces.LineForceWithTwoMasses is a line force component
     with the built-in property that two point masses are located
     on the line on which the line force is acting.
     The parameters are selected in such a way that the same
     system as with the jointUPS component is described.</li>
</ul>
<p>
In both cases, a linear 1-dimensional translational damper from the
Modelica.Mechanics.Translational library is used as
line force between the two attachment points. Simulate
this system and plot the differences of the cut forces at both sides
of the line force component (\"rod_f_diff\" and \"body_f_diff\").
Both vectors should be zero
(depending on the chosen relative tolerance of the integration,
the difference is in the order of 1.e-10 ... 1.e-15).
</p>
<p>
Note, that the implementation with the LineForceWithTwoMasses
component is simpler and more convenient.
An animation of this simulation is shown in the figure below.
The system on the left side in the front is the animation with
the LineForceWithTwoMasses component whereas the system on the right
side in the back is the animation with the JointUPS component.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/LineForceWithTwoMasses2.png\">

</html>"));
    end LineForceWithTwoMasses;

    model Pendulum "Simple pendulum with one revolute joint and one body"
      extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world(gravityType=
            Modelica_Mechanics_MultiBody.Types.GravityTypes.UniformGravity)
        annotation (Placement(transformation(extent={{-60,0},{-40,20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute rev(
        n={0,0,1},
        useAxisFlange=true,
        phi(fixed=true),
        w(fixed=true)) annotation (Placement(transformation(extent={{-20,0},{
                0,20}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Damper damper(
                                                  d=0.1)
        annotation (Placement(transformation(extent={{-20,40},{0,60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body(m=1.0, r_CM={0.5,0,0})
        annotation (Placement(transformation(extent={{20,0},{40,20}},
              rotation=0)));
    equation
      connect(world.frame_b, rev.frame_a)
        annotation (Line(
          points={{-40,10},{-20,10}},
          color={95,95,95},
          thickness=0.5));
      connect(damper.flange_b, rev.axis) annotation (Line(points={{0,50},{4,50},{4,
              26},{-10,26},{-10,20}}, color={0,0,0}));
      connect(rev.support, damper.flange_a) annotation (Line(points={{-16,20},{-16,
              26},{-28,26},{-28,50},{-20,50}}, color={0,0,0}));
      connect(body.frame_a, rev.frame_b) annotation (Line(
          points={{20,10},{0,10}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=5),
        Documentation(info="<html>
<p>
This simple model demonstrates that by just dragging components
default animation is defined that shows the structure of the
assembled system.

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/Pendulum.png\"
ALT=\"model Examples.Elementary.Pendulum\">
</html>"));
    end Pendulum;

    model PendulumWithSpringDamper "Simple spring/damper/mass system"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      inner Modelica_Mechanics_MultiBody.World world(axisLength=0.6)
        annotation (Placement(transformation(extent={{-80,20},{-60,40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body1(
        m=1,
        animation=animation,
        I_11=1,
        I_22=1,
        I_33=1,
        r_CM={0,0,0},
        cylinderDiameter=0.05,
        sphereDiameter=0.2) annotation (Placement(transformation(
            origin={72,30},
            extent={{10,-10},{-10,10}},
            rotation=180)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar1(animation=
            animation, r={0.3,0,0}) annotation (Placement(transformation(
              extent={{-46,20},{-26,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring1(
        coilWidth=0.01,
        numberOfWindings=5,
        c=20,
        s_unstretched=0.2) annotation (Placement(transformation(extent={{0,-46},
                {20,-26}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Damper damper1(
        d=1,
        length_a=0.1,
        diameter_a=0.08,
        animation=false) annotation (Placement(transformation(extent={{0,-20},
                {20,0}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute(phi(fixed=true),
          w(fixed=true)) annotation (Placement(transformation(extent={{-12,20},
                {8,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Prismatic prismatic(
        boxWidth=0.04,
        boxColor={255,65,65},
        s(fixed=true, start=0.5),
        v(fixed=true)) annotation (Placement(transformation(extent={{20,20},{
                40,40}}, rotation=0)));
    equation
      connect(world.frame_b, bar1.frame_a)
        annotation (Line(
          points={{-60,30},{-46,30}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute.frame_a, bar1.frame_b)
        annotation (Line(
          points={{-12,30},{-26,30}},
          color={95,95,95},
          thickness=0.5));
      connect(prismatic.frame_a, revolute.frame_b)
        annotation (Line(
          points={{20,30},{8,30}},
          color={95,95,95},
          thickness=0.5));
      connect(damper1.frame_a, bar1.frame_b) annotation (Line(
          points={{0,-10},{-18,-10},{-18,30},{-26,30}},
          color={95,95,95},
          thickness=0.5));
      connect(damper1.frame_b, prismatic.frame_b) annotation (Line(
          points={{20,-10},{44,-10},{44,30},{40,30}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.frame_a, bar1.frame_b) annotation (Line(
          points={{0,-36},{-18,-36},{-18,30},{-26,30}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.frame_b, prismatic.frame_b) annotation (Line(
          points={{20,-36},{44,-36},{44,30},{40,30}},
          color={95,95,95},
          thickness=0.5));
      connect(body1.frame_a, prismatic.frame_b)
        annotation (Line(
          points={{62,30},{40,30}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=10),
        Documentation(info="<html>
<p>
A body is attached on a revolute and prismatic joint.
A 3-dim. spring and a 3-dim. damper are connected between the body
and a point fixed in the world frame:
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PendulumWithSpringDamper.png\"
ALT=\"model Examples.Elementary.PendulumWithSpringDamper\">
</html>"));
    end PendulumWithSpringDamper;

    model PointGravity "Two point masses in a point gravity field"
      extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world(
        mue=1,
        gravitySphereDiameter=0.1,
        gravityType=Modelica_Mechanics_MultiBody.Types.GravityTypes.PointGravity)
                                                     annotation (Placement(
            transformation(extent={{-20,-20},{0,0}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body1(
        m=1,
        sphereDiameter=0.1,
        I_11=0.1,
        I_22=0.1,
        I_33=0.1,
        r_0(start={0,0.6,0}, each fixed=true),
        v_0(start={1,0,0}, each fixed=true),
        angles_fixed=true,
        w_0_fixed=true,
        r_CM={0,0,0}) annotation (Placement(transformation(extent={{-20,20},{
                0,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body2(
        m=1,
        sphereDiameter=0.1,
        I_11=0.1,
        I_22=0.1,
        I_33=0.1,
        r_0(start={0.6,0.6,0}, each fixed=true),
        v_0(start={0.6,0,0}, each fixed=true),
        angles_fixed=true,
        w_0_fixed=true,
        r_CM={0,0,0}) annotation (Placement(transformation(extent={{20,20},{
                40,40}}, rotation=0)));
      annotation (
        experiment(StopTime=5),
        Documentation(info="<HTML>
<p>
This model demonstrates a point gravity field. Two bodies
are placed in the gravity field. The initial positions and velocities of
these bodies are selected such that one body rotates on a circle and
the other body rotates on an ellipse around the center of the
point gravity field.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PointGravity.png\"
ALT=\"model Examples.Elementary.PointGravity\">
</HTML>"));
    end PointGravity;

    model PointGravityWithPointMasses
      "Two point masses in a point gravity field (rotation of bodies is neglected)"
      extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world(
        mue=1,
        gravitySphereDiameter=0.1,
        gravityType=Modelica_Mechanics_MultiBody.Types.GravityTypes.PointGravity)
                                                     annotation (Placement(
            transformation(extent={{-80,-20},{-60,0}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.PointMass body1(
        m=1,
        sphereDiameter=0.1,
        r_0(start={0,0.6,0}, each fixed=true),
        v_0(start={1,0,0}, each fixed=true)) annotation (Placement(
            transformation(extent={{-20,20},{0,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.PointMass body2(
        m=1,
        sphereDiameter=0.1,
        r_0(start={0.6,0.6,0}, each fixed=true),
        v_0(start={0.6,0,0}, each fixed=true)) annotation (Placement(
            transformation(extent={{20,20},{40,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.PointMass body3(
        m=1,
        sphereDiameter=0.1,
        r_0(start={0,0.8,0}, each fixed=true),
        v_0(start={0.6,0,0}, each fixed=true)) annotation (Placement(
            transformation(extent={{-20,60},{0,80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.PointMass body4(
        m=1,
        sphereDiameter=0.1,
        r_0(start={0.3,0.8,0}, each fixed=true),
        v_0(start={0.6,0,0}, each fixed=true)) annotation (Placement(
            transformation(extent={{20,60},{40,80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring(
        showMass=false,
        c=10,
        fixedRotationAtFrame_b=true,
        fixedRotationAtFrame_a=true) annotation (Placement(transformation(
              extent={{0,60},{20,80}}, rotation=0)));
    equation

      connect(spring.frame_a, body3.frame_a) annotation (Line(
          points={{0,70},{-10,70}},
          color={95,95,95},
          thickness=0.5));
      connect(spring.frame_b, body4.frame_a) annotation (Line(
          points={{20,70},{30,70}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=2),
        Documentation(info="<HTML>
<p>
This model demonstrates the usage of model Parts.PointMass in a
point gravity field. The PointMass model has the feature that
that rotation is not taken into account and can therefore also not be
calculated. This example demonstrates two cases where this does not matter:
If a PointMass is not connected (body1, body2), the orientation object in
these point masses is set to a unit rotation.
If a PointMass is connected by a line force element, such as
the used Forces.LineForceWithMass component, then the orientation object
is set to a unit rotation within the line force element.
These are the two cases where the rotation is automatically set to
a default value, when the physical system does not provide the equations.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PointGravityWithPointMasses.png\">
</HTML>"));
    end PointGravityWithPointMasses;

    model PointGravityWithPointMasses2
      "Rigidly connected point masses in a point gravity field"
      extends Modelica_Icons.Example;
      model PointMass = Modelica_Mechanics_MultiBody.Parts.PointMass (m=1,
            sphereColor={255,0,0})
        "Point mass used at all places of this example";

      PointMass pointMass1(r_0(start={3,0,0}, each fixed=true), v_0(start={0,0,-1},
            each fixed=true))   annotation (Placement(transformation(extent={{60,-10},{
                80,10}}, rotation=0)));

      PointMass pointMass2 annotation (Placement(transformation(extent={{-60,-10},{
                -40,10}}, rotation=0)));
      PointMass pointMass3(r_0(start={2,1,0}, each fixed=true), v_0(start={0,0,-1},
            each fixed=true))   annotation (Placement(transformation(extent={{60,20},{80,
                40}}, rotation=0)));
      PointMass pointMass4 annotation (Placement(transformation(extent={{-50,-40},{
                -30,-20}}, rotation=0)));
      PointMass pointMass5 annotation (Placement(transformation(extent={{0,80},{20,
                100}}, rotation=0)));
      PointMass pointMass6 annotation (Placement(transformation(extent={{0,-100},{
                20,-80}}, rotation=0)));

      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(r={1,0,0})
        annotation (Placement(transformation(extent={{20,-10},{40,10}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation1(r={-1,0,0})
        annotation (Placement(transformation(extent={{0,-10},{-20,10}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation2(r={0,1,0})
        annotation (Placement(transformation(extent={{20,20},{40,40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation3(r={0,-1,0})
        annotation (Placement(transformation(extent={{0,-40},{-20,-20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation4(r={0,0,1})
        annotation (Placement(transformation(
            origin={10,60},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation5(r={0,0,-1})
        annotation (Placement(transformation(
            origin={10,-60},
            extent={{10,-10},{-10,10}},
            rotation=90)));

      inner Modelica_Mechanics_MultiBody.World world(
        gravitySphereDiameter=0.1,
        gravityType=Modelica_Mechanics_MultiBody.Types.GravityTypes.PointGravity,

        mue=5) annotation (Placement(transformation(extent={{-80,60},{-60,80}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.FreeMotion freeMotion annotation (
          Placement(transformation(extent={{-40,60},{-20,80}}, rotation=0)));

    model SystemWithStandardBodies
        "For comparison purposes, an equivalent model with Bodies instead of PointMasses"
      model PointMass = Modelica_Mechanics_MultiBody.Parts.Body (
            m=1,
            I_11=0,
            I_22=0,
            I_33=0)
          "Body used all places of the comparison model with zero inertia tensor";

      PointMass pointMass1(
          r_0(start={3,0,0}, each fixed=true),
          v_0(start={0,0,-1}, each fixed=true),
          angles_fixed=true,
          w_0_fixed=true,
          r_CM={0,0,0})    annotation (Placement(transformation(extent={{40,-20},{
                  60,0}}, rotation=0)));
      PointMass pointMass2(r_CM={0,0,0})
                           annotation (Placement(transformation(extent={{-60,-20},{
                  -80,0}}, rotation=0)));
      PointMass pointMass3(r_CM={0,0,0})
                           annotation (Placement(transformation(extent={{40,10},{60,
                  30}}, rotation=0)));
      PointMass pointMass4(r_CM={0,0,0})
                           annotation (Placement(transformation(extent={{-50,-50},{
                  -70,-30}}, rotation=0)));
      PointMass pointMass5(r_CM={0,0,0})
                           annotation (Placement(transformation(extent={{0,60},{20,
                  80}}, rotation=0)));
      PointMass pointMass6(r_CM={0,0,0})
                           annotation (Placement(transformation(extent={{2,-102},{
                  22,-82}}, rotation=0)));

      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(r={1,0,0})
          annotation (Placement(transformation(extent={{0,-20},{20,0}},
                rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation1(r={-1,0,0})
          annotation (Placement(transformation(extent={{-20,-20},{-40,0}},
                rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation2(r={0,1,0})
          annotation (Placement(transformation(extent={{0,10},{20,30}},
                rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation3(r={0,-1,0})
          annotation (Placement(transformation(extent={{-20,-50},{-40,-30}},
                rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation4(r={0,0,1})
          annotation (Placement(transformation(
              origin={-10,50},
              extent={{-10,-10},{10,10}},
              rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation5(r={0,0,-1})
          annotation (Placement(transformation(
              origin={-10,-70},
              extent={{10,-10},{-10,10}},
              rotation=90)));

    equation
      connect(fixedTranslation1.frame_a, fixedTranslation.frame_a)
                                                             annotation (Line(
            points={{-20,-10},{0,-10}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation1.frame_a, fixedTranslation2.frame_a)
                                                              annotation (Line(
            points={{-20,-10},{-10,-10},{-10,20},{0,20}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation3.frame_a, fixedTranslation.frame_a)
                                                             annotation (Line(
            points={{-20,-40},{-10,-40},{-10,-10},{0,-10}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation1.frame_a, fixedTranslation4.frame_a)
                                                              annotation (Line(
            points={{-20,-10},{-10,-10},{-10,40}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation5.frame_a, fixedTranslation.frame_a)
                                                             annotation (Line(
            points={{-10,-60},{-10,-10},{0,-10}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation2.frame_b, pointMass3.frame_a)
                                                          annotation (Line(
            points={{20,20},{40,20}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation3.frame_b, pointMass4.frame_a)
                                                          annotation (Line(
            points={{-40,-40},{-50,-40}},
            color={95,95,95},
            thickness=0.5));
      connect(pointMass5.frame_a, fixedTranslation4.frame_b)
                                                          annotation (Line(
            points={{0,70},{-10,70},{-10,60}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation5.frame_b, pointMass6.frame_a)
                                                          annotation (Line(
            points={{-10,-80},{-10,-92},{2,-92}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation.frame_b, pointMass1.frame_a)
                                                         annotation (Line(
            points={{20,-10},{40,-10}},
            color={95,95,95},
            thickness=0.5));
      connect(fixedTranslation1.frame_b, pointMass2.frame_a)
                                                          annotation (Line(
            points={{-40,-10},{-60,-10}},
            color={95,95,95},
            thickness=0.5));
      annotation (                       Documentation(info="<html>
<p>
In order to compare the results of the \"PointMass\" example where
6 point masses are rigidly connected together, in this comparison model,
an equivalent system is setup, with the only difference that the
point masses are replaced by Bodies with zero inertia.
</p>
</html>"));
    end SystemWithStandardBodies;

      SystemWithStandardBodies referenceSystem annotation (Placement(transformation(
              extent={{60,-60},{80,-40}}, rotation=0)));
    equation
      connect(fixedTranslation1.frame_a, fixedTranslation.frame_a)
                                                             annotation (Line(
          points={{0,0},{20,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation1.frame_a, fixedTranslation2.frame_a)
                                                              annotation (Line(
          points={{0,0},{10,0},{10,30},{20,30}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation3.frame_a, fixedTranslation.frame_a)
                                                             annotation (Line(
          points={{0,-30},{10,-30},{10,0},{20,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation1.frame_a, fixedTranslation4.frame_a)
                                                              annotation (Line(
          points={{0,0},{10,0},{10,50}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation5.frame_a, fixedTranslation.frame_a)
                                                             annotation (Line(
          points={{10,-50},{10,0},{20,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation2.frame_b, pointMass3.frame_a)
                                                          annotation (Line(
          points={{40,30},{70,30}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation3.frame_b, pointMass4.frame_a)
                                                          annotation (Line(
          points={{-20,-30},{-40,-30}},
          color={95,95,95},
          thickness=0.5));
      connect(pointMass5.frame_a, fixedTranslation4.frame_b)
                                                          annotation (Line(
          points={{10,90},{10,70}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation5.frame_b, pointMass6.frame_a)
                                                          annotation (Line(
          points={{10,-70},{10,-90}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation.frame_b, pointMass1.frame_a)
                                                         annotation (Line(
          points={{40,0},{70,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation1.frame_b, pointMass2.frame_a)
                                                          annotation (Line(
          points={{-20,0},{-50,0}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, freeMotion.frame_a) annotation (Line(
          points={{-60,70},{-40,70}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, fixedTranslation1.frame_a) annotation (Line(
          points={{-20,70},{-10,70},{-10,20},{10,20},{10,0},{0,0}},
          color={95,95,95},
          thickness=0.5));
      annotation (    experiment(StopTime=3.0, Tolerance=1e-006),
        Documentation(info="<html>
<p>
This model demonstrates the usage of model Parts.PointMass in a
point gravity field. 6 point masses are connected rigidly together.
Translating such a model results in an error, because point masses do
not define an orientation object. The example demonstrates that in such
a case (when the orientation object is not defined by an object that
is connected to a point mass), a \"MultiBody.Joints.FreeMotion\" joint
has to be used, to define the the degrees of freedom of this structure.
</p>

<p>
In order to demonstrate that this approach is correct, in model
\"referenceSystem\", the same system is again provided, but this time
modeled with a generic body (Parts.Body) where the inertia tensor is
set to zero. In this case, no FreeMotion object is needed because every
body provides its absolute translational and rotational position and
velocity as potential states.
</p>

<p>
The two systems should move exactly in the same way. The system with the PointMasses
object visualizes the point masses in \"red\", whereas the \"referenceSystem\" shows
its bodies in \"blue\".

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PointGravityWithPointMasses2.png\">
</html>"));
    end PointGravityWithPointMasses2;

    model SpringDamperSystem "Simple spring/damper/mass system"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-80,20},{-60,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body1(
        m=1,
        animation=animation,
        r_CM={0,-0.2,0},
        cylinderDiameter=0.05,
        sphereDiameter=0.15,
        I_11=0.1,
        I_22=0.1,
        I_33=0.1,
        r_0(start={0.3,-0.2,0}, each fixed=true),
        v_0(each fixed=true),
        angles_fixed=true,
        w_0_fixed=true,
        w_0_start(each displayUnit="deg/s") = {0,0,0.03490658503988659})
        annotation (Placement(transformation(
            origin={-20,-50},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar1(animation=
            animation, r={0.3,0,0}) annotation (Placement(transformation(
              extent={{-46,20},{-26,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar2(animation=
            animation, r={0.6,0,0}) annotation (Placement(transformation(
              extent={{0,20},{20,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body2(
        m=1,
        animation=animation,
        cylinderDiameter=0.05,
        sphereDiameter=0.15,
        r_CM={0,0,0}) annotation (Placement(transformation(
            origin={50,-50},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Joints.Prismatic p2(
        useAxisFlange=true,
        n={0,-1,0},
        animation=animation,
        boxWidth=0.05,
        stateSelect=StateSelect.always,
        v(fixed=true),
        s(fixed=true, start=0.1)) annotation (Placement(transformation(
            origin={50,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring2(
        c=30,
        s_unstretched=0.1,
        coilWidth=0.01,
        width=0.1) annotation (Placement(transformation(
            origin={82,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring1(
        s_unstretched=0.1,
        coilWidth=0.01,
        c=30,
        numberOfWindings=10,
        width=0.1) annotation (Placement(transformation(
            origin={-6,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.Damper damper1(d=2) annotation (
          Placement(transformation(
            origin={-30,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    equation
      connect(world.frame_b, bar1.frame_a)
        annotation (Line(
          points={{-60,30},{-46,30}},
          color={95,95,95},
          thickness=0.5));
      connect(bar1.frame_b, bar2.frame_a)
        annotation (Line(
          points={{-26,30},{0,30}},
          color={95,95,95},
          thickness=0.5));
      connect(bar2.frame_b, p2.frame_a)
        annotation (Line(
          points={{20,30},{50,30},{50,0}},
          color={95,95,95},
          thickness=0.5));
      connect(p2.frame_b, body2.frame_a)
        annotation (Line(
          points={{50,-20},{50,-40}},
          color={95,95,95},
          thickness=0.5));
      connect(bar2.frame_b, spring2.frame_a)
        annotation (Line(
          points={{20,30},{82,30},{82,0}},
          color={95,95,95},
          thickness=0.5));
      connect(body2.frame_a, spring2.frame_b) annotation (Line(
          points={{50,-40},{82,-40},{82,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(damper1.frame_a, bar1.frame_b) annotation (Line(
          points={{-30,0},{-30,10},{-20,10},{-20,30},{-26,30}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.frame_a, bar1.frame_b) annotation (Line(
          points={{-6,0},{-6,10},{-20,10},{-20,30},{-26,30}},
          color={95,95,95},
          thickness=0.5));
      connect(damper1.frame_b, body1.frame_a) annotation (Line(
          points={{-30,-20},{-30,-28},{-20,-28},{-20,-40}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.frame_b, body1.frame_a) annotation (Line(
          points={{-6,-20},{-6,-28},{-20,-28},{-20,-40}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=10),
        Documentation(info="<html>
<p>
This example demonstrates:
</p>
<ul>
<li>The animation of spring and damper components</li>
<li>A body can be freely moving without any connection to a joint.
    In this case body coordinates are used automatically as
    states (whenever joints are present, it is first tried to
    use the generalized coordinates of the joints as states).</li>
<li>If a body is freely moving, the initial position and velocity of the body
    can be defined with the \"Initialization\" menu as shown with the
    body \"body1\" in the left part (click on \"Initialization\").</li>
</ul>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/SpringDamperSystem.png\"
ALT=\"model Examples.Elementary.SpringDamperSystem\">

</html>"));
    end SpringDamperSystem;

    model SpringMassSystem "Mass attached with a spring to the world frame"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-80,20},{-60,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Prismatic p1(
        useAxisFlange=true,
        n={0,-1,0},
        animation=animation,
        boxWidth=0.05,
        s(fixed=true, start=0.1),
        v(fixed=true)) annotation (Placement(transformation(
            origin={-20,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Translational.Components.Spring spring1(
                                                      c=30, s_rel0=0.1)
        annotation (Placement(transformation(
            origin={10,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.Body body1(
        m=1,
        sphereDiameter=0.2,
        animation=animation,
        r_CM={0,0,0}) annotation (Placement(transformation(
            origin={-20,-50},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar1(animation=
            animation, r={0.3,0,0}) annotation (Placement(transformation(
              extent={{-46,20},{-26,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar2(animation=
            animation, r={0.3,0,0}) annotation (Placement(transformation(
              extent={{0,20},{20,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body2(
        m=1,
        sphereDiameter=0.2,
        animation=animation,
        r_CM={0,0,0}) annotation (Placement(transformation(
            origin={50,-50},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Joints.Prismatic p2(
        useAxisFlange=true,
        n={0,-1,0},
        animation=animation,
        boxWidth=0.05,
        stateSelect=StateSelect.always,
        s(fixed=true, start=0.1),
        v(fixed=true)) annotation (Placement(transformation(
            origin={50,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring2(
        c=30,
        s_unstretched=0.1,
        width=0.1) annotation (Placement(transformation(
            origin={90,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    equation
      connect(body1.frame_a, p1.frame_b)
        annotation (Line(
          points={{-20,-40},{-20,-35},{-20,-35},{-20,-30},{-20,-20},{-20,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, bar1.frame_a)
        annotation (Line(
          points={{-60,30},{-46,30}},
          color={95,95,95},
          thickness=0.5));
      connect(bar1.frame_b, p1.frame_a) annotation (Line(
          points={{-26,30},{-20,30},{-20,0}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.flange_b, p1.axis) annotation (Line(points={{10,-20},{10,-30},
              {-8,-30},{-8,-18},{-14,-18}}, color={0,191,0}));
      connect(bar1.frame_b, bar2.frame_a)
        annotation (Line(
          points={{-26,30},{0,30}},
          color={95,95,95},
          thickness=0.5));
      connect(bar2.frame_b, p2.frame_a)
        annotation (Line(
          points={{20,30},{50,30},{50,0}},
          color={95,95,95},
          thickness=0.5));
      connect(p2.frame_b, body2.frame_a)
        annotation (Line(
          points={{50,-20},{50,-40}},
          color={95,95,95},
          thickness=0.5));
      connect(bar2.frame_b, spring2.frame_a)
        annotation (Line(
          points={{20,30},{90,30},{90,0}},
          color={95,95,95},
          thickness=0.5));
      connect(body2.frame_a, spring2.frame_b) annotation (Line(
          points={{50,-40},{90,-40},{90,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.flange_a, p1.support) annotation (Line(
          points={{10,0},{-8,0},{-8,-6},{-14,-6}},
          color={0,127,0},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=5),
        Documentation(info="<html>
<p>
This example shows the two different ways how force laws
can be utilized:
</p>
<ul>
<li>In the left system a body is attached via a prismatic
    joint to the world frame. The prismatic joint has two
    1-dimensional translational flanges (called \"support\" and \"axis\")
    that allows to connect elements from the Modelica.Mechanics.Translational
    library between the support and the axis connector. The effect is
    that the force generated by the 1-dimensional elements acts as driving
    force in the axis of the prismatic joint. In the example a simple
    spring is used.<br>
    The advantage of this approach is that the many elements from the
    Translational library can be easily used here and that this implementation
    is usually more efficient as when using 3-dimensional springs.</li>
<li>In the right system the same model is defined. The difference is
    that a 3-dimensional spring from the Modelica.Mechanics.MultiBody.Forces library is used.
    This has the advantage to get a nice animation of the force component.</li>
</ul>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/SpringMassSystem.png\"
ALT=\"model Examples.Elementary.SpringMassSystem\">
</html>"));
    end SpringMassSystem;

    model SpringWithMass "Point mass hanging on a spring"
      extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world(animateGravity=false)
        annotation (Placement(transformation(extent={{-40,40},{-20,60}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring(
        s_unstretched=0.2,
        m=0.5,
        c=40,
        width=0.1,
        massDiameter=0.07) annotation (Placement(transformation(
            origin={10,30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.Body body(
        r_0(start={0,-0.3,0}, each fixed=true),
        v_0(each fixed=true),
        angles_fixed=true,
        w_0_fixed=true,
        r_CM={0,0,0},
        m=1) annotation (Placement(transformation(
            origin={10,-10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    equation
      connect(world.frame_b, spring.frame_a)
        annotation (Line(
          points={{-20,50},{10,50},{10,40}},
          color={95,95,95},
          thickness=0.5));
      connect(body.frame_a, spring.frame_b)
        annotation (Line(
          points={{10,0},{10,10},{10,20}},
          color={95,95,95},
          thickness=0.5));
      annotation (experiment(StopTime=5), Documentation(info="<html>
<p>
This example shows that a force component may have a mass.
The 3-dimensional spring as used in this example, has an optional
point mass between the two points where the spring is attached.
In the animation, this point mass is represented by a small,
light blue, sphere.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/SpringWithMass.png\"
ALT=\"model Examples.Elementary.SpringWithMass\">
</html>"));
    end SpringWithMass;

    model ThreeSprings "3-dim. springs in series and parallel connection"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      inner Modelica_Mechanics_MultiBody.World world(animateWorld=animation)
        annotation (Placement(transformation(extent={{-60,20},{-40,40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body1(
        animation=animation,
        r_CM={0,-0.2,0},
        m=0.8,
        I_11=0.1,
        I_22=0.1,
        I_33=0.1,
        sphereDiameter=0.2,
        r_0(start={0.5,-0.3,0}, each fixed=true),
        v_0(each fixed=true),
        angles_fixed=true,
        w_0_fixed=true) annotation (Placement(transformation(
            origin={30,-70},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar1(animation=
            animation, r={0.3,0,0}) annotation (Placement(transformation(
              extent={{-20,20},{0,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring1(
        lineForce(r_rel_0(start={-0.2,-0.2,0.2})),
        s_unstretched=0.1,
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5,
        c=20,
        animation=animation) annotation (Placement(transformation(
            origin={30,10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar2(animation=
            animation, r={0,0,0.3}) annotation (Placement(transformation(
            origin={-30,-10},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring2(
        s_unstretched=0.1,
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5,
        c=40,
        animation=animation) annotation (Placement(transformation(
            origin={30,-38},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring3(
        s_unstretched=0.1,
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5,
        c=20,
        animation=animation,
        fixedRotationAtFrame_b=true) annotation (Placement(transformation(
              extent={{-20,-42},{0,-22}}, rotation=0)));
    equation
      connect(world.frame_b, bar1.frame_a)
        annotation (Line(
          points={{-40,30},{-20,30}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, bar2.frame_a) annotation (Line(
          points={{-40,30},{-30,30},{-30,0}},
          color={95,95,95},
          thickness=0.5));
      connect(bar1.frame_b, spring1.frame_a)
        annotation (Line(
          points={{0,30},{30,30},{30,20}},
          color={95,95,95},
          thickness=0.5));
      connect(bar2.frame_b, spring3.frame_a) annotation (Line(
          points={{-30,-20},{-30,-32},{-20,-32}},
          color={95,95,95},
          thickness=0.5));
      connect(spring2.frame_b, body1.frame_a)
        annotation (Line(
          points={{30,-48},{30,-60},{30,-60}},
          color={0,0,0},
          thickness=0.5));
      connect(spring3.frame_b, spring1.frame_b)
        annotation (Line(
          points={{0,-32},{30,-14},{30,0}},
          color={95,95,95},
          thickness=0.5));
      connect(spring2.frame_a, spring1.frame_b)
        annotation (Line(
          points={{30,-28},{30,-21},{30,-21},{30,-14},{30,0},{30,0}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=10),
        Documentation(info="<html>
<p>
This example demonstrates that <b>3-dimensional line force</b> elements
(here: Modelica.Mechanics.MultiBody.Forces.Spring elements) can be connected together
in <b>series</b> without having a body with mass at the
connection point (as usually required by multi-body programs).
This is advantageous since stiff systems can be avoided, say, due to
a stiff spring and a small mass at the connection point.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/ThreeSprings.png\"
ALT=\"model Examples.Elementary.ThreeSprings\">

<p>
For a more thorough explanation, see
<a href=\"modelica://Modelica.Mechanics.MultiBody.UsersGuide.Tutorial.ConnectionOfLineForces\">MultiBody.UsersGuide.Tutorial.ConnectionOfLineForces</a>.
</p>
</html>"));
    end ThreeSprings;

    model RollingWheel
      "Single wheel rolling on ground starting from an initial speed"
       extends Modelica_Icons.Example;

      Modelica_Mechanics_MultiBody.Parts.RollingWheel wheel1(
        wheelRadius=0.3,
        wheelMass=2,
        wheel_I_axis=0.06,
        wheel_I_long=0.12,
        hollowFraction=0.6,
        x(start=0.2),
        y(start=0.2),
        der_angles(start={0,5,1}))
        annotation (Placement(transformation(extent={{-20,0},{0,20}})));
      inner Modelica_Mechanics_MultiBody.World world(label2="z", n={0,0,-1})
        annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
      Modelica_Mechanics_MultiBody.Visualizers.Ground ground(length=4)
        annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
      annotation (
        experiment(StopTime=4),
        Documentation(info="<html>

</html>"));
    end RollingWheel;

    model RollingWheelSetDriving
      "Rolling wheel set that is driven by torques driving the wheels"
       extends Modelica_Icons.Example;

      Modelica_Mechanics_MultiBody.Visualizers.Ground ground(length=3,
          groundColor={0,255,0})
        annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
      inner Modelica_Mechanics_MultiBody.World world(label2="z", n={0,0,-1})
        annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
      Modelica_Mechanics_MultiBody.Parts.RollingWheelSet wheelSet(
        wheelRadius=0.1,
        wheelMass=0.5,
        wheel_I_axis=0.01,
        wheel_I_long=0.02,
        wheelDistance=0.5,
        x(start=0.1, fixed=true),
        y(start=0.1, fixed=true),
        phi(fixed=true),
        theta1(fixed=true),
        theta2(fixed=true),
        der_theta1(fixed=true),
        der_theta2(fixed=true))
        annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
      Modelica_Mechanics_MultiBody.Parts.Body body(
        m=0.01,
        r_CM={0,0,0},
        animation=false)
        annotation (Placement(transformation(extent={{40,56},{60,76}})));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(
        r={0.2,0,0},
        animation=true,
        width=0.04)
        annotation (Placement(transformation(extent={{0,56},{20,76}})));
      Modelica_Blocks.Sources.Sine sine1(freqHz=1, amplitude=2)
        annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
      Modelica_Blocks.Sources.Sine sine2(
        freqHz=1,
        amplitude=2,
        phase=1.5707963267949)
        annotation (Placement(transformation(extent={{60,20},{40,40}})));
      Modelica_Mechanics_Rotational.Sources.Torque2 torque1
        annotation (Placement(transformation(extent={{-40,4},{-20,24}})));
      Modelica_Mechanics_Rotational.Sources.Torque2 torque2
        annotation (Placement(transformation(extent={{24,4},{4,24}})));
      Modelica_Mechanics_MultiBody.Visualizers.FixedShape shape(
        final lengthDirection={0,1,0},
        final widthDirection={1,0,0},
        final shapeType="pipe",
        final r_shape={0,-wheelSet.wheelWidth,0},
        final length=2*wheelSet.wheelWidth,
        final width=2*wheelSet.wheelRadius,
        final height=2*wheelSet.wheelRadius,
        final color={0,128,255},
        final extra=0.8) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={50,90})));
    equation
      connect(fixedTranslation.frame_a, wheelSet.frameMiddle) annotation (Line(
          points={{0,66},{-8,66},{-8,-6},{-10,-6},{-10,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, body.frame_a) annotation (Line(
          points={{20,66},{40,66}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(wheelSet.axis1, torque1.flange_a) annotation (Line(
          points={{-20,0},{-40,0},{-40,14}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torque1.flange_b, wheelSet.support) annotation (Line(
          points={{-20,14},{-10,14},{-10,-1.8}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(wheelSet.axis2, torque2.flange_a) annotation (Line(
          points={{0,0},{24,0},{24,14}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(wheelSet.support, torque2.flange_b) annotation (Line(
          points={{-10,-1.8},{-10,14},{4,14}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(sine1.y, torque1.tau) annotation (Line(
          points={{-59,30},{-30,30},{-30,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sine2.y, torque2.tau) annotation (Line(
          points={{39,30},{14,30},{14,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(shape.frame_a, fixedTranslation.frame_b) annotation (Line(
          points={{40,90},{28,90},{28,66},{20,66}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (    experiment(StopTime=3),
        Documentation(info="<html>

</html>"));
    end RollingWheelSetDriving;

    model RollingWheelSetPulling "Rolling wheel set that is pulled by a force"
       extends Modelica_Icons.Example;

      Modelica_Mechanics_MultiBody.Forces.WorldForce force(animation=false)
        annotation (Placement(transformation(extent={{-20,60},{0,80}})));
      Modelica_Mechanics_MultiBody.Visualizers.Ground ground(length=3)
        annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
      inner Modelica_Mechanics_MultiBody.World world(label2="z", n={0,0,-1})
        annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
      Modelica_Mechanics_MultiBody.Parts.RollingWheelSet wheelSet(
        wheelRadius=0.1,
        wheelMass=0.5,
        wheel_I_axis=0.01,
        wheel_I_long=0.02,
        wheelDistance=0.5,
        x(start=0.1, fixed=true),
        y(start=0.1, fixed=true),
        phi(fixed=true),
        theta1(fixed=true),
        theta2(fixed=true),
        der_theta1(fixed=true),
        der_theta2(fixed=true))
        annotation (Placement(transformation(extent={{-20,0},{0,20}})));
      Modelica_Mechanics_MultiBody.Parts.Body body(
        m=0.01,
        r_CM={0,0,0},
        animation=false)
        annotation (Placement(transformation(extent={{42,20},{62,40}})));
      Modelica_Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,1,0,0; 1,1,
            0,0; 2,0,2,0; 3,0,2,0])
        annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(
        r={0.2,0,0},
        animation=true,
        width=0.04)
        annotation (Placement(transformation(extent={{0,20},{20,40}})));
      Modelica_Mechanics_MultiBody.Visualizers.FixedShape shape(
        final lengthDirection={0,1,0},
        final widthDirection={1,0,0},
        final shapeType="pipe",
        final r_shape={0,-wheelSet.wheelWidth,0},
        final length=2*wheelSet.wheelWidth,
        final width=2*wheelSet.wheelRadius,
        final height=2*wheelSet.wheelRadius,
        final color={0,128,255},
        final extra=0.8) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={52,54})));
    equation
      connect(combiTimeTable.y, force.force) annotation (Line(
          points={{-59,80},{-42,80},{-42,70},{-22,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(fixedTranslation.frame_a, wheelSet.frameMiddle) annotation (Line(
          points={{0,30},{-6,30},{-6,14},{-10,14},{-10,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, body.frame_a) annotation (Line(
          points={{20,30},{42,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force.frame_b, fixedTranslation.frame_b) annotation (Line(
          points={{0,70},{34,70},{34,30},{20,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(shape.frame_a, fixedTranslation.frame_b) annotation (Line(
          points={{42,54},{34,54},{34,30},{20,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (    experiment(StopTime=3),
        Documentation(info="<html>

</html>"));
    end RollingWheelSetPulling;

    model HeatLosses "Demonstrate the modeling of heat losses"
       extends Modelica_Icons.Example;
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-100,40},{-80,60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body1(
        m=1,
        r_CM={0,-0.2,0},
        cylinderDiameter=0.05,
        sphereDiameter=0.15,
        I_11=0.1,
        I_22=0.1,
        I_33=0.1,
        r_0(start={0.3,-0.2,0}, each fixed=true),
        v_0(each fixed=true),
        angles_fixed=true,
        w_0_fixed=true,
        w_0_start(each displayUnit="deg/s") = {0,0,0.034906585039887})
        annotation (Placement(transformation(
            origin={-40,-30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar1(r={0.3,0,0})
        annotation (Placement(transformation(extent={{-66,40},{-46,60}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar2(r={0.3,0,0})
        annotation (Placement(transformation(extent={{-20,40},{0,60}}, rotation
              =0)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring1(
        s_unstretched=0.1,
        coilWidth=0.01,
        c=30,
        numberOfWindings=10,
        width=0.1) annotation (Placement(transformation(
            origin={-26,10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.Damper damper1(d=2, useHeatPort=true)
        annotation (Placement(transformation(
            origin={-50,10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.SpringDamperParallel springDamper(
        d=2,
        c=30,
        s_unstretched=0.1,
        width=0.1,
        coilWidth=0.01,
        numberOfWindings=10,
        useHeatPort=true) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={26,10})));
      Modelica_Mechanics_MultiBody.Parts.Body body2(
        m=1,
        r_CM={0,-0.2,0},
        cylinderDiameter=0.05,
        sphereDiameter=0.15,
        I_11=0.1,
        I_22=0.1,
        I_33=0.1,
        v_0(each fixed=true),
        angles_fixed=true,
        w_0_fixed=true,
        w_0_start(each displayUnit="deg/s") = {0,0,0.034906585039887},
        r_0(start={0.6,-0.2,0}, each fixed=true)) annotation (Placement(
            transformation(
            origin={26,-30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation bar3(r={0.3,0,0})
        annotation (Placement(transformation(extent={{34,40},{54,60}}, rotation
              =0)));
      Modelica_Mechanics_MultiBody.Forces.SpringDamperSeries springDamperSeries(
        d=2,
        c=30,
        s_unstretched=0.1,
        useHeatPort=true) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={80,10})));
      Modelica_Mechanics_MultiBody.Parts.Body body3(
        m=1,
        r_CM={0,-0.2,0},
        cylinderDiameter=0.05,
        sphereDiameter=0.15,
        I_11=0.1,
        I_22=0.1,
        I_33=0.1,
        v_0(each fixed=true),
        angles_fixed=true,
        w_0_fixed=true,
        w_0_start(each displayUnit="deg/s") = {0,0,0.034906585039887},
        r_0(start={0.9,-0.2,0}, each fixed=true)) annotation (Placement(
            transformation(
            origin={80,-30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Forces.Spring spring(
        s_unstretched=0.2,
        width=0.05,
        c=30) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={60,10})));
      Modelica_Blocks.Sources.Constant const(k=20)
        annotation (Placement(transformation(extent={{-8,-100},{12,-80}})));
      Modelica_Thermal_HeatTransfer.Components.Convection convection
        annotation (Placement(transformation(extent={{26,-52},{46,-72}})));
      Modelica_Thermal_HeatTransfer.Celsius.FixedTemperature TAmbient(T=25)
        "Ambient temperature"
        annotation (Placement(transformation(extent={{80,-72},{60,-52}})));
    equation

      connect(world.frame_b,bar1. frame_a)
        annotation (Line(
          points={{-80,50},{-66,50}},
          color={95,95,95},
          thickness=0.5));
      connect(bar1.frame_b,bar2. frame_a)
        annotation (Line(
          points={{-46,50},{-20,50}},
          color={95,95,95},
          thickness=0.5));
      connect(damper1.frame_a,bar1. frame_b) annotation (Line(
          points={{-50,20},{-50,30},{-40,30},{-40,50},{-46,50}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.frame_a,bar1. frame_b) annotation (Line(
          points={{-26,20},{-26,30},{-40,30},{-40,50},{-46,50}},
          color={95,95,95},
          thickness=0.5));
      connect(damper1.frame_b,body1. frame_a) annotation (Line(
          points={{-50,0},{-50,-8},{-40,-8},{-40,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(spring1.frame_b,body1. frame_a) annotation (Line(
          points={{-26,0},{-26,-8},{-40,-8},{-40,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(bar2.frame_b, springDamper.frame_a)  annotation (Line(
          points={{0,50},{26,50},{26,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(springDamper.frame_b, body2.frame_a)  annotation (Line(
          points={{26,0},{26,-5},{26,-5},{26,-10},{26,-20},{26,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bar3.frame_b, springDamperSeries.frame_a)
                                                   annotation (Line(
          points={{54,50},{80,50},{80,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(springDamperSeries.frame_b, body3.frame_a)
                                                    annotation (Line(
          points={{80,0},{80,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bar3.frame_a, bar2.frame_b) annotation (Line(
          points={{34,50},{0,50}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bar3.frame_b, spring.frame_a) annotation (Line(
          points={{54,50},{60,50},{60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(spring.frame_b, body3.frame_a) annotation (Line(
          points={{60,0},{60,-12},{80,-12},{80,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(const.y,convection. Gc) annotation (Line(
          points={{13,-90},{36,-90},{36,-72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TAmbient.port,convection. fluid) annotation (Line(
          points={{60,-62},{46,-62}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(damper1.heatPort, convection.solid) annotation (Line(
          points={{-60,20},{-60,-62},{26,-62}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(springDamper.heatPort, convection.solid) annotation (Line(
          points={{16,20},{4,20},{4,-62},{26,-62}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(springDamperSeries.heatPort, convection.solid) annotation (Line(
          points={{90,20},{96,20},{96,-46},{4,-46},{4,-62},{26,-62}},
          color={191,0,0},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=3),
        Documentation(info="<html>
<p>
This model demonstrates how to model the dissipated power of a multi-body
force element by enabling the heatPort of all components and connecting these heatPorts via
a convection element to the environment. The total heat flow generated by the
elements of this multi-body system and transported to the environment
is present in variable convection.fluid.
</p>
</html>"));
    end HeatLosses;

    model UserDefinedGravityField
      "Demonstrate the modeling of a user-defined gravity field"
       extends Modelica_Icons.Example;
       parameter Modelica_SIunits.Conversions.NonSIunits.Angle_deg geodeticLatitude = 0
        "Geodetic latitude";
       parameter Modelica_SIunits.Position height = 20
        "Height of pendulum attachment point over WGS84 earth ellipsoid";
       Modelica_SIunits.Acceleration gravity[3]=body.g_0
        "Gravity acceleration at center of mass of body";
      inner Modelica_Mechanics_MultiBody.World world(
        gravityType=Modelica_Mechanics_MultiBody.Types.GravityTypes.NoGravity,
        redeclare function gravityAcceleration =
            Modelica_Mechanics_MultiBody.Examples.Elementary.Utilities.theoreticalNormalGravityWGS84
            (phi=geodeticLatitude),
        axisLength=10,
        nominalLength=10) annotation (Placement(transformation(extent={{-80,-20},
                {-60,0}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute rev(
        n={0,0,1},
        useAxisFlange=true,
        phi(fixed=true),
        w(fixed=true)) annotation (Placement(transformation(extent={{-14,20},{6,
                40}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Damper damper(d=0.1)
        annotation (Placement(transformation(extent={{-14,60},{6,80}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body(
        r_CM={10,0,0},
        m=1000.0,
        sphereDiameter=1) annotation (Placement(transformation(extent={{26,20},
                {46,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(r={0,
            height,0}, width=0.3) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-40,8})));
    equation
      connect(damper.flange_b,rev. axis) annotation (Line(points={{6,70},{10,70},{10,
              46},{-4,46},{-4,40}},   color={0,0,0}));
      connect(rev.support,damper. flange_a) annotation (Line(points={{-10,40},{-10,46},
              {-22,46},{-22,70},{-14,70}},     color={0,0,0}));
      connect(body.frame_a,rev. frame_b) annotation (Line(
          points={{26,30},{6,30}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, fixedTranslation.frame_a) annotation (Line(
          points={{-60,-10},{-40,-10},{-40,-2}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, rev.frame_a) annotation (Line(
          points={{-40,18},{-40,30},{-14,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (experiment(StopTime=10, Tolerance=1e-008),
        Documentation(info="<html>
<p>
This example demonstrates a user defined gravity field.
Function \"world.gravityAcceleration\" is redeclared to function
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.Utilities.theoreticalNormalGravityWGS84\">theoreticalNormalGravityWGS84</a>
that computes the theoretical gravity of the
<a href=\"http://earth-info.nga.mil/GandG/publications/tr8350.2/wgs84fin.pdf\">WGS84 ellipsoid earth model</a> at and close to
the earth ellipsoid surface. In the gravity field, a large, single pendulum is present. Via parameter \"geodeticLatitude\", the geodetic latitude on the earth can be defined, where the pendulum is present. The world frame is located at the WGS84 earth ellipsoid at this latitude. The result variable
\"gravity\" is the gravity vector at the center of mass of the pendulum mass.
Since the height of this mass is changing, the value of the gravity is also changing
(the difference is in the order of 0.00001).
</p>

<p>
The result of the simulation is slightly different at the equator (geodeticLatitude=0)
and at the poles (geodeticLatitude=90). For example, after 10 s of simulation time
the rotation angle of the pendulum, rev.phi, has the following values:
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><td><b><i>latitude [deg]</i></b></td>
    <td><b><i>rev.phi [rad]</i></b></td></tr>
<tr><td> = 0</td>
    <td>= -2.39 rad</td></tr>

<tr><td>= 90</td>
    <td>= -2.42 rad</td></tr>
</table>
</html>"));
    end UserDefinedGravityField;

    model Surfaces
      "Demonstrate the visualization of a sine surface, as well as a torus and a wheel constructed from a surface"
      extends Modelica_Icons.Example;
      parameter Real x_min=-1 "Minimum value of x";
      parameter Real x_max=+1 "Maximum value of x";
      parameter Real y_min=-1 "Minimum value of y";
      parameter Real y_max=+1 "Maximum value of y";
      parameter Real z_min=0 "Minimum value of z";
      parameter Real z_max=1 "Maximum value of z";
      Real wz = time;
      Modelica_Mechanics_MultiBody.Visualizers.Advanced.Surface surface(
        redeclare function surfaceCharacteristic =
            Modelica_Mechanics_MultiBody.Examples.Elementary.Utilities.sineSurface
            (
            x_min=x_min,
            x_max=x_max,
            y_min=y_min,
            y_max=y_max,
            z_min=z_min,
            z_max=z_max,
            wz=wz),
        multiColoredSurface=false,
        nu=50,
        nv=50)
        annotation (Placement(transformation(extent={{-72,-52},{-52,-32}})));
      inner Modelica_Mechanics_MultiBody.World world(axisLength=1, n={0,0,-1})
        annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
      Modelica_Mechanics_MultiBody.Visualizers.Torus torus
        annotation (Placement(transformation(extent={{32,20},{52,40}})));
      Modelica_Mechanics_MultiBody.Joints.Prismatic prismatic(
        useAxisFlange=true,
        animation=false,
        v(fixed=true))
        annotation (Placement(transformation(extent={{-38,20},{-18,40}})));
      Modelica_Mechanics_Translational.Sources.Position position
        annotation (Placement(transformation(extent={{-66,70},{-46,90}})));
      Modelica_Blocks.Sources.Sine sine(amplitude=2, freqHz=0.5)
        annotation (Placement(transformation(extent={{-98,70},{-78,90}})));
      Modelica_Mechanics_MultiBody.Visualizers.Ground ground(groundColor={215,
            215,215}, length=4)
        annotation (Placement(transformation(extent={{-72,-16},{-52,4}})));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation1(r={0,-1.3,
            torus.ro + torus.ri}, animation=false)
        annotation (Placement(transformation(extent={{-4,20},{16,40}})));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation2(animation
          =false, r={0,-1.6,wheel.rTire})
        annotation (Placement(transformation(extent={{-4,50},{16,70}})));
      Modelica_Mechanics_MultiBody.Visualizers.VoluminousWheel wheel
        annotation (Placement(transformation(extent={{32,50},{52,70}})));
      Modelica_Mechanics_MultiBody.Visualizers.PipeWithScalarField pipeWithScalarField(
        rOuter=0.3,
        length=1,
        T_min=0,
        T_max=2,
        T=sin(Modelica_Constants.pi*pipeWithScalarField.xsi)*cos(
            Modelica_Constants.pi*time) .+ 1,
        n_colors=32)
        annotation (Placement(transformation(extent={{14,-30},{34,-10}})));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation3(animation
          =false, r={0,-2.2,0})
        annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
    equation
      connect(world.frame_b, prismatic.frame_a) annotation (Line(
          points={{-60,30},{-38,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(position.flange, prismatic.axis) annotation (Line(
          points={{-46,80},{-24,80},{-24,36},{-20,36}},
          color={0,127,0},
          smooth=Smooth.None));
      connect(sine.y, position.s_ref) annotation (Line(
          points={{-77,80},{-68,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prismatic.frame_b, fixedTranslation1.frame_a)
                                                           annotation (Line(
          points={{-18,30},{-4,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation1.frame_b, torus.frame_a)
                                                       annotation (Line(
          points={{16,30},{32,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(prismatic.frame_b, fixedTranslation2.frame_a) annotation (Line(
          points={{-18,30},{-14,30},{-14,60},{-4,60}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation2.frame_b, wheel.frame_a) annotation (Line(
          points={{16,60},{32,60}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedTranslation3.frame_a) annotation (Line(
          points={{-60,30},{-46,30},{-46,-20},{-20,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation3.frame_b, pipeWithScalarField.frame_a) annotation (
          Line(
          points={{0,-20},{14,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=5),
        Documentation(info="<html>
<p>
This example demonstrates the use of the
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface\">Surface</a>
visualizer that visualizes a moving, parameterized surface.
The \"sine-wave\" surface is a direct application of the surface model.
Furthermore, the \"torus\" surface is an instance of
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Torus\">Torus</a>,
the \"wheel\" surface is an instance of
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.VoluminousWheel\">VoluminousWheel</a>,
and the \"pipeWithScalarField surface is an instance of
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.PipeWithScalarField\">PipeWithScalarField</a>.
All latter visual shapes are constructed with the surface model.
The following image shows a screen-shot of this example model:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/Surfaces.png\">
</blockquote>

</html>"));
    end Surfaces;

    package Utilities
      "Utility models and functions used by MultiBody.Examples.Elementary"
      extends Modelica_Icons.UtilitiesPackage;
      function theoreticalNormalGravityWGS84
        "WGS84 normal gravity over earth ellipsoid in negative y-direction"
         extends
          Modelica_Mechanics_MultiBody.Interfaces.partialGravityAcceleration;
        input Modelica_SIunits.Conversions.NonSIunits.Angle_deg phi
          "Geodetic latitude" annotation(Dialog);
      protected
        constant Modelica_SIunits.Position a = 6378137.0
          "Semi-major axis of the earth ellipsoid";
        constant Modelica_SIunits.Position b = 6356752.3142
          "Semi-minor axis of the earth ellipsoid";
        constant Modelica_SIunits.AngularAcceleration g_e = 9.7803253359
          "Theoretical gravity acceleration at the equator";
        constant Modelica_SIunits.AngularAcceleration g_p = 9.8321849378
          "Theoretical gravity acceleration at the poles";
        constant Real k =   (b/a)*(g_p/g_e) - 1;

        constant Real e2 = (8.1819190842622e-2)^2
          "Square of the first ellipsoidal eccentricity";
        constant Real f = 1/298.257223563 "Ellipsoidal flattening";
        constant Modelica_SIunits.AngularVelocity w =   7292115e-11
          "Angular velocity of earth";
        constant Real GM(unit="m3/s2")=3986004.418e8
          "Earths Gravitational Constant";
        constant Real m(unit="1")=w^2*a^2*b/GM;
        Real sinphi2(unit="1");
        Modelica_SIunits.AngularAcceleration gn
          "Normal gravity at the earth ellipsoid";
        Modelica_SIunits.AngularAcceleration gh
          "Normal gravity at height h over the earth ellipsoid";
        Modelica_SIunits.Position h "Height over the WGS84 earth ellipsoid";
        Real ha(unit="1") "h/a";
      algorithm
        h := r[2];
        sinphi2 :=Modelica_Math.sin(Modelica_SIunits.Conversions.from_deg(phi))^2;
        gn := g_e*(1 + k*sinphi2)/sqrt(1 - e2*sinphi2);
        ha := h/a;
        gh := gn*(1 - ha*(2*(1+f+m-2*f*sinphi2)+3*ha));
        gravity :={0,-gh,0};
        annotation (Documentation(info="<html>
<p>
Function that computes the theoretical gravity of the
<a href=\"http://earth-info.nga.mil/GandG/publications/tr8350.2/wgs84fin.pdf\">WGS84 ellipsoid earth model</a> at and close to the earth ellipsoid surface, for the
given \"geodeticLatitude\" and the given \"height=r[2]\" over the
ellipsoid surface.
</p>

</html>"));
      end theoreticalNormalGravityWGS84;

      function sineSurface
        "Function defining the characteristic of a moving sine in three dimensions"
         extends
          Modelica_Mechanics_MultiBody.Interfaces.partialSurfaceCharacteristic;
         input Real x_min "Minimum value of x";
         input Real x_max "Maximum value of x";
         input Real y_min "Minimum value of y";
         input Real y_max "Maximum value of y";
         input Real z_min "Minimum value of z";
         input Real z_max "Maximum value of z";
         input Real wz "Factor for angular frequency";
      protected
         Real aux_y;
         Real A=(z_max-z_min)/2;
      algorithm
         for i in 1:nu loop
            aux_y := y_min + (y_max - y_min)*(i-1)/(nu-1);
            for j in 1:nv loop
               X[i,j] := x_min + (x_max - x_min)*(j - 1)/(nv - 1);
               Y[i,j] := aux_y;
               Z[i,j] := A*sin(wz + 0.1*j + 0.1*i)+A;
            end for;
         end for;

         if multiColoredSurface then
            C := {{(Z[i,j]+1)*200,255,0} for j in 1:nv, i in 1:nu};
         end if;
      end sineSurface;
    end Utilities;
  annotation ( Documentation(info="<HTML>
<p>
This package contains elementary example models to demonstrate
the usage of the MultiBody library
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.DoublePendulum\">DoublePendulum</a></td>
      <td valign=\"top\"> Simple double pendulum with two revolute joints and two bodies.<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/DoublePendulumSmall.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.ForceAndTorque\">ForceAndTorque</a></td>
      <td valign=\"top\"> Demonstrates usage of Forces.ForceAndTorque element.<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/ForceAndTorque_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.FreeBody\">FreeBody</a></td>
      <td valign=\"top\"> Free flying body attached by two springs to environment.<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/FreeBody_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.InitSpringConstant\">InitSpringConstant</a></td>
      <td valign=\"top\"> Determine spring constant such that system is in steady state
           at given position.<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/InitSpringConstant_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.LineForceWithTwoMasses\">LineForceWithTwoMasses</a></td>
      <td valign=\"top\"> Demonstrates a line force with two point masses using a
           Joints.Assemblies.JointUPS and alternatively a
           Forces.LineForceWithTwoMasses component.<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/LineForceWithTwoMasses_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.Pendulum\">Pendulum</a></td>
      <td valign=\"top\"> Simple pendulum with one revolute joint and one body. <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/Pendulum_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.PendulumWithSpringDamper\">PendulumWithSpringDamper</a></td>
      <td valign=\"top\"> Simple spring/damper/mass system <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PendulumWithSpringDamper_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.PointGravity\">PointGravity</a></td>
      <td valign=\"top\"> Two bodies in a point gravity field <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PointGravity_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.PointGravityWithPointMasses\">PointGravityWithPointMasses</a></td>
      <td valign=\"top\"> Two point masses in a point gravity field (rotation of bodies is neglected) <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PointGravityWithPointMasses_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.PointGravityWithPointMasses2\">PointGravityWithPointMasses2</a></td>
      <td valign=\"top\"> Rigidly connected point masses in a point gravity field <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/PointGravityWithPointMasses2_small.png\">
      </td>
  </tr>

  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.RollingWheel\">RollingWheel</a></td>
      <td valign=\"top\"> Single wheel rolling on ground starting from an initial speed <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/RollingWheel.png\">
      </td>
  </tr>

  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.RollingWheelSetDriving\">RollingWheelSetDriving</a></td>
      <td valign=\"top\"> Rolling wheel set that is driven by torques driving the wheels <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/RollingWheelSetDriving.png\">
      </td>
  </tr>

  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.RollingWheelSetPulling\">RollingWheelSetPulling</a></td>
      <td valign=\"top\"> Rolling wheel set that is pulled by a force <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/RollingWheelSetPulling.png\">
      </td>
  </tr>

  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.SpringDamperSystem\">SpringDamperSystem</a></td>
      <td valign=\"top\"> Spring/damper system with a prismatic joint and
           attached on free flying body <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/SpringDamperSystem_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.SpringMassSystem\">SpringMassSystem</a></td>
      <td valign=\"top\"> Mass attached via a prismatic joint and a spring to the world frame <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/SpringMassSystem_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.SpringWithMass\">SpringWithMass</a></td>
      <td valign=\"top\"> Point mass hanging on a spring <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/SpringWithMass_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.ThreeSprings\">ThreeSprings</a></td>
      <td valign=\"top\"> 3-dimensional springs in series and parallel connection<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/ThreeSprings_small.png\">
      </td>
  </tr>

  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.HeatLosses\">HeatLosses</a></td>
      <td valign=\"top\"> Demonstrate the modeling of heat losses.  </td>
  </tr>

  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.UserDefinedGravityField\">UserDefinedGravityField </a></td>
      <td valign=\"top\"> Demonstrate the modeling of a user-defined gravity field.  </td>
  </tr>

  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.Surfaces\">Surfaces</a></td>
      <td valign=\"top\"> Demonstrate the visualization of a sine surface,
       as well as a torus and a wheel constructed from a surface <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/Surfaces_small.png\">
      </td>
  </tr>

</table>
</HTML>"));
  end Elementary;

  package Loops "Examples with kinematic loops"
  extends Modelica_Icons.ExamplesPackage;

    model Engine1a "Model of one cylinder engine"
      extends Modelica_Icons.Example;
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder Piston(diameter=0.1, r=
            {0,-0.1,0}) annotation (Placement(transformation(
            origin={90.5,66.5},
            extent={{-10.5,30.5},{10.5,-30.5}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox Rod(
        widthDirection={1,0,0},
        width=0.02,
        height=0.06,
        r={0,-0.2,0},
        color={0,0,200}) annotation (Placement(transformation(
            origin={90,5},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Joints.Revolute B2(
        n={1,0,0},
        cylinderLength=0.02,
        cylinderDiameter=0.05) annotation (Placement(transformation(extent={{
                80,22},{100,42}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute Bearing(
        useAxisFlange=true,
        n={1,0,0},
        cylinderLength=0.02,
        cylinderDiameter=0.05) annotation (Placement(transformation(extent={{
                -10,-80},{10,-100}}, rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-50,-100},{-30,-80}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia Inertia(
        stateSelect=StateSelect.always,
        phi(fixed=true, start=0),
        w(fixed=true, start=10),
        J=1) annotation (Placement(transformation(extent={{-28,-120},{-8,-100}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox Crank4(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-0.1,0}) annotation (Placement(transformation(
            origin={115.5,-75},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder Crank3(r={0.1,0,0},
          diameter=0.03) annotation (Placement(transformation(extent={{81.5,-71},
                {101.5,-51}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder Crank1(diameter=0.05, r=
           {0.1,0,0}) annotation (Placement(transformation(extent={{24,-100},
                {44,-80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyBox Crank2(
        r={0,0.1,0},
        height=0.05,
        widthDirection={1,0,0},
        width=0.02) annotation (Placement(transformation(
            origin={70,-76},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Joints.RevolutePlanarLoopConstraint B1(
        n={1,0,0},
        cylinderLength=0.02,
        cylinderDiameter=0.05) annotation (Placement(transformation(extent={{80,
                -30},{100,-10}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation Mid(r={0.05,0,0})
        annotation (Placement(transformation(extent={{70,-53},{90,-33}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Prismatic Cylinder(
        boxWidth=0.02,
        n={0,-1,0},
        s(start=0.15)) annotation (Placement(transformation(
            origin={90,96},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation cylPosition(animation=
           false, r={0.15,0.45,0}) annotation (Placement(transformation(
              extent={{-0.5,100},{19.5,120}}, rotation=0)));
    equation
      connect(world.frame_b, Bearing.frame_a) annotation (Line(
          points={{-30,-90},{-10,-90}},
          color={95,95,95},
          thickness=0.5));
      connect(Crank2.frame_a, Crank1.frame_b) annotation (Line(
          points={{70,-86},{70,-90},{44,-90}},
          color={95,95,95},
          thickness=0.5));
      connect(Crank2.frame_b, Crank3.frame_a) annotation (Line(
          points={{70,-66},{70,-61},{81.5,-61}},
          color={95,95,95},
          thickness=0.5));
      connect(Bearing.frame_b, Crank1.frame_a) annotation (Line(
          points={{10,-90},{24,-90}},
          color={95,95,95},
          thickness=0.5));
      connect(cylPosition.frame_b, Cylinder.frame_a) annotation (Line(
          points={{19.5,110},{90,110},{90,106}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, cylPosition.frame_a) annotation (Line(
          points={{-30,-90},{-20,-90},{-20,110},{-0.5,110}},
          color={95,95,95},
          thickness=0.5));
      connect(Crank3.frame_b, Crank4.frame_a) annotation (Line(
          points={{101.5,-61},{115,-61},{115,-65},{115.5,-65}},
          color={95,95,95},
          thickness=0.5));
      connect(B1.frame_a, Mid.frame_b) annotation (Line(
          points={{80,-20},{70,-20},{70,-32},{98,-32},{98,-43},{90,-43}},
          color={95,95,95},
          thickness=0.5));
      connect(B1.frame_b, Rod.frame_b) annotation (Line(
          points={{100,-20},{112,-20},{112,-9},{90,-9},{90,-5}},
          color={95,95,95},
          thickness=0.5));
      connect(Rod.frame_a, B2.frame_b) annotation (Line(
          points={{90,15},{90,21},{110,21},{110,32},{100,32}},
          color={95,95,95},
          thickness=0.5));
      connect(B2.frame_a, Piston.frame_b) annotation (Line(
          points={{80,32},{70,32},{70,46},{90.5,46},{90.5,56}},
          color={95,95,95},
          thickness=0.5));
      connect(Inertia.flange_b, Bearing.axis)
        annotation (Line(points={{-8,-110},{0,-110},{0,-100}}, color={0,0,0}));
      connect(Mid.frame_a, Crank2.frame_b) annotation (Line(
          points={{70,-43},{63,-43},{63,-61},{70,-61},{70,-66}},
          color={95,95,95},
          thickness=0.5));
      connect(Cylinder.frame_b, Piston.frame_a) annotation (Line(
          points={{90,86},{90,77},{90.5,77}},
          color={95,95,95},
          thickness=0.5));
      annotation (Diagram(coordinateSystem(extent={{-130.0,-130.0},{130.0,130.0}})),
        experiment(StopTime=5), Documentation(info="<html>
<p>
This is a model of the mechanical part of one cylinder of an engine.
The combustion is not modelled. The \"inertia\" component at the lower
left part is the output inertia of the engine driving the gearbox.
The angular velocity of the output inertia has a start value of 10 rad/s
in order to demonstrate the movement of the engine.
</p>
<p>
The engine is modeled solely by revolute and prismatic joints.
Since this results in a <b>planar</b> loop there is the well known
difficulty that the cut-forces perpendicular to the loop cannot be
uniquely computed, as well as the cut-torques within the plane.
This ambiguity is resolved by using the option <b>planarCutJoint</b>
in the <b>Advanced</b> menu of one revolute joint in every planar loop
(here: joint B1). This option sets the cut-force in direction of the
axis of rotation, as well as the cut-torques perpendicular to the axis
of rotation at this joint to zero and makes the problem mathematically
well-formed.
</p>
<p>
An animation of this example is shown in the figure below.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Engine.png\" ALT=\"model Examples.Loops.Engine\">
</html>"));
    end Engine1a;

    model Engine1b
      "Model of one cylinder engine with gas force and preparation for assembly joint JointRRP"
      extends Modelica_Icons.Example;
      extends Utilities.Engine1bBase(Inertia(w(start=0)));
      Modelica_Mechanics_MultiBody.Joints.RevolutePlanarLoopConstraint B2(
        n={1,0,0},
        cylinderLength=0.02,
        cylinderDiameter=0.05) annotation (Placement(transformation(extent={{40,
                20},{60,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute B1(
        n={1,0,0},
        cylinderLength=0.02,
        cylinderDiameter=0.05) annotation (Placement(transformation(extent={{
                40,-20},{60,0}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Prismatic Cylinder(
        useAxisFlange=true,
        boxWidth=0.02,
        n={0,-1,0}) annotation (Placement(transformation(
            origin={50,97},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation Rod1(r={0,0.2,0},
          animation=false) annotation (Placement(transformation(
            origin={70,10},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation Rod3(r={0,-0.1,0},
          animation=false) annotation (Placement(transformation(
            origin={50,58},
            extent={{10,-10},{-10,10}},
            rotation=90)));
    equation
      connect(B1.frame_b, Rod1.frame_a) annotation (Line(
          points={{60,-10},{70,-10},{70,0}},
          color={95,95,95},
          thickness=0.5));
      connect(Rod1.frame_b, B2.frame_b) annotation (Line(
          points={{70,20},{70,30},{60,30}},
          color={95,95,95},
          thickness=0.5));
      connect(Cylinder.frame_b, Rod3.frame_a) annotation (Line(
          points={{50,87},{50,68}},
          color={95,95,95},
          thickness=0.5));
      connect(B2.frame_a, Rod3.frame_b) annotation (Line(
          points={{40,30},{30,30},{30,44},{50,44},{50,48}},
          color={95,95,95},
          thickness=0.5));
      connect(cylPosition.frame_b, Cylinder.frame_a) annotation (Line(
          points={{-20.5,110},{50,110},{50,107}},
          color={95,95,95},
          thickness=0.5));
      connect(gasForce.flange_a, Cylinder.support) annotation (Line(points={{119,
              107},{119,112},{70,112},{70,101},{56,101}}, color={0,127,0}));
      connect(Cylinder.axis, gasForce.flange_b) annotation (Line(points={{56,89},{
              71,89},{71,80},{119,80},{119,87}}, color={0,127,0}));
      connect(Piston.frame_a, Rod3.frame_a) annotation (Line(
          points={{120,63},{120,75},{50,75},{50,68}},
          color={95,95,95},
          thickness=0.5));
      connect(B1.frame_b, Rod2.frame_a) annotation (Line(
          points={{60,-10},{120,-10},{120,0}},
          color={95,95,95},
          thickness=0.5));
      connect(Mid.frame_b, B1.frame_a) annotation (Line(
          points={{50,-43},{57,-43},{57,-28},{30,-28},{30,-10},{40,-10}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=0.5),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-120},{150,120}}), graphics={Rectangle(
              extent={{3,117},{88,-23}},
              lineColor={255,0,0},
              lineThickness=0.5),Text(
              extent={{65,-30},{145,-39}},
              lineColor={255,0,0},
              lineThickness=0.5,
              textString="jointRRP in model"),Text(
              extent={{66,-34},{141,-52}},
              lineColor={255,0,0},
              lineThickness=0.5,
              textString="Loops.Engine1b_analytic")}),
        Documentation(info="<html>
<p>
This is a model of the mechanical part of one cylinder of an engine.
It is similar to
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Engine1a#diagram\">Loops.Engine1a</a>.
The difference is that a simple
model for the gas force in the cylinder is added and that the
model is restructured in such a way, that the central part of
the planar kinematic loop can be easily replaced by the
assembly joint \"Modelica.Mechanics.MultiBody.Joints.Assemblies.<b>JointRRP</b>\".
This exchange of the kinematic loop is shown in
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Engine1b_analytic#diagram\">Loops.Engine1b_analytic</a>.
The advantage of using JointRRP is, that the
non-linear algebraic equation of this loop is solved analytically, and
not numerically as in this model (Engine1b).
</p>
<p>
An animation of this example is shown in the figure below.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Engine.png\" ALT=\"model Examples.Loops.Engine\">
</html>"));
    end Engine1b;

    model Engine1b_analytic
      "Model of one cylinder engine with gas force and analytic loop handling"
      extends Modelica_Icons.Example;
      extends Utilities.Engine1bBase(Inertia(w(start=0)));
      Modelica_Mechanics_MultiBody.Joints.Assemblies.JointRRP jointRRP(
        n_a={1,0,0},
        n_b={0,-1,0},
        animation=false,
        rRod1_ia={0,0.2,0},
        rRod2_ib={0,-0.1,0}) annotation (Placement(transformation(
            origin={30,54},
            extent={{-20,20},{20,-20}},
            rotation=90)));
    equation
      connect(Mid.frame_b, jointRRP.frame_a) annotation (Line(
          points={{50,-43},{58,-43},{58,-30},{30,-30},{30,34}},
          color={95,95,95},
          thickness=0.5));
      connect(jointRRP.frame_b, cylPosition.frame_b) annotation (Line(
          points={{30,74},{30,110},{-20.5,110}},
          color={95,95,95},
          thickness=0.5));
      connect(jointRRP.axis, gasForce.flange_b) annotation (Line(points={{46,74},{
              46,82},{119,82},{119,87}}, color={0,127,0}));
      connect(jointRRP.bearing, gasForce.flange_a) annotation (Line(points={{38,74},
              {38,114},{119,114},{119,107}}, color={0,127,0}));
      connect(jointRRP.frame_ib, Piston.frame_a) annotation (Line(
          points={{50,70},{120,70},{120,63}},
          color={95,95,95},
          thickness=0.5));
      connect(jointRRP.frame_ia, Rod2.frame_a) annotation (Line(
          points={{50,38},{80,38},{80,-10},{120,-10},{120,0}},
          color={95,95,95},
          thickness=0.5));
      annotation (experiment(StopTime=0.5), Documentation(info="<html>
<p>
This is the same model as
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Engine1b#diagram\">Loops.Engine1b</a>.
The only difference is that the central part of
the planar kinematic loop has been replaced by the
assembly joint \"Modelica.Mechanics.MultiBody.Joints.Assemblies.<b>JointRRP</b>\".
The advantage of using JointRRP is, that the
non-linear algebraic equation of this loop is solved analytically, and
not numerically as in
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Engine1b#diagram\">Loops.Engine1b</a>.
</p>
<p>
An animation of this example is shown in the figure below.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Engine.png\" ALT=\"model Examples.Loops.Engine\">
</html>"));
    end Engine1b_analytic;

    model EngineV6
      "V6 engine with 6 cylinders, 6 planar loops and 1 degree-of-freedom"

      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      output Modelica_SIunits.Conversions.NonSIunits.AngularVelocity_rpm
        engineSpeed_rpm=
             Modelica_SIunits.Conversions.to_rpm(load.w) "Engine speed";
      output Modelica_SIunits.Torque engineTorque = filter.u
        "Torque generated by engine";
      output Modelica_SIunits.Torque filteredEngineTorque = filter.y
        "Filtered torque generated by engine";

      Modelica_Mechanics_MultiBody.Joints.Revolute bearing(
        useAxisFlange=true,
        n={1,0,0},
        cylinderLength=0.02,
        cylinderDiameter=0.06,
        animation=animation) annotation (Placement(transformation(extent={{-90,
                20},{-70,0}}, rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world(animateWorld=false,
          animateGravity=false) annotation (Placement(transformation(extent={
                {-120,20},{-100,40}}, rotation=0)));
      Utilities.Cylinder cylinder1(
        crankAngleOffset=Modelica_SIunits.Conversions.from_deg(
                                     -30),
        cylinderInclination=Modelica_SIunits.Conversions.from_deg(
                                        -30),
        animation=animation) annotation (Placement(transformation(extent={{-50,4},{
                -30,34}}, rotation=0)));
      Utilities.Cylinder cylinder2(
        crankAngleOffset=Modelica_SIunits.Conversions.from_deg(
                                     90),
        cylinderInclination=Modelica_SIunits.Conversions.from_deg(
                                        30),
        animation=animation) annotation (Placement(transformation(extent={{-20,4},{
                0,34}}, rotation=0)));
      Utilities.Cylinder cylinder3(
        cylinderInclination=Modelica_SIunits.Conversions.from_deg(
                                        -30),
        animation=animation,
        crankAngleOffset=Modelica_SIunits.Conversions.from_deg(
                                     210))
                             annotation (Placement(transformation(extent={{10,4},{
                30,34}}, rotation=0)));
      Utilities.Cylinder cylinder4(
        cylinderInclination=Modelica_SIunits.Conversions.from_deg(
                                        30),
        animation=animation,
        crankAngleOffset=Modelica_SIunits.Conversions.from_deg(
                                     210))
                             annotation (Placement(transformation(extent={{39,4},{
                59,34}}, rotation=0)));
      Utilities.Cylinder cylinder5(
        cylinderInclination=Modelica_SIunits.Conversions.from_deg(
                                        -30),
        animation=animation,
        crankAngleOffset=Modelica_SIunits.Conversions.from_deg(
                                     90))
                             annotation (Placement(transformation(extent={{70,4},{
                90,34}}, rotation=0)));
      Utilities.Cylinder cylinder6(
        cylinderInclination=Modelica_SIunits.Conversions.from_deg(
                                        30),
        animation=animation,
        crankAngleOffset=Modelica_SIunits.Conversions.from_deg(
                                     -30))
                             annotation (Placement(transformation(extent={{100,4},{
                120,34}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia load(
                              phi(
          start=0,
          fixed=true), w(
          start=10,
          fixed=true),
        stateSelect=StateSelect.always,
        J=1)                               annotation (Placement(transformation(
              extent={{-44,-30},{-24,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque load2(
                                                     tau_nominal=-100, w_nominal=
            200,
        useSupport=false)
                 annotation (Placement(transformation(extent={{6,-30},{-14,-10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sensors.TorqueSensor torqueSensor
        annotation (Placement(transformation(extent={{-72,-30},{-52,-10}},
              rotation=0)));
      Modelica_Blocks.Continuous.CriticalDamping filter(
        n=2,
        initType=Modelica_Blocks.Types.Init.SteadyState,
        f=5) annotation (Placement(transformation(extent={{-54,-60},{-34,-40}},
              rotation=0)));
    equation

      connect(bearing.frame_b, cylinder1.crank_a)
        annotation (Line(
          points={{-70,10},{-50,10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder1.crank_b, cylinder2.crank_a)
        annotation (Line(
          points={{-30,10},{-20,10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder2.crank_b, cylinder3.crank_a)
        annotation (Line(
          points={{0,10},{10,10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder3.crank_b, cylinder4.crank_a)
        annotation (Line(
          points={{30,10},{39,10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder4.crank_b, cylinder5.crank_a)
        annotation (Line(
          points={{59,10},{70,10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder5.crank_b, cylinder6.crank_a)
        annotation (Line(
          points={{90,10},{100,10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder5.cylinder_b, cylinder6.cylinder_a)
        annotation (Line(
          points={{90,32},{100,32}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder4.cylinder_b, cylinder5.cylinder_a)
        annotation (Line(
          points={{59,32},{70,32}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder4.cylinder_a, cylinder3.cylinder_b)
        annotation (Line(
          points={{39,32},{30,32}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder3.cylinder_a, cylinder2.cylinder_b)
        annotation (Line(
          points={{10,32},{0,32}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder2.cylinder_a, cylinder1.cylinder_b)
        annotation (Line(
          points={{-20,32},{-30,32}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, cylinder1.cylinder_a) annotation (Line(
          points={{-100,30},{-59,30},{-59,32},{-50,32}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, bearing.frame_a) annotation (Line(
          points={{-100,30},{-96,30},{-96,10},{-90,10}},
          color={95,95,95},
          thickness=0.5));
      connect(load2.flange, load.flange_b)
        annotation (Line(points={{-14,-20},{-24,-20}}, color={0,0,0}));
      connect(torqueSensor.flange_b, load.flange_a)
        annotation (Line(points={{-52,-20},{-44,-20}}, color={0,0,0}));
      connect(torqueSensor.tau,filter. u) annotation (Line(points={{-70,-31},{-70,
              -50},{-56,-50}}, color={0,0,127}));
      connect(torqueSensor.flange_a, bearing.axis) annotation (Line(points={{-72,
              -20},{-80,-20},{-80,0}}, color={0,0,0}));
      annotation (
        Documentation(info="<HTML>
<p>
This is a V6 engine with 6 cylinders. It is hierarchically built
up by using instances of one cylinder. For more details on the
modeling of one cylinder, see example
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Engine1b\">Engine1b</a>.
An animation of the engine is shown in the figure below.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/EngineV6.png\" ALT=\"model Examples.Loops.EngineV6\">

<p>
Simulate for 5 s, and plot the variables <b>engineSpeed_rpm</b>,
<b>engineTorque</b>, and <b>filteredEngineTorque</b>. Note, the result file has
a size of about 50 Mbyte (for 5000 output intervals).
</p>
</html>"),     experiment(StopTime=1.01));
    end EngineV6;

    model EngineV6_analytic
      "V6 engine with 6 cylinders, 6 planar loops, 1 degree-of-freedom and analytic handling of kinematic loops"

      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      output Modelica_SIunits.Conversions.NonSIunits.AngularVelocity_rpm
        engineSpeed_rpm=
             Modelica_SIunits.Conversions.to_rpm(load.w) "Engine speed";
      output Modelica_SIunits.Torque engineTorque = filter.u
        "Torque generated by engine";
      output Modelica_SIunits.Torque filteredEngineTorque = filter.y
        "Filtered torque generated by engine";

      inner Modelica_Mechanics_MultiBody.World world(animateWorld=false,
          animateGravity=false) annotation (Placement(transformation(extent={
                {-80,-20},{-60,0}}, rotation=0)));
      Utilities.EngineV6_analytic engine(redeclare model Cylinder =
            Modelica_Mechanics_MultiBody.Examples.Loops.Utilities.Cylinder_analytic_CAD)
        annotation (Placement(transformation(extent={{-40,0},{0,40}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia load(
                                                 phi(
          start=0,
          fixed=true), w(
          start=10,
          fixed=true),
        stateSelect=StateSelect.always,
        J=1)                               annotation (Placement(transformation(
              extent={{40,10},{60,30}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque load2(
                                                     tau_nominal=-100, w_nominal=
            200,
        useSupport=false)
                 annotation (Placement(transformation(extent={{90,10},{70,30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sensors.TorqueSensor torqueSensor
        annotation (Placement(transformation(extent={{12,10},{32,30}},
              rotation=0)));
      Modelica_Blocks.Continuous.CriticalDamping filter(
        n=2,
        initType=Modelica_Blocks.Types.Init.SteadyState,
        f=5) annotation (Placement(transformation(extent={{30,-20},{50,0}},
              rotation=0)));
    equation

      connect(world.frame_b, engine.frame_a)
        annotation (Line(
          points={{-60,-10},{-20,-10},{-20,-0.2}},
          color={95,95,95},
          thickness=0.5));
      connect(load2.flange, load.flange_b)
        annotation (Line(points={{70,20},{60,20}}, color={0,0,0}));
      connect(torqueSensor.flange_a, engine.flange_b)
        annotation (Line(points={{12,20},{2,20}}, color={0,0,0}));
      connect(torqueSensor.flange_b, load.flange_a)
        annotation (Line(points={{32,20},{40,20}}, color={0,0,0}));
      connect(torqueSensor.tau, filter.u) annotation (Line(points={{14,9},{14,-10},
              {28,-10}}, color={0,0,127}));
      annotation (
        Documentation(info="<HTML>
<p>
This is a similar model as the example \"EngineV6\". However, the cylinders
have been built up with component Modelica.Mechanics.MultiBody.Joints.Assemblies.JointRRR that
solves the non-linear system of equations in an aggregation of 3 revolution
joints <b>analytically</b> and only one body is used that holds the total
mass of the crank shaft:
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/EngineV6_CAD_small.png\">

<p>
This model is about 20 times faster as the EngineV6 example and <b>no</b> linear or
non-linear system of equations occur. In contrast, the \"EngineV6\" example
leads to 6 systems of nonlinear equations (every system has dimension = 5, with
Evaluate=false and dimension=1 with Evaluate=true) and a linear system of equations
of about 40. This shows the power of the analytic loop handling.
</p>

<p>
Simulate for 5 s, and plot the variables <b>engineSpeed_rpm</b>,
<b>engineTorque</b>, and <b>filteredEngineTorque</b>. Note, the result file has
a size of about 50 Mbyte (for 5000 output intervals).
</p>
</html>"),     experiment(StopTime=1.01));
    end EngineV6_analytic;

    model Fourbar1
      "One kinematic loop with four bars (with only revolute joints; 5 non-linear equations)"
      extends Modelica_Icons.Example;

      output Modelica_SIunits.Angle j1_phi "angle of revolute joint j1";
      output Modelica_SIunits.Position j2_s "distance of prismatic joint j2";
      output Modelica_SIunits.AngularVelocity j1_w
        "axis speed of revolute joint j1";
      output Modelica_SIunits.Velocity j2_v
        "axis velocity of prismatic joint j2";

      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-100,-80},{-80,-60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute j1(
        n={1,0,0},
        stateSelect=StateSelect.always,
        phi(fixed=true),
        w(displayUnit="deg/s",
          start=5.235987755982989,
          fixed=true)) annotation (Placement(transformation(extent={{-54,-40},
                {-34,-20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Prismatic j2(
        n={1,0,0},
        s(start=-0.2),
        boxWidth=0.05) annotation (Placement(transformation(extent={{10,-80},
                {30,-60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder b1(r={0,0.5,0.1},
          diameter=0.05) annotation (Placement(transformation(
            origin={-30,2},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder b2(r={0,0.2,0},
          diameter=0.05) annotation (Placement(transformation(
            origin={50,-50},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder b3(r={-1,0.3,0.1},
          diameter=0.05) annotation (Placement(transformation(extent={{38,20},
                {18,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute rev(n={0,1,0}) annotation (
         Placement(transformation(
            origin={50,-22},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Joints.Revolute rev1 annotation (Placement(
            transformation(extent={{60,0},{80,20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute j3(n={1,0,0}) annotation (
          Placement(transformation(extent={{-60,40},{-40,60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute j4(n={0,1,0}) annotation (
          Placement(transformation(extent={{-32,60},{-12,80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute j5(n={0,0,1}) annotation (
          Placement(transformation(extent={{0,70},{20,90}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation b0(animation=false,
          r={1.2,0,0}) annotation (Placement(transformation(extent={{-40,-80},
                {-20,-60}}, rotation=0)));
    equation
      connect(j2.frame_b, b2.frame_a) annotation (Line(
          points={{30,-70},{50,-70},{50,-60}},
          color={95,95,95},
          thickness=0.5));
      connect(j1.frame_b, b1.frame_a) annotation (Line(
          points={{-34,-30},{-30,-30},{-30,-8}},
          color={95,95,95},
          thickness=0.5));
      connect(rev.frame_a, b2.frame_b)
        annotation (Line(
          points={{50,-32},{50,-40}},
          color={95,95,95},
          thickness=0.5));
      connect(rev.frame_b, rev1.frame_a)
        annotation (Line(
          points={{50,-12},{50,10},{60,10}},
          color={95,95,95},
          thickness=0.5));
      connect(rev1.frame_b, b3.frame_a) annotation (Line(
          points={{80,10},{90,10},{90,30},{38,30}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, j1.frame_a) annotation (Line(
          points={{-80,-70},{-66,-70},{-66,-30},{-54,-30}},
          color={95,95,95},
          thickness=0.5));
      connect(b1.frame_b, j3.frame_a) annotation (Line(
          points={{-30,12},{-30,28},{-72,28},{-72,50},{-60,50}},
          color={95,95,95},
          thickness=0.5));
      connect(j3.frame_b, j4.frame_a) annotation (Line(
          points={{-40,50},{-34,50},{-42,70},{-32,70}},
          color={95,95,95},
          thickness=0.5));
      connect(j4.frame_b, j5.frame_a)
        annotation (Line(
          points={{-12,70},{0,70},{0,80}},
          color={95,95,95},
          thickness=0.5));
      connect(j5.frame_b, b3.frame_b) annotation (Line(
          points={{20,80},{30,80},{30,54},{4,54},{4,30},{18,30}},
          color={95,95,95},
          thickness=0.5));
      connect(b0.frame_a, world.frame_b)
        annotation (Line(
          points={{-40,-70},{-80,-70}},
          color={95,95,95},
          thickness=0.5));
      connect(b0.frame_b, j2.frame_a)
        annotation (Line(
          points={{-20,-70},{10,-70}},
          color={95,95,95},
          thickness=0.5));
      j1_phi = j1.phi;
      j2_s = j2.s;
      j1_w = j1.w;
      j2_v = j2.v;
      annotation (
        experiment(StopTime=5),
        Documentation(info="<html>
<p>
This is a simple kinematic loop consisting of 6 revolute joints, 1 prismatic joint
and 4 bars that is often used as basic constructing unit in mechanisms.
This example demonstrates that usually no particular knowledge
of the user is needed to handle kinematic loops.
Just connect the joints and bodies together according
to the real system. In particular <b>no</b> cut-joints or a spanning tree has
to be determined. In this case, the initial condition of the angular velocity
of revolute joint j1 is set to 300 deg/s in order to drive this loop.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Fourbar1.png\" ALT=\"model Examples.Loops.Fourbar1\">
</html>"));
    end Fourbar1;

    model Fourbar2
      "One kinematic loop with four bars (with UniversalSpherical joint; 1 non-linear equation)"
      extends Modelica_Icons.Example;

      output Modelica_SIunits.Angle j1_phi "angle of revolute joint j1";
      output Modelica_SIunits.Position j2_s "distance of prismatic joint j2";
      output Modelica_SIunits.AngularVelocity j1_w
        "axis speed of revolute joint j1";
      output Modelica_SIunits.Velocity j2_v
        "axis velocity of prismatic joint j2";

      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-80,-80},{-60,-60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute j1(
        useAxisFlange=true,
        n={1,0,0},
        stateSelect=StateSelect.always,
        phi(fixed=true),
        w(displayUnit="deg/s",
          start=5.235987755982989,
          fixed=true)) annotation (Placement(transformation(extent={{-54,-40},
                {-34,-20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Prismatic j2(
        n={1,0,0},
        boxWidth=0.05,
        s(fixed=true, start=-0.2)) annotation (Placement(transformation(
              extent={{12,-80},{32,-60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder b1(r={0,0.5,0.1},
          diameter=0.05) annotation (Placement(transformation(
            origin={-30,0},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder b2(r={0,0.2,0},
          diameter=0.05) annotation (Placement(transformation(
            origin={50,-50},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Joints.UniversalSpherical universalSpherical(
        n1_a={0,1,0},
        computeRodLength=true,
        rRod_ia={-1,0.3,0.1}) annotation (Placement(transformation(extent={{0,
                18},{-20,38}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation b3(r={1.2,0,0},
          animation=false) annotation (Placement(transformation(extent={{-32,
                -80},{-12,-60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Visualizers.FixedFrame fixedFrame(color_x={
            0,0,255}) annotation (Placement(transformation(
            origin={-6,70},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    equation
      j1_phi = j1.phi;
      j2_s = j2.s;
      j1_w = j1.w;
      j2_v = j2.v;
      connect(j2.frame_b, b2.frame_a) annotation (Line(
          points={{32,-70},{50,-70},{50,-60}},
          color={95,95,95},
          thickness=0.5));
      connect(j1.frame_b, b1.frame_a) annotation (Line(
          points={{-34,-30},{-30,-30},{-30,-10}},
          color={95,95,95},
          thickness=0.5));
      connect(j1.frame_a, world.frame_b) annotation (Line(
          points={{-54,-30},{-60,-30},{-60,-70}},
          color={95,95,95},
          thickness=0.5));
      connect(b1.frame_b, universalSpherical.frame_b) annotation (Line(
          points={{-30,10},{-30,28},{-20,28}},
          color={95,95,95},
          thickness=0.5));
      connect(universalSpherical.frame_a, b2.frame_b)
        annotation (Line(
          points={{0,28},{50,28},{50,-40}},
          color={95,95,95},
          thickness=0.5));
      connect(b3.frame_a, world.frame_b)
        annotation (Line(
          points={{-32,-70},{-60,-70}},
          color={95,95,95},
          thickness=0.5));
      connect(b3.frame_b, j2.frame_a)
        annotation (Line(
          points={{-12,-70},{12,-70}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedFrame.frame_a, universalSpherical.frame_ia) annotation (Line(
          points={{-6,60},{-6,49},{-6,49},{-6,38}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=5),
        Documentation(info="<html>
<p>
This is a second version of the \"four-bar\" mechanism, see figure:
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Fourbar2.png\" ALT=\"model Examples.Loops.Fourbar2\">

<p>
In this case
the three revolute joints on the left top-side and the two revolute
joints on the right top side have been replaced by the joint <b>UniversalSpherical</b>
that is a rod connecting a spherical and a universal joint. This joint is defined
by <b>1 constraint</b> stating that the distance between the two spherical joints is
constant. Using this joint in a kinematic loop reduces the sizes of
non-linear algebraic equations. For this loop, only one non-linear
algebraic system of equations of order 1 remains.
</p>
<p>
At the UniversalSpherical joint an additional frame_ia fixed to the rod
is present where components can be attached to the connecting rod. In this
example just a coordinate system is attached to visualize frame_ia (coordinate
system on the right in blue color).
</p>
<p>
Another feature is that the length of the connecting rod can be
automatically calculated during <b>initialization</b>. In order to do this,
another initialization condition has to be given. In this example, the
initial value of the distance of the prismatic joint j2 has been fixed
(via the \"Initialization\" menu) and the rod length of joint
\"UniversalSpherical\" is computed during initialization since parameter
<b>computeLength</b> = <b>true</b> is set in the joint parameter
menu. The main advantage is that during initialization no non-linear
system of equation is solved and therefore initialization always works.
To be precise, the following trivial non-linear equation is actually solved
for rodLength:
</p>
<pre>
   rodLength*rodLength = f(angle of revolute joint, distance of prismatic joint)
</pre>
</html>"));
    end Fourbar2;

    model Fourbar_analytic
      "One kinematic loop with four bars (with JointSSP joint; analytic solution of non-linear algebraic loop)"
      extends Modelica_Icons.Example;

      output Modelica_SIunits.Angle j1_phi "angle of revolute joint j1";
      output Modelica_SIunits.Position j2_s "distance of prismatic joint j2";
      output Modelica_SIunits.AngularVelocity j1_w
        "axis speed of revolute joint j1";
      output Modelica_SIunits.Velocity j2_v
        "axis velocity of prismatic joint j2";

      inner Modelica_Mechanics_MultiBody.World world(animateGravity=false)
        annotation (Placement(transformation(extent={{-80,-60},{-60,-40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute j1(
        useAxisFlange=true,
        n={1,0,0},
        stateSelect=StateSelect.always,
        phi(fixed=true),
        w(displayUnit="deg/s",
          start=5.235987755982989,
          fixed=true)) annotation (Placement(transformation(extent={{-54,-40},
                {-34,-20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder b1(r={0,0.5,0.1},
          diameter=0.05) annotation (Placement(transformation(
            origin={-30,-8},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation b3(r={1.2,0,0},
          animation=false) annotation (Placement(transformation(extent={{-32,
                -60},{-12,-40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Assemblies.JointSSP jointSSP(
        rod1Length=sqrt({-1,0.3,0.1}*{-1,0.3,0.1}),
        n_b={1,0,0},
        s_offset=-0.2,
        rRod2_ib={0,0.2,0},
        rod1Color={0,128,255},
        rod2Color={0,128,255},
        checkTotalPower=true) annotation (Placement(transformation(extent={{-20,
                0},{20,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder b2(
        r={0,0.2,0},
        diameter=0.05,
        animation=false) annotation (Placement(transformation(
            origin={50,10},
            extent={{10,-10},{-10,10}},
            rotation=90)));
    equation
      j1_phi = j1.phi;
      j2_s = jointSSP.prismatic.distance;
      j1_w = j1.w;
      j2_v = der(jointSSP.prismatic.distance);
      connect(j1.frame_b, b1.frame_a) annotation (Line(
          points={{-34,-30},{-30,-30},{-30,-18}},
          color={95,95,95},
          thickness=0.5));
      connect(j1.frame_a, world.frame_b) annotation (Line(
          points={{-54,-30},{-60,-30},{-60,-50}},
          color={95,95,95},
          thickness=0.5));
      connect(b3.frame_a, world.frame_b)
        annotation (Line(
          points={{-32,-50},{-60,-50}},
          color={95,95,95},
          thickness=0.5));
      connect(b1.frame_b, jointSSP.frame_a) annotation (Line(
          points={{-30,2},{-30,20},{-20,20}},
          color={95,95,95},
          thickness=0.5));
      connect(b3.frame_b, jointSSP.frame_b) annotation (Line(
          points={{-12,-50},{30,-50},{30,20},{20,20}},
          color={95,95,95},
          thickness=0.5));
      connect(b2.frame_a, jointSSP.frame_ib) annotation (Line(
          points={{50,20},{50,48},{16,48},{16,40}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        experiment(StopTime=5),
        Documentation(info="<html>
<p>
This is a third version of the \"four-bar\" mechanism, see figure:
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Fourbar_analytic.png\" ALT=\"model Examples.Loops.Fourbar_analytic\">

<p>
In this case
the three revolute joints on the left top-side and the two revolute
joints on the right top side have been replaced by the assembly joint
<b>Joints.Assemblies.JointSSP</b>
which consists of two spherical joints and one prismatic joint.
Since JointSSP solves the non-linear constraint equation internally
analytically, no non-linear equation appears any more and a Modelica
translator can transform the system into state space
form without solving a system of equations. For more details, see
<a href=\"modelica://Modelica.Mechanics.MultiBody.UsersGuide.Tutorial.LoopStructures.AnalyticLoopHandling\">
MultiBody.UsersGuide.Tutorial.LoopStructures.AnalyticLoopHandling</a>.
</p>
</html>"));
    end Fourbar_analytic;

    model PlanarLoops_analytic
      "Mechanism with three planar kinematic loops and one degree-of-freedom with analytic loop handling (with JointRRR joints)"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Length rh[3]={0.5,0,0}
        "Position vector from 'lower left' revolute to 'lower right' revolute joint for all the 3 loops";
      parameter Modelica_SIunits.Length rv[3]={0,0.5,0}
        "Position vector from 'lower left' revolute to 'upper left' revolute joint in the first loop";

      parameter Modelica_SIunits.Length r1b[3]={0.1,0.5,0}
        "Position vector from 'lower right' revolute to 'upper right' revolute joint in the first loop";
      final parameter Modelica_SIunits.Length r1a[3]=r1b + rh - rv
        "Position vector from 'upper left' revolute to 'upper right' revolute joint in the first loop";

      parameter Modelica_SIunits.Length r2b[3]={0.1,0.6,0}
        "Position vector from 'lower right' revolute to 'upper right' revolute joint in the second loop";
      final parameter Modelica_SIunits.Length r2a[3]=r2b + rh - r1b
        "Position vector from 'upper left' revolute to 'upper right' revolute joint in the second loop";

      parameter Modelica_SIunits.Length r3b[3]={0,0.55,0}
        "Position vector from 'lower right' revolute to 'upper right' revolute joint in the third loop";
      final parameter Modelica_SIunits.Length r3a[3]=r3b + rh - r2b
        "Position vector from 'upper left' revolute to 'upper right' revolute joint in the third loop";

      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-94,-90},{-74,-70}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Assemblies.JointRRR jointRRR1(
        rRod1_ia=r1a,
        rRod2_ib=r1b,
        checkTotalPower=true) annotation (Placement(transformation(
            origin={-20,0},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Joints.Revolute rev(useAxisFlange=true, w(
            fixed=true)) annotation (Placement(transformation(
            origin={-56,-10},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation rod1(r=rv)
        annotation (Placement(transformation(
            origin={-56,30},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation rod2(r=rh)
        annotation (Placement(transformation(extent={{-50,-60},{-30,-40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body1(
        m=1,
        cylinderColor={155,155,155},
        r_CM=jointRRR1.rRod1_ia/2) annotation (Placement(transformation(
            origin={6,60},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_Rotational.Sources.Position position(useSupport=true)
        annotation (Placement(transformation(extent={{-90,-20},{-70,0}}, rotation=0)));
      Modelica_Blocks.Sources.Sine sine(amplitude=0.7, freqHz=1)
        annotation (Placement(transformation(
            origin={-96,30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Joints.Assemblies.JointRRR jointRRR2(
        rRod1_ia=r2a,
        rRod2_ib=r2b,
        checkTotalPower=true) annotation (Placement(transformation(
            origin={30,0},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation rod3(r=rh)
        annotation (Placement(transformation(extent={{0,-60},{20,-40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body2(
        m=1,
        cylinderColor={155,155,155},
        r_CM=jointRRR2.rRod1_ia/2) annotation (Placement(transformation(
            origin={55,61},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Joints.Assemblies.JointRRR jointRRR3(
        rRod1_ia=r3a,
        rRod2_ib=r3b,
        checkTotalPower=true) annotation (Placement(transformation(
            origin={80,0},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation rod4(r=rh)
        annotation (Placement(transformation(extent={{40,-60},{60,-40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Body body3(
        m=1,
        cylinderColor={155,155,155},
        r_CM=jointRRR3.rRod1_ia/2) annotation (Placement(transformation(
            origin={108,62},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_MultiBody.Parts.Mounting1D mounting1D
        annotation (Placement(transformation(extent={{-100,-50},{-80,-30}})));
    equation
      connect(world.frame_b, rev.frame_a) annotation (Line(
          points={{-74,-80},{-56,-80},{-56,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(rod1.frame_a, rev.frame_b)
        annotation (Line(
          points={{-56,20},{-56,0}},
          color={0,0,0},
          thickness=0.5));
      connect(rod1.frame_b, jointRRR1.frame_a) annotation (Line(
          points={{-56,40},{-56,50},{-20,50},{-20,20}},
          color={95,95,95},
          thickness=0.5));
      connect(rod2.frame_a, world.frame_b)
        annotation (Line(
          points={{-50,-50},{-56,-50},{-56,-80},{-74,-80}},
          color={95,95,95},
          thickness=0.5));
      connect(rod2.frame_b, jointRRR1.frame_b) annotation (Line(
          points={{-30,-50},{-20,-50},{-20,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(jointRRR1.frame_ia, body1.frame_a) annotation (Line(
          points={{0,16},{6,16},{6,50}},
          color={95,95,95},
          thickness=0.5));
      connect(rod3.frame_a, rod2.frame_b)
        annotation (Line(
          points={{0,-50},{-30,-50}},
          color={95,95,95},
          thickness=0.5));
      connect(rod3.frame_b, jointRRR2.frame_b) annotation (Line(
          points={{20,-50},{30,-50},{30,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(jointRRR2.frame_ia, body2.frame_a) annotation (Line(
          points={{50,16},{55,16},{55,51}},
          color={95,95,95},
          thickness=0.5));
      connect(jointRRR1.frame_im, jointRRR2.frame_a) annotation (Line(
          points={{0,0},{12,0},{12,25},{30,25},{30,20}},
          color={95,95,95},
          thickness=0.5));
      connect(rod3.frame_b, rod4.frame_a)
        annotation (Line(
          points={{20,-50},{40,-50}},
          color={95,95,95},
          thickness=0.5));
      connect(rod4.frame_b, jointRRR3.frame_b) annotation (Line(
          points={{60,-50},{80,-50},{80,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(jointRRR2.frame_im, jointRRR3.frame_a) annotation (Line(
          points={{50,0},{60,0},{60,26},{80,26},{80,20}},
          color={95,95,95},
          thickness=0.5));
      connect(jointRRR3.frame_ia, body3.frame_a) annotation (Line(
          points={{100,16},{108,16},{108,52}},
          color={95,95,95},
          thickness=0.5));
      connect(sine.y, position.phi_ref) annotation (Line(points={{-96,19},{-96,-10},
              {-92,-10}}, color={0,0,127}));
      connect(mounting1D.flange_b, position.support) annotation (Line(
          points={{-80,-40},{-80,-20}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(mounting1D.frame_a, world.frame_b) annotation (Line(
          points={{-90,-50},{-90,-57},{-70,-57},{-70,-80},{-74,-80}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(position.flange, rev.axis) annotation (Line(
          points={{-70,-10},{-66,-10}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=5),
        Documentation(info="<html>
<p>
It is demonstrated how the Modelica.Mechanics.MultiBody.Joints.Assemblies.JointRRR joint can be
used to solve the non-linear equations of coupled planar loops analytically.
In the mechanism below no non-linear equation occurs any more from the tool
view, since these equations are solved analytically in the JointRRR joints.
For more details, see
<a href=\"modelica://Modelica.Mechanics.MultiBody.UsersGuide.Tutorial.LoopStructures.AnalyticLoopHandling\">
MultiBody.UsersGuide.Tutorial.LoopStructures.AnalyticLoopHandling</a>.
</p>

<p>
In the following figure the parameter vectors of this example are visualized in the
animation view.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/PlanarLoops2.png\" ALT=\"model Examples.Loops.PlanarLoops2\">
</html>"));
    end PlanarLoops_analytic;

    package Utilities "Utility models for Examples.Loops"
      extends Modelica_Icons.UtilitiesPackage;

      model Cylinder "Cylinder with rod and crank of a combustion engine"
        parameter Boolean animation=true
          "= true, if animation shall be enabled";
        parameter Modelica_SIunits.Length cylinderTopPosition=0.42
          "Length from crank shaft to end of cylinder.";
        parameter Modelica_SIunits.Length pistonLength=0.1 "Length of cylinder";
        parameter Modelica_SIunits.Length rodLength=0.2 "Length of rod";
        parameter Modelica_SIunits.Length crankLength=0.2
          "Length of crank shaft in x direction";
        parameter Modelica_SIunits.Length crankPinOffset=0.1
          "Offset of crank pin from center axis";
        parameter Modelica_SIunits.Length crankPinLength=0.1
          "Offset of crank pin from center axis";
        parameter Modelica_SIunits.Angle cylinderInclination=0
          "Inclination of cylinder";
        parameter Modelica_SIunits.Angle crankAngleOffset=0
          "Offset for crank angle";
        parameter Modelica_SIunits.Length cylinderLength=cylinderTopPosition
             - (pistonLength + rodLength - crankPinOffset)
          "Maximum length of cylinder volume";

        Modelica_Mechanics_MultiBody.Parts.BodyCylinder Piston(
          diameter=0.1,
          r={0,pistonLength,0},
          color={180,180,180},
          animation=animation) annotation (Placement(transformation(
              origin={14.5,69.5},
              extent={{10.5,-30.5},{-10.5,30.5}},
              rotation=270)));
        Modelica_Mechanics_MultiBody.Parts.BodyBox Rod(
          widthDirection={1,0,0},
          height=0.06,
          color={0,0,200},
          width=0.02,
          r_shape={0,-0.02,0},
          r={0,rodLength,0},
          animation=animation) annotation (Placement(transformation(
              origin={14,8},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Joints.Revolute B2(
          n={1,0,0},
          cylinderLength=0.02,
          animation=animation,
          cylinderDiameter=0.055) annotation (Placement(transformation(extent=
                 {{4,25},{24,45}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.BodyBox Crank4(
          height=0.05,
          widthDirection={1,0,0},
          width=0.02,
          r={0,-crankPinOffset,0},
          animation=animation) annotation (Placement(transformation(
              origin={40.5,-74},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Parts.BodyCylinder Crank3(
          r_shape={-0.01,0,0},
          length=0.12,
          diameter=0.03,
          r={crankPinLength,0,0},
          color={180,180,180},
          animation=animation) annotation (Placement(transformation(extent={{
                  4.5,-60},{24.5,-40}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.BodyCylinder Crank1(
          diameter=0.05,
          r_shape={-0.01,0,0},
          length=0.12,
          r={crankLength - crankPinLength,0,0},
          color={180,180,180},
          animation=animation) annotation (Placement(transformation(extent={{
                  -50,-100},{-30,-80}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.BodyBox Crank2(
          height=0.05,
          widthDirection={1,0,0},
          width=0.02,
          r={0,crankPinOffset,0},
          animation=animation) annotation (Placement(transformation(
              origin={-10,-76},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Joints.RevolutePlanarLoopConstraint B1(
          n={1,0,0},
          cylinderLength=0.02,
          animation=animation,
          cylinderDiameter=0.055) annotation (Placement(transformation(extent={
                  {4,-27},{24,-7}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.FixedTranslation Mid(r={
              crankPinLength/2,0,0}, animation=false) annotation (Placement(
              transformation(extent={{-6,-46},{14,-26}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Joints.Prismatic Cylinder(
          useAxisFlange=true,
          s(start=-0.3),
          n={0,-1,0},
          boxWidth=0.02) annotation (Placement(transformation(
              origin={14,99},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Mechanics_MultiBody.Parts.FixedTranslation Mounting(r={
              crankLength,0,0}, animation=false) annotation (Placement(
              transformation(extent={{0,120},{20,140}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.FixedRotation CylinderInclination(
          r={crankLength - crankPinLength/2,0,0},
          n_y={0,cos(cylinderInclination),sin(cylinderInclination)},
          animation=false,
          rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.TwoAxesVectors)
                                                           annotation (
            Placement(transformation(extent={{-60,30},{-40,50}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.FixedRotation CrankAngle1(
          n_y={0,cos(crankAngleOffset),sin(crankAngleOffset)},
          animation=false,
          rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.TwoAxesVectors)
                                                           annotation (
            Placement(transformation(extent={{-90,-100},{-70,-80}}, rotation=
                  0)));
        Modelica_Mechanics_MultiBody.Parts.FixedRotation CrankAngle2(
          n_y={0,cos(-crankAngleOffset),sin(-crankAngleOffset)},
          animation=false,
          rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.TwoAxesVectors)
                                                           annotation (
            Placement(transformation(extent={{60,-100},{80,-80}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.FixedTranslation CylinderTop(r={0,
              cylinderTopPosition,0}, animation=false) annotation (Placement(
              transformation(
              origin={-30,71},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        GasForce gasForce(L=cylinderLength, d=0.1)
          annotation (Placement(transformation(
              origin={50,107},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a cylinder_a annotation (
            Placement(transformation(extent={{-116,114},{-84,146}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a cylinder_b annotation (
            Placement(transformation(extent={{84,114},{116,146}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a crank_a annotation (
            Placement(transformation(extent={{-116,-106},{-84,-74}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a crank_b annotation (
            Placement(transformation(extent={{84,-106},{116,-74}}, rotation=0)));
      equation
        connect(B1.frame_a, Mid.frame_b) annotation (Line(
            points={{4,-17},{-6,-17},{-6,-29},{22,-29},{22,-36},{14,-36}},
            color={95,95,95},
            thickness=0.5));
        connect(Rod.frame_a, B1.frame_b) annotation (Line(
            points={{14,-2},{14,-9},{30,-9},{30,-17},{24,-17}},
            color={95,95,95},
            thickness=0.5));
        connect(Cylinder.frame_b, Piston.frame_b) annotation (Line(
            points={{14,89},{14,80},{14.5,80}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank1.frame_a, CrankAngle1.frame_b)
          annotation (Line(
            points={{-50,-90},{-70,-90}},
            color={95,95,95},
            thickness=0.5));
        connect(B2.frame_a, Piston.frame_a) annotation (Line(
            points={{4,35},{-6,35},{-6,49},{14.5,49},{14.5,59}},
            color={95,95,95},
            thickness=0.5));
        connect(Rod.frame_b, B2.frame_b) annotation (Line(
            points={{14,18},{14,23},{32,23},{32,35},{24,35}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank4.frame_b, CrankAngle2.frame_a) annotation (Line(
            points={{40.5,-84},{40.5,-90},{60,-90}},
            color={95,95,95},
            thickness=0.5));
        connect(Cylinder.support, gasForce.flange_b) annotation (Line(points={{20,103},
                {34,103},{34,117},{50,117}},      color={0,191,0}));
        connect(Cylinder.axis, gasForce.flange_a)
          annotation (Line(points={{20,91},{50,91},{50,97}}, color={0,191,0}));
        connect(CylinderInclination.frame_b, CylinderTop.frame_a)
          annotation (Line(points={{-40,40},{-30,40},{-30,61}}));
        connect(Crank1.frame_b, Crank2.frame_a) annotation (Line(
            points={{-30,-90},{-10,-90},{-10,-86}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank3.frame_b, Crank4.frame_a) annotation (Line(
            points={{24.5,-50},{40.5,-50},{40.5,-64}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank3.frame_a, Crank2.frame_b) annotation (Line(
            points={{4.5,-50},{-10,-50},{-10,-66}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank2.frame_b, Mid.frame_a) annotation (Line(
            points={{-10,-66},{-10,-36},{-6,-36}},
            color={95,95,95},
            thickness=0.5));
        connect(CylinderTop.frame_b, Cylinder.frame_a) annotation (Line(
            points={{-30,81},{-30,120},{14,120},{14,109}},
            color={95,95,95},
            thickness=0.5));
        connect(CylinderInclination.frame_a, cylinder_a) annotation (Line(
            points={{-60,40},{-80,40},{-80,130},{-100,130}},
            color={95,95,95},
            thickness=0.5));
        connect(Mounting.frame_a, cylinder_a) annotation (Line(
            points={{0,130},{-100,130}},
            color={95,95,95},
            thickness=0.5));
        connect(Mounting.frame_b, cylinder_b) annotation (Line(
            points={{20,130},{100,130}},
            color={95,95,95},
            thickness=0.5));
        connect(CrankAngle1.frame_a, crank_a) annotation (Line(
            points={{-90,-90},{-100,-90}},
            color={95,95,95},
            thickness=0.5));
        connect(CrankAngle2.frame_b, crank_b) annotation (Line(
            points={{80,-90},{100,-90}},
            color={95,95,95},
            thickness=0.5));

        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-150},{100,150}}), graphics={
              Polygon(
                points={{-60,-50},{-60,100},{60,100},{60,-52},{100,-52},{100,150},{
                    -100,150},{-100,-50},{-60,-50}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-58,89},{58,13}},
                lineColor={0,0,0},
                fillPattern=FillPattern.VerticalCylinder,
                fillColor={192,192,192}),
              Rectangle(
                extent={{-60,81},{60,75}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-60,67},{60,61}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-60,55},{60,49}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-60,11},{-42,23},{38,23},{56,11},{-60,11}},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Ellipse(
                extent={{-6,41},{2,33}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(extent={{-40,-129},{40,-49}}, lineColor={192,192,192}),
              Line(
                points={{0,-90},{26,-58},{-2,37}},
                color={0,0,0},
                thickness=1),
              Text(
                extent={{-150,-125},{150,-165}},
                textString="%name",
                lineColor={0,0,255}),
              Line(
                points={{-100,-90},{100,-91}},
                color={0,0,0},
                thickness=0.5)}));
      end Cylinder;

      model GasForce "Simple gas force computation for combustion engine"

        extends Modelica_Mechanics_Translational.Interfaces.PartialCompliant;
        parameter Modelica_SIunits.Length L "Length of cylinder";
        parameter Modelica_SIunits.Diameter d "Diameter of cylinder";
        parameter Modelica_SIunits.Volume k0=0.01
          "Volume V = k0 + k1*(1-x), with x = 1 + s_rel/L";
        parameter Modelica_SIunits.Volume k1=1
          "Volume V = k0 + k1*(1-x), with x = 1 + s_rel/L";
        parameter Modelica_SIunits.HeatCapacity k=1 "Gas constant (p*V = k*T)";
        constant Real pi=Modelica_Constants.pi;

        // Only for compatibility reasons
        Real x "Normalized position of cylinder";
        Real y "Normalized relative movement (= -s_rel/L)";
        Modelica_SIunits.Density dens;
        Modelica_SIunits.Conversions.NonSIunits.Pressure_bar press
          "cylinder pressure";
        Modelica_SIunits.Volume V;
        Modelica_SIunits.Temperature T;
        Modelica_SIunits.Velocity v_rel;
      protected
        constant Modelica_SIunits.Mass unitMass=1;
        Modelica_SIunits.Pressure p;
      equation
        y = -s_rel/L;
        x = 1 + s_rel/L;
        v_rel = der(s_rel);

        press = p/1e5;
        p = (if v_rel < 0 then (if x < 0.987 then 177.4132*x^4 - 287.2189*x^3 +
          151.8252*x^2 - 24.9973*x + 2.4 else 2836360*x^4 - 10569296*x^3 + 14761814
          *x^2 - 9158505*x + 2129670) else (if x > 0.93 then -3929704*x^4 +
          14748765*x^3 - 20747000*x^2 + 12964477*x - 3036495 else 145.930*x^4 -
          131.707*x^3 + 17.3438*x^2 + 17.9272*x + 2.4))*1e5;

        f = -1.0E5*press*pi*d^2/4;

        V = k0 + k1*(1 - x);
        dens = unitMass/V;
        (p/1e5)*V = k*T;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-90,50},{90,-50}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-40,50},{-20,-50}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-90,10},{-40,-10}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Polygon(
                points={{60,2},{54,2},{0,2},{0,10},{-20,0},{0,-10},{0,-4},{60,-4},{
                    60,2}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,120},{100,60}},
                textString="%name",
                lineColor={0,0,255})}),                         Diagram(
              coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                  100}}), graphics={
              Rectangle(
                extent={{-90,50},{90,-50}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-40,50},{-20,-50}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-90,10},{-40,-10}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Polygon(
                points={{60,2},{54,2},{0,2},{0,10},{-20,0},{0,-10},{0,-4},{60,-4},{
                    60,2}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,120},{100,60}},
                textString="%name",
                lineColor={0,0,255})}));
      end GasForce;

      model GasForce2 "Rough approximation of gas force in a cylinder"

        extends Modelica_Mechanics_Translational.Interfaces.PartialCompliant;
        parameter Modelica_SIunits.Length L "Length of cylinder";
        parameter Modelica_SIunits.Length d "diameter of cylinder";
        parameter Modelica_SIunits.Volume k0=0.01
          "Volume V = k0 + k1*(1-x), with x = 1 - s_rel/L";
        parameter Modelica_SIunits.Volume k1=1
          "Volume V = k0 + k1*(1-x), with x = 1 - s_rel/L";
        parameter Modelica_SIunits.HeatCapacity k=1 "Gas constant (p*V = k*T)";

      /*
  parameter Real k0=0.01;
  parameter Real k1=1;
  parameter Real k=1;
*/
        constant Real pi=Modelica_Constants.pi;
        Real x "Normalized position of cylinder (= 1 - s_rel/L)";
        Modelica_SIunits.Density dens;
        Modelica_SIunits.AbsolutePressure press "Cylinder pressure";
        Modelica_SIunits.Volume V;
        Modelica_SIunits.Temperature T;
        Modelica_SIunits.Velocity v_rel;

      protected
        Modelica_SIunits.SpecificHeatCapacity R_air=Modelica_Constants.R  /0.0289651159;
      equation
        x = 1 - s_rel/L;
        v_rel = der(s_rel);

        press = 1.0E5*(if v_rel < 0 then (if x < 0.987 then 177.4132*x^4 - 287.2189*x^3 +
          151.8252*x^2 - 24.9973*x + 2.4 else 2836360*x^4 - 10569296*x^3 + 14761814
          *x^2 - 9158505*x + 2129670) else (if x > 0.93 then -3929704*x^4 +
          14748765*x^3 - 20747000*x^2 + 12964477*x - 3036495 else 145.930*x^4 -
          131.707*x^3 + 17.3438*x^2 + 17.9272*x + 2.4));

        f = -press*pi*d^2/4;

        V = k0 + k1*(1 - x);
        dens = press/(R_air*T);
        press*V = k*T;

        assert(s_rel >= -1.e-12, "flange_b.s - flange_a.s (= " + String(s_rel,
          significantDigits=14) + ") >= 0 required for GasForce component.\n" +
          "Most likely, the component has to be flipped.");
        assert(s_rel <= L + 1.e-12, " flange_b.s - flange_a.s (= " + String(s_rel,
          significantDigits=14) + ") <= L (= " + String(L, significantDigits=14) +
          ") required for GasForce component.\n" +
          "Most likely, parameter L is not correct.");
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-90,50},{90,-50}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-13,4},{-16,4},{-65,4},{-65,15},{-90,0},{-65,-15},{-65,-4},
                    {-13,-4},{-13,4}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-135,44},{-99,19}},
                lineColor={128,128,128},
                textString="a"),
              Text(
                extent={{97,40},{133,15}},
                lineColor={128,128,128},
                textString="b"),
              Polygon(
                points={{12,4},{70,4},{65,4},{65,15},{90,0},{65,-15},{65,-4},{12,-4},
                    {12,4}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,105},{150,65}},
                textString="%name",
                lineColor={0,0,255})}),                         Diagram(
              coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-90,50},{90,-50}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{12,5},{70,5},{65,5},{65,16},{90,1},{65,-14},{65,-3},{12,-3},
                    {12,5}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-13,5},{-16,5},{-65,5},{-65,16},{-90,1},{-65,-14},{-65,-3},
                    {-13,-3},{-13,5}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<html>
<p>
The gas force in a cylinder is computed as function of the relative
distance of the two flanges. It is required that s_rel = flange_b.s - flange_a.s
is in the range
</p>
<pre>
    0 &le; s_rel &le; L
</pre>
<p>
where the parameter L is the length
of the cylinder. If this assumption is not fulfilled, an error occurs.
</p>
</html>"));
      end GasForce2;

      model CylinderBase
        "One cylinder with analytic handling of kinematic loop"
        parameter Boolean animation=true
          "= true, if animation shall be enabled";
        parameter Modelica_SIunits.Length cylinderTopPosition=0.42
          "Length from crank shaft to end of cylinder.";
        parameter Modelica_SIunits.Length crankLength=0.14
          "Length of crank shaft in x direction";
        parameter Modelica_SIunits.Length crankPinOffset=0.05
          "Offset of crank pin from center axis";
        parameter Modelica_SIunits.Length crankPinLength=0.1
          "Offset of crank pin from center axis";
        parameter Modelica_SIunits.Conversions.NonSIunits.Angle_deg cylinderInclination=0
          "Inclination of cylinder";
        parameter Modelica_SIunits.Conversions.NonSIunits.Angle_deg crankAngleOffset=0
          "Offset for crank angle";
        parameter Modelica_SIunits.Length pistonLength=0.1 "Length of cylinder"
                               annotation (Dialog(group="Piston"));
        parameter Modelica_SIunits.Length pistonCenterOfMass=pistonLength/2
          "Distance from frame_a to center of mass of piston"
          annotation (Dialog(group="Piston"));
        parameter Modelica_SIunits.Mass pistonMass(min=0) = 6 "Mass of piston"
                           annotation (Dialog(group="Piston"));
        parameter Modelica_SIunits.Inertia pistonInertia_11(min=0) = 0.0088
          "Inertia 11 of piston with respect to center of mass frame, parallel to frame_a"
          annotation (Dialog(group="Piston"));
        parameter Modelica_SIunits.Inertia pistonInertia_22(min=0) = 0.0076
          "Inertia 22 of piston with respect to center of mass frame, parallel to frame_a"
          annotation (Dialog(group="Piston"));
        parameter Modelica_SIunits.Inertia pistonInertia_33(min=0) = 0.0088
          "Inertia 33 of piston with respect to center of mass frame, parallel to frame_a"
          annotation (Dialog(group="Piston"));

        parameter Modelica_SIunits.Length rodLength=0.175 "Length of rod"
          annotation (Dialog(group="Rod"));
        parameter Modelica_SIunits.Length rodCenterOfMass=rodLength/2
          "Distance from frame_a to center of mass of piston"
          annotation (Dialog(group="Rod"));
        parameter Modelica_SIunits.Mass rodMass(min=0) = 1 "Mass of rod"
          annotation (Dialog(group="Rod"));
        parameter Modelica_SIunits.Inertia rodInertia_11(min=0) = 0.006
          "Inertia 11 of rod with respect to center of mass frame, parallel to frame_a"
          annotation (Dialog(group="Rod"));
        parameter Modelica_SIunits.Inertia rodInertia_22(min=0) = 0.0005
          "Inertia 22 of rod with respect to center of mass frame, parallel to frame_a"
          annotation (Dialog(group="Rod"));
        parameter Modelica_SIunits.Inertia rodInertia_33(min=0) = 0.006
          "Inertia 33 of rod with respect to center of mass frame, parallel to frame_a"
          annotation (Dialog(group="Rod"));
        final parameter Modelica_SIunits.Length cylinderLength=
            cylinderTopPosition - (pistonLength + rodLength - crankPinOffset)
          "Maximum length of cylinder volume";

        Modelica_Mechanics_MultiBody.Parts.FixedTranslation Mid(animation=
              false, r={crankLength - crankPinLength/2,crankPinOffset,0})
          annotation (Placement(transformation(extent={{-44,-30},{-24,-10}},
                rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.FixedTranslation Mounting(r={
              crankLength,0,0}, animation=false) annotation (Placement(
              transformation(extent={{-3,90},{17,110}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.FixedRotation CylinderInclination(
          r={crankLength - crankPinLength/2,0,0},
          animation=false,
          rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.RotationAxis,
          n={1,0,0},
          angle=cylinderInclination) annotation (Placement(transformation(
                extent={{-44,30},{-24,50}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.FixedRotation CrankAngle(
          animation=false,
          rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.RotationAxis,
          n={1,0,0},
          angle=crankAngleOffset) annotation (Placement(transformation(extent=
                 {{-84,-80},{-64,-60}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Joints.Assemblies.JointRRP jointRRP(
          n_a={1,0,0},
          n_b={0,-1,0},
          rRod1_ia={0,rodLength,0},
          animation=false,
          rRod2_ib=-{0,pistonLength,0},
          s_offset=-cylinderTopPosition) annotation (Placement(transformation(
              origin={0,12},
              extent={{-20,20},{20,-20}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Parts.BodyShape Rod(
          animation=animation,
          r={0,rodLength,0},
          r_CM={0,rodLength/2,0},
          shapeType=
              "modelica://Modelica/Resources/Data/Shapes/Engine/rod.dxf",
          lengthDirection={1,0,0},
          widthDirection={0,0,-1},
          length=rodLength/1.75,
          width=rodLength/1.75,
          height=rodLength/1.75,
          color={155,155,155},
          extra=1,
          r_shape={0,0,0},
          animateSphere=false,
          m=rodMass,
          I_11=rodInertia_11,
          I_22=rodInertia_22,
          I_33=rodInertia_33) annotation (Placement(transformation(
              origin={49,9},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Parts.BodyShape Piston(
          animation=animation,
          r={0,pistonLength,0},
          r_CM={0,pistonLength/2,0},
          shapeType=
              "modelica://Modelica/Resources/Data/Shapes/Engine/piston.dxf",
          length=0.08,
          width=0.08,
          height=0.08,
          extra=1,
          lengthDirection={1,0,0},
          widthDirection={0,0,-1},
          color={180,180,180},
          animateSphere=false,
          m=pistonMass,
          I_11=pistonInertia_11,
          I_22=pistonInertia_22,
          I_33=pistonInertia_33) annotation (Placement(transformation(
              origin={50,50},
              extent={{10,-10},{-10,10}},
              rotation=270)));
        GasForce gasForce(L=cylinderLength, d=0.1)
          annotation (Placement(transformation(
              origin={-1,70},
              extent={{-10,-10},{10,10}},
              rotation=180)));

        Modelica_Mechanics_MultiBody.Parts.FixedTranslation Crank(animation=
              false, r={crankLength,0,0}) annotation (Placement(
              transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a cylinder_a annotation (
            Placement(transformation(extent={{-116,84},{-84,116}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a cylinder_b annotation (
            Placement(transformation(extent={{84,84},{116,116}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a crank_a annotation (
            Placement(transformation(extent={{-116,-116},{-84,-84}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a crank_b annotation (
            Placement(transformation(extent={{84,-116},{116,-84}}, rotation=0)));
      equation

        connect(jointRRP.frame_ia, Rod.frame_a) annotation (Line(
            points={{20,-4},{49,-4},{49,-1}},
            color={95,95,95},
            thickness=0.5));
        connect(Mid.frame_b, jointRRP.frame_a) annotation (Line(
            points={{-24,-20},{0,-20},{0,-8}},
            color={95,95,95},
            thickness=0.5));
        connect(gasForce.flange_a, jointRRP.axis)
          annotation (Line(points={{9,70},{16,70},{16,32}}, color={0,191,0}));
        connect(jointRRP.bearing, gasForce.flange_b) annotation (Line(points={{8,32},{
                8,52},{-20,52},{-20,70},{-11,70}},  color={0,191,0}));
        connect(jointRRP.frame_ib, Piston.frame_b) annotation (Line(
            points={{20,28},{30,28},{30,70},{50,70},{50,60}},
            color={95,95,95},
            thickness=0.5));
        connect(jointRRP.frame_b, CylinderInclination.frame_b) annotation (Line(
            points={{0,32},{1,32},{1,40},{-24,40}},
            color={95,95,95},
            thickness=0.5));
        connect(CrankAngle.frame_b, Mid.frame_a) annotation (Line(
            points={{-64,-70},{-56,-70},{-56,-20},{-44,-20}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder_a, CylinderInclination.frame_a) annotation (Line(
            points={{-100,100},{-70,100},{-70,40},{-44,40}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder_a, Mounting.frame_a) annotation (Line(
            points={{-100,100},{-3,100}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder_b, Mounting.frame_b) annotation (Line(
            points={{100,100},{17,100}},
            color={95,95,95},
            thickness=0.5));
        connect(CrankAngle.frame_a, crank_a) annotation (Line(
            points={{-84,-70},{-89.5,-70},{-89.5,-100},{-100,-100}},
            color={95,95,95},
            thickness=0.5));
        connect(crank_a, Crank.frame_a) annotation (Line(
            points={{-100,-100},{-10,-100}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank.frame_b, crank_b) annotation (Line(
            points={{10,-100},{100,-100}},
            color={95,95,95},
            thickness=0.5));
        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Polygon(
                points={{-60,-61},{-60,64},{60,64},{60,-61},{100,-61},{100,114},{-100,
                    114},{-100,-61},{-60,-61}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-58,63},{58,-13}},
                lineColor={0,0,0},
                fillPattern=FillPattern.VerticalCylinder,
                fillColor={192,192,192}),
              Rectangle(
                extent={{-60,55},{60,49}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-60,41},{60,35}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-60,29},{60,23}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-57,-13},{-39,-1},{41,-1},{59,-13},{-57,-13}},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Ellipse(
                extent={{-6,15},{2,7}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(extent={{-41,-139},{39,-59}}, lineColor={192,192,192}),
              Line(
                points={{-1,-99},{25,-67},{-2,10}},
                color={0,0,0},
                thickness=1),
              Text(
                extent={{-156,178},{158,116}},
                textString="%name",
                lineColor={0,0,255}),
              Line(
                points={{-100,-99},{100,-100}},
                color={0,0,0},
                thickness=0.5)}));
      end CylinderBase;

      model Cylinder_analytic_CAD
        "One cylinder with analytic handling of kinematic loop and CAD visualization"
        extends CylinderBase;
        Modelica_Mechanics_MultiBody.Visualizers.FixedShape CrankShape(
          animation=animation,
          shapeType=
              "modelica://Modelica/Resources/Data/Shapes/Engine/crank.dxf",
          lengthDirection={1,0,0},
          extra=1,
          widthDirection={0,1,0},
          length=crankPinOffset/0.5,
          width=crankPinOffset/0.5,
          height=crankPinOffset/0.5,
          r_shape={crankLength - crankPinLength/2 - 0.002,0,0}) annotation (
            Placement(transformation(
              origin={-10,-70},
              extent={{10,10},{-10,-10}},
              rotation=180)));
      equation

        connect(CrankShape.frame_a, CrankAngle.frame_b)
          annotation (Line(
            points={{-20,-70},{-64,-70}},
            color={95,95,95},
            thickness=0.5));
      end Cylinder_analytic_CAD;

      model EngineV6_analytic "V6 engine with analytic loop handling"
        parameter Boolean animation=true
          "= true, if animation shall be enabled";
        replaceable model Cylinder = Cylinder_analytic_CAD constrainedby
          CylinderBase "Cylinder type"
             annotation (choices(choice(redeclare model Cylinder =
                Modelica_Mechanics_MultiBody.Examples.Loops.Utilities.Cylinder_analytic_CAD
                "Analytic loop handling + CAD animation"),
                                                         choice(redeclare model
                Cylinder =
                  Modelica_Mechanics_MultiBody.Examples.Loops.Utilities.Cylinder_analytic
                "Analytic loop handling + standard animation")));

        Cylinder cylinder1(
          crankAngleOffset=-30,
          cylinderInclination=-30,
          animation=animation) annotation (Placement(transformation(extent={{-90,
                  -10},{-70,10}}, rotation=0)));
        Cylinder cylinder2(
          crankAngleOffset=90,
          cylinderInclination=30,
          animation=animation) annotation (Placement(transformation(extent={{-60,
                  -10},{-40,10}}, rotation=0)));
        Cylinder cylinder3(
          cylinderInclination=-30,
          animation=animation,
          crankAngleOffset=210)
                               annotation (Placement(transformation(extent={{-30,
                  -10},{-10,10}}, rotation=0)));
        Cylinder cylinder4(
          cylinderInclination=30,
          animation=animation,
          crankAngleOffset=210)
                               annotation (Placement(transformation(extent={{0,-10},
                  {20,10}}, rotation=0)));
        Cylinder cylinder5(
          cylinderInclination=-30,
          animation=animation,
          crankAngleOffset=90) annotation (Placement(transformation(extent={{30,-10},
                  {50,10}}, rotation=0)));
        Cylinder cylinder6(
          cylinderInclination=30,
          animation=animation,
          crankAngleOffset=-30)
                               annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Joints.Revolute bearing(
          useAxisFlange=true,
          n={1,0,0},
          cylinderLength=0.02,
          cylinderDiameter=0.06,
          animation=true) annotation (Placement(transformation(extent={{-90,-40},
                  {-70,-60}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.BodyShape crank(
          animation=false,
          r={0,0,0},
          r_CM={6*0.1/2,0,0},
          I_22=1.e-5,
          I_33=1.e-5,
          m=6*30,
          I_11=0.1) annotation (Placement(transformation(extent={{-50,-60},{-30,
                  -40}}, rotation=0)));
        Modelica_Mechanics_Rotational.Interfaces.Flange_b flange_b
          annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));
        Modelica_Mechanics_MultiBody.Interfaces.Frame_a frame_a annotation (
            Placement(transformation(
              origin={0,-101},
              extent={{-16,-16},{16,16}},
              rotation=270)));
      equation
        connect(cylinder1.crank_b, cylinder2.crank_a)
          annotation (Line(
            points={{-70,-10},{-60,-10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder2.cylinder_a, cylinder1.cylinder_b) annotation (Line(
            points={{-60,10},{-70,10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder3.cylinder_a, cylinder2.cylinder_b) annotation (Line(
            points={{-30,10},{-40,10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder3.crank_a, cylinder2.crank_b)
          annotation (Line(
            points={{-30,-10},{-40,-10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder3.cylinder_b, cylinder4.cylinder_a) annotation (Line(
            points={{-10,10},{0,10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder3.crank_b, cylinder4.crank_a)
          annotation (Line(
            points={{-10,-10},{0,-10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder4.cylinder_b, cylinder5.cylinder_a) annotation (Line(
            points={{20,10},{30,10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder4.crank_b, cylinder5.crank_a)
          annotation (Line(
            points={{20,-10},{30,-10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder5.cylinder_b, cylinder6.cylinder_a) annotation (Line(
            points={{50,10},{60,10}},
            color={95,95,95},
            thickness=0.5));
        connect(cylinder5.crank_b, cylinder6.crank_a)
          annotation (Line(
            points={{50,-10},{60,-10}},
            color={95,95,95},
            thickness=0.5));
        connect(bearing.frame_b, crank.frame_a)
          annotation (Line(
            points={{-70,-50},{-50,-50}},
            color={95,95,95},
            thickness=0.5));
        connect(crank.frame_b, cylinder1.crank_a) annotation (Line(
            points={{-30,-50},{-24,-50},{-24,-26},{-94,-26},{-94,-10},{-90,-10}},
            color={95,95,95},
            thickness=0.5));
        connect(bearing.axis, flange_b) annotation (Line(points={{-80,-60},{-80,-66},
                {90,-66},{90,0},{110,0}}, color={0,0,0}));
        connect(frame_a, bearing.frame_a) annotation (Line(
            points={{0,-101},{0,-81},{-98,-81},{-98,-50},{-90,-50}},
            color={95,95,95},
            thickness=0.5));
        connect(bearing.frame_a, cylinder1.cylinder_a) annotation (Line(
            points={{-90,-50},{-98,-50},{-98,10},{-90,10}},
            color={95,95,95},
            thickness=0.5));
        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,145},{150,105}},
                lineColor={0,0,255},
                textString="%name"),
              Bitmap(extent={{-97,75},{99,-39}}, fileName=
                    "modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/EngineV6_CAD.png")}));
      end EngineV6_analytic;

      partial model Engine1bBase "Model of one cylinder engine with gas force"

        Modelica_Mechanics_MultiBody.Parts.BodyCylinder Piston(diameter=0.1,
            r={0,-0.1,0}) annotation (Placement(transformation(
              origin={120,53},
              extent={{-10,30},{10,-30}},
              rotation=270)));
        Modelica_Mechanics_MultiBody.Parts.BodyBox Rod2(
          widthDirection={1,0,0},
          width=0.02,
          height=0.06,
          color={0,0,200},
          r={0,0.2,0}) annotation (Placement(transformation(
              origin={120,10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Joints.Revolute Bearing(
          useAxisFlange=true,
          n={1,0,0},
          cylinderLength=0.02,
          cylinderDiameter=0.05) annotation (Placement(transformation(extent=
                  {{-50,-80},{-30,-100}}, rotation=0)));
        inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
              transformation(extent={{-90,-100},{-70,-80}}, rotation=0)));
        Modelica_Mechanics_Rotational.Components.Inertia Inertia(
          stateSelect=StateSelect.always,
          J=0.1,
          w(fixed=true),
          phi(
            fixed=true,
            start=0.001,
            displayUnit="rad"))              annotation (Placement(transformation(
                extent={{-68,-120},{-48,-100}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.BodyBox Crank4(
          height=0.05,
          widthDirection={1,0,0},
          width=0.02,
          r={0,-0.1,0}) annotation (Placement(transformation(
              origin={75.5,-75},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Parts.BodyCylinder Crank3(r={0.1,0,0},
            diameter=0.03) annotation (Placement(transformation(extent={{41.5,
                  -71},{61.5,-51}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.BodyCylinder Crank1(diameter=0.05,
            r={0.1,0,0}) annotation (Placement(transformation(extent={{-16,-100},
                  {4,-80}}, rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.BodyBox Crank2(
          height=0.05,
          widthDirection={1,0,0},
          width=0.02,
          r={0,0.1,0}) annotation (Placement(transformation(
              origin={30,-76},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Mechanics_MultiBody.Parts.FixedTranslation Mid(r={0.05,0,0})
          annotation (Placement(transformation(extent={{30,-53},{50,-33}},
                rotation=0)));
        Modelica_Mechanics_MultiBody.Parts.FixedTranslation cylPosition(animation=
             false, r={0.15,0.55,0}) annotation (Placement(transformation(
                extent={{-40.5,100},{-20.5,120}}, rotation=0)));
        Utilities.GasForce2 gasForce(        d=0.1, L=0.35)
          annotation (Placement(transformation(
              origin={119,97},
              extent={{10,-10},{-10,10}},
              rotation=90)));
      equation
        connect(world.frame_b, Bearing.frame_a)
          annotation (Line(
            points={{-70,-90},{-50,-90}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank2.frame_a, Crank1.frame_b) annotation (Line(
            points={{30,-86},{30,-90},{4,-90}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank2.frame_b, Crank3.frame_a) annotation (Line(
            points={{30,-66},{30,-61},{41.5,-61}},
            color={95,95,95},
            thickness=0.5));
        connect(Bearing.frame_b, Crank1.frame_a) annotation (Line(
            points={{-30,-90},{-16,-90}},
            color={95,95,95},
            thickness=0.5));
        connect(world.frame_b, cylPosition.frame_a) annotation (Line(
            points={{-70,-90},{-60,-90},{-60,110},{-40.5,110}},
            color={95,95,95},
            thickness=0.5));
        connect(Crank3.frame_b, Crank4.frame_a) annotation (Line(
            points={{61.5,-61},{75,-61},{75,-65},{75.5,-65}},
            color={95,95,95},
            thickness=0.5));
        connect(Inertia.flange_b, Bearing.axis) annotation (Line(
            points={{-48,-110},{-40,-110},{-40,-100}},
            color={0,0,0}));
        connect(Mid.frame_a, Crank2.frame_b) annotation (Line(
            points={{30,-43},{23,-43},{23,-61},{30,-61},{30,-66}},
            color={95,95,95},
            thickness=0.5));
        annotation (
          Documentation(info="<html>
<p>
This is a model of the mechanical part of one cylinder of an engine.
The combustion is not modelled. The \"inertia\" component at the lower
left part is the output inertia of the engine driving the gearbox.
The angular velocity of the output inertia has a start value of 10 rad/s
in order to demonstrate the movement of the engine.
</p>
<p>
The engine is modeled solely by revolute and prismatic joints.
Since this results in a <b>planar</b> loop there is the well known
difficulty that the cut-forces perpendicular to the loop cannot be
uniquely computed, as well as the cut-torques within the plane.
This ambiguity is resolved by using the option <b>planarCutJoint</b>
in the <b>Advanced</b> menu of one revolute joint in every planar loop
(here: joint B1). This option sets the cut-force in direction of the
axis of rotation, as well as the cut-torques perpendicular to the axis
of rotation at this joint to zero and makes the problem mathematically
well-formed.
</p>
<p>
An animation of this example is shown in the figure below.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Engine.png\" ALT=\"model Examples.Loops.Engine\">
</html>"));
      end Engine1bBase;
    end Utilities;
  annotation ( Documentation(info="<html>
<p>
This package contains different examples to show how
mechanical systems with kinematic loops can be modeled.
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Engine1a\">Engine1a</a><br>
             <a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Engine1b\">Engine1b</a><br>
             <a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Engine1b_analytic\">Engine1b_analytic</a></td>
      <td valign=\"top\"> Model of one cylinder engine (Engine1a: simple, without combustion; Engine1b: with combustion;
           Engine1b_analytic: same as Engine1b but analytic loop handling)<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Engine.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.EngineV6\">EngineV6</a><br>
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.EngineV6_analytic\">EngineV6_analytic</a></td>
      <td valign=\"top\"> V6 engine with 6 cylinders, 6 planar loops and 1 degree-of-freedom.
           Second version with analytic handling of kinematic loops and CAD data
           animation.<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/EngineV6_small.png\">
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/EngineV6_CAD_smaller.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Fourbar1\">Fourbar1</a></td>
      <td valign=\"top\"> One kinematic loop with four bars (with only revolute joints;
           5 non-linear equations)<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Fourbar1_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Fourbar2\">Fourbar2</a></td>
      <td valign=\"top\"> One kinematic loop with four bars (with UniversalSpherical
           joint; 1 non-linear equation) <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Fourbar2_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.Fourbar_analytic\">Fourbar_analytic</a></td>
      <td valign=\"top\"> One kinematic loop with four bars (with JointSSP joint;
           analytic solution of non-linear algebraic loop)  <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/Fourbar_analytic_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Loops.PlanarLoops_analytic\">PlanarLoops_analytic</a></td>
      <td valign=\"top\"> Mechanism with three planar kinematic loops and one
           degree-of-freedom with analytic loop handling
           (with JointRRR joints) <br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Loops/PlanarLoops_small.png\">
      </td>
  </tr>
</table>
</html>"));
  end Loops;

  package Rotational3DEffects
    "Demonstrates the usage of 1-dim. rotational elements with all 3-dim. effects included"
    extends Modelica_Icons.ExamplesPackage;

    model GyroscopicEffects
      "Demonstrates that a cylindrical body can be replaced by Rotor1D model"
      extends Modelica_Icons.Example;

      inner Modelica_Mechanics_MultiBody.World world(driveTrainMechanics3D=true)
        annotation (Placement(transformation(extent={{-100,20},{-80,40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Spherical spherical1(
        angles_fixed=true,
        w_rel_a_fixed=true,
        z_rel_a_fixed=false) annotation (Placement(transformation(extent={{-70,
                20},{-50,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder bodyCylinder1(r={0.25,0,0},
          diameter=0.05) annotation (Placement(transformation(extent={{-44,20},
                {-24,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedRotation fixedRotation1(angle=45,
          n={0,1,0}) annotation (Placement(transformation(extent={{-16,20},{4,
                40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute(
        n={1,0,0},
        a(fixed=false),
        phi(fixed=true),
        w(fixed=true, start=10)) annotation (Placement(transformation(extent={{
                14,20},{34,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(r={-0.1,0,
            0}) annotation (Placement(transformation(extent={{42,20},{62,40}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder bodyCylinder2(diameter=
            0.1, r={0.2,0,0}) annotation (Placement(transformation(extent={{70,
                20},{90,40}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Fixed fixed annotation (Placement(
            transformation(extent={{-100,-40},{-80,-20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Spherical spherical2(
        angles_fixed=true,
        w_rel_a_fixed=true,
        z_rel_a_fixed=false) annotation (Placement(transformation(extent={{-70,
                -40},{-50,-20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder bodyCylinder3(
        r={0.25,0,0},
        diameter=0.05,
        color={0,128,0}) annotation (Placement(transformation(extent={{-44,-40},
                {-24,-20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedRotation fixedRotation2(n={0,1,0},
          angle=45) annotation (Placement(transformation(extent={{-16,-40},{4,-20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation1(r={-0.1,0,
            0}) annotation (Placement(transformation(extent={{24,-40},{44,-20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder bodyCylinder4(
        diameter=0.1,
        r={0.2,0,0},
        color={0,128,0}) annotation (Placement(transformation(extent={{56,-40},
                {76,-20}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Rotor1D rotor1D(
        J=bodyCylinder4.I[1, 1],
        n={1,0,0},
        a(fixed=false),
        phi(fixed=true),
        w(fixed=true, start=10)) annotation (Placement(transformation(extent={{
                28,-70},{48,-50}}, rotation=0)));
    equation
      connect(world.frame_b, spherical1.frame_a) annotation (Line(
          points={{-80,30},{-70,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(spherical1.frame_b, bodyCylinder1.frame_a) annotation (Line(
          points={{-50,30},{-44,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyCylinder1.frame_b, fixedRotation1.frame_a) annotation (Line(
          points={{-24,30},{-16,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation1.frame_b, revolute.frame_a) annotation (Line(
          points={{4,30},{14,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(revolute.frame_b, fixedTranslation.frame_a) annotation (Line(
          points={{34,30},{42,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, bodyCylinder2.frame_a) annotation (Line(
          points={{62,30},{70,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(spherical2.frame_b, bodyCylinder3.frame_a) annotation (Line(
          points={{-50,-30},{-44,-30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyCylinder3.frame_b, fixedRotation2.frame_a) annotation (Line(
          points={{-24,-30},{-16,-30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixed.frame_b, spherical2.frame_a) annotation (Line(
          points={{-80,-30},{-70,-30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation1.frame_b, bodyCylinder4.frame_a) annotation (Line(
          points={{44,-30},{56,-30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation2.frame_b, fixedTranslation1.frame_a) annotation (Line(
          points={{4,-30},{24,-30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rotor1D.frame_a, fixedRotation2.frame_b) annotation (Line(
          points={{38,-70},{38,-76},{10,-76},{10,-30},{4,-30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (experiment(StopTime=5, Tolerance=1e-008), Documentation(info="<html>
<p>
This example consists of a body that is attached to the world system
with a spherical joint. On this body, a \"rotor\", i.e., a body with rotational
symmetry is present. Two kinds of models are shown:
</p>

<ul>
<li> In the upper part of the diagram layer, only multi-body components are used.</li>
<li> In the lower part of the diagram layer, the same model is implemented,
     but by a different modeling of the cylindrical body:
     The cylindrical body is included, but it is rigidly attached to its mount.
     This part takes into account the movement of the center of mass and of
     the inertia tensor of the cylindrical body. Note, since the cylindrical body
     has rotational symmetry, its center of mass and its inertia tensor is independent
     of the angle of the inertia and can therefore be rigidly attached to its mount.
     Additionally, with a \"MultiBody.Parts.Rotor1D\" model, a primarily 1-dim.
     inertia is included that takes into account the additional effects when the
     cylindrical body is moving relatively to its mounts</li>
</ul>

<p>
The simulation reveals that both the kinematic movement and the reaction forces on the
environment (object \"world\" and \"fixed\" respectively) are identical for both models.
</p>

<p>
A typical usage scenario is to model a complete drive train of a vehicle, including
the automatic gearbox, with elements of the \"Mechanics.Rotational\" library, but using
the \"Rotor1D\" model instead of the \"Rotational.Components.Inertia\" component.
This drive train model can be mounted on a 3-dim. multi-body model of the vehicle.
Additionally, one rigid body has to be fixed to the vehicle that has the mass, center
of mass and inertia tensor of the complete drive train. Both models together, give
exactly the same effect, as if every part of the drive train would have been modelled
solely with mult-body components. One benefit of this modeling is that the simulation
is much faster.
</p>

</html>"));
    end GyroscopicEffects;

    model ActuatedDrive
      extends Modelica_Icons.Example;
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyCylinder(
        r={0.5,0,0},
        m=0,
        I_11=2,
        I_22=0,
        I_33=0,
        shapeType="cylinder",
        width=0.1,
        animateSphere=false,
        r_shape={0.1,0,0},
        r_CM={0,0,0}) annotation (Placement(transformation(extent={{8,0},{28,20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute(
        n={1,0,0},
        a(fixed=false),
        phi(fixed=true),
        w(fixed=true)) annotation (Placement(transformation(extent={{-26,0},{-6,
                20}}, rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world(g=0, driveTrainMechanics3D
          =true) annotation (Placement(transformation(extent={{-60,0},{-40,20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Torque torque annotation (Placement(
            transformation(extent={{8,30},{28,50}}, rotation=0)));
      Modelica_Blocks.Sources.Sine sine[3](amplitude={1,0,0}, freqHz={1,1,1})
        annotation (Placement(transformation(extent={{-80,60},{-60,80}},
              rotation=0)));
      inner Modelica_Mechanics_MultiBody.Parts.Fixed fixed annotation (
          Placement(transformation(extent={{-62,-90},{-42,-70}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Rotor1D rotor1D(
        J=2,
        phi(fixed=true),
        w(fixed=true)) annotation (Placement(transformation(extent={{0,-40},{20,
                -20}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Torque torque1(useSupport=true)
        annotation (Placement(transformation(extent={{-32,-40},{-12,-20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Mounting1D mounting1D annotation (
          Placement(transformation(extent={{-46,-60},{-26,-40}}, rotation=0)));
    equation
      connect(world.frame_b, revolute.frame_a) annotation (Line(
          points={{-40,10},{-26,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(revolute.frame_b, bodyCylinder.frame_a) annotation (Line(
          points={{-6,10},{8,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque.frame_b, bodyCylinder.frame_b) annotation (Line(
          points={{28,40},{38,40},{38,10},{28,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque.frame_resolve, world.frame_b) annotation (Line(
          points={{22,50},{22,64},{-30,64},{-30,10},{-40,10}},
          color={95,95,95},
          pattern=LinePattern.Dot,
          smooth=Smooth.None));
      connect(torque.frame_a, world.frame_b) annotation (Line(
          points={{8,40},{-30,40},{-30,10},{-40,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sine.y, torque.torque) annotation (Line(
          points={{-59,70},{12,70},{12,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(fixed.frame_b, rotor1D.frame_a) annotation (Line(
          points={{-42,-80},{10,-80},{10,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque1.flange, rotor1D.flange_a) annotation (Line(
          points={{-12,-30},{0,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(mounting1D.flange_b, torque1.support) annotation (Line(
          points={{-26,-50},{-22,-50},{-22,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(mounting1D.frame_a, fixed.frame_b) annotation (Line(
          points={{-36,-60},{-36,-80},{-42,-80}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sine[1].y, torque1.tau) annotation (Line(
          points={{-59,70},{-50,70},{-50,40},{-72,40},{-72,-30},{-34,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.1));
    end ActuatedDrive;

    model MovingActuatedDrive
      extends Modelica_Icons.Example;
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyCylinder(
        r={0.5,0,0},
        m=0,
        I_11=2,
        I_22=0,
        I_33=0,
        shapeType="cylinder",
        width=0.1,
        animateSphere=false,
        r_shape={0.1,0,0},
        r_CM={0,0,0}) annotation (Placement(transformation(extent={{50,10},{70,
                30}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute revolute(
        n={1,0,0},
        a(fixed=false),
        phi(fixed=true),
        w(fixed=true)) annotation (Placement(transformation(extent={{16,10},{36,
                30}}, rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world(g=0, driveTrainMechanics3D
          =true) annotation (Placement(transformation(extent={{-84,10},{-64,30}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Torque torque annotation (Placement(
            transformation(extent={{50,40},{70,60}}, rotation=0)));
      Modelica_Blocks.Sources.Sine sine1[3](amplitude={1,0,0}, freqHz={1,1,1})
        annotation (Placement(transformation(extent={{16,70},{36,90}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Rotor1D rotor1D(
        J=2,
        phi(fixed=true),
        w(fixed=true)) annotation (Placement(transformation(extent={{50,-36},{
                70,-16}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Torque torque1(useSupport=true)
        annotation (Placement(transformation(extent={{18,-36},{38,-16}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Mounting1D mounting1D annotation (
          Placement(transformation(extent={{4,-56},{24,-36}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute r1(useAxisFlange=true, n={0,
            1,0}) annotation (Placement(transformation(extent={{-32,10},{-12,30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Position position1(useSupport=
            true, w(fixed=true)) annotation (Placement(transformation(extent=
                {{-46,60},{-26,80}}, rotation=0)));
      Modelica_Blocks.Sources.Sine sine2(amplitude=2, freqHz=1) annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Mounting1D mounting1D1(n={0,1,0})
        annotation (Placement(transformation(extent={{-60,34},{-40,54}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Joints.Revolute r2(useAxisFlange=true, n={0,
            1,0}) annotation (Placement(transformation(extent={{-38,-80},{-18,-60}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Position position2(useSupport=
            true, w(fixed=true)) annotation (Placement(transformation(extent=
                {{-52,-30},{-32,-10}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Mounting1D mounting1D2(n={0,1,0})
        annotation (Placement(transformation(extent={{-66,-56},{-46,-36}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Fixed fixed annotation (Placement(
            transformation(extent={{-86,-80},{-66,-60}}, rotation=0)));
    equation
      connect(revolute.frame_b, bodyCylinder.frame_a) annotation (Line(
          points={{36,20},{50,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque.frame_b, bodyCylinder.frame_b) annotation (Line(
          points={{70,50},{80,50},{80,20},{70,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sine1.y, torque.torque) annotation (Line(
          points={{37,80},{54,80},{54,62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(torque1.flange, rotor1D.flange_a) annotation (Line(
          points={{38,-26},{50,-26}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(mounting1D.flange_b, torque1.support) annotation (Line(
          points={{24,-46},{28,-46},{28,-36}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(r1.frame_a, world.frame_b) annotation (Line(
          points={{-32,20},{-64,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(position1.flange, r1.axis) annotation (Line(
          points={{-26,70},{-22,70},{-22,30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(position1.support, mounting1D1.flange_b) annotation (Line(
          points={{-36,60},{-36,44},{-40,44}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(mounting1D1.frame_a, world.frame_b) annotation (Line(
          points={{-50,34},{-50,20},{-64,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sine2.y, position1.phi_ref) annotation (Line(
          points={{-79,70},{-48,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(r1.frame_b, revolute.frame_a) annotation (Line(
          points={{-12,20},{16,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque.frame_resolve, revolute.frame_a) annotation (Line(
          points={{64,60},{8,60},{8,20},{16,20}},
          color={95,95,95},
          pattern=LinePattern.Dot,
          smooth=Smooth.None));
      connect(torque.frame_a, revolute.frame_a) annotation (Line(
          points={{50,50},{8,50},{8,20},{16,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(position2.flange, r2.axis) annotation (Line(
          points={{-32,-20},{-28,-20},{-28,-60}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(position2.support, mounting1D2.flange_b) annotation (Line(
          points={{-42,-30},{-42,-46},{-46,-46}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(fixed.frame_b, r2.frame_a) annotation (Line(
          points={{-66,-70},{-38,-70}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixed.frame_b, mounting1D2.frame_a) annotation (Line(
          points={{-66,-70},{-56,-70},{-56,-56}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sine2.y, position2.phi_ref) annotation (Line(
          points={{-79,70},{-70,70},{-70,46},{-92,46},{-92,-20},{-54,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(r2.frame_b, rotor1D.frame_a) annotation (Line(
          points={{-18,-70},{60,-70},{60,-36}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(r2.frame_b, mounting1D.frame_a) annotation (Line(
          points={{-18,-70},{14,-70},{14,-56}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sine1[1].y, torque1.tau) annotation (Line(
          points={{37,80},{92,80},{92,-10},{0,-10},{0,-26},{16,-26}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.1),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        Documentation(info="<html>
<p>
This model demonstrates how a moving drive train modelled with 3-dim. multi-body elements
(revolute, bodyCylinder) can alternatively be modeled with component rotor1D to speed up
simulation. The movement of the two systems is identical and also the cut-torques in the
various frames (such as: r1.frame_b.t and r2.frame_b.t).
</p>

<p>
The driving joints (r1, r2) with rotation axis {0,1,0} are modelled to be driven by a motor torque
along the {1,0,0} axis. Basically, this means that an idealized bevel gear is used to drive the
axes of the revolute joints.
</p>
</html>"));
    end MovingActuatedDrive;

    model GearConstraint
      extends Modelica_Icons.Example;
      Modelica_Mechanics_MultiBody.Joints.GearConstraint gearConstraint(
        ratio=10,
        phi_b(fixed=true),
        w_b(fixed=true)) annotation (Placement(transformation(extent={{34,40},{
                54,60}}, rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world(driveTrainMechanics3D=true,
          g=0) annotation (Placement(transformation(extent={{-62,10},{-42,30}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder cyl1(
        diameter=0.1,
        color={0,128,0},
        r={0.4,0,0}) annotation (Placement(transformation(extent={{2,40},{22,60}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.BodyCylinder cyl2(r={0.4,0,0},
          diameter=0.2) annotation (Placement(transformation(extent={{70,40},{
                90,60}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Torque torque1 annotation (Placement(
            transformation(extent={{-26,40},{-6,60}}, rotation=0)));
      Modelica_Blocks.Sources.Sine sine[3](amplitude={2,0,0}, freqHz={1,1,1})
        annotation (Placement(transformation(extent={{-100,60},{-80,80}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Fixed fixed annotation (Placement(
            transformation(extent={{-48,-90},{-28,-70}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia inertia1(
        J=cyl1.I[1, 1],
        a(fixed=false),
        phi(fixed=true, start=0),
        w(fixed=true, start=0)) annotation (Placement(transformation(extent={
                {-20,-40},{0,-20}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.IdealGear idealGear(ratio=10,
          useSupport=true) annotation (Placement(transformation(extent={{12,-40},
                {32,-20}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia inertia2(J=cyl2.I[1, 1])
        annotation (Placement(transformation(extent={{44,-40},{64,-20}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Torque torque2(useSupport=true)
        annotation (Placement(transformation(extent={{-48,-40},{-28,-20}},
              rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.Mounting1D mounting1D annotation (
          Placement(transformation(extent={{-20,-70},{0,-50}}, rotation=0)));
    equation
      connect(world.frame_b, gearConstraint.bearing) annotation (Line(
          points={{-42,20},{44,20},{44,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cyl1.frame_b, gearConstraint.frame_a) annotation (Line(
          points={{22,50},{34,50}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(gearConstraint.frame_b, cyl2.frame_a) annotation (Line(
          points={{54,50},{70,50}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque1.frame_b, cyl1.frame_a) annotation (Line(
          points={{-6,50},{2,50}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque1.frame_a, world.frame_b) annotation (Line(
          points={{-26,50},{-36,50},{-36,20},{-42,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sine.y, torque1.torque) annotation (Line(
          points={{-79,70},{-22,70},{-22,62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inertia1.flange_b, idealGear.flange_a) annotation (Line(
          points={{0,-30},{12,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(idealGear.flange_b, inertia2.flange_a) annotation (Line(
          points={{32,-30},{44,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torque2.flange, inertia1.flange_a) annotation (Line(
          points={{-28,-30},{-20,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(sine[1].y, torque2.tau) annotation (Line(
          points={{-79,70},{-72,70},{-72,-30},{-50,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mounting1D.flange_b, idealGear.support) annotation (Line(
          points={{0,-60},{22,-60},{22,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(mounting1D.flange_b, torque2.support) annotation (Line(
          points={{0,-60},{4,-60},{4,-48},{-38,-48},{-38,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(fixed.frame_b, mounting1D.frame_a) annotation (Line(
          points={{-28,-80},{-10,-80},{-10,-70}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (experiment(StopTime=5));
    end GearConstraint;
    annotation (Documentation(info="<html>
<p>
This library demonstrates the usage of elements of the Mechanics.Rotational library
by taking into account all 3-dim. effects. The reason for this type of modeling is
to speedup the simulation drastically. This is possible if moving bodies have
rotational symmetry. A typical application area are drive trains, driving joints of
a multi-body system.
</p>
</html>"));
  end Rotational3DEffects;

  package Constraints "Examples with constraint joints"
  extends Modelica_Icons.ExamplesPackage;

    model PrismaticConstraint
      "Body attached by one spring and two prismatic joints or constrained to environment"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "True, if animation shall be enabled";

      Modelica_Mechanics_MultiBody.Joints.Prismatic jointPrismatic_x(
        stateSelect=StateSelect.never,
        n={1,0,0},
        s(fixed=true),
        v(fixed=true))
        annotation (Placement(transformation(extent={{80,-30},{60,-10}})));
      Modelica_Mechanics_MultiBody.Joints.Prismatic jointPrismatic_y(
        stateSelect=StateSelect.never,
        n={0,1,0},
        s(fixed=true),
        v(fixed=true))
        annotation (Placement(transformation(extent={{40,-30},{20,-10}})));
      Modelica_Mechanics_MultiBody.Joints.Constraints.Prismatic constraint(x_locked=
            false, y_locked=false)
        annotation (Placement(transformation(extent={{60,10},{40,30}})));
      Modelica_Mechanics_MultiBody.Sensors.RelativeSensor sensorConstraintRelative(
        resolveInFrame=Modelica_Mechanics_MultiBody.Types.ResolveInFrameAB.frame_a,
        get_r_rel=true,
        get_a_rel=false,
        get_angles=true)
        annotation (Placement(transformation(extent={{60,60},{40,40}})));
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyOfJoint(
        m=1,
        I_11=1,
        I_22=1,
        I_33=1,
        r={0.4,0,0},
        r_CM={0.2,0,0},
        width=0.05,
        r_0(start={0.2,-0.5,0.1}, each fixed=false),
        v_0(each fixed=false),
        angles_fixed=false,
        w_0_fixed=false,
        angles_start={0.17453292519943,0.95993108859688,1.1868238913561},
        final color={0,0,255}) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-10,-20})));
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyOfConstraint(
        I_11=1,
        I_22=1,
        I_33=1,
        width=0.05,
        w_0_fixed=false,
        final color={0,128,0},
        r=bodyOfJoint.r,
        r_CM=bodyOfJoint.r_CM,
        m=bodyOfJoint.m,
        angles_fixed=false,
        angles_start={0.17453292519943,0.95993108859688,1.1868238913561})
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-10,20})));
      Modelica_Mechanics_MultiBody.Forces.Spring springOfJoint(
        c=20,
        s_unstretched=0,
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5) annotation (Placement(transformation(
            origin={-50,-20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring springOfConstraint(
        width=0.1,
        coilWidth=0.005,
        c=springOfJoint.c,
        s_unstretched=springOfJoint.s_unstretched,
        numberOfWindings=springOfJoint.numberOfWindings) annotation (
          Placement(transformation(
            origin={-50,20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-100,-100},{-80,-80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedRotation fixedRotation(
        r={0.2,-0.3,0.2},
        rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.PlanarRotationSequence,
        angles={10,55,68}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={90,-50})));

      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(animation=
           false, r={0.8,0,0.3}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-70,-50})));
      Modelica_Mechanics_MultiBody.Joints.FreeMotionScalarInit freeMotionScalarInit(
        use_r=true,
        use_v=true,
        v_rel_a_2(fixed=true, start=0),
        v_rel_a_3(fixed=true, start=0),
        use_w=true,
        w_rel_b_1(fixed=false),
        w_rel_b_2(fixed=false),
        w_rel_b_3(fixed=false),
        angle_d_3(fixed=false),
        r_rel_a_2(fixed=true, start=0),
        r_rel_a_3(fixed=true, start=0),
        angle_1(fixed=false))
        annotation (Placement(transformation(extent={{40,60},{20,80}})));
    equation
      connect(fixedTranslation.frame_a, world.frame_b)
        annotation (Line(
          points={{-70,-60},{-70,-90},{-80,-90}},
          color={95,95,95},
          thickness=0.5));
      connect(bodyOfConstraint.frame_b, springOfConstraint.frame_b)
                                             annotation (Line(
          points={{-20,20},{-40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedRotation.frame_a) annotation (Line(
          points={{-80,-90},{90,-90},{90,-60}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, constraint.frame_a) annotation (Line(
          points={{90,-40},{90,20},{60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(constraint.frame_a,sensorConstraintRelative. frame_a)
                                                          annotation (Line(
          points={{60,20},{70,20},{70,50},{60,50}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfJoint.frame_b, springOfJoint.frame_b)
                                             annotation (Line(
          points={{-20,-20},{-40,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sensorConstraintRelative.frame_b, constraint.frame_b) annotation (
          Line(
          points={{40,50},{30,50},{30,20},{40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, springOfJoint.frame_a)
                                                  annotation (Line(
          points={{-70,-40},{-70,-20},{-60,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, springOfConstraint.frame_a)
                                                       annotation (Line(
          points={{-70,-40},{-70,20},{-60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfConstraint.frame_a, constraint.frame_b) annotation (Line(
          points={{0,20},{40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(jointPrismatic_x.frame_b, jointPrismatic_y.frame_a)
                                                      annotation (Line(
          points={{60,-20},{40,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, jointPrismatic_x.frame_a) annotation (Line(
          points={{90,-40},{90,-20},{80,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfJoint.frame_a, jointPrismatic_y.frame_b) annotation (Line(
          points={{0,-20},{20,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotionScalarInit.frame_a, fixedRotation.frame_b) annotation (
          Line(
          points={{40,70},{90,70},{90,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotionScalarInit.frame_b, bodyOfConstraint.frame_a) annotation (
         Line(
          points={{20,70},{10,70},{10,20},{0,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=10),
        Documentation(info="<html>
<p>This example demonstrates the functionality of <b>constraint</b> representing <b>prismatic joint</b>. Each of two bodies is at one of its end connected by spring to the world. The other end is also connected to the world either by two serial coupled prismatic joints or by appropriate constraint. Therefore, the body can only perform translation in two directions specified in the two joints depending on working forces.</p>
<p><b>Simulation results</b> </p>
<p>After simulating the model, see the animation of the multibody system and compare movement of body connected by joint (blue colored) with movement of that one connected by constraint (of green color). Additionally, the outputs from <code>sensorConstraintRelative</code> depict both position and angle deviations in the constraining element.</p>
</html>"));
    end PrismaticConstraint;

    model RevoluteConstraint
      "Body attached by one spring and revolute joint or constrained to environment"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      Modelica_Mechanics_MultiBody.Joints.Revolute joint(
        stateSelect=StateSelect.never,
        n={0,1,0},
        phi(fixed=true),
        w(fixed=true))
        annotation (Placement(transformation(extent={{60,-30},{40,-10}})));
      Modelica_Mechanics_MultiBody.Joints.Constraints.Revolute constraint(n=joint.n)
        annotation (Placement(transformation(extent={{60,10},{40,30}})));
      Modelica_Mechanics_MultiBody.Sensors.RelativeSensor sensorConstraintRelative(
        resolveInFrame=Modelica_Mechanics_MultiBody.Types.ResolveInFrameAB.frame_a,
        get_r_rel=true,
        get_a_rel=false,
        get_angles=true)
        annotation (Placement(transformation(extent={{60,60},{40,40}})));
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyOfJoint(
        m=1,
        I_11=1,
        I_22=1,
        I_33=1,
        r={0.4,0,0},
        r_CM={0.2,0,0},
        width=0.05,
        r_0(start={0.2,-0.5,0.1}, each fixed=false),
        v_0(each fixed=false),
        angles_fixed=false,
        w_0_fixed=false,
        angles_start={0.17453292519943,0.95993108859688,1.1868238913561},
        final color={0,0,255}) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-10,-20})));
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyOfConstraint(
        I_11=1,
        I_22=1,
        I_33=1,
        width=0.05,
        r_0(start={0.2,-0.5,0.1}, each fixed=false),
        v_0(each fixed=false),
        angles_fixed=false,
        w_0_fixed=false,
        final color={0,128,0},
        r=bodyOfJoint.r,
        r_CM=bodyOfJoint.r_CM,
        m=bodyOfJoint.m,
        angles_start={0.17453292519943,0.95993108859688,1.1868238913561})
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-10,20})));
      Modelica_Mechanics_MultiBody.Forces.Spring springOfJoint(
        c=20,
        s_unstretched=0,
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5) annotation (Placement(transformation(
            origin={-50,-20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring springOfConstraint(
        width=0.1,
        coilWidth=0.005,
        c=springOfJoint.c,
        s_unstretched=springOfJoint.s_unstretched,
        numberOfWindings=springOfJoint.numberOfWindings) annotation (
          Placement(transformation(
            origin={-50,20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-100,-100},{-80,-80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedRotation fixedRotation(
        r={0.2,-0.3,0.2},
        rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.PlanarRotationSequence,
        angles={10,55,68}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={80,-50})));

      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(animation=
           false, r={0.8,0,0.3}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-70,-50})));
      Modelica_Mechanics_MultiBody.Joints.FreeMotionScalarInit freeMotionScalarInit(
        use_angle=true,
        use_angle_d=true,
        angle_2(start=0, fixed=true),
        angle_d_2(start=0, fixed=true))
        annotation (Placement(transformation(extent={{40,60},{20,80}})));
    equation
      connect(fixedTranslation.frame_a, world.frame_b)
        annotation (Line(
          points={{-70,-60},{-70,-90},{-80,-90}},
          color={95,95,95},
          thickness=0.5));
      connect(bodyOfConstraint.frame_b, springOfConstraint.frame_b)
                                             annotation (Line(
          points={{-20,20},{-40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedRotation.frame_a) annotation (Line(
          points={{-80,-90},{80,-90},{80,-60}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, constraint.frame_a) annotation (Line(
          points={{80,-40},{80,20},{60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(constraint.frame_a,sensorConstraintRelative. frame_a)
                                                          annotation (Line(
          points={{60,20},{80,20},{80,50},{60,50}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfJoint.frame_b, springOfJoint.frame_b)
                                             annotation (Line(
          points={{-20,-20},{-40,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(joint.frame_b, bodyOfJoint.frame_a)                annotation (
          Line(
          points={{40,-20},{0,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sensorConstraintRelative.frame_b, constraint.frame_b) annotation (
          Line(
          points={{40,50},{30,50},{30,20},{40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, springOfJoint.frame_a)
                                                  annotation (Line(
          points={{-70,-40},{-70,-20},{-60,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, springOfConstraint.frame_a)
                                                       annotation (Line(
          points={{-70,-40},{-70,20},{-60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfConstraint.frame_a, constraint.frame_b) annotation (Line(
          points={{0,20},{40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(joint.frame_a, fixedRotation.frame_b)  annotation (Line(
          points={{60,-20},{80,-20},{80,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotionScalarInit.frame_a, fixedRotation.frame_b) annotation (
          Line(
          points={{40,70},{80,70},{80,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfConstraint.frame_a, freeMotionScalarInit.frame_b) annotation (
         Line(
          points={{0,20},{8,20},{8,70},{20,70}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=10),
        Documentation(info="<html>
<p>This example demonstrates the functionality of <b>constraint</b> representing <b>revolute joint</b>. Each of two bodies is at one of its end connected by spring to the world. The other end is also connected to the world either by revolute joint or by appropriate constraint. Therefore, the body can only perform rotation about the revolute axis depending on working forces.</p>
<p><b>Simulation results</b> </p>
<p>After simulating the model, see the animation of the multibody system and compare movement of body connected by joint (blue colored) with movement of that one connected by constraint (of green color). Additionally, the outputs from <code>sensorConstraintRelative</code> depict both position and angle deviations in the constraining element.</p>
</html>"));
    end RevoluteConstraint;

    model SphericalConstraint
      "Body attached by one spring and spherical joint or constrained to environment"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      Modelica_Mechanics_MultiBody.Joints.Spherical joint(
        angles_fixed=true,
        w_rel_a_fixed=true,
        enforceStates=true)
        annotation (Placement(transformation(extent={{60,-30},{40,-10}})));
      Modelica_Mechanics_MultiBody.Joints.Constraints.Spherical constraint
        annotation (Placement(transformation(extent={{60,10},{40,30}})));
      Modelica_Mechanics_MultiBody.Sensors.RelativeSensor sensorConstraintRelative(
        resolveInFrame=Modelica_Mechanics_MultiBody.Types.ResolveInFrameAB.frame_a,
        get_r_rel=true,
        get_a_rel=false,
        get_angles=true)
        annotation (Placement(transformation(extent={{60,60},{40,40}})));
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyOfJoint(
        m=1,
        I_11=1,
        I_22=1,
        I_33=1,
        r={0.4,0,0},
        r_CM={0.2,0,0},
        width=0.05,
        r_0(start={0.2,-0.5,0.1}, each fixed=false),
        v_0(each fixed=false),
        angles_fixed=false,
        w_0_fixed=false,
        angles_start={0.17453292519943,0.95993108859688,1.1868238913561},
        final color={0,0,255}) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-10,-20})));
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyOfConstraint(
        I_11=1,
        I_22=1,
        I_33=1,
        width=0.05,
        r_0(start={0.2,-0.5,0.1}, each fixed=false),
        v_0(each fixed=false),
        angles_fixed=false,
        w_0_fixed=false,
        final color={0,128,0},
        r=bodyOfJoint.r,
        r_CM=bodyOfJoint.r_CM,
        m=bodyOfJoint.m,
        angles_start={0.17453292519943,0.95993108859688,1.1868238913561})
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-10,20})));
      Modelica_Mechanics_MultiBody.Forces.Spring springOfJoint(
        c=20,
        s_unstretched=0,
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5) annotation (Placement(transformation(
            origin={-50,-20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring springOfConstraint(
        width=0.1,
        coilWidth=0.005,
        c=springOfJoint.c,
        s_unstretched=springOfJoint.s_unstretched,
        numberOfWindings=springOfJoint.numberOfWindings) annotation (
          Placement(transformation(
            origin={-50,20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-100,-100},{-80,-80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedRotation fixedRotation(
        r={0.2,-0.3,0.2},
        rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.PlanarRotationSequence,
        angles={10,55,68}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={80,-50})));

      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(animation=
           false, r={0.8,0,0.3}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-70,-50})));
      Modelica_Mechanics_MultiBody.Joints.FreeMotionScalarInit freeMotionScalarInit(
        use_angle=true,
        use_angle_d=true,
        angle_1(fixed=true),
        angle_2(fixed=true),
        angle_3(fixed=true),
        angle_d_1(fixed=true),
        angle_d_2(fixed=true),
        angle_d_3(fixed=true))
        annotation (Placement(transformation(extent={{38,60},{18,80}})));
    equation
      connect(fixedTranslation.frame_a, world.frame_b)
        annotation (Line(
          points={{-70,-60},{-70,-90},{-80,-90}},
          color={95,95,95},
          thickness=0.5));
      connect(bodyOfConstraint.frame_b, springOfConstraint.frame_b)
                                             annotation (Line(
          points={{-20,20},{-40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedRotation.frame_a) annotation (Line(
          points={{-80,-90},{80,-90},{80,-60}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, constraint.frame_a) annotation (Line(
          points={{80,-40},{80,20},{60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(constraint.frame_a,sensorConstraintRelative. frame_a)
                                                          annotation (Line(
          points={{60,20},{80,20},{80,50},{60,50}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfJoint.frame_b, springOfJoint.frame_b)
                                             annotation (Line(
          points={{-20,-20},{-40,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(joint.frame_b, bodyOfJoint.frame_a)                annotation (
          Line(
          points={{40,-20},{0,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sensorConstraintRelative.frame_b, constraint.frame_b) annotation (
          Line(
          points={{40,50},{30,50},{30,20},{40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, springOfJoint.frame_a)
                                                  annotation (Line(
          points={{-70,-40},{-70,-20},{-60,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, springOfConstraint.frame_a)
                                                       annotation (Line(
          points={{-70,-40},{-70,20},{-60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfConstraint.frame_a, constraint.frame_b) annotation (Line(
          points={{0,20},{40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(joint.frame_a, fixedRotation.frame_b)  annotation (Line(
          points={{60,-20},{80,-20},{80,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfConstraint.frame_a, freeMotionScalarInit.frame_b) annotation (
         Line(
          points={{0,20},{8,20},{8,70},{18,70}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotionScalarInit.frame_a, fixedRotation.frame_b) annotation (
          Line(
          points={{38,70},{80,70},{80,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=10),
        Documentation(info="<html>
<p>This example demonstrates the functionality of <b>constraint</b> representing <b>spherical joint</b>. Each of two bodies is at one of its end connected by spring to the world. The other end is also connected to the world either by spherical joint or by appropriate constraint. Therefore, the body can only perform spherical movement depending on working forces.</p>
<p><b>Simulation results</b> </p>
<p>After simulating the model, see the animation of the multibody system and compare movement of body connected by joint (blue colored) with movement of that one connected by constraint (of green color). Additionally, the outputs from <code>sensorConstraintRelative</code> depict position deviations in the constraining element.</p>
</html>"));
    end SphericalConstraint;

    model UniversalConstraint
      "Body attached by one spring and universal joint or constrained to environment"
      extends Modelica_Icons.Example;
      parameter Boolean animation=true "= true, if animation shall be enabled";
      Modelica_Mechanics_MultiBody.Joints.Universal joint(
        n_a={0,0,1},
        n_b={1,0,0},
        stateSelect=StateSelect.always,
        phi_a(fixed=true),
        phi_b(fixed=true),
        w_a(fixed=true),
        w_b(fixed=true))
        annotation (Placement(transformation(extent={{60,-30},{40,-10}})));
      Modelica_Mechanics_MultiBody.Joints.Constraints.Universal constraint(n_a=joint.n_a,
          n_b=joint.n_b)
        annotation (Placement(transformation(extent={{60,10},{40,30}})));
      Modelica_Mechanics_MultiBody.Sensors.RelativeSensor sensorConstraintRelative(
        resolveInFrame=Modelica_Mechanics_MultiBody.Types.ResolveInFrameAB.frame_a,
        get_r_rel=true,
        get_a_rel=false,
        get_angles=true,
        sequence={3,2,1})
        annotation (Placement(transformation(extent={{60,60},{40,40}})));
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyOfJoint(
        m=1,
        I_11=1,
        I_22=1,
        I_33=1,
        r={0.4,0,0},
        r_CM={0.2,0,0},
        width=0.05,
        r_0(start={0.2,-0.5,0.1}, each fixed=false),
        v_0(each fixed=false),
        angles_fixed=false,
        w_0_fixed=false,
        angles_start={0.17453292519943,0.95993108859688,1.1868238913561},
        final color={0,0,255}) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={10,-20})));
      Modelica_Mechanics_MultiBody.Parts.BodyShape bodyOfConstraint(
        I_11=1,
        I_22=1,
        I_33=1,
        width=0.05,
        r_0(start={0.2,-0.5,0.1}, each fixed=false),
        v_0(each fixed=false),
        angles_fixed=false,
        w_0_fixed=false,
        final color={0,128,0},
        r=bodyOfJoint.r,
        r_CM=bodyOfJoint.r_CM,
        m=bodyOfJoint.m,
        angles_start={0.17453292519943,0.95993108859688,1.1868238913561})
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={10,20})));
      Modelica_Mechanics_MultiBody.Forces.Spring springOfJoint(
        c=20,
        s_unstretched=0,
        width=0.1,
        coilWidth=0.005,
        numberOfWindings=5) annotation (Placement(transformation(
            origin={-50,-20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_MultiBody.Forces.Spring springOfConstraint(
        width=0.1,
        coilWidth=0.005,
        c=springOfJoint.c,
        s_unstretched=springOfJoint.s_unstretched,
        numberOfWindings=springOfJoint.numberOfWindings) annotation (
          Placement(transformation(
            origin={-50,20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      inner Modelica_Mechanics_MultiBody.World world annotation (Placement(
            transformation(extent={{-100,-100},{-80,-80}}, rotation=0)));
      Modelica_Mechanics_MultiBody.Parts.FixedRotation fixedRotation(
        r={0.2,-0.3,0.2},
        rotationType=Modelica_Mechanics_MultiBody.Types.RotationTypes.PlanarRotationSequence,
        angles={10,55,68}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={80,-50})));

      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslation(animation=
           false, r={0.8,0,0.3}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-70,-50})));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslationOfJoint(r={0.1,
            0.15,0.2})
        annotation (Placement(transformation(extent={{-10,-30},{-30,-10}})));
      Modelica_Mechanics_MultiBody.Parts.FixedTranslation fixedTranslationOfConstraint(r=
            fixedTranslationOfJoint.r)
        annotation (Placement(transformation(extent={{-10,10},{-30,30}})));
      Modelica_Mechanics_MultiBody.Joints.FreeMotionScalarInit freeMotionScalarInit(
        use_angle=true,
        use_angle_d=true,
        angle_1(fixed=true),
        angle_3(fixed=true),
        angle_d_1(fixed=true),
        angle_d_3(fixed=true),
        sequence_start={1,2,3})
        annotation (Placement(transformation(extent={{60,70},{40,90}})));
    equation
      connect(fixedTranslation.frame_a, world.frame_b)
        annotation (Line(
          points={{-70,-60},{-70,-90},{-80,-90}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, fixedRotation.frame_a) annotation (Line(
          points={{-80,-90},{80,-90},{80,-60}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, constraint.frame_a) annotation (Line(
          points={{80,-40},{80,20},{60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(constraint.frame_a,sensorConstraintRelative. frame_a)
                                                          annotation (Line(
          points={{60,20},{80,20},{80,50},{60,50}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(joint.frame_b, bodyOfJoint.frame_a)                annotation (
          Line(
          points={{40,-20},{20,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sensorConstraintRelative.frame_b, constraint.frame_b) annotation (
          Line(
          points={{40,50},{30,50},{30,20},{40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, springOfJoint.frame_a)
                                                  annotation (Line(
          points={{-70,-40},{-70,-20},{-60,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, springOfConstraint.frame_a)
                                                       annotation (Line(
          points={{-70,-40},{-70,20},{-60,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfConstraint.frame_a, constraint.frame_b) annotation (Line(
          points={{20,20},{40,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(joint.frame_a, fixedRotation.frame_b)  annotation (Line(
          points={{60,-20},{80,-20},{80,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfJoint.frame_b, fixedTranslationOfJoint.frame_a) annotation (
          Line(
          points={{0,-20},{-10,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfConstraint.frame_b, fixedTranslationOfConstraint.frame_a)
        annotation (Line(
          points={{0,20},{-10,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(springOfJoint.frame_b, fixedTranslationOfJoint.frame_b) annotation (
          Line(
          points={{-40,-20},{-30,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(springOfConstraint.frame_b, fixedTranslationOfConstraint.frame_b)
        annotation (Line(
          points={{-40,20},{-30,20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, freeMotionScalarInit.frame_a) annotation (
          Line(
          points={{80,-40},{80,80},{60,80}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyOfConstraint.frame_a, freeMotionScalarInit.frame_b) annotation (
         Line(
          points={{20,20},{30,20},{30,80},{40,80}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=10),
        Documentation(info="<html>
<p>This example demonstrates the functionality of <b>constraint</b> representing <b>universal joint</b>. Each of two bodies is at one of its end connected by spring to the world. The other end is also connected to the world either by universal joint or by appropriate constraint. Therefore, the body can only perform rotation about two revolute axes depending on working forces.</p>
<p><b>Simulation results</b> </p>
<p>After simulating the model, see the animation of the multibody system and compare movement of body connected by joint (blue colored) with movement of that one connected by constraint (of green color). Additionally, the outputs from <code>sensorConstraintRelative</code> depict position deviations in the constraining element.</p>
</html>"));
    end UniversalConstraint;
    annotation (Documentation(info="<html>
<p>This package is a collection of simulatable models involving constraints in a multibody system.
  The examples mainly show comparison of constraints to the standard joints.</p>

</html>"));
  end Constraints;

  package Systems
    "Examples of complete system models including 3-dimensional mechanics"
  extends Modelica_Icons.ExamplesPackage;

    package RobotR3
      "Library to demonstrate robot system models based on the Manutec r3 robot"

      model oneAxis
        "Model of one axis of robot (controller, motor, gearbox) with simple load"

        extends Modelica_Icons.Example;
        parameter Modelica_SIunits.Mass mLoad(min=0) = 15 "Mass of load";
        parameter Real kp=5 "Gain of position controller of axis 2";
        parameter Real ks=0.5 "Gain of speed controller of axis 2";
        parameter Modelica_SIunits.Time Ts=0.05
          "Time constant of integrator of speed controller of axis 2";
        parameter Real startAngle(unit="deg") = 0 "Start angle of axis 2";
        parameter Real endAngle(unit="deg") = 120 "End angle of axis 2";

        parameter Modelica_SIunits.Time swingTime=0.5
          "Additional time after reference motion is in rest before simulation is stopped";
        parameter Modelica_SIunits.AngularVelocity refSpeedMax=3
          "Maximum reference speed";
        parameter Modelica_SIunits.AngularAcceleration refAccMax=10
          "Maximum reference acceleration";

        Components.AxisType1 axis(
          w=5500,
          ratio=210,
          c=8,
          cd=0.01,
          Rv0=0.5,
          Rv1=(0.1/130),
          kp=kp,
          ks=ks,
          Ts=Ts) annotation (Placement(transformation(extent={{20,0},{40,20}},
                rotation=0)));
        Modelica_Mechanics_Rotational.Components.Inertia load(
                                                   J=1.3*mLoad)
          annotation (Placement(transformation(extent={{54,0},{74,20}}, rotation=0)));
        Components.PathPlanning1 pathPlanning(
          swingTime=swingTime,
          angleBegDeg=startAngle,
          angleEndDeg=endAngle,
          speedMax=refSpeedMax,
          accMax=refAccMax)   annotation (Placement(transformation(extent={{-60,0},
                  {-40,20}}, rotation=0)));
      protected
        Components.ControlBus controlBus annotation (Placement(transformation(
                extent={{-32,10},{8,50}}, rotation=0)));
      equation
        connect(axis.flange, load.flange_a)
          annotation (Line(
            points={{40,10},{54,10}},
            color={128,128,128},
            thickness=0.5));
        connect(pathPlanning.controlBus, controlBus) annotation (Line(
            points={{-40,10},{-15,10},{-15,28},{-12,28},{-12,30}},
            color={255,204,51},
            thickness=0.5));
        connect(controlBus.axisControlBus1, axis.axisControlBus) annotation (
          Text(
            string="%first",
            index=-1,
            extent=[-6,3; -6,3]), Line(
            points={{-12,30},{-12,29},{-9,29},{-9,10},{20,10}},
            color={255,204,51},
            thickness=0.5));
        annotation (
          Documentation(info="<HTML>
<p>
With this model one axis of the r3 robot is checked.
The mechanical structure is replaced by a simple
load inertia.
</p>
</html>"),          experiment(StopTime=1.6),
          __Dymola_Commands(file="modelica://Modelica/Resources/Scripts/Dymola/Mechanics/MultiBody/Examples/Systems/oneAxisPlot.mos"
              "Plot result"));
      end oneAxis;

      model fullRobot
        "6 degree of freedom robot with path planning, controllers, motors, brakes, gears and mechanics"
        extends Modelica_Icons.Example;

        parameter Modelica_SIunits.Mass mLoad(min=0) = 15 "Mass of load";
        parameter Modelica_SIunits.Position rLoad[3]={0.1,0.25,0.1}
          "Distance from last flange to load mass";
        parameter Modelica_SIunits.Acceleration g=9.81 "Gravity acceleration";
        parameter Modelica_SIunits.Time refStartTime=0
          "Start time of reference motion";
        parameter Modelica_SIunits.Time refSwingTime=0.5
          "Additional time after reference motion is in rest before simulation is stopped";

        parameter Real startAngle1(unit="deg") = -60 "Start angle of axis 1"
          annotation (Dialog(tab="Reference", group="startAngles"));
        parameter Real startAngle2(unit="deg") = 20 "Start angle of axis 2"
          annotation (Dialog(tab="Reference", group="startAngles"));
        parameter Real startAngle3(unit="deg") = 90 "Start angle of axis 3"
          annotation (Dialog(tab="Reference", group="startAngles"));
        parameter Real startAngle4(unit="deg") = 0 "Start angle of axis 4"
          annotation (Dialog(tab="Reference", group="startAngles"));
        parameter Real startAngle5(unit="deg") = -110 "Start angle of axis 5"
          annotation (Dialog(tab="Reference", group="startAngles"));
        parameter Real startAngle6(unit="deg") = 0 "Start angle of axis 6"
          annotation (Dialog(tab="Reference", group="startAngles"));

        parameter Real endAngle1(unit="deg") = 60 "End angle of axis 1"
          annotation (Dialog(tab="Reference", group="endAngles"));
        parameter Real endAngle2(unit="deg") = -70 "End angle of axis 2"
          annotation (Dialog(tab="Reference", group="endAngles"));
        parameter Real endAngle3(unit="deg") = -35 "End angle of axis 3"
          annotation (Dialog(tab="Reference", group="endAngles"));
        parameter Real endAngle4(unit="deg") = 45 "End angle of axis 4"
          annotation (Dialog(tab="Reference", group="endAngles"));
        parameter Real endAngle5(unit="deg") = 110 "End angle of axis 5"
          annotation (Dialog(tab="Reference", group="endAngles"));
        parameter Real endAngle6(unit="deg") = 45 "End angle of axis 6"
          annotation (Dialog(tab="Reference", group="endAngles"));

        parameter Modelica_SIunits.AngularVelocity refSpeedMax[6]={3,1.5,5,
            3.1,3.1,4.1} "Maximum reference speeds of all joints"
          annotation (Dialog(tab="Reference", group="Limits"));
        parameter Modelica_SIunits.AngularAcceleration refAccMax[6]={15,15,15,
            60,60,60} "Maximum reference accelerations of all joints"
          annotation (Dialog(tab="Reference", group="Limits"));

        parameter Real kp1=5 "Gain of position controller"
          annotation (Dialog(tab="Controller", group="Axis 1"));
        parameter Real ks1=0.5 "Gain of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 1"));
        parameter Modelica_SIunits.Time Ts1=0.05
          "Time constant of integrator of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 1"));
        parameter Real kp2=5 "Gain of position controller"
          annotation (Dialog(tab="Controller", group="Axis 2"));
        parameter Real ks2=0.5 "Gain of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 2"));
        parameter Modelica_SIunits.Time Ts2=0.05
          "Time constant of integrator of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 2"));
        parameter Real kp3=5 "Gain of position controller"
          annotation (Dialog(tab="Controller", group="Axis 3"));
        parameter Real ks3=0.5 "Gain of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 3"));
        parameter Modelica_SIunits.Time Ts3=0.05
          "Time constant of integrator of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 3"));
        parameter Real kp4=5 "Gain of position controller"
          annotation (Dialog(tab="Controller", group="Axis 4"));
        parameter Real ks4=0.5 "Gain of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 4"));
        parameter Modelica_SIunits.Time Ts4=0.05
          "Time constant of integrator of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 4"));
        parameter Real kp5=5 "Gain of position controller"
          annotation (Dialog(tab="Controller", group="Axis 5"));
        parameter Real ks5=0.5 "Gain of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 5"));
        parameter Modelica_SIunits.Time Ts5=0.05
          "Time constant of integrator of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 5"));
        parameter Real kp6=5 "Gain of position controller"
          annotation (Dialog(tab="Controller", group="Axis 6"));
        parameter Real ks6=0.5 "Gain of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 6"));
        parameter Modelica_SIunits.Time Ts6=0.05
          "Time constant of integrator of speed controller"
          annotation (Dialog(tab="Controller", group="Axis 6"));
        Components.MechanicalStructure mechanics(
          mLoad=mLoad,
          rLoad=rLoad,
          g=g) annotation (Placement(transformation(extent={{35,-35},{95,25}},
                rotation=0)));
        Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.PathPlanning6
          pathPlanning(
          naxis=6,
          angleBegDeg={startAngle1,startAngle2,startAngle3,startAngle4,
              startAngle5,startAngle6},
          angleEndDeg={endAngle1,endAngle2,endAngle3,endAngle4,endAngle5,
              endAngle6},
          speedMax=refSpeedMax,
          accMax=refAccMax,
          startTime=refStartTime,
          swingTime=refSwingTime) annotation (Placement(transformation(extent={
                  {-5,50},{-25,70}}, rotation=0)));

        RobotR3.Components.AxisType1 axis1(
          w=4590,
          ratio=-105,
          c=43,
          cd=0.005,
          Rv0=0.4,
          Rv1=(0.13/160),
          kp=kp1,
          ks=ks1,
          Ts=Ts1) annotation (Placement(transformation(extent={{-25,-75},{-5,-55}},
                rotation=0)));
        RobotR3.Components.AxisType1 axis2(
          w=5500,
          ratio=210,
          c=8,
          cd=0.01,
          Rv1=(0.1/130),
          Rv0=0.5,
          kp=kp2,
          ks=ks2,
          Ts=Ts2) annotation (Placement(transformation(extent={{-25,-55},{-5,-35}},
                rotation=0)));

        RobotR3.Components.AxisType1 axis3(
          w=5500,
          ratio=60,
          c=58,
          cd=0.04,
          Rv0=0.7,
          Rv1=(0.2/130),
          kp=kp3,
          ks=ks3,
          Ts=Ts3) annotation (Placement(transformation(extent={{-25,-35},{-5,-15}},
                rotation=0)));
        RobotR3.Components.AxisType2 axis4(
          k=0.2365,
          w=6250,
          D=0.55,
          J=1.6e-4,
          ratio=-99,
          Rv0=21.8,
          Rv1=9.8,
          peak=26.7/21.8,
          kp=kp4,
          ks=ks4,
          Ts=Ts4) annotation (Placement(transformation(extent={{-25,-15},{-5,5}},
                rotation=0)));
        RobotR3.Components.AxisType2 axis5(
          k=0.2608,
          w=6250,
          D=0.55,
          J=1.8e-4,
          ratio=79.2,
          Rv0=30.1,
          Rv1=0.03,
          peak=39.6/30.1,
          kp=kp5,
          ks=ks5,
          Ts=Ts5) annotation (Placement(transformation(extent={{-25,5},{-5,25}},
                rotation=0)));
        RobotR3.Components.AxisType2 axis6(
          k=0.0842,
          w=7400,
          D=0.27,
          J=4.3e-5,
          ratio=-99,
          Rv0=10.9,
          Rv1=3.92,
          peak=16.8/10.9,
          kp=kp6,
          ks=ks6,
          Ts=Ts6) annotation (Placement(transformation(extent={{-25,25},{-5,45}},
                rotation=0)));
      protected
        Components.ControlBus controlBus
          annotation (Placement(transformation(
              origin={-80,-10},
              extent={{-20,-20},{20,20}},
              rotation=90)));
      equation
        connect(axis2.flange, mechanics.axis2) annotation (Line(points={{-5,-45},{
                25,-45},{25,-21.5},{33.5,-21.5}}, color={0,0,0}));
        connect(axis1.flange, mechanics.axis1) annotation (Line(points={{-5,-65},{
                30,-65},{30,-30.5},{33.5,-30.5}}, color={0,0,0}));
        connect(axis3.flange, mechanics.axis3) annotation (Line(points={{-5,-25},{
                15,-25},{15,-12.5},{33.5,-12.5}}, color={0,0,0}));
        connect(axis4.flange, mechanics.axis4) annotation (Line(points={{-5,-5},{15,
                -5},{15,-3.5},{33.5,-3.5}}, color={0,0,0}));
        connect(axis5.flange, mechanics.axis5)
          annotation (Line(points={{-5,15},{10,15},{10,5.5},{33.5,5.5}}, color={0,0,
                0}));
        connect(axis6.flange, mechanics.axis6) annotation (Line(points={{-5,35},{20,
                35},{20,14.5},{33.5,14.5}}, color={0,0,0}));
        connect(controlBus, pathPlanning.controlBus)
                                             annotation (Line(
            points={{-80,-10},{-80,60},{-25,60}},
            color={255,204,51},
            thickness=0.5));
        connect(controlBus.axisControlBus1, axis1.axisControlBus) annotation (
          Text(
            string="%first",
            index=-1,
            extent=[-6,3; -6,3]), Line(
            points={{-80,-10},{-80,-14.5},{-79,-14.5},{-79,-17},{-65,-17},{-65,-65},
                {-25,-65}},
            color={255,204,51},
            thickness=0.5));

        connect(controlBus.axisControlBus2, axis2.axisControlBus) annotation (
          Text(
            string="%first",
            index=-1,
            extent=[-6,3; -6,3]), Line(
            points={{-80,-10},{-79,-10},{-79,-15},{-62.5,-15},{-62.5,-45},{-25,-45}},
            color={255,204,51},
            thickness=0.5));

        connect(controlBus.axisControlBus3, axis3.axisControlBus) annotation (
          Text(
            string="%first",
            index=-1,
            extent=[-6,3; -6,3]), Line(
            points={{-80,-10},{-77,-10},{-77,-12.5},{-61,-12.5},{-61,-25},{-25,-25}},
            color={255,204,51},
            thickness=0.5));

        connect(controlBus.axisControlBus4, axis4.axisControlBus) annotation (
          Text(
            string="%first",
            index=-1,
            extent=[-6,3; -6,3]), Line(
            points={{-80,-10},{-60.5,-10},{-60.5,-5},{-25,-5}},
            color={255,204,51},
            thickness=0.5));
        connect(controlBus.axisControlBus5, axis5.axisControlBus) annotation (
          Text(
            string="%first",
            index=-1,
            extent=[-6,3; -6,3]), Line(
            points={{-80,-10},{-77,-10},{-77,-7},{-63,-7},{-63,15},{-25,15}},
            color={255,204,51},
            thickness=0.5));
        connect(controlBus.axisControlBus6, axis6.axisControlBus) annotation (
          Text(
            string="%first",
            index=-1,
            extent=[-6,3; -6,3]), Line(
            points={{-80,-10},{-79,-10},{-79,-5},{-65,-5},{-65,35},{-25,35}},
            color={255,204,51},
            thickness=0.5));
        annotation (
          experiment(StopTime=2),
          __Dymola_Commands(
            file="modelica://Modelica/Resources/Scripts/Dymola/Mechanics/MultiBody/Examples/Systems/Run.mos"
              "Simulate",
            file="modelica://Modelica/Resources/Scripts/Dymola/Mechanics/MultiBody/Examples/Systems/fullRobotPlot.mos"
              "Plot result of axis 3 + animate"),
          Documentation(info="<HTML>
<p>
This is a detailed model of the robot. For animation CAD data
is used. Translate and simulate with the default settings
(default simulation time = 3 s). Use command script \"modelica://Modelica/Resources/Scripts/Dymola/Mechanics/MultiBody/Examples/Systems/fullRobotPlot.mos\"
to plot variables.
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Systems/r3_fullRobot.png\" ALT=\"model Examples.Loops.Systems.RobotR3.fullRobot\">
</p>
</HTML>"));
      end fullRobot;
      extends Modelica_Icons.ExamplesPackage;

      package Components "Library of components of the robot"
        extends Modelica_Icons.Package;

        expandable connector AxisControlBus "Data bus for one robot axis"
          extends Modelica_Icons.SignalSubBus;

          Boolean motion_ref "= true, if reference motion is not in rest" annotation(HideResult=false);
          Modelica_SIunits.Angle angle_ref "Reference angle of axis flange"
            annotation (HideResult=false);
          Modelica_SIunits.Angle angle "Angle of axis flange"
            annotation (HideResult=false);
          Modelica_SIunits.AngularVelocity speed_ref
            "Reference speed of axis flange" annotation (HideResult=false);
          Modelica_SIunits.AngularVelocity speed "Speed of axis flange"
            annotation (HideResult=false);
          Modelica_SIunits.AngularAcceleration acceleration_ref
            "Reference acceleration of axis flange"
            annotation (HideResult=false);
          Modelica_SIunits.AngularAcceleration acceleration
            "Acceleration of axis flange" annotation (HideResult=false);
          Modelica_SIunits.Current current_ref "Reference current of motor"
            annotation (HideResult=false);
          Modelica_SIunits.Current current "Current of motor"
            annotation (HideResult=false);
          Modelica_SIunits.Angle motorAngle "Angle of motor flange"
            annotation (HideResult=false);
          Modelica_SIunits.AngularVelocity motorSpeed "Speed of motor flange"
            annotation (HideResult=false);

          annotation (defaultComponentPrefixes="protected",
                      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}), graphics={Rectangle(
                  extent={{-20,2},{22,-2}},
                  lineColor={255,204,51},
                  lineThickness=0.5)}),
            Documentation(info="<html>
<p>
Signal bus that is used to communicate all signals for <b>one</b> axis.
This is an expandable connector which has a \"default\" set of
signals. Note, the input/output causalities of the signals are
determined from the connections to this bus.
</p>

</html>"));
        end AxisControlBus;

        expandable connector ControlBus "Data bus for all axes of robot"
          extends Modelica_Icons.SignalBus;
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus1 "Bus of axis 1";
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus2 "Bus of axis 2";
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus3 "Bus of axis 3";
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus4 "Bus of axis 4";
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus5 "Bus of axis 5";
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus6 "Bus of axis 6";

          annotation (
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                    100,100}}), graphics={Rectangle(
                  extent={{-20,2},{22,-2}},
                  lineColor={255,204,51},
                  lineThickness=0.5)}),
            Documentation(info="<html>
<p>
Signal bus that is used to communicate <b>all signals</b> of the robot.
This is an expandable connector which has a \"default\" set of
signals. Note, the input/output causalities of the signals are
determined from the connections to this bus.
</p>
</html>"));
        end ControlBus;

        model PathPlanning1
          "Generate reference angles for fastest kinematic movement"

          parameter Real angleBegDeg(unit="deg") = 0 "Start angle";
          parameter Real angleEndDeg(unit="deg") = 1 "End angle";
          parameter Modelica_SIunits.AngularVelocity speedMax=3
            "Maximum axis speed";
          parameter Modelica_SIunits.AngularAcceleration accMax=2.5
            "Maximum axis acceleration";
          parameter Modelica_SIunits.Time startTime=0 "Start time of movement";
          parameter Modelica_SIunits.Time swingTime=0.5
            "Additional time after reference motion is in rest before simulation is stopped";
          final parameter Modelica_SIunits.Angle angleBeg=Modelica_SIunits.Conversions.from_deg(
              angleBegDeg) "Start angles";
          final parameter Modelica_SIunits.Angle angleEnd=Modelica_SIunits.Conversions.from_deg(
              angleEndDeg) "End angles";
          ControlBus controlBus
            annotation (Placement(transformation(
                origin={100,0},
                extent={{-20,-20},{20,20}},
                rotation=270)));
          Modelica_Blocks.Sources.KinematicPTP2 path(
            q_end={angleEnd},
            qd_max={speedMax},
            qdd_max={accMax},
            startTime=startTime,
            q_begin={angleBeg})
                              annotation (Placement(transformation(extent={{-50,-10},
                    {-30,10}}, rotation=0)));
          PathToAxisControlBus pathToAxis1(final nAxis=1, final axisUsed=1)
            annotation (Placement(transformation(extent={{0,-10},{20,10}}, rotation=
                   0)));

          Modelica_Blocks.Logical.TerminateSimulation terminateSimulation(condition=
               time >= path.endTime + swingTime) annotation (Placement(
                transformation(extent={{-50,-30},{30,-24}}, rotation=0)));
        equation
          connect(path.q, pathToAxis1.q)         annotation (Line(points={{-29,8},{
                  -2,8}}, color={0,0,127}));
          connect(path.qd, pathToAxis1.qd)         annotation (Line(points={{-29,3},
                  {-2,3}}, color={0,0,127}));
          connect(path.qdd, pathToAxis1.qdd)         annotation (Line(points={{-29,
                  -3},{-2,-3}}, color={0,0,127}));
          connect(path.moving, pathToAxis1.moving)             annotation (Line(
                points={{-29,-8},{-2,-8}}, color={255,0,255}));
          connect(pathToAxis1.axisControlBus, controlBus.axisControlBus1) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(
              points={{20,0},{100,0}},
              color={255,204,51},
              thickness=0.5));
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}}), graphics={
                Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-150,150},{150,110}},
                  textString="%name",
                  lineColor={0,0,255}),
                Polygon(
                  points={{-80,90},{-88,68},{-72,68},{-80,88},{-80,90}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-80,78},{-80,-82}}, color={192,192,192}),
                Line(points={{-90,0},{82,0}}, color={192,192,192}),
                Polygon(
                  points={{90,0},{68,8},{68,-8},{90,0}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-42,55},{29,12}},
                  lineColor={192,192,192},
                  textString="w"),
                Line(points={{-80,0},{-41,69},{26,69},{58,0}}, color={0,0,0}),
                Text(
                  extent={{-73,-44},{82,-69}},
                  lineColor={0,0,0},
                  textString="1 axis")}),
            Documentation(info="<html>
<p>
Given
</p>
<ul>
<li> start and end angle of an axis</li>
<li> maximum speed of the axis </li>
<li> maximum acceleration of the axis </li>
</ul>

<p>
this component computes the fastest movement under the
given constraints. This means, that:
</p>

<ol>
<li> The axis accelerates with the maximum acceleration
     until the maximum speed is reached.</li>
<li> Drives with the maximum speed as long as possible.</li>
<li> Decelerates with the negative of the maximum acceleration
     until rest.</li>
</ol>

<p>
The acceleration, constant velocity and deceleration
phase are determined in such a way that the movement
starts form the start angles and ends at the end angles.
The output of this block are the computed angles, angular velocities
and angular acceleration and this information is stored as reference
motion on the controlBus of the r3 robot.
</p>

</html>"));
        end PathPlanning1;

        model PathPlanning6
          "Generate reference angles for fastest kinematic movement"

          parameter Integer naxis=6 "number of driven axis";
          parameter Real angleBegDeg[naxis](each unit="deg") = zeros(naxis)
            "Start angles";
          parameter Real angleEndDeg[naxis](each unit="deg") = ones(naxis)
            "End angles";
          parameter Modelica_SIunits.AngularVelocity speedMax[naxis]=fill(3,
              naxis) "Maximum axis speed";
          parameter Modelica_SIunits.AngularAcceleration accMax[naxis]=fill(
              2.5, naxis) "Maximum axis acceleration";
          parameter Modelica_SIunits.Time startTime=0 "Start time of movement";
          parameter Modelica_SIunits.Time swingTime=0.5
            "Additional time after reference motion is in rest before simulation is stopped";
          final parameter Modelica_SIunits.Angle angleBeg[:]=Modelica_SIunits.Conversions.from_deg(
              angleBegDeg) "Start angles";
          final parameter Modelica_SIunits.Angle angleEnd[:]=Modelica_SIunits.Conversions.from_deg(
              angleEndDeg) "End angles";
          ControlBus controlBus
            annotation (Placement(transformation(
                origin={100,0},
                extent={{-20,-20},{20,20}},
                rotation=270)));
          Modelica_Blocks.Sources.KinematicPTP2 path(
            q_end=angleEnd,
            qd_max=speedMax,
            qdd_max=accMax,
            startTime=startTime,
            q_begin=angleBeg) annotation (Placement(transformation(extent={{-90,-80},
                    {-70,-60}}, rotation=0)));
          PathToAxisControlBus pathToAxis1(nAxis=naxis, axisUsed=1)
            annotation (Placement(transformation(extent={{-10,70},{10,90}},
                  rotation=0)));
          PathToAxisControlBus pathToAxis2(nAxis=naxis, axisUsed=2)
            annotation (Placement(transformation(extent={{-10,40},{10,60}},
                  rotation=0)));
          PathToAxisControlBus pathToAxis3(nAxis=naxis, axisUsed=3)
            annotation (Placement(transformation(extent={{-10,10},{10,30}},
                  rotation=0)));
          PathToAxisControlBus pathToAxis4(nAxis=naxis, axisUsed=4)
            annotation (Placement(transformation(extent={{-10,-20},{10,0}},
                  rotation=0)));
          PathToAxisControlBus pathToAxis5(nAxis=naxis, axisUsed=5)
            annotation (Placement(transformation(extent={{-10,-50},{10,-30}},
                  rotation=0)));
          PathToAxisControlBus pathToAxis6(nAxis=naxis, axisUsed=6)
            annotation (Placement(transformation(extent={{-10,-80},{10,-60}},
                  rotation=0)));

          Modelica_Blocks.Logical.TerminateSimulation terminateSimulation(condition=
               time >= path.endTime + swingTime) annotation (Placement(
                transformation(extent={{-50,-100},{30,-94}}, rotation=0)));
        equation
          connect(path.q, pathToAxis1.q)         annotation (Line(points={{-69,-62},
                  {-60,-62},{-60,88},{-12,88}}, color={0,0,127}));
          connect(path.qd, pathToAxis1.qd)         annotation (Line(points={{-69,
                  -67},{-59,-67},{-59,83},{-12,83}}, color={0,0,127}));
          connect(path.qdd, pathToAxis1.qdd)         annotation (Line(points={{-69,
                  -73},{-58,-73},{-58,77},{-12,77}}, color={0,0,127}));
          connect(path.moving, pathToAxis1.moving)             annotation (Line(
                points={{-69,-78},{-57,-78},{-57,72},{-12,72}}, color={255,0,255}));
          connect(path.q, pathToAxis2.q)         annotation (Line(points={{-69,-62},
                  {-60,-62},{-60,58},{-12,58}}, color={0,0,127}));
          connect(path.qd, pathToAxis2.qd)         annotation (Line(points={{-69,
                  -67},{-59,-67},{-59,53},{-12,53}}, color={0,0,127}));
          connect(path.qdd, pathToAxis2.qdd)         annotation (Line(points={{-69,
                  -73},{-58,-73},{-58,47},{-12,47}}, color={0,0,127}));
          connect(path.moving, pathToAxis2.moving)             annotation (Line(
                points={{-69,-78},{-57,-78},{-57,42},{-12,42}}, color={255,0,255}));
          connect(path.q, pathToAxis3.q)         annotation (Line(points={{-69,-62},
                  {-60,-62},{-60,28},{-12,28}}, color={0,0,127}));
          connect(path.qd, pathToAxis3.qd)         annotation (Line(points={{-69,
                  -67},{-59,-67},{-59,23},{-12,23}}, color={0,0,127}));
          connect(path.qdd, pathToAxis3.qdd)         annotation (Line(points={{-69,
                  -73},{-58,-73},{-58,17},{-12,17}}, color={0,0,127}));
          connect(path.moving, pathToAxis3.moving)             annotation (Line(
                points={{-69,-78},{-57,-78},{-57,12},{-12,12}}, color={255,0,255}));
          connect(path.q, pathToAxis4.q)         annotation (Line(points={{-69,-62},
                  {-60,-62},{-60,-2},{-12,-2}}, color={0,0,127}));
          connect(path.qd, pathToAxis4.qd)         annotation (Line(points={{-69,
                  -67},{-59,-67},{-59,-7},{-12,-7}}, color={0,0,127}));
          connect(path.qdd, pathToAxis4.qdd)         annotation (Line(points={{-69,
                  -73},{-58,-73},{-58,-13},{-12,-13}}, color={0,0,127}));
          connect(path.moving, pathToAxis4.moving)             annotation (Line(
                points={{-69,-78},{-57,-78},{-57,-18},{-12,-18}}, color={255,0,255}));
          connect(path.q, pathToAxis5.q)         annotation (Line(points={{-69,-62},
                  {-60,-62},{-60,-32},{-12,-32}}, color={0,0,127}));
          connect(path.qd, pathToAxis5.qd)         annotation (Line(points={{-69,
                  -67},{-59,-67},{-59,-37},{-12,-37}}, color={0,0,127}));
          connect(path.qdd, pathToAxis5.qdd)         annotation (Line(points={{-69,
                  -73},{-58,-73},{-58,-43},{-12,-43}}, color={0,0,127}));
          connect(path.moving, pathToAxis5.moving)             annotation (Line(
                points={{-69,-78},{-57,-78},{-57,-48},{-12,-48}}, color={255,0,255}));
          connect(path.q, pathToAxis6.q)         annotation (Line(points={{-69,-62},
                  {-12,-62}}, color={0,0,127}));
          connect(path.qd, pathToAxis6.qd)         annotation (Line(points={{-69,
                  -67},{-12,-67}}, color={0,0,127}));
          connect(path.qdd, pathToAxis6.qdd)         annotation (Line(points={{-69,
                  -73},{-12,-73}}, color={0,0,127}));
          connect(path.moving, pathToAxis6.moving)             annotation (Line(
                points={{-69,-78},{-12,-78}}, color={255,0,255}));
          connect(pathToAxis1.axisControlBus, controlBus.axisControlBus1) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(
              points={{10,80},{80,80},{80,7},{98,7}},
              color={255,204,51},
              thickness=0.5));
          connect(pathToAxis2.axisControlBus, controlBus.axisControlBus2) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(
              points={{10,50},{77,50},{77,5},{97,5}},
              color={255,204,51},
              thickness=0.5));
          connect(pathToAxis3.axisControlBus, controlBus.axisControlBus3) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(
              points={{10,20},{75,20},{75,3},{96,3}},
              color={255,204,51},
              thickness=0.5));
          connect(pathToAxis4.axisControlBus, controlBus.axisControlBus4) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(
              points={{10,-10},{73,-10},{73,0},{100,0}},
              color={255,204,51},
              thickness=0.5));
          connect(pathToAxis5.axisControlBus, controlBus.axisControlBus5) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(
              points={{10,-40},{75,-40},{75,-3},{100,-3},{100,0}},
              color={255,204,51},
              thickness=0.5));
          connect(pathToAxis6.axisControlBus, controlBus.axisControlBus6) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(
              points={{10,-70},{78,-70},{78,-6},{98,-6}},
              color={255,204,51},
              thickness=0.5));
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}}), graphics={
                Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-150,150},{150,110}},
                  textString="%name",
                  lineColor={0,0,255}),
                Polygon(
                  points={{-80,90},{-88,68},{-72,68},{-80,88},{-80,90}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-80,78},{-80,-82}}, color={192,192,192}),
                Line(points={{-90,0},{82,0}}, color={192,192,192}),
                Polygon(
                  points={{90,0},{68,8},{68,-8},{90,0}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-42,55},{29,12}},
                  lineColor={192,192,192},
                  textString="w"),
                Line(points={{-80,0},{-41,69},{26,69},{58,0}}, color={0,0,0}),
                Text(
                  extent={{-70,-43},{85,-68}},
                  lineColor={0,0,0},
                  textString="6 axes")}),
            Documentation(info="<html>
<p>
Given
</p>
<ul>
<li> start and end angles of every axis</li>
<li> maximum speed of every axis </li>
<li> maximum acceleration of every axis </li>
</ul>

<p>
this component computes the fastest movement under the
given constraints. This means, that:
</p>

<ol>
<li> Every axis accelerates with the maximum acceleration
     until the maximum speed is reached.</li>
<li> Drives with the maximum speed as long as possible.</li>
<li> Decelerates with the negative of the maximum acceleration
     until rest.</li>
</ol>

<p>
The acceleration, constant velocity and deceleration
phase are determined in such a way that the movement
starts form the start angles and ends at the end angles.
The output of this block are the computed angles, angular velocities
and angular acceleration and this information is stored as reference
motion on the controlBus of the r3 robot.
</p>

</html>"));
        end PathPlanning6;

        model PathToAxisControlBus "Map path planning to one axis control bus"
          extends Modelica_Blocks.Icons.Block;

          parameter Integer nAxis=6 "Number of driven axis";
          parameter Integer axisUsed=1
            "Map path planning of axisUsed to axisControlBus";
          Modelica_Blocks.Interfaces.RealInput q[nAxis] annotation (Placement(
                transformation(extent={{-140,60},{-100,100}}, rotation=0)));
          Modelica_Blocks.Interfaces.RealInput qd[nAxis] annotation (
              Placement(transformation(extent={{-140,10},{-100,50}}, rotation=
                   0)));
          Modelica_Blocks.Interfaces.RealInput qdd[nAxis] annotation (
              Placement(transformation(extent={{-140,-50},{-100,-10}},
                  rotation=0)));
          AxisControlBus axisControlBus
            annotation (Placement(transformation(
                origin={100,0},
                extent={{-20,-20},{20,20}},
                rotation=270)));
          Modelica_Blocks.Routing.RealPassThrough q_axisUsed annotation (
              Placement(transformation(extent={{-40,50},{-20,70}}, rotation=0)));
          Modelica_Blocks.Routing.RealPassThrough qd_axisUsed annotation (
              Placement(transformation(extent={{-40,10},{-20,30}}, rotation=0)));
          Modelica_Blocks.Routing.RealPassThrough qdd_axisUsed annotation (
              Placement(transformation(extent={{-40,-30},{-20,-10}}, rotation=
                   0)));
          Modelica_Blocks.Interfaces.BooleanInput moving[nAxis] annotation (
              Placement(transformation(extent={{-140,-100},{-100,-60}},
                  rotation=0)));
          Modelica_Blocks.Routing.BooleanPassThrough motion_ref_axisUsed
            annotation (Placement(transformation(extent={{-40,-70},{-20,-50}},
                  rotation=0)));
        equation
          connect(q_axisUsed.u, q[axisUsed]) annotation (Line(points={{-42,60},{-60,
                  60},{-60,80},{-120,80}}, color={0,0,127}));
          connect(qd_axisUsed.u, qd[axisUsed]) annotation (Line(points={{-42,20},{
                  -80,20},{-80,30},{-120,30}}, color={0,0,127}));
          connect(qdd_axisUsed.u, qdd[axisUsed]) annotation (Line(points={{-42,-20},
                  {-80,-20},{-80,-30},{-120,-30}}, color={0,0,127}));
          connect(motion_ref_axisUsed.u, moving[axisUsed])     annotation (Line(
                points={{-42,-60},{-60,-60},{-60,-80},{-120,-80}}, color={255,0,255}));
          connect(motion_ref_axisUsed.y, axisControlBus.motion_ref) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(points={{-19,-60},{44,-60},{
                  44,-8},{102,-8},{102,0},{100,0}}, color={255,0,255}));
          connect(qdd_axisUsed.y, axisControlBus.acceleration_ref) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(points={{-19,-20},{40,-20},{
                  40,-4},{98,-4},{98,0},{100,0}}, color={0,0,127}));
          connect(qd_axisUsed.y, axisControlBus.speed_ref) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(points={{-19,20},{20,20},{20,
                  0},{100,0}}, color={0,0,127}));
          connect(q_axisUsed.y, axisControlBus.angle_ref) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(points={{-19,60},{40,60},{40,
                  4},{96,4}}, color={0,0,127}));
          annotation (defaultComponentName="pathToAxis1",
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                initialScale=0.1), graphics={
                Text(
                  extent={{-100,98},{-24,68}},
                  lineColor={0,0,0},
                  textString="q"),
                Text(
                  extent={{-94,46},{-18,16}},
                  lineColor={0,0,0},
                  textString="qd"),
                Text(
                  extent={{-96,-16},{-20,-46}},
                  lineColor={0,0,0},
                  textString="qdd"),
                Text(
                  extent={{-2,20},{80,-18}},
                  lineColor={0,0,0},
                  textString="%axisUsed"),
                Text(
                  extent={{2,52},{76,28}},
                  lineColor={0,0,0},
                  textString="axis"),
                Text(
                  extent={{-94,-70},{32,-96}},
                  lineColor={0,0,0},
                  textString="moving")}));
        end PathToAxisControlBus;

        model GearType1 "Motor inertia and gearbox model for r3 joints 1,2,3"
          extends Modelica_Mechanics_Rotational.Interfaces.PartialTwoFlanges;
          parameter Real i=-105 "gear ratio";
          parameter Real c(unit="N.m/rad") = 43 "Spring constant";
          parameter Real d(unit="N.m.s/rad") = 0.005 "Damper constant";
          parameter Modelica_SIunits.Torque Rv0=0.4
            "Viscous friction torque at zero velocity";
          parameter Real Rv1(unit="N.m.s/rad") = (0.13/160)
            "Viscous friction coefficient (R=Rv0+Rv1*abs(qd))";
          parameter Real peak=1
            "Maximum static friction torque is peak*Rv0 (peak >= 1)";
          Modelica_SIunits.AngularAcceleration a_rel=der(spring.w_rel)
            "Relative angular acceleration of spring";
          constant Modelica_SIunits.AngularVelocity unitAngularVelocity=1;
          constant Modelica_SIunits.Torque unitTorque=1;

          Modelica_Mechanics_Rotational.Components.IdealGear gear(
                                                       ratio=i, useSupport=false)
            annotation (Placement(transformation(extent={{50,-10},{70,10}},
                  rotation=0)));
          Modelica_Mechanics_Rotational.Components.SpringDamper spring(
                                                            c=c, d=d)
            annotation (Placement(transformation(extent={{0,-10},{20,10}}, rotation=
                   0)));
          Modelica_Mechanics_Rotational.Components.BearingFriction bearingFriction(
                                                                        tau_pos=[0,
                 Rv0/unitTorque; 1, (Rv0 + Rv1*unitAngularVelocity)/unitTorque],
              useSupport=false)                                                  annotation (Placement(
                transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
        equation
          connect(spring.flange_b, gear.flange_a)
            annotation (Line(
              points={{20,0},{50,0}},
              color={128,128,128},
              thickness=0.5));
          connect(bearingFriction.flange_b, spring.flange_a)
            annotation (Line(
              points={{-40,0},{0,0}},
              color={128,128,128},
              thickness=0.5));
          connect(gear.flange_b, flange_b)
            annotation (Line(
              points={{70,0},{100,0}},
              color={128,128,128},
              thickness=0.5));
          connect(bearingFriction.flange_a, flange_a)
            annotation (Line(
              points={{-60,0},{-100,0}},
              color={128,128,128},
              thickness=0.5));
        initial equation
          spring.w_rel = 0;
          a_rel = 0;
          annotation (
            Documentation(info="<html>
<p>
Models the gearbox used in the first three joints with all its effects,
like elasticity and friction.
Coulomb friction is approximated by a friction element acting
at the \"motor\"-side. In reality, bearing friction should be
also incorporated at the driven side of the gearbox. However,
this would require considerable more effort for the measurement
of the friction parameters.
Default values for all parameters are given for joint 1.
Model relativeStates is used to define the relative angle
and relative angular velocity across the spring (=gear elasticity)
as state variables. The reason is, that a default initial
value of zero of these states makes always sense.
If the absolute angle and the absolute angular velocity of model
Jmotor would be used as states, and the load angle (= joint angle of
robot) is NOT zero, one has always to ensure that the initial values
of the motor angle and of the joint angle are modified correspondingly.
Otherwise, the spring has an unrealistic deflection at initial time.
Since relative quantities are used as state variables, this simplifies
the definition of initial values considerably.
</p>
</html>"),         Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
                Rectangle(
                  lineColor={64,64,64},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.HorizontalCylinder,
                  extent={{-90.0,-10.0},{-60.0,10.0}}),
                Polygon(
                  fillColor={192,192,192},
                  fillPattern=FillPattern.HorizontalCylinder,
                  points={{-60.0,10.0},{-60.0,20.0},{-40.0,40.0},{-40.0,-40.0},{-60.0,-20.0},{-60.0,10.0}}),
                Rectangle(
                  lineColor={64,64,64},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.HorizontalCylinder,
                  extent={{-40.0,-60.0},{40.0,60.0}},
                  radius=10.0),
                Polygon(
                  fillColor={192,192,192},
                  fillPattern=FillPattern.HorizontalCylinder,
                  points={{60.0,20.0},{40.0,40.0},{40.0,-40.0},{60.0,-20.0},{60.0,20.0}}),
                Rectangle(
                  lineColor={64,64,64},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.HorizontalCylinder,
                  extent={{60.0,-10.0},{90.0,10.0}}),
                Polygon(
                  fillColor={64,64,64},
                  fillPattern=FillPattern.Solid,
                  points={{-60.0,-90.0},{-50.0,-90.0},{-20.0,-30.0},{20.0,-30.0},{48.0,-90.0},{60.0,-90.0},{60.0,-100.0},{-60.0,-100.0},{-60.0,-90.0}}),
                Text(
                  extent={{0,128},{0,68}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{-36,40},{36,-30}},
                  textString="1",
                  lineColor={0,0,255})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}}), graphics={Text(
                  extent={{72,30},{130,22}},
                  lineColor={0,0,0},
                  textString="flange of joint axis"), Text(
                  extent={{-128,26},{-70,18}},
                  lineColor={0,0,0},
                  textString="flange of motor axis")}));
        end GearType1;

        model GearType2 "Motor inertia and gearbox model for r3 joints 4,5,6"
          extends Modelica_Mechanics_Rotational.Interfaces.PartialTwoFlanges;
          parameter Real i=-99 "Gear ratio";
          parameter Modelica_SIunits.Torque Rv0=21.8
            "Viscous friction torque at zero velocity";
          parameter Real Rv1=9.8
            "Viscous friction coefficient in [Nms/rad] (R=Rv0+Rv1*abs(qd))";
          parameter Real peak=(26.7/21.8)
            "Maximum static friction torque is peak*Rv0 (peak >= 1)";

          constant Modelica_SIunits.AngularVelocity unitAngularVelocity=1;
          constant Modelica_SIunits.Torque unitTorque=1;
          Modelica_Mechanics_Rotational.Components.IdealGear gear(
                                                       ratio=i, useSupport=false)
            annotation (Placement(transformation(extent={{-28,-10},{-8,10}},
                  rotation=0)));
          Modelica_Mechanics_Rotational.Components.BearingFriction bearingFriction(
                                                                        tau_pos=[0,
                 Rv0/unitTorque; 1, (Rv0 + Rv1*unitAngularVelocity)/unitTorque], peak=peak,
            useSupport=false)
            annotation (Placement(transformation(extent={{30,-10},{50,10}},
                  rotation=0)));
        equation
          connect(gear.flange_b, bearingFriction.flange_a)
            annotation (Line(
              points={{-8,0},{30,0}},
              color={128,128,128},
              thickness=0.5));
          connect(bearingFriction.flange_b, flange_b)
            annotation (Line(
              points={{50,0},{100,0}},
              color={128,128,128},
              thickness=0.5));
          connect(gear.flange_a, flange_a)
            annotation (Line(
              points={{-28,0},{-100,0}},
              color={128,128,128},
              thickness=0.5));
          annotation (
            Documentation(info="<html>
<p>
The elasticity and damping in the gearboxes of the outermost
three joints of the robot is neglected.
Default values for all parameters are given for joint 4.
</p>
</html>"),         Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
                Rectangle(
                  lineColor={64,64,64},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.HorizontalCylinder,
                  extent={{-90.0,-10.0},{-60.0,10.0}}),
                Polygon(
                  fillColor={192,192,192},
                  fillPattern=FillPattern.HorizontalCylinder,
                  points={{-60.0,10.0},{-60.0,20.0},{-40.0,40.0},{-40.0,-40.0},{-60.0,-20.0},{-60.0,10.0}}),
                Rectangle(
                  lineColor={64,64,64},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.HorizontalCylinder,
                  extent={{-40.0,-60.0},{40.0,60.0}},
                  radius=10.0),
                Polygon(
                  fillColor={192,192,192},
                  fillPattern=FillPattern.HorizontalCylinder,
                  points={{60.0,20.0},{40.0,40.0},{40.0,-40.0},{60.0,-20.0},{60.0,20.0}}),
                Rectangle(
                  lineColor={64,64,64},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.HorizontalCylinder,
                  extent={{60.0,-10.0},{90.0,10.0}}),
                Polygon(
                  fillColor={64,64,64},
                  fillPattern=FillPattern.Solid,
                  points={{-60.0,-90.0},{-50.0,-90.0},{-20.0,-30.0},{20.0,-30.0},{48.0,-90.0},{60.0,-90.0},{60.0,-100.0},{-60.0,-100.0},{-60.0,-90.0}}),
                Text(
                  extent={{0,128},{0,68}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{-36,40},{38,-30}},
                  textString="2",
                  lineColor={0,0,255})}));
        end GearType2;

        model Motor "Motor model including current controller of r3 motors"
          extends Modelica_Mechanics_MultiBody.Icons.MotorIcon;
          parameter Modelica_SIunits.Inertia J(min=0) = 0.0013
            "Moment of inertia of motor";
          parameter Real k=1.1616 "Gain of motor";
          parameter Real w=4590 "Time constant of motor";
          parameter Real D=0.6 "Damping constant of motor";
          parameter Modelica_SIunits.AngularVelocity w_max=315
            "Maximum speed of motor";
          parameter Modelica_SIunits.Current i_max=9 "Maximum current of motor";

          Modelica_Mechanics_Rotational.Interfaces.Flange_b flange_motor
            annotation (Placement(transformation(extent={{90,-10},{110,10}},
                  rotation=0)));
          Modelica_Electrical_Analog.Sources.SignalVoltage Vs
            annotation (Placement(transformation(
                origin={-90,0},
                extent={{-10,10},{10,-10}},
                rotation=270)));
          Modelica_Electrical_Analog.Ideal.IdealOpAmp diff
            annotation (Placement(transformation(extent={{-64,15},{-44,35}},
                  rotation=0)));
          Modelica_Electrical_Analog.Ideal.IdealOpAmp power
            annotation (Placement(transformation(extent={{16,15},{36,35}}, rotation=
                   0)));
          Modelica_Electrical_Analog.Basic.EMF emf(k=k, useSupport=false)
            annotation (Placement(transformation(extent={{46,-10},{66,10}},
                  rotation=0)));
          Modelica_Electrical_Analog.Basic.Inductor La(L=(250/(2*D*w)))
            annotation (Placement(transformation(
                origin={56,30},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog.Basic.Resistor Ra(R=250)
            annotation (Placement(transformation(
                origin={56,60},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog.Basic.Resistor Rd2(R=100)
            annotation (Placement(transformation(extent={{-86,22},{-71,38}},
                  rotation=0)));
          Modelica_Electrical_Analog.Basic.Capacitor C(C=0.004*D/w)
            annotation (Placement(transformation(extent={{-14,36},{6,56}}, rotation=
                   0)));
          Modelica_Electrical_Analog.Ideal.IdealOpAmp OpI
            annotation (Placement(transformation(extent={{-14,10},{6,30}}, rotation=
                   0)));
          Modelica_Electrical_Analog.Basic.Resistor Rd1(R=100)
            annotation (Placement(transformation(extent={{-63,37},{-48,53}},
                  rotation=0)));
          Modelica_Electrical_Analog.Basic.Resistor Ri(R=10)
            annotation (Placement(transformation(extent={{-37,17},{-22,33}},
                  rotation=0)));
          Modelica_Electrical_Analog.Basic.Resistor Rp1(R=200)
            annotation (Placement(transformation(extent={{17,38},{32,54}}, rotation=
                   0)));
          Modelica_Electrical_Analog.Basic.Resistor Rp2(R=50)
            annotation (Placement(transformation(
                origin={11,72},
                extent={{-8,-7},{8,7}},
                rotation=90)));
          Modelica_Electrical_Analog.Basic.Resistor Rd4(R=100)
            annotation (Placement(transformation(extent={{-55,-15},{-40,1}},
                  rotation=0)));
          Modelica_Electrical_Analog.Sources.SignalVoltage hall2
            annotation (Placement(transformation(
                origin={-70,-50},
                extent={{-10,10},{10,-10}},
                rotation=90)));
          Modelica_Electrical_Analog.Basic.Resistor Rd3(R=100)
            annotation (Placement(transformation(
                origin={-70,-22},
                extent={{-8,-7},{8,7}},
                rotation=90)));
          Modelica_Electrical_Analog.Basic.Ground g1
            annotation (Placement(transformation(extent={{-100,-37},{-80,-17}},
                  rotation=0)));
          Modelica_Electrical_Analog.Basic.Ground g2
            annotation (Placement(transformation(extent={{-80,-91},{-60,-71}},
                  rotation=0)));
          Modelica_Electrical_Analog.Basic.Ground g3
            annotation (Placement(transformation(extent={{-34,-27},{-14,-7}},
                  rotation=0)));
          Modelica_Electrical_Analog.Sensors.CurrentSensor hall1
            annotation (Placement(transformation(
                origin={16,-50},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog.Basic.Ground g4
            annotation (Placement(transformation(extent={{6,-84},{26,-64}},
                  rotation=0)));
          Modelica_Electrical_Analog.Basic.Ground g5
            annotation (Placement(transformation(
                origin={11,93},
                extent={{-10,-10},{10,10}},
                rotation=180)));
          Modelica_Mechanics_Rotational.Sensors.AngleSensor phi
            annotation (Placement(transformation(
                origin={76,-40},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Mechanics_Rotational.Sensors.SpeedSensor speed
            annotation (Placement(transformation(
                origin={55,-40},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Mechanics_Rotational.Components.Inertia Jmotor(
                                                       J=J)
            annotation (Placement(transformation(extent={{70,-10},{90,10}},
                  rotation=0)));
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus annotation (Placement(transformation(extent={{60,-120},
                    {100,-80}}, rotation=0)));
          Modelica_Blocks.Math.Gain convert1(k(unit="V/A") = 1) annotation (
              Placement(transformation(extent={{-30,-56},{-42,-44}}, rotation=
                   0)));
          Modelica_Blocks.Math.Gain convert2(k(unit="V/A") = 1) annotation (
              Placement(transformation(extent={{-30,-101},{-42,-89}},
                  rotation=0)));
        initial equation
          // initialize motor in steady state
          der(C.v) = 0;
          der(La.i) = 0;

        equation
          connect(La.n, emf.p) annotation (Line(points={{56,20},{56,15},{56,10}}));
          connect(Ra.n, La.p) annotation (Line(points={{56,50},{56,40}}));
          connect(Rd2.n, diff.n1) annotation (Line(points={{-71,30},{-64,30}}));
          connect(C.n, OpI.p2) annotation (Line(points={{6,46},{6,20}}));
          connect(OpI.p2, power.p1) annotation (Line(points={{6,20},{16,20}}));
          connect(Vs.p, Rd2.p) annotation (Line(points={{-90,10},{-90,30},{-86,30}}));
          connect(diff.n1, Rd1.p)
            annotation (Line(points={{-64,30},{-68,30},{-68,45},{-63,45}}));
          connect(Rd1.n, diff.p2) annotation (Line(points={{-48,45},{-44,45},{-44,
                  25}}));
          connect(diff.p2, Ri.p) annotation (Line(points={{-44,25},{-37,25}}));
          connect(Ri.n, OpI.n1) annotation (Line(points={{-22,25},{-14,25}}));
          connect(OpI.n1, C.p) annotation (Line(points={{-14,25},{-14,46}}));
          connect(power.n1, Rp1.p)
            annotation (Line(points={{16,30},{11,30},{11,46},{17,46}}));
          connect(power.p2, Rp1.n) annotation (Line(points={{36,25},{36,46},{32,46}}));
          connect(Rp1.p, Rp2.p) annotation (Line(points={{17,46},{11,46},{11,64}}));
          connect(power.p2, Ra.p)
            annotation (Line(points={{36,25},{42,25},{42,80},{56,80},{56,70}}));
          connect(Rd3.p, hall2.p) annotation (Line(points={{-70,-30},{-70,-60}}));
          connect(Rd3.n, diff.p1) annotation (Line(points={{-70,-14},{-70,20},{-64,
                  20}}));
          connect(Rd3.n, Rd4.p) annotation (Line(points={{-70,-14},{-70,-7},{-55,-7}}));
          connect(Vs.n, g1.p) annotation (Line(points={{-90,-10},{-90,-17}}));
          connect(g2.p, hall2.n) annotation (Line(points={{-70,-71},{-70,-40}}));
          connect(Rd4.n, g3.p) annotation (Line(points={{-40,-7},{-24,-7}}));
          connect(g3.p, OpI.p1) annotation (Line(points={{-24,-7},{-24,15},{-14,15}}));
          connect(g5.p, Rp2.n)
            annotation (Line(points={{11,83},{11,81.5},{11,80}}));
          connect(emf.n, hall1.p)
            annotation (Line(points={{56,-10},{56,-24},{16,-24},{16,-40}}));
          connect(hall1.n, g4.p) annotation (Line(points={{16,-60},{16,-62},{16,-64}}));
          connect(emf.flange, phi.flange)
            annotation (Line(points={{66,0},{66,-30},{76,-30}}, pattern=LinePattern.Dot));
          connect(emf.flange, speed.flange)
            annotation (Line(points={{66,0},{66,-30},{55,-30}}, pattern=LinePattern.Dot));
          connect(OpI.n2, power.n2)
            annotation (Line(points={{-4,10},{-4,4},{26,4},{26,15}}));
          connect(OpI.p1, OpI.n2) annotation (Line(points={{-14,15},{-14,10},{-4,10}}));
          connect(OpI.p1, diff.n2) annotation (Line(points={{-14,15},{-54,15}}));
          connect(Jmotor.flange_b, flange_motor)
            annotation (Line(
              points={{90,0},{100,0}},
              color={128,128,128},
              thickness=0.5));
          connect(phi.phi, axisControlBus.motorAngle)
                                           annotation (Line(points={{76,-51},{76,
                  -100},{80,-100}}, color={0,0,127}));
          connect(speed.w, axisControlBus.motorSpeed)
                                           annotation (Line(points={{55,-51},{55,
                  -95},{80,-95},{80,-100}}, color={0,0,127}));
          connect(hall1.i, axisControlBus.current)
                                        annotation (Line(points={{6,-50},{-10,-50},
                  {-10,-95},{80,-95},{80,-100}}, color={0,0,127}));
          connect(hall1.i, convert1.u) annotation (Line(points={{6,-50},{-28.8,-50}},
                color={0,0,127}));
          connect(convert1.y, hall2.v) annotation (Line(points={{-42.6,-50},{-63,
                  -50}}, color={0,0,127}));
          connect(convert2.u, axisControlBus.current_ref)
                                               annotation (Line(points={{-28.8,-95},
                  {80,-95},{80,-100}}, color={0,0,127}));
          connect(convert2.y, Vs.v) annotation (Line(points={{-42.6,-95},{-108,-95},
                  {-108,0},{-97,0}},                       color={0,0,127}));
          connect(emf.flange, Jmotor.flange_a) annotation (Line(
              points={{66,0},{70,0}},
              color={0,0,0},
              smooth=Smooth.None));
          annotation (
            Documentation(info="<html>
<p>
Default values are given for the motor of joint 1.
The input of the motor is the desired current
(the actual current is proportional to the torque
produced by the motor).
</p>
</html>"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}}), graphics={Text(
                  extent={{0,120},{0,60}},
                  textString="%name",
                  lineColor={0,0,255}), Line(
                  points={{80,-102},{80,-10}},
                  color={255,204,51},
                  thickness=0.5)}));
        end Motor;

        model Controller "P-PI cascade controller for one axis"
          parameter Real kp=10 "Gain of position controller";
          parameter Real ks=1 "Gain of speed controller";
          parameter Modelica_SIunits.Time Ts=0.01
            "Time constant of integrator of speed controller";
          parameter Real ratio=1 "Gear ratio of gearbox";

          Modelica_Blocks.Math.Gain gain1(k=ratio)
            annotation (Placement(transformation(extent={{-70,0},{-50,20}},
                  rotation=0)));
          Modelica_Blocks.Continuous.PI PI(k=ks, T=Ts)
            annotation (Placement(transformation(extent={{60,0},{80,20}}, rotation=
                    0)));
          Modelica_Blocks.Math.Feedback feedback1
            annotation (Placement(transformation(extent={{-46,0},{-26,20}},
                  rotation=0)));
          Modelica_Blocks.Math.Gain P(k=kp) annotation (Placement(transformation(
                  extent={{-16,0},{4,20}}, rotation=0)));
          Modelica_Blocks.Math.Add3 add3(k3=-1) annotation (Placement(
                transformation(extent={{20,0},{40,20}}, rotation=0)));
          Modelica_Blocks.Math.Gain gain2(k=ratio)
            annotation (Placement(transformation(extent={{-60,40},{-40,60}},
                  rotation=0)));
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus annotation (Placement(transformation(extent={{-20,-120},
                    {20,-80}}, rotation=0)));
        equation
          connect(gain1.y, feedback1.u1)
            annotation (Line(points={{-49,10},{-44,10}}, color={0,0,127}));
          connect(feedback1.y, P.u)
            annotation (Line(points={{-27,10},{-18,10}}, color={0,0,127}));
          connect(P.y, add3.u2) annotation (Line(points={{5,10},{18,10}}, color={0,
                  0,127}));
          connect(gain2.y, add3.u1)
            annotation (Line(points={{-39,50},{10,50},{10,18},{18,18}}, color={0,0,
                  127}));
          connect(add3.y, PI.u)
            annotation (Line(points={{41,10},{58,10}}, color={0,0,127}));
          connect(gain2.u, axisControlBus.speed_ref)
                                          annotation (Line(points={{-62,50},{-90,50},
                  {-90,-100},{0,-100}}, color={0,0,127}));
          connect(gain1.u, axisControlBus.angle_ref)
                                          annotation (Line(points={{-72,10},{-80,10},
                  {-80,-100},{0,-100}}, color={0,0,127}));
          connect(feedback1.u2, axisControlBus.motorAngle)
                                                annotation (Line(points={{-36,2},{
                  -36,-100},{0,-100}}, color={0,0,127}));
          connect(add3.u3, axisControlBus.motorSpeed)
                                           annotation (Line(points={{18,2},{0,2},{0,
                  -100}}, color={0,0,127}));
          connect(PI.y, axisControlBus.current_ref)
                                         annotation (Line(points={{81,10},{90,10},{
                  90,-100},{0,-100}}, color={0,0,127}));
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}}), graphics={
                Rectangle(
                  extent={{-100,-100},{100,100}},
                  lineColor={0,0,0},
                  pattern=LinePattern.Solid,
                  lineThickness=0.25,
                  fillColor={235,235,235},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-30,54},{30,24}},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid,
                  lineColor={0,0,255}),
                Polygon(
                  points={{-30,40},{-60,50},{-60,30},{-30,40}},
                  lineColor={0,0,255},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid),
                Line(points={{-31,-41},{-78,-41},{-78,39},{-30,39}}, color={0,0,255}),
                Rectangle(
                  extent={{-30,-26},{30,-56}},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid,
                  lineColor={0,0,255}),
                Polygon(
                  points={{60,-32},{30,-42},{60,-52},{60,-32}},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                  lineColor={0,0,255}),
                Line(points={{30,39},{76,39},{76,-41},{30,-41}}, color={0,0,255}),
                Text(
                  extent={{-100,150},{100,110}},
                  textString="%name",
                  lineColor={0,0,255})}),
            Documentation(info="<html>
<p>
This controller has an inner PI-controller to control the motor speed,
and an outer P-controller to control the motor position of one axis.
The reference signals are with respect to the gear-output, and the
gear ratio is used in the controller to determine the motor
reference signals. All signals are communicated via the
\"axisControlBus\".
</p>
</html>"));
        end Controller;

        model AxisType1 "Axis model of the r3 joints 1,2,3"
          extends AxisType2(redeclare GearType1 gear(c=c, d=cd));
          parameter Real c(unit="N.m/rad") = 43 "Spring constant"
            annotation (Dialog(group="Gear"));
          parameter Real cd(unit="N.m.s/rad") = 0.005 "Damper constant"
            annotation (Dialog(group="Gear"));
        end AxisType1;

        model AxisType2 "Axis model of the r3 joints 4,5,6"
          parameter Real kp=10 "Gain of position controller"
            annotation (Dialog(group="Controller"));
          parameter Real ks=1 "Gain of speed controller"
            annotation (Dialog(group="Controller"));
          parameter Modelica_SIunits.Time Ts=0.01
            "Time constant of integrator of speed controller"
            annotation (Dialog(group="Controller"));
          parameter Real k=1.1616 "Gain of motor"
            annotation (Dialog(group="Motor"));
          parameter Real w=4590 "Time constant of motor"
            annotation (Dialog(group="Motor"));
          parameter Real D=0.6 "Damping constant of motor"
            annotation (Dialog(group="Motor"));
          parameter Modelica_SIunits.Inertia J(min=0) = 0.0013
            "Moment of inertia of motor" annotation (Dialog(group="Motor"));
          parameter Real ratio=-105 "Gear ratio"  annotation (Dialog(group="Gear"));
          parameter Modelica_SIunits.Torque Rv0=0.4
            "Viscous friction torque at zero velocity in [Nm]"
            annotation (Dialog(group="Gear"));
          parameter Real Rv1(unit="N.m.s/rad") = (0.13/160)
            "Viscous friction coefficient in [Nms/rad]"
            annotation (Dialog(group="Gear"));
          parameter Real peak=1
            "Maximum static friction torque is peak*Rv0 (peak >= 1)"
            annotation (Dialog(group="Gear"));

          Modelica_Mechanics_Rotational.Interfaces.Flange_b flange
            annotation (Placement(transformation(extent={{90,-10},{110,10}},
                  rotation=0)));
          replaceable GearType2 gear(
            Rv0=Rv0,
            Rv1=Rv1,
            peak=peak,
            i=ratio) annotation (Placement(transformation(extent={{0,-10},{20,10}},
                  rotation=0)));
          Motor motor(
            J=J,
            k=k,
            w=w,
            D=D) annotation (Placement(transformation(extent={{-30,-10},{-10,10}},
                  rotation=0)));
          RobotR3.Components.Controller controller(
            kp=kp,
            ks=ks,
            Ts=Ts,
            ratio=ratio) annotation (Placement(transformation(extent={{-70,-10},{
                    -50,10}}, rotation=0)));
          Modelica_Mechanics_MultiBody_Examples.Systems.RobotR3.Components.AxisControlBus
            axisControlBus annotation (Placement(transformation(
                origin={-100,0},
                extent={{-20,-20},{20,20}},
                rotation=270)));
          Modelica_Mechanics_Rotational.Sensors.AngleSensor angleSensor
            annotation (Placement(transformation(extent={{30,60},{50,80}}, rotation=
                   0)));
          Modelica_Mechanics_Rotational.Sensors.SpeedSensor speedSensor
            annotation (Placement(transformation(
                origin={40,50},
                extent={{10,10},{-10,-10}},
                rotation=180)));
          Modelica_Mechanics_Rotational.Sensors.AccSensor accSensor
            annotation (Placement(transformation(extent={{30,20},{50,40}}, rotation=
                   0)));
          Modelica_Mechanics_Rotational.Components.InitializeFlange
            initializeFlange(                          stateSelect=StateSelect.prefer)
            annotation (Placement(transformation(extent={{-40,-60},{-20,-40}},
                  rotation=0)));
          Modelica_Blocks.Sources.Constant const(k=0) annotation (Placement(
                transformation(extent={{-65,-65},{-55,-55}}, rotation=0)));
        equation
          connect(gear.flange_b, flange)
            annotation (Line(points={{20,0},{100,0}}, color={0,0,0}));
          connect(gear.flange_b, angleSensor.flange)
            annotation (Line(points={{20,0},{20,70},{30,70}}, color={0,0,0}));
          connect(gear.flange_b, speedSensor.flange)
            annotation (Line(points={{20,0},{24,0},{24,50},{30,50}}, color={0,0,0}));
          connect(motor.flange_motor, gear.flange_a)
            annotation (Line(points={{-10,0},{0,0}}, color={0,0,0}));
          connect(gear.flange_b, accSensor.flange)
            annotation (Line(points={{20,0},{28,0},{28,30},{30,30}}, color={0,0,0}));
          connect(controller.axisControlBus, axisControlBus) annotation (Line(
              points={{-60,-10},{-60,-20},{-95,-20},{-95,-4},{-100,-4},{-100,0}},
              color={255,204,51},
              thickness=0.5));
          connect(motor.axisControlBus, axisControlBus) annotation (Line(
              points={{-12,-10},{-12,-20},{-95,-20},{-95,-5},{-100,-5},{-100,0}},
              color={255,204,51},
              thickness=0.5));
          connect(angleSensor.phi, axisControlBus.angle) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(points={{51,70},{70,70},{70,
                  84},{-98,84},{-98,9},{-100,9},{-100,0}}, color={0,0,127}));
          connect(speedSensor.w, axisControlBus.speed) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(points={{51,50},{74,50},{74,
                  87},{-100,87},{-100,0}}, color={0,0,127}));
          connect(accSensor.a, axisControlBus.acceleration) annotation (
            Text(
              string="%second",
              index=1,
              extent=[6,3; 6,3]), Line(points={{51,30},{77,30},{77,
                  90},{-102,90},{-102,0},{-100,0}}, color={0,0,127}));
          connect(axisControlBus.angle_ref, initializeFlange.phi_start) annotation (
            Text(
              string="%first",
              index=-1,
              extent=[-6,3; -6,3]), Line(points={{-100,0},{-100,-7},{
                  -97,-7},{-97,-42},{-42,-42}}, color={0,0,0}));
          connect(axisControlBus.speed_ref, initializeFlange.w_start) annotation (
            Text(
              string="%first",
              index=-1,
              extent=[-6,3; -6,3]), Line(points={{-100,0},{-99,0},{-99,
                  -50},{-42,-50}}, color={0,0,127}));
          connect(initializeFlange.flange, flange) annotation (Line(points={{-20,
                  -50},{80,-50},{80,0},{100,0}}, color={0,0,0}));
          connect(const.y, initializeFlange.a_start) annotation (Line(points={{-54.5,
                  -60},{-48,-60},{-48,-58},{-42,-58}},       color={0,0,127}));
          annotation (
            Documentation(info="<HTML>
<p>
The axis model consists of the <b>controller</b>, the <b>motor</b> including current
controller and the <b>gearbox</b> including gear elasticity and bearing friction.
The only difference to the axis model of joints 4,5,6 (= model axisType2) is
that elasticity and damping in the gear boxes are not neglected.
</p>
<p>
The input signals of this component are the desired angle and desired angular
velocity of the joint. The reference signals have to be \"smooth\" (position
has to be differentiable at least 2 times). Otherwise, the gear elasticity
leads to significant oscillations.
</p>
<p>
Default values of the parameters are given for the axis of joint 1.
</p>
</html>"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}}), graphics={Rectangle(
                  extent={{-100,50},{100,-50}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={160,160,164}), Text(
                  extent={{-150,57},{150,97}},
                  textString="%name",
                  lineColor={0,0,255})}));
        end AxisType2;

        model MechanicalStructure
          "Model of the mechanical part of the r3 robot (without animation)"
          import Modelica_SIunits.Conversions.to_unit1;

          parameter Boolean animation=true
            "= true, if animation shall be enabled";
          parameter Modelica_SIunits.Mass mLoad(min=0) = 15 "Mass of load";
          parameter Modelica_SIunits.Position rLoad[3]={0,0.25,0}
            "Distance from last flange to load mass>";
          parameter Modelica_SIunits.Acceleration g=9.81 "Gravity acceleration";
          Modelica_SIunits.Angle q[6] "Joint angles";
          Modelica_SIunits.AngularVelocity qd[6] "Joint speeds";
          Modelica_SIunits.AngularAcceleration qdd[6] "Joint accelerations";
          Modelica_SIunits.Torque tau[6] "Joint driving torques";
          //r0={0,0.351,0},

          Modelica_Mechanics_Rotational.Interfaces.Flange_a axis1
            annotation (Placement(transformation(extent={{-220,-180},{-200,-160}},
                  rotation=0)));
          Modelica_Mechanics_Rotational.Interfaces.Flange_a axis2
            annotation (Placement(transformation(extent={{-220,-120},{-200,-100}},
                  rotation=0)));
          Modelica_Mechanics_Rotational.Interfaces.Flange_a axis3
            annotation (Placement(transformation(extent={{-220,-60},{-200,-40}},
                  rotation=0)));
          Modelica_Mechanics_Rotational.Interfaces.Flange_a axis4
            annotation (Placement(transformation(extent={{-220,0},{-200,20}},
                  rotation=0)));
          Modelica_Mechanics_Rotational.Interfaces.Flange_a axis5
            annotation (Placement(transformation(extent={{-220,60},{-200,80}},
                  rotation=0)));
          Modelica_Mechanics_Rotational.Interfaces.Flange_a axis6
            annotation (Placement(transformation(extent={{-220,120},{-200,140}},
                  rotation=0)));
          inner Modelica_Mechanics_MultiBody.World world(
            g=(g)*Modelica_Math.Vectors.length(({0,-1,0})),
            n={0,-1,0},
            animateWorld=false,
            animateGravity=false,
            enableAnimation=animation) annotation (Placement(transformation(
                  extent={{-100,-200},{-80,-180}}, rotation=0)));
          Modelica_Mechanics_MultiBody.Joints.Revolute r1(
            n={0,1,0},
            useAxisFlange=true,
            animation=animation) annotation (Placement(transformation(
                origin={-70,-160},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Joints.Revolute r2(
            n={1,0,0},
            useAxisFlange=true,
            animation=animation) annotation (Placement(transformation(extent=
                    {{-50,-110},{-30,-90}}, rotation=0)));
          Modelica_Mechanics_MultiBody.Joints.Revolute r3(
            n={1,0,0},
            useAxisFlange=true,
            animation=animation) annotation (Placement(transformation(
                origin={-50,-36},
                extent={{-10,-10},{10,10}},
                rotation=180)));
          Modelica_Mechanics_MultiBody.Joints.Revolute r4(
            n={0,1,0},
            useAxisFlange=true,
            animation=animation) annotation (Placement(transformation(
                origin={-70,10},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Joints.Revolute r5(
            n={1,0,0},
            useAxisFlange=true,
            animation=animation) annotation (Placement(transformation(extent=
                    {{-60,70},{-40,90}}, rotation=0)));
          Modelica_Mechanics_MultiBody.Joints.Revolute r6(
            n={0,1,0},
            useAxisFlange=true,
            animation=animation) annotation (Placement(transformation(
                origin={-60,130},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Parts.BodyShape b0(
            r={0,0.351,0},
            shapeType=
                "modelica://Modelica/Resources/Data/Shapes/RobotR3/b0.dxf",
            r_shape={0,0,0},
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            length=0.225,
            width=0.3,
            height=0.3,
            color={0,0,255},
            animation=animation,
            animateSphere=false,
            r_CM={0,0,0},
            m=1) annotation (Placement(transformation(
                origin={-30,-170},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Parts.BodyShape b1(
            r={0,0.324,0.3},
            I_22=1.16,
            shapeType=
                "modelica://Modelica/Resources/Data/Shapes/RobotR3/b1.dxf",
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            length=0.25,
            width=0.15,
            height=0.2,
            animation=animation,
            animateSphere=false,
            color={255,0,0},
            r_CM={0,0,0},
            m=1) annotation (Placement(transformation(
                origin={-70,-118},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Parts.BodyShape b2(
            r={0,0.65,0},
            r_CM={0.172,0.205,0},
            m=56.5,
            I_11=2.58,
            I_22=0.64,
            I_33=2.73,
            I_21=-0.46,
            shapeType=
                "modelica://Modelica/Resources/Data/Shapes/RobotR3/b2.dxf",
            r_shape={0,0,0},
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            length=0.5,
            width=0.2,
            height=0.15,
            animation=animation,
            animateSphere=false,
            color={255,178,0}) annotation (Placement(transformation(
                origin={-16,-70},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Parts.BodyShape b3(
            r={0,0.414,-0.155},
            r_CM={0.064,-0.034,0},
            m=26.4,
            I_11=0.279,
            I_22=0.245,
            I_33=0.413,
            I_21=-0.070,
            shapeType=
                "modelica://Modelica/Resources/Data/Shapes/RobotR3/b3.dxf",
            r_shape={0,0,0},
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            length=0.15,
            width=0.15,
            height=0.15,
            animation=animation,
            animateSphere=false,
            color={255,0,0}) annotation (Placement(transformation(
                origin={-86,-22},
                extent={{-10,10},{10,-10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Parts.BodyShape b4(
            r={0,0.186,0},
            r_CM={0,0,0},
            m=28.7,
            I_11=1.67,
            I_22=0.081,
            I_33=1.67,
            shapeType=
                "modelica://Modelica/Resources/Data/Shapes/RobotR3/b4.dxf",
            r_shape={0,0,0},
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            length=0.73,
            width=0.1,
            height=0.1,
            animation=animation,
            animateSphere=false,
            color={255,178,0}) annotation (Placement(transformation(
                origin={-70,50},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Parts.BodyShape b5(
            r={0,0.125,0},
            r_CM={0,0,0},
            m=5.2,
            I_11=1.25,
            I_22=0.81,
            I_33=1.53,
            shapeType=
                "modelica://Modelica/Resources/Data/Shapes/RobotR3/b5.dxf",
            r_shape={0,0,0},
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            length=0.225,
            width=0.075,
            height=0.1,
            animation=animation,
            animateSphere=false,
            color={0,0,255}) annotation (Placement(transformation(
                origin={-20,98},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Parts.BodyShape b6(
            r={0,0,0},
            r_CM={0.05,0.05,0.05},
            m=0.5,
            shapeType=
                "modelica://Modelica/Resources/Data/Shapes/RobotR3/b6.dxf",
            r_shape={0,0,0},
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            animation=animation,
            animateSphere=false,
            color={0,0,255}) annotation (Placement(transformation(
                origin={-60,160},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica_Mechanics_MultiBody.Parts.BodyShape load(
            r={0,0,0},
            r_CM=rLoad,
            m=mLoad,
            r_shape={0,0,0},
            widthDirection={1,0,0},
            width=0.05,
            height=0.05,
            color={255,0,0},
            lengthDirection=to_unit1(rLoad),
            length=Modelica_Math.Vectors.length(rLoad),
            animation=animation) annotation (Placement(transformation(
                origin={-60,188},
                extent={{-10,-10},{10,10}},
                rotation=90)));
        equation
          connect(r6.frame_b, b6.frame_a)
            annotation (Line(
              points={{-60,140},{-60,150}},
              color={95,95,95},
              thickness=0.5));
          q = {r1.phi,r2.phi,r3.phi,r4.phi,r5.phi,r6.phi};
          qd = der(q);
          qdd = der(qd);
          tau = {r1.tau, r2.tau, r3.tau, r4.tau, r5.tau, r6.tau};
          connect(load.frame_a, b6.frame_b)
            annotation (Line(
              points={{-60,178},{-60,170}},
              color={95,95,95},
              thickness=0.5));
          connect(world.frame_b, b0.frame_a) annotation (Line(
              points={{-80,-190},{-30,-190},{-30,-180}},
              color={95,95,95},
              thickness=0.5));
          connect(b0.frame_b, r1.frame_a) annotation (Line(
              points={{-30,-160},{-30,-146},{-48,-146},{-48,-180},{-70,-180},{-70,
                  -170}},
              color={95,95,95},
              thickness=0.5));
          connect(b1.frame_b, r2.frame_a) annotation (Line(
              points={{-70,-108},{-70,-100},{-50,-100}},
              color={95,95,95},
              thickness=0.5));
          connect(r1.frame_b, b1.frame_a) annotation (Line(
              points={{-70,-150},{-70,-128}},
              color={95,95,95},
              thickness=0.5));
          connect(r2.frame_b, b2.frame_a) annotation (Line(
              points={{-30,-100},{-16,-100},{-16,-80}},
              color={95,95,95},
              thickness=0.5));
          connect(b2.frame_b, r3.frame_a) annotation (Line(
              points={{-16,-60},{-16,-36},{-40,-36}},
              color={95,95,95},
              thickness=0.5));
          connect(r2.axis, axis2) annotation (Line(points={{-40,-90},{-42,-90},{-42,
                  -80},{-160,-80},{-160,-110},{-210,-110}}, color={0,0,0}));
          connect(r1.axis, axis1) annotation (Line(points={{-80,-160},{-160,-160},{
                  -160,-170},{-210,-170}}, color={0,0,0}));
          connect(r3.frame_b, b3.frame_a) annotation (Line(
              points={{-60,-36},{-88,-36},{-86,-32}},
              color={95,95,95},
              thickness=0.5));
          connect(b3.frame_b, r4.frame_a) annotation (Line(
              points={{-86,-12},{-86,-8},{-70,-8},{-70,0}},
              color={95,95,95},
              thickness=0.5));
          connect(r3.axis, axis3)
            annotation (Line(points={{-50,-46},{-50,-50},{-210,-50}}, color={0,0,0}));
          connect(r4.axis, axis4)
            annotation (Line(points={{-80,10},{-210,10}}, color={0,0,0}));
          connect(r4.frame_b, b4.frame_a)
            annotation (Line(
              points={{-70,20},{-70,40}},
              color={95,95,95},
              thickness=0.5));
          connect(b4.frame_b, r5.frame_a) annotation (Line(
              points={{-70,60},{-70,80},{-60,80}},
              color={95,95,95},
              thickness=0.5));
          connect(r5.axis, axis5) annotation (Line(points={{-50,90},{-50,94},{-160,
                  94},{-160,70},{-210,70}}, color={0,0,0}));
          connect(r5.frame_b, b5.frame_a) annotation (Line(
              points={{-40,80},{-20,80},{-20,88}},
              color={95,95,95},
              thickness=0.5));
          connect(b5.frame_b, r6.frame_a) annotation (Line(
              points={{-20,108},{-20,116},{-60,116},{-60,120}},
              color={95,95,95},
              thickness=0.5));
          connect(r6.axis, axis6)
            annotation (Line(points={{-70,130},{-210,130}}, color={0,0,0}));
          annotation (
            Documentation(info="<HTML>
<p>
This model contains the mechanical components of the r3 robot
(multibody system).
</p>
</html>"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-200,-200},{200,200}}), graphics={
                Rectangle(
                  extent={{-200,200},{200,-200}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-200,250},{200,210}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{-200,-150},{-140,-190}},
                  textString="1",
                  lineColor={0,0,255}),
                Text(
                  extent={{-200,-30},{-140,-70}},
                  textString="3",
                  lineColor={0,0,255}),
                Text(
                  extent={{-200,-90},{-140,-130}},
                  textString="2",
                  lineColor={0,0,255}),
                Text(
                  extent={{-200,90},{-140,50}},
                  textString="5",
                  lineColor={0,0,255}),
                Text(
                  extent={{-200,28},{-140,-12}},
                  textString="4",
                  lineColor={0,0,255}),
                Text(
                  extent={{-198,150},{-138,110}},
                  textString="6",
                  lineColor={0,0,255}),
                Bitmap(extent={{-130,195},{195,-195}}, fileName=
                      "modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Systems/robot_kr15.png")}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-200,-200},{200,200}})));
        end MechanicalStructure;

        annotation (Documentation(info="<html>
<p>
This library contains the different components
of the r3 robot. Usually, there is no need to
use this library directly.
</p>
</html>"));
      end Components;

      annotation (
        Documentation(info="<HTML>
<p>
This package contains models of the robot r3 of the company Manutec.
These models are used to demonstrate in which way complex
robot models might be built up by testing first the component
models individually before composing them together.
Furthermore, it is shown how CAD data can be used
for animation.
</p>

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Systems/robot_kr15.png\"
ALT=\"model Examples.Systems.RobotR3\">

<p>
The following models are available:
</p>
<pre>
   <b>oneAxis</b>   Test one axis (controller, motor, gearbox).
   <b>fullRobot</b> Test complete robot model.
</pre>
<p>
The r3 robot is no longer manufactured. In fact the company
Manutec does no longer exist.
The parameters of this robot have been determined by measurements
in the laboratory of DLR. The measurement procedure is described in:
</p>
<pre>
   Tuerk S. (1990): Zur Modellierung der Dynamik von Robotern mit
       rotatorischen Gelenken. Fortschrittberichte VDI, Reihe 8, Nr. 211,
       VDI-Verlag 1990.
</pre>
<p>
The robot model is described in detail in
</p>
<pre>
   Otter M. (1995): Objektorientierte Modellierung mechatronischer
       Systeme am Beispiel geregelter Roboter. Dissertation,
       Fortschrittberichte VDI, Reihe 20, Nr. 147, VDI-Verlag 1995.
       This report can be downloaded as compressed postscript file
       from: <a href=\"http://www.robotic.dlr.de/Martin.Otter\">http://www.robotic.dlr.de/Martin.Otter</a>.
</pre>
<p>
The path planning is performed in a simple way by using essentially
the Modelica.Mechanics.Rotational.KinematicPTP block. A user defines
a path by start and end angle of every axis. A path is planned such
that all axes are moving as fast as possible under the given
restrictions of maximum joint speeds and maximum joint accelerations.
The actual r3 robot from Manutec had a different path planning strategy.
Todays path planning algorithms from robot companies are much
more involved.
</p>
<p>
In order to get a nice animation, CAD data from a KUKA robot
is used, since CAD data of the original r3 robot was not available.
The KUKA CAD data was derived from public data of KUKA available at:
<a href=\"http://www.kuka-roboter.de/english/produkte/cad/low_payloads.html\">
http://www.kuka-roboter.de/english/produkte/cad/low_payloads.html</a>.
Since dimensions of the corresponding KUKA robot are similar but not
identical to the r3 robot, the data of the r3 robot (such as arm lengths) have been modified, such that it matches the CAD data.
</p>
<p>
In this model, a simplified P-PI cascade controller for every
axes is used. The parameters have been manually adjusted by
simulations. The original r3 controllers are more complicated.
The reason to use simplified controllers is to have a simpler demo.
</p>
</html>"));

    end RobotR3;
  annotation ( Documentation(info="<html>
<p>
This package contains complete <b>system models</b> where components
from different domains are used, including 3-dimensional mechanics.
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3\">RobotR3</a><br>
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.oneAxis\">RobotR3.oneAxis</a><br>
<a href=\"modelica://Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.fullRobot\">RobotR3.fullRobot</a></td>
      <td valign=\"top\"> 6 degree of freedom robot with path planning,
           controllers, motors, brakes, gears and mechanics.
           \"oneAxis\" models only one drive train. \"fullRobot\" is
           the complete, detailed robot model.<br>
      <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Systems/r3_fullRobot_small.png\">
      </td>
  </tr>
</table>
</html>"));
  end Systems;
annotation ( Documentation(info="<html>
<p>
This package contains example models to demonstrate the usage of the
MultiBody package. Open the models and
simulate them according to the provided description in the models.
</p>

</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Mechanics_MultiBody_Examples;
