within ;
package Modelica_Mechanics_Translational_Interfaces
  "Interfaces for 1-dim. translational mechanical components"
    extends Modelica_Icons.InterfacesPackage;

  connector Flange_a
    "(left) 1D translational flange (flange axis directed INTO cut plane, e. g. from left to right)"

    Modelica_SIunits.Position s "Absolute position of flange";
    flow Modelica_SIunits.Force f "Cut force directed into flange";
    annotation(defaultComponentName = "flange_a",
      Documentation(info="<html>
<p>
This is a flange for 1D translational mechanical systems. In the cut plane of
the flange a unit vector n, called flange axis, is defined which is directed
INTO the cut plane, i. e. from left to right. All vectors in the cut plane are
resolved with respect to
this unit vector. E.g. force f characterizes a vector which is directed in
the direction of n with value equal to f. When this flange is connected to
other 1D translational flanges, this means that the axes vectors of the connected
flanges are identical.
</p>
<p>
The following variables are transported through this connector:
</p>
<pre>
  s: Absolute position of the flange in [m]. A positive translation
     means that the flange is translated along the flange axis.
  f: Cut-force in direction of the flange axis in [N].
</pre>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,127,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}), graphics={Rectangle(
            extent={{-40,-40},{40,40}},
            lineColor={0,127,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid), Text(
            extent={{-160,110},{40,50}},
            lineColor={0,127,0},
            textString="%name")}));
  end Flange_a;

  connector Flange_b
    "(right) 1D translational flange (flange axis directed OUT OF cut plane)"

    Modelica_SIunits.Position s "Absolute position of flange";
    flow Modelica_SIunits.Force f "Cut force directed into flange";
    annotation(defaultComponentName = "flange_b",
      Documentation(info="<html>
<p>
This is a flange for 1D translational mechanical systems. In the cut plane of
the flange a unit vector n, called flange axis, is defined which is directed
OUT OF the cut plane. All vectors in the cut plane are resolved with respect to
this unit vector. E.g. force f characterizes a vector which is directed in
the direction of n with value equal to f. When this flange is connected to
other 1D translational flanges, this means that the axes vectors of the connected
flanges are identical.
</p>
<p>
The following variables are transported through this connector:
<pre>
  s: Absolute position of the flange in [m]. A positive translation
     means that the flange is translated along the flange axis.
  f: Cut-force in direction of the flange axis in [N].
</pre>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Rectangle(
            extent={{-40,-40},{40,40}},
            lineColor={0,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-40,110},{160,50}},
            lineColor={0,127,0},
            textString="%name")}));
  end Flange_b;

  connector Support "Support/housing 1D translational flange"

    Modelica_SIunits.Position s "Absolute position of flange";
    flow Modelica_SIunits.Force f "Cut force directed into flange";
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-60,60},{60,-60}},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None),
          Text(
            extent={{-160,110},{40,50}},
            lineColor={0,127,0},
            textString="%name"),
          Rectangle(
            extent={{-40,-40},{40,40}},
            lineColor={0,127,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid)}), Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={Rectangle(
            extent={{-90,-90},{90,90}},
            lineColor={0,127,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid), Rectangle(
            extent={{-150,150},{150,-150}},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None), Rectangle(
            extent={{-90,-90},{90,90}},
            lineColor={0,127,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>This is a connector for 1-dim. rotational mechanical systems and models the support or housing of a shaft. The following variables are defined in this connector:</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><h4>s</h4></td>
<td valign=\"top\"><p>Absolute position of the support/housing in [m]</p></td>
</tr>
<tr>
<td valign=\"top\"><h4>f</h4></td>
<td valign=\"top\"><p>Reaction force in the support/housing in [N]</p></td>
</tr>
</table>
<p><br/>The support connector is usually defined as conditional connector. It is most convenient to utilize it</p>
<ul>
<li>For models to be build graphically (i.e., the model is build up by drag-and-drop from elementary components):<br/><a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.PartialOneFlangeAndSupport\">PartialOneFlangeAndSupport</a>,<br/><a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.PartialTwoFlangesAndSupport\">PartialTwoFlangesAndSupport</a>, <br/>&nbsp; </li>
<li>For models to be build textually (i.e., elementary models):<br/><a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryOneFlangeAndSupport\">PartialElementaryOneFlangeAndSupport</a>,<br/><a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryTwoFlangesAndSupport\">PartialElementaryTwoFlangesAndSupport</a>,<br/><a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryRotationalToTranslational\">PartialElementaryRotationalToTranslational</a>. </li>
</ul>
</html>"));
  end Support;

  model InternalSupport
    "Adapter model to utilize conditional support connector"
    input Modelica_SIunits.Force f
      "External support force (must be computed via force balance in model where InternalSupport is used; = flange.f)";
    Modelica_SIunits.Position s "External support position (= flange.s)";
    Flange_a flange
      "Internal support flange (must be connected to the conditional support connector for useSupport=true and to conditional fixed model for useSupport=false)"
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  equation
    flange.f = f;
    flange.s = s;
    annotation ( Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={Text(
            extent={{-200,80},{200,40}},
            lineColor={0,0,255},
            textString="%name"), Rectangle(
            extent={{-20,20},{20,-20}},
            lineColor={0,127,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
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
Variable <b>f</b> is defined as <b>input</b> and must be provided when using
this component as a modifier (computed via a force balance in
the model where InternalSupport is used). Usually, model InternalSupport is
utilized via the partial models:
</p>

<blockquote>
<a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryOneFlangeAndSupport\">
PartialElementaryOneFlangeAndSupport</a>,<br>
<a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryTwoFlangesAndSupport\">
PartialElementaryTwoFlangesAndSupport</a>,<br>
<a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryRotationalToTranslational\">
PartialElementaryRotationalToTranslational</a>.
</blockquote>

<p>
Note, the support position can always be accessed as internalSupport.s, and
the support force can always be accessed as internalSupport.f.
</p>
</html>"));
  end InternalSupport;

  partial model PartialTwoFlanges "Component with two translational 1D flanges"

    Flange_a flange_a
      "(left) driving flange (flange axis directed in to cut plane, e. g. from left to right)"
       annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));
    Flange_b flange_b
      "(right) driven flange (flange axis directed out of cut plane)"
      annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));
    annotation (
      Documentation(info="<html>
<p>
This is a 1D translational component with two flanges.
It is used e.g., to built up parts of a drive train consisting
of several base components.
</p>
</html>"));
  end PartialTwoFlanges;

  partial model PartialOneFlangeAndSupport
    "Partial model for a component with one translational 1-dim. shaft flange and a support used for graphical modeling, i.e., the model is build up by drag-and-drop from elementary components"
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    Flange_b flange "Flange of component"
      annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
    Support support if useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    Support internalSupport
      "Internal support/housing of component (either connected to support, if useSupport=true, or connected to fixed, if useSupport=false)"
      annotation (Placement(transformation(extent={{-3,-83},{3,-77}})));
    Modelica_Mechanics_Translational.Components.Fixed fixed if not useSupport
      "Fixed support/housing, if not useSupport"
      annotation (Placement(transformation(extent={{10,-94},{30,-74}})));
  equation
    connect(fixed.flange, internalSupport) annotation (Line(
        points={{20,-84},{20,-80},{0,-80}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(internalSupport, support) annotation (Line(
        points={{0,-80},{0,-100}},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. translational component with one flange and a support/housing.
It is used e.g., to build up parts of a drive train graphically consisting
of several components.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>

</html>"),   Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
            extent={{-38,-98},{-6,-96}},
            lineColor={95,95,95},
            textString="(if useSupport)"), Text(
            extent={{21,-95},{61,-96}},
            lineColor={95,95,95},
            textString="(if not useSupport)")}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
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
            color={0,0,0})}));
  end PartialOneFlangeAndSupport;

  partial model PartialTwoFlangesAndSupport
    "Partial model for a component with two translational 1-dim. shaft flanges and a support used for graphical modeling, i.e., the model is build up by drag-and-drop from elementary components"
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    Flange_a flange_a "Flange of left end"
      annotation (Placement(transformation(extent={{-110,-10}, {-90,10}}, rotation=0)));
    Flange_b flange_b "Flange of right end"
      annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
    Support support if useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    Support internalSupport
      "Internal support/housing of component (either connected to support, if useSupport=true, or connected to fixed, if useSupport=false)"
      annotation (Placement(transformation(extent={{-3,-83},{3,-77}})));
    Modelica_Mechanics_Translational.Components.Fixed fixed if not useSupport
      "Fixed support/housing, if not useSupport"
      annotation (Placement(transformation(extent={{10,-97},{30,-77}})));
  equation
    connect(fixed.flange, internalSupport) annotation (Line(
        points={{20,-87},{20,-80},{0,-80}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(internalSupport, support) annotation (Line(
        points={{0,-80},{0,-100}},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. translational component with two flanges and a support/housing.
It is used e.g., to build up parts of a drive train graphically consisting
of several components.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>

</html>"),   Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
            extent={{-38,-98},{-6,-96}},
            lineColor={95,95,95},
            textString="(if useSupport)"), Text(
            extent={{24,-97},{64,-98}},
            lineColor={95,95,95},
            textString="(if not useSupport)")}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
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
            color={0,0,0})}));
  end PartialTwoFlangesAndSupport;

  partial model PartialRigid "Rigid connection of two translational 1D flanges"
    Modelica_SIunits.Position s
      "Absolute position of center of component (s = flange_a.s + L/2 = flange_b.s - L/2)";
    parameter Modelica_SIunits.Length L(start=0)
      "Length of component, from left flange to right flange (= flange_b.s - flange_a.s)";
    Flange_a flange_a "Left flange of translational component"
       annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));
    Flange_b flange_b "Right flange of translational component"
       annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));
  equation
    flange_a.s = s - L/2;
    flange_b.s = s + L/2;
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. translational component with two <i>rigidly</i> connected flanges.
The fixed distance between the left and the right flange is defined by parameter \"L\".
The forces at the right and left flange can be different.
It is used e.g., to built up sliding masses.
</p>
</html>"));
  end PartialRigid;

  partial model PartialCompliant
    "Compliant connection of two translational 1D flanges"

    Flange_a flange_a "Left flange of compliant 1-dim. translational component"
       annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));
    Flange_b flange_b
      "Right flange of compliant 1-dim. translational component"
      annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));
    Modelica_SIunits.Position s_rel(start=0)
      "Relative distance (= flange_b.s - flange_a.s)";
    Modelica_SIunits.Force f
      "Force between flanges (positive in direction of flange axis R)";

  equation
    s_rel = flange_b.s - flange_a.s;
    flange_b.f = f;
    flange_a.f = -f;
    annotation (
      Documentation(info="<html>
<p>
This is a 1D translational component with a <i>compliant</i> connection of two
translational 1D flanges where inertial effects between the two
flanges are not included. The absolute value of the force at the left and the right
flange is the same. It is used to built up springs, dampers etc.
</p>

</html>"),   Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Polygon(
            points={{50,-90},{20,-80},{20,-100},{50,-90}},
            lineColor={128,128,128},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid), Line(points={{-60,-90},{20,-90}},
              color={0,0,0})}));
  end PartialCompliant;

  partial model PartialCompliantWithRelativeStates
    "Base model for the compliant connection of two translational 1-dim. shaft flanges where the relative position and relative velocities are used as states"

    parameter StateSelect stateSelect=StateSelect.prefer
      "Priority to use phi_rel and w_rel as states"
    annotation(HideResult=true, Dialog(tab="Advanced"));
    parameter Modelica_SIunits.Distance s_nominal=1e-4
      "Nominal value of s_rel (used for scaling)"
      annotation (Dialog(tab="Advanced"));

    Modelica_SIunits.Position s_rel(
      start=0,
      stateSelect=stateSelect,
      nominal=s_nominal) "Relative distance (= flange_b.s - flange_a.s)";
    Modelica_SIunits.Velocity v_rel(start=0, stateSelect=stateSelect)
      "Relative velocity (= der(s_rel))";

    Modelica_SIunits.Force f "Forces between flanges (= flange_b.f)";
    Flange_a flange_a "Left flange of compliant 1-dim. translational component"
                                                                annotation (
        Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Flange_b flange_b
      "Right flange of compliant 1-dim. translational component" annotation (
        Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));

  equation
    s_rel = flange_b.s - flange_a.s;
    v_rel = der(s_rel);
    flange_b.f =  f;
    flange_a.f = -f;
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. translational component with a compliant connection of two
translational 1-dim. flanges where inertial effects between the two
flanges are neglected. The basic assumption is that the cut-forces
of the two flanges sum-up to zero, i.e., they have the same absolute value
but opposite sign: flange_a.f + flange_b.f = 0. This base class
is used to built up force elements such as springs, dampers, friction.
</p>

<p>
The difference to base class \"PartialCompliant\" is that the relative
distance and the relative velocity are defined as preferred states.
The reason is that for a large class of drive trains,
the absolute position is quickly increasing during operation.
Numerically, it is better to use relative distances between drive train components
because they remain in a limited size. For this reason, StateSelect.prefer
is set for the relative distance of this component.
</p>

<p>
In order to improve the numerics, a nominal value for the relative distance
should be set, since drive train distances are in a small order and
then step size control of the integrator is practically switched off for
such a variable. A default nominal value of s_nominal = 1e-4 is defined.
This nominal value might also be computed from other values, such
as \"s_nominal = f_nominal / c\" for a spring, if f_nominal
and c have more meaningful values for the user.
</p>

</html>"));
  end PartialCompliantWithRelativeStates;

  partial model PartialElementaryOneFlangeAndSupport
    "Obsolete partial model. Use PartialElementaryOneFlangeAndSupport2."
    extends Modelica_Icons.ObsoleteModel;

    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    Modelica_SIunits.Length s
      "Distance between flange and support (= flange.s - support.s)";
    Flange_b flange "Flange of component"
      annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));

  protected
    InternalSupport internalSupport(f=-flange.f)
      "Internal support/housing of component as a model with connector flange (flange is either connected to support, if useSupport=true, or connected to fixed, if useSupport=false)"
      annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
    Modelica_Mechanics_Translational.Components.Fixed fixed if not useSupport
      "Fixed support/housing, if not useSupport"
      annotation (Placement(transformation(extent={{10,-97},{30,-77}})));
  public
    Support support if useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  equation
    s = flange.s - internalSupport.s;
    connect(internalSupport.flange, support) annotation (Line(
        points={{0,-80},{0,-100}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(fixed.flange, internalSupport.flange) annotation (Line(
        points={{20,-87},{20,-80},{0,-80}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. translational component with one flange and a support/housing.
It is used to build up elementary components of a drive train with
equations in the text layer.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>

</html>"),   Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
            extent={{-38,-98},{-6,-96}},
            lineColor={95,95,95},
            textString="(if useSupport)"), Text(
            extent={{24,-97},{64,-98}},
            lineColor={95,95,95},
            textString="(if not useSupport)")}),
      Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}), graphics={
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
            color={0,0,0})}));
  end PartialElementaryOneFlangeAndSupport;

  partial model PartialElementaryOneFlangeAndSupport2
    "Partial model for a component with one translational 1-dim. shaft flange and a support used for textual modeling, i.e., for elementary models"
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    Modelica_SIunits.Length s
      "Distance between flange and support (= flange.s - support.s)";
    Flange_b flange "Flange of component"
      annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));
    Support support(s=s_support, f=-flange.f) if useSupport
      "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  protected
    Modelica_SIunits.Length s_support "Absolute position of support flange";
  equation
    s = flange.s - s_support;
    if not useSupport then
      s_support = 0;
    end if;
    annotation (
      Documentation(info="<html>
<p>
This is a 1-dim. translational component with one flange and a support/housing.
It is used to build up elementary components of a drive train with
equations in the text layer.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>

</html>"),      Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}), graphics={
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
            color={0,0,0})}));
  end PartialElementaryOneFlangeAndSupport2;

  partial model PartialElementaryTwoFlangesAndSupport
    "Obsolete partial model. Use PartialElementaryTwoFlangesAndSupport2."
    extends Modelica_Icons.ObsoleteModel;
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    Flange_a flange_a "Flange of left shaft"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Flange_b flange_b "Flange of right shaft"
      annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
    Modelica_SIunits.Length s_a "Distance between left flange and support";
    Modelica_SIunits.Length s_b "Distance between right flange and support";
  protected
    InternalSupport internalSupport(f=-flange_a.f - flange_b.f)
      "Internal support/housing of component as a model with connector flange (flange is either connected to support, if useSupport=true, or connected to fixed, if useSupport=false)"
      annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
    Modelica_Mechanics_Translational.Components.Fixed fixed if not useSupport
      "Fixed support/housing, if not useSupport"
      annotation (Placement(transformation(extent={{10,-97},{30,-77}})));
  public
    Support support if useSupport "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  equation
    s_a = flange_a.s - internalSupport.s;
    s_b = flange_b.s - internalSupport.s;
    connect(internalSupport.flange, support) annotation (Line(
        points={{0,-80},{0,-100}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(fixed.flange, internalSupport.flange) annotation (Line(
        points={{20,-87},{20,-80},{0,-80}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>
This is a 1-dim. translational component with two flanges and an additional support.
It is used e.g., to build up elementary ideal gear components. The component
contains the force balance, i.e., the sum of the forces of the connectors
is zero (therefore, components that are based on PartialGear cannot have
a mass). The support connector needs to be connected
to avoid the unphysical behavior that the
support force is required to be zero (= the default value, if the
connector is not connected).
</p>

</html>"),   Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
              {100,100}}), graphics={Text(
            extent={{-38,-98},{-6,-96}},
            lineColor={95,95,95},
            textString="(if useSupport)"), Text(
            extent={{24,-97},{64,-98}},
            lineColor={95,95,95},
            textString="(if not useSupport)")}),
      Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}), graphics={
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
            color={0,0,0})}));
  end PartialElementaryTwoFlangesAndSupport;

  partial model PartialElementaryTwoFlangesAndSupport2
    "Partial model for a component with one translational 1-dim. shaft flange and a support used for textual modeling, i.e., for elementary models"
    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    Flange_a flange_a "Flange of left shaft"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
    Flange_b flange_b "Flange of right shaft"
      annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
    Support support(s=s_support, f = -flange_a.f - flange_b.f) if useSupport
      "Support/housing of component"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
    Modelica_SIunits.Length s_a "Distance between left flange and support";
    Modelica_SIunits.Length s_b "Distance between right flange and support";
  protected
    Modelica_SIunits.Length s_support "Absolute position of support flange";
  equation
    s_a = flange_a.s - s_support;
    s_b = flange_b.s - s_support;
    if not useSupport then
       s_support = 0;
    end if;

    annotation (Documentation(info="<html>
<p>
This is a 1-dim. translational component with two flanges and an additional support.
It is used e.g., to build up elementary ideal gear components. The component
contains the force balance, i.e., the sum of the forces of the connectors
is zero (therefore, components that are based on PartialGear cannot have
a mass). The support connector needs to be connected
to avoid the unphysical behavior that the
support force is required to be zero (= the default value, if the
connector is not connected).
</p>

</html>"),      Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}), graphics={
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
            color={0,0,0})}));
  end PartialElementaryTwoFlangesAndSupport2;

  partial model PartialElementaryRotationalToTranslational
    "Partial model to transform rotational into translational motion"
    extends
      Modelica_Mechanics_Rotational_Interfaces.PartialElementaryRotationalToTranslational;
    annotation (Documentation(info="<html>
<p>This is a 1-dim. rotational component with</p>
<ul>
<li>one rotational flange, </li>
<li>one rotational support/housing, </li>
<li>one translational flange, and </li>
<li>one translational support/housing </li>
</ul>
<p>This model is used to build up elementary components of a drive train transforming rotational into translational motion with equations in the text layer.</p>
<p>If <i>useSupportR=true</i>, the rotational support connector is conditionally enabled and needs to be connected.</p>
<p>If <i>useSupportR=false</i>, the rotational support connector is conditionally disabled and instead the rotational part is internally fixed to ground.</p>
<p>If <i>useSupportT=true</i>, the translational support connector is conditionally enabled and needs to be connected.</p>
<p>If <i>useSupportT=false</i>, the translational support connector is conditionally disabled and instead the translational part is internally fixed to ground.</p>
</html>"));
  end PartialElementaryRotationalToTranslational;

partial model PartialForce
    "Partial model of a force acting at the flange (accelerates the flange)"
  extends PartialElementaryOneFlangeAndSupport2;
  Modelica_SIunits.Force f "Accelerating force acting at flange (= flange.f)";
equation
  f = flange.f;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{-96,96},{96,-96}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{0,-60},{0,-100}}, color={0,0,0}),
          Text(
            extent={{-150,140},{150,100}},
            lineColor={0,0,255},
            textString="%name"),
          Line(points={{-78,80},{51,80}}, color={0,0,0}),
          Polygon(
            points={{81,80},{51,90},{51,70},{81,80}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Line(points={{-52,-60},{77,-60}}, color={0,0,0}),
          Polygon(
            points={{-82,-60},{-51,-50},{-51,-70},{-82,-60}},
            lineColor={0,0,0},
            fillColor={128,128,128},
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
            color={0,0,0})}),
    Documentation(info="<HTML>
<p>
Partial model of force that accelerates the flange.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</HTML>"));
end PartialForce;

  partial model PartialAbsoluteSensor
    "Device to measure a single absolute flange variable"

    extends Modelica_Icons.TranslationalSensor;

    Flange_a flange
      "Flange to be measured (flange axis directed in to cut plane, e. g. from left to right)"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));

  equation
    0 = flange.f;
    annotation (
      Documentation(info="<html>
<p>
This is the superclass of a 1D translational component with one flange and one
output signal in order to measure an absolute kinematic quantity in the flange
and to provide the measured signal as output signal for further processing
with the Modelica.Blocks blocks.
</p>
</html>"),   Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Line(points={{-100,-90},{-20,-90}}, color={0,0,0}),
          Polygon(
            points={{10,-90},{-20,-80},{-20,-100},{10,-90}},
            lineColor={128,128,128},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,0},{-90,0}}, color={0,0,0}),
          Line(points={{70,0},{100,0}}, color={0,0,127}),
          Text(
            extent={{-150,80},{150,40}},
            textString="%name",
            lineColor={0,0,255})}));
  end PartialAbsoluteSensor;

  partial model PartialRelativeSensor
    "Device to measure a single relative variable between two flanges"

    extends Modelica_Icons.TranslationalSensor;

    Flange_a flange_a
      "(left) driving flange (flange axis directed in to cut plane, e. g. from left to right)"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));
    Flange_b flange_b
      "(right) driven flange (flange axis directed out of cut plane)"
      annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation
            =0)));

  equation
    0 = flange_a.f + flange_b.f;
    annotation (
      Documentation(info="<html>
<p>
This is a superclass for 1D translational components with two rigidly connected
flanges and one output signal in order to measure relative kinematic quantities
between the two flanges or the cut-force in the flange and
to provide the measured signal as output signal for further processing
with the Modelica.Blocks blocks.
</p>
</html>"),   Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Line(points={{-51,34},{29,34}}, color={0,0,0}),
          Polygon(
            points={{59,34},{29,44},{29,24},{59,34}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,0},{-90,0}}, color={0,0,0}),
          Line(points={{70,0},{90,0}}, color={0,0,0}),
          Text(
            extent={{-150,100},{150,60}},
            textString="%name",
            lineColor={0,0,255})}));
  end PartialRelativeSensor;

  partial model PartialFriction "Base model of Coulomb friction elements"

  //extends Translational.Interfaces.PartialRigid;
    parameter Modelica_SIunits.Velocity v_small=1e-3
      "Relative velocity near to zero (see model info text)"
      annotation (Dialog(tab="Advanced"));
  // Equations to define the following variables have to be defined in subclasses
    Modelica_SIunits.Velocity v_relfric
      "Relative velocity between frictional surfaces";
    Modelica_SIunits.Acceleration a_relfric
      "Relative acceleration between frictional surfaces";
  //SI.Force f "Friction force (positive, if directed in opposite direction of v_rel)";
    Modelica_SIunits.Force f0 "Friction force for v=0 and forward sliding";
    Modelica_SIunits.Force f0_max "Maximum friction force for v=0 and locked";
    Boolean free "true, if frictional element is not active";
  // Equations to define the following variables are given in this class
    Real sa(unit="1")
      "Path parameter of friction characteristic f = f(a_relfric)";
    Boolean startForward(start=false, fixed=true)
      "true, if v_rel=0 and start of forward sliding";
    Boolean startBackward(start=false, fixed=true)
      "true, if v_rel=0 and start of backward sliding";
    Boolean locked(start=false) "true, if v_rel=0 and not sliding";
    constant Integer Unknown=3 "Value of mode is not known";
    constant Integer Free=2 "Element is not active";
    constant Integer Forward=1 "v_rel > 0 (forward sliding)";
    constant Integer Stuck=0
      "v_rel = 0 (forward sliding, locked or backward sliding)";
    constant Integer Backward=-1 "v_rel < 0 (backward sliding)";
    Integer mode(
      final min=Backward,
      final max=Unknown,
      start=Unknown, fixed=true);
  protected
    constant Modelica_SIunits.Acceleration unitAcceleration=1
      annotation (HideResult=true);
    constant Modelica_SIunits.Force unitForce=1 annotation (HideResult=true);
  equation
  /* Friction characteristic
   (locked is introduced to help the Modelica translator determining
   the different structural configurations,
   if for each configuration special code shall be generated)
*/
    startForward = pre(mode) == Stuck and (sa > f0_max/unitForce or pre(startForward)
       and sa > f0/unitForce) or pre(mode) == Backward and v_relfric > v_small or
      initial() and (v_relfric > 0);
    startBackward = pre(mode) == Stuck and (sa < -f0_max/unitForce or pre(
      startBackward) and sa < -f0/unitForce) or pre(mode) == Forward and v_relfric <
      -v_small or initial() and (v_relfric < 0);
    locked = not free and not (pre(mode) == Forward or startForward or pre(
      mode) == Backward or startBackward);

    a_relfric/unitAcceleration = if locked then               0 else
                                 if free then                 sa else
                                 if startForward then         sa - f0_max/unitForce else
                                 if startBackward then        sa + f0_max/unitForce else
                                 if pre(mode) == Forward then sa - f0_max/unitForce else
                                                              sa + f0_max/unitForce;

  /* Friction torque has to be defined in a subclass. Example for a clutch:
   f = if locked then sa else
       if free then   0 else
       cgeo*fn*(if startForward then          Modelica.Math.Vectors.interpolate(mue_pos[:,1], mue_pos[:,2], v_relfric, 1) else
                if startBackward then        -Modelica.Math.Vectors.interpolate(mue_pos[:,1], mue_pos[:,2], -v_relfric, 1) else
                if pre(mode) == Forward then  Modelica.Math.Vectors.interpolate(mue_pos[:,1], mue_pos[:,2], v_relfric, 1) else
                                             -Modelica.Math.Vectors.interpolate(mue_pos[:,1], mue_pos[:,2], -v_relfric, 1));
*/
  // finite state machine to determine configuration
    mode = if free then Free else
      (if (pre(mode) == Forward  or pre(mode) == Free or startForward)  and v_relfric > 0 then
         Forward else
       if (pre(mode) == Backward or pre(mode) == Free or startBackward) and v_relfric < 0 then
         Backward else
         Stuck);
    annotation (Documentation(info="<html>
<p>
Basic model for Coulomb friction that models the stuck phase in a reliable way.
</p>
</html>"));
  end PartialFriction;

  annotation (Documentation(info="<html>
<p>
This package contains connectors and partial models for 1-dim.
translational mechanical components. The components of this package can
only be used as basic building elements for models.
</p>

</html>"));
end Modelica_Mechanics_Translational_Interfaces;
