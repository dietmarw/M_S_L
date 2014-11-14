within ;
package Modelica_Magnetic_FundamentalWave
  "Library for magnetic fundamental wave effects in electric machines"
  extends Modelica_Icons.Package;
  package UsersGuide "User's Guide"
    extends Modelica_Icons.Information;
    class Concept "Fundamental wave concept"
      extends Modelica_Icons.Information;
      annotation (Documentation(info="<html>

<h4>Overview of the concept of fundamental waves</h4>

<p>
The exact magnetic field in the air gap of an electric machine is usually determined by an electro magnetic finite element analysis. The waveform of the magnetic field, e.g., the magnetic potential difference <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/V_m_phi.png\">, consists of a spatial fundamental wave - with respect to an equivalent two pole machine - and additional harmonic waves of different order. The fundamental wave is however dominant in the air gap of an electric machine.
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><b>Fig. 1:</b> Field lines of a four pole induction machine</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Concept/aimc_fem.png\">
    </td>
  </tr>
</table>

<p>
In the fundamental wave theory only a pure sinusoidal distribution of magnetic quantities is assumed. It is thus assumed that all other harmonic wave effects are not taken into account.</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><b>Fig. 2:</b> Magnetic potential difference of a four pole machine, where <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/varphi.png\"> is the angle of the spatial domain with respect to one pole pair</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Concept/four_pole_V_m.png\">
    </td>
  </tr>
</table>

<p>
The waveforms of the magnetic field quantities, e.g., the magnetic potential difference <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/V_m_phi.png\">, can be represented by complex phasor, e.g., <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/V_m.png\"> according to:
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/V_m_real_complex.png\">
</p>

<p>It is important to note that the magnetic potential used in this library <b>always</b> refers to an equivalent two pole machine.</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><b>Fig. 3:</b> Spatial distribution of the magnetic potential difference (red shade = positive sine wave, blue shade = negative sine wave) including complex phasor representing this spatial distribution</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Concept/electrical_reference_V_m.png\">
    </td>
  </tr>
</table>

<p>
The potential and flow quantities of this library are the complex magnetic potential difference and the complex magnetic flux as defined in the basic <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.MagneticPort\">magnetic port</a>. Due to the sinusoidal distribution of magnetic potential and flux, such a complex phasor representation can be used. This way, the FundamentalWave library can be seen as a spatial extension of the <a href=\"modelica://Modelica.Magnetic.FluxTubes\">FluxTubes</a> library.
</p>

<p>
The specific arrangement of windings in electric machines with <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/p.png\"> pole pairs give rise to sinusoidal dominant magnetic potential wave. The spatial period of this wave is determined by one pole pair
[<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.References\">Mueller70</a>,
 <a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.References\">Spaeth73</a>].
</p>

<p>
The main components of an electric machine model based on the FundamentalWave library are <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">multi phase</a> and <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">single phase windings</a>, <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">air gap</a> as well as <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">symmetric</a> or <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SaliencyCageWinding\">salient cage</a> models.
The electric machine models provided in this library are based on symmetrical windings in the stator and equivalent two or three phase windings in squirrel cage rotors. Slip ring induction machines may have different phase numbers in the stator and rotor.
</p>

<h4>Assumptions</h4>

<p>
The machine models of the FundamentalWave library are currently based on the following assumptions
</p>

<ul>
<li>The number of stator phases is greater or equal to three
    [<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.References\">Eckhardt82</a>]
    </li>
<li>The phase windings are assumed to be symmetrical; an extension to this approach can be considered</li>
<li>Only fundamental wave effects are taken into account</li>
<li>The magnetic potential difference refers to an equivalent two pole machine</li>
<li>There are no restrictions on the waveforms of voltages and currents</li>
<li>All resistances and inductances are modeled as constant quantities; saturation effects, cross coupling effects
    [<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.References\">Li07</a>], temperature dependency of resistances and deep bar effects could be considered in an extension to this library</li>
<li>Hysteresis losses are currently not considered [<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.References\">Haumer09</a>]</li>
<li>The losses dissipated in the electric machine models are
    <ul>
    <li>ohmic heat losses,</li>
    <li>eddy current losses in the stator core,</li>
    <li>stray load losses,</li>
    <li>friction losses.</li>
    </ul>
</li>
</ul>

<h4>Note</h4>

<p>
The term <b>fundamental wave</b> refers to spatial waves of the electro magnetic quantities. This library has no limitations with respect to the waveforms of the time domain signals of any voltages, currents, etc.
</p>
</html>"));
    end Concept;

    class MultiPhase "Multi phase windings"
      extends Modelica_Icons.Information;
      annotation (Documentation(info="<html>
<h4>Symmetrical three phase system</h4>

<p>
Symmetrical three phases systems of currents (or voltages) consists of three sinusoidal
sine waves with with an angular displacement of
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/2pi_3.png\"/>.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/i123.png\"/>,
</p>

<p>
Electrical three phase machines have (usually) symmetrical three phase windings which
excite spatial magnetic potential with a spacial displacement of
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/2pi_3.png\"/>
- with respect to the fundamental wave,
see [<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.References\">Laughton02</a>].
Such a symmetrical three phase system of currents (or voltages) can be represented by
<a href=\"http://en.wikipedia.org/wiki/Phasor\">phasors</a>, as depicted in Fig. 1(a).
The associated three phase winding is depicted in Fig. 2(a). The winding axis are displaced by
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/2pi_3.png\"/>:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/orientationk_3.png\"/>
</p>

<p>
So there is is a strong coherence between angular displacement in the time and
spatial domain which also applies to multi phase systems.
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><strong>Fig. 1: </strong>Symmetrical (a) three phase and (b) five phase current system</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/phase35.png\"
           alt=\"phase35.png\">
    </td>
  </tr>
</table>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><strong>Fig. 2: </strong>Symmetrical (a) three phase and (b) five phase winding</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/winding35.png\"
           alt=\"winding35.png\">
    </td>
  </tr>
</table>

<h4>Symmetrical multi phase system</h4>

<p>
In symmetrical multi phase systems odd and even phase numbers have to be distinguished.
</p>

<h5>Odd number of phases</h5>

<p>
For a symmetrical multi phase system with <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/m.png\"/>
phases the displacement in the time and spatial domain is
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/2pi_m.png\"/>,
as depicted in Fig. 1 and 2.
</p>

<p>
Mathematically, this symmetry is expressd in terms of phase currents by:
</p>

<p><img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/ik_odd.png\"/> </p>

<p>
The orientation of the winding axis of such winding is given by:
</p>

<p><img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/orientationk_m.png\"/> </p>

<h5>Even number of phases</h5>

<p>
In the current implementation of the FundamentalWave library, phase numbers equal
to the power of two are not supported. However, any other multi phase system with even
an phase number, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/m.png\"/>,
can be recursively split into various symmetrical systems with odd phase numbers, as depicted in Fig. 3 and 4.
The displacement between the two symmetrical systems is
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/pi_m.png\"/>.
A function for calculating the <a href=\"modelica://Modelica.Electrical.MultiPhase.Functions.symmetricOrientation\">symmetricOrientation</a> is available.
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><strong>Fig. 3: </strong>Symmetrical (a) six and (b) ten phase current system</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/phase610.png\"
           alt=\"phase610.png\">
    </td>
  </tr>
</table>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><strong>Fig. 4: </strong>Symmetrical (a) six and (b) ten phase winding</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/MultiPhase/winding610.png\"
           alt=\"winding610.png\">
    </td>
  </tr>
</table>


<h4>Note</h4>

<p>
In a fully symmetrical machine, the orientation of the winding axes and the symmetrical currents (or voltages)
<a href=\"http://en.wikipedia.org/wiki/Phasor\">phasors</a> have different signs; see Fig. 1 and 2 for odd phase numbers
and Fig. 3 and 4 for even phase numbes.
</p>
</html>"));
    end MultiPhase;

    class Parameters "Parameters of equivalent machines models"
      extends Modelica_Icons.Information;
      annotation (Documentation(info="<html>

<h4>Stator main inductance</h4>

<p>
The stator main inductance
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lm_m.png\">
of an
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/m.png\">
phase induction machine is related with the self inductance of on stator phase,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lss.png\">,
by:</p>
<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lm_m_Lss.png\">
</p>

<h4>Parameters of equivalent multi phase induction machines models</h4>

<p>Assume a set parameters,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Rs_3.png\">,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lssigma_3.png\">,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/L0_3.png\">,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lm_3.png\">,
of a three phase induction machine and a set of parameters,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Rs_m.png\">,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lssigma_m.png\">,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/L0_m.png\">,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lm_m.png\">,
of an
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/m.png\">
phase induction machine. It is also assumed that</p>
<ul>
<li>the nominal phase voltages</li>
<li>the nominal stator frequences</li>
</ul>
<p>of the three and
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/m.png\">
phase induction machine are equal. In this case the two parameter sets are related by:</p>
<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Rs_3m.png\"><br>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lssigma_3m.png\"><br>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/L0_3m.png\"><br>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/Lm_3m.png\"></p>
<p>
This way the same torque is generated and the machine currents are related by:
</p>
<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/is_3m.png\">
</p>

<p>
The same applies for the rotor parameters of a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing\">
slip ring induction machine</a>, where the phase number
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/m.png\">
is simply replaced by
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/mr.png\">
for transforming equivalent three phase to
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/UsersGuide/Parameters/mr.png\">
phase winding parameters -- at the same nominal rotor voltage and frequency.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Examples.BasicMachines.AIMC_DOL_MultiPhase\">AIMC_DOL_MultiPhase</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Examples.BasicMachines.AIMS_Start_MultiPhase\">AIMS_Start_MultiPhase</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Examples.BasicMachines.SMPM_Inverter_MultiPhase\">SMPM_Inverter_MultiPhase</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Examples.BasicMachines.SMEE_Generator_MultiPhase\">SMEE_Generator_MultiPhase</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Examples.BasicMachines.SMR_Inverter_MultiPhase\">SMR_Inverter_MultiPhase</a>
</p>

</html>"));
    end Parameters;

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

<h4>Acknowledgements</h4>

<p>
Based on an original idea of Michael Beuschel this library was developed
[<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.References\">Beuschel00</a>].
The authors of the FundamentalWave library would like to thank Michael Beuschel
for contributing his source code to this library.
</p>

<p>
The research leading to version 2.0.0 has received funding from the ENIAC Joint Undertaking under grant
agreement no. 270693-2 and from the &Ouml;sterreichische
Forschungsf&ouml;rderungsgesellschaft mbH under project
no. 829420.
</p>
</html>"));
    end Contact;

    class ReleaseNotes "Release Notes"
      extends Modelica_Icons.ReleaseNotes;
      annotation (Documentation(info="<html>

<h5>Version 3.2.2, 2014-09-13</h5>

<ul>
<li>Updated documentation of
    <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Short\">Short</a>,
    <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Idle\">Idle</a> and
    <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.PermanentMagnet\">PermanentMagnet</a>
    </li>
<li>Added new components:</li>
<ul>
    <li><a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Crossing\">Crossing</a></li>
    <li><a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Permeance\">Permenace</a></li>
</ul>
<li>Removed parameter text from icon layer for reluctance and permeance model</li>
<li>Restructured cage models with reluctance instead of inductance model according to ticket #1536;
the re-structuring of the model required to change the initial conditions of the included examples, since the number of rotor states is reduced by new implementation</li>
<li>Some more bug fixes according to #1226, since not all reference orientations have been correct</li>
<li>Added variables for magnitude and argument of complex magnetic potential difference and flux, see #1405</li>
</ul>

<h5>Version 3.2.1, 2013-07-31</h5>

<ul>
<li>Bug fix of wrong orientaton of squirrel and damper cage modells, see ticket #1226; this also includes the removal of the rotor cage heat sensor which previously has been used</li>
<li>Bug fix of conditional initialization of examples, see ticket #1223</li>
<li>Fixed missing default parameter TpmOperational in ambient of PM synchronous machine, see ticket #1216</li>
<li>Added voltages, currents, complex flux and magnetic potential difference as global variables in
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">multi phase converter</a></li>
<li>Added two more component examples, showing the equivalent nature of electrical and magnetic domain</li>
</ul>

<h5>Version 2.0.0, 2013-03-10</h5>

<ul>
<li>Corrected wrong parameter descriptions, see ticket #1003</li>
<li>Extended machine models towards phase numbers to greater or equal than three, see ticket #990</li>
</ul>

<h5>Version 1.7.3, 2013-02-25</h5>

<ul>
<li>Corrected wrong parameter description</li>
</ul>


<h5>Version 1.7.2, 2011-06-28</h5>

<ul>
<li>Corrected bug in calculation of core conductance in
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">SymmetricMultiPhaseWinding</a>:
the wrong calculation <code>G=(m/2)*GcRef/effectiveTurns^2</code> is now replaced by <code>G=(m/2)*GcRef*effectiveTurns^2</code></li>
</ul>

<h5>Version 1.7.1, 2010-09-03</h5>

<ul>
<li>Naming and documentation of
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PartialTwoPort\">
PartialTwoPort</a> is exchanged by
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.PartialTwoPortElementary\">
PartialTwoPortElementary</a> to match the naming conventions of
<a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces\">
Rotational.Interfaces</a>
and <a href=\"modelica://Modelica.Mechanics.Translational.Interfaces\">
Translational.Interfaces</a></li>
<li>Fixed a broken link and updated documentation</li>
<li>Adaptions to Complex SIunits</li>
</ul>

<h5>Version 1.7.0, 2010-05-31</h5>

<ul>
<li>Changed <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">symmetric multi phase winding</a> model
  <ul>
      <li>Added zero sequence inductance based on
          <a href=\"modelica://Modelica.Electrical.MultiPhase.Basic.ZeroInductor\">zero inductor</a></li>
      <li>Replaced electrical model of stray
          <a href=\"modelica://Modelica.Electrical.MultiPhase.Basic.Inductor\">inductor</a> by stray
          <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Reluctance\">reluctance</a> model</li>
      <li>Integrated cores <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.EddyCurrent\">losses</a>
          and <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\">heat port</a></li>
  </ul></li>
  <li>Added rotor core loss parameters in asynchronous induction machine with slip rings</li>
  <li>Renamed heat ports of <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">single phase winding</a> and <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">symmetric multi phase winding</a>
     </li>
  <li>Relocated core losses between zero inductor and stray reluctance model in the magnetic domain</li>
  <li>Renamed instances of stator and rotor (winding) models in each machines</li>
  <li>Added magnetic potential sensor</li>
  <li>Removed state selections</li>
  <li>Updates due to changed loss variable and heat port names in
      <a href=\"modelica://Modelica.Electrical.Machines\">Electrical.Machines</a></li>
  <li>Added machine specific output records to summarize power and loss balance</li>
  <li>Updated images of Users Guide</li>
  <li>Improved performance due to <code>annotation(Evaluate=true)</code> added to the parameters of the
      <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">single phase winding</a>
  <li>Reduced number of states in <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">symmetric cage</a> model by introducing an additional non-grounded star connection</li>
</ul>

<h5>Version 1.6.0, 2010-05-05</h5>

<ul>
<li>Renamed all parameters <code>windingAngle</code> to <code>orientation</code>. The following classes are affected:
<ul>
<li><a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.SinglePhaseElectroMagneticConverter\">SinglePhaseElectroMagneticConverter</a></li>
<li><a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">MultiPhaseElectroMagneticConverter</a></li>
<li><a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">SinglePhaseWinding</a></li>
<li><a href=\"modelica://Modelica.Electrical.MultiPhase.Functions.symmetricOrientation\">symmetricOrientation</a></li>
</ul></li>
<li>Update due to changed class names in <a href=\"modelica://Modelica.Electrical.Machines.Icons\">Machines.Icons</a></li>
<li>Using <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPort\">HeatTransfer.Interfaces.PartialElementaryConditionalHeatPort</a> instead of
    <a href=\"modelica://Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort\">Analog.Interfaces.ConditionalHeatPort</a> in
    <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.EddyCurrent\">EddyCurrent</a> </li>
<li>Added <code>modelica://</code> to all Modelica hyper links</li>
<li>Fixed bug in displayed parameters of <a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.EddyCurrent\">EddyCurrent</a> </li>
<li>Updated some images (and renamed image file <code>LossPower.png</code> to <code>lossPower.png</code>)</li>
<li>Exchanged positive and negative stator ports of <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">RotorSaliencyAirGap</a>
model, adapted equations accordingly and updated code documentation.</li>
</ul>

<h5>Version 1.5.0, 2010-04-28</h5>

<ul>
<li>Added stator core, friction, stray load and brush losses to all machine types based on
<a href=\"modelica://Modelica.Electrical.Machines.Losses\">loss models</a> of the <a href=\"modelica://Modelica.Electrical.Machines\">Machines</a> library.</li>
<li>Changed parameter of
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.EddyCurrent\">EddyCurrent</a>
model from R to G</li>
<li>Fixed wrong sign of internal quantity <code>tauElectrical</code>, model behavior does not change</li>
<li>Rewrote equations of electromagnetic coupling to look more elegant</li>
</ul>

<h5>Version 1.4.0, 2010-04-22</h5>

<ul>
<li>Added eddy current model in accordance to <a href=\"modelica://Modelica.Magnetic.FluxTubes\">FluxTubes</a> library</li>
<li>Added thermal heat port to eddy current model</li>
<li>Minor updates due to dependencies of <a href=\"modelica://Modelica.Electrical.Machines\">Machines</a>
</ul>

<h5>Version 1.3.0, 2010-02-26</h5>

<ul>
<li>Changed some icon references</li>
<li>Added state selections for the machine models</li>
<li>Restructured partial machine model</li>
<li>Added copyright information</li>
</ul>

<h5>Version 1.2.0, 2010-02-17</h5>

<ul>
<li>Renamed Machines to BasicMachines</li>
<li>Updated dependencies due to renamed class
<a href=\"modelica://Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20\">LinearTemperatureCoefficient20</a>
<li>Added release notes in User's Guide</li>
</ul>

<h5>Version 1.1.0, 2010-02-15</h5>

<ul>
<li>Added thermal connectors and temperature dependent resistances</li>
</ul>

<h5>Version 1.0.0, 2010-02-04</h5>

<ul>
<li>Integrated the library into the MSL</li>
</ul>

<h5>Version 0.4.0, 2009-10-29</h5>

<ul>
<li>Corrected bug in magnetic potential calculation</li>
</ul>

<h5>Version 0.3.0, 2009-10-28</h5>

<ul>
<li>Renamed number of turns and winding angles</li>
</ul>

<h5>Version 0.2.0, 2009-10-20</h5>

<ul>
<li>Added idle model</li>
</ul>

<h5>Version 0.1.0, 2009-07-22</h5>

<ul>
<li>First version based on the concept of the FluxTubes library and the Magnetics library of Michael Beuschel
[<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.References\">Beuschel00</a>]</li>
</ul>
</html>"));
    end ReleaseNotes;

    class References "References"
      extends Modelica_Icons.References;
      annotation (Documentation(info="<html>
<h4>References</h4>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <td valign=\"top\">[Beuschel00]</td>
      <td valign=\"top\">M. Beuschel,
        &quot;<a href=\"https://www.modelica.org/events/workshop2000/proceedings/Beuschel.pdf\">
        A uniform approach for modelling electrical machines</a>,&quot;
        <i>Modelica Workshop</i>,
        pp. 101-108, October 23-24, 2000.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Eckhardt82]</td>
      <td valign=\"top\">H. Eckhardt,
        <i>Grundz&uuml;ge der elektrischen Maschinen</i> (in German),
        B. G. Teubner Verlag, Stuttgart, 1982.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Haumer09]</td>
      <td valign=\"top\">A. Haumer, and C. Kral,
        &quot;<a href=\"https://www.modelica.org/events/modelica2009/Proceedings/memorystick/pages/papers/0103/0103.pdf\">The
        AdvancedMachines Library: Loss Models for Electric Machines</a>,&quot;
        <i>Modelica Conference</i>, 2009.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Lang84]</td>
      <td valign=\"top\">W. Lang,
        <i>&Uuml;ber die Bemessung verlustarmer Asynchronmotoren mit K&auml;figl&auml;ufer f&uuml;r Pulsumrichterspeisung</i>
       (in German),
       Doctoral Thesis, Technical University of Vienna, 1984.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Laughton02]</td>
      <td valign=\"top\">M.A. Laughton, D.F. Warne
        <i>Electrical Engineer's Reference Book</i>
        Butterworth Heinemann, 16th edition, ISBN 978-0750646376, 2002</td>
    </tr>

    <tr>
      <td valign=\"top\">[Li07]</td>
      <td valign=\"top\">Y. Li, Z. Q. Zhu, D. Howe, and C. M. Bingham,
        &quot;Modeling of Cross-Coupling Magnetic Saturation in Signal-Injection-Based
        Sensorless Control of Permanent-Magnet Brushless AC Motors,&quot;
        <i>IEEE Transactions on Magnetics</i>,
        vol. 43, no. 6, pp. 2552-2554, June 2007.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Mueller70]</td>
      <td valign=\"top\">G, M&uuml;ller,
        <i>Elektrische Maschinen -- Grundlagen, Aufbau und Wirkungsweise</i> (in German),
        VEB Verlag Technik Berlin, 4th edition, 1970.</td>
    </tr>

    <tr>
      <td valign=\"top\">[Spaeth73]</td>
      <td valign=\"top\">H. Sp&auml;th,
        <i>Elektrische Maschinen -- Eine Einf&uuml;hrung in die Theorie des Betriebsverhaltens</i> (in German),
        Springer-Verlag, Berlin, Heidelberg, New York, 1973.</td>
    </tr>

</table>
</html>"));
    end References;
    annotation (Documentation(info="<html>
<p>
This library contains components for modelling of electromagnetic fundamental wave
models for the application in multi phase phase
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines\">electric machines</a>.
The number of phases is not restricted to three. DC machines are (currently) not included
in this library. The FundamentalWave library is an alternative approach to the
<a href=\"modelica://Modelica.Electrical.Machines\">Modelica.Electrical.Machines</a> library.
A great advantage of this library is the strict object orientation of the electrical and
magnetic components that the electric machines models are composed of.
From a didactic point of view this library is very beneficial for students in the
field of electrical engineering.
</p>

<p>
For more details see the <a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.Concept\">concept.</a>
</p>

<h5>Note</h5>

<ul>
<li>All the machine models provided in this library are equivalent two pole machines.
The magnetic potential difference of the connector therefore also refers to an equivalent two pole machine</li>
<li>In machines with <strong>more than three phases</strong> only effects of currents and voltages on the magnetic <strong>fundamental waves</strong> are considered. Other magnetic effects due to higher harmonic are not taken into account.</li>
</ul>


</html>"));
  end UsersGuide;

  package Components "Basic fundamental wave components"
    extends Modelica_Icons.Package;
    model Ground "Magnetic ground"
      Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort port_p
        "Complex magnetic port" annotation (Placement(transformation(extent={{-10,
                90},{10,110}}, rotation=0)));
    equation
      port_p.V_m = Complex(0, 0);
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Line(points={{0,100},{0,50}}, color={255,
              128,0}),Line(points={{-60,50},{60,50}}, color={255,128,0}),Line(
              points={{-40,30},{40,30}}, color={255,128,0}),Line(points={{-20,
              10},{20,10}}, color={255,128,0})}),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
            Line(points={{0,100},{0,50}}, color={255,128,0}),
            Line(points={{-60,50},{60,50}}, color={255,128,0}),
            Line(points={{-40,30},{40,30}}, color={255,128,0}),
            Line(points={{-20,10},{20,10}}, color={255,128,0}),
            Text(
              extent={{-144,-9},{156,-49}},
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
      extends
        Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPortElementary;
      parameter Modelica_Magnetic_FundamentalWave.Types.SalientReluctance R_m(d(start=1),
          q(start=1)) "Magnetic reluctance in d=re and q=im axis";
    equation
      (pi/2)*V_m.re = R_m.d*Phi.re;
      (pi/2)*V_m.im = R_m.q*Phi.im;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-96,0},{-70,0}}, color={255,128,0}),
            Line(points={{70,0},{96,0}}, color={255,128,0}),
            Text(
              extent={{0,60},{0,100}},
              lineColor={0,0,255},
              textString="%name")}),                      Documentation(info="<html>
<p>
The salient reluctance models the relationship between the complex magnetic potential difference
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/V_m.png\" alt=\"V_m.png\"> and the complex magnetic flux <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Phi.png\">,
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/reluctance.png\"
      alt=\"reluctance.png\">
</blockquote>

<p>which can also be expressed in terms complex phasors:</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/reluctance_alt.png\"
     alt=\"reluctance_alt.png\">
</blockquote>

</html>"));
    end Reluctance;

    model Permeance "Salient Permeance"
      import Modelica_Constants.pi;
      extends
        Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPortElementary;
      parameter Modelica_Magnetic_FundamentalWave.Types.SalientPermeance G_m(d(start=1),
          q(start=1)) "Magnetic permeance in d=re and q=im axis";
    equation
      (pi/2)*G_m.d*V_m.re = Phi.re;
      (pi/2)*G_m.q*V_m.im = Phi.im;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-96,0},{-70,0}}, color={255,128,0}),
            Line(points={{70,0},{96,0}}, color={255,128,0}),
            Text(
              extent={{0,60},{0,100}},
              lineColor={0,0,255},
              textString="%name")}),                      Documentation(info="<html>
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
      extends
        Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPortElementary;
      parameter Modelica_SIunits.Conductance G(min=0)
        "Equivalent symmetric loss conductance";
      extends
        Modelica_Thermal_HeatTransfer_Interfaces.PartialElementaryConditionalHeatPort(
          final T=273.15);
    equation
      lossPower = (pi/2)*(V_m.re*der(Phi.re) + V_m.im*der(Phi.im));
      if G > 0 then
        (pi/2)*V_m.re = G*der(Phi.re);
        (pi/2)*V_m.im = G*der(Phi.im);
      else
        V_m.re = 0;
        V_m.im = 0;
      end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-96,0},{-70,0}}, color={255,128,0}),
            Line(points={{70,0},{96,0}}, color={255,128,0}),
            Text(
              extent={{0,60},{0,100}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{0,-40},{0,-80}},
              lineColor={0,0,0},
              textString="G=%G")}), Documentation(info="<html>
<p>
The eddy current loss model with respect to fundamental wave effects is designed in accordance to
<a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.EddyCurrent\">FluxTubes.Basic.EddyCurrent</a>.
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/eddycurrent.png\"
     alt=\"eddycurrent.png\">
</blockquote>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\">Fig. 1: equivalent models of eddy current losses</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/eddycurrent_electric.png\"
           alt=\"eddycurrent_electric.png\">
    </td>
  </tr>
</table>

<p>Due to the nature of eddy current losses, which can be represented by symmetric
conductors in an equivalent electric circuit (Fig. 1), the respective
number of phases <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\" alt=\"m\"> has to be taken into account.
Assume that the <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\" alt=\"m\"> conductances
of the equivalent circuit are <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/Gc.png\" alt=\"G_c\">,
the conductance for the eddy current loss model is determined by</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/GGc.png\"
     alt=\"GGc\">
</blockquote>

<p>
where <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/N.png\" alt=\"N\"> is the number of turns of the symmetric electro magnetic coupling.
</p>

<p>For such an <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\" alt=\"m\"> phase system
the relationship between the voltage and current <a href=\"http://www.haumer.at/refimg/SpacePhasors.pdf\">space phasors</a>
and the magnetic flux and magnetic potential difference phasor is
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/vPhi.png\" alt=\"vPhi\">,<br>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/iV_m.png\" alt=\"iV_m\">,
</blockquote>

<p>
where <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/v_k.png\" alt=\"v_k\">
and <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/i_k.png\" alt=\"i_k\">
are the phase voltages and currents, respectively.
</p>

<p>
The dissipated loss power
</p>
<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/lossPower.png\" alt=\"lossPower\">
</blockquote>
<p>
can be determined for the <a href=\"http://www.haumer.at/refimg/SpacePhasors.pdf\">space phasor</a>
relationship of the voltage and current space phasor.
</p>
<h4>See also</h4>

<p><a href=\"modelica://Modelica.Magnetic.FluxTubes.Basic.EddyCurrent\">FluxTubes.Basic.EddyCurrent</a></p>

</html>"));
    end EddyCurrent;

    model SinglePhaseElectroMagneticConverter
      "Single phase electro magnetic converter"
      import Modelica_Constants.pi;
      Modelica_Electrical_Analog_Interfaces.PositivePin pin_p "Positive pin"
        annotation (Placement(transformation(
            origin={-100,100},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica_Electrical_Analog_Interfaces.NegativePin pin_n "Negative pin"
        annotation (Placement(transformation(
            origin={-100,-100},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort port_p
        "Positive complex magnetic port" annotation (Placement(transformation(
              extent={{90,90},{110,110}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave_Interfaces.NegativeMagneticPort port_n
        "Negative complex magnetic port" annotation (Placement(transformation(
              extent={{90,-110},{110,-90}}, rotation=0)));
      parameter Real effectiveTurns "Effective number of turns"
        annotation (Evaluate=true);
      parameter Modelica_SIunits.Angle orientation
        "Orientation of the resulting fundamental wave V_m phasor"
        annotation (Evaluate=true);
      // Local electric single phase quantities
      Modelica_SIunits.Voltage v "Voltage";
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

      final parameter Complex N=effectiveTurns*Modelica_ComplexMath.exp(Complex(
          0, orientation)) "Complex number of turns";
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
      // of turns and angles of orientation of winding
      // V_m.re = (2/pi) * effectiveTurns*cos(orientation)*i;
      // V_m.im = (2/pi) * effectiveTurns*sin(orientation)*i;
      V_m = (2.0/pi)*N*i;
      // Induced voltages is determined from complex magnetic flux, number of turns
      // and angles of orientation of winding
      // -v = effectiveTurns*cos(orientation)*der(Phi.re)
      //    + effectiveTurns*sin(orientation)*der(Phi.im);
      -v = Modelica_ComplexMath.real(Modelica_ComplexMath.conj(N)*
           Complex(der(Phi.re), der(Phi.im)));
      annotation (
        defaultComponentName="converter",
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
              extent={{-60,60},{58,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-58,0},{60,-60}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-60,60},{0,-60}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{100,-100},{94,-100},{84,-98},{76,-94},{64,-86},{50,-72},
                  {42,-58},{36,-40},{30,-18},{30,0},{30,18},{34,36},{46,66},{62,
                  84},{78,96},{90,100},{100,100}}, color={255,128,0}),
            Line(points={{0,60},{-100,60},{-100,100}}, color={0,0,255}),
            Line(points={{0,-60},{-100,-60},{-100,-98}}, color={0,0,255}),
            Text(
              extent={{0,160},{0,120}},
              lineColor={0,0,255},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(info="<html>
<p>
The single phase winding has an effective number of turns, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/effectiveTurns.png\"> and a respective orientation of the winding, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/orientation.png\">. The current in winding is <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/i.png\">.
</p>

<p>
The total complex magnetic potential difference of the single phase winding is determined by:
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/singlephaseconverter_vm.png\">
</p>

<p>
In this equation the magneto motive force is aligned with the orientation of the winding.
</p>

<p>
The voltage <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/v.png\"> induced in the winding depends on the cosine between the orientation of the winding and the angle of the complex magnetic flux. Additionally, the magnitudes of the induced voltages are proportional to the respective number of turns. This relationship can be modeled by means of</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/singlephaseconverter_phi.png\">
</p>

<p>The single phase electromagnetic converter is a special case of the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">MultiPhaseElectroMagneticConverter</a>
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">MultiPhaseElectroMagneticConverter</a>
</p>

</html>"));
    end SinglePhaseElectroMagneticConverter;

    model MultiPhaseElectroMagneticConverter
      "Multi phase electro magnetic converter"

      import Modelica_Constants.pi;

      // Global plug and port variables
      Modelica_SIunits.Voltage v[m] = plug_p.pin.v - plug_n.pin.v "Voltage";
      Modelica_SIunits.Current i[m] = plug_p.pin.i "Current";
      Modelica_SIunits.ComplexMagneticPotentialDifference V_m = port_p.V_m - port_n.V_m
        "Magnetic potential difference";
      Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
        "Magnitude of complex magnetic potential difference";
      Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
        "Argument of complex magnetic potential difference";

      Modelica_SIunits.ComplexMagneticFlux Phi = port_p.Phi "Magnetic flux";
      Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
        "Magnitude of complex magnetic flux";
      Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
        "Argument of complex magnetic flux";

      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
        "Positive plug" annotation (Placement(transformation(
            origin={-100,100},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n(final m=m)
        "Negative plug" annotation (Placement(transformation(
            origin={-100,-100},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort port_p
        "Positive complex magnetic port" annotation (Placement(transformation(
              extent={{90,90},{110,110}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave_Interfaces.NegativeMagneticPort port_n
        "Negative complex magnetic port" annotation (Placement(transformation(
              extent={{90,-110},{110,-90}}, rotation=0)));
      parameter Integer m=3 "Number of phases";
      parameter Real effectiveTurns[m] "Effective number of turns";
      parameter Modelica_SIunits.Angle orientation[m]
        "Orientation of the resulting fundamental wave field phasor";
      Modelica_Magnetic_FundamentalWave.Components.SinglePhaseElectroMagneticConverter
        singlePhaseElectroMagneticConverter[m](final effectiveTurns=
            effectiveTurns, final orientation=orientation)
        annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
    equation
      connect(plug_p.pin, singlePhaseElectroMagneticConverter.pin_p)
        annotation (Line(
          points={{-100,100},{-8,100},{-8,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(singlePhaseElectroMagneticConverter.pin_n, plug_n.pin)
        annotation (Line(
          points={{-8,-10},{-8,-100},{-100,-100}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(singlePhaseElectroMagneticConverter[1].port_p, port_p)
        annotation (Line(
          points={{12,10},{12,100},{100,100}},
          color={255,128,0},
          smooth=Smooth.None));
      for k in 2:m loop
        connect(singlePhaseElectroMagneticConverter[k - 1].port_n,
          singlePhaseElectroMagneticConverter[k].port_p);
      end for;
      connect(singlePhaseElectroMagneticConverter[m].port_n, port_n)
        annotation (Line(
          points={{12,-10},{12,-100},{100,-100}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
            Ellipse(
              extent={{-60,60},{58,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-58,0},{60,-60}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-60,60},{0,-60}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{100,-100},{94,-100},{84,-98},{76,-94},{64,-86},{50,-72},
                  {42,-58},{36,-40},{30,-18},{30,0},{30,18},{34,36},{46,66},{62,
                  84},{78,96},{90,100},{100,100}}, color={255,128,0}),
            Line(points={{0,60},{-100,60},{-100,100}}, color={0,0,255}),
            Line(points={{0,-60},{-100,-60},{-100,-98}}, color={0,0,255}),
            Text(
              extent={{0,160},{0,120}},
              lineColor={0,0,255},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(info="<html>
<p>
Each phase <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/k.png\"> of an <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\"> phase winding has an effective number of turns, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/effectiveTurns_k.png\"> and an respective winging angle <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/orientation_k.png\"> and a phase current <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/i_k.png\">.
</p>

<p>
The total complex magnetic potential difference of the multi phase winding is determined by:
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/multiphaseconverter_vm.png\">
</p>

<p>
In this equation each contribution of a winding magneto motive force on the total complex magnetic potential difference is aligned with the respective orientation of the winding.
</p>

<p>
The voltages <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/v_k.png\"> induced in each winding depend on the cosines between the orientation of the winding and the angle of the complex magnetic flux. Additionally, the magnitudes of the induced voltages are proportional to the respective number of turns. This relationship can be modeled by means of</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/multiphaseconverter_phi.png\">
</p>

<p>for <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/k_in_1_m.png\"> and is also illustrated by the following figure:</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><b>Fig:</b> Orientation of winding and location of complex magnetic flux</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Components/coupling.png\">
    </td>
  </tr>
</table>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.SinglePhaseElectroMagneticConverter\">SinglePhaseElectroMagneticConverter</a>
</p>
</html>"),
        defaultComponentName="converter");
    end MultiPhaseElectroMagneticConverter;

    model Idle "Idle running branch"
      extends
        Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPortElementary;
    equation
      Phi = Complex(0, 0);
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

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Short\">Short</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Crossing\">Crossing</a>
</p>

</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Line(points={{-100,0},{-60,0}}, color={
              255,128,0}),Line(points={{60,0},{100,0}}, color={255,128,0}),Line(
              points={{-60,0},{-40,2},{-18,6},{0,14},{12,26}}, color={255,128,0}),
              Line(points={{60,0},{40,-2},{18,-6},{0,-14},{-12,-26}}, color={
              255,128,0})}));
    end Idle;

    model Short "Short cut branch"
      extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
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

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Idle\">Idle</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.Crossing\">Crossing</a>
</p>

</html>"));
    end Short;

    model Crossing "Crossing of two branches"

      Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort port_p1
        "Positive port_p1 connected with port_p2"
        annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
      Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort port_p2
        "Positive port_p2 connected with port_p1"
        annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
      Modelica_Magnetic_FundamentalWave_Interfaces.NegativeMagneticPort port_n1
        "Negative port_n1 connected with port_n2"
        annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
      Modelica_Magnetic_FundamentalWave_Interfaces.NegativeMagneticPort port_n2
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

</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics));
    end Crossing;
    annotation (Documentation(info="<html>
<p>Basic components of the FundamentalWave library for modeling magnetic circuits. Machine specific components are
located at <a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components\">Machines.Components</a>.</p>
</html>"));
  end Components;

  package BasicMachines
    "Machine components and modelsElectric machine models based on FundamentalWave package"
    extends Modelica_Icons.Package;
    package AsynchronousInductionMachines "Asynchronous induction machines"
      extends Modelica_Icons.VariantsPackage;
      model AIM_SquirrelCage
        "Asynchronous induction machine with squirrel cage"
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialBasicInductionMachine(
          is(start=zeros(m)),
          Rs(start=0.03),
          Lssigma(start=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)),
          final L0(d=2.0*Lm/m/effectiveStatorTurns^2, q=2.0*Lm/m/
                effectiveStatorTurns^2),
          redeclare final
            Modelica_Electrical_Machines.Thermal.AsynchronousInductionMachines.ThermalAmbientAIMC
            thermalAmbient(final Tr=TrOperational),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMC
            thermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMC
            internalThermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.PowerBalanceAIMC
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
        output Modelica_SIunits.Current ir[m] = rotorCage.i
          "Rotor cage currents";
        Modelica_Magnetic_FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding
          rotorCage(
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
          defaultComponentName="aimc",
          Documentation(info="<html>
<p>
Resistances and stray inductances of the machine refer to an <code>m</code> phase stator. The symmetry of the stator and rotor is assumed. The machine models take the following loss effects into account:
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
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing\">AIM_SlipRing</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end AIM_SquirrelCage;

      model AIM_SlipRing "Asynchronous induction machine with slip ring rotor"
        parameter Integer mr(min=3) = m "Number of rotor phases";
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialBasicInductionMachine(
          is(start=zeros(m)),
          Rs(start=0.03),
          Lssigma(start=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)),
          final L0(d=2.0*Lm/m/effectiveStatorTurns^2, q=2.0*Lm/m/
                effectiveStatorTurns^2),
          redeclare final
            Modelica_Electrical_Machines.Thermal.AsynchronousInductionMachines.ThermalAmbientAIMS
            thermalAmbient(final Tr=TrOperational, final mr=mr),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMS
            thermalPort(final mr=mr),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMS
            internalThermalPort(final mr=mr),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.PowerBalanceAIMS
            powerBalance(
            final lossPowerRotorWinding=sum(rotor.resistor.resistor.LossPower),
            final lossPowerRotorCore=rotor.core.lossPower,
            final lossPowerBrush=0,
            final powerRotor=
                Modelica_Electrical_MultiPhase.Functions.activePower(vr, ir)));

        Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_rn(final m=
              mr) "Negative plug of rotor" annotation (Placement(transformation(
                extent={{-110,-50},{-90,-70}}, rotation=0)));
        Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_rp(final m=
              mr) "Positive plug of rotor" annotation (Placement(transformation(
                extent={{-110,70},{-90,50}}, rotation=0)));
        parameter Modelica_SIunits.Inductance Lm(start=3*sqrt(1 - 0.0667)/(2*pi
              *fsNominal)) "Stator main field inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrsigma(start=3*(1 - sqrt(1 -
              0.0667))/(2*pi*fsNominal))
          "Rotor leakage inductance w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrzero=Lrsigma
          "Rotor zero inductance w.r.t. rotor side"
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
        output Modelica_SIunits.Voltage vr[mr]=plug_rp.pin.v - plug_rn.pin.v
          "Rotor instantaneous voltages";
        output Modelica_SIunits.Current ir[mr]=plug_rp.pin.i
          "Rotor instantaneous currents";
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
          final Lzero=Lrsigma,
          final GcRef=rotorCoreParameters.GcRef,
          final m=mr,
          final alpha20=alpha20r)
          "Symmetric rotor winding including resistances, zero and stray inductances and zero core losses"
          annotation (Placement(transformation(
              origin={0,-40},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        /* previously used: state selection, now commented
  FundamentalWave.Interfaces.StateSelector stateSelectorR(
    final m=m,
    final xi=ir,
    final gamma=0) "State selection of rotor currents"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,0})));
  */
      equation
        connect(rotor.plug_n, plug_rn) annotation (Line(points={{10,-50},{10,
                -60},{-100,-60}},            color={0,0,255}));
        connect(rotor.heatPortCore, internalThermalPort.heatPortRotorCore)
          annotation (Line(
            points={{10,-36},{16,-36},{16,-36},{20,-36},{20,-80},{-40,-80},{-40,
                -90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(rotor.heatPortWinding, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{10,-44},{20,-44},{20,-80},{-40,-80},{-40,-90}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(plug_rp, rotor.plug_p) annotation (Line(
            points={{-100,60},{-80,60},{-80,-50},{-10,-50}},
            color={0,0,255},
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
          defaultComponentName="aims",
          Icon(graphics={Line(points={{-100,50},{-100,20},{-60,20}}, color={0,0,
                    255}), Line(points={{-100,-50},{-100,-20},{-60,-20}}, color=
                   {0,0,255})}),
          Documentation(info="<html>
<p>
Resistances and stray inductances of the machine always refer to either stator or rotor. The symmetry of the stator and rotor is assumed. The number of stator and rotor phases may be different. The machine models take the following loss effects into account:
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
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage\">AIM_SquirrelCage</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end AIM_SlipRing;
      annotation (Documentation(info="<html>
<p>This package provides squirrel cage and slip ring induction machine models.</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines\">SynchronousInductionMachines</a>
</p>
</html>"));
    end AsynchronousInductionMachines;

    package SynchronousInductionMachines "Synchronous machines"
      extends Modelica_Icons.VariantsPackage;
      model SM_PermanentMagnet
        "Permanent magnet synchronous machine with optional damper cage"
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialBasicInductionMachine(
          is(start=zeros(m)),
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
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMPM
            thermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMPM
            internalThermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.PowerBalanceSMPM
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
           annotation(Dialog(group="Operational temperatures"));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of (optional) damper cage" annotation (
            Dialog(group="Operational temperatures",
                   enable=not useThermalPort and useDamperCage));
        parameter
          Modelica_Electrical_Machines.Losses.PermanentMagnetLossParameters
          permanentMagnetLossParameters(IRef(start=100), wRef(start=2*pi*
                fsNominal/p)) "Permanent magnet loss losses"
          annotation (Dialog(tab="Losses"));
        Modelica_Blocks_Interfaces.RealOutput ir[2](
          start=zeros(2),
          each final quantity="ElectricCurrent", each final unit="A") if useDamperCage
          "Damper cage currents" annotation(Dialog(showStartAttribute=true));
        Modelica_Magnetic_FundamentalWave.Components.Ground groundR
          "Ground of rotor magnetic circuit" annotation (Placement(
              transformation(extent={{-40,-30},{-20,-10}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave.Components.Short short if not
          useDamperCage
          "Magnetic connection in case the damper cage is not present"
          annotation (Placement(transformation(
              origin={10,-40},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Modelica_Magnetic_FundamentalWave.BasicMachines.Components.SaliencyCageWinding
          rotorCage(
          final RRef(d=Rrd, q=Rrq),
          final Lsigma(d=Lrsigmad, q=Lrsigmaq),
          final effectiveTurns=sqrt(3.0/2.0)*effectiveStatorTurns,
          final useHeatPort=true,
          final TRef=TrRef,
          final alpha20=alpha20r,
          final TOperational=TrOperational) if useDamperCage
          "Symmetric rotor cage winding including resistances and stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-40})));
        Components.PermanentMagnet
          permanentMagnet(final V_m=Complex(V_mPM, 0),
          final m=m,
          final permanentMagnetLossParameters=permanentMagnetLossParameters,
          final useHeatPort=true,
          final is=is) "Magnetic potential difference of permanent magnet"
                                                              annotation (
            Placement(transformation(
              origin={-10,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      protected
        final parameter Modelica_SIunits.MagneticPotentialDifference V_mPM=
           (2/pi)*sqrt(2)*(m/2)*VsOpenCircuit/effectiveStatorTurns/
           (Lmd/effectiveStatorTurns^2*2*pi*fsNominal)
          "Equivalent excitation magnetic potential difference";
        Modelica_Blocks_Interfaces.RealOutput damperCageLossPower(
          final quantity="Power", final unit="W") "Damper losses";
      equation
        connect(ir, rotorCage.i);
        connect(damperCageLossPower, rotorCage.lossPower);
        if not useDamperCage then
          damperCageLossPower=0;
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
            points={{10,-10},{10,-10},{10,-30},{10,-30},{10,-30},{20,-30},{20,
                -30}},
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
              Ellipse(extent={{-134,34},{-66,-34}}, lineColor={0,0,255})}),
          Documentation(info="<html>
<p>
Resistances and stray inductances of the machine refer to an <code>m</code> phase stator. The symmetry of the stator is assumed. For rotor asymmetries can be taken into account by different resistances and stray inductances in the d- and q-axis. The machine models take the following loss effects into account:
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
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">SM_ElectricalExcited</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor\">SM_ReluctanceRotor</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        "Electrical excited synchronous machine with optional damper cage"
        import Modelica_Magnetic_FundamentalWave;
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialBasicInductionMachine(
          is(start=zeros(m)),
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
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMEE
            thermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMEE
            internalThermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.PowerBalanceSMEE
            powerBalance(
            final lossPowerRotorWinding=damperCageLossPower,
            final powerExcitation=ve*ie,
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
        parameter Real sigmae(
          min=0,
          max=1,
          start=0.025) "Stray fraction of total excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_Electrical_Machines.Losses.BrushParameters
          brushParameters "Brush losses" annotation (Dialog(tab="Losses"));
        output Modelica_SIunits.Voltage ve=pin_ep.v - pin_en.v
          "Excitation voltage";
        output Modelica_SIunits.Current ie=pin_ep.i "Excitation current";
        Modelica_Blocks_Interfaces.RealOutput ir[2](
          start=zeros(2),
          each final quantity="ElectricCurrent", each final unit="A") if useDamperCage
          "Damper cage currents" annotation(Dialog(showStartAttribute=true));
        Modelica_Magnetic_FundamentalWave.Components.Short short if not
          useDamperCage
          "Magnetic connection in case the damper cage is not present"
          annotation (Placement(transformation(
              origin={10,-40},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Components.SaliencyCageWinding rotorCage(
          final Lsigma(d=Lrsigmad, q=Lrsigmaq),
          final effectiveTurns=sqrt(3.0/2.0)*effectiveStatorTurns,
          final useHeatPort=true,
          final TRef=TrRef,
          final TOperational=TrOperational,
          final RRef(d=Rrd, q=Rrq),
          final alpha20=alpha20r) if useDamperCage
          "Symmetric rotor cage winding including resistances and stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-40})));
        Components.SinglePhaseWinding excitation(
          final orientation=0,
          final RRef=Re,
          final TRef=TeRef,
          final Lsigma=Lesigma,
          final effectiveTurns=effectiveStatorTurns*turnsRatio*m/2,
          final useHeatPort=true,
          final TOperational=TeOperational,
          final alpha20=alpha20e)
          "Excitation winding including resistance and stray inductance"
          annotation (Placement(transformation(extent={{-30,-50},{-10,-30}},
                rotation=0)));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_ep
          "Positive pin of excitation" annotation (Placement(transformation(
                extent={{-110,70},{-90,50}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_en
          "Negative pin of excitation" annotation (Placement(transformation(
                extent={{-90,-50},{-110,-70}}, rotation=0)));
        Modelica_Electrical_Machines.Losses.DCMachines.Brush brush(final
            brushParameters=brushParameters, final useHeatPort=true)
          annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-80,40})));
      protected
        final parameter Real turnsRatio=sqrt(2)*VsNominal/(2*pi*fsNominal*Lmd*IeOpenCircuit)
          "Stator current / excitation current";
        final parameter Modelica_SIunits.Inductance Lesigma=Lmd*turnsRatio^2*3/2*sigmae/(1 - sigmae)
          "Leakage inductance of the excitation winding";
        Modelica_Blocks_Interfaces.RealOutput damperCageLossPower(
          final quantity="Power", final unit="W") "Damper losses";
      equation
        connect(ir, rotorCage.i);
        connect(damperCageLossPower, rotorCage.lossPower);
        if not useDamperCage then
          damperCageLossPower=0;
        end if;
        connect(pin_en, excitation.pin_n) annotation (Line(points={{-100,-60},{
                -100,-60},{-100,-50},{-30,-50}}, color={0,0,255}));
        connect(airGap.port_rn, excitation.port_p) annotation (Line(
            points={{-10,-10},{-10,-20},{-10,-20},{-10,-30}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(pin_ep, brush.p) annotation (Line(
            points={{-100,60},{-80,60},{-80,50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(brush.n, excitation.pin_p) annotation (Line(
            points={{-80,30},{-80,-30},{-30,-30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(brush.heatPort, internalThermalPort.heatPortBrush) annotation (
            Line(
            points={{-70,50},{-40,50},{-40,-90}},
            color={191,0,0},
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
        annotation (
          defaultComponentName="smee",
          Icon(graphics={
              Ellipse(extent={{-134,34},{-66,-34}}, lineColor={0,0,255}),
              Line(points={{-100,50},{-100,20},{-130,20},{-130,-4}}, color={0,0,
                    255}),
              Line(points={{-130,-4},{-129,1},{-125,5},{-120,6},{-115,5},{-111,
                    1},{-110,-4}}, color={0,0,255}),
              Line(points={{-110,-4},{-109,1},{-105,5},{-100,6},{-95,5},{-91,1},
                    {-90,-4}}, color={0,0,255}),
              Line(points={{-90,-4},{-89,1},{-85,5},{-80,6},{-75,5},{-71,1},{-70,
                    -4}}, color={0,0,255}),
              Line(points={{-100,-50},{-100,-20},{-70,-20},{-70,-2}}, color={0,
                    0,255})}),
          Documentation(info="<html>
<p>
The symmetry of the stator is assumed. For rotor asymmetries can be taken into account by different resistances and stray inductances in the d- and q-axis. The machine models take the following loss effects into account:
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
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">SM_PermanentMagnet</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor\">SM_ReluctanceRotor</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor "Reluctance machine with optional damper cage"
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialBasicInductionMachine(
          is(start=zeros(m)),
          Rs(start=0.03),
          Lssigma(start=0.1/(2*pi*fsNominal)),
          final L0(d=2.0*Lmd/m/effectiveStatorTurns^2, q=2.0*Lmq/m/
                effectiveStatorTurns^2),
          redeclare final
            Modelica_Electrical_Machines.Thermal.SynchronousInductionMachines.ThermalAmbientSMR
            thermalAmbient(final useDamperCage=useDamperCage, final Tr=
                TrOperational),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMR
            thermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMR
            internalThermalPort(final useDamperCage=useDamperCage),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.PowerBalanceSMR
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
        Modelica_Blocks_Interfaces.RealOutput ir[2](
          start=zeros(2),
          each final quantity="ElectricCurrent", each final unit="A") if useDamperCage
          "Damper cage currents" annotation(Dialog(showStartAttribute=true));
        Modelica_Magnetic_FundamentalWave.Components.Ground groundR
          "Ground of rotor magnetic circuit" annotation (Placement(
              transformation(extent={{-40,-30},{-20,-10}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave.Components.Short short if not
          useDamperCage
          "Magnetic connection in case the damper cage is not present"
          annotation (Placement(transformation(
              origin={10,-40},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Modelica_Magnetic_FundamentalWave.BasicMachines.Components.SaliencyCageWinding
          rotorCage(
          final RRef(d=Rrd, q=Rrq),
          final Lsigma(d=Lrsigmad, q=Lrsigmaq),
          final effectiveTurns=sqrt(3.0/2.0)*effectiveStatorTurns,
          final useHeatPort=true,
          final TRef=TrRef,
          final alpha20=alpha20r,
          final TOperational=TrOperational) if useDamperCage
          "Symmetric rotor cage winding including resistances and stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-40})));
      protected
        Modelica_Blocks_Interfaces.RealOutput damperCageLossPower(
          final quantity="Power", final unit="W") "Damper losses";
      equation
        connect(ir, rotorCage.i);
        connect(damperCageLossPower, rotorCage.lossPower);
        if not useDamperCage then
          damperCageLossPower=0;
        end if;
        connect(rotorCage.port_n, airGap.port_rp) annotation (Line(
            points={{20,-30},{20,-30},{10,-30},{10,-30},{10,-30},{10,-10},{10,
                -10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(short.port_n, airGap.port_rp) annotation (Line(
            points={{10,-30},{10,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(rotorCage.port_p, airGap.port_rn) annotation (Line(
            points={{20,-50},{-10,-50},{-10,-50},{-10,-50},{-10,-10},{-10,-10}},
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
              Ellipse(extent={{-134,34},{-66,-34}}, lineColor={0,0,255})}),
          Documentation(info="<html>
<p>
The symmetry of the stator is assumed. For rotor asymmetries can be taken into account by different resistances and stray inductances in the d- and q-axis. The machine models take the following loss effects into account:
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
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">SM_ElectricalExcited</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">SM_PermanentMagnet</a>,
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end SM_ReluctanceRotor;
      annotation (Documentation(info="<html>
<p>This package contains various synchronous induction machine models.</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines\">AsynchronousInductionMachines</a>
</p>
</html>"));
    end SynchronousInductionMachines;

    package Components "Components specially for electric machines"
      model SinglePhaseWinding
        "Symmetric winding model coupling electrical and magnetic domain"

        Modelica_Electrical_Analog_Interfaces.PositivePin pin_p "Positive pin"
          annotation (Placement(transformation(
              origin={-100,100},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_n "Negative pin"
          annotation (Placement(transformation(
              origin={-100,-100},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Magnetic_FundamentalWave_Interfaces.NegativeMagneticPort port_n
          "Negative complex magnetic port" annotation (Placement(transformation(
                extent={{90,-110},{110,-90}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort port_p
          "Positive complex magnetic port" annotation (Placement(transformation(
                extent={{90,90},{110,110}}, rotation=0)));
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
        parameter Modelica_SIunits.Inductance Lsigma
          "Winding stray inductance per phase";
        parameter Real effectiveTurns=1 "Effective number of turns per phase";
        parameter Modelica_SIunits.Angle orientation
          "Orientation of the resulting fundamental wave field phasor";

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
        Modelica_Magnetic_FundamentalWave.Components.SinglePhaseElectroMagneticConverter
          electroMagneticConverter(final effectiveTurns=effectiveTurns, final
            orientation=orientation) "Winding" annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=0)));
        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortWinding if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica_Magnetic_FundamentalWave.Components.Reluctance reluctance(final R_m(
              d=effectiveTurns^2/Lsigma, q=effectiveTurns^2/Lsigma))
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={30,0})));
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
            points={{0,-100},{0,-60},{-40,-60},{-40,70},{-20,
                70}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(resistor.n, electroMagneticConverter.pin_p) annotation (Line(
            points={{-10,60},{-10,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(electroMagneticConverter.port_p, reluctance.port_p) annotation (
           Line(
            points={{10,10},{30,10}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(electroMagneticConverter.port_n, reluctance.port_n) annotation (
           Line(
            points={{10,-10},{30,-10}},
            color={255,128,0},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
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
                      textString="%name")}), Documentation(info="<html>
<p>
The single phase winding consists of a
<a href=\"modelica://Modelica.Electrical.Analog.Basic.Resistor\">resistor</a>, a symmetrical
<a href=\"modelica://Modelica.Electrical.Analog.Basic.Inductor\">stray inductor</a> and a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.SinglePhaseElectroMagneticConverter\">single phase electromagnetic coupling</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">SymmetricMultiPhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">SymmetricMultiPhaseCageWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SaliencyCageWinding\">SaliencyCageWinding</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">RotorSaliencyAirGap</a>
</p>
</html>"));
      end SinglePhaseWinding;
      extends Modelica_Icons.Package;
      model SymmetricMultiPhaseWinding
        "Symmetric winding model coupling electrical and magnetic domain"
        // Orientation changed
        Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
          "Positive plug" annotation (Placement(transformation(
              origin={-100,100},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n(final m=m)
          "Negative plug" annotation (Placement(transformation(
              origin={-100,-100},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Magnetic_FundamentalWave_Interfaces.NegativeMagneticPort port_n
          "Negative complex magnetic port" annotation (Placement(transformation(
                extent={{90,-110},{110,-90}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort port_p
          "Positive complex magnetic port" annotation (Placement(transformation(
                extent={{90,90},{110,110}}, rotation=0)));
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
        parameter Modelica_SIunits.Inductance Lzero
          "Zero sequence inductance of winding";
        parameter Real effectiveTurns=1 "Effective number of turns per phase";
        parameter Modelica_SIunits.Conductance GcRef
          "Electrical reference core loss reluctance";

        Modelica_SIunits.Voltage v[m] = plug_p.pin.v - plug_n.pin.v "Voltage";
        Modelica_SIunits.Current i[m] = plug_p.pin.i "Current";

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

        Modelica_Magnetic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
          electroMagneticConverter(
          final m=m,
          final effectiveTurns=fill(effectiveTurns, m),
          final orientation=
              Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m))
          "Symmetric winding" annotation (Placement(transformation(extent={{-10,
                  -40},{10,-20}}, rotation=0)));
        Modelica_Electrical_MultiPhase.Basic.ZeroInductor zeroInductor(final m=
              m, final Lzero=Lzero) "Zero sequence inductance of winding"
          annotation (Placement(transformation(
              origin={-20,30},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_MultiPhase.Basic.Resistor resistor(
          final m=m,
          final useHeatPort=useHeatPort,
          final R=fill(RRef, m),
          final T_ref=fill(TRef, m),
          final alpha=fill(alphaRef, m),
          final T=fill(TOperational, m)) "Winding resistor" annotation (
            Placement(transformation(
              origin={-20,70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortWinding[m] if
          useHeatPort "Heat ports of winding resistors"
          annotation (Placement(transformation(extent={{-50,-110},{-30,-90}})));
        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortCore if
                                                                   useHeatPort
          "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{30,-110},{50,-90}})));
        Modelica_Magnetic_FundamentalWave.Components.EddyCurrent core(final
            useHeatPort=useHeatPort, final G=(m/2)*GcRef*effectiveTurns^2)
          "Core loss model (currently eddy currents only)" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={50,-40})));
        Modelica_Magnetic_FundamentalWave.Components.Reluctance strayReluctance(final R_m(
              d=m*effectiveTurns^2/2/Lsigma, q=m*effectiveTurns^2/2/Lsigma))
          "Stray reluctance equivalent to ideally coupled stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
      equation
        connect(plug_p, resistor.plug_p) annotation (Line(points={{-100,100},{-20,
                100},{-20,80}}, color={0,0,255}));
        connect(resistor.plug_n, zeroInductor.plug_p) annotation (Line(points={{-20,60},
                {-20,55},{-20,50},{-20,40}},                            color={
                0,0,255}));
        connect(zeroInductor.plug_n, electroMagneticConverter.plug_p)
          annotation (Line(points={{-20,20},{-20,-20},{-10,-20}}, color={0,0,
                255}));
        connect(electroMagneticConverter.plug_n, plug_n) annotation (Line(
              points={{-10,-40},{-10,-40},{-100,-40},{-100,-100}}, color={0,0,
                255}));
        connect(electroMagneticConverter.port_p, port_p) annotation (Line(
              points={{10,-20},{10,100},{100,100}}, color={255,128,0}));
        connect(resistor.heatPort, heatPortWinding) annotation (Line(
            points={{-30,70},{-40,70},{-40,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(electroMagneticConverter.port_n, core.port_p) annotation (Line(
            points={{10,-40},{40,-40}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(core.port_n, port_n) annotation (Line(
            points={{60,-40},{100,-40},{100,-100}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(core.heatPort, heatPortCore) annotation (Line(
            points={{40,-50},{40,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(strayReluctance.port_n, core.port_n) annotation (Line(
            points={{80,20},{80,-40},{60,-40}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(strayReluctance.port_p, electroMagneticConverter.port_p)
          annotation (Line(
            points={{80,40},{80,100},{10,100},{10,-20}},
            color={255,128,0},
            smooth=Smooth.None));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={
              Rectangle(
                extent={{-100,60},{100,-60}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{100,-100},{94,-100},{84,-98},{76,-94},{64,-86},{50,
                    -72},{42,-58},{36,-40},{30,-18},{30,0},{30,18},{34,36},{46,
                    66},{62,84},{78,96},{90,100},{100,100}}, color={255,128,0}),
              Line(points={{40,60},{-100,60},{-100,100}}, color={0,0,255}),
              Line(points={{40,-60},{-100,-60},{-100,-98}}, color={0,0,255}),
              Line(points={{40,60},{100,20},{40,-20},{0,-20},{-40,0},{0,20},{40,
                    20},{100,-20},{40,-60}}, color={0,0,255}),
              Text(
                extent={{0,160},{0,120}},
                lineColor={0,0,255},
                fillColor={255,128,0},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>
The symmetrical multi phase winding consists of a symmetrical winding
<a href=\"modelica://Modelica.Electrical.MultiPhase.Basic.Resistor\">resistor</a>, a
<a href=\"modelica://Modelica.Electrical.MultiPhase.Basic.MutualInductor\">zero</a> and
<a href=\"modelica://Modelica.Electrical.MultiPhase.Basic.Inductor\">stray inductor</a> as well as a symmetrical
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.MultiPhaseElectroMagneticConverter\">multi phase electromagnetic coupling</a> and a
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Components.EddyCurrent\">core loss</a> model including
heat <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\">port</a>.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">SinglePhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">SymmetricMultiPhaseCageWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SaliencyCageWinding\">SaliencyCageWinding</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">RotorSaliencyAirGap</a>
</p>
</html>"));
      end SymmetricMultiPhaseWinding;

      model RotorSaliencyAirGap "Air gap model with rotor saliency"
        import Modelica_Constants.pi;
        Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort
          port_sp "Positive complex magnetic stator port" annotation (Placement(
              transformation(extent={{-110,-110},{-90,-90}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave_Interfaces.NegativeMagneticPort
          port_sn "Negative complex magnetic stator port" annotation (Placement(
              transformation(extent={{-110,90},{-90,110}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort
          port_rp "Positive complex magnetic rotor port" annotation (Placement(
              transformation(extent={{90,90},{110,110}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave_Interfaces.NegativeMagneticPort
          port_rn "Negative complex magnetic rotor port" annotation (Placement(
              transformation(extent={{90,-110},{110,-90}}, rotation=0)));
        Modelica_Mechanics_Rotational_Interfaces.Flange_a flange_a
          "Flange of the rotor" annotation (Placement(transformation(extent={{-10,
                  110},{10,90}}, rotation=0)));
        Modelica_Mechanics_Rotational_Interfaces.Flange_a support
          "Support at which the reaction torque is acting" annotation (
            Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
        parameter Integer p "Number of pole pairs";
        parameter Modelica_Magnetic_FundamentalWave.Types.SalientInductance L0(d(start=1),
            q(start=1))
          "Salient inductance of a single unchorded coil w.r.t. the fundamental wave";
        final parameter
          Modelica_Magnetic_FundamentalWave.Types.SalientReluctance R_m(d=1/L0.d,
            q=1/L0.q) "Reluctance of the air gap model";
        // Complex phasors of magnetic potential differences
        Modelica_SIunits.ComplexMagneticPotentialDifference V_mss
          "Complex magnetic potential difference of stator w.r.t. stator reference frame";
        Modelica_SIunits.ComplexMagneticPotentialDifference V_msr
          "Complex magnetic potential difference of stator w.r.t. rotor reference frame";
        Modelica_SIunits.ComplexMagneticPotentialDifference V_mrr
          "Complex magnetic potential difference of rotor w.r.t. rotor reference frame";
        // Modelica.SIunits.ComplexMagneticPotentialDifference V_mrs
        //   "Complex magnetic potential difference of rotor w.r.t. stator reference frame";
        // Complex phasors of magnetic fluxes
        Modelica_SIunits.ComplexMagneticFlux Phi_ss
          "Complex magnetic potential difference of stator w.r.t. stator reference frame";
        Modelica_SIunits.ComplexMagneticFlux Phi_sr
          "Complex magnetic potential difference of stator w.r.t. rotor reference frame";
        Modelica_SIunits.ComplexMagneticFlux Phi_rr
          "Complex magnetic potential difference of rotor w.r.t. rotor reference frame";
        // Modelica.SIunits.ComplexMagneticFlux Phi_rs
        //   "Complex magnetic potential difference of rotor w.r.t. stator reference frame";
        // Electrical torque and mechanical angle
        Modelica_SIunits.Torque tauElectrical "Electrical torque";
        // Modelica.SIunits.Torque tauTemp "Electrical torque";
        Modelica_SIunits.Angle gamma
          "Electrical angle between rotor and stator";
        Complex rotator "Equivalent vector representation of orientation";
      equation
        // Stator flux into positive stator port
        port_sp.Phi = Phi_ss;
        // Balance of stator flux
        port_sp.Phi + port_sn.Phi = Complex(0, 0);
        // Rotor flux into positive rotor port
        port_rp.Phi = Phi_rr;
        // Balance of rotor flux
        port_rp.Phi + port_rn.Phi = Complex(0, 0);
        // Magneto motive force of stator
        port_sp.V_m - port_sn.V_m = V_mss;
        // Magneto motive force of stator
        port_rp.V_m - port_rn.V_m = V_mrr;
        // Transformation of fluxes between stator and rotor fixed frame, if wanted
        // Phi_rs.re = + Phi_rr.re * cos(gamma) - Phi_rr.im * sin(gamma);
        // Phi_rs.im = + Phi_rr.re * sin(gamma) + Phi_rr.im * cos(gamma);
        // Alternative transformation
        // Phi_rr.re = + Phi_rs.re * cos(gamma) + Phi_rs.im * sin(gamma);
        // Phi_rr.im = - Phi_rs.re * sin(gamma) + Phi_rs.im * cos(gamma);
        // Transformed stator flux is not needed
        // Phi_sr.re = + Phi_ss.re * cos(gamma) + Phi_ss.im * sin(gamma);
        // Phi_sr.im = - Phi_ss.re * sin(gamma) + Phi_ss.im * cos(gamma);
        Phi_sr = Phi_ss*Modelica_ComplexMath.conj(rotator);
        // Alternative transformation
        // Phi_ss.re = + Phi_sr.re * cos(gamma) - Phi_sr.im * sin(gamma);
        // Phi_ss.im = + Phi_sr.re * sin(gamma) + Phi_sr.im * cos(gamma);
        // Stator flux w.r.t. the rotor fixed frame and rotor flux are equal
        Phi_sr = Phi_rr;
        // Transformation of magnetic potential difference between stator and rotor fixed frame
        // V_mrs.re = + V_mrr.re * cos(gamma) - V_mrr.im * sin(gamma);
        // V_mrs.im = + V_mrr.re * sin(gamma) + V_mrr.im * cos(gamma);
        // V_mrr.re = + V_mrs.re * cos(gamma) + V_mrs.im * sin(gamma);
        // V_mrr.im = - V_mrs.re * sin(gamma) + V_mrs.im * cos(gamma);
        // V_msr.re = + V_mss.re * cos(gamma) + V_mss.im * sin(gamma);
        // V_msr.im = - V_mss.re * sin(gamma) + V_mss.im * cos(gamma);
        V_msr = V_mss*Modelica_ComplexMath.conj(rotator);
        // V_msr.re = + V_mss.re * cos(gamma) + V_mss.im * sin(gamma);
        // V_msr.im = - V_mss.re * sin(gamma) + V_mss.im * cos(gamma);
        // Local balance of magneto motive force
        (pi/2.0)*(V_mrr.re + V_msr.re) = Phi_rr.re*R_m.d;
        (pi/2.0)*(V_mrr.im + V_msr.im) = Phi_rr.im*R_m.q;
        // Torque
        tauElectrical = -(pi*p/2.0)*(Phi_ss.im*V_mss.re - Phi_ss.re*V_mss.im);
        flange_a.tau = -tauElectrical;
        support.tau = tauElectrical;
        // Electrical angle between stator and rotor
        gamma = p*(flange_a.phi - support.phi);
        rotator = Modelica_ComplexMath.exp(Complex(0, gamma));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={
              Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-100,90},{-100,60},{-80,60}}, color={255,128,0}),
              Line(points={{-100,-90},{-100,-60},{-80,-60}}, color={255,128,0}),
              Line(points={{40,60},{100,60},{100,90}}, color={255,128,0}),
              Line(points={{40,-60},{100,-60},{100,-90}}, color={255,128,0}),
              Ellipse(
                extent={{-60,80},{60,-80}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{0,80},{0,90}}, color={0,0,0})}), Documentation(info=
               "<html>
<p>
This salient air gap model can be used for machines with uniform airgaps and for machines with rotor saliencies. The air gap model is not symmetrical towards stator and rotor since it is assumed the saliency always refers to the rotor. The saliency of the air gap is represented by a main field inductance in the d- and q-axis.
</p>

<p>
For the mechanical interaction of the air gap model with the stator and the rotor it is equipped with to
<a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.Flange_a\">rotational connectors</a>. The torques acting on both connectors have the same absolute values but different signs. The difference between the stator and the rotor angle,
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/gamma.png\">, is required for the transformation of the magnetic stator quantities to the rotor side.</p>

<p>
The air gap model has two magnetic stator and two magnetic rotor
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Interfaces.MagneticPort\">ports</a>. The magnetic potential difference and the magnetic flux of the stator (superscript s) are transformed to the rotor fixed reference frame (superscript r). The effective reluctances of the main field with respect to the d- and q-axis are considered then in the balance equations
</p>

<p>
&nbsp;&nbsp;<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Machines/Components/airgap.png\">
</p>

<p>
according to the following figure.
</p>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\"><b>Fig:</b> Magnetic equivalent circuit of the air gap model</caption>
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Machines/Components/airgap_phasors.png\">
    </td>
  </tr>
</table>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">SinglePhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">SymmetricMultiPhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">SymmetricMultiPhaseCageWinding</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SaliencyCageWinding\">SaliencyCageWinding</a>
</p>

</html>"));
      end RotorSaliencyAirGap;

      model SymmetricMultiPhaseCageWinding "Symmetrical rotor cage"
        import Modelica_Constants.pi;
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPortExtended;
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
        Modelica_SIunits.Current i[m] = electroMagneticConverter.i
          "Cage currents";
        Modelica_Magnetic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
          electroMagneticConverter(
          final m=m,
          final effectiveTurns=fill(effectiveTurns, m),
          final orientation=
              Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m))
          "Symmetric winding" annotation (Placement(transformation(
              origin={0,-10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Resistor resistor(
          final useHeatPort=useHeatPort,
          final m=m,
          final R=fill(RRef, m),
          final T_ref=fill(TRef, m),
          final alpha=fill(alphaRef, m),
          final T=fill(TRef, m)) annotation (Placement(transformation(
              origin={-20,-50},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
            Placement(transformation(extent={{30,-30},{50,-10}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={70,-20},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortWinding if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica_Thermal_HeatTransfer.Components.ThermalCollector
          thermalCollector(final m=m) if
                          useHeatPort
          "Connector of thermal rotor resistance heat ports"
          annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
        Modelica_Electrical_MultiPhase.Basic.Star starAuxiliary(final m=m)
          annotation (Placement(transformation(extent={{30,-90},{50,-70}},
                rotation=0)));
        Modelica_Magnetic_FundamentalWave.Components.Reluctance strayReluctance(
            final R_m(d=m*effectiveTurns^2/2/Lsigma, q=m*effectiveTurns^2/2/
                Lsigma))
          "Stray reluctance equivalent to ideally coupled stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={0,20})));
      equation
        connect(port_p, electroMagneticConverter.port_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={255,128,0}));
        connect(electroMagneticConverter.port_n, port_n) annotation (Line(
              points={{10,-5.72459e-17},{100,-5.72459e-17},{100,0}}, color={255,
                128,0}));
        connect(ground.p, star.pin_n) annotation (Line(points={{60,-20},{56,-20},
                {50,-20}}, color={0,0,255}));
        connect(star.plug_p, electroMagneticConverter.plug_n) annotation (Line(
            points={{30,-20},{10,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(thermalCollector.port_a, resistor.heatPort) annotation (Line(
            points={{-40,-70},{-40,-70},{-40,-50},{-30,-50}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(thermalCollector.port_b, heatPortWinding) annotation (Line(
            points={{-40,-90},{-40,-100},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(resistor.plug_n, starAuxiliary.plug_p) annotation (Line(
            points={{-20,-60},{-20,-60},{-20,-80},{30,-80}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(strayReluctance.port_p, port_p) annotation (Line(
            points={{-10,20},{-30,20},{-30,0},{-100,0}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(strayReluctance.port_n, port_n) annotation (Line(
            points={{10,20},{30,20},{30,4.44089e-16},{100,4.44089e-16}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(electroMagneticConverter.plug_p, resistor.plug_p) annotation (
            Line(
            points={{-10,-20},{-20,-20},{-20,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
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
                      textString="%name")}), Documentation(info="<html>
<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Machines/Components/rotorcage.png\">
</p>
<p>
The symmetric rotor cage model of this library does not consist of rotor bars and end rings. Instead the symmetric cage is modeled by an equivalent symmetrical winding. The rotor cage model consists of
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\"> phases. If the cage is modeled by equivalent stator winding parameters, the number of effective turns, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/effectiveTurns.png\">, has to be chosen equivalent to the effective number of stator turns.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">SinglePhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">SymmetricMultiPhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SaliencyCageWinding\">SaliencyCageWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">RotorSaliencyAirGap</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}),            graphics));
      end SymmetricMultiPhaseCageWinding;

      model SaliencyCageWinding "Rotor cage with saliency in d- and q-axis"
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPortExtended;
        parameter Boolean useHeatPort=false
          "Enable / disable (=fixed temperatures) thermal port"
          annotation (Evaluate=true);
        parameter Modelica_Magnetic_FundamentalWave.Types.SalientResistance RRef(d(
              start=1), q(start=1)) "Salient cage resistance";
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
        parameter Modelica_Magnetic_FundamentalWave.Types.SalientInductance Lsigma(
            d(start=1), q(start=1)) "Salient cage stray inductance";
        parameter Real effectiveTurns=1 "Effective number of turns";
        Modelica_Blocks_Interfaces.RealOutput i[2](
          each final quantity="ElectricCurrent", each final unit="A")=electroMagneticConverter.i
          "Currents out from damper";
        Modelica_Blocks_Interfaces.RealOutput lossPower(
          final quantity="Power", final unit="W")=sum(resistor.resistor.LossPower)
          "Damper losses";
        Modelica_Magnetic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
          electroMagneticConverter(
          final m=2,
          final orientation={0,Modelica_Constants.pi/2},
          final effectiveTurns=fill(effectiveTurns, 2)) annotation (Placement(
              transformation(
              origin={0,-10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Resistor resistor(
          final useHeatPort=useHeatPort,
          final m=2,
          final R={RRef.d,RRef.q},
          final T_ref=fill(TRef, 2),
          final alpha=fill(alphaRef, 2),
          final T=fill(TOperational, 2)) annotation (Placement(transformation(
              origin={-20,-50},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=2) annotation (
            Placement(transformation(extent={{30,-90},{50,-70}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={70,-80},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortWinding if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica_Thermal_HeatTransfer.Components.ThermalCollector
          thermalCollector(final m=2) if
                          useHeatPort
          "Connector of thermal rotor resistance heat ports"
          annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
        Modelica_Magnetic_FundamentalWave.Components.Reluctance strayReluctance(
            final R_m(d=effectiveTurns^2/Lsigma.d, q=effectiveTurns^2/Lsigma.q))
          "Stray reluctance equivalent to ideally coupled stray inductances"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={0,20})));
      equation
        connect(port_p, electroMagneticConverter.port_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={255,128,0}));
        connect(electroMagneticConverter.port_n, port_n)
          annotation (Line(points={{10,0},{100,0}}, color={255,128,0}));
        connect(ground.p, star.pin_n)
          annotation (Line(points={{60,-80},{50,-80}}, color={0,0,255}));
        connect(electroMagneticConverter.plug_n, resistor.plug_n) annotation (Line(
            points={{10,-20},{20,-20},{20,-80},{-20,-80},{-20,-60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(star.plug_p, electroMagneticConverter.plug_n) annotation (Line(
            points={{30,-80},{20,-80},{20,-20},{10,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(thermalCollector.port_b, heatPortWinding) annotation (Line(
            points={{-40,-90},{-40,-100},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(resistor.heatPort, thermalCollector.port_a) annotation (Line(
            points={{-30,-50},{-40,-50},{-40,-70}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(electroMagneticConverter.plug_p, resistor.plug_p) annotation (Line(
            points={{-10,-20},{-20,-20},{-20,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(strayReluctance.port_p, port_p) annotation (Line(
            points={{-10,20},{-30,20},{-30,0},{-100,0}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(strayReluctance.port_n, port_n) annotation (Line(
            points={{10,20},{30,20},{30,0},{100,0}},
            color={255,128,0},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={
              Ellipse(
                extent={{-80,80},{80,-80}},
                lineColor={0,0,0},
                fillColor={175,175,175},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-20,76},{20,36}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{28,46},{68,6}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{28,-8},{68,-48}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-20,-36},{20,-76}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-68,-6},{-28,-46}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-66,50},{-26,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,0},{-100,0}}, color={255,128,0}),
              Line(points={{100,0},{80,0}}, color={255,128,0}),
              Text(
                extent={{0,100},{0,140}},
                lineColor={0,0,255},
                textString="%name")}), Documentation(info="<html>

<p>
The salient cage model is a two axis model with two phases. The electromagnetic coupling therefore is also two phase coupling model. The angles of the two orientations are 0 and <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/pi_over_2.png\">. This way an asymmetrical rotor cage with different resistances and stray inductances in d- and q-axis can be modeled.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">SinglePhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">SymmetricMultiPhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">SymmetricMultiPhaseCageWinding</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">RotorSaliencyAirGap</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}), graphics));
      end SaliencyCageWinding;

      model PermanentMagnet
        "Permanent magnet represented by magnetic potential difference"
        extends
          Modelica_Magnetic_FundamentalWave.Sources.ConstantMagneticPotentialDifference;
        extends
          Modelica_Electrical_Machines.Losses.InductionMachines.PermanentMagnetLosses;
        annotation (Documentation(info="<html>
<p>
Simple model of a permanent magnet, containing:
</p>
<ul>
<li><a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.ConstantMagneticPotentialDifference\">constant magnetomotive force</a></li>
<li><a href=\"modelica://Modelica.Electrical.Machines.Losses.InductionMachines.PermanentMagnetLosses\">loss model</a></li>
</ul>
<p>
The permanent magnet is modeled by a magnetic potential difference. The internal reluctance of the permanent magnet is not taken into accout. The internal reluctance needs to be modeled outside the permanent magnet model, e.g., by the total machine reluctance considered in the air gap model.
</p>
</html>"));
      end PermanentMagnet;

      model SymmetricMultiPhaseCageWinding_obsolete "Symmetrical rotor cage"
        import Modelica_Constants.pi;
        extends Modelica_Icons.ObsoleteModel;
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPortExtended;
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
        Modelica_SIunits.Current i[m] = strayInductor.i "Cage currents";
        Modelica_Magnetic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
          winding(
          final m=m,
          final effectiveTurns=fill(effectiveTurns, m),
          final orientation=
              Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m))
          "Symmetric winding" annotation (Placement(transformation(
              origin={0,-10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Inductor strayInductor(final m=m,
            final L=fill(Lsigma, m)) annotation (Placement(transformation(
              origin={-20,-30},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Resistor resistor(
          final useHeatPort=useHeatPort,
          final m=m,
          final R=fill(RRef, m),
          final T_ref=fill(TRef, m),
          final alpha=fill(alphaRef, m),
          final T=fill(TRef, m)) annotation (Placement(transformation(
              origin={-20,-70},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
            Placement(transformation(extent={{30,-30},{50,-10}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={70,-20},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortWinding if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica_Thermal_HeatTransfer.Components.ThermalCollector
          thermalCollector(final m=m) if
                          useHeatPort
          "Connector of thermal rotor resistance heat ports"
          annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
        Modelica_Electrical_MultiPhase.Basic.Star starAuxiliary(final m=m)
          annotation (Placement(transformation(extent={{30,-90},{50,-70}},
                rotation=0)));
      equation
        connect(port_p, winding.port_p) annotation (Line(points={{-100,0},{-10,0}},
                                     color={255,
                128,0}));
        connect(winding.port_n, port_n) annotation (Line(points={{10,-5.72459e-17},
                {100,-5.72459e-17},{100,0}}, color={255,128,0}));
        connect(ground.p, star.pin_n) annotation (Line(points={{60,-20},{56,-20},
                {50,-20}}, color={0,0,255}));
        connect(strayInductor.plug_n, resistor.plug_p)
          annotation (Line(points={{-20,-40},{-20,-60}}, color={0,0,255}));
        connect(strayInductor.plug_p, winding.plug_p) annotation (Line(
            points={{-20,-20},{-10,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(star.plug_p, winding.plug_n) annotation (Line(
            points={{30,-20},{10,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(thermalCollector.port_a, resistor.heatPort) annotation (Line(
            points={{-40,-70},{-30,-70}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(thermalCollector.port_b, heatPortWinding) annotation (Line(
            points={{-40,-90},{-40,-100},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(resistor.plug_n, starAuxiliary.plug_p) annotation (Line(
            points={{-20,-80},{30,-80}},
            color={0,0,255},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
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
                      textString="%name")}), Documentation(info="<html>
<p>
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/Machines/Components/rotorcage.png\">
</p>
<p>
The symmetric rotor cage model of this library does not consist of rotor bars and end rings. Instead the symmetric cage is modeled by an equivalent symmetrical winding. The rotor cage model consists of
<img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/m.png\"> phases. If the cage is modeled by equivalent stator winding parameters, the number of effective turns, <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/effectiveTurns.png\">, has to be chosen equivalent to the effective number of stator turns.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">SinglePhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">SymmetricMultiPhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SaliencyCageWinding\">SaliencyCageWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">RotorSaliencyAirGap</a>
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end SymmetricMultiPhaseCageWinding_obsolete;

      model SaliencyCageWinding_obsolete
        "Rotor cage with saliency in d- and q-axis"
        extends Modelica_Icons.ObsoleteModel;
        extends
          Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPortExtended;
        parameter Boolean useHeatPort=false
          "Enable / disable (=fixed temperatures) thermal port"
          annotation (Evaluate=true);
        parameter Modelica_Magnetic_FundamentalWave.Types.SalientResistance RRef(d(start=1),
            q(start=1)) "Salient cage resistance";
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
        parameter Modelica_Magnetic_FundamentalWave.Types.SalientInductance Lsigma(d(start=1),
            q(start=1)) "Salient cage stray inductance";
        parameter Real effectiveTurns=1 "Effective number of turns";
        Modelica_Blocks_Interfaces.RealOutput i[2](
          each final quantity="ElectricCurrent", each final unit="A")=resistor.i
          "Currents out from damper";
        Modelica_Blocks_Interfaces.RealOutput lossPower(
          final quantity="Power", final unit="W")=sum(resistor.resistor.LossPower)
          "Damper losses";
        Modelica_Magnetic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
          winding(
          final m=2,
          final orientation={0,Modelica_Constants.pi/2},
          final effectiveTurns=fill(effectiveTurns, 2)) "Symmetric winding"
          annotation (Placement(transformation(
              origin={0,-10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Inductor strayInductor(final m=2,
            final L={Lsigma.d,Lsigma.q}) annotation (Placement(transformation(
              origin={-20,-30},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Resistor resistor(
          final useHeatPort=useHeatPort,
          final m=2,
          final R={RRef.d,RRef.q},
          final T_ref=fill(TRef, 2),
          final alpha=fill(alphaRef, 2),
          final T=fill(TOperational, 2)) annotation (Placement(transformation(
              origin={-20,-70},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=2) annotation (
            Placement(transformation(extent={{30,-90},{50,-70}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={70,-80},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPortWinding if
          useHeatPort "Heat ports of winding resistor"
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica_Thermal_HeatTransfer.Components.ThermalCollector
          thermalCollector(final m=2) if
                          useHeatPort
          "Connector of thermal rotor resistance heat ports"
          annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
      equation
        connect(port_p, winding.port_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={255,128,0}));
        connect(winding.port_n, port_n)
          annotation (Line(points={{10,0},{100,0}}, color={255,128,0}));
        connect(ground.p, star.pin_n)
          annotation (Line(points={{60,-80},{50,-80}}, color={0,0,255}));
        connect(strayInductor.plug_n, resistor.plug_p)
          annotation (Line(points={{-20,-40},{-20,-60}}, color={0,0,255}));
        connect(winding.plug_n, resistor.plug_n) annotation (Line(
            points={{10,-20},{20,-20},{20,-80},{-20,-80}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(star.plug_p, winding.plug_n) annotation (Line(
            points={{30,-80},{20,-80},{20,-20},{10,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(strayInductor.plug_p, winding.plug_p) annotation (Line(
            points={{-20,-20},{-10,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(thermalCollector.port_b, heatPortWinding) annotation (Line(
            points={{-40,-90},{-40,-100},{0,-100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(resistor.heatPort, thermalCollector.port_a) annotation (Line(
            points={{-30,-70},{-40,-70}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={
              Ellipse(
                extent={{-80,80},{80,-80}},
                lineColor={0,0,0},
                fillColor={175,175,175},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-20,76},{20,36}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{28,46},{68,6}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{28,-8},{68,-48}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-20,-36},{20,-76}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-68,-6},{-28,-46}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-66,50},{-26,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,0},{-100,0}}, color={255,128,0}),
              Line(points={{100,0},{80,0}}, color={255,128,0}),
              Text(
                extent={{0,100},{0,140}},
                lineColor={0,0,255},
                textString="%name")}), Documentation(info="<html>

<p>
The salient cage model is a two axis model with two phases. The electromagnetic coupling therefore is also two phase coupling model. The angles of the two orientations are 0 and <img src=\"modelica://Modelica/Resources/Images/Magnetic/FundamentalWave/pi_over_2.png\">. This way an asymmetrical rotor cage with different resistances and stray inductances in d- and q-axis can be modeled.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SinglePhaseWinding\">SinglePhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding\">SymmetricMultiPhaseWinding</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseCageWinding\">SymmetricMultiPhaseCageWinding</a>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap\">RotorSaliencyAirGap</a>
</p>
</html>"));
      end SaliencyCageWinding_obsolete;
    end Components;
    annotation (Documentation(info="<html>
<p>
This package contains electric machine models and
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.Components\">components</a>
for electric machines.
</p>
</html>"));
  end BasicMachines;

  package Sources "Sources"
    extends Modelica_Icons.SourcesPackage;
    model ConstantMagneticPotentialDifference
      "Source with constant magnetic potential difference"
      extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
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
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Text(
              extent={{-80,-20},{-80,-40}},
              lineColor={255,128,0},
              textString="+"),
            Text(
              extent={{80,-20},{80,-40}},
              lineColor={255,128,0},
              textString="-"),
            Ellipse(
              extent={{-50,-50},{50,50}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{100,0},{50,0}}, color={255,128,0}),
            Line(points={{-50,0},{-100,0}}, color={255,128,0}),
            Line(points={{-50,0},{50,0}}, color={255,128,0}),
            Text(
              extent={{0,-120},{0,-80}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>
Source of constant magneto motive force.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.SignalMagneticPotentialDifference\">SignalMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.ConstantFlux\">ConstantFlux</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.SignalFlux\">SignalFlux</a>
</p>
</html>"));
    end ConstantMagneticPotentialDifference;

    model SignalMagneticPotentialDifference
      "Source of magnetic potential difference with signal input"
      extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
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
                  lineColor={255,128,0},
                  textString="-"),Ellipse(
                  extent={{-50,-50},{50,50}},
                  lineColor={255,128,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,0},{50,0}},
              color={255,128,0}),Line(points={{-50,0},{-100,0}}, color={255,128,
              0}),Line(points={{-50,0},{50,0}}, color={255,128,0}),Line(points=
              {{0,100},{0,50}}, color={255,128,0}),Text(
                  extent={{0,-120},{0,-80}},
                  textString="%name",
                  lineColor={0,0,255})}), Documentation(info="<html>
<p>
Source of magneto motive force with complex signal input.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.ConstantMagneticPotentialDifference\">ConstantMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.ConstantFlux\">ConstantFlux</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.SignalFlux\">SignalFlux</a>
</p>

</html>"));
    end SignalMagneticPotentialDifference;

    model ConstantFlux "Source of constant magnetic flux"
      extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
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
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Ellipse(
                  extent={{-50,-50},{50,50}},
                  lineColor={255,128,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,0},{50,0}},
              color={255,128,0}),Line(points={{-50,0},{-100,0}}, color={255,128,
              0}),Line(points={{0,50},{0,-50}}, color={255,128,0}),Polygon(
                  points={{80,0},{60,6},{60,-6},{80,0}},
                  lineColor={255,128,0},
                  fillColor={255,128,0},
                  fillPattern=FillPattern.Solid),Text(
                  extent={{0,-120},{0,-80}},
                  textString="%name",
                  lineColor={0,0,255})}), Documentation(info="<html>
<p>
Source of constant magnetic flux.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.ConstantMagneticPotentialDifference\">
   ConstantMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.SignalMagneticPotentialDifference\">
   SignalMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.SignalFlux\">SignalFlux</a>
</p>

</html>"));
    end ConstantFlux;

    model SignalFlux "Source of constant magnetic flux"
      extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
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
                  lineColor={255,128,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,0},{50,0}},
              color={255,128,0}),Line(points={{-50,0},{-100,0}}, color={255,128,
              0}),Line(points={{0,50},{0,-50}}, color={255,128,0}),Polygon(
                  points={{80,0},{60,6},{60,-6},{80,0}},
                  lineColor={255,128,0},
                  fillColor={255,128,0},
                  fillPattern=FillPattern.Solid),Line(points={{0,100},{0,50}},
              color={255,128,0}),Text(
                  extent={{0,-120},{0,-80}},
                  textString="%name",
                  lineColor={0,0,255})}), Documentation(info="<html>
<p>
Source of magnetic flux with complex signal input.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.ConstantMagneticPotentialDifference\">
   ConstantMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.SignalMagneticPotentialDifference\">
   SignalMagneticPotentialDifference</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sources.ConstantFlux\">ConstantFlux</a>,
</p>

</html>"));
    end SignalFlux;
    annotation (Documentation(info="<html>
<p>This package provides sources of magnetic potential difference and magnetic flux.</p>
</html>"));
  end Sources;

  package Sensors "Sensors to measure variables in magnetic networks"
    extends Modelica_Icons.SensorsPackage;
    model MagneticFluxSensor "Sensor to measure magnetic flux"
      extends Modelica_Icons.RotationalSensor;
      extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
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
      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={Text(
                  extent={{-29,-11},{30,-70}},
                  lineColor={0,0,0},
                  textString="Phi"),Line(points={{-72,0},{-90,0}}, color={0,0,0}),
              Text(
                  extent={{-140,120},{140,80}},
                  textString="%name",
                  lineColor={0,0,255}),Line(points={{70,0},{90,0}}, color={0,0,
              0}),Line(points={{0,-90},{0,-70}})}), Documentation(info="<html>
<p>Sensor for magnetic flux.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Sensors.MagneticPotentialDifferenceSensor\">MagneticPotentialDifferenceSensor</a>
</p>
</html>"));
    end MagneticFluxSensor;

    model MagneticPotentialDifferenceSensor
      "Sensor to measure magnetic potential difference"
      extends Modelica_Icons.RotationalSensor;
      extends Modelica_Magnetic_FundamentalWave_Interfaces.PartialTwoPort;
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
            extent={{-100,-100},{100,100}}), graphics={Text(
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
      Modelica_Magnetic_FundamentalWave_Interfaces.PositiveMagneticPort port_p
        "Magnetic connector of sensor"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    equation
      // No magnetic flux through sensor
      port_p.Phi = Complex(0, 0);
      // Magnetic potential
      V_m = port_p.V_m;
      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={Text(
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


  package Types "Definition of salient types"
    extends Modelica_Icons.TypesPackage;
    record Salient "Base record of saliency with d and q component"
      replaceable Real d "Component of d (direct) axis, aligned to real part";
      replaceable Real q
        "Component of q (quadrature) axis, aligned to imaginary part";
      annotation (Documentation(info="<html>
<p>
Definition of saliency with respect to the orthogonal d- and q-axis. Saliency, however, refers to different properties in d- and q-axis and thus considers the anisotropic behavior.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientCurrent\">SalientCurrent</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientVoltage\">SalientVoltage</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientInductance\">SalientInductance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientReluctance\">SalientReluctance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientResistance\">SalientResistance</a>
</p>

</html>"));
    end Salient;

    record SalientCurrent = Salient (
      redeclare Modelica_SIunits.Current d,
      redeclare Modelica_SIunits.Current q) "Salient current" annotation (
        Documentation(info="<html>
<p>Type representing the d- and q-axis of a current phasor.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.Salient\">Salient</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientVoltage\">SalientVoltage</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientResistance\">SalientResistance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientInductance\">SalientInductance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientReluctance\">SalientReluctance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientPermeance\">SalientPermeance</a>
</p>

</html>"));
    record SalientVoltage = Salient (
      redeclare Modelica_SIunits.Voltage d,
      redeclare Modelica_SIunits.Voltage q) "Salient voltage" annotation (
        Documentation(info="<html>
<p>Type representing the d- and q-axis of a voltage phasor.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.Salient\">Salient</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientCurrent\">SalientCurrent</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientResistance\">SalientResistance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientInductance\">SalientInductance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientReluctance\">SalientReluctance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientPermeance\">SalientPermeance</a>
</p>

</html>"));
    record SalientResistance = Salient (
      redeclare Modelica_SIunits.Resistance d,
      redeclare Modelica_SIunits.Resistance q) "Salient resistance"
      annotation (Documentation(info="<html>
<p>Type representing the d- and q-axis of an resistance with respect to the fundamental wave.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.Salient\">Salient</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientCurrent\">SalientCurrent</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientVoltage\">SalientVoltage</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientInductance\">SalientInductance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientReluctance\">SalientReluctance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientPermeance\">SalientPermeance</a>
</p>

</html>"));
    record SalientInductance = Salient (
      redeclare Modelica_SIunits.Inductance d,
      redeclare Modelica_SIunits.Inductance q) "Salient inductance"
      annotation (Documentation(info="<html>
<p>Type representing the d- and q-axis of an inductance with respect to the fundamental wave.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.Salient\">Salient</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientCurrent\">SalientCurrent</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientVoltage\">SalientVoltage</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientResistance\">SalientResistance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientReluctance\">SalientReluctance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientPermeance\">SalientPermeance</a>
</p>

</html>"));
    record SalientReluctance = Salient (
      redeclare Modelica_SIunits.Reluctance d,
      redeclare Modelica_SIunits.Reluctance q) "Salient reluctance"
      annotation (Documentation(info="<html>
<p>Type representing the d- and q-axis of an reluctance with respect to the fundamental wave.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.Salient\">Salient</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientCurrent\">SalientCurrent</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientVoltage\">SalientVoltage</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientResistance\">SalientResistance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientInductance\">SalientInductance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientPermeance\">SalientPermeance</a>
</p>

</html>"));
    record SalientPermeance =  Salient (
      redeclare Modelica_SIunits.Permeance d,
      redeclare Modelica_SIunits.Permeance q) "Salient permeance"
      annotation (Documentation(info="<html>
<p>Type representing the d- and q-axis of an reluctance with respect to the fundamental wave.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.Salient\">Salient</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientCurrent\">SalientCurrent</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientVoltage\">SalientVoltage</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientResistance\">SalientResistance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientInductance\">SalientInductance</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.Types.SalientReluctance\">SalientReluctance</a>
</p>

</html>"));
    annotation (Documentation(info="<html>
<p>This package provides types for modeling anisotropic saliency effects in electric machines. These saliencies are usually considered by a d- (direct) and q-axis (quadrature) components in the respective axis (of the rotor).</p>
</html>"));
  end Types;
  annotation (preferredView="info", Documentation(revisions="<html>

<p>A detailed list of changes is summarized in the <a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.ReleaseNotes\">release notes</a>.</p>

</html>", info="<html>
<p>
Copyright &copy; 2009-2014, Modelica Association, <a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.Contact\">Christian Kral</a>,
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.UsersGuide.Contact\">Anton Haumer</a> and AIT
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>"),
    uses(Complex(version="3.2.2"), ModelicaIcons,
      Modelica(version="3.2.1")));
end Modelica_Magnetic_FundamentalWave;
