within ;
package Modelica_Magnetic_FluxTubes_Interfaces
  "Interfaces of magnetic network components"
  extends Modelica_Icons.InterfacesPackage;

  connector MagneticPort "Generic magnetic port"
    Modelica_SIunits.MagneticPotential V_m "Magnetic potential at the port";
    flow Modelica_SIunits.MagneticFlux Phi
      "Magnetic flux flowing into the port";

    annotation (defaultComponentName="mag");
  end MagneticPort;

  connector PositiveMagneticPort "Positive magnetic port"
    extends Modelica_Magnetic_FluxTubes_Interfaces.MagneticPort;

    annotation (
      defaultComponentName="port_p",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,127,0},
            fillColor={255,127,0},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Text(
            extent={{-100,160},{-100,100}},
            lineColor={255,127,0},
            textString="%name"), Rectangle(
            extent={{-40,40},{40,-40}},
            lineColor={255,127,0},
            fillColor={255,127,0},
            fillPattern=FillPattern.Solid)}));

  end PositiveMagneticPort;

  connector NegativeMagneticPort "Negative magnetic port"
    extends Modelica_Magnetic_FluxTubes_Interfaces.MagneticPort;

    annotation (
      defaultComponentName="port_n",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Text(
            extent={{100,160},{100,100}},
            lineColor={255,127,0},
            textString="%name"), Rectangle(
            extent={{-40,40},{40,-40}},
            lineColor={255,127,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));

  end NegativeMagneticPort;

  partial model PartialTwoPortsElementary
    "Partial component with two magnetic ports p and n for textual programming"

    Modelica_Magnetic_FluxTubes_Interfaces.PositiveMagneticPort port_p
      "Positive magnetic port" annotation (Placement(transformation(extent={{-110,
              -10},{-90,10}}, rotation=0)));
    Modelica_Magnetic_FluxTubes_Interfaces.NegativeMagneticPort port_n
      "Negative magnetic port" annotation (Placement(transformation(extent={{90,
              -10},{110,10}}, rotation=0)));

    annotation (Documentation(info="<html>
<p>
Partial model of a flux tube component with two magnetic ports:
the positive port connector port_p, and the negative port
connector port_n.
</p>
</html>"));
  end PartialTwoPortsElementary;

  partial model PartialTwoPorts
    "Partial component with magnetic potential difference between two magnetic ports p and n and magnetic flux Phi from p to n"

    extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPortsElementary;
    Modelica_SIunits.MagneticPotentialDifference V_m
      "Magnetic potential difference between both ports";
    Modelica_SIunits.MagneticFlux Phi(start=0)
      "Magnetic flux from port_p to port_n";

  equation
    V_m = port_p.V_m - port_n.V_m;
    Phi = port_p.Phi;
    0 = port_p.Phi + port_n.Phi;

    annotation (Documentation(info="<html>
<p>
It is assumed that the magnetic flux flowing into port_p is identical to the flux flowing out of port_n.
This magnetic flux is provided explicitly as flux Phi.
</p>
</html>"));
  end PartialTwoPorts;

  partial model PartialFixedShape
    "Base class for flux tubes with fixed shape during simulation; linear or non-linear material characteristics"

    extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPorts;

    parameter Boolean nonLinearPermeability=true
      "= true, if non-linear rel. permeability is used, otherwise constant rel. permeability"
      annotation (Dialog(group="Material"), Evaluate=true);
    parameter Modelica_SIunits.RelativePermeability mu_rConst=1
      "Constant relative permeability; used if nonLinearPermeability = false"
      annotation (Dialog(group="Material", enable=not nonLinearPermeability));

    parameter Modelica_Magnetic_FluxTubes.Material.SoftMagnetic.BaseData material=
        Modelica_Magnetic_FluxTubes.Material.SoftMagnetic.BaseData()
      "Ferromagnetic material characteristics; used if nonLinearPermeability = true"
      annotation (choicesAllMatching=true, Dialog(group="Material", enable=
            nonLinearPermeability));

    Modelica_SIunits.Reluctance R_m "Magnetic reluctance";
    Modelica_SIunits.Permeance G_m "Magnetic permeance";
    Modelica_SIunits.MagneticFluxDensity B "Magnetic flux density";
    Modelica_SIunits.CrossSection A
      "Cross-sectional area penetrated by magnetic flux";
    Modelica_SIunits.MagneticFieldStrength H "Magnetic field strength";

    Modelica_SIunits.RelativePermeability mu_r "Relative magnetic permeability";

  equation
    mu_r = if nonLinearPermeability then
      Modelica_Magnetic_FluxTubes.Material.SoftMagnetic.mu_rApprox(
          B,
          material.mu_i,
          material.B_myMax,
          material.c_a,
          material.c_b,
          material.n) else mu_rConst;
    R_m = 1/G_m;
    V_m = Phi*R_m;
    B = Phi/A;
    H = B/(Modelica_Constants.mue_0*mu_r);

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
          extent={{-150,-100},{150,-60}},
          textString="%name",
          lineColor={0,0,255})}), Documentation(info="<html>
<p>
Please refer to the description of  the sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape\">Shapes.FixedShape</a> for utilisation of this partial model.
</p>
</html>"));
  end PartialFixedShape;

  partial model PartialForce
    "Base class for flux tubes with reluctance force generation; constant permeability"

    extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPorts;

    parameter Boolean useSupport=false
      "= true, if support flange enabled, otherwise implicitly grounded"
      annotation (Evaluate=true, HideResult=true);

    parameter Modelica_SIunits.RelativePermeability mu_r(start=1)
      "Relative magnetic permeability";

    Modelica_SIunits.Force F_m "Reluctance force";
    Modelica_SIunits.Length s=flange.s - s_support
      "Distance between flange and support";

    Modelica_SIunits.Reluctance R_m "Magnetic reluctance";
    Modelica_SIunits.Permeance G_m "Magnetic permeance";
    Modelica_SIunits.Permeability dGmBydx
      "Derivative of permeance with respect to armature position";
    parameter Integer dlBydx=1
      "Derivative of flux tube's varying dimension with respect to armature position; set to +1 or -1";

    Modelica_Mechanics_Translational_Interfaces.Flange_b flange
      "Generated reluctance force at armature position" annotation (Placement(
          transformation(extent={{-10,90},{10,110}}, rotation=0)));
    Modelica_Mechanics_Translational_Interfaces.Support support(s=s_support,
        f=-flange.f) if useSupport "Support/housing of component" annotation (
       Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=0)));

  protected
    Modelica_SIunits.Length s_support "Absolute position of support flange";

  equation
    V_m = Phi*R_m;
    R_m = 1/G_m;
    F_m = 0.5*V_m^2*dGmBydx;

    if not useSupport then
      s_support = 0;
    end if;
    flange.f = -F_m;

    annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{30,30},{70,-30}},
          lineColor={255,128,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-70,0},{-90,0}}, color={255,128,0}),
        Line(points={{70,0},{90,0}}, color={255,128,0}),
        Text(
          extent={{-150,-80},{150,-40}},
          textString="%name",
          lineColor={0,0,255}),
        Line(points={{-10,-100},{-30,-120}}, color={0,0,0}),
        Line(points={{-30,-100},{-50,-120}}, color={0,0,0}),
        Line(points={{-30,-100},{30,-100}}, color={0,0,0}),
        Line(points={{10,-100},{-10,-120}}, color={0,0,0}),
        Line(points={{30,-100},{10,-120}}, color={0,0,0}),
        Rectangle(
          extent={{-70,30},{-30,-30}},
          lineColor={255,128,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,80},{10,-30}},
          lineColor={0,0,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
Please refer to the description of  the sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Force\">Shapes.Force</a> for utilisation of this partial model.
</p>
</html>"));
  end PartialForce;

  partial model PartialLeakage
    "Base class for leakage flux tubes with position-independent permeance and hence no force generation; mu_r=1"

    extends Modelica_Magnetic_FluxTubes_Interfaces.PartialTwoPorts;

    Modelica_SIunits.Reluctance R_m "Magnetic reluctance";
    Modelica_SIunits.Permeance G_m "Magnetic permeance";

  equation
    V_m = Phi*R_m;
    R_m = 1/G_m;

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
          extent={{-150,-100},{150,-60}},
          textString="%name",
          lineColor={0,0,255})}), Documentation(info="<html>
<p>
Please refer to the description of  the sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.Leakage\">Shapes.Leakage</a> for utilisation of this partial model.
</p>
</html>"));
  end PartialLeakage;
  annotation (Documentation(info="<html>
<p>
This package contains connectors for the magnetic domain and partial models for lumped magnetic network components.
</p>

</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Magnetic_FluxTubes_Interfaces;
