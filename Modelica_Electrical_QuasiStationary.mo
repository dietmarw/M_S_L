within ;
package Modelica_Electrical_QuasiStationary
  "Library for quasi-stationary electrical singlephase and multiphase AC simulation"

extends Modelica_Icons.Package;

  package UsersGuide "User's guide"
    extends Modelica_Icons.Information;

    package Overview "Overview"
      extends Modelica_Icons.Information;

      class Introduction "Introduction to phasors"
        extends Modelica_Icons.Information;

        annotation (Documentation(info="<html>

<p>
The purely sinusoidal voltage
</p>

<p>
<IMG
 BORDER=\"0\"
 src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Introduction/img1.png\"
 ALT=\"v=\\sqrt{2}V_{\\mathrm{RMS}}\\cos(\\omega t+\\varphi_{v})\">
</p>

<p>
in the time domain can be represented by a complex
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Glossar\">rms</a> phasor
</p>

<p>
<IMG
 BORDER=\"0\"
 src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Introduction/img2.png\"
 ALT=\"\\underline{v}=V_{\\mathrm{RMS}}e^{j\\varphi_{v}}.\">
</p>

<p>For these quasi stationary
phasor the following relationship applies:</p>

<p>
<IMG
 BORDER=\"0\"
 src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Introduction/img3.png\"
 ALT=\"\\begin{displaymath}
v=\\mathrm{Re}(\\sqrt{2}\\underline{v}e^{j\\omega t})\\end{displaymath}\">
</p>

<p>
This equation is also illustrated in Fig. 1.
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Introduction/phasor_voltage.png\"
           alt=\"phasor_voltage.png\">
    </td>
  </tr>
  <caption align=\"bottom\">Fig. 1: Relationship between voltage phasor and time domain voltage</caption>
</table>

<p>
From the above equation it is obvious that for <i>t</i> = 0
the time domain voltage is <i>v</i> = cos(<i>&phi;<sub>v</sub></i>).
The complex representation of the phasor corresponds with this instance, too, since
the phasor is leading the real axis by the angle <i>&phi;<sub>v</sub></i>.
</p>

<p>
The explanation given for sinusoidal voltages can certainly also be applied
to sinusoidal currents.</p>

<h4>See also</h4>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.ACCircuit\">
          AC circuit</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.Power\">
          Power</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.ReferenceSystem\">
          Reference system</a>

</html>"));
      end Introduction;

      class ACCircuit "AC circuit"
        extends Modelica_Icons.Information;

        annotation (Documentation(info="<html>
<p>
A simple
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Examples.SeriesResonance\">
          example</a> of a series connection of a resistor, an inductor and a capacitor
as depicted in Fig. 1 should be explained in the following. For various frequencies,
the voltage drops across the resistor, the inductor and the capacitor should be determined.
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/ACCircuit/resonance_circuit.png\"
           alt=\"resonance_circuit.png\">
    </td>
  </tr>
  <caption align=\"bottom\">Fig. 1: Series AC circuit of a resistor and an inductor at variable frequency</caption>
</table>

<p>
The voltage drop across the resistor
</p>

<p>
<IMG
 BORDER=\"0\"
 src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/ACCircuit/img1.png\"
 ALT=\"
\\underline{v}_{r}=R\\underline{i}\">
</p>

<p>
and the inductor
</p>

<p>
<IMG
 BORDER=\"0\"
 src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/ACCircuit/img2.png\"
 ALT=\"
\\underline{v}_{l}=j\\omega L\\underline{i}\">
</p>

<p>
and the capacitor
</p>

<p>
<IMG
 BORDER=\"0\"
 src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/ACCircuit/img3.png\"
 ALT=\"
\\underline{v}_{l}=j\\omega L\\underline{i}\">
</p>

<p>
add up to the total voltage
</p>

<p>
<IMG
 BORDER=\"0\"
 src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/ACCircuit/img4.png\"
 ALT=\"
\\underline{v}=\\underline{v}_{r}+\\underline{v}_{l}\">
</p>

<p>
as illustrated in the phasor diagram of Fig. 2.
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/ACCircuit/phasor_diagram.png\"
           alt=\"phasor_diagram.png\">
    </td>
  </tr>
  <caption align=\"bottom\">Fig. 2: Phasor diagram of a resistor and inductance series connection</caption>
</table>

<p>Due to the series connection of the resistor, inductor and capacitor, the three currents are all equal:</p>

<p>
<IMG BORDER=\"0\"
 src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/ACCircuit/img5.png\"
 alt=\"img5.png\">
</p>

<h4>See also</h4>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.Introduction\">
          Introduction</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.Power\">
          Power</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.ReferenceSystem\">
          Reference system</a>

</html>"));
      end ACCircuit;

      class Power "Real and reactive power"
        extends Modelica_Icons.Information;

        annotation (Documentation(info="<html>

<p>For periodic waveforms, the average value of the instantaneous power is <b>real power</b> <i>P</i>.
<b>Reactive power</b> <i>Q</i> is a term
associated with inductors and capacitors. For pure inductors and capacitors, real power is equal to zero.
Yet, there is instantaneous power exchanged with connecting network.
</p>

The
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Examples.SeriesResonance\">
          series resonance circuit</a> which was also addressed in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.ACCircuit\">
          AC circuit</a>
will be investigated.

<h5>Power of a resistor</h5>

<p>
The instantaneous voltage and current are in phase:
</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/v_r.png\"
                   alt=\"v_r.png\"> <br>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/i_r.png\"
                   alt=\"i_r.png\">
</p>

<p>
Therefore, the instantaneous power is
</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/power_r.png\"
                   alt=\"power_r.png\">
</p>

<p>A graphical representation of these equations is depicted in Fig. 1</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/power_resistor.png\"
           alt=\"power_resistor.png\">
    </td>
  </tr>
  <caption align=\"bottom\">Fig. 1: Instantaneous voltage, current of power of a resistor</caption>
</table>

<p>Real power of the resistor is the average of instantaneous power:</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/p_r.png\"
                   alt=\"p_r.png\">
</p>

<h5>Power of an inductor</h5>

<p>
The instantaneous voltage leads the current by a quarter of the period:
</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/v_l.png\"
                   alt=\"v_l.png\"> <br>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/i_l.png\"
                   alt=\"i_l.png\">
</p>

<p>
Therefore, the instantaneous power is
</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/power_l.png\"
                   alt=\"power_l.png\">
</p>

<p>A graphical representation of these equations is depicted in Fig. 2</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/power_inductor.png\"
           alt=\"power_inductor.png\">
    </td>
  </tr>
  <caption align=\"bottom\">Fig. 2: Instantaneous voltage, current of power of an inductor</caption>
</table>

<p>Reactive power of the inductor is:</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/q_l.png\"
                   alt=\"q_l.png\">
</p>

<h5>Power of a capacitor</h5>

<p>
The instantaneous voltage lags the current by a quarter of the period:
</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/v_c.png\"
                   alt=\"v_c.png\"> <br>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/i_c.png\"
                   alt=\"i_c.png\">
</p>

<p>
Therefore, the instantaneous power is
</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/power_c.png\"
                   alt=\"power_c.png\">
</p>

<p>A graphical representation of these equations is depicted in Fig. 3</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/power_capacitor.png\"
           alt=\"power_capacitor.png\">
    </td>
  </tr>
  <caption align=\"bottom\">Fig. 3: Instantaneous voltage, current of power of a capacitor</caption>
</table>

<p>Reactive power of the capacitor is:</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/q_c.png\"
                   alt=\"q_c.png\">
</p>

<h5>Complex apparent power</h5>

<p>For an arbitrary component with two pins, real and reactive power can be determined by the complex phasors:</p>
<p>
<IMG BORDER=\"0\"  src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/UsersGuide/Overview/Power/s.png\"
                   alt=\"s.png\">
</p>

<p>
In this equation <sup>*</sup> represents the conjugate complex operator
</p>

<h4>See also</h4>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.Introduction\">
          Introduction</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.ACCircuit\">
          AC circuit</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.ReferenceSystem\">
          Reference system</a>
</html>"));
      end Power;

      class ReferenceSystem "Reference system"
        extends Modelica_Icons.Information;

        annotation (Documentation(info="<html>
<p>
The reference angle <code>gamma</code>:
</p>
<ul>
  <li>defines the angular frequency <code>omega</code> of the voltages and currents
      of a circuit by means of <code>omega = der(gamma)</code>. </li>
  <li>is not a global quantity since it propagated through the connector.
      Therefore, independent circuits of different frequencies can be modeled in one model.</li>
  <li>is present only once in a multiphase connector;
      a multiphase component has only one reference angle common to all phases.</li>
  <li>can be either constant or variable, but it has to be consistent in one contiguous circuit.</li>
  <li>is defined by the sources.</li>
</ul>
<p>
Designing new components, the guidelines of the Modelica Specification dealing with
Overconstrained Equation Operators for Connection Graphs have to be taken into account.
</p>

<h4>See also</h4>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.Introduction\">
          Introduction</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.ACCircuit\">
          AC circuit</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.Power\">
          Power</a>

</html>"));
      end ReferenceSystem;

      annotation (Documentation(info="<html>
<p>
The <a href=\"modelica://Modelica.Electrical.QuasiStationary\">Modelica.Electrical.QuasiStationary</a>
library addresses the analysis of electrical circuits with purely sinusoidal
voltages and currents. The main characteristics of the library are:
</p>

<ul>
  <li>Only pure sinusoidal voltages and currents are taken into account.
      Higher harmonic voltages and currents are not considered.</li>
  <li>Any electrical transient effects are neglected.</li>
  <li>The electrical components of this library are strictly linear.</li>
  <li>The angular frequency <code>omega</code> of the voltages and currents of
      a circuit are determined from a reference angle <code>gamma</code> by means of
      <code>omega = der(gamma)</code>. </li>
  <li>The reference angle <code>gamma</code> is not a global quantity
      since it propagated through the connector.
      Therefore, independent circuits of different frequencies can be modeled in one model.</li>
  <li>The connectors contain the real and the imaginary part of the voltage and the current
      <a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.Introduction\">RMS phasors</a></li>

</ul>

<p>
The main intention of this library is the modeling of quasi stationary behavior
of single and multi phase
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.Overview.ACCircuit\">AC circuits</a>
with fixed and variable frequency. Quasi stationary theory and applications can be
found in
[<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">Dorf1993</a>],
[<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">Burton1994</a>],
[<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">Landolt1936</a>],
[<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">Philippow1967</a>],
[<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">Weyh1967</a>],
[<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">Vaske1973</a>].
</p>

<h4>Note</h4>
<p>
A general electrical circuit can be a DC circuit, an AC circuit with periodic sinusoidal or non-sinusoidal voltages and currents
or a transient circuit without particular waveform of voltages and currents.
Therefore a coupling model between a quasi stationary circuit and a general (transient) electrical circuit
has to be designed carefully taking the specific application into account.
As an example, you may look at the <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Utilities.IdealACDCConverter\">
ideal AC DC converter</a>, which is used in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Examples.Rectifier\">rectifier example</a>.
</p>

</html>"));
    end Overview;

    class ReleaseNotes "Release notes"
      extends Modelica_Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<h5>Version 3.2.2, 2014-09-13</h5>
<ul>
<li>Added magnitude and argument of complex voltages and currents in interface models, see #1405</li>
<li>Added active, reactive and aparrent power and power factor in interface models, see #1405</li>
<li>Added complex single and multi phase impedance and admittance models (
    <a href=\"https://trac.modelica.org/Modelica/ticket/1367\">#1367</a>)</li>
<li>Updated documentation on temperature dependency of resistance and conductance models</li>
<li>Rewrote source models to simplify initialization (
    <a href=\"https://trac.modelica.org/Modelica/changeset/7031\">r7031</a>)</li>
<li>Implementation of ideal transformer model</li>
</ul>

<h5>Version 1.0.0</h5>
<ul><li>First official release</li></ul>
</html>",     revisions="<html>
</html>"));
    end ReleaseNotes;

    class References "References"
      extends Modelica_Icons.References;

      annotation (Documentation(info="<html>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <td valign=\"top\">[Dorf1993]</td>
      <td valign=\"top\">R. C. Dorf
        <i>The Electrical Engineering</i>,
        VDE, 1993.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Boas1966]</td>
      <td valign=\"top\">M. L. Boas
        <i>Mathematical Methods in the Physical Sciences</i>,
        J. Wiley &amp; Sons, New York, 1966.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Burton1994]</td>
      <td valign=\"top\">T. Burton
        <i>Introduction to Dynamic Systems Analysis</i>,
        McGraw Hill, New York, 1994.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Landolt1936]</td>
      <td valign=\"top\">M. Landolt
        <i>Komplexe Zahlen und Zeiger in der Wechselstromlehre</i>,
        Springer Verlag, Berlin, 1936</td>
    </tr>

    <tr>
      <td valign=\"top\">[Philippow1967]</td>
      <td valign=\"top\">E. Philippow
        <i>Grundlagen der Elektrotechnik</i>,
       Akademischer Verlag, Leipzig, 1967.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Weyh1967]</td>
      <td valign=\"top\">Weyh and Benzinger
        <i>Die Grundlagen der Wechselstromlehre</i>,
       R. Oldenbourg Verlag, 1967.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Vaske1973]</td>
      <td valign=\"top\">P. Vaske
        <i>Berechnung von Drehstromschaltungen</i>,
       B.G. Teubner Verlag, 1973.</td>
    </tr>

</table>

</html>"));
    end References;

    class Contact "Contact"
      extends Modelica_Icons.Contact;

      annotation (Documentation(info="<html>

<p>This package is developed an maintained by the following contributors</p>

  <table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th></th>
      <th>Name</th>
      <th>Affiliation</th>
    </tr>
    <tr>
      <td valign=\"top\">Library officer</td>
      <td valign=\"top\">
      <a href=\"mailto:a.haumer@haumer.at\">Anton Haumer</a>
      </td>
      <td valign=\"top\">
        <a href=\"http://www.haumer.at\">Technical Consulting &amp; Electrical Engineering</a><br>
        3423 St.Andrae-Woerdern<br>
        Austria
      </td>
    </tr>
    <tr>
      <td valign=\"top\">Library officer</td>
      <td valign=\"top\">
        <a href=\"mailto:dr.christian.kral@gmail.com\">Christian Kral</a>
      </td>
      <td valign=\"top\">
        <a href=\"http://christiankral.net\">Electric Machines, Drives and Systems</a><br>
        1060 Vienna<br>
        Austria
      </td>
    </tr>
  </table>

</html>"));
    end Contact;

    class Glossar "Glossar"
      extends Modelica_Icons.Information;

      annotation (Documentation(info="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Abbreviation</th>
    <th>Comment</th>
  </tr>
  <tr>
    <td>AC</td>
    <td>alternating current</td>
  </tr>
  <tr>
    <td>RMS</td>
    <td>root mean square</td>
  </tr>
</table>
</html>"));
    end Glossar;
    annotation (DocumentationClass=true, Documentation(info="<html>
</html>"));
  end UsersGuide;

  package SinglePhase "Single phase AC components"
    extends Modelica_Icons.Package;

    package Examples "Test examples"
      extends Modelica_Icons.ExamplesPackage;

      model SeriesResonance "Series resonance circuit"
        extends Modelica_Icons.Example;
        Modelica_Blocks.Sources.Constant V(k=1) annotation (Placement(
              transformation(
              origin={-40,50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Blocks.Sources.Constant phi(k=0) annotation (Placement(
              transformation(
              origin={-80,50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Blocks.Sources.Ramp f(
          height=2,
          duration=1,
          offset=1e-6) annotation (Placement(transformation(
              origin={-60,-50},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sources.VariableVoltageSource
          voltageSource(gamma(fixed=true, start=0)) annotation (Placement(
              transformation(
              origin={-30,-20},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Basic.Ground ground annotation (Placement(transformation(extent={{-40,-60},
                  {-20,-40}}, rotation=0)));
        Basic.Resistor resistor(R_ref=0.1) annotation (Placement(transformation(
                extent={{10,-10},{30,10}}, rotation=0)));
        Basic.Inductor inductor(L=1/(2*Modelica_Constants.pi)) annotation (
            Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
        Basic.Capacitor capacitor(C=1/(2*Modelica_Constants.pi)) annotation (
            Placement(transformation(extent={{70,-10},{90,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.CurrentSensor currentSensor
          annotation (Placement(transformation(extent={{-20,10},{0,-10}},
                rotation=0)));
        Modelica_ComplexBlocks.ComplexMath.PolarToComplex polarToComplex
          annotation (Placement(transformation(
              origin={-60,10},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_ComplexBlocks.ComplexMath.ComplexToPolar complexToPolar
          annotation (Placement(transformation(
              origin={-10,30},
              extent={{-10,-10},{10,10}},
              rotation=90)));
      equation
        connect(f.y, voltageSource.f) annotation (Line(points={{-60,-39},{-60,-24},
                {-40,-24}}, color={0,0,127}));
        connect(polarToComplex.y, voltageSource.V) annotation (Line(points={{-60,
                -1},{-60,-16},{-40,-16}}, color={85,170,255}));
        connect(ground.pin, voltageSource.pin_n) annotation (Line(points={{-30,-40},
                {-30,-35},{-30,-30}}, color={85,170,255}));
        connect(voltageSource.pin_p, currentSensor.pin_p) annotation (Line(points=
               {{-30,-10},{-30,0},{-20,0}}, color={85,170,255}));
        connect(currentSensor.pin_n, resistor.pin_p) annotation (Line(points={{0,
                0},{2.5,0},{5,0},{10,0}}, color={85,170,255}));
        connect(resistor.pin_n, inductor.pin_p) annotation (Line(points={{30,0},{
                32.5,0},{35,0},{40,0}}, color={85,170,255}));
        connect(inductor.pin_n, capacitor.pin_p) annotation (Line(points={{60,0},
                {62.5,0},{65,0},{70,0}}, color={85,170,255}));
        connect(capacitor.pin_n, ground.pin) annotation (Line(points={{90,0},{90,
                -40},{-30,-40}}, color={85,170,255}));
        connect(phi.y, polarToComplex.phi) annotation (Line(points={{-80,39},{-80,
                30},{-66,30},{-66,22}}, color={0,0,127}));
        connect(V.y, polarToComplex.len) annotation (Line(
            points={{-40,39},{-40,30},{-54,30},{-54,22}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(currentSensor.y, complexToPolar.u) annotation (Line(
            points={{-10,11},{-10,18}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Documentation(info="<html>
<p>
The frequency of the voltage source is varied by a ramp.
Plot length and angle of the current phasor, i.e., complexToPolar.len and .phi, versus time resp. frequency.
</p>
</html>"),   experiment(StopTime=1.0, Interval=0.001));
      end SeriesResonance;

      model ParallelResonance "Parallel resonance circuit"
        extends Modelica_Icons.Example;
        Modelica_Blocks.Sources.Constant I(k=1) annotation (Placement(
              transformation(
              origin={-80,-50},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Blocks.Sources.Constant phi(k=0) annotation (Placement(
              transformation(
              origin={-40,-50},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Blocks.Sources.Ramp f(
          height=2,
          duration=1,
          offset=1e-6) annotation (Placement(transformation(
              origin={-60,50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sources.VariableCurrentSource
          currentSource(gamma(fixed=true, start=0)) annotation (Placement(
              transformation(
              origin={-30,20},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Basic.Ground ground annotation (Placement(transformation(extent={{-40,-20},
                  {-20,0}}, rotation=0)));
        Basic.Resistor resistor(R_ref=10) annotation (Placement(transformation(
              origin={-10,20},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Basic.Inductor inductor(L=1/(2*Modelica_Constants.pi)) annotation (
            Placement(transformation(
              origin={10,20},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Basic.Capacitor capacitor(C=1/(2*Modelica_Constants.pi)) annotation (
            Placement(transformation(
              origin={30,20},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.VoltageSensor voltageSensor
          annotation (Placement(transformation(
              origin={50,20},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Modelica_ComplexBlocks.ComplexMath.PolarToComplex polarToComplex
          annotation (Placement(transformation(
              origin={-60,-10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_ComplexBlocks.ComplexMath.ComplexToPolar complexToPolar
          annotation (Placement(transformation(extent={{70,10},{90,30}}, rotation=
                 0)));
      equation
        connect(currentSource.pin_n, resistor.pin_p) annotation (Line(points={{-30,
                30},{-30,40},{-10,40},{-10,30}}, color={85,170,255}));
        connect(currentSource.pin_n, inductor.pin_p) annotation (Line(points={{-30,
                30},{-30,40},{10,40},{10,30}}, color={85,170,255}));
        connect(currentSource.pin_n, capacitor.pin_p) annotation (Line(points={{-30,
                30},{-30,40},{30,40},{30,30}}, color={85,170,255}));
        connect(currentSource.pin_n, voltageSensor.pin_p) annotation (Line(points=
               {{-30,30},{-30,40},{50,40},{50,30}}, color={85,170,255}));
        connect(currentSource.pin_p, ground.pin) annotation (Line(points={{-30,10},
                {-30,5},{-30,0}}, color={85,170,255}));
        connect(resistor.pin_n, ground.pin) annotation (Line(points={{-10,10},{-10,
                0},{-30,0}}, color={85,170,255}));
        connect(inductor.pin_n, ground.pin)
          annotation (Line(points={{10,10},{10,0},{-30,0}}, color={85,170,255}));
        connect(capacitor.pin_n, ground.pin)
          annotation (Line(points={{30,10},{30,0},{-30,0}}, color={85,170,255}));
        connect(voltageSensor.pin_n, ground.pin)
          annotation (Line(points={{50,10},{50,0},{-30,0}}, color={85,170,255}));
        connect(f.y, currentSource.f) annotation (Line(points={{-60,39},{-60,24},
                {-40,24}}, color={0,0,127}));
        connect(polarToComplex.y, currentSource.I) annotation (Line(points={{-60,
                1},{-60,16},{-40,16}}, color={85,170,255}));
        connect(phi.y, polarToComplex.phi) annotation (Line(points={{-40,-39},{-40,
                -32},{-54,-32},{-54,-22}},color={0,0,127}));
        connect(I.y, polarToComplex.len) annotation (Line(
            points={{-80,-39},{-80,-32},{-66,-32},{-66,-22}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(voltageSensor.y, complexToPolar.u) annotation (Line(
            points={{61,20},{68,20}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Documentation(info="<html>
<p>
The frequency of the current source is varied by a ramp.
Plot length and angle of the voltage phasor, i.e., complexToPolar.len and .phi, versus time resp. frequency.
</p>
</html>"),   experiment(StopTime=1.0, Interval=0.001));
      end ParallelResonance;

      model Rectifier "Rectifier example"
        extends Modelica_Icons.Example;
        import Modelica_Constants.pi;
        parameter Modelica_SIunits.Voltage VAC=100 "AC rms voltage";
        parameter Real conversionFactor=1
          "Ratio of DC voltage / AC rms voltage";
        Sources.VoltageSource voltageQS(
          f=50,
          V=VAC,
          phi=0,
          i(re(start=0), im(start=0)),
          gamma(fixed=true, start=0)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,50})));
        Basic.Resistor resistorQS(R_ref=50E-3)
          annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
        Sensors.CurrentSensor currentSensorQS
          annotation (Placement(transformation(extent={{-40,70},{-20,50}})));
        Modelica_ComplexBlocks.ComplexMath.ComplexToPolar iQS
          annotation (Placement(transformation(extent={{-20,70},{0,90}})));
        Basic.Ground groundQS
          annotation (Placement(transformation(extent={{-20,10},{0,30}})));
        Utilities.IdealACDCConverter rectifierQS(conversionFactor=
              conversionFactor)
          annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        Modelica_Electrical_Analog.Basic.Ground groundDC1
          annotation (Placement(transformation(extent={{0,10},{20,30}})));
        Modelica_Electrical_Analog.Sensors.CurrentSensor iDC1
          annotation (Placement(transformation(extent={{20,70},{40,50}})));
        Modelica_Electrical_Analog.Basic.VariableConductor load1 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,50})));
        Modelica_Electrical_Analog.Sources.SineVoltage voltageAC(
          V=sqrt(2)*VAC,
          freqHz=50,
          phase=pi/2) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={-80,-50})));
        Modelica_Electrical_Analog.Basic.Resistor resistorAC(R=50E-3)
          annotation (Placement(transformation(extent={{-70,-50},{-50,-30}})));
        Modelica_Electrical_Analog.Sensors.CurrentSensor currentSensorAC
          annotation (Placement(transformation(extent={{-40,-30},{-20,-50}})));
        Modelica_Blocks.Math.Harmonic iAC(f=50, k=1)
          annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
        Modelica_Electrical_Analog.Basic.Ground groundAC
          annotation (Placement(transformation(extent={{-20,-90},{0,-70}})));
        Utilities.GraetzRectifier rectifierAC
          annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
        Modelica_Electrical_Analog.Sensors.CurrentSensor currentSensorDC2
          annotation (Placement(transformation(extent={{20,-30},{40,-50}})));
        Modelica_Blocks.Math.RootMeanSquare iDC2(f=50)
          annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
        Modelica_Electrical_Analog.Basic.VariableConductor load2 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,-50})));
        Modelica_Blocks.Sources.Ramp ramp(
          height=1,
          duration=0.8,
          startTime=0.1)
          annotation (Placement(transformation(extent={{100,-10},{80,10}})));
      equation
        connect(voltageQS.pin_p, resistorQS.pin_p) annotation (Line(
            points={{-80,60},{-72,60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(voltageQS.pin_n, rectifierQS.pin_nQS) annotation (Line(
            points={{-80,40},{-10,40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(rectifierQS.pin_nQS, groundQS.pin) annotation (Line(
            points={{-10,40},{-10,30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(rectifierQS.pin_nDC, groundDC1.p) annotation (Line(
            points={{10,40},{10,30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(load1.n, rectifierQS.pin_nDC) annotation (Line(
            points={{50,40},{10,40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(voltageAC.p, resistorAC.p) annotation (Line(
            points={{-80,-40},{-70,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(voltageAC.n, rectifierAC.pin_nAC) annotation (Line(
            points={{-80,-60},{-10,-60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(rectifierAC.pin_nAC, groundAC.p) annotation (Line(
            points={{-10,-60},{-10,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(rectifierAC.pin_nDC, load2.n) annotation (Line(
            points={{10,-60},{50,-60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(ramp.y, load1.G) annotation (Line(
            points={{79,0},{70,0},{70,50},{61,50}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ramp.y, load2.G) annotation (Line(
            points={{79,0},{70,0},{70,-50},{61,-50}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(resistorQS.pin_n, currentSensorQS.pin_p) annotation (Line(
            points={{-52,60},{-40,60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorQS.pin_n, rectifierQS.pin_pQS) annotation (Line(
            points={{-20,60},{-10,60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorQS.y, iQS.u) annotation (Line(
            points={{-30,71},{-30,80},{-22,80}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(rectifierQS.pin_pDC, iDC1.p) annotation (Line(
            points={{10,60},{20,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(iDC1.n, load1.p) annotation (Line(
            points={{40,60},{50,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(resistorAC.n, currentSensorAC.p) annotation (Line(
            points={{-50,-40},{-40,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentSensorAC.n, rectifierAC.pin_pAC) annotation (Line(
            points={{-20,-40},{-10,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentSensorAC.i, iAC.u) annotation (Line(
            points={{-30,-30},{-30,-20},{-22,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(currentSensorDC2.i, iDC2.u) annotation (Line(
            points={{30,-30},{30,-20},{38,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(currentSensorDC2.p, rectifierAC.pin_pDC) annotation (Line(
            points={{20,-40},{10,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentSensorDC2.n, load2.p) annotation (Line(
            points={{40,-40},{50,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        annotation (Documentation(info="<html>
<p>
This example demonstrates coupling a quasi stationary circuit with a DC circuit.
The QS voltage is rectified (using an
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Utilities.IdealACDCConverter\">
ideal AC DC converter</a>), loaded by a variable load conductor.
The <i>conversionFactor = DC voltage / AC rms voltage</i> in this case is the root mean square of a rectified sine, i.e., 1.
You may compare the quasi stationary results with that of a fully transient model (using a
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Utilities.GraetzRectifier\">
Graetz rectifier</a>), plotting:
</p>
<ul>
<li>QS: AC rms           current = iQS.len</li>
<li>AC: AC instantaneous current = iAC.u</li>
<li>AC: AC rms           current = iAC.y_rms</li>
<li>QS: DC current               = iDC1.i</li>
<li>AC: DC instantaneous current = iDC2.u</li>
<li>AC: DC rms           current = iDC2.y</li>
</ul>
<p>
It can be seen that at the DC side the current is represented by its averaged value, at the AC side by its rms value.
</p>
<h4>Note</h4>
<p>
The quasi stationary model needs a grounding at the QS side as well as the DC side,
whereas the transient model may have only one ground since AC side and DC side are connected via the diodes.
</p>
</html>"),   experiment(StopTime=1.0, Interval=0.0001));
      end Rectifier;

      annotation (Documentation(info="<html>
Examples to demonstrate the usage of quasistationary electric components.
</html>"));
    end Examples;

    package Basic "Basic components for AC singlephase models"
      extends Modelica_Icons.Package;

      model Ground "Electrical ground"

        Interfaces.PositivePin pin annotation (Placement(transformation(extent={{
                  -10,90},{10,110}}, rotation=0)));
      equation
        Connections.potentialRoot(pin.reference, 256);
        if Connections.isRoot(pin.reference) then
          pin.reference.gamma = 0;
        end if;
        pin.v = Complex(0);
        annotation (Icon(graphics={
              Line(points={{-60,50},{60,50}}),
              Line(points={{-40,30},{40,30}}),
              Line(points={{-20,10},{20,10}}),
              Line(points={{0,90},{0,50}}),
              Text(
                extent={{100,-60},{-100,-20}},
                textString="%name",
                lineColor={0,0,255})}), Documentation(info="<html>
<p>
Ground of a single phase circuit. The potential at the ground node is zero.
Every electrical circuit, e.g., a series resonance
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Examples.SeriesResonance\">
          example</a>, has to contain at least one ground object.
</p>

</html>"));
      end Ground;

      model Resistor "Single phase linear resistor"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.conj;
        parameter Modelica_SIunits.Resistance R_ref(start=1)
          "Reference resistance at T_ref";
        parameter Modelica_SIunits.Temperature T_ref=293.15
          "Reference temperature";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref=0
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
        Modelica_SIunits.Resistance R_actual
          "Resistance = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
      equation
        assert((1 + alpha_ref*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
          "Temperature outside scope of model!");
        R_actual = R_ref*(1 + alpha_ref*(T_heatPort - T_ref));
        v = R_actual*i;
        LossPower = real(v*conj(i));
        annotation (Icon(graphics={
              Text(
                extent={{100,60},{-100,100}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{60,0},{90,0}}),
              Line(points={{-90,0},{-60,0}}),
              Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(extent={{100,-80},{-100,-40}}, textString="R=%R_ref")}),
            Documentation(info="<html>
<p>
The linear resistor connects the complex voltage <code><u>v</u></code> with the complex
current <code><u>i</u></code> by <code><u>i</u>*R = <u>v</u></code>.
The resistance <code>R</code> is allowed to be positive, zero, or negative.
</p>

<p>
The resistor model also has an optional
<a href=\"modelica://Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort\">conditional heat port</a>.
A linear temperature dependency of the resistance is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"));
      end Resistor;

      model Conductor "Single phase linear conductor"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.conj;
        parameter Modelica_SIunits.Conductance G_ref(start=1)
          "Reference conductance at T_ref";
        parameter Modelica_SIunits.Temperature T_ref=293.15
          "Reference temperature";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref=0
          "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
        Modelica_SIunits.Conductance G_actual
          "Conductance = G_ref/(1 + alpha_ref*(heatPort.T - T_ref))";
      equation
        assert((1 + alpha_ref*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
          "Temperature outside scope of model!");
        G_actual = G_ref/(1 + alpha_ref*(T_heatPort - T_ref));
        i = G_actual*v;
        LossPower = real(v*conj(i));
        annotation (Icon(graphics={
              Text(
                extent={{100,60},{-100,100}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{60,0},{90,0}}),
              Line(points={{-90,0},{-60,0}}),
              Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(extent={{100,-80},{-100,-40}}, textString="G=%G_ref")}),
            Documentation(info="<html>

<p>
The linear conductor connects the voltage <code><u>v</u></code> with the
current <code><u>i</u></code> by <code><u>i</u> = <u>v</u>*G</code>.
The conductance <code>G</code> is allowed to be positive, zero, or negative.
</p>

<p>
The conductor model also has an optional
<a href=\"modelica://Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort\">conditional heat port</a>.
A linear temperature dependency of the conductance is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"));
      end Conductor;

      model Capacitor "Single phase linear capacitor"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.j;
        parameter Modelica_SIunits.Capacitance C(start=1) "Capacitance";
      equation
        i = j*omega*C*v;
        annotation (Icon(graphics={
              Text(
                extent={{100,60},{-100,100}},
                textString="%name",
                lineColor={0,0,255}),
              Line(
                points={{-14,28},{-14,-28}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{14,28},{14,-28}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{-90,0},{-14,0}}),
              Line(points={{14,0},{90,0}}),
              Text(extent={{100,-80},{-100,-40}}, textString="C=%C")}),
            Documentation(info="<html>

<p>
The linear capacitor connects the voltage <code><u>v</u></code> with the
current <code><u>i</u></code> by <code><u>i</u> = j*&omega;*C*<u>v</u></code>.
The capacitance <code>C</code> is allowed to be positive, zero, or negative.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"));
      end Capacitor;

      model Inductor "Single phase linear inductor"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.j;
        parameter Modelica_SIunits.Inductance L(start=1) "Inductance";
      equation
        v = j*omega*L*i;
        annotation (Icon(graphics={
              Text(
                extent={{100,60},{-100,100}},
                textString="%name",
                lineColor={0,0,255}),
              Ellipse(extent={{-60,-15},{-30,15}}),
              Ellipse(extent={{-30,-15},{0,15}}),
              Ellipse(extent={{0,-15},{30,15}}),
              Ellipse(extent={{30,-15},{60,15}}),
              Rectangle(
                extent={{-60,-30},{60,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{60,0},{90,0}}),
              Line(points={{-90,0},{-60,0}}),
              Text(extent={{100,-80},{-100,-40}}, textString="L=%L")}),
            Documentation(info="<html>

<p>
The linear inductor connects the voltage <code><u>v</u></code> with the
current <code><u>i</u></code> by  <code><u>v</u> = j*&omega;*L*<u>i</u></code>.
The Inductance <code>L</code> is allowed to be positive, zero, or negative.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"));
      end Inductor;

      model VariableResistor "Single phase variable resistor"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.conj;
        parameter Modelica_SIunits.Temperature T_ref=293.15
          "Reference temperature";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref=0
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
        Modelica_SIunits.Resistance R_actual
          "Resistance = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        Modelica_Blocks.Interfaces.RealInput R_ref(unit="Ohm")
          "Variable resistance" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        assert((1 + alpha_ref*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
          "Temperature outside scope of model!");
        R_actual = R_ref*(1 + alpha_ref*(T_heatPort - T_ref));
        v = R_actual*i;
        LossPower = real(v*conj(i));
        annotation (
          Icon(graphics={
              Text(
                extent={{100,-80},{-100,-40}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{60,0},{90,0}}),
              Line(points={{-90,0},{-60,0}}),
              Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,90},{0,30}},
                color={0,0,255},
                smooth=Smooth.None)}),
          Documentation(info="<html>

<p>
The linear resistor connects the voltage <code><u>v</u></code> with the
current <code><u>i</u></code> by <code><u>i</u>*R = <u>v</u></code>.
The resistance <code>R</code> is given as input signal.
</p>

<p>
The variable resistor model also has an optional
<a href=\"modelica://Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort\">conditional heat port</a>.
A linear temperature dependency of the resistance is also taken into account.
</p>

<h4>Note</h4>
<p>
A zero crossing of the R signal could cause singularities due to the actual structure of the connected network.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableResistor;

      model VariableConductor "Single phase variable conductor"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.conj;
        parameter Modelica_SIunits.Temperature T_ref=293.15
          "Reference temperature";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref=0
          "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
        Modelica_SIunits.Conductance G_actual
          "Conductance = G_ref/(1 + alpha_ref*(heatPort.T - T_ref))";
        Modelica_Blocks.Interfaces.RealInput G_ref(unit="S")
          "Variable conductance" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        assert((1 + alpha_ref*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
          "Temperature outside scope of model!");
        G_actual = G_ref/(1 + alpha_ref*(T_heatPort - T_ref));
        i = G_actual*v;
        LossPower = real(v*conj(i));
        annotation (
          Icon(graphics={
              Text(
                extent={{100,-80},{-100,-40}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{60,0},{90,0}}),
              Line(points={{-90,0},{-60,0}}),
              Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,90},{0,30}},
                color={0,0,255},
                smooth=Smooth.None)}),
          Documentation(info="<html>

<p>
The linear conductor connects the voltage <code><u>v</u></code> with the
current <code><u>i</u></code> by <code><u>i</u> = G*<u>v</u></code>.
The conductance <code>G</code> is given as input signal.
</p>

<p>
The variable conductor model also has an optional
<a href=\"modelica://Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort\">conditional heat port</a>.
A linear temperature dependency of the conductance is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableConductor;

      model VariableCapacitor "Single phase variable capacitor"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.j;
        Modelica_Blocks.Interfaces.RealInput C(unit="F")
          "Variable capacitances"
          annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        i = j*omega*C*v;
        annotation (
          Icon(graphics={
              Text(
                extent={{100,-80},{-100,-40}},
                textString="%name",
                lineColor={0,0,255}),
              Line(
                points={{-14,28},{-14,-28}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{14,28},{14,-28}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{-90,0},{-14,0}}),
              Line(points={{14,0},{90,0}}),
              Line(points={{0,90},{0,30}}, color={0,0,255})}),
          Documentation(info="<html>

<p>
The linear capacitor connects the voltage <code><u>v</u></code> with the
current <code><u>i</u></code> by <code><u>i</u> = j*&omega;*C*<u>v</u></code>.
The capacitance <code>C</code> is given as input signal.
</p>

<h4>Note</h4>
<p>
The abstraction of a variable capacitor at quasi stationary operation assumes:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/SinglePhase/Basic/dc_dt.png\"
     alt=\"dc_dt.png\">.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableCapacitor;

      model VariableInductor "Single phase variable inductor"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.j;
        Modelica_Blocks.Interfaces.RealInput L(unit="H") "Variable inductances"
          annotation (Placement(transformation(
              origin={0,108},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        v = j*omega*L*i;
        annotation (
          Icon(graphics={
              Text(
                extent={{100,-80},{-100,-40}},
                textString="%name",
                lineColor={0,0,255}),
              Ellipse(extent={{-60,-15},{-30,15}}),
              Ellipse(extent={{-30,-15},{0,15}}),
              Ellipse(extent={{0,-15},{30,15}}),
              Ellipse(extent={{30,-15},{60,15}}),
              Rectangle(
                extent={{-60,-30},{60,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{60,0},{90,0}}),
              Line(points={{-90,0},{-60,0}}),
              Line(points={{0,90},{0,8}}, color={0,0,255})}),
          Documentation(info="<html>

<p>
The linear inductor connects the branch voltage <code><u>v</u></code> with the
branch current <code><u>i</u></code> by <code><u>v</u> = j*&omega;*L*<u>i</u></code>. The inductance <code>L</code> is given as input signal.
</p>

<h4>Note</h4>
<p>
The abstraction of a variable inductor at quasi stationary operation assumes:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/SinglePhase/Basic/dl_dt.png\"
     alt=\"dl_dt.png\">
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableInductor;

      model VariableImpedance "Single phase variable impedance"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.imag;
        import Modelica_ComplexMath.conj;
        parameter Modelica_SIunits.Temperature T_ref=293.15
          "Reference temperature";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref=0
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
        Modelica_SIunits.Resistance R_actual
          "Resistance = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        Modelica_ComplexBlocks.Interfaces.ComplexInput Z_ref
          "Variable complex inductance" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_SIunits.Resistance R_ref=real(Z_ref)
          "Resistive component of impedance";
        Modelica_SIunits.Reactance X_ref=imag(Z_ref)
          "Reactive component of impedance";
      equation
        assert((1 + alpha_ref*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
          "Temperature outside scope of model!");
        R_actual = R_ref*(1 + alpha_ref*(T_heatPort - T_ref));
        v = Complex(R_actual, X_ref)*i;
        LossPower = real(v*conj(i));
        annotation (
          Icon(graphics={
              Text(
                extent={{100,-80},{-100,-40}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{60,0},{90,0}}),
              Line(points={{-90,0},{-60,0}}),
              Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,90},{0,30}},
                color={0,0,255},
                smooth=Smooth.None)}),
          Documentation(info="<html>

<p>
The linear impedance connects the complex voltage <code><u>v</u></code> with the
complex current <code><u>i</u></code> by <code><u>i</u>*<u>Z</u> = <u>v</u></code>.
The impedance <code>Z_ref</code> is given as complex input signal, representing the
resistive and reactive component of the input impedance. The resistive
component is modeled temperature dependent, so the real part <code>R = real(<u>Z</u>)</code> is determined from
the actual operating temperature and the reference input resistance <code>real(<u>Z</u>_ref)</code>.
</p>

<p>
The variable impedance model has a
<a href=\"modelica://Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort\">conditional heat port</a>.
A linear temperature dependency of the resistance is taken into account.
</p>

<h4>Note</h4>
<p>
A zero crossing of the either the real or imaginary part of the <code>Z_ref</code> signal could cause
singularities due to the actual structure of the connected network.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableImpedance;

      model VariableAdmittance "Single phase variable admittance"
        extends Interfaces.OnePort;
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.imag;
        import Modelica_ComplexMath.conj;
        parameter Modelica_SIunits.Temperature T_ref=293.15
          "Reference temperature";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref=0
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
        Modelica_SIunits.Conductance G_actual
          "Resistance = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        Modelica_ComplexBlocks.Interfaces.ComplexInput Y_ref
          "Variable complex admittance" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_SIunits.Conductance G_ref=real(Y_ref)
          "Resistive component of conductance";
        Modelica_SIunits.Susceptance B_ref=imag(Y_ref)
          "Reactive component of susceptance";
      equation
        assert((1 + alpha_ref*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
          "Temperature outside scope of model!");
        G_actual = G_ref/(1 + alpha_ref*(T_heatPort - T_ref));
        i = Complex(G_actual, B_ref)*v;
        LossPower = real(v*conj(i));
        annotation (
          Icon(graphics={
              Text(
                extent={{100,-80},{-100,-40}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{60,0},{90,0}}),
              Line(points={{-90,0},{-60,0}}),
              Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,90},{0,30}},
                color={0,0,255},
                smooth=Smooth.None)}),
          Documentation(info="<html>

<p>
The linear admittance connects the complex voltage <code><u>v</u></code> with the
complex current <code><u>i</u></code> by <code><u>v</u>*<u>G</u> = <u>i</u></code>.
The impedance <code>G_ref</code> is given as complex input signal, representing the
resistive and reactive component of the input admittance. The resistive
component is modeled temperature dependent, so the real part <code>G = real(<u>Y</u>)</code> is detesrmined from
the actual operating temperature and the reference input conductance <code>real(<u>Y</u>_ref)</code>.
</p>

<p>
The variable admittance model has a
<a href=\"modelica://Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort\">conditional heat port</a>.
A linear temperature dependency of the conductance is taken into account.
</p>

<h4>Note</h4>
<p>
A zero crossing of the either the real or imaginary part of the <code>Y_ref</code> signal could cause
singularities due to the actual structure of the connected network.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">Variable impedance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableAdmittance;
      annotation (Icon(graphics={
            Line(origin={10,40}, points={{-100,-40},{-80,-40}}),
            Line(origin={10,40}, points={{60,-40},{80,-40}}),
            Rectangle(
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              extent={{-70,-30},{70,30}})}, coordinateSystem(extent={{-100,-100},
                {100,100}}, preserveAspectRatio=true)), Documentation(info="<html>
<p>This package hosts basic models for quasi stationary single phase circuits.
Quasi stationary theory for single phase circuits can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic\">MultiPhase.Basic</a>

</html>"));
    end Basic;

    package Ideal "Ideal components for AC singlephase models"
      extends Modelica_Icons.Package;

      model Idle "Idle branch"
        extends Interfaces.OnePort;
      equation
        i = Complex(0);
        annotation (Icon(graphics={Rectangle(
                    extent={{-60,60},{60,-60}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(points={{-90,0},{-41,0}}),
                Line(points={{91,0},{40,0}}),Text(
                    extent={{-100,100},{100,70}},
                    textString="%name",
                    lineColor={0,0,255})}), Documentation(info="<html>
<p>
This model is a simple idle branch considering the complex current <i><u>i</u></i> = 0.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.Short\">Short</a>
</p>
</html>"));
      end Idle;

      model Short "Short cut branch"
        extends Interfaces.OnePort;
      equation
        v = Complex(0);
        annotation (Icon(graphics={Rectangle(
                    extent={{-60,60},{60,-60}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(points={{91,0},{-90,0}}),
                Text(
                    extent={{-100,100},{100,70}},
                    textString="%name",
                    lineColor={0,0,255})}), Documentation(info="<html>
<p>
This model is a simple short cut branch considering the complex voltage <i><u>v</u></i> = 0.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.Idle\">Idle</a>
</p>
</html>"));
      end Short;

      model IdealCommutingSwitch "Ideal commuting switch"
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.conj;
        parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
          "Closed switch resistance";
        parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
          "Opened switch conductance";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
             293.15);
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.PositivePin p
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.NegativePin n2
          annotation (Placement(transformation(extent={{90,-10},{110,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.NegativePin n1
          annotation (Placement(transformation(extent={{90,40},{110,60}},
                rotation=0)));
        Modelica_Blocks.Interfaces.BooleanInput control
          "true => p--n2 connected, false => p--n1 connected" annotation (
            Placement(transformation(
              origin={0,80},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      protected
        Complex s1(re(final unit="1"), im(final unit="1"));
        Complex s2(re(final unit="1"), im(final unit="1"))
          "Auxiliary variables";
        constant Modelica_SIunits.ComplexVoltage unitVoltage=Complex(1, 0)
          annotation (HideResult=true);
        constant Modelica_SIunits.ComplexCurrent unitCurrent=Complex(1, 0)
          annotation (HideResult=true);
      equation
        Connections.branch(p.reference, n1.reference);
        p.reference.gamma = n1.reference.gamma;
        Connections.branch(p.reference, n2.reference);
        p.reference.gamma = n2.reference.gamma;
        p.i + n2.i + n1.i = Complex(0, 0);
        p.v - n1.v = (s1*unitCurrent)*(if (control) then 1 else Ron);
        n1.i = -(s1*unitVoltage)*(if (control) then Goff else 1);
        p.v - n2.v = (s2*unitCurrent)*(if (control) then Ron else 1);
        n2.i = -(s2*unitVoltage)*(if (control) then 1 else Goff);
        LossPower = real(p.v*conj(p.i)) + real(n1.v*conj(n1.i)) + real(n2.v*conj(
          n2.i));
        annotation (
          Documentation(info="<HTML>
<P>
The commuting switch has a positive pin p and two negative pins n1 and n2.
The switching behaviour is controlled
by the input signal control. If control is true, the pin p is connected
with the negative pin n2. Otherwise, the pin p is connected to the negative pin n1.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
<p>
<b>Use with care:</b>
This switch is only intended to be used for structural changes, not for fast switching sequences, due to the quasistationary formulation.
</p>
</HTML>"),Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
                lineColor={0,0,255}),Text(
                    extent={{-80,0},{-60,22}},
                    textString="p",
                    lineColor={0,0,255}),Text(
                    extent={{60,50},{80,72}},
                    textString="n1",
                    lineColor={0,0,255}),Text(
                    extent={{60,0},{80,22}},
                    textString="n2",
                    lineColor={0,0,255}),Line(points={{-90,0},{-44,0}}, color={0,
                0,255}),Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(
                points={{40,50},{90,50}}, color={0,0,255}),Line(points={{0,90},{0,
                25}}, color={0,0,255}),Line(points={{40,0},{90,0}}, color={0,0,
                255}),Line(
                    visible=useHeatPort,
                    points={{0,-100},{0,25}},
                    color={127,0,0},
                    smooth=Smooth.None,
                    pattern=LinePattern.Dot),Text(
                    extent={{-148,-22},{152,-62}},
                    textString="%name",
                    lineColor={0,0,255})}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
                lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,
                255}),Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points=
                 {{40,50},{96,50}}, color={0,0,255}),Line(points={{0,60},{0,25}},
                color={0,0,255}),Line(points={{40,0},{96,0}}, color={0,0,255})}));
      end IdealCommutingSwitch;

      model IdealIntermediateSwitch "Ideal intermediate switch"
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.conj;
        parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
          "Closed switch resistance";
        parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
          "Opened switch conductance";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
             293.15);
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.PositivePin p1
          annotation (Placement(transformation(extent={{-110,40},{-90,60}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.PositivePin p2
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.NegativePin n1
          annotation (Placement(transformation(extent={{90,40},{110,60}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.NegativePin n2
          annotation (Placement(transformation(extent={{90,-10},{110,10}},
                rotation=0)));
        Modelica_Blocks.Interfaces.BooleanInput control
          "true => p1--n2, p2--n1 connected, otherwise p1--n1, p2--n2  connected"
          annotation (Placement(transformation(
              origin={0,80},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      protected
        Complex s1(re(final unit="1"), im(final unit="1"));
        Complex s2(re(final unit="1"), im(final unit="1"));
        Complex s3(re(final unit="1"), im(final unit="1"));
        Complex s4(re(final unit="1"), im(final unit="1"))
          "Auxiliary variables";
        constant Modelica_SIunits.ComplexVoltage unitVoltage=Complex(1, 0)
          annotation (HideResult=true);
        constant Modelica_SIunits.ComplexCurrent unitCurrent=Complex(1, 0)
          annotation (HideResult=true);
      equation
        Connections.branch(p1.reference, n1.reference);
        p1.reference.gamma = n1.reference.gamma;
        Connections.branch(p2.reference, n2.reference);
        p2.reference.gamma = n2.reference.gamma;
        Connections.branch(n1.reference, n2.reference);
        n1.reference.gamma = n2.reference.gamma;

        p1.v - n1.v = (s1*unitCurrent)*(if (control) then 1 else Ron);
        p2.v - n2.v = (s2*unitCurrent)*(if (control) then 1 else Ron);
        p1.v - n2.v = (s3*unitCurrent)*(if (control) then Ron else 1);
        p2.v - n1.v = (s4*unitCurrent)*(if (control) then Ron else 1);

        p1.i = if control then s1*unitVoltage*Goff + s3*unitCurrent else s1*
          unitCurrent + s3*unitVoltage*Goff;
        p2.i = if control then s2*unitVoltage*Goff + s4*unitCurrent else s2*
          unitCurrent + s4*unitVoltage*Goff;
        n1.i = if control then -s1*unitVoltage*Goff - s4*unitCurrent else -s1*
          unitCurrent - s4*unitVoltage*Goff;
        n2.i = if control then -s2*unitVoltage*Goff - s3*unitCurrent else -s2*
          unitCurrent - s3*unitVoltage*Goff;

        LossPower = real(p1.v*conj(p1.i)) + real(p2.v*conj(p2.i)) + real(n1.v*
          conj(n1.i)) + real(n2.v*conj(n2.i));
        annotation (
          Documentation(info="<HTML>
<P>
The intermediate switch has four switching contact pins p1, p2, n1, and n2.
The switching behaviour is controlled by the input signal control. If control
is true, the pin p1 is connected to pin n2, and the pin p2 is
connected to the pin n2. Otherwise, the pin p1 is connected to n1, and
p2 is connected to n2.
</P>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/SinglePhase/Ideal/IdealIntermediateSwitch1.png\" ALT=\"IdealIntermediateSwitch1\">
</p>

<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
</P>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Electrical/QuasiStationary/SinglePhase/Ideal/IdealIntermediateSwitch2.png\" ALT=\"IdealIntermediateSwitch2\">
</p>

<P>
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
<p>
<b>Use with care:</b>
This switch is only intended to be used for structural changes, not for fast switching sequences, due to the quasistationary formulation.
</p>
</HTML>"),Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(extent={{-4,30},{4,22}},
                lineColor={0,0,255}),Text(
                    extent={{-80,50},{-60,72}},
                    textString="p1",
                    lineColor={0,0,255}),Text(
                    extent={{-80,0},{-60,22}},
                    textString="p2",
                    lineColor={0,0,255}),Text(
                    extent={{60,50},{80,72}},
                    textString="n1",
                    lineColor={0,0,255}),Text(
                    extent={{60,0},{80,22}},
                    textString="n2",
                    lineColor={0,0,255}),Line(points={{-90,0},{-44,0}}, color={0,
                0,255}),Line(points={{-90,50},{-44,50}}, color={0,0,255}),Line(
                points={{-44,0},{40,50}}, color={0,0,255}),Line(points={{-44,50},
                {40,0}}, color={0,0,255}),Line(points={{40,50},{90,50}}, color={0,
                0,255}),Line(points={{0,90},{0,25}}, color={0,0,255}),Line(points=
                 {{40,0},{90,0}}, color={0,0,255}),Text(
                    extent={{-151,-24},{149,-64}},
                    textString="%name",
                    lineColor={0,0,255})}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(extent={{-4,29},{4,21}},
                lineColor={0,0,255}),Line(points={{-96,0},{-40,0}}, color={0,0,
                255}),Line(points={{-96,50},{-40,50}}, color={0,0,255}),Line(
                points={{-40,0},{40,50}}, color={0,0,255}),Line(points={{-40,50},
                {40,0}}, color={0,0,255}),Line(points={{40,50},{96,50}}, color={0,
                0,255}),Line(points={{0,60},{0,25}}, color={0,0,255}),Line(points=
                 {{40,0},{96,0}}, color={0,0,255})}));
      end IdealIntermediateSwitch;

      model IdealOpeningSwitch "Ideal electrical opener"
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.conj;
        extends
          Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.OnePort;
        parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
          "Closed switch resistance" annotation (Placement(transformation(extent=
                  {{-56.6667,10},{-10,56.6667}}, rotation=0)));
        parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
          "Opened switch conductance" annotation (Placement(transformation(extent=
                 {{10,10},{56.6667,56.6667}}, rotation=0)));
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
             293.15);
        Modelica_Blocks.Interfaces.BooleanInput control
          "true => switch open, false => p--n connected" annotation (Placement(
              transformation(
              origin={0,70},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      protected
        Complex s(re(final unit="1"),im(final unit="1")) "Auxiliary variable";
        constant Modelica_SIunits.ComplexVoltage unitVoltage=Complex(1, 0)
          annotation (HideResult=true);
        constant Modelica_SIunits.ComplexCurrent unitCurrent=Complex(1, 0)
          annotation (HideResult=true);
      equation
        v = (s*unitCurrent)*(if control then 1 else Ron);
        i = (s*unitVoltage)*(if control then Goff else 1);

        LossPower = real(v*conj(i));
        annotation (
          Documentation(info="<HTML>
<P>
The ideal opening switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the input signal control.
If control is true, pin p is not connected
with negative pin n. Otherwise, pin p is connected
with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
<p>
<b>Use with care:</b>
This switch is only intended to be used for structural changes, not for fast switching sequences, due to the quasistationary formulation.
</p>
</HTML>"),Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
                lineColor={0,0,255}),Line(points={{-90,0},{-44,0}}, color={0,0,
                255}),Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points=
                 {{40,0},{90,0}}, color={0,0,255}),Line(points={{0,51},{0,26}},
                color={0,0,255}),Line(points={{40,20},{40,0}}, color={0,0,255}),
                Line(
                    visible=useHeatPort,
                    points={{0,-100},{0,25}},
                    color={127,0,0},
                    smooth=Smooth.None,
                    pattern=LinePattern.Dot),Text(
                    extent={{-151,-21},{149,-61}},
                    textString="%name",
                    lineColor={0,0,255})}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
                lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,
                255}),Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points=
                 {{40,0},{96,0}}, color={0,0,255}),Text(
                    extent={{-100,-40},{100,-79}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{0,51},{0,26}}, color={0,0,
                255}),Line(points={{40,20},{40,0}}, color={0,0,255})}));
      end IdealOpeningSwitch;

      model IdealClosingSwitch "Ideal electrical closer"
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.conj;
        extends
          Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.OnePort;
        parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
          "Closed switch resistance" annotation (Placement(transformation(extent=
                  {{-56.6667,10},{-10,56.6667}}, rotation=0)));
        parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
          "Opened switch conductance" annotation (Placement(transformation(extent=
                 {{10,10},{56.6667,56.6667}}, rotation=0)));
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
             293.15);
        Modelica_Blocks.Interfaces.BooleanInput control
          "true => p--n connected, false => switch open" annotation (Placement(
              transformation(
              origin={0,70},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      protected
        Complex s(re(final unit="1"), im(final unit="1")) "Auxiliary variable";
        constant Modelica_SIunits.ComplexVoltage unitVoltage=Complex(1, 0)
          annotation (HideResult=true);
        constant Modelica_SIunits.ComplexCurrent unitCurrent=Complex(1, 0)
          annotation (HideResult=true);
      equation
        v = (s*unitCurrent)*(if control then Ron else 1);
        i = (s*unitVoltage)*(if control then 1 else Goff);

        LossPower = real(v*conj(i));
        annotation (
          Documentation(info="<HTML>
<P>
The ideal closing switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by input signal control.
If control is true, pin p is connected
with negative pin n. Otherwise, pin p is not connected
with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</P>
<p>
<b>Use with care:</b>
This switch is only intended to be used for structural changes, not for fast switching sequences, due to the quasistationary formulation.
</p>
</HTML>"),Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
                lineColor={0,0,255}),Line(points={{-90,0},{-44,0}}, color={0,0,
                255}),Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points=
                 {{40,0},{90,0}}, color={0,0,255}),Line(points={{0,51},{0,26}},
                color={0,0,255}),Line(
                    visible=useHeatPort,
                    points={{0,-100},{0,25}},
                    color={127,0,0},
                    smooth=Smooth.None,
                    pattern=LinePattern.Dot),Text(
                    extent={{-152,-28},{148,-68}},
                    textString="%name",
                    lineColor={0,0,255})}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
                lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,
                255}),Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points=
                 {{40,0},{96,0}}, color={0,0,255}),Text(
                    extent={{-100,-40},{100,-79}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{0,51},{0,26}}, color={0,0,
                255})}));
      end IdealClosingSwitch;

      model IdealTransformer "Ideal transformer"
        parameter Real n=1 "Ratio of primary to secondary voltage";
        Modelica_SIunits.ComplexVoltage v1=pin_p1.v - pin_n1.v
          "Voltage drop of side 1";
        Modelica_SIunits.ComplexCurrent i1=pin_p1.i "Current into side 1";
        Modelica_SIunits.ComplexVoltage v2=pin_p2.v - pin_n2.v
          "Voltage drop of side 2";
        Modelica_SIunits.ComplexCurrent i2=pin_p2.i "Current into side 2";
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.PositivePin pin_p1
          "Primary positive pin" annotation (Placement(transformation(extent={{
                  -110,40},{-90,60}}), iconTransformation(extent={{-110,40},{-90,
                  60}})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.PositivePin pin_p2
          "Secondary positive pin" annotation (Placement(transformation(extent=
                  {{90,40},{110,60}}), iconTransformation(extent={{90,40},{110,
                  60}})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.NegativePin pin_n1
          "Primary negative pin" annotation (Placement(transformation(extent={{
                  -110,-60},{-90,-40}}), iconTransformation(extent={{-110,-60},
                  {-90,-40}})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.NegativePin pin_n2
          "Secondary negative pin" annotation (Placement(transformation(extent=
                  {{90,-60},{110,-40}}), iconTransformation(extent={{90,-60},{
                  110,-40}})));
      equation
        // Current balance
        pin_p1.i + pin_n1.i = Complex(0, 0);
        pin_p2.i + pin_n2.i = Complex(0, 0);
        // Transformation ratios
        v1 = Complex(+n, 0)*v2;
        i2 = Complex(-n, 0)*i1;
        Connections.branch(pin_p1.reference, pin_n1.reference);
        pin_p1.reference.gamma = pin_n1.reference.gamma;
        Connections.branch(pin_n1.reference, pin_n2.reference);
        pin_p2.reference.gamma = pin_n2.reference.gamma;
        Connections.branch(pin_p1.reference, pin_p2.reference);
        pin_p1.reference.gamma = pin_p2.reference.gamma;
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                    extent={{-100,10},{0,-10}},
                    lineColor={0,0,255},
                    textString="1=primary"),Text(
                    extent={{0,10},{100,-10}},
                    lineColor={0,0,255},
                    textString="2=secondary"),Polygon(
                    points={{-120,53},{-110,50},{-120,47},{-120,53}},
                    lineColor={160,160,164},
                    fillColor={160,160,164},
                    fillPattern=FillPattern.Solid),Line(points={{-136,50},{-111,
                50}}, color={160,160,164}),Text(
                    extent={{-136,53},{-119,68}},
                    lineColor={160,160,164},
                    textString="i1"),Line(points={{-136,-49},{-111,-49}}, color={
                160,160,164}),Polygon(
                    points={{-126,-46},{-136,-49},{-126,-52},{-126,-46}},
                    lineColor={160,160,164},
                    fillColor={160,160,164},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{-127,-46},{-110,-31}},
                    lineColor={160,160,164},
                    textString="i1"),Polygon(
                    points={{127,-47},{137,-50},{127,-53},{127,-47}},
                    lineColor={160,160,164},
                    fillColor={160,160,164},
                    fillPattern=FillPattern.Solid),Line(points={{111,-50},{136,-50}},
                color={160,160,164}),Text(
                    extent={{112,-44},{128,-29}},
                    lineColor={160,160,164},
                    textString="i2"),Text(
                    extent={{118,52},{135,67}},
                    lineColor={0,0,0},
                    textString="i2"),Polygon(
                    points={{120,53},{110,50},{120,47},{120,53}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.HorizontalCylinder,
                    fillColor={160,160,164}),Line(points={{111,50},{136,50}},
                color={0,0,0})}),
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(extent={{-45,-50},{-20,-25}}),
                Ellipse(extent={{-45,-25},{-20,0}}),Ellipse(extent={{-45,0},{-20,
                25}}),Ellipse(extent={{-45,25},{-20,50}}),Rectangle(
                    extent={{-72,-60},{-33,60}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(points={{-90,50},{-32,50}}),
                Line(points={{-90,-50},{-32,-50}}),Ellipse(extent={{20,-50},{45,-25}}),
                Ellipse(extent={{20,-25},{45,0}}),Ellipse(extent={{20,0},{45,25}}),
                Ellipse(extent={{20,25},{45,50}}),Rectangle(
                    extent={{33,-60},{72,60}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(points={{32,50},{90,50}}),
                Line(points={{32,-50},{90,-50}}),Text(extent={{-100,-80},{100,-100}},
                textString="n=%n"),Text(
                    extent={{-146,115},{154,75}},
                    textString="%name",
                    lineColor={0,0,255}),Text(
                    extent={{-100,10},{-80,-10}},
                    lineColor={0,0,255},
                    textString="1"),Text(
                    extent={{80,10},{100,-10}},
                    lineColor={0,0,255},
                    textString="2")}),
          Documentation(info="<html>
<p>
The ideal transformer is a two-port circuit element without magnetization. Voltages and currents are ideally transformed:
</p>
<pre>
 v1 =  v2*n;
 i2 = -i1*n;
</pre>
<p>
where <code>n</code> is a real number called the turns ratio.
</html>",   revisions="<html>
<h5>2014-01-02, Christian Kral</h5>
<ul>
<li>Initial implementation of ideal transformer model</li>
</ul>

</html>"));
      end IdealTransformer;
      annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
              preserveAspectRatio=true), graphics={
            Line(origin={10,34}, points={{-100,-60},{-54,-60}}),
            Ellipse(origin={10,34}, extent={{-54,-64},{-46,-56}}),
            Line(origin={10,34}, points={{-47,-58},{30,-10}}),
            Line(origin={10,34}, points={{30,-40},{30,-60}}),
            Line(origin={10,34}, points={{30,-60},{80,-60}})}), Documentation(
            info="<html>
<p>This package hosts ideal models for quasi stationary single phase circuits.
Quasi stationary theory for single phase circuits can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Ideal\">MultiPhase.Ideal</a>

</html>"));
    end Ideal;

    package Sensors "AC singlephase sensors"
      extends Modelica_Icons.SensorsPackage;

      model ReferenceSensor "Sensor of reference angle gamma"
        extends
          Modelica_Electrical_QuasiStationary.SinglePhase.Interfaces.AbsoluteSensor;
        Modelica_Blocks.Interfaces.RealOutput y "Reference angle" annotation (
            Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      equation
        y = pin.reference.gamma;
        annotation (Icon(graphics={Text(
                extent={{60,-60},{-60,-30}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="ref")}), Diagram(coordinateSystem(preserveAspectRatio=
                 false, extent={{-100,-100},{100,100}}), graphics));
      end ReferenceSensor;

      model FrequencySensor "Frequency sensor"
        extends Interfaces.AbsoluteSensor;
        import Modelica_Constants.pi;
        Modelica_Blocks.Interfaces.RealOutput y annotation (Placement(
              transformation(extent={{100,-10},{120,10}}, rotation=0)));
      equation
        2*pi*y = omega;
        annotation (Icon(graphics={Text(
                extent={{-29,-11},{30,-70}},
                lineColor={0,0,0},
                textString="f")}), Documentation(info="<html>

<p>
This sensor can be used to measure the frequency of the reference system.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor\">CurrentSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">PowerSensor</a>
</p>

</html>"));
      end FrequencySensor;

      model PotentialSensor "Potential sensor"
        extends Interfaces.AbsoluteSensor;
        Modelica_ComplexBlocks.Interfaces.ComplexOutput y annotation (Placement(
              transformation(extent={{100,-10},{120,10}}, rotation=0)));
      equation
        y = pin.v;
        annotation (Icon(graphics={Text(
                extent={{-29,-11},{30,-70}},
                lineColor={0,0,0},
                textString="V")}), Documentation(info="<html>

<p>
This sensor can be used to measure the complex potential.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor\">CurrentSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">PowerSensor</a>
</p>

</html>"));
      end PotentialSensor;

      model VoltageSensor "Voltage sensor"
        extends Interfaces.RelativeSensor;
      equation
        i = Complex(0);
        y = v;
        annotation (Icon(graphics={Text(
                extent={{-29,-11},{30,-70}},
                lineColor={0,0,0},
                textString="V")}), Documentation(info="<html>
<p>
This sensor can be used to measure the complex voltage.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor\">CurrentSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">PowerSensor</a>
</p>

</html>"));
      end VoltageSensor;

      model CurrentSensor "Current sensor"
        extends Interfaces.RelativeSensor;
      equation
        v = Complex(0);
        y = i;
        annotation (Icon(graphics={Text(
                extent={{-29,-11},{30,-70}},
                lineColor={0,0,0},
                textString="I")}), Documentation(info="<html>
<p>
This sensor can be used to measure the complex current.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">PowerSensor</a>
</p>

</html>"));
      end CurrentSensor;

      model PowerSensor "Power sensor"
        import Modelica_ComplexMath.conj;
        extends Modelica_Icons.RotationalSensor;
        Interfaces.PositivePin currentP annotation (Placement(transformation(
                extent={{-110,-10},{-90,10}}, rotation=0)));
        Interfaces.NegativePin currentN annotation (Placement(transformation(
                extent={{90,-10},{110,10}}, rotation=0)));
        Interfaces.PositivePin voltageP annotation (Placement(transformation(
                extent={{-10,90},{10,110}}, rotation=0)));
        Interfaces.NegativePin voltageN annotation (Placement(transformation(
                extent={{-10,-110},{10,-90}}, rotation=0)));
        output Modelica_SIunits.ComplexCurrent i;
        output Modelica_SIunits.ComplexVoltage v;
        Modelica_ComplexBlocks.Interfaces.ComplexOutput y annotation (Placement(
              transformation(
              origin={-80,-110},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      equation
        Connections.branch(currentP.reference, currentN.reference);
        currentP.reference.gamma = currentN.reference.gamma;
        Connections.branch(voltageP.reference, voltageN.reference);
        voltageP.reference.gamma = voltageN.reference.gamma;
        Connections.branch(currentP.reference, voltageP.reference);
        currentP.reference.gamma = voltageP.reference.gamma;
        currentP.i + currentN.i = Complex(0);
        currentP.v - currentN.v = Complex(0);
        i = currentP.i;
        voltageP.i + voltageN.i = Complex(0);
        voltageP.i = Complex(0);
        v = voltageP.v - voltageN.v;
        //P + j*Q = v * conj(i);
        y = v*conj(i);
        annotation (Icon(graphics={
              Line(points={{0,100},{0,70}}, color={0,0,255}),
              Line(points={{0,-70},{0,-100}}, color={0,0,255}),
              Text(extent={{-29,-70},{30,-11}}, textString="P"),
              Line(points={{-80,-100},{-80,0}}, color={85,170,255}),
              Text(
                textColor={0,0,255},
                extent={{-100,110},{100,150}},
                textString="%name"),
              Line(points={{-100,0},{100,0}}, color={0,0,255})}), Documentation(
              info="<html>

<p>
This sensor can be used to measure the complex apparent power.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor\">CurrentSensor</a>,
</p>

</html>"));
      end PowerSensor;
      annotation (Documentation(info="<html>
<p>This package hosts sensors for quasi stationary single phase circuits.
Quasi stationary theory for single phase circuits can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors\">MultiPhase.Sensors</a>

</html>"));
    end Sensors;

    package Sources "AC singlephase sources"
      extends Modelica_Icons.SourcesPackage;

      model VoltageSource "Constant AC voltage"
        extends Interfaces.Source;
        parameter Modelica_SIunits.Frequency f(start=1)
          "frequency of the source";
        parameter Modelica_SIunits.Voltage V(start=1)
          "RMS voltage of the source";
        parameter Modelica_SIunits.Angle phi(start=0)
          "phase shift of the source";
      equation
        omega = 2*Modelica_Constants.pi*f;
        v = Complex(V*cos(phi), V*sin(phi));
        annotation (Icon(graphics={Text(
                    extent={{-120,50},{-20,0}},
                    lineColor={0,0,255},
                    textString="+"),Text(
                    extent={{20,50},{120,0}},
                    lineColor={0,0,255},
                    textString="-"),Line(points={{50,0},{-50,0}}, color={0,0,0})}),
            Documentation(info="<html>

<p>
This is a constant voltage source, specifying the complex voltage by the RMS voltage and the phase shift.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>
</p>
</html>"));
      end VoltageSource;

      model VariableVoltageSource "Variable AC voltage"
        extends Interfaces.Source;
        Modelica_Blocks.Interfaces.RealInput f annotation (Placement(
              transformation(
              origin={40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_ComplexBlocks.Interfaces.ComplexInput V annotation (Placement(
              transformation(
              origin={-40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        omega = 2*Modelica_Constants.pi*f;
        v = V;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-120,50},{-20,0}},
                    lineColor={0,0,255},
                    textString="+"),Text(
                    extent={{20,50},{120,0}},
                    lineColor={0,0,255},
                    textString="-"),Line(points={{50,0},{-50,0}}, color={0,0,0})}),
            Documentation(info="<html>

<p>
This is a voltage source with a complex signal input, specifying the complex voltage by the complex RMS voltage components.
Additionally, the frequency of the voltage source is defined by a real signal input.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>
</p>
</html>"));
      end VariableVoltageSource;

      model CurrentSource "Constant AC current"
        extends Interfaces.Source;
        parameter Modelica_SIunits.Frequency f(start=1)
          "frequency of the source";
        parameter Modelica_SIunits.Current I(start=1)
          "RMS current of the source";
        parameter Modelica_SIunits.Angle phi(start=0)
          "phase shift of the source";
      equation
        omega = 2*Modelica_Constants.pi*f;
        i = Complex(I*cos(phi), I*sin(phi));
        annotation (Icon(graphics={Line(points={{0,-50},{0,50}}, color={0,0,0}),
                Line(points={{-60,60},{60,60}}, color={0,0,255}),Polygon(
                    points={{60,60},{30,70},{30,50},{60,60}},
                    lineColor={0,0,255},
                    fillColor={0,0,255},
                    fillPattern=FillPattern.Solid)}), Documentation(info="<html>

<p>
This is a constant current source, specifying the complex current by the RMS current and the phase shift.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>
</p>
</html>"));
      end CurrentSource;

      model VariableCurrentSource "Variable AC current"
        extends Interfaces.Source;
        Modelica_Blocks.Interfaces.RealInput f annotation (Placement(
              transformation(
              origin={40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_ComplexBlocks.Interfaces.ComplexInput I annotation (Placement(
              transformation(
              origin={-40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        omega = 2*Modelica_Constants.pi*f;
        i = I;
        annotation (Icon(graphics={Line(points={{0,-50},{0,50}}, color={0,0,0}),
                Line(points={{-60,60},{60,60}}, color={0,0,255}),Polygon(
                    points={{60,60},{30,70},{30,50},{60,60}},
                    lineColor={0,0,255},
                    fillColor={0,0,255},
                    fillPattern=FillPattern.Solid)}), Documentation(info="<html>

<p>
This is a current source with a complex signal input, specifying the complex current by the complex RMS current components.
Additionally, the frequency of the voltage source is defined by a real signal input.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.CurrentSource\">CurrentSource</a>,
</p>
</html>"));
      end VariableCurrentSource;
      annotation (Documentation(info="<html>
<p>This package hosts sources for quasi stationary single phase circuits.
Quasi stationary theory for single phase circuits can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources\">MultiPhase.Sources</a>

</html>"));
    end Sources;

    package Interfaces "Interfaces for AC singlephase models"
      extends Modelica_Icons.InterfacesPackage;

      connector Pin "Basic connector"
        Modelica_SIunits.ComplexVoltage v "Complex potential at the node";
        flow Modelica_SIunits.ComplexCurrent i
          "Complex current flowing into the pin";
        annotation (Documentation(info="<html>
<p>
The potential of this connector is the complex voltage and the flow variable is the complex current.
The <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive</a> and
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">negative pin</a> are
derived from this base connector.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>

</html>"));
      end Pin;

      connector PositivePin "Positive connector"
        extends Pin;
        Types.Reference reference "Reference";
        annotation (
          Diagram(graphics={Text(
                extent={{-100,100},{100,60}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                textString="%name"), Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={85,170,255},
                fillColor={85,170,255},
                fillPattern=FillPattern.Solid)}),
          Icon(graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={85,170,255},
                fillColor={85,170,255},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<html>

<p>
The positive pin is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angular velocity of the quasi stationary voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">negative pin</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>
</html>"));
      end PositivePin;

      connector NegativePin "Negative Connector"
        extends Pin;
        Types.Reference reference "Reference";
        annotation (
          Diagram(graphics={Text(
                extent={{-100,100},{100,60}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                textString="%name"), Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={85,170,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Icon(graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={85,170,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<html>

<p>
The negative pin is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angular velocity of the quasi stationary voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive pin</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>
</html>"));
      end NegativePin;

      partial model TwoPin "Two pins"
        import Modelica_Constants.eps;
        Modelica_SIunits.ComplexVoltage v "Complex voltage";
        Modelica_SIunits.Voltage abs_v = Modelica_ComplexMath.'abs'(v)
          "Magnitude of complex voltage";
        Modelica_SIunits.Angle arg_v = Modelica_ComplexMath.arg(v)
          "Argument of complex voltage";
        Modelica_SIunits.ComplexCurrent i "Complex current";
        Modelica_SIunits.Current abs_i = Modelica_ComplexMath.'abs'(i)
          "Magnitude of complex current";
        Modelica_SIunits.Angle arg_i = Modelica_ComplexMath.arg(i)
          "Argument of complex current";
        Modelica_SIunits.ActivePower P = Modelica_ComplexMath.real(v*Modelica_ComplexMath.conj(i))
          "Active power";
        Modelica_SIunits.ReactivePower Q = Modelica_ComplexMath.imag(v*Modelica_ComplexMath.conj(i))
          "Reactive power";
        Modelica_SIunits.ApparentPower S = Modelica_ComplexMath.'abs'(v*Modelica_ComplexMath.conj(i))
          "Magnitude of complex apparent power";
        Real pf = cos(Modelica_ComplexMath.arg(Complex(P,Q))) "Power factor";
        Modelica_SIunits.AngularVelocity omega
          "Angular velocity of reference frame";

        PositivePin pin_p "Positive pin" annotation (Placement(transformation(
                extent={{-110,-10},{-90,10}}, rotation=0)));
        NegativePin pin_n "Negative pin" annotation (Placement(transformation(
                extent={{90,-10},{110,10}}, rotation=0)));
      equation
        Connections.branch(pin_p.reference, pin_n.reference);
        pin_p.reference.gamma = pin_n.reference.gamma;
        omega = der(pin_p.reference.gamma);
        v = pin_p.v - pin_n.v;
        i = pin_p.i;
        annotation (Documentation(info="<html>
<p>
This partial model uses a <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive</a>
and <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">negative pin</a> and defines the complex voltage difference as well as the complex current (into the positive pin). Additionally, the angular velocity of the quasi stationary system is explicitly defined as variable. This model is mainly intended to be used with graphical representation of user models.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.OnePort\">OnePort</a>
</p>
</html>"));
      end TwoPin;

      partial model OnePort "Two pins, current through"
        extends TwoPin;
      equation
        pin_p.i + pin_n.i = Complex(0);
        annotation (Documentation(info="<html>
<p>
This partial model is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.TwoPin\">TwoPin</a> and
additionally considers the complex current balance of the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive</a> and the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">negative pin</a>.
This model is intended to be used with textual representation of user models.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.TwoPin\">TwoPin</a>
</p>
</html>"));
      end OnePort;

      partial model AbsoluteSensor "Partial potential sensor"
        extends Modelica_Icons.RotationalSensor;
        Modelica_SIunits.AngularVelocity omega;
        PositivePin pin "Pin" annotation (Placement(transformation(extent={{-110,
                  -10},{-90,10}}, rotation=0)));
      equation
        omega = der(pin.reference.gamma);
        pin.i = Complex(0);
        annotation (Icon(graphics={
              Line(points={{-70,0},{-94,0}}, color={0,0,0}),
              Text(
                extent={{-100,100},{100,70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={170,85,255},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Line(points={{100,0},{70,0}}, color={0,0,0})}), Documentation(info="<html>
<p>
The absolute sensor partial model provides a single
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">positive pin</a> to measure the complex voltage. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.RelativeSensor\">RelativeSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.AbsoluteSensor\">MultiPhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.RelativeSensor\">MultiPhase.Interfaces.RelativeSensor</a>
</p>

</html>"));
      end AbsoluteSensor;

      partial model RelativeSensor "Partial voltage / current sensor"
        extends Modelica_Icons.RotationalSensor;
        extends OnePort;
        Modelica_ComplexBlocks.Interfaces.ComplexOutput y annotation (Placement(
              transformation(
              origin={0,-110},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        annotation (Icon(graphics={
              Line(points={{-70,0},{-94,0}}, color={0,0,0}),
              Line(points={{70,0},{94,0}}, color={0,0,0}),
              Text(
                extent={{-100,100},{100,70}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={170,85,255},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Line(points={{0,-70},{0,-80},{0,-90},{0,-100}}, color={85,170,255})}),
            Documentation(info="<html>
<p>
The relative sensor partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.OnePort\">OnePort</a> to measure the complex voltage, current or power. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.AbsoluteSensor\">AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor\">CurrentSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">PowerSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.AbsoluteSensor\">MultiPhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.RelativeSensor\">MultiPhase.Interfaces.RelativeSensor</a>
</p>

</html>"));
      end RelativeSensor;

      partial model Source "Partial voltage / current source"
        extends OnePort;
        Modelica_SIunits.Angle gamma(start=0) = pin_p.reference.gamma;
      equation
        Connections.root(pin_p.reference);
        annotation (Icon(graphics={
              Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{100,-100},{-100,-60}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{-90,0},{-50,0}}, color={0,0,0}),
              Line(points={{50,0},{90,0}}, color={0,0,0})}), Documentation(info="<html>
<p>
The source partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.OnePort\">OnePort</a> and contains a proper icon.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Source\">MultiPhase.Interfaces.Source</a>.
</p>
</html>"));
      end Source;
      annotation (Documentation(info="<html>
<p>This package contains connector specifications and partial models for more complex components.</p>
</html>"));
    end Interfaces;

    package Utilities "Library with auxiliary models for testing"
      extends Modelica_Icons.UtilitiesPackage;
      model IdealACDCConverter "Ideal AC DC converter"
        parameter Real conversionFactor "Ratio of DC voltage / QS rms voltage";
        import Modelica_ComplexMath.real;
        import Modelica_ComplexMath.imag;
        import Modelica_ComplexMath.conj;
        import Modelica_ComplexMath.'abs';
        import Modelica_ComplexMath.arg;
        Modelica_SIunits.ComplexVoltage vQS=pin_pQS.v - pin_nQS.v
          "AC QS voltage";
        Modelica_SIunits.ComplexCurrent iQS=pin_pQS.i "AC QS current";
        output Modelica_SIunits.Voltage vQSabs='abs'(vQS) "Abs(AC QS voltage)";
        output Modelica_SIunits.Current iQSabs='abs'(iQS) "Abs(AC QS current)";
        Modelica_SIunits.ComplexPower sQS=vQS*conj(iQS) "AC QS apparent power";
        Modelica_SIunits.ActivePower pQS=real(sQS) "AC QS active power";
        Modelica_SIunits.ReactivePower qQS=imag(sQS) "AC QS reactive power";
        Modelica_SIunits.Voltage vDC=pin_pDC.v - pin_nDC.v "DC voltage";
        Modelica_SIunits.Current iDC=pin_pDC.i "DC current";
        Modelica_SIunits.Power pDC=vDC*iDC "DC power";
        Interfaces.PositivePin pin_pQS annotation (Placement(transformation(
                extent={{-110,110},{-90,90}}), iconTransformation(extent={{-110,
                  110},{-90,90}})));
        Interfaces.NegativePin pin_nQS annotation (Placement(transformation(
                extent={{-110,-110},{-90,-90}}), iconTransformation(extent={{-110,
                  -110},{-90,-90}})));
        Modelica_Electrical_Analog.Interfaces.PositivePin pin_pDC annotation (
            Placement(transformation(extent={{90,110},{110,90}}),
              iconTransformation(extent={{90,110},{110,90}})));
        Modelica_Electrical_Analog.Interfaces.NegativePin pin_nDC annotation (
            Placement(transformation(extent={{90,-110},{110,-90}}),
              iconTransformation(extent={{90,-110},{110,-90}})));
      equation
        //QS balances
        Connections.branch(pin_pQS.reference, pin_nQS.reference);
        pin_pQS.reference.gamma = pin_nQS.reference.gamma;
        pin_pQS.i + pin_nQS.i = Complex(0);
        //DC current balance
        pin_pDC.i + pin_nDC.i = 0;
        //voltage relation
        vDC = 'abs'(vQS)*conversionFactor;
        //power balance
        pQS + pDC = 0;
        //define reactive power
        qQS = 0;
        annotation (Icon(graphics={Line(
                    points={{2,100},{2,60},{82,60},{2,60},{82,-60},{2,-60},{2,60},
                  {2,-100}},
                    color={0,0,255},
                    smooth=Smooth.None),Text(
                    extent={{40,40},{100,0}},
                    lineColor={0,0,255},
                    textString="DC"),Line(
                    points={{-2,100},{-2,60},{-82,60},{-2,60},{-82,-60},{-2,-60},
                  {-2,60},{-2,-100}},
                    color={85,170,255},
                    smooth=Smooth.None),Text(
                    extent={{-100,40},{-40,0}},
                    lineColor={85,170,255},
                    textString="QS"),Text(
                    extent={{-100,92},{100,60}},
                    lineColor={0,0,255},
                    textString="%name"),Text(
                    extent={{-100,-60},{100,-92}},
                    lineColor={0,0,255},
                    textString="%conversionFactor")}), Documentation(info="<html>
<p>
This is an ideal AC DC converter, based on a power balance between QS circuit and DC side.
The parameter <i>conversionFactor</i> defines the ratio between averaged DC voltage and QS rms voltage.
Furthermore, reactive power at the QS side is set to 0.
</p>
<h4>Note:</h4>
<p>
Of course no voltage or current ripple is present, neither at the QS side nor at the DC side.
At the QS side, only base harmonics of voltage and current are taken into account.
At the DC side, only the mean of voltage and current are taken into account.
</p>
</html>"));
      end IdealACDCConverter;

      model GraetzRectifier "Graetz rectifier bridge"
        Modelica_SIunits.Voltage vAC=pin_pAC.v - pin_nAC.v "AC voltage";
        Modelica_SIunits.Current iAC=pin_pAC.i "AC current";
        Modelica_SIunits.ActivePower pAC=vAC*iAC "AC power";
        Modelica_SIunits.Voltage vDC=pin_pDC.v - pin_nDC.v "DC voltage";
        Modelica_SIunits.Current iDC=pin_pDC.i "DC current";
        Modelica_SIunits.Power pDC=vDC*iDC "DC power";
        Modelica_Electrical_Analog.Interfaces.PositivePin pin_pAC annotation (
            Placement(transformation(extent={{-110,110},{-90,90}}),
              iconTransformation(extent={{-110,110},{-90,90}})));
        Modelica_Electrical_Analog.Interfaces.NegativePin pin_nAC annotation (
            Placement(transformation(extent={{-110,-110},{-90,-90}}),
              iconTransformation(extent={{-110,-110},{-90,-90}})));
        Modelica_Electrical_Analog.Interfaces.PositivePin pin_pDC annotation (
            Placement(transformation(extent={{90,110},{110,90}}),
              iconTransformation(extent={{90,110},{110,90}})));
        Modelica_Electrical_Analog.Interfaces.NegativePin pin_nDC annotation (
            Placement(transformation(extent={{90,-110},{110,-90}}),
              iconTransformation(extent={{90,-110},{110,-90}})));
        Modelica_Electrical_Analog.Ideal.IdealDiode idealDiode1(Vknee=0)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-40,30})));
        Modelica_Electrical_Analog.Ideal.IdealDiode idealDiode2(Vknee=0)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={40,30})));
        Modelica_Electrical_Analog.Ideal.IdealDiode idealDiode3(Vknee=0)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-40,-30})));
        Modelica_Electrical_Analog.Ideal.IdealDiode idealDiode4(Vknee=0)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={40,-30})));
      equation
        connect(idealDiode1.p, idealDiode3.n) annotation (Line(
            points={{-40,20},{-40,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(idealDiode2.p, idealDiode4.n) annotation (Line(
            points={{40,20},{40,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(idealDiode3.p, idealDiode4.p) annotation (Line(
            points={{-40,-40},{40,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(idealDiode1.n, idealDiode2.n) annotation (Line(
            points={{-40,40},{40,40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pin_pAC, idealDiode1.p) annotation (Line(
            points={{-100,100},{-100,10},{-40,10},{-40,20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pin_nAC, idealDiode4.n) annotation (Line(
            points={{-100,-100},{-100,-10},{40,-10},{40,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(idealDiode2.n, pin_pDC) annotation (Line(
            points={{40,40},{40,100},{100,100}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(idealDiode4.p, pin_nDC) annotation (Line(
            points={{40,-40},{40,-100},{100,-100}},
            color={0,0,255},
            smooth=Smooth.None));
        annotation (Icon(graphics={Line(
                    points={{2,100},{2,60},{82,60},{2,60},{82,-60},{2,-60},{2,60},
                  {2,-100}},
                    color={0,0,255},
                    smooth=Smooth.None),Text(
                    extent={{40,40},{100,0}},
                    lineColor={0,0,255},
                    textString="DC"),Line(
                    points={{-2,100},{-2,60},{-82,60},{-2,60},{-82,-60},{-2,-60},
                  {-2,60},{-2,-100}},
                    color={0,0,255},
                    smooth=Smooth.None),Text(
                    extent={{-100,40},{-40,0}},
                    lineColor={0,0,255},
                    textString="AC"),Text(
                    extent={{-100,92},{100,60}},
                    lineColor={0,0,255},
                    textString="%name")}), Documentation(info="<html>
<p>
This is a so called Graetz-bridge, a single phase rectifier built from 4 diodes.
</p>
</html>"));
      end GraetzRectifier;

      annotation (Documentation(info="<html>
<p>This package hosts utilities for test examples of quasi stationary single phase circuits.
Quasi stationary theory for single phase circuits can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Examples\">Examples</a>

</html>"));
    end Utilities;
    annotation (Icon(graphics={Rectangle(lineColor={0,0,255}, extent={{-50,-50},{
                50,50}}), Rectangle(
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid,
            extent={{-20,-20},{20,20}})}, coordinateSystem(extent={{-100,-100},{
              100,100}}, preserveAspectRatio=true)), Documentation(info="<html>
<p>This package hosts models for quasi stationary single phase circuits.
Quasi stationary theory for single phase circuits can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase\">MultiPhase</a>

</html>"));
  end SinglePhase;

  package Machines "Quasistationary machine models"
    extends Modelica_Icons.Package;

    package Examples "Test examples"
      extends Modelica_Icons.ExamplesPackage;

      model TransformerTestbench "Transformer Testbench"
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of phases";
        parameter Modelica_SIunits.Resistance RL[m]=fill(1/3, m)
          "Load resistance";
        MultiPhase.Sources.VoltageSource source(
          f=50,
          V=fill(100/sqrt(3), 3),
          m=m) annotation (Placement(transformation(
              origin={-90,-10},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        MultiPhase.Basic.Star starS(m=m) annotation (Placement(transformation(
              origin={-90,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        SinglePhase.Basic.Ground groundS annotation (Placement(transformation(
                extent={{-100,-80},{-80,-60}}, rotation=0)));
        MultiPhase.Sensors.PowerSensor electricalPowerSensorS(m=m) annotation (
            Placement(transformation(extent={{-90,0},{-70,20}}, rotation=0)));
        MultiPhase.Sensors.CurrentSensor currentSensorS(m=m) annotation (
            Placement(transformation(extent={{-60,20},{-40,0}}, rotation=0)));
        Modelica_ComplexBlocks.ComplexMath.ComplexToPolar polarIS[m]
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,40})));
        MultiPhase.Sensors.VoltageSensor voltageSensorS(m=m) annotation (
            Placement(transformation(
              origin={-50,-30},
              extent={{-10,10},{10,-10}},
              rotation=180)));
        Modelica_ComplexBlocks.ComplexMath.ComplexToPolar polarVS[m]
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,-60})));
        MultiPhase.Basic.Delta deltaS(m=m) annotation (Placement(transformation(
              origin={-50,-10},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        SinglePhase.Basic.Resistor earth(R_ref=1e6) annotation (Placement(
              transformation(
              origin={0,-40},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        SinglePhase.Basic.Ground groundT annotation (Placement(transformation(
                extent={{-10,-80},{10,-60}}, rotation=0)));
        MultiPhase.Sensors.VoltageSensor voltageSensorL(m=m) annotation (
            Placement(transformation(
              origin={50,-30},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        Modelica_ComplexBlocks.ComplexMath.ComplexToPolar polarVL[m]
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,-60})));
        MultiPhase.Basic.Delta deltaL(m=m) annotation (Placement(transformation(
              origin={50,-10},
              extent={{-10,10},{10,-10}},
              rotation=180)));
        MultiPhase.Sensors.CurrentSensor currentSensorL(m=m) annotation (
            Placement(transformation(extent={{40,20},{60,0}}, rotation=0)));
        Modelica_ComplexBlocks.ComplexMath.ComplexToPolar polarIL[m]
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={50,40})));
        MultiPhase.Sensors.PowerSensor electricalPowerSensorL(m=m) annotation (
            Placement(transformation(extent={{70,0},{90,20}}, rotation=0)));
        MultiPhase.Basic.Resistor load(R_ref=RL, m=m) annotation (Placement(
              transformation(
              origin={90,-10},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        MultiPhase.Basic.Star starL(m=m) annotation (Placement(transformation(
              origin={90,-40},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        SinglePhase.Basic.Ground groundL annotation (Placement(transformation(
                extent={{80,-80},{100,-60}}, rotation=0)));
        Modelica_Electrical_Machines.Utilities.TransformerData transformerData(
          C1=Modelica_Utilities.Strings.substring(
                  transformer.VectorGroup,
                  1,
                  1),
          C2=Modelica_Utilities.Strings.substring(
                  transformer.VectorGroup,
                  2,
                  2),
          f=50,
          V1=100,
          V2=100,
          SNominal=30E3,
          v_sc=0.05,
          P_sc=300) annotation (Placement(transformation(extent={{-10,40},{10,60}},
                rotation=0)));
        BasicMachines.Transformers.Yd.Yd01 transformer(
          n=transformerData.n,
          R1=transformerData.R1,
          L1sigma=transformerData.L1sigma,
          R2=transformerData.R2,
          L2sigma=transformerData.L2sigma,
          T1Ref=293.15,
          alpha20_1(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
          T2Ref=293.15,
          alpha20_2(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
          T1Operational=293.15,
          T2Operational=293.15) annotation (Placement(transformation(extent={{-20,
                  -10},{20,30}}, rotation=0)));

      initial equation
        source.plug_p.reference.gamma = 0;

      equation
        connect(starS.pin_n, groundS.pin) annotation (Line(
            points={{-90,-50},{-90,-60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(source.plug_n, starS.plug_p) annotation (Line(
            points={{-90,-20},{-90,-30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starL.pin_n, groundL.pin) annotation (Line(
            points={{90,-50},{90,-60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(load.plug_n, starL.plug_p) annotation (Line(
            points={{90,-20},{90,-30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(source.plug_p, electricalPowerSensorS.currentP) annotation (Line(
            points={{-90,0},{-90,10}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(electricalPowerSensorS.currentP, electricalPowerSensorS.voltageP)
          annotation (Line(
            points={{-90,10},{-90,20},{-80,20}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(electricalPowerSensorS.currentN, currentSensorS.plug_p)
          annotation (Line(
            points={{-70,10},{-60,10}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorS.plug_n, transformer.plug1) annotation (Line(
            points={{-40,10},{-20,10}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(transformer.plug2, currentSensorL.plug_p) annotation (Line(
            points={{20,10},{40,10}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorL.plug_n, electricalPowerSensorL.currentP)
          annotation (Line(
            points={{60,10},{70,10}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(electricalPowerSensorL.currentP, electricalPowerSensorL.voltageP)
          annotation (Line(
            points={{70,10},{70,20},{80,20}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(electricalPowerSensorL.currentN, load.plug_p) annotation (Line(
            points={{90,10},{90,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(electricalPowerSensorL.voltageN, starL.plug_p) annotation (Line(
            points={{80,0},{80,-30},{90,-30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(electricalPowerSensorS.voltageN, starS.plug_p) annotation (Line(
            points={{-80,0},{-80,-30},{-90,-30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(earth.pin_n, groundT.pin) annotation (Line(
            points={{0,-50},{0,-60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(deltaS.plug_p, voltageSensorS.plug_n) annotation (Line(
            points={{-60,-10},{-60,-30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(deltaS.plug_n, voltageSensorS.plug_p) annotation (Line(
            points={{-40,-10},{-40,-30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorS.plug_n, deltaS.plug_n) annotation (Line(
            points={{-40,10},{-40,-10}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(deltaL.plug_p, voltageSensorL.plug_n) annotation (Line(
            points={{60,-10},{60,-30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(deltaL.plug_n, voltageSensorL.plug_p) annotation (Line(
            points={{40,-10},{40,-30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorL.plug_p, deltaL.plug_n) annotation (Line(
            points={{40,10},{40,-10}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(polarIS.u, currentSensorS.y) annotation (Line(
            points={{-50,28},{-50,21}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(polarIL.u, currentSensorL.y) annotation (Line(
            points={{50,28},{50,21}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(voltageSensorS.y, polarVS.u) annotation (Line(
            points={{-50,-41},{-50,-48}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(voltageSensorL.y, polarVL.u) annotation (Line(
            points={{50,-41},{50,-48}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Documentation(info="<HTML>
Transformer testbench:<br>
You may choose different connections as well as vary the load (even not symmetrical).<br>
<b>Please pay attention</b> to proper grounding of the primary and secondary part of the whole circuit.<br>
The primary and secondary starpoint are available as connectors, if the connection is not delta (D or d).<br>
In some cases it may be necessary to ground the transformer's starpoint
even though the source's or load's starpoint are grounded; you may use a reasonable high earthing resistance.
</HTML>"),   experiment(StopTime=0.1, Interval=0.001));
      end TransformerTestbench;
      annotation (Documentation(info="<html>
Examples to demonstrate the usage of quasistationary electric components.
</html>"));
    end Examples;

    package BasicMachines "Basic machine models"
      extends Modelica_Icons.Package;

      package Transformers "Library for technical 3phase transformers"
        extends Modelica_Icons.Package;

        package Yy "Transformers: primary Y / secondary y"
          extends Modelica_Icons.VariantsPackage;

          model Yy00 "Transformer Yy0"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yy00");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, l2sigma.plug_p) annotation (Line(points={{10,10},
                    {10,20},{50,20},{50,0}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy0
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yy00;

          model Yy02 "Transformer Yy2"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yy02");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{50,-30},{30,-10}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot2.plug_p)
              annotation (Line(points={{50,0},{50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3) annotation (Line(points={{10,4},{
                    10,-4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n3, Rot2.plug_n) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                    {20,10},{20,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy2
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yy02;

          model Yy04 "Transformer Yy4"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yy04");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{30,10},{50,30}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(Rot2.plug_n, l2sigma.plug_p)
              annotation (Line(points={{50,20},{50,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, Rot2.plug_p) annotation (Line(points={{10,10},{
                    10,20},{30,20}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy4
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yy04;

          model Yy06 "Transformer Yy6"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yy06");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(l2sigma.plug_p, core.plug_n3) annotation (Line(points={{50,0},
                    {50,-20},{10,-20},{10,-10}}, color={85,170,255}));
            connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                    {20,10},{20,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy6
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yy06;

          model Yy08 "Transformer Yy8"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yy08");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{50,10},{30,30}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(Rot2.plug_p, l2sigma.plug_p)
              annotation (Line(points={{50,20},{50,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, Rot2.plug_n) annotation (Line(points={{10,10},{
                    10,20},{30,20}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy8
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yy08;

          model Yy10 "Transformer Yy10"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yy10");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{30,-30},{50,-10}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot2.plug_n)
              annotation (Line(points={{50,0},{50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, Rot2.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                    {20,10},{20,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy10
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yy10;
          annotation (Documentation(info="<HTML>
This package contains transformers primary Y connected / secondary y connected in all possible vector groups.
</HTML>",   revisions="<HTML>
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
  <li> v1.0.0 2006/11/19 Anton Haumer</li>
  </ul>
</HTML>"));
        end Yy;

        package Yd "Transformers: primary Y / secondary d"
          extends Modelica_Icons.VariantsPackage;

          model Yd01 "Transformer Yd1"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yd01");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{50,-30},{30,-10}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(Delta2.plug_p, r2.plug_n) annotation (Line(points={{50,-20},{
                    90,-20},{90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, Delta2.plug_n) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            connect(core.plug_p2, l2sigma.plug_p) annotation (Line(points={{10,10},
                    {10,20},{50,20},{50,0}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd1
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yd01;

          model Yd03 "Transformer Yd3"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yd03");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{30,10},{50,30}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{50,-30},{30,-10}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(Delta2.plug_n, r2.plug_n) annotation (Line(points={{50,20},{
                    90,20},{90,0}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot2.plug_p)
              annotation (Line(points={{50,0},{50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, Delta2.plug_p) annotation (Line(points={{10,10},
                    {10,20},{30,20}}, color={85,170,255}));
            connect(core.plug_n3, Rot2.plug_n) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd3
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yd03;

          model Yd05 "Transformer Yd5"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yd05");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{30,10},{50,30}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(Delta2.plug_n, r2.plug_n) annotation (Line(points={{50,20},{
                    90,20},{90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, l2sigma.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{50,-20},{50,0}}, color={85,170,255}));
            connect(core.plug_p2, Delta2.plug_p) annotation (Line(points={{10,10},
                    {10,20},{30,20}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd5
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yd05;

          model Yd07 "Transformer Yd7"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yd07");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{50,10},{30,30}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(Delta2.plug_p, r2.plug_n) annotation (Line(points={{50,20},{
                    90,20},{90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, Delta2.plug_n) annotation (Line(points={{10,10},
                    {10,20},{30,20}}, color={85,170,255}));
            connect(l2sigma.plug_p, core.plug_n3) annotation (Line(points={{50,0},
                    {50,-20},{10,-20},{10,-10}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd7
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yd07;

          model Yd09 "Transformer Yd9"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yd09");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{30,-30},{50,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{50,10},{30,30}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(Rot2.plug_p, l2sigma.plug_p)
              annotation (Line(points={{50,20},{50,0}}, color={85,170,255}));
            connect(Delta2.plug_n, r2.plug_n) annotation (Line(points={{50,-20},{
                    90,-20},{90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, Rot2.plug_n) annotation (Line(points={{10,10},{
                    10,20},{30,20}}, color={85,170,255}));
            connect(core.plug_n3, Delta2.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd9
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yd09;

          model Yd11 "Transformer Yd11"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yd11");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{30,-30},{50,-10}}, rotation=0)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(Delta2.plug_n, r2.plug_n) annotation (Line(points={{50,-20},{
                    90,-20},{90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, Delta2.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            connect(core.plug_p2, l2sigma.plug_p) annotation (Line(points={{10,10},
                    {10,20},{50,20},{50,0}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd11
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yd11;
          annotation (Documentation(info="<HTML>
This package contains transformers primary Y connected / secondary d connected in all possible vector groups.
</HTML>",   revisions="<HTML>
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
  <li> v1.0.0 2006/11/19 Anton Haumer</li>
  </ul>
</HTML>"));
        end Yd;

        package Yz "Transformers: primary Y / secondary zig-zag"
          extends Modelica_Icons.VariantsPackage;

          model Yz01 "Transformer Yz1"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yz01");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{-10,10},{10,-10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Rot22(final m=m) annotation (Placement(
                  transformation(
                  origin={40,20},
                  extent={{-10,10},{10,-10}},
                  rotation=180)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_n)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot22.plug_p)
              annotation (Line(points={{50,0},{50,20}}, color={85,170,255}));
            connect(Rot22.plug_n, core.plug_n2) annotation (Line(points={{30,20},
                    {20,20},{20,4},{10,4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz1
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yz01;

          model Yz03 "Transformer Yz3"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yz03");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{10,-10},{-10,10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Rot22(final m=m) annotation (Placement(
                  transformation(
                  origin={40,20},
                  extent={{-10,10},{10,-10}},
                  rotation=180)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_p)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot22.plug_p)
              annotation (Line(points={{50,0},{50,20}}, color={85,170,255}));
            connect(Rot22.plug_n, core.plug_n2) annotation (Line(points={{30,20},
                    {20,20},{20,4},{10,4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz3
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yz03;

          model Yz05 "Transformer Yz5"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yz05");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{-10,10},{10,-10}},
                  rotation=90)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_n)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-40},{10,-70},{10,-70}}, color={85,170,255}));
            connect(l2sigma.plug_p, core.plug_n2) annotation (Line(points={{50,0},
                    {50,20},{20,20},{20,4},{10,4}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz5
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yz05;

          model Yz07 "Transformer Yz7"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yz07");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{10,-10},{-10,10}},
                  rotation=90)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_p)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(l2sigma.plug_p, core.plug_n2) annotation (Line(points={{50,0},
                    {50,20},{20,20},{20,4},{10,4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-40},{10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz7
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yz07;

          model Yz09 "Transformer Yz9"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yz09");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{-10,10},{10,-10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Rot22(final m=m) annotation (Placement(
                  transformation(
                  origin={40,20},
                  extent={{10,10},{-10,-10}},
                  rotation=180)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_n)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot22.plug_n) annotation (Line(points={{50,0},
                    {50,20},{50,20}}, color={85,170,255}));
            connect(Rot22.plug_p, core.plug_n2) annotation (Line(points={{30,20},
                    {20,20},{20,4},{10,4}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz9
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yz09;

          model Yz11 "Transformer Yz11"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Yz11");
            MultiPhase.Basic.Star star1(final m=m) annotation (Placement(
                  transformation(
                  origin={-10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint1 annotation (Placement(
                  transformation(extent={{-60,-110},{-40,-90}}, rotation=0)));
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{10,-10},{-10,10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Rot22(final m=m) annotation (Placement(
                  transformation(
                  origin={40,20},
                  extent={{10,10},{-10,-10}},
                  rotation=180)));
          equation
            connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                    -10,-100},{-50,-100}}, color={85,170,255}));
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                    {-10,-37.5},{-10,-70},{-10,-70}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_p)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot22.plug_n)
              annotation (Line(points={{50,0},{50,20}}, color={85,170,255}));
            connect(Rot22.plug_p, core.plug_n2) annotation (Line(points={{30,20},
                    {20,20},{20,4},{10,4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz11
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Yz11;
          annotation (Documentation(info="<HTML>
This package contains transformers primary Y connected / secondary zig-zag connected in all possible vector groups.
</HTML>",   revisions="<HTML>
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
  <li> v1.0.0 2006/11/19 Anton Haumer</li>
  </ul>
</HTML>"));
        end Yz;

        package Dy "Transformers: primary D / secondary y"
          extends Modelica_Icons.VariantsPackage;

          model Dy01 "Transformer Dy1"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dy01");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{50,-30},{30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot2.plug_p)
              annotation (Line(points={{50,0},{50,-20}}, color={85,170,255}));
            connect(Delta1.plug_p, r1.plug_p) annotation (Line(points={{-50,-20},
                    {-90,-20},{-90,0}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, Rot2.plug_n) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                    {20,10},{20,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy1
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dy01;

          model Dy03 "Transformer Dy3"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dy03");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{30,10},{50,30}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(Rot2.plug_n, l2sigma.plug_p)
              annotation (Line(points={{50,20},{50,0}}, color={85,170,255}));
            connect(Delta1.plug_p, r1.plug_p) annotation (Line(points={{-50,-20},
                    {-90,-20},{-90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_p2, Rot2.plug_p) annotation (Line(points={{10,10},{
                    10,20},{30,20}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-40},{10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy3
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dy03;

          model Dy05 "Transformer Dy5"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dy05");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(Delta1.plug_p, r1.plug_p) annotation (Line(points={{-50,-20},
                    {-90,-20},{-90,0}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(l2sigma.plug_p, core.plug_n3) annotation (Line(points={{50,0},
                    {50,-20},{10,-20},{10,-10}}, color={85,170,255}));
            connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                    {20,10},{20,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy5
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dy05;

          model Dy07 "Transformer Dy7"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dy07");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{50,10},{30,30}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(Rot2.plug_p, l2sigma.plug_p)
              annotation (Line(points={{50,20},{50,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-40},{10,-70},{10,-70}}, color={85,170,255}));
            connect(core.plug_p2, Rot2.plug_n) annotation (Line(points={{10,10},{
                    10,20},{30,20}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy7
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dy07;

          model Dy09 "Transformer Dy9"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dy09");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{30,-30},{50,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot2.plug_n)
              annotation (Line(points={{50,0},{50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, Rot2.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                    {20,10},{20,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy9
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dy09;

          model Dy11 "Transformer Dy11"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dy11");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-40},{10,-70},{10,-70}}, color={85,170,255}));
            connect(core.plug_p2, l2sigma.plug_p) annotation (Line(points={{10,10},
                    {10,20},{50,20},{50,0}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy11
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dy11;
          annotation (Documentation(info="<HTML>
This package contains transformers primary D connected / secondary y connected in all possible vector groups.
</HTML>",   revisions="<HTML>
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
  <li> v1.0.0 2006/11/19 Anton Haumer</li>
  </ul>
</HTML>"));
        end Dy;

        package Dd "Transformers: primary D / secondary d"
          extends Modelica_Icons.VariantsPackage;

          model Dd00 "Transformer Dd0"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dd00");
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{50,-30},{30,-10}}, rotation=0)));
          equation
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(Delta2.plug_p, r2.plug_n) annotation (Line(points={{50,-20},{
                    90,-20},{90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, l2sigma.plug_p) annotation (Line(points={{10,10},
                    {10,20},{50,20},{50,0}}, color={85,170,255}));
            connect(core.plug_n3, Delta2.plug_n) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd0
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dd00;

          model Dd02 "Transformer Dd2"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dd02");
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{30,10},{50,30}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{50,-30},{30,-10}}, rotation=0)));
          equation
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(Delta2.plug_n, r2.plug_n) annotation (Line(points={{50,20},{
                    90,20},{90,0}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot2.plug_p)
              annotation (Line(points={{50,0},{50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, Delta2.plug_p) annotation (Line(points={{10,10},
                    {10,20},{30,20}}, color={85,170,255}));
            connect(core.plug_n3, Rot2.plug_n) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,25}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd2
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dd02;

          model Dd04 "Transformer Dd4"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dd04");
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{30,10},{50,30}}, rotation=0)));
          equation
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,25}));
            connect(Delta2.plug_n, r2.plug_n) annotation (Line(points={{50,20},{
                    90,20},{90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,25}));
            connect(core.plug_n2, core.plug_p3) annotation (Line(points={{10,4},{
                    10,1},{10,1},{10,-4}}, color={85,170,25}));
            connect(core.plug_p2, Delta2.plug_p) annotation (Line(points={{10,10},
                    {10,20},{30,20}}, color={85,170,255}));
            connect(core.plug_n3, l2sigma.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{50,-20},{50,0}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd4
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dd04;

          model Dd06 "Transformer Dd6"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dd06");
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{50,10},{30,30}}, rotation=0)));
          equation
            connect(Delta2.plug_p, r2.plug_n) annotation (Line(points={{50,20},{
                    90,20},{90,0}}, color={85,170,255}));
            connect(Delta1.plug_p, r1.plug_p) annotation (Line(points={{-50,-20},
                    {-90,-20},{-90,0}}, color={85,170,25}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,25}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(Delta2.plug_n, core.plug_p2) annotation (Line(points={{30,20},
                    {10,20},{10,10}}, color={85,170,255}));
            connect(core.plug_n3, l2sigma.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{50,-20},{50,0}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd6
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dd06;

          model Dd08 "Transformer Dd8"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dd08");
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Rot2(final m=m) annotation (Placement(
                  transformation(extent={{50,10},{30,30}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{30,-30},{50,-10}}, rotation=0)));
          equation
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,25}));
            connect(Delta2.plug_n, r2.plug_n) annotation (Line(points={{50,-20},{
                    90,-20},{90,0}}, color={85,170,255}));
            connect(Rot2.plug_p, l2sigma.plug_p)
              annotation (Line(points={{50,20},{50,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(core.plug_n1, Delta1.plug_n) annotation (Line(points={{-10,-5},
                    {-10,-20},{-30,-20}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, Rot2.plug_n) annotation (Line(points={{10,10},{
                    10,20},{30,20}}, color={85,170,255}));
            connect(core.plug_n3, Delta2.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd8
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dd08;

          model Dd10 "Transformer Dd10"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dd10");
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
            MultiPhase.Basic.Delta Delta2(final m=m) annotation (Placement(
                  transformation(extent={{30,-30},{50,-10}}, rotation=0)));
          equation
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(Delta2.plug_n, r2.plug_n) annotation (Line(points={{50,-20},{
                    90,-20},{90,0}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_n2, core.plug_p3)
              annotation (Line(points={{10,4},{10,-4}}, color={85,170,255}));
            connect(core.plug_p2, l2sigma.plug_p) annotation (Line(points={{10,10},
                    {10,20},{50,20},{50,0}}, color={85,170,255}));
            connect(core.plug_n3, Delta2.plug_p) annotation (Line(points={{10,-10},
                    {10,-20},{30,-20}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd10
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dd10;
          annotation (Documentation(info="<HTML>
This package contains transformers primary D connected / secondary d connected in all possible vector groups.
</HTML>",   revisions="<HTML>
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
  <li> v1.0.0 2006/11/19 Anton Haumer</li>
  </ul>
</HTML>"));
        end Dd;

        package Dz "Transformers: primary D / secondary zig-zag"
          extends Modelica_Icons.VariantsPackage;

          model Dz00 "Transformer Dz0"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dz00");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{-10,10},{10,-10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Rot22(final m=m) annotation (Placement(
                  transformation(
                  origin={40,20},
                  extent={{-10,10},{10,-10}},
                  rotation=180)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_n)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot22.plug_p)
              annotation (Line(points={{50,0},{50,20}}, color={85,170,255}));
            connect(Rot22.plug_n, core.plug_n2) annotation (Line(points={{30,20},
                    {20,20},{20,4},{10,4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz0
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dz00;

          model Dz02 "Transformer Dz2"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dz02");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{10,-10},{-10,10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Rot22(final m=m) annotation (Placement(
                  transformation(
                  origin={40,20},
                  extent={{-10,10},{10,-10}},
                  rotation=180)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_p)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot22.plug_p)
              annotation (Line(points={{50,0},{50,20}}, color={85,170,255}));
            connect(Rot22.plug_n, core.plug_n2) annotation (Line(points={{30,20},
                    {20,20},{20,4},{10,4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-40},{10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz2
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dz02;

          model Dz04 "Transformer Dz4"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dz04");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{-10,10},{10,-10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_n)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(l2sigma.plug_p, core.plug_n2) annotation (Line(points={{50,0},
                    {50,20},{20,20},{20,4},{10,4}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz4
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dz04;

          model Dz06 "Transformer Dz6"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dz06");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{10,-10},{-10,10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_p)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-40},{10,-70},{10,-70}}, color={85,170,255}));
            connect(l2sigma.plug_p, core.plug_n2) annotation (Line(points={{50,0},
                    {50,20},{20,20},{20,4},{10,4}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz6
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dz06;

          model Dz08 "Transformer Dz8"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dz08");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{-10,10},{10,-10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Rot22(final m=m) annotation (Placement(
                  transformation(
                  origin={40,20},
                  extent={{10,10},{-10,-10}},
                  rotation=180)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_n)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot22.plug_n) annotation (Line(points={{50,0},
                    {50,20},{50,20}}, color={85,170,255}));
            connect(Rot22.plug_p, core.plug_n2) annotation (Line(points={{30,20},
                    {20,20},{20,4},{10,4}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz8
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dz08;

          model Dz10 "Transformer Dz10"

            extends
              Modelica_Electrical_QuasiStationary.Machines.Interfaces.PartialBasicTransformer(
                final VectorGroup="Dz10");
            MultiPhase.Basic.Star star2(final m=m) annotation (Placement(
                  transformation(
                  origin={10,-80},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            SinglePhase.Interfaces.NegativePin starpoint2 annotation (Placement(
                  transformation(extent={{40,-110},{60,-90}}, rotation=0)));
            MultiPhase.Basic.Delta Rot21(final m=m) annotation (Placement(
                  transformation(
                  origin={30,0},
                  extent={{10,-10},{-10,10}},
                  rotation=90)));
            MultiPhase.Basic.Delta Rot22(final m=m) annotation (Placement(
                  transformation(
                  origin={40,20},
                  extent={{10,10},{-10,-10}},
                  rotation=180)));
            MultiPhase.Basic.Delta Delta1(final m=m) annotation (Placement(
                  transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
          equation
            connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                    10,-100},{50,-100}}, color={85,170,255}));
            connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                    -20},{-50,-20}}, color={85,170,255}));
            connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                    {-50,20},{-10,20},{-10,5}}, color={85,170,255}));
            connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                    {-10,-20},{-10,-5}}, color={85,170,255}));
            connect(core.plug_p2, Rot21.plug_p)
              annotation (Line(points={{10,10},{30,10}}, color={85,170,255}));
            connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                    {20,-4},{20,-10},{30,-10}}, color={85,170,255}));
            connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                    {10,-70},{10,-70}}, color={85,170,255}));
            connect(l2sigma.plug_p, Rot22.plug_n)
              annotation (Line(points={{50,0},{50,20}}, color={85,170,255}));
            connect(Rot22.plug_p, core.plug_n2) annotation (Line(points={{30,20},
                    {20,20},{20,4},{10,4}}, color={85,170,255}));
            annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz10
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
          end Dz10;
          annotation (Documentation(info="<HTML>
This package contains transformers primary D connected / secondary d connected in all possible vector groups.
</HTML>",   revisions="<HTML>
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
  <li> v1.0.0 2006/11/19 Anton Haumer</li>
  </ul>
</HTML>"));
        end Dz;

        annotation (Documentation(info="<HTML>
This package contains components to model technical three-phase transformers:
<ul>
<li>Transformer: transformer model to choose connection / vector group</li>
<li>Yy: Transformers with primary primary Y / secondary y</li>
<li>Yd: Transformers with primary primary Y / secondary d</li>
<li>Yz: Transformers with primary primary Y / secondary zig-zag</li>
<li>Dy: Transformers with primary primary D / secondary y</li>
<li>Dd: Transformers with primary D / secondary d</li>
<li>Dz: Transformers with primary D / secondary zig-zag</li>
</ul>
<p>
Transformers are modeled by an ideal transformer, adding primary and secondary winding resistances and stray inductances.<br>
All transformers extend from the base model <i>PartialTransformer</i>, adding the primary and secondary connection.<br>
<b>VectorGroup</b> defines the phase shift between primary and secondary voltages, expressed by a number phase shift/30 degree
(i.e., the hour on a clock face). Therefore each transformer is identified by two characters and a two-digit number,
e.g., Yd11 ... primary connection Y (star), secondary connection d (delta), vector group 11 (phase shift 330 degree)<br>
With the \"supermodel\" <i>Transformer</i>&nbsp; the user may choose primary and secondary connection as well as the vector group.<br>
It calculates winding ratio as well as primary and secondary winding resistances and stray inductances,
distributing them equally to primary and secondary winding, from the following parameters:
</p>
<ul>
<li>nominal frequency</li>
<li>primary voltage (RMS line-to-line)</li>
<li>secondary voltage (RMS line-to-line)</li>
<li>nominal apparent power</li>
<li>impedance voltage drop</li>
<li>short-circuit copper losses</li>
</ul>
The <b>impedance voltage drop</b> indicates the (absolute value of the) voltage drop at nominal load (current) as well as
the voltage we have to apply to the primary winding to achieve nominal current in the short-circuited secondary winding.
<p>
<b>Please pay attention</b> to proper grounding of the primary and secondary part of the whole circuit.<br>
The primary and secondary starpoint are available as connectors, if the connection is not delta (D or d).<br>
<b>In some cases (Yy or Yz) it may be necessary to ground one of the transformer's starpoints
even though the source's and/or load's starpoint are grounded; you may use a reasonable high earthing resistance.</b>
</p>
<b>Limitations and assumptions:</b><br>
<ul>
<li>number of phases is limited to 3, therefore definition as a constant m=3</li>
<li>symmetry of the 3 phases resp. limbs</li>
<li>saturation is neglected, i.e., inductances are constant</li>
<li>magnetizing current is neglected</li>
<li>magnetizing losses are neglected</li>
<li>additional (stray) losses are neglected</li>
</ul>
<b>Further development:</b>
<ul>
<li>modeling magnetizing current, including saturation</li>
<li>temperature dependency of winding resistances</li>
</ul>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting &amp; Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</dl>
<p>
Copyright &copy; 1998-2013, Modelica Association and Anton Haumer.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</HTML>",   revisions="<HTML>
  <ul>
  <li> v1.0.0 2006/11/19 Anton Haumer<br>
       first stable release</li>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={
              Polygon(
                origin={10,10},
                fillColor={135,135,135},
                fillPattern=FillPattern.VerticalCylinder,
                points={{-80,50},{-60,30},{-60,-50},{-80,-70},{-80,50}}),
              Polygon(
                origin={10,10},
                fillColor={135,135,135},
                fillPattern=FillPattern.VerticalCylinder,
                points={{60,50},{40,30},{40,-50},{60,-70},{60,50}}),
              Polygon(
                origin={10,10},
                fillColor={135,135,135},
                fillPattern=FillPattern.VerticalCylinder,
                points={{-10,40},{-20,30},{-20,-50},{-10,-60},{0,-50},{0,30},{-10,
                    40}}),
              Polygon(
                origin={10,10},
                fillColor={135,135,135},
                fillPattern=FillPattern.VerticalCylinder,
                points={{-80,50},{60,50},{40,30},{0,30},{-10,40},{-20,30},{-60,30},
                    {-80,50}}),
              Polygon(
                origin={10,10},
                fillColor={135,135,135},
                fillPattern=FillPattern.VerticalCylinder,
                points={{-80,-70},{60,-70},{40,-50},{0,-50},{-10,-60},{-20,-50},{
                    -60,-50},{-80,-70}}),
              Rectangle(
                origin={10,10},
                lineColor={213,170,255},
                fillColor={213,170,255},
                fillPattern=FillPattern.VerticalCylinder,
                extent={{-88,-46},{-52,26}}),
              Rectangle(
                origin={10,10},
                lineColor={170,213,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.VerticalCylinder,
                extent={{-94,-38},{-46,18}}),
              Rectangle(
                origin={10,10},
                lineColor={213,170,255},
                fillColor={213,170,255},
                fillPattern=FillPattern.VerticalCylinder,
                extent={{-28,-46},{8,26}}),
              Rectangle(
                origin={10,10},
                lineColor={170,213,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.VerticalCylinder,
                extent={{-34,-38},{14,18}}),
              Rectangle(
                origin={10,10},
                lineColor={213,170,255},
                fillColor={213,170,255},
                fillPattern=FillPattern.VerticalCylinder,
                extent={{32,-46},{68,26}}),
              Rectangle(
                origin={10,10},
                lineColor={170,213,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.VerticalCylinder,
                extent={{26,-38},{74,18}})}));
      end Transformers;

      package Components "Machine components like AirGaps"
        extends Modelica_Icons.Package;

        partial model PartialCore
          "Partial model of transformer core with 3 windings"
          parameter Integer m(final min=1) = 3 "Number of phases";
          parameter Real n12(start=1) "Turns ratio 1:2";
          parameter Real n13(start=1) "Turns ratio 1:3";
          Modelica_SIunits.ComplexVoltage v1[m];
          Modelica_SIunits.ComplexCurrent i1[m];
          Modelica_SIunits.ComplexVoltage v2[m];
          Modelica_SIunits.ComplexCurrent i2[m];
          Modelica_SIunits.ComplexVoltage v3[m];
          Modelica_SIunits.ComplexCurrent i3[m];
          Modelica_SIunits.ComplexCurrent im[m] "Magnetizing current";
          MultiPhase.Interfaces.PositivePlug plug_p1(final m=m) annotation (
              Placement(transformation(extent={{-110,40},{-90,60}}, rotation=0)));
          MultiPhase.Interfaces.NegativePlug plug_n1(final m=m) annotation (
              Placement(transformation(extent={{-110,-60},{-90,-40}}, rotation=
                    0)));
          MultiPhase.Interfaces.PositivePlug plug_p2(final m=m) annotation (
              Placement(transformation(extent={{90,90},{110,110}}, rotation=0)));
          MultiPhase.Interfaces.NegativePlug plug_n2(final m=m) annotation (
              Placement(transformation(extent={{90,30},{110,50}}, rotation=0)));
          MultiPhase.Interfaces.PositivePlug plug_p3(final m=m) annotation (
              Placement(transformation(extent={{90,-30},{110,-50}}, rotation=0)));
          MultiPhase.Interfaces.NegativePlug plug_n3(final m=m) annotation (
              Placement(transformation(extent={{90,-90},{110,-110}}, rotation=0)));
        equation
          v1 = plug_p1.pin.v - plug_n1.pin.v;
          i1 = plug_p1.pin.i;
          v2 = plug_p2.pin.v - plug_n2.pin.v;
          i2 = plug_p2.pin.i;
          v3 = plug_p3.pin.v - plug_n3.pin.v;
          i3 = plug_p3.pin.i;
          im = i1 + i2/n12 + i3/n13;
          //branches p1-n1, p2-n2, p3-n3
          Connections.branch(plug_p1.reference, plug_n1.reference);
          plug_p1.reference.gamma = plug_n1.reference.gamma;
          Connections.branch(plug_p2.reference, plug_n2.reference);
          plug_p2.reference.gamma = plug_n2.reference.gamma;
          Connections.branch(plug_p3.reference, plug_n3.reference);
          plug_p3.reference.gamma = plug_n3.reference.gamma;
          //Define p1.reference.gamme = p2.reference.gamma = p3.reference.gamma
          Connections.branch(plug_p1.reference, plug_p2.reference);
          plug_p1.reference.gamma = plug_p2.reference.gamma;
          Connections.branch(plug_p1.reference, plug_p3.reference);
          plug_p1.reference.gamma = plug_p3.reference.gamma;
          //Define p1, p2 and p3 as potential roots
          //Note: transformer could be fed from primary or secondary side
          Connections.potentialRoot(plug_p1.reference);
          Connections.potentialRoot(plug_p2.reference);
          Connections.potentialRoot(plug_p3.reference);
          //Current balances
          plug_p1.pin.i + plug_n1.pin.i = fill(Complex(0), m);
          plug_p2.pin.i + plug_n2.pin.i = fill(Complex(0), m);
          plug_p3.pin.i + plug_n3.pin.i = fill(Complex(0), m);
          annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}), graphics={
                Text(
                  extent={{-100,130},{100,110}},
                  textString="%name",
                  lineColor={0,0,255}),
                Ellipse(extent={{-45,-50},{-20,-25}}, lineColor={0,0,255}),
                Ellipse(extent={{-45,-25},{-20,0}}, lineColor={0,0,255}),
                Ellipse(extent={{-45,0},{-20,25}}, lineColor={0,0,255}),
                Ellipse(extent={{-45,25},{-20,50}}, lineColor={0,0,255}),
                Rectangle(
                  extent={{-46,-50},{-34,50}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Line(points={{-90,50},{-32,50}}, color={0,0,255}),
                Line(points={{-90,-50},{-32,-50}}, color={0,0,255}),
                Ellipse(extent={{20,40},{45,65}}, lineColor={0,0,255}),
                Ellipse(extent={{20,65},{45,90}}, lineColor={0,0,255}),
                Rectangle(
                  extent={{36,40},{46,90}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Line(points={{32,90},{90,90}}, color={0,0,255}),
                Line(points={{34,40},{92,40}}, color={0,0,255}),
                Ellipse(extent={{20,-90},{45,-65}}, lineColor={0,0,255}),
                Ellipse(extent={{20,-65},{45,-40}}, lineColor={0,0,255}),
                Rectangle(
                  extent={{36,-90},{46,-40}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Line(points={{32,-40},{90,-40}}, color={0,0,255}),
                Line(points={{34,-90},{92,-90}}, color={0,0,255})}),
              Documentation(info="<html>
Partial model of transformer core with 3 windings; saturation function flux versus magnetizing current has to be defined.
</html>"));
        end PartialCore;

        model IdealCore "Ideal transformer with 3 windings"
          extends PartialCore;
        equation
          im = fill(Complex(0), m);
          v1 = n12*v2;
          v1 = n13*v3;
          annotation (defaultComponentName="core", Documentation(info="<html>
Ideal transformer with 3 windings: no magnetizing current.
</html>"));
        end IdealCore;
        annotation (Documentation(info="<html>
<p>
This package contains components for modeling electrical machines, specially three-phase induction machines, based on space phasor theory.
</p>
</html>"));
      end Components;
      annotation (Icon(graphics={
            Rectangle(
              origin={0,14.817},
              fillColor={170,213,255},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-54.179,-59.817},{65.821,60.183}}),
            Rectangle(
              origin={5.821,15},
              fillColor={128,128,128},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-80,-60},{-60,60}}),
            Rectangle(
              origin={5.821,15},
              fillColor={95,95,95},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{60,-10},{80,10}}),
            Rectangle(
              origin={5.821,15},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              extent={{-60,50},{20,70}}),
            Polygon(
              origin={5.821,15},
              fillPattern=FillPattern.Solid,
              points={{-70,-90},{-60,-90},{-30,-20},{20,-20},{50,-90},{60,-90},{
                  60,-100},{-70,-100},{-70,-90}})}), Documentation(info="<html>
This package contains components for modeling quasi stationary electrical induction machines machines, based on space phasor theory:
<ul>
<li>package AsynchronousInductionMachines: quasi stationary models of three phase asynchronous induction machines</li>
<li>package SynchronousInductionMachines: quasi stationary models of three phase synchronous induction machines</li>
<li>package Transformers: quasi stationary three-phase transformers (see detailed documentation in subpackage)</li>
<li>package Components: components for quasi stationary modeling machines and transformers</li>
</ul>
</html>"));
    end BasicMachines;

    package Interfaces "SpacePhasor connector and PartialMachines"
      extends Modelica_Icons.InterfacesPackage;

      partial model PartialBasicTransformer
        "Partial model of three-phase transformer"
        extends Modelica_Electrical_Machines.Icons.QuasiStationaryTransformer;
        constant Integer m(min=1) = 3 "Number of phases";
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
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20_1(start=0)
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
          Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
          alpha20_2(start=0)
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
        output Modelica_Electrical_Machines.Interfaces.PowerBalanceTransformer
          powerBalance(
          final power1=sum({Modelica_ComplexMath.real(v1[j]*
              Modelica_ComplexMath.conj(i1[j])) for j in 1:m}),
          final power2=sum({Modelica_ComplexMath.real(v2[j]*
              Modelica_ComplexMath.conj(-i2[j])) for j in 1:m}),
          final lossPower1=-sum(r1.resistor.LossPower),
          final lossPower2=-sum(r2.resistor.LossPower),
          final lossPowerCore=0) "Power balance";
        output Modelica_SIunits.ComplexVoltage v1[m]=plug1.pin.v
          "Primary voltage";
        output Modelica_SIunits.ComplexCurrent i1[m]=plug1.pin.i
          "Primary current";
        output Modelica_SIunits.ComplexVoltage v2[m]=plug2.pin.v
          "Secondary voltage";
        output Modelica_SIunits.ComplexCurrent i2[m]=plug2.pin.i
          "Secondary current";
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
        MultiPhase.Interfaces.PositivePlug plug1(final m=m) "Primary plug"
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0)));
        MultiPhase.Interfaces.NegativePlug plug2(final m=m) "Secondary plug"
          annotation (Placement(transformation(extent={{90,-10},{110,10}},
                rotation=0)));
        MultiPhase.Basic.Resistor r1(
          final m=m,
          final R_ref=fill(R1, m),
          final T_ref=fill(T1Ref, m),
          final alpha_ref=fill(
              Modelica_Electrical_Machines.Thermal.convertAlpha(alpha20_1,
              T1Ref), m),
          final useHeatPort=true,
          final T=fill(T1Ref, m)) annotation (Placement(transformation(extent={
                  {-90,10},{-70,-10}}, rotation=0)));
        MultiPhase.Basic.Inductor l1sigma(final m=m, final L=fill(L1sigma, m))
          annotation (Placement(transformation(extent={{-70,-10},{-50,10}},
                rotation=0)));
        MultiPhase.Basic.Resistor r2(
          final m=m,
          final R_ref=fill(R2, m),
          final T_ref=fill(T2Ref, m),
          final alpha_ref=fill(
              Modelica_Electrical_Machines.Thermal.convertAlpha(alpha20_2,
              T2Ref), m),
          final useHeatPort=true,
          final T=fill(T2Ref, m)) annotation (Placement(transformation(extent={
                  {70,10},{90,-10}}, rotation=0)));
        MultiPhase.Basic.Inductor l2sigma(final m=m, final L=fill(L2sigma, m))
          annotation (Placement(transformation(extent={{50,-10},{70,10}},
                rotation=0)));
        BasicMachines.Components.IdealCore core(
          final m=m,
          final n12=ni,
          final n13=ni) annotation (Placement(transformation(extent={{-10,-10},
                  {10,10}}, rotation=0)));
        Modelica_Electrical_Machines.Interfaces.ThermalPortTransformer
          thermalPort if useThermalPort
          annotation (Placement(transformation(extent={{-10,90},{10,110}})));
        Modelica_Electrical_Machines.Thermal.ThermalAmbientTransformer
          thermalAmbient(
          final useTemperatureInputs=false,
          final T1=T1Operational,
          final T2=T2Operational) if not useThermalPort annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,80})));
      protected
        Modelica_Electrical_Machines.Interfaces.ThermalPortTransformer
          internalThermalPort
          annotation (Placement(transformation(extent={{-4,76},{4,84}})));
      equation
        connect(r1.plug_n, l1sigma.plug_p)
          annotation (Line(points={{-70,0},{-70,0}}, color={85,170,255}));
        connect(l2sigma.plug_n, r2.plug_p)
          annotation (Line(points={{70,0},{70,0}}, color={85,170,255}));
        connect(plug1, r1.plug_p)
          annotation (Line(points={{-100,0},{-90,0}}, color={85,170,255}));
        connect(r2.plug_n, plug2)
          annotation (Line(points={{90,0},{100,0}}, color={85,170,255}));
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
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{0,-60},{0,-100}},
                lineColor={0,0,0},
                textString="%VectorGroup"), Text(
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
</html>"));
      end PartialBasicTransformer;
      annotation (Documentation(info="<html>
<p>
This package contains the quasi stationary space phasor connector and partial models for quasi stationary machine models.
</p>
</html>"));
    end Interfaces;

    package SpacePhasors
      "Space phasor components for quasi stationary electric machines"
      extends Modelica_Icons.Package;
      package Blocks
        extends Modelica_Icons.Package;
        block ToSpacePhasor "Conversion: three phase -> space phasor"
          extends Modelica_Blocks.Icons.Block;
          import Modelica_ComplexMath.j;
          import Modelica_ComplexMath.exp;
          import Modelica_ComplexMath.'sum';
          parameter Integer m(min=1) = 3 "Number of phases";
          Modelica_ComplexBlocks.Interfaces.ComplexInput u[m]
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica_Blocks.Interfaces.RealOutput y[2]
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        protected
          parameter Modelica_SIunits.Angle phi[m]=
              Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
          Complex c;
        equation
          c = sqrt(2)/m*'sum'({u[k]*exp(j*phi[k]) for k in 1:m});
          y = {c.re,c.im};
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                    100,100}}), graphics={Line(points={{0,0},{80,80},{60,72},{72,
                  60},{80,80}}, color={0,0,255}),Line(points={{0,0},{80,-80},{72,
                  -60},{60,-72},{80,-80}}, color={0,0,255}),Line(
                        points={{-80,0},{-73.33,10},{-66.67,17.32},{-60,20},{-53.33,
                    17.32},{-46.67,10},{-40,0},{-33.33,-10},{-26.67,-17.32},{-20,
                    -20},{-13.33,-17.32},{-6.67,-10},{0,0}},
                        color={0,0,255},
                        smooth=Smooth.Bezier),Line(
                        points={{-90,0},{-83.33,10},{-76.67,17.32},{-70,20},{-63.33,
                    17.32},{-56.67,10},{-50,0},{-43.33,-10},{-36.67,-17.32},{-30,
                    -20},{-23.33,-17.32},{-16.67,-10},{-10,0}},
                        color={0,0,255},
                        smooth=Smooth.Bezier),Line(
                        points={{-70,0},{-63.33,10},{-56.67,17.32},{-50,20},{-43.33,
                    17.32},{-36.67,10},{-30,0},{-23.33,-10},{-16.67,-17.32},{-10,
                    -20},{-3.33,-17.32},{3.33,-10},{10,0}},
                        color={0,0,255},
                        smooth=Smooth.Bezier),Text(
                        extent={{-12,-74},{64,-86}},
                        lineColor={0,0,0},
                        textString="zero")}),
            Documentation(info="<HTML>
Transformation of quasi stationary multi phase values (voltages or currents) to space phasor and zero sequence value.
</HTML>"),  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}), graphics));
        end ToSpacePhasor;

        block FromSpacePhasor "Conversion: space phasor -> three phase"
          extends Modelica_Blocks.Icons.Block;
          import Modelica_ComplexMath.j;
          import Modelica_ComplexMath.exp;
          parameter Integer m(min=1) = 3 "Number of phases";
          Modelica_Blocks.Interfaces.RealInput u[2]
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica_ComplexBlocks.Interfaces.ComplexOutput y[m]
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        protected
          parameter Modelica_SIunits.Angle phi[m]=
              Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
        equation
          y = {Complex(u[1], u[2])*exp(-j*phi[k])/sqrt(2) for k in 1:m};
          annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}), graphics={Line(points={{0,0},{-80,80},{-60,
                  72},{-72,60},{-80,80}}, color={0,0,255}),Line(points={{0,0},{-80,
                  -80},{-72,-60},{-60,-72},{-80,-80}}, color={0,0,255}),Line(
                        points={{0,0},{6.67,10},{13.33,17.32},{20,20},{26.67,
                    17.32},{33.33,10},{40,0},{46.67,-10},{53.33,-17.32},{60,-20},
                    {66.67,-17.32},{73.33,-10},{80,0}},
                        color={0,0,255},
                        smooth=Smooth.Bezier),Line(
                        points={{-10,0},{-3.33,10},{3.33,17.32},{10,20},{16.67,
                    17.32},{23.33,10},{30,0},{36.67,-10},{43.33,-17.32},{50,-20},
                    {56.67,-17.32},{63.33,-10},{70,0}},
                        color={0,0,255},
                        smooth=Smooth.Bezier),Line(
                        points={{10,0},{16.67,10},{23.33,17.32},{30,20},{36.67,
                    17.32},{43.33,10},{50,0},{56.67,-10},{63.33,-17.32},{70,-20},
                    {76.67,-17.32},{83.33,-10},{90,0}},
                        color={0,0,255},
                        smooth=Smooth.Bezier),Text(
                        extent={{-62,-74},{14,-86}},
                        lineColor={0,0,0},
                        textString="zero")}), Documentation(info="<HTML>
Transformation of space phasor and zero sequence value to quasi stationary multi phase values (voltages or currents).
</HTML>"));
        end FromSpacePhasor;
      end Blocks;
    end SpacePhasors;
    annotation (Icon(graphics={
          Rectangle(
            origin={0,14.817},
            fillColor={170,213,255},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-54.179,-59.817},{65.821,60.183}}),
          Rectangle(
            origin={5.821,15},
            fillColor={128,128,128},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-80,-60},{-60,60}}),
          Rectangle(
            origin={5.821,15},
            fillColor={95,95,95},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{60,-10},{80,10}}),
          Rectangle(
            origin={5.821,15},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            extent={{-60,50},{20,70}}),
          Polygon(
            origin={5.821,15},
            fillPattern=FillPattern.Solid,
            points={{-70,-90},{-60,-90},{-30,-20},{20,-20},{50,-90},{60,-90},{60,
                -100},{-70,-100},{-70,-90}})}), Documentation(info="<html>
<p>This package hosts models for quasi stationary induction machines and transformers.
</p>
<h4>Please note</h4>
<p>
Quasi stationary DC machines are still operated with Dc voltage and current, whereas the quasi stationary induction machines and transformers
are operated with sinusoidal voltages and currents represented by time phasors. Quasi stationary theory can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
Quasi stationary DC machine models therefore are part of the
<a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.QuasiStationaryDCMachines\">machines library</a>.
</p>

</html>"));
  end Machines;

  package MultiPhase "Multiphase AC components"
    extends Modelica_Icons.Package;

    package Examples "Test examples"
      extends Modelica_Icons.ExamplesPackage;

      model BalancingStar "Balancing an unsymmetrical star-connected load"
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of phases";
        parameter Modelica_SIunits.Voltage V=100 "Source Voltage";
        parameter Modelica_SIunits.Frequency f=50 "Source frequency";
        parameter Modelica_SIunits.Resistance R=10 "Load resistance";
        parameter Modelica_SIunits.Inductance L=(R*sqrt(3))/(2*
            Modelica_Constants.pi
            *f) "Load inductance";
        parameter Modelica_SIunits.Capacitance C=1/(R*sqrt(3))/(2*
            Modelica_Constants.pi
            *f) "Load capacitance";
        Sources.VoltageSource voltageSource(
          m=m,
          f=f,
          V=fill(V, m),
          phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
          gamma(fixed=true, start=0)) annotation (Placement(transformation(
              origin={-80,-20},
              extent={{-10,-10},{10,10}},
              rotation=270)));

        Basic.Star star(m=m) annotation (Placement(transformation(
              origin={-80,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        SinglePhase.Basic.Ground ground annotation (Placement(transformation(
                extent={{-90,-90},{-70,-70}}, rotation=0)));
        Basic.PlugToPin_p plugToPin_p1(m=m, k=1) annotation (Placement(
              transformation(extent={{-10,40},{10,60}}, rotation=0)));
        Basic.PlugToPin_p plugToPin_p2(k=2, m=m) annotation (Placement(
              transformation(extent={{-10,0},{10,20}}, rotation=0)));
        Basic.PlugToPin_p plugToPin_p3(k=3, m=m) annotation (Placement(
              transformation(extent={{-10,-40},{10,-20}}, rotation=0)));
        Sensors.PowerSensor powerSensor(m=m) annotation (Placement(
              transformation(extent={{-70,0},{-50,20}}, rotation=0)));
        Sensors.CurrentSensor currentSensor(m=m) annotation (Placement(
              transformation(extent={{-40,0},{-20,20}}, rotation=0)));
        SinglePhase.Basic.Resistor resistor(R_ref=R) annotation (Placement(
              transformation(extent={{20,-40},{40,-20}}, rotation=0)));
        SinglePhase.Basic.Capacitor capacitor(C=C) annotation (Placement(
              transformation(extent={{20,0},{40,20}}, rotation=0)));
        SinglePhase.Basic.Inductor inductor(L=L) annotation (Placement(
              transformation(extent={{20,40},{40,60}}, rotation=0)));
        Basic.Star star2(m=m) annotation (Placement(transformation(
              origin={80,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Basic.PlugToPin_n plugToPin_n1(m=m, k=1) annotation (Placement(
              transformation(
              origin={60,50},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Basic.PlugToPin_n plugToPin_n2(k=2, m=m) annotation (Placement(
              transformation(
              origin={60,10},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Basic.PlugToPin_n plugToPin_n3(k=3, m=m) annotation (Placement(
              transformation(
              origin={60,-30},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.CurrentSensor currentSensor0
          annotation (Placement(transformation(
              origin={-30,-60},
              extent={{-10,-10},{10,10}},
              rotation=180)));
      equation
        connect(ground.pin, star.pin_n)
          annotation (Line(points={{-80,-70},{-80,-60}}, color={85,170,255}));
        connect(star.plug_p, voltageSource.plug_n)
          annotation (Line(points={{-80,-40},{-80,-30}}, color={85,170,255}));
        connect(voltageSource.plug_p, powerSensor.currentP) annotation (Line(
              points={{-80,-10},{-80,10},{-70,10}}, color={85,170,255}));
        connect(powerSensor.currentN, currentSensor.plug_p)
          annotation (Line(points={{-50,10},{-40,10}}, color={85,170,255}));
        connect(powerSensor.voltageP, powerSensor.currentP) annotation (Line(
              points={{-60,20},{-70,20},{-70,10}}, color={85,170,255}));
        connect(powerSensor.voltageN, star.plug_p) annotation (Line(points={{-60,
                0},{-60,-40},{-80,-40}}, color={85,170,255}));
        connect(currentSensor.plug_n, plugToPin_p2.plug_p)
          annotation (Line(points={{-20,10},{-2,10}}, color={85,170,255}));
        connect(currentSensor.plug_n, plugToPin_p3.plug_p) annotation (Line(
              points={{-20,10},{-20,-30},{-2,-30}}, color={85,170,255}));
        connect(currentSensor.plug_n, plugToPin_p1.plug_p) annotation (Line(
              points={{-20,10},{-20,50},{-2,50}}, color={85,170,255}));
        connect(plugToPin_p1.pin_p, inductor.pin_p)
          annotation (Line(points={{2,50},{20,50}}, color={85,170,255}));
        connect(plugToPin_p2.pin_p, capacitor.pin_p)
          annotation (Line(points={{2,10},{20,10}}, color={85,170,255}));
        connect(plugToPin_p3.pin_p, resistor.pin_p)
          annotation (Line(points={{2,-30},{20,-30}}, color={85,170,255}));
        connect(inductor.pin_n, plugToPin_n1.pin_n)
          annotation (Line(points={{40,50},{58,50}}, color={85,170,255}));
        connect(capacitor.pin_n, plugToPin_n2.pin_n)
          annotation (Line(points={{40,10},{58,10}}, color={85,170,255}));
        connect(resistor.pin_n, plugToPin_n3.pin_n)
          annotation (Line(points={{40,-30},{58,-30}}, color={85,170,255}));
        connect(plugToPin_n1.plug_n, star2.plug_p) annotation (Line(points={{62,
                50},{80,50},{80,-40}}, color={85,170,255}));
        connect(plugToPin_n2.plug_n, star2.plug_p) annotation (Line(points={{62,
                10},{80,10},{80,-40}}, color={85,170,255}));
        connect(plugToPin_n3.plug_n, star2.plug_p) annotation (Line(points={{62,-30},
                {80,-30},{80,-40}}, color={85,170,255}));
        connect(star2.pin_n, currentSensor0.pin_p)
          annotation (Line(points={{80,-60},{-20,-60}}, color={85,170,255}));
        connect(currentSensor0.pin_n, star.pin_n)
          annotation (Line(points={{-40,-60},{-80,-60}}, color={85,170,255}));
        annotation (Documentation(info="<html>
<p>
For the unsymmetrical load (resistor, capacitor and inductor) the parameters inductance L and capacitance C
are chosen such way that the neutral current (see currentSensor0) is zero.
</p>
<p>
P.Vaske, Berechnung von Drehstromschaltungen (German, Calculation of polyphase circuits), Teubner 1973, page 42, example 18
</p>
</html>"),   experiment(StopTime=1.0, Interval=0.001));
      end BalancingStar;

      model BalancingDelta "Balancing an unsymmetrical delta-connected load"
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of phases";
        parameter Modelica_SIunits.Voltage V_LL=100
          "Source voltage line-to-line";
        parameter Modelica_SIunits.Frequency f=50 "Source frequency";
        parameter Modelica_SIunits.Resistance R=10 "Load resistance";
        parameter Modelica_SIunits.Inductance L=(R*sqrt(3))/(2*
            Modelica_Constants.pi
            *f) "Load inductance";
        parameter Modelica_SIunits.Capacitance C=1/(R*sqrt(3))/(2*
            Modelica_Constants.pi
            *f) "Load capacitance";
        Sources.VoltageSource voltageSource(
          m=m,
          f=f,
          V=fill(V_LL, m),
          phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
          gamma(fixed=true, start=0)) annotation (Placement(transformation(
              origin={-70,-20},
              extent={{-10,-10},{10,10}},
              rotation=270)));

        Basic.Star star(m=m) annotation (Placement(transformation(
              origin={-70,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        SinglePhase.Basic.Ground ground annotation (Placement(transformation(
                extent={{-80,-90},{-60,-70}}, rotation=0)));
        Basic.PlugToPin_p plugToPin_p1(m=m, k=1) annotation (Placement(
              transformation(extent={{12,70},{32,90}}, rotation=0)));
        Basic.PlugToPin_p plugToPin_p2(k=2, m=m) annotation (Placement(
              transformation(extent={{10,0},{30,20}}, rotation=0)));
        Basic.PlugToPin_p plugToPin_p3(k=3, m=m) annotation (Placement(
              transformation(extent={{10,-70},{30,-50}}, rotation=0)));
        Sensors.PowerSensor powerSensor(m=m) annotation (Placement(
              transformation(extent={{-60,0},{-40,20}}, rotation=0)));
        Sensors.CurrentSensor currentSensor(m=m) annotation (Placement(
              transformation(extent={{-30,0},{-10,20}}, rotation=0)));
        SinglePhase.Basic.Resistor resistor(R_ref=R) annotation (Placement(
              transformation(
              origin={70,30},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        SinglePhase.Basic.Capacitor capacitor(C=C) annotation (Placement(
              transformation(
              origin={40,32},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        SinglePhase.Basic.Inductor inductor(L=L) annotation (Placement(
              transformation(
              origin={40,-38},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.CurrentSensor currentSensor12
          annotation (Placement(transformation(
              origin={40,62},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.CurrentSensor currentSensor23
          annotation (Placement(transformation(
              origin={40,-8},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.CurrentSensor currentSensor31
          annotation (Placement(transformation(
              origin={70,-10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_ComplexBlocks.ComplexMath.ComplexToPolar complexToPolar[m]
          annotation (Placement(transformation(
              origin={-20,-20},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      equation
        connect(ground.pin, star.pin_n)
          annotation (Line(points={{-70,-70},{-70,-60}}, color={85,170,255}));
        connect(star.plug_p, voltageSource.plug_n)
          annotation (Line(points={{-70,-40},{-70,-30}}, color={85,170,255}));
        connect(voltageSource.plug_p, powerSensor.currentP) annotation (Line(
              points={{-70,-10},{-70,10},{-60,10}}, color={85,170,255}));
        connect(powerSensor.currentP, powerSensor.voltageP) annotation (Line(
              points={{-60,10},{-60,20},{-50,20}}, color={85,170,255}));
        connect(powerSensor.currentN, currentSensor.plug_p)
          annotation (Line(points={{-40,10},{-30,10}}, color={85,170,255}));
        connect(powerSensor.voltageN, star.plug_p) annotation (Line(points={{-50,
                0},{-50,-40},{-70,-40}}, color={85,170,255}));
        connect(currentSensor.plug_n, plugToPin_p2.plug_p)
          annotation (Line(points={{-10,10},{18,10}}, color={85,170,255}));
        connect(currentSensor.plug_n, plugToPin_p1.plug_p) annotation (Line(
              points={{-10,10},{0,10},{0,80},{20,80}}, color={85,170,255}));
        connect(currentSensor.plug_n, plugToPin_p3.plug_p) annotation (Line(
              points={{-10,10},{0,10},{0,-60},{18,-60}}, color={85,170,255}));
        connect(currentSensor12.pin_p, plugToPin_p1.pin_p) annotation (Line(
              points={{40,72},{40,80},{24,80}}, color={85,170,255}));
        connect(currentSensor12.pin_n, capacitor.pin_p)
          annotation (Line(points={{40,52},{40,42}}, color={85,170,255}));
        connect(capacitor.pin_n, plugToPin_p2.pin_p) annotation (Line(points={{40,
                22},{40,10},{22,10}}, color={85,170,255}));
        connect(plugToPin_p2.pin_p, currentSensor23.pin_p)
          annotation (Line(points={{22,10},{40,10},{40,2}}, color={85,170,255}));
        connect(currentSensor23.pin_n, inductor.pin_p)
          annotation (Line(points={{40,-18},{40,-28}}, color={85,170,255}));
        connect(inductor.pin_n, plugToPin_p3.pin_p) annotation (Line(points={{40,
                -48},{40,-60},{22,-60}}, color={85,170,255}));
        connect(plugToPin_p1.pin_p, resistor.pin_n) annotation (Line(points={{24,
                80},{70,80},{70,40}}, color={85,170,255}));
        connect(resistor.pin_p, currentSensor31.pin_n)
          annotation (Line(points={{70,20},{70,0}}, color={85,170,255}));
        connect(currentSensor31.pin_p, plugToPin_p3.pin_p) annotation (Line(
              points={{70,-20},{70,-60},{22,-60}}, color={85,170,255}));
        connect(currentSensor.y, complexToPolar.u) annotation (Line(
            points={{-20,-1},{-20,-8}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Documentation(info="<html>
<p>
For the unsymmetrical load (resistor, capacitor and inductor) the parameters inductance L and capacitance C
are chosen such way that the magnitudes of the three phase currents (see currentSensor12, currentSensor23, currentSensor31) are equal.
</p>
<p>
P.Vaske, Berechnung von Drehstromschaltungen (German, Calculation of polyphase circuits), Teubner 1973, page 43, example 23
</p>
</html>"),   experiment(StopTime=1.0, Interval=0.001));
      end BalancingDelta;

      annotation (Documentation(info="<html>
Examples to demonstrate the usage of quasistationary electric components.
</html>"));
    end Examples;

    package Basic "Basic components for AC multiphase models"
      extends Modelica_Icons.Package;

      model Star "Star connection"
        parameter Integer m(final min=1) = 3 "Number of phases";
        Interfaces.PositivePlug plug_p(final m=m) annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
        SinglePhase.Interfaces.NegativePin pin_n annotation (Placement(
              transformation(extent={{90,-10},{110,10}}, rotation=0)));
        PlugToPins_p plugToPins_p(final m=m) annotation (Placement(transformation(
                extent={{-80,-10},{-60,10}}, rotation=0)));
      equation
        for j in 1:m loop
          connect(plugToPins_p.pin_p[j], pin_n);
        end for;
        connect(plug_p, plugToPins_p.plug_p) annotation (Line(points={{-100,0},{-93,
                0},{-86,0},{-72,0}}, color={85,170,255}));
        annotation (Icon(graphics={Text(
                    extent={{-150,60},{150,120}},
                    textString="%name",
                    lineColor={0,0,255}),Line(
                    points={{80,0},{0,0}},
                    color={0,0,255},
                    thickness=0.5),Line(
                    points={{0,0},{-39,68}},
                    color={0,0,255},
                    thickness=0.5),Line(
                    points={{0,0},{-38,-69}},
                    color={0,0,255},
                    thickness=0.5),Text(
                    extent={{-100,-110},{100,-70}},
                    lineColor={0,0,0},
                    textString="m=%m"),Line(points={{-90,0},{-40,0}}, color={0,0,
                255}),Line(points={{80,0},{90,0}}, color={0,0,255})}),
            Documentation(info="<html>
<p>
Star (wye) connection of a multi phase circuit. The potentials at the star points are the same.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Delta\">Delta</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.MultiStar\">MultiStar</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.MultiDelta\">MultiDelta</a>
</p>
</html>"));
      end Star;

      model Delta "Delta (polygon) connection"
        parameter Integer m(final min=2) = 3 "Number of phases";
        Interfaces.PositivePlug plug_p(final m=m) annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
        Interfaces.NegativePlug plug_n(final m=m) annotation (Placement(
              transformation(extent={{90,-10},{110,10}}, rotation=0)));

        PlugToPins_p plugToPins_p(final m=m) annotation (Placement(transformation(
                extent={{-80,-10},{-60,10}}, rotation=0)));
        PlugToPins_n plugToPins_n(final m=m) annotation (Placement(transformation(
                extent={{80,-10},{60,10}}, rotation=0)));
      equation
        for j in 1:m loop
          if j < m then
            connect(plugToPins_n.pin_n[j], plugToPins_p.pin_p[j + 1]);
          else
            connect(plugToPins_n.pin_n[j], plugToPins_p.pin_p[1]);
          end if;
        end for;
        connect(plug_p, plugToPins_p.plug_p) annotation (Line(points={{-100,0},{-93,
                0},{-86,0},{-72,0}}, color={85,170,255}));
        connect(plugToPins_n.plug_n, plug_n) annotation (Line(points={{72,0},{79,
                0},{79,0},{86,0},{86,0},{100,0}}, color={85,170,255}));
        annotation (Icon(graphics={Text(
                    extent={{-150,60},{150,120}},
                    lineColor={0,0,255},
                    textString="%name"),Line(
                    points={{-40,68},{-40,-70},{79,0},{-40,68},{-40,67}},
                    color={0,0,255},
                    thickness=0.5),Text(
                    extent={{-100,-110},{100,-70}},
                    lineColor={0,0,0},
                    textString="m=%m"),Line(points={{-90,0},{-40,0}}, color={0,0,
                255}),Line(points={{80,0},{90,0}}, color={0,0,255})}),
            Documentation(info="<html>
<p>
Delta (polygon) connection of a multi phase circuit.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star\">Star</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.MultiStar\">MultiStar</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.MultiDelta\">MultiDelta</a>
</p></html>"));
      end Delta;

      model MultiStar
        "Star connection of multi phase systems consisting of multiple base systems"
        parameter Integer m(final min=1) = 3 "Number of phases";
        final parameter Integer mSystems=
            Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
            m) "Number of base systems";
        final parameter Integer mBasic=integer(m/mSystems)
          "Phase number of base systems";
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
          plug_p(final m=m) annotation (Placement(transformation(extent={{-110,
                  -10},{-90,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
          starpoints(final m=mSystems) annotation (Placement(transformation(
                extent={{90,-10},{110,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_p
          plugToPins_p(final m=m) annotation (Placement(transformation(extent={
                  {-80,-10},{-60,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_n
          plugToPins_n(final m=mSystems)
          annotation (Placement(transformation(extent={{80,-10},{60,10}})));
      equation
        for k in 1:mSystems loop
          for j in 1:mBasic loop
            connect(plugToPins_p.pin_p[(k - 1)*mBasic + j], plugToPins_n.pin_n[k]);
          end for;
        end for;
        connect(plug_p, plugToPins_p.plug_p)
          annotation (Line(points={{-100,0},{-72,0}}, color={85,170,255}));
        connect(plugToPins_n.plug_n, starpoints) annotation (Line(
            points={{72,0},{100,0}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          Icon(graphics={Text(
                    extent={{-150,60},{150,120}},
                    textString="%name",
                    lineColor={0,0,255}),Line(
                    points={{86,4},{6,4}},
                    color={0,0,255},
                    thickness=0.5),Line(
                    points={{6,4},{-33,72}},
                    color={0,0,255},
                    thickness=0.5),Line(
                    points={{6,4},{-32,-65}},
                    color={0,0,255},
                    thickness=0.5),Text(
                    extent={{-100,-110},{100,-70}},
                    lineColor={0,0,0},
                    textString="m=%m"),Line(points={{-90,0},{-40,0}}, color={0,0,
                255}),Line(points={{80,0},{90,0}}, color={0,0,255}),Line(
                    points={{-6,-4},{-45,64}},
                    color={0,0,255},
                    thickness=0.5),Line(
                    points={{74,-4},{-6,-4}},
                    color={0,0,255},
                    thickness=0.5),Line(
                    points={{-6,-4},{-44,-73}},
                    color={0,0,255},
                    thickness=0.5)}),
          Documentation(info="<html>
<p>
Star (wye) connection of a multi phase circuit consiting of multiple base systems (see
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.MultiPhase\">multi phase guidelines</a>). The potentials at the star points are all equal.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star\">Star</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Delta\">Delta</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.MultiDelta\">MultiDelta</a>
</p></html>"),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end MultiStar;

      model MultiDelta
        "Delta (polygon) connection of multi phase systems consisting of multiple base systems"
        parameter Integer m(final min=2) = 3 "Number of phases";
        final parameter Integer mSystems=
            Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
            m) "Number of base systems";
        final parameter Integer mBasic=integer(m/mSystems)
          "Phase number of base systems";
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug
          plug_p(final m=m) annotation (Placement(transformation(extent={{-110,
                  -10},{-90,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug
          plug_n(final m=m) annotation (Placement(transformation(extent={{90,-10},
                  {110,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_p
          plugToPins_p(final m=m) annotation (Placement(transformation(extent={
                  {-80,-10},{-60,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_n
          plugToPins_n(final m=m) annotation (Placement(transformation(extent={
                  {80,-10},{60,10}}, rotation=0)));
      equation
        for k in 1:mSystems loop
          for j in 1:mBasic - 1 loop
            connect(plugToPins_n.pin_n[(k - 1)*mBasic + j], plugToPins_p.pin_p[(k
               - 1)*mBasic + j + 1]);
          end for;
          connect(plugToPins_n.pin_n[k*mBasic], plugToPins_p.pin_p[(k - 1)*mBasic
             + 1]);
        end for;
        connect(plug_p, plugToPins_p.plug_p) annotation (Line(points={{-100,0},{-93,
                0},{-86,0},{-72,0}}, color={85,170,255}));
        connect(plugToPins_n.plug_n, plug_n) annotation (Line(points={{72,0},{79,
                0},{79,0},{86,0},{86,0},{100,0}}, color={85,170,255}));
        annotation (Icon(graphics={Text(
                    extent={{-150,60},{150,120}},
                    lineColor={0,0,255},
                    textString="%name"),Line(
                    points={{-44,62},{-44,-76},{75,-6},{-44,62},{-44,61}},
                    color={0,0,255},
                    thickness=0.5),Text(
                    extent={{-100,-110},{100,-70}},
                    lineColor={0,0,0},
                    textString="m=%m"),Line(points={{-90,0},{-44,0}}, color={0,0,
                255}),Line(points={{80,0},{90,0}}, color={0,0,255}),Line(
                    points={{-36,74},{-36,-64},{83,6},{-36,74},{-36,73}},
                    color={0,0,255},
                    thickness=0.5)}), Documentation(info="<html>
<p>
Delta (polygon) connection of a multi phase circuit consiting of multiple base systems (see
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.MultiPhase\">multi phase guidelines</a>).
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star\">Star</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Delta\">Delta</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.MultiStar\">MultiStar</a>
</p>
</html>"));
      end MultiDelta;

      model MultiStarResistance "Resistance connection of star points"
        parameter Integer m(final min=3) = 3 "Number of phases";
        final parameter Integer mBasic=
            Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
            m) "Number of symmetric base systems";
        parameter Modelica_SIunits.Resistance R=1e6
          "Insulation resistance between base systems";
        Interfaces.PositivePlug plug(m=m)
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        MultiStar multiStar(m=m) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-50,0})));
        Resistor resistor(m=mBasic, final R_ref=fill(R, mBasic)) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={0,0})));
        Star star(m=mBasic) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={50,0})));
        SinglePhase.Interfaces.NegativePin pin annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={100,0})));
      equation
        connect(plug, multiStar.plug_p) annotation (Line(
            points={{-100,0},{-60,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(multiStar.starpoints, resistor.plug_p) annotation (Line(
            points={{-40,0},{-10,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(resistor.plug_n, star.plug_p) annotation (Line(
            points={{10,0},{40,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(star.pin_n, pin) annotation (Line(
            points={{60,0},{100,0}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics),
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}), graphics={Line(
                    points={{-40,40},{0,0},{40,40},{0,0},{0,-40}},
                    color={0,0,255},
                    smooth=Smooth.None,
                    origin={-60,0},
                    rotation=90),Rectangle(
                    extent={{-10,20},{10,-20}},
                    lineColor={0,0,255},
                    origin={0,0},
                    rotation=90),Line(
                    points={{-40,40},{0,0},{40,40},{0,0},{0,-40}},
                    color={0,0,255},
                    smooth=Smooth.None,
                    origin={60,0},
                    rotation=90)}),
          Documentation(info="<html>
<p>
Multi star points are connected by resistors. This model is required to operate multi phase systems with even phase numbers to avoid ideal connections of start points of base systems; see
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.MultiPhase\">multi phase guidelines</a>.
</p>
</html>"));
      end MultiStarResistance;

      model PlugToPin_p "Connect one (positive) pin"
        parameter Integer m(final min=1) = 3 "Number of phases";
        parameter Integer k(
          final min=1,
          final max=m) = 1 "Phase index";
        Interfaces.PositivePlug plug_p(final m=m) annotation (Placement(
              transformation(extent={{-30,-10},{-10,10}}, rotation=0)));
        SinglePhase.Interfaces.PositivePin pin_p annotation (Placement(
              transformation(extent={{10,-10},{30,10}}, rotation=0)));
      equation
        Connections.branch(plug_p.reference, pin_p.reference);
        //Connections.potentialRoot(plug_p.reference);
        //Connections.potentialRoot(pin_p.reference);
        plug_p.reference.gamma = pin_p.reference.gamma;
        pin_p.v = plug_p.pin[k].v;
        for j in 1:m loop
          plug_p.pin[j].i = if j == k then -pin_p.i else Complex(0);
        end for;
        annotation (Icon(graphics={Rectangle(
                    extent={{-20,20},{40,-20}},
                    lineColor={0,0,0},
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Solid),Ellipse(
                    extent={{-40,20},{0,-20}},
                    lineColor={0,0,0},
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{-100,100},{100,40}},
                    textString="%name",
                    lineColor={0,0,255}),Text(
                    extent={{-100,-60},{100,-100}},
                    lineColor={0,0,0},
                    textString="k = %k")}), Documentation(info="<html>
<p>
Connects the single phase (positive) pin <code>k</code> of the multi phase (positive) plug to a single phase (positive) pin.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPin_n\">PlugToPin_n</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_p\">PlutToPins_p</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_n\">PlugToPins_n</a>
</p>
</html>"));
      end PlugToPin_p;

      model PlugToPin_n "Connect one (negative) pin"
        parameter Integer m(final min=1) = 3 "Number of phases";
        parameter Integer k(
          final min=1,
          final max=m) = 1 "Phase index";
        Interfaces.NegativePlug plug_n(final m=m) annotation (Placement(
              transformation(extent={{-30,-10},{-10,10}}, rotation=0)));
        SinglePhase.Interfaces.NegativePin pin_n annotation (Placement(
              transformation(extent={{10,-10},{30,10}}, rotation=0)));
      equation
        Connections.branch(plug_n.reference, pin_n.reference);
        //Connections.potentialRoot(plug_n.reference);
        //Connections.potentialRoot(pin_n.reference);
        plug_n.reference.gamma = pin_n.reference.gamma;
        pin_n.v = plug_n.pin[k].v;
        for j in 1:m loop
          plug_n.pin[j].i = if j == k then -pin_n.i else Complex(0);
        end for;
        annotation (Icon(graphics={Rectangle(
                    extent={{-20,20},{40,-20}},
                    lineColor={0,0,0},
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Solid),Ellipse(
                    extent={{-40,20},{0,-20}},
                    lineColor={0,0,0},
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{-100,100},{100,40}},
                    textString="%name",
                    lineColor={0,0,255}),Text(
                    extent={{-100,-60},{100,-100}},
                    lineColor={0,0,0},
                    textString="k = %k")}), Documentation(info="<html>
<p>
Connects the single phase (negative) pin <code>k</code> of the multi phase (negative) plug to a single phase (negative) pin.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPin_p\">PlugToPin_p</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_p\">PlutToPins_p</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_n\">PlugToPins_n</a>
</p>
</html>"));
      end PlugToPin_n;

      model PlugToPins_p "Connect all (positive) pins"
        parameter Integer m(final min=1) = 3 "number of phases";
        Interfaces.PositivePlug plug_p(final m=m) annotation (Placement(
              transformation(extent={{-30,-10},{-10,10}}, rotation=0)));
        SinglePhase.Interfaces.PositivePin pin_p[m] annotation (Placement(
              transformation(extent={{10,-10},{30,10}}, rotation=0)));
        PlugToPin_p plugToPin_p[m](each final m=m, final k={j for j in 1:m})
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      equation
        for j in 1:m loop
          /*
    Connections.branch(plug_p.reference, pin_p[j].reference);
    plug_p.reference.gamma = pin_p[j].reference.gamma;
    plug_p.pin[j].v = pin_p[j].v;
    plug_p.pin[j].i = -pin_p[j].i;
*/
          connect(plug_p, plugToPin_p[j].plug_p);
          connect(plugToPin_p[j].pin_p, pin_p[j]);
        end for;
        annotation (Icon(graphics={Rectangle(
                    extent={{-20,20},{40,-20}},
                    lineColor={0,0,0},
                    fillColor={170,255,255},
                    fillPattern=FillPattern.Solid),Ellipse(
                    extent={{-40,20},{0,-20}},
                    lineColor={0,0,0},
                    fillColor={170,255,255},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{-100,100},{100,40}},
                    textString="%name",
                    lineColor={0,0,255})}), Documentation(info="<html>
<p>
Connects all <code>m</code> single phase (positive) pins of the multi phase (positive) plug to an array of <code>m</code> single phase (positive) pins.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPin_p\">PlugToPin_p</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPin_n\">PlugToPin_n</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_n\">PlugToPins_n</a>
</p>
</html>"));
      end PlugToPins_p;

      model PlugToPins_n "Connect all (negative) pins"
        parameter Integer m(final min=1) = 3 "number of phases";
        Interfaces.NegativePlug plug_n(final m=m) annotation (Placement(
              transformation(extent={{-30,-10},{-10,10}}, rotation=0)));
        SinglePhase.Interfaces.NegativePin pin_n[m] annotation (Placement(
              transformation(extent={{10,-10},{30,10}}, rotation=0)));
        PlugToPin_n plugToPin_n[m](each final m=m, final k={j for j in 1:m})
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      equation
        for j in 1:m loop
          /*
    Connections.branch(plug_n.reference, pin_n[j].reference);
    plug_n.reference.gamma = pin_n[j].reference.gamma;
    plug_n.pin[j].v = pin_n[j].v;
    plug_n.pin[j].i = -pin_n[j].i;
*/
          connect(plug_n, plugToPin_n[j].plug_n);
          connect(plugToPin_n[j].pin_n, pin_n[j]);
        end for;
        annotation (Icon(graphics={Rectangle(
                    extent={{-20,20},{40,-20}},
                    lineColor={0,0,0},
                    fillColor={170,255,255},
                    fillPattern=FillPattern.Solid),Ellipse(
                    extent={{-40,20},{0,-20}},
                    lineColor={0,0,0},
                    fillColor={170,255,255},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{-100,100},{100,40}},
                    textString="%name",
                    lineColor={0,0,255})}), Documentation(info="<html>
<p>
Connects all <code>m</code> single phase (negative) pins of the multi phase (negative) plug to an array of <code>m</code> single phase (negative) pins.
</p>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPin_p\">PlugToPin_p</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPin_n\">PlugToPin_n</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_p\">PlugToPins_p</a>
</p>
</html>"));
      end PlugToPins_n;

      model Resistor "Multiphase linear resistor"
        extends Interfaces.TwoPlug;
        parameter Modelica_SIunits.Resistance R_ref[m](start=fill(1, m))
          "Reference resistances at T_ref";
        parameter Modelica_SIunits.Temperature T_ref[m]=fill(293.15, m)
          "Reference temperatures";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref[m]=
            zeros(m)
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, T=T_ref);
        SinglePhase.Basic.Resistor resistor[m](
          final R_ref=R_ref,
          final T_ref=T_ref,
          final alpha_ref=alpha_ref,
          each final useHeatPort=useHeatPort,
          final T=T) annotation (Placement(transformation(extent={{-10,-10},{10,
                  10}}, rotation=0)));
      equation
        connect(plugToPins_p.pin_p, resistor.pin_p) annotation (Line(points={{-68,
                0},{-53.5,0},{-39,0},{-10,0}}, color={85,170,255}));
        connect(resistor.pin_n, plugToPins_n.pin_n)
          annotation (Line(points={{10,0},{39,0},{68,0}}, color={85,170,255}));
        connect(resistor.heatPort, heatPort) annotation (Line(points={{0,-10},{0,
                -32.5},{0,-55},{0,-100}}, color={191,0,0}));
        annotation (Icon(graphics={Text(
                    extent={{100,60},{-100,100}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{60,0},{90,0}}),Line(points=
                 {{-90,0},{-60,0}}),Rectangle(
                    extent={{-70,30},{70,-30}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{100,-80},{-100,-40}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid,
                    textString="m=%m")}), Documentation(info="<html>
<p>
The linear resistor connects the complex voltages <code><u>v</u></code> with the complex
currents <code><u>i</u></code> by <code><u>i</u>*R = <u>v</u></code>,
using <code>m</code> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">single phase Resistors</a>.
</p>

<p>
The resistor model also has <code>m</code> optional
<a href=\"modelica://Modelica.Electrical.MultiPhase.Interfaces.ConditionalHeatPort\">conditional heat ports</a>.
A linear temperature dependency of the resistances for enabled heat ports is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"));
      end Resistor;

      model Conductor "Multiphase linear conductor"
        extends Interfaces.TwoPlug;
        parameter Modelica_SIunits.Conductance G_ref[m](start=fill(1, m))
          "Reference conductances at T_ref";
        parameter Modelica_SIunits.Temperature T_ref[m]=fill(293.15, m)
          "Reference temperatures";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref[m]=
            zeros(m)
          "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, T=T_ref);
        SinglePhase.Basic.Conductor conductor[m](
          final G_ref=G_ref,
          final T_ref=T_ref,
          final alpha_ref=alpha_ref,
          each final useHeatPort=useHeatPort,
          final T=T) annotation (Placement(transformation(extent={{-10,-10},{10,
                  10}}, rotation=0)));
      equation
        connect(plugToPins_p.pin_p, conductor.pin_p) annotation (Line(points={{-68,
                0},{-53.5,0},{-53.5,0},{-39,0},{-39,0},{-10,0}}, color={85,170,
                255}));
        connect(conductor.pin_n, plugToPins_n.pin_n) annotation (Line(points={{10,
                0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        connect(conductor.heatPort, heatPort) annotation (Line(points={{0,-10},{0,
                -32.5},{0,-32.5},{0,-55},{0,-55},{0,-100}}, color={191,0,0}));
        annotation (Icon(graphics={Text(
                    extent={{100,60},{-100,100}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{60,0},{90,0}}),Line(points=
                 {{-90,0},{-60,0}}),Rectangle(
                    extent={{-70,30},{70,-30}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{100,-80},{-100,-40}},
                    lineColor={0,0,0},
                    textString="m=%m")}), Documentation(info="<html>
<p>
The linear resistor connects the complex currents <code><u>i</u></code> with the complex
voltages <code><u>v</u></code> by <code><u>v</u>*G = <u>i</u></code>,
using <code>m</code> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">single phase Conductors</a>.
</p>

<p>
The conductor model also has <code>m</code> optional
<a href=\"modelica://Modelica.Electrical.MultiPhase.Interfaces.ConditionalHeatPort\">conditional heat ports</a>.
A linear temperature dependency of the conductances for enabled heat ports is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"));
      end Conductor;

      model Capacitor "Multiphase linear capacitor"
        extends Interfaces.TwoPlug;
        parameter Modelica_SIunits.Capacitance C[m](start=fill(1, m))
          "Capacitances";
        SinglePhase.Basic.Capacitor capacitor[m](final C=C) annotation (
            Placement(transformation(extent={{-10,-10},{10,10}}, rotation=0)));
      equation
        connect(plugToPins_p.pin_p, capacitor.pin_p) annotation (Line(points={{-68,
                0},{-53.5,0},{-53.5,0},{-39,0},{-39,0},{-10,0}}, color={85,170,
                255}));
        connect(capacitor.pin_n, plugToPins_n.pin_n) annotation (Line(points={{10,
                0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        annotation (Icon(graphics={Text(
                    extent={{100,60},{-100,100}},
                    textString="%name",
                    lineColor={0,0,255}),Line(
                    points={{-14,28},{-14,-28}},
                    color={0,0,255},
                    thickness=0.5),Line(
                    points={{14,28},{14,-28}},
                    color={0,0,255},
                    thickness=0.5),Line(points={{-90,0},{-14,0}}),Line(points={{
                14,0},{90,0}}),Text(
                    extent={{100,-80},{-100,-40}},
                    lineColor={0,0,0},
                    textString="m=%m")}), Documentation(info="<html>
<p>
The linear capacitor connects the complex currents <code><u>i</u></code> with the complex
voltages <code><u>v</u></code> by <code><u>v</u>*j*&omega;*C = <u>i</u></code>,
using <code>m</code> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">single phase Capacitors</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"));
      end Capacitor;

      model Inductor "Multiphase linear inductor"
        extends Interfaces.TwoPlug;
        parameter Modelica_SIunits.Inductance L[m](start=fill(1, m))
          "Inductances";
        SinglePhase.Basic.Inductor inductor[m](final L=L) annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=0)));
      equation

        connect(plugToPins_p.pin_p, inductor.pin_p) annotation (Line(points={{-68,
                0},{-53.5,0},{-53.5,0},{-39,0},{-39,0},{-10,0}}, color={85,170,
                255}));
        connect(inductor.pin_n, plugToPins_n.pin_n) annotation (Line(points={{10,
                0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        annotation (Icon(graphics={Text(
                    extent={{100,60},{-100,100}},
                    textString="%name",
                    lineColor={0,0,255}),Ellipse(extent={{-60,-15},{-30,15}}),
                Ellipse(extent={{-30,-15},{0,15}}),Ellipse(extent={{0,-15},{30,15}}),
                Ellipse(extent={{30,-15},{60,15}}),Rectangle(
                    extent={{-60,-30},{60,0}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(points={{60,0},{90,0}}),
                Line(points={{-90,0},{-60,0}}),Text(
                    extent={{100,-80},{-100,-40}},
                    lineColor={0,0,0},
                    textString="m=%m")}), Documentation(info="<html>
<p>
The linear inductor connects the complex voltages <code><u>v</u></code> with the complex
currents <code><u>i</u></code> by <code><u>i</u>*j*&omega;*L = <u>v</u></code>,
using <code>m</code> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">single phase Inductors</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"));
      end Inductor;

      model VariableResistor "Multiphase variable resistor"
        extends Interfaces.TwoPlug;
        parameter Modelica_SIunits.Temperature T_ref[m]=fill(293.15, m)
          "Reference temperatures";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref[m]=
            zeros(m)
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, T=T_ref);
        Modelica_Blocks.Interfaces.RealInput R_ref[m](each unit="Ohm")
          "Variable resistance" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        SinglePhase.Basic.VariableResistor variableResistor[m](
          final T_ref=T_ref,
          final alpha_ref=alpha_ref,
          each final useHeatPort=useHeatPort,
          final T=T) annotation (Placement(transformation(extent={{-10,-10},{10,
                  10}}, rotation=0)));
      equation

        connect(variableResistor.pin_p, plugToPins_p.pin_p) annotation (Line(
              points={{-10,0},{-24.5,0},{-24.5,0},{-39,0},{-39,0},{-68,0}}, color=
               {85,170,255}));
        connect(variableResistor.pin_n, plugToPins_n.pin_n) annotation (Line(
              points={{10,0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        connect(variableResistor.heatPort, heatPort) annotation (Line(
            points={{0,-10},{0,-10},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(R_ref, variableResistor.R_ref) annotation (Line(
            points={{0,110},{0,11}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Icon(graphics={Text(
                    extent={{100,-80},{-100,-40}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{60,0},{90,0}}),Line(points=
                 {{-90,0},{-60,0}}),Rectangle(
                    extent={{-70,30},{70,-30}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(
                    points={{0,90},{0,30}},
                    color={0,0,255},
                    smooth=Smooth.None),Text(
                    extent={{100,40},{-100,80}},
                    lineColor={0,0,0},
                    textString="m=%m")}),
          Documentation(info="<html>
<p>
The linear resistors connect the complex voltages <code><u>v</u></code> with the complex
currents <code><u>i</u></code> by <code><u>i</u>*R = <u>v</u></code>,
using <code>m</code> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">single phase variable Resistors</a>.
The resistances <code>R</code> are given as <code>m</code> input signals.
</p>

<p>
The resistor model also has <code>m</code> optional
<a href=\"modelica://Modelica.Electrical.MultiPhase.Interfaces.ConditionalHeatPort\">conditional heat ports</a>.
A linear temperature dependency of the resistances is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">VariableResistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableResistor;

      model VariableConductor "Multiphase variable conductor"
        extends Interfaces.TwoPlug;
        parameter Modelica_SIunits.Temperature T_ref[m]=fill(293.15, m)
          "Reference temperatures";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref[m]=
            zeros(m)
          "Temperature coefficient of resistance (G_actual = G_ref/(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, T=T_ref);
        Modelica_Blocks.Interfaces.RealInput G_ref[m](each unit="S")
          "Variable conductance" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        SinglePhase.Basic.VariableConductor variableResistor[m](
          final T_ref=T_ref,
          final alpha_ref=alpha_ref,
          each final useHeatPort=useHeatPort,
          final T=T) annotation (Placement(transformation(extent={{-10,-10},{10,
                  10}}, rotation=0)));
      equation
        connect(variableResistor.pin_p, plugToPins_p.pin_p) annotation (Line(
              points={{-10,0},{-24.5,0},{-24.5,0},{-39,0},{-39,0},{-68,0}}, color=
               {85,170,255}));
        connect(variableResistor.pin_n, plugToPins_n.pin_n) annotation (Line(
              points={{10,0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        connect(variableResistor.heatPort, heatPort) annotation (Line(points={{0,
                -10},{0,-32.5},{0,-32.5},{0,-55},{0,-55},{0,-100}}, color={191,0,
                0}));
        connect(G_ref, variableResistor.G_ref) annotation (Line(points={{0,110},{
                0,85.25},{0,60.5},{0,11}}, color={0,0,127}));
        annotation (
          Icon(graphics={Text(
                    extent={{100,-80},{-100,-40}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{60,0},{90,0}}),Line(points=
                 {{-90,0},{-60,0}}),Rectangle(
                    extent={{-70,30},{70,-30}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(
                    points={{0,90},{0,30}},
                    color={0,0,255},
                    smooth=Smooth.None),Text(
                    extent={{100,40},{-100,80}},
                    lineColor={0,0,0},
                    textString="m=%m")}),
          Documentation(info="<html>
<p>
The linear resistors connect the complex currents <code><u>i</u></code> with the complex
voltages <code><u>v</u></code> by <code><u>v</u>*G = <u>i</u></code>,
using <code>m</code> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">single phase variable Conductors</a>.
The conductances <code>G</code> are given as <code>m</code> input signals.
</p>

<p>
The conductor model also has <code>m</code> optional
<a href=\"modelica://Modelica.Electrical.MultiPhase.Interfaces.ConditionalHeatPort\">conditional heat ports</a>.
A linear temperature dependency of the conductances is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableConductor\">VariableConductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableConductor;

      model VariableCapacitor "Multiphase variable capacitor"
        extends Interfaces.TwoPlug;
        Modelica_Blocks.Interfaces.RealInput C[m](each unit="F")
          "Variable capacitance" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        SinglePhase.Basic.VariableCapacitor variableCapacitor[m] annotation (
            Placement(transformation(extent={{-10,-10},{10,10}}, rotation=0)));
      equation
        connect(variableCapacitor.pin_p, plugToPins_p.pin_p) annotation (Line(
              points={{-10,0},{-24.5,0},{-24.5,0},{-39,0},{-39,0},{-68,0}}, color=
               {85,170,255}));
        connect(variableCapacitor.pin_n, plugToPins_n.pin_n) annotation (Line(
              points={{10,0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        connect(C, variableCapacitor.C) annotation (Line(
            points={{0,110},{0,11}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Icon(graphics={Text(
                    extent={{100,-80},{-100,-40}},
                    textString="%name",
                    lineColor={0,0,255}),Line(
                    points={{-14,28},{-14,-28}},
                    color={0,0,255},
                    thickness=0.5),Line(
                    points={{14,28},{14,-28}},
                    color={0,0,255},
                    thickness=0.5),Line(points={{-90,0},{-14,0}}),Line(points={{
                14,0},{90,0}}),Line(points={{0,90},{0,30}}, color={0,0,255}),Text(
                    extent={{100,40},{-100,80}},
                    lineColor={0,0,0},
                    textString="m=%m")}),
          Documentation(info="<html>
<p>
The linear capacitors connect the complex currents <code><u>i</u></code> with the complex
voltages <code><u>v</u></code> by <code><u>v</u>*j*&omega;*C = <u>i</u></code>,
using <code>m</code> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">single phase variable Capacitors</a>.
The capacitances <code>C</code> are given as <code>m</code> input signals.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableCapacitor\">VariableCapacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableCapacitor;

      model VariableInductor "Multiphase variable inductor"
        extends Interfaces.TwoPlug;
        Modelica_Blocks.Interfaces.RealInput L[m](each unit="H")
          "Variable inductance" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        SinglePhase.Basic.VariableInductor variableInductor[m] annotation (
            Placement(transformation(extent={{-10,-10},{10,10}}, rotation=0)));
      equation
        connect(variableInductor.pin_p, plugToPins_p.pin_p) annotation (Line(
              points={{-10,0},{-24.5,0},{-24.5,0},{-39,0},{-39,0},{-68,0}}, color=
               {85,170,255}));
        connect(variableInductor.pin_n, plugToPins_n.pin_n) annotation (Line(
              points={{10,0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        connect(variableInductor.L, L) annotation (Line(points={{0,10.8},{0,35.6},
                {0,60.4},{0,110}}, color={0,0,127}));
        annotation (
          Icon(graphics={Text(
                    extent={{100,-80},{-100,-40}},
                    textString="%name",
                    lineColor={0,0,255}),Ellipse(extent={{-60,-15},{-30,15}}),
                Ellipse(extent={{-30,-15},{0,15}}),Ellipse(extent={{0,-15},{30,15}}),
                Ellipse(extent={{30,-15},{60,15}}),Rectangle(
                    extent={{-60,-30},{60,0}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(points={{60,0},{90,0}}),
                Line(points={{-90,0},{-60,0}}),Line(points={{0,90},{0,8}}, color=
                {0,0,255}),Text(
                    extent={{100,40},{-100,80}},
                    lineColor={0,0,0},
                    textString="m=%m")}),
          Documentation(info="<html>
<p>
The linear inductors connect the complex voltages <code><u>v</u></code> with the complex
currents <code><u>i</u></code> by <code><u>i</u>*j*&omega;*L = <u>v</u></code>,
using <code>m</code> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableInductor\">single phase variable Inductors</a>.
The inductances <code>L</code> are given as <code>m</code> input signals.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableResistor\">Variable resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableInductor;

      model VariableImpedance "Multiphase variable impedance"
        extends Interfaces.TwoPlug;
        parameter Modelica_SIunits.Temperature T_ref[m]=fill(293.15, m)
          "Reference temperatures";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref[m]=
            zeros(m)
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, T=T_ref);
        Modelica_ComplexBlocks.Interfaces.ComplexInput Z_ref[m]
          "Variable complex impedances" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        SinglePhase.Basic.VariableImpedance variableImpedance[m](
          final T_ref=T_ref,
          final alpha_ref=alpha_ref,
          each final useHeatPort=useHeatPort,
          final T=T) annotation (Placement(transformation(extent={{-10,-10},{10,
                  10}}, rotation=0)));
      equation

        connect(variableImpedance.pin_p, plugToPins_p.pin_p) annotation (Line(
              points={{-10,0},{-24.5,0},{-39,0},{-68,0}}, color={85,170,255}));
        connect(variableImpedance.pin_n, plugToPins_n.pin_n)
          annotation (Line(points={{10,0},{39,0},{68,0}}, color={85,170,255}));
        connect(variableImpedance.heatPort, heatPort) annotation (Line(
            points={{0,-10},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(variableImpedance.Z_ref, Z_ref) annotation (Line(
            points={{0,11},{0,110}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          Icon(graphics={Text(
                    extent={{100,-80},{-100,-40}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{60,0},{90,0}}),Line(points=
                 {{-90,0},{-60,0}}),Rectangle(
                    extent={{-70,30},{70,-30}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(
                    points={{0,90},{0,30}},
                    color={0,0,255},
                    smooth=Smooth.None),Text(
                    extent={{100,40},{-100,80}},
                    lineColor={0,0,0},
                    textString="m=%m")}),
          Documentation(info="<html>
<p>
The linear impedances connect the complex voltages <code><u>v</u></code> with the complex
currents <code><u>i</u></code> by <code><u>i</u>*Z = <u>v</u></code>,
using <code>m</code>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableImpedance\">
single phase variable impedance</a>.
The impedances <code>Z_ref</code> are given as complex input signals, representing the
resistive and reactive components of the input impedances. The resistive
components are modeled temperature dependent, so the real parts <code>R = real(<u>Z</u>)</code>
are determined from
the actual operating temperature and the reference input resistances <code>real(<u>Z</u>_ref)</code>.
</p>

<p>
The impedance model also has <code>m</code> optional
<a href=\"modelica://Modelica.Electrical.MultiPhase.Interfaces.ConditionalHeatPort\">conditional heat ports</a>.
A linear temperature dependency of the resistances is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">VariableResistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableAdmittance\">Variable admittance</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableImpedance;

      model VariableAdmittance "Multiphase variable admittance"
        extends Interfaces.TwoPlug;
        parameter Modelica_SIunits.Temperature T_ref[m]=fill(293.15, m)
          "Reference temperatures";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_ref[m]=
            zeros(m)
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha_ref*(heatPort.T - T_ref))";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, T=T_ref);
        Modelica_ComplexBlocks.Interfaces.ComplexInput Y_ref[m]
          "Variable complex admittances" annotation (Placement(transformation(
              origin={0,110},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        SinglePhase.Basic.VariableAdmittance variableImpedance[m](
          final T_ref=T_ref,
          final alpha_ref=alpha_ref,
          each final useHeatPort=useHeatPort,
          final T=T) annotation (Placement(transformation(extent={{-10,-10},{10,
                  10}}, rotation=0)));
      equation

        connect(variableImpedance.pin_p, plugToPins_p.pin_p) annotation (Line(
              points={{-10,0},{-24.5,0},{-39,0},{-68,0}}, color={85,170,255}));
        connect(variableImpedance.pin_n, plugToPins_n.pin_n)
          annotation (Line(points={{10,0},{39,0},{68,0}}, color={85,170,255}));
        connect(variableImpedance.heatPort, heatPort) annotation (Line(
            points={{0,-10},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(Y_ref, variableImpedance.Y_ref) annotation (Line(
            points={{0,110},{0,61},{0,61},{0,11}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          Icon(graphics={Text(
                    extent={{100,-80},{-100,-40}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{60,0},{90,0}}),Line(points=
                 {{-90,0},{-60,0}}),Rectangle(
                    extent={{-70,30},{70,-30}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(
                    points={{0,90},{0,30}},
                    color={0,0,255},
                    smooth=Smooth.None),Text(
                    extent={{100,40},{-100,80}},
                    lineColor={0,0,0},
                    textString="m=%m")}),
          Documentation(info="<html>
<p>
The linear admittances connect the complex voltages <code><u>v</u></code> with the complex
currents <code><u>i</u></code> by <code><u>v</u>*Z = <u>i</u></code>,
using <code>m</code>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableAdmittance\">
single phase variable admittances</a>.
The admittances <code>Y_ref</code> are given as complex input signals, representing the
resistive and reactive components of the input admittance. The resistive
components are modeled temperature dependent, so the real parts <code>G = real(<u>Y</u>)</code>
are determined from
the actual operating temperature and the reference input conductances <code>real(<u>Y</u>_ref)</code>.
</p>

<p>
The admittance model also has <code>m</code> optional
<a href=\"modelica://Modelica.Electrical.MultiPhase.Interfaces.ConditionalHeatPort\">conditional heat ports</a>.
A linear temperature dependency of the conductances is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic.VariableResistor\">VariableResistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor\">Resistor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Conductor\">Conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Capacitor\">Capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Inductor\">Inductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableConductor\">Variable conductor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableCapacitor\">Variable capacitor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableInductor\">Variable inductor</a>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.VariableImpedance\">Variable impedance</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VariableAdmittance;
      annotation (Icon(graphics={
            Line(origin={10,40}, points={{-100,-40},{-80,-40}}),
            Line(origin={10,40}, points={{60,-40},{80,-40}}),
            Rectangle(
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              extent={{-70,-30},{70,30}})}, coordinateSystem(extent={{-100,-100},
                {100,100}}, preserveAspectRatio=true)), Documentation(info="<html>
<p>This package hosts basic models for quasi stationary multiphase circuits.
Quasi stationary theory can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Basic\">SinglePhase.Basic</a>

</html>"));
    end Basic;

    package Ideal "Ideal components for AC multiphase models"
      extends Modelica_Icons.Package;

      model Idle "Idle branch"
        extends Interfaces.TwoPlug;

        SinglePhase.Ideal.Idle idle[m] annotation (Placement(transformation(
                extent={{-10,-10},{10,10}}, rotation=0)));

      equation
        connect(plugToPins_p.pin_p, idle.pin_p)
          annotation (Line(points={{-68,0},{-10,0}}, color={85,170,255}));
        connect(idle.pin_n, plugToPins_n.pin_n) annotation (Line(points={{10,0},{
                39,0},{39,0},{68,0}}, color={0,127,0}));
        annotation (Icon(graphics={Rectangle(
                    extent={{-60,60},{60,-60}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Line(points={{-90,0},{-41,0}}),
                Line(points={{91,0},{40,0}}),Text(
                    extent={{-100,100},{100,70}},
                    textString="%name",
                    lineColor={0,0,255})}), Documentation(info="<html>
<p>
This model describes <i>m</i> simple idle branches considering the complex currents <i><u>i</u></i> = 0;
it uses <i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.Idle\">single phase idle branches</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.Idle\">Idle</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Ideal.Short\">Short</a>
</p>
</html>"));
      end Idle;

      model Short "Short cut branch"
        extends Interfaces.TwoPlug;

        SinglePhase.Ideal.Short short[m] annotation (Placement(transformation(
                extent={{-10,-10},{10,10}}, rotation=0)));

      equation
        connect(plugToPins_p.pin_p, short.pin_p)
          annotation (Line(points={{-68,0},{-10,0}}, color={85,170,255}));
        connect(short.pin_n, plugToPins_n.pin_n) annotation (Line(points={{10,0},
                {39,0},{39,0},{68,0}}, color={0,127,0}));
        annotation (Icon(graphics={Rectangle(
                    extent={{-60,60},{60,-60}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{-100,100},{100,70}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{91,0},{-90,0}})}),
            Documentation(info="<html>
<p>
This model describes <i>m</i> simple short branches considering the complex voltages <i><u>v</u></i> = 0;
it uses <i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.Short\">single phase short branches</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.Short\">Short</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Ideal.Idle\">Idle</a>
</p>
</html>"));
      end Short;

      model IdealCommutingSwitch "Multiphase ideal commuting switch"
        parameter Integer m(final min=1) = 3 "Number of phases";
        parameter Modelica_SIunits.Resistance Ron[m](final min=zeros(m), start=
              fill(1.E-5, m)) "Closed switch resistance";
        parameter Modelica_SIunits.Conductance Goff[m](final min=zeros(m), start=
              fill(1.E-5, m)) "Opened switch conductance";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, final T=fill(293.15, m));
        Modelica_Blocks.Interfaces.BooleanInput control[m]
          "true => p--n2 connected, false => p--n1 connected" annotation (
            Placement(transformation(
              origin={0,80},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug plug_p(final m=m)
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug plug_n2(final m=m)
          annotation (Placement(transformation(extent={{90,-10},{110,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug plug_n1(final m=m)
          annotation (Placement(transformation(extent={{90,40},{110,60}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Ideal.IdealCommutingSwitch
          idealCommutingSwitch[m](
          final Ron=Ron,
          final Goff=Goff,
          each final useHeatPort=useHeatPort) annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_p plugToPins_p(final m=m)
          annotation (Placement(transformation(extent={{-90,-10},{-70,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_n plugToPins_n1(final m=m)
          annotation (Placement(transformation(
              origin={80,50},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_n plugToPins_n2(final m=m)
          annotation (Placement(transformation(
              origin={80,0},
              extent={{-10,-10},{10,10}},
              rotation=180)));
      equation
        connect(control, idealCommutingSwitch.control)
          annotation (Line(points={{0,80},{0,8}}, color={255,0,255}));
        connect(idealCommutingSwitch.heatPort, heatPort) annotation (Line(
            points={{0,-10},{0,-100}},
            color={191,0,0},
            pattern=LinePattern.None,
            smooth=Smooth.None));
        connect(plugToPins_n1.plug_n, plug_n1) annotation (Line(
            points={{82,50},{100,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plugToPins_n2.plug_n, plug_n2) annotation (Line(
            points={{82,0},{90,0},{90,0},{100,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plugToPins_n2.pin_n, idealCommutingSwitch.n2) annotation (Line(
            points={{78,0},{44,0},{44,0},{10,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealCommutingSwitch.n1, plugToPins_n1.pin_n) annotation (Line(
            points={{10,5},{10,50},{78,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plugToPins_p.plug_p, plug_p) annotation (Line(
            points={{-82,0},{-100,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealCommutingSwitch.p, plugToPins_p.pin_p) annotation (Line(
            points={{-10,0},{-78,0}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-150,-40},{150,-100}},
                    textString="%name",
                    lineColor={0,0,255}),Text(
                    extent={{-100,100},{-20,60}},
                    lineColor={0,0,0},
                    textString="m="),Text(
                    extent={{20,100},{100,60}},
                    lineColor={0,0,0},
                    textString="%m"),Ellipse(extent={{-44,4},{-36,-4}}, lineColor=
                 {0,0,255}),Line(points={{-90,0},{-44,0}}, color={0,0,255}),Line(
                points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,50},{
                90,50}}, color={0,0,255}),Line(points={{0,90},{0,25}}, color={0,0,
                255}),Line(points={{40,0},{90,0}}, color={0,0,255})}),
            Documentation(info="<HTML>
<p>
Contains m singlephase ideal commuting switches (Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.IdealCommutingSwitch).
</p>
<p>
<b>Use with care:</b>
This switch is only intended to be used for structural changes, not fast switching sequences, due to the quasistationary formulation.
</p>
</HTML>"));
      end IdealCommutingSwitch;

      model IdealIntermediateSwitch "Multiphase ideal intermediate switch"
        parameter Integer m(final min=1) = 3 "Number of phases";
        parameter Modelica_SIunits.Resistance Ron[m](final min=zeros(m), start=
              fill(1.E-5, m)) "Closed switch resistance";
        parameter Modelica_SIunits.Conductance Goff[m](final min=zeros(m), start=
              fill(1.E-5, m)) "Opened switch conductance";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, final T=fill(293.15, m));
        Modelica_Blocks.Interfaces.BooleanInput control[m]
          "true => p1--n2, p2--n1 connected, otherwise p1--n1, p2--n2 connected"
          annotation (Placement(transformation(
              origin={0,80},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug plug_p1(final m=m)
          annotation (Placement(transformation(extent={{-110,40},{-90,60}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.PositivePlug plug_p2(final m=m)
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug plug_n2(final m=m)
          annotation (Placement(transformation(extent={{90,-10},{110,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.NegativePlug plug_n1(final m=m)
          annotation (Placement(transformation(extent={{90,40},{110,60}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Ideal.IdealIntermediateSwitch
          idealIntermediateSwitch[m](
          final Ron=Ron,
          final Goff=Goff,
          each final useHeatPort=useHeatPort) annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_p plugToPins_p1(final m=m)
          annotation (Placement(transformation(extent={{-90,40},{-70,60}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_n plugToPins_n1(final m=m)
          annotation (Placement(transformation(
              origin={80,50},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_p plugToPins_p2(final m=m)
          annotation (Placement(transformation(extent={{-90,-10},{-70,10}},
                rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPins_n plugToPins_n2(final m=m)
          annotation (Placement(transformation(
              origin={80,0},
              extent={{-10,-10},{10,10}},
              rotation=180)));
      equation
        connect(control, idealIntermediateSwitch.control)
          annotation (Line(points={{0,80},{0,8}}, color={255,0,255}));
        connect(idealIntermediateSwitch.heatPort, heatPort) annotation (Line(
            points={{0,-10},{0,-100}},
            color={191,0,0},
            pattern=LinePattern.None,
            smooth=Smooth.None));
        connect(plug_p1, plugToPins_p1.plug_p) annotation (Line(
            points={{-100,50},{-92,50},{-92,50},{-82,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plug_p2, plugToPins_p2.plug_p) annotation (Line(
            points={{-100,0},{-82,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plugToPins_n1.plug_n, plug_n1) annotation (Line(
            points={{82,50},{100,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plugToPins_n2.plug_n, plug_n2) annotation (Line(
            points={{82,0},{90,0},{90,0},{100,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealIntermediateSwitch.p2, plugToPins_p2.pin_p) annotation (Line(
            points={{-10,0},{-78,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealIntermediateSwitch.n2, plugToPins_n2.pin_n) annotation (Line(
            points={{10,0},{44,0},{44,0},{78,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealIntermediateSwitch.n1, plugToPins_n1.pin_n) annotation (Line(
            points={{10,5},{10,50},{78,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealIntermediateSwitch.p1, plugToPins_p1.pin_p) annotation (Line(
            points={{-10,5},{-10,50},{-78,50}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-150,-40},{150,-100}},
                    textString="%name",
                    lineColor={0,0,255}),Text(
                    extent={{-100,100},{-20,60}},
                    lineColor={0,0,0},
                    textString="m="),Text(
                    extent={{20,100},{100,60}},
                    lineColor={0,0,0},
                    textString="%m"),Ellipse(extent={{-4,30},{4,22}}, lineColor={
                0,0,255}),Line(points={{-90,0},{-44,0}}, color={0,0,255}),Line(
                points={{-90,50},{-44,50}}, color={0,0,255}),Line(points={{-44,0},
                {40,50}}, color={0,0,255}),Line(points={{-44,50},{40,0}}, color={
                0,0,255}),Line(points={{40,50},{90,50}}, color={0,0,255}),Line(
                points={{0,90},{0,25}}, color={0,0,255}),Line(points={{40,0},{90,
                0}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
Contains m ideal intermediate switches (Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.IdealIntermediateSwitch).
</p>
<p>
<b>Use with care:</b>
This switch is only intended to be used for structural changes, not fast switching sequences, due to the quasistationary formulation.
</p>
</HTML>"));
      end IdealIntermediateSwitch;

      model IdealOpeningSwitch "Multiphase ideal opener"
        extends
          Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.TwoPlug;
        parameter Modelica_SIunits.Resistance Ron[m](final min=zeros(m), start=
              fill(1.E-5, m)) "Closed switch resistance";
        parameter Modelica_SIunits.Conductance Goff[m](final min=zeros(m), start=
              fill(1.E-5, m)) "Opened switch conductance";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, final T=fill(293.15, m));
        Modelica_Blocks.Interfaces.BooleanInput control[m]
          "true => switch open, false => p--n connected" annotation (Placement(
              transformation(
              origin={0,70},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Ideal.IdealOpeningSwitch
          idealOpeningSwitch[m](
          final Ron=Ron,
          final Goff=Goff,
          each final useHeatPort=useHeatPort) annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=0)));
      equation
        connect(control, idealOpeningSwitch.control)
          annotation (Line(points={{0,70},{0,7}}, color={255,0,255}));
        connect(idealOpeningSwitch.heatPort, heatPort) annotation (Line(
            points={{0,-10},{0,-100}},
            color={191,0,0},
            pattern=LinePattern.None,
            smooth=Smooth.None));
        connect(idealOpeningSwitch.pin_n, plugToPins_n.pin_n) annotation (Line(
            points={{10,0},{39,0},{39,0},{68,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plugToPins_p.pin_p, idealOpeningSwitch.pin_p) annotation (Line(
            points={{-68,0},{-10,0}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-150,-40},{150,-100}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{-90,0},{-44,0}}, color={0,
                0,255}),Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
                Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{0,
                88},{0,26}}, color={0,0,255}),Line(points={{40,0},{90,0}}, color=
                {0,0,255}),Text(
                    extent={{-100,100},{-20,60}},
                    lineColor={0,0,0},
                    textString="m="),Text(
                    extent={{20,100},{100,60}},
                    lineColor={0,0,0},
                    textString="%m"),Line(points={{40,20},{40,0}}, color={0,0,255})}),
            Documentation(info="<HTML>
<p>
Contains m ideal opening switches (Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.IdealOpeningSwitch).
</p>
<p>
<b>Use with care:</b>
This switch is only intended to be used for structural changes, not fast switching sequences, due to the quasistationary formulation.
</p>
</HTML>"));
      end IdealOpeningSwitch;

      model IdealClosingSwitch "Multiphase ideal closer"
        extends
          Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.TwoPlug;
        parameter Modelica_SIunits.Resistance Ron[m](final min=zeros(m), start=
              fill(1.E-5, m)) "Closed switch resistance";
        parameter Modelica_SIunits.Conductance Goff[m](final min=zeros(m), start=
              fill(1.E-5, m)) "Opened switch conductance";
        extends Modelica_Electrical_MultiPhase.Interfaces.ConditionalHeatPort(
            final mh=m, final T=fill(293.15, m));
        Modelica_Blocks.Interfaces.BooleanInput control[m]
          "true => p--n connected, false => switch open" annotation (Placement(
              transformation(
              origin={0,70},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Ideal.IdealClosingSwitch
          idealClosingSwitch[m](
          final Ron=Ron,
          final Goff=Goff,
          each final useHeatPort=useHeatPort) annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=0)));
      equation
        connect(control, idealClosingSwitch.control)
          annotation (Line(points={{0,70},{0,7}}, color={255,0,255}));
        connect(idealClosingSwitch.heatPort, heatPort) annotation (Line(
            points={{0,-10},{0,-100}},
            color={191,0,0},
            pattern=LinePattern.None,
            smooth=Smooth.None));
        connect(idealClosingSwitch.pin_p, plugToPins_p.pin_p) annotation (Line(
            points={{-10,0},{-68,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealClosingSwitch.pin_n, plugToPins_n.pin_n) annotation (Line(
            points={{10,0},{39,0},{39,0},{68,0}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-150,-40},{150,-100}},
                    textString="%name",
                    lineColor={0,0,255}),Line(points={{-90,0},{-44,0}}, color={0,
                0,255}),Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
                Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{0,
                88},{0,26}}, color={0,0,255}),Line(points={{40,0},{90,0}}, color=
                {0,0,255}),Text(
                    extent={{-100,100},{-20,60}},
                    lineColor={0,0,0},
                    textString="m="),Text(
                    extent={{20,100},{100,60}},
                    lineColor={0,0,0},
                    textString="%m")}), Documentation(info="<HTML>
<p>
Contains m ideal closing switches (Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.IdealClosingSwitch).
</p>
<p>
<b>Use with care:</b>
This switch is only intended to be used for structural changes, not fast switching sequences, due to the quasistationary formulation.
</p>
</HTML>"));
      end IdealClosingSwitch;
      annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
              preserveAspectRatio=true), graphics={
            Line(origin={10,34}, points={{-100,-60},{-54,-60}}),
            Ellipse(origin={10,34}, extent={{-54,-64},{-46,-56}}),
            Line(origin={10,34}, points={{-47,-58},{30,-10}}),
            Line(origin={10,34}, points={{30,-40},{30,-60}}),
            Line(origin={10,34}, points={{30,-60},{80,-60}})}), Documentation(
            info="<html>
<p>This package hosts ideal models for quasi stationary multiphase circuits.
Quasi stationary theory can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Ideal\">SinglePhase.Ideal</a>

</html>"));
    end Ideal;

    package Blocks "Blocks for quasi stationary multi phase systems"
      extends Modelica_Icons.Package;
      block SymmetricalComponents
        "Creates symmetrical components from signals representing quasi static phasors"
        extends Modelica_ComplexBlocks.Interfaces.ComplexMIMO(final nin=m,final
            nout=m);
        parameter Integer m=3 "Number of phases";
      equation
        y =
          Modelica_Electrical_MultiPhase.Functions.symmetricTransformationMatrix(
          m)*u;
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{100,100}}), graphics), Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics={Line(
                    points={{-44,0},{-44,0},{-8,-20},{-22,-16},{-18,-10},{-8,-20}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{-44,0},{-44,40},{-40,26},{-48,26},{-44,40}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{-18,10},{-18,10},{2,-24},{-8,-14},{-2,-10},{2,-24}},
                    color={0,0,255},
                    smooth=Smooth.None,
                    origin={-54,-18},
                    rotation=-90),Line(
                    points={{42,48},{42,48},{78,28},{64,32},{68,38},{78,28}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{42,48},{42,88},{46,74},{38,74},{42,88}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{-18,10},{-18,10},{2,-24},{-8,-14},{-2,-10},{2,-24}},
                    color={0,0,255},
                    smooth=Smooth.None,
                    origin={32,30},
                    rotation=-90),Line(
                    points={{42,-22},{42,-22},{78,-42},{64,-38},{68,-32},{78,-42}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{42,-22},{42,18},{46,4},{38,4},{42,18}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{-18,10},{-18,10},{2,-24},{-8,-14},{-2,-10},{2,-24}},
                    color={0,0,255},
                    smooth=Smooth.None,
                    origin={32,-40},
                    rotation=-90),Line(
                    points={{42,-88},{42,-48},{46,-62},{38,-62},{42,-48}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{52,-88},{52,-48},{56,-62},{48,-62},{52,-48}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{32,-88},{32,-48},{36,-62},{28,-62},{32,-48}},
                    color={0,0,255},
                    smooth=Smooth.None)}));
      end SymmetricalComponents;

      block SingleToMultiPhase
        "Extends complex phase signal to complex multi phase signals using symmetricOrientation"
        extends Modelica_ComplexBlocks.Interfaces.ComplexSIMO(final nout=m);
        parameter Integer m=3 "Number of phases";
      equation
        y = u*Modelica_ComplexMath.fromPolar(fill(1, m), -
          Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{100,100}}), graphics={Line(
                    points={{-60,-20},{-60,20},{-56,8},{-64,8},{-60,20}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{40,-20},{40,20},{44,8},{36,8},{40,20}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{40,-20},{40,-20},{76,-40},{64,-38},{68,-30},{76,-40}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{-18,10},{-18,10},{2,-24},{-8,-16},{-2,-10},{2,-24}},
                    color={0,0,255},
                    smooth=Smooth.None,
                    origin={30,-38},
                    rotation=-90)}), Icon(graphics={Line(
                    points={{-60,-20},{-60,20},{-56,8},{-64,8},{-60,20}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{40,-20},{40,20},{44,6},{36,6},{40,20}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{40,-20},{40,-20},{76,-40},{62,-36},{66,-30},{76,-40}},
                    color={0,0,255},
                    smooth=Smooth.None),Line(
                    points={{-18,10},{-18,10},{2,-24},{-8,-14},{-2,-10},{2,-24}},
                    color={0,0,255},
                    smooth=Smooth.None,
                    origin={30,-38},
                    rotation=-90)}));
      end SingleToMultiPhase;

      block ToSpacePhasor "Conversion: m phase -> space phasor"
        extends Modelica_Blocks.Icons.Block;
        import Modelica_ComplexMath.j;
        import Modelica_ComplexMath.exp;
        import Modelica_ComplexMath.'sum';
        parameter Integer m(min=1) = 3 "Number of phases";
        Modelica_ComplexBlocks.Interfaces.ComplexInput u[m]
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Modelica_Blocks.Interfaces.RealOutput y[2]
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      protected
        parameter Modelica_SIunits.Angle phi[m]=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
        Complex c;
      equation
        c = sqrt(2)/m*'sum'({u[k]*exp(j*phi[k]) for k in 1:m});
        y = {c.re,c.im};
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Line(points={{0,0},{80,80},{60,72},{72,60},
                {80,80}}, color={0,0,255}),Line(points={{0,0},{80,-80},{72,-60},{
                60,-72},{80,-80}}, color={0,0,255}),Line(
                    points={{-80,0},{-73.33,10},{-66.67,17.32},{-60,20},{-53.33,
                  17.32},{-46.67,10},{-40,0},{-33.33,-10},{-26.67,-17.32},{-20,-20},
                  {-13.33,-17.32},{-6.67,-10},{0,0}},
                    color={0,0,255},
                    smooth=Smooth.Bezier),Line(
                    points={{-90,0},{-83.33,10},{-76.67,17.32},{-70,20},{-63.33,
                  17.32},{-56.67,10},{-50,0},{-43.33,-10},{-36.67,-17.32},{-30,-20},
                  {-23.33,-17.32},{-16.67,-10},{-10,0}},
                    color={0,0,255},
                    smooth=Smooth.Bezier),Line(
                    points={{-70,0},{-63.33,10},{-56.67,17.32},{-50,20},{-43.33,
                  17.32},{-36.67,10},{-30,0},{-23.33,-10},{-16.67,-17.32},{-10,-20},
                  {-3.33,-17.32},{3.33,-10},{10,0}},
                    color={0,0,255},
                    smooth=Smooth.Bezier),Text(
                    extent={{-12,-74},{64,-86}},
                    lineColor={0,0,0},
                    textString="zero")}),
          Documentation(info="<HTML>
    Transformation of m phase values (voltages or currents) to space phasor.
</HTML>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end ToSpacePhasor;

      block FromSpacePhasor "Conversion: space phasor -> m phase"
        extends Modelica_Blocks.Icons.Block;
        import Modelica_ComplexMath.j;
        import Modelica_ComplexMath.exp;
        parameter Integer m(min=1) = 3 "Number of phases";
        Modelica_Blocks.Interfaces.RealInput u[2]
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Modelica_ComplexBlocks.Interfaces.ComplexOutput y[m]
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      protected
        parameter Modelica_SIunits.Angle phi[m]=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
      equation
        y = {Complex(u[1], u[2])*exp(-j*phi[k])/sqrt(2) for k in 1:m};
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Line(points={{0,0},{-80,80},{-60,
                72},{-72,60},{-80,80}}, color={0,0,255}),Line(points={{0,0},{-80,
                -80},{-72,-60},{-60,-72},{-80,-80}}, color={0,0,255}),Line(
                    points={{0,0},{6.67,10},{13.33,17.32},{20,20},{26.67,17.32},{
                  33.33,10},{40,0},{46.67,-10},{53.33,-17.32},{60,-20},{66.67,-17.32},
                  {73.33,-10},{80,0}},
                    color={0,0,255},
                    smooth=Smooth.Bezier),Line(
                    points={{-10,0},{-3.33,10},{3.33,17.32},{10,20},{16.67,17.32},
                  {23.33,10},{30,0},{36.67,-10},{43.33,-17.32},{50,-20},{56.67,-17.32},
                  {63.33,-10},{70,0}},
                    color={0,0,255},
                    smooth=Smooth.Bezier),Line(
                    points={{10,0},{16.67,10},{23.33,17.32},{30,20},{36.67,17.32},
                  {43.33,10},{50,0},{56.67,-10},{63.33,-17.32},{70,-20},{76.67,-17.32},
                  {83.33,-10},{90,0}},
                    color={0,0,255},
                    smooth=Smooth.Bezier),Text(
                    extent={{-62,-74},{14,-86}},
                    lineColor={0,0,0},
                    textString="zero")}), Documentation(info="<HTML>
          Transformation of space phasorto m phase values (voltages or currents).
</HTML>"));
      end FromSpacePhasor;
    end Blocks;

    package Functions
      extends Modelica_Icons.Package;
      function quasiRMS
        "Overall quasi-RMS value of complex input (current or voltage)"
        extends Modelica_Icons.Function;
        import Modelica_ComplexMath.'abs';
        input Complex u[:];
        output Real y;
        import Modelica_Constants.pi;
      protected
        Integer m=size(u, 1) "Number of phases";
      algorithm
        y := sum({'abs'(u[k]) for k in 1:m})/m;
        annotation (Inline=true, Documentation(info="<HTML>
  This function determines the continuous quasi <a href=\"Modelica://Modelica.Blocks.Math.RootMeanSquare\">RMS</a> value of a multi phase system,
  represented by m quasi static time domain phasors.
</HTML>"));
      end quasiRMS;

      function activePower
        "Calculate active power of complex input voltage and current"
        extends Modelica_Icons.Function;
        input Modelica_SIunits.ComplexVoltage v[:]
          "QuasiStationary voltage phasors";
        input Modelica_SIunits.ComplexCurrent i[size(v, 1)]
          "QuasiStationary current phasors";
        output Modelica_SIunits.Power p "Active power";
      algorithm
        p := sum(Modelica_ComplexMath.real({v[k]*Modelica_ComplexMath.conj(i[k])
          for k in 1:size(v, 1)}));
        annotation (Inline=true, Documentation(info="<HTML>
<p>
Calculates instantaneous power from multiphase voltages and currents.
In quasistaionary operation, instantaneous power equals active power;
</p>
</HTML>"));
      end activePower;
    end Functions;

    package Sensors "AC multiphase sensors"
      extends Modelica_Icons.SensorsPackage;

      model ReferenceSensor "Sensor of reference angle gamma"
        extends
          Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.AbsoluteSensor;
        Modelica_Blocks.Interfaces.RealOutput y "Reference angle" annotation (
            Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      equation
        y = plug_p.reference.gamma;
        plug_p.pin.i = fill(Complex(0), m);
        annotation (Icon(graphics={Text(
                    extent={{60,-60},{-60,-30}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid,
                    textString="ref")}), Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics));
      end ReferenceSensor;

      model FrequencySensor "Frequency sensor"
        extends Interfaces.AbsoluteSensor;
        SinglePhase.Sensors.FrequencySensor frequencySensor annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=0)));
        Basic.PlugToPin_p plugToPin_p(final m=m, final k=1) annotation (Placement(
              transformation(extent={{-80,-10},{-60,10}}, rotation=0)));
        Modelica_Blocks.Interfaces.RealOutput y annotation (Placement(
              transformation(extent={{100,-10},{120,10}}, rotation=0)));
      equation

        connect(plug_p, plugToPin_p.plug_p) annotation (Line(
            points={{-100,0},{-72,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plugToPin_p.pin_p, frequencySensor.pin) annotation (Line(
            points={{-68,0},{-10,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(frequencySensor.y, y) annotation (Line(
            points={{11,0},{110,0}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(graphics={Line(points={{70,0},{80,0},{90,0},{100,0}},
                color={0,0,127}),Text(
                    extent={{-29,-11},{30,-70}},
                    lineColor={0,0,0},
                    textString="f")}), Documentation(info="<html>

<p>
This sensor can be used to measure the frequency of the reference system, using <i>1</i>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.FrequencySensor\">single phase FrequencySensor</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.FrequencySensor\">SinglePhase.FrequencySensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PotentialSensor\">PotentialSensor</a>
</p>

</html>"));
      end FrequencySensor;

      model PotentialSensor "Potential sensor"
        extends Interfaces.AbsoluteSensor;
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.PotentialSensor
          potentialSensor[m] annotation (Placement(transformation(extent={{-10,
                  -10},{10,10}}, rotation=0)));
        Basic.PlugToPins_p plugToPins_p(final m=m) annotation (Placement(
              transformation(extent={{-80,-10},{-60,10}}, rotation=0)));
        Modelica_ComplexBlocks.Interfaces.ComplexOutput y[m] annotation (
            Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      equation

        connect(potentialSensor.y, y) annotation (Line(points={{11,0},{35.75,0},{
                35.75,0},{60.5,0},{60.5,0},{110,0}}, color={85,170,255}));
        connect(plug_p, plugToPins_p.plug_p) annotation (Line(
            points={{-100,0},{-72,0}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(plugToPins_p.pin_p, potentialSensor.pin) annotation (Line(
            points={{-68,0},{-10,0}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                    extent={{-29,-11},{30,-70}},
                    lineColor={0,0,0},
                    textString="V")}), Documentation(info="<html>

<p>
This sensor can be used to measure <i>m</i> complex potentials, using <i>m</i>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PotentialSensor\">single phase PotentialSensors</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PotentialSensor\">SinglePhase.PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentSensor\">CurrentSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor\">PowerSensor</a>
</p>

</html>"));
      end PotentialSensor;

      model VoltageSensor "Voltage sensor"
        extends Interfaces.RelativeSensor;
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.VoltageSensor voltageSensor[m]
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=0)));
      equation
        connect(plugToPins_p.pin_p, voltageSensor.pin_p) annotation (Line(points=
                {{-68,0},{-53.5,0},{-53.5,0},{-39,0},{-39,0},{-10,0}}, color={85,
                170,255}));
        connect(voltageSensor.pin_n, plugToPins_n.pin_n) annotation (Line(points=
                {{10,0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        connect(voltageSensor.y, y) annotation (Line(points={{0,-11},{0,-35.75},{
                0,-35.75},{0,-60.5},{0,-60.5},{0,-110}}, color={85,170,255}));
        annotation (Icon(graphics={Text(
                    extent={{-29,-11},{30,-70}},
                    lineColor={0,0,0},
                    textString="V")}), Documentation(info="<html>

<p>
This sensor can be used to measure <i>m</i> complex voltages, using <i>m</i>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor\">single phase VoltageSensors</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor\">SinglePhase.VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentSensor\">CurrentSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor\">PowerSensor</a>
</p>

</html>"));
      end VoltageSensor;

      model CurrentSensor "Current Sensor"
        extends Interfaces.RelativeSensor;
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.CurrentSensor currentSensor[m]
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=0)));
      equation
        connect(plugToPins_p.pin_p, currentSensor.pin_p) annotation (Line(points=
                {{-68,0},{-53.5,0},{-53.5,0},{-39,0},{-39,0},{-10,0}}, color={85,
                170,255}));
        connect(currentSensor.pin_n, plugToPins_n.pin_n) annotation (Line(points=
                {{10,0},{39,0},{39,0},{68,0}}, color={85,170,255}));
        connect(currentSensor.y, y) annotation (Line(points={{0,-11},{0,-35.75},{
                0,-35.75},{0,-60.5},{0,-60.5},{0,-110}}, color={85,170,255}));
        annotation (Icon(graphics={Text(
                    extent={{-29,-11},{30,-70}},
                    lineColor={0,0,0},
                    textString="I")}), Documentation(info="<html>

<p>
This sensor can be used to measure <i>m</i> complex currents, using <i>m</i>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor\">single phase CurrentSensors</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor\">SinglePhase.CurrentSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor\">PowerSensor</a>
</p>

</html>"));
      end CurrentSensor;

      model PowerSensor "Power sensor"
        extends Modelica_Icons.RotationalSensor;
        parameter Integer m(min=1) = 3 "number of phases";
        Modelica_SIunits.AngularVelocity omega=der(currentP.reference.gamma);
        Interfaces.PositivePlug currentP(final m=m) annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
        Interfaces.NegativePlug currentN(final m=m) annotation (Placement(
              transformation(extent={{90,-10},{110,10}}, rotation=0)));
        Interfaces.PositivePlug voltageP(final m=m) annotation (Placement(
              transformation(extent={{-10,90},{10,110}}, rotation=0)));
        Interfaces.NegativePlug voltageN(final m=m) annotation (Placement(
              transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
        Modelica_ComplexBlocks.Interfaces.ComplexOutput y annotation (Placement(
              transformation(
              origin={-80,-110},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Basic.PlugToPins_p plugToPinsCurrentP(final m=m) annotation (Placement(
              transformation(extent={{-80,-10},{-60,10}}, rotation=0)));
        Basic.PlugToPins_p plugToPinsVoltageP(final m=m) annotation (Placement(
              transformation(
              origin={0,70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Basic.PlugToPins_n plugToPinsCurrentN(final m=m) annotation (Placement(
              transformation(extent={{80,-10},{60,10}}, rotation=0)));
        Basic.PlugToPins_n plugToPinsVoltageN(final m=m) annotation (Placement(
              transformation(
              origin={0,-70},
              extent={{-10,10},{10,-10}},
              rotation=90)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.PowerSensor powerSensor[m]
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=0)));
        Modelica_ComplexBlocks.ComplexMath.Sum sum(final nin=m) annotation (
            Placement(transformation(
              origin={-80,-70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      equation
        connect(plugToPinsCurrentP.plug_p, currentP) annotation (Line(points={{-72,
                0},{-79,0},{-86,0},{-100,0}}, color={85,170,255}));
        connect(currentN, plugToPinsCurrentN.plug_n) annotation (Line(points={{
                100,0},{93,0},{86,0},{72,0}}, color={85,170,255}));
        connect(voltageP, plugToPinsVoltageP.plug_p)
          annotation (Line(points={{0,100},{0,100},{0,72}}, color={85,170,255}));
        connect(plugToPinsVoltageN.plug_n, voltageN) annotation (Line(points={{0,
                -72},{0,-72},{0,-100}}, color={85,170,255}));
        connect(plugToPinsCurrentP.pin_p, powerSensor.currentP) annotation (Line(
              points={{-68,0},{-53.5,0},{-53.5,0},{-39,0},{-39,0},{-10,0}}, color=
               {85,170,255}));
        connect(powerSensor.currentN, plugToPinsCurrentN.pin_n) annotation (Line(
              points={{10,0},{24.5,0},{24.5,0},{39,0},{39,0},{68,0}}, color={85,
                170,255}));
        connect(powerSensor.voltageP, plugToPinsVoltageP.pin_p) annotation (Line(
              points={{0,10},{0,10},{0,68},{0,68}}, color={85,170,255}));
        connect(powerSensor.voltageN, plugToPinsVoltageN.pin_n) annotation (Line(
              points={{0,-10},{0,-10},{0,-68},{0,-68}}, color={85,170,255}));
        connect(powerSensor.y, sum.u) annotation (Line(points={{-8,-11},{-8,-40},
                {-80,-40},{-80,-58}}, color={85,170,255}));
        connect(sum.y, y)
          annotation (Line(points={{-80,-81},{-80,-110}}, color={85,170,255}));
        annotation (
          Icon(graphics={Line(points={{0,100},{0,70}}, color={0,0,255}),Line(
                points={{0,-70},{0,-100}}, color={0,0,255}),Text(extent={{-29,-70},
                {30,-11}}, textString="P"),Line(points={{-80,-100},{-80,0}},
                color={85,170,255}),Text(
                    textColor={0,0,255},
                    extent={{-100,110},{100,150}},
                    textString="%name"),Line(points={{-100,0},{100,0}}, color={0,
                0,255})}),
          Documentation(info="<html>

<p>
This sensor can be used to measure <i>m</i> complex apparent power values, using <i>m</i>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">single phase PowerSensors</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">SinglePhase.PowerSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentSensor\">CurrentSensor</a>
</p>

</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end PowerSensor;
      annotation (Documentation(info="<html>
<p>This package hosts sensors for quasi stationary multiphase circuits.
Quasi stationary theory can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors\">SinglePhase.Sensors</a>

</html>"));
    end Sensors;

    package Sources "AC multiphase sources"
      extends Modelica_Icons.SourcesPackage;

      model VoltageSource "Constant multiphase AC voltage"
        extends Interfaces.Source;
        import Modelica_ComplexMath.j;
        import Modelica_ComplexMath.exp;
        parameter Modelica_SIunits.Frequency f(start=1)
          "Frequency of the source";
        parameter Modelica_SIunits.Voltage V[m](start=fill(1, m))
          "RMS voltage of the source";
        parameter Modelica_SIunits.Angle phi[m]=-
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m)
          "Phase shift of the source";
      equation
        omega = 2*Modelica_Constants.pi*f;
        v = {V[k]*exp(j*phi[k]) for k in 1:m};
        annotation (
          Icon(graphics={
              Line(points={{50,0},{-50,0}}, color={0,0,0}),
              Text(
                extent={{-120,50},{-20,0}},
                lineColor={0,0,255},
                textString="+"),
              Text(
                extent={{20,50},{120,0}},
                lineColor={0,0,255},
                textString="-")}),
          Documentation(info="<html>

<p>
This model describes <i>m</i> constant voltage sources, specifying the complex voltages by the RMS voltages and the phase shifts
(defaults are
<a href=\"modelica://Modelica.Electrical.MultiPhase.Functions.symmetricOrientation\">-symmetricOrientation</a>).
<i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">single phase VoltageSources</a> are used.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">SinglePhase.VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end VoltageSource;

      model VariableVoltageSource "Variable multiphase AC voltage"
        extends Interfaces.Source;
        Modelica_Blocks.Interfaces.RealInput f annotation (Placement(
              transformation(
              origin={40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_ComplexBlocks.Interfaces.ComplexInput V[m] annotation (Placement(
              transformation(
              origin={-40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        omega = 2*Modelica_Constants.pi*f;
        v = V;
        annotation (Icon(graphics={
              Line(points={{50,0},{-50,0}}, color={0,0,0}),
              Text(
                extent={{-120,50},{-20,0}},
                lineColor={0,0,255},
                textString="+"),
              Text(
                extent={{20,50},{120,0}},
                lineColor={0,0,255},
                textString="-")}), Documentation(info="<html>

<p>
This model describes <i>m</i> variable voltage sources, with <i>m</i> complex signal inputs,
specifying the complex voltages by the complex RMS voltage components.
Additionally, the frequency of the voltage source is defined by a real signal input.
<i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableVoltageSource\">single phase VariableVoltageSources</a> are used.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">SinglePhase.VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>
</p>
</html>"));
      end VariableVoltageSource;

      model ReferenceVoltageSource
        "Variable multiphase AC voltage with reference angle input"
        extends Interfaces.ReferenceSource;
        import Modelica_Constants.pi;
        Modelica_Blocks.Interfaces.RealInput gamma
          "Reference angle of voltage source" annotation (Placement(
              transformation(
              origin={40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_ComplexBlocks.Interfaces.ComplexInput V[m] annotation (Placement(
              transformation(
              origin={-40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        plug_p.reference.gamma = gamma;
        v = V;
        annotation (Documentation(info="<html>

<p>
This model describes <i>m</i> variable current sources, with <i>m</i> complex signal inputs,
specifying the complex current by the complex RMS voltage components.
Additionally, the frequency of the current source is defined by a real signal input.
<i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">single phase VariableCurrentSources</a> are used.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">SinglePhase.VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>.
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end ReferenceVoltageSource;

      model CurrentSource "Constant multiphase AC current"
        extends Interfaces.Source;
        import Modelica_ComplexMath.j;
        import Modelica_ComplexMath.exp;
        parameter Modelica_SIunits.Frequency f(start=1)
          "Frequency of the source";
        parameter Modelica_SIunits.Current I[m](start=fill(1, m))
          "RMS current of the source";
        parameter Modelica_SIunits.Angle phi[m]=-
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m)
          "Phase shift of the source";
      equation
        omega = 2*Modelica_Constants.pi*f;
        i = {I[k]*exp(j*phi[k]) for k in 1:m};
        annotation (Icon(graphics={
              Line(points={{-60,60},{60,60}}, color={0,0,255}),
              Polygon(
                points={{60,60},{30,70},{30,50},{60,60}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{0,-50},{0,50}}, color={0,0,0})}), Documentation(info="<html>

<p>
This model describes <i>m</i> constant current sources, specifying the complex currents by the RMS currents and the the phase shifts
(defaults are
<a href=\"modelica://Modelica.Electrical.MultiPhase.Functions.symmetricOrientation\">-symmetricOrientation</a>).
<i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.CurrentSource\">single phase CurrentSources</a> are used.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.CurrentSource\">SinglePhase.CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>
</p>
</html>"));
      end CurrentSource;

      model VariableCurrentSource "Variable multiphase AC current"
        extends Interfaces.Source;
        Modelica_Blocks.Interfaces.RealInput f annotation (Placement(
              transformation(
              origin={40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_ComplexBlocks.Interfaces.ComplexInput I[m] annotation (Placement(
              transformation(
              origin={-40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        omega = 2*Modelica_Constants.pi*f;
        i = I;
        annotation (Icon(graphics={
              Line(points={{-60,60},{60,60}}, color={85,170,255}),
              Polygon(
                points={{60,60},{30,70},{30,50},{60,60}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{0,-50},{0,50}}, color={0,0,0})}), Documentation(info="<html>

<p>
This model describes <i>m</i> variable current sources, with <i>m</i> complex signal inputs,
specifying the complex current by the complex RMS voltage components.
Additionally, the frequency of the current source is defined by a real signal input.
<i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">single phase VariableCurrentSources</a> are used.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">SinglePhase.VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>.
</p>
</html>"));
      end VariableCurrentSource;

      model ReferenceCurrentSource
        "Variable multiphase AC current with reference angle input"
        extends Interfaces.ReferenceSource;
        import Modelica_Constants.pi;
        Modelica_Blocks.Interfaces.RealInput gamma
          "Reference angle of current source" annotation (Placement(
              transformation(
              origin={40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Modelica_ComplexBlocks.Interfaces.ComplexInput I[m] annotation (Placement(
              transformation(
              origin={-40,100},
              extent={{-20,-20},{20,20}},
              rotation=270)));
      equation
        plug_p.reference.gamma = gamma;
        i = I;
        annotation (
          Icon(graphics={
              Line(points={{-60,60},{60,60}}, color={85,170,255}),
              Polygon(
                points={{60,60},{30,70},{30,50},{60,60}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{0,-50},{0,50}}, color={0,0,0})}),
          Documentation(info="<html>

<p>
This model describes <i>m</i> variable current sources, with <i>m</i> complex signal inputs,
specifying the complex current by the complex RMS voltage components.
Additionally, the frequency of the current source is defined by a real signal input.
<i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">single phase VariableCurrentSources</a> are used.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">SinglePhase.VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>.
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end ReferenceCurrentSource;
      annotation (Documentation(info="<html>
<p>This package hosts sources for quasi stationary multiphase circuits.
Quasi stationary theory can be found in the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>

<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources\">SinglePhase.Sources</a>

</html>"));
    end Sources;

    package Interfaces "Interfaces for AC multiphase models"
      extends Modelica_Icons.InterfacesPackage;

      connector Plug "Basic multiphase plug"
        parameter Integer m=3 "number of phases";
        SinglePhase.Interfaces.Pin pin[m];
        annotation (Documentation(info="<html>

<p>
This multiphase plug contains a vector of <i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">single phase pins</a>.
The <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">positive</a> and
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">negative plug</a> are
derived from this base connector.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>
</html>"));
      end Plug;

      connector PositivePlug "Positive multiphase connector"
        extends Plug;
        Types.Reference reference;
        annotation (
          Icon(graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={85,170,255},
                fillColor={85,170,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(graphics={Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={85,170,255},
                fillColor={85,170,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-100,100},{100,60}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>

<p>
The positive plug is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angular velocity of each quasi stationary voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">negative plug</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>
</p>
</html>"));
      end PositivePlug;

      connector NegativePlug "Negative multiphase connector"
        extends Plug;
        Types.Reference reference;
        annotation (
          Icon(graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={85,170,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(graphics={Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={85,170,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-100,100},{100,60}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>

<p>
The negative plug is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angular velocity of each quasi stationary voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">positive plug</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Pin\">Pin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin\">PositivePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin\">NegativePin</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.Plug\">Plug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
</p>
</html>"));
      end NegativePlug;

      partial model TwoPlug "Two plugs with pin-adapter"
        parameter Integer m(min=1) = 3 "Number of phases";
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
        /*
  Real pf_total = cos(Modelica.ComplexMath.arg(Complex(P_total,Q_total)))
   "Total power factor";
  */
        Modelica_SIunits.AngularVelocity omega
          "Angular velocity of reference frame";

        PositivePlug plug_p(final m=m)
          "Positive quasi stationary multi phase plug" annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
        NegativePlug plug_n(final m=m)
          "Negative quasi stationary multi phase plug" annotation (Placement(
              transformation(extent={{90,-10},{110,10}}, rotation=0)));
        Basic.PlugToPins_p plugToPins_p(final m=m) annotation (Placement(
              transformation(extent={{-80,-10},{-60,10}}, rotation=0)));
        Basic.PlugToPins_n plugToPins_n(final m=m) annotation (Placement(
              transformation(
              origin={70,0},
              extent={{-10,-10},{10,10}},
              rotation=180)));
      equation
        omega = der(plug_p.reference.gamma);
        v = plug_p.pin.v - plug_n.pin.v;
        i = plug_p.pin.i;
        connect(plug_p, plugToPins_p.plug_p) annotation (Line(points={{-100,0},{-93,
                0},{-86,0},{-72,0}}, color={85,170,255}));
        connect(plugToPins_n.plug_n, plug_n)
          annotation (Line(points={{72,0},{86,0},{100,0}}, color={85,170,255}));
        annotation (Documentation(info="<html>
<p>
This partial model uses a <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">positive</a>
and <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">negative plug</a> and defines the complex voltage differences as well as the complex currents (into the positive plug). A <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_p\">positive</a> and
a <a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_n\">negative adapter</a> are used to give easy access to the single pins of both plugs. Additionally, the angular velocity of the quasi stationary system is explicitly defined as variable. This model is mainly intended to be used with graphical representation of user models.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">PositivePlug</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug\">NegativePlug</a>,
</p>
</html>"));
      end TwoPlug;

      partial model OnePort
        parameter Integer m(min=1) = 3 "Number of phases";
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
        /*
  Real pf_total = cos(Modelica.ComplexMath.arg(Complex(P_total,Q_total)))
    "Total power factor";
  */
        Modelica_SIunits.AngularVelocity omega
          "Angular velocity of reference frame";

        PositivePlug plug_p(final m=m)
          "Positive quasi stationary multi phase plug" annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
        NegativePlug plug_n(final m=m)
          "Negative quasi stationary multi phase plug" annotation (Placement(
              transformation(extent={{90,-10},{110,10}}, rotation=0)));
      equation
        Connections.branch(plug_p.reference, plug_n.reference);
        plug_p.reference.gamma = plug_n.reference.gamma;
        omega = der(plug_p.reference.gamma);
        v = plug_p.pin.v - plug_n.pin.v;
        i = plug_p.pin.i;
        plug_p.pin.i + plug_n.pin.i = fill(Complex(0), m);
      end OnePort;

      partial model AbsoluteSensor "Partial potential sensor"
        extends Modelica_Icons.RotationalSensor;
        parameter Integer m(min=1) = 3 "number of phases";
        Modelica_SIunits.AngularVelocity omega;
        PositivePlug plug_p(final m=m)
          "Positive quasi stationary multi phase plug" annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      equation
        omega = der(plug_p.reference.gamma);
        annotation (Icon(graphics={Line(points={{-70,0},{-94,0}}, color={85,170,
                255}),Line(points={{70,0},{80,0},{90,0},{100,0}}, color={85,170,
                255}),Text(
                    extent={{100,-100},{-100,-70}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid,
                    textString="m=%m")}), Documentation(info="<html>

<p>
The absolute sensor partial model relies on the a
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug\">positive plug</a> to measure the complex potential. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.RelativeSensor\">RelativeSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.AbsoluteSensor\">SinglePhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.RelativeSensor\">SinglePhase.Interfaces.RelativeSensor</a>
</p>

</html>"));
      end AbsoluteSensor;

      partial model RelativeSensor "Partial voltage / current sensor"
        extends Modelica_Icons.RotationalSensor;
        extends TwoPlug;
        Modelica_ComplexBlocks.Interfaces.ComplexOutput y[m] annotation (
            Placement(transformation(
              origin={0,-110},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        annotation (Icon(graphics={Line(points={{-70,0},{-94,0}}, color={0,0,0}),
                Line(points={{70,0},{94,0}}, color={0,0,0}),Line(points={{0,-70},
                {0,-80},{0,-90},{0,-100}}, color={85,170,255}),Text(
                    extent={{100,-100},{-100,-70}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid,
                    textString="m=%m")}), Documentation(info="<html>
<p>
The relative sensor partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.TwoPlug\">TwoPlug</a> to measure the complex voltages, currents or power. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.AbsoluteSensor\">AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.AbsoluteSensor\">SinglePhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.RelativeSensor\">SinglePhase.Interfaces.RelativeSensor</a>
</p>

</html>"));

      end RelativeSensor;

      partial model Source "Partial voltage / current source"
        extends OnePort;
        constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
        Modelica_SIunits.Angle gamma(start=0) = plug_p.reference.gamma;
      equation
        Connections.root(plug_p.reference);
        annotation (
          Icon(graphics={
              Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{100,-100},{-100,-60}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{-90,0},{-50,0}}, color={0,0,0}),
              Line(points={{50,0},{90,0}}, color={0,0,0}),
              Text(
                extent={{100,60},{-100,100}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="m=%m")}),
          Documentation(info="<html>
<p>
The source partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.TwoPlug\">TwoPlug</a> and contains a proper icon.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Source\">SinglePhase.Interfaces.Source</a>.
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end Source;

      partial model ReferenceSource
        "Partial of voltage or current source with reference input"
        extends
          Modelica_Electrical_QuasiStationary.MultiPhase.Interfaces.OnePort;
        import Modelica_Constants.pi;
      equation
        Connections.root(plug_p.reference);
        annotation (Icon(graphics={
              Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{100,-100},{-100,-60}},
                textString="%name",
                lineColor={0,0,255}),
              Line(points={{-90,0},{-50,0}}, color={0,0,0}),
              Line(points={{50,0},{90,0}}, color={0,0,0}),
              Text(
                extent={{100,60},{-100,100}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="m=%m")}), Documentation(info="<html>
<p>
The source partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.TwoPlug\">TwoPlug</a> and contains a proper icon.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableCurrentSource\">VariableCurrentSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.Source\">SinglePhase.Interfaces.Source</a>.
</p>
</html>"));
      end ReferenceSource;
    end Interfaces;

    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}), graphics={
          Ellipse(
            origin={14,56},
            lineColor={0,0,255},
            extent={{-84,-126},{56,14}}),
          Ellipse(
            origin={-0,40},
            lineColor={0,0,255},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid,
            extent={{-40,-34},{-20,-14}}),
          Ellipse(
            origin={20,40},
            lineColor={0,0,255},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid,
            extent={{0,-34},{20,-14}}),
          Ellipse(
            origin={10,34},
            lineColor={0,0,255},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid,
            extent={{-20,-74},{0,-54}})}), Documentation(info="<html>
<p>This package hosts models for quasi stationary multi phase circuits.
Quasi stationary theory can be found in
[<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">Vaske1973</a>]
and other
<a href=\"modelica://Modelica.Electrical.QuasiStationary.UsersGuide.References\">references</a>.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase\">SinglePhase</a>

</html>"));
  end MultiPhase;

  package Types "Definition of types for quasistationary AC models"
    extends Modelica_Icons.TypesPackage;

    record Reference "Reference angle"
      Modelica_SIunits.Angle gamma;
      function equalityConstraint "Equality constraint for reference angle"
        input Reference reference1;
        input Reference reference2;
        output Real residue[0];
      algorithm
        assert(abs(reference1.gamma - reference2.gamma) < 1E-6*2*
          Modelica_Constants.pi,
          "Reference angles should be equal!");
        annotation (Documentation(info="<html>
Equality constraint for the reference angle, according to the Modelica Specification (Overdetermined connection sets).
</html>"));
      end equalityConstraint;
      annotation (Documentation(info="<html>
Reference angle, used in the AC connectors.
</html>"));
    end Reference;
    annotation (Documentation(info="<html>
Type definitions needed for quasistationary AC models.
</html>"));
  end Types;
annotation (
  preferredView="info",
  Documentation(info="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
<p>
  Anton Haumer<br>
  <a href=\"http://www.haumer.at/\">Technical Consulting &amp; Electrical Engineering</a><br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
</p>
<p>
  Dr. Christian Kral<br>
  <a href=\"http://christiankral.net/\">Electric Machines, Drives and Systems</a><br>
  A-1060 Vienna, Austria<br>
  email: <a href=\"mailto:dr.christian.kral@gmail.com\">dr.christian.kral@gmail.com</a> or <a href=\"mailto:mail@christiankral.net\">mail@christiankral.net</a>
</p>
</dd>
</dl>
<p>
Copyright &copy; 1998-2013, Modelica Association, Anton Haumer, Christian Kral and AIT.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</HTML>", revisions="<HTML>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th>Version</th>
      <th>Revision</th>
      <th>Date</th>
      <th>Author</th>
      <th>Comment</th>
    </tr>
    <tr>
      <td valign=\"top\">1.0.0</td>
      <td valign=\"top\"> </td>
      <td valign=\"top\">2010-01-30</td>
      <td valign=\"top\">A. Haumer<br>C. Kral</td>
      <td valign=\"top\"></td>
    </tr>
</table>
</HTML>"),
  Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=
          true), graphics={Line(
        origin={10,20},
        points={{-90,-20},{-78.7,14.2},{-71.5,33.1},{-65.1,46.4},{-59.4,54.6},{
            -53.8,59.1},{-48.2,59.8},{-42.6,56.6},{-36.9,49.7},{-31.3,39.4},{-24.9,
            24.1},{-16.83,1.2},{0.1,-50.8},{7.3,-70.2},{13.7,-84.2},{19.3,-93.1},
            {25,-98.4},{30.6,-100},{36.2,-97.6},{41.9,-91.5},{47.5,-81.9},{53.9,
            -67.2},{62,-44.8},{70,-20}},
        smooth=Smooth.Bezier)}),
    uses(Complex(version="3.2.2"), Modelica_Icons));
end Modelica_Electrical_QuasiStationary;
