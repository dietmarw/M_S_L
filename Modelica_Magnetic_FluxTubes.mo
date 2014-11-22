within ;
encapsulated package Modelica_Magnetic_FluxTubes
  "Library for modelling of electromagnetic devices with lumped magnetic networks"
  import Modelica_Icons;
  import Modelica_Magnetic_FluxTubes_Interfaces;
  import Modelica_Electrical_Analog_Interfaces;
  import Modelica_Constants;
  import Modelica_Math;
  import Modelica_Blocks_Interfaces;

  import SI = Modelica_SIunits;
  import Modelica_Constants.pi;
  import mu_0 = Modelica_Constants.mue_0;

  extends Modelica_Icons.Package;

  package UsersGuide "User's Guide"
    extends Modelica_Icons.Information;

    class FluxTubeConcept "Flux tube concept"
      extends Modelica_Icons.Information;

      annotation (Documentation(info="<html>
<h4>Overview of the Concept of Magnetic Flux Tubes</h4>
<p>
Following below, the concept of magnetic flux tubes is outlined in short. For a detailed description of flux tube elements, please have a look at the listed literature. Magnetic flux tubes enable for modeling of magnetic fields with lumped networks. The figure below and the following equations illustrate the transition from the original magnetic field quantities described by <i>Maxwell</i>'s equations to network elements with a flow variable and an across variable:
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/FluxTubeConcept/magnetic_flux_tube_schematic.png\" ALT=\"Magnetic flux tube\">
</p>

<p>
For a region with an approximately homogeneous distribution of the magnetic field strength <b>H</b> and the magnetic flux density <b>B</b> through cross sectional area <i>A</i> at each length coordinate <i>s</i>  (<i>A</i> perpendicular to the direction of the magnetic field lines), a magnetic reluctance <i>R<sub>m</sub></i> can be defined:</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/FluxTubeConcept/eq_transition_reluctance_flowAcross_IntegralQuantities.png\" ALT=\"Transition from field quantities to flow- and across variables\">
</p>

<p>
With the definition of the magnetic potential difference <i>V<sub>m</sub></i> as an across variable and the magnetic flux <i>&Phi;</i> as flow variable, a reluctance element <i>R<sub>m</sub></i> can be defined similar to resistive network elements in other physical domains. Using <i>Maxwell</i>'s constitutive equation
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/FluxTubeConcept/eq_MaxwellConstitutive.png\" ALT=\"Maxwell's constitutive equation\">
</p>

<p>the general formula for the calculation of a magnetic reluctance <i>R<sub>m</sub></i> from its geometric and material properties is:</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/FluxTubeConcept/eq_reluctance_general.png\" ALT=\"General formula for calculation of a magnetic reluctance\">
</p>

<p>
For a prismatic or cylindrical volume of length <i>l</i> and cross sectional area <i>A</i> with the magnetic flux entering and leaving the region through its end planes, the above equation simplifies to:</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/FluxTubeConcept/eq_reluctance_prismatic.png\" ALT=\"Magnetic reluctance of a prismatic or cylindrical volume\">
</p>

<p>
Similar equations can be derived for other geometries. In cases where a direct integration is not possible, the reluctance can be calculated on base of average length, average cross sectional area and volume <i>V</i> respectively:
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/FluxTubeConcept/eq_reluctanceFromAverageGeometry.png\" ALT=\"Reluctance calculation from average geometric quantities\">
</p>

<p>
Network elements for sources of a magnetic potential difference or magnetomotive force, i.e., coils or permanent magnets can be formulated as well. The resulting magnetic network models of actuators reflect the main dimensions of these devices as well as the normally nonlinear characteristics of their magnetically active materials.
</p>

</html>"));
    end FluxTubeConcept;

    class ReluctanceForceCalculation "Reluctance forces"
      extends Modelica_Icons.Information;

      annotation (Documentation(info="<html>
<h4>Calculation of reluctance forces from lumped magnetic network models</h4>

<p>
Generally, the thrust <i>F</i> developed by a translatory electro-magneto-mechanical actuator (similar for the rotational case with torque and angular position) is equal to the change of magnetic co-energy <i>W<sub>m</sub><sup>*</sup></i> with armature position <i>x</i> according to
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/ReluctanceForceCalculation/eq_CoEnergy_general.png\" ALT=\"Equation for force calculation from change of magnetic co-energy with armature position\">
</p>

<p>
(<i>&Psi;</i> flux linkage, <i>i</i> actuator current). In lumped magnetic network models, the above equation simplifies to
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/ReluctanceForceCalculation/eq_forceFromPermeance_network.png\" ALT=\"Equation for force calculation in lumped magnetic network models\">
</p>

<p>
where <i>n<sub>linear</sub></i> is the number of flux tube elements with constant relative permeability that change its permeance <i>G<sub>m i</sub></i> with armature position (index <i>i</i>), <i>V<sub>m i</sub></i> the magnetic voltage across each respective flux tube and <i>dG<sub>m i</sub>/dx</i> the derivative of the respective permeances with respect to armature position. Transition from the general formula based on magnetic co-energy to the latter one is outlined in <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ka08]</a> for the reciprocal of the permeance, i.e., for the magnetic reluctance <i>R<sub>m</sub></i>. Note that
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/UsersGuide/ReluctanceForceCalculation/eq_transition_forceReluctancePermeance.png\" ALT=\"Transition from force calculation based on reluctance to calculation based on permeance\">
</p>

<p>with <i>&Phi;<sub>i</sub></i> being the magnetic flux through each respective flux tube element.</p>

<p>
Flux tube elements with <i>non-linear</i> material characteristics <i>&mu;<sub>r</sub></i>(<i>B</i>) in magnetic network models do not restrict the usability of the above equation. However, it is required that these nonlinear flux tube elements do not change its shape with armature motion (e.g., portion of a solenoid plunger where the magnetic flux passes through in axial direction). This limitation is not a strong one, since the permeance of nonlinear, but highly permeable ferromagnetic flux tube elements and its change with armature position compared to that of air gap flux tubes can be neglected in most cases. Because of this constraint, the dimensions of possibly nonlinear flux tube elements in sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape\">Shapes.FixedShape</a> are fixed, whereas the dimension in direction of motion of the linear flux tube elements in sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force\">Shapes.Force</a> can vary during simulation. For the flux tubes defined in this package with their rather simple shapes, the derivative <i>dG<sub>m</sub>/dx</i> is given analytically. For more complex shapes and variations of dimensions with armature motion, it must be provided analytically during model development, preferably by extending the partial model <a href=\"modelica://Modelica.Magnetic.FluxTubes.Interfaces.PartialForce\">Interfaces.PartialForce</a>.
</p>

<p>
The sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Shapes.Leakage</a> contains flux tube shapes typical for leakage flux around prismatic or cylindrical poles. Since the permeance of these flux tubes does not change with armature position, they do not contribute to a reluctance actuator's thrust.
</p>

</html>"));
    end ReluctanceForceCalculation;

    class Literature "Literature"
      extends Modelica_Icons.References;

      annotation (Documentation(info="<html>
<h4>Literature</h4>
<ul>
<li> Usage of the Modelica Magnetic library is described in:
<dl>
<dt>[B&ouml;08] B&ouml;drich, T.:</dt>
<dd> <b>Electromagnetic Actuator Modelling with the Extended Modelica Magnetic Library</b>.
     Modelica 2008 Conference, Bielefeld, Germany,
     pp. 221-227, March 3-4, 2008.
     Download from:
     <a href=\"https://www.modelica.org/events/modelica2008/Proceedings/sessions/session2d2.pdf\">https://www.modelica.org/events/modelica2008/Proceedings/sessions/session2d2.pdf</a>
     </dd>
</dl>
</li>
<li> The method of magnetic flux tubes as well as derivation of the permeance of many flux tube shapes is explained in detail in:
<dl>
<dt>[Ro41] Roters, H.:</dt>
<dd> <b>Electromagnetic Devices</b>.
New York: John Wiley &amp; Sons 1941 (8th Printing 1961)
</dd>
</dl>
</li>
<li> Structure, properties, applications and design of electromagnetic (reluctance type) actuators are thoroughly described in:
<dl>
<dt>[Ka08] Kallenbach, E.; Eick, R.; Quendt, P.; Str&ouml;hla, T.; Feindt, K.; Kallenbach, M.:</dt>
<dd><b>Elektromagnete: Grundlagen, Berechnung, Entwurf und Anwendung</b>.
3rd ed., Wiesbaden: Vieweg Teubner 2008 (in German)
<br>&nbsp;</dd>
<dt>[Ro00] Roschke, T.:</dt>
<dd><b>Entwurf geregelter elektromagnetischer Antriebe f&uuml;r Luftsch&uuml;tze</b>.
    Fortschritt-Berichte VDI, Reihe 21, Nr. 293, D&uuml;sseldorf: VDI-Verlag 2000 (in German)</dd>
</dl>
</li>
<li> Application of the method of magnetic flux tubes to the design of rotational electrical machines is explained for example in:
<dl>
<dt>[HM94] Hendershot, J.R. Jr.; Miller, T.J.E.:</dt>
<dd> <b>Design of Brushless Permanent-Magnet Motors</b>.
Magna Physics Publishing and Oxford University Press 1994
</dd>
</dl>
</li>

</ul>

</html>"));
    end Literature;

    class ReleaseNotes "Release Notes"
      extends Modelica_Icons.ReleaseNotes;
      annotation (Documentation(info="<html>

<h5>Version 3.2.2, 2014-01-15 (Christian&nbsp;Kral)</h5>
<ul>
<li>Added constant
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.ConstantPermeance\">permeance model</a></li>
<li>Added
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape.GenericFluxTube\">GenericFluxTube</a></li>
<li>Added parameter <code>useConductance</code> including alternative parameterization in
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.EddyCurrent\">EddyCurrent</a></li>
<li>Added
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.Idle\">Idle</a></li>
<li>Added
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.Short\">Short</a></li>
<li>Added
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.Crossing\">Crossing</a></li>

</ul>

<h5>Version 1.5, 2013-01-04 (Martin&nbsp;Otter, Thomas&nbsp;B&ouml;drich, Johannes&nbsp;Ziske)</h5>
<ul>
<li>Added missing initial conditions</li>
<li>Fixed initial parameter values</li>
</ul>

<h5>Verskon 1.4, 2011-08-01 (Thomas&nbsp;B&ouml;drich)</h5>
<ul>
<li>MagneticPort declared with MagneticPotential instead of MagneticPotentialDifference</li>
</ul>

<h5>Version 1.3, 2010-04-22 (Christian&nbsp;Kral)</h5>
<ul>
<li>Added conditional heat port to EddyCurrent model</li>
</ul>

<h5>Version 1.2, 2009-08-11 (Christian&nbsp;Kral, Anton&nbsp;Haumer, Thomas&nbsp;B&ouml;drich, Martin&nbsp;Otter)</h5>
<ul>
<li>Update and improvement for inclusion in the
    Modelica Standard Library</li>
</ul>

<h5>Version 1.1, 2009-05-19 (Thomas&nbsp;B&ouml;drich)</h5>
<ul>
<li>Coupling coefficient in Basic.ElectroMagneticConverter removed</li>
<li>Basic.EddyCurrent added</li>
<li>Example MovingCoilActuator, especially PermeanceModel, completely revised</li>
<li>Leakage coefficient replaced by coupling coefficient in Basic.LeakageWithCoefficient</li>
<li>Utilities.CoilDesign: parameter U renamed to V_op,CoilDesign moved to Utilities.</li>
<li>Reference direction for magnetic flux added in all sources</li>
<li>degC replaced by K for compatibility with Modelica 3.0</li>
<li>redeclare in Sensors for compatibility with Modelica 3.0 removed</li>
<li>Partial flux tube components moved to Interfaces and basic elements moved to new package Basic</li>
</ul>

<h5>Version 1,0, 2007-10-11 (Thomas&nbsp;B&ouml;drich)</h5>
<ul>
<li>Release of version 1.0 of the library</li>
</ul>

<h5>2005 (Thomas&nbsp;B&ouml;drich)</h5>
<ul>
<li>First release of a Modelica magnetic library</li>
</ul>

<p></p>
</html>"));
    end ReleaseNotes;

    class Contact "Contact"
      extends Modelica_Icons.Contact;

      annotation (Documentation(info="<html>
<h4>Contact</h4>

<dl>
<dt><b>Main Author:</b></dt>
<dd>
    <a href=\"http://www.ifte.de/mitarbeiter/boedrich.html\">Thomas B&ouml;drich</a><br>
    Dresden University of Technology<br>
    Institute of Electromechanical and Electronic Design<br>
    01062 Dresden, Germany<br>
    Phone: +49 - 351 - 463 36296<br>
    Fax: +49 - 351 - 463 37183<br>
    email: <A HREF=\"mailto:Thomas.Boedrich@tu-dresden.de\">Thomas.Boedrich@tu-dresden.de</A><br></dd>
</dl>

<p><b>Acknowledgements:</b></p>
<ul>
<li> The magnetisation characteristics of the included soft magnetic materials were compiled and measured respectively by Thomas Roschke, now with Johnson Electric. Provision of this data is highly appreciated. He also formulated the approximation function used for description of the magnetisation characteristics of these materials.
</li>
<li> Andr&eacute; Klick of then Dresden University of Technology, Dresden, Germany gave valuable support on the implementation of this library. His contribution is highly appreciated, too.
</li>
</ul>
</html>"));
    end Contact;

    annotation (DocumentationClass=true, Documentation(info="<html>
<p>
This library contains components for modelling of electromagnetic devices with lumped magnetic networks. Those models are suited for both rough design of the magnetic subsystem of a device as well as for efficient dynamic simulation at system level together with neighbouring subsystems. At present, components and examples for modelling of <i>translatory</i> electromagnetic and electrodynamic actuators are provided. If needed, these components can be adapted to network modelling of <i>rotational</i> electrical machines.
</p>
<p>
This user's guide gives a short introduction to the underlying concept of <b>magnetic flux tubes</b>, summarizes the calculation of magnetic <b>reluctance forces</b> from lumped magnetic network models and lists <b>reference literature</b>.
</p>
<p>
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Examples\">Examples</a> illustrates the usage of magnetic network models with simple models from different fields of application.</p>
</html>"));
  end UsersGuide;

  package Basic "Basic elements of magnetic network models"
    extends Modelica_Icons.Package;

    model Ground "Zero magnetic potential"

      Modelica_Magnetic_FluxTubes_Interfaces.PositiveMagneticPort port
        annotation (Placement(transformation(extent={{-10,110},{10,90}},
              rotation=-0)));
    equation
      port.V_m = 0;
      annotation (
        Documentation(info="<html>
<p>
The magnetic potential at the magnetic ground node is zero. Every magnetic network model must contain at least one magnetic ground object.
</p>
</html>"),
        Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Line(points={{-60,50},{60,50}}, color={255,127,0}),
          Line(points={{-40,30},{40,30}}, color={255,127,0}),
          Line(points={{-20,10},{20,10}}, color={255,127,0}),
          Line(points={{0,90},{0,50}}, color={255,127,0}),
          Text(
            extent={{-150,-40},{150,0}},
            lineColor={0,0,255},
            textString="%name")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={Line(
                  points={{-60,50},{60,50}},
                  color={255,127,0},
                  thickness=0.5),Line(
                  points={{-40,30},{40,30}},
                  color={255,127,0},
                  thickness=0.5),Line(
                  points={{-20,10},{20,10}},
                  color={255,127,0},
                  thickness=0.5),Line(
                  points={{0,100},{0,50}},
                  color={255,127,0},
                  thickness=0.5),Text(
                  extent={{-40,-40},{40,20}},
                  lineColor={0,0,255},
                  textString="port.V_m = 0")}));
    end Ground;

    model ElectroMagneticConverter "Electro-magnetic energy conversion"

      Modelica_Magnetic_FluxTubes_Interfaces.PositiveMagneticPort port_p
        "Positive magnetic port" annotation (Placement(transformation(extent={{
                90,50},{110,70}}, rotation=0)));
      Modelica_Magnetic_FluxTubes_Interfaces.NegativeMagneticPort port_n
        "Negative magnetic port" annotation (Placement(transformation(extent={{
                110,-70},{90,-50}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.PositivePin p
        "Positive electric pin" annotation (Placement(transformation(extent={{-90,
                50},{-110,70}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin n
        "Negative electric pin" annotation (Placement(transformation(extent={{-110,
                -70},{-90,-50}}, rotation=0)));
      SI.Voltage v "Voltage";
      SI.Current i(start=0, stateSelect=StateSelect.prefer) "Current";
      SI.MagneticPotentialDifference V_m "Magnetic potential difference";
      SI.MagneticFlux Phi "Magnetic flux coupled into magnetic circuit";

      parameter Real N=1 "Number of turns";

      //for information only:
      SI.MagneticFlux Psi "Flux linkage for information only";
      SI.Inductance L_stat "Static inductance abs(Psi/i) for information only";

    protected
      Real eps=100*Modelica_Constants.eps;
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;

      V_m = port_p.V_m - port_n.V_m;
      0 = port_p.Phi + port_n.Phi;
      Phi = port_p.Phi;

      //converter equations:
      V_m = i*N;
      // Ampere's law
      N*der(Phi) = -v;
      // Faraday's law

      //for information only:
      Psi = N*Phi;
      //use of abs() for positive results; due to Modelica sign conventions for flow into connectors:
      L_stat = noEvent(if abs(i) > eps then abs(Psi/i) else abs(Psi/eps));

      annotation (
        defaultComponentName="converter",
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
                  points={{-134,63},{-124,60},{-134,57},{-134,63}},
                  lineColor={160,160,164},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid),Line(points={{-150,60},{-125,
              60}}, color={160,160,164}),Polygon(
                  points={{141,-57},{151,-60},{141,-63},{141,-57}},
                  lineColor={160,160,164},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid),Line(points={{125,-60},{150,-60}},
              color={160,160,164}),Text(
                  extent={{128,-56},{144,-41}},
                  lineColor={160,160,164},
                  textString="Phi"),Text(
                  extent={{128,64},{145,79}},
                  lineColor={0,0,0},
                  textString="Phi"),Line(points={{-150,-59},{-125,-59}}, color=
              {160,160,164}),Polygon(
                  points={{-140,-56},{-150,-59},{-140,-62},{-140,-56}},
                  lineColor={160,160,164},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid),Text(
                  extent={{-141,-56},{-124,-41}},
                  lineColor={160,160,164},
                  textString="i"),Text(
                  extent={{-150,63},{-133,78}},
                  lineColor={160,160,164},
                  textString="i"),Line(points={{124,61},{149,61}}, color={160,
              160,164}),Polygon(
                  points={{134,64},{124,61},{134,58},{134,64}},
                  lineColor={160,160,164},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid)}),
        Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            extent={{-70,100},{70,-100}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(extent={{-50,0},{-30,20}}, lineColor={0,0,255}),
          Line(points={{-40,60},{-40,40}}, color={0,0,255}),
          Ellipse(extent={{-50,20},{-30,40}}, lineColor={0,0,255}),
          Ellipse(extent={{-50,-20},{-30,0}}, lineColor={0,0,255}),
          Ellipse(extent={{-50,-40},{-30,-20}}, lineColor={0,0,255}),
          Line(points={{-40,-40},{-40,-60}}, color={0,0,255}),
          Rectangle(
            extent={{-54,40},{-40,-40}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{-40,60},{-92,60}}, color={0,0,255}),
          Line(points={{-40,-60},{-90,-60}}, color={0,0,255}),
          Line(
            points={{0,100},{-70,100}},
            color={0,0,255},
            pattern=LinePattern.Dash),
          Line(
            points={{-70,100},{-70,-100}},
            color={0,0,255},
            pattern=LinePattern.Dash),
          Line(
            points={{0,-100},{-70,-100}},
            color={0,0,255},
            pattern=LinePattern.Dash),
          Line(
            points={{70,100},{0,100}},
            color={255,127,0},
            pattern=LinePattern.Dash),
          Line(
            points={{70,-100},{0,-100}},
            color={255,127,0},
            pattern=LinePattern.Dash),
          Line(
            points={{70,100},{70,-100}},
            color={255,127,0},
            pattern=LinePattern.Dash),
          Ellipse(extent={{-4,-34},{64,34}}, lineColor={255,127,0}),
          Line(points={{30,-60},{30,-34}}, color={255,127,0}),
          Line(points={{18,0},{42,0}}, color={255,127,0}),
          Line(points={{42,10},{42,-12}}, color={255,127,0}),
          Line(points={{30,34},{30,60}}, color={255,127,0}),
          Line(points={{30,60},{100,60}}, color={255,127,0}),
          Line(points={{30,-60},{90,-60}}, color={255,127,0}),
          Text(
            extent={{-150,150},{150,110}},
            lineColor={0,0,255},
            textString="%name"),
          Line(points={{18,10},{18,-12}}, color={255,127,0}),
          Line(points={{-90,30},{-90,-30}}, color={0,0,255}),
          Polygon(
            points={{-90,-30},{-84,-10},{-96,-10},{-90,-30}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Line(points={{90,30},{90,-30}}, color={255,128,0}),
          Polygon(
            points={{90,-30},{96,-10},{84,-10},{90,-30}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
The electro-magnetic energy conversion is given by <i>Ampere</i>'s law and <i>Faraday</i>'s law respectively:
</p>

<pre>
    V_m = i * N
    N * d&Phi;/dt = -v
</pre>

<p>
V_m is the magnetomotive force that is supplied to the connected magnetic circuit, &Phi; is the magnetic flux through the associated branch of this magnetic circuit. The negative sign of the induced voltage v is due to <i>Lenz</i>'s law.
</p>

<p>
The flux linkage &Psi; and the static inductance L_stat = |&Psi;/i| are calculated for information only. Note that L_stat is set to |&Psi;/eps| if |i| &lt; eps
(= 100*Modelica.Constants.eps).
</p>
</html>"));
    end ElectroMagneticConverter;

    model ConstantReluctance "Constant reluctance"

      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPorts;

      parameter SI.Reluctance R_m=1 "Magnetic reluctance";

    equation
      V_m = Phi*R_m;

      annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            extent={{-70,30},{70,-30}},
            lineColor={255,128,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,0},{-90,0}}, color={255,128,0}),
          Line(points={{70,0},{90,0}}, color={255,128,0}),
          Text(
            extent={{-100,-100},{100,-62}},
            textString="%name",
            lineColor={0,0,255})}), Documentation(info="<html>
<p>
This constant reluctance is provided for test purposes and simple magnetic network models. The reluctance is not calculated from geometry and permeability of a flux tube, but is provided as parameter.
</p>
</html>"));
    end ConstantReluctance;

    model ConstantPermeance "Constant permeance"

      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPorts;

      parameter SI.Permeance G_m=1 "Magnetic permeance";

    equation
      G_m * V_m = Phi;

      annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            extent={{-70,30},{70,-30}},
            lineColor={255,128,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,0},{-90,0}}, color={255,128,0}),
          Line(points={{70,0},{90,0}}, color={255,128,0}),
          Text(
            extent={{-100,-100},{100,-62}},
            textString="%name",
            lineColor={0,0,255})}), Documentation(info="<html>
<p>
This constant permeance is provided for test purposes and simple magnetic network models. The permeance is not calculated from geometry and permeability of a flux tube, but is provided as parameter.
</p>
</html>", revisions="<html>
<h5>Version 3.2.2, 2014-01-15 (Christian Kral)</h5>
<ul>
<li>Added constant permeance model</li>
</ul>

</html>"));
    end ConstantPermeance;

    model LeakageWithCoefficient
      "Leakage reluctance with respect to the reluctance of a useful flux path (not for dynamic simulation of actuators)"

      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

      parameter SI.CouplingCoefficient c_usefulFlux=0.7
        "Ratio useful flux/(leakage flux + useful flux) = useful flux/total flux";

      input SI.Reluctance R_mUsefulTot
        "Total reluctance of useful flux path as reference" annotation (Dialog(
            group="Reference reluctance", groupImage=
              "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Basic/LeakageWithCoefficient.png"));

    equation
      (1 - c_usefulFlux)*R_m = c_usefulFlux*R_mUsefulTot;
      // Generalized Kirchhoff's current law

      annotation (Documentation(info="<html>
<p>
Differently from the flux tube elements of package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Shapes.Leakage</a>
that are calculated from their geometry, this leakage reluctance is calculated with reference to the total reluctance of a useful flux path. Please refer to the <b>Parameters</b> section for an illustration of the resulting magnetic network. Exploiting <i>Kirchhoff</i>'s generalized current law, the leakage reluctance is calculated by means of a coupling coefficient c_usefulFlux.
</p>

<h4>Attention:</h4>

<p>
This element must <b>not</b> be used <b>for dynamic simulation of</b> electro-magneto-mechanical <b>actuators</b>, where the shape of at least one flux tube element with reluctance force generation in the useful flux path changes with armature motion (e.g., air gap). This change results in a non-zero derivative dG_m/dx of those elements permeance G_m with respect to armature position x, which in turn will lead to a non-zero derivative of the leakage permeance with respect to armature position. This would generate a reluctance force in the leakage element that is not accounted for properly. <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force.LeakageAroundPoles\">Shapes.Force.LeakageAroundPoles</a> provides a simple leakage reluctance with force generation.
</p>
</html>"));
    end LeakageWithCoefficient;

    model EddyCurrent
      "For modelling of eddy current in a conductive magnetic flux tube"

      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPorts;
      extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(
        final T=273.15);

      parameter Boolean useConductance = false
        "Use conductance instead of geometry data and rho"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
      parameter SI.Conductance G(min=0)=1/0.098e-6
        "Equivalent loss conductance G=A/rho/l"
        annotation (Dialog(enable=useConductance), Evaluate=true);
      parameter SI.Resistivity rho=0.098e-6
        "Resistivity of flux tube material (default: Iron at 20degC)"
        annotation (Dialog(enable=not useConductance));
      parameter SI.Length l=1 "Average length of eddy current path"
        annotation (Dialog(enable=not useConductance));
      parameter SI.Area A=1 "Cross sectional area of eddy current path"
        annotation (Dialog(enable=not useConductance));

      final parameter SI.Resistance R=rho*l/A
        "Electrical resistance of eddy current path"
        annotation (Dialog(enable=not useConductance));

    equation
      LossPower = V_m*der(Phi);
      V_m =(if useConductance then G else 1/R) * der(Phi);
      //Magnetic voltage drop in magnetic network due to eddy current
      annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            extent={{-70,30},{70,-30}},
            lineColor={255,128,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{-70,0},{-90,0}}, color={255,128,0}),
          Line(points={{70,0},{90,0}}, color={255,128,0}),
          Rectangle(
            extent={{-70,30},{70,-30}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-100,-98},{100,-60}},
            textString="%name",
            lineColor={0,0,255})}), Documentation(info="<html>
<p>
Eddy currents are induced in a conductive magnetic flux tube when the flux changes with time. This causes a magnetic voltage drop in addition to the voltage drop that is due to the reluctance of this flux tube. The eddy current component can be thought of as a short-circuited secondary winding of a transformer with only one turn. Its resistance is calculated from the geometry and resistivity of the eddy current path.
</p>

<p>
Partitioning of a solid conductive cylinder or prism into several hollow cylinders or separate nested prisms and modelling of each of these flux tubes connected in parallel with a series connection of a reluctance element and an eddy current component can model the delayed buildup of the magnetic field in the complete flux tube from the outer to the inner sections. Please refer to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ka08]</a> for an illustration.
</p>
</html>",     revisions="<html>
<h5>Version 3.2.2, 2014-01-15 (Christian&nbsp;Kral)</h5>
<ul>
<li>Added parameter <code>useConductance</code> including alternative parameterization</li>
</ul>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics));
    end EddyCurrent;

    model Idle "Idle running branch"
      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPorts;
    equation
      Phi = 0;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
            Text(
              extent={{0,60},{0,100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{-40,0}}, color={255,128,0}),
            Line(points={{40,0},{100,0}}, color={255,128,0})}),
        Documentation(info="<html>
<p>
This is a simple idle running branch.
</p>


</html>", revisions="<html>
<h5>Version 3.2.2, 2014-01-15 (Christian Kral)</h5>
<ul>
<li>Added idle model</li>
</ul>

</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Line(points={{-100,0},{-60,0}}, color={
              255,128,0}),Line(points={{60,0},{100,0}}, color={255,128,0}),Line(
              points={{-60,0},{-40,2},{-18,6},{0,14},{12,26}}, color={255,128,0}),
              Line(points={{60,0},{40,-2},{18,-6},{0,-14},{-12,-26}}, color={
              255,128,0})}));
    end Idle;

    model Short "Short cut branch"
      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPortsElementary;
    equation
      connect(port_p, port_n) annotation (Line(points={{-100,0},{-1,0},{-1,0},{
              100,0}}, color={255,128,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Text(
              extent={{0,60},{0,100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{100,0}}, color={255,128,0})}), Documentation(
            info="<html>
<p>
This is a simple short cut branch.
</p>

</html>",     revisions="<html>
<h5>Version 3.2.2, 2014-01-15 (Christian Kral)</h5>
<ul>
<li>Added short model</li>
</ul>

</html>"));
    end Short;

    model Crossing "Crossing of two branches"

      Modelica_Magnetic_FluxTubes_Interfaces.PositiveMagneticPort port_p1
        "Positive port_p1 connected with port_p2"
        annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
      Modelica_Magnetic_FluxTubes_Interfaces.PositiveMagneticPort port_p2
        "Positive port_p2 connected with port_p1"
        annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
      Modelica_Magnetic_FluxTubes_Interfaces.NegativeMagneticPort port_n1
        "Negative port_n1 connected with port_n2"
        annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
      Modelica_Magnetic_FluxTubes_Interfaces.NegativeMagneticPort port_n2
        "Negative port_n2 connected with port_n1"
        annotation (Placement(transformation(extent={{90,90},{110,110}})));

    equation
      connect(port_p1, port_p2) annotation (Line(
          points={{-100,100},{-100,20},{0,20},{0,-20},{100,-20},{100,-100}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(port_n1, port_n2) annotation (Line(
          points={{-100,-100},{-100,0},{100,0},{100,100}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Text(
              extent={{0,60},{0,100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
          Line(
              points={{100,100},{100,40},{-100,-40},{-100,-100}},
              color={255,128,0},
              smooth=Smooth.None),
          Line(
              points={{-100,100},{-100,40},{100,-40},{100,-100}},
              color={255,128,0},
              smooth=Smooth.None)}),                              Documentation(
            info="<html>
<p>
This is a simple crossing of two branches. The ports <code>port_p1</code> and <code>port_p2</code> are connected, as well as <code>port_n1</code> and <code>port_n2</code>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Idle\">Idle</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Short\">Short</a>
</p>

</html>", revisions="<html>
<h5>Version 3.2.2, 2014-01-15 (Christian Kral)</h5>
<ul>
<li>Added crossing model</li>
</ul>

</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics));
    end Crossing;
  end Basic;

  package Shapes
    "Reluctance and permeance elements respectively based on geometric shapes"
    extends Modelica_Icons.Package;

    package FixedShape
      "Flux tubes with fixed shape during simulation and linear or non-linear material characteristics"
      extends Modelica_Icons.VariantsPackage;

      model GenericFluxTube
        "Flux tube with fixed cross-section and length; linear or non-linear material characteristics"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialFixedShape;

        parameter SI.Length l=0.01 "Length in direction of flux" annotation (
            Dialog(group="Fixed geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/GenericFluxTube.png"));
        parameter SI.CrossSection area=0.0001 "Area of cross section"
          annotation (Dialog(group="Fixed geometry"));
      equation
        A=area;
        G_m = (mu_0*mu_r*A)/l;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape\">FixedShape</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>", revisions="<html>
<h5>Version 3.2.2, 2014-01-15 (Christian&nbsp;Kral)</h5>
<ul>
<li>Added GenericFluxTube</li>
</ul>

</html>"));
      end GenericFluxTube;

      model Cuboid
        "Flux tube with rectangular cross-section; fixed shape; linear or non-linear material characteristics"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialFixedShape;

        parameter SI.Length l=0.01 "Length in direction of flux" annotation (
            Dialog(group="Fixed geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/CuboidParallelFlux.png"));
        parameter SI.Length a=0.01 "Width of rectangular cross-section"
          annotation (Dialog(group="Fixed geometry"));
        parameter SI.Length b=0.01 "Height of rectangular cross-section"
          annotation (Dialog(group="Fixed geometry"));

      equation
        A = a*b;
        G_m = (mu_0*mu_r*A)/l;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape\">FixedShape</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end Cuboid;

      model HollowCylinderAxialFlux
        "(Hollow) cylinder with axial flux; fixed shape; linear or non-linear material characteristics"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialFixedShape;

        parameter SI.Length l=0.01 "Axial length (in direction of flux)"
          annotation (Dialog(group="Fixed geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/HollowCylinderAxialFlux.png"));
        parameter SI.Radius r_i=0
          "Inner radius of hollow cylinder (zero for cylinder)"
          annotation (Dialog(group="Fixed geometry"));
        parameter SI.Radius r_o=0.01 "Outer radius of (hollow) cylinder"
          annotation (Dialog(group="Fixed geometry"));

      equation
        A = pi*(r_o^2 - r_i^2);
        G_m = (mu_0*mu_r*A)/l;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape\">FixedShape</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>

<p>
Set the inner radius r_i=0 for modelling of a solid cylindric flux tube.
</p>
</html>"));
      end HollowCylinderAxialFlux;

      model HollowCylinderRadialFlux
        "Hollow cylinder with radial flux; fixed shape; linear or non-linear material characteristics"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialFixedShape;

        parameter SI.Length l=0.01 "Width (orthogonal to flux direction)"
          annotation (Dialog(group="Fixed geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/HollowCylinderRadialFlux.png"));
        parameter SI.Radius r_i=0.01 "Inner radius of hollow cylinder"
          annotation (Dialog(group="Fixed geometry"));
        parameter SI.Radius r_o=0.02 "Outer radius of hollow cylinder"
          annotation (Dialog(group="Fixed geometry"));

      equation
        A = l*pi*(r_o + r_i);
        // Area at arithmetic mean radius for calculation of average flux density
        G_m = 2*pi*mu_0*mu_r*l/Modelica_Math.log(r_o/r_i);

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape\">FixedShape</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>

<p>
For hollow cylindric flux tubes with a radial magnetic flux, the flux density is a function of the radius. For that reason, the characteristic mu_r(B) is evaluated for the flux density at the flux tube's mean radius.
</p>

<p>
For those flux tube sections of a magnetic device that have a nonlinear material characteristic mu_r(B) and a large aspect ratio of outer to inner radius r_o/r_i, the section can be split up in a series connection of several hollow cylindric flux tubes with radial flux. This allows for more realistic modelling of the dependence of flux density on the radius compared to modelling with just one flux tube element.
</p>
</html>"));
      end HollowCylinderRadialFlux;

      annotation (Documentation(info="<html>
<p>
Please have a look at <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.ReluctanceForceCalculation\">UsersGuide.ReluctanceForceCalculation</a> for an explanation of the different flux tube categories and resulting sub-packages.
</p>

<p>
Due to the restrictions on reluctance force calculation outlined there, flux tube elements with a possibly non-linear material characteristic mu_r(B) must have a fixed shape during simulation of converter motion. Hence, the dimensions of these flux tubes are defined as parameters in the model components that extend the base class <a href=\"modelica://Modelica.Magnetic.FluxTubes.Interfaces.PartialFixedShape\">Interfaces.PartialFixedShape</a>.</p>

<p>
For initial design of magnetic circuits, the relative permeability of possibly non-linear flux tube elements can easily be set to a constant value mu_rConst (non-linearPermeability set to false). In some cases, this can simplify the rough geometric design of a device's magnetic circuit. Once an initial geometry is found, the magnetic subsystem can be simulated and fine-tuned with more realistic non-linear characteristics of ferromagnetic materials. Doing so requires setting of the parameter non-linearPermeability to true and selection of one of the soft magnetic materials of <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">Material.SoftMagnetic</a>.
</p>
</html>"));
    end FixedShape;

    package Force
      "Flux tubes with reluctance force generation; constant permeability"
      extends Modelica_Icons.VariantsPackage;

      model HollowCylinderAxialFlux
        "(Hollow) cylinder with axial flux; constant permeability"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialForce;

        SI.Length l=s "Axial length (in direction of flux)" annotation (Dialog(
              group="Variable geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/HollowCylinderAxialFlux.png"));
        parameter SI.Radius r_i=0 "Inner radius of (hollow) cylinder";
        parameter SI.Radius r_o=0.01 "Outer radius of (hollow) cylinder";

        SI.MagneticFluxDensity B "Homogeneous flux density";

      protected
        parameter SI.Area A=pi*(r_o^2 - r_i^2)
          "Cross-sectional area orthogonal to direction of flux";

      equation
        G_m = mu_0*mu_r*A/l;

        dGmBydx = -1*mu_0*mu_r*A/l^2*dlBydx;

        B = Phi/A;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force\">Force</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end HollowCylinderAxialFlux;

      model HollowCylinderRadialFlux
        "Hollow cylinder with radial flux; constant permeability"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialForce;

        SI.Length l=s "Axial length (orthogonal to direction of flux)"
          annotation (Dialog(group="Variable geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/HollowCylinderRadialFlux.png"));
        parameter SI.Radius r_i=0.01 "Inner radius of hollow cylinder";
        parameter SI.Radius r_o=0.015 "Outer radius of hollow cylinder";

        SI.MagneticFluxDensity B_avg
          "Average flux density (at arithmetic mean radius)";

      protected
        SI.Area A_avg
          "Average cross-sectional area orthogonal to direction of flux (at arithmetic mean radius)";

      equation
        G_m = mu_0*mu_r*2*pi*l/Modelica_Math.log(r_o/r_i);

        dGmBydx = mu_0*mu_r*2*pi/Modelica_Math.log(r_o/r_i)*dlBydx;

        A_avg = pi*(r_i + r_o)*l;
        B_avg = Phi/A_avg;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force\">Force</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end HollowCylinderRadialFlux;

      model CuboidParallelFlux
        "Cuboid with flux in direction of motion, e.g., air gap with rectangular cross-section; constant permeability"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialForce;

        SI.Length l=s "Axial length (in direction of flux)" annotation (Dialog(
              group="Variable geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/CuboidParallelFlux.png"));
        parameter SI.Length a=0.01 "Width of rectangular cross-section";
        parameter SI.Length b=0.01 "Height of rectangular cross-section";

        SI.MagneticFluxDensity B "Homogeneous flux density";

      protected
        parameter SI.Area A=a*b
          "Cross-sectional area orthogonal to direction of flux";

      equation
        G_m = mu_0*mu_r*A/l;

        dGmBydx = -1*mu_0*mu_r*A/l^2*dlBydx;

        B = Phi/A;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force\">Force</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end CuboidParallelFlux;

      model CuboidOrthogonalFlux
        "Cuboid with flux orthogonal to direction of motion; constant permeability"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialForce;

        SI.Length l=s "Length in direction of motion (orthogonal to flux)"
          annotation (Dialog(group="Variable geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/CuboidOrthogonalFlux.png"));
        parameter SI.Length a=0.01 "Width of rectangular cross-section";
        parameter SI.Length b=0.01
          "Height of rectangular cross-section (in flux direction)";

        SI.MagneticFluxDensity B "Homogeneous flux density";

      protected
        SI.Area A "Cross-sectional area orthogonal to direction of flux";

      equation
        A = a*l;
        G_m = mu_0*mu_r*A/b;

        dGmBydx = mu_0*mu_r*a/b*dlBydx;

        B = Phi/A;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force\">Force</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end CuboidOrthogonalFlux;

      model LeakageAroundPoles
        "Leakage flux tube around cylindrical or prismatic poles"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialForce;
        SI.Length l=s "Axial length (in direction of flux)" annotation (Dialog(
              group="Variable geometry", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/LeakageAroundPoles.png"));
        parameter SI.Length w=0.1
          "Width orthogonal to flux; mean circumference of flux tube in case of cylindrical poles";
        parameter SI.Radius r=0.01 "Radius of leakage field";

      equation
        //adapted from [Ka08], but corrected
        //(in [Ka08] equation accidentally swapped with that of a similar element)
        G_m = mu_0*w/pi*Modelica_Math.log(1 + pi*r/l);

        //derivative at full length:
        //  dGmBydx = mu_0 * w /pi * 1/(1 + pi * r/l) * (-1)*pi*r/l^2  * dlBydx;
        //simplified:
        dGmBydx = -mu_0*w*r*dlBydx/(l^2*(1 + pi*r/l));

        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force\">Force</a> for a description of all elements of this package.
</p>

<p>
Leakage flux around a prismatic or cylindric air gap between to poles can be described with this model. Due to its constant radius of the leakage field r, the model is rather simple. Whereas in reality the leakage radius is approximately constant for air gap lengths l greater than this radius, it decreases with air gap lengths less than the leakage radius. This decrease for small air gaps is neglected here, since the influence of the leakage flux tube compared to that of the enclosed main air gap (connected in parallel) decreases for decreasing air gap length l.
</p>

<p>
Note that in <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ka08]</a> the equation for G_m is accidentally swapped with that of a similar element.
</p>
</html>"));
      end LeakageAroundPoles;

      annotation (Documentation(info="<html>
<p>
Please have a look at <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.ReluctanceForceCalculation\">UsersGuide.ReluctanceForceCalculation</a> for an explanation of the different flux tube categories and resulting sub-packages.
</p>
<p>
Flux tube elements with generation of a reluctance force are intended for modelling of position-dependent air gap sections and permanent magnet sections respectively of translatory actuators. By default, the position co-ordinate of the mechanical connector flange.s is identical with the dimension l of the package's flux tube elements. l is the dimension changes with armature motion. If needed, the identity l=flange.s can be replaced by an actuator-specific equation, for example, when a flux tube length increases with decreasing armature position. The position co-ordinate of an element's translatory connector flange.s in turn will be identical with the armature position x in most cases, as the examples illustrate.</p>
<p>
The derivative of each element's permeance with respect to armature position <code>dGmBydx</code> is calculated from the derivative of the flux tube's permeance with respect to its varying dimension dGmBydl and the derivative of this dimension with respect to armature position <code>dlBydx</code>:</p>

<pre>
    dG_m   dG_m   dl
    ---- = ---- * --
     dx     dl    dx
</pre>

<p>
The parameter <code>dlBydx</code> must be set in each flux tube element to +1 or -1 according to the definition of the armature co-ordinate and the position of the element in a device's magnetic circuit. Proper match between armature motion and resulting variation of the flux tube length assures that the element's reluctance force acts in the right direction.
</p>
<p>
The shapes of the flux tubes defined in this package are rather simple. Only one dimension varies with armature motion. Flux tubes with more complex variations of dimensions with armature motion can be defined by extending the base class <a href=\"modelica://Modelica.Magnetic.FluxTubes.Interfaces.PartialForce\">Interfaces.PartialForce</a>, if needed. Determination of the analytic derivative dGmBydl could become more complex for those flux tubes.
</p>
</html>"));
    end Force;

    package Leakage
      "Leakage flux tubes with position-independent permeance and hence no force generation; mu_r=1"
      extends Modelica_Icons.VariantsPackage;

      model QuarterCylinder
        "Leakage flux from one edge to the opposite plane through a quarter cylinder"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Length l=0.1
          "Axial length orthogonal to flux (=2*pi*r for cylindrical pole and r>>distance between edge and plane)"
          annotation (Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/QuarterCylinder.png"));
      equation
        G_m = mu_0*0.52*l;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end QuarterCylinder;

      model QuarterHollowCylinder
        "Leakage flux in circumferential direction through a quarter hollow cylinder"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Length l=0.1
          "Axial length orthogonal to flux (=2*pi*r for cylindrical pole and r>>r_i)"
          annotation (Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/QuarterHollowCylinder.png"));
        parameter Real ratio(start=1) "Constant ratio t/r_i";

      equation
        G_m = 2*mu_0*l*Modelica_Math.log(1 + ratio)/pi;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end QuarterHollowCylinder;

      model HalfCylinder "Leakage flux through the edges of a half cylinder"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Length l=0.1
          "Axial length orthogonal to flux (=2*pi*r for cylindrical pole and r>>distance between edges)"
          annotation (Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/HalfCylinder.png"));

      equation
        G_m = mu_0*0.26*l;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end HalfCylinder;

      model HalfHollowCylinder
        "Leakage flux in circumferential direction through a half hollow cylinder"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Length l=0.1
          "Axial length orthogonal to flux (=2*pi*r for cylindrical pole and r>>r_i)"
          annotation (Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/HalfHollowCylinder.png"));
        parameter Real ratio(start=1) "Constant ratio t/r_i";

      equation
        G_m = mu_0*l*Modelica_Math.log(1 + ratio)/pi;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end HalfHollowCylinder;

      model QuarterSphere
        "Leakage flux through the corners of a quarter sphere"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Radius r=0.005 "Radius of quarter sphere" annotation (
            Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/QuarterSphere.png"));

      equation
        G_m = mu_0*0.077*2*r;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end QuarterSphere;

      model QuarterHollowSphere
        "Leakage flux through the edges of a quarter hollow sphere"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Length t(start=0.01) "Thickness of spherical shell"
          annotation (Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/QuarterHollowSphere.png"));

      equation
        G_m = mu_0*0.25*t;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end QuarterHollowSphere;

      model EighthOfSphere
        "Leakage flux through one edge and the opposite plane of an eighth of a sphere"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Radius r=0.01 "Radius of eighth of sphere" annotation (
            Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/EighthOfSphere.png"));

      equation
        G_m = mu_0*0.308*r;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end EighthOfSphere;

      model EighthOfHollowSphere
        "Leakage flux through one edge and the opposite plane of an eighth of a hollow sphere"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Length t(start=0.01) "Thickness of spherical shell"
          annotation (Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/EighthOfHollowSphere.png"));

      equation
        G_m = mu_0*0.5*t;

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end EighthOfHollowSphere;

      model CoaxCylindersEndFaces
        "Leakage flux between the end planes of a inner solid cylinder and a coaxial outer hollow cylinder"

        extends Modelica_Magnetic_FluxTubes_Interfaces.PartialLeakage;

        parameter SI.Radius r_0=10e-3 "Radius of inner solid cylinder"
          annotation (Dialog(group="Parameters", groupImage=
                "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Leakage/CoaxCylindersEndFaces.png"));
        parameter SI.Radius r_1=17e-3 "Inner radius of outer hollow cylinder";
        parameter SI.Radius r_2=20e-3 "Outer radius of outer hollow cylinder";

        final parameter SI.Distance l_g=r_1 - r_0
          "Radial gap length between both cylinders";
        final parameter SI.Length t=r_2 - r_1
          "Radial thickness of outer hollow cylinder";

      equation
        // [Ro41], p. 139, Eq. (22)
        G_m = if t <= r_0 then 2*mu_0*(r_0 + l_g/2)*Modelica_Math.log(1 + 2*t/
          l_g) else 2*mu_0*(r_0 + l_g/2)*Modelica_Math.log(1 + 2*r_0/l_g);

        annotation (Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Leakage</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>
</html>"));
      end CoaxCylindersEndFaces;

      annotation (Documentation(info="<html>
<p>
Please have a look at <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.ReluctanceForceCalculation\">UsersGuide.ReluctanceForceCalculation</a> for an explanation of the different flux tube categories and resulting sub-packages.
</p>

<p>
The permeances of all elements of this package are calculated from their geometry. These flux tube elements are intended for modelling of leakage fields through vacuum, air and other media with a relative permeability mu_r=1. <a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.LeakageWithCoefficient\">Basic.LeakageWithCoefficient</a> accounts for leakage not by the geometry of flux tubes, but by a coupling coefficient c_usefulFlux.
</p>

<p>
All dimensions are defined as parameters. As a result, the shape of these elements will remain constant during dynamic simulation of actuators and reluctance forces will not be generated in these flux tube elements. A simple leakage flux tube with reluctance force generation is provided with the element <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force.LeakageAroundPoles\">Force.LeakageAroundPoles</a>. In cases where the accuracy of that element is not sufficient, the leakage elements of this package can be adapted and extended so that they are able to change their shape with armature motion and to generate reluctance forces. This requires an extension of the partial model <a href=\"modelica://Modelica.Magnetic.FluxTubes.Interfaces.PartialForce\">Interfaces.PartialForce</a>, a higher variability of the variables representing the flux tube's dimensions, definition of a relationship between armature position and these dimensions and determination of the analytic derivative dG_m/dx of the flux tube's permeance G_m with respect to armature position x.
</p>
</html>"));
    end Leakage;

  end Shapes;

  package Material
    "Magnetisation characteristics of common soft magnetic and hard magnetic materials"
    extends Modelica_Icons.MaterialPropertiesPackage;

    package SoftMagnetic
      "Characteristics mu_r(B) of common soft magnetic materials; hysteresis neglected"
      extends Modelica_Icons.MaterialPropertiesPackage;

      record BaseData
        "Coefficients for approximation of soft magnetic materials"

        extends Modelica_Icons.Record;

        parameter SI.RelativePermeability mu_i=1
          "Initial relative permeability at B=0";
        parameter SI.MagneticFluxDensity B_myMax=1
          "Flux density at maximum relative permeability";
        parameter Real c_a=1 "Coefficient of approximation function";
        parameter Real c_b=1 "Coefficient of approximation function";
        parameter Real n=1 "Exponent of approximation function";

        annotation (Documentation(info="<html>
<p>
The parameters needed for <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic.mu_rApprox\">approximation of the magnetisation characteristics</a> of included soft magnetic materials are declared in this record.
</p>
</html>"));
      end BaseData;

      package Steel "Various ferromagnetic steels"
        extends Modelica_Icons.MaterialPropertiesPackage;
        record Steel_9SMnPb28 "9SMnPb28 (1.0718)"
          extends BaseData(
            mu_i=400,
            B_myMax=1.488,
            c_a=1200,
            c_b=3,
            n=12.5);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
        end Steel_9SMnPb28;

        record Steel_9SMn28K "9SMn28k (1.0715)"
          extends BaseData(
            mu_i=500,
            B_myMax=1.036,
            c_a=43414,
            c_b=35.8,
            n=14);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
        end Steel_9SMn28K;

        record DC01 "DC01 (1.0330, previously St2)"
          extends BaseData(
            mu_i=5,
            B_myMax=1.1,
            c_a=6450,
            c_b=3.65,
            n=7.7);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
        end DC01;

        record DC03 "DC03 (1.0347, previously St3)"
          extends BaseData(
            mu_i=0,
            B_myMax=1.05,
            c_a=27790,
            c_b=16,
            n=10.4);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
        end DC03;

        record X6Cr17 "X6Cr17 (1.4016)"
          extends BaseData(
            mu_i=274,
            B_myMax=1.1,
            c_a=970,
            c_b=1.2,
            n=8.3);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
        end X6Cr17;

        record AISI_1008 "AISI 1008 (1.0204)"
          extends BaseData(
            mu_i=200,
            B_myMax=1.17,
            c_a=8100,
            c_b=2.59,
            n=10);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
        end AISI_1008;

        record AISI_12L14 "AISI 12L14 (1.0718)"
          extends BaseData(
            mu_i=10,
            B_myMax=0.94,
            c_a=5900,
            c_b=4.19,
            n=6.4);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
        end AISI_12L14;
        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
      end Steel;

      package ElectricSheet "Various electric sheets"
        extends Modelica_Icons.MaterialPropertiesPackage;

        record M330_50A "M330-50A (1.0809) @ 50Hz"
          extends BaseData(
            mu_i=500,
            B_myMax=0.7,
            c_a=24000,
            c_b=9.38,
            n=9.6);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Sample: complete core after machining and packet assembling<br>
</p>
</html>"));
        end M330_50A;

        record M350_50A "M350-50A (1.0810) @ 50Hz"
          extends BaseData(
            mu_i=1210,
            B_myMax=1.16,
            c_a=24630,
            c_b=2.44,
            n=14);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Sample: sheet strip<br>
Measurement: Epstein frame
</p>
</html>"));
        end M350_50A;

        record M530_50A "M530-50A (1.0813) @ 50Hz"
          extends BaseData(
            mu_i=2120,
            B_myMax=1.25,
            c_a=12400,
            c_b=1.6,
            n=13.5);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Sample: sheet strip<br>
Measurement: Epstein frame
</p>
</html>"));
        end M530_50A;

        record M700_100A "M700-100A (1.0826) @ 50Hz"
          extends BaseData(
            mu_i=1120,
            B_myMax=1.2,
            c_a=20750,
            c_b=3.55,
            n=13.15);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Sample: sheet strip<br>
Measurement: Epstein frame
</p>
</html>"));
        end M700_100A;

        record M940_100A "M940-100A @ 50Hz"
          extends BaseData(
            mu_i=680,
            B_myMax=1.26,
            c_a=17760,
            c_b=3.13,
            n=13.9);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Sample: sheet strip<br>
Measurement: Epstein frame
</p>
</html>"));
        end M940_100A;

        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
      end ElectricSheet;

      package PureIron "Pure iron"
        extends Modelica_Icons.MaterialPropertiesPackage;

        record RFe80 "Hyperm 0 (RFe80)"
          extends BaseData(
            mu_i=123,
            B_myMax=1.27,
            c_a=44410,
            c_b=6.4,
            n=10);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Source of B(H) characteristics: Product catalogue <i>Magnequench</i>, 2000
</p>
</html>"));
        end RFe80;

        record VacoferS2 "VACOFER S2 (99.95% Fe)"
          extends BaseData(
            mu_i=2666,
            B_myMax=1.15,
            c_a=187000,
            c_b=4.24,
            n=19);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<dl>
<dt>Source of B(H) characteristics:</dt>
    <dd><p><i>Boll, R.</i>: Weichmagnetische Werkstoffe: Einf&uuml;hrung in den Magnetismus, VAC-Werkstoffe und ihre Anwendungen. 4th ed. Berlin, M&uuml;nchen: Siemens Aktiengesellschaft 1990</p>
    </dd>
</dl>
</html>"));
        end VacoferS2;
      end PureIron;

      package CobaltIron "Cobalt iron"
        extends Modelica_Icons.MaterialPropertiesPackage;

        record Vacoflux50 "Vacoflux 50 (50% CoFe)"
          extends BaseData(
            mu_i=3850,
            B_myMax=1.75,
            c_a=11790,
            c_b=2.63,
            n=15.02);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Source of B(H) characteristics: VACUUMSCHMELZE GmbH &amp; Co. KG, Germany
</p>
</html>"));
        end Vacoflux50;
      end CobaltIron;

      package NickelIron "Nickel iron"
        extends Modelica_Icons.MaterialPropertiesPackage;

        record MuMetall "MUMETALL (77% NiFe)"
          extends BaseData(
            mu_i=27300,
            B_myMax=0.46,
            c_a=1037500,
            c_b=3.67,
            n=10);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Source of B(H) characteristics:
</p>
<ul>
<li><i>Boll, R.</i>: Weichmagnetische Werkstoffe: Einf&uuml;hrung in den Magnetismus, VAC-Werkstoffe und ihre Anwendungen. 4th ed. Berlin, M&uuml;nchen: Siemens Aktiengesellschaft 1990</li>
</ul>
</html>"));
        end MuMetall;

        record Permenorm3601K3 "PERMENORM 3601 K3 (36% NiFe)"
          extends BaseData(
            mu_i=3000,
            B_myMax=0.67,
            c_a=50000,
            c_b=2.39,
            n=9.3);
          annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">SoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
<p>
Source of B(H) characteristics:
</p>
<ul>
<li><i>Boll, R.</i>: Weichmagnetische Werkstoffe: Einf&uuml;hrung in den Magnetismus, VAC-Werkstoffe und ihre Anwendungen. 4th ed. Berlin, M&uuml;nchen: Siemens Aktiengesellschaft 1990</li>
</ul>
</html>"));
        end Permenorm3601K3;
      end NickelIron;

      function mu_rApprox
        "Approximation of relative permeability mu_r as a function of flux density B for soft magnetic materials"

        extends Modelica_Icons.Function;

        input SI.MagneticFluxDensity B
          "Flux density in ferromagnetic flux tube element";
        //Material specific parameter set:
        input SI.RelativePermeability mu_i
          "Initial relative permeability at B=0";
        input SI.MagneticFluxDensity B_myMax
          "Flux density at maximum relative permeability";
        input Real c_a "Coefficient of approximation function";
        input Real c_b "Coefficient of approximation function";
        input Real n "Exponent of approximation function";

        output SI.RelativePermeability mu_r
          "Relative magnetic permeability of ferromagnetic flux tube element";

      protected
        Real B_N
          "Flux density B normalized to flux density at maximum relative permeability B_myMax";

      algorithm
        B_N := abs(B/B_myMax);
        mu_r := 1 + (mu_i - 1 + c_a*B_N)/(1 + c_b*B_N + B_N^n);

        annotation (Documentation(info="<html>
<p>
The relative permeability mu_r as a function of flux density B for all soft magnetic materials currently included in this library is approximated with the following function <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro00]</a>:
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Material/SoftMagnetic/eq_mu_rApprox.png\" ALT=\"Equation for approximation mu_r(B)\"/>
</p>

<p>
Two of the five parameters of this equation have a physical meaning, namely the initial relative permeability mu_i at B=0 and the magnetic flux density at maximum permeability B_myMax. B_N is the flux density normalized to latter parameter.</p>
</html>"));
      end mu_rApprox;
      annotation (Documentation(info="<html>
<p>
The magnetisation characteristics mu_r(B) of all soft magnetic materials currently included in this library are approximated with a <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic.mu_rApprox\">function</a>. Each material is characterised by the five parameters of this function. The approximated characteristics mu_r(B) for most of the ferromagnetic materials currently included are shown in the plots below (solid lines) together with the original data points compiled from measurements and literature.
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Material/SoftMagnetic/Steel.png\" ALT=\"Approximated magnetization characteristics of selected steels\"><br>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Material/SoftMagnetic/Miscellaneous.png\" ALT=\"Approximated magnetization characteristics of miscellaneous soft magnetic materials\"><br>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Material/SoftMagnetic/ElectricSheet.png\" ALT=\"Approximated magnetization characteristics of included electric sheets\"><br>
</p>

<p>
For the nonlinear curve fit, data points for high flux densities (approximately B>1T) have been weighted higher than the ones for low flux densities. This is due to the large impact of saturated ferromagnetic sections in a magnetic circuit compared to that of non-saturated sections with relative permeabilities mu_r>>1.
</p>

<p>
Note that the magnetisation characteristics largely depend on possible previous machining and on measurement conditions. A virgin material normally has a considerably higher permeability than the same material after machining (and packet assembling in case of electric sheets). This is indicated in the above plots by different magnetisation curves for similar materials. In most cases, the original data points represent commutating curves obtained with measurements at 50Hz.
</p>

<p>
Additional user-specific materials can be defined as needed. This requires determination of the approximation parameters from the original data points, preferably with a nonlinear curve fit.
</p>
</html>"));

    end SoftMagnetic;

    package HardMagnetic
      "Characteristics of common permanent magnetic materials (temperature dependence considered)"
      extends Modelica_Icons.MaterialPropertiesPackage;

      record BaseData "Record for permanent magnetic material data"
        extends Modelica_Icons.Record;

        parameter SI.MagneticFieldStrength H_cBRef=1
          "Coercivity at reference temperature";
        parameter SI.MagneticFluxDensity B_rRef=1
          "Remanence at reference temperature";
        parameter SI.Temperature T_ref=293.15 "Reference temperature";
        parameter SI.LinearTemperatureCoefficient alpha_Br=0
          "Temperature coefficient of remanence at reference temperature";

        parameter SI.Temperature T_op=293.15 "Operating temperature";

        final parameter SI.MagneticFluxDensity B_r=B_rRef*(1 + alpha_Br*(T_op
             - T_ref)) "Remanence at operating temperature";
        final parameter SI.MagneticFieldStrength H_cB=H_cBRef*(1 + alpha_Br*(
            T_op - T_ref)) "Coercivity at operating temperature";
        final parameter SI.RelativePermeability mu_r=B_r/(mu_0*H_cB)
          "Relative permeability";

        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.HardMagnetic\">HardMagnetic</a> for a description of all permanent magnetic material characteristics of this package.
</p>
</html>"));
      end BaseData;

      record NdFeB "NdFeB sintered; exemplary values"
        extends BaseData(
          H_cBRef=900000,
          B_rRef=1.2,
          T_ref=20 + 273.15,
          alpha_Br=-0.001);
        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.HardMagnetic\">HardMagnetic</a> for a description of all permanent magnetic material characteristics of this package.
</p>
</html>"));
      end NdFeB;

      record Sm2Co17 "Sm2Co17 sintered, exemplary values"
        extends BaseData(
          H_cBRef=750000,
          B_rRef=1.02,
          T_ref=20 + 273.15,
          alpha_Br=-0.0003);
        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.HardMagnetic\">HardMagnetic</a> for a description of all permanent magnetic material characteristics of this package.
</p>
</html>"));
      end Sm2Co17;

      record SmCo5 "SmCo5 sintered, exemplary values"
        extends BaseData(
          H_cBRef=720000,
          B_rRef=0.95,
          T_ref=20 + 273.15,
          alpha_Br=-0.0004);
        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.HardMagnetic\">HardMagnetic</a> for a description of all permanent magnetic material characteristics of this package.
</p>
</html>"));
      end SmCo5;

      record PlasticNdFeB "Plastic-bonded NdFeB, exemplary values"
        extends BaseData(
          H_cBRef=400000,
          B_rRef=0.58,
          T_ref=20 + 273.15,
          alpha_Br=-0.001);
        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.HardMagnetic\">HardMagnetic</a> for a description of all permanent magnetic material characteristics of this package.
</p>
</html>"));
      end PlasticNdFeB;

      record PlasticSmCo "Plastic-bonded Sm-Co, exemplary values"
        extends BaseData(
          H_cBRef=385000,
          B_rRef=0.57,
          T_ref=20 + 273.15,
          alpha_Br=-0.0004);
        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.HardMagnetic\">HardMagnetic</a> for a description of all permanent magnetic material characteristics of this package.
</p>
</html>"));
      end PlasticSmCo;

      record HardFerrite "Hard ferrite sintered, exemplary values"
        extends BaseData(
          H_cBRef=170000,
          B_rRef=0.38,
          T_ref=20 + 273.15,
          alpha_Br=-0.002);
        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.HardMagnetic\">HardMagnetic</a> for a description of all permanent magnetic material characteristics of this package.
</p>
</html>"));
      end HardFerrite;

      record PlasticHardFerrite "Plastic-bonded hard ferrite, exemplary values"
        extends BaseData(
          H_cBRef=130000,
          B_rRef=0.21,
          T_ref=20 + 273.15,
          alpha_Br=-0.002);
        annotation (Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.HardMagnetic\">HardMagnetic</a> for a description of all permanent magnetic material characteristics of this package.
</p>
</html>"));
      end PlasticHardFerrite;

      annotation (Documentation(info="<html>
<p>
Typical values for remanence, coercivity and the temperature coefficient of remanence are provided for the common permanent magnetic materials illustrated below.
<dl>
<dd>
<IMG src=\"modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Material/HardMagnetic/HardMagneticMaterials.png\" ALT=\"Demagnetization characteristics of included permanent magnetic materials\">
</dd>
</dl>
<p>
Linear demagnetization curves are modelled. The characteristic, temperature-dependent \"knee\" of many permanent magnetic materials is not considered, since proper design of permanent magnetic circuits should avoid operation of permanent magnets \"below\" that point due to partial demagnetization. As a result, the temperature coefficient of coercivity is not considered. Only the temperature coefficient of remanence alpha_Br is accounted for, since it describes the dependence of the demagnetization curve on the temperature sufficiently for the region \"above the knee-point\".
</p>
<p>
Additional user-specific materials can be defined as needed.
</p>
</html>"));
    end HardMagnetic;
    annotation (Documentation(info="<html>
</html>"));
  end Material;

  package Sources
    "Sources of different complexity of magnetomotive force and magnetic flux"
    extends Modelica_Icons.SourcesPackage;

    model ConstantMagneticPotentialDifference "Constant magnetomotive force"

      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPortsElementary;
      parameter SI.MagneticPotentialDifference V_m
        "Magnetic potential difference";
      SI.MagneticFlux Phi "Magnetic flux from port_p to port_n";

    equation
      V_m = port_p.V_m - port_n.V_m;
      Phi = port_p.Phi;
      0 = port_p.Phi + port_n.Phi;

      annotation (
        defaultComponentName="constantSource",
        Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Ellipse(
            extent={{-50,-50},{50,50}},
            lineColor={255,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{100,0},{50,0}}, color={255,127,0}),
          Line(points={{-50,0},{-100,0}}, color={255,127,0}),
          Text(
            extent={{-80,-20},{-80,-40}},
            lineColor={255,128,0},
            textString="+"),
          Text(
            extent={{80,-20},{80,-40}},
            lineColor={255,128,0},
            textString="-"),
          Text(
            extent={{-150,-110},{150,-70}},
            textString="%name",
            lineColor={0,0,255}),
          Line(points={{-50,0},{50,0}}, color={255,127,0})}),
        Documentation(info="<html>
<p>
Magnetic circuits under steady-state conditions, i.e., with stationary magnetic fields (change of magnetic flux  d&Phi;/dt = 0) can be described with constant sources of a magnetic potential difference or magnetomotive force (mmf). Constant magnetic potential differences are imposed by
</p>
<ul>
<li>coils with stationary current (di / dt = 0) and </li>
<li>permanent magnets modelled with <i>Th&eacute;venin</i>'s equivalent magnetic circuit. </li>
</ul>
<p>
For modelling of reluctance actuators with this source component it is assumed that the armature is fixed so that no motion-induced flux change d&Phi;/dt can occur.
</p>
</html>"));
    end ConstantMagneticPotentialDifference;

    model SignalMagneticPotentialDifference
      "Signal-controlled magnetomotive force"

      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPortsElementary;
      Modelica_Blocks_Interfaces.RealInput V_m(unit="A")
        "Magnetic potential difference" annotation (Placement(transformation(
            origin={0,90},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      SI.MagneticFlux Phi "Magnetic flux from port_p to port_n";

    equation
      V_m = port_p.V_m - port_n.V_m;
      Phi = port_p.Phi;
      0 = port_p.Phi + port_n.Phi;
      annotation (
        defaultComponentName="signalSource",
        Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Line(points={{-100,0},{-50,0}}, color={255,127,0}),
          Line(points={{50,0},{100,0}}, color={255,127,0}),
          Text(
            extent={{-80,-20},{-80,-40}},
            lineColor={255,128,0},
            textString="+"),
          Text(
            extent={{80,-20},{80,-40}},
            lineColor={255,128,0},
            textString="-"),
          Line(points={{0,100},{0,50}}, color={255,127,0}),
          Text(
            extent={{-150,-110},{150,-70}},
            textString="%name",
            lineColor={0,0,255}),
          Ellipse(
            extent={{-50,-50},{50,50}},
            lineColor={255,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{-50,0},{50,0}}, color={255,127,0})}),
        Documentation(info="<html>
<p>
In electromagnetic devices, a change of a coil's magnetic flux linkage &Psi; reacts on the electrical subsystem in that a voltage v is induced due to <i>Faraday</i>'s law:
</p>
<pre>
    v = - d&Psi;/dt
</pre>
<p>This reaction can possibly be neglected for</p>
<ul>
<li>modelling of electromagnetic actuators under quasi-stationary conditions (slow current change, slow armature motion),
<li>modelling of current-controlled electromagnetic actuators (ideal current source) and</li>
<li>for system simulation where the system dynamics is not governed by an electromagnetic actuator, but by the surrounding subsystems.</li>
</ul>
<p>
In these cases, the magnetic potential difference or magnetomotive force imposed by a coil can easily be modelled with a signal-controlled source. Except for the neglected dynamics, steady-state actuator forces will be calculated properly in actuator models based on these sources.
</p>
</html>"));
    end SignalMagneticPotentialDifference;

    model ConstantMagneticFlux "Source of constant magnetic flux"

      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPortsElementary;
      parameter SI.MagneticFlux Phi=1 "Magnetic flux";
      SI.MagneticPotentialDifference V_m
        "Magnetic potential difference between both ports";

    equation
      V_m = port_p.V_m - port_n.V_m;
      Phi = port_p.Phi;
      0 = port_p.Phi + port_n.Phi;
      annotation (
        defaultComponentName="constantSource",
        Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Text(
            extent={{-150,-110},{150,-70}},
            textString="%name",
            lineColor={0,0,255}),
          Polygon(
            points={{80,0},{60,6},{60,-6},{80,0}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Line(points={{-100,0},{-50,0}}, color={255,127,0}),
          Line(points={{50,0},{100,0}}, color={255,127,0}),
          Ellipse(
            extent={{-50,-50},{50,50}},
            lineColor={255,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{0,50},{0,-50}}, color={255,127,0})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={Line(points={{-125,0},{-115,0}}, color={160,
              160,164}),Line(points={{-120,-5},{-120,5}}, color={160,160,164}),
              Line(points={{115,0},{125,0}}, color={160,160,164})}),
        Documentation(info="<html>
<p>
Sources of a constant magnetic flux are useful for modelling of permanent magnets with <i>Norton</i>'s magnetic equivalent circuit.
</p>
</html>"));
    end ConstantMagneticFlux;

    model SignalMagneticFlux "Signal-controlled magnetic flux source"

      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPortsElementary;
      Modelica_Blocks_Interfaces.RealInput Phi(unit="Wb") "Magnetic flux" annotation (
          Placement(transformation(
            origin={0,90},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      SI.MagneticPotentialDifference V_m
        "Magnetic potential difference between both ports";

    equation
      V_m = port_p.V_m - port_n.V_m;
      Phi = port_p.Phi;
      0 = port_p.Phi + port_n.Phi;
      annotation (
        defaultComponentName="signalSource",
        Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Polygon(
            points={{80,0},{60,6},{60,-6},{80,0}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,-110},{150,-70}},
            textString="%name",
            lineColor={0,0,255}),
          Line(points={{-100,0},{-50,0}}, color={255,127,0}),
          Line(points={{50,0},{100,0}}, color={255,127,0}),
          Line(points={{0,100},{0,50}}, color={255,127,0}),
          Ellipse(
            extent={{-50,-50},{50,50}},
            lineColor={255,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{0,50},{0,-50}}, color={255,127,0})}),
        Documentation(info="<html>
<p>
This source of a magnetic flux is intended for test purposes, e.g., for simulation and subsequent plotting of a softmagnetic material's magnetisation characteristics if used together with a non-linear reluctance element.
</p>
</html>"));
    end SignalMagneticFlux;

    annotation (Documentation(info="<html>
<p>
This package contains sources of a magnetic potential difference or a magnetic flux:
</p>
</html>"));
  end Sources;

  package Sensors "Sensors to measure variables in magnetic networks"
    extends Modelica_Icons.SensorsPackage;

    model MagneticPotentialDifferenceSensor
      "Sensor to measure magnetic potential difference"
      extends Modelica_Icons.RotationalSensor;
      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPortsElementary;

      Modelica_Blocks_Interfaces.RealOutput V_m(final quantity=
            "MagneticPotential", final unit="A")
        "Magnetic potential difference between ports p and n as output signal"
        annotation (Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      SI.MagneticFlux Phi "Magnetic flux from port_p to port_n";

    equation
      V_m = port_p.V_m - port_n.V_m;
      Phi = port_p.Phi;
      Phi = 0;
      0 = port_p.Phi + port_n.Phi;

      annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-52,1},{48,-57}},
              lineColor={0,0,0},
              textString="V_m"),
            Line(points={{-70,0},{-90,0}}, color={0,0,0}),
            Line(points={{70,0},{90,0}}, color={0,0,0}),
            Line(points={{0,-90},{0,-70}}, color={0,0,0}),
            Text(
              extent={{-150,120},{150,80}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={Line(points={{-70,0},{-100,0}}, color={255,
              128,0}),Line(points={{70,0},{100,0}}, color={255,128,0}),Line(
              points={{0,-100},{0,-70}}, color={0,0,0})}));
    end MagneticPotentialDifferenceSensor;

    model MagneticFluxSensor "Sensor to measure magnetic flux"
      extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPortsElementary;
      extends Modelica_Icons.RotationalSensor;

      Modelica_Blocks_Interfaces.RealOutput Phi(final quantity="MagneticFlux",
          final unit="Wb")
        "Magnetic flux from port p to port n as output signal" annotation (
          Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));
    equation
      port_p.V_m = port_n.V_m;
      Phi = port_p.Phi;
      0 = port_p.Phi + port_n.Phi;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Line(points={{0,-100},{0,-70}},
              color={0,0,0}),Line(points={{-70,0},{-90,0}}, color={0,0,0}),Line(
              points={{70,0},{90,0}}, color={0,0,0}),Text(extent={{-29,-11},{30,
              -70}}, textString="Phi"),Text(
                  extent={{-150,120},{150,80}},
                  textString="%name",
                  lineColor={0,0,255}),Line(points={{0,-90},{0,-70}})}));
    end MagneticFluxSensor;
    annotation (Documentation(info="<html>
<p>
For analysis of magnetic networks, only magnetic potential differences and magnetic flux are variables of interest. For that reason, a magnetic potential sensor is not provided.
</p>
</html>"));
  end Sensors;

  annotation (Documentation(info="<html>
<p>
This library contains components for modelling of electromagnetic devices with lumped magnetic networks. Those models are suited for both rough design of the magnetic subsystem of a device as well as for efficient dynamic simulation at system level together with neighbouring subsystems. At present, components and examples for modelling of <i>translatory</i> electromagnetic and electrodynamic actuators are provided. If needed, these components can be adapted to network modelling of <i>rotational</i> electrical machines.
</p>
<p>
<a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide\">User's Guide</a> gives a short introduction to the underlying concept of <b>magnetic flux tubes</b>, summarizes the calculation of magnetic <b>reluctance forces</b> from lumped magnetic network models and lists <b>reference literature</b>.
</p>
<p>
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Examples\">Examples</a> illustrates the usage of magnetic network models with simple models from different fields of application.
</p>

<p>
Copyright &copy; 2005-2013, Modelica Association and Thomas B&ouml;drich.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>", revisions="<html>
<p>
See <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.ReleaseNotes\">release notes</a>
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100.0,-100.0},{100.0,100.0}}), graphics={
    Polygon(
      origin={-3.75,0.0},
      fillColor={160,160,164},
      fillPattern=FillPattern.Solid,
      points={{33.75,50.0},{-46.25,50.0},{-46.25,-50.0},{33.75,-50.0},{33.75,-30.0},{-21.25,-30.0},{-21.25,30.0},{33.75,30.0}}),
    Ellipse(
      origin={10.4708,41.6771},
      extent={{-86.0,-24.0},{-78.0,-16.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-20.0},{-78.0,-20.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.1812,-31.6229},{-32.0,-40.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-20.0},{-32.0,-28.0}}),
    Ellipse(
      origin={10.4708,41.6771},
      extent={{-86.0,-60.0},{-78.0,-52.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-56.0},{-78.0,-56.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-44.0},{-32.0,-52.0}}),
    Line(
      origin={10.4708,41.6771},
      points={{-64.0,-56.0},{-32.0,-64.0}}),
    Rectangle(
      origin={62.5,0.0},
      fillColor={160,160,164},
      fillPattern=FillPattern.Solid,
      extent={{-12.5,-50.0},{12.5,50.0}})}),
    uses(Modelica_SIunits(version="3.2.2"),
         Modelica_Blocks_Interfaces(version="3.2.2"),
         Modelica_Math(version="3.2.2"),
         Modelica_Constants(version="3.2.2"),
         Modelica_Electrical_Analog_Interfaces(version="3.2.2"),
         Modelica_Magnetic_FluxTubes_Interfaces(version="3.2.2"),
         Modelica_Icons(version="3.2.2")),
     version="3.2.2");
end Modelica_Magnetic_FluxTubes;
