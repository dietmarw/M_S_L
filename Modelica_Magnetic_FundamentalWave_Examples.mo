within ;
encapsulated package Modelica_Magnetic_FundamentalWave_Examples
  "Examples of electric machines based on the FundamentalWave concept"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Electrical_Analog;
  import Modelica_Electrical_MultiPhase;
  import Modelica_Magnetic_FundamentalWave;
  import Complex;
  import Modelica_Constants;
  import Modelica_Blocks;
  import Modelica_Electrical_Machines;
  import Modelica_Mechanics_Rotational;
  extends Modelica_Icons.ExamplesPackage;
  package Components "Examples of components of the FundamentalWave library"
    extends Modelica_Icons.ExamplesPackage;
    model EddyCurrentLosses
      "Comparison of equivalent circuits of eddy current loss models"
      extends Modelica_Icons.Example;
      parameter Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Resistance R=0.1 "Resistance of leader cables";
      parameter Modelica_SIunits.Conductance Gc=1 "Loss conductance";
      parameter Modelica_SIunits.Reluctance R_m=1
        "Reluctance of the magnetic circuit";
      parameter Real N=1 "Number of turns";
      output Modelica_SIunits.Power lossPower_e=sum(loss_e.conductor.LossPower);
      output Modelica_SIunits.Power lossPower_m=loss_m.lossPower;
      Modelica_Electrical_Analog.Basic.Ground ground_e
        annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
      Modelica_Electrical_Analog.Basic.Ground ground_m
        annotation (Placement(transformation(extent={{-90,-90},{-70,-70}})));
      Modelica_Electrical_MultiPhase.Basic.Star star_e(m=m) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,30})));
      Modelica_Electrical_MultiPhase.Basic.Star star_m(m=m) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,-60})));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage_e(
        m=m,
        V=fill(1, m),
        freqHz=fill(1, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,60})));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage_m(
        m=m,
        V=fill(1, m),
        freqHz=fill(1, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,-30})));
      Modelica_Electrical_MultiPhase.Basic.Resistor resistor_e(m=m, R=fill(
            R, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-60,70})));
      Modelica_Electrical_MultiPhase.Basic.Resistor resistor_m(m=m, R=fill(
            R, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-60,-20})));
      Modelica_Magnetic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
        converter_e(
        m=m,
        effectiveTurns=fill(N, m),
        orientation=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m))
        annotation (Placement(transformation(extent={{20,50},{40,70}})));
      Modelica_Magnetic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
        converter_m(
        m=m,
        effectiveTurns=fill(N, m),
        orientation=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m))
        annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
      Modelica_Magnetic_FundamentalWave.Components.Reluctance reluctance_e(R_m(d=R_m,
            q=R_m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={80,60})));
      Modelica_Magnetic_FundamentalWave.Components.Reluctance reluctance_m(R_m(d=R_m,
            q=R_m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={80,-30})));
      Modelica_Magnetic_FundamentalWave.Components.Ground mground_e
        annotation (Placement(transformation(extent={{30,0},{50,20}})));
      Modelica_Magnetic_FundamentalWave.Components.Ground mground_m
        annotation (Placement(transformation(extent={{30,-90},{50,-70}})));
      Modelica_Electrical_MultiPhase.Basic.Conductor loss_e(m=m, G=fill(Gc, m))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-10,60})));
      Modelica_Magnetic_FundamentalWave.Components.EddyCurrent loss_m(G=m*N^2*
            Gc/2) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={60,-20})));
      Modelica_Electrical_MultiPhase.Sensors.PowerSensor powerb_e(m=m)
        annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
      Modelica_Electrical_MultiPhase.Sensors.PowerSensor powerb_m(m=m)
        annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
    initial equation
      reluctance_e.Phi = Complex(0, 0);
      reluctance_m.Phi = Complex(0, 0);
    equation
      connect(sineVoltage_e.plug_n, converter_e.plug_n) annotation (Line(
          points={{-80,50},{20,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sineVoltage_e.plug_n, star_e.plug_p) annotation (Line(
          points={{-80,50},{-80,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sineVoltage_m.plug_n, star_m.plug_p) annotation (Line(
          points={{-80,-40},{-80,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(star_e.pin_n, ground_e.p) annotation (Line(
          points={{-80,20},{-80,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(star_m.pin_n, ground_m.p) annotation (Line(
          points={{-80,-70},{-80,-70}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sineVoltage_m.plug_n, converter_m.plug_n) annotation (Line(
          points={{-80,-40},{20,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(converter_e.port_p, reluctance_e.port_p) annotation (Line(
          points={{40,70},{80,70}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_e.port_n, reluctance_e.port_n) annotation (Line(
          points={{40,50},{80,50}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_e.port_n, mground_e.port_p) annotation (Line(
          points={{40,50},{40,20}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_m.port_n, reluctance_m.port_n) annotation (Line(
          points={{40,-40},{80,-40}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_m.port_p, loss_m.port_p) annotation (Line(
          points={{40,-20},{50,-20}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(loss_m.port_n, reluctance_m.port_p) annotation (Line(
          points={{70,-20},{80,-20}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_m.port_n, mground_m.port_p) annotation (Line(
          points={{40,-40},{40,-70}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(resistor_e.plug_p, sineVoltage_e.plug_p)
                                                     annotation (Line(
          points={{-70,70},{-80,70}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sineVoltage_m.plug_p, resistor_m.plug_p)
                                                     annotation (Line(
          points={{-80,-20},{-70,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor_e.plug_n, powerb_e.pc)
                                            annotation (Line(
          points={{-50,70},{-40,70}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(powerb_e.pv, powerb_e.pc) annotation (Line(
          points={{-30,80},{-40,80},{-40,70}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(powerb_e.nc, loss_e.plug_p) annotation (Line(
          points={{-20,70},{-10,70}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(powerb_e.nv, sineVoltage_e.plug_n) annotation (Line(
          points={{-30,60},{-30,50},{-80,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor_m.plug_n, powerb_m.pc)
                                            annotation (Line(
          points={{-50,-20},{-40,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(powerb_m.pc, powerb_m.pv) annotation (Line(
          points={{-40,-20},{-40,-10},{-30,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(powerb_m.nc, converter_m.plug_p) annotation (Line(
          points={{-20,-20},{20,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(powerb_m.nv, sineVoltage_m.plug_n) annotation (Line(
          points={{-30,-30},{-30,-40},{-80,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(loss_e.plug_n, sineVoltage_e.plug_n) annotation (Line(
          points={{-10,50},{-80,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(loss_e.plug_p, converter_e.plug_p) annotation (Line(
          points={{-10,70},{20,70}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=40, Interval=0.01), Documentation(info="<html>
<p>
In this example the eddy current losses are implemented in two different ways. Compare the loss dissipation <code>powerb_e.power</code> and <code>powerb_m.power</code> of the two models indicated by power meters.</p>
</html>"));
    end EddyCurrentLosses;

    model SinglePhaseInductance "Single phase inductance"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Frequency f = 1 "Supply frequency";
      parameter Modelica_SIunits.Voltage VRMS = 100 "RMS supply voltage";
      parameter Modelica_SIunits.Resistance R = 0.1 "Leader cable resistance";
      parameter Modelica_SIunits.Inductance L = 1 "Load inductance";
      parameter Real effectiveTurns = 5 "Effective number of turns";
      final parameter Modelica_SIunits.Reluctance R_m = effectiveTurns^2/L
        "Equivalent magnetic reluctance";
      Modelica_Electrical_Analog.Basic.Ground ground_e
        annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
      Modelica_Electrical_Analog.Basic.Ground ground_m
        annotation (Placement(transformation(extent={{-70,-80},{-50,-60}})));
      Modelica_Electrical_Analog.Sources.SineVoltage voltageSource_e(freqHz=f, V=
            sqrt(2)*VRMS,
        phase=Modelica_Constants.pi/2)
               annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,70})));
      Modelica_Electrical_Analog.Sources.SineVoltage voltageSource_m(        freqHz=
           f, V=sqrt(2)*VRMS,
        phase=Modelica_Constants.pi/2)
               annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-30})));
      Modelica_Electrical_Analog.Basic.Resistor resistor_e(R=R)
        annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
      Modelica_Electrical_Analog.Basic.Resistor resistor_m(R=R)
        annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
      Modelica_Electrical_Analog.Basic.Inductor inductor_e(L=L)
               annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,70})));
      Modelica_Magnetic_FundamentalWave.Components.SinglePhaseElectroMagneticConverter
        converter_m(effectiveTurns=effectiveTurns, orientation=0)
        annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
      Modelica_Magnetic_FundamentalWave.Components.Reluctance reluctance_m(R_m(d=R_m,
            q=R_m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-30})));
      Modelica_Magnetic_FundamentalWave.Components.Ground groundM_m
        annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
    initial equation
      resistor_e.i = 0;
      resistor_m.i = 0;
    equation
      connect(converter_m.port_p, reluctance_m.port_p)
        annotation (Line(
          points={{20,-20},{60,-20}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_m.port_n, reluctance_m.port_n)
        annotation (Line(
          points={{20,-40},{60,-40}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_m.port_n, groundM_m.port_p)
        annotation (Line(
          points={{20,-40},{20,-60}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(voltageSource_e.n, inductor_e.n)
                                           annotation (Line(
          points={{-60,60},{0,60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSource_e.n, ground_e.p)
                                         annotation (Line(
          points={{-60,60},{-60,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSource_m.n, converter_m.pin_n) annotation (Line(
          points={{-60,-40},{0,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSource_m.n, ground_m.p) annotation (Line(
          points={{-60,-40},{-60,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSource_e.p, resistor_e.p)
                                           annotation (Line(
          points={{-60,80},{-40,80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor_e.n, inductor_e.p)
                                      annotation (Line(
          points={{-20,80},{0,80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSource_m.p, resistor_m.p) annotation (Line(
          points={{-60,-20},{-40,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor_m.n, converter_m.pin_p) annotation (Line(
          points={{-20,-20},{0,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (          experiment(StopTime=100, Interval=0.01));
    end SinglePhaseInductance;

    model MultiPhaseInductance "Multi phase inductance"
      extends Modelica_Icons.Example;
      parameter Integer m = 3 "Number of phases";
      parameter Modelica_SIunits.Frequency f = 1 "Supply frequency";
      parameter Modelica_SIunits.Voltage VRMS = 100 "RMS supply voltage";
      parameter Modelica_SIunits.Resistance R = 0.1 "Leader cable resistance";
      parameter Real effectiveTurns = 5 "Effective number of turns";
      parameter Modelica_SIunits.Inductance L = 1 "Load inductance";
      final parameter Modelica_SIunits.Reluctance R_m = m*effectiveTurns^2/2/L
        "Equivalent magnetic reluctance";
      Modelica_Electrical_Analog.Basic.Ground ground_e
        annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
      Modelica_Electrical_Analog.Basic.Ground                      ground_m
        annotation (Placement(transformation(extent={{-70,-90},{-50,-70}})));
      Modelica_Electrical_MultiPhase.Basic.Star star_e(m=m)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,40})));
      Modelica_Electrical_MultiPhase.Basic.Star                 star_m(m=m)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-60})));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage voltageSource_e(
        m=m,
        freqHz=fill(f, m),
        V=fill(sqrt(2)*VRMS, m),
        phase=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
            m) + fill(Modelica_Constants.pi/2, m))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,70})));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage                   voltageSource_m(
        m=m,
        freqHz=fill(f, m),
        V=fill(sqrt(2)*VRMS, m),
        phase=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
            m) + fill(Modelica_Constants.pi/2, m))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-30})));
      Modelica_Electrical_MultiPhase.Basic.Resistor resistor_e(m=m, R=fill(
            R, m))
      annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
      Modelica_Electrical_MultiPhase.Basic.Resistor resistor_m(m=m, R=fill(
            R, m))
      annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
      Modelica_Electrical_MultiPhase.Basic.Inductor inductor_e(m=m, L=fill(L, m))
                        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,70})));
      Modelica_Magnetic_FundamentalWave.Components.MultiPhaseElectroMagneticConverter
        converter_m(
        m=m,
        orientation=
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
        effectiveTurns=fill(effectiveTurns, m))
        annotation (Placement(transformation(extent={{0,-40},{20,-20}})));

      Modelica_Magnetic_FundamentalWave.Components.Reluctance reluctance_m(R_m(d=R_m,
            q=R_m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-30})));
      Modelica_Magnetic_FundamentalWave.Components.Ground groundM_m
        annotation (Placement(transformation(extent={{10,-90},{30,-70}})));
    initial equation
      resistor_e.i = zeros(m);
      resistor_m.i[1:2] = zeros(2);
    equation
      connect(star_e.plug_p, voltageSource_e.plug_n)
                                                   annotation (Line(
          points={{-60,50},{-60,60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSource_e.plug_n, inductor_e.plug_n)
                                                      annotation (Line(
          points={{-60,60},{0,60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(converter_m.port_p, reluctance_m.port_p)
                                                     annotation (Line(
          points={{20,-20},{60,-20}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_m.port_n, reluctance_m.port_n)
                                                     annotation (Line(
          points={{20,-40},{60,-40}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(converter_m.port_n, groundM_m.port_p)
                                                  annotation (Line(
          points={{20,-40},{20,-70}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(voltageSource_m.plug_n, star_m.plug_p)
                                                   annotation (Line(
          points={{-60,-40},{-60,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSource_m.plug_n, converter_m.plug_n)
                                                        annotation (Line(
          points={{-60,-40},{0,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSource_e.plug_p, resistor_e.plug_p)
                                                    annotation (Line(
        points={{-60,80},{-40,80}},
        color={0,0,255},
        smooth=Smooth.None));
      connect(resistor_e.plug_n, inductor_e.plug_p)
                                              annotation (Line(
        points={{-20,80},{0,80}},
        color={0,0,255},
        smooth=Smooth.None));
      connect(voltageSource_m.plug_p, resistor_m.plug_p)
                                                     annotation (Line(
        points={{-60,-20},{-40,-20}},
        color={0,0,255},
        smooth=Smooth.None));
      connect(resistor_m.plug_n, converter_m.plug_p)
                                                 annotation (Line(
        points={{-20,-20},{0,-20}},
        color={0,0,255},
        smooth=Smooth.None));
      connect(star_e.pin_n, ground_e.p)
                                    annotation (Line(
          points={{-60,30},{-60,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(star_m.pin_n, ground_m.p) annotation (Line(
          points={{-60,-70},{-60,-70}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (          experiment(StopTime=100, Interval=0.01));
    end MultiPhaseInductance;
  end Components;

  package BasicMachines "Examples of machines of the FundamentalWave library"
    extends Modelica_Icons.ExamplesPackage;
    model AIMC_DOL
      "Direct on line start of asynchronous induction machine with squirrel cage"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of stator phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tOn=0.1 "Start time of machine";
      parameter Modelica_SIunits.Torque T_Load=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity w_Load(displayUnit="1/min")=
           1440.45*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
      parameter Integer p=2 "Number of pole pairs";
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2.0/3.0)*VsNominal, m)) annotation (Placement(
            transformation(
            origin={-30,90},
            extent={{10,-10},{-10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(
            origin={0,60},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.BooleanStep booleanStep[m](each startTime=tOn,
          each startValue=false) annotation (Placement(transformation(extent={{
                -60,50},{-40,70}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentRMSsensorM
        annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor
        currentRMSsensorE annotation (Placement(transformation(
            origin={-60,30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
          terminalConnection="D") annotation (Placement(transformation(extent=
               {{-10,-10},{10,10}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxE(
          terminalConnection="D") annotation (Placement(transformation(extent=
               {{-10,-70},{10,-50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimcM(
        Jr=aimcData.Jr,
        Js=aimcData.Js,
        p=aimcData.p,
        fsNominal=aimcData.fsNominal,
        Rs=aimcData.Rs,
        TsRef=aimcData.TsRef,
        alpha20s(displayUnit="1/K") = aimcData.alpha20s,
        Lssigma=aimcData.Lssigma,
        Lszero=aimcData.Lszero,
        frictionParameters=aimcData.frictionParameters,
        statorCoreParameters=aimcData.statorCoreParameters,
        strayLoadParameters=aimcData.strayLoadParameters,
        Lm=aimcData.Lm,
        Lrsigma=aimcData.Lrsigma,
        Rr=aimcData.Rr,
        TrRef=aimcData.TrRef,
        alpha20r(displayUnit="1/K") = aimcData.alpha20r,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        TsOperational=293.15,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-10,
                -30},{10,-10}}, rotation=0)));
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimcE(
        p=aimcData.p,
        fsNominal=aimcData.fsNominal,
        Rs=aimcData.Rs,
        TsRef=aimcData.TsRef,
        alpha20s(displayUnit="1/K") = aimcData.alpha20s,
        Lszero=aimcData.Lszero,
        Lssigma=aimcData.Lssigma,
        Jr=aimcData.Jr,
        Js=aimcData.Js,
        frictionParameters=aimcData.frictionParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        statorCoreParameters=aimcData.statorCoreParameters,
        strayLoadParameters=aimcData.strayLoadParameters,
        Lm=aimcData.Lm,
        Lrsigma=aimcData.Lrsigma,
        Rr=aimcData.Rr,
        alpha20r(displayUnit="1/K") = aimcData.alpha20r,
        TsOperational=293.15,
        TrRef=aimcData.TrRef,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-10,
                -90},{10,-70}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=J_Load)
        annotation (Placement(transformation(extent={{50,-30},{70,-10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaE(J=J_Load)
        annotation (Placement(transformation(extent={{50,-90},{70,-70}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorqueM(
        w_nominal=w_Load,
        tau_nominal=-T_Load,
        TorqueDirection=false,
        useSupport=false) annotation (Placement(transformation(extent={{100,-30},
                {80,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorqueE(
        w_nominal=w_Load,
        tau_nominal=-T_Load,
        TorqueDirection=false,
        useSupport=false) annotation (Placement(transformation(extent={{100,-90},
                {80,-70}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData
        annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={0,10})));
    initial equation
      aimcE.is = zeros(m);
      aimcE.ir = zeros(2);
      aimcM.is = zeros(m);
      aimcM.rotorCage.electroMagneticConverter.Phi = Complex(0,0);

    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(sineVoltage.plug_n, star.plug_p) annotation (Line(points={{-40,
              90},{-40,90},{-50,90}}, color={0,0,255}));
      connect(aimcM.flange, loadInertiaM.flange_a) annotation (Line(points={{
              10,-20},{10,-20},{50,-20}}, color={0,0,0}));
      connect(loadInertiaM.flange_b, quadraticLoadTorqueM.flange)
        annotation (Line(points={{70,-20},{80,-20}}, color={0,0,0}));
      connect(terminalBoxM.plug_sn, aimcM.plug_sn)
        annotation (Line(points={{-6,-10},{-6,-10}}, color={0,0,255}));
      connect(terminalBoxM.plug_sp, aimcM.plug_sp)
        annotation (Line(points={{6,-10},{6,-10}}, color={0,0,255}));
      connect(aimcE.flange, loadInertiaE.flange_a) annotation (Line(points={{
              10,-80},{10,-80},{50,-80}}, color={0,0,0}));
      connect(loadInertiaE.flange_b, quadraticLoadTorqueE.flange)
        annotation (Line(points={{70,-80},{80,-80}}, color={0,0,0}));
      connect(terminalBoxE.plug_sn, aimcE.plug_sn)
        annotation (Line(points={{-6,-70},{-6,-70}}, color={0,0,255}));
      connect(terminalBoxE.plug_sp, aimcE.plug_sp)
        annotation (Line(points={{6,-70},{6,-70}}, color={0,0,255}));
      connect(currentRMSsensorE.plug_n, terminalBoxE.plugSupply) annotation (
          Line(points={{-60,20},{-60,-60},{0,-60},{0,-68}},
            color={0,0,255}));
      connect(sineVoltage.plug_p, idealCloser.plug_p) annotation (Line(
          points={{-20,90},{0,90},{0,70}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCloser.plug_n, currentRMSsensorM.plug_p) annotation (Line(
          points={{0,50},{0,47.5},{9.992e-16,47.5},{
              9.992e-16,45},{0,45},{0,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(booleanStep.y, idealCloser.control) annotation (Line(
          points={{-39,60},{-7,60}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensorE.plug_p, idealCloser.plug_n) annotation (Line(
          points={{-60,40},{0,40},{0,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensorM.plug_n, currentQuasiRMSSensor.plug_p)
        annotation (Line(
          points={{0,20},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBoxM.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{0,-8},{0,0}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        experiment(
          StopTime=1.5,
          Interval=0.0002,
          Tolerance=1e-05),
        Documentation(info="<HTML>
<h4>Direct on line (DOL) starting of an asynchronous induction machine with squirrel cage</h4>
<p>
At start time tStart three phase voltage is supplied to the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage\">asynchronous induction machine with squirrel cage</a>.
The machine starts from standstill, accelerating
inertias against load torque quadratic dependent on speed, finally reaching nominal speed.</p>

<p>
Simulate for 1.5 seconds and plot (versus time):
</p>

<ul>
<li><code>currentRMSsensorM|E.I</code>: equivalent RMS stator current</li>
<li><code>aimcM|E.wMechanical</code>: machine speed</li>
<li><code>aimcM|E.tauElectrical</code>: machine torque</li>
</ul>
</HTML>"));
    end AIMC_DOL;

    model AIMC_DOL_MultiPhase
      "Direct on line start of multi phase asynchronous induction machine with squirrel cage"
      extends Modelica_Icons.Example;
      constant Integer m3=3 "Number of stator phases of threephase system";
      parameter Integer m=5 "Number of stator phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tOn=0.1 "Start time of machine";
      parameter Modelica_SIunits.Torque T_Load=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity w_Load(displayUnit="1/min")=
           1440.45*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
      parameter Integer p=2 "Number of pole pairs";
      Modelica_Electrical_Analog.Basic.Ground groundM
                                                     annotation (Placement(
            transformation(
            origin={-90,50},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m)
                                                                annotation (
          Placement(transformation(extent={{-70,62},{-90,82}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltageM(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2.0)*VsNominal, m),
        phase=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
            m)) annotation (Placement(transformation(
            origin={-50,72},
            extent={{10,-10},{-10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloserM(
        final m=m,
        Ron=fill(1e-5*m/m3, m),
        Goff=fill(1e-5*m3/m, m)) annotation (Placement(transformation(
            origin={-20,72},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Blocks.Sources.BooleanStep booleanStepM[m](each startTime=tOn,
          each startValue=false) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-20,40})));
      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor currentRMSsensorM(m=m)
        annotation (Placement(transformation(
            origin={10,72},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(m=m,
          terminalConnection="Y") annotation (Placement(transformation(extent=
               {{20,60},{40,80}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimcM(
        Jr=aimcData.Jr,
        Js=aimcData.Js,
        p=aimcData.p,
        fsNominal=aimcData.fsNominal,
        TsRef=aimcData.TsRef,
        alpha20s(displayUnit="1/K") = aimcData.alpha20s,
        frictionParameters=aimcData.frictionParameters,
        statorCoreParameters=aimcData.statorCoreParameters,
        strayLoadParameters=aimcData.strayLoadParameters,
        TrRef=aimcData.TrRef,
        alpha20r(displayUnit="1/K") = aimcData.alpha20r,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        m=m,
        Rs=aimcData.Rs*m/3,
        Lssigma=aimcData.Lssigma*m/3,
        Lszero=aimcData.Lszero*m/3,
        Lm=aimcData.Lm*m/3,
        TsOperational=293.15,
        Lrsigma=aimcData.Lrsigma*m/3,
        Rr=aimcData.Rr*m/3,
        TrOperational=293.15) annotation (Placement(transformation(extent={{
                20,40},{40,60}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=J_Load)
        annotation (Placement(transformation(extent={{50,40},{70,60}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorqueM(
        w_nominal=w_Load,
        tau_nominal=-T_Load,
        TorqueDirection=false,
        useSupport=false) annotation (Placement(transformation(extent={{100,
                40},{80,60}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData annotation (Placement(transformation(extent={{-100,-100},{-80,
                -80}})));
      Modelica_Electrical_Analog.Basic.Ground ground3 annotation (Placement(
            transformation(
            origin={-90,-52},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star star3(final m=m3)
                                                                 annotation (
          Placement(transformation(extent={{-70,-40},{-90,-20}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage3(
        final m=m3,
        V=fill(sqrt(2.0)*VsNominal, m3),
        phase=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m3),
        freqHz=fill(fNominal, m3))      annotation (Placement(transformation(
            origin={-50,-30},
            extent={{10,-10},{-10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser3(
        final m=m3,
        Ron=fill(1e-5, m3),
        Goff=fill(1e-5, m3)) annotation (Placement(transformation(
            origin={-20,-30},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Blocks.Sources.BooleanStep booleanStep3[m3](each startTime=tOn,
          each startValue=false) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-20,-62})));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentRMSsensor3(m=3)
        annotation (Placement(transformation(
            origin={10,-30},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox3(
          terminalConnection="Y", m=m3)
                                       annotation (Placement(transformation(
              extent={{20,-42},{40,-22}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimc3(
        Jr=aimcData.Jr,
        Js=aimcData.Js,
        p=aimcData.p,
        fsNominal=aimcData.fsNominal,
        Rs=aimcData.Rs,
        TsRef=aimcData.TsRef,
        alpha20s(displayUnit="1/K") = aimcData.alpha20s,
        Lssigma=aimcData.Lssigma,
        Lszero=aimcData.Lszero,
        frictionParameters=aimcData.frictionParameters,
        statorCoreParameters=aimcData.statorCoreParameters,
        strayLoadParameters=aimcData.strayLoadParameters,
        Lm=aimcData.Lm,
        Lrsigma=aimcData.Lrsigma,
        Rr=aimcData.Rr,
        TrRef=aimcData.TrRef,
        alpha20r(displayUnit="1/K") = aimcData.alpha20r,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        m=3,
        TsOperational=293.15,
        TrOperational=293.15) annotation (Placement(transformation(extent={{
                20,-62},{40,-42}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia3(J=J_Load)
        annotation (Placement(transformation(extent={{50,-62},{70,-42}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque quadraticLoadTorque3(
        w_nominal=w_Load,
        tau_nominal=-T_Load,
        TorqueDirection=false,
        useSupport=false) annotation (Placement(transformation(extent={{100,-62},
                {80,-42}}, rotation=0)));
      Modelica_Blocks.Math.Gain gain(k=(m/m3)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={10,32})));
      Modelica_Blocks.Math.Feedback feedback
        annotation (Placement(transformation(extent={{80,10},{100,-10}})));
    initial equation
      aimc3.is[1:2] = zeros(2);
      aimc3.ir[1:2] = zeros(2);
      aimcM.is[1:2] = zeros(2);
      aimcM.rotorCage.electroMagneticConverter.Phi = Complex(0,0);

    equation
      connect(starM.pin_n, groundM.p)
                                    annotation (Line(points={{-90,72},{-90,70},
              {-90,60}}, color={0,0,255}));
      connect(sineVoltageM.plug_n, starM.plug_p)
                                               annotation (Line(points={{-60,
              72},{-60,72},{-70,72}}, color={0,0,255}));
      connect(aimcM.flange, loadInertiaM.flange_a)
        annotation (Line(points={{40,50},{40,50},{50,50}}, color={0,0,0}));
      connect(terminalBoxM.plug_sn, aimcM.plug_sn)
        annotation (Line(points={{24,60},{24,60}}, color={0,0,255}));
      connect(terminalBoxM.plug_sp, aimcM.plug_sp)
        annotation (Line(points={{36,60},{36,60}}, color={0,0,255}));
      connect(sineVoltageM.plug_p, idealCloserM.plug_p)
                                                      annotation (Line(
          points={{-40,72},{-30,72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCloserM.plug_n, currentRMSsensorM.plug_p)
                                                            annotation (Line(
          points={{-10,72},{0,72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(booleanStepM.y, idealCloserM.control)
                                                  annotation (Line(
          points={{-20,51},{-20,65}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(star3.pin_n, ground3.p)
        annotation (Line(points={{-90,-30},{-90,-42}}, color={0,0,255}));
      connect(sineVoltage3.plug_n, star3.plug_p) annotation (Line(points={{-60,
              -30},{-60,-30},{-70,-30}}, color={0,0,255}));
      connect(aimc3.flange, loadInertia3.flange_a)   annotation (Line(points=
              {{40,-52},{40,-52},{50,-52}}, color={0,0,0}));
      connect(loadInertia3.flange_b, quadraticLoadTorque3.flange)
        annotation (Line(points={{70,-52},{74,-52},{76,-52},{80,-52}}, color=
              {0,0,0}));
      connect(terminalBox3.plug_sn, aimc3.plug_sn)
        annotation (Line(points={{24,-42},{24,-42}}, color={0,0,255}));
      connect(terminalBox3.plug_sp, aimc3.plug_sp)
        annotation (Line(points={{36,-42},{36,-42}}, color={0,0,255}));
      connect(terminalBox3.plugSupply, currentRMSsensor3.plug_n)
        annotation (Line(points={{30,-40},{30,-30},{20,-30}}, color={0,0,255}));
      connect(sineVoltage3.plug_p, idealCloser3.plug_p) annotation (Line(
          points={{-40,-30},{-30,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCloser3.plug_n, currentRMSsensor3.plug_p)  annotation (
          Line(
          points={{-10,-30},{0,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(booleanStep3.y, idealCloser3.control) annotation (Line(
          points={{-20,-51},{-20,-37}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensorM.I, gain.u) annotation (Line(
          points={{10,62},{10,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(loadInertiaM.flange_b, quadraticLoadTorqueM.flange) annotation (
         Line(
          points={{70,50},{80,50}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(currentRMSsensor3.I, feedback.u1)  annotation (Line(
          points={{10,-19},{10,0},{82,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.u2, gain.y) annotation (Line(
          points={{90,8},{90,16},{10,16},{10,21}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(currentRMSsensorM.plug_n, terminalBoxM.plugSupply) annotation (
          Line(
          points={{20,72},{30,72},{30,62}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        experiment(
          StopTime=1.5,
          Interval=0.0002,
          Tolerance=1e-05),
        Documentation(info="<HTML>
<h4>Direct on line (DOL) starting of an asynchronous induction machine with squirrel cage</h4>
<p>
At start time tStart voltages are supplied to the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage\">multi phase asynchronous induction machines with squirrel cage</a>.
The machines starts from standstill, accelerating
inertias against load torque quadratic dependent on speed, finally reaching nominal speed. Two equivalent machines with different numbers of phases are compared and their equal behavior is demonstrated.</p>

<p>
Simulate for 1.5 seconds and plot (versus time):
</p>

<ul>
<li><code>aimcM|M3.tauElectrical</code>: machine torque</li>
<li><code>aimsM/M3.wMechanical</code>: machine speed</li>
<li><code>feedback.y</code>: zero since difference of three phase current phasor and scaled multi phase current phasor are equal</li>
</ul>
</HTML>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Rectangle(
                    extent={{-100,100},{100,20}},
                    lineColor={0,0,255},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash),Rectangle(
                    extent={{-100,-10},{100,-80}},
                    lineColor={0,0,255},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash),Text(
                    extent={{20,88},{100,80}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textString="%m phase machine
",                  textStyle={TextStyle.Bold}),Text(
                    extent={{20,-22},{100,-30}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textString="3 phase machine
",                  textStyle={TextStyle.Bold})}));
    end AIMC_DOL_MultiPhase;

    model AIMS_Start
      "Starting of asynchronous induction machine with slip rings"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tOn=0.1 "Start time of machine";
      parameter Modelica_SIunits.Resistance RStart=0.16/aimsData.turnsRatio^2
        "Starting resistance";
      parameter Modelica_SIunits.Time tRheostat=1.0
        "Time of shortening the rheostat";
      parameter Modelica_SIunits.Torque T_Load=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity w_Load(displayUnit="1/min")=
           Modelica_SIunits.Conversions.from_rpm(1440.45) "Nominal load speed";
      parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        V=fill(sqrt(2.0/3.0)*VsNominal, m),
        freqHz=fill(fNominal, m)) annotation (Placement(transformation(
            origin={-30,90},
            extent={{10,-10},{-10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(
            origin={0,60},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.BooleanStep booleanStep[m](each startTime=tOn)
        annotation (Placement(transformation(extent={{-60,50},{-40,70}},
              rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor currentRMSsensorM
        annotation (Placement(transformation(
            origin={0,20},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor
        currentRMSsensorE annotation (Placement(transformation(
            origin={-60,20},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
          terminalConnection="D") annotation (Placement(transformation(extent=
               {{-10,-10},{10,10}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxE(
          terminalConnection="D") annotation (Placement(transformation(extent=
               {{-10,-70},{10,-50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing
        aimsM(
        Jr=aimsData.Jr,
        Js=aimsData.Js,
        p=aimsData.p,
        fsNominal=aimsData.fsNominal,
        Rs=aimsData.Rs,
        TsRef=aimsData.TsRef,
        alpha20s(displayUnit="1/K") = aimsData.alpha20s,
        Lssigma=aimsData.Lssigma,
        Lszero=aimsData.Lszero,
        frictionParameters=aimsData.frictionParameters,
        statorCoreParameters=aimsData.statorCoreParameters,
        strayLoadParameters=aimsData.strayLoadParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        Lm=aimsData.Lm,
        Lrsigma=aimsData.Lrsigma,
        Lrzero=aimsData.Lrzero,
        Rr=aimsData.Rr,
        TrRef=aimsData.TrRef,
        alpha20r(displayUnit="1/K") = aimsData.alpha20r,
        useTurnsRatio=aimsData.useTurnsRatio,
        VsNominal=aimsData.VsNominal,
        VrLockedRotor=aimsData.VrLockedRotor,
        rotorCoreParameters=aimsData.rotorCoreParameters,
        TurnsRatio=aimsData.turnsRatio,
        TsOperational=293.15,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-10,
                -30},{10,-10}}, rotation=0)));
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing
        aimsE(
        p=aimsData.p,
        fsNominal=aimsData.fsNominal,
        Rs=aimsData.Rs,
        TsRef=aimsData.TsRef,
        alpha20s(displayUnit="1/K") = aimsData.alpha20s,
        Lszero=aimsData.Lszero,
        Lssigma=aimsData.Lssigma,
        Jr=aimsData.Jr,
        Js=aimsData.Js,
        frictionParameters=aimsData.frictionParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        statorCoreParameters=aimsData.statorCoreParameters,
        strayLoadParameters=aimsData.strayLoadParameters,
        Lm=aimsData.Lm,
        Lrsigma=aimsData.Lrsigma,
        Lrzero=aimsData.Lrzero,
        Rr=aimsData.Rr,
        TrRef=aimsData.TrRef,
        alpha20r(displayUnit="1/K") = aimsData.alpha20r,
        useTurnsRatio=aimsData.useTurnsRatio,
        VsNominal=aimsData.VsNominal,
        VrLockedRotor=aimsData.VrLockedRotor,
        rotorCoreParameters=aimsData.rotorCoreParameters,
        TsOperational=566.3,
        turnsRatio=aimsData.turnsRatio,
        TrOperational=566.3) annotation (Placement(transformation(extent={{-10,
                -90},{10,-70}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.SwitchedRheostat rheostatM(
        RStart=RStart,
        tStart=tRheostat,
        m=m) annotation (Placement(transformation(extent={{-40,-30},{-20,-10}},
              rotation=0)));
      Modelica_Electrical_Machines.Utilities.SwitchedRheostat rheostatE(
        RStart=RStart,
        tStart=tRheostat,
        m=m) annotation (Placement(transformation(extent={{-40,-90},{-20,-70}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=J_Load)
        annotation (Placement(transformation(extent={{50,-30},{70,-10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaE(J=J_Load)
        annotation (Placement(transformation(extent={{50,-90},{70,-70}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorqueM(
        tau_nominal=-T_Load,
        TorqueDirection=false,
        useSupport=false,
        w_nominal=w_Load) annotation (Placement(transformation(extent={{100,-30},
                {80,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorqueE(
        tau_nominal=-T_Load,
        TorqueDirection=false,
        useSupport=false,
        w_nominal=w_Load) annotation (Placement(transformation(extent={{100,-90},
                {80,-70}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SlipRingData
        aimsData
        annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
    initial equation
      aimsE.is = zeros(3);
      aimsE.ir = zeros(3);
      aimsM.is = zeros(3);
      aimsM.ir = zeros(3);
    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(sineVoltage.plug_n, star.plug_p) annotation (Line(points={{-40,
              90},{-40,90},{-50,90}}, color={0,0,255}));
      connect(loadInertiaE.flange_b, quadraticLoadTorqueE.flange)
        annotation (Line(points={{70,-80},{80,-80}}, color={0,0,0}));
      connect(aimsE.flange, loadInertiaE.flange_a)
        annotation (Line(points={{10,-80},{50,-80}}, color={0,0,0}));
      connect(booleanStep.y, idealCloser.control)
        annotation (Line(points={{-39,60},{-7,60}}, color={255,0,255}));
      connect(terminalBoxE.plug_sn, aimsE.plug_sn)
        annotation (Line(points={{-6,-70},{-6,-70}}, color={0,0,255}));
      connect(terminalBoxE.plug_sp, aimsE.plug_sp)
        annotation (Line(points={{6,-70},{6,-70}}, color={0,0,255}));
      connect(rheostatE.plug_p, aimsE.plug_rp) annotation (Line(points={{-20,
              -74},{-18,-74},{-10,-74}}, color={0,0,255}));
      connect(rheostatE.plug_n, aimsE.plug_rn) annotation (Line(points={{-20,
              -86},{-18,-86},{-10,-86}}, color={0,0,255}));
      connect(loadInertiaM.flange_b, quadraticLoadTorqueM.flange) annotation (
         Line(points={{70,-20},{70,-20},{80,-20}}, color={0,0,0}));
      connect(aimsM.flange, loadInertiaM.flange_a) annotation (Line(points={{
              10,-20},{10,-20},{50,-20}}, color={0,0,0}));
      connect(terminalBoxM.plug_sp, aimsM.plug_sp)
        annotation (Line(points={{6,-10},{6,-10}}, color={0,0,255}));
      connect(terminalBoxM.plug_sn, aimsM.plug_sn)
        annotation (Line(points={{-6,-10},{-6,-10}}, color={0,0,255}));
      connect(currentRMSsensorM.plug_n, terminalBoxM.plugSupply) annotation (
          Line(
          points={{0,10},{0,5.5},{0,5.5},{0,
              1},{0,1},{0,-8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(rheostatM.plug_p, aimsM.plug_rp) annotation (Line(
          points={{-20,-14},{-10,-14}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(rheostatM.plug_n, aimsM.plug_rn) annotation (Line(
          points={{-20,-26},{-10,-26}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensorE.plug_n, terminalBoxE.plugSupply) annotation (
          Line(
          points={{-60,10},{-60,-60},{0,-60},{0,-68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCloser.plug_n, currentRMSsensorM.plug_p) annotation (Line(
          points={{0,50},{0,45},{9.992e-16,45},{
              9.992e-16,40},{0,40},{0,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensorE.plug_p, idealCloser.plug_n) annotation (Line(
          points={{-60,30},{0,30},{0,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCloser.plug_p, sineVoltage.plug_p) annotation (Line(
          points={{0,70},{0,90},{-20,90}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(
          StopTime=1.5,
          Interval=0.001,
          Tolerance=1e-05), Documentation(info="<HTML>
<h4>Starting of an asynchronous induction machine with slipring rotor resistance starting</h4>
<p>
At start time <code>tOn</code> three phase voltage is supplied to the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing\">asynchronous induction machine with sliprings</a>.
The machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed,
using a starting resistance. At time tRheostat external rotor resistance is shortened, finally reaching nominal speed.</p>

<p>
Simulate for 1.5 seconds and plot (versus time):
</p>

<ul>
<li><code>currentRMSsensorM|E.I</code>: equivalent RMS stator current</li>
<li><code>aimsM/E.wMechanical</code>: machine speed</li>
<li><code>aimsM|E.tauElectrical</code>: machine torque</li>
</ul>
</HTML>"));
    end AIMS_Start;

    model AIMS_Start_MultiPhase
      "Starting of multi phase asynchronous induction machine with slip rings"
      extends Modelica_Icons.Example;
      constant Integer m3=3 "Number of stator phases of threephase system";
      parameter Integer m=5 "Number of stator phases";
      parameter Integer mr=5 "Number of rotor phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tOn=0.1 "Start time of machine";
      parameter Modelica_SIunits.Resistance RStart=0.16/aimsData.turnsRatio^2
        "Starting resistance";
      parameter Modelica_SIunits.Time tRheostat=1.0
        "Time of shortening the rheostat";
      parameter Modelica_SIunits.Torque T_Load=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity w_Load(displayUnit="1/min")=
           Modelica_SIunits.Conversions.from_rpm(1440.45) "Nominal load speed";
      parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(m=m,
          terminalConnection="Y") annotation (Placement(transformation(extent=
               {{20,50},{40,70}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox3(
          terminalConnection="Y", m=m3)
                                  annotation (Placement(transformation(extent=
               {{20,-50},{40,-30}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing
        aimsM(
        Jr=aimsData.Jr,
        Js=aimsData.Js,
        p=aimsData.p,
        fsNominal=aimsData.fsNominal,
        TsRef=aimsData.TsRef,
        alpha20s(displayUnit="1/K") = aimsData.alpha20s,
        frictionParameters=aimsData.frictionParameters,
        statorCoreParameters=aimsData.statorCoreParameters,
        strayLoadParameters=aimsData.strayLoadParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        TrRef=aimsData.TrRef,
        alpha20r(displayUnit="1/K") = aimsData.alpha20r,
        useTurnsRatio=aimsData.useTurnsRatio,
        VsNominal=aimsData.VsNominal,
        VrLockedRotor=aimsData.VrLockedRotor,
        rotorCoreParameters=aimsData.rotorCoreParameters,
        TurnsRatio=aimsData.turnsRatio,
        mr=mr,
        m=m,
        TsOperational=293.15,
        Rs=aimsData.Rs*m/3,
        Lssigma=aimsData.Lssigma*m/3,
        Lszero=aimsData.Lszero*m/3,
        Lm=aimsData.Lm*m/3,
        Lrsigma=aimsData.Lrsigma*mr/3,
        Lrzero=aimsData.Lrzero*mr/3,
        Rr=aimsData.Rr*mr/3,
        TrOperational=293.15) annotation (Placement(transformation(extent={{
                20,30},{40,50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing
        aims3(
        p=aimsData.p,
        fsNominal=aimsData.fsNominal,
        Rs=aimsData.Rs,
        TsRef=aimsData.TsRef,
        alpha20s(displayUnit="1/K") = aimsData.alpha20s,
        Lszero=aimsData.Lszero,
        Lssigma=aimsData.Lssigma,
        Jr=aimsData.Jr,
        Js=aimsData.Js,
        frictionParameters=aimsData.frictionParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        statorCoreParameters=aimsData.statorCoreParameters,
        strayLoadParameters=aimsData.strayLoadParameters,
        Lm=aimsData.Lm,
        Lrsigma=aimsData.Lrsigma,
        Lrzero=aimsData.Lrzero,
        Rr=aimsData.Rr,
        TrRef=aimsData.TrRef,
        alpha20r(displayUnit="1/K") = aimsData.alpha20r,
        useTurnsRatio=aimsData.useTurnsRatio,
        VsNominal=aimsData.VsNominal,
        VrLockedRotor=aimsData.VrLockedRotor,
        rotorCoreParameters=aimsData.rotorCoreParameters,
        m=m3,
        TsOperational=566.3,
        TrOperational=566.3,
        TurnsRatio=aimsData.turnsRatio) annotation (Placement(transformation(
              extent={{20,-70},{40,-50}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.SwitchedRheostat rheostatM(
        tStart=tRheostat,
        m=mr,
        RStart=RStart*mr/m3) annotation (Placement(transformation(extent={{-10,
                30},{10,50}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.SwitchedRheostat rheostat3(
        RStart=RStart,
        tStart=tRheostat,
        m=m3) annotation (Placement(transformation(extent={{-10,-70},{10,-50}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=J_Load)
        annotation (Placement(transformation(extent={{50,30},{70,50}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia3(J=J_Load)
        annotation (Placement(transformation(extent={{50,-70},{70,-50}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorqueM(
        tau_nominal=-T_Load,
        TorqueDirection=false,
        useSupport=false,
        w_nominal=w_Load) annotation (Placement(transformation(extent={{100,
                30},{80,50}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque quadraticLoadTorque3(
        tau_nominal=-T_Load,
        TorqueDirection=false,
        useSupport=false,
        w_nominal=w_Load) annotation (Placement(transformation(extent={{100,-70},
                {80,-50}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SlipRingData
        aimsData annotation (Placement(transformation(extent={{-100,-100},{-80,
                -80}})));
      Modelica_Electrical_Analog.Basic.Ground groundM annotation (Placement(
            transformation(
            origin={-90,50},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m) annotation (
          Placement(transformation(extent={{-70,62},{-90,82}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltageM(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2.0)*VsNominal, m),
        phase=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
            m)) annotation (Placement(transformation(
            origin={-50,72},
            extent={{10,-10},{-10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloserM(
        final m=m,
        Ron=fill(1e-5*m/3, m),
        Goff=fill(1e-5*m3/m, m)) annotation (Placement(transformation(
            origin={-20,72},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Blocks.Sources.BooleanStep booleanStepM[m](each startTime=tOn,
          each startValue=false) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-40,40})));
      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
                                                        currentRMSsensorM(m=m)
        annotation (Placement(transformation(
            origin={10,72},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground3 annotation (Placement(
            transformation(
            origin={-90,-52},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star star3(final m=m3) annotation (
         Placement(transformation(extent={{-70,-40},{-90,-20}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage3(
        final m=m3,
        V=fill(sqrt(2.0)*VsNominal, m3),
        phase=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
            m3),
        freqHz=fill(fNominal, m3)) annotation (Placement(transformation(
            origin={-50,-30},
            extent={{10,-10},{-10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser3(
        final m=m3,
        Ron=fill(1e-5, m3),
        Goff=fill(1e-5, m3)) annotation (Placement(transformation(
            origin={-20,-30},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Blocks.Sources.BooleanStep booleanStep3[m3](each startTime=tOn,
          each startValue=false) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-40,-60})));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentRMSsensor3(m=3)
                                annotation (Placement(transformation(
            origin={10,-30},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Blocks.Math.Gain gain(k=(m/m3))
        annotation (Placement(transformation(extent={{40,80},{60,100}})));
      Modelica_Blocks.Math.Feedback feedback
        annotation (Placement(transformation(extent={{80,10},{100,-10}})));
    initial equation
      aims3.is[1:2] = zeros(2);
      aims3.ir[1:3] = zeros(3);
      aimsM.is[1:2] = zeros(2);
      aimsM.ir[1:mr - 2] = zeros(mr - 2);
    equation
      connect(loadInertia3.flange_b, quadraticLoadTorque3.flange)
        annotation (Line(points={{70,-60},{76,-60},{80,-60}}, color={0,0,0}));
      connect(aims3.flange, loadInertia3.flange_a)   annotation (Line(points=
              {{40,-60},{40,-60},{50,-60}}, color={0,0,0}));
      connect(terminalBox3.plug_sn, aims3.plug_sn)
        annotation (Line(points={{24,-50},{24,-50}}, color={0,0,255}));
      connect(terminalBox3.plug_sp, aims3.plug_sp)
        annotation (Line(points={{36,-50},{36,-50}}, color={0,0,255}));
      connect(rheostat3.plug_p, aims3.plug_rp)   annotation (Line(points={{10,
              -54},{10,-54},{20,-54}}, color={0,0,255}));
      connect(rheostat3.plug_n, aims3.plug_rn)   annotation (Line(points={{10,
              -66},{10,-66},{20,-66}}, color={0,0,255}));
      connect(loadInertiaM.flange_b, quadraticLoadTorqueM.flange)
        annotation (Line(points={{70,40},{70,40},{80,40}}, color={0,0,0}));
      connect(aimsM.flange, loadInertiaM.flange_a)
        annotation (Line(points={{40,40},{40,40},{50,40}}, color={0,0,0}));
      connect(terminalBoxM.plug_sp, aimsM.plug_sp)
        annotation (Line(points={{36,50},{36,50}}, color={0,0,255}));
      connect(terminalBoxM.plug_sn, aimsM.plug_sn)
        annotation (Line(points={{24,50},{24,50}}, color={0,0,255}));
      connect(rheostatM.plug_p, aimsM.plug_rp) annotation (Line(
          points={{10,46},{20,46}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(rheostatM.plug_n, aimsM.plug_rn) annotation (Line(
          points={{10,34},{20,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(starM.pin_n, groundM.p)
                                    annotation (Line(points={{-90,72},{-90,72},
              {-90,60}}, color={0,0,255}));
      connect(sineVoltageM.plug_n, starM.plug_p)
                                               annotation (Line(points={{-60,
              72},{-60,72},{-70,72}}, color={0,0,255}));
      connect(sineVoltageM.plug_p, idealCloserM.plug_p)
                                                      annotation (Line(
          points={{-40,72},{-30,72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCloserM.plug_n, currentRMSsensorM.plug_p)
                                                            annotation (Line(
          points={{-10,72},{0,72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(booleanStepM.y, idealCloserM.control)
                                                  annotation (Line(
          points={{-29,40},{-20,40},{-20,65}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(star3.pin_n, ground3.p)
        annotation (Line(points={{-90,-30},{-90,-42}}, color={0,0,255}));
      connect(sineVoltage3.plug_n, star3.plug_p) annotation (Line(points={{-60,
              -30},{-60,-30},{-70,-30}}, color={0,0,255}));
      connect(sineVoltage3.plug_p, idealCloser3.plug_p) annotation (Line(
          points={{-40,-30},{-30,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCloser3.plug_n, currentRMSsensor3.plug_p)  annotation (
          Line(
          points={{-10,-30},{0,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(booleanStep3.y, idealCloser3.control) annotation (Line(
          points={{-29,-60},{-20,-60},{-20,-37}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensorM.I, gain.u) annotation (Line(
          points={{10,82},{10,90},{38,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(currentRMSsensor3.plug_n, terminalBox3.plugSupply)  annotation (
         Line(
          points={{20,-30},{30,-30},{30,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensorM.plug_n, terminalBoxM.plugSupply) annotation (
          Line(
          points={{20,72},{30,72},{30,52}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensor3.I, feedback.u1)  annotation (Line(
          points={{10,-19},{10,0},{82,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.u2, gain.y) annotation (Line(
          points={{90,8},{90,16},{100,16},{100,90},{61,90}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        experiment(
          StopTime=1.5,
          Interval=0.001,
          Tolerance=1e-05),
        Documentation(info="<HTML>
<h4>Starting of an asynchronous induction machine with slipring rotor resistance starting</h4>
<p>
At start time <code>tOn</code> voltages are supplied to the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing\">asynchronous induction machines with sliprings</a>.
The two machine start from standstill, accelerating inertias against load torque quadratic dependent on speed,
using a starting resistance. At time tRheostat external rotor resistance is shortened, finally reaching nominal speed. Two equivalent machines with different numbers of phases are compared and their equal behavior is demonstrated.</p>

<p>
Simulate for 1.5 seconds and plot (versus time):
</p>

<ul>
<li><code>aimcM|M3.tauElectrical</code>: machine torque</li>
<li><code>aimsM|M3.wMechanical</code>: machine speed</li>
<li><code>feedback.y</code>: zero since difference of three phase current phasor and scaled multi phase current phasor are equal</li>
</ul>

</HTML>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Rectangle(
                    extent={{-100,100},{100,20}},
                    lineColor={0,0,255},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash),Rectangle(
                    extent={{-100,-10},{100,-80}},
                    lineColor={0,0,255},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash),Text(
                    extent={{40,68},{100,60}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textString="%m phase machine
",                  textStyle={TextStyle.Bold}),Text(
                    extent={{40,-32},{100,-40}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textString="3 phase machine
",                  textStyle={TextStyle.Bold})}));
    end AIMS_Start_MultiPhase;

    model SMPM_Inverter
      "Starting of permanent magnet synchronous machine with inverter"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fsNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency fKnee=50
        "Knee frequency of V/f curve";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque T_Load=181.4 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage(
          final m=m) annotation (Placement(transformation(
            origin={0,60},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.Ramp ramp(height=fKnee, duration=tRamp)
        annotation (Placement(transformation(extent={{-80,50},{-60,70}},
              rotation=0)));
      Modelica_Electrical_Machines.Utilities.VfController vfController(
        final m=m,
        VNominal=VsNominal,
        fNominal=fsNominal,
        BasePhase=+Modelica_Constants.pi/2) annotation (Placement(
            transformation(extent={{-40,50},{-20,70}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor currentRMSsensorM
        annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor
        currentRMSsensorE annotation (Placement(transformation(
            origin={-60,30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
          terminalConnection="Y") annotation (Placement(transformation(extent=
               {{-10,-10},{10,10}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxE(
          terminalConnection="Y") annotation (Placement(transformation(extent=
               {{-10,-70},{10,-50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
        smpmM(
        Jr=smpmData.Jr,
        Js=smpmData.Js,
        p=smpmData.p,
        fsNominal=smpmData.fsNominal,
        Rs=smpmData.Rs,
        TsRef=smpmData.TsRef,
        alpha20s(displayUnit="1/K") = smpmData.alpha20s,
        Lssigma=smpmData.Lssigma,
        Lszero=smpmData.Lszero,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        Lmd=smpmData.Lmd,
        Lmq=smpmData.Lmq,
        useDamperCage=smpmData.useDamperCage,
        Lrsigmad=smpmData.Lrsigmad,
        Lrsigmaq=smpmData.Lrsigmaq,
        Rrd=smpmData.Rrd,
        Rrq=smpmData.Rrq,
        TrRef=smpmData.TrRef,
        alpha20r(displayUnit="1/K") = smpmData.alpha20r,
        VsOpenCircuit=smpmData.VsOpenCircuit,
        frictionParameters=smpmData.frictionParameters,
        statorCoreParameters=smpmData.statorCoreParameters,
        strayLoadParameters=smpmData.strayLoadParameters,
        permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,
        TsOperational=293.15,
        TrOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,-30},
                {10,-10}}, rotation=0)));

      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
        smpmE(
        p=smpmData.p,
        fsNominal=smpmData.fsNominal,
        Rs=smpmData.Rs,
        TsRef=smpmData.TsRef,
        alpha20s(displayUnit="1/K") = smpmData.alpha20s,
        Lszero=smpmData.Lszero,
        Lssigma=smpmData.Lssigma,
        Jr=smpmData.Jr,
        Js=smpmData.Js,
        frictionParameters=smpmData.frictionParameters,
        phiMechanical(fixed=true),
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
        alpha20r(displayUnit="1/K") = smpmData.alpha20r,
        permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,
        TsOperational=293.15,
        ir(fixed=true),
        TrOperational=293.15)
        annotation (Placement(transformation(extent={{-10,-90},{10,-70}},
              rotation=0)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngleM(
          p=smpmM.p) annotation (Placement(transformation(
            origin={30,-20},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngleE(
          p=smpmE.p) annotation (Placement(transformation(
            origin={30,-80},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=J_Load)
        annotation (Placement(transformation(extent={{50,-30},{70,-10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaE(J=J_Load)
        annotation (Placement(transformation(extent={{50,-90},{70,-70}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStepM(
        startTime=tStep,
        stepTorque=-T_Load,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{100,-30},
                {80,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStepE(
        startTime=tStep,
        stepTorque=-T_Load,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{100,-90},
                {80,-70}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
        smpmData
        annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
    initial equation
      smpmE.is[1:2] = zeros(2);
      smpmM.is[1:2] = zeros(2);
    //conditional damper cage currents are defined as fixed start values
    equation
      connect(signalVoltage.plug_n, star.plug_p) annotation (Line(points={{
              0,70},{0,90},{-50,90}}, color={0,0,255}));
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(ramp.y, vfController.u)
        annotation (Line(points={{-59,60},{-42,60}}, color={0,0,255}));
      connect(vfController.y, signalVoltage.v)
        annotation (Line(points={{-19,60},{-7,60}}, color={0,0,255}));
      connect(loadInertiaM.flange_b, torqueStepM.flange)
        annotation (Line(points={{70,-20},{80,-20}}, color={0,0,0}));
      connect(signalVoltage.plug_p, currentRMSsensorM.plug_p) annotation (
          Line(points={{0,50},{0,50},{0,40}},
            color={0,0,255}));
      connect(rotorAngleM.plug_n, smpmM.plug_sn) annotation (Line(points={{36,
              -10},{36,0},{-6,0},{-6,-10}}, color={0,0,255}));
      connect(rotorAngleM.plug_p, smpmM.plug_sp) annotation (Line(points={{24,-10},{
              15,-10},{6,-10}},                color={0,0,255}));
      connect(rotorAngleM.flange, smpmM.flange) annotation (Line(points={{20,-20},{10,
              -20}},                   color={0,0,0}));
      connect(smpmM.flange, loadInertiaM.flange_a)
        annotation (Line(points={{10,-20},{50,-20}}, color={0,0,0}));
      connect(terminalBoxM.plug_sn, smpmM.plug_sn)
        annotation (Line(points={{-6,-10},{-6,-10}}, color={0,0,255}));
      connect(terminalBoxM.plug_sp, smpmM.plug_sp)
        annotation (Line(points={{6,-10},{6,-10}}, color={0,0,255}));
      connect(terminalBoxM.plugSupply, currentRMSsensorM.plug_n) annotation (
          Line(points={{0,-8},{0,-1},{0,-1},{0,
              6},{0,6},{0,20}}, color={0,0,255}));
      connect(loadInertiaE.flange_b, torqueStepE.flange)
        annotation (Line(points={{70,-80},{80,-80}}, color={0,0,0}));
      connect(rotorAngleE.plug_n, smpmE.plug_sn) annotation (Line(points={{36,
              -70},{36,-60},{-6,-60},{-6,-70}}, color={0,0,255}));
      connect(rotorAngleE.plug_p, smpmE.plug_sp)
        annotation (Line(points={{24,-70},{6,-70}}, color={0,0,255}));
      connect(rotorAngleE.flange, smpmE.flange)
        annotation (Line(points={{20,-80},{10,-80}}, color={0,0,0}));
      connect(smpmE.flange, loadInertiaE.flange_a)
        annotation (Line(points={{10,-80},{50,-80}}, color={0,0,0}));
      connect(terminalBoxE.plug_sn, smpmE.plug_sn)
        annotation (Line(points={{-6,-70},{-6,-70}}, color={0,0,255}));
      connect(terminalBoxE.plug_sp, smpmE.plug_sp)
        annotation (Line(points={{6,-70},{6,-70}}, color={0,0,255}));
      connect(currentRMSsensorE.plug_n, terminalBoxE.plugSupply) annotation (
          Line(points={{-60,20},{-60,-50},{0,-50},{0,-68}},
            color={0,0,255}));
      connect(currentRMSsensorE.plug_p, signalVoltage.plug_p) annotation (
          Line(
          points={{-60,40},{0,40},{0,50}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(
          StopTime=1.5,
          Interval=0.0005,
          Tolerance=1e-005), Documentation(info="<HTML>
<h4>Permanent magnet synchronous induction machine fed by an ideal inverter</h4>
<p>

An ideal frequency inverter is modeled by using a
<a href=\"modelica://Modelica.Electrical.Machines.Utilities.VfController\">VfController</a>
and a three-phase <a href=\"modelica://Modelica.Electrical.MultiPhase.Sources.SignalVoltage\">SignalVoltage</a>.
Frequency is raised by a ramp, causing the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">permanent magnet synchronous induction machine</a> to start,
and accelerate the inertias.</p>

<p>At time tStep a load step is applied. Simulate for 1.5 seconds and plot (versus time):</p>

<ul>
<li><code>currentRMSsensorM|E.I</code>: equivalent RMS stator current</li>
<li><code>smpmM|E.wMechanical</code>: machine speed</li>
<li><code>smpmM|E.tauElectrical</code>: machine torque</li>
<li><code>rotorAnglepmsmM|E.rotorDisplacementAngle</code>: rotor displacement angle</li>
</ul>
</HTML>"));
    end SMPM_Inverter;

    model SMPM_Inverter_MultiPhase
      "Starting of multi phase permanent magnet synchronous machine with inverter"
      extends Modelica_Icons.Example;
      constant Integer m3=3 "Number of stator phases of threephase system";
      parameter Integer m=5 "Number of stator phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fsNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency fKnee=50
        "Knee frequency of V/f curve";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque T_Load=181.4 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
      Modelica_Electrical_Analog.Basic.Ground ground3 annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star3(final m=m3)
                                                                 annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage3(final m=
            m3)      annotation (Placement(transformation(
            origin={0,70},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.Ramp ramp(height=fKnee, duration=tRamp)
        annotation (Placement(transformation(extent={{-80,60},{-60,80}},
              rotation=0)));
      Modelica_Electrical_Machines.Utilities.VfController vfController3(
        VNominal=VsNominal,
        fNominal=fsNominal,
        BasePhase=+Modelica_Constants.pi/2,
        final m=m3,
        orientation=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
            m3))   annotation (Placement(transformation(extent={{-40,60},{-20,
                80}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
                                                        currentRMSsensorM(m=m)
        annotation (Placement(transformation(
            origin={30,20},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor
        currentRMSsensor3 annotation (Placement(transformation(
            origin={-80,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
          terminalConnection="Y", m=m) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox3(
          terminalConnection="Y", m=m3)
                                  annotation (Placement(transformation(extent=
               {{-10,-70},{10,-50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
        smpmM(
        Jr=smpmData.Jr,
        Js=smpmData.Js,
        p=smpmData.p,
        fsNominal=smpmData.fsNominal,
        TsRef=smpmData.TsRef,
        alpha20s(displayUnit="1/K") = smpmData.alpha20s,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        useDamperCage=smpmData.useDamperCage,
        Lrsigmad=smpmData.Lrsigmad,
        Lrsigmaq=smpmData.Lrsigmaq,
        Rrd=smpmData.Rrd,
        Rrq=smpmData.Rrq,
        TrRef=smpmData.TrRef,
        alpha20r(displayUnit="1/K") = smpmData.alpha20r,
        VsOpenCircuit=smpmData.VsOpenCircuit,
        frictionParameters=smpmData.frictionParameters,
        statorCoreParameters=smpmData.statorCoreParameters,
        strayLoadParameters=smpmData.strayLoadParameters,
        permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,
        m=m,
        Rs=smpmData.Rs*m/3,
        Lssigma=smpmData.Lssigma*m/3,
        Lszero=smpmData.Lszero*m/3,
        Lmd=smpmData.Lmd*m/3,
        Lmq=smpmData.Lmq*m/3,
        TsOperational=293.15,
        TrOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,-30},
                {10,-10}}, rotation=0)));

      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
        smpm3(
        p=smpmData.p,
        fsNominal=smpmData.fsNominal,
        Rs=smpmData.Rs,
        TsRef=smpmData.TsRef,
        alpha20s(displayUnit="1/K") = smpmData.alpha20s,
        Lszero=smpmData.Lszero,
        Lssigma=smpmData.Lssigma,
        Jr=smpmData.Jr,
        Js=smpmData.Js,
        frictionParameters=smpmData.frictionParameters,
        phiMechanical(fixed=true),
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
        alpha20r(displayUnit="1/K") = smpmData.alpha20r,
        permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,
        m=m3,
        TsOperational=293.15,
        TrOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,-90},
                {10,-70}}, rotation=0)));

      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngle3(p=smpm3.p)
                                 annotation (Placement(transformation(
            origin={30,-80},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=J_Load)
        annotation (Placement(transformation(extent={{50,-30},{70,-10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia3(J=J_Load)
        annotation (Placement(transformation(extent={{50,-90},{70,-70}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStepM(
        startTime=tStep,
        stepTorque=-T_Load,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{100,-30},
                {80,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStep3(
        startTime=tStep,
        stepTorque=-T_Load,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{100,-90},
                {80,-70}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
        smpmData annotation (Placement(transformation(extent={{-100,-100},{-80,
                -80}})));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltageM(
          final m=m) annotation (Placement(transformation(
            origin={30,50},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m)
                                                                annotation (
          Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={60,90})));
      Modelica_Electrical_Analog.Basic.Ground groundM annotation (Placement(
            transformation(
            origin={90,90},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Machines.Utilities.VfController vfController(
        VNominal=VsNominal,
        fNominal=fsNominal,
        BasePhase=+Modelica_Constants.pi/2,
        final m=m,
        orientation=-
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m))
                   annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={-30,50})));
      Modelica_Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=0,
            origin={-50,0})));
      Modelica_Blocks.Math.Gain gain(k=(m/m3))
        annotation (Placement(transformation(extent={{-20,10},{-40,30}})));
    initial equation
      smpm3.is[1:2] = zeros(2);
      smpmM.is[1:2] = zeros(2);
    //conditional damper cage currents are defined as fixed start values
    equation
      connect(signalVoltage3.plug_n, star3.plug_p) annotation (Line(points={{
              0,80},{0,90},{-50,90}}, color={0,0,255}));
      connect(star3.pin_n, ground3.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(ramp.y, vfController3.u)
        annotation (Line(points={{-59,70},{-42,70}}, color={0,0,255}));
      connect(vfController3.y, signalVoltage3.v)
        annotation (Line(points={{-19,70},{-7,70}}, color={0,0,255}));
      connect(loadInertiaM.flange_b, torqueStepM.flange)
        annotation (Line(points={{70,-20},{80,-20}}, color={0,0,0}));
      connect(smpmM.flange, loadInertiaM.flange_a)
        annotation (Line(points={{10,-20},{50,-20}}, color={0,0,0}));
      connect(terminalBoxM.plug_sn, smpmM.plug_sn)
        annotation (Line(points={{-6,-10},{-6,-10}}, color={0,0,255}));
      connect(terminalBoxM.plug_sp, smpmM.plug_sp)
        annotation (Line(points={{6,-10},{6,-10}}, color={0,0,255}));
      connect(terminalBoxM.plugSupply, currentRMSsensorM.plug_n) annotation (
          Line(points={{0,-8},{0,-1},{0,-1},{0,
              10},{30,10}}, color={0,0,255}));
      connect(loadInertia3.flange_b, torqueStep3.flange)
        annotation (Line(points={{70,-80},{80,-80}}, color={0,0,0}));
      connect(rotorAngle3.plug_n, smpm3.plug_sn)   annotation (Line(points={{
              36,-70},{36,-64},{-6,-64},{-6,-70}}, color={0,0,255}));
      connect(rotorAngle3.plug_p, smpm3.plug_sp)
        annotation (Line(points={{24,-70},{6,-70}}, color={0,0,255}));
      connect(rotorAngle3.flange, smpm3.flange)
        annotation (Line(points={{20,-80},{10,-80}}, color={0,0,0}));
      connect(smpm3.flange, loadInertia3.flange_a)
        annotation (Line(points={{10,-80},{50,-80}}, color={0,0,0}));
      connect(terminalBox3.plug_sn, smpm3.plug_sn)
        annotation (Line(points={{-6,-70},{-6,-70}}, color={0,0,255}));
      connect(terminalBox3.plug_sp, smpm3.plug_sp)
        annotation (Line(points={{6,-70},{6,-70}}, color={0,0,255}));
      connect(currentRMSsensor3.plug_n,terminalBox3. plugSupply) annotation (
          Line(points={{-80,-10},{-80,-60},{0,-60},{0,-68}},
            color={0,0,255}));
      connect(signalVoltage3.plug_p,currentRMSsensor3. plug_p) annotation (
          Line(
          points={{0,60},{0,34},{-80,34},{-80,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(signalVoltageM.plug_n, starM.plug_p)
                                                  annotation (Line(
          points={{30,60},{30,90},{50,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(starM.pin_n, groundM.p)
                                     annotation (Line(
          points={{70,90},{80,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vfController.y,signalVoltageM. v) annotation (Line(
          points={{-19,50},{23,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vfController.u, ramp.y) annotation (Line(
          points={{-42,50},{-50,50},{-50,70},{-59,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(signalVoltageM.plug_p, currentRMSsensorM.plug_p) annotation (
          Line(
          points={{30,40},{30,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensor3.I, feedback.u1) annotation (Line(
          points={{-69,0},{-64.5,0},{-64.5,0},
              {-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(gain.y, feedback.u2) annotation (Line(
          points={{-41,20},{-50,20},{-50,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.u, currentRMSsensorM.I) annotation (Line(
          points={{-18,20},{20,20}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        experiment(
          StopTime=1.5,
          Interval=0.0005,
          Tolerance=1e-005),
        Documentation(info="<HTML>
<h4>Permanent magnet synchronous induction machine fed by an ideal inverter</h4>
<p>

An ideal frequency inverter is modeled by using
<a href=\"modelica://Modelica.Electrical.Machines.Utilities.VfController\">VfController</a>s
and <a href=\"modelica://Modelica.Electrical.MultiPhase.Sources.SignalVoltage\">SignalVoltages</a>s.
Frequency is raised by a ramp, causing the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">permanent magnet synchronous induction machines</a> to start,
and accelerate the inertias. Two equivalent machines with different numbers of phases are compared and their equal behavior is demonstrated.</p>

<p>At time tStep a load step is applied. Simulate for 1.5 seconds and plot (versus time):</p>

<ul>
<li><code>aimcM|M3.tauElectrical</code>: machine torque</li>
<li><code>aimsM|M3.wMechanical</code>: machine speed</li>
<li><code>feedback.y</code>: zero since difference of three phase current phasor and scaled multi phase current phasor are equal</li>
</ul>

</HTML>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                graphics={Rectangle(
                    extent={{-20,0},{100,-40}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash),Rectangle(
                    extent={{-20,-60},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash),Text(
                    extent={{40,-54},{100,-62}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                    textString="3 phase machine
"),         Text(
              extent={{40,-44},{100,-52}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                    textString="%m phase machine
")}));
    end SMPM_Inverter_MultiPhase;

    model SMEE_Generator
      "Electrical excited synchronous machine operating as generator"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      constant Integer m=3 "Number of stator phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fsNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.AngularVelocity w=
          Modelica_SIunits.Conversions.from_rpm(1499) "Nominal speed";
      parameter Modelica_SIunits.Current Ie=19 "Excitation current";
      parameter Modelica_SIunits.Current Ie0=10 "Initial excitation current";
      parameter Modelica_SIunits.Angle gamma0(displayUnit="deg") = 0
        "Initial rotor displacement angle";
      parameter Integer p=2 "Number of pole pairs";
      parameter Modelica_SIunits.Resistance Rs=0.03
        "Warm stator resistance per phase";
      parameter Modelica_SIunits.Inductance Lssigma=0.1/(2*Modelica_Constants.pi
          *fsNominal) "Stator stray inductance per phase";
      parameter Modelica_SIunits.Inductance Lmd=1.5/(2*Modelica_Constants.pi*
          fsNominal) "Main field inductance in d-axis";
      parameter Modelica_SIunits.Inductance Lmq=1.5/(2*Modelica_Constants.pi*
          fsNominal) "Main field inductance in q-axis";
      parameter Modelica_SIunits.Inductance Lrsigmad=0.05/(2*
          Modelica_Constants.pi
          *fsNominal)
        "Damper stray inductance (equivalent three phase winding) d-axis";
      parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
        "Damper stray inductance (equivalent three phase winding) q-axis";
      parameter Modelica_SIunits.Resistance Rrd=0.04
        "Warm damper resistance (equivalent three phase winding) d-axis";
      parameter Modelica_SIunits.Resistance Rrq=Rrd
        "Warm damper resistance (equivalent three phase winding) q-axis";
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        final V=fill(VsNominal*sqrt(2), m),
        final freqHz=fill(fsNominal, m)) annotation (Placement(transformation(
              extent={{-20,80},{-40,100}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.ElectricalPowerSensor electricalPowerSensorM
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,30})));
      Modelica_Electrical_Machines.Sensors.ElectricalPowerSensor electricalPowerSensorE
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={-60,30})));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
          terminalConnection="Y") annotation (Placement(transformation(extent=
               {{-10,-10},{10,10}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxE(
          terminalConnection="Y") annotation (Placement(transformation(extent=
               {{-10,-70},{10,-50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited
        smeeM(
        phiMechanical(start=-(Modelica_Constants.pi + gamma0)/p, fixed=true),
        Jr=0.29,
        Js=0.29,
        p=2,
        fsNominal=smeeData.fsNominal,
        Rs=smeeData.Rs,
        TsRef=smeeData.TsRef,
        alpha20s(displayUnit="1/K") = smeeData.alpha20s,
        Lssigma=smeeData.Lssigma,
        Lmd=smeeData.Lmd,
        Lmq=smeeData.Lmq,
        useDamperCage=true,
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
        TsOperational=293.15,
        TrOperational=293.15,
        TeOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,-30},
                {10,-10}}, rotation=0)));

      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited
        smeeE(
        phiMechanical(start=-(Modelica_Constants.pi + gamma0)/p, fixed=true),
        p=2,
        fsNominal=smeeData.fsNominal,
        Rs=smeeData.Rs,
        TsRef=smeeData.TsRef,
        alpha20s(displayUnit="1/K") = smeeData.alpha20s,
        Lssigma=smeeData.Lssigma,
        Jr=0.29,
        Js=0.29,
        frictionParameters(PRef=0),
        statorCoreParameters(PRef=0, VRef=100),
        strayLoadParameters(PRef=0, IRef=100),
        Lmd=smeeData.Lmd,
        Lmq=smeeData.Lmq,
        useDamperCage=true,
        Lrsigmad=smeeData.Lrsigmad,
        Rrd=smeeData.Rrd,
        Rrq=smeeData.Rrq,
        alpha20r(displayUnit="1/K") = smeeData.alpha20r,
        VsNominal=smeeData.VsNominal,
        IeOpenCircuit=smeeData.IeOpenCircuit,
        Re=smeeData.Re,
        TeRef=smeeData.TeRef,
        alpha20e(displayUnit="1/K") = smeeData.alpha20e,
        sigmae=smeeData.sigmae,
        brushParameters(V=0, ILinear=0.01),
        Lrsigmaq=smeeData.Lrsigmaq,
        TrRef=smeeData.TrRef,
        TsOperational=293.15,
        ir(fixed=true),
        TrOperational=293.15,
        TeOperational=293.15) annotation (Placement(transformation(extent={{-10,
                -90},{10,-70}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground groundM annotation (Placement(
            transformation(
            origin={-50,-30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundE annotation (Placement(
            transformation(
            origin={-50,-90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Sources.RampCurrent rampCurrentM(
        duration=0.1,
        I=Ie - Ie0,
        offset=Ie0) annotation (Placement(transformation(
            origin={-30,-20},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Analog.Sources.RampCurrent rampCurrentE(
        duration=0.1,
        I=Ie - Ie0,
        offset=Ie0) annotation (Placement(transformation(
            origin={-30,-80},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngleM(
          p=p) annotation (Placement(transformation(
            origin={30,-20},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngleE(
          p=p) annotation (Placement(transformation(
            origin={30,-80},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.MechanicalPowerSensor
        mechanicalPowerSensorM annotation (Placement(transformation(extent={{
                50,-30},{70,-10}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.MechanicalPowerSensor
        mechanicalPowerSensorE annotation (Placement(transformation(extent={{
                50,-90},{70,-70}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.ConstantSpeed constantSpeedM(
          final w_fixed=w, useSupport=false) annotation (Placement(
            transformation(extent={{100,-30},{80,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.ConstantSpeed constantSpeedE(
          final w_fixed=w, useSupport=false) annotation (Placement(
            transformation(extent={{100,-90},{80,-70}}, rotation=0)));
      parameter Modelica_Electrical_Machines.Utilities.SynchronousMachineData
        smeeData(
        SNominal=30e3,
        VsNominal=100,
        fsNominal=50,
        IeOpenCircuit=10,
        x0=0.1,
        xd=1.6,
        xq=1.6,
        xdTransient=0.1375,
        xdSubtransient=0.121428571,
        xqSubtransient=0.148387097,
        Ta=0.014171268,
        Td0Transient=0.261177343,
        Td0Subtransient=0.006963029,
        Tq0Subtransient=0.123345081,
        alpha20s(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        alpha20r(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        alpha20e(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        TsSpecification=293.15,
        TsRef=293.15,
        TrSpecification=293.15,
        TrRef=293.15,
        TeSpecification=293.15,
        TeRef=293.15)
        annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));

    initial equation
      smeeE.is[1:2] = zeros(2);
      smeeM.is[1:2] = zeros(2);
    //conditional damper cage currents are defined as fixed start values
    equation
      connect(rotorAngleE.plug_n, smeeE.plug_sn) annotation (Line(points={{36,
              -70},{36,-60},{-6,-60},{-6,-70}}, color={0,0,255}));
      connect(rotorAngleE.plug_p, smeeE.plug_sp)
        annotation (Line(points={{24,-70},{6,-70}}, color={0,0,255}));
      connect(rotorAngleE.flange, smeeE.flange)
        annotation (Line(points={{20,-80},{10,-80}}, color={0,0,0}));
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(star.plug_p, sineVoltage.plug_n)
        annotation (Line(points={{-50,90},{-40,90}}, color={0,0,255}));
      connect(smeeE.flange, mechanicalPowerSensorE.flange_a)
        annotation (Line(points={{10,-80},{50,-80}}, color={0,0,0}));
      connect(mechanicalPowerSensorE.flange_b, constantSpeedE.flange)
        annotation (Line(points={{70,-80},{80,-80}}, color={0,0,0}));
      connect(rampCurrentE.p, groundE.p)
        annotation (Line(points={{-30,-90},{-40,-90}}, color={0,0,255}));
      connect(rampCurrentE.p, smeeE.pin_en) annotation (Line(points={{-30,-90},
              {-20,-90},{-20,-86},{-10,-86}},color={0,0,255}));
      connect(rampCurrentE.n, smeeE.pin_ep) annotation (Line(points={{-30,-70},
              {-20,-70},{-20,-74},{-10,-74}},color={0,0,255}));
      connect(smeeE.plug_sn, terminalBoxE.plug_sn)
        annotation (Line(points={{-6,-70},{-6,-70}}, color={0,0,255}));
      connect(smeeE.plug_sp, terminalBoxE.plug_sp)
        annotation (Line(points={{6,-70},{6,-70}}, color={0,0,255}));
      connect(rotorAngleM.plug_n, smeeM.plug_sn) annotation (Line(points={{36,
              -10},{36,0},{-6,0},{-6,-10}}, color={0,0,255}));
      connect(rotorAngleM.plug_p, smeeM.plug_sp) annotation (Line(points={{24,
              -10},{24,-10},{6,-10}}, color={0,0,255}));
      connect(rotorAngleM.flange, smeeM.flange) annotation (Line(points={{20,-20},
              {15,-20},{10,-20}},               color={0,0,0}));
      connect(smeeM.flange, mechanicalPowerSensorM.flange_a)
        annotation (Line(points={{10,-20},{50,-20}}, color={0,0,0}));
      connect(mechanicalPowerSensorM.flange_b, constantSpeedM.flange)
        annotation (Line(points={{70,-20},{80,-20}}, color={0,0,0}));
      connect(rampCurrentM.p, groundM.p) annotation (Line(points={{-30,-30},{
              -35,-30},{-35,-30},{-40,-30}}, color={0,0,255}));
      connect(rampCurrentM.p, smeeM.pin_en) annotation (Line(points={{-30,-30},
              {-20,-30},{-20,-26},{-10,-26}}, color={0,0,255}));
      connect(rampCurrentM.n, smeeM.pin_ep) annotation (Line(points={{-30,-10},
              {-20,-10},{-20,-14},{-10,-14}}, color={0,0,255}));
      connect(smeeM.plug_sn, terminalBoxM.plug_sn)
        annotation (Line(points={{-6,-10},{-6,-10}}, color={0,0,255}));
      connect(smeeM.plug_sp, terminalBoxM.plug_sp)
        annotation (Line(points={{6,-10},{6,-10}}, color={0,0,255}));
      connect(electricalPowerSensorM.plug_p, sineVoltage.plug_p) annotation (
          Line(
          points={{0,40},{0,90},{-20,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensorE.plug_p, sineVoltage.plug_p) annotation (
          Line(
          points={{-60,40},{0,40},{0,90},{-20,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensorM.plug_ni, terminalBoxM.plugSupply)
        annotation (Line(
          points={{0,20},{0,13},{0,13},{0,
              6},{0,6},{0,-8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensorE.plug_ni, terminalBoxE.plugSupply)
        annotation (Line(
          points={{-60,20},{-60,-50},{0,-50},{0,-68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensorE.plug_nv, star.plug_p) annotation (Line(
          points={{-50,30},{-50,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensorM.plug_nv, star.plug_p) annotation (Line(
          points={{-10,30},{-50,30},{-50,90}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(
          StopTime=30,
          Interval=0.005,
          Tolerance=1e-06), Documentation(info="<HTML>
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
</HTML>"));
    end SMEE_Generator;

    model SMEE_Generator_MultiPhase
      "Electrical excited multi phase synchronous machine operating as generator"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      constant Integer m3=3 "Number of stator phases of threephase system";
      parameter Integer m=5 "Number of stator phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fsNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.AngularVelocity w=
          Modelica_SIunits.Conversions.from_rpm(1499) "Nominal speed";
      parameter Modelica_SIunits.Current Ie=19 "Excitation current";
      parameter Modelica_SIunits.Current Ie0=10 "Initial excitation current";
      parameter Modelica_SIunits.Angle gamma0(displayUnit="deg") = 0
        "Initial rotor displacement angle";
      parameter Integer p=2 "Number of pole pairs";
      parameter Modelica_SIunits.Resistance Rs=0.03
        "Warm stator resistance per phase";
      parameter Modelica_SIunits.Inductance Lssigma=0.1/(2*Modelica_Constants.pi
          *fsNominal) "Stator stray inductance per phase";
      parameter Modelica_SIunits.Inductance Lmd=1.5/(2*Modelica_Constants.pi*
          fsNominal) "Main field inductance in d-axis";
      parameter Modelica_SIunits.Inductance Lmq=1.5/(2*Modelica_Constants.pi*
          fsNominal) "Main field inductance in q-axis";
      parameter Modelica_SIunits.Inductance Lrsigmad=0.05/(2*
          Modelica_Constants.pi
          *fsNominal)
        "Damper stray inductance (equivalent three phase winding) d-axis";
      parameter Modelica_SIunits.Inductance Lrsigmaq=Lrsigmad
        "Damper stray inductance (equivalent three phase winding) q-axis";
      parameter Modelica_SIunits.Resistance Rrd=0.04
        "Warm damper resistance (equivalent three phase winding) d-axis";
      parameter Modelica_SIunits.Resistance Rrq=Rrd
        "Warm damper resistance (equivalent three phase winding) q-axis";
      Modelica_Electrical_MultiPhase.Basic.Star star3(final m=m3)
                                                                 annotation (
          Placement(transformation(extent={{-50,-30},{-70,-10}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground3 annotation (Placement(
            transformation(
            origin={-90,-20},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage3(
        final m=m3,
        final V=fill(VsNominal*sqrt(2), m3),
        phase=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m3),
        final freqHz=fill(fsNominal, m3))
                                         annotation (Placement(transformation(
              extent={{-20,-30},{-40,-10}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.PowerSensor
        electricalPowerSensorM(m=m) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={-2,80})));
      Modelica_Electrical_Machines.Sensors.ElectricalPowerSensor electricalPowerSensor3
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=0,
            origin={0,-20})));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
          terminalConnection="Y", m=m) annotation (Placement(transformation(
              extent={{-10,50},{10,70}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox3(
          terminalConnection="Y", m=m3)
                                       annotation (Placement(transformation(
              extent={{-10,-70},{10,-50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited
        smeeM(
        phiMechanical(start=-(Modelica_Constants.pi + gamma0)/p, fixed=true),
        Jr=0.29,
        Js=0.29,
        p=2,
        fsNominal=smeeData.fsNominal,
        TsRef=smeeData.TsRef,
        alpha20s(displayUnit="1/K") = smeeData.alpha20s,
        useDamperCage=true,
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
        m=m,
        Rs=smeeData.Rs*m/3,
        Lssigma=smeeData.Lssigma*m/3,
        Lmd=smeeData.Lmd*m/3,
        Lmq=smeeData.Lmq*m/3,
        statorCoreParameters(VRef=100),
        strayLoadParameters(IRef=100),
        brushParameters(ILinear=0.01),
        TsOperational=293.15,
        TrOperational=293.15,
        TeOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,30},
                {10,50}}, rotation=0)));

      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited
        smee3(
        phiMechanical(start=-(Modelica_Constants.pi + gamma0)/p, fixed=true),
        p=2,
        fsNominal=smeeData.fsNominal,
        Rs=smeeData.Rs,
        TsRef=smeeData.TsRef,
        alpha20s(displayUnit="1/K") = smeeData.alpha20s,
        Lssigma=smeeData.Lssigma,
        Jr=0.29,
        Js=0.29,
        frictionParameters(PRef=0),
        statorCoreParameters(PRef=0, VRef=100),
        strayLoadParameters(PRef=0, IRef=100),
        Lmd=smeeData.Lmd,
        Lmq=smeeData.Lmq,
        useDamperCage=true,
        Lrsigmad=smeeData.Lrsigmad,
        Rrd=smeeData.Rrd,
        Rrq=smeeData.Rrq,
        alpha20r(displayUnit="1/K") = smeeData.alpha20r,
        VsNominal=smeeData.VsNominal,
        IeOpenCircuit=smeeData.IeOpenCircuit,
        Re=smeeData.Re,
        TeRef=smeeData.TeRef,
        alpha20e(displayUnit="1/K") = smeeData.alpha20e,
        sigmae=smeeData.sigmae,
        brushParameters(V=0, ILinear=0.01),
        Lrsigmaq=smeeData.Lrsigmaq,
        TrRef=smeeData.TrRef,
        m=m3,
        TsOperational=293.15,
        TrOperational=293.15,
        TeOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,-90},
                {10,-70}}, rotation=0)));

      Modelica_Electrical_Analog.Basic.Ground groundRM
                                                      annotation (Placement(
            transformation(
            origin={-20,20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground groundR3 annotation (Placement(
            transformation(
            origin={-20,-100},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_Analog.Sources.RampCurrent rampCurrentM(
        duration=0.1,
        I=Ie - Ie0,
        offset=Ie0) annotation (Placement(transformation(
            origin={-30,40},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Analog.Sources.RampCurrent rampCurrent3(
        duration=0.1,
        I=Ie - Ie0,
        offset=Ie0) annotation (Placement(transformation(
            origin={-30,-80},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngle3(p=p)
                          annotation (Placement(transformation(
            origin={30,-80},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.MechanicalPowerSensor
        mechanicalPowerSensorM annotation (Placement(transformation(extent={{
                20,30},{40,50}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.MechanicalPowerSensor mechanicalPowerSensor3
                                annotation (Placement(transformation(extent={
                {50,-90},{70,-70}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.ConstantSpeed constantSpeedM(
          final w_fixed=w, useSupport=false) annotation (Placement(
            transformation(extent={{70,30},{50,50}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.ConstantSpeed constantSpeed3(final
          w_fixed=w, useSupport=false)       annotation (Placement(
            transformation(extent={{100,-90},{80,-70}}, rotation=0)));
      parameter Modelica_Electrical_Machines.Utilities.SynchronousMachineData
        smeeData(
        SNominal=30e3,
        VsNominal=100,
        fsNominal=50,
        IeOpenCircuit=10,
        x0=0.1,
        xd=1.6,
        xq=1.6,
        xdTransient=0.1375,
        xdSubtransient=0.121428571,
        xqSubtransient=0.148387097,
        Ta=0.014171268,
        Td0Transient=0.261177343,
        Td0Subtransient=0.006963029,
        Tq0Subtransient=0.123345081,
        alpha20s(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        alpha20r(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        alpha20e(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        TsSpecification=293.15,
        TsRef=293.15,
        TrSpecification=293.15,
        TrRef=293.15,
        TeSpecification=293.15,
        TeRef=293.15) annotation (Placement(transformation(extent={{-100,-100},
                {-80,-80}})));

      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
                                                        currentRMSsensorM(m=m)
        annotation (Placement(transformation(
            origin={30,80},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor
        currentRMSsensor3 annotation (Placement(transformation(
            origin={30,-20},
            extent={{-10,10},{10,-10}},
            rotation=0)));
      Modelica_Blocks.Math.Gain gain(k=(m/m3))
                                              annotation (Placement(
            transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={90,30})));
      Modelica_Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=0,
            origin={90,0})));
      Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m)
                                                                annotation (
          Placement(transformation(extent={{-50,70},{-70,90}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground groundM
                                                     annotation (Placement(
            transformation(
            origin={-90,80},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltageM(
        final V=fill(VsNominal*sqrt(2), m),
        final freqHz=fill(fsNominal, m),
        final m=m,
        phase=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(
            m))    annotation (Placement(transformation(extent={{-20,70},{-40,
                90}}, rotation=0)));
    initial equation
      smee3.is[1:2] = zeros(2);
      smeeM.is[1:2] = zeros(2);
    //conditional damper cage currents are defined as fixed start values
    equation
      connect(rotorAngle3.plug_n, smee3.plug_sn)   annotation (Line(points={{
              36,-70},{36,-60},{-6,-60},{-6,-70}}, color={0,0,255}));
      connect(rotorAngle3.plug_p, smee3.plug_sp)
        annotation (Line(points={{24,-70},{6,-70}}, color={0,0,255}));
      connect(rotorAngle3.flange, smee3.flange)
        annotation (Line(points={{20,-80},{10,-80}}, color={0,0,0}));
      connect(star3.pin_n, ground3.p) annotation (Line(points={{-70,-20},{-75,-20},{
              -80,-20}},                 color={0,0,255}));
      connect(star3.plug_p, sineVoltage3.plug_n) annotation (Line(points={{-50,
              -20},{-48,-20},{-46,-20},{-40,-20}}, color={0,0,255}));
      connect(smee3.flange, mechanicalPowerSensor3.flange_a)
        annotation (Line(points={{10,-80},{50,-80}}, color={0,0,0}));
      connect(mechanicalPowerSensor3.flange_b, constantSpeed3.flange)
        annotation (Line(points={{70,-80},{80,-80}}, color={0,0,0}));
      connect(rampCurrent3.p,groundR3. p)  annotation (Line(points={{-30,-90},
              {-26,-90},{-20,-90}}, color={0,0,255}));
      connect(rampCurrent3.p, smee3.pin_en)   annotation (Line(points={{-30,-90},
              {-20,-90},{-20,-86},{-10,-86}},color={0,0,255}));
      connect(rampCurrent3.n, smee3.pin_ep)   annotation (Line(points={{-30,-70},
              {-20,-70},{-20,-74},{-10,-74}},color={0,0,255}));
      connect(smee3.plug_sn, terminalBox3.plug_sn)
        annotation (Line(points={{-6,-70},{-6,-70}}, color={0,0,255}));
      connect(smee3.plug_sp, terminalBox3.plug_sp)
        annotation (Line(points={{6,-70},{6,-70}}, color={0,0,255}));
      connect(smeeM.flange, mechanicalPowerSensorM.flange_a)
        annotation (Line(points={{10,40},{10,40},{20,40}}, color={0,0,0}));
      connect(mechanicalPowerSensorM.flange_b, constantSpeedM.flange)
        annotation (Line(points={{40,40},{44,40},{46,40},{50,40}}, color={0,0,
              0}));
      connect(rampCurrentM.p, groundRM.p)
                                         annotation (Line(points={{-30,30},{-30,
              30},{-20,30}}, color={0,0,255}));
      connect(rampCurrentM.p, smeeM.pin_en) annotation (Line(points={{-30,30},
              {-20,30},{-20,34},{-10,34}}, color={0,0,255}));
      connect(rampCurrentM.n, smeeM.pin_ep) annotation (Line(points={{-30,50},
              {-20,50},{-20,46},{-10,46}}, color={0,0,255}));
      connect(smeeM.plug_sn, terminalBoxM.plug_sn)
        annotation (Line(points={{-6,50},{-6,50}}, color={0,0,255}));
      connect(smeeM.plug_sp, terminalBoxM.plug_sp)
        annotation (Line(points={{6,50},{6,50}}, color={0,0,255}));
      connect(electricalPowerSensor3.plug_p, sineVoltage3.plug_p) annotation (
         Line(
          points={{-10,-20},{-20,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensor3.plug_nv, star3.plug_p) annotation (Line(
          points={{0,-10},{0,-8},{-50,-8},{-50,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(gain.y, feedback.u2) annotation (Line(
          points={{90,19},{90,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(electricalPowerSensor3.plug_ni, currentRMSsensor3.plug_p)
        annotation (Line(
          points={{10,-20},{20,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensor3.plug_n,terminalBox3. plugSupply) annotation (
          Line(
          points={{40,-20},{40,-40},{0,-40},{0,-68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensor3.I, feedback.u1) annotation (Line(
          points={{30,-9},{30,0},{82,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(terminalBoxM.plugSupply, currentRMSsensorM.plug_n) annotation (
          Line(
          points={{0,52},{0,60},{40,60},{40,80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentRMSsensorM.I, gain.u) annotation (Line(
          points={{30,90},{30,100},{90,100},{90,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(starM.pin_n, groundM.p)
                                    annotation (Line(points={{-70,80},{-75,80},
              {-80,80}}, color={0,0,255}));
      connect(starM.plug_p, sineVoltageM.plug_n)
                                               annotation (Line(points={{-50,
              80},{-48,80},{-40,80}}, color={0,0,255}));
      connect(sineVoltageM.plug_p, electricalPowerSensorM.pc)
                                                             annotation (Line(
          points={{-20,80},{-12,80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensorM.pc, electricalPowerSensorM.pv)
        annotation (Line(
          points={{-12,80},{-12,70},{-2,70}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensorM.nc, currentRMSsensorM.plug_p)
        annotation (Line(
          points={{8,80},{20,80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensorM.nv, starM.plug_p)
                                                      annotation (Line(
          points={{-2,90},{-2,94},{-50,94},{-50,80}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        experiment(
          StopTime=30,
          Interval=0.005,
          Tolerance=1e-06),
        Documentation(info="<HTML>
<h4>Electrical excited synchronous induction machine as generator</h4>
<p>
Two
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited\">electrically excited synchronous generators</a> are connected to grids and driven with constant speed.
Since speed is slightly smaller than synchronous speed corresponding to mains frequency,
rotor angle is very slowly increased. Two equivalent machines with different numbers of phases are compared and their equal behavior is demonstrated.
</p>

<p>
Simulate for 30 seconds and plot (versus <code>rotorAngleM3.rotorDisplacementAngle</code>):
</p>

<ul>
<li><code>aimcM|M3.tauElectrical</code>: machine torque</li>
<li><code>aimsM|M3.wMechanical</code>: machine speed</li>
<li><code>feedback.y</code>: zero since difference of three phase current phasor and scaled multi phase current phasor are equal</li>
</ul>

</HTML>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                graphics={Rectangle(
                    extent={{-50,60},{70,20}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash),Text(
                    extent={{10,16},{70,8}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                    textString="%m phase machine
"),         Text(
              extent={{10,-52},{70,-60}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                    textString="3 phase machine
"),         Rectangle(
              extent={{-50,-60},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash)}));
    end SMEE_Generator_MultiPhase;

    model SMR_Inverter
      "Starting of synchronous reluctance machine with inverter"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of stator phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fsNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency fKnee=50
        "Knee frequency of V/f curve";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque T_Load=46 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage(
          final m=m) annotation (Placement(transformation(
            origin={0,60},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.Ramp ramp(height=fKnee, duration=tRamp)
        annotation (Placement(transformation(extent={{-80,50},{-60,70}},
              rotation=0)));
      Modelica_Electrical_Machines.Utilities.VfController vfController(
        final m=m,
        VNominal=VsNominal,
        fNominal=fsNominal) annotation (Placement(transformation(extent={{-40,
                50},{-20,70}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor currentRMSsensorM
        annotation (Placement(transformation(
            origin={0,20},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor
        currentRMSsensorE annotation (Placement(transformation(
            origin={-60,20},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
          terminalConnection="Y") annotation (Placement(transformation(extent=
               {{-10,-10},{10,10}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxE(
          terminalConnection="Y") annotation (Placement(transformation(extent=
               {{-10,-70},{10,-50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor
        smrM(
        Jr=smrData.Jr,
        Js=smrData.Js,
        p=smrData.p,
        fsNominal=smrData.fsNominal,
        Rs=smrData.Rs,
        TsRef=smrData.TsRef,
        alpha20s(displayUnit="1/K") = smrData.alpha20s,
        Lssigma=smrData.Lssigma,
        Lszero=smrData.Lszero,
        frictionParameters=smrData.frictionParameters,
        statorCoreParameters=smrData.statorCoreParameters,
        strayLoadParameters=smrData.strayLoadParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        Lmd=smrData.Lmd,
        Lmq=smrData.Lmq,
        useDamperCage=smrData.useDamperCage,
        Lrsigmad=smrData.Lrsigmad,
        Lrsigmaq=smrData.Lrsigmaq,
        Rrd=smrData.Rrd,
        Rrq=smrData.Rrq,
        TrRef=smrData.TrRef,
        alpha20r(displayUnit="1/K") = smrData.alpha20r,
        TsOperational=293.15,
        TrOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,-30},
                {10,-10}}, rotation=0)));
      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor
        smrE(
        p=smrData.p,
        fsNominal=smrData.fsNominal,
        Rs=smrData.Rs,
        TsRef=smrData.TsRef,
        alpha20s(displayUnit="1/K") = smrData.alpha20s,
        Lszero=smrData.Lszero,
        Lssigma=smrData.Lssigma,
        Jr=smrData.Jr,
        Js=smrData.Js,
        frictionParameters=smrData.frictionParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        statorCoreParameters=smrData.statorCoreParameters,
        strayLoadParameters=smrData.strayLoadParameters,
        Lmd=smrData.Lmd,
        Lmq=smrData.Lmq,
        useDamperCage=smrData.useDamperCage,
        Lrsigmad=smrData.Lrsigmad,
        Lrsigmaq=smrData.Lrsigmaq,
        Rrd=smrData.Rrd,
        Rrq=smrData.Rrq,
        TrRef=smrData.TrRef,
        alpha20r(displayUnit="1/K") = smrData.alpha20r,
        TsOperational=293.15,
        ir(fixed=true),
        TrOperational=293.15)                           annotation (Placement(
            transformation(extent={{-10,-90},{10,-70}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngleM(
          p=smrM.p) annotation (Placement(transformation(
            origin={30,-20},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngleE(
          p=smrE.p) annotation (Placement(transformation(
            origin={30,-80},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=J_Load)
        annotation (Placement(transformation(extent={{50,-30},{70,-10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaE(J=J_Load)
        annotation (Placement(transformation(extent={{50,-90},{70,-70}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStepM(
        startTime=tStep,
        stepTorque=-T_Load,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{100,-30},
                {80,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStepE(
        startTime=tStep,
        stepTorque=-T_Load,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{100,-90},
                {80,-70}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_ReluctanceRotorData
        smrData
        annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
    initial equation
      smrE.is[1:2] = zeros(2);
      smrM.is[1:2] = zeros(2);
    //conditional damper cage currents are defined as fixed start values
    equation
      connect(signalVoltage.plug_n, star.plug_p) annotation (Line(points={{
              0,70},{0,90},{-50,90}}, color={0,0,255}));
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(smrE.flange, loadInertiaE.flange_a)
        annotation (Line(points={{10,-80},{50,-80}}, color={0,0,0}));
      connect(ramp.y, vfController.u)
        annotation (Line(points={{-59,60},{-42,60}}, color={0,0,255}));
      connect(vfController.y, signalVoltage.v)
        annotation (Line(points={{-19,60},{-7,60}}, color={0,0,255}));
      connect(loadInertiaE.flange_b, torqueStepE.flange)
        annotation (Line(points={{70,-80},{80,-80}}, color={0,0,0}));
      connect(smrE.plug_sn, rotorAngleE.plug_n) annotation (Line(points={{-6,
              -70},{-6,-60},{36,-60},{36,-70}}, color={0,0,255}));
      connect(smrE.plug_sp, rotorAngleE.plug_p)
        annotation (Line(points={{6,-70},{24,-70}}, color={0,0,255}));
      connect(smrE.flange, rotorAngleE.flange)
        annotation (Line(points={{10,-80},{20,-80}}, color={0,0,0}));
      connect(terminalBoxE.plug_sp, smrE.plug_sp)
        annotation (Line(points={{6,-70},{6,-70}}, color={0,0,255}));
      connect(terminalBoxE.plug_sn, smrE.plug_sn)
        annotation (Line(points={{-6,-70},{-6,-70}}, color={0,0,255}));
      connect(terminalBoxE.plugSupply, currentRMSsensorE.plug_n) annotation (
          Line(points={{0,-68},{0,-50},{-60,-50},{-60,10}},
            color={0,0,255}));
      connect(smrM.flange, loadInertiaM.flange_a) annotation (Line(points={{
              10,-20},{10,-20},{50,-20}}, color={0,0,0}));
      connect(loadInertiaM.flange_b, torqueStepM.flange)
        annotation (Line(points={{70,-20},{80,-20}}, color={0,0,0}));
      connect(smrM.plug_sn, rotorAngleM.plug_n) annotation (Line(points={{-6,
              -10},{-6,0},{36,0},{36,-10}}, color={0,0,255}));
      connect(smrM.plug_sp, rotorAngleM.plug_p) annotation (Line(points={{6,-10},
              {6,-10},{24,-10}}, color={0,0,255}));
      connect(smrM.flange, rotorAngleM.flange) annotation (Line(points={{10,-20},
              {10,-20},{20,-20}}, color={0,0,0}));
      connect(terminalBoxM.plug_sp, smrM.plug_sp)
        annotation (Line(points={{6,-10},{6,-10}}, color={0,0,255}));
      connect(terminalBoxM.plug_sn, smrM.plug_sn)
        annotation (Line(points={{-6,-10},{-6,-10}}, color={0,0,255}));
      connect(currentRMSsensorM.plug_n, terminalBoxM.plugSupply) annotation (
          Line(points={{0,10},{0,5.5},{0,5.5},
              {0,1},{0,1},{0,-8}}, color={0,0,
              255}));
      connect(signalVoltage.plug_p, currentRMSsensorM.plug_p) annotation (
          Line(points={{0,50},{0,45},{-1.1102e-16,45},{
              -1.1102e-16,40},{0,40},{0,30}},color={0,0,
              255}));
      connect(signalVoltage.plug_p, currentRMSsensorE.plug_p) annotation (
          Line(points={{0,50},{0,50},{0,30},{-60,30}}, color={0,0,
              255}));
      annotation (experiment(
          StopTime=1.5,
          Interval=0.001,
          Tolerance=1e-06), Documentation(info="<HTML>
<h4>Synchronous induction machine with reluctance rotor fed by an ideal inverter</h4>
<p>
An ideal frequency inverter is modeled by using a
<a href=\"modelica://Modelica.Electrical.Machines.Utilities.VfController\">VfController</a>
and a three-phase <a href=\"modelica://Modelica.Electrical.MultiPhase.Sources.SignalVoltage\">SignalVoltage</a>.
Frequency is raised by a ramp, causing the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor\">reluctance machine</a> to start,
and accelerating inertias. At time <code>tStep</code> a load step is applied.
</p>

<p>
Simulate for 1.5 seconds and plot (versus time):
</p>

<ul>
<li><code>currentRMSsensorM|E.I</code>: equivalent RMS stator current</li>
<li><code>smrM|E.wMechanical</code>: machine speed</li>
<li><code>smrM|E.tauElectrical</code>: machine torque</li>
<li><code>rotorAngleM|R.rotorDisplacementAngle</code>: rotor displacement angle</li>
</ul>
</HTML>"));
    end SMR_Inverter;

    model SMR_Inverter_MultiPhase
      "Starting of multi phase synchronous reluctance machine with inverter"
      extends Modelica_Icons.Example;
      constant Integer m3=3 "Number of stator phases of threephase system";
      parameter Integer m=5 "Number of stator phases";
      parameter Modelica_SIunits.Voltage VsNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fsNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency fKnee=50
        "Knee frequency of V/f curve";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque T_Load=46 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia J_Load=0.29 "Load inertia";
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBoxM(
          terminalConnection="Y", m=m) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox3(
          terminalConnection="Y", m=m3)
                                  annotation (Placement(transformation(extent=
               {{-10,-70},{10,-50}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor
        smrM(
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
        useDamperCage=smrData.useDamperCage,
        Lrsigmad=smrData.Lrsigmad,
        Lrsigmaq=smrData.Lrsigmaq,
        Rrd=smrData.Rrd,
        Rrq=smrData.Rrq,
        TrRef=smrData.TrRef,
        alpha20r(displayUnit="1/K") = smrData.alpha20r,
        Rs=smrData.Rs*m/3,
        Lssigma=smrData.Lssigma*m/3,
        Lszero=smrData.Lszero*m/3,
        Lmd=smrData.Lmd*m/3,
        Lmq=smrData.Lmq*m/3,
        m=m,
        TsOperational=293.15,
        TrOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,-30},
                {10,-10}}, rotation=0)));
      Modelica_Magnetic_FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor
        smr3(
        p=smrData.p,
        fsNominal=smrData.fsNominal,
        Rs=smrData.Rs,
        TsRef=smrData.TsRef,
        alpha20s(displayUnit="1/K") = smrData.alpha20s,
        Lszero=smrData.Lszero,
        Lssigma=smrData.Lssigma,
        Jr=smrData.Jr,
        Js=smrData.Js,
        frictionParameters=smrData.frictionParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        statorCoreParameters=smrData.statorCoreParameters,
        strayLoadParameters=smrData.strayLoadParameters,
        Lmd=smrData.Lmd,
        Lmq=smrData.Lmq,
        useDamperCage=smrData.useDamperCage,
        Lrsigmad=smrData.Lrsigmad,
        Lrsigmaq=smrData.Lrsigmaq,
        Rrd=smrData.Rrd,
        Rrq=smrData.Rrq,
        TrRef=smrData.TrRef,
        alpha20r(displayUnit="1/K") = smrData.alpha20r,
        m=m3,
        TsOperational=293.15,
        TrOperational=293.15,
        ir(fixed=true)) annotation (Placement(transformation(extent={{-10,-90},
                {10,-70}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorAngle3(p=smr3.p)
                                annotation (Placement(transformation(
            origin={30,-80},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertiaM(J=J_Load)
        annotation (Placement(transformation(extent={{50,-30},{70,-10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia3(J=J_Load)
        annotation (Placement(transformation(extent={{50,-90},{70,-70}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStepM(
        startTime=tStep,
        stepTorque=-T_Load,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{100,-30},
                {80,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStep3(
        startTime=tStep,
        stepTorque=-T_Load,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{100,-90},
                {80,-70}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_ReluctanceRotorData
        smrData annotation (Placement(transformation(extent={{-100,-100},{-80,
                -80}})));
      Modelica_Electrical_Analog.Basic.Ground ground3 annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star3(final m=m3)
                                                                 annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage3(final m=
            m3)      annotation (Placement(transformation(
            origin={0,70},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.Ramp ramp(height=fKnee, duration=tRamp)
        annotation (Placement(transformation(extent={{-80,60},{-60,80}},
              rotation=0)));
      Modelica_Electrical_Machines.Utilities.VfController vfController3(
        VNominal=VsNominal,
        fNominal=fsNominal,
        BasePhase=+Modelica_Constants.pi/2,
        final m=m3,
        orientation=-
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m3))
                   annotation (Placement(transformation(extent={{-40,60},{-20,
                80}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor
                                                        currentRMSsensorM(m=m)
        annotation (Placement(transformation(
            origin={30,20},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentRMSsensor3
                          annotation (Placement(transformation(
            origin={-80,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltageM(
          final m=m) annotation (Placement(transformation(
            origin={30,50},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m)
                                                                annotation (
          Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={60,90})));
      Modelica_Electrical_Analog.Basic.Ground groundM annotation (Placement(
            transformation(
            origin={90,90},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Machines.Utilities.VfController vfControllerM(
        VNominal=VsNominal,
        fNominal=fsNominal,
        BasePhase=+Modelica_Constants.pi/2,
        final m=m,
        orientation=-
            Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m))
                   annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={-30,50})));
      Modelica_Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=0,
            origin={-50,0})));
      Modelica_Blocks.Math.Gain gain(k=(m/m3))
        annotation (Placement(transformation(extent={{-20,10},{-40,30}})));
    initial equation
      smr3.is[1:2] = zeros(2);
      smrM.is[1:2] = zeros(2);
    //conditional damper cage currents are defined as fixed start values
    equation
      connect(smr3.flange, loadInertia3.flange_a)
        annotation (Line(points={{10,-80},{50,-80}}, color={0,0,0}));
      connect(loadInertia3.flange_b, torqueStep3.flange)
        annotation (Line(points={{70,-80},{80,-80}}, color={0,0,0}));
      connect(smr3.plug_sn, rotorAngle3.plug_n)   annotation (Line(points={{-6,
              -70},{-6,-60},{36,-60},{36,-70}}, color={0,0,255}));
      connect(smr3.plug_sp, rotorAngle3.plug_p)
        annotation (Line(points={{6,-70},{24,-70}}, color={0,0,255}));
      connect(smr3.flange, rotorAngle3.flange)
        annotation (Line(points={{10,-80},{20,-80}}, color={0,0,0}));
      connect(terminalBox3.plug_sp, smr3.plug_sp)
        annotation (Line(points={{6,-70},{6,-70}}, color={0,0,255}));
      connect(terminalBox3.plug_sn, smr3.plug_sn)
        annotation (Line(points={{-6,-70},{-6,-70}}, color={0,0,255}));
      connect(smrM.flange, loadInertiaM.flange_a) annotation (Line(points={{
              10,-20},{10,-20},{50,-20}}, color={0,0,0}));
      connect(loadInertiaM.flange_b, torqueStepM.flange)
        annotation (Line(points={{70,-20},{80,-20}}, color={0,0,0}));
      connect(terminalBoxM.plug_sp, smrM.plug_sp)
        annotation (Line(points={{6,-10},{6,-10}}, color={0,0,255}));
      connect(terminalBoxM.plug_sn, smrM.plug_sn)
        annotation (Line(points={{-6,-10},{-6,-10}}, color={0,0,255}));
      connect(signalVoltage3.plug_n, star3.plug_p)
        annotation (Line(points={{0,80},{0,90},{-50,90}}, color={0,0,255}));
      connect(star3.pin_n, ground3.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(ramp.y, vfController3.u)
        annotation (Line(points={{-59,70},{-42,70}}, color={0,0,255}));
      connect(vfController3.y, signalVoltage3.v)
        annotation (Line(points={{-19,70},{-7,70}}, color={0,0,255}));
      connect(terminalBoxM.plugSupply, currentRMSsensorM.plug_n) annotation (
          Line(points={{0,-8},{0,-1},{0,-1},{0,10},{30,10}},
            color={0,0,255}));
      connect(signalVoltage3.plug_p, currentRMSsensor3.plug_p) annotation (
          Line(
          points={{0,60},{0,34},{-80,34},{-80,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(signalVoltageM.plug_n, starM.plug_p)
                                                  annotation (Line(
          points={{30,60},{30,90},{50,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(starM.pin_n, groundM.p)
                                     annotation (Line(
          points={{70,90},{80,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vfControllerM.y, signalVoltageM.v)
                                                annotation (Line(
          points={{-19,50},{23,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vfControllerM.u, ramp.y)
                                      annotation (Line(
          points={{-42,50},{-50,50},{-50,70},{-59,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(signalVoltageM.plug_p, currentRMSsensorM.plug_p) annotation (
          Line(
          points={{30,40},{30,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(gain.y, feedback.u2) annotation (Line(
          points={{-41,20},{-50,20},{-50,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.u, currentRMSsensorM.I) annotation (Line(
          points={{-18,20},{20,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(currentRMSsensor3.plug_n, terminalBox3.plugSupply) annotation (
          Line(points={{-80,-10},{-80,-60},{0,-60},{0,-68}},
            color={0,0,255}));
      connect(currentRMSsensor3.I, feedback.u1) annotation (Line(
          points={{-69,0},{-58,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        experiment(
          StopTime=1.5,
          Interval=0.001,
          Tolerance=1e-06),
        Documentation(info="<HTML>
<h4>Synchronous induction machine with reluctance rotor fed by an ideal inverter</h4>
<p>
Ideal frequency inverters are modeled by using a
<a href=\"modelica://Modelica.Electrical.Machines.Utilities.VfController\">VfController</a>
and phase <a href=\"modelica://Modelica.Electrical.MultiPhase.Sources.SignalVoltage\">SignalVoltage</a>s.
Frequency is raised by a ramp, causing the
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor\">reluctance machine</a> to start,
and accelerating inertias. At time <code>tStep</code> a load step is applied. Two equivalent machines with different numbers of phases are compared and their equal behavior is demonstrated.
</p>

<p>
Simulate for 1.5 seconds and plot (versus time):
</p>

<ul>
<li><code>aimcM|M3.tauElectrical</code>: machine torque</li>
<li><code>aimsM|M3.wMechanical</code>: machine speed</li>
<li><code>feedback.y</code>: zero since difference of three phase current phasor and scaled multi phase current phasor are equal</li>
</ul>

</HTML>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Rectangle(
                    extent={{-20,0},{100,-40}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash),Text(
                    extent={{40,-44},{100,-52}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                    textString="%m phase machine
"),         Text(
              extent={{40,-54},{100,-62}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                    textString="3 phase machine
"),         Rectangle(
              extent={{-20,-60},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={255,255,170},
                    fillPattern=FillPattern.Solid,
                    pattern=LinePattern.Dash)}));
    end SMR_Inverter_MultiPhase;
  end BasicMachines;
  annotation (Documentation(info="<html>
<p>Examples comparing the models of
<a href=\"modelica://Modelica.Electrical.Machines.BasicMachines\">Electrical.Machines.BasicMachines</a> with
<a href=\"modelica://Modelica.Magnetic.FundamentalWave.BasicMachines\">Magnetic.FundamentalWave.BasicMachines</a>.
</p>
</html>"), uses(Modelica_Mechanics_Rotational(version="3.2.2"),
                Modelica_Electrical_Machines(version="3.2.2"),
                Modelica_Blocks(version="3.2.2"),
                Modelica_Constants(version="3.2.2"),
                Modelica_Magnetic_FundamentalWave(version="3.2.2"),
                Modelica_Electrical_MultiPhase(version="3.2.2"),
                Modelica_Electrical_Analog(version="3.2.2"),
                Modelica_SIunits(version="3.2.2"),
                Modelica_Icons(version="3.2.2"),
                Complex(version="3.2.2")),
         version="3.2.2");
end Modelica_Magnetic_FundamentalWave_Examples;
