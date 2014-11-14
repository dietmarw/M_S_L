within ;
package Modelica_Magnetic_QuasiStatic_FundamentalWave_Examples "Examples"
  extends Modelica_Icons.ExamplesPackage;
  package Components
    "Examples for testing quasi static fundamental wave components"
    extends Modelica_Icons.ExamplesPackage;
    model MultiPhaseInductance "Multi phase inductance"
      extends Modelica_Icons.Example;
      parameter Integer m=5 "Number of phases";
      parameter Modelica_SIunits.Frequency f=1 "Supply frequency";
      parameter Modelica_SIunits.Voltage VRMS=100 "RMS supply voltage";
      parameter Modelica_SIunits.Resistance R=1E-5 "Resistance";
      parameter Modelica_SIunits.Inductance L=1 "Load inductance";
      parameter Real effectiveTurns=5 "Effective number of turns";
      // Symmetrical multi phase magnetic reluctance
      final parameter Modelica_SIunits.Reluctance R_m=m*effectiveTurns^2/2/L
        "Equivalent magnetic reluctance";
      Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground_e
        annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
      Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground_m
        annotation (Placement(transformation(extent={{-70,-90},{-50,-70}})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star_e(m=m)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,40})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star_m(m=m)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-60})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource
        voltageSource_e(
        m=m,
        f=f,
        phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
        V=fill(VRMS, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,70})));

      Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource
        voltageSource_m(
        m=m,
        f=f,
        phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
        V=fill(VRMS, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-30})));

      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor
        resistor_e(m=m, R_ref=fill(R*m/3, m))
        annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor
        resistor_m(m=m, R_ref=fill(R*m/3, m))
        annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Inductor
        inductor_e(m=m, L=fill(L, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,70})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
        converter_m(m=m, effectiveTurns=effectiveTurns)
        annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Reluctance reluctance_m(R_m(d=R_m,
            q=R_m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-30})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Ground groundM_m
        annotation (Placement(transformation(extent={{10,-90},{30,-70}})));
    equation
      connect(star_e.pin_n, ground_e.pin) annotation (Line(
          points={{-60,30},{-60,30}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(star_e.plug_p, voltageSource_e.plug_n) annotation (Line(
          points={{-60,50},{-60,60}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(voltageSource_e.plug_n, inductor_e.plug_n) annotation (Line(
          points={{-60,60},{0,60}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(converter_m.port_p, reluctance_m.port_p) annotation (Line(
          points={{20,-20},{60,-20}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(converter_m.port_n, reluctance_m.port_n) annotation (Line(
          points={{20,-40},{60,-40}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(converter_m.port_n, groundM_m.port_p) annotation (Line(
          points={{20,-40},{20,-70}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(voltageSource_m.plug_n, star_m.plug_p) annotation (Line(
          points={{-60,-40},{-60,-50}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(star_m.pin_n, ground_m.pin) annotation (Line(
          points={{-60,-70},{-60,-70}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(voltageSource_m.plug_n, converter_m.plug_n) annotation (Line(
          points={{-60,-40},{0,-40}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(voltageSource_e.plug_p, resistor_e.plug_p) annotation (Line(
          points={{-60,80},{-40,80}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(resistor_e.plug_n, inductor_e.plug_p) annotation (Line(
          points={{-20,80},{0,80}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(voltageSource_m.plug_p, resistor_m.plug_p) annotation (Line(
          points={{-60,-20},{-40,-20}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(resistor_m.plug_n, converter_m.plug_p) annotation (Line(
          points={{-20,-20},{0,-20}},
          color={85,170,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                {{-100,-100},{100,100}}), graphics), experiment(StopTime=100,
            Interval=0.01));
    end MultiPhaseInductance;

    model EddyCurrentLosses
      "Comparison of equivalent circuits of eddy current loss models"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      // ## Original value R = 0.1 Ohm
      parameter Modelica_SIunits.Resistance R=0.1 "Resistance";
      parameter Modelica_SIunits.Conductance Gc=0.0001 "Loss conductance";
      parameter Modelica_SIunits.Reluctance R_m=1
        "Reluctance of the magnetic circuit";
      parameter Real N=1 "Number of turns";
      output Modelica_SIunits.Power lossPower_e=sum(loss_e.conductor.LossPower);
      output Modelica_SIunits.Power lossPower_m=loss_m.lossPower;
      Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground_e
        annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
      Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground_m
        annotation (Placement(transformation(extent={{-90,-90},{-70,-70}})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star_e(m=m)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,30})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star_m(m=m)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,-60})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource
        sineVoltage_e(
        m=m,
        f=1,
        phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
        V=fill(1/sqrt(2), m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,60})));

      Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource
        sineVoltage_m(
        m=m,
        f=1,
        phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
        V=fill(1/sqrt(2), m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,-30})));

      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor
        resistor_e(m=m, R_ref=fill(R*m/3, m)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-60,70})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor
        resistor_m(m=m, R_ref=fill(R*m/3, m)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-60,-20})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor
        powerb_e(m=m)
        annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor
        powerb_m(m=m)
        annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
      Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Conductor loss_e(m=
           m,G_ref=fill(Gc*3/m, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,60})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
        converter_e(effectiveTurns=N)
        annotation (Placement(transformation(extent={{20,50},{40,70}})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
        converter_m(effectiveTurns=N)
        annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.EddyCurrent loss_m(G=m*N^2*
            Gc/2) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={60,-20})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Reluctance reluctance_e(R_m(d=R_m,
            q=R_m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={80,60})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Reluctance reluctance_m(R_m(d=R_m,
            q=R_m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={80,-30})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Ground mground_e
        annotation (Placement(transformation(extent={{30,0},{50,20}})));
      Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Ground mground_m
        annotation (Placement(transformation(extent={{30,-90},{50,-70}})));
    equation
      connect(sineVoltage_e.plug_n, converter_e.plug_n) annotation (Line(
          points={{-80,50},{20,50}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(sineVoltage_e.plug_n, star_e.plug_p) annotation (Line(
          points={{-80,50},{-80,40}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(converter_e.port_p, reluctance_e.port_p) annotation (Line(
          points={{40,70},{80,70}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(converter_e.port_n, reluctance_e.port_n) annotation (Line(
          points={{40,50},{80,50}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(converter_e.port_n, mground_e.port_p) annotation (Line(
          points={{40,50},{40,20}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(resistor_e.plug_p, sineVoltage_e.plug_p) annotation (Line(
          points={{-70,70},{-80,70}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(loss_e.plug_n, sineVoltage_e.plug_n) annotation (Line(
          points={{0,50},{-80,50}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(loss_e.plug_p, converter_e.plug_p) annotation (Line(
          points={{0,70},{20,70}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(resistor_e.plug_n, powerb_e.currentP) annotation (Line(
          points={{-50,70},{-40,70}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(powerb_e.currentN, converter_e.plug_p) annotation (Line(
          points={{-20,70},{20,70}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(star_e.pin_n, ground_e.pin) annotation (Line(
          points={{-80,20},{-80,20}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(powerb_e.currentP, powerb_e.voltageP) annotation (Line(
          points={{-40,70},{-40,80},{-30,80}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(powerb_e.voltageN, sineVoltage_e.plug_n) annotation (Line(
          points={{-30,60},{-30,50},{-80,50}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(sineVoltage_m.plug_n, star_m.plug_p) annotation (Line(
          points={{-80,-40},{-80,-50}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(sineVoltage_m.plug_n, converter_m.plug_n) annotation (Line(
          points={{-80,-40},{20,-40}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(converter_m.port_n, reluctance_m.port_n) annotation (Line(
          points={{40,-40},{80,-40}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(converter_m.port_p, loss_m.port_p) annotation (Line(
          points={{40,-20},{50,-20}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(loss_m.port_n, reluctance_m.port_p) annotation (Line(
          points={{70,-20},{80,-20}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(converter_m.port_n, mground_m.port_p) annotation (Line(
          points={{40,-40},{40,-70}},
          color={255,170,85},
          smooth=Smooth.None));
      connect(sineVoltage_m.plug_p, resistor_m.plug_p) annotation (Line(
          points={{-80,-20},{-70,-20}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(resistor_m.plug_n, powerb_m.currentP) annotation (Line(
          points={{-50,-20},{-40,-20}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(powerb_m.currentN, converter_m.plug_p) annotation (Line(
          points={{-20,-20},{20,-20}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(star_m.pin_n, ground_m.pin) annotation (Line(
          points={{-80,-70},{-80,-70}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(powerb_m.currentP, powerb_m.voltageP) annotation (Line(
          points={{-40,-20},{-40,-10},{-30,-10}},
          color={85,170,255},
          smooth=Smooth.None));
      connect(powerb_m.voltageN, sineVoltage_m.plug_n) annotation (Line(
          points={{-30,-30},{-30,-40},{-80,-40}},
          color={85,170,255},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=40, Interval=0.01),
        Documentation(info="<html>
<p>
In this example the eddy current losses are implemented in two different ways. Compare the loss dissipation <code>powerb_e.power</code> and <code>powerb_m.power</code> of the two models indicated by power meters.</p>
</html>"),
        Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
              preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end EddyCurrentLosses;
  end Components;

  package BasicMachines "Examples of basic machines"
    extends Modelica_Icons.ExamplesPackage;
    package InductionMachines "Induction machine examples"
      extends Modelica_Icons.ExamplesPackage;
      model IMC_DOL
        "Induction machines with squirrel cage started directly on line (DOL)"
        import Modelica_Constants.pi;
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Modelica_Icons.Example;
        parameter Integer m=5 "Number of phases";
        parameter Modelica_SIunits.Voltage VsNominal=100
          "Nominal RMS voltage per phase";
        parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
        parameter Modelica_SIunits.Time tOn=0.1 "Start time of machine";
        parameter Modelica_SIunits.Torque T_Load=161.4 "Nominal load torque";
        parameter Modelica_SIunits.AngularVelocity w_Load(displayUnit="1/min")=
             1440.45*2*Modelica_Constants.pi/60 "Nominal load speed";
        parameter Modelica_SIunits.Inertia J_Load=0.5 "Load inertia";
        parameter Integer p=2 "Number of pole pairs";
        Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSourceQS(
          m=m,
          f=fNominal,
          V=fill(VsNominal, m),
          phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
              m)) annotation (Placement(transformation(
              origin={-60,40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starQS(m=m)
          annotation (Placement(transformation(
              origin={-70,20},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundQS
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-90,20})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensorQS(m=m) annotation (Placement(transformation(extent={{-60,
                  70},{-40,90}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.CurrentSensor
          currentSensorQS(m=m) annotation (Placement(transformation(extent={{
                  -30,70},{-10,90}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Ideal.IdealClosingSwitch
          idealCloserQS(
          final m=m,
          Ron=fill(1e-5*m/3, m),
          Goff=fill(1e-5*3/m, m)) annotation (Placement(transformation(
              origin={-60,70},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Modelica_Blocks.Sources.BooleanStep booleanStepQS[m](each startTime=
              tOn, each startValue=false) annotation (Placement(
              transformation(extent={{-96,60},{-76,80}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={-90,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
           Placement(transformation(extent={{-60,-90},{-80,-70}}, rotation=0)));
        Modelica_Electrical_MultiPhase.Sources.CosineVoltage cosineVoltage(
          final m=m,
          freqHz=fill(fNominal, m),
          V=fill(sqrt(2.0)*VsNominal, m)) annotation (Placement(
              transformation(
              origin={-60,-60},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser(
          final m=m,
          Ron=fill(1e-5*m/3, m),
          Goff=fill(1e-5*3/m, m)) annotation (Placement(transformation(
              origin={-60,-30},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Modelica_Blocks.Sources.BooleanStep booleanStep[m](each startTime=tOn,
            each startValue=false) annotation (Placement(transformation(
                extent={{-96,-40},{-76,-20}}, rotation=0)));
        Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentRMSsensor(final m=m) annotation (Placement(transformation(
              origin={-20,-20},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(m=m,
            terminalConnection="Y") annotation (Placement(transformation(
                extent={{20,-60},{40,-40}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
          imc(
          Jr=imcData.Jr,
          Js=imcData.Js,
          p=imcData.p,
          fsNominal=imcData.fsNominal,
          TsRef=imcData.TsRef,
          alpha20s(displayUnit="1/K") = imcData.alpha20s,
          frictionParameters=imcData.frictionParameters,
          statorCoreParameters=imcData.statorCoreParameters,
          strayLoadParameters=imcData.strayLoadParameters,
          alpha20r(displayUnit="1/K") = imcData.alpha20r,
          phiMechanical(fixed=true),
          wMechanical(fixed=true),
          Rs=imcData.Rs*m/3,
          Lssigma=imcData.Lssigma*m/3,
          Lszero=imcData.Lszero*m/3,
          Lm=imcData.Lm*m/3,
          Lrsigma=imcData.Lrsigma*m/3,
          Rr=imcData.Rr*m/3,
          TrRef=imcData.TrRef,
          m=m,
          TsOperational=293.15,
          TrOperational=293.15) annotation (Placement(transformation(extent={
                  {20,-80},{40,-60}}, rotation=0)));
        Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=J_Load)
          annotation (Placement(transformation(extent={{50,-80},{70,-60}},
                rotation=0)));
        Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
          quadraticLoadTorque(
          w_nominal=w_Load,
          tau_nominal=-T_Load,
          TorqueDirection=false,
          useSupport=false) annotation (Placement(transformation(extent={{100,
                  -80},{80,-60}}, rotation=0)));
        Modelica_Electrical_MultiPhase.Sensors.PowerSensor powerSensor(final
            m=m) annotation (Placement(transformation(extent={{-60,-30},{-40,
                  -10}})));
        Modelica_Mechanics_Rotational.Components.Inertia loadInertiaQS(J=
              J_Load) annotation (Placement(transformation(extent={{50,20},{
                  70,40}}, rotation=0)));
        Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
          quadraticLoadTorqueQS(
          w_nominal=w_Load,
          tau_nominal=-T_Load,
          TorqueDirection=false,
          useSupport=false) annotation (Placement(transformation(extent={{100,
                  20},{80,40}}, rotation=0)));
        parameter
          Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
          imcData
          annotation (Placement(transformation(extent={{70,74},{90,94}})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.InductionMachines.IM_SquirrelCage
          imcQS(
          Jr=imcData.Jr,
          Js=imcData.Js,
          p=imcData.p,
          fsNominal=imcData.fsNominal,
          TsRef=imcData.TsRef,
          alpha20s(displayUnit="1/K") = imcData.alpha20s,
          frictionParameters=imcData.frictionParameters,
          statorCoreParameters=imcData.statorCoreParameters,
          strayLoadParameters=imcData.strayLoadParameters,
          alpha20r(displayUnit="1/K") = imcData.alpha20r,
          Rs=imcData.Rs*m/3,
          Lssigma=imcData.Lssigma*m/3,
          Lm=imcData.Lm*m/3,
          Lrsigma=imcData.Lrsigma*m/3,
          Rr=imcData.Rr*m/3,
          TrRef=imcData.TrRef,
          m=m,
          wMechanical(fixed=true),
          TsOperational=293.15,
          gammar(fixed=true, start=pi/2),
          gamma(fixed=true, start=-pi/2),
          TrOperational=293.15) annotation (Placement(transformation(extent={{
                  20,20},{40,40}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Blocks.SymmetricalComponents
          symmetricalComponents(m=m) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,50})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundMachineQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={10,10})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star
          starMachineQS(m=
              Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
                                                                           m))
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={10,30})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.MultiTerminalBox
          terminalBoxQS(m=m, terminalConnection="Y") annotation (Placement(
              transformation(extent={{20,40},{40,60}}, rotation=0)));
      initial equation
        imc.is[1:2] = zeros(2);
        imc.rotorCage.electroMagneticConverter.Phi = Complex(0,0);

      equation
        connect(groundQS.pin, starQS.pin_n)
          annotation (Line(points={{-80,20},{-80,20}}, color={85,170,255}));
        connect(starQS.plug_p, voltageSourceQS.plug_n)
          annotation (Line(points={{-60,20},{-60,30}}, color={85,170,255}));
        connect(powerSensorQS.currentN, currentSensorQS.plug_p)
          annotation (Line(points={{-40,80},{-30,80}}, color={85,170,255}));
        connect(powerSensorQS.voltageP, powerSensorQS.currentP) annotation (
            Line(points={{-50,90},{-60,90},{-60,80}}, color={85,170,255}));
        connect(powerSensorQS.voltageN, starQS.plug_p) annotation (Line(
              points={{-50,70},{-50,20},{-60,20}}, color={85,170,255}));
        connect(booleanStepQS.y, idealCloserQS.control) annotation (Line(
            points={{-75,70},{-67,70}},
            color={255,0,255},
            smooth=Smooth.None));
        connect(star.pin_n, ground.p)
          annotation (Line(points={{-80,-80},{-80,-80}}, color={0,0,255}));
        connect(cosineVoltage.plug_n, star.plug_p)
          annotation (Line(points={{-60,-70},{-60,-80}}, color={0,0,255}));
        connect(imc.flange, loadInertia.flange_a) annotation (Line(points={{
                40,-70},{40,-70},{50,-70}}, color={0,0,0}));
        connect(loadInertia.flange_b, quadraticLoadTorque.flange)
          annotation (Line(points={{70,-70},{80,-70}}, color={0,0,0}));
        connect(terminalBoxM.plug_sn, imc.plug_sn)
          annotation (Line(points={{24,-60},{24,-60}}, color={0,0,255}));
        connect(terminalBoxM.plug_sp, imc.plug_sp)
          annotation (Line(points={{36,-60},{36,-60}}, color={0,0,255}));
        connect(booleanStep.y, idealCloser.control) annotation (Line(
            points={{-75,-30},{-67,-30}},
            color={255,0,255},
            smooth=Smooth.None));
        connect(idealCloser.plug_p, cosineVoltage.plug_p) annotation (Line(
            points={{-60,-40},{-60,-50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(idealCloserQS.plug_p, voltageSourceQS.plug_p) annotation (
            Line(
            points={{-60,60},{-60,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealCloserQS.plug_n, powerSensorQS.currentP) annotation (
            Line(
            points={{-60,80},{-60,80}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealCloser.plug_n, powerSensor.pc) annotation (Line(
            points={{-60,-20},{-60,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(powerSensor.nc, currentRMSsensor.plug_p) annotation (Line(
            points={{-40,-20},{-30,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentRMSsensor.plug_n, terminalBoxM.plugSupply) annotation (
           Line(
            points={{-10,-20},{30,-20},{30,-58}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(loadInertiaQS.flange_b, quadraticLoadTorqueQS.flange)
          annotation (Line(points={{70,30},{80,30}}, color={0,0,0}));
        connect(powerSensor.pv, powerSensor.pc) annotation (Line(
            points={{-50,-10},{-60,-10},{-60,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(powerSensor.nv, star.plug_p) annotation (Line(
            points={{-50,-30},{-50,-80},{-60,-80}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(imcQS.flange, loadInertiaQS.flange_a) annotation (Line(
            points={{40,30},{50,30}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(currentSensorQS.y, symmetricalComponents.u) annotation (Line(
            points={{-20,69},{-20,62}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sn, imcQS.plug_sn) annotation (Line(
            points={{24,40},{24,40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sp, imcQS.plug_sp) annotation (Line(
            points={{36,40},{36,40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.plug_p, terminalBoxQS.starpoint) annotation (
            Line(
            points={{10,40},{10,42},{21,42}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorQS.plug_n, terminalBoxQS.plugSupply) annotation (
           Line(
            points={{-10,80},{30,80},{30,42}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.pin_n, groundMachineQS.pin) annotation (Line(
            points={{10,20},{10,20}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{100,100}}), graphics={Rectangle(
                        extent={{-100,98},{100,4}},
                        lineColor={0,0,255},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        pattern=LinePattern.Dash),Rectangle(
                        extent={{-100,-2},{100,-92}},
                        lineColor={0,0,255},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        pattern=LinePattern.Dash),Text(
                        extent={{20,-6},{100,-14}},
                        lineColor={0,0,0},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="%m phase transient
"),           Text(
                extent={{20,14},{100,6}},
                        lineColor={0,0,0},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="%m phase QS
")}),       experiment);
      end IMC_DOL;

      model IMC_Inverter
        "Test example: InductionMachineSquirrelCage with inverter"
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Modelica_Icons.Example;
        import Modelica_Constants.pi;
        parameter Integer m=3 "Number of phases";
        parameter Modelica_SIunits.Voltage VNominal=100
          "Nominal RMS voltage per phase";
        parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
        parameter Modelica_SIunits.Frequency f=50 "Actual frequency";
        parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
        parameter Modelica_SIunits.Torque TLoad=161.4 "Nominal load torque";
        parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
        parameter Modelica_SIunits.Inertia JLoad=0.29
          "Load's moment of inertia";
        Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
          imc(
          p=imcData.p,
          fsNominal=imcData.fsNominal,
          TsRef=imcData.TsRef,
          alpha20s(displayUnit="1/K") = imcData.alpha20s,
          Jr=imcData.Jr,
          Js=imcData.Js,
          frictionParameters=imcData.frictionParameters,
          phiMechanical(fixed=true),
          wMechanical(fixed=true),
          statorCoreParameters=imcData.statorCoreParameters,
          strayLoadParameters=imcData.strayLoadParameters,
          TrRef=imcData.TrRef,
          m=m,
          TsOperational=293.15,
          Rs=imcData.Rs*m/3,
          Lssigma=imcData.Lssigma*m/3,
          Lszero=imcData.Lszero*m/3,
          Lm=imcData.Lm*m/3,
          Lrsigma=imcData.Lrsigma*m/3,
          Rr=imcData.Rr*m/3,
          alpha20r=imcData.alpha20r,
          TrOperational=293.15) annotation (Placement(transformation(extent={
                  {20,-90},{40,-70}}, rotation=0)));
        Modelica_Blocks.Sources.Ramp ramp(height=f, duration=tRamp)
          annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                rotation=0)));
        Modelica_Electrical_Machines.Utilities.VfController vfController(
          final m=m,
          VNominal=VNominal,
          fNominal=fNominal,
          BasePhase=+Modelica_Constants.pi/2) annotation (Placement(
              transformation(extent={{-38,-30},{-18,-10}}, rotation=0)));
        Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage(
            final m=m) annotation (Placement(transformation(
              origin={-10,-50},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
           Placement(transformation(extent={{-30,-60},{-50,-40}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={-60,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
          annotation (Placement(transformation(extent={{48,-90},{68,-70}},
                rotation=0)));
        Modelica_Mechanics_Rotational.Sources.TorqueStep loadTorqueStep(
          startTime=tStep,
          stepTorque=-TLoad,
          useSupport=false,
          offsetTorque=0) annotation (Placement(transformation(extent={{96,-90},
                  {76,-70}}, rotation=0)));
        Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
            terminalConnection="Y", m=m) annotation (Placement(transformation(
                extent={{20,-70},{40,-50}}, rotation=0)));
        parameter
          Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
          imcData
          annotation (Placement(transformation(extent={{70,70},{90,90}})));
        Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentQuasiRMSSensor(final m=m) annotation (Placement(
              transformation(
              origin={20,-50},
              extent={{-10,10},{10,-10}},
              rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.InductionMachines.IM_SquirrelCage
          imcQS(
          p=imcData.p,
          fsNominal=imcData.fsNominal,
          TsRef=imcData.TsRef,
          alpha20s(displayUnit="1/K") = imcData.alpha20s,
          Jr=imcData.Jr,
          Js=imcData.Js,
          frictionParameters=imcData.frictionParameters,
          statorCoreParameters=imcData.statorCoreParameters,
          strayLoadParameters=imcData.strayLoadParameters,
          TrRef=imcData.TrRef,
          m=m,
          gammar(fixed=true, start=+pi/2),
          gamma(fixed=true, start=-pi/2),
          wMechanical(fixed=true, start=0),
          TsOperational=293.15,
          Rs=imcData.Rs*m/3,
          Lssigma=imcData.Lssigma*m/3,
          Lm=imcData.Lm*m/3,
          Lrsigma=imcData.Lrsigma*m/3,
          Rr=imcData.Rr*m/3,
          alpha20r=imcData.alpha20r,
          TrOperational=293.15) annotation (Placement(transformation(extent={{
                  20,10},{40,30}}, rotation=0)));
        Modelica_Mechanics_Rotational.Components.Inertia loadInertiaQS(J=
              JLoad) annotation (Placement(transformation(extent={{50,10},{70,
                  30}}, rotation=0)));
        Modelica_Mechanics_Rotational.Sources.TorqueStep loadTorqueStepQS(
          startTime=tStep,
          stepTorque=-TLoad,
          useSupport=false,
          offsetTorque=0) annotation (Placement(transformation(extent={{96,10},
                  {76,30}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.MultiTerminalBox
          terminalBox1(terminalConnection="Y", m=m) annotation (Placement(
              transformation(extent={{20,30},{40,50}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.CurrentSensor
          currentQuasiRMSSensorQS(m=m) annotation (Placement(transformation(
              origin={20,50},
              extent={{-10,10},{10,-10}},
              rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundMachineQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,30})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star
          starMachineQS(m=
              Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
                                                                           m))
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={0,30})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VariableVoltageSource
          signalVoltageQS(final m=m) annotation (Placement(transformation(
              origin={-10,50},
              extent={{10,-10},{-10,10}},
              rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starQS(
            final m=m) annotation (Placement(transformation(extent={{-30,40},
                  {-50,60}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundQS
          annotation (Placement(transformation(
              origin={-60,50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.VfController vfControllerQS(
          final m=m,
          VNominal=VNominal,
          fNominal=fNominal,
          BasePhase=+Modelica_Constants.pi/2) annotation (Placement(
              transformation(extent={{-40,74},{-20,94}}, rotation=0)));
      initial equation
        imc.is[1:2] = zeros(2);
        imc.ir[1:m - 1] = zeros(m - 1);

      equation
        connect(ramp.y, vfController.u) annotation (Line(points={{-79,0},{-70,
                0},{-70,-20},{-40,-20}}, color={0,0,255}));
        connect(loadTorqueStep.flange, loadInertia.flange_b)
          annotation (Line(points={{76,-80},{68,-80}}, color={0,0,0}));
        connect(terminalBox.plug_sn, imc.plug_sn) annotation (Line(
            points={{24,-70},{24,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(terminalBox.plug_sp, imc.plug_sp) annotation (Line(
            points={{36,-70},{36,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(imc.flange, loadInertia.flange_a) annotation (Line(
            points={{40,-80},{48,-80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(signalVoltage.plug_n, currentQuasiRMSSensor.plug_p)
          annotation (Line(
            points={{0,-50},{10,-50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
          annotation (Line(
            points={{30,-50},{30,-68}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(ground.p, star.pin_n) annotation (Line(
            points={{-50,-50},{-50,-50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(star.plug_p, signalVoltage.plug_p) annotation (Line(
            points={{-30,-50},{-20,-50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(vfController.y, signalVoltage.v) annotation (Line(
            points={{-17,-20},{-10,-20},{-10,-43}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(loadTorqueStepQS.flange, loadInertiaQS.flange_b)
          annotation (Line(points={{76,20},{70,20}}, color={0,0,0}));
        connect(imcQS.flange, loadInertiaQS.flange_a) annotation (Line(
            points={{40,20},{50,20}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(terminalBox1.plug_sn, imcQS.plug_sn) annotation (Line(
            points={{24,30},{24,30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBox1.plug_sp, imcQS.plug_sp) annotation (Line(
            points={{36,30},{36,30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentQuasiRMSSensorQS.plug_n, terminalBox1.plugSupply)
          annotation (Line(
            points={{30,50},{30,32}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(groundMachineQS.pin, starMachineQS.pin_n) annotation (Line(
            points={{-20,30},{-10,30}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.plug_p, terminalBox1.starpoint) annotation (
            Line(
            points={{10,30},{10,32},{21,32}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(groundQS.pin, starQS.pin_n) annotation (Line(
            points={{-50,50},{-50,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starQS.plug_p, signalVoltageQS.plug_n) annotation (Line(
            points={{-30,50},{-20,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(signalVoltageQS.plug_p, currentQuasiRMSSensorQS.plug_p)
          annotation (Line(
            points={{0,50},{10,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(vfControllerQS.y, signalVoltageQS.V) annotation (Line(
            points={{-19,84},{-6,84},{-6,60}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(ramp.y, vfControllerQS.u) annotation (Line(
            points={{-79,0},{-70,0},{-70,84},{-42,84}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ramp.y, signalVoltageQS.f) annotation (Line(
            points={{-79,0},{-70,0},{-70,70},{-14,70},{-14,60}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          experiment(StopTime=1.5, Interval=0.001),
          Documentation(info="<HTML>
<b>Test example: Induction machine with squirrel cage fed by an ideal inverter</b><br>
An ideal frequency inverter is modeled by using a VfController and a three-phase SignalVoltage.<br>
Frequency is raised by a ramp, causing the induction machine with squirrel cage to start,
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>imc.wMechanical: motor's speed</li>
<li>imc.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</HTML>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                        extent={{-74,-2},{100,-100}},
                        lineColor={0,0,255},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        pattern=LinePattern.Dash),Rectangle(
                        extent={{-74,100},{100,2}},
                        lineColor={0,0,255},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        pattern=LinePattern.Dash),Text(
                        extent={{20,-6},{100,-14}},
                        lineColor={0,0,0},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="%m phase transient
"),Text(              extent={{-66,10},{14,2}},
                        lineColor={0,0,0},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="%m phase QS
")}));
      end IMC_Inverter;

      model IMS_Start "Starting of induction machine with slip rings"
        import Modelica_Constants.pi;
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of stator phases";
        parameter Integer mr=3 "Number of rotor phases";
        parameter Modelica_SIunits.Voltage VsNominal=100
          "Nominal RMS voltage per phase";
        parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
        parameter Modelica_SIunits.Time tOn=0.1 "Start time of machine";
        parameter Modelica_SIunits.Resistance RStart=0.16/imsData.turnsRatio^
            2 "Starting resistance";
        parameter Modelica_SIunits.Time tRheostat=1.0
          "Time of shortening the rheostat";
        parameter Modelica_SIunits.Torque T_Load=161.4 "Nominal load torque";
        parameter Modelica_SIunits.AngularVelocity w_Load(displayUnit="1/min")=
             Modelica_SIunits.Conversions.from_rpm(1440.45)
          "Nominal load speed";
        parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={-90,-70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
           Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-70,-70})));
        Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
          final m=m,
          freqHz=fill(fNominal, m),
          V=fill(sqrt(2.0)*VsNominal, m)) annotation (Placement(
              transformation(
              origin={-60,-52},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser(
          final m=m,
          Ron=fill(1e-5*m/3, m),
          Goff=fill(1e-5*3/m, m)) annotation (Placement(transformation(
              origin={-60,-28},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Blocks.Sources.BooleanStep booleanStep[m](each startTime=tOn)
          annotation (Placement(transformation(extent={{-96,-38},{-76,-18}},
                rotation=0)));
        Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentRMSsensor(m=m) annotation (Placement(transformation(
              origin={-20,-18},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(m=m,
            terminalConnection="Y") annotation (Placement(transformation(
                extent={{10,-60},{30,-40}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.MultiTerminalBox
          terminalBoxQS(m=m, terminalConnection="Y") annotation (Placement(
              transformation(extent={{10,40},{30,60}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing
          ims(
          Jr=imsData.Jr,
          Js=imsData.Js,
          p=imsData.p,
          fsNominal=imsData.fsNominal,
          TsRef=imsData.TsRef,
          alpha20s(displayUnit="1/K") = imsData.alpha20s,
          frictionParameters=imsData.frictionParameters,
          statorCoreParameters=imsData.statorCoreParameters,
          strayLoadParameters=imsData.strayLoadParameters,
          phiMechanical(fixed=true),
          wMechanical(fixed=true),
          TrRef=imsData.TrRef,
          alpha20r(displayUnit="1/K") = imsData.alpha20r,
          useTurnsRatio=imsData.useTurnsRatio,
          VsNominal=imsData.VsNominal,
          VrLockedRotor=imsData.VrLockedRotor,
          rotorCoreParameters=imsData.rotorCoreParameters,
          TurnsRatio=imsData.turnsRatio,
          Rs=imsData.Rs*m/3,
          Lssigma=imsData.Lssigma*m/3,
          Lszero=imsData.Lszero*m/3,
          Lm=imsData.Lm*m/3,
          Lrsigma=imsData.Lrsigma*mr/3,
          Lrzero=imsData.Lrzero*mr/3,
          Rr=imsData.Rr*mr/3,
          mr=mr,
          m=m,
          TsOperational=293.15,
          TrOperational=293.15) annotation (Placement(transformation(extent={
                  {10,-80},{30,-60}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.InductionMachines.IM_SlipRing
          imsQS(
          p=imsData.p,
          fsNominal=imsData.fsNominal,
          TsRef=imsData.TsRef,
          alpha20s(displayUnit="1/K") = imsData.alpha20s,
          Jr=imsData.Jr,
          Js=imsData.Js,
          frictionParameters=imsData.frictionParameters,
          statorCoreParameters=imsData.statorCoreParameters,
          strayLoadParameters=imsData.strayLoadParameters,
          TrRef=imsData.TrRef,
          alpha20r(displayUnit="1/K") = imsData.alpha20r,
          useTurnsRatio=imsData.useTurnsRatio,
          VsNominal=imsData.VsNominal,
          VrLockedRotor=imsData.VrLockedRotor,
          rotorCoreParameters=imsData.rotorCoreParameters,
          Rs=imsData.Rs*m/3,
          Lssigma=imsData.Lssigma*m/3,
          Lm=imsData.Lm*m/3,
          gammar(fixed=true, start=pi/2),
          gamma(fixed=true, start=-pi/2),
          wMechanical(fixed=true),
          TurnsRatio=imsData.turnsRatio,
          Lrsigma=imsData.Lrsigma*mr/3,
          Rr=imsData.Rr*mr/3,
          mr=mr,
          m=m,
          TsOperational=566.3,
          TrOperational=566.3) annotation (Placement(transformation(extent={{10,
                  20},{30,40}}, rotation=0)));
        Modelica_Electrical_Machines.Utilities.SwitchedRheostat rheostatM(
          tStart=tRheostat,
          m=mr,
          RStart=RStart*mr/3) annotation (Placement(transformation(extent={{-10,
                  -80},{10,-60}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.SwitchedRheostat
          rheostatE(
          tStart=tRheostat,
          RStart=RStart*mr/3,
          m=mr) annotation (Placement(transformation(extent={{-10,20},{10,40}},
                rotation=0)));
        Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=J_Load)
          annotation (Placement(transformation(extent={{40,-80},{60,-60}},
                rotation=0)));
        Modelica_Mechanics_Rotational.Components.Inertia loadInertiaE(J=
              J_Load) annotation (Placement(transformation(extent={{40,20},{
                  60,40}}, rotation=0)));
        Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
          quadraticLoadTorque(
          tau_nominal=-T_Load,
          TorqueDirection=false,
          useSupport=false,
          w_nominal=w_Load) annotation (Placement(transformation(extent={{90,
                  -80},{70,-60}}, rotation=0)));
        Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
          quadraticLoadTorqueE(
          tau_nominal=-T_Load,
          TorqueDirection=false,
          useSupport=false,
          w_nominal=w_Load) annotation (Placement(transformation(extent={{90,
                  20},{70,40}}, rotation=0)));
        parameter
          Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SlipRingData
          imsData
          annotation (Placement(transformation(extent={{70,70},{90,90}})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSourceQS(
          m=m,
          phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
              m),
          f=fNominal,
          V=fill(VsNominal, m)) annotation (Placement(transformation(
              origin={-60,40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starQS(m=m)
          annotation (Placement(transformation(
              origin={-70,20},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundQS
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-90,20})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensorQS(m=m) annotation (Placement(transformation(extent={{-60,
                  74},{-40,94}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.CurrentSensor
          currentSensorQS(m=m) annotation (Placement(transformation(extent={{
                  -30,74},{-10,94}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Ideal.IdealClosingSwitch
          idealCloserQS(
          final m=m,
          Ron=fill(1e-5*m/3, m),
          Goff=fill(1e-5*3/m, m)) annotation (Placement(transformation(
              origin={-60,64},
              extent={{10,10},{-10,-10}},
              rotation=270)));
        Modelica_Blocks.Sources.BooleanStep booleanStepQS[m](each startTime=
              tOn, each startValue=false) annotation (Placement(
              transformation(extent={{-96,54},{-76,74}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Blocks.SymmetricalComponents
          symmetricalComponents(m=m) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,58})));
        Modelica_Electrical_MultiPhase.Sensors.PowerSensor powerSensor(m=m)
          annotation (Placement(transformation(extent={{-60,-28},{-40,-8}})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star
          starMachineQS(m=
              Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
                                                                           m))
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={-20,30})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundMachineQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-20,10})));
      initial equation
        ims.is[1:2] = zeros(2);
        ims.ir[1:mr] = zeros(mr);
        //???

      equation
        connect(star.pin_n, ground.p)
          annotation (Line(points={{-80,-70},{-80,-70}}, color={0,0,255}));
        connect(sineVoltage.plug_n, star.plug_p)
          annotation (Line(points={{-60,-62},{-60,-70}}, color={0,0,255}));
        connect(loadInertiaE.flange_b, quadraticLoadTorqueE.flange)
          annotation (Line(points={{60,30},{64,30},{70,30}}, color={0,0,0}));
        connect(imsQS.flange, loadInertiaE.flange_a)
          annotation (Line(points={{30,30},{34,30},{40,30}}, color={0,0,0}));
        connect(booleanStep.y, idealCloser.control) annotation (Line(points={
                {-75,-28},{-75,-28},{-67,-28}}, color={255,0,255}));
        connect(terminalBoxQS.plug_sn, imsQS.plug_sn)
          annotation (Line(points={{14,40},{14,40}}, color={0,0,255}));
        connect(terminalBoxQS.plug_sp, imsQS.plug_sp)
          annotation (Line(points={{26,40},{26,40}}, color={0,0,255}));
        connect(loadInertia.flange_b, quadraticLoadTorque.flange) annotation (
           Line(points={{60,-70},{60,-70},{70,-70}}, color={0,0,0}));
        connect(ims.flange, loadInertia.flange_a) annotation (Line(points={{
                30,-70},{30,-70},{40,-70}}, color={0,0,0}));
        connect(terminalBoxM.plug_sp, ims.plug_sp)
          annotation (Line(points={{26,-60},{26,-60}}, color={0,0,255}));
        connect(terminalBoxM.plug_sn, ims.plug_sn)
          annotation (Line(points={{14,-60},{14,-60}}, color={0,0,255}));
        connect(currentRMSsensor.plug_n, terminalBoxM.plugSupply) annotation (
           Line(
            points={{-10,-18},{20,-18},{20,-58}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(rheostatM.plug_p, ims.plug_rp) annotation (Line(
            points={{10,-64},{10,-64}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(rheostatM.plug_n, ims.plug_rn) annotation (Line(
            points={{10,-76},{10,-76}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(idealCloser.plug_p, sineVoltage.plug_p) annotation (Line(
            points={{-60,-38},{-60,-42}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(imsQS.plug_rp, rheostatE.plug_p) annotation (Line(
            points={{10,36},{10,36}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(rheostatE.plug_n, imsQS.plug_rn) annotation (Line(
            points={{10,24},{10,24}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(groundQS.pin, starQS.pin_n)
          annotation (Line(points={{-80,20},{-80,20}}, color={85,170,255}));
        connect(starQS.plug_p, voltageSourceQS.plug_n)
          annotation (Line(points={{-60,20},{-60,30}}, color={85,170,255}));
        connect(powerSensorQS.currentN, currentSensorQS.plug_p) annotation (
            Line(points={{-40,84},{-40,84},{-30,84}}, color={85,170,255}));
        connect(powerSensorQS.voltageP, powerSensorQS.currentP) annotation (
            Line(points={{-50,94},{-60,94},{-60,84}}, color={85,170,255}));
        connect(powerSensorQS.voltageN, starQS.plug_p) annotation (Line(
              points={{-50,74},{-50,20},{-60,20}}, color={85,170,255}));
        connect(booleanStepQS.y, idealCloserQS.control) annotation (Line(
            points={{-75,64},{-67,64}},
            color={255,0,255},
            smooth=Smooth.None));
        connect(idealCloserQS.plug_p, voltageSourceQS.plug_p) annotation (
            Line(
            points={{-60,54},{-60,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealCloserQS.plug_n, powerSensorQS.currentP) annotation (
            Line(
            points={{-60,74},{-60,84}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorQS.y, symmetricalComponents.u) annotation (Line(
            points={{-20,73},{-20,70}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(idealCloser.plug_n, powerSensor.pc) annotation (Line(
            points={{-60,-18},{-60,-18}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(powerSensor.pc, powerSensor.pv) annotation (Line(
            points={{-60,-18},{-60,-8},{-50,-8}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(powerSensor.nv, star.plug_p) annotation (Line(
            points={{-50,-28},{-50,-70},{-60,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(powerSensor.nc, currentRMSsensor.plug_p) annotation (Line(
            points={{-40,-18},{-30,-18}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentSensorQS.plug_n, terminalBoxQS.plugSupply) annotation (
           Line(
            points={{-10,84},{20,84},{20,42}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.pin_n, groundMachineQS.pin) annotation (Line(
            points={{-20,20},{-20,20}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.plug_p, terminalBoxQS.starpoint) annotation (
            Line(
            points={{-20,40},{-20,42},{11,42}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          experiment(
            StopTime=1.5,
            Interval=0.001,
            Tolerance=1e-05),
          Documentation(info="<HTML>
<h4>Starting of an induction machine with slipring rotor resistance starting</h4>
<p>
At start time <code>tOn</code> three phase voltage is supplied to the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing\">induction machine with sliprings</a>.
The machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed,
using a starting resistance. At time tRheostat external rotor resistance is shortened, finally reaching nominal speed.</p>

<p>
Simulate for 1.5 seconds and plot (versus time):
</p>

<ul>
<li><code>currentRMSsensorM|E.I</code>: equivalent RMS stator current</li>
<li><code>imsM/E.wMechanical</code>: machine speed</li>
<li><code>imsM|E.tauElectrical</code>: machine torque</li>
</ul>
</HTML>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                        extent={{-100,100},{100,2}},
                        lineColor={0,0,255},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        pattern=LinePattern.Dash),Rectangle(
                        extent={{-100,-2},{100,-100}},
                        lineColor={0,0,255},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        pattern=LinePattern.Dash),Text(
                        extent={{20,12},{100,4}},
                        lineColor={0,0,0},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="%m phase QS
"),Text(              extent={{20,-4},{100,-12}},
                        lineColor={0,0,0},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="%m phase transient
")}));
      end IMS_Start;
    end InductionMachines;

    package SynchronousMachines "Synchronous machine examples"
      extends Modelica_Icons.ExamplesPackage;
      model SMPM_Mains "Permanent magnet synchronous machine operated at mains"
        import Modelica_Constants.pi;
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of phases";
        parameter Modelica_SIunits.Frequency f=50 "Supply frequency";
        parameter Modelica_SIunits.Voltage V=112.3 "Suppy voltage";
        parameter Modelica_SIunits.Torque T_Load=181.4 "Nominal load torque";
        parameter Modelica_SIunits.Time tStep=0.5 "Time of load torque step";
        parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
        Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSourceQS(
          m=m,
          f=f,
          V=fill(V, m),
          phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
              m)) annotation (Placement(transformation(
              origin={-60,50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starQS(m=m)
          annotation (Placement(transformation(
              origin={-60,20},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundQS
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-78,10})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensorQS(m=m) annotation (Placement(transformation(extent={{-60,
                  70},{-40,90}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.CurrentSensor
          currentSensorQS(m=m) annotation (Placement(transformation(extent={{
                  -20,70},{0,90}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.SynchronousMachines.SM_PermanentMagnet
          smpmQS(
          m=m,
          Jr=smpmData.Jr,
          p=smpmData.p,
          fsNominal=smpmData.fsNominal,
          TsRef=smpmData.TsRef,
          frictionParameters=smpmData.frictionParameters,
          statorCoreParameters=smpmData.statorCoreParameters,
          strayLoadParameters=smpmData.strayLoadParameters,
          useDamperCage=smpmData.useDamperCage,
          Lrsigmad=smpmData.Lrsigmad,
          Lrsigmaq=smpmData.Lrsigmaq,
          Rrd=smpmData.Rrd,
          Rrq=smpmData.Rrq,
          TrRef=smpmData.TrRef,
          VsOpenCircuit=smpmData.VsOpenCircuit,
          permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,

          gammar(start=pi/2, fixed=true),
          gamma(start=-pi/2, fixed=true),
          wMechanical(fixed=true, start=2*pi*smpmData.fsNominal/smpmData.p),
          Rs=smpmData.Rs*m/3,
          Lssigma=smpmData.Lssigma*m/3,
          Lmd=smpmData.Lmd*m/3,
          Lmq=smpmData.Lmq*m/3,
          useSupport=false,
          Js=smpmData.Js,
          TsOperational=293.15,
          alpha20s=smpmData.alpha20s,
          alpha20r=smpmData.alpha20r,
          TrOperational=293.15)
          annotation (Placement(transformation(extent={{-10,30},{10,50}})));

        Modelica_Mechanics_Rotational.Components.Inertia loadInertiaMQS(J=
              J_Load) annotation (Placement(transformation(extent={{20,30},{
                  40,50}}, rotation=0)));
        Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStepMQS(
          startTime=tStep,
          stepTorque=-T_Load,
          useSupport=false,
          offsetTorque=0) annotation (Placement(transformation(extent={{70,30},
                  {50,50}}, rotation=0)));
        parameter
          Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
          smpmData(useDamperCage=true)
          annotation (Placement(transformation(extent={{60,72},{80,92}})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundMachineQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-30,12})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star
          starMachineQS(m=
              Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
                                                                           m))
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={-30,40})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.MultiTerminalBox
          terminalBoxQS(m=m, terminalConnection="Y") annotation (Placement(
              transformation(extent={{-10,50},{10,70}}, rotation=0)));
        Modelica_Electrical_MultiPhase.Sources.CosineVoltage voltageSource(
          m=m,
          V=fill(V, m),
          freqHz=fill(f, m)) annotation (Placement(transformation(
              origin={-60,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_MultiPhase.Basic.Star star(m=m) annotation (
            Placement(transformation(
              origin={-60,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,-90})));
        Modelica_Electrical_MultiPhase.Sensors.PowerSensor powerSensor(m=m)
          annotation (Placement(transformation(extent={{-60,-30},{-40,-10}},
                rotation=0)));
        Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentSensor(m=m) annotation (Placement(transformation(extent={{-20,
                  -30},{0,-10}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
          smpm(
          m=m,
          Jr=smpmData.Jr,
          p=smpmData.p,
          fsNominal=smpmData.fsNominal,
          TsRef=smpmData.TsRef,
          frictionParameters=smpmData.frictionParameters,
          statorCoreParameters=smpmData.statorCoreParameters,
          strayLoadParameters=smpmData.strayLoadParameters,
          useDamperCage=smpmData.useDamperCage,
          Lrsigmad=smpmData.Lrsigmad,
          Lrsigmaq=smpmData.Lrsigmaq,
          Rrd=smpmData.Rrd,
          Rrq=smpmData.Rrq,
          TrRef=smpmData.TrRef,
          VsOpenCircuit=smpmData.VsOpenCircuit,
          permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,
          wMechanical(fixed=true, start=2*pi*smpmData.fsNominal/smpmData.p),
          Rs=smpmData.Rs*m/3,
          Lssigma=smpmData.Lssigma*m/3,
          Lmd=smpmData.Lmd*m/3,
          Lmq=smpmData.Lmq*m/3,
          useSupport=false,
          Js=smpmData.Jr,
          TsOperational=293.15,
          alpha20s=smpmData.alpha20s,
          phiMechanical(start=0, fixed=true),
          alpha20r=smpmData.alpha20r,
          TrOperational=293.15)
          annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));

        Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=
              J_Load) annotation (Placement(transformation(extent={{20,-70},{
                  40,-50}}, rotation=0)));
        Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStepM(
          startTime=tStep,
          stepTorque=-T_Load,
          useSupport=false,
          offsetTorque=0) annotation (Placement(transformation(extent={{70,-70},
                  {50,-50}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground groundMachine annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-30,-88})));
        Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(m=m,
            terminalConnection="Y") annotation (Placement(transformation(
                extent={{-10,-50},{10,-30}}, rotation=0)));
      equation
        connect(groundQS.pin, starQS.pin_n) annotation (Line(points={{-68,10},
                {-68,10},{-60,10}}, color={85,170,255}));
        connect(starQS.plug_p, voltageSourceQS.plug_n)
          annotation (Line(points={{-60,30},{-60,40}}, color={85,170,255}));
        connect(voltageSourceQS.plug_p, powerSensorQS.currentP) annotation (
            Line(points={{-60,60},{-60,70},{-60,80}}, color={85,170,255}));
        connect(powerSensorQS.currentN, currentSensorQS.plug_p)
          annotation (Line(points={{-40,80},{-20,80}}, color={85,170,255}));
        connect(powerSensorQS.voltageP, powerSensorQS.currentP) annotation (
            Line(points={{-50,90},{-60,90},{-60,80}}, color={85,170,255}));
        connect(powerSensorQS.voltageN, starQS.plug_p) annotation (Line(
              points={{-50,70},{-50,30},{-60,30}}, color={85,170,255}));
        connect(loadInertiaMQS.flange_b, torqueStepMQS.flange)
          annotation (Line(points={{40,40},{50,40}}, color={0,0,0}));
        connect(smpmQS.flange, loadInertiaMQS.flange_a) annotation (Line(
            points={{10,40},{20,40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sn, smpmQS.plug_sn) annotation (Line(
            points={{-6,50},{-6,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sp, smpmQS.plug_sp) annotation (Line(
            points={{6,50},{6,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.plug_p, terminalBoxQS.starpoint) annotation (
            Line(
            points={{-30,50},{-30,52},{-9,52}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentSensorQS.plug_n, terminalBoxQS.plugSupply) annotation (
           Line(
            points={{0,80},{0,52}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.pin_n, groundMachineQS.pin) annotation (Line(
            points={{-30,30},{-30,22}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(loadInertiaM.flange_b, torqueStepM.flange)
          annotation (Line(points={{40,-60},{50,-60}}, color={0,0,0}));
        connect(smpm.flange, loadInertiaM.flange_a) annotation (Line(
            points={{10,-60},{20,-60}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(terminalBox.plug_sn, smpm.plug_sn) annotation (Line(
            points={{-6,-50},{-6,-50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(terminalBox.plug_sp, smpm.plug_sp) annotation (Line(
            points={{6,-50},{6,-50}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(terminalBox.plugSupply, currentSensor.plug_n) annotation (
            Line(
            points={{0,-48},{0,-48},{0,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentSensor.plug_p, powerSensor.nc) annotation (Line(
            points={{-20,-20},{-40,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(powerSensor.pc, voltageSource.plug_p) annotation (Line(
            points={{-60,-20},{-60,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(powerSensor.pv, powerSensor.pc) annotation (Line(
            points={{-50,-10},{-60,-10},{-60,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(voltageSource.plug_n, star.plug_p) annotation (Line(
            points={{-60,-60},{-60,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(star.pin_n, ground.p) annotation (Line(
            points={{-60,-90},{-70,-90}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(groundMachine.p, terminalBox.starpoint) annotation (Line(
            points={{-30,-78},{-30,-48},{-9,-48}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(powerSensor.nv, star.plug_p) annotation (Line(
            points={{-50,-30},{-50,-70},{-60,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{100,100}}), graphics={Rectangle(
                extent={{-90,-2},{90,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.Dash,
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid), Rectangle(
                extent={{-90,100},{90,0}},
                lineColor={0,0,0},
                pattern=LinePattern.Dash,
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid)}), experiment(StopTime=1,
              Interval=2E-4));
      end SMPM_Mains;

      model SMPM_OpenCircuit
        "Test example: PermanentMagnetSynchronousMachine with inverter"
        import Modelica_Constants.pi;
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of phases";
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.SynchronousMachines.SM_PermanentMagnet
          smpmQS(
          p=smpmData.p,
          fsNominal=smpmData.fsNominal,
          TsRef=smpmData.TsRef,
          Jr=smpmData.Jr,
          Js=smpmData.Js,
          frictionParameters=smpmData.frictionParameters,
          statorCoreParameters=smpmData.statorCoreParameters,
          strayLoadParameters=smpmData.strayLoadParameters,
          VsOpenCircuit=smpmData.VsOpenCircuit,
          useDamperCage=smpmData.useDamperCage,
          Lrsigmad=smpmData.Lrsigmad,
          Lrsigmaq=smpmData.Lrsigmaq,
          Rrd=smpmData.Rrd,
          Rrq=smpmData.Rrq,
          TrRef=smpmData.TrRef,
          permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,

          phiMechanical(start=0),
          m=m,
          TsOperational=293.15,
          Rs=smpmData.Rs*m/3,
          alpha20s=smpmData.alpha20s,
          Lssigma=smpmData.Lssigma*m/3,
          Lmd=smpmData.Lmd*m/3,
          Lmq=smpmData.Lmq*m/3,
          alpha20r=smpmData.alpha20r,
          TrOperational=293.15) annotation (Placement(transformation(extent={{-10,
                  20},{10,40}}, rotation=0)));

        Modelica_Mechanics_Rotational.Sources.ConstantSpeed constantSpeed(
          useSupport=false,
          w_fixed(displayUnit="rad/s") = 2*pi*smpmData.fsNominal/smpmData.p,
          phi(start=0, fixed=true)) annotation (Placement(transformation(
                extent={{80,-10},{60,10}}, rotation=0)));
        parameter
          Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
          smpmData(useDamperCage=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starQS(m=m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-20,50})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundQS
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,50})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PotentialSensor
          potentialSensorQS(m=m)
          annotation (Placement(transformation(extent={{10,40},{30,60}})));
        Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
          smpm(
          p=smpmData.p,
          fsNominal=smpmData.fsNominal,
          TsRef=smpmData.TsRef,
          Jr=smpmData.Jr,
          Js=smpmData.Js,
          frictionParameters=smpmData.frictionParameters,
          statorCoreParameters=smpmData.statorCoreParameters,
          strayLoadParameters=smpmData.strayLoadParameters,
          VsOpenCircuit=smpmData.VsOpenCircuit,
          useDamperCage=smpmData.useDamperCage,
          Lrsigmad=smpmData.Lrsigmad,
          Lrsigmaq=smpmData.Lrsigmaq,
          Rrd=smpmData.Rrd,
          Rrq=smpmData.Rrq,
          TrRef=smpmData.TrRef,
          permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,
          m=m,
          TsOperational=293.15,
          Rs=smpmData.Rs*m/3,
          alpha20s=smpmData.alpha20s,
          Lssigma=smpmData.Lssigma*m/3,
          Lszero=smpmData.Lszero*m/3,
          Lmd=smpmData.Lmd*m/3,
          Lmq=smpmData.Lmq*m/3,
          alpha20r=smpmData.alpha20r,
          TrOperational=293.15) annotation (Placement(transformation(extent={
                  {-10,-50},{10,-30}}, rotation=0)));

        Modelica_Electrical_MultiPhase.Basic.Star star(m=m) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-20,-20})));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,-20})));
        Modelica_Electrical_MultiPhase.Sensors.PotentialSensor
          potentialSensor(m=m)
          annotation (Placement(transformation(extent={{10,-30},{30,-10}})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor
          resistorQS(m=m, R_ref=fill(1e6*m/3, m))
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
      equation
        connect(starQS.plug_p, smpmQS.plug_sn) annotation (Line(
            points={{-10,50},{-10,40},{-6,40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(groundQS.pin, starQS.pin_n) annotation (Line(
            points={{-40,50},{-30,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(potentialSensorQS.plug_p, smpmQS.plug_sp) annotation (Line(
            points={{10,50},{10,40},{6,40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(constantSpeed.flange, smpm.flange) annotation (Line(
            points={{60,0},{50,0},{50,-40},{10,-40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(constantSpeed.flange, smpmQS.flange) annotation (Line(
            points={{60,0},{50,0},{50,30},{10,30}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ground.p, star.pin_n) annotation (Line(
            points={{-40,-20},{-30,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(star.plug_p, smpm.plug_sn) annotation (Line(
            points={{-10,-20},{-10,-30},{-6,-30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(potentialSensor.plug_p, smpm.plug_sp) annotation (Line(
            points={{10,-20},{10,-30},{6,-30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(resistorQS.plug_p, smpmQS.plug_sn) annotation (Line(
            points={{-10,60},{-10,40},{-6,40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(resistorQS.plug_n, smpmQS.plug_sp) annotation (Line(
            points={{10,60},{10,40},{6,40}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          experiment(StopTime=0.1, Interval=0.001),
          Documentation(info="<html>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                        extent={{-60,-4},{40,-80}},
                        lineColor={0,0,0},
                        pattern=LinePattern.Dash,
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid),Rectangle(
                        extent={{-60,80},{40,4}},
                        lineColor={0,0,0},
                        pattern=LinePattern.Dash,
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid)}));
      end SMPM_OpenCircuit;

      model SMPM_CurrentSource
        "Test example: PermanentMagnetSynchronousMachine fed by current source"
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of phases";
        parameter Modelica_SIunits.Voltage VNominal=100
          "Nominal RMS voltage per phase";
        parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
        parameter Modelica_SIunits.Frequency f=50 "Actual frequency";
        parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
        parameter Modelica_SIunits.Torque TLoad=181.4 "Nominal load torque";
        parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
        parameter Modelica_SIunits.Inertia JLoad=0.29
          "Load's moment of inertia";
        Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
          smpm(
          p=smpmData.p,
          fsNominal=smpmData.fsNominal,
          TsOperational=293.15,
          Rs=smpmData.Rs,
          TsRef=smpmData.TsRef,
          alpha20s=smpmData.alpha20s,
          Lszero=smpmData.Lszero,
          Lssigma=smpmData.Lssigma,
          Jr=smpmData.Jr,
          Js=smpmData.Js,
          frictionParameters=smpmData.frictionParameters,
          phiMechanical(fixed=true),
          wMechanical(fixed=true),
          statorCoreParameters=smpmData.statorCoreParameters,
          strayLoadParameters=smpmData.strayLoadParameters,
          TrOperational=293.15,
          VsOpenCircuit=smpmData.VsOpenCircuit,
          Lmd=smpmData.Lmd,
          Lmq=smpmData.Lmq,
          useDamperCage=smpmData.useDamperCage,
          Lrsigmad=smpmData.Lrsigmad,
          Lrsigmaq=smpmData.Lrsigmaq,
          Rrd=smpmData.Rrd,
          Rrq=smpmData.Rrq,
          TrRef=smpmData.TrRef,
          alpha20r=smpmData.alpha20r,
          permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters)
          annotation (Placement(transformation(extent={{-10,-92},{10,-72}},
                rotation=0)));
        Modelica_Electrical_MultiPhase.Sources.SignalCurrent signalCurrent(
            final m=m) annotation (Placement(transformation(
              origin={0,-18},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
           Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={40,-18})));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={40,-38},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        Modelica_Electrical_Machines.Utilities.CurrentController
          currentController(p=smpm.p)
          annotation (Placement(transformation(extent={{-50,-28},{-30,-8}})));
        Modelica_Blocks.Sources.Constant iq(k=84.6) annotation (Placement(
              transformation(extent={{-100,-30},{-80,-10}})));
        Modelica_Blocks.Sources.Constant id(k=-53.5)
          annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
        Modelica_Electrical_MultiPhase.Sensors.VoltageQuasiRMSSensor
          voltageQuasiRMSSensor annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-20,-58})));
        Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-40,-58})));
        Modelica_Electrical_Analog.Basic.Ground groundM annotation (Placement(
              transformation(
              origin={-50,-80},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
            terminalConnection="Y") annotation (Placement(transformation(
                extent={{-10,-72},{10,-52}},rotation=0)));
        Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle
          rotorDisplacementAngle(p=smpm.p) annotation (Placement(
              transformation(
              origin={30,-82},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Mechanics_Rotational.Sensors.AngleSensor angleSensor
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-52})));
        Modelica_Mechanics_Rotational.Components.Inertia inertiaLoad(J=0.29)
          annotation (Placement(transformation(extent={{40,-92},{60,-72}})));
        Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
          quadraticSpeedDependentTorque(tau_nominal=-181.4, w_nominal(
              displayUnit="rpm") = 157.07963267949)
          annotation (Placement(transformation(extent={{90,-92},{70,-72}})));
        parameter
          Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
          smpmData(useDamperCage=false)
          annotation (Placement(transformation(extent={{70,-18},{90,2}})));
        Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentQuasiRMSSensor annotation (Placement(transformation(
              origin={0,-48},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.SynchronousMachines.SM_PermanentMagnet
          smpmQS(
          p=smpmData.p,
          fsNominal=smpmData.fsNominal,
          Rs=smpmData.Rs,
          TsRef=smpmData.TsRef,
          Lssigma=smpmData.Lssigma,
          Jr=smpmData.Jr,
          Js=smpmData.Js,
          frictionParameters=smpmData.frictionParameters,
          wMechanical(fixed=true),
          statorCoreParameters=smpmData.statorCoreParameters,
          strayLoadParameters=smpmData.strayLoadParameters,
          VsOpenCircuit=smpmData.VsOpenCircuit,
          Lmd=smpmData.Lmd,
          Lmq=smpmData.Lmq,
          useDamperCage=smpmData.useDamperCage,
          Lrsigmad=smpmData.Lrsigmad,
          Lrsigmaq=smpmData.Lrsigmaq,
          Rrd=smpmData.Rrd,
          Rrq=smpmData.Rrq,
          TrRef=smpmData.TrRef,
          permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,

          TsOperational=293.15,
          alpha20s=smpmData.alpha20s,
          phiMechanical(fixed=true, start=0),
          alpha20r=smpmData.alpha20r,
          TrOperational=293.15) annotation (Placement(transformation(extent={{-10,
                  24},{10,44}}, rotation=0)));

        Modelica_Mechanics_Rotational.Components.Inertia inertiaLoadQS(J=0.29)
          annotation (Placement(transformation(extent={{40,24},{60,44}})));
        Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
          quadraticSpeedDependentTorqueQS(tau_nominal=-181.4, w_nominal(
              displayUnit="rpm") = 157.07963267949)
          annotation (Placement(transformation(extent={{90,24},{70,44}})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star
          starMachineQS(m=
              Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
                                                                           m))
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={-30,44})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundMQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,44})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.MultiTerminalBox
          terminalBoxQS(terminalConnection="Y", m=m) annotation (Placement(
              transformation(extent={{-10,44},{10,64}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.CurrentController
          currentController1(m=m, p=smpmQS.p)
          annotation (Placement(transformation(extent={{-50,74},{-30,94}})));
        Modelica_Mechanics_Rotational.Sensors.AngleSensor angleSensorQS
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,54})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sources.ReferenceCurrentSource
          referenceCurrentSource annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={0,84})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starQS(m=m)
          annotation (Placement(transformation(
              origin={40,84},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundeQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={40,64})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor
          resistor(m=m, R_ref=fill(1e5, m)) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,84})));
      equation
        connect(star.pin_n, ground.p)
          annotation (Line(points={{40,-28},{40,-28}}, color={0,0,255}));
        connect(rotorDisplacementAngle.plug_n, smpm.plug_sn) annotation (Line(
              points={{36,-72},{36,-66},{-6,-66},{-6,-72}}, color={0,0,255}));
        connect(rotorDisplacementAngle.plug_p, smpm.plug_sp)
          annotation (Line(points={{24,-72},{6,-72}}, color={0,0,255}));
        connect(terminalBox.plug_sn, smpm.plug_sn) annotation (Line(
            points={{-6,-72},{-6,-72}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(terminalBox.plug_sp, smpm.plug_sp) annotation (Line(
            points={{6,-72},{6,-72}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(smpm.flange, rotorDisplacementAngle.flange) annotation (Line(
            points={{10,-82},{20,-82}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(signalCurrent.plug_p, star.plug_p) annotation (Line(
            points={{0,-8},{40,-8}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(angleSensor.flange, rotorDisplacementAngle.flange)
          annotation (Line(
            points={{20,-62},{20,-82}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(angleSensor.phi, currentController.phi) annotation (Line(
            points={{20,-41},{20,-36},{-40,-36},{-40,-30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(id.y, currentController.id_rms) annotation (Line(
            points={{-79,20},{-74,20},{-74,-12},{-52,-12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(iq.y, currentController.iq_rms) annotation (Line(
            points={{-79,-20},{-70,-20},{-70,-24},{-52,-24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(groundM.p, terminalBox.starpoint) annotation (Line(
            points={{-50,-70},{-9,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(voltageQuasiRMSSensor.plug_p, terminalBox.plugSupply)
          annotation (Line(
            points={{-10,-58},{0,-58},{0,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(starM.plug_p, voltageQuasiRMSSensor.plug_n) annotation (Line(
            points={{-30,-58},{-30,-58}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(starM.pin_n, groundM.p) annotation (Line(
            points={{-50,-58},{-50,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentController.y, signalCurrent.i) annotation (Line(
            points={{-29,-18},{-7,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(quadraticSpeedDependentTorque.flange, inertiaLoad.flange_b)
          annotation (Line(
            points={{70,-82},{60,-82}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(signalCurrent.plug_n, currentQuasiRMSSensor.plug_p)
          annotation (Line(
            points={{0,-28},{0,-38}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentQuasiRMSSensor.plug_n, voltageQuasiRMSSensor.plug_p)
          annotation (Line(
            points={{0,-58},{-10,-58}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(smpm.flange, inertiaLoad.flange_a) annotation (Line(
            points={{10,-82},{10,-88},{20,-88},{20,-82},{40,-82}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(quadraticSpeedDependentTorqueQS.flange, inertiaLoadQS.flange_b)
          annotation (Line(
            points={{70,34},{60,34}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(smpmQS.flange, inertiaLoadQS.flange_a) annotation (Line(
            points={{10,34},{40,34}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(starMachineQS.plug_p, terminalBoxQS.starpoint) annotation (
            Line(
            points={{-20,44},{-20,46},{-9,46}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(groundMQS.pin, starMachineQS.pin_n) annotation (Line(
            points={{-40,44},{-40,44}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sn, smpmQS.plug_sn) annotation (Line(
            points={{-6,44},{-6,44}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sp, smpmQS.plug_sp) annotation (Line(
            points={{6,44},{6,44}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(angleSensorQS.phi, currentController1.phi) annotation (Line(
            points={{20,65},{20,68},{-40,68},{-40,72}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(currentController1.I, referenceCurrentSource.I) annotation (
            Line(
            points={{-29,88},{-10,88}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(referenceCurrentSource.plug_p, starQS.plug_p) annotation (
            Line(
            points={{0,94},{40,94}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starQS.pin_n, groundeQS.pin) annotation (Line(
            points={{40,74},{40,74}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentController1.id_rms, id.y) annotation (Line(
            points={{-52,90},{-74,90},{-74,20},{-79,20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(iq.y, currentController1.iq_rms) annotation (Line(
            points={{-79,-20},{-70,-20},{-70,78},{-52,78}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(angleSensorQS.flange, smpmQS.flange) annotation (Line(
            points={{20,44},{20,34},{10,34}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(currentController1.gamma, referenceCurrentSource.gamma)
          annotation (Line(
            points={{-29,80},{-10,80}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(referenceCurrentSource.plug_n, terminalBoxQS.plugSupply)
          annotation (Line(
            points={{0,74},{0,46}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(referenceCurrentSource.plug_p, resistor.plug_p) annotation (
            Line(
            points={{0,94},{20,94}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(resistor.plug_n, referenceCurrentSource.plug_n) annotation (
            Line(
            points={{20,74},{0,74}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          experiment(StopTime=2.0, Interval=0.001),
          Documentation(info="<html>
<p>A synchronous induction machine with permanent magnets accelerates a quadratic speed dependent load from standstill.
The rms values of d- and q-current in rotor fixed coordinate system are converted to three-phase currents,
and fed to the machine. The result shows that the torque is influenced by the q-current,
whereas the stator voltage is influenced by the d-current.</p>
<p>
Default machine parameters of model <a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">SM_PermanentMagnet</a> are used.
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                extent={{-64,100},{100,14}},
                lineColor={0,0,0},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.Dash), Rectangle(
                extent={{-64,12},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.Dash)}));
      end SMPM_CurrentSource;

      model SMEE_Generator
        "Electrical excited synchronous machine operating as generator"
        import Modelica_Constants.pi;
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of stator phases";
        parameter Modelica_SIunits.Voltage VsNominal=100
          "Nominal RMS voltage per phase";
        parameter Modelica_SIunits.Frequency fsNominal=50 "Nominal frequency";
        parameter Modelica_SIunits.AngularVelocity w=
            Modelica_SIunits.Conversions.from_rpm(1499) "Nominal speed";
        parameter Modelica_SIunits.Current Ie=19 "Excitation current";
        parameter Modelica_SIunits.Current Ie0=10 "Initial excitation current";
        parameter Modelica_SIunits.Angle gamma0(displayUnit="deg") = 0
          "Initial rotor displacement angle";
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
           Placement(transformation(extent={{-50,-30},{-70,-10}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground grounde annotation (Placement(
              transformation(
              origin={-90,-20},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
          final m=m,
          final V=fill(VsNominal*sqrt(2), m),
          final freqHz=fill(fsNominal, m)) annotation (Placement(
              transformation(extent={{-20,-30},{-40,-10}}, rotation=0)));
        Modelica_Electrical_MultiPhase.Sensors.PowerSensor
          electricalPowerSensor(m=m) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-34})));
        Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
            terminalConnection="Y", m=m) annotation (Placement(transformation(
                extent={{-10,-60},{10,-40}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited
          smee(
          phiMechanical(start=-(Modelica_Constants.pi + gamma0)/smee.p, fixed=
               true),
          Jr=0.29,
          Js=0.29,
          p=2,
          fsNominal=smeeData.fsNominal,
          TsRef=smeeData.TsRef,
          alpha20s(displayUnit="1/K") = smeeData.alpha20s,
          Lrsigmad=smeeData.Lrsigmad,
          Lrsigmaq=smeeData.Lrsigmaq,
          Rrd=smeeData.Rrd,
          Rrq=smeeData.Rrq,
          TrRef=smeeData.TrRef,
          alpha20r(displayUnit="1/K") = smeeData.alpha20r,
          VsNominal=smeeData.VsNominal,
          IeOpenCircuit=smeeData.IeOpenCircuit,
          Re=smeeData.Re,
          TeRef=smeeData.TeRef,
          alpha20e(displayUnit="1/K") = smeeData.alpha20e,
          sigmae=smeeData.sigmae,
          statorCoreParameters(VRef=100),
          strayLoadParameters(IRef=100),
          brushParameters(ILinear=0.01),
          ir(fixed=true),
          useDamperCage=false,
          m=m,
          frictionParameters(PRef=0),
          Rs=smeeData.Rs*m/3,
          Lssigma=smeeData.Lssigma*m/3,
          Lmd=smeeData.Lmd*m/3,
          Lmq=smeeData.Lmq*m/3,
          TsOperational=293.15,
          TrOperational=293.15,
          TeOperational=293.15) annotation (Placement(transformation(extent={
                  {-10,-80},{10,-60}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.SynchronousMachines.SM_ElectricalExcited
          smeeQS(
          p=2,
          fsNominal=smeeData.fsNominal,
          TsRef=smeeData.TsRef,
          alpha20s(displayUnit="1/K") = smeeData.alpha20s,
          Jr=0.29,
          Js=0.29,
          frictionParameters(PRef=0),
          statorCoreParameters(PRef=0, VRef=100),
          strayLoadParameters(PRef=0, IRef=100),
          Lrsigmad=smeeData.Lrsigmad,
          Rrd=smeeData.Rrd,
          Rrq=smeeData.Rrq,
          alpha20r(displayUnit="1/K") = smeeData.alpha20r,
          VsNominal=smeeData.VsNominal,
          IeOpenCircuit=smeeData.IeOpenCircuit,
          Re=smeeData.Re,
          TeRef=smeeData.TeRef,
          alpha20e(displayUnit="1/K") = smeeData.alpha20e,
          brushParameters(V=0, ILinear=0.01),
          Lrsigmaq=smeeData.Lrsigmaq,
          TrRef=smeeData.TrRef,
          useDamperCage=false,
          m=m,
          gammar(fixed=true, start=pi/2),
          gamma(fixed=true, start=-pi/2),
          TsOperational=293.15,
          Rs=smeeData.Rs*m/3,
          Lssigma=smeeData.Lssigma*m/3,
          Lmd=smeeData.Lmd*m/3,
          Lmq=smeeData.Lmq*m/3,
          TrOperational=293.15,
          TeOperational=293.15) annotation (Placement(transformation(extent={{-10,
                  20},{10,40}}, rotation=0)));
        Modelica_Electrical_Analog.Basic.Ground groundr annotation (Placement(
              transformation(
              origin={-50,-88},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_Analog.Basic.Ground groundrQS annotation (
            Placement(transformation(
              origin={-50,12},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_Analog.Sources.RampCurrent rampCurrent(
          duration=0.1,
          I=Ie - Ie0,
          offset=Ie0) annotation (Placement(transformation(
              origin={-30,-70},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_Analog.Sources.RampCurrent rampCurrentQS(
          duration=0.1,
          I=Ie - Ie0,
          offset=Ie0) annotation (Placement(transformation(
              origin={-28,30},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica_Electrical_Machines.Sensors.MechanicalPowerSensor
          mechanicalPowerSensor annotation (Placement(transformation(extent={
                  {20,-80},{40,-60}},rotation=0)));
        Modelica_Electrical_Machines.Sensors.MechanicalPowerSensor
          mechanicalPowerSensorQS annotation (Placement(transformation(extent=
                 {{20,20},{40,40}}, rotation=0)));
        Modelica_Mechanics_Rotational.Sources.ConstantSpeed constantSpeed(
            final w_fixed=w, useSupport=false) annotation (Placement(
              transformation(extent={{70,-80},{50,-60}}, rotation=0)));
        Modelica_Mechanics_Rotational.Sources.ConstantSpeed constantSpeedQS(
            final w_fixed=w, useSupport=false) annotation (Placement(
              transformation(extent={{70,20},{50,40}}, rotation=0)));
        parameter Modelica_Electrical_Machines.Utilities.SynchronousMachineData
          smeeData(
          SNominal=30e3,
          VsNominal=100,
          fsNominal=50,
          IeOpenCircuit=10,
          x0=0.1,
          xd=1.6,
          xdTransient=0.1375,
          xdSubtransient=0.121428571,
          xqSubtransient=0.148387097,
          Ta=0.014171268,
          Td0Transient=0.261177343,
          Td0Subtransient=0.006963029,
          Tq0Subtransient=0.123345081,
          alpha20s(displayUnit="1/K")=Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
          alpha20r(displayUnit="1/K")=Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
          alpha20e(displayUnit="1/K")=Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
          xq=1.1,
          TsSpecification=293.15,
          TsRef=293.15,
          TrSpecification=293.15,
          TrRef=293.15,
          TeSpecification=293.15,
          TeRef=293.15)
          annotation (Placement(transformation(extent={{70,70},{90,90}})));

        Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSourceQS(
          m=m,
          phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
              m),
          V=fill(VsNominal, m),
          f=fsNominal) annotation (Placement(transformation(
              origin={-30,80},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starQS(m=m)
          annotation (Placement(transformation(
              origin={-60,80},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundeQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-90,80})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensorQS(m=m) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,66})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.MultiTerminalBox
          terminalBoxQS(m=m, terminalConnection="Y") annotation (Placement(
              transformation(extent={{-10,40},{10,60}}, rotation=0)));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star
          starMachineQS(m=
              Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
                                                                           m))
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={-20,50})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundMachineQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,50})));
      initial equation
        smee.is[1:2] = zeros(2);

      equation
        connect(star.pin_n, grounde.p)
          annotation (Line(points={{-70,-20},{-80,-20}}, color={0,0,255}));
        connect(star.plug_p, sineVoltage.plug_n)
          annotation (Line(points={{-50,-20},{-40,-20}}, color={0,0,255}));
        connect(smeeQS.flange, mechanicalPowerSensorQS.flange_a)
          annotation (Line(points={{10,30},{20,30}}, color={0,0,0}));
        connect(mechanicalPowerSensorQS.flange_b, constantSpeedQS.flange)
          annotation (Line(points={{40,30},{50,30}}, color={0,0,0}));
        connect(rampCurrentQS.p, groundrQS.p) annotation (Line(points={{-28,
                20},{-34,20},{-34,12},{-40,12}}, color={0,0,255}));
        connect(rampCurrentQS.p, smeeQS.pin_en) annotation (Line(points={{-28,
                20},{-20,20},{-20,24},{-10,24}}, color={0,0,255}));
        connect(rampCurrentQS.n, smeeQS.pin_ep) annotation (Line(points={{-28,
                40},{-20,40},{-20,36},{-10,36}}, color={0,0,255}));
        connect(smee.flange, mechanicalPowerSensor.flange_a)
          annotation (Line(points={{10,-70},{20,-70}}, color={0,0,0}));
        connect(mechanicalPowerSensor.flange_b, constantSpeed.flange)
          annotation (Line(points={{40,-70},{50,-70}}, color={0,0,0}));
        connect(rampCurrent.p, groundr.p) annotation (Line(points={{-30,-80},
                {-36,-80},{-36,-88},{-38,-88},{-38,-88},{-40,-88},{-40,-88}},
              color={0,0,255}));
        connect(rampCurrent.p, smee.pin_en) annotation (Line(points={{-30,-80},
                {-20,-80},{-20,-76},{-10,-76}}, color={0,0,255}));
        connect(rampCurrent.n, smee.pin_ep) annotation (Line(points={{-30,-60},
                {-20,-60},{-20,-64},{-10,-64}}, color={0,0,255}));
        connect(smee.plug_sn, terminalBoxM.plug_sn)
          annotation (Line(points={{-6,-60},{-6,-60}}, color={0,0,255}));
        connect(smee.plug_sp, terminalBoxM.plug_sp)
          annotation (Line(points={{6,-60},{6,-60}}, color={0,0,255}));
        connect(groundeQS.pin, starQS.pin_n) annotation (Line(points={{-80,80},
                {-80,80},{-70,80}}, color={85,170,255}));
        connect(starQS.plug_p, voltageSourceQS.plug_n) annotation (Line(
              points={{-50,80},{-50,80},{-40,80}}, color={85,170,255}));
        connect(voltageSourceQS.plug_p, powerSensorQS.currentP) annotation (
            Line(points={{-20,80},{-20,80},{0,80},{0,80},{0,80},{0,76},{0,76}},
              color={85,170,255}));
        connect(powerSensorQS.voltageP, powerSensorQS.currentP) annotation (
            Line(points={{10,66},{10,76},{0,76}}, color={85,170,255}));
        connect(powerSensorQS.voltageN, starQS.plug_p) annotation (Line(
              points={{-10,66},{-10,66},{-42,66},{-50,66},{-50,80}}, color={
                85,170,255}));
        connect(sineVoltage.plug_p, electricalPowerSensor.pc) annotation (
            Line(
            points={{-20,-20},{0,-20},{0,-24},{0,-24}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(electricalPowerSensor.pc, electricalPowerSensor.pv)
          annotation (Line(
            points={{0,-24},{10,-24},{10,-34}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(electricalPowerSensor.nv, star.plug_p) annotation (Line(
            points={{-10,-34},{-50,-34},{-50,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(electricalPowerSensor.nc, terminalBoxM.plugSupply)
          annotation (Line(
            points={{0,-44},{0,-58}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sn, smeeQS.plug_sn) annotation (Line(
            points={{-6,40},{-6,40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sp, smeeQS.plug_sp) annotation (Line(
            points={{6,40},{6,40}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(powerSensorQS.currentN, terminalBoxQS.plugSupply) annotation (
           Line(
            points={{0,56},{0,42}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.pin_n, groundMachineQS.pin) annotation (Line(
            points={{-30,50},{-40,50}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starMachineQS.plug_p, terminalBoxQS.starpoint) annotation (
            Line(
            points={{-10,50},{-10,42},{-9,42}},
            color={85,170,255},
            smooth=Smooth.None));
        annotation (
          experiment(
            StopTime=30,
            Interval=0.005,
            Tolerance=1e-06),
          Documentation(info="<HTML>
<h4>Electrical excited synchronous induction machine as generator</h4>
<p>
An
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">electrically excited synchronous generator</a> is connected to the grid and driven with constant speed.
Since speed is slightly smaller than synchronous speed corresponding to mains frequency,
rotor angle is very slowly increased. This allows to see several characteristics dependent on rotor angle.
</p>

<p>
Simulate for 30 seconds and plot (versus <code>rotorAngleM.rotorDisplacementAngle</code>):
</p>

<ul>
<li><code>speedM|E.tauElectrical</code>: machine torque</li>
<li><code>mechanicalPowerSensorM|E.P</code>: mechanical power</li>
</ul>
</HTML>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                        extent={{-100,-6},{100,-96}},
                        lineColor={0,0,255},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        pattern=LinePattern.Dash),Rectangle(
                        extent={{-100,94},{100,0}},
                        lineColor={0,0,255},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        pattern=LinePattern.Dash),Text(
                        extent={{20,10},{100,2}},
                        lineColor={0,0,0},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="%m phase QS
"),Text(              extent={{20,-10},{100,-18}},
                        lineColor={0,0,0},
                        fillColor={255,255,170},
                        fillPattern=FillPattern.Solid,
                        textStyle={TextStyle.Bold},
                        textString="%m phase transient
")}));
      end SMEE_Generator;

      model SMR_CurrentSource
        "Test example: Synchronous reluctance machine fed by current source"
        import Modelica_Constants.pi;
        import Modelica_Magnetic_QuasiStatic_FundamentalWave;
        extends Modelica_Icons.Example;
        parameter Integer m=3 "Number of phases";
        parameter Modelica_SIunits.Voltage VNominal=100
          "Nominal RMS voltage per phase";
        parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
        parameter Modelica_SIunits.Frequency f=50 "Actual frequency";
        parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
        parameter Modelica_SIunits.Torque TLoad=181.4 "Nominal load torque";
        parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
        parameter Modelica_SIunits.Inertia JLoad=0.29
          "Load's moment of inertia";
        Modelica_Electrical_MultiPhase.Sources.SignalCurrent signalCurrent(
            final m=m) annotation (Placement(transformation(
              origin={0,-18},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
           Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={40,-18})));
        Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={40,-38},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        Modelica_Electrical_Machines.Utilities.CurrentController
          currentController(p=smr.p)
          annotation (Placement(transformation(extent={{-50,-28},{-30,-8}})));
        Modelica_Blocks.Sources.Constant iq(k=84.6) annotation (Placement(
              transformation(extent={{-100,-30},{-80,-10}})));
        Modelica_Blocks.Sources.Constant id(k=53.5)
          annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
        Modelica_Electrical_MultiPhase.Sensors.VoltageQuasiRMSSensor
          voltageQuasiRMSSensor annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-20,-58})));
        Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-40,-58})));
        Modelica_Electrical_Analog.Basic.Ground groundM annotation (Placement(
              transformation(
              origin={-50,-80},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
            terminalConnection="Y") annotation (Placement(transformation(
                extent={{-10,-72},{10,-52}},rotation=0)));
        Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle
          rotorDisplacementAngle(p=smr.p) annotation (Placement(
              transformation(
              origin={30,-82},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica_Mechanics_Rotational.Sensors.AngleSensor angleSensor
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-52})));
        Modelica_Mechanics_Rotational.Components.Inertia inertiaLoad(J=0.29)
          annotation (Placement(transformation(extent={{44,-92},{64,-72}})));
        Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
          quadraticSpeedDependentTorque(
          tau_nominal=-181.4,
          w_nominal(displayUnit="rpm") = 157.07963267949,
          TorqueDirection=false)
          annotation (Placement(transformation(extent={{90,-92},{70,-72}})));
        Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentQuasiRMSSensor annotation (Placement(transformation(
              origin={0,-48},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Mechanics_Rotational.Components.Inertia inertiaLoadQS(J=0.29)
          annotation (Placement(transformation(extent={{40,24},{60,44}})));
        Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
          quadraticSpeedDependentTorqueQS(
          tau_nominal=-181.4,
          w_nominal(displayUnit="rpm") = 157.07963267949,
          TorqueDirection=false)
          annotation (Placement(transformation(extent={{90,24},{70,44}})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star
          starMachineQS(m=
              Modelica_Electrical_MultiPhase.Functions.numberOfSymmetricBaseSystems(
                                                                           m))
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={-30,44})));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundMQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,44})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.MultiTerminalBox
          terminalBoxQS(terminalConnection="Y", m=m) annotation (Placement(
              transformation(extent={{-10,44},{10,64}}, rotation=0)));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.Utilities.CurrentController
          currentController1(m=m, p=smrQS.p)
          annotation (Placement(transformation(extent={{-50,74},{-30,94}})));
        Modelica_Mechanics_Rotational.Sensors.AngleSensor angleSensorQS
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,54})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Sources.ReferenceCurrentSource
          referenceCurrentSource annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={0,84})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starQS(m=m)
          annotation (Placement(transformation(
              origin={40,84},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground
          groundeQS annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={40,64})));
        Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor
          resistor(m=m, R_ref=fill(1e5, m)) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,84})));
        parameter
          Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_ReluctanceRotorData
          smrData(useDamperCage=false)
          annotation (Placement(transformation(extent={{70,70},{90,90}})));
        Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.SynchronousMachines.SM_ReluctanceRotor
          smrQS(
          p=smrData.p,
          fsNominal=smrData.fsNominal,
          TsRef=smrData.TsRef,
          alpha20s(displayUnit="1/K") = smrData.alpha20s,
          Jr=smrData.Jr,
          Js=smrData.Js,
          frictionParameters=smrData.frictionParameters,
          statorCoreParameters=smrData.statorCoreParameters,
          strayLoadParameters=smrData.strayLoadParameters,
          Lrsigmad=smrData.Lrsigmad,
          Lrsigmaq=smrData.Lrsigmaq,
          Rrd=smrData.Rrd,
          Rrq=smrData.Rrq,
          TrRef=smrData.TrRef,
          alpha20r(displayUnit="1/K") = smrData.alpha20r,
          Rs=smrData.Rs*m/3,
          Lssigma=smrData.Lssigma*m/3,
          Lmd=smrData.Lmd*m/3,
          Lmq=smrData.Lmq*m/3,
          m=m,
          gammar(start=pi/2),
          gamma(start=-pi/2),
          useDamperCage=smrData.useDamperCage,
          wMechanical(start=0, fixed=true),
          TsOperational=293.15,
          phiMechanical(start=0, fixed=true),
          TrOperational=293.15) annotation (Placement(transformation(extent={{-10,
                  24},{10,44}}, rotation=0)));
        Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor
          smr(
          Jr=smrData.Jr,
          Js=smrData.Js,
          p=smrData.p,
          fsNominal=smrData.fsNominal,
          TsRef=smrData.TsRef,
          alpha20s(displayUnit="1/K") = smrData.alpha20s,
          frictionParameters=smrData.frictionParameters,
          statorCoreParameters=smrData.statorCoreParameters,
          strayLoadParameters=smrData.strayLoadParameters,
          phiMechanical(fixed=true),
          wMechanical(fixed=true),
          Lrsigmad=smrData.Lrsigmad,
          Lrsigmaq=smrData.Lrsigmaq,
          Rrd=smrData.Rrd,
          Rrq=smrData.Rrq,
          TrRef=smrData.TrRef,
          alpha20r(displayUnit="1/K") = smrData.alpha20r,
          ir(fixed=true),
          m=m,
          Rs=smrData.Rs*m/3,
          Lssigma=smrData.Lssigma*m/3,
          Lszero=smrData.Lszero*m/3,
          Lmd=smrData.Lmd*m/3,
          Lmq=smrData.Lmq*m/3,
          TsOperational=293.15,
          TrOperational=293.15,
          useDamperCage=smrData.useDamperCage) annotation (Placement(
              transformation(extent={{-10,-92},{10,-72}}, rotation=0)));
      equation
        connect(star.pin_n, ground.p)
          annotation (Line(points={{40,-28},{40,-28}}, color={0,0,255}));
        connect(signalCurrent.plug_p, star.plug_p) annotation (Line(
            points={{0,-8},{40,-8}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(angleSensor.flange, rotorDisplacementAngle.flange)
          annotation (Line(
            points={{20,-62},{20,-82}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(angleSensor.phi, currentController.phi) annotation (Line(
            points={{20,-41},{20,-36},{-40,-36},{-40,-30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(id.y, currentController.id_rms) annotation (Line(
            points={{-79,20},{-74,20},{-74,-12},{-52,-12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(iq.y, currentController.iq_rms) annotation (Line(
            points={{-79,-20},{-70,-20},{-70,-24},{-52,-24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(groundM.p, terminalBox.starpoint) annotation (Line(
            points={{-50,-70},{-9,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(voltageQuasiRMSSensor.plug_p, terminalBox.plugSupply)
          annotation (Line(
            points={{-10,-58},{0,-58},{0,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(starM.plug_p, voltageQuasiRMSSensor.plug_n) annotation (Line(
            points={{-30,-58},{-30,-58}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(starM.pin_n, groundM.p) annotation (Line(
            points={{-50,-58},{-50,-70}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentController.y, signalCurrent.i) annotation (Line(
            points={{-29,-18},{-7,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(quadraticSpeedDependentTorque.flange, inertiaLoad.flange_b)
          annotation (Line(
            points={{70,-82},{64,-82}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(signalCurrent.plug_n, currentQuasiRMSSensor.plug_p)
          annotation (Line(
            points={{0,-28},{0,-38}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(currentQuasiRMSSensor.plug_n, voltageQuasiRMSSensor.plug_p)
          annotation (Line(
            points={{0,-58},{-10,-58}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(quadraticSpeedDependentTorqueQS.flange, inertiaLoadQS.flange_b)
          annotation (Line(
            points={{70,34},{60,34}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(starMachineQS.plug_p, terminalBoxQS.starpoint) annotation (
            Line(
            points={{-20,44},{-20,46},{-9,46}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(groundMQS.pin, starMachineQS.pin_n) annotation (Line(
            points={{-40,44},{-40,44}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(angleSensorQS.phi, currentController1.phi) annotation (Line(
            points={{20,65},{20,68},{-40,68},{-40,72}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(currentController1.I, referenceCurrentSource.I) annotation (
            Line(
            points={{-29,88},{-10,88}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(referenceCurrentSource.plug_p, starQS.plug_p) annotation (
            Line(
            points={{0,94},{40,94}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(starQS.pin_n, groundeQS.pin) annotation (Line(
            points={{40,74},{40,74}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(currentController1.id_rms, id.y) annotation (Line(
            points={{-52,90},{-74,90},{-74,20},{-79,20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(iq.y, currentController1.iq_rms) annotation (Line(
            points={{-79,-20},{-70,-20},{-70,78},{-52,78}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(currentController1.gamma, referenceCurrentSource.gamma)
          annotation (Line(
            points={{-29,80},{-10,80}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(referenceCurrentSource.plug_n, terminalBoxQS.plugSupply)
          annotation (Line(
            points={{0,74},{0,46}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(referenceCurrentSource.plug_p, resistor.plug_p) annotation (
            Line(
            points={{0,94},{20,94}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(resistor.plug_n, referenceCurrentSource.plug_n) annotation (
            Line(
            points={{20,74},{0,74}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sn, smrQS.plug_sn) annotation (Line(
            points={{-6,44},{-6,44}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(terminalBoxQS.plug_sp, smrQS.plug_sp) annotation (Line(
            points={{6,44},{6,44}},
            color={85,170,255},
            smooth=Smooth.None));
        connect(smrQS.flange, inertiaLoadQS.flange_a) annotation (Line(
            points={{10,34},{40,34}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(angleSensorQS.flange, smrQS.flange) annotation (Line(
            points={{20,44},{20,34},{10,34}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(terminalBox.plug_sn, smr.plug_sn) annotation (Line(
            points={{-6,-72},{-6,-72}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(terminalBox.plug_sp, smr.plug_sp) annotation (Line(
            points={{6,-72},{6,-72}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(smr.flange, rotorDisplacementAngle.flange) annotation (Line(
            points={{10,-82},{20,-82}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(rotorDisplacementAngle.plug_p, terminalBox.plug_sp)
          annotation (Line(
            points={{24,-72},{24,-68},{6,-68},{6,-72}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(terminalBox.plug_sn, rotorDisplacementAngle.plug_n)
          annotation (Line(
            points={{-6,-72},{-6,-66},{36,-66},{36,-72}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(rotorDisplacementAngle.flange, inertiaLoad.flange_a)
          annotation (Line(
            points={{20,-82},{44,-82}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (
          experiment(StopTime=2.0, Interval=0.001),
          Documentation(info="<html>
<p>A synchronous induction machine with permanent magnets accelerates a quadratic speed dependent load from standstill.
The rms values of d- and q-current in rotor fixed coordinate system are converted to three-phase currents,
and fed to the machine. The result shows that the torque is influenced by the q-current,
whereas the stator voltage is influenced by the d-current.</p>
<p>
Default machine parameters of model <a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">SM_PermanentMagnet</a> are used.
</p>
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                extent={{-64,100},{100,14}},
                lineColor={0,0,0},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.Dash), Rectangle(
                extent={{-64,12},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.Dash)}));
      end SMR_CurrentSource;
    end SynchronousMachines;
  end BasicMachines;
  annotation (uses(Complex(version="3.2.2")));
end Modelica_Magnetic_QuasiStatic_FundamentalWave_Examples;
