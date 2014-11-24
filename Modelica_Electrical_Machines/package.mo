within ;
encapsulated package Modelica_Electrical_Machines
  "Library for electric machines"
  import Modelica_Icons;
  import Modelica_Electrical_Machines_Interfaces;
  import Modelica_SIunits;
  import Modelica_Constants;
  import Modelica_Electrical_MultiPhase;
  import Modelica_Electrical_MultiPhase_Interfaces;
  import Modelica_Electrical_Analog;
  import Modelica_Blocks_Interfaces;
  import Modelica_Electrical_Analog_Interfaces;
  import Modelica_Mechanics_Rotational_Interfaces;
  import Modelica_Blocks;
  import Modelica_Mechanics_Rotational;
  import Modelica_Math;
  import Modelica_Thermal_HeatTransfer_Interfaces;
  import Modelica_Thermal_HeatTransfer;
  extends Modelica_Icons.Package;
  package UsersGuide "User's Guide"
    extends Modelica_Icons.Information;
    class Concept "Concept"
      extends Modelica_Icons.Information;
      annotation (preferredView="info",Documentation(info="<html>
<p>This package contains electric machine models and components for modeling these machines.</p>
<b>Limitations and assumptions:</b>
<ul>
<li>number of phases (of induction machines) is limited to 3, therefore definition as a constant m=3</li>
<li>phase symmetric windings as well as symmetry of the whole machine structure</li>
<li>all values are used in physical units, no scaling to p.u. is done</li>
<li>only basic harmonics (in space) are taken into account</li>
<li>waveform (with respect to time) of voltages and currents is not restricted</li>
<li>constant parameters, i.e., no saturation, no skin effect</li>
</ul>
<p>
You may have a look at a short summary of space phasor theory at <a href=\"http://www.haumer.at/refimg/SpacePhasors.pdf\">http://www.haumer.at/refimg/SpacePhasors.pdf</a>
</p>
<b>Further development:</b>
<ul>
<li>generalizing space phasor theory to m phases with arbitrary spatial angle of the coils</li>
<li>generalizing space phasor theory to arbitrary number of windings and winding factor of the coils</li>
<li>MachineModels: other machine types</li>
<li>effects: saturation, skin-effect, ...</li>
</ul>
<p>
<b>In memoriam Prof. Hans Kleinrath (1928-03-07 - 2010-04-05)</b>
</p>

</html>"));
    end Concept;

    class Contact "Contact"
      extends Modelica_Icons.Contact;
      annotation (preferredView="info",Documentation(info="<html>
<h4>Contact</h4>

<p>
Anton Haumer<br>
<a href=\"http://www.haumer.at\">Technical Consulting &amp; Electrical Engineering</a><br>
3423 St. Andrae-Woerdern, Austria<br>
email: <a HREF=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a><br>
</p>

<p>
  Dr. Christian Kral<br>
  <a href=\"http://christiankral.net/\">Electric Machines, Drives and Systems</a><br>
  A-1060 Vienna, Austria<br>
  email: <a href=\"mailto:dr.christian.kral@gmail.com\">dr.christian.kral@gmail.com</a>
</p>


</html>"));
    end Contact;

    class ReleaseNotes "Release Notes"
      extends Modelica_Icons.ReleaseNotes;
      annotation (preferredView="info",Documentation(info="<html>

<h5>Version 3.2.2, 2014-10-05 (Anton Haumer, Christian Kral)</h5>
<ul>
  <li>Updated blocks and functions towards multi phase systems greater or equal to three</li>
  <li>Added standard blocks and functions</li>
  <li>Improved documentation</li>
  <li>Added alias for rotor current in squirrel cage model</li>
</ul>

<h5>Version 3.2.1, 2014-10-05 (Anton Haumer, Christian Kral)</h5>
<ul>
  <li>Fixed bugs of wrong sign of power calculation and orientation of secondary components; see #1474</li>
  <li>Corrected bug in wrong orientation of rotor current; see #1226</li>
  <li>Fixed bug of wrong temperature propagation in transformer ambient model; see #1579</li>
</ul>

<h5>Version 2.6.0, 2013-02-25 (Anton Haumer)</h5>
<ul>
  <li>Corrected turnsRatio bug in asynchronous induction machine with slipring rotor</li>
  <li>Corrected parameter descriptions</li>
</ul>

<h5>Version 2.5.0, 2012-XX-XX (Anton Haumer)</h5>
<ul>
  <li>Included permanent magnet losses</li>
</ul>

<h5>Version 2.4.0, 2010-04-20 (Anton Haumer)</h5>

<ul>
  <li>Included core, fricton and stray load models for rotating electric machines</li>
</ul>

<h5>Version 2.3.0, 2010-02-16 (Anton Haumer)</h5>
<ul>
  <li>Included quasi stationary DC machine models</li>
</ul>

<h5>Version 2.2.0, 2010-02-10 (Anton Haumer)</h5>
<ul>
  <li>Conditional ThermalPort for all machines</li>
</ul>

<h5>Version 2.1.3, 2010-02-10 (Anton Haumer)</h5>
<ul>
  <li>Prepared conditionalHeatPort of SquirrelCage and DamperCage</li>
</ul>

<h5>Version 2.1.2, 2010-02-09 (Anton Haumer)</h5>
<ul>
  <li>Included new Examples:
<a href=\"modelica://Modelica.Electrical.Machines.Examples.AsynchronousInductionMachines.AIMC_Transformer\">
AIMC_Transformer</a>,
DC_Comparison</li>
</ul>

<h5>Version 2.1.1, 2010-02-05 (Anton Haumer, Christian Kral)</h5>
<ul>
  <li>Included
<a href=\"modelica://Modelica.Electrical.Machines.Utilities.SwitchedRheostat>
SwitchedRheostat</a>,
<a href=\"modelica://Modelica.Electrical.Machines.Utilities.RampedRheostat>
</a>RampedRheostat</li>
</ul>

<h5>Version 2.1.0, 2009-08-26 (Anton Haumer)</h5>
<ul>
  <li>Set all useHeatPort=false</li>
</ul>

<h5>Version 2.0.0, 2007-11-13 (Anton Haumer)</h5>
<ul>
  <li>Removed replaceable from airgaps</li>
  <li>Removed cardinality from support, using a Boolean parameter</li>
  <li>Removed all nonSIunits</li>
</ul>

<h5>Version 1.9.2, 2007-10-15 (Anton Haumer)</h5>
<ul>
  <li>Changed some names to be more concise (see conversion script)</li>
</ul>

<h5>Version 1.9.1, 2007-10-15 (Anton Haumer)</h5>
<ul>
  <li>Solved a bug with replaceable airgap / partial machines</li>
</ul>

<h5>Version 1.9.0, 2007-08-24 (Anton Haumer)</h5>

<ul>
  <li>Removed redeclare type SignalType</li>
</ul>

<h5>Version 1.8.8, 2007-08-20 (Anton Haumer)</h5>

<ul>
  <li>Improved documentation</li>
</ul>

<h5>Version 1.8.7, 2007-08-20 (Anton Haumer)</h5>
<ul>
  <li>Corrected typo in documentation</li>
</ul>

<h5>Version 1.8.6, 2007-08-12 (Anton Haumer)</h5>

<ul>
  <li>Improved documentation</li>
</ul>

<h5>Version 1.8.5, 2007-06-26 (Anton Haumer)</h5>
<ul>
  <li>Consistent parameters of DCSE</li>
</ul>

<h5>Version 1.8.4, 2007-06-25 (Anton Haumer)</h5>
<ul>
  <li>Corrected some typos in documentation</li>
</ul>

<h5>Version 1.8.3, 2007-06-08 (Anton Haumer)</h5>
<ul>
  <li>Documentation update</li>
</ul>

<h5>Version 1.8.2, 2007-01-15 (Anton Haumer)</h5>
<ul>
  <li>Resolved a bug in electrical excited synchronous induction machine</li>
</ul>

<h5>Version 1.8.1, 2006-12-01 (Anton Haumer)</h5>
<ul>
  <li>Resolved a compatibility issue with airGap</li>
</ul>

<h5>Version 1.8.0, 2006-11-26 (Anton Haumer)</h5>
<ul>
  <li>Introduced package Transformers</li>
  <li>Moved common parameters and functionality to partial models,
      keeping Interfaces.PartialBasicInductionMachines and PartialBasicDCMachine, respectively, for compatibility reasons</li>
  <li>Implemented support showing reaction torque if connected</li>
</ul>

<h5>Version 1.7.1, 2006-02-06 (Anton Haumer)</h5>
<ul>
  <li>Changed some naming of synchronous machines, not affecting existing models</li>
</ul>

<h5>Version 1.7.0, 2005-12-15 (Anton Haumer)</h5>
<ul>
  <li>Back-changed the naming to ensure backward compatibility</li>
</ul>

<h5>Version 1.6.3, 2005-11-25 (Anton Haumer)</h5>

<ul>
  <li>Easier parameterization of AsynchronousInductionMachines.AIM_SlipRing model</li>
</ul>

<h5>Version 1.6.2, 2005-10-23 (Anton Haumer)</h5>
<ul>
  <li>Selectable DamperCage for Synchronous Machines</li>
</ul>

<h5>Version 1.6.1, 2005-11-22 (Anton Haumer)</h5>
<ul>
  <li>Improved transformation and rotation in SpacePhasor</li>
  <li>Introduced Examples.Utilities.TerminalBox</li>
</ul>

<h5>Version 1.60, 2005-11-04 (Anton Haumer)</h5>
<ul>
  <li>Added
      <a href=\"modelica://Modelica.Electrical.Machines.SpacePhasors.Components.Rotator\">
      Rotator</a></li>
  <li>Corrected consistent naming of parameters and variables</li>
</ul>

<h5>Version 1.53, 2005-10-14 (Anton Haumer)</h5>
<ul>
  <li>Introduced unsymmetrical damper cage for synchronous machines</li>
</ul>

<h5>Version 1.52, 2005-10-12 (Anton Haumer)</h5>
<ul>
  <li>Added
      <a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">
SM_ElectricalExcited</a>
      using new
      <a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.Components.ElectricalExcitation\">
      ElectricalExcitation</a>
      as well as a new example</li>
</ul>

<h5>Version 1.51, 2005-02-01 (Anton Haumer)</h5>
<ul>
  <li>Changed parameter polePairs to Integer</li>
</ul>

<h5>Version 1.4, 2004-11-11 (Anton Haumer)</h5>
<ul>
  <li>Removed mechanical flange support to ease the implementation of a 3D-frame in a future release</li>
</ul>

<h5>Version 1.3.2, 2004-11-10 (Anton Haumer)</h5>
<ul>
  <li>ReluctanceRotor moved to SynchronousMachines</li>
</ul>

<h5>Version 1.3.1, 2004-11-06 (Anton Haumer)</h5>
<ul>
  <li>Small changes in Examples.Utilities.VfController</li>
</ul>

<h5>Version 1.3, 2004-11-05 (Anton Haumer)</h5>
<ul>
  <li>Several improvements in SpacePhasors.Blocks</li>
</ul>

<h5>Version 1.2, 2004-10-27 (Anton Haumer)</h5>
<ul>
  <li>Fixed a bug with support (formerly bearing)</li>
</ul>

<h5>Version 1.1, 2004-10-01 (Anton Haumer)</h5>
<ul>
  <li>Changed naming and structure issued to Modelica Standard Library 2.1</li>
</ul>

<h5>Version 1.03, 2004-09-24 (Anton Haumer)</h5>
<ul>
  <li>Added package Sensors</li>
  <li>Added DC machine with series excitation</li>
  <li>Debugged and improved MoveToRotational</li>
</ul>

<h5>Version 1.02, 2004-09-19 (Anton Haumer)</h5>
<ul>
  <li>New package structure for machine types added DC machine models</li>
</ul>

<h5>Version 1.01, 2004-09-18 (Anton Haumer)</h5>
<ul>
  <li>Moved common equations from machine models to PartialMachine improved MoveToRotational</li>
</ul>

<h5>Version 1.00, 2004-09-16 (Anton Haumer)</h5>
<ul>
  <li>First stable release</li>
</ul>

<p></p>

</html>"));
    end ReleaseNotes;

    class References "References"
      extends Modelica_Icons.References;
      annotation (preferredView="info",Documentation(info="<html>

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
    annotation (
      preferredView="info",
      DocumentationClass=true,
      Documentation(info="<html>
<p>
This is the library of electric machine models.
</p>

</html>"));
  end UsersGuide;

  package BasicMachines "Basic machine models"
    extends Modelica_Icons.Package;
    package AsynchronousInductionMachines
      "Models of asynchronous induction machines"
      extends Modelica_Icons.VariantsPackage;
      model AIM_SquirrelCage
        "Asynchronous induction machine with squirrel cage rotor"
        extends
          Modelica_Electrical_Machines_Interfaces.PartialBasicInductionMachine(
          final idq_ss=airGapS.i_ss,
          final idq_sr=airGapS.i_sr,
          final idq_rs=airGapS.i_rs,
          final idq_rr=airGapS.i_rr,
          redeclare final
            Thermal.AsynchronousInductionMachines.ThermalAmbientAIMC
            thermalAmbient(final Tr=TrOperational),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMC
            thermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMC
            internalThermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.PowerBalanceAIMC
            powerBalance(final lossPowerRotorWinding=squirrelCageR.LossPower,
              final lossPowerRotorCore=0),
          statorCore(final w=statorCoreParameters.wRef));
        output Modelica_SIunits.Current ir[2]=squirrelCageR.i
          "Rotor cage currents";
        Components.AirGapS airGapS(
          final p=p,
          final Lm=Lm,
          final m=m) annotation (Placement(transformation(
              origin={0,0},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        parameter Modelica_SIunits.Inductance Lm(start=3*sqrt(1 - 0.0667)/(2*pi
              *fsNominal)) "Stator main field inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrsigma(start=3*(1 - sqrt(1 -
              0.0667))/(2*pi*fsNominal))
          "Rotor stray inductance (equivalent three phase winding)"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Resistance Rr(start=0.04)
          "Rotor resistance (equivalent three phase winding) at TRef"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of rotor resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20r(start=0)
          "Temperature coefficient of rotor resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of rotor resistance" annotation (Dialog(
              group="Operational temperatures", enable=not useThermalPort));
        Components.SquirrelCage squirrelCageR(
          final Lrsigma=Lrsigma,
          final Rr=Rr,
          final useHeatPort=true,
          final T_ref=TrRef,
          final T=TrRef,
          final alpha=Thermal.convertAlpha(alpha20r, TrRef)) annotation (
            Placement(transformation(
              origin={0,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      equation
        connect(airGapS.spacePhasor_r, squirrelCageR.spacePhasor_r)
          annotation (Line(points={{10,-10},{10,-30}}, color={0,0,255}));
        connect(airGapS.flange, inertiaRotor.flange_a) annotation (Line(
            points={{10,0},{36,0},{36,0},{70,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(lssigma.spacePhasor_b, airGapS.spacePhasor_s) annotation (Line(
            points={{20,10},{10,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(squirrelCageR.heatPort, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-10,-40},{-10,-60},{0,-60},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(airGapS.support, internalSupport) annotation (Line(
            points={{-10,0},{-40,0},{-40,-90},{60,-90},{60,-100}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (defaultComponentName="aimc", Documentation(info="<HTML>
<p><b>Model of a three phase asynchronous induction machine with squirrel cage.</b><br>
Resistance and stray inductance of stator is modeled directly in stator phases, then using space phasor transformation. Resistance and stray inductance of rotor's squirrel cage is modeled in two axis of the rotor-fixed coordinate system. Both together connected via a stator-fixed <i>AirGap</i> model. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>heat losses in the temperature dependent cage resistances</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<p><b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">number of pole pairs p</td>
<td valign=\"top\">2</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">rotor's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
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
<td valign=\"top\">nominal torque</td>
<td valign=\"top\">161.4</td><td valign=\"top\">Nm</td>
</tr>
<tr>
<td valign=\"top\">nominal speed</td>
<td valign=\"top\">1440.45</td><td valign=\"top\">rpm</td>
</tr>
<tr>
<td valign=\"top\">nominal mechanical output</td>
<td valign=\"top\">24.346</td><td valign=\"top\">kW</td>
</tr>
<tr>
<td valign=\"top\">efficiency</td>
<td valign=\"top\">92.7</td><td valign=\"top\">%</td>
</tr>
<tr>
<td valign=\"top\">power factor</td>
<td valign=\"top\">0.875</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator resistance</td>
<td valign=\"top\">0.03</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TsRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20s </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">rotor resistance</td>
<td valign=\"top\">0.04</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TrRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20r </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">stator reactance Xs</td>
<td valign=\"top\">3</td><td valign=\"top\">Ohm per phase</td>
</tr>
<tr>
<td valign=\"top\">rotor reactance Xr</td>
<td valign=\"top\">3</td><td valign=\"top\">Ohm</td>
</tr>
<tr>
<td valign=\"top\">total stray coefficient sigma</td>
<td valign=\"top\">0.0667</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator operational temperature TsOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">rotor operational temperature TrOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">These values give the following inductances:</td>
<td valign=\"top\"> </td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator stray inductance per phase</td>
<td valign=\"top\">Xs * (1 - sqrt(1-sigma))/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">rotor stray inductance</td>
<td valign=\"top\">Xr * (1 - sqrt(1-sigma))/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">main field inductance per phase</td>
<td valign=\"top\">sqrt(Xs*Xr * (1-sigma))/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
</table>
</HTML>"));
      end AIM_SquirrelCage;

      model AIM_SlipRing "Asynchronous induction machine with slipring rotor"
        extends
          Modelica_Electrical_Machines_Interfaces.PartialBasicInductionMachine(
          final idq_ss=airGapS.i_ss,
          final idq_sr=airGapS.i_sr,
          final idq_rs=airGapS.i_rs,
          final idq_rr=airGapS.i_rr,
          redeclare final
            Thermal.AsynchronousInductionMachines.ThermalAmbientAIMS
            thermalAmbient(final Tr=TrOperational, final mr=m),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMS
            thermalPort(final mr=m),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMS
            internalThermalPort(final mr=m),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.PowerBalanceAIMS
            powerBalance(
            final lossPowerRotorWinding=sum(rr.resistor.LossPower),
            final lossPowerRotorCore=rotorCore.lossPower,
            final lossPowerBrush=0,
            final powerRotor=SpacePhasors.Functions.activePower(vr, ir)),
          statorCore(final w=statorCoreParameters.wRef));

        Components.AirGapS airGapS(
          final p=p,
          final Lm=Lm,
          final m=m) annotation (Placement(transformation(
              origin={0,0},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        parameter Modelica_SIunits.Inductance Lm(start=3*sqrt(1 - 0.0667)/(2*pi
              *fsNominal)) "Stator main field inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrsigma(start=3*(1 - sqrt(1 -
              0.0667))/(2*pi*fsNominal))
          "Rotor stray inductance w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrzero=Lrsigma
          "Rotor zero sequence inductance w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Resistance Rr(start=0.04)
          "Rotor resistance per phase at TRef w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of rotor resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20r(start=0)
          "Temperature coefficient of rotor resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Boolean useTurnsRatio(start=true)
          "Use turnsRatio or calculate from locked-rotor voltage?";
        parameter Real turnsRatio(final min=Modelica_Constants.small, start=1)
          "Effective number of stator turns / effective number of rotor turns"
          annotation (Dialog(enable=useTurnsRatio));
        parameter Modelica_SIunits.Voltage VsNominal(start=100)
          "Nominal stator voltage per phase"
          annotation (Dialog(enable=not useTurnsRatio));
        parameter Modelica_SIunits.Voltage VrLockedRotor(start=100*(2*pi*
              fsNominal*Lm)/sqrt(Rs^2 + (2*pi*fsNominal*(Lm + Lssigma))^2))
          "Locked-rotor voltage per phase"
          annotation (Dialog(enable=not useTurnsRatio));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of rotor resistance" annotation (Dialog(
              group="Operational temperatures", enable=not useThermalPort));
        parameter Losses.CoreParameters rotorCoreParameters(
          final m=3,
          PRef=0,
          VRef(start=1) = 1,
          wRef(start=1) = 1)
          "Rotor core losses; all parameters refer to rotor side"
          annotation (Dialog(tab="Losses"));
        output Modelica_SIunits.Current i_0_r(stateSelect=StateSelect.prefer)=
             spacePhasorR.zero.i "Rotor zero-sequence current";
        output Modelica_SIunits.Voltage vr[m]=plug_rp.pin.v - plug_rn.pin.v
          "Rotor instantaneous voltages";
        output Modelica_SIunits.Current ir[m]=plug_rp.pin.i
          "Rotor instantaneous currents";
      protected
        final parameter Real internalTurnsRatio=if useTurnsRatio then
            turnsRatio else VsNominal/VrLockedRotor*(2*pi*fsNominal*Lm)/sqrt(Rs
            ^2 + (2*pi*fsNominal*(Lm + Lssigma))^2);
      public
        SpacePhasors.Components.SpacePhasor spacePhasorR(final turnsRatio=
              internalTurnsRatio) annotation (Placement(transformation(
              origin={-70,-50},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Modelica_Electrical_MultiPhase.Basic.Resistor rr(
          final m=m,
          final R=fill(Rr, m),
          final T_ref=fill(TrRef, m),
          final alpha=fill(Thermal.convertAlpha(alpha20r, TrRef), m),
          final useHeatPort=true,
          final T=fill(TrRef, m)) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-80,40})));
        Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_rp(final m=m)
          "Positive rotor plug" annotation (Placement(transformation(extent={{-110,
                  70},{-90,50}}, rotation=0)));
        Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_rn(final m=
              m) "Negative rotor plug" annotation (Placement(transformation(
                extent={{-110,-50},{-90,-70}}, rotation=0)));
        Components.Inductor lrsigma(final L=fill(internalTurnsRatio^2*Lrsigma,
              2)) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={20,-20})));
        Modelica_Electrical_Analog.Basic.Inductor lrzero(final L=
              internalTurnsRatio^2*Lrzero) annotation (Placement(transformation(
              extent={{10,10},{-10,-10}},
              rotation=90,
              origin={-50,-60})));
        Losses.InductionMachines.Core rotorCore(
          final coreParameters=rotorCoreParameters,
          final w=rotorCoreParameters.wRef,
          final useHeatPort=true,
          final turnsRatio=internalTurnsRatio) annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={0,-30})));
      equation
        connect(lssigma.spacePhasor_b, airGapS.spacePhasor_s) annotation (Line(
            points={{20,10},{10,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(lrsigma.spacePhasor_b, airGapS.spacePhasor_r) annotation (Line(
            points={{20,-10},{10,-10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(rr.plug_n, spacePhasorR.plug_p) annotation (Line(
            points={{-80,30},{-80,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(spacePhasorR.plug_n, plug_rn) annotation (Line(
            points={{-80,-60},{-100,-60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(spacePhasorR.zero, lrzero.p) annotation (Line(
            points={{-60,-50},{-50,-50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(spacePhasorR.ground, lrzero.n) annotation (Line(
            points={{-60,-60},{-60,-70},{-50,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(spacePhasorR.spacePhasor, lrsigma.spacePhasor_a) annotation (
            Line(
            points={{-60,-40},{-20,-40},{-20,-50},{20,-50},{20,-30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(rotorCore.spacePhasor, lrsigma.spacePhasor_a) annotation (Line(
            points={{10,-30},{20,-30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(rotorCore.heatPort, internalThermalPort.heatPortRotorCore)
          annotation (Line(
            points={{10,-40},{0,-40},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(rr.heatPort, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-70,40},{50,40},{50,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(plug_rp, rr.plug_p) annotation (Line(
            points={{-100,60},{-80,60},{-80,50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapS.flange, inertiaRotor.flange_a) annotation (Line(
            points={{10,0},{70,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(fixed.flange, internalSupport) annotation (Line(
            points={{50,-100},{60,-100}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(internalSupport, airGapS.support) annotation (Line(
            points={{60,-100},{60,-90},{-40,-90},{-40,0},{-10,0}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="aims",
          Documentation(info="<HTML>
<p><b>Model of a three phase asynchronous induction machine with slipring rotor.</b><br>
Resistance and stray inductance of stator and rotor are modeled directly in stator respectively rotor phases, then using space phasor transformation and a stator-fixed <i>AirGap</i> model. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>heat losses in the temperature dependent rotor winding resistances</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<p><b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">number of pole pairs p</td>
<td valign=\"top\">2</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">rotor's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
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
<td valign=\"top\">nominal torque</td>
<td valign=\"top\">161.4</td><td valign=\"top\">Nm</td>
</tr>
<tr>
<td valign=\"top\">nominal speed</td>
<td valign=\"top\">1440.45</td><td valign=\"top\">rpm</td>
</tr>
<tr>
<td valign=\"top\">nominal mechanical output</td>
<td valign=\"top\">24.346</td><td valign=\"top\">kW</td>
</tr>
<tr>
<td valign=\"top\">efficiency</td>
<td valign=\"top\">92.7</td><td valign=\"top\">%</td>
</tr>
<tr>
<td valign=\"top\">power factor</td>
<td valign=\"top\">0.875</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator resistance</td>
<td valign=\"top\">0.03</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TsRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20s </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">rotor resistance</td>
<td valign=\"top\">0.04</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TrRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20r </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">stator reactance Xs</td>
<td valign=\"top\">3</td><td valign=\"top\">Ohm per phase</td>
</tr>
<tr>
<td valign=\"top\">rotor reactance Xr</td>
<td valign=\"top\">3</td><td valign=\"top\">Ohm per phase</td>
</tr>
<tr>
<td valign=\"top\">total stray coefficient sigma</td>
<td valign=\"top\">0.0667</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">turnsRatio</td>
<td valign=\"top\">1</td><td valign=\"top\">effective ratio of stator and rotor current</td>
</tr>
<tr>
<td valign=\"top\">stator operational temperature TsOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">rotor operational temperature TrOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">These values give the following inductances:</td>
<td valign=\"top\"> </td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator stray inductance per phase</td>
<td valign=\"top\">Xs * (1 - sqrt(1-sigma))/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">rotor stray inductance</td>
<td valign=\"top\">Xr * (1 - sqrt(1-sigma))/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">main field inductance per phase</td>
<td valign=\"top\">sqrt(Xs*Xr * (1-sigma))/(2*pi*f)</td><td valign=\"top\"> </td>
</tr>
</table>
<p>
Parameter turnsRatio could be obtained from the following relationship
at standstill with open rotor circuit at nominal voltage and nominal frequency, <br>
using the locked-rotor voltage VR, no-load stator current I0 and powerfactor PF0:<br>
turnsRatio * <u>V</u><sub>R</sub> = <u>V</u><sub>s</sub> - (R<sub>s</sub> + j X<sub>s,sigma</sub>) <u>I</u><sub>0</sub>
</p>
</HTML>"),Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Line(points={{-100,50},{-100,20},{-60,
                20}}, color={0,0,255}),Line(points={{-100,-50},{-100,-20},{-60,
                -20}}, color={0,0,255})}));
      end AIM_SlipRing;
      annotation (Documentation(info="<HTML>
This package contains models of asynchronous induction machines, based on space phasor theory:
<ul>
<li>AIM_SquirrelCage: asynchronous induction machine with squirrel cage</li>
<li>AIM_SlipRing: asynchronous induction machine with wound rotor</li>
</ul>
These models use package SpacePhasors.
</HTML>", revisions="<HTML>
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
  <li> v1.02 2004/09/19 Anton Haumer</li>
  <li> v1.03 2004/09/24 Anton Haumer<br>
       consistent naming of inductors and resistors in machine models</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2  2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.3.2 2004/11/10 Anton Haumer<br>
       ReluctanceRotor moved to SynchronousMachines</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.6.3 2005/11/25 Anton Haumer<br>
       easier parameterization of SlipRing model</li>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"));
    end AsynchronousInductionMachines;

    package SynchronousInductionMachines
      "Models of synchronous induction machines"
      extends Modelica_Icons.VariantsPackage;
      model SM_PermanentMagnet "Permanent magnet synchronous induction machine"
        extends
          Modelica_Electrical_Machines_Interfaces.PartialBasicInductionMachine(
          Lssigma(start=0.1/(2*pi*fsNominal)),
          final idq_ss=airGapR.i_ss,
          final idq_sr=airGapR.i_sr,
          final idq_rs=airGapR.i_rs,
          final idq_rr=airGapR.i_rr,
          redeclare final
            Thermal.SynchronousInductionMachines.ThermalAmbientSMPM
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
            final lossPowerPermanentMagnet=permanentMagnet.lossPower),
          statorCore(final w=statorCoreParameters.wRef));
        Modelica_Blocks_Interfaces.RealOutput ir[2](
          start=zeros(2),
          each final quantity="ElectricCurrent",
          each final unit="A") if useDamperCage "Damper cage currents"
          annotation (Dialog(showStartAttribute=true));
        Modelica_Blocks_Interfaces.RealOutput idq_dr[2](
          each stateSelect=StateSelect.prefer,
          each final quantity="ElectricCurrent",
          each final unit="A") if useDamperCage
          "Damper space phasor current / rotor fixed frame";
        Components.AirGapR airGapR(
          final p=p,
          final Lmd=Lmd,
          final Lmq=Lmq,
          final m=m) annotation (Placement(transformation(
              origin={0,0},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        final parameter Modelica_SIunits.Temperature TpmOperational=293.15
          "Operational temperature of permanent magnet"
          annotation (Dialog(group="Operational temperatures"));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of (optional) damper cage" annotation (
            Dialog(group="Operational temperatures", enable=not useThermalPort
                 and useDamperCage));
        parameter Modelica_SIunits.Voltage VsOpenCircuit(start=112.3)
          "Open circuit RMS voltage per phase @ fsNominal";
        parameter Modelica_SIunits.Inductance Lmd(start=0.3/(2*pi*fsNominal))
          "Stator main field inductance in d-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lmq(start=0.3/(2*pi*fsNominal))
          "Stator main field inductance in q-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Boolean useDamperCage(start=true)
          "Enable / disable damper cage" annotation (Evaluate=true, Dialog(tab=
                "Nominal resistances and inductances", group="DamperCage"));
        parameter Modelica_SIunits.Inductance Lrsigmad(start=0.05/(2*pi*
              fsNominal)) "Damper stray inductance in d-axis" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
          "Damper stray inductance in q-axis" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrd(start=0.04)
          "Damper resistance in d-axis at TRef" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrq=Rrd
          "Damper resistance in q-axis at TRef" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20r(start=0)
          "Temperature coefficient of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Losses.PermanentMagnetLossParameters permanentMagnetLossParameters(IRef(
              start=100), wRef(start=2*pi*fsNominal/p))
          "Permanent magnet loss losses" annotation (Dialog(tab="Losses"));
        Components.PermanentMagnetWithLosses permanentMagnet(
          final Ie=Ie,
          final useHeatPort=true,
          final m=m,
          final permanentMagnetLossParameters=permanentMagnetLossParameters,
          final is=is) annotation (Placement(transformation(
              origin={30,-30},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Components.DamperCage damperCage(
          final Lrsigmad=Lrsigmad,
          final Lrsigmaq=Lrsigmaq,
          final Rrd=Rrd,
          final Rrq=Rrq,
          final T_ref=TrRef,
          final alpha=Thermal.convertAlpha(alpha20r, TrRef),
          final T=TrRef,
          final useHeatPort=true) if useDamperCage annotation (Placement(
              transformation(
              origin={0,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      protected
        final parameter Modelica_SIunits.Current Ie=sqrt(2)*VsOpenCircuit/(Lmd*
            2*pi*fsNominal) "Equivalent excitation current";
        Modelica_Blocks_Interfaces.RealOutput damperCageLossPower(final
            quantity="Power", final unit="W") "Damper losses";
      equation
        connect(ir, damperCage.i);
        connect(idq_dr, damperCage.i);
        connect(damperCageLossPower, damperCage.lossPower);
        if not useDamperCage then
          damperCageLossPower = 0;
        end if;
        connect(airGapR.spacePhasor_r, damperCage.spacePhasor_r)
          annotation (Line(points={{10,-10},{10,-30}}, color={0,0,255}));
        connect(airGapR.spacePhasor_r, permanentMagnet.spacePhasor_r)
          annotation (Line(points={{10,-10},{10,-20},{20,-20}}, color={0,0,255}));
        connect(airGapR.support, internalSupport) annotation (Line(
            points={{-10,0},{-40,0},{-40,-90},{60,-90},{60,-100}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(lssigma.spacePhasor_b, airGapR.spacePhasor_s) annotation (Line(
            points={{20,10},{10,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapR.flange, inertiaRotor.flange_a) annotation (Line(
            points={{10,0},{70,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(permanentMagnet.heatPort, internalThermalPort.heatPortPermanentMagnet)
          annotation (Line(
            points={{20,-40},{20,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(permanentMagnet.flange, inertiaRotor.flange_b) annotation (Line(
            points={{30,-20},{90,-20},{90,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(damperCage.heatPort, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-10,-40},{-10,-80},{0,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(internalSupport, permanentMagnet.support) annotation (Line(
            points={{60,-100},{60,-100},{60,-90},{30,-90},{30,-40},{30,-40}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="smpm",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Rectangle(
                      extent={{-130,10},{-100,-10}},
                      lineColor={0,0,0},
                      fillColor={0,255,0},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-100,10},{-70,-10}},
                      lineColor={0,0,0},
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid),Ellipse(extent={{-134,34},
                {-66,-34}}, lineColor={0,0,255})}),
          Documentation(info="<HTML>
<p><b>Model of a three phase permanent magnet synchronous induction machine.</b><br>
Resistance and stray inductance of stator is modeled directly in stator phases, then using space phasor transformation and a rotor-fixed <i>AirGap</i> model. Resistance and stray inductance of rotor's squirrel cage is modeled in two axis of the rotor-fixed coordinate system. Permanent magnet excitation is modelled by a constant equivalent excitation current feeding the d-axis. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>optional, when enabled: heat losses in the temperature dependent damper cage resistances</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
<li>permanent magnet losses</li>
</ul>

<p>Whether a damper cage is present or not, can be selected with Boolean parameter useDamperCage (default = true).
<br><b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">number of pole pairs p</td>
<td valign=\"top\">2</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">rotor's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
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
<td valign=\"top\">no-load voltage per phase</td>
<td valign=\"top\">112.3</td><td valign=\"top\">V RMS @ nominal speed</td>
</tr>
<tr>
<td valign=\"top\">nominal current per phase</td>
<td valign=\"top\">100</td><td valign=\"top\">A RMS</td>
</tr>
<tr>
<td valign=\"top\">nominal torque</td>
<td valign=\"top\">181.4</td><td valign=\"top\">Nm</td>
</tr>
<tr>
<td valign=\"top\">nominal speed</td>
<td valign=\"top\">1500</td><td valign=\"top\">rpm</td>
</tr>
<tr>
<td valign=\"top\">nominal mechanical output</td>
<td valign=\"top\">28.5</td><td valign=\"top\">kW</td>
</tr>
<tr>
<td valign=\"top\">nominal rotor angle</td>
<td valign=\"top\">20.75</td><td valign=\"top\">degree</td>
</tr>
<tr>
<td valign=\"top\">efficiency</td>
<td valign=\"top\">95.0</td><td valign=\"top\">%</td>
</tr>
<tr>
<td valign=\"top\">power factor</td>
<td valign=\"top\">0.98</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator resistance</td>
<td valign=\"top\">0.03</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TsRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20s </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">stator reactance Xd</td>
<td valign=\"top\">0.4</td><td valign=\"top\">Ohm per phase in d-axis</td>
</tr>
<tr>
<td valign=\"top\">stator reactance Xq</td>
<td valign=\"top\">0.4</td><td valign=\"top\">Ohm per phase in q-axis</td>
</tr>
<tr>
<td valign=\"top\">stator stray reactance Xss</td>
<td valign=\"top\">0.1</td><td valign=\"top\">Ohm per phase</td>
</tr>
<tr>
<td valign=\"top\">damper resistance in d-axis</td>
<td valign=\"top\">0.04</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">damper resistance in q-axis</td>
<td valign=\"top\">same as d-axis</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">reference temperature TrRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20r </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">damper stray reactance in d-axis XDds</td>
<td valign=\"top\">0.05</td><td valign=\"top\">Ohm</td>
</tr>
<tr>
<td valign=\"top\">damper stray reactance in q-axis XDqs</td>
<td valign=\"top\">same as d-axis</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator operational temperature TsOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">damper operational temperature TrOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">These values give the following inductances:</td>
<td valign=\"top\"> </td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">main field inductance in d-axis</td>
<td valign=\"top\">(Xd - Xss)/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">main field inductance in q-axis</td>
<td valign=\"top\">(Xq - Xss)/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator stray inductance per phase</td>
<td valign=\"top\">Xss/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">damper stray inductance in d-axis</td>
<td valign=\"top\">XDds/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">damper stray inductance in q-axis</td>
<td valign=\"top\">XDqs/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
</table>
</HTML>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        "Electrical excited synchronous induction machine with damper cage"
        extends
          Modelica_Electrical_Machines_Interfaces.PartialBasicInductionMachine(
          Lssigma(start=0.1/(2*pi*fsNominal)),
          final idq_ss=airGapR.i_ss,
          final idq_sr=airGapR.i_sr,
          final idq_rs=airGapR.i_rs,
          final idq_rr=airGapR.i_rr,
          redeclare final
            Thermal.SynchronousInductionMachines.ThermalAmbientSMEE
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
            final lossPowerExcitation=re.LossPower,
            final lossPowerBrush=brush.lossPower,
            final lossPowerRotorCore=0),
          statorCore(final w=statorCoreParameters.wRef));
        Modelica_Blocks_Interfaces.RealOutput ir[2](
          start=zeros(2),
          each final quantity="ElectricCurrent",
          each final unit="A") if useDamperCage "Damper cage currents"
          annotation (Dialog(showStartAttribute=true));
        Modelica_Blocks_Interfaces.RealOutput idq_dr[2](
          each stateSelect=StateSelect.prefer,
          each final quantity="ElectricCurrent",
          each final unit="A") if useDamperCage
          "Damper space phasor current / rotor fixed frame";
        Components.AirGapR airGapR(
          final p=p,
          final Lmd=Lmd,
          final Lmq=Lmq,
          final m=m) annotation (Placement(transformation(
              origin={0,0},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of (optional) damper cage" annotation (
            Dialog(group="Operational temperatures", enable=not useThermalPort
                 and useDamperCage));
        parameter Modelica_SIunits.Inductance Lmd(start=1.5/(2*pi*fsNominal))
          "Stator main field inductance in d-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lmq(start=1.5/(2*pi*fsNominal))
          "Stator main field inductance in q-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Boolean useDamperCage(start=true)
          "Enable / disable damper cage" annotation (Evaluate=true, Dialog(tab=
                "Nominal resistances and inductances", group="DamperCage"));
        parameter Modelica_SIunits.Inductance Lrsigmad(start=0.05/(2*pi*
              fsNominal)) "Damper stray inductance in d-axis" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
          "Damper stray inductance in q-axis" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrd(start=0.04)
          "Damper resistance in d-axis at TRef" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrq=Rrd
          "Damper resistance in q-axis at TRef" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20r(start=0)
          "Temperature coefficient of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Voltage VsNominal(start=100)
          "Nominal stator RMS voltage per phase"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Current IeOpenCircuit(start=10)
          "Open circuit excitation current @ nominal voltage and frequency"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Resistance Re(start=2.5)
          "Excitation resistance at TRef" annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeRef(start=293.15)
          "Reference temperature of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20e(start=0)
          "Temperature coefficient of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Real sigmae(
          min=0,
          max=0.99,
          start=0.025) "Stray fraction of total excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeOperational(start=293.15)
          "Operational excitation temperature" annotation (Dialog(group=
                "Operational temperatures", enable=not useThermalPort));
        parameter Losses.BrushParameters brushParameters "Brush losses"
          annotation (Dialog(tab="Losses"));
        output Modelica_SIunits.Voltage ve=pin_ep.v - pin_en.v
          "Excitation voltage";
        output Modelica_SIunits.Current ie=pin_ep.i "Excitation current";
        Components.DamperCage damperCage(
          final Lrsigmad=Lrsigmad,
          final Lrsigmaq=Lrsigmaq,
          final Rrd=Rrd,
          final Rrq=Rrq,
          final T_ref=TrRef,
          final alpha=Thermal.convertAlpha(alpha20r, TrRef),
          final T=TrRef,
          final useHeatPort=true) if useDamperCage annotation (Placement(
              transformation(
              origin={0,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Components.ElectricalExcitation electricalExcitation(final turnsRatio=
              turnsRatio) annotation (Placement(transformation(
              origin={-70,-50},
              extent={{-10,10},{10,-10}},
              rotation=180)));
        Modelica_Electrical_Analog.Basic.Resistor re(
          final R=Re,
          final T_ref=TeRef,
          final alpha=Thermal.convertAlpha(         alpha20e, TeRef),
          final useHeatPort=true,
          final T=TeRef) annotation (Placement(transformation(
              origin={-80,10},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Electrical_Analog.Basic.Inductor lesigma(final L=Lesigma)
          annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-80,-20})));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_ep
          "Positive excitation pin" annotation (Placement(transformation(extent
                ={{-110,70},{-90,50}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_en
          "Negative excitation pin" annotation (Placement(transformation(extent=
                 {{-90,-50},{-110,-70}}, rotation=0)));
        Losses.DCMachines.Brush brush(final brushParameters=brushParameters,
            final useHeatPort=true) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-80,40})));
      protected
        final parameter Real turnsRatio=sqrt(2)*VsNominal/(2*pi*fsNominal*Lmd*
            IeOpenCircuit) "Stator current / excitation current";
        final parameter Modelica_SIunits.Inductance Lesigma=Lmd*turnsRatio^2*3/
            2*sigmae/(1 - sigmae);
        Modelica_Blocks_Interfaces.RealOutput damperCageLossPower(final
            quantity="Power", final unit="W") "Damper losses";
      equation
        connect(ir, damperCage.i);
        connect(idq_dr, damperCage.i);
        connect(damperCageLossPower, damperCage.lossPower);
        if not useDamperCage then
          damperCageLossPower = 0;
        end if;
        connect(airGapR.spacePhasor_r, damperCage.spacePhasor_r)
          annotation (Line(points={{10,-10},{10,-30}}, color={0,0,255}));
        connect(airGapR.spacePhasor_r, electricalExcitation.spacePhasor_r)
          annotation (Line(points={{10,-10},{10,-10},{10,-20},{-60,-20},{-60,-40}},
              color={0,0,255}));
        connect(electricalExcitation.pin_en, pin_en) annotation (Line(
            points={{-80,-60},{-100,-60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pin_ep, brush.p) annotation (Line(
            points={{-100,60},{-80,60},{-80,50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(brush.n, re.p) annotation (Line(
            points={{-80,30},{-80,20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(re.n, lesigma.p) annotation (Line(
            points={{-80,0},{-80,-10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(lesigma.n, electricalExcitation.pin_ep) annotation (Line(
            points={{-80,-30},{-80,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(lssigma.spacePhasor_b, airGapR.spacePhasor_s) annotation (Line(
            points={{20,10},{10,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(brush.heatPort, internalThermalPort.heatPortBrush) annotation (
            Line(
            points={{-70,50},{-60,50},{-60,40},{50,40},{50,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(re.heatPort, internalThermalPort.heatPortExcitation)
          annotation (Line(
            points={{-70,10},{-60,10},{-60,40},{50,40},{50,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(airGapR.flange, inertiaRotor.flange_a) annotation (Line(
            points={{10,0},{70,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(airGapR.support, internalSupport) annotation (Line(
            points={{-10,0},{-26,0},{-40,0},{-40,-90},{60,-90},{60,-100}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(damperCage.heatPort, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-10,-40},{-10,-80},{0,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="smee",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(extent={{-134,34},{-66,-34}},
                lineColor={0,0,255}),Line(points={{-100,50},{-100,20},{-130,20},
                {-130,-4}}, color={0,0,255}),Line(points={{-130,-4},{-129,1},{-125,
                5},{-120,6},{-115,5},{-111,1},{-110,-4}}, color={0,0,255}),Line(
                points={{-110,-4},{-109,1},{-105,5},{-100,6},{-95,5},{-91,1},{-90,
                -4}}, color={0,0,255}),Line(points={{-90,-4},{-89,1},{-85,5},{-80,
                6},{-75,5},{-71,1},{-70,-4}}, color={0,0,255}),Line(points={{-100,
                -50},{-100,-20},{-70,-20},{-70,-2}}, color={0,0,255})}),
          Documentation(info="<HTML>
<p><b>Model of a three phase electrical excited synchronous induction machine with damper cage.</b><br>
Resistance and stray inductance of stator is modeled directly in stator phases, then using space phasor transformation and a rotor-fixed <i>AirGap</i> model. Resistance and stray inductance of rotor's squirrel cage is modeled in two axis of the rotor-fixed coordinate system. Electrical excitation is modelled by converting excitation current and voltage to d-axis space phasors. The machine models take the following loss effects into account:
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

<p>Whether a damper cage is present or not, can be selected with Boolean parameter useDamperCage (default = true).
<br><b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">number of pole pairs p</td>
<td valign=\"top\">2</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">rotor's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
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
<td valign=\"top\">no-load excitation current<br>
    @ nominal voltage and frequency</td>
<td valign=\"top\">10</td><td valign=\"top\">A DC</td>
</tr>
<tr>
<td valign=\"top\">warm excitation resistance</td>
<td valign=\"top\">2.5</td><td valign=\"top\">Ohm</td>
</tr>
<tr>
<td valign=\"top\">nominal current per phase</td>
<td valign=\"top\">100</td><td valign=\"top\">A RMS</td>
</tr>
<tr>
<td valign=\"top\">nominal apparent power</td>
<td valign=\"top\">-30000</td><td valign=\"top\">VA</td>
</tr>
<tr>
<td valign=\"top\">power factor</td>
<td valign=\"top\">-1.0</td><td valign=\"top\">ind./cap.</td>
</tr>
<tr>
<td valign=\"top\">nominal excitation current</td>
<td valign=\"top\">19</td><td valign=\"top\">A</td>
</tr>
<tr>
<td valign=\"top\">efficiency w/o excitation</td>
<td valign=\"top\">97.1</td><td valign=\"top\">%</td>
</tr>
<tr>
<td valign=\"top\">nominal torque</td>
<td valign=\"top\">-196.7</td><td valign=\"top\">Nm</td>
</tr>
<tr>
<td valign=\"top\">nominal speed</td>
<td valign=\"top\">1500</td><td valign=\"top\">rpm</td>
</tr>
<tr>
<td valign=\"top\">nominal rotor angle</td>
<td valign=\"top\">-57.23</td><td valign=\"top\">degree</td>
</tr>
<tr>
<td valign=\"top\">stator resistance</td>
<td valign=\"top\">0.03</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TsRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20s </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">stator reactance Xd</td>
<td valign=\"top\">1.6</td><td valign=\"top\">Ohm per phase in d-axis</td>
</tr>
<tr>
<td valign=\"top\">giving Kc</td>
<td valign=\"top\">0.625</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator reactance Xq</td>
<td valign=\"top\">1.6</td><td valign=\"top\">Ohm per phase in q-axis</td>
</tr>
<tr>
<td valign=\"top\">stator stray reactance Xss</td>
<td valign=\"top\">0.1</td><td valign=\"top\">Ohm per phase</td>
</tr>
<tr>
<td valign=\"top\">damper resistance in d-axis</td>
<td valign=\"top\">0.04</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">damper resistance in q-axis</td>
<td valign=\"top\">same as d-axis</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">reference temperature TrRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20r </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">damper stray reactance in d-axis XDds</td>
<td valign=\"top\">0.05</td><td valign=\"top\">Ohm</td>
</tr>
<tr>
<td valign=\"top\">damper stray reactance in q-axis XDqs</td>
<td valign=\"top\">same as d-axis</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">excitation resistance</td>
<td valign=\"top\">2.5</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TeRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20e </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">excitation stray inductance</td>
<td valign=\"top\">2.5</td><td valign=\"top\">% of total excitation inductance</td>
</tr>
<tr>
<td valign=\"top\">stator operational temperature TsOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">damper operational temperature TrOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">excitation operational temperature TeOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">These values give the following inductances:</td>
<td valign=\"top\"> </td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">main field inductance in d-axis</td>
<td valign=\"top\">(Xd - Xss)/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">main field inductance in q-axis</td>
<td valign=\"top\">(Xq - Xss)/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator stray inductance per phase</td>
<td valign=\"top\">Xss/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">damper stray inductance in d-axis</td>
<td valign=\"top\">XDds/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">damper stray inductance in q-axis</td>
<td valign=\"top\">XDqs/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
</table>
</HTML>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor
        "Synchronous induction machine with reluctance rotor and damper cage"
        extends
          Modelica_Electrical_Machines_Interfaces.PartialBasicInductionMachine(
          Lssigma(start=0.1/(2*pi*fsNominal)),
          final idq_ss=airGapR.i_ss,
          final idq_sr=airGapR.i_sr,
          final idq_rs=airGapR.i_rs,
          final idq_rr=airGapR.i_rr,
          redeclare final
            Thermal.SynchronousInductionMachines.ThermalAmbientSMR
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
              final lossPowerRotorCore=0),
          statorCore(final w=statorCoreParameters.wRef));
        Modelica_Blocks_Interfaces.RealOutput ir[2](
          start=zeros(2),
          each final quantity="ElectricCurrent",
          each final unit="A") if useDamperCage "Damper cage currents"
          annotation (Dialog(showStartAttribute=true));
        Modelica_Blocks_Interfaces.RealOutput idq_dr[2](
          each stateSelect=StateSelect.prefer,
          each final quantity="ElectricCurrent",
          each final unit="A") if useDamperCage
          "Damper space phasor current / rotor fixed frame";
        Components.AirGapR airGapR(
          final p=p,
          final Lmd=Lmd,
          final Lmq=Lmq,
          final m=m) annotation (Placement(transformation(
              origin={0,0},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        parameter Modelica_SIunits.Temperature TrOperational(start=293.15)
          "Operational temperature of (optional) damper cage" annotation (
            Dialog(group="Operational temperatures", enable=not useThermalPort
                 and useDamperCage));
        parameter Modelica_SIunits.Inductance Lmd(start=2.9/(2*pi*fsNominal))
          "Stator main field inductance in d-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lmq(start=0.9/(2*pi*fsNominal))
          "Stator main field inductance in q-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Boolean useDamperCage(start=true)
          "Enable / disable damper cage" annotation (Evaluate=true, Dialog(tab=
                "Nominal resistances and inductances", group="DamperCage"));
        parameter Modelica_SIunits.Inductance Lrsigmad(start=0.05/(2*pi*
              fsNominal)) "Damper stray inductance in d-axis" annotation (
            Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
          "Damper stray inductance in q-axis" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrd(start=0.04)
          "Damper resistance in d-axis at TRef" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrq=Rrd
          "Damper resistance in q-axis at TRef" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Temperature TrRef(start=293.15)
          "Reference temperature of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20r(start=0)
          "Temperature coefficient of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        Components.DamperCage damperCage(
          final Lrsigmad=Lrsigmad,
          final Lrsigmaq=Lrsigmaq,
          final Rrd=Rrd,
          final Rrq=Rrq,
          final T_ref=TrRef,
          final alpha=Thermal.convertAlpha(alpha20r, TrRef),
          final T=TrRef,
          final useHeatPort=true) if useDamperCage annotation (Placement(
              transformation(
              origin={0,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      protected
        Modelica_Blocks_Interfaces.RealOutput damperCageLossPower(final
            quantity="Power", final unit="W") "Damper losses";
      equation
        connect(ir, damperCage.i);
        connect(idq_dr, damperCage.i);
        connect(damperCageLossPower, damperCage.lossPower);
        if not useDamperCage then
          damperCageLossPower = 0;
        end if;
        connect(airGapR.spacePhasor_r, damperCage.spacePhasor_r) annotation (
            Line(points={{10,-10},{10,-15},{10,-30}}, color={0,0,255}));
        connect(airGapR.support, internalSupport) annotation (Line(
            points={{-10,0},{-40,0},{-40,-90},{60,-90},{60,-100}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(lssigma.spacePhasor_b, airGapR.spacePhasor_s) annotation (Line(
            points={{20,10},{10,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapR.flange, inertiaRotor.flange_a) annotation (Line(
            points={{10,0},{70,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(damperCage.heatPort, internalThermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-10,-40},{-10,-60},{-10,-60},{-10,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="smr",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Rectangle(
                      extent={{-130,10},{-100,-10}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-100,10},{-70,-10}},
                      lineColor={0,0,0},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(extent={{-134,34},
                {-66,-34}}, lineColor={0,0,255})}),
          Documentation(info="<HTML>
<p><b>Model of a three phase synchronous induction machine with reluctance rotor and damper cage.</b><br>
Resistance and stray inductance of stator is modeled directly in stator phases, then using space phasor transformation. Resistance and stray inductance of rotor's squirrel cage is modeled in two axis of the rotor-fixed coordinate system. Both together connected via a rotor-fixed <i>AirGap</i> model. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent stator winding resistances</li>
<li>optional, when enabled: heat losses in the temperature dependent damper cage resistances</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<p>Whether a damper cage is present or not, can be selected with Boolean parameter useDamperCage (default = true).
<br><b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">number of pole pairs p</td>
<td valign=\"top\">2</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">rotor's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
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
<td valign=\"top\">50</td><td valign=\"top\">A RMS</td>
</tr>
<tr>
<td valign=\"top\">nominal torque</td>
<td valign=\"top\"> 46</td><td valign=\"top\">Nm</td>
</tr>
<tr>
<td valign=\"top\">nominal speed</td>
<td valign=\"top\">1500</td><td valign=\"top\">rpm</td>
</tr>
<tr>
<td valign=\"top\">nominal mechanical output</td>
<td valign=\"top\"> 7.23</td><td valign=\"top\">kW</td>
</tr>
<tr>
<td valign=\"top\">efficiency</td>
<td valign=\"top\">96.98</td><td valign=\"top\">%</td>
</tr>
<tr>
<td valign=\"top\">power factor</td>
<td valign=\"top\">0.497</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator resistance</td>
<td valign=\"top\">0.03</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TsRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20s </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">rotor resistance in d-axis</td>
<td valign=\"top\">0.04</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">rotor resistance in q-axis</td>
<td valign=\"top\">same as d-axis</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">reference temperature TrRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20r </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">stator reactance Xsd in d-axis</td>
<td valign=\"top\">3</td><td valign=\"top\">Ohm per phase</td>
</tr>
<tr>
<td valign=\"top\">stator reactance Xsq in q-axis</td>
<td valign=\"top\">1</td><td valign=\"top\">Ohm</td>
</tr>
<tr>
<td valign=\"top\">stator stray reactance Xss</td>
<td valign=\"top\">0.1</td><td valign=\"top\">Ohm per phase</td>
</tr>
<tr>
<td valign=\"top\">rotor stray reactance in d-axis Xrds</td>
<td valign=\"top\">0.05</td><td valign=\"top\">Ohm per phase</td>
</tr>
<tr>
<td valign=\"top\">rotor stray reactance in q-axis Xrqs</td>
<td valign=\"top\">same as d-axis</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator operational temperature TsOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">damper operational temperature TrOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">These values give the following inductances:</td>
<td valign=\"top\"> </td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">stator stray inductance per phase</td>
<td valign=\"top\">Xss/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">rotor stray inductance in d-axis</td>
<td valign=\"top\">Xrds/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">rotor stray inductance in q-axis</td>
<td valign=\"top\">Xrqs/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">main field inductance per phase in d-axis</td>
<td valign=\"top\">(Xsd-Xss)/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">main field inductance per phase in q-axis</td>
<td valign=\"top\">(Xsq-Xss)/(2*pi*fNominal)</td><td valign=\"top\"> </td>
</tr>
</table>
</HTML>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end SM_ReluctanceRotor;
      annotation (Documentation(info="<HTML>
This package contains models of synchronous induction machines, based on space phasor theory:
<ul>
<li>SM_PermanentMagnet: synchronous induction machine with permanent magnet excitation, with damper cage</li>
<li>SM_ElectricalExcited: synchronous induction machine with electrical excitation
    and damper cage</li>
<li>SM_ReluctanceRotor: induction machine with reluctance rotor and damper cage<br>
i.e., a squirrel cage rotor with magnetic poles due to different airgap width</li>
</ul>
These models use package SpacePhasors.
<br><b>Please keep in mind:</b><br>
<ul>
<li>We keep the same reference system as for motors, i.e.:<br>
    Positive RotorDisplacementAngle means acting as motor,<br>
    with positive electric power consumption and positive mechanical power output.
<li>ElectricalAngle = p * MechanicalAngle</li>
<li>real axis = d-axis<br>
    imaginary= q-axis</li>
<li>Voltage induced by the magnet wheel (d-axis) is located in the q-axis.</li>
</ul>
</HTML>", revisions="<HTML>
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
  <li> v1.02  2004/09/19 Anton Haumer</li>
  <li> v1.03  2004/09/24 Anton Haumer<br>
       consistent naming of inductors and resistors in machine models</li>
  <li> v1.1   2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2   2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.3.2 2004/11/10 Anton Haumer<br>
       ReluctanceRotor moved to SynchronousMachines</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.52  2005/10/12 Anton Haumer<br>
       added SM_ElectricalExcited</li>
  <li> v1.53  2005/10/14 Anton Haumer<br>
       introduced unsymmetrical DamperCage for Synchronous Machines</li>
  <li> v1.6.2 2005/10/23 Anton Haumer<br>
       selectable DamperCage for Synchronous Machines</li>
  <li> v1.7.1 2006/02/06 Anton Haumer<br>
       changed some naming of synchronous machines, not affecting existing models</li>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"));
    end SynchronousInductionMachines;

    package DCMachines "Models of DC machines"
      extends Modelica_Icons.VariantsPackage;
      model DC_PermanentMagnet "Permanent magnet DC machine"
        extends Modelica_Electrical_Machines_Interfaces.PartialBasicDCMachine(
          final ViNominal=VaNominal - Thermal.convertResistance(
                    Ra,
                    TaRef,
                    alpha20a,
                    TaNominal)*IaNominal - Losses.DCMachines.brushVoltageDrop(
              brushParameters, IaNominal),
          final psi_eNominal=Lme*IeNominal,
          redeclare final Thermal.DCMachines.ThermalAmbientDCPM thermalAmbient(
              final Tpm=TpmOperational),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCPM
            thermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCPM
            internalThermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.PowerBalanceDCPM
            powerBalance(final lossPowerPermanentMagnet=0),
          core(final w=airGapDC.w));
        final parameter Modelica_SIunits.Temperature TpmOperational=293.15
          "Operational temperature of permanent magnet"
          annotation (Dialog(group="Operational temperatures"));
        Components.AirGapDC airGapDC(
          final turnsRatio=turnsRatio,
          final Le=Lme,
          final quasiStationary=quasiStationary) annotation (Placement(
              transformation(
              origin={0,0},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_Analog.Basic.Ground eGround annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-30})));
        Modelica_Electrical_Analog.Sources.ConstantCurrent ie(I=IeNominal)
          annotation (Placement(transformation(
              origin={0,-40},
              extent={{-10,-10},{10,10}},
              rotation=0)));
      protected
        constant Modelica_SIunits.Inductance Lme=1
          "Field excitation inductance";
        constant Modelica_SIunits.Current IeNominal=1
          "Equivalent excitation current";
      equation
        connect(eGround.p, ie.p) annotation (Line(points={{-10,-30},{-10,-30},{
                -10,-40}}, color={0,0,255}));
        connect(airGapDC.pin_ep, ie.n)
          annotation (Line(points={{10,-10},{10,-40}}, color={0,0,255}));
        connect(airGapDC.pin_en, eGround.p) annotation (Line(points={{-10,-10},
                {-10,-20},{-10,-30}}, color={0,0,255}));
        connect(airGapDC.pin_ap, la.n) annotation (Line(
            points={{10,10},{10,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.support, internalSupport) annotation (Line(
            points={{-10,0},{-40,0},{-40,-90},{60,-90},{60,-100}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(airGapDC.flange, inertiaRotor.flange_a) annotation (Line(
            points={{10,0},{36,0},{36,0},{70,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(airGapDC.pin_an, brush.p) annotation (Line(
            points={{-10,10},{-10,60}},
            color={0,0,255},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="dcpm",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Rectangle(
                      extent={{-130,10},{-100,-10}},
                      lineColor={0,0,0},
                      fillColor={0,255,0},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-100,10},{-70,-10}},
                      lineColor={0,0,0},
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid)}),
          Documentation(info="<HTML>
<p><b>Model of a DC Machine with permanent magnets.</b><br>
Armature resistance and inductance are modeled directly after the armature pins, then using a <i>AirGapDC</i> model. Permanent magnet excitation is modelled by a constant equivalent excitation current feeding AirGapDC. The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent armature winding resistance</li>
<li>brush losses in the armature circuit</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<p>No saturation is modelled.
<br><b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">stator's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">rotor's moment of inertia</td>
<td valign=\"top\">0.15</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">nominal armature voltage</td>
<td valign=\"top\">100</td><td valign=\"top\">V</td>
</tr>
<tr>
<td valign=\"top\">nominal armature current</td>
<td valign=\"top\">100</td><td valign=\"top\">A</td>
</tr>
<tr>
<td valign=\"top\">nominal speed</td>
<td valign=\"top\">1425</td><td valign=\"top\">rpm</td>
</tr>
<tr>
<td valign=\"top\">nominal torque</td>
<td valign=\"top\">63.66</td><td valign=\"top\">Nm</td>
</tr>
<tr>
<td valign=\"top\">nominal mechanical output</td>
<td valign=\"top\">9.5</td><td valign=\"top\">kW</td>
</tr>
<tr>
<td valign=\"top\">efficiency</td>
<td valign=\"top\">95.0</td><td valign=\"top\">%</td>
</tr>
<tr>
<td valign=\"top\">armature resistance</td>
<td valign=\"top\">0.05</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TaRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20a </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">armature inductance</td>
<td valign=\"top\">0.0015</td><td valign=\"top\">H</td>
</tr>
<tr>
<td valign=\"top\">armature nominal temperature TaNominal</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">armature operational temperature TaOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
</table>
Armature resistance resp. inductance include resistance resp. inductance of commutating pole winding and compensation winding, if present.
</HTML>"));
      end DC_PermanentMagnet;

      model DC_ElectricalExcited
        "Electrical shunt/separate excited linear DC machine"
        extends Modelica_Electrical_Machines_Interfaces.PartialBasicDCMachine(
          final ViNominal=VaNominal - Thermal.convertResistance(
                    Ra,
                    TaRef,
                    alpha20a,
                    TaNominal)*IaNominal - Losses.DCMachines.brushVoltageDrop(
              brushParameters, IaNominal),
          final psi_eNominal=Lme*IeNominal,
          redeclare final Thermal.DCMachines.ThermalAmbientDCEE thermalAmbient(
              final Te=TeOperational),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCEE
            thermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCEE
            internalThermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.PowerBalanceDCEE
            powerBalance(final powerExcitation=ve*ie, final lossPowerExcitation=
               re.LossPower),
          core(final w=airGapDC.w));

        parameter Modelica_SIunits.Current IeNominal(start=1)
          "Nominal excitation current" annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Resistance Re(start=100)
          "Field excitation resistance at TRef"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeRef(start=293.15)
          "Reference temperature of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20e(start=0)
          "Temperature coefficient of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Inductance Le(start=1)
          "Total field excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Real sigmae(
          min=0,
          max=0.99,
          start=0) "Stray fraction of total excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeOperational(start=293.15)
          "Operational (shunt) excitation temperature" annotation (Dialog(group=
               "Operational temperatures", enable=not useThermalPort));
        output Modelica_SIunits.Voltage ve=pin_ep.v - pin_en.v
          "Field excitation voltage";
        output Modelica_SIunits.Current ie(start=0) = pin_ep.i
          "Field excitation current";
        Components.AirGapDC airGapDC(
          final turnsRatio=turnsRatio,
          final Le=Lme,
          final quasiStationary=quasiStationary) annotation (Placement(
              transformation(
              origin={0,0},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
        Components.CompoundDCExcitation compoundDCExcitation(final
            excitationTurnsRatio=1)
          annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
        Modelica_Electrical_Analog.Basic.Ground groundSE
          annotation (Placement(transformation(extent={{-30,-50},{-10,-30}})));
        Modelica_Electrical_Analog.Basic.Resistor re(
          final R=Re,
          final T_ref=TeRef,
          final alpha=Thermal.convertAlpha(         alpha20e, TeRef),
          final useHeatPort=true,
          final T=TeRef) annotation (Placement(transformation(
              origin={-80,50},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Components.InductorDC lesigma(final L=Lesigma, final quasiStationary=
              quasiStationary) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,20})));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_ep
          "Positive excitation pin" annotation (Placement(transformation(extent=
                 {{-110,70},{-90,50}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_en
          "Negative excitation pin" annotation (Placement(transformation(extent=
                 {{-90,-50},{-110,-70}}, rotation=0)));
      protected
        final parameter Modelica_SIunits.Inductance Lme=Le*(1 - sigmae)
          "Main part of excitation inductance";
        final parameter Modelica_SIunits.Inductance Lesigma=Le*sigmae
          "Stray part of excitation inductance" annotation (Evaluate=true);
      equation
        connect(airGapDC.pin_ap, la.n) annotation (Line(
            points={{10,10},{10,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.support, internalSupport) annotation (Line(
            points={{-10,0},{-40,0},{-40,-90},{60,-90},{60,-100}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(airGapDC.flange, inertiaRotor.flange_a) annotation (Line(
            points={{10,0},{35,0},{35,0},{70,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(re.p, pin_ep) annotation (Line(
            points={{-80,60},{-100,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(re.n, lesigma.p) annotation (Line(
            points={{-80,40},{-80,30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(ground.p, airGapDC.pin_en) annotation (Line(
            points={{-20,-10},{-10,-10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.pin_en, compoundDCExcitation.pin_n) annotation (Line(
            points={{-10,-10},{-10,-10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.pin_ep, compoundDCExcitation.pin_p) annotation (Line(
            points={{10,-10},{10,-10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(groundSE.p, compoundDCExcitation.pin_sen) annotation (Line(
            points={{-20,-30},{-10,-30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pin_en, compoundDCExcitation.pin_en) annotation (Line(
            points={{-100,-60},{2,-60},{2,-30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(compoundDCExcitation.pin_ep, lesigma.n) annotation (Line(
            points={{10,-29.8},{10,-40},{-80,-40},{-80,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.pin_an, brush.p) annotation (Line(
            points={{-10,10},{-10,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(re.heatPort, internalThermalPort.heatPortExcitation)
          annotation (Line(
            points={{-70,50},{-60,50},{-60,40},{50,40},{50,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="dcee",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Line(points={{-130,-4},{-129,1},{-125,5},
                {-120,6},{-115,5},{-111,1},{-110,-4}}, color={0,0,255}),Line(
                points={{-110,-4},{-109,1},{-105,5},{-100,6},{-95,5},{-91,1},{-90,
                -4}}, color={0,0,255}),Line(points={{-90,-4},{-89,1},{-85,5},{-80,
                6},{-75,5},{-71,1},{-70,-4}}, color={0,0,255}),Line(points={{-100,
                -50},{-100,-20},{-70,-20},{-70,-2}}, color={0,0,255}),Line(
                points={{-100,50},{-100,20},{-130,20},{-130,-4}}, color={0,0,
                255})}),
          Documentation(info="<HTML>
<p><b>Model of a DC Machine with electrical shunt or separate excitation.</b><br>
Armature resistance and inductance are modeled directly after the armature pins, then using a <i>AirGapDC</i> model.<br>
The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent armature winding resistance</li>
<li>heat losses in the temperature dependent excitation winding resistance</li>
<li>brush losses in the armature circuit</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<p>No saturation is modelled.<br>
Shunt or separate excitation is defined by the user's external circuit.
<br><b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">stator's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">rotor's moment of inertia</td>
<td valign=\"top\">0.15</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">nominal armature voltage</td>
<td valign=\"top\">100</td><td valign=\"top\">V</td>
</tr>
<tr>
<td valign=\"top\">nominal armature current</td>
<td valign=\"top\">100</td><td valign=\"top\">A</td>
</tr>
<tr>
<td valign=\"top\">nominal torque</td>
<td valign=\"top\">63.66</td><td valign=\"top\">Nm</td>
</tr>
<tr>
<td valign=\"top\">nominal speed</td>
<td valign=\"top\">1425</td><td valign=\"top\">rpm</td>
</tr>
<tr>
<td valign=\"top\">nominal mechanical output</td>
<td valign=\"top\">9.5</td><td valign=\"top\">kW</td>
</tr>
<tr>
<td valign=\"top\">efficiency</td>
<td valign=\"top\">95.0</td><td valign=\"top\">% only armature</td>
</tr>
<tr>
<td valign=\"top\">efficiency</td>
<td valign=\"top\">94.06</td><td valign=\"top\">% including excitation</td>
</tr>
<tr>
<td valign=\"top\">armature resistance</td>
<td valign=\"top\">0.05</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TaRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20a </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">armature inductance</td>
<td valign=\"top\">0.0015</td><td valign=\"top\">H</td>
</tr>
<tr>
<td valign=\"top\">nominal excitation voltage</td>
<td valign=\"top\">100</td><td valign=\"top\">V</td>
</tr>
<tr>
<td valign=\"top\">nominal excitation current</td>
<td valign=\"top\">1</td><td valign=\"top\">A</td>
</tr>
<tr>
<td valign=\"top\">excitation resistance</td>
<td valign=\"top\">100</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TeRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20e </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">excitation inductance</td>
<td valign=\"top\">1</td><td valign=\"top\">H</td>
</tr>
<tr>
<td valign=\"top\">stray part of excitation inductance</td>
<td valign=\"top\">0</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">armature nominal temperature TaNominal</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">armature operational temperature TaOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">(shunt) excitation operational temperature TeOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
</table>
Armature resistance resp. inductance include resistance resp. inductance of commutating pole winding and
compensation winding, if present.<br>
Armature current does not cover excitation current of a shunt excitation; in this case total current drawn from the grid = armature current + excitation current.
</HTML>"));
      end DC_ElectricalExcited;

      model DC_SeriesExcited "Series excited linear DC machine"
        extends Modelica_Electrical_Machines_Interfaces.PartialBasicDCMachine(
          wNominal(start=1410*2*pi/60),
          final ViNominal=VaNominal - (Thermal.convertResistance(
                    Ra,
                    TaRef,
                    alpha20a,
                    TaNominal) + Thermal.convertResistance(
                    Re,
                    TeRef,
                    alpha20e,
                    TeNominal))*IaNominal - Losses.DCMachines.brushVoltageDrop(
              brushParameters, IaNominal),
          final psi_eNominal=Lme*abs(IaNominal),
          redeclare final Thermal.DCMachines.ThermalAmbientDCSE thermalAmbient(
              final Tse=TeOperational),
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCSE
            thermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCSE
            internalThermalPort,
          redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.PowerBalanceDCSE
            powerBalance(final powerSeriesExcitation=ve*ie, final
              lossPowerSeriesExcitation=re.LossPower),
          core(final w=airGapDC.w));
        parameter Modelica_SIunits.Resistance Re(start=0.01)
          "Series excitation resistance at TRef"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeRef(start=293.15)
          "Reference temperature of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20e(start=0)
          "Temperature coefficient of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Inductance Le(start=0.0005)
          "Total field excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Real sigmae(
          min=0,
          max=0.99,
          start=0) "Stray fraction of total excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeNominal(start=293.15)
          "Nominal series excitation temperature"
          annotation (Dialog(tab="Nominal parameters"));
        parameter Modelica_SIunits.Temperature TeOperational(start=293.15)
          "Operational series excitation temperature" annotation (Dialog(group=
                "Operational temperatures", enable=not useThermalPort));
        output Modelica_SIunits.Voltage ve=pin_ep.v - pin_en.v
          "Field excitation voltage";
        output Modelica_SIunits.Current ie=pin_ep.i "Field excitation current";
        Components.AirGapDC airGapDC(
          final turnsRatio=turnsRatio,
          final Le=Lme,
          final quasiStationary=quasiStationary) annotation (Placement(
              transformation(
              origin={0,0},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Components.CompoundDCExcitation compoundDCExcitation(final
            excitationTurnsRatio=1)
          annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
        Modelica_Electrical_Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
        Modelica_Electrical_Analog.Basic.Ground groundE
          annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
        Modelica_Electrical_Analog.Basic.Resistor re(
          final R=Re,
          final T_ref=TeRef,
          final alpha=Thermal.convertAlpha(         alpha20e, TeRef),
          final useHeatPort=true,
          final T=TeRef) annotation (Placement(transformation(
              origin={-80,50},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Components.InductorDC lesigma(final L=Lesigma, final quasiStationary=
              quasiStationary) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,20})));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_ep
          "Positive series excitation pin" annotation (Placement(transformation(
                extent={{-110,70},{-90,50}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_en
          "Negative series excitation pin" annotation (Placement(transformation(
                extent={{-90,-50},{-110,-70}}, rotation=0)));
      protected
        final parameter Modelica_SIunits.Inductance Lme=Le*(1 - sigmae)
          "Main part of excitation inductance";
        final parameter Modelica_SIunits.Inductance Lesigma=Le*sigmae
          "Stray part of excitation inductance" annotation (Evaluate=true);
      equation
        connect(airGapDC.pin_ap, la.n) annotation (Line(
            points={{10,10},{10,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.support, internalSupport) annotation (Line(
            points={{-10,0},{-40,0},{-40,-90},{60,-90},{60,-100}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(airGapDC.flange, inertiaRotor.flange_a) annotation (Line(
            points={{10,0},{70,0},{70,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(pin_ep, re.p) annotation (Line(
            points={{-100,60},{-80,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(re.n, lesigma.p) annotation (Line(
            points={{-80,40},{-80,30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.pin_en, compoundDCExcitation.pin_n) annotation (Line(
            points={{-10,-10},{-10,-10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(compoundDCExcitation.pin_p, airGapDC.pin_ep) annotation (Line(
            points={{10,-10},{10,-10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.pin_en, ground.p) annotation (Line(
            points={{-10,-10},{-20,-10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(compoundDCExcitation.pin_sen, pin_en) annotation (Line(
            points={{-10,-30},{-10,-60},{-100,-60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(compoundDCExcitation.pin_sep, lesigma.n) annotation (Line(
            points={{-2,-30},{-2,-40},{-80,-40},{-80,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(compoundDCExcitation.pin_en, groundE.p) annotation (Line(
            points={{2,-30},{2,-40},{10,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(airGapDC.pin_an, brush.p) annotation (Line(
            points={{-10,10},{-10,60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(re.heatPort, internalThermalPort.heatPortSeriesExcitation)
          annotation (Line(
            points={{-70,50},{-60,50},{-60,40},{50,40},{50,-80},{0,-80}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (
          defaultComponentName="dcse",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Line(points={{-100,-10},{-105,-9},{-109,
                -5},{-110,0},{-109,5},{-105,9},{-100,10}}, color={0,0,255}),
                Line(points={{-100,-30},{-105,-29},{-109,-25},{-110,-20},{-109,
                -15},{-105,-11},{-100,-10}}, color={0,0,255}),Line(points={{-100,
                10},{-105,11},{-109,15},{-110,20},{-109,25},{-105,29},{-100,30}},
                color={0,0,255}),Line(points={{-100,50},{-100,30}}, color={0,0,
                255}),Line(points={{-100,-30},{-100,-50}}, color={0,0,255})}),
          Documentation(info="<HTML>
<p><b>Model of a DC Machine with series excitation.</b><br>
Armature resistance and inductance are modeled directly after the armature pins, then using a <i>AirGapDC</i> model.<br>
The machine models take the following loss effects into account:
</p>

<ul>
<li>heat losses in the temperature dependent armature winding resistance</li>
<li>heat losses in the temperature dependent excitation winding resistance</li>
<li>brush losses in the armature circuit</li>
<li>friction losses</li>
<li>core losses (only eddy current losses, no hysteresis losses)</li>
<li>stray load losses</li>
</ul>

<p>No saturation is modelled.<br>
Series excitation has to be connected by the user's external circuit.
<br><b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">stator's moment of inertia</td>
<td valign=\"top\">0.29</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">rotor's moment of inertia</td>
<td valign=\"top\">0.15</td><td valign=\"top\">kg.m2</td>
</tr>
<tr>
<td valign=\"top\">nominal armature voltage</td>
<td valign=\"top\">100</td><td valign=\"top\">V</td>
</tr>
<tr>
<td valign=\"top\">nominal armature current</td>
<td valign=\"top\">100</td><td valign=\"top\">A</td>
</tr>
<tr>
<td valign=\"top\">nominal torque</td>
<td valign=\"top\">63.66</td><td valign=\"top\">Nm</td>
</tr>
<tr>
<td valign=\"top\">nominal speed</td>
<td valign=\"top\">1410</td><td valign=\"top\">rpm</td>
</tr>
<tr>
<td valign=\"top\">nominal mechanical output</td>
<td valign=\"top\">9.4</td><td valign=\"top\">kW</td>
</tr>
<tr>
<td valign=\"top\">efficiency</td>
<td valign=\"top\">94.0</td><td valign=\"top\">% only armature</td>
</tr>
<tr>
<td valign=\"top\">armature resistance</td>
<td valign=\"top\">0.05</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TaRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20a </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">armature inductance</td>
<td valign=\"top\">0.0015</td><td valign=\"top\">H</td>
</tr>
<tr>
<td valign=\"top\">excitation resistance</td>
<td valign=\"top\">0.01</td><td valign=\"top\">Ohm at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature TeRef</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20e</td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">excitation inductance</td>
<td valign=\"top\">0.0005</td><td valign=\"top\">H</td>
</tr>
<tr>
<td valign=\"top\">stray part of excitation inductance</td>
<td valign=\"top\">0</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">armature nominal temperature TaNominal</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">series excitation nominal temperature TeNominal</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">armature operational temperature TaOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">series excitation operational temperature TeOperational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
</table>
Armature resistance resp. inductance include resistance resp. inductance of commutating pole winding and
compensation winding, if present.<br>
Parameter nominal armature voltage includes voltage drop of series excitation;<br>
but for output the voltage is split into:<br>
va = armature voltage without voltage drop of series excitation<br>
ve = voltage drop of series excitation
</HTML>"));
      end DC_SeriesExcited;
      annotation (Documentation(info="<HTML>
This package contains models of DC machines:
<ul>
<li>DC_PermanentMagnet: DC machine with permanent magnet excitation</li>
<li>DC_ElectricalExcited: DC machine with electrical shunt or separate excitation</li>
<li>DC_SeriesExcited: DC machine with series excitation</li>
</ul>
</html>", revisions="<HTML>
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
  <li> v1.02 2004/09/19 Anton Haumer</li>
  <li> v1.03 2004/09/24 Anton Haumer<br>
       added DC machine with series excitation</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2  2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"));
    end DCMachines;

    package QuasiStationaryDCMachines "Models of quasistationary DC machines"
      extends Modelica_Icons.VariantsPackage;
      model DC_PermanentMagnet "Quasistationary permanent magnet DC machine"
        extends DCMachines.DC_PermanentMagnet(final quasiStationary=true);
        extends Icons.QuasiStationaryMachine;
        annotation (defaultComponentName="dcpm", Documentation(info="<HTML>
<b>Quasistaionary model of a DC Machine with permanent magnets.</b><br>
This model is fully compatible with the
<a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet\">transient machine model of a DC machine with permanent magnets</a>;
the only difference is that electrical transients are neglected.
</HTML>"));
      end DC_PermanentMagnet;

      model DC_ElectricalExcited
        "Quasistationary electrical shunt/separate excited linear DC machine"
        extends DCMachines.DC_ElectricalExcited(final quasiStationary=true);
        extends Icons.QuasiStationaryMachine;
        annotation (defaultComponentName="dcee", Documentation(info="<HTML>
<b>Quasistaionary model of a DC Machine with electrical shunt or separate excitation.</b><br>
This model is fully compatible with the
<a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_ElectricalExcited\">transient machine model of a DC machine with electrical shunt or separate excitation</a>;
the only difference is that electrical transients are neglected.
</HTML>"));
      end DC_ElectricalExcited;

      model DC_SeriesExcited "Quasistationary series excited linear DC machine"
        extends DCMachines.DC_SeriesExcited(final quasiStationary=true);
        extends Icons.QuasiStationaryMachine;
        annotation (defaultComponentName="dcse", Documentation(info="<HTML>
<b>Quasistaionary model of a DC Machine with Series excitation.</b><br>
This model is fully compatible with the
<a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited\">transient machine model of a DC machine with with series excitation</a>;
the only difference is that electrical transients are neglected.
</HTML>"));
      end DC_SeriesExcited;
      annotation (Documentation(info="<HTML>
<p>
This package contains quasistationary models of DC machines;
these models are fully compatible with the
<a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.DCMachines\">transient machine models of DC machines</a>;
the only difference is that electrical transients are neglected.
</p>
<h4>Please note:</h4>
<p>
Quasistationary DC machine models are basically different from quasistationary induction machine models:
Quasistaionary DC machine models neglect electrical transients, i.e., setting <code>der(i) = 0</code>,
whereas quasistationary induction machine models are based on time phasor theory,
see <a href=\"modelica://Modelica.Electrical.QuasiStationary\">QuasiStationary Library</a>,
where e.g., <code>L*der(i)</code> is replaced by <code>j*omega*L*(I_re+j*I_im)</code>.
</p>
</html>", revisions="<HTML>
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
  <li> v2.3.0 2010/02/16 Anton Haumer<br>
       first implementation</li>
  </ul>
</HTML>"));
    end QuasiStationaryDCMachines;

    package Transformers "Library for technical 3phase transformers"
      extends Modelica_Icons.Package;
      package Yy "Transformers: primary Y / secondary y"
        extends Modelica_Icons.VariantsPackage;
        model Yy00 "Transformer Yy0"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yy00");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, l2sigma.plug_n) annotation (Line(points={{10,10},
                  {10,20},{50,20},{50,0}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy0
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yy00;

        model Yy02 "Transformer Yy2"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yy02");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{50,-30},{30,-10}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot2.plug_p)
            annotation (Line(points={{50,0},{50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3) annotation (Line(points={{10,4},{
                  10,-4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n3, Rot2.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                  {20,10},{20,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy2
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yy02;

        model Yy04 "Transformer Yy4"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yy04");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{30,10},{50,30}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(Rot2.plug_n, l2sigma.plug_n)
            annotation (Line(points={{50,20},{50,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, Rot2.plug_p) annotation (Line(points={{10,10},{
                  10,20},{30,20}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy4
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yy04;

        model Yy06 "Transformer Yy6"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yy06");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(l2sigma.plug_n, core.plug_n3) annotation (Line(points={{50,0},
                  {50,-20},{10,-20},{10,-10}}, color={0,0,255}));
          connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                  {20,10},{20,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy6
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yy06;

        model Yy08 "Transformer Yy8"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yy08");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{50,10},{30,30}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(Rot2.plug_p, l2sigma.plug_n)
            annotation (Line(points={{50,20},{50,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, Rot2.plug_n) annotation (Line(points={{10,10},{
                  10,20},{30,20}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy8
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yy08;

        model Yy10 "Transformer Yy10"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yy10");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{30,-30},{50,-10}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot2.plug_n)
            annotation (Line(points={{50,0},{50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, Rot2.plug_p) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                  {20,10},{20,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yy10
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yy10;
        annotation (Documentation(info="<HTML>
This package contains transformers primary Y connected / secondary y connected in all possible vector groups.
</HTML>", revisions="<HTML>
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
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yd01");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{50,-30},{30,-10}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(Delta2.plug_p, r2.plug_p) annotation (Line(points={{50,-20},{
                  90,-20},{90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, Delta2.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          connect(core.plug_p2, l2sigma.plug_n) annotation (Line(points={{10,10},
                  {10,20},{50,20},{50,0}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd1
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yd01;

        model Yd03 "Transformer Yd3"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yd03");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{30,10},{50,30}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{50,-30},{30,-10}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(Delta2.plug_n, r2.plug_p) annotation (Line(points={{50,20},{70,20},
                  {70,0}},        color={0,0,255}));
          connect(l2sigma.plug_n, Rot2.plug_p)
            annotation (Line(points={{70,0},{70,-10},{50,-10},{50,-20}},
                                                       color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, Delta2.plug_p) annotation (Line(points={{10,10},
                  {10,20},{30,20}}, color={0,0,255}));
          connect(core.plug_n3, Rot2.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd3
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yd03;

        model Yd05 "Transformer Yd5"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yd05");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{30,10},{50,30}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(Delta2.plug_n, r2.plug_p) annotation (Line(points={{50,20},{
                  90,20},{90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, l2sigma.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{50,-20},{50,0}}, color={0,0,255}));
          connect(core.plug_p2, Delta2.plug_p) annotation (Line(points={{10,10},
                  {10,20},{30,20}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd5
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yd05;

        model Yd07 "Transformer Yd7"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yd07");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{50,10},{30,30}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(Delta2.plug_p, r2.plug_p) annotation (Line(points={{50,20},{
                  90,20},{90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, Delta2.plug_n) annotation (Line(points={{10,10},
                  {10,20},{30,20}}, color={0,0,255}));
          connect(l2sigma.plug_n, core.plug_n3) annotation (Line(points={{50,0},
                  {50,-20},{10,-20},{10,-10}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd7
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yd07;

        model Yd09 "Transformer Yd9"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yd09");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{30,-30},{50,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{50,10},{30,30}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(Rot2.plug_p, l2sigma.plug_n)
            annotation (Line(points={{50,20},{50,0}}, color={0,0,255}));
          connect(Delta2.plug_n, r2.plug_p) annotation (Line(points={{50,-20},{
                  90,-20},{90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, Rot2.plug_n) annotation (Line(points={{10,10},{
                  10,20},{30,20}}, color={0,0,255}));
          connect(core.plug_n3, Delta2.plug_p) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd9
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yd09;

        model Yd11 "Transformer Yd11"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yd11");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{30,-30},{50,-10}},
                  rotation=0)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(Delta2.plug_n, r2.plug_p) annotation (Line(points={{50,-20},{
                  90,-20},{90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, Delta2.plug_p) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          connect(core.plug_p2, l2sigma.plug_n) annotation (Line(points={{10,10},
                  {10,20},{50,20},{50,0}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yd11
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yd11;
        annotation (Documentation(info="<HTML>
This package contains transformers primary Y connected / secondary d connected in all possible vector groups.
</HTML>", revisions="<HTML>
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
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yz01");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{-10,10},{10,-10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot22(final m=m)
            annotation (Placement(transformation(
                origin={40,20},
                extent={{-10,10},{10,-10}},
                rotation=180)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_n)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot22.plug_p)
            annotation (Line(points={{50,0},{50,20}}, color={0,0,255}));
          connect(Rot22.plug_n, core.plug_n2) annotation (Line(points={{30,20},
                  {20,20},{20,4},{10,4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz1
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yz01;

        model Yz03 "Transformer Yz3"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yz03");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{10,-10},{-10,10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot22(final m=m)
            annotation (Placement(transformation(
                origin={40,20},
                extent={{-10,10},{10,-10}},
                rotation=180)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_p)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot22.plug_p)
            annotation (Line(points={{50,0},{50,20}}, color={0,0,255}));
          connect(Rot22.plug_n, core.plug_n2) annotation (Line(points={{30,20},
                  {20,20},{20,4},{10,4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz3
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yz03;

        model Yz05 "Transformer Yz5"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yz05");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{-10,10},{10,-10}},
                rotation=90)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_n)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-40},{10,-70},{10,-70}}, color={0,0,255}));
          connect(l2sigma.plug_n, core.plug_n2) annotation (Line(points={{50,0},
                  {50,20},{20,20},{20,4},{10,4}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz5
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yz05;

        model Yz07 "Transformer Yz7"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yz07");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{10,-10},{-10,10}},
                rotation=90)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_p)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(l2sigma.plug_n, core.plug_n2) annotation (Line(points={{50,0},
                  {50,20},{20,20},{20,4},{10,4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-40},{10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz7
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yz07;

        model Yz09 "Transformer Yz9"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yz09");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{-10,10},{10,-10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot22(final m=m)
            annotation (Placement(transformation(
                origin={40,20},
                extent={{10,10},{-10,-10}},
                rotation=180)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_n)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot22.plug_n) annotation (Line(points={{50,0},
                  {50,20},{50,20}}, color={0,0,255}));
          connect(Rot22.plug_p, core.plug_n2) annotation (Line(points={{30,20},
                  {20,20},{20,4},{10,4}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz9
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yz09;

        model Yz11 "Transformer Yz11"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Yz11");
          Modelica_Electrical_MultiPhase.Basic.Star star1(final m=m)
            annotation (Placement(transformation(
                origin={-10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint1
            annotation (Placement(transformation(extent={{-60,-110},{-40,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{10,-10},{-10,10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot22(final m=m)
            annotation (Placement(transformation(
                origin={40,20},
                extent={{10,10},{-10,-10}},
                rotation=180)));
        equation
          connect(star1.pin_n, starpoint1) annotation (Line(points={{-10,-90},{
                  -10,-100},{-50,-100}}, color={0,0,255}));
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, star1.plug_p) annotation (Line(points={{-10,-5},
                  {-10,-37.5},{-10,-70},{-10,-70}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_p)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot22.plug_n)
            annotation (Line(points={{50,0},{50,20}}, color={0,0,255}));
          connect(Rot22.plug_p, core.plug_n2) annotation (Line(points={{30,20},
                  {20,20},{20,4},{10,4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Yz11
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Yz11;
        annotation (Documentation(info="<HTML>
This package contains transformers primary Y connected / secondary zig-zag connected in all possible vector groups.
</HTML>", revisions="<HTML>
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
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dy01");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{50,-30},{30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot2.plug_p)
            annotation (Line(points={{50,0},{50,-20}}, color={0,0,255}));
          connect(Delta1.plug_p, r1.plug_p) annotation (Line(points={{-50,-20},
                  {-90,-20},{-90,0}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, Rot2.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                  {20,10},{20,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy1
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dy01;

        model Dy03 "Transformer Dy3"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dy03");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{30,10},{50,30}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(Rot2.plug_n, l2sigma.plug_n)
            annotation (Line(points={{50,20},{50,0}}, color={0,0,255}));
          connect(Delta1.plug_p, r1.plug_p) annotation (Line(points={{-50,-20},
                  {-90,-20},{-90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_p2, Rot2.plug_p) annotation (Line(points={{10,10},{
                  10,20},{30,20}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-40},{10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy3
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dy03;

        model Dy05 "Transformer Dy5"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dy05");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(Delta1.plug_p, r1.plug_p) annotation (Line(points={{-50,-20},
                  {-90,-20},{-90,0}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(l2sigma.plug_n, core.plug_n3) annotation (Line(points={{50,0},
                  {50,-20},{10,-20},{10,-10}}, color={0,0,255}));
          connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                  {20,10},{20,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy5
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dy05;

        model Dy07 "Transformer Dy7"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dy07");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{50,10},{30,30}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(Rot2.plug_p, l2sigma.plug_n)
            annotation (Line(points={{50,20},{50,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-40},{10,-70},{10,-70}}, color={0,0,255}));
          connect(core.plug_p2, Rot2.plug_n) annotation (Line(points={{10,10},{
                  10,20},{30,20}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy7
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dy07;

        model Dy09 "Transformer Dy9"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dy09");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{30,-30},{50,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot2.plug_n)
            annotation (Line(points={{50,0},{50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, Rot2.plug_p) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          connect(core.plug_p2, star2.plug_p) annotation (Line(points={{10,10},
                  {20,10},{20,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy9
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dy09;

        model Dy11 "Transformer Dy11"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dy11");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-40},{10,-70},{10,-70}}, color={0,0,255}));
          connect(core.plug_p2, l2sigma.plug_n) annotation (Line(points={{10,10},
                  {10,20},{50,20},{50,0}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dy11
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dy11;
        annotation (Documentation(info="<HTML>
This package contains transformers primary D connected / secondary y connected in all possible vector groups.
</HTML>", revisions="<HTML>
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
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dd00");
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{50,-30},{30,-10}},
                  rotation=0)));
        equation
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(Delta2.plug_p, r2.plug_p) annotation (Line(points={{50,-20},{
                  90,-20},{90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, l2sigma.plug_n) annotation (Line(points={{10,10},
                  {10,20},{50,20},{50,0}}, color={0,0,255}));
          connect(core.plug_n3, Delta2.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd0
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dd00;

        model Dd02 "Transformer Dd2"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dd02");
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{30,10},{50,30}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{50,-30},{30,-10}},
                  rotation=0)));
        equation
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(Delta2.plug_n, r2.plug_p) annotation (Line(points={{50,20},{
                  90,20},{90,0}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot2.plug_p)
            annotation (Line(points={{50,0},{50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, Delta2.plug_p) annotation (Line(points={{10,10},
                  {10,20},{30,20}}, color={0,0,255}));
          connect(core.plug_n3, Rot2.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd2
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dd02;

        model Dd04 "Transformer Dd4"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dd04");
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{30,10},{50,30}},
                  rotation=0)));
        equation
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(Delta2.plug_n, r2.plug_p) annotation (Line(points={{50,20},{
                  90,20},{90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3) annotation (Line(points={{10,4},{
                  10,1},{10,1},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, Delta2.plug_p) annotation (Line(points={{10,10},
                  {10,20},{30,20}}, color={0,0,255}));
          connect(core.plug_n3, l2sigma.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{50,-20},{50,0}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd4
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dd04;

        model Dd06 "Transformer Dd6"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dd06");
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{50,10},{30,30}},
                  rotation=0)));
        equation
          connect(Delta2.plug_p, r2.plug_p) annotation (Line(points={{50,20},{
                  90,20},{90,0}}, color={0,0,255}));
          connect(Delta1.plug_p, r1.plug_p) annotation (Line(points={{-50,-20},
                  {-90,-20},{-90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(Delta2.plug_n, core.plug_p2) annotation (Line(points={{30,20},
                  {10,20},{10,10}}, color={0,0,255}));
          connect(core.plug_n3, l2sigma.plug_n) annotation (Line(points={{10,-10},
                  {10,-20},{50,-20},{50,0}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd6
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dd06;

        model Dd08 "Transformer Dd8"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dd08");
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot2(final m=m)
            annotation (Placement(transformation(extent={{50,10},{30,30}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{30,-30},{50,-10}},
                  rotation=0)));
        equation
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(Delta2.plug_n, r2.plug_p) annotation (Line(points={{50,-20},{
                  90,-20},{90,0}}, color={0,0,255}));
          connect(Rot2.plug_p, l2sigma.plug_n)
            annotation (Line(points={{50,20},{50,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(core.plug_n1, Delta1.plug_n) annotation (Line(points={{-10,-5},
                  {-10,-20},{-30,-20}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, Rot2.plug_n) annotation (Line(points={{10,10},{
                  10,20},{30,20}}, color={0,0,255}));
          connect(core.plug_n3, Delta2.plug_p) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd8
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dd08;

        model Dd10 "Transformer Dd10"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dd10");
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta2(final m=m)
            annotation (Placement(transformation(extent={{30,-30},{50,-10}},
                  rotation=0)));
        equation
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(Delta2.plug_n, r2.plug_p) annotation (Line(points={{50,-20},{
                  90,-20},{90,0}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_n2, core.plug_p3)
            annotation (Line(points={{10,4},{10,-4}}, color={0,0,255}));
          connect(core.plug_p2, l2sigma.plug_n) annotation (Line(points={{10,10},
                  {10,20},{50,20},{50,0}}, color={0,0,255}));
          connect(core.plug_n3, Delta2.plug_p) annotation (Line(points={{10,-10},
                  {10,-20},{30,-20}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dd10
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dd10;
        annotation (Documentation(info="<HTML>
This package contains transformers primary D connected / secondary d connected in all possible vector groups.
</HTML>", revisions="<HTML>
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
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dz00");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{-10,10},{10,-10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot22(final m=m)
            annotation (Placement(transformation(
                origin={40,20},
                extent={{-10,10},{10,-10}},
                rotation=180)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_n)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot22.plug_p)
            annotation (Line(points={{50,0},{50,20}}, color={0,0,255}));
          connect(Rot22.plug_n, core.plug_n2) annotation (Line(points={{30,20},
                  {20,20},{20,4},{10,4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz0
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dz00;

        model Dz02 "Transformer Dz2"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dz02");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{10,-10},{-10,10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot22(final m=m)
            annotation (Placement(transformation(
                origin={40,20},
                extent={{-10,10},{10,-10}},
                rotation=180)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_p)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot22.plug_p)
            annotation (Line(points={{50,0},{50,20}}, color={0,0,255}));
          connect(Rot22.plug_n, core.plug_n2) annotation (Line(points={{30,20},
                  {20,20},{20,4},{10,4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-40},{10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz2
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dz02;

        model Dz04 "Transformer Dz4"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dz04");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{-10,10},{10,-10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_n)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(l2sigma.plug_n, core.plug_n2) annotation (Line(points={{50,0},
                  {50,20},{20,20},{20,4},{10,4}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz4
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dz04;

        model Dz06 "Transformer Dz6"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dz06");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{10,-10},{-10,10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_p)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-40},{10,-70},{10,-70}}, color={0,0,255}));
          connect(l2sigma.plug_n, core.plug_n2) annotation (Line(points={{50,0},
                  {50,20},{20,20},{20,4},{10,4}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz6
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dz06;

        model Dz08 "Transformer Dz8"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dz08");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{-10,10},{10,-10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot22(final m=m)
            annotation (Placement(transformation(
                origin={40,20},
                extent={{10,10},{-10,-10}},
                rotation=180)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_n)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_p) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot22.plug_n) annotation (Line(points={{50,0},
                  {50,20},{50,20}}, color={0,0,255}));
          connect(Rot22.plug_p, core.plug_n2) annotation (Line(points={{30,20},
                  {20,20},{20,4},{10,4}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz8
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dz08;

        model Dz10 "Transformer Dz10"
          extends
            Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer(
                                                     final VectorGroup="Dz10");
          Modelica_Electrical_MultiPhase.Basic.Star star2(final m=m)
            annotation (Placement(transformation(
                origin={10,-80},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica_Electrical_Analog_Interfaces.NegativePin starpoint2
            annotation (Placement(transformation(extent={{40,-110},{60,-90}},
                  rotation=0)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot21(final m=m)
            annotation (Placement(transformation(
                origin={30,0},
                extent={{10,-10},{-10,10}},
                rotation=90)));
          Modelica_Electrical_MultiPhase.Basic.Delta Rot22(final m=m)
            annotation (Placement(transformation(
                origin={40,20},
                extent={{10,10},{-10,-10}},
                rotation=180)));
          Modelica_Electrical_MultiPhase.Basic.Delta Delta1(final m=m)
            annotation (Placement(transformation(extent={{-50,-30},{-30,-10}},
                  rotation=0)));
        equation
          connect(star2.pin_n, starpoint2) annotation (Line(points={{10,-90},{
                  10,-100},{50,-100}}, color={0,0,255}));
          connect(r1.plug_p, Delta1.plug_p) annotation (Line(points={{-90,0},{-90,
                  -20},{-50,-20}}, color={0,0,255}));
          connect(l1sigma.plug_n, core.plug_p1) annotation (Line(points={{-50,0},
                  {-50,20},{-10,20},{-10,5}}, color={0,0,255}));
          connect(Delta1.plug_n, core.plug_n1) annotation (Line(points={{-30,-20},
                  {-10,-20},{-10,-5}}, color={0,0,255}));
          connect(core.plug_p2, Rot21.plug_p)
            annotation (Line(points={{10,10},{30,10}}, color={0,0,255}));
          connect(core.plug_p3, Rot21.plug_n) annotation (Line(points={{10,-4},
                  {20,-4},{20,-10},{30,-10}}, color={0,0,255}));
          connect(core.plug_n3, star2.plug_p) annotation (Line(points={{10,-10},
                  {10,-70},{10,-70}}, color={0,0,255}));
          connect(l2sigma.plug_n, Rot22.plug_n)
            annotation (Line(points={{50,0},{50,20}}, color={0,0,255}));
          connect(Rot22.plug_p, core.plug_n2) annotation (Line(points={{30,20},
                  {20,20},{20,4},{10,4}}, color={0,0,255}));
          annotation (defaultComponentName="transformer", Documentation(info="<html>
Transformer Dz10
<br>Typical parameters see:
<a href=\"modelica://Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer\">PartialBasicTransformer</a>
</html>"));
        end Dz10;
        annotation (Documentation(info="<HTML>
This package contains transformers primary D connected / secondary d connected in all possible vector groups.
</HTML>", revisions="<HTML>
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
</HTML>", revisions="<HTML>
  <ul>
  <li> v1.0.0 2006/11/19 Anton Haumer<br>
       first stable release</li>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
              Polygon(
                  origin={10,10},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder,
                  points={{-80,50},{-60,30},{-60,-50},{-80,-70},{-80,50}}),
              Polygon(
                  origin={10,10},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder,
                  points={{60,50},{40,30},{40,-50},{60,-70},{60,50}}),Polygon(
                  origin={10,10},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder,
                  points={{-10,40},{-20,30},{-20,-50},{-10,-60},{0,-50},{0,30},
                {-10,40}}),Polygon(
                  origin={10,10},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder,
                  points={{-80,50},{60,50},{40,30},{0,30},{-10,40},{-20,30},{-60,
                30},{-80,50}}),Polygon(
                  origin={10,10},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder,
                  points={{-80,-70},{60,-70},{40,-50},{0,-50},{-10,-60},{-20,-50},
                {-60,-50},{-80,-70}}),Rectangle(
                  origin={10,10},
                  lineColor={128,0,255},
                  fillColor={128,0,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  extent={{-88,-46},{-52,26}}),Rectangle(
                  origin={10,10},
                  lineColor={0,128,255},
                  fillColor={0,128,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  extent={{-94,-38},{-46,18}}),Rectangle(
                  origin={10,10},
                  lineColor={128,0,255},
                  fillColor={128,0,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  extent={{-28,-46},{8,26}}),Rectangle(
                  origin={10,10},
                  lineColor={0,128,255},
                  fillColor={0,128,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  extent={{-34,-38},{14,18}}),Rectangle(
                  origin={10,10},
                  lineColor={128,0,255},
                  fillColor={128,0,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  extent={{32,-46},{68,26}}),Rectangle(
                  origin={10,10},
                  lineColor={0,128,255},
                  fillColor={0,128,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  extent={{26,-38},{74,18}})}));
    end Transformers;

    package Components "Machine components like AirGaps"
      extends Modelica_Icons.Package;
      partial model PartialAirGap "Partial airgap model"
        parameter Integer m=3 "Number of phases";
        parameter Integer p(min=1) "Number of pole pairs";
        output Modelica_SIunits.Torque tauElectrical;
        Modelica_SIunits.Angle gamma "Rotor displacement angle";
        Modelica_SIunits.Current i_ss[2]
          "Stator current space phasor with respect to the stator fixed frame";
        Modelica_SIunits.Current i_sr[2]
          "Stator current space phasor with respect to the rotor fixed frame";
        Modelica_SIunits.Current i_rs[2]
          "Rotor current space phasor with respect to the stator fixed frame";
        Modelica_SIunits.Current i_rr[2]
          "Rotor current space phasor with respect to the rotor fixed frame";
        Modelica_SIunits.MagneticFlux psi_ms[2]
          "Magnetizing flux phasor with respect to the stator fixed frame";
        Modelica_SIunits.MagneticFlux psi_mr[2]
          "Magnetizing flux phasor with respect to the rotor fixed frame";
        Real RotationMatrix[2, 2] "Matrix of rotation from rotor to stator";
      public
        Modelica_Mechanics_Rotational_Interfaces.Flange_a flange annotation (
            Placement(transformation(extent={{-10,110},{10,90}}, rotation=0)));
        Modelica_Mechanics_Rotational_Interfaces.Flange_a support
          "Support at which the reaction torque is acting" annotation (
            Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_s
          annotation (Placement(transformation(extent={{-110,90},{-90,110}},
                rotation=0)));
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_r
          annotation (Placement(transformation(extent={{90,90},{110,110}},
                rotation=0)));
        /*
  Modelica.SIunits.AngularVelocity omegaPsi_ms
    "Angular velocity of main flux with respect to the stator fixed frame";
  Modelica.SIunits.AngularVelocity omegaPsi_mr
    "Angular velocity of main flux with respect to the rotor fixed frame";
  Modelica.SIunits.Current i_sm[2]
    "Stator current space phasor with respect to the main flux fixed frame";
  Modelica.SIunits.Current i_rm[2]
    "Rotor current space phasor with respect to the main flux fixed frame";
protected
  Modelica.SIunits.MagneticFlux psi_msAbs "Length of main flux phasor";
  Modelica.SIunits.Angle psi_msArg
    "(Wrapped) angle of main flux phasor with respect to the stator fixed frame";
  Modelica.SIunits.Angle psi_mrArg
    "(Wrapped) angle of main flux phasor with respect to the rotor fixed frame";
initial equation
  i_sm = Machines.SpacePhasors.Functions.Rotator(i_ss, psi_msArg);
  i_rm = Machines.SpacePhasors.Functions.Rotator(i_rr, psi_mrArg);
equation
  // AngularVelocity of main flux phasor
  (psi_msAbs, psi_msArg) = Machines.SpacePhasors.Functions.ToPolar(psi_ms);
  psi_mrArg = psi_msArg - gamma;
  omegaPsi_ms = if noEvent(psi_msAbs<Modelica.Constants.small) then 0 else
    (spacePhasor_s.v_[2]*cos(psi_msArg) - spacePhasor_s.v_[1]*sin(psi_msArg))/psi_msAbs;
  omegaPsi_mr = omegaPsi_ms - der(gamma);
  // stator and rotor current w.r.t. main flux fixed frame
  der(i_sm) = Machines.SpacePhasors.Functions.Rotator(
    {der(i_ss[1]) + omegaPsi_ms*i_ss[2], der(i_ss[2]) - omegaPsi_ms*i_ss[1]}, psi_msArg);
  der(i_rm) = Machines.SpacePhasors.Functions.Rotator(
    {der(i_rr[1]) + omegaPsi_mr*i_rr[2], der(i_rr[2]) - omegaPsi_mr*i_rr[1]}, psi_mrArg);
*/
      equation
        // mechanical angle of the rotor of an equivalent 2-pole machine
        gamma = p*(flange.phi - support.phi);
        RotationMatrix = {{+cos(gamma),-sin(gamma)},{+sin(gamma),+cos(gamma)}};
        i_ss = spacePhasor_s.i_;
        i_ss = RotationMatrix*i_sr;
        i_rr = spacePhasor_r.i_;
        i_rs = RotationMatrix*i_rr;
        // Stator voltage induction
        spacePhasor_s.v_ = der(psi_ms);
        // Rotor voltage induction
        spacePhasor_r.v_ = der(psi_mr);
        // Electromechanical torque (cross product of current and flux space phasor)
        tauElectrical = m/2*p*(spacePhasor_s.i_[2]*psi_ms[1] - spacePhasor_s.i_[
          1]*psi_ms[2]);
        flange.tau = -tauElectrical;
        support.tau = tauElectrical;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
                      extent={{-90,90},{90,-92}},
                      lineColor={0,0,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(extent={{-80,80},{
                80,-80}}, lineColor={0,0,255}),Rectangle(
                      extent={{-10,90},{10,-80}},
                      lineColor={0,0,0},
                      fillPattern=FillPattern.VerticalCylinder,
                      fillColor={128,128,128}),Text(
                      extent={{-150,-90},{150,-150}},
                      lineColor={0,0,255},
                      textString="%name")}), Documentation(info="<HTML>
Partial model of the airgap, using only equations.
</HTML>"));
      end PartialAirGap;

      model AirGapS "Airgap in stator-fixed coordinate system"
        parameter Modelica_SIunits.Inductance Lm "Main field inductance";
        extends PartialAirGap;
        Modelica_SIunits.Current i_ms[2]
          "Magnetizing current space phasor with respect to the stator fixed frame";
      protected
        parameter Modelica_SIunits.Inductance L[2, 2]={{Lm,0},{0,Lm}}
          "Inductance matrix";
      equation
        // Magnetizing current with respect to the stator reference frame
        i_ms = i_ss + i_rs;
        // Magnetizing flux linkage with respect to the stator reference frame
        psi_ms = L*i_ms;
        // Magnetizing flux linkage with respect to the rotor reference frame
        psi_mr = transpose(RotationMatrix)*psi_ms;
        annotation (
          defaultComponentName="airGap",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Text(
                      extent={{-80,40},{0,-40}},
                      lineColor={0,0,0},
                      textString="S"),Text(
                      extent={{-150,-90},{150,-150}},
                      lineColor={0,0,255},
                      textString="%name")}),
          Documentation(info="<HTML>
Model of the airgap in stator-fixed coordinate system, using only equations.
</HTML>"));
      end AirGapS;

      model AirGapR "Airgap in rotor-fixed coordinate system"
        parameter Modelica_SIunits.Inductance Lmd
          "Main field inductance d-axis";
        parameter Modelica_SIunits.Inductance Lmq
          "Main field inductance q-axis";
        extends PartialAirGap;
        Modelica_SIunits.Current i_mr[2]
          "Magnetizing current space phasor with respect to the rotor fixed frame";
      protected
        parameter Modelica_SIunits.Inductance L[2, 2]={{Lmd,0},{0,Lmq}}
          "Inductance matrix";
      equation
        // Magnetizing current with respect to the rotor reference frame
        i_mr = i_sr + i_rr;
        // Main flux linkage with respect to the rotor reference frame
        psi_mr = L*i_mr;
        // Main flux linkage with respect to the stator reference frame
        psi_ms = RotationMatrix*psi_mr;
        annotation (
          defaultComponentName="airGap",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Text(
                      extent={{0,40},{80,-40}},
                      lineColor={0,0,0},
                      textString="R"),Text(
                      extent={{-150,-90},{150,-150}},
                      lineColor={0,0,255},
                      textString="%name")}),
          Documentation(info="<HTML>
Model of the airgap in rotor-fixed coordinate system, using only equations.
</HTML>"));
      end AirGapR;

      model Inductor "Space phasor inductor"
        parameter Modelica_SIunits.Inductance L[2] "Inductance of both axes";
        Modelica_SIunits.Voltage v_[2];
        Modelica_SIunits.Current i_[2];
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_a
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0)));
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_b
          annotation (Placement(transformation(extent={{90,-10},{110,10}},
                rotation=0)));
      equation
        spacePhasor_a.i_ + spacePhasor_b.i_ = zeros(2);
        v_ = spacePhasor_a.v_ - spacePhasor_b.v_;
        i_ = spacePhasor_a.i_;
        v_[1] = L[1]*der(i_[1]);
        v_[2] = L[2]*der(i_[2]);
        annotation (Documentation(info="<html>
This is a model of an inductor, described with space phasors.
</html>"),Icon(graphics={Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,
                255}),Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
                Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),Ellipse(
                extent={{30,-15},{60,15}}, lineColor={0,0,255}),Rectangle(
                      extent={{-60,-30},{60,0}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(
                      points={{-60,0},{-90,0}},
                      color={0,0,255},
                      smooth=Smooth.None),Line(
                      points={{90,0},{60,0}},
                      color={0,0,255},
                      smooth=Smooth.None),Text(
                      extent={{-100,100},{100,60}},
                      lineColor={0,0,255},
                      textString="%name")}));
      end Inductor;

      model SquirrelCage "Squirrel Cage"
        parameter Modelica_SIunits.Inductance Lrsigma
          "Rotor stray inductance per phase translated to stator";
        parameter Modelica_SIunits.Resistance Rr
          "Rotor resistance per phase translated to stator at T_ref";
        parameter Modelica_SIunits.Temperature T_ref=293.15
          "Reference temperature";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
          "Temperature coefficient of resistance at T_ref";
        extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=
              T_ref);
        Modelica_SIunits.Resistance Rr_actual
          "Actual resistance = Rr*(1 + alpha*(T_heatPort - T_ref))";
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_r
          annotation (Placement(transformation(extent={{-110,90},{-90,110}},
                rotation=0)));
       Modelica_Blocks_Interfaces.RealOutput i[2](
          each final quantity="ElectricCurrent",
          each final unit="A") = -spacePhasor_r.i_
          "Currents out from squirrel cage";
      equation
        assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
          "Temperature outside scope of model!");
        Rr_actual = Rr*(1 + alpha*(T_heatPort - T_ref));
        spacePhasor_r.v_ = Rr_actual*spacePhasor_r.i_ + Lrsigma*der(
          spacePhasor_r.i_);
        2/3*LossPower = Rr_actual*(spacePhasor_r.i_[1]*spacePhasor_r.i_[1] +
          spacePhasor_r.i_[2]*spacePhasor_r.i_[2]);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(extent={{-60,45},{-30,75}},
                lineColor={0,0,255}),Ellipse(extent={{-30,45},{0,75}},
                lineColor={0,0,255}),Ellipse(extent={{0,45},{30,75}}, lineColor=
                 {0,0,255}),Ellipse(extent={{30,45},{60,75}}, lineColor={0,0,
                255}),Rectangle(
                      extent={{-60,30},{60,60}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{-100,60},{-60,
                60}}, color={0,0,255}),Line(points={{60,60},{80,60},{80,40}},
                color={0,0,255}),Rectangle(
                      extent={{60,40},{100,-40}},
                      lineColor={0,0,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{80,-40},{80,
                -60}}, color={0,0,255}),Line(points={{60,-60},{100,-60}}, color=
                 {0,0,255}),Line(points={{70,-80},{90,-80}}, color={0,0,255}),
                Line(points={{66,-70},{94,-70}}, color={0,0,255}),Text(
                      extent={{-150,-90},{150,-150}},
                      lineColor={0,0,255},
                      textString="%name"),Line(points={{-100,90},{-100,60}},
                color={0,0,255})}), Documentation(info="<HTML>
<p>
Model of a squirrel cage / symmetrical damper cage in two axis.
</p>
<p>
The squirrel cage has an optional (conditional) HeatPort,
which can be enabled or disabled by the Boolean parameter useHeatPort.
Temperatures of both axis are the same, both losses are added.
Material properties alpha of both axis are the same.
</p>
</HTML>"));
      end SquirrelCage;

      model DamperCage "Squirrel Cage"
        parameter Modelica_SIunits.Inductance Lrsigmad
          "Stray inductance in d-axis per phase translated to stator";
        parameter Modelica_SIunits.Inductance Lrsigmaq
          "Stray inductance in q-axis per phase translated to stator";
        parameter Modelica_SIunits.Resistance Rrd
          "Resistance in d-axis per phase translated to stator at T_ref";
        parameter Modelica_SIunits.Resistance Rrq
          "Resistance in q-axis per phase translated to stator at T_ref";
        parameter Modelica_SIunits.Temperature T_ref=293.15
          "Reference temperature of both resistances in d- and q-axis";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
          "Temperature coefficient of both resistances in d- and q-axis at T_ref";
        extends Modelica_Electrical_Analog_Interfaces.ConditionalHeatPort(T=
              T_ref);
        Modelica_SIunits.Resistance Rrd_actual
          "Actual resistance = Rrd*(1 + alpha*(T_heatPort - T_ref))";
        Modelica_SIunits.Resistance Rrq_actual
          "Actual resistance = Rrq*(1 + alpha*(T_heatPort - T_ref))";
        Modelica_Blocks_Interfaces.RealOutput i[2](
          each final quantity="ElectricCurrent",
          each final unit="A") = -spacePhasor_r.i_ "Currents out from damper";
        Modelica_Blocks_Interfaces.RealOutput lossPower(
          final quantity="Power",
          final unit="W") = LossPower "Damper losses";
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_r
          annotation (Placement(transformation(extent={{-110,90},{-90,110}},
                rotation=0)));
      equation
        assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
          "Temperature outside scope of model!");
        Rrd_actual = Rrd*(1 + alpha*(T_heatPort - T_ref));
        Rrq_actual = Rrq*(1 + alpha*(T_heatPort - T_ref));
        spacePhasor_r.v_[1] = Rrd_actual*spacePhasor_r.i_[1] + Lrsigmad*der(
          spacePhasor_r.i_[1]);
        spacePhasor_r.v_[2] = Rrq_actual*spacePhasor_r.i_[2] + Lrsigmaq*der(
          spacePhasor_r.i_[2]);
        2/3*LossPower = Rrd_actual*spacePhasor_r.i_[1]*spacePhasor_r.i_[1] +
          Rrq_actual*spacePhasor_r.i_[2]*spacePhasor_r.i_[2];
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Line(points={{60,60},{100,60}},
                color={0,0,255}),Line(points={{70,40},{90,40}}, color={0,0,255}),
                Line(points={{66,50},{94,50}}, color={0,0,255}),Text(
                      extent={{-150,-90},{150,-150}},
                      lineColor={0,0,255},
                      textString="%name"),Ellipse(extent={{-60,90},{-40,70}},
                lineColor={0,0,255}),Ellipse(extent={{-40,90},{-20,70}},
                lineColor={0,0,255}),Ellipse(extent={{-20,90},{0,70}},
                lineColor={0,0,255}),Line(points={{-80,0},{-80,-20}}, color={0,
                0,255}),Rectangle(extent={{20,90},{60,70}}, lineColor={0,0,255}),
                Line(points={{60,80},{80,80},{80,60}}, color={0,0,255}),Line(
                points={{-100,90},{-100,80},{-60,80}}, color={0,0,255}),Line(
                points={{-100,90},{-100,80},{-80,80},{-80,60}}, color={0,0,255}),
                Ellipse(extent={{-90,60},{-70,40}}, lineColor={0,0,255}),
                Ellipse(extent={{-90,40},{-70,20}}, lineColor={0,0,255}),
                Ellipse(extent={{-90,20},{-70,0}}, lineColor={0,0,255}),
                Rectangle(
                      extent={{-80,0},{-70,60}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{0,80},{20,80}},
                color={0,0,255}),Rectangle(extent={{-90,-20},{-70,-60}},
                lineColor={0,0,255}),Line(points={{-100,-80},{-60,-80}}, color=
                {0,0,255}),Line(points={{-90,-100},{-70,-100}}, color={0,0,255}),
                Line(points={{-94,-90},{-66,-90}}, color={0,0,255}),Line(points=
                 {{-80,-60},{-80,-80}}, color={0,0,255}),Rectangle(
                      extent={{0,70},{-60,80}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid)}), Documentation(info="<HTML>
<p>
Model of an asymmetrical damper cage in two axis.
</p>
<p>
The damper cage has an optional (conditional) HeatPort,
which can be enabled or disabled by the Boolean parameter useHeatPort.
Temperatures of both axis are the same, both losses are added.
Material properties alpha can be set differently for both d- and q-axis,
although reference temperature for both resistances is the same.
</p>
</HTML>"));
      end DamperCage;

      model ElectricalExcitation "Electrical excitation"
        parameter Real turnsRatio(start=1)
          "Ratio stator current / excitation current";
        Modelica_SIunits.Current ie "Excitation current";
        Modelica_SIunits.Voltage ve "Excitation voltage";
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_r
          annotation (Placement(transformation(extent={{-110,90},{-90,110}},
                rotation=0)));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_ep annotation (
            Placement(transformation(extent={{90,110},{110,90}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_en annotation (
            Placement(transformation(extent={{110,-110},{90,-90}}, rotation=0)));
      equation
        pin_ep.i + pin_en.i = 0;
        ie = +pin_ep.i;
        ve = pin_ep.v - pin_en.v;
        spacePhasor_r.i_ = {-ie*turnsRatio,0};
        ve = spacePhasor_r.v_[1]*turnsRatio*3/2;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                      extent={{-150,-90},{150,-150}},
                      lineColor={0,0,255},
                      textString="%name"),Polygon(
                      points={{-90,100},{-70,106},{-70,94},{-90,100}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid),Ellipse(extent={{-70,40},{
                10,-40}}, lineColor={0,0,255}),Ellipse(extent={{-10,40},{70,-40}},
                lineColor={0,0,255}),Line(points={{-30,0},{-54,32},{-50,20},{-44,
                26},{-54,32}}, color={0,0,255}),Line(points={{-30,0},{-54,-32},
                {-50,-20},{-44,-26},{-54,-32}}, color={0,0,255}),Line(points={{
                -54,32},{-54,100},{-70,100}}, color={0,0,255}),Line(points={{90,
                100},{30,100},{30,40}}, color={0,0,255}),Line(points={{30,-40},
                {30,-100},{90,-100}}, color={0,0,255})}), Documentation(info="<HTML>
Model of an electrical excitation, converting excitation to space phasor.
</HTML>"));
      end ElectricalExcitation;

      model PermanentMagnet "Permanent magnet excitation"
        parameter Modelica_SIunits.Current Ie "Equivalent excitation current";
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_r
          annotation (Placement(transformation(extent={{-110,90},{-90,110}},
                rotation=0)));
      equation
        spacePhasor_r.i_ = {-Ie,0};
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
                      extent={{-60,60},{60,20}},
                      lineColor={255,0,0},
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-60,-20},{60,-60}},
                      lineColor={0,255,0},
                      fillColor={0,255,0},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-60,40},{60,0}},
                      lineColor={255,0,0},
                      fillColor={255,0,0},
                      fillPattern=FillPattern.Solid),Polygon(
                      points={{-90,100},{-70,106},{-70,94},{-90,100}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-60,0},{60,-40}},
                      lineColor={0,255,0},
                      pattern=LinePattern.None,
                      lineThickness=0.5,
                      fillColor={0,255,0},
                      fillPattern=FillPattern.Solid),Line(points={{-60,-40},{-60,
                0}}, color={0,255,0}),Line(points={{60,-40},{60,0}}, color={0,
                255,0}),Line(points={{0,100},{-70,100}}, color={0,0,255}),Line(
                points={{0,100},{0,60}}, color={255,0,0}),Text(
                      extent={{-150,-90},{150,-150}},
                      lineColor={0,0,255},
                      textString="%name")}), Documentation(info="<HTML>
Model of a permanent magnet excitation, characterized by an equivalent excitation current.
</HTML>"));
      end PermanentMagnet;

      model PermanentMagnetWithLosses "Permanent magnet excitation"
        extends PermanentMagnet;
        extends Losses.InductionMachines.PermanentMagnetLosses;
      end PermanentMagnetWithLosses;

      model InductorDC
        "Ideal linear electrical inductor for electrical DC machines"
        extends Modelica_Electrical_Analog_Interfaces.OnePort;
        parameter Modelica_SIunits.Inductance L(start=1) "Inductance";
        parameter Boolean quasiStationary(start=false)
          "No electrical transients if true" annotation (Evaluate=true);
      equation
        v = if quasiStationary then 0 else L*der(i);
        annotation (
          Documentation(info="<html>
<p>The linear inductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>v = L * di/dt</i>.
If <code>quasiStationary == false</code>, the electrical transients are neglected, i.e., the voltage drop is zero.</p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(extent={{-60,-15},{-30,15}},
                lineColor={0,0,255}),Ellipse(extent={{-30,-15},{0,15}},
                lineColor={0,0,255}),Ellipse(extent={{0,-15},{30,15}},
                lineColor={0,0,255}),Ellipse(extent={{30,-15},{60,15}},
                lineColor={0,0,255}),Rectangle(
                      extent={{-60,-30},{60,0}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{60,0},{90,0}},
                color={0,0,255}),Line(points={{-90,0},{-60,0}}, color={0,0,255}),
                Text( extent={{-138,-60},{144,-94}},
                      lineColor={0,0,0},
                      textString="L=%L"),Text(
                      extent={{-152,79},{148,39}},
                      textString="%name",
                      lineColor={0,0,255}),Rectangle(
                      visible=quasiStationary,
                      extent={{-70,30},{70,-30}},
                      lineColor={0,0,255},
                      fillColor={85,170,255},
                      fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(extent={{-60,-15},{-30,15}},
                lineColor={0,0,255}),Ellipse(extent={{-30,-15},{0,15}},
                lineColor={0,0,255}),Ellipse(extent={{0,-15},{30,15}},
                lineColor={0,0,255}),Ellipse(extent={{30,-15},{60,15}},
                lineColor={0,0,255}),Rectangle(
                      extent={{-60,-30},{60,0}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{60,0},{96,0}},
                color={0,0,255}),Line(points={{-96,0},{-60,0}}, color={0,0,255})}));
      end InductorDC;

      partial model PartialAirGapDC "Partial airgap model of a DC machine"
        parameter Boolean quasiStationary(start=false)
          "No electrical transients if true" annotation (Evaluate=true);
        parameter Real turnsRatio
          "Ratio of armature turns over number of turns of the excitation winding";
        output Modelica_SIunits.AngularVelocity w "Angular velocity";
        Modelica_SIunits.Voltage vei
          "Voltage drop across field excitation inductance";
        Modelica_SIunits.Current ie "Excitation current";
        Modelica_SIunits.MagneticFlux psi_e "Excitation flux";
        Modelica_SIunits.Voltage vai "Induced armature voltage";
        Modelica_SIunits.Current ia "Armature current";
        output Modelica_SIunits.Torque tauElectrical;
        Modelica_Mechanics_Rotational_Interfaces.Flange_a flange annotation (
            Placement(transformation(extent={{-10,110},{10,90}}, rotation=0)));
        Modelica_Mechanics_Rotational_Interfaces.Flange_a support
          "Support at which the reaction torque is acting" annotation (
            Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_ap annotation (
            Placement(transformation(extent={{-110,110},{-90,90}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_ep annotation (
            Placement(transformation(extent={{90,110},{110,90}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_an annotation (
            Placement(transformation(extent={{-110,-110},{-90,-90}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_en annotation (
            Placement(transformation(extent={{90,-110},{110,-90}}, rotation=0)));
      equation
        // armature pins
        vai = pin_ap.v - pin_an.v;
        ia = +pin_ap.i;
        ia = -pin_an.i;
        // excitation pins
        vei = pin_ep.v - pin_en.v;
        ie = +pin_ep.i;
        ie = -pin_en.i;
        // induced voltage across field excitation inductance
        vei = if quasiStationary then 0 else der(psi_e);
        // mechanical speed
        w = der(flange.phi) - der(support.phi);
        // induced armature voltage
        vai = turnsRatio*psi_e*w;
        // electrical torque (ia is perpendicular to flux)
        tauElectrical = turnsRatio*psi_e*ia;
        flange.tau = -tauElectrical;
        support.tau = tauElectrical;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
                      extent={{-90,90},{90,-92}},
                      lineColor={0,0,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Ellipse(
                      extent={{-80,80},{80,-80}},
                      lineColor={0,0,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-10,90},{10,-80}},
                      lineColor={0,0,0},
                      fillPattern=FillPattern.VerticalCylinder,
                      fillColor={128,128,128}),Text(
                      extent={{0,40},{80,-40}},
                      lineColor={0,0,0},
                      textString="E"),Text(
                      extent={{-150,-100},{150,-160}},
                      lineColor={0,0,255},
                      textString="%name"),Text(
                      extent={{-80,40},{0,-40}},
                      lineColor={0,0,0},
                      textString="A"),Rectangle(
                      visible=quasiStationary,
                      extent={{-10,90},{10,-80}},
                      lineColor={170,213,255},
                      fillPattern=FillPattern.VerticalCylinder,
                      fillColor={170,213,255})}), Documentation(info="<HTML>
Linear model of the airgap (without saturation effects) of a DC machine, using only equations.<br>
Induced excitation voltage is calculated from der(flux), where flux is defined by excitation inductance times excitation current.
If <code>quasiStationary == false</code>, the electrical transients are neglected, i.e., the induced excitation voltage is zero.<br>
Induced armature voltage is calculated from flux times angular velocity.
</HTML>"));
      end PartialAirGapDC;

      model AirGapDC "Linear airgap model of a DC machine"
        extends PartialAirGapDC;
        parameter Modelica_SIunits.Inductance Le "Excitation inductance";
      equation
        // excitation flux: linearly dependent on excitation current
        psi_e = Le*ie;
        annotation (
          defaultComponentName="airGap",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Text(
                      extent={{-150,-100},{150,-160}},
                      lineColor={0,0,255},
                      textString="%name")}),
          Documentation(info="<HTML>
Linear model of the airgap (without saturation effects) of a DC machine, using only equations.<br>
Induced excitation voltage is calculated from der(flux), where flux is defined by excitation inductance times excitation current.<br>
Induced armature voltage is calculated from flux times angular velocity.
</HTML>"));
      end AirGapDC;

      model CompoundDCExcitation "Compound excitation = shunt + series"
        parameter Real excitationTurnsRatio
          "Ratio of series excitation turns over shunt excitation turns";
        Modelica_SIunits.Voltage v=pin_p.v - pin_n.v;
        Modelica_SIunits.Current i=pin_p.i;
        Modelica_SIunits.Voltage ve=pin_ep.v - pin_en.v;
        Modelica_SIunits.Current ie=pin_ep.i;
        Modelica_SIunits.Voltage vse=pin_sep.v - pin_sen.v;
        Modelica_SIunits.Current ise=pin_sep.i;
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_p
          "Positive pin to airgap"
          annotation (Placement(transformation(extent={{90,110},{110,90}})));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_n
          "Negative pin to airgap"
          annotation (Placement(transformation(extent={{-110,110},{-90,90}})));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_ep
          "Positive pin to shunt excitation"
          annotation (Placement(transformation(extent={{90,-108},{110,-88}})));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_en
          "Negative pin to shunt excitation"
          annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
        Modelica_Electrical_Analog_Interfaces.PositivePin pin_sep
          "Positive pin to series excitation"
          annotation (Placement(transformation(extent={{-30,-110},{-10,-90}})));
        Modelica_Electrical_Analog_Interfaces.NegativePin pin_sen
          "Negative pin to series excitation" annotation (Placement(
              transformation(extent={{-110,-110},{-90,-90}})));
      equation
        //current balances
        pin_p.i + pin_n.i = 0;
        pin_ep.i + pin_en.i = 0;
        pin_sep.i + pin_sen.i = 0;
        //compound currents
        -i = ie + excitationTurnsRatio*ise;
        //induced voltages
        ve = v;
        vse = v*excitationTurnsRatio;
        annotation (Icon(graphics={Polygon(
                      points={{-60,-40},{-40,-40},{0,4},{40,-40},{60,-40},{10,
                  20},{10,60},{20,60},{0,80},{-20,60},{-10,60},{-10,20},{-60,-40}},
                      lineColor={0,0,255},
                      smooth=Smooth.None,
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid),Text(
                      extent={{-80,-40},{-40,-80}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid,
                      textString="S"),Text(
                      extent={{40,-40},{80,-80}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid,
                      textString="E")}), Documentation(info="<HTML>
Model to compound the shunt excitation current and the series excitation current to the total excitation current w.r.t. shunt excitation.
This model is intended to be placed between shunt and series excitation pins and the airgap;
the connection to airgap has to be grounded at one point.
</HTML>"));
      end CompoundDCExcitation;

      partial model PartialCore
        "Partial model of transformer core with 3 windings"
        parameter Integer m(final min=1) = 3 "Number of phases";
        parameter Real n12(start=1) "Turns ratio 1:2";
        parameter Real n13(start=1) "Turns ratio 1:3";
        Modelica_SIunits.Voltage v1[m]=plug_p1.pin.v - plug_n1.pin.v;
        Modelica_SIunits.Current i1[m]=plug_p1.pin.i;
        Modelica_SIunits.Voltage v2[m]=plug_p2.pin.v - plug_n2.pin.v;
        Modelica_SIunits.Current i2[m]=plug_p2.pin.i;
        Modelica_SIunits.Voltage v3[m]=plug_p3.pin.v - plug_n3.pin.v;
        Modelica_SIunits.Current i3[m]=plug_p3.pin.i;
        Modelica_SIunits.Current im[m]=i1 + i2/n12 + i3/n13
          "Magnetizing current";
        Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p1(final m=
              m) annotation (Placement(transformation(extent={{-110,40},{-90,60}},
                rotation=0)));
        Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n1(final m=
              m) annotation (Placement(transformation(extent={{-110,-60},{-90,-40}},
                rotation=0)));
        Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p2(final m=
              m) annotation (Placement(transformation(extent={{90,90},{110,110}},
                rotation=0)));
        Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n2(final m=
              m) annotation (Placement(transformation(extent={{90,30},{110,50}},
                rotation=0)));
        Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p3(final m=
              m) annotation (Placement(transformation(extent={{90,-30},{110,-50}},
                rotation=0)));
        Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n3(final m=
              m) annotation (Placement(transformation(extent={{90,-90},{110,-110}},
                rotation=0)));
      equation
        plug_p1.pin.i + plug_n1.pin.i = zeros(m);
        plug_p2.pin.i + plug_n2.pin.i = zeros(m);
        plug_p3.pin.i + plug_n3.pin.i = zeros(m);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                      extent={{-100,130},{100,110}},
                      textString="%name",
                      lineColor={0,0,255}),Ellipse(extent={{-45,-50},{-20,-25}},
                lineColor={0,0,255}),Ellipse(extent={{-45,-25},{-20,0}},
                lineColor={0,0,255}),Ellipse(extent={{-45,0},{-20,25}},
                lineColor={0,0,255}),Ellipse(extent={{-45,25},{-20,50}},
                lineColor={0,0,255}),Rectangle(
                      extent={{-46,-50},{-34,50}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{-90,50},{-32,
                50}}, color={0,0,255}),Line(points={{-90,-50},{-32,-50}}, color=
                 {0,0,255}),Ellipse(extent={{20,40},{45,65}}, lineColor={0,0,
                255}),Ellipse(extent={{20,65},{45,90}}, lineColor={0,0,255}),
                Rectangle(
                      extent={{36,40},{46,90}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{32,90},{90,
                90}}, color={0,0,255}),Line(points={{34,40},{92,40}}, color={0,
                0,255}),Ellipse(extent={{20,-90},{45,-65}}, lineColor={0,0,255}),
                Ellipse(extent={{20,-65},{45,-40}}, lineColor={0,0,255}),
                Rectangle(
                      extent={{36,-90},{46,-40}},
                      lineColor={255,255,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{32,-40},{90,
                -40}}, color={0,0,255}),Line(points={{34,-90},{92,-90}}, color=
                {0,0,255})}), Documentation(info="<html>
Partial model of transformer core with 3 windings; saturation function flux versus magnetizing current has to be defined.
</html>"));
      end PartialCore;

      model IdealCore "Ideal transformer with 3 windings"
        extends PartialCore;
      equation
        im = zeros(m);
        v1 = n12*v2;
        v1 = n13*v3;
        annotation (defaultComponentName="core", Documentation(info="<html>
Ideal transformer with 3 windings: no magnetizing current.
</html>"));
      end IdealCore;

      partial model BasicTransformer "Partial model of three-phase transformer"
        extends Modelica_Electrical_Machines_Interfaces.PartialBasicTransformer;
        //dummy will be removed when conversion script is applicable
        annotation (Documentation(info="<html>
Partial model of a three-phase transformer, containing primary and secondary resistances and stray inductances, as well as the iron core.
Circuit layout (vector group) of primary and secondary windings have to be defined.<br>
Exactly the same as Interfaces.PartialBasicTransformer, included for compatibility reasons.
</html>"));
      end BasicTransformer;
      annotation (Documentation(info="<HTML>
This package contains components for modeling electrical machines, specially three-phase induction machines, based on space phasor theory.
These models use package SpacePhasors.
</HTML>", revisions="<HTML>
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
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.02 2004/09/19 Anton Haumer<br>
       added AirGapDC models</li>
  <li> v1.2  2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.52 2005/10/12 Anton Haumer<br>
       added electrical excitation</li>
  <li> v1.53 Beta 2005/10/14 Anton Haumer<br>
       introduced unsymmetrical DamperCage for Synchronous Machines</li>
  <li> v2.1.3 2010/02/10 Anton Haumer<br>
       prepared ConditionalHeatPort of SquirrelCage and DamperCage</li>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"));
    end Components;
    annotation (Documentation(info="<HTML>
This package contains components for modeling electrical machines, specially three-phase induction machines, based on space phasor theory:
<ul>
<li>package AsynchronousInductionMachines: models of three phase asynchronous induction machines</li>
<li>package SynchronousInductionMachines: models of three phase synchronous induction machines</li>
<li>package DCMachines: models of DC machines with different excitation</li>
<li>package Transformers: Threephase transformers (see detailed documentation in subpackage)</li>
<li>package Components: components for modeling machines and transformers</li>
</ul>
The induction machine models use package SpacePhasors.
</HTML>", revisions="<HTML>
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
  <li> v1.00  2004/09/16 Anton Haumer</li>
  <li> v1.01  2004/09/18 Anton Haumer<br>
       moved common equations from machine models to PartialMachine</li>
  <li> v1.02  2004/09/19 Anton Haumer<br>
       new package structure for machine types<br>
       added DCMachine models</li>
  <li> v1.03  2004/09/24 Anton Haumer<br>
       added DC machine with series excitation</li>
  <li> v1.1   2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2   2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.3.2 2004/11/10 Anton Haumer<br>
       ReluctanceRotor moved to SynchronousMachines</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.53  2005/10/14 Anton Haumer<br>
       introduced unsymmetrical DamperCage for Synchronous Machines</li>
  <li> v1.6.2 2005/10/23 Anton Haumer<br>
       selectable DamperCage for Synchronous Machines</li>
  <li> v1.6.3 2005/11/25 Anton Haumer<br>
       easier parametrization of AsynchronousInductionMachines.AIM_SlipRing model</li>
  <li> v1.7.1 2006/02/06 Anton Haumer<br>
       changed some naming of synchronous machines, not affecting existing models</li>
  <li> v2.1.3 2010/02/10 Anton Haumer<br>
       prepared conditionalHeatPort of SquirrelCage and DamperCage</li>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              origin={2.835,10},
              fillColor={0,128,255},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-60,-60},{60,60}}),Rectangle(
              origin={2.835,10},
              fillColor={128,128,128},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-80,-60},{-60,60}}),Rectangle(
              origin={2.835,10},
              fillColor={95,95,95},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{60,-10},{80,10}}),Rectangle(
              origin={2.835,10},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              extent={{-60,50},{20,70}}),Polygon(
              origin={2.835,10},
              fillPattern=FillPattern.Solid,
              points={{-70,-90},{-60,-90},{-30,-20},{20,-20},{50,-90},{60,-90},
              {60,-100},{-70,-100},{-70,-90}})}));
  end BasicMachines;

  package Sensors "Sensors for machine modelling"
    extends Modelica_Icons.SensorsPackage;
    model VoltageQuasiRMSSensor "Length of space phasor -> RMS voltage"
      extends Modelica_Icons.RotationalSensor;
      constant Integer m(final min=1) = 3 "Number of phases";
      Modelica_Blocks_Interfaces.RealOutput V(final quantity=
            "ElectricPotential", final unit="V") annotation (Placement(
            transformation(
            origin={0,-110},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n(final m=m)
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.VoltageSensor VoltageSensor1(
          final m=m) annotation (Placement(transformation(extent={{-10,40},{10,
                60}}, rotation=0)));
      Modelica_Blocks.Math.Gain Gain1(final k=1/sqrt(2)) annotation (Placement(
            transformation(
            origin={0,-70},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      SpacePhasors.Blocks.ToSpacePhasor ToSpacePhasor1 annotation (Placement(
            transformation(
            origin={0,10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      SpacePhasors.Blocks.ToPolar ToPolar1 annotation (Placement(transformation(
            origin={0,-30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    equation
      connect(plug_p, VoltageSensor1.plug_p) annotation (Line(points={{-100,0},
              {-100,50},{-10,50}}, color={0,0,255}));
      connect(VoltageSensor1.plug_n, plug_n)
        annotation (Line(points={{10,50},{100,50},{100,0}}, color={0,0,255}));
      connect(VoltageSensor1.v, ToSpacePhasor1.u) annotation (Line(
          points={{0,39},{0,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ToSpacePhasor1.y, ToPolar1.u) annotation (Line(
          points={{0,-1},{0,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ToPolar1.y[1], Gain1.u) annotation (Line(
          points={{-0.5,-41},{-0.5,-49.5},{0,-49.5},{0,-58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Gain1.y, V) annotation (Line(
          points={{0,-81},{0,-110}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Line(points={{-90,0},{-70,0}},
              color={0,0,255}),Line(points={{70,0},{90,0}}, color={0,0,255}),
              Line(points={{0,-70},{0,-100}}, color={0,0,127}),Text(
                  lineColor={0,0,255},
                  extent={{-40,-60},{40,-20}},
                  textString="V RMS")}), Documentation(info="<HTML>
Measured 3-phase instantaneous voltages are transformed to the corresponding space phasor; <br>
output is length of the space phasor divided by sqrt(2), thus giving in sinusoidal stationary state RMS voltage.
</HTML>"));
    end VoltageQuasiRMSSensor;

    model CurrentQuasiRMSSensor "Length of space phasor -> RMS current"
      extends Modelica_Icons.RotationalSensor;
      constant Integer m(final min=1) = 3 "Number of phases";
      Modelica_Blocks_Interfaces.RealOutput I(final quantity="ElectricCurrent",
          final unit="A") annotation (Placement(transformation(
            origin={0,-110},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n(final m=m)
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.CurrentSensor CurrentSensor1(
          final m=m) annotation (Placement(transformation(extent={{-10,40},{10,
                60}}, rotation=0)));
      Modelica_Blocks.Math.Gain Gain1(final k=1/sqrt(2)) annotation (Placement(
            transformation(
            origin={0,-70},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      SpacePhasors.Blocks.ToSpacePhasor ToSpacePhasor1 annotation (Placement(
            transformation(
            origin={0,10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      SpacePhasors.Blocks.ToPolar ToPolar1 annotation (Placement(transformation(
            origin={0,-30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    equation
      connect(plug_p, CurrentSensor1.plug_p) annotation (Line(points={{-100,0},
              {-100,50},{-10,50}}, color={0,0,255}));
      connect(CurrentSensor1.plug_n, plug_n)
        annotation (Line(points={{10,50},{100,50},{100,0}}, color={0,0,255}));
      connect(CurrentSensor1.i, ToSpacePhasor1.u) annotation (Line(
          points={{0,39},{0,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ToSpacePhasor1.y, ToPolar1.u) annotation (Line(
          points={{0,-1},{0,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ToPolar1.y[1], Gain1.u) annotation (Line(
          points={{-0.5,-41},{-0.5,-50.5},{0,-50.5},{0,-58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Gain1.y, I) annotation (Line(
          points={{0,-81},{0,-110}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Line(points={{-90,0},{-70,0}},
              color={0,0,255}),Line(points={{70,0},{90,0}}, color={0,0,255}),
              Line(points={{0,-70},{0,-100}}, color={0,0,127}),Text(
                  lineColor={0,0,255},
                  extent={{-40,-60},{40,-20}},
                  textString="A RMS")}), Documentation(info="<HTML>
Measured 3-phase instantaneous currents are transformed to the corresponding space phasor; <br>
output is length of the space phasor divided by sqrt(2), thus giving in sinusoidal stationary state RMS current.
</HTML>"));
    end CurrentQuasiRMSSensor;

    model ElectricalPowerSensor "Instantaneous power from space phasors"
      extends Modelica_Icons.RotationalSensor;
      constant Integer m(final min=1) = 3 "Number of phases";
      Modelica_Blocks_Interfaces.RealOutput P(final quantity="Power", final
          unit="W") annotation (Placement(transformation(
            origin={-50,110},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Blocks_Interfaces.RealOutput Q(final quantity="Power", final
          unit="var") annotation (Placement(transformation(
            origin={50,110},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_ni(final m=m)
        annotation (Placement(transformation(extent={{90,-10},{110,10}},
              rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_nv(final m=m)
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}},
              rotation=0)));
    protected
      Modelica_SIunits.Voltage v_[2];
      Modelica_SIunits.Current i_[2];
    equation
      plug_p.pin.v = plug_ni.pin.v;
      plug_p.pin.i + plug_ni.pin.i = zeros(m);
      plug_nv.pin.i = zeros(m);
      v_ = SpacePhasors.Functions.ToSpacePhasor(plug_p.pin.v - plug_nv.pin.v);
      i_ = SpacePhasors.Functions.ToSpacePhasor(plug_p.pin.i);
      2/3*P = +v_[1]*i_[1] + v_[2]*i_[2];
      2/3*Q = -v_[1]*i_[2] + v_[2]*i_[1];
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Line(points={{-90,0},{-70,0}},
              color={0,0,255}),Line(points={{70,0},{90,0}}, color={0,0,255}),
              Line(points={{0,-70},{0,-90}}, color={0,0,255}),Line(points={{-10,
              70},{-10,80},{-50,80},{-50,100}}, color={0,0,127}),Line(points={{
              10,70},{10,80},{50,80},{50,100}}, color={0,0,127}),Text(
                  lineColor={0,0,255},
                  extent={{-40,-60},{40,-20}},
                  textString="P Q")}), Documentation(info="<HTML>
3-phase instantaneous voltages (plug_p - plug_nv) and currents (plug_p - plug_ni) are transformed to the corresponding space phasors, <br>
which are used to calculate power quantities:<br>
P = instantaneous power, thus giving in stationary state active power.<br>
Q = giving in stationary state reactive power.<br>
</HTML>"));
    end ElectricalPowerSensor;

    model MechanicalPowerSensor "Mechanical power = torque x speed"
      extends Modelica_Icons.RotationalSensor;
      extends Modelica_Mechanics_Rotational_Interfaces.PartialTwoFlanges;
      parameter Boolean useSupport=false "Use support or fixed housing"
        annotation (Evaluate=true);
      Modelica_Blocks_Interfaces.RealOutput P(final quantity="Power", final
          unit="W") annotation (Placement(transformation(
            origin={0,110},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Sensors.TorqueSensor torqueSensor
        annotation (Placement(transformation(extent={{20,-10},{40,10}},
              rotation=0)));
      Modelica_Blocks.Math.Product product annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_Rotational.Sensors.RelSpeedSensor relSpeedSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-30,-30})));
      Modelica_Mechanics_Rotational.Components.Fixed fixed if (not useSupport)
        annotation (Placement(transformation(extent={{-40,-100},{-20,-80}},
              rotation=0)));
      Modelica_Mechanics_Rotational_Interfaces.Flange_a support if useSupport
        "Support at which the reaction torque is acting" annotation (Placement(
            transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
    equation
      connect(flange_a, torqueSensor.flange_a) annotation (Line(points={{-100,0},
              {-70,0},{-40,0},{20,0}}, color={0,0,0}));
      connect(torqueSensor.flange_b, flange_b)
        annotation (Line(points={{40,0},{100,0}}, color={0,0,0}));
      connect(flange_a, relSpeedSensor.flange_b) annotation (Line(
          points={{-100,0},{-30,0},{-30,-20}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relSpeedSensor.flange_a, fixed.flange) annotation (Line(
          points={{-30,-40},{-30,-90}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relSpeedSensor.flange_a, support) annotation (Line(
          points={{-30,-40},{-30,-80},{0,-80},{0,-100}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relSpeedSensor.w_rel, product.u1) annotation (Line(
          points={{-19,-30},{-6,-30},{-6,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(torqueSensor.tau, product.u2) annotation (Line(
          points={{22,-11},{22,-20},{6,-20},{6,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, P) annotation (Line(
          points={{0,41},{0,110}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Line(points={{-70,0},{-90,0}}),
              Line(points={{70,0},{90,0}}),Line(points={{0,70},{0,100}}, color=
              {0,0,127}),Rectangle(
                  visible=useSupport,
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid,
                  extent={{-20,-120},{20,-80}}),Line(visible=not useSupport,
              points={{-20,-100},{20,-100}}),Line(visible=not useSupport,
              points={{-10,-100},{-20,-120}}),Line(visible=not useSupport,
              points={{0,-100},{-10,-120}}),Line(visible=not useSupport, points=
               {{10,-100},{0,-120}}),Line(visible=not useSupport, points={{20,-100},
              {10,-120}}),Text(
                  lineColor={0,0,255},
                  extent={{-40,-60},{40,-20}},
                  textString="Pmech")}), Documentation(info="<HTML>
Calculates (mechanical) power from torque times angular speed.
</HTML>"));
    end MechanicalPowerSensor;

    model RotorDisplacementAngle "Rotor lagging angle"
      constant Integer m=3 "Number of phases";
      parameter Integer p(min=1) "Number of pole pairs";
      parameter Boolean useSupport=false "Use support or fixed housing"
        annotation (Evaluate=true);
      Modelica_Blocks_Interfaces.RealOutput rotorDisplacementAngle(final
          quantity="Angle", final unit="rad") annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
        annotation (Placement(transformation(extent={{-110,50},{-90,70}},
              rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n(final m=m)
        annotation (Placement(transformation(extent={{-110,-70},{-90,-50}},
              rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.VoltageSensor VoltageSensor1(
          final m=m) annotation (Placement(transformation(
            origin={-80,-10},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      SpacePhasors.Blocks.ToSpacePhasor ToSpacePhasorVS annotation (Placement(
            transformation(extent={{-60,-20},{-40,0}}, rotation=0)));
      Modelica_Mechanics_Rotational_Interfaces.Flange_a flange annotation (
          Placement(transformation(extent={{-10,90},{10,110}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sensors.RelAngleSensor relativeAngleSensor
        annotation (Placement(transformation(extent={{40,70},{20,90}}, rotation=
               0)));
      Modelica_Blocks.Sources.Constant constant_(final k=Modelica_Constants.pi/
            2) annotation (Placement(transformation(extent={{-50,30},{-30,50}},
              rotation=0)));
      Modelica_Blocks.Math.Add add(final k2=1, final k1=p) annotation (
          Placement(transformation(
            origin={-10,20},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      SpacePhasors.Blocks.Rotator rotatorVS2R annotation (Placement(
            transformation(extent={{-20,0},{0,-20}}, rotation=0)));
      SpacePhasors.Blocks.ToPolar ToPolarVSR annotation (Placement(
            transformation(extent={{20,-20},{40,0}}, rotation=0)));
      Modelica_Blocks.Routing.DeMultiplex2 deMultiplex2(final n1=1, final n2=1)
        annotation (Placement(transformation(extent={{60,-20},{80,0}}, rotation=
               0)));
      Modelica_Mechanics_Rotational_Interfaces.Flange_a support if useSupport
        "support at which the reaction torque is acting" annotation (Placement(
            transformation(extent={{90,90},{110,110}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Fixed fixed if (not useSupport)
        annotation (Placement(transformation(extent={{90,70},{110,90}},
              rotation=0)));
    equation
      connect(plug_p, VoltageSensor1.plug_p) annotation (Line(points={{-100,60},
              {-80,60},{-80,0}}, color={0,0,255}));
      connect(plug_n, VoltageSensor1.plug_n) annotation (Line(points={{-100,-60},
              {-80,-60},{-80,-20}}, color={0,0,255}));
      connect(relativeAngleSensor.flange_b, flange)
        annotation (Line(points={{20,80},{0,80},{0,100}}, color={0,0,0}));
      connect(relativeAngleSensor.flange_a, support) annotation (Line(
          points={{40,80},{60,80},{60,100},{100,100}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relativeAngleSensor.flange_a, fixed.flange) annotation (Line(
          points={{40,80},{100,80}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relativeAngleSensor.phi_rel, add.u1) annotation (Line(
          points={{30,69},{30,40},{-4,40},{-4,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(constant_.y, add.u2) annotation (Line(
          points={{-29,40},{-16,40},{-16,32},{-16,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(VoltageSensor1.v, ToSpacePhasorVS.u) annotation (Line(
          points={{-69,-10},{-62,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ToSpacePhasorVS.y, rotatorVS2R.u) annotation (Line(
          points={{-39,-10},{-22,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rotatorVS2R.y, ToPolarVSR.u) annotation (Line(
          points={{1,-10},{18,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, rotatorVS2R.angle) annotation (Line(
          points={{-10,9},{-10,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ToPolarVSR.y, deMultiplex2.u) annotation (Line(
          points={{41,-10},{58,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(deMultiplex2.y2[1], rotorDisplacementAngle) annotation (Line(
          points={{81,-16},{90,-16},{90,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Ellipse(
                  extent={{-60,80},{60,40}},
                  lineColor={0,255,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Ellipse(
                  extent={{-60,-40},{60,-80}},
                  lineColor={0,255,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Rectangle(
                  extent={{-60,60},{60,40}},
                  lineColor={0,255,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Rectangle(
                  extent={{-60,-40},{60,-60}},
                  lineColor={0,255,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Rectangle(
                  extent={{-40,40},{40,-40}},
                  lineColor={0,255,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{0,0},{-80,80}},
              color={0,0,255}),Polygon(
                  points={{-80,80},{-68,76},{-76,68},{-80,80}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{0,0},{0,80}},
              color={0,255,0}),Polygon(
                  points={{0,84},{4,72},{-4,72},{0,84}},
                  lineColor={0,255,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Rectangle(
                  extent={{80,120},{120,80}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),Line(
                  visible=not useSupport,
                  points={{80,100},{120,100}},
                  color={0,0,0},
                  smooth=Smooth.None),Line(
                  visible=not useSupport,
                  points={{90,120},{80,100}},
                  color={0,0,0},
                  smooth=Smooth.None),Line(
                  visible=not useSupport,
                  points={{100,120},{90,100}},
                  color={0,0,0},
                  smooth=Smooth.None),Line(
                  visible=not useSupport,
                  points={{110,120},{100,100}},
                  color={0,0,0},
                  smooth=Smooth.None),Line(
                  visible=not useSupport,
                  points={{120,120},{110,100}},
                  color={0,0,0},
                  smooth=Smooth.None)}), Documentation(info="<HTML>
Calculates rotor lagging angle by measuring the stator phase voltages, transforming them to the corresponding space phasor in stator-fixed coordinate system, <br>
rotating the space phasor to the rotor-fixed coordinate system and calculating the angle of this space phasor.
<p>
The sensor's housing can be implicitly fixed (useSupport=false).<br>
If the machine's stator also implicitly fixed (useSupport=false), the angle at the flange
is equal to the angle of the machine's rotor against the stator.<br>
Otherwise, the sensor's support has to be connected to the machine's support.
</p>
</HTML>"));
    end RotorDisplacementAngle;
    annotation (Documentation(info="<HTML>
This package contains sensors that are useful when modelling machines.
</HTML>", revisions="<HTML>
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
  <li> v1.03 2004/09/24 Anton Haumer</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed RotorDisplacementAngle</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support, also in sensor RotorDisplacementAngle<br>
       to ease the implementation of a 3D-frame in a future release</li>
  </ul>
</HTML>"));
  end Sensors;

  package SpacePhasors "Library with space phasor-models"
    extends Modelica_Icons.Package;
    package Components "Basic space phasor models"
      extends Modelica_Icons.Package;
      model SpacePhasor
        "Physical transformation: three phase <-> space phasors"
        constant Integer m=3 "Number of phases";
        constant Real pi=Modelica_Constants.pi;
        parameter Real turnsRatio=1 "Turns ratio";
        Modelica_SIunits.Voltage v[m] "Instantaneous phase voltages";
        Modelica_SIunits.Current i[m] "Instantaneous phase currents";
      protected
        parameter Real TransformationMatrix[2, m]=2/m*{{cos(+(k - 1)/m*2*pi)
            for k in 1:m},{+sin(+(k - 1)/m*2*pi) for k in 1:m}};
        parameter Real InverseTransformation[m, 2]={{cos(-(k - 1)/m*2*pi),-sin(
            -(k - 1)/m*2*pi)} for k in 1:m};
      public
        Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
          annotation (Placement(transformation(extent={{-110,90},{-90,110}},
                rotation=0)));
        Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n(final m=m)
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}},
                rotation=0)));
        Modelica_Electrical_Analog_Interfaces.PositivePin zero annotation (
            Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
        Modelica_Electrical_Analog_Interfaces.NegativePin ground annotation (
            Placement(transformation(extent={{90,-110},{110,-90}}, rotation=0)));
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor
          annotation (Placement(transformation(extent={{90,90},{110,110}},
                rotation=0)));
      equation
        v/turnsRatio = plug_p.pin.v - plug_n.pin.v;
        i*turnsRatio = +plug_p.pin.i;
        i*turnsRatio = -plug_n.pin.i;
        m*zero.v = sum(v);
        spacePhasor.v_ = TransformationMatrix*v;
        //v  = fill(zero.v,m) + InverseTransformation*spacePhasor.v_;
        -m*zero.i = sum(i);
        -spacePhasor.i_ = TransformationMatrix*i;
        //-i  = fill(zero.i,m) + InverseTransformation*spacePhasor.i_;
        ground.v = 0;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Line(points={{0,0},{80,80},{60,
                72},{72,60},{80,80}}, color={0,0,255}),Line(points={{0,0},{80,-80},
                {72,-60},{60,-72},{80,-80}}, color={0,0,255}),Line(
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
                      extent={{-150,-100},{150,-160}},
                      lineColor={0,0,255},
                      textString="%name"),Text(
                      extent={{40,10},{90,-10}},
                      lineColor={0,0,255},
                      textString="zero"),Line(points={{90,-100},{60,-100}},
                color={0,0,255}),Line(points={{60,-84},{60,-116}}, color={0,0,
                255}),Line(points={{50,-90},{50,-110}}, color={0,0,255}),Line(
                points={{40,-96},{40,-104}}, color={0,0,255})}), Documentation(
              info="<HTML>
Physical transformation of voltages and currents: three phases &lt;-&gt; space phasors:<br>
x[k] = X0 + {cos(-(k - 1)/m*2*pi),-sin(-(k - 1)/m*2*pi)}*X[Re,Im]<br>
and vice versa:<br>
X0 = sum(x[k])/m<br>
X[Re,Im] = sum(2/m*{cos((k - 1)/m*2*pi),sin((k - 1)/m*2*pi)}*x[k])<br>
were x designates three phase values, X[Re,Im] designates the space phasor and X0 designates the zero sequence system.<br>
<i>Physical transformation</i> means that both voltages and currents are transformed in both directions.<br>
Zero-sequence voltage and current are present at pin zero. An additional zero-sequence impedance could be connected between pin zero and pin ground.
</HTML>"));
      end SpacePhasor;

      model Rotator "Rotates space phasor"
        constant Real pi=Modelica_Constants.pi;
      protected
        Real RotationMatrix[2, 2]={{+cos(-angle),-sin(-angle)},{+sin(-angle),+
            cos(-angle)}};
        //Real InverseRotator[2,2] = {{+cos(+angle),-sin(+angle)},{+sin(+angle),+cos(+angle)}};
      public
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_a
          annotation (Placement(transformation(extent={{-110,90},{-90,110}},
                rotation=0)));
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor_b
          annotation (Placement(transformation(extent={{90,90},{110,110}},
                rotation=0)));
        Modelica_Blocks_Interfaces.RealInput angle annotation (Placement(
              transformation(
              origin={0,-120},
              extent={{-20,-20},{20,20}},
              rotation=90)));
      equation
        spacePhasor_b.v_ = RotationMatrix*spacePhasor_a.v_;
        //spacePhasor_a.v_ = InverseRotator*spacePhasor_b.v_;
        spacePhasor_b.i_ + RotationMatrix*spacePhasor_a.i_ = zeros(2);
        //spacePhasor_a.i_ + InverseRotator*spacePhasor_b.i_ = zeros(2);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                      extent={{50,-2},{-2,-50}},
                      pattern=LinePattern.None,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,255}),Line(points={{0,0},{80,0},{60,10},{
                60,-10},{80,0}}, color={0,0,255}),Line(points={{0,0},{0,80},{-10,
                60},{10,60},{0,80}}, color={0,0,255}),Polygon(
                      points={{50,0},{42,14},{54,16},{50,0}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid),Ellipse(extent={{-50,50},{
                50,-50}}, lineColor={0,0,255}),Rectangle(
                      extent={{-51,51},{-1,-51}},
                      pattern=LinePattern.None,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,255}),Rectangle(
                      extent={{51,-1},{-1,-51}},
                      pattern=LinePattern.None,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,255})}), Documentation(info="<HTML>
Rotates space phasors of left connector to right connector by the angle provided by the input signal \"angle\" from one coordinate system into another.
</HTML>"));
      end Rotator;
      annotation (Documentation(info="<HTML>
This package contains basic space phasor models.<br>
Real and imaginary part of voltage space phasor are the potentials v_[2] of the space phasor connector; (implicit grounded).<br>
Real and imaginary part of current space phasor are the currents i_[2] at the space phasor connector;
a ground has to be used where necessary for currents flowing back.
</HTML>", revisions="<HTML>
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
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.60 2005/11/03 Anton Haumer<br>
       added Rotator</li>
  <li> v1.6.1 2005/11/10 Anton Haumer<br>
       improved Transformation and Rotation</li>
  </ul>
</HTML>"));
    end Components;

    package Blocks "Blocks for space phasor transformation"
      extends Modelica_Icons.Package;

      block Rotator "Rotates space phasor"
        extends Modelica_Blocks_Interfaces.MIMOs(final n=2);
      protected
        Real RotationMatrix[2, 2]={{+cos(-angle),-sin(-angle)},{+sin(-angle),+
            cos(-angle)}};
        //Real InverseRotator[2,2] = {{+cos(+angle),-sin(+angle)},{+sin(+angle),+cos(+angle)}};
      public
        Modelica_Blocks_Interfaces.RealInput angle annotation (Placement(
              transformation(
              origin={0,-120},
              extent={{-20,-20},{20,20}},
              rotation=90)));
      equation
        y = RotationMatrix*u;
        //u = InverseRotator*y;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Line(points={{0,0},{0,80},{-10,
                60},{10,60},{0,80}}, color={0,0,255}),Line(points={{0,0},{80,0},
                {60,10},{60,-10},{80,0}}, color={0,0,255}),Ellipse(extent={{-50,
                50},{50,-50}}, lineColor={0,0,255}),Rectangle(
                      extent={{-51,51},{-1,-51}},
                      pattern=LinePattern.None,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,255}),Rectangle(
                      extent={{51,-1},{-1,-51}},
                      pattern=LinePattern.None,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,255}),Polygon(
                      points={{50,0},{42,14},{54,16},{50,0}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid),Text(
                      extent={{-88,-72},{84,-92}},
                      lineColor={0,0,0},
                      textString="angle")}), Documentation(info="<HTML>
Rotates a space phasor (voltage or current) input <code>u</code> by the <code>angle</code> in negative mathematical direction. This block represents the transformation of one space phasor <code>u</code> from one rotating reference (coordinate) frame into another where the spave phasor is <code>y</code>. The output reference frame leads the input reference frame by angle <code>angle</code>.

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/Rotator.png\">
    </td>
  </tr>
  <caption align=\"bottom\"><b>Fig. 1:</b> Original and rotated reference frame of a space phasor </caption>
</table>

</HTML>"));
      end Rotator;

      block ToSpacePhasor
        "Conversion of multi phase instantaneous values to space phasors"
        extends Modelica_Blocks_Interfaces.MIMO(final nin=m, final nout=2);
        parameter Integer m(min=1) = 3 "Number of phases";
      protected
        parameter Modelica_SIunits.Angle phi[m]=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
        parameter Real TransformationMatrix[2, m]=2/m*{+cos(+phi),+sin(+phi)};
        parameter Real InverseTransformation[m, 2]={{+cos(-phi[k]),-sin(-phi[k])}
            for k in 1:m};
      public
        Modelica_Blocks_Interfaces.RealOutput zero "Zero sequence component"
          annotation (Placement(transformation(extent={{100,-70},{120,-90}},
                rotation=0)));
      equation
        m*zero = sum(u);
        y = TransformationMatrix*u;
        //u = fill(zero,m) + InverseTransformation*y;
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
Transformation of multi phase values (of voltages or currents) to space phasor and zero sequence value.
</HTML>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
      end ToSpacePhasor;

      block FromSpacePhasor
        "Conversion of space phasors to multi phase instantaneous values"
        extends Modelica_Blocks_Interfaces.MIMO(final nin=2, final nout=m);
        parameter Integer m(min=1) = 3 "Number of phases";
      protected
        parameter Modelica_SIunits.Angle phi[m]=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
        parameter Real TransformationMatrix[2, m]=2/m*{+cos(+phi),+sin(+phi)};
        parameter Real InverseTransformation[m, 2]={{+cos(-phi[k]),-sin(-phi[k])}
            for k in 1:m};
      public
        Modelica_Blocks_Interfaces.RealInput zero "Zero seqeuence component"
          annotation (Placement(transformation(extent={{-140,-60},{-100,-100}},
                rotation=0)));
      equation
        y = fill(zero, m) + InverseTransformation*u;
        //m*zero = sum(y);
        //u = TransformationMatrix *y;
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
Transformation of space phasor and zero sequence value to mutli phase values (of voltages or currents).
</HTML>"));
      end FromSpacePhasor;

      block ToPolar "Converts a space phasor to polar coordinates"
        extends Modelica_Blocks_Interfaces.MIMOs(final n=2);
        constant Real small=Modelica_Constants.small;
      equation
        y[1] = sqrt(u[1]^2 + u[2]^2);
        y[2] = if noEvent(y[1] <= small) then 0 else Modelica_Math.atan2(u[2],
          u[1]);
        /*
  if y[1] <= small then
    y[2] = 0;
  else
    if u[2] >= 0 then
      y[2] =  Modelica.Math.acos(u[1]/y[1]);
    else
      y[2] = -Modelica.Math.acos(u[1]/y[1]);
    end if;
  end if;
*/
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Line(points={{-60,60},{-60,-60},
                {60,-60}}, color={0,0,255}),Line(points={{-100,-100},{100,100}},
                color={0,0,255}),Polygon(points={{26,26},{14,20},{20,14},{26,26}},
                lineColor={0,0,255}),Line(
                      points={{-18,-18},{-14,-22},{-10,-28},{-6,-34},{-2,-44},{
                  0,-52},{0,-60}},
                      color={0,0,255},
                      smooth=Smooth.Bezier),Polygon(points={{-18,-18},{-14,-26},
                {-10,-22},{-18,-18}}, lineColor={0,0,255}),Text(
                      extent={{-100,100},{-6,-6}},
                      lineColor={0,0,255},
                      textString="R"),Text(
                      extent={{6,6},{100,-100}},
                      lineColor={0,0,255},
                      textString="P")}), Documentation(info="<HTML>
Converts a space phasor from rectangular coordinates to polar coordinates.
</HTML>"));
      end ToPolar;

      block FromPolar "Converts a space phasor from polar coordinates"
        extends Modelica_Blocks_Interfaces.MIMOs(final n=2);
      equation
        y = u[1]*{cos(u[2]),sin(u[2])};
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Line(points={{-60,60},{-60,-60},
                {60,-60}}, color={0,0,255}),Line(points={{-100,-100},{100,100}},
                color={0,0,255}),Polygon(points={{26,26},{14,20},{20,14},{26,26}},
                lineColor={0,0,255}),Line(
                      points={{-18,-18},{-14,-22},{-10,-28},{-6,-34},{-2,-44},{
                  0,-52},{0,-60}},
                      color={0,0,255},
                      smooth=Smooth.Bezier),Polygon(points={{-18,-18},{-14,-26},
                {-10,-22},{-18,-18}}, lineColor={0,0,255}),Text(
                      extent={{-100,100},{-6,-6}},
                      lineColor={0,0,255},
                      textString="P"),Text(
                      extent={{6,6},{100,-100}},
                      lineColor={0,0,255},
                      textString="R")}), Documentation(info="<HTML>
Converts a space phasor from polar coordinates to rectangular coordinates.
</HTML>"));
      end FromPolar;

      block QuasiRMS
        extends Modelica_Blocks_Interfaces.MISO(final nin=2);
        ToPolar toPolar
          annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
        Modelica_Blocks.Math.Gain gain(final k=1/sqrt(2))
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
      equation
        connect(u, toPolar.u) annotation (Line(
            points={{-120,0},{-42,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(toPolar.y[1], gain.u) annotation (Line(
            points={{-19,-0.5},{0,-0.5},{0,0},{18,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, y) annotation (Line(
            points={{41,0},{110,0}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics),
          Documentation(info="<html>
<p>
This model determines the RMS value of the input space phasor <code>u</code>.</p> </html>"),
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                      extent={{-60,40},{60,-20}},
                      lineColor={0,0,255},
                      textString="RMS")}));
      end QuasiRMS;
      annotation (Documentation(info="<HTML>
This package contains space phasor transformation blocks for use in controllers:
<ul>
<li>ToSpacePhasor: transforms a set of mutli phase values to space phasor and zero sequence system</li>
<li>FromSpacePhasor: transforms a space phasor and zero sequence system to a set of multi phase values</li>
<li>Rotator: rotates a space phasor (from one coordinate system into another)</li>
<li>ToPolar: Converts a space phasor from rectangular coordinates to polar coordinates</li>
<li>FromPolar: Converts a space phasor from polar coordinates to rectangular coordinates</li>
</ul>
<p>
Space phasors are defined as vectors of length = 2,
the first element representing the real part and the second element representing the imaginary part of the space phasor.
</p>
</HTML>", revisions="<HTML>
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
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.30 2004/11/05 Anton Haumer<br>
       several improvements in SpacePhasors.Blocks</li>
  <li> v1.6.1 2005/11/10 Anton Haumer<br>
       improved Transformation and Rotation</li>
  </ul>
</HTML>"));
    end Blocks;

    package Functions "Functions for space phasor transformation"
      extends Modelica_Icons.Package;
      function ToSpacePhasor
        "Conversion from multi phase input to space phasor and zero sequence component"
        extends Modelica_Icons.Function;
        input Real x[:] "Multi phase (voltage or current) input";
        output Real y[2] "Space phasor";
        output Real y0 "Zero sequence component (of voltage or current)";
      protected
        constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
        parameter Integer m=size(x, 1) "Number of phases";
        parameter Modelica_SIunits.Angle phi[m]=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
        parameter Real TransformationMatrix[2, m]=2/m*{+cos(+phi),+sin(+phi)};
        parameter Real InverseTransformation[m, 2]={{+cos(-phi[k]),-sin(-phi[k])}
            for k in 1:m};
      algorithm
        y := TransformationMatrix*x;
        y0 := 1/m*sum(x);
        annotation (Inline=true, Documentation(info="<HTML>
Transformation of multi phase values (of voltages or currents) to space phasor and zero sequence value.
</HTML>"));
      end ToSpacePhasor;

      function FromSpacePhasor
        "Conversion from space phasor and zero sequence component to multi phase"
        extends Modelica_Icons.Function;
        input Real x[2] "Space phasor";
        input Real x0 "Zero sequence component";
        input Integer m "Number of phases";
        output Real y[m] "Multi phase output";
      protected
        constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
        parameter Modelica_SIunits.Angle phi[m]=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
        parameter Real TransformationMatrix[2, m]=2/m*{+cos(+phi),+sin(+phi)};
        parameter Real InverseTransformation[m, 2]={{+cos(-phi[k]),-sin(-phi[k])}
            for k in 1:m};

      algorithm
        y := fill(x0, m) + InverseTransformation*x;

        annotation (Inline=true, Documentation(info="<HTML>
Transformation of space phasor and zero sequence value to mutli phase values (of voltages or currents).
</HTML>"));
      end FromSpacePhasor;

      function Rotator "Rotates space phasor"
        extends Modelica_Icons.Function;
        input Real x[2] "Input space phasor";
        input Modelica_SIunits.Angle angle "Input angle of rotation";
        output Real y[2] "Output space phasor";
      protected
        Real RotationMatrix[2, 2]={{+cos(-angle),-sin(-angle)},{+sin(-angle),+
            cos(-angle)}};
      algorithm
        y := RotationMatrix*x;
        annotation (Inline=true, Documentation(info="<HTML>
Rotates a space phasor (voltage or current) input <code>u</code> by the <code>angle</code> in negative mathematical direction. This block represents the transformation of one space phasor <code>u</code> from one rotating reference (coordinate) frame into another where the spave phasor is <code>y</code>. The output reference frame leads the input reference frame by angle <code>angle</code>.

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/Rotator.png\">
    </td>
  </tr>
  <caption align=\"bottom\"><b>Fig. 1:</b> Original and rotated reference frame of a space phasor </caption>
</table>
</HTML>"));
      end Rotator;

      function ToPolar "Converts a space phasor to polar coordinates"
        extends Modelica_Icons.Function;
        input Real x[2] "Real and imaginary part of space phasor";
        output Real absolute "Magnitude of space phasor";
        output Modelica_SIunits.Angle angle "Angle of space phasor";
      protected
        constant Real small=Modelica_Constants.small;
      algorithm
        absolute := sqrt(x[1]^2 + x[2]^2);
        angle := if absolute <= small then 0 else Modelica_Math.atan2(x[2], x[1]);
        /*
  if absolute <= small then
    angle := 0;
  else
    if x[2] >= 0 then
      angle :=  Modelica.Math.acos(x[1]/absolute);
    else
      angle := -Modelica.Math.acos(x[1]/absolute);
    end if;
  end if;
*/
        annotation (Inline=true, Documentation(info="<HTML>
Converts a space phasor from rectangular coordinates to polar coordinates, providing angle=0 for {0,0}.
</HTML>"));
      end ToPolar;

      function FromPolar "Converts a space phasor from polar coordinates"
        extends Modelica_Icons.Function;
        input Real absolute "Magnitude of space phasor";
        input Modelica_SIunits.Angle angle "Angle of space phasor";
        output Real x[2] "Real and imaginary part of space phasor";
      protected
        constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
        constant Real small=Modelica_Constants.small;
      algorithm
        x := absolute*{cos(angle),sin(angle)};
        annotation (Inline=true, Documentation(info="<HTML>
Converts a space phasor from polar coordinates to rectangular coordinates.
</HTML>"));
      end FromPolar;

      function quasiRMS "Calculate quasi-RMS value of input"
        extends Modelica_Icons.Function;
        import Modelica_Constants.pi;
        input Real x[3];
        output Real y;
      protected
        Integer m=size(x, 1) "Number of phases";
        Modelica_SIunits.Angle phi[m]=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m);
        Real TransformationMatrix[2, m]=2/m*{+cos(+phi),+sin(+phi)};
        Real h[2]=TransformationMatrix*x;
      algorithm
        y := sqrt(h[1]^2 + h[2]^2)/sqrt(2);
        annotation (Inline=true, Documentation(info="<HTML>
  Transformation of m phase values (voltages or currents) to space phasor and calculate length of space phasor / sqrt(2).
</HTML>"));
      end quasiRMS;

      function activePower
        "Calculate active power of voltage and current input"
        extends Modelica_Icons.Function;
        input Modelica_SIunits.Voltage v[m] "phase voltages";
        input Modelica_SIunits.Current i[m] "phase currents";
        output Modelica_SIunits.Power p "Active power";
      protected
        constant Integer m=3 "Number of phases";
        constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
        Modelica_SIunits.Voltage v_[2] "Voltage space phasor";
        Modelica_SIunits.Current i_[2] "Current space phasor";
      algorithm
        v_ := zeros(2);
        i_ := zeros(2);
        for k in 1:m loop
          v_ := v_ + 2/m*{+cos((k - 1)/m*2*pi),+sin(+(k - 1)/m*2*pi)}*v[k];
          i_ := i_ + 2/m*{+cos((k - 1)/m*2*pi),+sin(+(k - 1)/m*2*pi)}*i[k];
        end for;
        p := m/2*(+v_[1]*i_[1] + v_[2]*i_[2]);
        annotation (Inline=true, Documentation(info="<HTML>
Transformation of three phase voltages and currents to space phasors and calculate active power.
</HTML>"));
      end activePower;
      annotation (Documentation(info="<HTML>
This package contains space phasor transformation functions for use in calculations:
<ul>
<li>ToSpacePhasor: transforms a set of three-phase values to space phasor and zero sequence system</li>
<li>FromSpacePhasor: transforms a space phasor and zero sequence system to a set of three-phase values</li>
<li>Rotator: rotates a space phasor (from one coordinate system into another)</li>
<li>ToPolar: Converts a space phasor from rectangular coordinates to polar coordinates</li>
<li>FromPolar: Converts a space phasor from polar coordinates to rectangular coordinates</li>
</ul>
<p>
Space phasors are defined as vectors of length = 2,
the first element representing the real part and the second element representing the imaginary part of the space phasor.
</p>
</HTML>", revisions="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting &amp; Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>

  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.6.1 2005/11/10 Anton Haumer<br>
       improved Transformation and Rotation</li>
  </ul>
  </dd>

  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2013, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</dl>
</HTML>"));
    end Functions;
    annotation (Documentation(info="<HTML>
<p>
This package contains components, blocks and functions to utilize space phasor theory.
</p>
<p>
Space phasors are defined as vectors of length = 2,
the first element representing the real part and the second element representing the imaginary part of the space phasor.
</p>
<p>
You may have a look at a short summary of space phasor theory at <a href=\"http://www.haumer.at/refimg/SpacePhasors.pdf\">http://www.haumer.at/refimg/SpacePhasors.pdf</a>
</p>
</HTML>", revisions="<HTML>
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
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.30 2004/11/05 Anton Haumer<br>
       several improvements in SpacePhasors.Blocks</li>
  <li> v1.60 2005/11/03 Anton Haumer<br>
       added Components.Rotator</li>
  <li> v1.6.1 2005/11/10 Anton Haumer<br>
       improved Transformation and Rotation</li>
  </ul>
</HTML>"));
  end SpacePhasors;

  package Losses "Loss models for electric machines"
    extends Modelica_Icons.Package;
    record FrictionParameters "Parameter record for friction losses"
      extends Modelica_Icons.Record;
      parameter Modelica_SIunits.Power PRef(min=0) = 0
        "Reference friction losses at wRef";
      parameter Modelica_SIunits.AngularVelocity wRef(displayUnit="1/min", min=
            Modelica_Constants.small)
        "Reference angular velocity that the PRef refer to";
      parameter Real power_w(min=Modelica_Constants.small) = 2
        "Exponent of friction torque w.r.t. angular velocity";
      final parameter Modelica_SIunits.Torque tauRef=if (PRef <= 0) then 0
           else PRef/wRef
        "Reference friction torque at reference angular velocity";
      final parameter Real linear=0.001
        "Linear angular velocity range with respect to reference angular velocity";
      final parameter Modelica_SIunits.AngularVelocity wLinear=linear*wRef
        "Linear angular velocity range";
      final parameter Modelica_SIunits.Torque tauLinear=if (PRef <= 0) then 0
           else tauRef*(wLinear/wRef)^power_w
        "Torque corresponding with linear angular velocity range";
      annotation (defaultComponentPrefixes="parameter ", Documentation(info="<html>
<p>
Parameter record for <a href=\"modelica://Modelica.Electrical.Machines.Losses.Friction\">Friction</a> losses.
</p>
</html>"));
    end FrictionParameters;

    record BrushParameters "Parameter record for brush losses"
      extends Modelica_Icons.Record;
      parameter Modelica_SIunits.Voltage V=0
        "Total voltage drop of brushes for currents > ILinear";
      parameter Modelica_SIunits.Current ILinear(start=0.01)
        "Current indicating linear voltage region of brush voltage drop";
      annotation (defaultComponentPrefixes="parameter ", Documentation(info="<html>
<p>
Parameter record for <a href=\"modelica://Modelica.Electrical.Machines.Losses.InductionMachines.Brush\">three-phase Brush</a> and
<a href=\"modelica://Modelica.Electrical.Machines.Losses.DCMachines.Brush\">DC Brush</a> losses.
</p>
</html>"));
    end BrushParameters;

    record StrayLoadParameters "Parameter record for stray load losses"
      extends Modelica_Icons.Record;
      parameter Modelica_SIunits.Power PRef(min=0) = 0
        "Reference stray load losses at IRef and wRef";
      parameter Modelica_SIunits.Current IRef(min=Modelica_Constants.small)
        "Reference RMS current that PRef refers to";
      parameter Modelica_SIunits.AngularVelocity wRef(displayUnit="1/min", min=
            Modelica_Constants.small)
        "Reference angular velocity that PRef refers to";
      parameter Real power_w(min=Modelica_Constants.small) = 1
        "Exponent of stray load loss torque w.r.t. angular velocity";
      final parameter Modelica_SIunits.Torque tauRef=if (PRef <= 0) then 0
           else PRef/wRef
        "Reference stray load torque at reference angular velocity and reference current";
      annotation (defaultComponentPrefixes="parameter ", Documentation(info="<html>
<p>
Parameter record for <a href=\"modelica://Modelica.Electrical.Machines.Losses.InductionMachines.StrayLoad\">three-phase</a> and
<a href=\"modelica://Modelica.Electrical.Machines.Losses.DCMachines.StrayLoad\">DC</a> stray load losses.
</p>
</html>"));
    end StrayLoadParameters;

    record CoreParameters "Parameter record for core losses"
      extends Modelica_Icons.Record;
      parameter Integer m
        "Number of phases (1 for DC, 3 for induction machines)";
      parameter Modelica_SIunits.Power PRef(min=0) = 0
        "Reference core losses at reference inner voltage VRef";
      parameter Modelica_SIunits.Voltage VRef(min=Modelica_Constants.small)
        "Reference inner RMS voltage that reference core losses PRef refer to";
      parameter Modelica_SIunits.AngularVelocity wRef(min=Modelica_Constants.small)
        "Reference angular velocity that reference core losses PRef refer to";
      // In the current implementation ratioHysterisis = 0 since hysteresis losses are not implemented yet
      final parameter Real ratioHysteresis(
        min=0,
        max=1,
        start=0.775) = 0
        "Ratio of hysteresis losses with respect to the total core losses at VRef and fRef";
      final parameter Modelica_SIunits.Conductance GcRef=if (PRef <= 0) then 0
           else PRef/VRef^2/m
        "Reference conductance at reference frequency and voltage";
      final parameter Modelica_SIunits.AngularVelocity wMin=1e-6*wRef;
      annotation (defaultComponentPrefixes="parameter ", Documentation(info="<html>
<p>
Parameter record for <a href=\"modelica://Modelica.Electrical.Machines.Losses.InductionMachines.Core\">core losses of induction machines</a>
and <a href=\"modelica://Modelica.Electrical.Machines.Losses.DCMachines.Core\">core losses of DC machines</a>.
</p>
</html>"));
    end CoreParameters;

    record PermanentMagnetLossParameters
      "Parameter record for permanent magnet losses"
      extends Modelica_Icons.Record;
      parameter Modelica_SIunits.Power PRef(min=0) = 0
        "Reference permanent magnet losses at IRef and wRef";
      parameter Real c(
        min=0,
        max=1) = 0
        "Part of permanent magnet losses at current = 0, i.e. independent of current";
      parameter Modelica_SIunits.Current IRef(min=Modelica_Constants.small)
        "Reference stator RMS current that PRef refers to";
      parameter Real power_I(min=Modelica_Constants.small) = 2
        "Exponent of permanent magnet loss torque w.r.t. stator current";
      parameter Modelica_SIunits.AngularVelocity wRef(displayUnit="1/min", min=
            Modelica_Constants.small)
        "Reference angular velocity that PRef refers to";
      parameter Real power_w(min=Modelica_Constants.small) = 1
        "Exponent of permanent magnet loss torque w.r.t. angular velocity";
      final parameter Modelica_SIunits.Torque tauRef=if (PRef <= 0) then 0
           else PRef/wRef
        "Reference permanent magnet loss torque at reference angular velocity and reference current";
      annotation (defaultComponentPrefixes="parameter ", Documentation(info="<html>
<p>
Parameter record for <a href=\"modelica://Modelica.Electrical.Machines.Losses.InductionMachines.PermanentMagnetLosses\">permanent magnet losses</a>.
</p>
</html>"));
    end PermanentMagnetLossParameters;

    model Friction "Model of angular velocity dependent friction losses"
      extends Modelica_Electrical_Machines_Interfaces.FlangeSupport;
      parameter FrictionParameters frictionParameters
        "Friction loss parameters";
      extends
        Modelica_Thermal_HeatTransfer_Interfaces.PartialElementaryConditionalHeatPortWithoutT(
          useHeatPort=false);
    equation
      if (frictionParameters.PRef <= 0) then
        tau = 0;
      else
        tau = -smooth(1, if w >= +frictionParameters.wLinear then +
          frictionParameters.tauRef*(+w/frictionParameters.wRef)^
          frictionParameters.power_w else if w <= -frictionParameters.wLinear
           then -frictionParameters.tauRef*(-w/frictionParameters.wRef)^
          frictionParameters.power_w else frictionParameters.tauLinear*(w/
          frictionParameters.wLinear));
      end if;
      lossPower = -tau*w;
      annotation (Icon(graphics={Ellipse(
                  extent={{-60,60},{60,-60}},
                  lineColor={0,0,0},
                  fillColor={175,175,175},
                  fillPattern=FillPattern.Solid),Ellipse(
                  extent={{-50,50},{50,-50}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Ellipse(
                  extent={{-12,50},{8,30}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={135,135,135}),Ellipse(
                  extent={{-10,-30},{10,-50}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={135,135,135}),Ellipse(
                  extent={{24,-10},{44,-30}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={135,135,135}),Ellipse(
                  extent={{22,34},{42,14}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={135,135,135}),Ellipse(
                  extent={{-44,30},{-24,10}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={135,135,135}),Ellipse(
                  extent={{-44,-12},{-24,-32}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={135,135,135}),Ellipse(
                  extent={{-30,30},{30,-30}},
                  lineColor={0,0,0},
                  fillColor={175,175,175},
                  fillPattern=FillPattern.Solid),Ellipse(
                  extent={{-20,20},{20,-20}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(
                  visible=useHeatPort,
                  points={{-40,0},{-100,0},{-100,-90}},
                  color={255,0,0},
                  smooth=Smooth.None),Line(
                  points={{0,90},{0,0}},
                  color={95,95,95},
                  smooth=Smooth.None),Line(
                  points={{0,-60},{0,-90}},
                  color={95,95,95},
                  smooth=Smooth.None),Text(
                  extent={{-100,90},{100,60}},
                  lineColor={0,0,255},
                  textString="%name")}), Documentation(info="<html>
<p>
The friction losses are considered by the equations
</p>
<pre>
   tau / tauRef = (+w / wRef) ^ power_w    for w &gt; +wLinear
 - tau / tauRef = (-w / wRef) ^ power_w    for w &lt; -wLinear
</pre>
<p>
with
</p>
<pre>
  tauRef * wRef = PRef
</pre>
<p>
being the friction torque at the reference angular velocity
<code>wRef</code>. The exponent <code>power_w</code> is
approximately 1.5 for axial ventilation and approximately 2.0 for radial ventilation.
</p>
<p>
For stability reasons the friction torque <code>tau</code> is approximated by a linear curve
</p>
<pre>
  tau / tauLinear = w / wLinear
</pre>
<p>
with
</p>
<pre>
  tauLinear = tauRef*(wLinear/wRef) ^ power_w
</pre>
<p>
in the range <code> -wLinear &le; w &le; wLinear</code> with <code>wLinear = 0.001 * wRef</code>. The relationship of torque
and angular velocity is depicted in Fig. 1
</p>
<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/frictiontorque.png\"
                alt=\"frictiontorque.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 1: </b>Friction loss torque versus angular velocity for <code>power_w = 2</code></td>
  </tr>
</table>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.FrictionParameters\">FrictionParameters</a>
</p>
<p>
If it is desired to neglect friction losses, set <code>frictionParameters.PRef = 0</code> (this is the default).
</p>
</html>"));
    end Friction;

    package InductionMachines "Loss models for induction machines"
      extends Modelica_Icons.VariantsPackage;
      model Brush "Model considering voltage drop of carbon brushes"
        extends Modelica_Electrical_MultiPhase_Interfaces.TwoPlug;
        parameter BrushParameters brushParameters "Brush loss parameters";
        extends
          Modelica_Thermal_HeatTransfer_Interfaces.PartialConditionalHeatPort(
            useHeatPort=false,final T=293.15);
        DCMachines.Brush brush[3](each final brushParameters=brushParameters,
            each final useHeatPort=true)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      equation
        connect(plug_p.pin, brush.p) annotation (Line(
            points={{-100,0},{-10,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(brush.n, plug_n.pin) annotation (Line(
            points={{10,0},{100,0}},
            color={0,0,255},
            smooth=Smooth.None));
        for j in 1:m loop
          connect(brush[j].heatPort, internalHeatPort) annotation (Line(
              points={{-10,-10},{-10,-60},{-100,-60},{-100,-80}},
              color={191,0,0},
              smooth=Smooth.None));
        end for;
        annotation (Icon(graphics={Line(points={{-100,-100},{-92,-80},{-80,-60},
                {-60,-40},{-40,-28},{-20,-22},{0,-20},{20,-22},{40,-28},{60,-40},
                {80,-60},{92,-80},{100,-100}}, color={0,0,255}),Polygon(
                      points={{-20,-22},{-40,-28},{-40,20},{40,20},{40,-28},{20,
                  -22},{0,-20},{-20,-22}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid),Line(points={{-90,0},{-40,
                0}}, color={0,0,255}),Line(points={{40,0},{90,0}}, color={0,0,
                255}),Text(
                      extent={{-100,70},{100,40}},
                      lineColor={0,0,255},
                      textString="%name")}), Documentation(info="<html>
<p>
Model of voltage drop and losses of carbon brushes. This three-phase model uses three
<a href=\"modelica://Modelica.Electrical.Machines.Losses.DCMachines.Brush\">DC Brush</a> loss models.
</p>
</html>"));
      end Brush;

      model StrayLoad
        "Model of stray load losses dependent on current and speed"
        extends Modelica_Electrical_MultiPhase_Interfaces.OnePort;
        extends Modelica_Electrical_Machines_Interfaces.FlangeSupport;
        import Modelica_Electrical_MultiPhase.Functions.quasiRMS;
        parameter StrayLoadParameters strayLoadParameters
          "Stray load loss parameters";
        extends
          Modelica_Thermal_HeatTransfer_Interfaces.PartialElementaryConditionalHeatPortWithoutT(
            useHeatPort=false);
        Modelica_SIunits.Current iRMS=quasiRMS(i);
      equation
        v = zeros(m);
        if (strayLoadParameters.PRef <= 0) then
          tau = 0;
        else
          tau = -strayLoadParameters.tauRef*(iRMS/strayLoadParameters.IRef)^2*
            smooth(1, if w >= 0 then +(+w/strayLoadParameters.wRef)^
            strayLoadParameters.power_w else -(-w/strayLoadParameters.wRef)^
            strayLoadParameters.power_w);
        end if;
        lossPower = -tau*w;
        annotation (Icon(graphics={Line(points={{-90,0},{90,0}}, color={0,0,255}),
                Rectangle(
                      extent={{-70,30},{70,-30}},
                      lineColor={0,0,255},
                      pattern=LinePattern.Dot),Text(
                      extent={{-100,70},{100,40}},
                      lineColor={0,0,255},
                      textString="%name")}), Documentation(info="<html>
<p>
Stray load losses are modeled similar to standards EN 60034-2 and IEEE 512, i.e., they are dependent on square of current,
but without scaling them to zero at no-load current.
</p>
<p>
For an estimation of dependency on varying angular velocity see:<br>
W. Lang, &Uuml;ber die Bemessung verlustarmer Asynchronmotoren mit K&auml;figl&auml;ufer f&uuml;r Pulsumrichterspeisung,
Doctoral Thesis, Technical University of Vienna, 1984.
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
        extends Modelica_Electrical_Machines_Interfaces.FlangeSupport;
        import Modelica_Electrical_MultiPhase.Functions.quasiRMS;
        parameter Integer m(min=1) = 3 "Number of phases";
        parameter PermanentMagnetLossParameters permanentMagnetLossParameters
          "Permanent magnet loss parameters";
        extends
          Modelica_Thermal_HeatTransfer_Interfaces.PartialElementaryConditionalHeatPortWithoutT(
            useHeatPort=false);
        input Modelica_SIunits.Current is[m] "Instantaneous stator currents";
        Modelica_SIunits.Current iRMS=quasiRMS(is);
      equation
        if (permanentMagnetLossParameters.PRef <= 0) then
          tau = 0;
        else
          tau = -permanentMagnetLossParameters.tauRef*(
            permanentMagnetLossParameters.c + (1 -
            permanentMagnetLossParameters.c)*(iRMS/
            permanentMagnetLossParameters.IRef)^permanentMagnetLossParameters.power_I)
            *smooth(1, if w >= 0 then +(+w/permanentMagnetLossParameters.wRef)^
            permanentMagnetLossParameters.power_w else -(-w/
            permanentMagnetLossParameters.wRef)^permanentMagnetLossParameters.power_w);
        end if;
        lossPower = -tau*w;
        annotation (Icon(graphics={Ellipse(extent={{-40,-40},{40,40}},
                lineColor={200,0,0})}), Documentation(info="<html>
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

      model Core "Model of core losses"
        parameter CoreParameters coreParameters(final m=m);
        final parameter Integer m=3 "Number of phases";
        parameter Real turnsRatio(final min=Modelica_Constants.small)
          "Effective number of stator turns / effective number of rotor turns (if used as rotor core)";
        extends
          Modelica_Thermal_HeatTransfer_Interfaces.PartialElementaryConditionalHeatPortWithoutT(
            useHeatPort=false);
        Modelica_Electrical_Machines_Interfaces.SpacePhasor spacePhasor
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0), iconTransformation(extent={{-110,-10},{-90,10}})));
        input Modelica_SIunits.AngularVelocity w
          "Remagnetization angular velocity" annotation (Dialog(group="Losses"));
        Modelica_SIunits.Conductance Gc "Variable core loss conductance";
      protected
        Modelica_SIunits.AngularVelocity wLimit=noEvent(max(noEvent(abs(w)),
            coreParameters.wMin)) "Limited angular velocity";
      equation
        if (coreParameters.PRef <= 0) then
          Gc = 0;
          spacePhasor.i_ = zeros(2);
        else
          Gc = coreParameters.GcRef;
          //  * (coreParameters.wRef/wLimit*coreParameters.ratioHysteresis + 1 - coreParameters.ratioHysteresis);
          spacePhasor.i_ = Gc*spacePhasor.v_;
        end if;
        lossPower = 3/2*(+spacePhasor.v_[1]*spacePhasor.i_[1] + spacePhasor.v_[
          2]*spacePhasor.i_[2]);
        annotation (Icon(graphics={Rectangle(
                      extent={{-70,30},{70,-30}},
                      lineColor={0,0,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{-90,0},{-70,
                0}}),Line(points={{-70,10},{70,10}}, color={0,0,255}),Line(
                points={{-70,-30},{70,-30}}, color={0,0,255}),Line(points={{-70,
                -10},{70,-10}}, color={0,0,255}),Line(
                      points={{70,0},{80,0}},
                      color={0,0,255},
                      smooth=Smooth.None),Line(
                      points={{80,20},{80,-20}},
                      color={0,0,255},
                      smooth=Smooth.None),Line(
                      points={{90,14},{90,-14}},
                      color={0,0,255},
                      smooth=Smooth.None),Line(
                      points={{100,8},{100,-8}},
                      color={0,0,255},
                      smooth=Smooth.None),Text(
                      extent={{-100,70},{100,40}},
                      lineColor={0,0,255},
                      textString="%name")}), Documentation(info="<html>
<p>
Core losses can be separated into <b>eddy current</b> and <b>hysteresis</b> losses. The total core losses
can thus be expressed as
</p>
<pre>
  P = PRef * (ratioHysteresis * (wRef / w) + 1 - ratioHysteresis) * (V / VRef)^2
</pre>
<p>
where <code>w</code> is the actual angular remagnetization velocity and <code>V</code> is the actual voltage.
The term <code>ratioHysteresis</code> is the ratio of the hysteresis losses with respect to the total core losses for the reference voltage and frequency.
</p>

<p>
In the current implementation hysteresis losses are <b>not considered</b> since complex numbers are not provided in Modelica.
Therefore, implicitly <code>ratioHysteresis = 0</code> is set. For the voltage and frequency range with respect to Fig.&nbsp;1,
the dependency of total core losses on the parameter <code>ratioHysteresis</code> is depicted in Fig.&nbsp;2.
The current implementation has thus the drawback over a model that considers <code>ratioHysteresis &gt; 0</code>:
</p>
<ul>
<li>underestimation of the losses in the constant field region (<code>w</code> &lt; <code>wRef</code>)</li>
<li>overestimation of the losses in the field weakening region (<code>w</code> &gt; <code>wRef</code>)</li>
</ul>

<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/corelossesVw.png\"
                alt=\"corelossesVw.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 1: </b>Voltage versus angular velocity</td>
  </tr>
</table>

<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/corelossesPcw.png\"
                alt=\"corelossesPcw.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 2: </b>Core losses versus angular velocity with parameter <code>ratioHysteresis</code></td>
  </tr>
</table>

<h4>Note</h4>
<p>In the current implementation it is assumed that <code>ratioHysteresis = 0</code>. This parameter cannot be changed due to compatibility reasons.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.CoreParameters\">Core loss parameters</a>
</p>

</html>"));
      end Core;
      annotation (Documentation(info="<HTML>
This package contains loss models used for induction machine models.
</HTML>", revisions="<HTML>
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
  <li> v2.4.0 2010/04/20 Anton Haumer<br>
       first implementation</li>
  </ul>
</HTML>"));
    end InductionMachines;

    package DCMachines "Loss models for DC machines"
      extends Modelica_Icons.VariantsPackage;
      model Brush "Model considering voltage drop of carbon brushes"
        extends Modelica_Electrical_Analog_Interfaces.OnePort;
        parameter BrushParameters brushParameters "Brush loss parameters";
        extends
          Modelica_Thermal_HeatTransfer_Interfaces.PartialElementaryConditionalHeatPortWithoutT(
            useHeatPort=false);
      equation
        if (brushParameters.V <= 0) then
          v = 0;
        else
          v = smooth(1, if (i > +brushParameters.ILinear) then +brushParameters.V
             else if (i < -brushParameters.ILinear) then -brushParameters.V
             else brushParameters.V*i/brushParameters.ILinear);
        end if;
        lossPower = v*i;
        annotation (Icon(graphics={Line(points={{-100,-100},{-92,-80},{-80,-60},
                {-60,-40},{-40,-28},{-20,-22},{0,-20},{20,-22},{40,-28},{60,-40},
                {80,-60},{92,-80},{100,-100}}, color={0,0,255}),Polygon(
                      points={{-20,-22},{-40,-28},{-40,20},{40,20},{40,-28},{20,
                  -22},{0,-20},{-20,-22}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid),Line(points={{-90,0},{-40,
                0}}, color={0,0,255}),Line(points={{40,0},{90,0}}, color={0,0,
                255}),Text(
                      extent={{-100,70},{100,40}},
                      lineColor={0,0,255},
                      textString="%name")}), Documentation(info="<html>
<p>
Model of voltage drop and losses of carbon brushes. For currents between <code>-ILinear</code> and <code>ILinear</code>
 the voltage drop shows a linear behavior as depicted in Fig. 1.
 For positive currents greater or equal than <code>ILinear</code> the voltage drop equals <code>V</code>.
 For negative currents less or equal than <code>-ILinear</code> the voltage drop equals <code>-V</code>.
</p>

<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/brush.png\"
                alt=\"brush.png\"> </td> </tr>
  <tr><td> <b> Fig. 1: </b>Model of voltage drop of carbon brushes</td> </tr>
</table>
<h4>Note:</h4>
<p>
The voltage drop <code>v</code> is the total voltage drop of all series connected brushes.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.BrushParameters\">BrushParameters</a>
</p>
<p>
If it is desired to neglect brush losses, set <code>brushParameters.V = 0</code> (this is the default).
</p>
</html>"));
      end Brush;

      function brushVoltageDrop "Voltage drop of carbon brushes"
        extends Modelica_Icons.Function;
        input BrushParameters brushParameters "Brush loss parameters";
        input Modelica_SIunits.Current i "Actual current";
        output Modelica_SIunits.Voltage v "Voltage drop";
      algorithm
        if (brushParameters.V <= 0) then
          v := 0;
        else
          v := if (i > +brushParameters.ILinear) then +brushParameters.V else
            if (i < -brushParameters.ILinear) then -brushParameters.V else
            brushParameters.V*i/brushParameters.ILinear;
        end if;
        annotation (Documentation(info="<html>
<p>
Calculates the voltage drop of carbon brushes, according to
<a href=\"modelica://Modelica.Electrical.Machines.Losses.DCMachines.Brush\">Brush</a> losses,
e.g., used for initial equations.
</p>
</html>"));
      end brushVoltageDrop;

      model StrayLoad
        "Model of stray load losses dependent on current and speed"
        extends Modelica_Electrical_Analog_Interfaces.OnePort;
        extends Modelica_Electrical_Machines_Interfaces.FlangeSupport;
        parameter StrayLoadParameters strayLoadParameters
          "Stray load loss parameters";
        extends
          Modelica_Thermal_HeatTransfer_Interfaces.PartialElementaryConditionalHeatPortWithoutT(
            useHeatPort=false);
      equation
        v = 0;
        if (strayLoadParameters.PRef <= 0) then
          tau = 0;
        else
          tau = -strayLoadParameters.tauRef*(i/strayLoadParameters.IRef)^2*
            smooth(1, if w >= 0 then +(+w/strayLoadParameters.wRef)^
            strayLoadParameters.power_w else -(-w/strayLoadParameters.wRef)^
            strayLoadParameters.power_w);
        end if;
        lossPower = -tau*w;
        annotation (Icon(graphics={Line(points={{-90,0},{90,0}}, color={0,0,255}),
                Rectangle(
                      extent={{-70,30},{70,-30}},
                      lineColor={0,0,255},
                      pattern=LinePattern.Dot),Text(
                      extent={{-100,70},{100,40}},
                      lineColor={0,0,255},
                      textString="%name")}), Documentation(info="<html>
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
<p>
The stray load losses are modeled such way that they do not cause a voltage drop in the electric circuit.
Instead, the dissipated losses are considered through an equivalent braking torque at the shaft.
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

      model Core "Model of core losses"
        extends Modelica_Electrical_Analog_Interfaces.OnePort;
        parameter CoreParameters coreParameters(final m=1)
          "Armature core losses";
        extends
          Modelica_Thermal_HeatTransfer_Interfaces.PartialElementaryConditionalHeatPortWithoutT(
            useHeatPort=false);
        input Modelica_SIunits.AngularVelocity w
          "Remagnetization angular velocity" annotation (Dialog(group="Losses"));
        Modelica_SIunits.Conductance Gc "Variable core loss conductance";
      protected
        Modelica_SIunits.AngularVelocity wLimit=noEvent(max(noEvent(abs(w)),
            coreParameters.wMin)) "Limited angular velocity";
      equation
        if (coreParameters.PRef <= 0) then
          Gc = 0;
          i = 0;
        else
          Gc = coreParameters.GcRef;
          // * (coreParameters.wRef/wLimit*coreParameters.ratioHysteresis + 1 - coreParameters.ratioHysteresis);
          i = Gc*v;
        end if;
        lossPower = v*i;
        annotation (Icon(graphics={Rectangle(
                      extent={{-70,30},{70,-30}},
                      lineColor={0,0,255},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(points={{70,0},{90,0}}),
                Line(points={{-90,0},{-70,0}}),Line(points={{-70,10},{70,10}},
                color={0,0,255}),Line(points={{-70,-30},{70,-30}}, color={0,0,
                255}),Line(points={{-70,-10},{70,-10}}, color={0,0,255}),Text(
                      extent={{-100,70},{100,40}},
                      lineColor={0,0,255},
                      textString="%name")}), Documentation(info="<html>
<p>
Core losses can be separated into <i>eddy current</i> and <i>hysteresis</i> losses. The total core losses
can thus be expressed as
</p>
<pre>
  p = PRef * (ratioHysteresis * (wRef / w) + 1 - ratioHysteresis) * (v / VRef)^2
</pre>
<p>
where <code>w</code> is the actual angular velocity and <code>v</code> is the actual voltage. The term <code>ratioHysteresis</code> is the ratio
of the hysteresis losses with respect to the total core losses for reference inner voltage and reference angular velocity.
</p>

<p>
For the voltage and angular velocity range with respect to Fig.&nbsp;1,
the dependency of total core losses on the parameter <code>ratioHysteresis</code> is depicted in Fig.&nbsp;2.
</p>

<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/corelossesVw.png\"
                alt=\"corelossesVw.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 1: </b>Voltage versus angular velocity</td>
  </tr>
</table>

<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/corelossesPcw.png\"
                alt=\"corelossesPcw.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 2: </b>Core losses versus angular velocity with parameter <code>ratioHysteresis</code></td>
  </tr>
</table>

<h4>Note</h4>
<p>In the current implementation it is assumed that <code>ratioHysteresis = 0</code>. This parameter cannot be changed due to compatibility reasons.</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.CoreParameters\">Core loss parameters</a>
</p>

</html>"));
      end Core;
      annotation (Documentation(info="<HTML>
This package contains loss models used for DC machine models.
</HTML>", revisions="<HTML>
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
  <li> v2.4.0 2010/04/20 Anton Haumer<br>
       first implementation</li>
  </ul>
</HTML>"));
    end DCMachines;
    annotation (Documentation(info="<HTML>
This package contains loss models and their parameter records used for machine models.
</HTML>", revisions="<HTML>
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
  <li> v2.4.0 2010/04/20 Anton Haumer<br>
       first implementation</li>
  </ul>
</HTML>"));
  end Losses;

  package Thermal "Library with models for connecting thermal models"
    extends Modelica_Icons.Package;
    type LinearTemperatureCoefficient20 =
        Modelica_SIunits.LinearTemperatureCoefficient
      "Linear temperature coefficient with choices" annotation (choices(
        choice=Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero
          "Not temperature dependent",
        choice=Modelica_Electrical_Machines.Thermal.Constants.alpha20Aluminium
          "Aluminium",
        choice=Modelica_Electrical_Machines.Thermal.Constants.alpha20Brass "Brass",
        choice=Modelica_Electrical_Machines.Thermal.Constants.alpha20Bronze "Bronze",
        choice=Modelica_Electrical_Machines.Thermal.Constants.alpha20Copper "Copper"));
    package Constants "Material Constants"
      extends Modelica_Icons.Package;
      constant Modelica_SIunits.LinearTemperatureCoefficient alpha20Zero=0
        "Not temperature dependent";
      constant Modelica_SIunits.LinearTemperatureCoefficient alpha20Aluminium=
          4.000e-3 "Aluminium";
      constant Modelica_SIunits.LinearTemperatureCoefficient alpha20Brass=
          1.100e-3 "Brass";
      constant Modelica_SIunits.LinearTemperatureCoefficient alpha20Bronze=
          0.800e-3 "Bronze";
      constant Modelica_SIunits.LinearTemperatureCoefficient alpha20Copper=
          3.920e-3 "Copper";
      annotation (Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}),
            graphics={Polygon(
                  origin={-9.2597,25.6673},
                  fillColor={102,102,102},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{48.017,11.336},{48.017,11.336},{10.766,11.336},{-25.684,
                10.95},{-34.944,-15.111},{-34.944,-15.111},{-32.298,-15.244},{-32.298,
                -15.244},{-22.112,0.168},{11.292,0.234},{48.267,-0.097},{48.267,
                -0.097}},
                  smooth=Smooth.Bezier),Polygon(
                  origin={-19.9923,-8.3993},
                  fillColor={102,102,102},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{3.239,37.343},{3.305,37.343},{-0.399,2.683},{-16.936,
                -20.071},{-7.808,-28.604},{6.811,-22.519},{9.986,37.145},{9.986,
                37.145}},
                  smooth=Smooth.Bezier),Polygon(
                  origin={23.753,-11.5422},
                  fillColor={102,102,102},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{-10.873,41.478},{-10.873,41.478},{-14.048,-4.162},{-9.352,
                -24.8},{7.912,-24.469},{16.247,0.27},{16.247,0.27},{13.336,
                0.071},{13.336,0.071},{7.515,-9.983},{-3.134,-7.271},{-2.671,
                41.214},{-2.671,41.214}},
                  smooth=Smooth.Bezier)}), Documentation(info="<HTML>
Material constants, especially linear temperature coefficients of commonly used conductor materials
</HTML>"));
    end Constants;

    function convertAlpha
      "Converts alpha from temperature 1 (default 20 degC) to temperature 2"
      extends Modelica_Icons.Function;
      input Modelica_SIunits.LinearTemperatureCoefficient alpha1
        "Temperature coefficient at temperature 1 (default: 20 degC)";
      input Modelica_SIunits.Temperature T2 "Temperature 2";
      input Modelica_SIunits.Temperature T1=293.15
        "Temperature 1 (default: 20 degC)";
      output Modelica_SIunits.LinearTemperatureCoefficient alpha2
        "Temperature coefficient at TRef";
    algorithm
      alpha2 := alpha1/(1 + alpha1*(T2 - T1));
      annotation (Inline=true,Documentation(info="<html>
<p>
From the temperature coefficient <code>alpha1</code> at temperature <code>T1</code> (default 20 degC = 293.15 K)
the temperature coefficient <code>alpha2</code> at temperature <code>T2</code> is calculated:
</p>
<pre>
                alpha1
  alpha2 = ------------------------
            1 + alpha1 * (T2 - T1)
</pre>
</html>"));
    end convertAlpha;

    function convertResistance
      "Converts resistance from reference temperature to an actual temperature"
      extends Modelica_Icons.Function;
      input Modelica_SIunits.Resistance RRef "Resistance at TRef";
      input Modelica_SIunits.Temperature TRef "Reference temperature";
      input Modelica_SIunits.LinearTemperatureCoefficient alpha20
        "Temperature coefficient at 20 degC";
      input Modelica_SIunits.Temperature T "Actual temperature";
      output Modelica_SIunits.Resistance R "Actual resistance at T";
    algorithm
      R := RRef*(1 + convertAlpha(alpha20, TRef)*(T - TRef));
      annotation (Inline=true,Documentation(info="<html>
<p>
From the temperature coefficient <code>alpha20</code> at 20 degC (equals to 293.15 K) the parameter <code>alphaRef</code> at <code>TRef</code>
</p>
<pre>
                        alpha20
  alphaRef = -------------------------------
              1 + alpha20 * (TRef - 293.15)
</pre>
<p>
is determined; using this value, actual resistance <code>R</code> with respect to the actual temperature <code>T</code> is calculated by
</p>
<pre>
   R
  ------ = 1 + alphaRef * (T - TRef)
   RRef
</pre>
<p>
where <code>RRef</code> is the resistance at the reference temperature <code>TRef</code>.
</p>
</html>"));
    end convertResistance;

    package AsynchronousInductionMachines
      "Thermal parts of asynchronous induction machines"
      extends Modelica_Icons.VariantsPackage;
      model ThermalAmbientAIMC
        "Thermal ambient for asynchronous induction machine with squirrel cage"
        extends
          Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalAmbientInductionMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMC
            thermalPort);
        parameter Modelica_SIunits.Temperature Tr(start=TDefault)
          "Temperature of rotor (squirrel cage)"
          annotation (Dialog(enable=not useTemperatureInputs));
        output Modelica_SIunits.HeatFlowRate Q_flowRotorWinding=
            temperatureRotorWinding.port.Q_flow
          "Heat flow rate of rotor (squirrel cage)";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowStatorWinding +
            Q_flowRotorWinding + Q_flowStatorCore + Q_flowRotorCore +
            Q_flowStrayLoad + Q_flowFriction;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature temperatureRotorWinding
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,30})));
        Modelica_Blocks_Interfaces.RealInput TRotorWinding if
          useTemperatureInputs "Temperature of squirrel cage" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={80,-100})));
        Modelica_Blocks.Sources.Constant constTr(final k=Tr) if not
          useTemperatureInputs annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,-10})));
      equation
        connect(constTr.y, temperatureRotorWinding.T) annotation (Line(
            points={{-50,1},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperatureRotorWinding.port, thermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-50,40},{-50,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(TRotorWinding, temperatureRotorWinding.T) annotation (Line(
            points={{80,-100},{80,8},{-50,8},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="AIMC")}), Documentation(info="<HTML>
Thermal ambient for asynchronous induction machines with squirrel cage to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientAIMC;

      model ThermalAmbientAIMS
        "Thermal ambient for asynchronous induction machine with slipring"
        extends
          Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalAmbientInductionMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortAIMS
            thermalPort(final mr=mr));
        parameter Integer mr=m "Number of rotor phases";
        parameter Modelica_SIunits.Temperature Tr(start=TDefault)
          "Temperature of rotor windings"
          annotation (Dialog(enable=not useTemperatureInputs));
        output Modelica_SIunits.HeatFlowRate Q_flowRotorWinding=
            temperatureRotorWinding.port.Q_flow
          "Heat flow rate of rotor (squirrel cage)";
        output Modelica_SIunits.HeatFlowRate Q_flowBrush=temperatureBrush.port.Q_flow
          "Heat flow rate of brushes";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowStatorWinding +
            Q_flowRotorWinding + Q_flowStatorCore + Q_flowRotorCore +
            Q_flowStrayLoad + Q_flowFriction + Q_flowBrush;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureRotorWinding annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,30})));
        Modelica_Blocks_Interfaces.RealInput TRotorWinding if
          useTemperatureInputs "Temperature of rotor windings" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={80,-100})));
        Modelica_Blocks.Sources.Constant constTr(final k=Tr) if not
          useTemperatureInputs annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,-10})));
        Modelica_Thermal_HeatTransfer.Components.ThermalCollector
          thermalCollectorRotor(final m=mr)
          annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
        Modelica_Thermal_HeatTransfer.Sources.FixedTemperature temperatureBrush(
            final T=TDefault) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,50})));
      equation
        connect(constTr.y, temperatureRotorWinding.T) annotation (Line(
            points={{-50,1},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(thermalCollectorRotor.port_b, temperatureRotorWinding.port)
          annotation (Line(
            points={{-50,60},{-50,40}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(thermalCollectorRotor.port_a, thermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-50,80},{-50,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(temperatureBrush.port, thermalPort.heatPortBrush) annotation (
            Line(
            points={{0,60},{0,60},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(TRotorWinding, temperatureRotorWinding.T) annotation (Line(
            points={{80,-100},{80,8},{-50,8},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="AIMS")}), Documentation(info="<HTML>
Thermal ambient for asynchronous induction machines with slipring rotor to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientAIMS;
      annotation (Documentation(info="<HTML>
Thermal parts for asynchronous induction machines
</HTML>"));
    end AsynchronousInductionMachines;

    package SynchronousInductionMachines
      "Thermal parts of synchronous induction machines"
      extends Modelica_Icons.VariantsPackage;
      model ThermalAmbientSMPM
        "Thermal ambient for synchronous induction machine with permanent magnets"
        parameter Boolean useDamperCage(start=true)
          "Enable / disable damper cage" annotation (Evaluate=true);
        extends
          Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalAmbientInductionMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMPM
            thermalPort(final useDamperCage=useDamperCage));
        parameter Modelica_SIunits.Temperature Tpm(start=TDefault)
          "Temperature of permanent magnet"
          annotation (Dialog(enable=not useTemperatureInputs));
        parameter Modelica_SIunits.Temperature Tr(start=TDefault)
          "Temperature of damper cage (optional)" annotation (Dialog(enable=(
                not useTemperatureInputs and useDamperCage)));
        output Modelica_SIunits.HeatFlowRate Q_flowRotorWinding=
            temperatureRotorWinding.port.Q_flow
          "Heat flow rate of damper cage (optional)";
        output Modelica_SIunits.HeatFlowRate Q_flowPermanentMagnet=
            temperaturePermanentMagnet.port.Q_flow
          "Heat flow rate of permanent magnets";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowStatorWinding +
            Q_flowRotorWinding + Q_flowPermanentMagnet + Q_flowStatorCore +
            Q_flowRotorCore + Q_flowStrayLoad + Q_flowFriction;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureRotorWinding annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,30})));
        Modelica_Blocks_Interfaces.RealInput TRotorWinding if (
          useTemperatureInputs and useDamperCage)
          "Temperature of damper cage (optional)" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={80,-100})));
        Modelica_Blocks.Sources.Constant constTr(final k=if useDamperCage then
              Tr else TDefault) if (not useTemperatureInputs or not
          useDamperCage) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,-10})));
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperaturePermanentMagnet annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,30})));
        Modelica_Blocks.Sources.Constant constTpm(final k=Tpm) if (not
          useTemperatureInputs) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,-10})));
        Modelica_Blocks_Interfaces.RealInput TPermanentMagnet if
          useTemperatureInputs "Temperature of permanent magnet" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,-100})));
      equation
        connect(constTr.y, temperatureRotorWinding.T) annotation (Line(
            points={{-20,1},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperatureRotorWinding.port, thermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-20,40},{-20,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(TRotorWinding, temperatureRotorWinding.T) annotation (Line(
            points={{80,-100},{80,8},{-20,8},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperaturePermanentMagnet.port, thermalPort.heatPortPermanentMagnet)
          annotation (Line(
            points={{-50,40},{-50,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(constTpm.y, temperaturePermanentMagnet.T) annotation (Line(
            points={{-50,1},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TPermanentMagnet, temperaturePermanentMagnet.T) annotation (
            Line(
            points={{0,-100},{0,-60},{-60,-60},{-60,8},{-50,8},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="SMPM")}), Documentation(info="<HTML>
Thermal ambient for synchronous induction machines with permanent magnets to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientSMPM;

      model ThermalAmbientSMEE
        "Thermal ambient for synchronous induction machine with electrical excitation"
        parameter Boolean useDamperCage(start=true)
          "Enable / disable damper cage" annotation (Evaluate=true);
        extends
          Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalAmbientInductionMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMEE
            thermalPort(final useDamperCage=useDamperCage));
        parameter Modelica_SIunits.Temperature Tr(start=TDefault)
          "Temperature of damper cage (optional)" annotation (Dialog(enable=(
                not useTemperatureInputs and useDamperCage)));
        parameter Modelica_SIunits.Temperature Te(start=TDefault)
          "Temperature of excitation"
          annotation (Dialog(enable=not useTemperatureInputs));
        output Modelica_SIunits.HeatFlowRate Q_flowRotorWinding=
            temperatureRotorWinding.port.Q_flow
          "Heat flow rate of damper cage (optional)";
        output Modelica_SIunits.HeatFlowRate Q_flowExcitation=
            temperatureExcitation.port.Q_flow "Heat flow rate of excitation";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowStatorWinding +
            Q_flowRotorWinding + Q_flowExcitation + Q_flowStatorCore +
            Q_flowRotorCore + Q_flowStrayLoad + Q_flowFriction;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureRotorWinding annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,30})));
        Modelica_Blocks_Interfaces.RealInput TRotorWinding if (
          useTemperatureInputs and useDamperCage)
          "Temperature of damper cage (optional)" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={80,-100})));
        Modelica_Blocks.Sources.Constant constTr(final k=if useDamperCage then
              Tr else TDefault) if (not useTemperatureInputs or not
          useDamperCage) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,-10})));
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureExcitation annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,30})));
        Modelica_Blocks_Interfaces.RealInput TExcitation if
          useTemperatureInputs "Temperature of excitation" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,-100})));
        Modelica_Blocks.Sources.Constant constTe(final k=Te) if not
          useTemperatureInputs annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,-10})));
        Modelica_Thermal_HeatTransfer.Sources.FixedTemperature temperatureBrush(
            final T=TDefault) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,50})));
      equation
        connect(constTr.y, temperatureRotorWinding.T) annotation (Line(
            points={{-20,1},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperatureRotorWinding.port, thermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-20,40},{-20,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(TRotorWinding, temperatureRotorWinding.T) annotation (Line(
            points={{80,-100},{80,8},{-20,8},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(constTe.y, temperatureExcitation.T) annotation (Line(
            points={{-50,1},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TExcitation, temperatureExcitation.T) annotation (Line(
            points={{0,-100},{0,-60},{-60,-60},{-60,8},{-50,8},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperatureExcitation.port, thermalPort.heatPortExcitation)
          annotation (Line(
            points={{-50,40},{-50,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(temperatureBrush.port, thermalPort.heatPortBrush) annotation (
            Line(
            points={{0,60},{0,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="SMEE")}), Documentation(info="<HTML>
Thermal ambient for synchronous induction machines with electrical excitation to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientSMEE;

      model ThermalAmbientSMR
        "Thermal ambient for synchronous induction machine with reluctance rotor"
        parameter Boolean useDamperCage(start=true)
          "Enable / disable damper cage" annotation (Evaluate=true);
        extends
          Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalAmbientInductionMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.InductionMachines.ThermalPortSMR
            thermalPort(final useDamperCage=useDamperCage));
        parameter Modelica_SIunits.Temperature Tr(start=TDefault)
          "Temperature of damper cage (optional)" annotation (Dialog(enable=(
                not useTemperatureInputs and useDamperCage)));
        output Modelica_SIunits.HeatFlowRate Q_flowRotorWinding=
            temperatureRotorWinding.port.Q_flow
          "Heat flow rate of damper cage (optional))";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowStatorWinding +
            Q_flowRotorWinding + Q_flowStatorCore + Q_flowRotorCore +
            Q_flowStrayLoad + Q_flowFriction;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureRotorWinding annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,30})));
        Modelica_Blocks_Interfaces.RealInput TRotorWinding if (
          useTemperatureInputs and useDamperCage)
          "Temperature of damper cage (optional)" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={80,-100})));
        Modelica_Blocks.Sources.Constant constTr(final k=if useDamperCage then
              Tr else TDefault) if (not useTemperatureInputs or not
          useDamperCage) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,-10})));
      equation
        connect(constTr.y, temperatureRotorWinding.T) annotation (Line(
            points={{-20,1},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperatureRotorWinding.port, thermalPort.heatPortRotorWinding)
          annotation (Line(
            points={{-20,40},{-20,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(TRotorWinding, temperatureRotorWinding.T) annotation (Line(
            points={{80,-100},{80,10},{-20,10},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="SMR")}), Documentation(info="<HTML>
Thermal ambient for synchronous induction machines with reluctance rotor to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientSMR;
      annotation (Documentation(info="<HTML>
Thermal parts for synchronous induction machines
</HTML>"));
    end SynchronousInductionMachines;

    package DCMachines "Thermal parts of DC machines"
      extends Modelica_Icons.VariantsPackage;
      model ThermalAmbientDCPM
        "Thermal ambient for DC machine with permanent magnets"
        extends
          Modelica_Electrical_Machines_Interfaces.DCMachines.PartialThermalAmbientDCMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCPM
            thermalPort);
        parameter Modelica_SIunits.Temperature Tpm(start=TDefault)
          "Temperature of permanent magnet"
          annotation (Dialog(enable=not useTemperatureInputs));
        output Modelica_SIunits.HeatFlowRate Q_flowPermanentMagnet=
            temperaturePermanentMagnet.port.Q_flow
          "Heat flow rate of permanent magnets";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowArmature +
            Q_flowCore + Q_flowStrayLoad + Q_flowFriction + Q_flowBrush +
            Q_flowPermanentMagnet;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperaturePermanentMagnet annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,30})));
        Modelica_Blocks.Sources.Constant constTpm(final k=Tpm) if not
          useTemperatureInputs annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,-10})));
        Modelica_Blocks_Interfaces.RealInput TPermanentMagnet if
          useTemperatureInputs "Temperature of permanent magnet" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,-100})));
      equation
        connect(temperaturePermanentMagnet.port, thermalPort.heatPortPermanentMagnet)
          annotation (Line(
            points={{-20,40},{-20,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(constTpm.y, temperaturePermanentMagnet.T) annotation (Line(
            points={{-20,1},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TPermanentMagnet, temperaturePermanentMagnet.T) annotation (
            Line(
            points={{0,-100},{0,-60},{-40,-60},{-40,8},{-20,8},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="DCPM")}), Documentation(info="<HTML>
Thermal ambient for DC machines with permanent magnets to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientDCPM;

      model ThermalAmbientDCEE
        "Thermal ambient for DC machine with electrical excitation"
        extends
          Modelica_Electrical_Machines_Interfaces.DCMachines.PartialThermalAmbientDCMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCEE
            thermalPort);
        parameter Modelica_SIunits.Temperature Te(start=TDefault)
          "Temperature of (shunt) excitation"
          annotation (Dialog(enable=not useTemperatureInputs));
        output Modelica_SIunits.HeatFlowRate Q_flowExcitation=
            temperatureExcitation.port.Q_flow
          "Heat flow rate of (shunt) excitation";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowArmature +
            Q_flowCore + Q_flowStrayLoad + Q_flowFriction + Q_flowBrush +
            Q_flowExcitation;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureExcitation annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,30})));
        Modelica_Blocks.Sources.Constant constTe(final k=Te) if not
          useTemperatureInputs annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,-10})));
        Modelica_Blocks_Interfaces.RealInput TExcitation if
          useTemperatureInputs "Temperature of (shunt) excitation" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,-100})));
      equation
        connect(constTe.y, temperatureExcitation.T) annotation (Line(
            points={{-20,1},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TExcitation, temperatureExcitation.T) annotation (Line(
            points={{0,-100},{0,-60},{-40,-60},{-40,8},{-20,8},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperatureExcitation.port, thermalPort.heatPortExcitation)
          annotation (Line(
            points={{-20,40},{-20,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="DCEE")}), Documentation(info="<HTML>
Thermal ambient for DC machines with electrical (shunt) excitation to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientDCEE;

      model ThermalAmbientDCSE
        "Thermal ambient for DC machine with series excitation"
        extends
          Modelica_Electrical_Machines_Interfaces.DCMachines.PartialThermalAmbientDCMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCSE
            thermalPort);
        parameter Modelica_SIunits.Temperature Tse(start=TDefault)
          "Temperature of series excitation"
          annotation (Dialog(enable=not useTemperatureInputs));
        output Modelica_SIunits.HeatFlowRate Q_flowSeriesExcitation=
            temperatureSeriesExcitation.port.Q_flow
          "Heat flow rate of series excitation";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowArmature +
            Q_flowCore + Q_flowStrayLoad + Q_flowFriction + Q_flowBrush +
            Q_flowSeriesExcitation;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureSeriesExcitation annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,30})));
        Modelica_Blocks.Sources.Constant constTse(final k=Tse) if not
          useTemperatureInputs annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,-10})));
        Modelica_Blocks_Interfaces.RealInput T_se if useTemperatureInputs
          "Temperature of series excitation" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-40,-100})));
      equation
        connect(constTse.y, temperatureSeriesExcitation.T) annotation (Line(
            points={{-50,1},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_se, temperatureSeriesExcitation.T) annotation (Line(
            points={{-40,-100},{-40,-60},{-70,-60},{-70,8},{-50,8},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperatureSeriesExcitation.port, thermalPort.heatPortSeriesExcitation)
          annotation (Line(
            points={{-50,40},{-50,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="DCSE")}), Documentation(info="<HTML>
Thermal ambient for DC machines with serial excitation to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientDCSE;

      model ThermalAmbientDCCE
        "Thermal ambient for DC machine with compound excitation"
        extends
          Modelica_Electrical_Machines_Interfaces.DCMachines.PartialThermalAmbientDCMachines(
            redeclare final
            Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCCE
            thermalPort);
        parameter Modelica_SIunits.Temperature Te(start=TDefault)
          "Temperature of (shunt) excitation"
          annotation (Dialog(enable=not useTemperatureInputs));
        parameter Modelica_SIunits.Temperature Tse(start=TDefault)
          "Temperature of series excitation"
          annotation (Dialog(enable=not useTemperatureInputs));
        output Modelica_SIunits.HeatFlowRate Q_flowShuntExcitation=
            temperatureShuntExcitation.port.Q_flow
          "Heat flow rate of (shunt) excitation";
        output Modelica_SIunits.HeatFlowRate Q_flowSeriesExcitation=
            temperatureSeriesExcitation.port.Q_flow
          "Heat flow rate of series excitation";
        output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flowArmature +
            Q_flowCore + Q_flowStrayLoad + Q_flowFriction + Q_flowBrush +
            Q_flowShuntExcitation + Q_flowSeriesExcitation;
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureShuntExcitation annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,30})));
        Modelica_Blocks.Sources.Constant constTe(final k=Te) if not
          useTemperatureInputs annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,-10})));
        Modelica_Blocks_Interfaces.RealInput T_e if useTemperatureInputs
          "Temperature of (shunt) excitation" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,-100})));
        Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature
          temperatureSeriesExcitation annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,30})));
        Modelica_Blocks.Sources.Constant constTse(final k=Tse) if not
          useTemperatureInputs annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,-10})));
        Modelica_Blocks_Interfaces.RealInput T_se if useTemperatureInputs
          "Temperature of series excitation" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-40,-100})));
      equation
        connect(constTe.y, temperatureShuntExcitation.T) annotation (Line(
            points={{-20,1},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_e, temperatureShuntExcitation.T) annotation (Line(
            points={{0,-100},{0,-60},{-40,-60},{-40,8},{-20,8},{-20,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(constTse.y, temperatureSeriesExcitation.T) annotation (Line(
            points={{-50,1},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_se, temperatureSeriesExcitation.T) annotation (Line(
            points={{-40,-100},{-40,-60},{-70,-60},{-70,8},{-50,8},{-50,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temperatureSeriesExcitation.port, thermalPort.heatPortSeriesExcitation)
          annotation (Line(
            points={{-50,40},{-50,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(temperatureShuntExcitation.port, thermalPort.heatPortShuntExcitation)
          annotation (Line(
            points={{-20,40},{-20,100},{0,100}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (Icon(graphics={Text(
                      extent={{-100,-20},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={95,95,95},
                      fillPattern=FillPattern.Solid,
                      textString="DCCE")}), Documentation(info="<HTML>
Thermal ambient for DC machines with compound excitation to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
      end ThermalAmbientDCCE;
      annotation (Documentation(info="<HTML>
Thermal parts for DC machines
</HTML>"));
    end DCMachines;

    model ThermalAmbientTransformer "Thermal ambient for transformers"
      parameter Integer m(min=1) = 3 "Number of phases";
      parameter Boolean useTemperatureInputs=false
        "If true, temperature inputs are used; else, temperatures are constant"
        annotation (Evaluate=true);
      constant Modelica_SIunits.Temperature TDefault=293.15
        "Default temperature";
      parameter Modelica_SIunits.Temperature T1(start=TDefault)
        "Temperature of primary windings"
        annotation (Dialog(enable=not useTemperatureInputs));
      parameter Modelica_SIunits.Temperature T2(start=TDefault)
        "Temperature of secondary windings"
        annotation (Dialog(enable=not useTemperatureInputs));
      output Modelica_SIunits.HeatFlowRate Q_flow1=temperature1.port.Q_flow
        "Heat flow rate of primary windings";
      output Modelica_SIunits.HeatFlowRate Q_flow2=temperature2.port.Q_flow
        "Heat flow rate of secondary windings";
      output Modelica_SIunits.HeatFlowRate Q_flowCore=temperatureCore.port.Q_flow
        "Heat flow rate of core losses";
      output Modelica_SIunits.HeatFlowRate Q_flowTotal=Q_flow1 + Q_flow2 +
          Q_flowCore;
      Modelica_Electrical_Machines_Interfaces.ThermalPortTransformer
        thermalPort(final m=m)
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));
      Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature temperature1
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,30})));
      Modelica_Blocks.Sources.Constant constT1(final k=T1) if not
        useTemperatureInputs annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-10})));
      Modelica_Blocks_Interfaces.RealInput TPrimary if useTemperatureInputs
        "Temperature of primary windings" annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-80,-100})));
      Modelica_Thermal_HeatTransfer.Sources.PrescribedTemperature temperature2
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={80,30})));
      Modelica_Blocks.Sources.Constant constT2(final k=T2) if not
        useTemperatureInputs annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={80,-10})));
      Modelica_Blocks_Interfaces.RealInput TSecondary if useTemperatureInputs
        "Temperature of secondary windings" annotation (Placement(
            transformation(
            extent={{-20,20},{20,-20}},
            rotation=90,
            origin={80,-100})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature temperatureCore(
          final T=TDefault) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,30})));
      Modelica_Thermal_HeatTransfer.Components.ThermalCollector
        thermalCollector1(final m=m)
        annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
      Modelica_Thermal_HeatTransfer.Components.ThermalCollector
        thermalCollector2(final m=m)
        annotation (Placement(transformation(extent={{70,60},{90,80}})));
    equation
      connect(TPrimary, temperature1.T) annotation (Line(
          points={{-80,-100},{-80,-60},{-100,-60},{-100,8},{-80,8},{-80,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(constT1.y, temperature1.T) annotation (Line(
          points={{-80,1},{-80,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TSecondary, temperature2.T) annotation (Line(
          points={{80,-100},{80,-60},{100,-60},{100,8},{80,8},{80,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(constT2.y, temperature2.T) annotation (Line(
          points={{80,1},{80,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(temperatureCore.port, thermalPort.heatPortCore) annotation (Line(
          points={{0,40},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(thermalCollector1.port_b, temperature1.port) annotation (Line(
          points={{-80,60},{-80,40}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(thermalCollector2.port_b, temperature2.port) annotation (Line(
          points={{80,60},{80,40}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(thermalCollector1.port_a, thermalPort.heatPort1) annotation (Line(
          points={{-80,80},{-80,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(thermalCollector2.port_a, thermalPort.heatPort2) annotation (Line(
          points={{80,80},{80,100},{0,100}},
          color={191,0,0},
          smooth=Smooth.None));
      annotation (Icon(graphics={Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0},
                  pattern=LinePattern.None,
                  fillColor={159,159,223},
                  fillPattern=FillPattern.Backward),Line(
                  points={{-14,0},{54,0}},
                  color={191,0,0},
                  thickness=0.5,
                  origin={0,-6},
                  rotation=90),Polygon(
                  points={{-20,-20},{-20,20},{20,0},{-20,-20}},
                  lineColor={191,0,0},
                  fillColor={191,0,0},
                  fillPattern=FillPattern.Solid,
                  origin={0,68},
                  rotation=90),Text(
                  extent={{-100,-20},{100,-80}},
                  lineColor={0,0,0},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid,
                  textString="Trafo")}), Documentation(info="<HTML>
Thermal ambient for transformers to prescribe winding temperatures either constant or via signal connectors.
Additionally, all losses = heat flows are recorded.
</HTML>"));
    end ThermalAmbientTransformer;
    annotation (Icon(graphics={Ellipse(
              extent={{-65,-63},{65,63}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid)}), Documentation(info="<HTML>
<h4>Thermal concept</h4>
<p>
Each machine model is equipped with a machine-specific conditional <code>thermalPort</code>.
If <code>useThermalPort == false</code>, a machine-specific thermal ambient prescribing constant temperatures is used inside the machine.
If <code>useThermalPort == true</code>, a thermal model or machine-specific thermal ambient prescribing the temperatures has to be connected from outside.
On the other hand, all losses are dissipated to this internal or external thermal ambient.
</p>
<p>
The machine specific thermal connector contains <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\">heatPort</a>s
for all relevant loss sources of the machine type, although some of the loss sources are not yet implemented;
these heatPorts are left unconnected inside the machine, i.e., the HeatFlowRate is zero,
but they have to be connected to a constant temperature source in the internal or external thermal ambient.
Simple machine-specific thermal ambients for constant temperatures (<code>useTemperatureInputs == false</code>)
or temperatures prescribed via signal inputs (<code>useTemperatureInputs == true</code>) are provided in this package.
</p>
<h4>Loss sources</h4>
<p>
Up to now, only Ohmic losses in stator and rotor windings are implemented.
They are modeled as <a href=\"modelica://Modelica.Electrical.Analog.Basic.Resistor\">linearly temperature dependent resistors</a>:
</p>
<pre>
   ROperational = RRef * (1 + alphaRef * (TOperational - TRef))
</pre>
<h5>Parameters:</h5>
<ul>
<li>Resistance <code>RRef</code> at reference temperature</li>
<li>Reference temperature <code>TRef</code></li>
<li>Linear temperature coefficient <code>alpha20</code> at 20&deg;C</li>
<li>Operational temperature <code>TOperational</code>
(if <code>useThermalPort == false</code>; otherwise, the operational temperature is provided via the heatPort)</li>
<li>Nominal temperature <code>TNominal</code>
(required for DC machines to calculate the turns ratio)</li>
</ul>
<p>
The linear temperature coefficient <code>alpha20</code> at 20&deg;C = 293.15 K has to be converted to reference temperature <code>TRef</code>:
</p>
<pre>
                        alpha20
  alphaRef = -------------------------------
              1 + alpha20 * (TRef - 293.15)
</pre>
<p>
For this reason, the function <a href=\"modelica://Modelica.Electrical.Machines.Thermal.convertAlpha\">convertAlpha</a> is provided.
In sub-package <a href=\"modelica://Modelica.Electrical.Machines.Thermal.Constants\">Constants</a> linear temperature coefficients at 20&deg;C for commonly used materials are defined.
</p>
<h4>Backwards compatibility</h4>
<ul>
<li>The default / start values of all resistances are left unchanged.</li>
<li>The default / start values of all reference temperatures are set to 20&deg;C.</li>
<li>The default / start values of all linear temperature coefficients are set to 0.</li>
<li>The default / start values of all operational temperatures are set to 20&deg;C.</li>
<li>The default / start values of all nominal temperatures are set to 20&deg;C.</li>
</ul>
<h4>Machine specific thermalPorts</h4>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage\">Asynchronous induction machine with squirrel cage</a></h5>
<ul>
<li><code>heatPortStatorWinding[m]</code>: m=3 heatPorts for the m=3 stator phases</li>
<li><code>heatPortRotorWinding</code>: heatPort for the rotor cage</li>
<li><code>heatPortStatorCore</code>: stator core losses (not yet fully implemented)</li>
<li><code>heatPortRotorCore</code>: rotor core losses (not yet connected/implemented)</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing\">Asynchronous induction machine with slipring rotor</a></h5>
<ul>
<li><code>heatPortStatorWinding[m]</code>: m=3 heatPorts for the m=3 stator phases</li>
<li><code>heatPortRotorWinding[m]</code>: m=3 heatPorts for the m=3 rotor phases</li>
<li><code>heatPortBrush</code>: brush losses (not yet connected/implemented)</li>
<li><code>heatPortStatorCore</code>: stator core losses (not yet fully implemented)</li>
<li><code>heatPortRotorCore</code>: rotor core losses (not yet fully implemented)</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">Synchronous induction machine with permanent magnets</a></h5>
<ul>
<li><code>heatPortStatorWinding[m]</code>: m=3 heatPorts for the m=3 stator phases</li>
<li><code>heatPortRotorWinding</code>: conditional (<code>useDamperCage=true/false</code>) heatPort for the damper cage</li>
<li><code>heatPortPermanentMagnet</code>: permanent magnet losses (not yet connected/implemented)</li>
<li><code>heatPortStatorCore</code>: stator core losses (not yet fully implemented)</li>
<li><code>heatPortRotorCore</code>: rotor core losses (not yet connected/implemented)</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">Synchronous induction machine with electrical excitation</a></h5>
<ul>
<li><code>heatPortStatorWinding[m]</code>: m=3 heatPorts for the m=3 stator phases</li>
<li><code>heatPortRotorWinding</code>: conditional (<code>useDamperCage=true/false</code>) heatPort for the damper cage</li>
<li><code>heatPortExcitation</code>: electrical excitation</li>
<li><code>heatPortBrush</code>: brush losses</li>
<li><code>heatPortStatorCore</code>: stator core losses (not yet fully implemented)</li>
<li><code>heatPortRotorCore</code>: rotor core losses (not yet connected/implemented)</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor\">Synchronous induction machine with reluctance rotor</a></h5>
<ul>
<li><code>heatPortStatorWinding[m]</code>: m=3 heatPorts for the m=3 stator phases</li>
<li><code>heatPortRotorWinding</code>: conditional (<code>useDamperCage=true/false</code>) heatPort for the damper cage</li>
<li><code>heatPortStatorCore</code>: stator core losses (not yet fully implemented)</li>
<li><code>heatPortRotorCore</code>: rotor core losses (not yet connected/implemented)</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet\">DC machine with permanent magnets</a></h5>
<ul>
<li><code>heatPortArmature</code>: armature losses</li>
<li><code>heatPortPermanentMagnet</code>: permanent magnet losses (not yet connected/implemented)</li>
<li><code>heatPortBrush</code>: brush losses</li>
<li><code>heatPortCore</code>: armature core losses</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_ElectricalExcited\">DC machine with electrical (shunt) excitation</a></h5>
<ul>
<li><code>heatPortArmature</code>: armature losses</li>
<li><code>heatPortExcitation</code>: electrical (shunt) excitation</li>
<li><code>heatPortBrush</code>: brush losses</li>
<li><code>heatPortCore</code>: armature core losses</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited\">DC machine with serial excitation</a></h5>
<ul>
<li><code>heatPortArmature</code>: armature losses</li>
<li><code>heatPortSeriesExcitation</code>: electrical series excitation</li>
<li><code>heatPortBrush</code>: brush losses</li>
<li><code>heatPortCore</code>: armature core losses</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><!--<a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_Compound\">-->DC machine with compound excitation (not yet implemented)<!--</a>--></h5>
<ul>
<li><code>heatPortArmature</code>: armature losses</li>
<li><code>heatPortShuntExcitation</code>: electrical (shunt) excitation</li>
<li><code>heatPortSeriesExcitation</code>: electrical series excitation</li>
<li><code>heatPortBrush</code>: brush losses</li>
<li><code>heatPortCore</code>: armature core losses</li>
<li><code>heatPortStrayLoad</code>: stray load losses</li>
<li><code>heatPortFriction</code>: friction losses</li>
</ul>
<h5><a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.Transformers\">Transformers</a></h5>
<ul>
<li><code>heatPort1[m]</code>: m=3 heatPorts for the m=3 primary phases</li>
<li><code>heatPort2[m]</code>: m=3 heatPorts for the m=3 secondary phases</li>
<li><code>heatPortCore</code>: iron core losses (not yet connected/implemented)</li>
</ul>
</HTML>", revisions="<HTML>
  <ul>
  <li> v2.2.0 2011/02/10 Anton Haumer<br>
       first stable release of this subpackage:<br>
       conditional ThermalPort for all machines</li>
  </ul>
</HTML>"));
  end Thermal;

  package Icons "Icons for electrical machines"
    extends Modelica_Icons.IconsPackage;
    partial model TransientMachine
      annotation (Icon(graphics={Rectangle(
                  extent={{-40,60},{80,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={0,128,255}),Rectangle(
                  extent={{-40,60},{-60,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={128,128,128}),Rectangle(
                  extent={{80,10},{100,-10}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={95,95,95}),Rectangle(
                  extent={{-40,70},{40,50}},
                  lineColor={95,95,95},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid),Polygon(
                  points={{-50,-90},{-40,-90},{-10,-20},{40,-20},{70,-90},{80,-90},
                {80,-100},{-50,-100},{-50,-90}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This icon is designed for a <b>transient machine</b> model.
</p>
</html>"));
    end TransientMachine;

    partial model QuasiStationaryMachine
      annotation (Icon(graphics={Rectangle(
                  extent={{-40,60},{80,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={170,213,255}),Rectangle(
                  extent={{-40,60},{-60,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={128,128,128}),Rectangle(
                  extent={{80,10},{100,-10}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={95,95,95}),Rectangle(
                  extent={{-40,70},{40,50}},
                  lineColor={95,95,95},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid),Polygon(
                  points={{-50,-90},{-40,-90},{-10,-20},{40,-20},{70,-90},{80,-90},
                {80,-100},{-50,-100},{-50,-90}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This icon is designed for a <b>quasistationary machine</b> model.
</p>
</html>"));
    end QuasiStationaryMachine;

    partial model FundamentalWaveMachine
      annotation (Icon(graphics={Rectangle(
                  extent={{-40,60},{80,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={255,128,0}),Rectangle(
                  extent={{-40,60},{-60,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={128,128,128}),Rectangle(
                  extent={{80,10},{100,-10}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={95,95,95}),Rectangle(
                  extent={{-40,70},{40,50}},
                  lineColor={95,95,95},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid),Polygon(
                  points={{-50,-90},{-40,-90},{-10,-20},{40,-20},{70,-90},{80,-90},
                {80,-100},{-50,-100},{-50,-90}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This icon is designed for a <b>FundamentalWave machine</b> model.
</p>
</html>"));
    end FundamentalWaveMachine;

    model TransientTransformer
      annotation (Icon(graphics={Polygon(
                  points={{-70,60},{-50,40},{-50,-40},{-70,-60},{-70,60}},
                  lineColor={0,0,0},
                  smooth=Smooth.None,
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder),Polygon(
                  points={{70,60},{50,40},{50,-40},{70,-60},{70,60}},
                  lineColor={0,0,0},
                  smooth=Smooth.None,
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder),Polygon(
                  points={{0,50},{-10,40},{-10,-40},{0,-50},{10,-40},{10,40},{0,
                50}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.VerticalCylinder,
                  smooth=Smooth.None,
                  fillColor={135,135,135}),Polygon(
                  points={{-70,60},{70,60},{50,40},{10,40},{0,50},{-10,40},{-50,
                40},{-70,60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.VerticalCylinder,
                  smooth=Smooth.None,
                  fillColor={135,135,135}),Polygon(
                  points={{-70,-60},{70,-60},{50,-40},{10,-40},{0,-50},{-10,-40},
                {-50,-40},{-70,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.VerticalCylinder,
                  smooth=Smooth.None,
                  fillColor={135,135,135}),Rectangle(
                  extent={{-78,36},{-42,-36}},
                  lineColor={128,0,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={128,0,255}),Rectangle(
                  extent={{-84,28},{-36,-28}},
                  lineColor={0,128,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={0,128,255}),Rectangle(
                  extent={{-18,36},{18,-36}},
                  lineColor={128,0,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={128,0,255}),Rectangle(
                  extent={{-24,28},{24,-28}},
                  lineColor={0,128,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={0,128,255}),Rectangle(
                  extent={{42,36},{78,-36}},
                  lineColor={128,0,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={128,0,255}),Rectangle(
                  extent={{36,28},{84,-28}},
                  lineColor={0,128,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={0,128,255})}), Documentation(info="<html>
<p>
This icon is designed for a <b>transient transformer</b> model.
</p>
</html>"));
    end TransientTransformer;

    partial model QuasiStationaryTransformer
      annotation (Icon(graphics={Polygon(
                  points={{-70,60},{-50,40},{-50,-40},{-70,-60},{-70,60}},
                  lineColor={0,0,0},
                  smooth=Smooth.None,
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder),Polygon(
                  points={{70,60},{50,40},{50,-40},{70,-60},{70,60}},
                  lineColor={0,0,0},
                  smooth=Smooth.None,
                  fillColor={135,135,135},
                  fillPattern=FillPattern.VerticalCylinder),Polygon(
                  points={{0,50},{-10,40},{-10,-40},{0,-50},{10,-40},{10,40},{0,
                50}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.VerticalCylinder,
                  smooth=Smooth.None,
                  fillColor={135,135,135}),Polygon(
                  points={{-70,60},{70,60},{50,40},{10,40},{0,50},{-10,40},{-50,
                40},{-70,60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.VerticalCylinder,
                  smooth=Smooth.None,
                  fillColor={135,135,135}),Polygon(
                  points={{-70,-60},{70,-60},{50,-40},{10,-40},{0,-50},{-10,-40},
                {-50,-40},{-70,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.VerticalCylinder,
                  smooth=Smooth.None,
                  fillColor={135,135,135}),Rectangle(
                  extent={{-78,36},{-42,-36}},
                  lineColor={213,170,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={213,170,255}),Rectangle(
                  extent={{-84,28},{-36,-28}},
                  lineColor={170,213,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={170,213,255}),Rectangle(
                  extent={{-18,36},{18,-36}},
                  lineColor={213,170,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={213,170,255}),Rectangle(
                  extent={{-24,28},{24,-28}},
                  lineColor={170,213,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={170,213,255}),Rectangle(
                  extent={{42,36},{78,-36}},
                  lineColor={213,170,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={213,170,255}),Rectangle(
                  extent={{36,28},{84,-28}},
                  lineColor={170,213,255},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={170,213,255})}), Documentation(info="<html>
<p>
This icon is designed for a <b>quasistationary transformer</b> model.
</p>
</html>"));
    end QuasiStationaryTransformer;

    partial model QuasiStaticFundamentalWaveMachine
      "Icon of quasi static fundamental wave machine"

      annotation (Icon(graphics={Rectangle(
                  extent={{-40,60},{80,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={255,206,120}),Rectangle(
                  extent={{-40,60},{-60,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={128,128,128}),Rectangle(
                  extent={{80,10},{100,-10}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={95,95,95}),Rectangle(
                  extent={{-40,70},{40,50}},
                  lineColor={95,95,95},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid),Polygon(
                  points={{-50,-90},{-40,-90},{-10,-20},{40,-20},{70,-90},{80,-90},
                {80,-100},{-50,-100},{-50,-90}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This icon is designed for a <b>quasi static fundamental wave machine</b> model.
</p>
</html>"));
    end QuasiStaticFundamentalWaveMachine;
    annotation (Documentation(info="<html>
<p>
This package contains definitions for the graphical layout of machines.
The icons can be utilized by inheriting them in the desired class using \"extends\" or by directly copying the \"icon\" layer.
</p>
</html>"));
  end Icons;

  package Utilities "Library with auxiliary models for testing"
    extends Modelica_Icons.UtilitiesPackage;
    package ParameterRecords "Parameter records"
      extends Modelica_Icons.MaterialPropertiesPackage;
      record InductionMachineData "Common parameters for induction machines"
        extends Modelica_Icons.Record;
        import Modelica_Constants.pi;
        final parameter Integer m=3 "Number of phases";
        parameter Modelica_SIunits.Inertia Jr=0.29 "Rotor's moment of inertia";
        parameter Modelica_SIunits.Inertia Js=Jr "Stator's moment of inertia";
        parameter Integer p(min=1) = 2 "Number of pole pairs (Integer)";
        parameter Modelica_SIunits.Frequency fsNominal=50 "Nominal frequency";
        parameter Modelica_SIunits.Resistance Rs=0.03
          "Stator resistance per phase at TRef"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TsRef=293.15
          "Reference temperature of stator resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20s=0
          "Temperature coefficient of stator resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lszero=Lssigma
          "Stator zero sequence inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lssigma=3*(1 - sqrt(1 - 0.0667))/
            (2*pi*fsNominal) "Stator stray inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Losses.FrictionParameters frictionParameters(PRef=0, wRef=2*
              pi*fsNominal/p) "Friction losses"
          annotation (Dialog(tab="Losses"));
        parameter Losses.CoreParameters statorCoreParameters(
          final m=m,
          PRef=0,
          VRef=100,
          wRef=2*pi*fsNominal)
          "Stator core losses; all parameters refer to stator side"
          annotation (Dialog(tab="Losses"));
        parameter Losses.StrayLoadParameters strayLoadParameters(
          PRef=0,
          IRef=100,
          wRef=2*pi*fsNominal/p) "Stray load losses"
          annotation (Dialog(tab="Losses"));
        annotation (
          defaultComponentName="inductionMachineData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of induction machines are predefined with default values.</p>
</HTML>"));
      end InductionMachineData;

      record AIM_SquirrelCageData
        "Common parameters for asynchronous induction machines with squirrel cage"
        extends InductionMachineData;
        import Modelica_Constants.pi;
        parameter Modelica_SIunits.Inductance Lm=3*sqrt(1 - 0.0667)/(2*pi*
            fsNominal) "Stator main field inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrsigma=3*(1 - sqrt(1 - 0.0667))/
            (2*pi*fsNominal)
          "Rotor stray inductance (equivalent three phase winding)"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Resistance Rr=0.04
          "Rotor resistance (equivalent three phase winding) at TRef"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrRef=293.15
          "Reference temperature of rotor resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20r=0
          "Temperature coefficient of rotor resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        annotation (
          defaultComponentName="aimcData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of asynchronous induction machines with squirrel cage are predefined with default values.</p>
</HTML>"));
      end AIM_SquirrelCageData;

      record AIM_SlipRingData
        "Common parameters for asynchronous induction machines with slip ring"
        extends InductionMachineData;
        import Modelica_Constants.pi;
        parameter Modelica_SIunits.Inductance Lm=3*sqrt(1 - 0.0667)/(2*pi*
            fsNominal) "Stator main field inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrsigma=3*(1 - sqrt(1 - 0.0667))/
            (2*pi*fsNominal)/turnsRatio^2
          "Rotor stray inductance w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lrzero=Lrsigma/turnsRatio^2
          "Rotor zero sequence inductance w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Resistance Rr=0.04/turnsRatio^2
          "Rotor resistance per phase at TRef w.r.t. rotor side"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TrRef=293.15
          "Reference temperature of rotor resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20r=0
          "Temperature coefficient of rotor resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Boolean useTurnsRatio=true
          "Use turnsRatio or calculate from locked-rotor voltage?";
        parameter Real turnsRatio(final min=Modelica_Constants.small)=
          VsNominal/VrLockedRotor*(2*pi*fsNominal*Lm)/sqrt(Rs^2 + (2*pi*
          fsNominal*(Lm + Lssigma))^2)
          "Effective number of stator turns / effective number of rotor turns"
          annotation (Dialog(enable=useTurnsRatio));
        parameter Modelica_SIunits.Voltage VsNominal=100
          "Nominal stator voltage per phase"
          annotation (Dialog(enable=not useTurnsRatio));
        parameter Modelica_SIunits.Voltage VrLockedRotor=100*(2*pi*fsNominal*Lm)
            /sqrt(Rs^2 + (2*pi*fsNominal*(Lm + Lssigma))^2)
          "Locked-rotor voltage per phase"
          annotation (Dialog(enable=not useTurnsRatio));
        parameter Losses.CoreParameters rotorCoreParameters(
          final m=3,
          PRef=0,
          VRef=1,
          wRef=1) "Rotor core losses; all parameters refer to rotor side"
          annotation (Dialog(tab="Losses"));
        annotation (
          defaultComponentName="aimsData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of asynchronous induction machines with slip ring are predefined with default values.</p>
</HTML>"));
      end AIM_SlipRingData;

      record SM_PermanentMagnetData
        "Common parameters for synchronous induction machines with permanent magnet"
        extends SM_ReluctanceRotorData(Lmd=0.3/(2*pi*fsNominal), Lmq=0.3/(2*pi*
              fsNominal));
        import Modelica_Constants.pi;
        parameter Modelica_SIunits.Voltage VsOpenCircuit=112.3
          "Open circuit RMS voltage per phase @ fsNominal";
        parameter Losses.PermanentMagnetLossParameters permanentMagnetLossParameters(
          PRef=0,
          IRef=100,
          wRef=2*pi*fsNominal/p) "Permanent magnet loss losses"
          annotation (Dialog(tab="Losses"));
        annotation (
          defaultComponentName="smpmData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of synchronous induction machines with permanent magnet are predefined with default values.</p>
</HTML>"));
      end SM_PermanentMagnetData;

      record SM_ElectricalExcitedData
        "Common parameters for synchronous induction machines with electrical excitation"
        extends SM_ReluctanceRotorData(Lmd=1.5/(2*pi*fsNominal), Lmq=1.5/(2*pi*
              fsNominal));
        import Modelica_Constants.pi;
        parameter Modelica_SIunits.Voltage VsNominal=100
          "Nominal stator RMS voltage per phase"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Current IeOpenCircuit=10
          "Open circuit excitation current @ nominal voltage and frequency"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Resistance Re=2.5
          "Excitation resistance at TRef" annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeRef=293.15
          "Reference temperature of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20e=0
          "Temperature coefficient of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Real sigmae(
          min=0,
          max=0.99) = 0.025 "Stray fraction of total excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Losses.BrushParameters brushParameters(V=0, ILinear=0.01)
          "Brush losses" annotation (Dialog(tab="Losses"));
        annotation (
          defaultComponentName="smeeData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of synchronous induction machines with electrical excitation are predefined with default values.</p>
</HTML>"));
      end SM_ElectricalExcitedData;

      record SM_ReluctanceRotorData
        "Common parameters for synchronous induction machines with reluctance rotor"
        extends InductionMachineData(Lssigma=0.1/(2*pi*fsNominal));
        import Modelica_Constants.pi;
        parameter Modelica_SIunits.Inductance Lmd=2.9/(2*pi*fsNominal)
          "Stator main field inductance in d-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance Lmq=0.9/(2*pi*fsNominal)
          "Stator main field inductance in q-axis"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Boolean useDamperCage=true "Enable / disable damper cage"
          annotation (Evaluate=true,Dialog(tab=
                "Nominal resistances and inductances", group="DamperCage"));
        parameter Modelica_SIunits.Inductance Lrsigmad=0.05/(2*pi*fsNominal)
          "Damper stray inductance in d-axis" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
          "Damper stray inductance in q-axis" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrd=0.04
          "Damper resistance in d-axis at TRef" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Resistance Rrq=Rrd
          "Damper resistance in q-axis at TRef" annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Modelica_SIunits.Temperature TrRef=293.15
          "Reference temperature of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20r=0
          "Temperature coefficient of damper resistances in d- and q-axis"
          annotation (Dialog(
            tab="Nominal resistances and inductances",
            group="DamperCage",
            enable=useDamperCage));
        annotation (
          defaultComponentName="smrData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of synchronous induction machines with reluctance rotor are predefined with default values.</p>
</HTML>"));
      end SM_ReluctanceRotorData;

      record DcPermanentMagnetData "Common parameters for DC machines"
        extends Modelica_Icons.Record;
        import Modelica_Constants.pi;
        parameter Modelica_SIunits.Inertia Jr=0.15 "Rotor's moment of inertia";
        parameter Modelica_SIunits.Inertia Js=Jr "Stator's moment of inertia";
        parameter Modelica_SIunits.Voltage VaNominal=100
          "Nominal armature voltage"
          annotation (Dialog(tab="Nominal parameters"));
        parameter Modelica_SIunits.Current IaNominal=100
          "Nominal armature current (>0..Motor, <0..Generator)"
          annotation (Dialog(tab="Nominal parameters"));
        parameter Modelica_SIunits.AngularVelocity wNominal(displayUnit="1/min")=
             1425*2*pi/60 "Nominal speed"
          annotation (Dialog(tab="Nominal parameters"));
        parameter Modelica_SIunits.Temperature TaNominal=293.15
          "Nominal armature temperature"
          annotation (Dialog(tab="Nominal parameters"));
        parameter Modelica_SIunits.Resistance Ra=0.05
          "Armature resistance at TRef"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature TaRef=293.15
          "Reference temperature of armature resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20a=0
          "Temperature coefficient of armature resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance La=0.0015 "Armature inductance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Losses.FrictionParameters frictionParameters(PRef=0, wRef=
              wNominal) "Friction losses" annotation (Dialog(tab="Losses"));
        parameter Modelica_SIunits.Voltage ViNominal=VaNominal -
            Thermal.convertResistance(
                  Ra,
                  TaRef,
                  alpha20a,
                  TaNominal)*IaNominal -
            Losses.DCMachines.brushVoltageDrop(         brushParameters,
            IaNominal);
        parameter Losses.CoreParameters coreParameters(
          final m=1,
          PRef=0,
          VRef=ViNominal,
          wRef=wNominal) "Armature core losses"
          annotation (Dialog(tab="Losses"));
        parameter Losses.StrayLoadParameters strayLoadParameters(
          PRef=0,
          IRef=IaNominal,
          wRef=wNominal) "Stray load losses" annotation (Dialog(tab="Losses"));
        parameter Losses.BrushParameters brushParameters(V=0, ILinear=0.01*
              IaNominal) "Brush losses" annotation (Dialog(tab="Losses"));
        annotation (
          defaultComponentName="dcpmData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of DC machines are predefined with default values.</p>
</HTML>"));
      end DcPermanentMagnetData;

      record DcElectricalExcitedData "Common parameters for DC machines"
        extends DcPermanentMagnetData;
        parameter Modelica_SIunits.Current IeNominal=1
          "Nominal excitation current" annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Resistance Re=100
          "Field excitation resistance at TRef"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeRef=293.15
          "Reference temperature of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20e=0
          "Temperature coefficient of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Inductance Le=1
          "Total field excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Real sigmae(
          min=0,
          max=0.99) = 0 "Stray fraction of total excitation inductance"
          annotation (Dialog(tab="Excitation"));
        annotation (
          defaultComponentName="dceeData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of DC machines are predefined with default values.</p>
</HTML>"));
      end DcElectricalExcitedData;

      record DcSeriesExcitedData "Common parameters for DC machines"
        extends DcPermanentMagnetData(wNominal=1410*2*pi/60);
        import Modelica_Constants.pi;
        parameter Modelica_SIunits.Resistance Re=0.01
          "Series excitation resistance at TRef"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeRef=293.15
          "Reference temperature of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20e=0
          "Temperature coefficient of excitation resistance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Inductance Le=0.0005
          "Total field excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Real sigmae(
          min=0,
          max=0.99) = 0 "Stray fraction of total excitation inductance"
          annotation (Dialog(tab="Excitation"));
        parameter Modelica_SIunits.Temperature TeNominal=293.15
          "Nominal series excitation temperature"
          annotation (Dialog(tab="Nominal parameters"));
        annotation (
          defaultComponentName="dcseData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of DC machines are predefined with default values.</p>
</HTML>"));
      end DcSeriesExcitedData;

      record TransformerData "Common parameters for transformers"
        extends Modelica_Icons.Record;
        parameter Real n_phase=1
          "Ratio primary voltage per phase / secondary voltage per phase";
        parameter String C1="Y" "Choose primary connection" annotation (choices(
              choice="Y" "Star connection", choice="D" "Delta connection"));
        parameter String C2="y" "Choose secondary connection" annotation (
            choices(
            choice="y" "Star connection",
            choice="d" "Delta connection",
            choice="z" "Zig-zag connection"));
        parameter Real n=n_phase*(if C1 == "D" and (C2 == "y" or C2 == "z")
             then 1/sqrt(3) else if C1 == "Y" and C2 == "d" then sqrt(3) else 1)
          "Ratio primary voltage (line-to-line) / secondary voltage (line-to-line)"
          annotation (Dialog(enable=false));
        parameter Modelica_SIunits.Resistance R1=5E-3/3
          "Primary resistance per phase at TRef"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature T1Ref=293.15
          "Reference temperature of primary resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20_1=0
          "Temperature coefficient of primary resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance L1sigma=78E-6/3
          "Primary stray inductance per phase"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Resistance R2=5E-3/3
          "Secondary resistance per phase at TRef"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Temperature T2Ref=293.15
          "Reference temperature of secondary resistance"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Thermal.LinearTemperatureCoefficient20 alpha20_2=0
          "Temperature coefficient of secondary resistance at 20 degC"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        parameter Modelica_SIunits.Inductance L2sigma=78E-6/3
          "Secondary stray inductance per phase"
          annotation (Dialog(tab="Nominal resistances and inductances"));
        annotation (
          defaultComponentName="transformerData",
          defaultComponentPrefixes="parameter",
          Documentation(info="<HTML>
<p>Basic parameters of transformers are predefined with default values.</p>
<p>Note: ratio n is defined between primary / secondary line-to-line voltage;
   therefore the user has to take into account primary and secondary connection!</p>
</HTML>"));
      end TransformerData;
    end ParameterRecords;

    block VfController "Voltage-Frequency-Controller"
      extends Modelica_Blocks_Interfaces.SIMO(final nout=m);
      constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
      parameter Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Angle orientation[m]=-
          Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m)
        "Orientation of phases";
      parameter Modelica_SIunits.Voltage VNominal
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal "Nominal frequency";
      parameter Modelica_SIunits.Angle BasePhase=0 "Common phase shift";
      output Modelica_SIunits.Angle x(start=0, fixed=true) "Integrator state";
      output Modelica_SIunits.Voltage amplitude;
    equation
      //amplitude = sqrt(2)*VNominal*min(abs(u)/fNominal, 1);
      amplitude = sqrt(2)*VNominal*(if abs(u) < fNominal then abs(u)/fNominal
         else 1);
      der(x) = 2*pi*u;
      y = amplitude*sin(fill(x + BasePhase, m) + orientation);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Line(points={{-100,-100},{0,60},{
              80,60}}, color={0,0,255}),Line(
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
                  smooth=Smooth.Bezier)}), Documentation(info="<HTML>
Simple Voltage-Frequency-Controller.<br>
Amplitude of voltage is linear dependent (VNominal/fNominal) on frequency (input signal \"u\"), but limited by VNominal (nominal RMS voltage per phase).<br>
m sine-waves with amplitudes as described above are provided as output signal \"y\".<br>
The sine-waves are intended to feed a m-phase SignalVoltage.<br>
Phase shifts between sine-waves may be chosen by the user; default values are <i>(k-1)/m*pi for k in 1:m</i>.
</HTML>"));
    end VfController;

    block ToDQ
      "Transform instantaneous stator inputs to rotor fixed space phasor"
      extends Modelica_Blocks_Interfaces.MIMO(final nin=m, final nout=2);
      parameter Integer m(min=1) = 3 "Number of phases";
      parameter Integer p "Number of pole pairs";
      Modelica_Blocks.Math.Gain toGamma(final k=p) annotation (Placement(
            transformation(
            origin={0,-50},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      SpacePhasors.Blocks.Rotator rotator annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput phi annotation (Placement(
            transformation(
            origin={0,-120},
            extent={{20,-20},{-20,20}},
            rotation=270)));
      SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor(final m=m) annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
    equation
      connect(phi, toGamma.u) annotation (Line(points={{0,-120},{0,
              -120},{0,-62}}, color={0,0,127}));
      connect(rotator.angle, toGamma.y) annotation (Line(points={{0,-12},{0,-39},
              {0,-39}}, color={0,0,127}));
      connect(toSpacePhasor.y, rotator.u) annotation (Line(
          points={{-39,0},{-12,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, toSpacePhasor.u) annotation (Line(
          points={{-120,0},{-62,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rotator.y, y) annotation (Line(
          points={{11,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Documentation(info="<html>
<p>
The multi phase input values <code>u[m]</code> are transformed to the corresponding space phasor which is rotated to the rotor fixed reference system,
using the provided mechanical rotor angle phi. The ouput are the resulting d and q components of the space phasor arranged in one vector <code>y[2]</code>.
</p>

<h4>See also></h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Utilities.FromDQ\">FromDQ</a>
</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end ToDQ;

    block FromDQ
      "Transform rotor fixed space phasor to instantaneous stator quantities"
      extends Modelica_Blocks_Interfaces.MIMO(final nin=2, final nout=m);
      parameter Integer m(min=1) = 3 "Number of phases";
      parameter Integer p "Number of pole pairs";
      Modelica_Blocks.Math.Gain toGamma(final k=-p) annotation (Placement(
            transformation(
            origin={0,-50},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      SpacePhasors.Blocks.Rotator rotator annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica_Blocks.Sources.Constant i0(final k=0) annotation (Placement(
            transformation(extent={{20,-20},{40,-40}}, rotation=0)));
      SpacePhasors.Blocks.FromSpacePhasor fromSpacePhasor(final m=m)
        annotation (Placement(transformation(extent={{60,-10},{80,10}},
              rotation=0)));
      Modelica_Blocks_Interfaces.RealInput phi annotation (Placement(
            transformation(
            origin={0,-120},
            extent={{20,-20},{-20,20}},
            rotation=270)));
    equation
      connect(phi, toGamma.u) annotation (Line(points={{0,-120},{0,
              -120},{0,-62}}, color={0,0,127}));
      connect(rotator.angle, toGamma.y) annotation (Line(points={{0,-12},{0,-39},
              {0,-39}}, color={0,0,127}));
      connect(rotator.y, fromSpacePhasor.u)
        annotation (Line(points={{11,0},{34,0},{58,0}}, color={0,0,127}));
      connect(i0.y, fromSpacePhasor.zero) annotation (Line(
          points={{41,-30},{50,-30},{50,-8},{58,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, rotator.u) annotation (Line(
          points={{-120,0},{-12,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(fromSpacePhasor.y, y) annotation (Line(
          points={{81,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Documentation(info="<html>
<p>
The d and q components of a space phasor <code>u[2]</code> are rotated back to the stator fixed reference system,
using the provided mechanical rotor angle phi. The output are the instantaneous multi phase values <code>y[m]</code>.
</p>

<h4>See also></h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Utilities.FToDQ\">ToDQ</a>
</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end FromDQ;

    model CurrentController "Current controller"
      constant Integer m=3 "Number of phases";
      parameter Integer p "Number of pole pairs";
      extends Modelica_Blocks_Interfaces.MO(final nout=m);
      Modelica_Blocks_Interfaces.RealInput id_rms annotation (Placement(
            transformation(extent={{-140,40},{-100,80}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput iq_rms annotation (Placement(
            transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput phi annotation (Placement(
            transformation(
            origin={0,-120},
            extent={{20,-20},{-20,20}},
            rotation=270)));
      Modelica_Blocks.Math.Gain toPeak_d(k=sqrt(2)) annotation (Placement(
            transformation(extent={{-60,50},{-40,70}}, rotation=0)));
      Modelica_Blocks.Math.Gain toPeak_q(k=sqrt(2)) annotation (Placement(
            transformation(extent={{-60,-70},{-40,-50}}, rotation=0)));
      Modelica_Blocks.Math.Gain toGamma(k=-p) annotation (Placement(
            transformation(
            origin={0,-50},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      SpacePhasors.Blocks.Rotator rotator annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica_Blocks.Sources.Constant i0(k=0) annotation (Placement(
            transformation(extent={{-10,50},{10,30}}, rotation=0)));
      SpacePhasors.Blocks.FromSpacePhasor fromSpacePhasor annotation (Placement(
            transformation(extent={{40,10},{60,-10}}, rotation=0)));
    equation
      connect(iq_rms, toPeak_q.u)
        annotation (Line(points={{-120,-60},{-62,-60}}, color={0,0,127}));
      connect(phi, toGamma.u)
        annotation (Line(points={{0,-120},{0,-62}}, color={0,0,127}));
      connect(rotator.angle, toGamma.y)
        annotation (Line(points={{0,-12},{0,-39},{0,-39}}, color={0,0,127}));
      connect(rotator.y, fromSpacePhasor.u)
        annotation (Line(points={{11,0},{24,0},{38,0}}, color={0,0,127}));
      connect(toPeak_d.u, id_rms) annotation (Line(
          points={{-62,60},{-120,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(toPeak_d.y, rotator.u[1]) annotation (Line(
          points={{-39,60},{-30,60},{-30,-1},{-12,-1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(toPeak_q.y, rotator.u[2]) annotation (Line(
          points={{-39,-60},{-30,-60},{-30,1},{-12,1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(i0.y, fromSpacePhasor.zero) annotation (Line(
          points={{11,40},{20,40},{20,8},{38,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(fromSpacePhasor.y, y) annotation (Line(
          points={{61,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
                  extent={{-100,60},{20,40}},
                  lineColor={0,0,255},
                  textString="id_rms"),Text(
                  extent={{-100,-40},{20,-60}},
                  lineColor={0,0,255},
                  textString="iq_rms")}), Documentation(info="<html>
<p>
Simple Current-Controller.
</p>
<p>
The desired rms values of d- and q-component of the space phasor current in rotor fixed coordinate system are given by inputs \"id_rms\" and \"iq_rms\".
Using the given rotor position (input \"phi\"), the correct three-phase currents (output \"i[3]\") are calculated.
They can be used to feed a current source which in turn feeds an induction machine.
</p>
</HTML>"));
    end CurrentController;

    model VoltageController "Current controller"
      import Modelica_Constants.pi;
      constant Integer m=3 "Number of phases";
      parameter Integer p "Number of pole pairs";
      parameter Modelica_SIunits.Frequency fsNominal "Nominal frequency";
      parameter Modelica_SIunits.Voltage VsOpenCircuit
        "Open circuit RMS voltage per phase @ fsNominal";
      parameter Modelica_SIunits.Resistance Rs
        "Stator resistance per phase at TOperational";
      parameter Modelica_SIunits.Inductance Ld "Inductance in d-axis";
      parameter Modelica_SIunits.Inductance Lq "Inductance in q-axis";
      //Decoupling
      parameter Boolean decoupling=false "Use decoupling network";
      final parameter Modelica_SIunits.MagneticFlux psiM=sqrt(2)*VsOpenCircuit/
          (2*pi*fsNominal);
      Modelica_SIunits.AngularVelocity omega=p*der(phi);
      Modelica_SIunits.Voltage Vd=sqrt(2)*(Rs*id_rms - omega*Lq*iq_rms);
      Modelica_SIunits.Voltage Vq=sqrt(2)*(Rs*iq_rms + omega*Ld*id_rms) + omega
          *psiM;
      extends Modelica_Blocks_Interfaces.MO(final nout=m);
      Modelica_Blocks_Interfaces.RealInput id_rms annotation (Placement(
            transformation(extent={{-140,40},{-100,80}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput iq_rms annotation (Placement(
            transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput phi annotation (Placement(
            transformation(
            origin={60,-120},
            extent={{20,-20},{-20,20}},
            rotation=270)));
      Modelica_Blocks_Interfaces.RealInput iActual[3] annotation (Placement(
            transformation(
            origin={-60,-120},
            extent={{20,-20},{-20,20}},
            rotation=270)));
      FromDQ fromDQ(final p=p)
        annotation (Placement(transformation(extent={{70,-10},{90,10}})));
      ToDQ toDQ(final p=p) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-60,-80})));
      Modelica_Blocks.Math.Gain toPeak_d(final k=sqrt(2)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-70,60})));
      Modelica_Blocks.Math.Gain toPeak_q(final k=sqrt(2)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-70,0})));
      Modelica_Blocks.Math.Feedback feedback_d
        annotation (Placement(transformation(extent={{-38,50},{-18,70}})));
      Modelica_Blocks.Math.Feedback feedback_q
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Modelica_Blocks.Continuous.PI PI_d(
        final k=unitResistance/Rs,
        final T=Ld/Rs,
        initType=Modelica_Blocks.Types.Init.InitialOutput)
        annotation (Placement(transformation(extent={{-10,50},{10,70}})));
      Modelica_Blocks.Continuous.PI PI_q(
        final k=unitResistance/Rs,
        final T=Lq/Rs,
        initType=Modelica_Blocks.Types.Init.InitialOutput)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      Modelica_Blocks.Math.Add add[2](final k1=fill(+1, 2), final k2=fill(if
            decoupling then +1 else 0, 2))
        annotation (Placement(transformation(extent={{32,-10},{52,10}})));
      Modelica_Blocks.Sources.RealExpression deCoupling[2](y={Vd,Vq})
        annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
    protected
      constant Modelica_SIunits.Resistance unitResistance=1
        annotation (HideResult=true);
    equation
      connect(fromDQ.y, y) annotation (Line(
          points={{91,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(phi, fromDQ.phi) annotation (Line(
          points={{60,-120},{60,-80},{80,-80},{80,-12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(iActual, toDQ.u) annotation (Line(
          points={{-60,-120},{-60,-92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(phi, toDQ.phi) annotation (Line(
          points={{60,-120},{60,-80},{-48,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(toPeak_d.u, id_rms) annotation (Line(
          points={{-82,60},{-120,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(toPeak_q.u, iq_rms) annotation (Line(
          points={{-82,0},{-90,0},{-90,-60},{-120,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(toPeak_q.y, feedback_q.u1) annotation (Line(
          points={{-59,0},{-38,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(toPeak_d.y, feedback_d.u1) annotation (Line(
          points={{-59,60},{-36,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback_d.y, PI_d.u) annotation (Line(
          points={{-19,60},{-12,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback_q.y, PI_q.u) annotation (Line(
          points={{-21,0},{-12,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(toDQ.y[1], feedback_d.u2) annotation (Line(
          points={{-59.5,-69},{-59.5,-60},{-50,-60},{-50,40},{-28,40},{-28,52}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(toDQ.y[2], feedback_q.u2) annotation (Line(
          points={{-60.5,-69},{-60.5,-60},{-50,-60},{-50,-20},{-30,-20},{-30,-8}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(add.y, fromDQ.u) annotation (Line(
          points={{53,0},{68,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PI_d.y, add[1].u1) annotation (Line(
          points={{11,60},{20,60},{20,6},{30,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PI_q.y, add[2].u1) annotation (Line(
          points={{11,0},{20,0},{20,6},{30,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(deCoupling.y, add.u2) annotation (Line(
          points={{11,-30},{20,-30},{20,-6},{30,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(graphics={Text(
                  extent={{-100,60},{20,40}},
                  lineColor={0,0,255},
                  textString="id_rms"),Text(
                  extent={{-100,-40},{20,-60}},
                  lineColor={0,0,255},
                  textString="iq_rms")}), Documentation(info="<html>
<p>
Simple Voltage-Controller
</p>
<p>
The desired rms values of d- and q-component of the space phasor current in rotor fixed coordinate system are given by inputs \"id_rms\" and \"iq_rms\".
Using the given rotor position (input \"phi\"), the actual threephase currents are measured and transformed to the d-q coordinate system.
Two PI-controller determine the necessary d- and q- voltages, which are transformed back to threephase (output \"y[3]\").
They can be used to feed a voltage source which in turn feeds a permanent magnet synchronous machine.
</p>
<p>
Note: No care is taken for current or voltage limiting, as well as for field weakening.
</p>
</html>"));
    end VoltageController;

    model SwitchYD "Y-D-switch"
      parameter Integer m=3 "Number of phases";
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plugSupply(final m=
           m) "To grid" annotation (Placement(transformation(extent={{-10,90},{
                10,110}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_sp(final m=m)
        "To positive stator plug" annotation (Placement(transformation(extent={
                {50,-90},{70,-110}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_sn(final m=m)
        "To negative stator plug" annotation (Placement(transformation(extent={
                {-70,-90},{-50,-110}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{20,-50},{40,-30}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Delta delta(final m=m) annotation (
          Placement(transformation(extent={{40,-80},{20,-60}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealCommutingSwitch
        idealCommutingSwitch(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(extent={{-10,-70},
                {10,-50}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanInput control[m] annotation (Placement(
            transformation(extent={{-120,-10},{-100,10}}, rotation=0)));
    equation
      connect(delta.plug_p, plugSupply) annotation (Line(points={{40,-70},{60,-70},
              {60,100},{0,100}}, color={0,0,255}));
      connect(delta.plug_p, plug_sp) annotation (Line(points={{40,-70},{60,-70},
              {60,-100}}, color={0,0,255}));
      connect(idealCommutingSwitch.plug_n2, delta.plug_n) annotation (Line(
            points={{10,-60},{10,-70},{20,-70}}, color={0,0,255}));
      connect(idealCommutingSwitch.plug_n1, star.plug_p) annotation (Line(
            points={{10,-55},{10,-40},{20,-40}}, color={0,0,255}));
      connect(idealCommutingSwitch.plug_p, plug_sn) annotation (Line(points={{-10,
              -60},{-60,-60},{-60,-100}}, color={0,0,255}));
      connect(control, idealCommutingSwitch.control)
        annotation (Line(points={{-110,0},{0,0},{0,-52}}, color={255,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Polygon(
                  points={{-100,-60},{-60,-100},{58,-100},{100,-60},{100,60},{
                60,100},{-60,100},{-100,60},{-100,-60}},
                  lineColor={175,175,175},
                  smooth=Smooth.None,
                  fillColor={215,215,215},
                  fillPattern=FillPattern.Solid),Line(
                  points={{-80,52},{-40,0},{-2,52},{-40,0},{-40,-52}},
                  color={0,0,255},
                  thickness=0.5),Line(
                  points={{0,40},{0,-40},{80,0},{0,40}},
                  color={0,0,255},
                  thickness=0.5)}), Documentation(info="<HTML>
Simple Star-Delta-switch.<br>
If <i>control</i> is false, plug_sp and plug_sn are star connected and plug_sp connected to the supply plug.<br>
If <i>control</i> is true, plug_sp and plug_sn are delta connected and they are connected to the supply plug.
</HTML>"));
    end SwitchYD;

    model TerminalBox "Terminal box Y/D-connection"
      parameter Integer m=3 "Number of phases";
      parameter String terminalConnection(start="Y") "Choose Y=star/D=delta"
        annotation (choices(choice="Y" "Star connection", choice="D"
            "Delta connection"));
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_sp(final m=m)
        "To positive stator plug" annotation (Placement(transformation(extent={
                {50,-90},{70,-110}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_sn(final m=m)
        "To negative stator plug" annotation (Placement(transformation(extent={
                {-70,-90},{-50,-110}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) if (
        terminalConnection <> "D") annotation (Placement(transformation(
            origin={-70,-80},
            extent={{-10,10},{10,-10}},
            rotation=180)));
      Modelica_Electrical_MultiPhase.Basic.Delta delta(final m=m) if (
        terminalConnection == "D") annotation (Placement(transformation(extent=
                {{-20,-70},{-40,-50}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plugSupply(final m=
           m) "To grid" annotation (Placement(transformation(extent={{-10,-70},
                {10,-90}}, rotation=0)));
      Modelica_Electrical_Analog_Interfaces.NegativePin starpoint if (
        terminalConnection <> "D") annotation (Placement(transformation(extent=
                {{-100,-90},{-80,-70}}, rotation=0)));
    equation
      connect(plug_sn, star.plug_p)
        annotation (Line(points={{-60,-100},{-60,-80}}, color={0,0,255}));
      connect(plug_sn, delta.plug_n) annotation (Line(points={{-60,-100},{-40,-100},
              {-40,-60}}, color={0,0,255}));
      connect(delta.plug_p, plug_sp) annotation (Line(points={{-20,-60},{60,-60},
              {60,-100}}, color={0,0,255}));
      connect(plug_sp, plugSupply) annotation (Line(points={{60,-100},{0,-100},
              {0,-80}}, color={0,0,255}));
      connect(star.pin_n, starpoint)
        annotation (Line(points={{-80,-80},{-90,-80}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Polygon(
                  points={{-80,-80},{-80,-84},{-80,-120},{-40,-140},{40,-140},{
                80,-110},{80,-84},{76,-80},{-80,-80}},
                  lineColor={95,95,95},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.Solid),Text(
                  extent={{-40,-90},{40,-130}},
                  lineColor={0,0,0},
                  textString="%terminalConnection")}), Documentation(info="<html>
TerminalBox: at the bottom connected to both machine plugs, connect at the top to the grid as usual,<br>
choosing Y-connection (StarDelta=Y) or D-connection (StarDelta=D).
</html>"));
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
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_sp(final m=m)
        "To positive stator plug" annotation (Placement(transformation(extent={
                {50,-90},{70,-110}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_sn(final m=m)
        "To negative stator plug" annotation (Placement(transformation(extent={
                {-70,-90},{-50,-110}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.MultiStar multiStar(final m=m) if
                                                         (terminalConnection
         <> "D") annotation (Placement(transformation(
            origin={-70,-80},
            extent={{-10,10},{10,-10}},
            rotation=180)));
      Modelica_Electrical_MultiPhase.Basic.MultiDelta multiDelta(final m=m) if
                                                           (terminalConnection
         == "D") annotation (Placement(transformation(extent={{-20,-70},{-40,-50}},
              rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plugSupply(final m=
           m) "To grid" annotation (Placement(transformation(extent={{-10,-70},
                {10,-90}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug starpoint(final m=
            mSystems) if (terminalConnection <> "D") annotation (Placement(
            transformation(extent={{-100,-90},{-80,-70}}, rotation=0)));
    equation
      connect(plug_sn, multiStar.plug_p)
        annotation (Line(points={{-60,-100},{-60,-80}}, color={0,0,255}));
      connect(plug_sn, multiDelta.plug_n) annotation (Line(points={{-60,-100},{
              -40,-100},{-40,-60}}, color={0,0,255}));
      connect(multiDelta.plug_p, plug_sp) annotation (Line(points={{-20,-60},{
              60,-60},{60,-100}}, color={0,0,255}));
      connect(plug_sp, plugSupply) annotation (Line(points={{60,-100},{0,-100},
              {0,-80}}, color={0,0,255}));
      connect(starpoint, multiStar.starpoints) annotation (Line(
          points={{-90,-80},{-80,-80}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                  points={{-74,-80},{-80,-86},{-80,-120},{-40,-140},{40,-140},{
                80,-110},{80,-84},{76,-80},{-74,-80}},
                  lineColor={95,95,95},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.CrossDiag),Text(
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
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
        "To positive rotor plug" annotation (Placement(transformation(extent={{
                90,70},{110,50}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n(final m=m)
        "To negative rotor plug" annotation (Placement(transformation(extent={{
                90,-50},{110,-70}}, rotation=0)));
      parameter Modelica_SIunits.Resistance RStart "Starting resistance";
      parameter Modelica_SIunits.Time tStart
        "Duration of switching on the starting resistor";
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-40,-70},{-60,-50}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-80,-60},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Ideal.IdealCommutingSwitch
        idealCommutingSwitch(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(
            origin={40,20},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Resistor rheostat(final m=m, final R=
           fill(RStart, m)) annotation (Placement(transformation(extent={{0,-30},
                {-20,-10}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star starRheostat(final m=m)
        annotation (Placement(transformation(extent={{-40,-30},{-60,-10}},
              rotation=0)));
      Modelica_Blocks.Sources.BooleanStep booleanStep[m](final startTime=fill(
            tStart, m), final startValue=fill(false, m)) annotation (Placement(
            transformation(extent={{-60,10},{-40,30}}, rotation=0)));
    equation
      connect(plug_p, idealCommutingSwitch.plug_p) annotation (Line(
          points={{100,60},{40,60},{40,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCommutingSwitch.plug_n2, plug_n) annotation (Line(
          points={{40,10},{40,-60},{100,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(rheostat.plug_p, idealCommutingSwitch.plug_n1) annotation (Line(
          points={{0,-20},{35,-20},{35,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCommutingSwitch.plug_n2, star.plug_p) annotation (Line(
          points={{40,10},{40,-60},{-40,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(rheostat.plug_n, starRheostat.plug_p) annotation (Line(
          points={{-20,-20},{-40,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(starRheostat.pin_n, star.pin_n) annotation (Line(
          points={{-60,-20},{-60,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(star.pin_n, ground.p) annotation (Line(
          points={{-60,-60},{-70,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(booleanStep.y, idealCommutingSwitch.control) annotation (Line(
          points={{-39,20},{32,20}},
          color={255,0,255},
          smooth=Smooth.None));
      annotation (Icon(graphics={Rectangle(
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
<p>Switched rheostat, used for starting asynchronous induction motors with slipring rotor:</p>
<p>The external rotor resistance <code>RStart</code> is shortened at time <code>tStart</code>.</p>
</HTML>"));
    end SwitchedRheostat;

    model RampedRheostat "Rheostat with linearly decreasing resistance"
      parameter Integer m=3 "Number of phases";
      Modelica_Electrical_MultiPhase_Interfaces.PositivePlug plug_p(final m=m)
        "To positive rotor plug" annotation (Placement(transformation(extent={{
                90,70},{110,50}}, rotation=0)));
      Modelica_Electrical_MultiPhase_Interfaces.NegativePlug plug_n(final m=m)
        "To negative rotor plug" annotation (Placement(transformation(extent={{
                90,-50},{110,-70}}, rotation=0)));
      parameter Modelica_SIunits.Resistance RStart "Starting resistance";
      parameter Modelica_SIunits.Time tStart
        "Time instance of reducing the rheostat";
      parameter Modelica_SIunits.Time tRamp "Duration of ramp";
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-20,-70},{-40,-50}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-70,-60},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.VariableResistor rheostat(final m=m)
        annotation (Placement(transformation(
            origin={60,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.Ramp ramp[m](
        final height=fill(-RStart, m),
        final duration=fill(tRamp, m),
        final offset=fill(RStart, m),
        final startTime=fill(tStart, m)) annotation (Placement(transformation(
              extent={{-20,-10},{0,10}}, rotation=0)));
    equation
      connect(plug_p, rheostat.plug_p) annotation (Line(
          points={{100,60},{60,60},{60,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(rheostat.plug_n, plug_n) annotation (Line(
          points={{60,-10},{60,-60},{100,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(rheostat.R, ramp.y) annotation (Line(
          points={{50,0},{26,0},{26,0},{1,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rheostat.plug_n, star.plug_p) annotation (Line(
          points={{60,-10},{60,-60},{-20,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(star.pin_n, ground.p) annotation (Line(
          points={{-40,-60},{-60,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Icon(graphics={Rectangle(
                  extent={{26,40},{54,-40}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{100,-60},{40,-60},
              {40,-40}}, color={0,0,255}),Line(points={{10,-80},{70,-80}},
              color={0,0,255}),Line(points={{40,-60},{40,-80}}, color={0,0,255}),
              Line(points={{20,-90},{60,-90}}, color={0,0,255}),Line(points={{
              30,-100},{50,-100}}, color={0,0,255}),Line(points={{40,40},{40,60},
              {100,60}}, color={0,0,255}),Rectangle(
                  extent={{-100,40},{-20,-40}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{-90,24},{-72,24},
              {-30,-30}}, color={0,0,255}),Polygon(
                  points={{-20,6},{-10,0},{-20,-6},{-20,6}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Polygon(
                  points={{10,6},{20,0},{10,-6},{10,6}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Line(points={{-10,0},{10,0}},
              color={0,0,255}),Line(points={{20,0},{26,0}}, color={0,0,255})}),
          Documentation(info="<HTML>
<p>Ramped rheostat, used for starting asynchronous induction motors with slipring rotor:</p>
<p>The external rotor resistance <code>RStart</code> is reduced to zero,
starting at time <code>tStart</code> with a linear ramp <code>tRamp</code>.</p>
</HTML>"));
    end RampedRheostat;

    record SynchronousMachineData
      "Computes machine parameter from usual datasheet"
      extends Modelica_Icons.Record;
      import Modelica_Constants.pi;
      parameter Modelica_SIunits.ApparentPower SNominal(start=30E3)
        "Nominal apparent power";
      parameter Modelica_SIunits.Voltage VsNominal(start=100)
        "Nominal stator voltage per phase";
      final parameter Modelica_SIunits.Current IsNominal=SNominal/(3*VsNominal)
        "Nominal stator current per phase";
      final parameter Modelica_SIunits.Impedance ZReference=VsNominal/IsNominal
        "Reference impedance";
      parameter Modelica_SIunits.Frequency fsNominal(start=50)
        "Nominal stator frequency";
      final parameter Modelica_SIunits.AngularVelocity omega=2*pi*fsNominal
        "Nominal angular frequency";
      parameter Modelica_SIunits.Current IeOpenCircuit(start=10)
        "Open circuit excitation current @ nominal voltage and frequency";
      final parameter Real turnsRatio=sqrt(2)*VsNominal/(omega*Lmd*
          IeOpenCircuit) "Stator current / excitation current";
      parameter Real x0(start=0.1)
        "Stator stray inductance per phase (approximately zero impedance) [pu]";
      parameter Real xd(start=1.6)
        "Synchronous reactance per phase, d-axis [pu]";
      parameter Real xq(start=1.6)
        "Synchronous reactance per phase, q-axis [pu]";
      parameter Real xdTransient(start=0.1375)
        "Transient reactance per phase, d-axis [pu]";
      parameter Real xdSubtransient(start=0.121428571)
        "Subtransient reactance per phase, d-axis [pu]";
      parameter Real xqSubtransient(start=0.148387097)
        "Subtransient reactance per phase, q-axis [pu]";
      parameter Modelica_SIunits.Time Ta(start=0.014171268)
        "Armature time constant";
      parameter Modelica_SIunits.Time Td0Transient(start=0.261177343)
        "Open circuit field time constant Td0'";
      parameter Modelica_SIunits.Time Td0Subtransient(start=0.006963029)
        "Open circuit subtransient time constant Td0'', d-axis";
      parameter Modelica_SIunits.Time Tq0Subtransient(start=0.123345081)
        "Open circuit subtransient time constant Tq0'', q-axis";
      parameter Modelica_SIunits.Temperature TsSpecification(start=293.15)
        "Specification temperature of stator resistance"
        annotation (Dialog(tab="Material"));
      parameter Modelica_SIunits.Temperature TsRef(start=293.15)
        "Reference temperature of stator resistance"
        annotation (Dialog(tab="Material"));
      parameter Thermal.LinearTemperatureCoefficient20 alpha20s(start=0)
        "Temperature coefficient of stator resistance at 20 degC"
        annotation (Dialog(tab="Material"));
      parameter Modelica_SIunits.Temperature TrSpecification(start=293.15)
        "Specification temperature of (optional) damper cage"
        annotation (Dialog(tab="Material"));
      parameter Modelica_SIunits.Temperature TrRef(start=293.15)
        "Reference temperature of damper resistances in d- and q-axis"
        annotation (Dialog(tab="Material"));
      parameter Thermal.LinearTemperatureCoefficient20 alpha20r(start=0)
        "Temperature coefficient of damper resistances in d- and q-axis"
        annotation (Dialog(tab="Material"));
      parameter Modelica_SIunits.Temperature TeSpecification(start=293.15)
        "Specification excitation temperature"
        annotation (Dialog(tab="Material"));
      parameter Modelica_SIunits.Temperature TeRef(start=293.15)
        "Reference temperature of excitation resistance"
        annotation (Dialog(tab="Material"));
      parameter Thermal.LinearTemperatureCoefficient20 alpha20e(start=0)
        "Temperature coefficient of excitation resistance"
        annotation (Dialog(tab="Material"));
      final parameter Real xmd=xd - x0
        "Main field reactance per phase, d-axis [pu]";
      final parameter Real xmq=xq - x0
        "Main field reactance per phase, q-axis [pu]";
      final parameter Real xe=xmd^2/(xd - xdTransient)
        "Excitation reactance [pu]";
      final parameter Real xrd=xmd^2/(xdTransient - xdSubtransient)*(1 - (xmd/
          xe))^2 + xmd^2/xe "Damper reactance per phase, d-axis [pu]";
      final parameter Real xrq=xmq^2/(xq - xqSubtransient)
        "Damper reactance per phase, d-axis [pu]";
      final parameter Real rs=2/(1/xdSubtransient + 1/xqSubtransient)/(omega*Ta)
        "Stator resistance per phase at specifaction temperature [pu]";
      final parameter Real rrd=(xrd - xmd^2/xe)/(omega*Td0Subtransient)
        "Damper resistance per phase at specification temperature, d-axis [pu]";
      final parameter Real rrq=xrq/(omega*Tq0Subtransient)
        "Damper resistance per phase at specification temperature, q-axis [pu]";
      final parameter Real re=xe/(omega*Td0Transient)
        "Excitation resistance per phase at specification temperature [pu]";
      parameter Modelica_SIunits.Resistance Rs=
          Thermal.convertResistance(
              rs*ZReference,
              TsSpecification,
              alpha20s,
              TsRef) "Stator resistance per phase at TRef"
        annotation (Dialog(tab="Result", enable=false));
      parameter Modelica_SIunits.Inductance Lssigma=x0*ZReference/omega
        "Stator stray inductance per phase"
        annotation (Dialog(tab="Result", enable=false));
      parameter Modelica_SIunits.Inductance Lmd=xmd*ZReference/omega
        "Main field inductance in d-axis"
        annotation (Dialog(tab="Result", enable=false));
      parameter Modelica_SIunits.Inductance Lmq=xmq*ZReference/omega
        "Main field inductance in q-axis"
        annotation (Dialog(tab="Result", enable=false));
      parameter Modelica_SIunits.Inductance Lrsigmad=(xrd - xmd)*ZReference/
          omega "Damper stray inductance in d-axis"
        annotation (Dialog(tab="Result", enable=false));
      parameter Modelica_SIunits.Inductance Lrsigmaq=(xrq - xmq)*ZReference/
          omega "Damper stray inductance in q-axis"
        annotation (Dialog(tab="Result", enable=false));
      parameter Modelica_SIunits.Resistance Rrd=
          Thermal.convertResistance(
              rrd*ZReference,
              TrSpecification,
              alpha20r,
              TrRef) "Damper resistance in d-axis at TRef"
        annotation (Dialog(tab="Result", enable=false));
      parameter Modelica_SIunits.Resistance Rrq=
          Thermal.convertResistance(
              rrq*ZReference,
              TrSpecification,
              alpha20r,
              TrRef) "Damper resistance in q-axis at TRef"
        annotation (Dialog(tab="Result", enable=false));
      parameter Modelica_SIunits.Resistance Re=3/2*turnsRatio^2*
          Thermal.convertResistance(
              re*ZReference,
              TeSpecification,
              alpha20e,
              TeRef) "Excitation resistance at TRef"
        annotation (Dialog(tab="Result", enable=false));
      parameter Real sigmae=1 - xmd/xe
        "Stray fraction of total excitation inductance"
        annotation (Dialog(tab="Result", enable=false));
      annotation (
        defaultComponentName="smeeData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>The parameters of the
<a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">
synchronous machine model with electrical excitation (and damper)</a> are calculated from parameters
normally given in a technical description, according to the standard EN&nbsp;60034-4:2008&nbsp;Appendix&nbsp;C.</p>
</html>"));
    end SynchronousMachineData;

    record TransformerData "Calculates Impedances from nominal values"
      extends Modelica_Icons.Record;
      parameter Modelica_SIunits.Frequency f(start=50) "Nominal frequency";
      parameter Modelica_SIunits.Voltage V1(start=100)
        "Primary nominal line-to-line voltage (RMS)";
      parameter String C1(start="Y") "Choose primary connection" annotation (
          choices(choice="Y" "Star connection", choice="D" "Delta connection"));
      parameter Modelica_SIunits.Voltage V2(start=100)
        "Secondary open circuit line-to-line voltage (RMS) @ primary nominal voltage";
      parameter String C2(start="y") "Choose secondary connection" annotation (
          choices(
          choice="y" "Star connection",
          choice="d" "Delta connection",
          choice="z" "Zig-zag connection"));
      parameter Modelica_SIunits.ApparentPower SNominal(start=30E3)
        "Nominal apparent power";
      parameter Real v_sc(
        final min=0,
        final max=1,
        start=0.05) "Impedance voltage drop pu";
      parameter Modelica_SIunits.Power P_sc(start=300)
        "Short-circuit (copper) losses";
      parameter Real n=V1/V2
        "Ratio primary voltage (line-to-line) / secondary voltage (line-to-line)"
        annotation (Dialog(tab="Result",enable=false));
      final parameter Modelica_SIunits.Voltage V1ph=V1/(if C1 == "D" then 1
           else sqrt(3)) "Primary phase voltage (RMS)";
      final parameter Modelica_SIunits.Current I1ph=SNominal/(3*V1ph)
        "Primary phase current (RMS)";
      final parameter Modelica_SIunits.Voltage V2ph=V2/(if C2 == "d" then 1
           else sqrt(3)) "Secondary phase voltage (RMS)";
      final parameter Modelica_SIunits.Current I2ph=SNominal/(3*V2ph)
        "Secondary phase current (RMS)";
      final parameter Modelica_SIunits.Impedance Z1ph=0.5*v_sc*V1ph/I1ph
        "Primary impedance per phase";
      parameter Modelica_SIunits.Resistance R1=0.5*P_sc/(3*I1ph^2)
        "Warm primary resistance per phase"
        annotation (Dialog(tab="Result",enable=false));
      parameter Modelica_SIunits.Inductance L1sigma=sqrt(Z1ph^2 - R1^2)/(2*
          Modelica_Constants.pi*f) "Primary stray inductance per phase"
        annotation (Dialog(tab="Result",enable=false));
      final parameter Modelica_SIunits.Impedance Z2ph=0.5*v_sc*V2ph/I2ph
        "Secondary impedance per phase";
      parameter Modelica_SIunits.Resistance R2=0.5*P_sc/(3*I2ph^2)
        "Warm secondary resistance per phase"
        annotation (Dialog(tab="Result",enable=false));
      parameter Modelica_SIunits.Inductance L2sigma=sqrt(Z2ph^2 - R2^2)/(2*
          Modelica_Constants.pi*f) "Secondary stray inductance per phase"
        annotation (Dialog(tab="Result",enable=false));
      annotation (defaultComponentPrefixes="parameter",Documentation(info="<HTML>
<p>The parameters of the transformer models are calculated from parameters normally given in a technical description.</p>
</HTML>"));
    end TransformerData;
    annotation (Documentation(info="<HTML>
This package contains utility components for testing examples.
</HTML>", revisions="<HTML>
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
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.3.1 2004/11/06 Anton Haumer<br>
       small changes in VfController</li>
  <li> v1.6.1 2004/11/22 Anton Haumer<br>
       introduced TerminalBox</li>
  <li> v2.1.1 2010/02/05 Anton Haumer<br>
       included rheostats (designed by Christian Kral)</li>
  </ul>
</HTML>"));
  end Utilities;
  annotation (
    preferredView="info",
    Documentation(info="<HTML>
<p>
Copyright &copy; 1998-2014, Modelica Association, Anton Haumer, Christian Kral and AIT.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</HTML>", revisions="<HTML>
</HTML>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          origin={2.835,10},
          fillColor={0,128,255},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-60,-60},{60,60}}),
        Rectangle(
          origin={2.835,10},
          fillColor={128,128,128},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-80,-60},{-60,60}}),
        Rectangle(
          origin={2.835,10},
          fillColor={95,95,95},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{60,-10},{80,10}}),
        Rectangle(
          origin={2.835,10},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          extent={{-60,50},{20,70}}),
        Polygon(
          origin={2.835,10},
          fillPattern=FillPattern.Solid,
          points={{-70,-90},{-60,-90},{-30,-20},{20,-20},{50,-90},{60,-90},{60,
              -100},{-70,-100},{-70,-90}})}),
    uses(Modelica_Electrical_Machines(version="3.2.2"),
         Modelica_Icons.Package(version="3.2.2"),
         Modelica_Thermal_HeatTransfer(version="3.2.2"),
         Modelica_Thermal_HeatTransfer_Interfaces(version="3.2.2"),
         Modelica_Math(version="3.2.2"),
         Modelica_Mechanics_Rotational(version="3.2.2"),
         Modelica_Blocks(version="3.2.2"),
         Modelica_Mechanics_Rotational_Interfaces(version="3.2.2"),
         Modelica_Electrical_Analog_Interfaces(version="3.2.2"),
         Modelica_Blocks_Interfaces(version="3.2.2"),
         Modelica_Electrical_Analog(version="3.2.2"),
         Modelica_Electrical_MultiPhase_Interfaces(version="3.2.2"),
         Modelica_Electrical_MultiPhase(version="3.2.2"),
         Modelica_Constants(version="3.2.2"),
         Modelica_SIunits(version="3.2.2"),
         Modelica_Electrical_Machines_Interfaces(version="3.2.2"),
         Modelica_Icons(version="3.2.2")),
     version="3.2.2");
end Modelica_Electrical_Machines;
