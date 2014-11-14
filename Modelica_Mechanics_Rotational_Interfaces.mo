within ;
package Modelica_Mechanics_Rotational_Interfaces
  "Connectors and partial models for 1D rotational mechanical components"

  extends Modelica_Icons.InterfacesPackage;

  connector Flange_a "1-dim. rotational flange of a shaft (filled square icon)"
    Modelica_SIunits.Angle phi "Absolute rotation angle of flange";
    flow Modelica_SIunits.Torque tau "Cut torque in the flange";
    annotation (
      defaultComponentName="flange_a",
      Documentation(info="<html>
<p>
This is a connector for 1-dim. rotational mechanical systems and models
the mechanical flange of a shaft. The following variables are defined in this connector:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"> <b>phi</b></td>
      <td valign=\"top\"> Absolute rotation angle of the shaft flange in [rad] </td>
  </tr>
  <tr><td valign=\"top\"> <b>tau</b></td>
      <td valign=\"top\"> Cut-torque in the shaft flange in [Nm] </td>
  </tr>
</table>

<p>
There is a second connector for flanges: Flange_b. The connectors
Flange_a and Flange_b are completely identical. There is only a difference
in the icons, in order to easier identify a flange variable in a diagram.
For a discussion on the actual direction of the cut-torque tau and
of the rotation angle, see section
<a href=\"modelica://Modelica.Mechanics.Rotational.UsersGuide.SignConventions\">Sign Conventions</a>
in the user's guide of Rotational.
</p>

<p>
If needed, the absolute angular velocity w and the
absolute angular acceleration a of the flange can be determined by
differentiation of the flange angle phi:
</p>
<pre>
     w = der(phi);    a = der(w)
</pre>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{-160,90},{40,50}},
                lineColor={0,0,0},
                textString="%name"),Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,0},
                fillColor={135,135,135},
                fillPattern=FillPattern.Solid)}));
  end Flange_a;

  connector Flange_b
    "1-dim. rotational flange of a shaft (non-filled square icon)"
    Modelica_SIunits.Angle phi "Absolute rotation angle of flange";
    flow Modelica_SIunits.Torque tau "Cut torque in the flange";
    annotation (
      defaultComponentName="flange_b",
      Documentation(info="<html>
<p>
This is a connector for 1-dim. rotational mechanical systems and models
the mechanical flange of a shaft. The following variables are defined in this connector:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"> <b>phi</b></td>
      <td valign=\"top\"> Absolute rotation angle of the shaft flange in [rad] </td>
  </tr>
  <tr><td valign=\"top\"> <b>tau</b></td>
      <td valign=\"top\"> Cut-torque in the shaft flange in [Nm] </td>
  </tr>
</table>

<p>
There is a second connector for flanges: Flange_a. The connectors
Flange_a and Flange_b are completely identical. There is only a difference
in the icons, in order to easier identify a flange variable in a diagram.
For a discussion on the actual direction of the cut-torque tau and
of the rotation angle, see section
<a href=\"modelica://Modelica.Mechanics.Rotational.UsersGuide.SignConventions\">Sign Conventions</a>
in the user's guide of Rotational.
</p>

<p>
If needed, the absolute angular velocity w and the
absolute angular acceleration a of the flange can be determined by
differentiation of the flange angle phi:
</p>
<pre>
     w = der(phi);    a = der(w)
</pre>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Ellipse(
                extent={{-98,100},{102,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Text(
                extent={{-40,90},{160,50}},
                lineColor={0,0,0},
                textString="%name")}));
  end Flange_b;

  connector Support "Support/housing of a 1-dim. rotational shaft"

    Modelica_SIunits.Angle phi "Absolute rotation angle of the support/housing";
    flow Modelica_SIunits.Torque tau "Reaction torque in the support/housing";

    annotation (
      Documentation(info="<html>
<p>
This is a connector for 1-dim. rotational mechanical systems and models
the support or housing of a shaft. The following variables are defined in this connector:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"> <b>phi</b></td>
      <td valign=\"top\"> Absolute rotation angle of the support/housing in [rad] </td>
  </tr>
  <tr><td valign=\"top\"> <b>tau</b></td>
      <td valign=\"top\"> Reaction torque in the support/housing in [Nm] </td>
  </tr>
</table>

<p>
The support connector is usually defined as conditional connector.
It is most convenient to utilize it
</p>

<ul>
<li> For models to be build graphically (i.e., the model is build up by drag-and-drop
     from elementary components):<br>
     <a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.PartialOneFlangeAndSupport\">PartialOneFlangeAndSupport</a>,<br>
     <a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlangesAndSupport\">PartialTwoFlangesAndSupport</a>, <br> &nbsp; </li>

<li> For models to be build textually (i.e., elementary models):<br>
     <a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport\">PartialElementaryOneFlangeAndSupport</a>,<br>
     <a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport\">PartialElementaryTwoFlangesAndSupport</a>,<br>
     <a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryRotationalToTranslational\">PartialElementaryRotationalToTranslational</a>.</li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},initialScale=0.1), graphics={
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-150,150},{150,-150}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          initialScale=0.1), graphics={Rectangle(
                extent={{-60,60},{60,-60}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-160,100},{40,60}},
                lineColor={0,0,0},
                textString="%name"),Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,0},
                fillColor={135,135,135},
                fillPattern=FillPattern.Solid)}));
  end Support;

  model InternalSupport
    "Adapter model to utilize conditional support connector"
    input Modelica_SIunits.Torque tau
      "External support torque (must be computed via torque balance in model where InternalSupport is used; = flange.tau)";
    Modelica_SIunits.Angle phi "External support angle (= flange.phi)";
    Flange_a flange
      "Internal support flange (must be connected to the conditional support connector for useSupport=true and to conditional fixed model for useSupport=false)"
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  equation
    flange.tau = tau;
    flange.phi = phi;
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Ellipse(
                extent={{-20,20},{20,-20}},
                lineColor={135,135,135},
                fillColor={175,175,175},
                fillPattern=FillPattern.Solid),Text(
                extent={{-200,80},{200,40}},
                lineColor={0,0,255},
                textString="%name")}), Documentation(info="<html>
<p>
This is an adapter model to utilize a conditional support connector
in an elementary component, i.e., where the component equations are
defined textually:
</p>

<ul>
<li> If <i>useSupport = true</i>, the flange has to be connected to the conditional
     support connector.</li>
<li> If <i>useSupport = false</i>, the flange has to be connected to the conditional
     fixed model.</li>
</ul>

<p>
Variable <b>tau</b> is defined as <b>input</b> and must be provided when using
this component as a modifier (computed via a torque balance in
the model where InternalSupport is used). Usually, model InternalSupport is
utilized via the partial models:
</p>

<blockquote>
<a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport\">
PartialElementaryOneFlangeAndSupport</a>,<br>
<a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport\">
PartialElementaryTwoFlangesAndSupport</a>,<br>
<a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryRotationalToTranslational\">
PartialElementaryRotationalToTranslational</a>.
</blockquote>

<p>
Note, the support angle can always be accessed as internalSupport.phi, and
the support torque can always be accessed as internalSupport.tau.
</p>
</html>"));
  end InternalSupport;

  partial model PartialTwoFlanges
    "Partial model for a component with two rotational 1-dim. shaft flanges"

    Flange_a flange_a "Flange of left shaft" annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Flange_b flange_b "Flange of right shaft" annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));
    annotation (Documentation(info="<html>
<p>
This is a 1-dim. rotational component with two flanges.
It is used e.g., to build up parts of a drive train consisting
of several components.
</p>
</html>"));
  end PartialTwoFlanges;

  partial model PartialOneFlangeAndSupport
    "Partial model for a component with one rotational 1-dim. shaft flange and a support used for graphical modeling, i.e., the model is build up by drag-and-drop from elementary components"
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
      annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    Flange_b flange "Flange of shaft" annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
    Support support if useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    Support internalSupport
      "Internal support/housing of component (either connected to support, if useSupport=true, or connected to fixed, if useSupport=false)"
      annotation (Placement(transformation(extent={{-3,-83},{3,-77}})));
    Modelica_Mechanics_Rotational.Components.Fixed fixed if not useSupport
      "Fixed support/housing, if not useSupport"
      annotation (Placement(transformation(extent={{10,-94},{30,-74}})));
  equation
    connect(support, internalSupport) annotation (Line(
        points={{0,-100},{0,-80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(internalSupport, fixed.flange) annotation (Line(
        points={{0,-80},{20,-80},{20,-84}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. rotational component with one flange and a support/housing.
It is used e.g., to build up parts of a drive train graphically consisting
of several components.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</html>"),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{-38,-98},{-6,-96}},
                lineColor={95,95,95},
                textString="(if useSupport)"),Text(
                extent={{21,-95},{61,-96}},
                lineColor={95,95,95},
                textString="(if not useSupport)")}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Line(
                visible=not useSupport,
                points={{-50,-120},{-30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-120},{-10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-10,-120},{10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{10,-120},{30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-100},{30,-100}},
                color={0,0,0})}));
  end PartialOneFlangeAndSupport;

  partial model PartialTwoFlangesAndSupport
    "Partial model for a component with two rotational 1-dim. shaft flanges and a support used for graphical modeling, i.e., the model is build up by drag-and-drop from elementary components"
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
      annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    Flange_a flange_a "Flange of left shaft" annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Flange_b flange_b "Flange of right shaft" annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));
    Support support if useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    Support internalSupport
      "Internal support/housing of component (either connected to support, if useSupport=true, or connected to fixed, if useSupport=false)"
      annotation (Placement(transformation(extent={{-3,-83},{3,-77}})));
    Modelica_Mechanics_Rotational.Components.Fixed fixed if not useSupport
      "Fixed support/housing, if not useSupport"
      annotation (Placement(transformation(extent={{10,-97},{30,-77}})));
  equation
    connect(support, internalSupport) annotation (Line(
        points={{0,-100},{0,-80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(internalSupport, fixed.flange) annotation (Line(
        points={{0,-80},{20,-80},{20,-87}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. rotational component with two flanges and a support/housing.
It is used e.g., to build up parts of a drive train graphically consisting
of several components.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</html>"),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{-38,-98},{-6,-96}},
                lineColor={95,95,95},
                textString="(if useSupport)"),Text(
                extent={{24,-97},{64,-98}},
                lineColor={95,95,95},
                textString="(if not useSupport)")}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Line(
                visible=not useSupport,
                points={{-50,-120},{-30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-120},{-10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-10,-120},{10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{10,-120},{30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-100},{30,-100}},
                color={0,0,0})}));
  end PartialTwoFlangesAndSupport;

  partial model PartialCompliant
    "Partial model for the compliant connection of two rotational 1-dim. shaft flanges"

    Modelica_SIunits.Angle phi_rel(start=0)
      "Relative rotation angle (= flange_b.phi - flange_a.phi)";
    Modelica_SIunits.Torque tau "Torque between flanges (= flange_b.tau)";
    Flange_a flange_a "Left flange of compliant 1-dim. rotational component"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));
    Flange_b flange_b "Right flange of compliant 1-dim. rotational component"
      annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));

  equation
    phi_rel = flange_b.phi - flange_a.phi;
    flange_b.tau = tau;
    flange_a.tau = -tau;
    annotation (Documentation(info="<html>
<p>
This is a 1-dim. rotational component with a compliant connection of two
rotational 1-dim. flanges where inertial effects between the two
flanges are neglected. The basic assumption is that the cut-torques
of the two flanges sum-up to zero, i.e., they have the same absolute value
but opposite sign: flange_a.tau + flange_b.tau = 0. This base class
is used to built up force elements such as springs, dampers, friction.
</p>
</html>"));
  end PartialCompliant;

  partial model PartialCompliantWithRelativeStates
    "Partial model for the compliant connection of two rotational 1-dim. shaft flanges where the relative angle and speed are used as preferred states"

    Modelica_SIunits.Angle phi_rel(
      start=0,
      stateSelect=stateSelect,
      nominal=if phi_nominal >=Modelica_Constants.eps  then phi_nominal else
          1) "Relative rotation angle (= flange_b.phi - flange_a.phi)";
    Modelica_SIunits.AngularVelocity w_rel(start=0, stateSelect=stateSelect)
      "Relative angular velocity (= der(phi_rel))";
    Modelica_SIunits.AngularAcceleration a_rel(start=0)
      "Relative angular acceleration (= der(w_rel))";
    Modelica_SIunits.Torque tau "Torque between flanges (= flange_b.tau)";
    Flange_a flange_a "Left flange of compliant 1-dim. rotational component"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));
    Flange_b flange_b "Right flange of compliant 1-dim. rotational component"
      annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));

    parameter Modelica_SIunits.Angle phi_nominal(
      displayUnit="rad",
      min=0.0) = 1e-4 "Nominal value of phi_rel (used for scaling)"
      annotation (Dialog(tab="Advanced"));
    parameter StateSelect stateSelect=StateSelect.prefer
      "Priority to use phi_rel and w_rel as states"
      annotation (HideResult=true, Dialog(tab="Advanced"));

  equation
    phi_rel = flange_b.phi - flange_a.phi;
    w_rel = der(phi_rel);
    a_rel = der(w_rel);
    flange_b.tau = tau;
    flange_a.tau = -tau;
    annotation (Documentation(info="<html>
<p>
This is a 1-dim. rotational component with a compliant connection of two
rotational 1-dim. flanges where inertial effects between the two
flanges are neglected. The basic assumption is that the cut-torques
of the two flanges sum-up to zero, i.e., they have the same absolute value
but opposite sign: flange_a.tau + flange_b.tau = 0. This base class
is used to built up force elements such as springs, dampers, friction.
</p>

<p>
The relative angle and the relative speed are defined as preferred states.
The reason is that for some drive trains, such as drive
trains in vehicles, the absolute angle is quickly increasing during operation.
Numerically, it is better to use relative angles between drive train components
because they remain in a limited size. For this reason, StateSelect.prefer
is set for the relative angle of this component.
</p>

<p>
In order to improve the numerics, a nominal value for the relative angle
can be provided via parameter <b>phi_nominal</b> in the Advanced menu.
The default is 1e-4 rad since relative angles are usually
in this order and the step size control of an integrator would be
practically switched off, if a default of 1 rad would be used.
This nominal value might also be computed from other values, such
as \"phi_nominal = tau_nominal / c\" for a rotational spring, if tau_nominal
and c are more meaningful for the user.
</p>

<p>
See also the discussion
<a href=\"modelica://Modelica.Mechanics.Rotational.UsersGuide.StateSelection\">State Selection</a>
in the User's Guide of the Rotational library.
</p>
</html>"));
  end PartialCompliantWithRelativeStates;

  partial model PartialElementaryOneFlangeAndSupport
    "Obsolete partial model. Use PartialElementaryOneFlangeAndSupport2."
    extends Modelica_Icons.ObsoleteModel;
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
      annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    Flange_b flange "Flange of shaft" annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
    Support support if useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    InternalSupport internalSupport(tau=-flange.tau)
      "Internal support/housing of component as a model with connector flange (flange is either connected to support, if useSupport=true, or connected to fixed, if useSupport=false)"
      annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
    Modelica_Mechanics_Rotational.Components.Fixed fixed if not useSupport
      "Fixed support/housing, if not useSupport"
      annotation (Placement(transformation(extent={{10,-96},{30,-76}})));
  equation
    connect(internalSupport.flange, support) annotation (Line(
        points={{0,-80},{0,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(internalSupport.flange, fixed.flange) annotation (Line(
        points={{0,-80},{20,-80},{20,-86}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. rotational component with one flange and a support/housing.
It is used to build up elementary components of a drive train with
equations in the text layer.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</html>"),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{25,-97},{65,-98}},
                lineColor={95,95,95},
                textString="(if not useSupport)"),Text(
                extent={{-38,-98},{-6,-96}},
                lineColor={95,95,95},
                textString="(if useSupport)")}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Line(
                visible=not useSupport,
                points={{-50,-120},{-30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-120},{-10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-10,-120},{10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{10,-120},{30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-100},{30,-100}},
                color={0,0,0})}));
  end PartialElementaryOneFlangeAndSupport;

  partial model PartialElementaryOneFlangeAndSupport2
    "Partial model for a component with one rotational 1-dim. shaft flange and a support used for textual modeling, i.e., for elementary models"
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
      annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    Flange_b flange "Flange of shaft" annotation (Placement(transformation(
            extent={{90,-10},{110,10}}, rotation=0)));
    Support support(phi=phi_support, tau=-flange.tau) if useSupport
      "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    Modelica_SIunits.Angle phi_support "Absolute angle of support flange";
  equation
    if not useSupport then
      phi_support = 0;
    end if;
    annotation (Documentation(info="<html>
<p>
This is a 1-dim. rotational component with one flange and a support/housing.
It is used to build up elementary components of a drive train with
equations in the text layer.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</html>"),
         Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}),graphics={Line(
                visible=not useSupport,
                points={{-50,-120},{-30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-120},{-10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-10,-120},{10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{10,-120},{30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-100},{30,-100}},
                color={0,0,0})}));
  end PartialElementaryOneFlangeAndSupport2;

  partial model PartialElementaryTwoFlangesAndSupport
    "Obsolete partial model. Use PartialElementaryTwoFlangesAndSupport2."
    extends Modelica_Icons.ObsoleteModel;
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
      annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    Flange_a flange_a "Flange of left shaft" annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Flange_b flange_b "Flange of right shaft" annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));
    Support support if useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    InternalSupport internalSupport(tau=-flange_a.tau - flange_b.tau)
      "Internal support/housing of component as a model with connector flange (flange is either connected to support, if useSupport=true, or connected to fixed, if useSupport=false)"
      annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
    Modelica_Mechanics_Rotational.Components.Fixed fixed if not useSupport
      "Fixed support/housing, if not useSupport"
      annotation (Placement(transformation(extent={{10,-97},{30,-77}})));
  equation
    connect(internalSupport.flange, support) annotation (Line(
        points={{0,-80},{0,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(internalSupport.flange, fixed.flange) annotation (Line(
        points={{0,-80},{20,-80},{20,-87}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. rotational component with two flanges and a support/housing.
It is used to build up elementary components of a drive train with
equations in the text layer.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</html>"),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{24,-97},{64,-98}},
                lineColor={95,95,95},
                textString="(if not useSupport)"),Text(
                extent={{-38,-98},{-6,-96}},
                lineColor={95,95,95},
                textString="(if useSupport)")}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Line(
                visible=not useSupport,
                points={{-50,-120},{-30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-120},{-10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-10,-120},{10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{10,-120},{30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-100},{30,-100}},
                color={0,0,0})}));
  end PartialElementaryTwoFlangesAndSupport;

  partial model PartialElementaryTwoFlangesAndSupport2
    "Partial model for a component with two rotational 1-dim. shaft flanges and a support used for textual modeling, i.e., for elementary models"
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
      annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    Flange_a flange_a "Flange of left shaft" annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Flange_b flange_b "Flange of right shaft" annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));
    Support support(phi=phi_support, tau=-flange_a.tau - flange_b.tau) if
      useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    Modelica_SIunits.Angle phi_support "Absolute angle of support flange";
  equation
    if not useSupport then
      phi_support = 0;
    end if;

    annotation (Documentation(info="<html>
<p>
This is a 1-dim. rotational component with two flanges and a support/housing.
It is used to build up elementary components of a drive train with
equations in the text layer.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</html>"),
         Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}),graphics={Line(
                visible=not useSupport,
                points={{-50,-120},{-30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-120},{-10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-10,-120},{10,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{10,-120},{30,-100}},
                color={0,0,0}),Line(
                visible=not useSupport,
                points={{-30,-100},{30,-100}},
                color={0,0,0})}));
  end PartialElementaryTwoFlangesAndSupport2;

  partial model PartialElementaryRotationalToTranslational
    "Partial model to transform rotational into translational motion"
    parameter Boolean useSupportR=false
      "= true, if rotational support flange enabled, otherwise implicitly grounded"
      annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    parameter Boolean useSupportT=false
      "= true, if translational support flange enabled, otherwise implicitly grounded"
      annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true));
    Flange_a flangeR "Flange of rotational shaft" annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Modelica_Mechanics_Translational_Interfaces.Flange_b flangeT
      "Flange of translational rod" annotation (Placement(transformation(
            extent={{90,10},{110,-10}}, rotation=0)));
    Support supportR if useSupportR "Rotational support/housing of component"
      annotation (Placement(transformation(extent={{-110,-110},{-90,-90}},
            rotation=0), iconTransformation(extent={{-110,-110},{-90,-90}})));
    Modelica_Mechanics_Translational_Interfaces.Support supportT if
                                                 useSupportT
      "Translational support/housing of component" annotation (Placement(
          transformation(extent={{110,-110},{90,-90}}, rotation=0),
          iconTransformation(extent={{90,-110},{110,-90}})));

  protected
    InternalSupport internalSupportR(tau=-flangeR.tau)
      annotation (Placement(transformation(extent={{-110,-90},{-90,-70}})));
    Modelica_Mechanics_Translational_Interfaces.InternalSupport
      internalSupportT(f=-flangeT.f)
      annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
    Modelica_Mechanics_Rotational.Components.Fixed fixedR if not useSupportR
      annotation (Placement(transformation(extent={{-90,-90},{-70,-70}})));
    Modelica_Mechanics_Translational.Components.Fixed fixedT if
                                             not useSupportT
      annotation (Placement(transformation(extent={{70,-90},{90,-70}})));
  equation
    connect(internalSupportR.flange, supportR) annotation (Line(
        points={{-100,-80},{-100,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(internalSupportR.flange, fixedR.flange) annotation (Line(
        points={{-100,-80},{-80,-80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(fixedT.flange, internalSupportT.flange) annotation (Line(
        points={{80,-80},{100,-80}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(internalSupportT.flange, supportT) annotation (Line(
        points={{100,-80},{100,-100}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>

<p>
This is a 1-dim. rotational component with
</p>

<ul>
<li> one rotational flange, </li>
<li> one rotational support/housing, </li>
<li> one translational flange, and </li>
<li> one translational support/housing </li>
</ul>

<p>
This model is used to build up elementary components of a drive train
transforming rotational into translational motion with
equations in the text layer.
</p>

<p>
If <i>useSupportR=true</i>, the rotational support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupportR=false</i>, the rotational support connector is conditionally disabled
and instead the rotational part is internally fixed to ground.<br>
If <i>useSupportT=true</i>, the translational support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupportT=false</i>, the translational support connector is conditionally disabled
and instead the translational part is internally fixed to ground.
</p>
</html>"),
         Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Line(
            visible=not useSupportT,
            points={{85,-110},{95,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupportT,
            points={{95,-110},{105,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupportT,
            points={{105,-110},{115,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupportT,
            points={{85,-100},{115,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupportR,
            points={{-115,-110},{-105,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupportR,
            points={{-105,-110},{-95,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupportR,
            points={{-95,-110},{-85,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupportR,
            points={{-115,-100},{-85,-100}},
            color={0,0,0})}));
  end PartialElementaryRotationalToTranslational;

  partial model PartialTorque
    "Partial model of a torque acting at the flange (accelerates the flange)"
    extends
      Modelica_Mechanics_Rotational_Interfaces.PartialElementaryOneFlangeAndSupport2;
    Modelica_SIunits.Angle phi
      "Angle of flange with respect to support (= flange.phi - support.phi)";

  equation
    phi = flange.phi - phi_support;
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-96,96},{96,-96}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{0,-62},{0,-100}}, color={0,0,0}),
          Line(points={{-92,0},{-76,36},{-54,62},{-30,80},{-14,88},{10,92},{
                26,90},{46,80},{64,62}}, color={0,0,0}, smooth=Smooth.Bezier),
          Text(
            extent={{-150,140},{150,100}},
            lineColor={0,0,255},
            textString="%name"),
          Polygon(
            points={{94,16},{80,74},{50,52},{94,16}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Line(points={{-58,-82},{-42,-68},{-20,-56},{0,-54},{18,-56},{34,-62},
                {44,-72},{54,-82},{60,-94}}, color={0,0,0}, smooth=Smooth.Bezier),
          Polygon(
            points={{-65,-98},{-46,-80},{-58,-72},{-65,-98}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Line(
            visible=not useSupport,
            points={{-50,-120},{-30,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupport,
            points={{-30,-120},{-10,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupport,
            points={{-10,-120},{10,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupport,
            points={{10,-120},{30,-100}},
            color={0,0,0}),
          Line(
            visible=not useSupport,
            points={{-30,-100},{30,-100}},
            color={0,0,0})}), Documentation(info="<HTML>
<p>
Partial model of torque that accelerates the flange.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</html>"));
  end PartialTorque;

  partial model PartialAbsoluteSensor
    "Partial model to measure a single absolute flange variable"
    extends Modelica_Icons.RotationalSensor;

    Flange_a flange
      "Flange of shaft from which sensor information shall be measured"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));

  equation
    0 = flange.tau;
    annotation (Documentation(info="<html>
<p>
This is a partial model of a 1-dim. rotational component with one flange of a shaft
in order to measure an absolute kinematic quantity in the flange
and to provide the measured signal as output signal for further processing
with the blocks of package Modelica.Blocks.
</p>
</html>"),
         Icon(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}},
        initialScale=0.1),
        graphics={
      Line(points={{-70.0,0.0},{-90.0,0.0}}),
      Line(points={{70.0,0.0},{100.0,0.0}},
        color={0,0,127}),
      Text(lineColor={0,0,255},
        extent={{-150.0,80.0},{150.0,120.0}},
        textString="%name")}));
  end PartialAbsoluteSensor;

  partial model PartialRelativeSensor
    "Partial model to measure a single relative variable between two flanges"
    extends Modelica_Icons.RotationalSensor;

    Flange_a flange_a "Left flange of shaft" annotation (Placement(
          transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Flange_b flange_b "Right flange of shaft" annotation (Placement(
          transformation(extent={{90,-10},{110,10}}, rotation=0)));

  equation
    0 = flange_a.tau + flange_b.tau;
    annotation (Documentation(info="<html>
<p>
This is a partial model for 1-dim. rotational components with two rigidly connected
flanges in order to measure relative kinematic quantities
between the two flanges or the cut-torque in the flange and
to provide the measured signal as output signal for further processing
with the blocks of package Modelica.Blocks.
</p>
</html>"),
         Icon(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}},
        initialScale=0.1),
        graphics={
      Line(points={{-70.0,0.0},{-90.0,0.0}}),
      Line(points={{70.0,0.0},{90.0,0.0}}),
      Text(lineColor={0,0,255},
        extent={{-150.0,73.0},{150.0,113.0}},
        textString="%name")}));
  end PartialRelativeSensor;

  partial model PartialFriction "Partial model of Coulomb friction elements"

    // parameter SI.AngularVelocity w_small=1 "Relative angular velocity near to zero (see model info text)";
    parameter Modelica_SIunits.AngularVelocity w_small=1.0e10
      "Relative angular velocity near to zero if jumps due to a reinit(..) of the velocity can occur (set to low value only if such impulses can occur)"
      annotation (Dialog(tab="Advanced"));
    // Equations to define the following variables have to be defined in subclasses
    Modelica_SIunits.AngularVelocity w_relfric
      "Relative angular velocity between frictional surfaces";
    Modelica_SIunits.AngularAcceleration a_relfric
      "Relative angular acceleration between frictional surfaces";
    //SI.Torque tau "Friction torque (positive, if directed in opposite direction of w_rel)";
    Modelica_SIunits.Torque tau0 "Friction torque for w=0 and forward sliding";
    Modelica_SIunits.Torque tau0_max
      "Maximum friction torque for w=0 and locked";
    Boolean free "true, if frictional element is not active";
    // Equations to define the following variables are given in this class
    Real sa(final unit="1")
      "Path parameter of friction characteristic tau = f(a_relfric)";
    Boolean startForward(start=false, fixed=true)
      "true, if w_rel=0 and start of forward sliding";
    Boolean startBackward(start=false, fixed=true)
      "true, if w_rel=0 and start of backward sliding";
    Boolean locked(start=false) "true, if w_rel=0 and not sliding";
    constant Integer Unknown=3 "Value of mode is not known";
    constant Integer Free=2 "Element is not active";
    constant Integer Forward=1 "w_rel > 0 (forward sliding)";
    constant Integer Stuck=0
      "w_rel = 0 (forward sliding, locked or backward sliding)";
    constant Integer Backward=-1 "w_rel < 0 (backward sliding)";
    Integer mode(
      final min=Backward,
      final max=Unknown,
      start=Unknown,
      fixed=true);
  protected
    constant Modelica_SIunits.AngularAcceleration unitAngularAcceleration=1
      annotation (HideResult=true);
    constant Modelica_SIunits.Torque unitTorque=1 annotation (HideResult=true);
  equation
    /* Friction characteristic
   locked is introduced to help the Modelica translator determining
   the different structural configurations,
   if for each configuration special code shall be generated
*/
    startForward = pre(mode) == Stuck and (sa > tau0_max/unitTorque or pre(
      startForward) and sa > tau0/unitTorque) or pre(mode) == Backward and
      w_relfric > w_small or initial() and (w_relfric > 0);
    startBackward = pre(mode) == Stuck and (sa < -tau0_max/unitTorque or pre(
      startBackward) and sa < -tau0/unitTorque) or pre(mode) == Forward and
      w_relfric < -w_small or initial() and (w_relfric < 0);
    locked = not free and not (pre(mode) == Forward or startForward or pre(
      mode) == Backward or startBackward);

    a_relfric/unitAngularAcceleration = if locked then 0 else if free then sa
       else if startForward then sa - tau0_max/unitTorque else if
      startBackward then sa + tau0_max/unitTorque else if pre(mode) ==
      Forward then sa - tau0_max/unitTorque else sa + tau0_max/unitTorque;

    /* Friction torque has to be defined in a subclass. Example for a clutch:
   tau = if locked then sa else
         if free then   0 else
         cgeo*fn*(if startForward then          Modelica.Math.Vectors.interpolate(mue_pos[:,1], mue_pos[:,2], w_relfric, 1) else
                  if startBackward then        -Modelica.Math.Vectors.interpolate(mue_pos[:,1], mue_pos[:,2], -w_relfric, 1) else
                  if pre(mode) == Forward then  Modelica.Math.Vectors.interpolate(mue_pos[:,1], mue_pos[:,2], w_relfric, 1) else
                                               -Modelica.Math.Vectors.interpolate(mue_pos[:,1], mue_pos[:,2], -w_relfric, 1));
*/
    // finite state machine to determine configuration
    mode = if free then Free else (if (pre(mode) == Forward or pre(mode) ==
      Free or startForward) and w_relfric > 0 then Forward else if (pre(mode)
       == Backward or pre(mode) == Free or startBackward) and w_relfric < 0
       then Backward else Stuck);
    annotation (Documentation(info="<html>
<p>
Basic model for Coulomb friction that models the stuck phase in a reliable way.
</p>
</html>"));
  end PartialFriction;

  annotation (Documentation(info="<html>
<p>
This package contains connectors and partial models for 1-dim.
rotational mechanical components. The components of this package can
only be used as basic building elements for models.
</p>
</html>"));
end Modelica_Mechanics_Rotational_Interfaces;
