within ;
package Modelica_Magnetic_QuasiStatic_FundamentalWave
  "Quasi static fundamental wave electric machines"
  extends Modelica_Icons.Package;
  package UsersGuide "User's Guide"
    extends Modelica_Icons.Information;
    class Concept "Fundamental wave concept"
      extends Modelica_Icons.Information;
      annotation (Documentation(info="<html>
<h5>Reference frames</h5>

<p>Quasi static  magnetic ports contain the complex magnetic flux (flow variable) and the comlplex magnetic potential difference (potential variable) and a reference ange. The relationship between the different complex phasors with respect to different refrences will be explained by means of the complex magnetic flux. The same transformation relationships the also apply to the complex magnetic potential difference. However, the discussed relationsships are important for handling connectors in the air gap model, transform equations into the rotor fixed reference frame, etc. </p>

<p>
Let us assume that the air gap model contains stator and rotor magnetic ports which relate to the different sides of the machine. The anlge relationship between these ports is
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma_relationship.png\"/>,
</p>

<p>where
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma_s.png\"/>
is the connector reference angle of the stator ports,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma_r.png\"/>
is the connector reference angle of the rotor ports, and
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma_mechanical.png\"/>
is the difference of the mechanical angles of the flange and the support, respectively,
multiplied by the number of pole pairs,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/p.png\"/>.
The stator and rotor reference angles are directly related with the electrical frequencies of the
electric circuits of the stator,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/f_s.png\"/>,
and rotor,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/f_r.png\"/>,
respectively, by means of:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma_f.png\"/>
</p>

<p>
This is a strict consequence of the elctro magnetic coupling between the quasi static electric and the quasi static magnetic domain.</p>


<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><b>Fig. 1:</b> Reference frames of the quasi static fundamental wave library</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/ReferenceFrames.png\"/>
    </td>
  </tr>
</table>

<p>
The complex magnetic flux with respect a stator and rotor magnetic port are equal,
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/Phi(ref)=Phi,re+jPhi,im.png\"/>,
</p>

<p>
but the reference phase angles are different according to the relationship explained above. The stator and rotor reference angles refer to quasi static magnetic connectors. The complex magnetic flux of the (stator) port with respect to the <b>stator fixed</b> reference frame is then calculated by</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/Phi_s_ref.png\"/>.
</p>

<p>
The complex magnetic flux of the (rotor) magnetic port with respect to the <b>rotor fixed</b> reference frame is then calculated by</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/Phi_r_ref.png\"/>.
</p>

<p>
The two stator and rotor fixed complex fluxes are related by</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/Phi_r_s.png\"/>.
</p>

</html>"));
    end Concept;

    class Contact "Contact"
      extends Modelica_Icons.Contact;
      annotation (Documentation(info="<html>
<h4>Contact</h4>

<p>
  Dr. Christian Kral<br>
  <a href=\"http://christiankral.net/\">Electric Machines, Drives and Systems</a><br>
  A-1060 Vienna, Austria<br>
  email: <a href=\"mailto:dr.christian.kral@gmail.com\">dr.christian.kral@gmail.com</a>
</p>

<p>
Anton Haumer<br>
<a href=\"http://www.haumer.at\">Technical Consulting &amp; Electrical Engineering</a><br>
3423 St. Andrae-Woerdern, Austria<br>
email: <a HREF=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a><br>
</p>

</html>"));
    end Contact;

    class ReleaseNotes "Release Notes"
      extends Modelica_Icons.ReleaseNotes;
      annotation (Documentation(info="<html>

<h5>Version 3.2.2, 2014-09-13</h5>
<ul>
<li>Migration of library to MSL trunk</li>
<li>Update and improvement of documentation</li>
<li>Added new component:</li>
<ul>
    <li><a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Permeance\">Permenace</a></li>
</ul>
<li>Removed parameter text from icon layer for reluctance and permeance model</li>
<li>Fixed issues of ticket #1524</li>
<li>Restructured cage models with reluctance instead of inductance model according to ticket #1537</li>
<li>Bug fixes according to #1226</li>
<li>Added magnitude and argument of complex magnetic potentials, magnetic fluxes, voltages and currents in interface, electromagnetic coupling and machine models, see #1405</li>
<li>Added active, reactive and aparrent power and power factor in interface and machine models, see #1405</li>
<li>Added new interface model
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.PartialTwoPortExtended\">PartialTwoPortExtended</a>
to simplify consistent inclusion of variables, see #1405</li>
</ul>

<h5>Version 0.4.1, 2013-12-18</h5>
<ul>
<li>Renamed base magnetic port to MagneticPort</li>
<li>Bug fix of single to multi phase converter</li>
<li>Bug fix of phase number propagation in SaliencyCageWinding fixed</li>
<li>Improved documentation of library</li>
<li>Added current controlled SMR example and indicated SMR inverter example as obsolete</li>
<li>Improved example of mains supplied SMPM with damper cage</li>
</ul>

<h5>Version 0.4.0, 2013-11-13</h5>
<ul>
<li>Renamed all machine class names according to #1348<li>
</ul>

<h5>Version 0.3.0, 2013-11-07</h5>
<ul>
<li>Renamed the library from QuasiStationaryFundamantalWave to QuasiStaticFundamantalWave according to #1344<li>
</ul>

<h5>Version 0.2.5, 2013-11-06</h5>
<ul>
<li>Changed implementation of symmetrical components: symmetricTransformationMatrix(m) is now
    multiplied by numberOfSymmetricBaseSystems(m) in order to overcome differences in calculation
    of current and voltage symmetrical components. The symmetrical components of a system of
    even phase numbers are now equal to the symmetrical components of one corresponding base system.
<li>Imporoved examples package and removed SMPM_Inverter example<li>
</ul>

<h5>Version 0.2.4, 2013-10-02</h5>
<ul>
<li>Implemented induction machine with squirrel cage example with inverter</li>
<li>Alternative implementation of transformation matrix for faster compilation in Dymola</li>
</ul>

<h5>Version 0.2.3, 2013-09-25</h5>
<ul>
<li>Adapted sine / cosine of QS V/f-converter to match transient behavior</li>
</ul>

<h5>Version 0.2.2, 2013-09-24</h5>
<ul>
<li>Fixed initialization of examples (changed implementation of QuasiStationary.Sources, added start values for gamma, gammas, gammar)</li>
</ul>

<h5>Vrsion 0.2.1, 2013-09-23</h5>
<ul>
<li>Implemented pemanent magnet synchronous machine example with inverter</li>
</ul>

<h5>Version 0.2.0, 2013-09-01</h5>
<ul>
<li>Implemented induction machine with slip ring rotor including example</li>
<li>Implemented magnetic crossing </li>
</ul>

<h5>Version 0.1.0, 2013-08-27</h5>
<ul>
<li>Documentation of <a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.UsersGuide.Concept\">phasor concept</a></li>
<li>Connections.branch between electric and magnetic quasi static connectors to handle open circuit and motor operation of machines</li>
<li>Saliency effects are properly considered</li>
<li>Electromagnetic coupling with Analog domain is implemented fully quasi static with v = 0 at the electric connectors -- this may have to be changed in the future</li>
<li>Implemented machine types</li>
<li><ul>
<li>Induction machine with squirrel cage </li>
<li>Permanent magnet synchronous machine with optional damper cage </li>
<li>Electrical excited synchronous machine with optional damper cage (may be removed in first release) </li>
<li>Synchronous reluctance machine with optional damper cage (may be removed in first release) </li>
</ul></li>
</ul>
</html>"));
    end ReleaseNotes;

    class References "References"
      extends Modelica_Icons.References;
      annotation (Documentation(info="<html>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <td valign=\"top\">[Lang1984]</td>
      <td valign=\"top\">W. Lang,
        &quot;&Uuml;ber die Bemessung verlustarmer Asynchronmotoren mit K&auml;figl&auml;ufer f&uuml;r
        Pulsumrichterspeisung,&quot;
        Doctoral Thesis,
        Technical University of Vienna, 1984.</td>
    </tr>
</table>
</html>"));
    end References;
    annotation (Documentation(info="<html>
<p>
This is the library of quasi static fundamental wave models for multi phase electric machines. This is complementary library with the transient machine models of
<a href=\"modelica://\"></a>
</p>

</html>"));
  end UsersGuide;


  package Components "Basic fundamental wave components"
    extends Modelica_Icons.Package;
    model Ground "Magnetic ground"

      Interfaces.PositiveMagneticPort port_p "Complex magnetic port"
        annotation (Placement(transformation(extent={{-10,90},{10,110}},
              rotation=0)));
    equation
      Connections.potentialRoot(port_p.reference, 254);
      if Connections.isRoot(port_p.reference) then
        port_p.reference.gamma = 0;
      end if;
      port_p.V_m = Complex(0, 0);
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Line(points={{0,100},{0,50}}, color={255,
              170,85}),Line(points={{-60,50},{60,50}}, color={255,170,85}),Line(
              points={{-40,30},{40,30}}, color={255,170,85}),Line(points={{-20,
              10},{20,10}}, color={255,170,85})}),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,100},{0,50}}, color={255,
              128,0}),Line(points={{-60,50},{60,50}}, color={255,128,0}),Line(
              points={{-40,30},{40,30}}, color={255,128,0}),Line(points={{-20,
              10},{20,10}}, color={255,128,0}),Text(
                  extent={{-144,-19},{156,-59}},
                  textString="%name",
                  lineColor={0,0,255})}),
        Documentation(info="<html>

<p>
Grounding of the complex magnetic potential. Each magnetic circuit has to be grounded at least one point of the circuit.
</p>

</html>"));
    end Ground;

    model Reluctance "Salient reluctance"
      import Modelica_Constants.pi;
      extends Interfaces.PartialTwoPortElementary;
      parameter Modelica_Magnetic_FundamentalWave.Types.SalientReluctance R_m(d(
            start=1), q(start=1)) "Magnetic reluctance in d=re and q=im axis";
    equation
      (pi/2)*V_m.re = R_m.d*Phi.re;
      (pi/2)*V_m.im = R_m.q*Phi.im;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
                  extent={{-70,30},{70,-30}},
                  lineColor={255,170,85},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{-96,0},{-70,0}},
              color={255,170,85}),Line(points={{70,0},{96,0}}, color={255,170,
              85}),Text(
                  extent={{0,60},{0,100}},
                  lineColor={0,0,255},
                  textString="%name")}), Documentation(info="<html>
<p>
The salient reluctance models the relationship between the complex magnetic potential difference
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/V_m.png\"> and the complex magnetic flux <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Phi.png\">,
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/reluctance.png\">
</p>

<p>which can also be expressed in terms complex phasors:</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/reluctance_alt.png\">
</p>
</html>"));
    end Reluctance;

    model Permeance "Salient Permeance"
      import Modelica_Constants.pi;
      extends Interfaces.PartialTwoPortElementary;
      parameter Modelica_Magnetic_FundamentalWave.Types.SalientPermeance G_m(d(
            start=1), q(start=1)) "Magnetic permeance in d=re and q=im axis";
    equation
      (pi/2)*G_m.d*V_m.re = Phi.re;
      (pi/2)*G_m.q*V_m.im = Phi.im;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
                  extent={{0,60},{0,100}},
                  lineColor={0,0,255},
                  textString="%name"),Rectangle(
                  extent={{-70,30},{70,-30}},
                  lineColor={255,170,85},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{-96,0},{-70,0}},
              color={255,170,85}),Line(points={{70,0},{96,0}}, color={255,170,
              85})}), Documentation(info="<html>
<p>
The salient permeance models the relationship between the complex magnetic potential difference
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/V_m.png\" alt=\"V_m.png\"> and the complex magnetic flux <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Phi.png\">:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/permeance.png\"
      alt=\"reluctance.png\">
</blockquote>
<p></p>


</html>"));
    end Permeance;

    model EddyCurrent
      "Constant loss model under sinusoidal magnetic conditions"
      import Modelica_Constants.pi;
      constant Complex j=Complex(0, 1);
      extends Interfaces.PartialTwoPortElementary;
      parameter Modelica_SIunits.Conductance G(min=0)
        "Eqivalent symmetric loss conductance";
      extends
        Modelica_Thermal_HeatTransfer.Interfaces.PartialElementaryConditionalHeatPort(
          final T=273.15);
      Modelica_SIunits.AngularVelocity omega=der(port_p.reference.gamma)
        "Angular velocity";
    equation
      lossPower = (pi/2)*Modelica_ComplexMath.imag(omega*V_m*
        Modelica_ComplexMath.conj(Phi));
      // Alternative calculaton of loss power
      // lossPower = -(pi/2)*Modelica.ComplexMath.real(j*omega*V_m*Modelica.ComplexMath.conj(Phi));
      if G > 0 then
        (pi/2)*V_m = j*omega*G*Phi;
      else
        V_m = Complex(0, 0);
      end if;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                  extent={{-70,30},{70,-30}},
                  lineColor={255,170,85},
                  fillColor={255,170,85},
                  fillPattern=FillPattern.Solid),Line(points={{-96,0},{-70,0}},
              color={255,170,85}),Line(points={{70,0},{96,0}}, color={255,170,
              85}),Text(
                  extent={{0,60},{0,100}},
                  lineColor={0,0,255},
                  textString="%name"),Text(
                  extent={{0,-40},{0,-80}},
                  lineColor={0,0,0},
                  textString="G=%G")}),
        Documentation(info="<html>
<p>
The eddy current loss model with respect to fundamental wave effects is designed in accordance to
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.EddyCurrent\">FluxTubes.Basic.EddyCurrent</a> and
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.EddyCurrent\">FundamentalWave.Components.EddyCurrent</a>.
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/eddycurrent.png\">.
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\">Fig. 1: equivalent models of eddy current losses</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/eddycurrent_electric.png\">
    </td>
  </tr>
</table>

<p>Due to the nature of eddy current losses, which can be represented by symmetric
conductors in an equivalent electric circuit (Fig. 1), the respective
number of phases <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\"> has to be taken into account.
Assume that the <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\"> conductances
of the equivalent circuit are <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/Gc.png\">,
the conductance for the eddy current loss model is determined by</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/GGc.png\">
</p>

<p>
where <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/N.png\"> is the number of turns of the symmetric electro magnetic coupling.
</p>

<p>For such an <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\"> phase system
the relationship between the voltage and current <a href=\"http://www.haumer.at/refimg/SpacePhasors.pdf\">space phasors</a>
and the magnetic flux and magnetic potential difference phasor is
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/vPhi\">,<br>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/iV_m.png\">,
</p>

<p>
where <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/v_k\">
and <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/i_k\">
are the phase voltages and currents, respectively.
</p>

<p>
The dissipated loss power
</p>
<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/lossPower.png\">
</p>
<p>
can be determined for the <a href=\"http://www.haumer.at/refimg/SpacePhasors.pdf\">space phasor</a>
relationship of the voltage and current space phasor.
</p>
<h4>See also</h4>

<p><a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.EddyCurrent\">FluxTubes.Basic.EddyCurrent</a></p>

</html>"),
        Diagram(graphics));
    end EddyCurrent;

    model MultiPhaseElectroMagneticConverter
      "Multi phase electro magnetic converter"
      import Modelica_Constants.pi;
      constant Complex j=Complex(0, 1);
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
        plug_p(final m=m) "Positive plug" annotation (Placement(transformation(
            origin={-100,100},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
        plug_n(final m=m) "Negative plug" annotation (Placement(transformation(
            origin={-100,-100},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Interfaces.PositiveMagneticPort port_p "Positive complex magnetic port"
        annotation (Placement(transformation(extent={{90,90},{110,110}},
              rotation=0)));
      Interfaces.NegativeMagneticPort port_n "Negative complex magnetic port"
        annotation (Placement(transformation(extent={{90,-110},{110,-90}},
              rotation=0)));
      parameter Integer m=3 "Number of phases";
      parameter Real effectiveTurns "Effective number of turns";
      // IMPORTANT NOTE
      // This parameter may be removed in the final version of the library
      // for consistency reasons with resepect to the single phase
      // electromagnetic converter, where the orientation shall NOT be
      // implmented in the final version
      final parameter Modelica_SIunits.Angle orientation=0
        "Orientation of the first winding axis";
      // Local electric multi phase quantities
      Modelica_SIunits.ComplexVoltage v[m] "Complex voltage";
      Modelica_SIunits.Voltage abs_v[m] = Modelica_ComplexMath.'abs'(v)
        "Magnitude of complex voltage";
      Modelica_SIunits.Angle arg_v[m] = Modelica_ComplexMath.arg(v)
        "Argument of complex voltage";

      Modelica_SIunits.ComplexCurrent i[m] "Complex current";
      Modelica_SIunits.Current abs_i[m] = Modelica_ComplexMath.'abs'(i)
        "Magnitude of complex current";
      Modelica_SIunits.Angle arg_i[m] = Modelica_ComplexMath.arg(i)
        "Argument of complex current";

      Modelica_SIunits.ActivePower P[m] = {Modelica_ComplexMath.real(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
        "Active power";
      Modelica_SIunits.ActivePower P_total = sum(P) "Total active power";
      Modelica_SIunits.ReactivePower Q[m] = {Modelica_ComplexMath.imag(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
        "Reactive power";
      Modelica_SIunits.ReactivePower Q_total = sum(Q) "Total reactive power";
      Modelica_SIunits.ApparentPower S[m] = {Modelica_ComplexMath.'abs'(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
        "Magnitude of complex apparent power";
      Modelica_SIunits.ApparentPower S_total=sqrt(P_total^2+Q_total^2)
        "Magntiude of total complex apparent power";
      Real pf[m] = {cos(Modelica_ComplexMath.arg(Complex(P[k],Q[k]))) for k in 1:m}
        "Power factor";

      // Local electromagnetic fundamental wave quantities
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

      Modelica_SIunits.AngularVelocity omega=der(port_p.reference.gamma);
      // A technical solution with a rotator cannot be applied to the equations below
      final parameter Complex N=effectiveTurns*Modelica_ComplexMath.exp(Complex(
          0, orientation)) "Complex effective number of turns";
      Modelica_SIunits.ComplexVoltage vSymmetricalComponent[m]=
          Modelica_Electrical_MultiPhase.Functions.symmetricTransformationMatrix(
                                                                        m)*v
        "Symmetrical components of voltages";
      Modelica_SIunits.ComplexCurrent iSymmetricalComponent[m]=
          Modelica_Electrical_MultiPhase.Functions.symmetricTransformationMatrix(
                                                                        m)*i
        "Symmetrical components of currents";
    protected
      final parameter Integer indexNonPos[:]=
          Modelica_Electrical_MultiPhase.Functions.indexNonPositiveSequence(
                                                                   m)
        "Indices of all non positive seqeuence componentes";
      final parameter Integer indexPos[:]=
          Modelica_Electrical_MultiPhase.Functions.indexPositiveSequence(
                                                                m)
        "Indices of all positive seqeuence componentes";
    equation
      // Magnetic flux and flux balance of the magnetic ports
      port_p.Phi = Phi;
      port_p.Phi + port_n.Phi = Complex(0, 0);
      // Magnetic potential difference of the magnetic ports
      port_p.V_m - port_n.V_m = V_m;
      // Voltage drop between the electrical plugs
      v = plug_p.pin.v - plug_n.pin.v;
      // Current and current balance of the electric plugs
      i = plug_p.pin.i;
      plug_p.pin.i + plug_n.pin.i = {Complex(0, 0) for k in 1:m};
      V_m.re = sqrt(2)*(2.0/pi)*Modelica_ComplexMath.real(N*
        iSymmetricalComponent[1])*m/2;
      V_m.im = sqrt(2)*(2.0/pi)*Modelica_ComplexMath.imag(N*
        iSymmetricalComponent[1])*m/2;
      for k in 1:size(indexNonPos, 1) loop
        iSymmetricalComponent[indexNonPos[k]] = Complex(0, 0);
      end for;
      for k in 2:size(indexPos, 1) loop
        vSymmetricalComponent[indexPos[1]] = vSymmetricalComponent[indexPos[k]];
      end for;
      // Induced voltages from complex magnetic flux, number of turns
      // and angles of orientation of winding
      -sqrt(2)*Complex(Modelica_ComplexMath.real(vSymmetricalComponent[indexPos[
        1]]), Modelica_ComplexMath.imag(vSymmetricalComponent[indexPos[1]])) =
        Modelica_ComplexMath.conj(N)*j*omega*Phi;
      // Potential roots are not used; instead the reference angle is handled
      // by means of Connections.branch beteen eletric plug_p and magnetic port_p
      // It has to be checked whether this Modelica compliant
      //   Connections.potentialRoot(plug_p.reference);
      //   Connections.potentialRoot(port_p.reference);
      Connections.branch(port_p.reference, port_n.reference);
      port_p.reference.gamma = port_n.reference.gamma;
      Connections.branch(plug_p.reference, plug_n.reference);
      plug_p.reference.gamma = plug_n.reference.gamma;
      Connections.branch(plug_p.reference, port_p.reference);
      plug_p.reference.gamma = port_p.reference.gamma;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Ellipse(
                  extent={{-60,60},{58,0}},
                  lineColor={85,170,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Ellipse(
                  extent={{-58,0},{60,-60}},
                  lineColor={85,170,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Rectangle(
                  extent={{-60,60},{0,-60}},
                  lineColor={0,0,255},
                  pattern=LinePattern.None,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,-100},{94,-100},
              {84,-98},{76,-94},{64,-86},{50,-72},{42,-58},{36,-40},{30,-18},{
              30,0},{30,18},{34,36},{46,66},{62,84},{78,96},{90,100},{100,100}},
              color={255,170,85}),Line(points={{0,60},{-100,60},{-100,100}},
              color={85,170,255}),Line(points={{0,-60},{-100,-60},{-100,-98}},
              color={85,170,255}),Text(
                  extent={{0,160},{0,120}},
                  lineColor={0,0,255},
                  fillColor={255,128,0},
                  fillPattern=FillPattern.Solid,
                  textString="%name")}), Documentation(info="<html>

<p>
Each phase <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/k.png\"> of an <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\"> phase winding has an effective number of turns, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/effectiveTurns_k.png\"> and an respective winging angle <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/orientation_k.png\"> and a phase current <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/i_k.png\">.
</p>

<p>
The total complex magnetic potential difference of the mutli phase winding is determined by:
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/Components/multiphaseconverter_vm.png\">
</p>

<p>
In this equation
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/i_sc1.png\">
is the positive symmetrical component of the currents.
</p>

<p>
The positive sequence of the voltages
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/v_sc1.png\">
induced in each winding is directly proportional to the complex magnetic flux and the number of turns. This relationship can be modeled by means of</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/Components/multiphaseconverter_phi.png\">.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.SinglePhaseElectroMagneticConverter\">
Modelica.Magnetic.FundamentalWave.Components.SinglePhaseElectroMagneticConverter</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">
Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.QuasiStaticAnalogElectroMagneticConverter\">
QuasiStaticAnalogElectroMagneticConverter</a>
</p>
</html>"));
    end MultiPhaseElectroMagneticConverter;

    model QuasiStaticAnalogElectroMagneticConverter
      "Electro magnetic converter to only (!) quasi static analog, neglecting induced voltage"
      // Note: It has not whether the transient voltage induction and the
      //   leakage induction shall be considered in this model or not.
      //   This model is required for electrical excited synchronous machines (SMEE)
      import Modelica_Constants.pi;
      Modelica_Electrical_Analog.Interfaces.PositivePin pin_p "Positive pin"
        annotation (Placement(transformation(
            origin={-100,100},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica_Electrical_Analog.Interfaces.NegativePin pin_n "Negative pin"
        annotation (Placement(transformation(
            origin={-100,-100},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Interfaces.PositiveMagneticPort port_p "Positive complex magnetic port"
        annotation (Placement(transformation(extent={{90,90},{110,110}},
              rotation=0)));
      Interfaces.NegativeMagneticPort port_n "Negative complex magnetic port"
        annotation (Placement(transformation(extent={{90,-110},{110,-90}},
              rotation=0)));
      parameter Real effectiveTurns "Effective number of turns"
        annotation (Evaluate=true);
      // Local electric single phase quantities
      Modelica_SIunits.Voltage v "Voltage drop";
      Modelica_SIunits.Current i "Current";

      // Local electromagnetic fundamental wave quantities
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

      Modelica_SIunits.Angle gamma "Angle of V_m fixed reference frame";
      Modelica_SIunits.AngularVelocity omega=der(port_p.reference.gamma);
    equation
      // Magnetic flux and flux balance of the magnetic ports
      port_p.Phi = Phi;
      port_p.Phi + port_n.Phi = Complex(0, 0);
      // Magnetic potential difference of the magnetic ports
      port_p.V_m - port_n.V_m = V_m;
      // Voltage drop between the electrical pins
      v = pin_p.v - pin_n.v;
      // Current and current balance of the electric pins
      i = pin_p.i;
      pin_p.i + pin_n.i = 0;
      // Complex magnetic potential difference is determined from currents, number
      // of turns and angles of orientation of the magnetic potential difference
      V_m = (2/pi)*effectiveTurns*i*Modelica_ComplexMath.fromPolar(1, -gamma);
      // Induced voltages is zero due to quasi static electric analog circuit
      v = 0;
      Connections.branch(port_p.reference, port_n.reference);
      port_p.reference.gamma = port_n.reference.gamma;
      // Reference angle to magnetic potential fixed frame
      gamma = port_p.reference.gamma;
      annotation (
        defaultComponentName="converter",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(
                  extent={{-60,60},{58,0}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Ellipse(
                  extent={{-58,0},{60,-60}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Rectangle(
                  extent={{-60,60},{0,-60}},
                  lineColor={0,0,255},
                  pattern=LinePattern.None,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,-100},{94,-100},
              {84,-98},{76,-94},{64,-86},{50,-72},{42,-58},{36,-40},{30,-18},{
              30,0},{30,18},{34,36},{46,66},{62,84},{78,96},{90,100},{100,100}},
              color={255,128,0}),Line(points={{0,60},{-100,60},{-100,100}},
              color={0,0,255}),Line(points={{0,-60},{-100,-60},{-100,-98}},
              color={0,0,255}),Text(
                  extent={{0,160},{0,120}},
                  lineColor={0,0,255},
                  fillColor={255,128,0},
                  fillPattern=FillPattern.Solid,
                  textString="%name")}),
        Documentation(info="<html>
<p>
The analog single phase winding has an effective number of turns, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/effectiveTurns.png\"> and a respective orientation of the winding, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/orientation.png\">. The current in the winding is <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/i.png\">.
</p>

<p>
The total complex magnetic potential difference of the single phase winding is determined by:
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/Components/singlephaseconverter_vm.png\">
</p>

<p>
where
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma.png\">
is the reference angle of the electrical and magnetic system, respectively. The induced voltage <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/v.png\"> is identical to zero.

<h4>See also</h4>
<p>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.SinglePhaseElectroMagneticConverter\">
Modelica.Magnetic.FundamentalWave.Components.SinglePhaseElectroMagneticConverter</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">
Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">
MultiPhaseElectroMagneticConverter</a>
</p>


</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end QuasiStaticAnalogElectroMagneticConverter;

    model Idle "Idle running branch"
      extends Interfaces.PartialTwoPortElementary;
    equation
      Phi = Complex(0, 0);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Text(
                  extent={{0,60},{0,100}},
                  lineColor={0,0,255},
                  textString="%name"),Rectangle(
                  extent={{-100,40},{100,-40}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{-100,0},{-40,0}},
              color={255,170,85}),Line(points={{40,0},{100,0}}, color={255,170,
              85})}),
        Documentation(info="<html>
<p>
This is a simple idle running branch.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.Short\">Short</a>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.Crossing\">Crossing</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Idle\">Magnetic.FundamentalWave.Components.Idle</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Short\">Magnetic.FundamentalWave.Components.Short</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Crossing\">Magnetic.FundamentalWave.Components.Crossing</a>
</p>

</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Line(points={{-100,0},{-60,0}}, color={
              255,128,0}),Line(points={{60,0},{100,0}}, color={255,128,0}),Line(
              points={{-60,0},{-40,2},{-18,6},{0,14},{12,26}}, color={255,128,0}),
              Line(points={{60,0},{40,-2},{18,-6},{0,-14},{-12,-26}}, color={
              255,128,0})}));
    end Idle;

    model Short "Short connection"
      extends Interfaces.PartialTwoPort;
    equation
      connect(port_p, port_n) annotation (Line(points={{-100,0},{-1,0},{-1,0},{
              100,0}}, color={255,128,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
                  extent={{0,60},{0,100}},
                  lineColor={0,0,255},
                  textString="%name"),Rectangle(
                  extent={{-100,40},{100,-40}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{-100,0},{100,0}},
              color={255,170,85})}), Documentation(info="<html>
<p>
This is a simple short cut branch.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.Idle\">Idle</a>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.Crossing\">Crossing</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Idle\">Magnetic.FundamentalWave.Components.Idle</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Short\">Magnetic.FundamentalWave.Components.Short</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Crossing\">Magnetic.FundamentalWave.Components.Crossing</a>
</p>

</html>"));
    end Short;

    model Crossing "Crossing of connections"

      Interfaces.PositiveMagneticPort port_p1
        annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
      Interfaces.NegativeMagneticPort port_n1
        annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
      Interfaces.PositiveMagneticPort port_p2
        annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
      Interfaces.NegativeMagneticPort port_n2
        annotation (Placement(transformation(extent={{90,90},{110,110}})));
    equation
      connect(port_p1, port_p2) annotation (Line(
          points={{-100,100},{-100,20},{0,20},{0,-20},{100,-20},{100,-100}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(port_n2, port_n1) annotation (Line(
          points={{100,100},{100,0},{-100,0},{-100,-100}},
          color={255,170,85},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Text(
                  extent={{0,60},{0,100}},
                  lineColor={0,0,255},
                  textString="%name"),Rectangle(
                  extent={{-100,40},{100,-40}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(
                  points={{-100,100},{-100,40},{100,-40},{100,-100}},
                  color={255,170,85},
                  smooth=Smooth.None),Line(
                  points={{100,100},{100,40},{-100,-40},{-100,-100}},
                  color={255,170,85},
                  smooth=Smooth.None)}),
        Documentation(info="<html>
<p>
This is a simple short cut branch.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.Idle\">Idle</a>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.Short\">Short</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Idle\">Magnetic.FundamentalWave.Components.Idle</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Short\">Magnetic.FundamentalWave.Components.Short</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Crossing\">Magnetic.FundamentalWave.Components.Crossing</a>
</p>

</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end Crossing;
    annotation (Documentation(info="<html>
<p>Basic components of the FundamentalWave library for modeling magnetic circuits. Machine specific components are
located at <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components\">Machines.Components</a>.</p>
</html>"));
  end Components;

  package BasicMachines "Basic quasi static machine models"
    extends Modelica_Icons.Package;
    package InductionMachines "Quasi static induction machines"
      extends Modelica_Icons.Package;
      model IM_SquirrelCage "Induction machine with squirrel cage"
        // Removed form extension of FUNDAMENTAL WAVE model: is(start=zeros(m)) ##
        extends Interfaces.PartialBasicMachine(
          Rs(start=0.03),
          Lssigma(start=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)),
          final L0(d=2.0*Lm/m/effectiveStatorTurns^2, q=2.0*Lm/m/
                effectiveStatorTurns^2),
          redeclare final
            Modelica_Electrical_Machines.Thermal.AsynchronousInductionMachines.ThermalAmbientAIMC
            thermalAmbient(final Tr=TrOperational),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortAIMC
            thermalPort,
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortAIMC
            internalThermalPort,
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.PowerBalanceAIMC
            powerBalance(final lossPowerRotorWinding=sum(rotorCage.resistor.resistor.LossPower),
              final lossPowerRotorCore=0));
        parameter Modelica_SIunits.Inductance Lm(start=3*sqrt(1 - 0.0667)/(2*pi
              *fsNominal)) "Stator main field inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrsigma(start=3*(1 - sqrt(1 -
              0.0667))/(2*pi*fsNominal))
          "Rotor leakage inductance of equivalent m phase winding w.r.t. stator side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Resistance Rr(start=0.04)
          "Rotor resistance of equivalent m phase winding w.r.t. stator side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of rotor resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20r(start=0)
          "Temperature coefficient of rotor resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of rotor resistance" annotation (Dialog(
              group="Operational temperatures", enable=not useThermalPort));
        output Modelica_SIunits.ComplexCurrent ir[m]=rotorCage.i
          "Rotor current";
        Modelica_SIunits.Current abs_ir[m] = Modelica_ComplexMath.'abs'(ir)
          "Magnitude of complex rotor current";
        Modelica_SIunits.Angle arg_ir[m] = Modelica_ComplexMath.arg(ir)
          "Argument of complex rotor current";

        Components.SymmetricMultiPhaseCageWinding rotorCage(
          final Lsigma=Lrsigma,
          final effectiveTurns=effectiveStatorTurns,
          final useHeatPort=true,
          final RRef=Rr,
          final TRef=TrRef,
          final TOperational=TrRef,
          final m=m,
          final alpha20=alpha20r)
          "Symmetric rotor cage winding including resistances and stray inductances"
          annotation (Placement(transformation(extent={{-10,-40},{10,-20}},
                rotation=0)));
      equation
        connect(rotorCage.heatPortWinding, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{0,-40},{-40,-40},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(airGap.port_rn, rotorCage.port_p) annotation (Line(
            points={{-10,-10},{-10,-30}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(airGap.port_rp, rotorCage.port_n) annotation (Line(
            points={{10,-10},{10,-30}},
            color={255,128,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="imc",
          Documentation(info="<html>
<p>
Resistances and stray inductances of the machine refer to an <code>m</code> phase stator. The symmetry of the stator, rotor and suppy are assumed. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>heat losses in the temperature dependent cage resistances</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<h4>See also</h4>
<p>
<a href=\"Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.InductionMachines.IM_SlipRing\">
IM_SlipRing</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing\">
Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage\">
Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end IM_SquirrelCage;

      model IM_SlipRing "Induction machine with slip ring rotor"
        parameter Integer mr(min=3) = m "Number of rotor phases";
        extends Interfaces.PartialBasicMachine(
          Rs(start=0.03),
          Lssigma(start=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)),
          final L0(d=2.0*Lm/m/effectiveStatorTurns^2, q=2.0*Lm/m/
                effectiveStatorTurns^2),
          redeclare final
            Modelica_Electrical_Machines.Thermal.AsynchronousInductionMachines.ThermalAmbientAIMS
            thermalAmbient(final Tr=TrOperational, final mr=mr),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortAIMS
            thermalPort(final mr=mr),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortAIMS
            internalThermalPort(final mr=mr),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.PowerBalanceAIMS
            powerBalance(
            final lossPowerRotorWinding=sum(rotor.resistor.resistor.LossPower),

            final lossPowerRotorCore=rotor.core.lossPower,
            final lossPowerBrush=0,
            final powerRotor=
                Modelica_Electrical_QuasiStationary.MultiPhase.Functions.activePower(
                vr, ir)));

        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
          plug_rn(final m=mr) "Negative plug of rotor" annotation (Placement(
              transformation(extent={{-110,-50},{-90,-70}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
          plug_rp(final m=mr) "Positive plug of rotor" annotation (Placement(
              transformation(extent={{-110,70},{-90,50}}, rotation=0)));
        parameter Modelica_SIunits.Inductance Lm(start=3*sqrt(1 - 0.0667)/(2*pi
              *fsNominal)) "Stator main field inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrsigma(start=3*(1 - sqrt(1 -
              0.0667))/(2*pi*fsNominal))
          "Rotor leakage inductance w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Resistance Rr(start=0.04)
          "Rotor resistance per phase w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of rotor resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20r(start=0)
          "Temperature coefficient of rotor resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of rotor resistance" annotation (Dialog(
              group="Operational temperatures", enable=not useThermalPort));
        parameter Boolean useTurnsRatio(start=true)
          "Use TurnsRatio or calculate from locked-rotor voltage?";
        parameter Real TurnsRatio(final min=Modelica_Constants.small, start=1)
          "Effective number of stator turns / effective number of rotor turns"
          annotation (Dialog(enable=useTurnsRatio));
        parameter Modelica_SIunits.Voltage VsNominal(start=100)
          "Nominal stator voltage per phase"
          annotation (Dialog(enable=not useTurnsRatio));
        parameter Modelica_SIunits.Voltage VrLockedRotor(start=100*(2*pi*
              fsNominal*Lm)/sqrt(Rs^2 + (2*pi*fsNominal*(Lm + Lssigma))^2))
          "Locked rotor voltage per phase"
          annotation (Dialog(enable=not useTurnsRatio));
        parameter Modelica_Electrical_Machines.Losses.CoreParameters
          rotorCoreParameters(
          final m=3,
          PRef=0,
          VRef(start=1) = 1,
          wRef(start=1) = 1)
          "Rotor core losses, all quantities refer to rotor side"
          annotation (Dialog(tab="Losses"));
        output Modelica_SIunits.ComplexVoltage vr[mr]=plug_rp.pin.v - plug_rn.pin.v
          "Complex rotor voltage";
        Modelica_SIunits.Voltage abs_vr[mr] = Modelica_ComplexMath.'abs'(vr)
          "Magnitude of complex rotor voltage";
        Modelica_SIunits.Angle arg_vr[mr] = Modelica_ComplexMath.arg(vr)
          "Argument of complex rotor voltage";

        output Modelica_SIunits.ComplexCurrent ir[mr]=plug_rp.pin.i
          "Complex rotor current";
        Modelica_SIunits.Current abs_ir[mr] = Modelica_ComplexMath.'abs'(ir)
          "Magnitude of complex rotor current";
        Modelica_SIunits.Angle arg_ir[mr] = Modelica_ComplexMath.arg(ir)
          "Argument of complex rotor current";

        Modelica_SIunits.ActivePower Pr[mr] = {Modelica_ComplexMath.real(vr[k]*Modelica_ComplexMath.conj(ir[k])) for k in 1:mr}
          "Active rotor power";
        Modelica_SIunits.ActivePower Pr_total = sum(Pr)
          "Total active rotor power";
        Modelica_SIunits.ReactivePower Qr[mr] = {Modelica_ComplexMath.imag(vr[k]*Modelica_ComplexMath.conj(ir[k])) for k in 1:mr}
          "Reactive rotor power";
        Modelica_SIunits.ReactivePower Qr_total = sum(Qr)
          "Total reactive rotor power";
        Modelica_SIunits.ApparentPower Sr[mr] = {Modelica_ComplexMath.'abs'(vr[k]*Modelica_ComplexMath.conj(ir[k])) for k in 1:mr}
          "Magnitude of complex rotor apparent power";
        Modelica_SIunits.ApparentPower Sr_total=sqrt(Pr_total^2+Qr_total^2)
          "Magntiude of total complex rotor apparent power";
        Real pfr[m] = {cos(Modelica_ComplexMath.arg(Complex(Pr[k],Qr[k]))) for k in 1:m}
          "Rotor power factor";

      protected
        final parameter Real internalTurnsRatio=if useTurnsRatio then
            TurnsRatio else VsNominal/VrLockedRotor*(2*pi*fsNominal*Lm)/sqrt(Rs
            ^2 + (2*pi*fsNominal*(Lm + Lssigma))^2);
      public
        Components.SymmetricMultiPhaseWinding rotor(
          final Lsigma=Lrsigma,
          final effectiveTurns=effectiveStatorTurns/internalTurnsRatio,
          final useHeatPort=true,
          final RRef=Rr,
          final TRef=TrRef,
          final TOperational=TrOperational,
          final GcRef=rotorCoreParameters.GcRef,
          final m=mr,
          final alpha20=alpha20r)
          "Symmetric rotor winding including resistances, zero and stray inductances and zero core losses"
          annotation (Placement(transformation(
              origin={0,-40},
              extent={{-10,-10},{10,10}},
              rotation=90)));
      equation
        connect(rotor.plug_n, plug_rn) annotation (Line(points={{10,-50},{10,-60},
                {-100,-60}}, color={85,170,255}));
        connect(rotor.heatPortCore, internalThermalPort.heatPortRotorCore)
          annotation (Line(
            points={{10,-36},{20,-36},{20,-80},{-40,-80},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(rotor.heatPortWinding, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{10,-44},{20,-44},{20,-80},{-40,-80},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(plug_rp, rotor.plug_p) annotation (Line(
            points={{-100,60},{-80,60},{-80,-50},{-10,-50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(airGap.port_rn, rotor.port_p) annotation (Line(
            points={{-10,-10},{-10,-30}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(airGap.port_rp, rotor.port_n) annotation (Line(
            points={{10,-10},{10,-30}},
            color={255,128,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="ims",
          Icon(graphics={Line(points={{-100,50},{-100,20},{-60,20}}, color={85,
                170,255}),Line(points={{-100,-50},{-100,-20},{-60,-20}}, color=
                {85,170,255})}),
          Documentation(info="<html>
<p>
Resistances and stray inductances of the machine always refer to either stator or rotor. The symmetry of the stator, rotor and suppy are assumed. The number of stator and rotor phases may be different. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>heat losses in the temperature dependent rotor winding resistances</li>
<li>friction losses</li>
<li>stator and rotor core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<h4>See also</h4>
<p>
<a href=\"Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.InductionMachines.IM_SquirrelCage\">
IM_SquirrelCage</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing\">
Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage\">
Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end IM_SlipRing;
    end InductionMachines;

    package SynchronousMachines "Quasi static synchronous machines"
      extends Modelica_Icons.Package;
      model SM_PermanentMagnet
        "Permanent magnet synchronous machine with optional damper cage"
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Interfaces.PartialBasicMachine(
          Rs(start=0.03),
          Lssigma(start=0.1/(2*pi*fsNominal)),
          final L0(d=2.0*Lmd/m/effectiveStatorTurns^2, q=2.0*Lmq/m/
                effectiveStatorTurns^2),
          redeclare final
            Modelica_Electrical_Machines.Thermal.SynchronousInductionMachines.ThermalAmbientSMPM
            thermalAmbient(
            final useDamperCage=useDamperCage,
            final Tr=TrOperational,
            final Tpm=TpmOperational),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortSMPM
            thermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortSMPM
            internalThermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.PowerBalanceSMPM
            powerBalance(
            final lossPowerRotorWinding=damperCageLossPower,
            final lossPowerRotorCore=0,
            final lossPowerPermanentMagnet=permanentMagnet.lossPower));
        parameter Modelica_SIunits.Inductance Lmd(start=0.3/(2*pi*fsNominal))
          "Stator main field inductance, d-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lmq(start=0.3/(2*pi*fsNominal))
          "Stator main field inductance, q-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        // Rotor cage parameters
        parameter Boolean useDamperCage(start=true)
          "Enable/disable damper cage" annotation (Dialog(tab=
                "Nominal resistances and inductances", group="Damper cage"));
        parameter Modelica_SIunits.Inductance Lrsigmad(start=0.05/(2*pi*
              fsNominal))
          "Rotor leakage inductance, d-axis, w.r.t. stator side" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="Damper cage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
          "Rotor leakage inductance, q-axis, w.r.t. stator side" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="Damper cage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrd(start=0.04)
          "Rotor resistance, d-axis, w.r.t. stator side" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="Damper cage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrq=Rrd
          "Rotor resistance , q-axis, w.r.t. stator side" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="Damper cage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="Damper cage",
            enable=useDamperCage));
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20r(start=0)
          "Temperature coefficient of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="Damper cage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Voltage VsOpenCircuit(start=112.3)
          "Open circuit RMS voltage per phase @ fsNominal";
        final parameter Modelica_SIunits.Temperature TpmOperational=293.15
          "Operational temperature of permanent magnet"
          annotation (Dialog(group="Operational temperatures"));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of (optional) damper cage" annotation (
            Dialog(group="Operational temperatures", enable=not useThermalPort
                 and useDamperCage));
        parameter
          Modelica_Electrical_Machines.Losses.PermanentMagnetLossParameters
          permanentMagnetLossParameters(IRef(start=100), wRef(start=2*pi*
                fsNominal/p)) "Permanent magnet loss losses"
          annotation (Dialog(tab="Losses"));
         Modelica_ComplexBlocks.Interfaces.ComplexOutput ir[2] if useDamperCage
          "Damper cage currents";
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Short short if not
          useDamperCage
          "Magnetic connection in case the damper cage is not present"
          annotation (Placement(transformation(
              origin={10,-40},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Components.SaliencyCageWinding rotorCage(
          final RRef(d=Rrd, q=Rrq),
          final Lsigma(d=Lrsigmad, q=Lrsigmaq),
          final useHeatPort=true,
          final TRef=TrRef,
          final TOperational=TrOperational,
          final alpha20=alpha20r,
          final effectiveTurns=sqrt(m/2.0)*effectiveStatorTurns) if
          useDamperCage
          "Symmetric rotor cage winding including resistances and stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-40})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.Components.PermanentMagnet
          permanentMagnet(
          final V_m=Complex(V_mPM, 0),
          final m=m,
          final permanentMagnetLossParameters=permanentMagnetLossParameters,
          final useHeatPort=true,
          final is=is) "Magnetic potential difference of permanent magnet"
          annotation (Placement(transformation(
              origin={-10,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      protected
        final parameter Modelica_SIunits.MagneticPotentialDifference V_mPM=(2/
            pi)*sqrt(2)*(m/2)*VsOpenCircuit/effectiveStatorTurns/(Lmd/
            effectiveStatorTurns^2*2*pi*fsNominal)
          "Equivalent excitation magnetic potential difference";
        Modelica_Blocks.Interfaces.RealOutput damperCageLossPower(final
            quantity="Power", final unit="W") "Damper losses";
      equation
        connect(ir,rotorCage.i);
        connect(damperCageLossPower, rotorCage.lossPower);
        if not useDamperCage then
          damperCageLossPower = 0;
        end if;
        connect(permanentMagnet.port_p, airGap.port_rn) annotation (Line(
            points={{-10,-30},{-10,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(permanentMagnet.support, airGap.support) annotation (Line(
            points={{-20,-40},{-50,-40},{-50,0},{-10,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(permanentMagnet.heatPort, internalThermalPort.heatPortPermanentMagnet)
          annotation (Line(
            points={{-20,-30},{-40,-30},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(permanentMagnet.flange, inertiaRotor.flange_b) annotation (Line(
            points={{0,-40},{0,-20},{90,-20},{90,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(airGap.port_rp, rotorCage.port_n) annotation (Line(
            points={{10,-10},{10,-30},{20,-30}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(short.port_n, airGap.port_rp) annotation (Line(
            points={{10,-30},{10,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(short.port_p, permanentMagnet.port_n) annotation (Line(
            points={{10,-50},{-10,-50}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(rotorCage.port_p, permanentMagnet.port_n) annotation (Line(
            points={{20,-50},{-10,-50}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(rotorCage.heatPortWinding, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{30,-40},{40,-40},{40,-80},{-40,-80},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="smpm",
          Icon(graphics={
              Rectangle(
                extent={{-130,10},{-100,-10}},
                lineColor={0,0,0},
                fillColor={0,255,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-100,10},{-70,-10}},
                lineColor={0,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(extent={{-134,34},{-66,-34}}, lineColor={85,170,255})}),
          Documentation(info="<html>
<p>
Resistances and stray inductances of the machine refer to an <code>m</code> phase stator. The symmetry of the stator and the supply are assumed. For rotor asymmetries can be taken into account by different resistances and stray inductances in the d- and q-axis. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>optional, when enabled: heat losses in the temperature dependent damper cage resistances</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
<li>permanent magnet losses</li>
</ul>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ElectricalExcited\">
SM_ElectricalExcited</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ReluctanceRotor\">
SM_ReluctanceRotor</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">
Magnetic.FundamentalWave.BasicMachines.SM_PermanentMagnet</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">
Magnetic.FundamentalWave.BasicMachines.SM_ElectricalExcited</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor\">
Magnetic.FundamentalWave.BasicMachines.SM_ReluctanceRotor</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        "Electrical excited synchronous machine with optional damper cage"
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Interfaces.PartialBasicMachine(
          Rs(start=0.03),
          Lssigma(start=0.1/(2*pi*fsNominal)),
          final L0(d=2.0*Lmd/m/effectiveStatorTurns^2, q=2.0*Lmq/m/
                effectiveStatorTurns^2),
          redeclare final
            Modelica_Electrical_Machines.Thermal.SynchronousInductionMachines.ThermalAmbientSMEE
            thermalAmbient(
            final useDamperCage=useDamperCage,
            final Te=TeOperational,
            final Tr=TrOperational),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortSMEE
            thermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortSMEE
            internalThermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.PowerBalanceSMEE
            powerBalance(
            final lossPowerRotorWinding=damperCageLossPower,
            final powerExcitation=0,
            final lossPowerExcitation=excitation.resistor.LossPower,
            final lossPowerBrush=brush.lossPower,
            final lossPowerRotorCore=0));
        parameter Modelica_SIunits.Inductance Lmd(start=1.5/(2*pi*fsNominal))
          "Stator main field inductance, d-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lmq(start=1.5/(2*pi*fsNominal))
          "Stator main field inductance, q-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        // Rotor cage parameters
        parameter Boolean useDamperCage(start=true)
          "Enable/disable damper cage" annotation (Dialog(tab=
                "Nominal resistances and inductances", group="DamperCage"));
        parameter Modelica_SIunits.Inductance Lrsigmad(start=0.05/(2*pi*
              fsNominal))
          "Rotor leakage inductance, d-axis, w.r.t. stator side" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
          "Rotor leakage inductance, q-axis, w.r.t. stator side" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrd(start=0.04)
          "Rotor resistance, d-axis, w.r.t. stator side" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrq=Rrd
          "Rotor resistance , q-axis, w.r.t. stator side" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20r(start=0)
          "Temperature coefficient of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        // Operational temperature
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of (optional) damper cage" annotation (
            Dialog(group="Operational temperatures", enable=not useThermalPort
                 and useDamperCage));
        parameter Modelica_SIunits.Temperature TeOperational(start=293.15)
          "Operational excitation temperature" annotation (Dialog(group=
                "Operational temperatures", enable=not useThermalPort));
        // Excitation parameters
        parameter Modelica_SIunits.Voltage VsNominal(start=100)
          "Nominal stator voltage" annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Current IeOpenCircuit(start=10)
          "Open circuit excitation current @ nominal voltage and frequency"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Resistance Re(start=2.5)
          "Warm excitation resistance" annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeRef(start=293.15)
          "Reference temperture of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20e(start=0) "Temperature coefficient of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_Electrical_Machines.Losses.BrushParameters
          brushParameters "Brush losses" annotation (Dialog(tab="Losses"));
        output Modelica_SIunits.Voltage ve=pin_ep.v - pin_en.v
          "Excitation voltage";
        output Modelica_SIunits.Current ie=pin_ep.i "Excitation current";
        Modelica_ComplexBlocks.Interfaces.ComplexOutput ir[2] if useDamperCage
          "Damper cage currents";
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Short short if not
          useDamperCage
          "Magnetic connection in case the damper cage is not present"
          annotation (Placement(transformation(
              origin={10,-40},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.Components.SaliencyCageWinding
          rotorCage(
          final Lsigma(d=Lrsigmad, q=Lrsigmaq),
          final useHeatPort=true,
          final TRef=TrRef,
          final TOperational=TrOperational,
          final RRef(d=Rrd, q=Rrq),
          final alpha20=alpha20r,
          final effectiveTurns=sqrt(m/2.0)*effectiveStatorTurns) if
          useDamperCage
          "Symmetric rotor cage winding including resistances and stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-40})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.Components.QuasiStionaryAnalogWinding
          excitation(
          final RRef=Re,
          final TRef=TeRef,
          final effectiveTurns=effectiveStatorTurns*turnsRatio*m/2,
          final useHeatPort=true,
          final TOperational=TeOperational,
          final alpha20=alpha20e)
          "Excitation winding including resistance and stray inductance"
          annotation (Placement(transformation(extent={{-30,-50},{-10,-30}},
                rotation=0)));
      protected
        final parameter Real turnsRatio=sqrt(2)*VsNominal/(2*pi*fsNominal*Lmd*
            IeOpenCircuit) "Stator current / excitation current";
        Modelica_Blocks.Interfaces.RealOutput damperCageLossPower(final
            quantity="Power", final unit="W") "Damper losses";
      public
        Modelica_Electrical_Machines.Losses.DCMachines.Brush brush(final
            brushParameters=brushParameters, final useHeatPort=true)
          annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-80,40})));
        Modelica_Electrical_Analog.Interfaces.PositivePin pin_ep
          "Positive pin of excitation" annotation (Placement(transformation(
                extent={{-110,70},{-90,50}}, rotation=0)));
        Modelica_Electrical_Analog.Interfaces.NegativePin pin_en
          "Negative pin of excitation" annotation (Placement(transformation(
                extent={{-90,-50},{-110,-70}}, rotation=0)));
      equation
        connect(ir,rotorCage.i);
        connect(damperCageLossPower, rotorCage.lossPower);
        if not useDamperCage then
          damperCageLossPower = 0;
        end if;
        connect(airGap.port_rn, excitation.port_p) annotation (Line(
            points={{-10,-10},{-10,-30}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(excitation.heatPortWinding, internalThermalPort.heatPortExcitation)
          annotation (Line(
            points={{-20,-50},{-20,-80},{-40,-80},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(airGap.port_rp, rotorCage.port_n) annotation (Line(
            points={{10,-10},{10,-30},{20,-30}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(short.port_n, airGap.port_rp) annotation (Line(
            points={{10,-30},{10,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(rotorCage.port_p, excitation.port_n) annotation (Line(
            points={{20,-50},{-10,-50}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(short.port_p, excitation.port_n) annotation (Line(
            points={{10,-50},{-10,-50}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(rotorCage.heatPortWinding, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{30,-40},{40,-40},{40,-80},{-40,-80},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(pin_ep, brush.p) annotation (Line(
            points={{-100,60},{-80,60},{-80,50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(brush.heatPort, internalThermalPort.heatPortBrush) annotation (
            Line(
            points={{-70,50},{-40,50},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(excitation.pin_n, pin_en) annotation (Line(
            points={{-30,-50},{-80,-50},{-80,-60},{-100,-60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(excitation.pin_p, brush.n) annotation (Line(
            points={{-30,-30},{-80,-30},{-80,30}},
            color={0,0,255},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="smee",
          Icon(graphics={Ellipse(extent={{-134,34},{-66,-34}}, lineColor={85,
                170,255}),Line(points={{-100,50},{-100,20},{-130,20},{-130,-4}},
                color={0,0,255}),Line(points={{-130,-4},{-129,1},{-125,5},{-120,
                6},{-115,5},{-111,1},{-110,-4}}, color={0,0,255}),Line(points={
                {-110,-4},{-109,1},{-105,5},{-100,6},{-95,5},{-91,1},{-90,-4}},
                color={0,0,255}),Line(points={{-90,-4},{-89,1},{-85,5},{-80,6},
                {-75,5},{-71,1},{-70,-4}}, color={0,0,255}),Line(points={{-100,
                -50},{-100,-20},{-70,-20},{-70,-2}}, color={0,0,255})}),
          Documentation(info="<html>
<p>
Resistances and stray inductances of the machine refer to an <code>m</code> phase stator. The symmetry of the stator and the suppyl are assumed. For rotor asymmetries can be taken into account by different resistances and stray inductances in the d- and q-axis. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>heat losses in the temperature dependent excitation winding resistance</li>
<li>optional, when enabled: heat losses in the temperature dependent damper cage resistances</li>
<li>brush losses in the excitation circuit</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_PermanentMagnet\">
SM_PermanentMagnet</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ReluctanceRotor\">
SM_ReluctanceRotor</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">
Magnetic.FundamentalWave.BasicMachines.SM_PermanentMagnet</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">
Magnetic.FundamentalWave.BasicMachines.SM_ElectricalExcited</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor\">
Magnetic.FundamentalWave.BasicMachines.SM_ReluctanceRotor</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor
        "Synchronous reluctance machine with optional damper cage"
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Interfaces.PartialBasicMachine(
          Rs(start=0.03),
          Lssigma(start=0.1/(2*pi*fsNominal)),
          final L0(d=2.0*Lmd/m/effectiveStatorTurns^2, q=2.0*Lmq/m/
                effectiveStatorTurns^2),
          redeclare final
            Modelica_Electrical_Machines.Thermal.SynchronousInductionMachines.ThermalAmbientSMR
            thermalAmbient(final useDamperCage=useDamperCage, final Tr=
                TrOperational),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortSMR
            thermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.ThermalPortSMR
            internalThermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines.Interfaces.InductionMachines.PowerBalanceSMR
            powerBalance(final lossPowerRotorWinding=damperCageLossPower,
              final lossPowerRotorCore=0));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of (optional) damper cage" annotation (
            Dialog(group="Operational temperatures", enable=not useThermalPort
                 and useDamperCage));
        parameter Modelica_SIunits.Inductance Lmd(start=2.9/(2*pi*fsNominal))
          "Stator main field inductance, d-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lmq(start=0.9/(2*pi*fsNominal))
          "Stator main field inductance, q-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        // Rotor cage parameters
        parameter Boolean useDamperCage(start=true)
          "Enable/disable damper cage" annotation (Dialog(tab=
                "Nominal resistances and inductances", group="DamperCage"));
        parameter Modelica_SIunits.Inductance Lrsigmad(start=0.05/(2*pi*
              fsNominal))
          "Rotor leakage inductance, d-axis, w.r.t. stator side" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
          "Rotor leakage inductance, q-axis, w.r.t. stator side" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrd(start=0.04)
          "Rotor resistance, d-axis, w.r.t. stator side" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrq=Rrd
          "Rotor resistance , q-axis, w.r.t. stator side" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20r(start=0)
          "Temperature coefficient of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        Modelica_ComplexBlocks.Interfaces.ComplexOutput ir[2] if useDamperCage
          "Damper cage currents";
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Short short if not
          useDamperCage
          "Magnetic connection in case the damper cage is not present"
          annotation (Placement(transformation(
              origin={10,-40},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Components.SaliencyCageWinding rotorCage(
          final RRef(d=Rrd, q=Rrq),
          final Lsigma(d=Lrsigmad, q=Lrsigmaq),
          final useHeatPort=true,
          final TRef=TrRef,
          final TOperational=TrOperational,
          final alpha20=alpha20r,
          final effectiveTurns=sqrt(m/2.0)*effectiveStatorTurns) if
          useDamperCage
          "Symmetric rotor cage winding including resistances and stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-40})));
      protected
        Modelica_Blocks.Interfaces.RealOutput damperCageLossPower(final
            quantity="Power", final unit="W") "Damper losses";
      equation
        connect(ir,rotorCage.i);
        connect(damperCageLossPower, rotorCage.lossPower);
        if not useDamperCage then
          damperCageLossPower = 0;
        end if;
        connect(rotorCage.port_n, airGap.port_rp) annotation (Line(
            points={{20,-30},{10,-30},{10,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(short.port_n, airGap.port_rp) annotation (Line(
            points={{10,-30},{10,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(rotorCage.port_p, airGap.port_rn) annotation (Line(
            points={{20,-50},{-10,-50},{-10,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(short.port_p, airGap.port_rn) annotation (Line(
            points={{10,-50},{-10,-50},{-10,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(rotorCage.heatPortWinding, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{30,-40},{40,-40},{40,-80},{-40,-80},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="smr",
          Icon(graphics={
              Rectangle(extent={{-130,10},{-100,-10}}, lineColor={0,0,0}),
              Rectangle(extent={{-100,10},{-70,-10}}, lineColor={0,0,0}),
              Ellipse(extent={{-134,34},{-66,-34}}, lineColor={85,170,255})}),
          Documentation(info="<html>
<p>
Resistances and stray inductances of the machine refer to an <code>m</code> phase stator. The symmetry of the stator and the supply are assumed. For rotor asymmetries can be taken into account by different resistances and stray inductances in the d- and q-axis. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>optional, when enabled: heat losses in the temperature dependent damper cage resistances</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_PermanentMagnet\">
SM_PermanentMagnet</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ElectricalExcited\">
SM_ElectricalExcited</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">
Magnetic.FundamentalWave.BasicMachines.SM_PermanentMagnet</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">
Magnetic.FundamentalWave.BasicMachines.SM_ElectricalExcited</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor\">
Magnetic.FundamentalWave.BasicMachines.SM_ReluctanceRotor</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end SM_ReluctanceRotor;
    end SynchronousMachines;

    package Components "Components for quasi static machine models"
      extends Modelica_Icons.Package;
      model SymmetricMultiPhaseWinding
        "Symmetric winding model coupling electrical and magnetic domain"
        // Orientation changed
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
          plug_p(final m=m) "Positive plug" annotation (Placement(
              transformation(
              origin={-100,100},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
          plug_n(final m=m) "Negative plug" annotation (Placement(
              transformation(
              origin={-100,-100},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Interfaces.NegativeMagneticPort port_n "Negative complex magnetic port"
          annotation (Placement(transformation(extent={{90,-110},{110,-90}},
                rotation=0)));
        Interfaces.PositiveMagneticPort port_p "Positive complex magnetic port"
          annotation (Placement(transformation(extent={{90,90},{110,110}},
                rotation=0)));
        parameter Integer m=3 "Number of phases";
        parameter Boolean useHeatPort=false
          "Enable / disable (=fixed temperatures) thermal port"
          annotation (Evaluate=true);
        // Resistor model
        parameter Modelica_SIunits.Resistance RRef
          "Winding resistance per phase at TRef";
        parameter Modelica_SIunits.Temperature TRef(start=293.15)
          "Reference temperature of winding";
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20(start=0) "Temperature coefficient of winding at 20 degC";
        final parameter Modelica_SIunits.LinearTemperatureCoefficient alphaRef=
            Modelica_Electrical_Machines.Thermal.convertAlpha(
                  alpha20,
                  TRef,
                  293.15);
        parameter Modelica_SIunits.Temperature TOperational(start=293.15)
          "Operational temperature of winding"
          annotation (Dialog(enable=not useHeatPort));
        parameter Modelica_SIunits.Inductance Lsigma
          "Winding stray inductance per phase";
        parameter Real effectiveTurns=1 "Effective number of turns per phase";
        parameter Modelica_SIunits.Conductance GcRef
          "Electrical reference core loss reluctance";

        Modelica_SIunits.ComplexVoltage v[m] = plug_p.pin.v - plug_n.pin.v
          "Complex voltage";
        Modelica_SIunits.Voltage abs_v[m] = Modelica_ComplexMath.'abs'(v)
          "Magnitude of complex voltage";
        Modelica_SIunits.Angle arg_v[m] = Modelica_ComplexMath.arg(v)
          "Argument of complex voltage";
        Modelica_SIunits.ComplexCurrent i[m] = plug_p.pin.i "Complex current";
        Modelica_SIunits.Current abs_i[m] = Modelica_ComplexMath.'abs'(i)
          "Magnitude of complex current";
        Modelica_SIunits.Angle arg_i[m] = Modelica_ComplexMath.arg(i)
          "Argument of complex current";
        Modelica_SIunits.ActivePower P[m] = {Modelica_ComplexMath.real(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
          "Active power";
        Modelica_SIunits.ActivePower P_total = sum(P) "Total active power";
        Modelica_SIunits.ReactivePower Q[m] = {Modelica_ComplexMath.imag(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
          "Reactive power";
        Modelica_SIunits.ReactivePower Q_total = sum(Q) "Total reactive power";
        Modelica_SIunits.ApparentPower S[m] = {Modelica_ComplexMath.'abs'(v[k]*Modelica_ComplexMath.conj(i[k])) for k in 1:m}
          "Magnitude of complex apparent power";
        Modelica_SIunits.ApparentPower S_total=sqrt(P_total^2+Q_total^2)
          "Magntiude of total complex apparent power";
        Real pf[m] = {cos(Modelica_ComplexMath.arg(Complex(P[k],Q[k]))) for k in 1:m}
          "Power factor";

        Modelica_SIunits.ComplexMagneticPotentialDifference V_m = port_p.V_m - port_n.V_m
          "Complex magnetic potential difference";
        Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
          "Magnitude of complex magnetic potential difference";
        Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
          "Argument of complex magnetic potential difference";
        Modelica_SIunits.ComplexMagneticFlux Phi = port_p.Phi
          "Complex magnetic flux";
         Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
          "Magnitude of complex magnetic flux";
        Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
          "Argument of complex magnetic flux";

        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
          electroMagneticConverter(final m=m, final effectiveTurns=
              effectiveTurns) "Symmetric winding" annotation (Placement(
              transformation(extent={{-10,-40},{10,-20}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor resistor(
          final m=m,
          final useHeatPort=useHeatPort,
          final T_ref=fill(TRef, m),
          final T=fill(TOperational, m),
          R_ref=fill(RRef, m),
          final alpha_ref=fill(alphaRef, m)) "Winding resistor" annotation (
            Placement(transformation(
              origin={-18,70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPortWinding[m] if
             useHeatPort "Heat ports of winding resistors"
          annotation (Placement(transformation(extent={{-50,-110},{-30,-90}})));
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPortCore if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{30,-110},{50,-90}})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.EddyCurrent core(final
            useHeatPort=useHeatPort, final G=(m/2)*GcRef*effectiveTurns^2)
          "Core loss model (currently eddy currents only)" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={50,-40})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Reluctance strayReluctance(final R_m(
              d=m*effectiveTurns^2/2/Lsigma, q=m*effectiveTurns^2/2/Lsigma))
          "Stray reluctance equivalent to ideally coupled stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
      equation
        connect(resistor.heatPort, heatPortWinding) annotation (Line(
            points={{-28,70},{-40,70},{-40,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(core.heatPort, heatPortCore) annotation (Line(
            points={{40,-50},{40,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(strayReluctance.port_n, core.port_n) annotation (Line(
            points={{80,20},{80,-40},{60,-40}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(electroMagneticConverter.plug_p, resistor.plug_n) annotation (
            Line(
            points={{-10,-20},{-18,-20},{-18,60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plug_n, electroMagneticConverter.plug_n) annotation (Line(
            points={{-100,-100},{-100,-40},{-10,-40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plug_p, resistor.plug_p) annotation (Line(
            points={{-100,100},{-18,100},{-18,80}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(port_p, electroMagneticConverter.port_p) annotation (Line(
            points={{100,100},{10,100},{10,-20}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(strayReluctance.port_p, port_p) annotation (Line(
            points={{80,40},{80,100},{100,100}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(port_n, core.port_n) annotation (Line(
            points={{100,-100},{100,-40},{60,-40}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(electroMagneticConverter.port_n, core.port_p) annotation (Line(
            points={{10,-40},{40,-40}},
            color={255,170,85},
            smooth=Smooth.None));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                      extent={{-100,60},{100,-60}},
                      lineColor={0,0,255},
                      pattern=LinePattern.None,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{100,-100},{
                94,-100},{84,-98},{76,-94},{64,-86},{50,-72},{42,-58},{36,-40},
                {30,-18},{30,0},{30,18},{34,36},{46,66},{62,84},{78,96},{90,100},
                {100,100}}, color={255,128,0}),Line(points={{40,60},{-100,60},{
                -100,100}}, color={85,170,255}),Line(points={{40,-60},{-100,-60},
                {-100,-98}}, color={85,170,255}),Line(points={{40,60},{100,20},
                {40,-20},{0,-20},{-40,0},{0,20},{40,20},{100,-20},{40,-60}},
                color={85,170,255}),Text(
                      extent={{0,160},{0,120}},
                      lineColor={0,0,255},
                      fillColor={255,128,0},
                      fillPattern=FillPattern.Solid,
                      textString="%name")}),
          Documentation(info="<html>
<p>
The symmetrical multi phase winding consists of a symmetrical winding
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">resistor</a>, a
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">stray inductor</a>, a symmetrical
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">multi phase electromagnetic coupling</a> and a
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Components.EddyCurrent\">core loss</a> model including
heat <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\">port</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.Components.QuasiStionaryAnalogWinding\">
QuasiStionaryAnalogWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">
Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">
Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end SymmetricMultiPhaseWinding;

      model QuasiStionaryAnalogWinding
        "Quasi static single phase winding neglecting induced voltage"
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;

        Modelica_Electrical_Analog.Interfaces.PositivePin pin_p "Positive pin"
          annotation (Placement(transformation(
              origin={-100,100},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_Analog.Interfaces.NegativePin pin_n "Negative pin"
          annotation (Placement(transformation(
              origin={-100,-100},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Interfaces.NegativeMagneticPort port_n "Negative complex magnetic port"
          annotation (Placement(transformation(extent={{90,-110},{110,-90}},
                rotation=0)));
        Interfaces.PositiveMagneticPort port_p "Positive complex magnetic port"
          annotation (Placement(transformation(extent={{90,90},{110,110}},
                rotation=0)));
        parameter Boolean useHeatPort=false
          "Enable / disable (=fixed temperatures) thermal port"
          annotation (Evaluate=true);
        parameter Modelica_SIunits.Resistance RRef
          "Winding resistance per phase at TRef";
        parameter Modelica_SIunits.Temperature TRef(start=293.15)
          "Reference temperature of winding";
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20(start=0) "Temperature coefficient of winding at 20 degC";
        final parameter Modelica_SIunits.LinearTemperatureCoefficient alphaRef=
            Modelica_Electrical_Machines.Thermal.convertAlpha(
                  alpha20,
                  TRef,
                  293.15);
        parameter Modelica_SIunits.Temperature TOperational(start=293.15)
          "Operational temperature of winding"
          annotation (Dialog(enable=not useHeatPort));
        parameter Real effectiveTurns=1 "Effective number of turns per phase";

        Modelica_SIunits.Voltage v = pin_p.v - pin_n.v "Voltage";
        Modelica_SIunits.Current i = pin_p.i "Current";

        Modelica_SIunits.ComplexMagneticPotentialDifference V_m = port_p.V_m - port_n.V_m
          "Complex magnetic potential difference";
        Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
          "Magnitude of complex magnetic potential difference";
        Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
          "Argument of complex magnetic potential difference";
        Modelica_SIunits.ComplexMagneticFlux Phi = port_p.Phi
          "Complex magnetic flux";
         Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
          "Magnitude of complex magnetic flux";
        Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
          "Argument of complex magnetic flux";

        Modelica_Electrical_Analog.Basic.Resistor resistor(
          final useHeatPort=useHeatPort,
          final R=RRef,
          final T_ref=TRef,
          final alpha=alphaRef,
          final T=TOperational) annotation (Placement(transformation(
              origin={-10,70},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.QuasiStaticAnalogElectroMagneticConverter
          electroMagneticConverter(final effectiveTurns=effectiveTurns)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=0)));
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPortWinding if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
      equation
        connect(pin_p, resistor.p) annotation (Line(points={{-100,100},{-10,100},
                {-10,80}}, color={0,0,255}));
        connect(electroMagneticConverter.pin_n, pin_n) annotation (Line(points=
                {{-10,-10},{-10,-100},{-100,-100}}, color={0,0,255}));
        connect(electroMagneticConverter.port_p, port_p) annotation (Line(
              points={{10,10},{10,100},{100,100}}, color={255,128,0}));
        connect(electroMagneticConverter.port_n, port_n) annotation (Line(
              points={{10,-10},{10,-100},{100,-100}}, color={255,128,0}));
        connect(heatPortWinding, resistor.heatPort) annotation (Line(
            points={{0,-100},{0,-60},{-40,-60},{-40,70},{-20,70}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(resistor.n, electroMagneticConverter.pin_p) annotation (Line(
            points={{-10,60},{-10,10}},
            color={0,0,255},
            smooth=Smooth.None));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                      extent={{-100,60},{100,-60}},
                      lineColor={0,0,255},
                      pattern=LinePattern.None,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{100,-100},{
                94,-100},{84,-98},{76,-94},{64,-86},{50,-72},{42,-58},{36,-40},
                {30,-18},{30,0},{30,18},{34,36},{46,66},{62,84},{78,96},{90,100},
                {100,100}}, color={255,128,0}),Line(points={{40,60},{-100,60},{
                -100,100}}, color={0,0,255}),Line(points={{40,-60},{-100,-60},{
                -100,-98}}, color={0,0,255}),Line(points={{40,60},{100,20},{40,
                -20},{0,-20},{-40,0},{0,20},{40,20},{100,-20},{40,-60}}, color=
                {0,0,255}),Text(
                      extent={{0,160},{0,120}},
                      lineColor={0,0,255},
                      fillColor={255,128,0},
                      fillPattern=FillPattern.Solid,
                      textString="%name")}),
          Documentation(info="<html>
<p>
The single phase winding consists of a
<a href=\"modelica://Modelica.Electrical.Analog.Basic.Resistor\">resistor</a>, a symmetrical
<a href=\"modelica://Modelica.Electrical.Analog.Basic.Inductor\">stray inductor</a> and a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.SinglePhaseElectroMagneticConverter\">single phase electromagnetic coupling</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">
SymmetricMultiPhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">
Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">
Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end QuasiStionaryAnalogWinding;

      model RotorSaliencyAirGap "Air gap model with rotor saliency"
        import Modelica_Constants.pi;
        Interfaces.PositiveMagneticPort port_sp
          "Positive complex magnetic stator port" annotation (Placement(
              transformation(extent={{-110,-110},{-90,-90}}, rotation=0)));
        Interfaces.NegativeMagneticPort port_sn
          "Negative complex magnetic stator port" annotation (Placement(
              transformation(extent={{-110,90},{-90,110}}, rotation=0)));
        Interfaces.PositiveMagneticPort port_rp
          "Positive complex magnetic rotor port" annotation (Placement(
              transformation(extent={{90,90},{110,110}}, rotation=0)));
        Interfaces.NegativeMagneticPort port_rn
          "Negative complex magnetic rotor port" annotation (Placement(
              transformation(extent={{90,-110},{110,-90}}, rotation=0)));
        Modelica_Mechanics_Rotational.Interfaces.Flange_a flange_a
          "Flange of the rotor" annotation (Placement(transformation(extent={{-10,
                  110},{10,90}}, rotation=0)));
        Modelica_Mechanics_Rotational.Interfaces.Flange_a support
          "Support at which the reaction torque is acting" annotation (
            Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
        parameter Integer p "Number of pole pairs";
        parameter Modelica_Magnetic_FundamentalWave.Types.SalientInductance L0(
            d(start=1), q(start=1))
          "Salient inductance of a single unchorded coil w.r.t. the fundamental wave";
        final parameter
          Modelica_Magnetic_FundamentalWave.Types.SalientReluctance R_m(d=1/L0.d,
            q=1/L0.q) "Reluctance of the air gap model";
        // Complex phasors of magnetic potential differences
        Modelica_SIunits.ComplexMagneticPotentialDifference V_ms
          "Complex magnetic potential difference of stator w.r.t. stator reference frame";
        Modelica_SIunits.ComplexMagneticPotentialDifference V_msr=V_ms*
            Modelica_ComplexMath.fromPolar(1, gammar)
          "Complex magnetic potential difference of stator w.r.t. rotor fixed reference frame";
        Modelica_SIunits.ComplexMagneticPotentialDifference V_mr
          "Complex magnetic potential difference of rotor w.r.t. rotor reference frame";
        Modelica_SIunits.ComplexMagneticPotentialDifference V_mrr=V_mr*
            Modelica_ComplexMath.fromPolar(1, gammar)
          "Complex magnetic potential difference of rotor w.r.t. rotor fixed reference frame";
        // Complex phasors of magnetic fluxes
        Modelica_SIunits.ComplexMagneticFlux Phi_s
          "Complex magnetic flux of stator w.r.t. stator reference frame";
        Modelica_SIunits.ComplexMagneticFlux Phi_sr=Phi_s*
            Modelica_ComplexMath.fromPolar(1, gammar)
          "Complex magnetic flux of stator w.r.t. rotor fixed reference frame";
        Modelica_SIunits.ComplexMagneticFlux Phi_r
          "Complex magnetic flux of rotor w.r.t. rotor refernce frame";
        Modelica_SIunits.ComplexMagneticFlux Phi_rr=Phi_r*
            Modelica_ComplexMath.fromPolar(1, gammar)
          "Complex magnetic flux of rotor w.r.t. rotor fixed reference frame";
        // Electrical torque and mechanical angle
        Modelica_SIunits.Torque tauElectrical "Electrical torque";
        // Modelica.SIunits.Torque tauTemp "Electrical torque";
        Modelica_SIunits.Angle gamma=p*(flange_a.phi - support.phi)
          "Electrical angle between rotor and stator";
        Modelica_SIunits.Angle gammas=port_sp.reference.gamma
          "Angle electrical qantities in stator reference frame";
        Modelica_SIunits.Angle gammar=port_rp.reference.gamma
          "Angle electrical qantities in rotor reference frame";
      equation
        // Stator flux into positive stator port
        port_sp.Phi = Phi_s;
        // Balance of stator flux
        port_sp.Phi + port_sn.Phi = Complex(0, 0);
        // Rotor flux into positive rotor port
        port_rp.Phi = Phi_r;
        // Balance of rotor flux
        port_rp.Phi + port_rn.Phi = Complex(0, 0);
        // Magneto motive force of stator
        port_sp.V_m - port_sn.V_m = V_ms;
        // Magneto motive force of stator
        port_rp.V_m - port_rn.V_m = V_mr;
        // Stator and rotor flux are equal with respect to different reference frames
        Phi_s = Phi_r;
        // Local balance of magneto motive force
        (pi/2.0)*(V_mrr.re + V_msr.re) = Phi_rr.re*R_m.d;
        (pi/2.0)*(V_mrr.im + V_msr.im) = Phi_rr.im*R_m.q;
        // Torque
        tauElectrical = -(pi*p/2.0)*(Phi_s.im*V_ms.re - Phi_s.re*V_ms.im);
        flange_a.tau = -tauElectrical;
        support.tau = tauElectrical;
        // Potential root of rotor has been removed. Only the stator positive
        //   plug is a potential root so that being a root determines that not
        //   electrical stator root is connected from outside; in this case the
        //   machine is operated as generator and the rotor angle is set to zero.
        // Magnetic stator and rotor port are (again) connected through
        //   Connections.branch, even though it is not clear yet whether this
        //   implementation is Modelica compliant
        Connections.potentialRoot(port_sp.reference);
        // Connections.potentialRoot(port_rp.reference);
        Connections.branch(port_sp.reference, port_sn.reference);
        port_sp.reference.gamma = port_sn.reference.gamma;
        Connections.branch(port_rp.reference, port_rn.reference);
        port_rp.reference.gamma = port_rn.reference.gamma;
        Connections.branch(port_sp.reference, port_rp.reference);
        gammas = gammar + gamma;
        if Connections.isRoot(port_sp.reference) then
          gammar = 0;
        end if;
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                      extent={{-100,100},{100,-100}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{-100,90},{-100,
                60},{-80,60}}, color={255,128,0}),Line(points={{-100,-90},{-100,
                -60},{-80,-60}}, color={255,128,0}),Line(points={{40,60},{100,
                60},{100,90}}, color={255,128,0}),Line(points={{40,-60},{100,-60},
                {100,-90}}, color={255,128,0}),Ellipse(
                      extent={{-60,80},{60,-80}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{0,80},{0,90}},
                color={0,0,0})}),
          Documentation(info="<html>
<p>
This salient air gap model can be used for machines with uniform airgaps and for machines with rotor saliencies. The air gap model is not symmetrical towards stator and rotor since it is assumed the saliency always refers to the rotor. The saliency of the air gap is represented by a main field inductance in the d- and q-axis.
</p>

<p>
For the mechanical interaction of the air gap model with the stator and the rotor it is equipped with to
<a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.Flange_a\">rotational connectors</a>. The torques acting on both connectors have the same absolute values but different signs. The stator and the rotor reference angles,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma_s.png\"> and
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma_r.png\"> are related by
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma_relationship.png\">
where
<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/gamma.png\">
is the electrical angle between stator and rotor.
</p>

<p>
The air gap model has two magnetic stator and two magnetic rotor
<a href=\"modelica://StaticFundamentalWave.Interfaces.MagneticPort\">ports</a>. The magnetic potential difference and the magnetic flux of the stator and rotor are equal complex quanitites, respectively, but the reference angles are different; see <a href=\"Modelica.Magnetic.QuasiStatic.FundamentalWave.UsersGuide.Concept\">Concept</a>. The d and q axis components with respect to the rotor fixed reference frame (superscript r) are determined from the stator (superscript s) and rotor (superscript r) reference quantities, by
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/V_m_transformation.png\">.
</p>

<p>
The d and q axis magnetic potential difference components and flux components are releated with the flux by:
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Machines/Components/airgap.png\">
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">
Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap</a>
</p>

</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end RotorSaliencyAirGap;

      model SymmetricMultiPhaseCageWinding "Symmetrical rotor cage"
        import Modelica_Constants.pi;
        extends
          Modelica_Magnetic_QuasiStatic_FundamentalWave.Interfaces.PartialTwoPortExtended;
        parameter Integer m=3 "Number of phases";
        parameter Boolean useHeatPort=false
          "Enable / disable (=fixed temperatures) thermal port"
          annotation (Evaluate=true);
        parameter Modelica_SIunits.Resistance RRef
          "Winding resistance per phase at TRef";
        parameter Modelica_SIunits.Temperature TRef(start=293.15)
          "Reference temperature of winding";
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20(start=0) "Temperature coefficient of winding at 20 degC";
        final parameter Modelica_SIunits.LinearTemperatureCoefficient alphaRef=
            Modelica_Electrical_Machines.Thermal.convertAlpha(
                  alpha20,
                  TRef,
                  293.15);
        parameter Modelica_SIunits.Temperature TOperational(start=293.15)
          "Operational temperature of winding"
          annotation (Dialog(enable=not useHeatPort));
        parameter Modelica_SIunits.Inductance Lsigma "Cage stray inductance";
        parameter Real effectiveTurns=1 "Effective number of turns";
        Modelica_SIunits.ComplexCurrent i[m]=electroMagneticConverter.i
          "Cage currents";
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
          electroMagneticConverter(final m=m, final effectiveTurns=
              effectiveTurns) "Symmetric winding" annotation (Placement(
              transformation(
              origin={0,-10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor resistor(
          final useHeatPort=useHeatPort,
          final m=m,
          final T_ref=fill(TRef, m),
          final T=fill(TRef, m),
          R_ref=fill(RRef, m),
          alpha_ref=fill(alphaRef, m)) annotation (Placement(transformation(
              origin={-20,-50},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star(final m=
              m) annotation (Placement(transformation(extent={{30,-30},{50,-10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground
          annotation (Placement(transformation(
              origin={70,-20},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPortWinding if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica_Thermal_HeatTransfer.Components.ThermalCollector
          thermalCollector(final m=m) if useHeatPort
          "Connector of thermal rotor resistance heat ports"
          annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starAuxiliary(
            final m=m) annotation (Placement(transformation(extent={{30,-90},{
                  50,-70}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Reluctance strayReluctance(final R_m(
              d=m*effectiveTurns^2/2/Lsigma, q=m*effectiveTurns^2/2/Lsigma))
          "Stray reluctance equivalent to ideally coupled stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={0,20})));
      equation
        connect(thermalCollector.port_a, resistor.heatPort) annotation (Line(
            points={{-40,-70},{-40,-50},{-30,-50}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(thermalCollector.port_b, heatPortWinding) annotation (Line(
            points={{-40,-90},{-40,-100},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(port_p, electroMagneticConverter.port_p) annotation (Line(
            points={{-100,0},{-10,0}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(electroMagneticConverter.port_n, port_n) annotation (Line(
            points={{10,0},{100,0}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(starAuxiliary.plug_p, resistor.plug_n) annotation (Line(
            points={{30,-80},{-20,-80},{-20,-60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(electroMagneticConverter.plug_n, star.plug_p) annotation (Line(
            points={{10,-20},{30,-20}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(star.pin_n, ground.pin) annotation (Line(
            points={{50,-20},{60,-20}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starAuxiliary.pin_n, ground.pin) annotation (Line(
            points={{50,-80},{60,-80},{60,-20}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(strayReluctance.port_p, port_p) annotation (Line(
            points={{-10,20},{-30,20},{-30,0},{-100,0}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(strayReluctance.port_n, port_n) annotation (Line(
            points={{10,20},{30,20},{30,0},{100,0}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(electroMagneticConverter.plug_p, resistor.plug_p) annotation (
            Line(
            points={{-10,-20},{-20,-20},{-20,-40}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                      extent={{-80,80},{80,-80}},
                      lineColor={0,0,0},
                      fillColor={175,175,175},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-20,76},{20,36}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{28,46},{68,6}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{28,-8},{68,-48}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-20,-36},{20,-76}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-68,-6},{-28,-46}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-66,50},{-26,10}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{-80,0},{-100,
                0}}, color={255,128,0}),Line(points={{100,0},{80,0}}, color={
                255,128,0}),Text(
                      extent={{0,100},{0,140}},
                      lineColor={0,0,255},
                      textString="%name")}),
          Documentation(info="<html>
<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Machines/Components/rotorcage.png\">
</p>

<p>
The symmetric rotor cage model of this library does not consist of rotor bars and end rings. Instead the symmetric cage is modeled by an equivalent symmetrical winding. The rotor cage model consists of
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\"> phases. If the cage is modeled by equivalent stator winding parameters, the number of effective turns,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/effectiveTurns.png\">, has to be chosen equivalent to the effective number of stator turns.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.Components.SaliencyCageWinding\">
SaliencyCageWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">
Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">
Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}),      graphics));
      end SymmetricMultiPhaseCageWinding;

      model SaliencyCageWinding "Rotor cage with saliency in d- and q-axis"
        extends
          Modelica_Magnetic_QuasiStatic_FundamentalWave.Interfaces.PartialTwoPortExtended;
        parameter Boolean useHeatPort=false
          "Enable / disable (=fixed temperatures) thermal port"
          annotation (Evaluate=true);
        parameter Modelica_Magnetic_FundamentalWave.Types.SalientResistance
          RRef(d(start=1), q(start=1)) "Salient cage resistance";
        parameter Modelica_SIunits.Temperature TRef(start=293.15)
          "Reference temperature of winding";
        parameter
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20(start=0) "Temperature coefficient of winding at 20 degC";
        final parameter Modelica_SIunits.LinearTemperatureCoefficient alphaRef=
            Modelica_Electrical_Machines.Thermal.convertAlpha(
                  alpha20,
                  TRef,
                  293.15);
        parameter Modelica_SIunits.Temperature TOperational(start=293.15)
          "Operational temperature of winding"
          annotation (Dialog(enable=not useHeatPort));
        parameter Modelica_Magnetic_FundamentalWave.Types.SalientInductance
          Lsigma(d(start=1), q(start=1)) "Salient cage stray inductance";
        parameter Real effectiveTurns=1 "Effective number of turns";
        Modelica_ComplexBlocks.Interfaces.ComplexOutput i[2]=electroMagneticConverter.i
          "Cage currents";
        Modelica_Blocks.Interfaces.RealOutput lossPower(
          final quantity="Power",
          final unit="W") = sum(resistor.resistor.LossPower) "Damper losses";
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
          electroMagneticConverter(final m=2, final effectiveTurns=
              effectiveTurns) annotation (Placement(transformation(
              origin={0,-10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor resistor(
          final useHeatPort=useHeatPort,
          final m=2,
          final T_ref=fill(TRef, 2),
          final T=fill(TOperational, 2),
          R_ref={RRef.d,RRef.q},
          alpha_ref=fill(alphaRef, 2)) annotation (Placement(transformation(
              origin={-20,-50},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star(final m=
              2) annotation (Placement(transformation(extent={{30,-90},{50,-70}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground
          annotation (Placement(transformation(
              origin={70,-80},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPortWinding if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica_Thermal_HeatTransfer.Components.ThermalCollector
          thermalCollector(final m=2) if useHeatPort
          "Connector of thermal rotor resistance heat ports"
          annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Reluctance strayReluctance(final R_m(
              d=effectiveTurns^2/Lsigma.d, q=effectiveTurns^2/Lsigma.q))
          "Stray reluctance equivalent to ideally coupled stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={0,20})));
      equation
        connect(thermalCollector.port_b, heatPortWinding) annotation (Line(
            points={{-40,-90},{-40,-100},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(resistor.heatPort, thermalCollector.port_a) annotation (Line(
            points={{-30,-50},{-40,-50},{-40,-70}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(port_p, electroMagneticConverter.port_p) annotation (Line(
            points={{-100,0},{-10,0}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(electroMagneticConverter.port_n, port_n) annotation (Line(
            points={{10,0},{100,0}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(electroMagneticConverter.plug_n, resistor.plug_n) annotation (
            Line(
            points={{10,-20},{20,-20},{20,-80},{-20,-80},{-20,-60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(resistor.plug_n, star.plug_p) annotation (Line(
            points={{-20,-60},{-20,-80},{30,-80}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(star.pin_n, ground.pin) annotation (Line(
            points={{50,-80},{60,-80}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(electroMagneticConverter.plug_p, resistor.plug_p) annotation (
            Line(
            points={{-10,-20},{-20,-20},{-20,-40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(strayReluctance.port_p, port_p) annotation (Line(
            points={{-10,20},{-30,20},{-30,4.44089e-16},{-100,4.44089e-16}},
            color={255,170,85},
            smooth=Smooth.None));
        connect(strayReluctance.port_n, port_n) annotation (Line(
            points={{10,20},{30,20},{30,4.44089e-16},{100,4.44089e-16}},
            color={255,170,85},
            smooth=Smooth.None));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                      extent={{-80,80},{80,-80}},
                      lineColor={0,0,0},
                      fillColor={175,175,175},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-20,76},{20,36}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{28,46},{68,6}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{28,-8},{68,-48}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-20,-36},{20,-76}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-68,-6},{-28,-46}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-66,50},{-26,10}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{-80,0},{-100,
                0}}, color={255,128,0}),Line(points={{100,0},{80,0}}, color={
                255,128,0}),Text(
                      extent={{0,100},{0,140}},
                      lineColor={0,0,255},
                      textString="%name")}),
          Documentation(info="<html>

<p>
The salient cage model is a two axis model with two phases. The electromagnetic coupling therefore is also two phase coupling model. The angles of the two orientations are 0 and <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/pi_over_2.png\">. This way an asymmetrical rotor cage with different resistances and stray inductances in d- and q-axis can be modeled.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">
SymmetricMultiPhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">
Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">
Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                               graphics));
      end SaliencyCageWinding;

      model PermanentMagnet
        "Permanent magnet model without intrinsic reluctance, represeted by magnetic potential difference"
        extends Losses.PermanentMagnetLosses;
        extends Interfaces.PartialTwoPort;
        parameter Modelica_SIunits.ComplexMagneticPotentialDifference V_m=
            Complex(re=1, im=0)
          "Complex magnetic potential difference w.r.t. reference frame";
        Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
          "Magnitude of complex magnetic potential difference";
        Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
          "Argument of complex magnetic potential difference w.r.t. reference frame";

        Modelica_SIunits.Angle gamma "Angle of V_m fixed reference frame";
        Modelica_SIunits.ComplexMagneticFlux Phi "Complex magnetic flux";
        Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
          "Magnitude of complex magnetic flux";
        Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
          "Argument of complex magnetic flux";
        Modelica_SIunits.ComplexMagneticPotentialDifference V_mGamma=V_m*
            Modelica_ComplexMath.fromPolar(1, +gamma)
          "Magnetic potential difference transformed with reference angle";
      equation
        // Magneto motive force with respect to rotor fixed reference
        port_p.V_m - port_n.V_m = V_mGamma;
        // Flux into positive port with respect to rotor fixed reference
        port_p.Phi = Phi;
        // Local flux balance
        port_p.Phi + port_n.Phi = Complex(0, 0);
        // Reference angular speed and angle
        gamma = port_p.reference.gamma;
        // Connections.root(port_p.reference);
        annotation (
          Documentation(info="<html>
<p>Permanent magnet model with magnetic, mechanical and thermal connector including losses. The PM model is source  of constant magnetic potential difference. The PM loss is calculated by
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Losses.PermanentMagnetLosses\">PermanentMagnetLosses</a>.
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics),
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Line(
                      points={{-100,0},{100,0}},
                      color={255,170,85},
                      smooth=Smooth.None),Ellipse(extent={{-50,50},{50,-50}},
                lineColor={255,170,85})}));
      end PermanentMagnet;
    end Components;
  end BasicMachines;

  package Losses "Loss models"
    extends Modelica_Icons.Package;
    model StrayLoad "Model of stray load losses dependent on current and speed"
      extends Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.OnePort;
      extends Modelica_Electrical_Machines.Interfaces.FlangeSupport;
      import Modelica_Electrical_QuasiStationary.MultiPhase.Functions.quasiRMS;
      parameter Modelica_Electrical_Machines.Losses.StrayLoadParameters
        strayLoadParameters "Stray load loss parameters";
      extends
        Modelica_Thermal_HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT(
          useHeatPort=false);
      Modelica_SIunits.Current iRMS=quasiRMS(i);
    equation
      v = {Complex(0, 0) for k in 1:m};
      if (strayLoadParameters.PRef <= 0) then
        tau = 0;
      else
        tau = -strayLoadParameters.tauRef*(iRMS/strayLoadParameters.IRef)^2*
          smooth(1, if w >= 0 then +(+w/strayLoadParameters.wRef)^
          strayLoadParameters.power_w else -(-w/strayLoadParameters.wRef)^
          strayLoadParameters.power_w);
      end if;
      lossPower = -tau*w;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
                  extent={{-70,30},{70,-30}},
                  lineColor={85,170,255},
                  pattern=LinePattern.Dot),Line(
                  points={{-102,0},{100,0}},
                  color={85,170,255},
                  smooth=Smooth.None)}), Documentation(info="<html>
<p>
Stray load losses are modeled similar to standards EN 60034-2 and IEEE 512, i.e., they are dependent on square of current,
but without scaling them to zero at no-load current.
</p>
<p>
For an estimation of dependency on varying angular velocity see:
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.UsersGuide.References\">[Lang1984]</a>
</p>
<p>
The stray load losses are modeled such way that they do not cause a voltage drop in the electric circuit.
Instead, the dissipated losses are considered through an equivalent braking torque at the shaft.
</p>
<p>
The stray load loss torque is
</p>
<pre>
  tau = PRef/wRef * (i/IRef)^2 * (w/wRef)^power_w
</pre>
<p>
where <code>i</code> is the current of the machine and <code>w</code> is the actual angular velocity.
The dependency of the stray load torque on the angular velocity is modeled by the exponent <code>power_w</code>.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.StrayLoadParameters\">StrayLoad parameters</a>
</p>
<p>
If it is desired to neglect stray load losses, set <code>strayLoadParameters.PRef = 0</code> (this is the default).
</p>
</html>"));
    end StrayLoad;

    model PermanentMagnetLosses
      "Model of permanent magnet losses dependent on current and speed"
      extends Modelica_Electrical_Machines.Interfaces.FlangeSupport;
      import Modelica_Electrical_QuasiStationary.MultiPhase.Functions.quasiRMS;
      parameter Integer m(min=1) = 3 "Number of phases";
      parameter
        Modelica_Electrical_Machines.Losses.PermanentMagnetLossParameters
        permanentMagnetLossParameters "Permanent magnet loss parameters";
      extends
        Modelica_Thermal_HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT(
          useHeatPort=false);
      input Modelica_SIunits.ComplexCurrent is[m]
        "Instantaneous stator currents";
      Modelica_SIunits.Current iRMS=quasiRMS(is);
    equation
      if (permanentMagnetLossParameters.PRef <= 0) then
        tau = 0;
      else
        tau = -permanentMagnetLossParameters.tauRef*(
          permanentMagnetLossParameters.c + (1 - permanentMagnetLossParameters.c)
          *(iRMS/permanentMagnetLossParameters.IRef)^
          permanentMagnetLossParameters.power_I)*smooth(1, if w >= 0 then +(+w/
          permanentMagnetLossParameters.wRef)^permanentMagnetLossParameters.power_w
           else -(-w/permanentMagnetLossParameters.wRef)^
          permanentMagnetLossParameters.power_w);
      end if;
      lossPower = -tau*w;
      annotation (Icon(graphics={Ellipse(extent={{-40,-40},{40,40}}, lineColor=
              {200,0,0})}), Documentation(info="<html>
<p>
Permanent magnet losses are modeled dependent on current and speed.
</p>
<p>
The permanent magnet losses are modeled such way that they do not cause a voltage drop in the electric circuit.
Instead, the dissipated losses are considered through an equivalent braking torque at the shaft.
</p>
<p>
The permanent magnet loss torque is
</p>
<pre>
  tau = PRef/wRef * (c + (1 - c) * (i/IRef)^power_I) * (w/wRef)^power_w
</pre>
<p>
where <code>i</code> is the current of the machine and <code>w</code> is the actual angular velocity.
The parameter <code>c</code> designates the part of the permanent magnet losses that are present even at current = 0, i.e. independent of current.
The dependency of the permanent magnet loss torque on the stator current is modeled by the exponent <code>power_I</code>.
The dependency of the permanent magnet loss torque on the angular velocity is modeled by the exponent <code>power_w</code>.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.PermanentMagnetLossParameters\">Permanent magnet loss parameters</a>
</p>
<p>
If it is desired to neglect permanent magnet losses, set <code>strayLoadParameters.PRef = 0</code> (this is the default).
</p>
</html>"));
    end PermanentMagnetLosses;
  end Losses;

  package Sources "Sources to supply magnetic networks"
    extends Modelica_Icons.SourcesPackage;
    model ConstantMagneticPotentialDifference
      "Source with constant magnetic potential difference"
      extends Interfaces.PartialTwoPort;
      parameter Modelica_SIunits.Frequency f(start=1) "frequency of the source";
      parameter Modelica_SIunits.ComplexMagneticPotentialDifference V_m=Complex(
          re=1, im=0) "Complex magnetic potential difference";
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
      port_p.V_m - port_n.V_m = V_m;
      // Magneto motive force
      port_p.Phi = Phi;
      // Local flux balance
      port_p.Phi + port_n.Phi = Complex(0, 0);
      // Referenec angular speed and angle
      omega = 2*Modelica_Constants.pi*f;
      Connections.root(port_p.reference);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
                  extent={{-80,-20},{-80,-40}},
                  lineColor={255,170,85},
                  textString="+"),Text(
                  extent={{80,-20},{80,-40}},
                  lineColor={255,170,85},
                  textString="-"),Ellipse(
                  extent={{-50,-50},{50,50}},
                  lineColor={255,127,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,0},{50,0}},
              color={255,127,0}),Line(points={{-50,0},{-100,0}}, color={255,127,
              0}),Line(points={{-50,0},{50,0}}, color={255,127,0}),Text(
                  extent={{0,-120},{0,-80}},
                  textString="%name",
                  lineColor={0,0,255})}), Documentation(info="<html>
<p>
Source of constant magneto motive force.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.SignalMagneticPotentialDifference\">
SignalMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.ConstantFlux\">
ConstantFlux</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.SignalFlux\">
SignalFlux</a>
</p>
</html>"));
    end ConstantMagneticPotentialDifference;

    model SignalMagneticPotentialDifference
      "Source of magnetic potential difference with signal input"
      extends Interfaces.PartialTwoPort;
      Modelica_ComplexBlocks.Interfaces.ComplexInput V_m
        "Complex signal input of magnetic potential difference" annotation (
          Placement(transformation(
            origin={0,100},
            extent={{-20,-20},{20,20}},
            rotation=270)));
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
      port_p.V_m - port_n.V_m = V_m;
      // Magneto motive force
      port_p.Phi = Phi;
      // Local flux balance
      port_p.Phi + port_n.Phi = Complex(0, 0);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
                  extent={{80,-20},{80,-40}},
                  lineColor={255,170,85},
                  textString="-"),Ellipse(
                  extent={{-50,-50},{50,50}},
                  lineColor={255,170,85},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,0},{50,0}},
              color={255,170,85}),Line(points={{-50,0},{-100,0}}, color={255,
              128,0}),Line(points={{-50,0},{50,0}}, color={255,170,85}),Line(
              points={{0,100},{0,50}}, color={255,170,85}),Text(
                  extent={{0,-120},{0,-80}},
                  textString="%name",
                  lineColor={0,0,255}),Text(
                  extent={{-80,-20},{-80,-40}},
                  lineColor={255,170,85},
                  textString="+")}), Documentation(info="<html>
<p>
Source of magneto motive force with complex signal input.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.ConstantMagneticPotentialDifference\">
ConstantMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.ConstantFlux\">
ConstantFlux</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.SignalFlux\">
SignalFlux</a>
</p>

</html>"));
    end SignalMagneticPotentialDifference;

    model ConstantFlux "Source of constant magnetic flux"
      extends Interfaces.PartialTwoPort;
      parameter Modelica_SIunits.Frequency f(start=1) "frequency of the source";
      Modelica_SIunits.ComplexMagneticPotentialDifference V_m
        "Complex magnetic potential difference";
      Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
        "Magnitude of complex magnetic potential difference";
      Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
        "Argument of complex magnetic potential difference";
      parameter Modelica_SIunits.ComplexMagneticFlux Phi=Complex(re=1, im=0)
        "Complex magnetic flux";
      Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
        "Magnitude of complex magnetic flux";
      Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
        "Argument of complex magnetic flux";
    equation
      // Flux into positive port
      port_p.V_m - port_n.V_m = V_m;
      // Magneto motive force
      port_p.Phi = Phi;
      // Local flux balance
      port_p.Phi + port_n.Phi = Complex(0, 0);
      // Referenec angular speed and angle
      omega = 2*Modelica_Constants.pi*f;
      Connections.root(port_p.reference);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Ellipse(
                  extent={{-50,-50},{50,50}},
                  lineColor={255,127,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,0},{50,0}},
              color={255,127,0}),Line(points={{-50,0},{-100,0}}, color={255,127,
              0}),Line(points={{0,50},{0,-50}}, color={255,127,0}),Polygon(
                  points={{80,0},{60,6},{60,-6},{80,0}},
                  lineColor={255,128,0},
                  fillColor={255,170,85},
                  fillPattern=FillPattern.Solid),Text(
                  extent={{0,-120},{0,-80}},
                  textString="%name",
                  lineColor={0,0,255})}), Documentation(info="<html>
<p>
Source of constant magnetic flux.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.ConstantMagneticPotentialDifference\">
ConstantMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.SignalMagneticPotentialDifference\">
SignalMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.SignalFlux\">
SignalFlux</a>
</p>

</html>"));
    end ConstantFlux;

    model SignalFlux "Source of constant magnetic flux"
      extends Interfaces.PartialTwoPort;
      Modelica_SIunits.ComplexMagneticPotentialDifference V_m
        "Complex magnetic potential difference";
      Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
        "Magnitude of complex magnetic potential difference";
      Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
        "Argument of complex magnetic potential difference";

      Modelica_ComplexBlocks.Interfaces.ComplexInput Phi
        "Complex signal input of magnetic flux" annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
        "Magnitude of complex magnetic flux";
      Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
        "Argument of complex magnetic flux";
    equation
      // Flux into positive port
      port_p.V_m - port_n.V_m = V_m;
      // Magneto motive force
      port_p.Phi = Phi;
      // Local flux balance
      port_p.Phi + port_n.Phi = Complex(0, 0);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Ellipse(
                  extent={{-50,-50},{50,50}},
                  lineColor={255,170,85},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,0},{50,0}},
              color={255,170,85}),Line(points={{-50,0},{-100,0}}, color={255,
              170,85}),Line(points={{0,50},{0,-50}}, color={255,170,85}),
              Polygon(
                  points={{80,0},{60,6},{60,-6},{80,0}},
                  lineColor={255,170,85},
                  fillColor={255,170,85},
                  fillPattern=FillPattern.Solid),Line(points={{0,100},{0,50}},
              color={255,170,85}),Text(
                  extent={{0,-120},{0,-80}},
                  textString="%name",
                  lineColor={0,0,255})}), Documentation(info="<html>
<p>
Source of magnetic flux with complex signal input.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.ConstantMagneticPotentialDifference\">
ConstantMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.SignalMagneticPotentialDifference\">
SignalMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Sources.ConstantFlux\">
ConstantFlux</a>

</p>

</html>"));
    end SignalFlux;
  end Sources;

  package Sensors "Sensors to measure variables in magnetic networks"
    extends Modelica_Icons.SensorsPackage;
    model MagneticFluxSensor "Sensor to measure magnetic flux"
      extends Modelica_Icons.RotationalSensor;
      extends Interfaces.PartialTwoPort;
      Modelica_SIunits.ComplexMagneticPotentialDifference V_m
        "Complex magnetic potential difference";
      Modelica_ComplexBlocks.Interfaces.ComplexOutput Phi
        "Complex magnetic flux from por_ p to port_n as output signal"
        annotation (Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));
    equation
      // Flux into positive port
      port_p.V_m - port_n.V_m = V_m;
      // Magneto motive force
      port_p.Phi = Phi;
      // Local flux balance
      port_p.Phi + port_n.Phi = Complex(0, 0);
      // No magnetic potential difference at sensor
      V_m = Complex(0, 0);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
                  extent={{-29,-11},{30,-70}},
                  lineColor={0,0,0},
                  textString="Phi"),Line(points={{-72,0},{-90,0}}, color={0,0,0}),
              Text(
                  extent={{-140,120},{140,80}},
                  textString="%name",
                  lineColor={0,0,255}),Line(points={{70,0},{90,0}}, color={0,0,
              0}),Line(points={{0,-90},{0,-70}})}),
        Documentation(info="<html>
<p>Sensor for magnetic flux.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sensors.MagneticPotentialDifferenceSensor\">MagneticPotentialDifferenceSensor</a>
</p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end MagneticFluxSensor;

    model MagneticPotentialDifferenceSensor
      "Sensor to measure magnetic potential difference"
      extends Modelica_Icons.RotationalSensor;
      extends Interfaces.PartialTwoPort;
      Modelica_ComplexBlocks.Interfaces.ComplexOutput V_m
        "Complex magnetic potential difference between port_p and port_n as output signal"
        annotation (Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_SIunits.ComplexMagneticFlux Phi "Complex magnetic flux";
    equation
      // Flux into positive port
      port_p.V_m - port_n.V_m = V_m;
      // Magneto motive force
      port_p.Phi = Phi;
      // Local flux balance
      port_p.Phi + port_n.Phi = Complex(0, 0);
      // No magnetic flux through sensor
      Phi = Complex(0, 0);
      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
                  extent={{-52,1},{48,-57}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid,
                  textString="V_m"),Line(points={{-70,0},{-90,0}}, color={0,0,0}),
              Line(points={{70,0},{90,0}}, color={0,0,0}),Line(points={{0,-90},
              {0,-70}}),Text(
                  extent={{-140,120},{140,80}},
                  textString="%name",
                  lineColor={0,0,255})}), Documentation(info="<html>
<p>Sensor for magnetic potential difference.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sensors.MagneticFluxSensor\">MagneticFluxSensor</a>
</p></html>"));
    end MagneticPotentialDifferenceSensor;

    model MagneticPotentialSensor "Sensor to measure magnetic potential"
      extends Modelica_Icons.RotationalSensor;
      Modelica_ComplexBlocks.Interfaces.ComplexOutput V_m
        "Complex magnetic potential as output signal" annotation (Placement(
            transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Interfaces.PositiveMagneticPort port_p
        "Quasi static magnetic port of sensor"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    equation
      // No magnetic flux through sensor
      port_p.Phi = Complex(0, 0);
      // Magnetic potential
      V_m = port_p.V_m;
      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
                  extent={{-52,1},{48,-57}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid,
                  textString="V_m"),Line(points={{-70,0},{-90,0}}, color={0,0,0}),
              Line(points={{0,-90},{0,-70}}),Text(
                  extent={{-140,120},{140,80}},
                  textString="%name",
                  lineColor={0,0,255})}), Documentation(info="<html>
<p>Sensor for magnetic potential difference.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sensors.MagneticFluxSensor\">MagneticFluxSensor</a>
</p></html>"));
    end MagneticPotentialSensor;
    annotation (Documentation(info="<html>
<p>
This package provides sensors for the magnetic potential difference and the magnetic flux in magnetic circuit.
</p>
</html>"));
  end Sensors;

  package Interfaces "Interfaces"
    extends Modelica_Icons.InterfacesPackage;
    connector MagneticPort "Basic quasi static magnet connector"
      Modelica_SIunits.ComplexMagneticPotential V_m
        "Complex magnetic potential at the node";
      flow Modelica_SIunits.ComplexMagneticFlux Phi
        "Complex magnetic flux flowing into the pin";
      annotation (Documentation(info="<html>
<p>Base definition of complex quasi static magnetic port. The potential variable is the complex magnetic potential difference <code>V_m</code> and the flow variable is the complex magnetic flux <code>Phi</code>.</p>
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>
</p>

</html>"));
    end MagneticPort;

    connector PositiveMagneticPort "Positive quasi static magnetic port"
      extends MagneticPort;
      Modelica_Electrical_QuasiStationary.Types.Reference reference "Reference";
      annotation (
        defaultComponentName="port_p",
        Diagram(graphics={Text(
                  extent={{-100,100},{100,60}},
                  lineColor={255,170,85},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                  textString="%name"),Ellipse(
                  extent={{-40,40},{40,-40}},
                  lineColor={255,170,85},
                  fillColor={255,170,85},
                  fillPattern=FillPattern.Solid)}),
        Icon(graphics={Ellipse(
                  extent={{-100,100},{100,-100}},
                  lineColor={255,170,85},
                  fillColor={255,170,85},
                  fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>

<p>
The positive port is based on
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.MagneticPort\">MagneticPort</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angluar velocity of the quasi static voltage and current. The symbol is also designed such way to look different than the
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.MagneticPort\">MagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>
</p>
</html>"));
    end PositiveMagneticPort;

    connector NegativeMagneticPort "Negative quasi static magnetic port"
      extends MagneticPort;
      Modelica_Electrical_QuasiStationary.Types.Reference reference "Reference";
      annotation (
        defaultComponentName="port_n",
        Diagram(graphics={Text(
                  extent={{-100,100},{100,60}},
                  lineColor={255,170,85},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                  textString="%name"),Ellipse(
                  extent={{-40,40},{40,-40}},
                  lineColor={255,170,85},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
        Icon(graphics={Ellipse(
                  extent={{-100,100},{100,-100}},
                  lineColor={255,170,85},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>

<p>
The negative pin is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angluar velocity of the quasi static voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive pin</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.MagneticPort\">MagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>
</p>
</html>"));
    end NegativeMagneticPort;

    partial model PartialTwoPort "Partial two port for graphical programming"
      Modelica_SIunits.AngularVelocity omega=der(port_p.reference.gamma);
      PositiveMagneticPort port_p "Positive quasi static magnetic port"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      NegativeMagneticPort port_n "Negative quasi static magnetic port"
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
    equation
      Connections.branch(port_p.reference, port_n.reference);
      port_p.reference.gamma = port_n.reference.gamma;
      annotation (
        Documentation(info="<html>
<p>
The partial two port model consists of a positive and a negative magnetic port. The reference angles of the two ports are set equal and connected through <code>Connections.branch</code>.
</p>
</html>"),
        Icon(graphics),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end PartialTwoPort;

    partial model PartialTwoPortExtended
      "Partial two port for graphical programming with additonal variables"
      extends
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Interfaces.PartialTwoPort;

      Modelica_SIunits.ComplexMagneticPotentialDifference V_m = port_p.V_m - port_n.V_m
        "Complex magnetic potential difference";
      Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
        "Magnitude of complex magnetic potential difference";
      Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
        "Argument of complex magnetic potential difference";
      Modelica_SIunits.ComplexMagneticFlux Phi = port_p.Phi
        "Complex magnetic flux";
      Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
        "Magnitude of complex magnetic flux";
      Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
        "Argument of complex magnetic flux";

      annotation (
        Documentation(info="<html>
<p>
The partial two port model consists of a positive and a negative magnetic port. The reference angles of the two ports are set equal and connected through <code>Connections.branch</code>.
</p>
<p>
This interface model contains an extended set of (output) variables compared to
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave.Interfaces.PartialTwoPort\">PartialTwoPort</a>.
</p>
</html>"),
        Icon(graphics),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end PartialTwoPortExtended;

    partial model PartialTwoPortElementary
      "Elementary partial two port for textual programming"
      extends PartialTwoPort;
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
      V_m = port_p.V_m - port_n.V_m;
      Phi = port_p.Phi;
      port_p.Phi + port_n.Phi = Complex(0, 0);
      annotation (
        Documentation(info="<html>
<p>
The partial two port elementary model extends from the partial two port model and adds one equation considering the balance of flow variables, <code>port_p.Phi + port_n.Phi = Complex(0,0)</code>. Additionally, a variable for magnetic potential difference of the two magnetic ports, <code>V_m</code>, and the flux into the positive port, <code>Phi</code>, are defined.
</p>
</html>"),
        Icon(graphics),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end PartialTwoPortElementary;

    partial model PartialBasicMachine
      "Partial model for quasi static multi phase machines"
      extends
        Modelica_Electrical_Machines.Icons.QuasiStaticFundamentalWaveMachine;
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
      parameter Modelica_Magnetic_FundamentalWave.Types.SalientInductance L0(d(
            start=1), q(start=1)) "Salient inductance of an unchorded coil"
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
      output Modelica_SIunits.Angle gammas(start=0) = airGap.gammas
        "Angle of stator reference frame";
      output Modelica_SIunits.Angle gammar(start=0) = airGap.gammar
        "Angle of stator reference frame";
      output Modelica_SIunits.Angle gamma(start=0) = airGap.gamma
        "Electrical angle between stator and rotor";
      // Mechanical quantities
      output Modelica_SIunits.Angle phiMechanical=flange.phi - internalSupport.phi
        "Mechanical angle of rotor against stator";
      output Modelica_SIunits.AngularVelocity wMechanical(
        start=0,
        displayUnit="1/min") = der(phiMechanical)
        "Mechanical angular velocity of rotor against stator";
      output Modelica_SIunits.Torque tauElectrical=inertiaRotor.flange_a.tau
        "Electromagnetic torque";
      output Modelica_SIunits.Torque tauShaft=-flange.tau "Shaft torque";
      replaceable output
        Modelica_Electrical_Machines.Interfaces.InductionMachines.PartialPowerBalanceInductionMachines
        powerBalance(
        final powerStator=
            Modelica_Electrical_QuasiStationary.MultiPhase.Functions.activePower(
                                                                        vs, is),
        final powerMechanical=wMechanical*tauShaft,
        final powerInertiaStator=inertiaStator.J*inertiaStator.a*inertiaStator.w,
        final powerInertiaRotor=inertiaRotor.J*inertiaRotor.a*inertiaRotor.w,
        final lossPowerStatorWinding=sum(stator.resistor.resistor.LossPower),
        final lossPowerStatorCore=stator.core.lossPower,
        final lossPowerStrayLoad=strayLoad.lossPower,
        final lossPowerFriction=friction.lossPower) "Power balance";

      // Stator voltages and currents
      output Modelica_SIunits.ComplexVoltage vs[m]=plug_sp.pin.v - plug_sn.pin.v
        "Complex stator voltage";
      Modelica_SIunits.Voltage abs_vs[m] = Modelica_ComplexMath.'abs'(vs)
        "Magnitude of complex stator voltage";
      Modelica_SIunits.Angle arg_vs[m] = Modelica_ComplexMath.arg(vs)
        "Argument of complex stator voltage";

      output Modelica_SIunits.ComplexCurrent is[m]=plug_sp.pin.i
        "Complex stator current";
      Modelica_SIunits.Current abs_is[m] = Modelica_ComplexMath.'abs'(is)
        "Magnitude of complex stator current";
      Modelica_SIunits.Angle arg_is[m] = Modelica_ComplexMath.arg(is)
        "Argument of complex stator current";

      Modelica_SIunits.ActivePower Ps[m] = {Modelica_ComplexMath.real(vs[k]*Modelica_ComplexMath.conj(is[k])) for k in 1:m}
        "Active stator power";
      Modelica_SIunits.ActivePower Ps_total = sum(Ps)
        "Total active stator power";
      Modelica_SIunits.ReactivePower Qs[m] = {Modelica_ComplexMath.imag(vs[k]*Modelica_ComplexMath.conj(is[k])) for k in 1:m}
        "Reactive stator power";
      Modelica_SIunits.ReactivePower Qs_total = sum(Qs)
        "Total reactive stator power";
      Modelica_SIunits.ApparentPower Ss[m] = {Modelica_ComplexMath.'abs'(vs[k]*Modelica_ComplexMath.conj(is[k])) for k in 1:m}
        "Magnitude of complex stator apparent power";
      Modelica_SIunits.ApparentPower Ss_total=sqrt(Ps_total^2+Qs_total^2)
        "Magntiude of total complex stator apparent power";
      Real pfs[m] = {cos(Modelica_ComplexMath.arg(Complex(Ps[k],Qs[k]))) for k in 1:m}
        "Stator power factor";

      Modelica_Mechanics_Rotational.Interfaces.Flange_a flange "Shaft"
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia inertiaRotor(final J=Jr)
        annotation (Placement(transformation(
            origin={80,0},
            extent={{10,10},{-10,-10}},
            rotation=180)));
      Modelica_Mechanics_Rotational.Interfaces.Flange_a support if useSupport
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
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
        plug_sp(final m=m) "Positive plug of stator" annotation (Placement(
            transformation(extent={{50,90},{70,110}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
        plug_sn(final m=m) "Negative plug of stator" annotation (Placement(
            transformation(extent={{-70,90},{-50,110}}, rotation=0)));
      BasicMachines.Components.SymmetricMultiPhaseWinding stator(
        final useHeatPort=true,
        final m=m,
        final RRef=Rs,
        final TRef=TsRef,
        final Lsigma=Lssigma,
        final effectiveTurns=effectiveStatorTurns,
        final TOperational=TsOperational,
        final GcRef=statorCoreParameters.GcRef,
        final alpha20=alpha20s)
        "Symmetric stator winding including resistances, zero and stray inductances and core losses"
        annotation (Placement(transformation(
            origin={0,40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      replaceable
        Modelica_Electrical_Machines.Interfaces.InductionMachines.PartialThermalAmbientInductionMachines
        thermalAmbient(
        final useTemperatureInputs=false,
        final Ts=TsOperational,
        final m=m) if not useThermalPort annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-70,-90})));
      replaceable
        Modelica_Electrical_Machines.Interfaces.InductionMachines.PartialThermalPortInductionMachines
        thermalPort(final m=m) if useThermalPort
        "Thermal port of induction machines"
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
      Components.Ground groundS "Ground of stator magnetic circuit" annotation (
         Placement(transformation(extent={{-38,30},{-18,10}}, rotation=0)));
      BasicMachines.Components.RotorSaliencyAirGap airGap(final p=p, final L0=
            L0) annotation (Placement(transformation(
            origin={0,0},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Components.Ground groundR "Ground of rotor magnetic circuit" annotation (
          Placement(transformation(extent={{-40,-30},{-20,-10}}, rotation=0)));
      Losses.StrayLoad strayLoad(
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
        Modelica_Electrical_Machines.Interfaces.InductionMachines.PartialThermalPortInductionMachines
        internalThermalPort(final m=m)
        annotation (Placement(transformation(extent={{-44,-94},{-36,-86}})));
      Modelica_Mechanics_Rotational.Interfaces.Support internalSupport
        annotation (Placement(transformation(extent={{56,-104},{64,-96}},
              rotation=0)));
    initial algorithm
      assert(not Modelica_Math.isPowerOf2(m), String(m) +
        " phases are currently not supported in this version of FundametalWave");

    equation
      connect(stator.plug_n, plug_sn) annotation (Line(
          points={{-10,50},{-10,70},{-60,70},{-60,100}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(thermalPort, internalThermalPort) annotation (Line(
          points={{0,-100},{0,-90},{-40,-90}},
          color={199,0,0},
          smooth=Smooth.None));
      connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
          points={{-60,-90},{-40,-90}},
          color={199,0,0},
          smooth=Smooth.None));
      connect(inertiaRotor.flange_b, flange)
        annotation (Line(points={{90,0},{100,0},{100,0}}, color={0,0,0}));
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
          points={{10,0},{25,0},{25,0},{40,0},{40,0},{70,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(airGap.support, internalSupport) annotation (Line(
          points={{-10,0},{-50,0},{-50,-70},{60,-70},{60,-100}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(groundR.port_p, airGap.port_rn) annotation (Line(points={{-30,-10},
              {-30,-10},{-10,-10}}, color={255,128,0}));
      connect(stator.plug_p, strayLoad.plug_n) annotation (Line(
          points={{10,50},{10,70},{40,70}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(plug_sp, strayLoad.plug_p) annotation (Line(
          points={{60,100},{60,94},{60,94},{60,86},{60,86},{60,70}},
          color={85,170,255},
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
          points={{-28,10},{-10,10}},
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
            Line(points={{-50,100},{-20,100},{-20,70}}, color={85,170,255}),
            Line(points={{50,100},{20,100},{20,70}}, color={85,170,255}),
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
              smooth=Smooth.None)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end PartialBasicMachine;
  end Interfaces;

  package Utilities "Utilities for quasi static fundamental wave machines"
    extends Modelica_Icons.Package;
    block VfController "Voltage-Frequency-Controller"
      constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
      parameter Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Angle orientation[m]=-
          Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m)
        "Orientation of phases";
      parameter Modelica_SIunits.Voltage VNominal
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal "Nominal frequency";
      parameter Modelica_SIunits.Angle BasePhase=0 "Common phase shift";
      output Modelica_SIunits.Voltage amplitude;
      Modelica_ComplexBlocks.Interfaces.ComplexOutput y[m]
        "Complex quasi static voltages (RMS)" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}), iconTransformation(
              extent={{100,-10},{120,10}})));
      Modelica_Blocks.Interfaces.RealInput u "Frequency input (Hz)"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    equation
      //amplitude = VNominal*min(abs(u)/fNominal, 1);
      amplitude = VNominal*(if abs(u) < fNominal then abs(u)/fNominal else 1);
      y = Modelica_ComplexMath.fromPolar(fill(amplitude, m), orientation + fill(
        BasePhase - pi/2, m));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{-100,-100},{0,60},
              {80,60}}, color={0,0,255}),Line(
                  points={{-70,0},{-60.2,29.9},{-53.8,46.5},{-48.2,58.1},{-43.3,
                65.2},{-38.3,69.2},{-33.4,69.8},{-28.5,67},{-23.6,61},{-18.6,52},
                {-13,38.6},{-5.98,18.6},{8.79,-26.9},{15.1,-44},{20.8,-56.2},{
                25.7,-64},{30.6,-68.6},{35.5,-70},{40.5,-67.9},{45.4,-62.5},{
                50.3,-54.1},{55.9,-41.3},{63,-21.7},{70,0}},
                  color={192,192,192},
                  smooth=Smooth.Bezier),Line(
                  points={{-40,0},{-30.2,29.9},{-23.8,46.5},{-18.2,58.1},{-13.3,
                65.2},{-8.3,69.2},{-3.4,69.8},{1.5,67},{6.4,61},{11.4,52},{17,
                38.6},{24.02,18.6},{38.79,-26.9},{45.1,-44},{50.8,-56.2},{55.7,
                -64},{60.6,-68.6},{65.5,-70},{70.5,-67.9},{75.4,-62.5},{80.3,-54.1},
                {85.9,-41.3},{93,-21.7},{100,0}},
                  color={192,192,192},
                  smooth=Smooth.Bezier),Line(
                  points={{-100,0},{-90.2,29.9},{-83.8,46.5},{-78.2,58.1},{-73.3,
                65.2},{-68.3,69.2},{-63.4,69.8},{-58.5,67},{-53.6,61},{-48.6,52},
                {-43,38.6},{-35.98,18.6},{-21.21,-26.9},{-14.9,-44},{-9.2,-56.2},
                {-4.3,-64},{0.6,-68.6},{5.5,-70},{10.5,-67.9},{15.4,-62.5},{
                20.3,-54.1},{25.9,-41.3},{33,-21.7},{40,0}},
                  color={192,192,192},
                  smooth=Smooth.Bezier),Text(
                  extent={{-150,150},{150,110}},
                  textString="%name",
                  lineColor={0,0,255})}),
        Documentation(info="<HTML>
<p>
This is a simple voltage-frequency-controller. The amplitude of the voltage is linear dependent (<code>VNominal/fNominal</code>) on the frequency (input signal <code>u</code>), but limited by <code>VNominal</code> (nominal RMS voltage per phase). An
<code>m</code> quasi static phasor signal is proivded as output signal <code>y</code>, representing complex voltages.
The output voltages may serve as inputs for complex voltage sources with phase input. Symmetrical voltages are assumed.
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><b>Fig. 1:</b> Voltage vs. frequency of voltage frequency controller</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/QuasiStatic/FundamentalWave/Utilities/VoltageFrequencyController.png\"/>
    </td>
  </tr>
</table>

</HTML>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end VfController;

    model TerminalBox "Terminal box Y/D-connection"
      parameter Integer m(min=1) = 3 "Number of phases";
      parameter String terminalConnection(start="Y") "Choose Y=star/D=delta"
        annotation (choices(choice="Y" "Star connection", choice="D"
            "Delta connection"));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
        plug_sp(final m=m) "To positive stator plug" annotation (Placement(
            transformation(extent={{50,-90},{70,-110}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
        plug_sn(final m=m) "To negative stator plug" annotation (Placement(
            transformation(extent={{-70,-90},{-50,-110}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star(final m=m) if
           (terminalConnection <> "D") annotation (Placement(transformation(
            origin={-70,-80},
            extent={{-10,10},{10,-10}},
            rotation=180)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Delta delta(final m=m) if
           (terminalConnection == "D") annotation (Placement(transformation(
              extent={{-20,-70},{-40,-50}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
        plugSupply(final m=m) "To grid" annotation (Placement(transformation(
              extent={{-10,-70},{10,-90}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.NegativePin starpoint if (
        terminalConnection <> "D") annotation (Placement(transformation(
              extent={{-100,-90},{-80,-70}}, rotation=0)));
    equation
      connect(star.plug_p, plug_sn) annotation (Line(
          points={{-60,-80},{-60,-100}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(delta.plug_n, plug_sn) annotation (Line(
          points={{-40,-60},{-40,-100},{-60,-100}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(delta.plug_p, plug_sp) annotation (Line(
          points={{-20,-60},{60,-60},{60,-100}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(plugSupply, plug_sp) annotation (Line(
          points={{0,-80},{0,-100},{60,-100}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(star.pin_n, starpoint) annotation (Line(
          points={{-80,-80},{-90,-80}},
          color={85,170,255},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Text(
                  extent={{-40,-90},{40,-130}},
                  lineColor={0,0,0},
                  textString="%terminalConnection"),Polygon(
                  points={{-80,-80},{-80,-84},{-80,-120},{-40,-140},{40,-140},{
                80,-110},{80,-84},{76,-80},{-80,-80}},
                  lineColor={95,95,95},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
TerminalBox: at the bottom connected to both machine plugs, connect at the top to the grid as usual,<br>
choosing Y-connection (StarDelta=Y) or D-connection (StarDelta=D).
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end TerminalBox;

    model MultiTerminalBox "Terminal box Y/D-connection"
      parameter Integer m(min=1) = 3 "number of phases";
      final parameter Integer mSystems=
          Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
                                                                       m);
      final parameter Integer mBasic=integer(m/mSystems);
      parameter String terminalConnection(start="Y") "Choose Y=star/D=delta"
        annotation (choices(choice="Y" "Star connection", choice="D"
            "Delta connection"));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
        plug_sp(final m=m) "To positive stator plug" annotation (Placement(
            transformation(extent={{50,-90},{70,-110}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
        plug_sn(final m=m) "To negative stator plug" annotation (Placement(
            transformation(extent={{-70,-90},{-50,-110}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.MultiStar multiStar(final m=m) if
           (terminalConnection <> "D") annotation (Placement(transformation(
            origin={-70,-80},
            extent={{-10,10},{10,-10}},
            rotation=180)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.MultiDelta multiDelta(final m=m) if
           (terminalConnection == "D") annotation (Placement(transformation(
              extent={{-20,-70},{-40,-50}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
        plugSupply(final m=m) "To grid" annotation (Placement(transformation(
              extent={{-10,-70},{10,-90}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
        starpoint(final m=mSystems) if (terminalConnection <> "D") annotation (
          Placement(transformation(extent={{-100,-90},{-80,-70}}, rotation=0)));
    equation
      connect(multiStar.plug_p, plug_sn) annotation (Line(
          points={{-60,-80},{-60,-100}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(starpoint, multiStar.starpoints) annotation (Line(
          points={{-90,-80},{-80,-80}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(multiDelta.plug_n, plug_sn) annotation (Line(
          points={{-40,-60},{-40,-100},{-60,-100}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(multiDelta.plug_p, plug_sp) annotation (Line(
          points={{-20,-60},{60,-60},{60,-100}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(plugSupply, plug_sp) annotation (Line(
          points={{0,-80},{0,-100},{60,-100}},
          color={85,170,255},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
              points={{-74,-80},{-80,-86},{-80,-120},{-40,-140},{40,-140},{80,-110},
                  {80,-84},{76,-80},{-74,-80}},
              lineColor={95,95,95},
              fillColor={135,135,135},
              fillPattern=FillPattern.CrossDiag), Text(
              extent={{-40,-90},{40,-130}},
              lineColor={0,0,0},
              textString="%terminalConnection")}),
        Documentation(info="<html>
TerminalBox: at the bottom connected to both machine plugs, connect at the top to the grid as usual,<br>
choosing Y-connection (StarDelta=Y) or D-connection (StarDelta=D).
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end MultiTerminalBox;

    model SwitchedRheostat "Rheostat which is shortened after a given time"
      parameter Integer m=3 "Number of phases";
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
        plug_p(final m=m) "To positive rotor plug" annotation (Placement(
            transformation(extent={{90,70},{110,50}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
        plug_n(final m=m) "To negative rotor plug" annotation (Placement(
            transformation(extent={{90,-50},{110,-70}}, rotation=0)));
      parameter Modelica_SIunits.Resistance RStart "Starting resistance";
      parameter Modelica_SIunits.Time tStart
        "Duration of switching on the starting resistor";
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star(final m=m)
        annotation (Placement(transformation(extent={{-40,-70},{-60,-50}},
              rotation=0)));
      Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground
        annotation (Placement(transformation(
            origin={-80,-60},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Ideal.IdealCommutingSwitch
        idealCommutingSwitch(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(
            origin={40,20},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor rheostat(
          final m=m, R_ref=fill(RStart, m)) annotation (Placement(
            transformation(extent={{0,-30},{-20,-10}}, rotation=0)));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starRheostat(
          final m=m) annotation (Placement(transformation(extent={{-40,-30},{-60,
                -10}}, rotation=0)));
      Modelica_Blocks.Sources.BooleanStep booleanStep[m](final startTime=fill(
            tStart, m), final startValue=fill(false, m)) annotation (Placement(
            transformation(extent={{-60,10},{-40,30}}, rotation=0)));
    equation
      connect(booleanStep.y, idealCommutingSwitch.control) annotation (Line(
          points={{-39,20},{32,20}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(idealCommutingSwitch.plug_p, plug_p) annotation (Line(
          points={{40,30},{40,60},{100,60}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(idealCommutingSwitch.plug_n1, rheostat.plug_p) annotation (Line(
          points={{35,10},{35,-20},{0,-20}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(rheostat.plug_n, starRheostat.plug_p) annotation (Line(
          points={{-20,-20},{-40,-20}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(starRheostat.pin_n, ground.pin) annotation (Line(
          points={{-60,-20},{-60,-60},{-70,-60}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(ground.pin, star.pin_n) annotation (Line(
          points={{-70,-60},{-60,-60}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(star.plug_p, idealCommutingSwitch.plug_n2) annotation (Line(
          points={{-40,-60},{40,-60},{40,10}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(plug_n, idealCommutingSwitch.plug_n2) annotation (Line(
          points={{100,-60},{40,-60},{40,10}},
          color={85,170,255},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
                  extent={{26,40},{54,-40}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,60},{-40,60},
              {-40,40}}, color={0,0,255}),Line(points={{100,-60},{-40,-60},{-40,
              -40}}, color={0,0,255}),Ellipse(extent={{-44,40},{-36,32}},
              lineColor={0,0,255}),Ellipse(extent={{-44,-32},{-36,-40}},
              lineColor={0,0,255}),Line(points={{-80,40},{-42,-34}}, color={0,0,
              255}),Line(points={{40,40},{40,42},{40,60}}, color={0,0,255}),
              Line(points={{40,-40},{40,-60}}, color={0,0,255}),Line(points={{
              10,-80},{70,-80}}, color={0,0,255}),Line(points={{40,-60},{40,-80}},
              color={0,0,255}),Line(points={{20,-90},{60,-90}}, color={0,0,255}),
              Line(points={{30,-100},{50,-100}}, color={0,0,255})}),
        Documentation(info="<HTML>
<p>Switched rheostat, used for starting induction motors with slipring rotor:</p>
<p>The external rotor resistance <code>RStart</code> is shortened at time <code>tStart</code>.</p>
</HTML>"),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics));
    end SwitchedRheostat;

    model CurrentController "Current controller"
      parameter Integer m=3 "Number of phases";
      parameter Integer p "Number of pole pairs";
      parameter Modelica_SIunits.Angle gamma0=0
        "Offset added to electrical rotor angle";
      Modelica_Blocks.Interfaces.RealInput id_rms annotation (Placement(
            transformation(extent={{-140,40},{-100,80}}, rotation=0)));
      Modelica_Blocks.Interfaces.RealInput iq_rms annotation (Placement(
            transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
      Modelica_Blocks.Interfaces.RealInput phi annotation (Placement(
            transformation(
            origin={0,-120},
            extent={{20,-20},{-20,20}},
            rotation=270)));
      Modelica_Blocks.Math.Gain toGamma(k=p) annotation (Placement(
            transformation(
            origin={0,-70},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_ComplexBlocks.Interfaces.ComplexOutput I[m]
        "Multi phase current phasors"
        annotation (Placement(transformation(extent={{100,30},{120,50}})));
      Modelica_Blocks.Interfaces.RealOutput gamma "Reference angle of source"
        annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Blocks.SingleToMultiPhase
        singleToMultiPhase(final m=m)
        annotation (Placement(transformation(extent={{20,30},{40,50}})));
      Modelica_ComplexBlocks.ComplexMath.RealToComplex realToComplex
        annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
      Modelica_Blocks.Math.Add add
        annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
      Modelica_Blocks.Sources.Constant const(final k=gamma0) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={30,-70})));
    equation
      connect(phi, toGamma.u)
        annotation (Line(points={{0,-120},{0,-82}}, color={0,0,127}));
      connect(singleToMultiPhase.y, I) annotation (Line(
          points={{41,40},{110,40}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(toGamma.y, add.u1) annotation (Line(
          points={{0,-59},{0,-34},{38,-34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add.u2) annotation (Line(
          points={{30,-59},{30,-46},{38,-46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, gamma) annotation (Line(
          points={{61,-40},{110,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(id_rms, realToComplex.re) annotation (Line(
          points={{-120,60},{-60,60},{-60,46},{-42,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(iq_rms, realToComplex.im) annotation (Line(
          points={{-120,-60},{-60,-60},{-60,34},{-42,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realToComplex.y, singleToMultiPhase.u) annotation (Line(
          points={{-19,40},{18,40}},
          color={85,170,255},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,60},{20,40}},
              lineColor={0,0,255},
              textString="id_rms"),
            Text(
              extent={{-100,-40},{20,-60}},
              lineColor={0,0,255},
              textString="iq_rms")}),
        Documentation(info="<html>
<p>
This is a simple current controller.
The desired RMS values of d  and q component of the quasi static space phasor current in rotor fixed coordinate system are the inputs <code>id_rms</code> and <code>iq_rms</code>.
Using the given rotor position input <code>phi</code>, the quasi static <code>m</code> phase output currents <code>i[m]</code> are calculated.
The model output can be used to feed a quasi static current source with phase input to supply synchronous machines.
</p>
</HTML>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end CurrentController;
  end Utilities;
  annotation (Documentation(info="<html>
<p>
Copyright &copy; 2013-2014, <a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.Contact\">Christian Kral</a> and
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.Contact\">Anton Haumer</a>
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>"), uses(
      Complex(version="3.2.2"),
      Modelica_ComplexBlocks(version="3.2.2")));
end Modelica_Magnetic_QuasiStatic_FundamentalWave;
