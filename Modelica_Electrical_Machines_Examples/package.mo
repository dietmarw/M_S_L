within ;
encapsulated package Modelica_Electrical_Machines_Examples "Test examples"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Constants;
  import Modelica_Electrical_Machines;
  import Modelica_Electrical_MultiPhase;
  import Modelica_Electrical_Analog;
  import Modelica_Blocks;
  import Modelica_Mechanics_Rotational;
  import Modelica_Utilities;
  import Modelica_Thermal_HeatTransfer;
  import Modelica_Thermal_FluidHeatFlow;
  import Modelica_Electrical_Machines_Interfaces;
  extends Modelica_Icons.ExamplesPackage;
  package AsynchronousInductionMachines
    "Test examples of asynchronous induction machines"
    extends Modelica_Icons.ExamplesPackage;
    model AIMC_DOL
      "Test example: AsynchronousInductionMachineSquirrelCage direct-on-line"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tStart1=0.1 "Start time";
      parameter Modelica_SIunits.Torque TLoad=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad(displayUnit="1/min")=
           1440.45*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimc(
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
        TrRef=aimcData.TrRef,
        TsOperational=293.15,
        alpha20r=aimcData.alpha20r,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={0,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2/3)*VNominal, m)) annotation (Placement(transformation(
            origin={0,60},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Blocks.Sources.BooleanStep booleanStep[m](each startTime=tStart1)
        annotation (Placement(transformation(extent={{-80,30},{-60,50}},
              rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorque(
        w_nominal=wLoad,
        TorqueDirection=false,
        tau_nominal=-TLoad,
        useSupport=false) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="D") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    initial equation
      aimc.is = zeros(3);
      aimc.ir = zeros(2);
    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(sineVoltage.plug_n, star.plug_p)
        annotation (Line(points={{0,70},{0,90},{-50,90}}, color={0,0,255}));
      connect(sineVoltage.plug_p, idealCloser.plug_p) annotation (Line(points=
             {{0,50},{0,48},{0,46},{0,40}}, color={0,0,255}));
      connect(booleanStep.y, idealCloser.control) annotation (Line(points={{-59,
              40},{-20,40},{-20,30},{-7,30}}, color={255,0,255}));
      connect(idealCloser.plug_n, currentQuasiRMSSensor.plug_p)
        annotation (Line(points={{0,20},{0,17},{0,10}}, color={0,0,255}));
      connect(terminalBox.plug_sn, aimc.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, aimc.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{-10,-28},{-10,-20},{0,-20},{0,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(loadInertia.flange_b, quadraticLoadTorque.flange) annotation (
          Line(
          points={{60,-40},{70,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(aimc.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Asynchronous induction machine with squirrel cage - direct on line starting</b><br>
At start time tStart three phase voltage is supplied to the asynchronous induction machine with squirrel cage;
the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed, finally reaching nominal speed.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>aimc.wMechanical: motor's speed</li>
<li>aimc.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</HTML>"));
    end AIMC_DOL;

    model AIMC_YD "Test example: AsynchronousInductionMachineSquirrelCage Y-D"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tStart1=0.1 "Start time";
      parameter Modelica_SIunits.Time tStart2=2.0 "Start time from Y to D";
      parameter Modelica_SIunits.Torque TLoad=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad(displayUnit="1/min")=
           1440.45*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimc(
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
        TrRef=aimcData.TrRef,
        TsOperational=293.15,
        alpha20r=aimcData.alpha20r,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={0,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2/3)*VNominal, m)) annotation (Placement(transformation(
            origin={0,60},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Blocks.Sources.BooleanStep booleanStep[m](each startTime=
            tStart1) annotation (Placement(transformation(extent={{-80,30},{-60,
                50}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Utilities.SwitchYD switchYD(m=m) annotation (
         Placement(transformation(extent={{-20,-30},{0,-10}}, rotation=0)));
      Modelica_Blocks.Sources.BooleanStep booleanStepYD[m](each startTime=
            tStart2) annotation (Placement(transformation(extent={{-80,-30},{
                -60,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorque(
        w_nominal=wLoad,
        TorqueDirection=false,
        tau_nominal=-TLoad,
        useSupport=false) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    initial equation
      aimc.is = zeros(3);
      aimc.ir = zeros(2);
    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(sineVoltage.plug_n, star.plug_p)
        annotation (Line(points={{0,70},{0,90},{-50,90}}, color={0,0,255}));
      connect(sineVoltage.plug_p, idealCloser.plug_p) annotation (Line(points=
             {{0,50},{0,48},{0,46},{0,40}}, color={0,0,255}));
      connect(loadInertia.flange_b, quadraticLoadTorque.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(booleanStep.y, idealCloser.control) annotation (Line(points={{-59,
              40},{-20,40},{-20,30},{-7,30}}, color={255,0,255}));
      connect(booleanStepYD.y, switchYD.control)
        annotation (Line(points={{-59,-20},{-21,-20}}, color={255,0,255}));
      connect(idealCloser.plug_n, currentQuasiRMSSensor.plug_p)
        annotation (Line(points={{0,20},{0,18},{0,10}}, color={0,0,255}));
      connect(switchYD.plug_sn, aimc.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(switchYD.plug_sp, aimc.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(switchYD.plugSupply, currentQuasiRMSSensor.plug_n) annotation (
          Line(
          points={{-10,-10},{0,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(aimc.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Asynchronous induction machine with squirrel cage - Y-D starting</b><br>
At start time tStart three phase voltage is supplied to the asynchronous induction machine with squirrel cage, first star-connected, then delta-connected; the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed, finally reaching nominal speed.<br>
Simulate for 2.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>aimc.wMechanical: motor's speed</li>
<li>aimc.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</HTML>"));
    end AIMC_YD;

    model AIMC_Transformer
      "Test example: AsynchronousInductionMachineSquirrelCage transformer starting"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tStart1=0.1 "Start time";
      parameter Modelica_SIunits.Time tStart2=2.0
        "Start time of bypass transformer";
      parameter Modelica_SIunits.Torque TLoad=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad(displayUnit="1/min")=
           1440.45*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimc(
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
        TrRef=aimcData.TrRef,
        TsOperational=293.15,
        alpha20r=aimcData.alpha20r,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={0,80},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2/3)*VNominal, m)) annotation (Placement(transformation(
            origin={-30,90},
            extent={{10,10},{-10,-10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Blocks.Sources.BooleanStep booleanStep1[m](each startTime=
            tStart1) annotation (Placement(transformation(extent={{-60,40},{-40,
                60}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(
            origin={0,50},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.BasicMachines.Transformers.Yy.Yy00 transformer(
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
        T2Operational=293.15) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-20,30})));

      Modelica_Electrical_Analog.Basic.Ground ground2 annotation (Placement(
            transformation(
            origin={-50,20},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      parameter Modelica_Electrical_Machines.Utilities.TransformerData transformerData(
        f=fNominal,
        V1=VNominal,
        C1=Modelica_Utilities.Strings.substring(
                transformer.VectorGroup,
                1,
                1),
        V2=VNominal/sqrt(3),
        C2=Modelica_Utilities.Strings.substring(
                transformer.VectorGroup,
                2,
                2),
        SNominal=50E3,
        v_sc=0.06,
        P_sc=500)
        annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
      Modelica_Blocks.Sources.BooleanStep booleanStep2[m](each startTime=
            tStart2) annotation (Placement(transformation(extent={{-60,-10},{
                -40,10}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealCommutingSwitch
        idealCommutingSwitch(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(50E-5, m)) annotation (Placement(transformation(
            origin={0,0},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorque(
        w_nominal=wLoad,
        TorqueDirection=false,
        tau_nominal=-TLoad,
        useSupport=false) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="D") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    initial equation
      aimc.is = zeros(3);
      aimc.ir = zeros(2);
      transformer.i1[1:2] = zeros(2);
    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(terminalBox.plug_sn, aimc.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, aimc.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(loadInertia.flange_b, quadraticLoadTorque.flange) annotation (
          Line(
          points={{60,-40},{70,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(aimc.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(star.plug_p, sineVoltage.plug_n) annotation (Line(
          points={{-50,90},{-40,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(booleanStep2.y, idealCommutingSwitch.control) annotation (Line(
          points={{-39,0},{-8,0}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(transformer.starpoint2, ground2.p) annotation (Line(
          points={{-30,25},{-30,20},{-40,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCommutingSwitch.plug_p, terminalBox.plugSupply)
        annotation (Line(
          points={{0,-10},{-10,-10},{-10,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(transformer.plug2, idealCommutingSwitch.plug_n1) annotation (
          Line(
          points={{-20,20},{-5,20},{-5,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(sineVoltage.plug_p, currentQuasiRMSSensor.plug_p) annotation (
          Line(
          points={{-20,90},{0,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(booleanStep1.y, idealCloser.control) annotation (Line(
          points={{-39,50},{-7,50}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(currentQuasiRMSSensor.plug_n, idealCloser.plug_p) annotation (
          Line(
          points={{0,70},{0,60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(transformer.plug1, idealCloser.plug_n) annotation (Line(
          points={{-20,40},{0,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealCloser.plug_n, idealCommutingSwitch.plug_n2) annotation (
          Line(
          points={{0,40},{0,10}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Asynchronous induction machine with squirrel cage - transformer starting</b><br>
At start time tStart1 three phase voltage is supplied to the asynchronous induction machine with squirrel cage via the transformer;
the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed;
at start time tStart2 the machine is fed directly from the voltage source, finally reaching nominal speed.<br>
Simulate for 2.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>aimc.wMechanical: motor's speed</li>
<li>aimc.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</HTML>"));
    end AIMC_Transformer;

    model AIMS_Start "Test example: AsynchronousInductionMachineSlipRing"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tStart1=0.1 "Start time";
      parameter Modelica_SIunits.Resistance Rstart=0.16/aimsData.turnsRatio^2
        "Starting resistance";
      parameter Modelica_SIunits.Time tStart2=1.0
        "Start time of shorting starting resistance";
      parameter Modelica_SIunits.Torque TLoad=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad(displayUnit="1/min")=
           1440.45*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing
        aims(
        p=aimsData.p,
        Jr=aimsData.Jr,
        Js=aimsData.Js,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        useTurnsRatio=aimsData.useTurnsRatio,
        turnsRatio=aimsData.turnsRatio,
        VsNominal=aimsData.VsNominal,
        VrLockedRotor=aimsData.VrLockedRotor,
        Rs=aimsData.Rs,
        TsRef=aimsData.TsRef,
        Lszero=aimsData.Lszero,
        Lssigma=aimsData.Lssigma,
        Lm=aimsData.Lm,
        Lrsigma=aimsData.Lrsigma,
        Lrzero=aimsData.Lrzero,
        Rr=aimsData.Rr,
        TrRef=aimsData.TrRef,
        frictionParameters=aimsData.frictionParameters,
        statorCoreParameters=aimsData.statorCoreParameters,
        strayLoadParameters=aimsData.strayLoadParameters,
        rotorCoreParameters=aimsData.rotorCoreParameters,
        fsNominal=aimsData.fsNominal,
        TsOperational=293.15,
        alpha20s=aimsData.alpha20s,
        alpha20r=aimsData.alpha20r,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={0,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2/3)*VNominal, m)) annotation (Placement(transformation(
            origin={0,60},
            extent={{10,-10},{-10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Blocks.Sources.BooleanStep booleanStep[m](each startTime=
            tStart1) annotation (Placement(transformation(extent={{-80,30},{-60,
                50}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealClosingSwitch idealCloser(
        final m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m)) annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorque(
        w_nominal=wLoad,
        TorqueDirection=false,
        tau_nominal=-TLoad,
        useSupport=false) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="D") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.SwitchedRheostat switchedRheostat(
        RStart=Rstart,
        tStart=tStart2,
        m=m)
        annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SlipRingData
        aimsData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    initial equation
      aims.is = zeros(3);
      aims.ir = zeros(3);
    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(sineVoltage.plug_n, star.plug_p)
        annotation (Line(points={{0,70},{0,90},{-50,90}}, color={0,0,255}));
      connect(sineVoltage.plug_p, idealCloser.plug_p) annotation (Line(points=
             {{0,50},{0,48},{0,46},{0,40}}, color={0,0,255}));
      connect(loadInertia.flange_b, quadraticLoadTorque.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(booleanStep.y, idealCloser.control) annotation (Line(points={{-59,
              40},{-20,40},{-20,30},{-7,30}}, color={255,0,255}));
      connect(idealCloser.plug_n, currentQuasiRMSSensor.plug_p)
        annotation (Line(points={{0,20},{0,16},{0,10}}, color={0,0,255}));
      connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{-10,-28},{-10,-20},{0,-20},{0,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sn, aims.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, aims.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(aims.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(switchedRheostat.plug_p, aims.plug_rp) annotation (Line(
          points={{-30,-34},{-20,-34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(switchedRheostat.plug_n, aims.plug_rn) annotation (Line(
          points={{-30,-46},{-20,-46}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Asynchronous induction machine with slipring rotor - resistance starting</b><br>
At start time tStart1 three phase voltage is supplied to the asynchronous induction machine with sliprings;
the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed,
using a starting resistance. At time tStart2 external rotor resistance is shortened, finally reaching nominal speed.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>aims.wMechanical: motor's speed</li>
<li>aims.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SlipRing</i> are used.
</HTML>"));
    end AIMS_Start;

    model AIMC_Inverter
      "Test example: AsynchronousInductionMachineSquirrelCage with inverter"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency f=50 "Actual frequency";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque TLoad=161.4 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimc(
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
        TrRef=aimcData.TrRef,
        TsOperational=293.15,
        alpha20r=aimcData.alpha20r,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={0,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.Ramp ramp(height=f, duration=tRamp) annotation (
         Placement(transformation(extent={{-80,50},{-60,70}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.VfController vfController(
        final m=m,
        VNominal=VNominal,
        fNominal=fNominal) annotation (Placement(transformation(extent={{-40,50},
                {-20,70}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage(
          final m=m) annotation (Placement(transformation(
            origin={0,60},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep loadTorqueStep(
        startTime=tStep,
        stepTorque=-TLoad,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="Y") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    initial equation
      aimc.is[1:2] = zeros(2);
      aimc.ir = zeros(2);
    equation
      connect(signalVoltage.plug_n, star.plug_p)
        annotation (Line(points={{0,70},{0,90},{-50,90}}, color={0,0,255}));
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(ramp.y, vfController.u)
        annotation (Line(points={{-59,60},{-42,60}}, color={0,0,255}));
      connect(vfController.y, signalVoltage.v)
        annotation (Line(points={{-19,60},{-7,60}}, color={0,0,255}));
      connect(loadTorqueStep.flange, loadInertia.flange_b)
        annotation (Line(points={{70,-40},{60,-40}}, color={0,0,0}));
      connect(signalVoltage.plug_p, currentQuasiRMSSensor.plug_p)
        annotation (Line(points={{0,50},{0,40},{0,10}}, color={0,0,255}));
      connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{-10,-28},{-10,-20},{0,-20},{0,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sn, aimc.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, aimc.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(aimc.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Asynchronous induction machine with squirrel cage fed by an ideal inverter</b><br>
An ideal frequency inverter is modeled by using a VfController and a three-phase SignalVoltage.<br>
Frequency is raised by a ramp, causing the asynchronous induction machine with squirrel cage to start,
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>aimc.wMechanical: motor's speed</li>
<li>aimc.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</HTML>"));
    end AIMC_Inverter;

    model AIMC_Steinmetz
      "AsynchronousInductionMachineSquirrelCage Steinmetz-connection"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Time tStart1=0.1 "Start time";
      parameter Modelica_SIunits.Capacitance Cr=0.0035
        "Motor's running capacitor";
      parameter Modelica_SIunits.Capacitance Cs=5*Cr
        "Motor's (additional) starting capacitor";
      parameter Modelica_SIunits.AngularVelocity wSwitch(displayUnit="1/min")=
           1350*2*Modelica_Constants.pi/60
        "Speed for switching off the starting capacitor";
      parameter Modelica_SIunits.Torque TLoad=2/3*161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad(displayUnit="1/min")=
           1462.5*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimc(
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
        TrRef=aimcData.TrRef,
        TsOperational=293.15,
        alpha20r=aimcData.alpha20r,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Analog.Sources.SineVoltage sineVoltage(freqHz=
            fNominal, V=sqrt(2)*VNominal) annotation (Placement(
            transformation(extent={{-50,100},{-70,80}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Blocks.Sources.BooleanStep booleanStep(startTime=tStart1)
        annotation (Placement(transformation(extent={{-50,60},{-30,80}},
              rotation=0)));
      Modelica_Electrical_Analog.Ideal.IdealClosingSwitch idealCloser
        annotation (Placement(transformation(
            origin={-20,90},
            extent={{10,-10},{-10,10}},
            rotation=180)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorque(
        w_nominal=wLoad,
        TorqueDirection=false,
        tau_nominal=-TLoad,
        useSupport=false) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox TerminalBox1(
          terminalConnection="D") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.PlugToPin_p plugToPin_p3(m=m, k=3)
        annotation (Placement(transformation(
            origin={-30,18},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_MultiPhase.Basic.PlugToPin_p plugToPin_p2(m=m, k=2)
        annotation (Placement(transformation(
            origin={-10,18},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_MultiPhase.Basic.PlugToPin_p plugToPin_p1(m=m, k=1)
        annotation (Placement(transformation(
            origin={10,18},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Analog.Basic.Capacitor cRun(C=Cr) annotation (
          Placement(transformation(
            origin={10,50},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Capacitor cStart(C=Cs) annotation (
          Placement(transformation(
            origin={30,50},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Ideal.IdealOpeningSwitch idealOpener
        annotation (Placement(transformation(
            origin={30,80},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Blocks.Logical.GreaterThreshold greaterThreshold(threshold=
            wSwitch) annotation (Placement(transformation(
            origin={50,50},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_Rotational.Sensors.SpeedSensor relSpeedSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={30,-30})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={-10,-10},
            extent={{-10,10},{10,-10}},
            rotation=270)));
    initial equation
      aimc.is = zeros(3);
      aimc.ir = zeros(2);
      cStart.v = 0;
      cRun.v = 0;
    equation
      connect(ground.p, sineVoltage.n)
        annotation (Line(points={{-80,90},{-70,90}}, color={0,0,255}));
      connect(sineVoltage.p, idealCloser.p)
        annotation (Line(points={{-50,90},{-30,90}}, color={0,0,255}));
      connect(booleanStep.y, idealCloser.control) annotation (Line(points={{-29,
              70},{-20,70},{-20,83}}, color={255,0,255}));
      connect(plugToPin_p3.pin_p, sineVoltage.n) annotation (Line(points={{-30,
              20},{-70,20},{-70,90}}, color={0,0,255}));
      connect(idealCloser.n, plugToPin_p2.pin_p)
        annotation (Line(points={{-10,90},{-10,20}}, color={0,0,255}));
      connect(cRun.n, plugToPin_p1.pin_p)
        annotation (Line(points={{10,40},{10,20}}, color={0,0,255}));
      connect(loadInertia.flange_b, quadraticLoadTorque.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(cRun.p, idealCloser.n) annotation (Line(points={{10,60},{10,90},
              {-10,90}}, color={0,0,255}));
      connect(plugToPin_p1.pin_p, cStart.n)
        annotation (Line(points={{10,20},{30,20},{30,40}}, color={0,0,255}));
      connect(idealOpener.n, cStart.p) annotation (Line(points={{30,70},{30,
              67.5},{30,65},{30,60}}, color={0,0,255}));
      connect(idealOpener.p, idealCloser.n) annotation (Line(points={{30,90},
              {30,90},{-10,90}}, color={0,0,255}));
      connect(greaterThreshold.y, idealOpener.control) annotation (Line(
            points={{50,61},{50,80},{37,80}}, color={255,0,255}));
      connect(TerminalBox1.plug_sn, aimc.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(TerminalBox1.plug_sp, aimc.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(aimc.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relSpeedSensor.flange, aimc.flange) annotation (Line(
          points={{20,-30},{20,-40},{0,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relSpeedSensor.w, greaterThreshold.u) annotation (Line(
          points={{41,-30},{50,-30},{50,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(plugToPin_p3.plug_p, currentQuasiRMSSensor.plug_p) annotation (
          Line(
          points={{-30,16},{-30,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(plugToPin_p2.plug_p, currentQuasiRMSSensor.plug_p) annotation (
          Line(
          points={{-10,16},{-10,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(plugToPin_p1.plug_p, currentQuasiRMSSensor.plug_p) annotation (
          Line(
          points={{10,16},{10,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentQuasiRMSSensor.plug_n, TerminalBox1.plugSupply)
        annotation (Line(
          points={{-10,-20},{-10,-28},{-10,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Asynchronous induction machine with squirrel cage - Steinmetz-connection</b><br>
At start time tStart single phase voltage is supplied to the asynchronous induction machine with squirrel cage;
the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed, finally reaching nominal speed.<br>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</HTML>"));
    end AIMC_Steinmetz;

    model AIMC_withLosses
      "Test example: AsynchronousInductionMachineSquirrelCage with losses"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      import Modelica_Constants.pi;
      import Modelica_SIunits.Conversions.from_rpm;
      import Modelica_SIunits.Conversions.to_rpm;
      import Modelica_SIunits.Conversions.from_degC;
    protected
      parameter Modelica_SIunits.Power PNominal=18500 "Nominal output";
      parameter Modelica_SIunits.Voltage VNominal=400 "Nominal RMS voltage";
      parameter Modelica_SIunits.Current INominal=32.85 "Nominal RMS current";
      parameter Real pfNominal=0.898 "Nominal power factor";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.AngularVelocity wNominal=from_rpm(1462.5)
        "Nominal speed";
      parameter Modelica_SIunits.Torque TNominal=PNominal/wNominal
        "Nominal torque";
      parameter Modelica_SIunits.Temperature TempNominal=from_degC(90)
        "Nominal temperature";
      Modelica_SIunits.Power Pel=electricalPowerSensor.P;
      Modelica_SIunits.ReactivePower Qel=electricalPowerSensor.Q;
      Modelica_SIunits.ApparentPower Sel=sqrt(Pel^2 + Qel^2);
      parameter Real Ptable[:]={1E-6,1845,3549,5325,7521,9372,11010,12930,
          14950,16360,18500,18560,20180,22170};
      parameter Real Itable[:]={11.0,11.20,12.27,13.87,16.41,18.78,21.07,
          23.92,27.05,29.40,32.85,32.95,35.92,39.35};
      parameter Real ntable[:]={1500,1496,1493,1490,1486,1482,1479,1475,1471,
          1467,1462,1462,1458,1453};
      parameter Real ctable[:]={0.085,0.327,0.506,0.636,0.741,0.797,0.831,
          0.857,0.875,0.887,0.896,0.896,0.902,0.906};
      parameter Real etable[:]={0,0.7250,0.8268,0.8698,0.8929,0.9028,0.9064,
          0.9088,0.9089,0.9070,0.9044,0.9043,0.9008,0.8972};
    public
      output Modelica_SIunits.Power Pmech=powerSensor.power "Mechanical output";
      output Modelica_SIunits.Current I_sim=currentQuasiRMSSensor.I
        "Simulated current";
      output Modelica_SIunits.Current I_meas=combiTable1Ds.y[1]
        "Measured current";
      output Modelica_SIunits.AngularVelocity w_sim(displayUnit="1/min")=
        aimc.wMechanical "Simulated speed";
      output Modelica_SIunits.Current w_meas=combiTable1Ds.y[2]
        "Measured speed";
      output Real pf_sim=if noEvent(Sel >Modelica_Constants.small)  then Pel/
          Sel else 0 "Simulated power factor";
      output Modelica_SIunits.Current pf_meas=combiTable1Ds.y[3]
        "Measured power factor";
      output Real eff_sim=if noEvent(abs(Pel) >Modelica_Constants.small)
           then Pmech/Pel else 0 "Simulated efficiency";
      output Modelica_SIunits.Current eff_meas=combiTable1Ds.y[4]
        "Measured efficiency";
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimc(
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
        statorCoreParameters=aimcData.statorCoreParameters,
        strayLoadParameters=aimcData.strayLoadParameters,
        Lm=aimcData.Lm,
        Lrsigma=aimcData.Lrsigma,
        Rr=aimcData.Rr,
        TrRef=aimcData.TrRef,
        TsOperational=TempNominal,
        TrOperational=TempNominal,
        wMechanical(fixed=true, start=2*pi*aimcData.fsNominal/aimcData.p),
        alpha20r=aimcData.alpha20r) annotation (Placement(transformation(extent=
               {{-40,0},{-20,20}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="D") annotation (Placement(transformation(extent={
                {-40,20},{-20,40}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.ElectricalPowerSensor electricalPowerSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-30,40})));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={-30,70},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2/3)*VNominal, m)) annotation (Placement(transformation(
            origin={-70,70},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-70,30})));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-70,0},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_Rotational.Sensors.PowerSensor powerSensor
        annotation (Placement(transformation(extent={{-10,0},{10,20}})));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=aimcData.Jr)
        annotation (Placement(transformation(extent={{20,0},{40,20}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Torque torque
        annotation (Placement(transformation(extent={{70,0},{50,20}})));
      Modelica_Blocks.Math.Gain gain(k=-1)
        annotation (Placement(transformation(extent={{50,-60},{70,-40}})));
      Modelica_Blocks.Continuous.PI PI(
        k=0.01,
        T=0.01,
        initType=Modelica_Blocks.Types.Init.InitialState)
        annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
      Modelica_Blocks.Math.Feedback feedback
        annotation (Placement(transformation(extent={{-10,-40},{10,-60}})));
      Modelica_Blocks.Sources.Ramp ramp(
        height=1.2*PNominal,
        offset=0,
        startTime=4.5,
        duration=5.5)
        annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
      Modelica_Blocks.Tables.CombiTable1Ds combiTable1Ds(table={{Ptable[j],
            Itable[j],ntable[j],ctable[j],etable[j]} for j in 1:size(Ptable,
            1)}, smoothness=Modelica_Blocks.Types.Smoothness.ContinuousDerivative)
        annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData(
        statorCoreParameters(PRef=410, VRef=387.9),
        Jr=0.12,
        Rs=0.56,
        alpha20s(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Copper,
        Lssigma=1.52/(2*pi*fNominal),
        frictionParameters(PRef=180, wRef=wNominal),
        strayLoadParameters(
          PRef=0.005*sqrt(3)*VNominal*INominal*pfNominal,
          IRef=INominal/sqrt(3),
          wRef=wNominal),
        Lm=66.4/(2*pi*fNominal),
        Lrsigma=2.31/(2*pi*fNominal),
        Rr=0.42,
        alpha20r(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Aluminium)
        annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));

    initial equation
      aimc.i_0_s = 0;
      der(aimc.idq_sr) = zeros(2);
      der(aimc.idq_rr) = zeros(2);
    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,20},{-70,10}}, color={0,0,255}));
      connect(sineVoltage.plug_n, star.plug_p)
        annotation (Line(points={{-70,60},{-70,40}}, color={0,0,255}));
      connect(terminalBox.plug_sn, aimc.plug_sn) annotation (Line(
          points={{-36,20},{-36,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, aimc.plug_sp) annotation (Line(
          points={{-24,20},{-24,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentQuasiRMSSensor.plug_n, electricalPowerSensor.plug_p)
        annotation (Line(
          points={{-30,60},{-30,57.5},{-30,57.5},{-30,55},{-30,50},{-30,50}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(electricalPowerSensor.plug_nv, star.plug_p) annotation (Line(
          points={{-40,40},{-70,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(electricalPowerSensor.plug_ni, terminalBox.plugSupply)
        annotation (Line(
          points={{-30,30},{-30,26},{-30,26},{-30,22}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(aimc.flange, powerSensor.flange_a) annotation (Line(
          points={{-20,10},{-10,10}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(powerSensor.flange_b, loadInertia.flange_a) annotation (Line(
          points={{10,10},{20,10}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torque.flange, loadInertia.flange_b) annotation (Line(
          points={{50,10},{40,10}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(gain.y, torque.tau) annotation (Line(
          points={{71,-50},{80,-50},{80,10},{72,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sineVoltage.plug_p, currentQuasiRMSSensor.plug_p) annotation (
          Line(
          points={{-70,80},{-30,80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(powerSensor.power, feedback.u2) annotation (Line(
          points={{-8,-1},{-8,-20},{0,-20},{0,-42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.y, PI.u) annotation (Line(
          points={{9,-50},{18,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PI.y, gain.u) annotation (Line(
          points={{41,-50},{48,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, feedback.u1) annotation (Line(
          points={{-19,-50},{-8,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerSensor.power, combiTable1Ds.u) annotation (Line(
          points={{-8,-1},{-8,-20},{18,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        experiment(StopTime=5.0, Interval=0.001),
        Documentation(info="<HTML>
<p>Test example: Asynchronous induction machine with squirrel cage - characteristics with losses</p>
<ul>
<li>Simulate for 5 seconds: The machine is started at nominal speed, flux is build up in the machine.</li>
<li>Continue the simulation for additional 5 seconds: Subsequently a load ramp is applied.</li>
<li>Compare by plotting versus Pmech:</li>
</ul>
<table>
<tr><td>Current      </td><td>I_sim   </td><td>I_meas  </td></tr>
<tr><td>Speed        </td><td>w_sim   </td><td>w_meas  </td></tr>
<tr><td>Power factor </td><td>pf_sim  </td><td>pf_meas </td></tr>
<tr><td>Efficiency   </td><td>eff_sim </td><td>eff_meas</td></tr>
</table>
<p>Machine parameters are taken from a standard 18.5 kW 400 V 50 Hz motor, simulation results are compared with measurements.</p>
<table>
<tr><td>Nominal stator current            </td><td>     32.85  </td><td>A      </td></tr>
<tr><td>Power factor                      </td><td>      0.898 </td><td>       </td></tr>
<tr><td>Speed                             </td><td>   1462.4   </td><td>rpm    </td></tr>
<tr><td>Electrical input                  </td><td> 20,443.95  </td><td>W      </td></tr>
<tr><td>Stator copper losses              </td><td>    770.13  </td><td>W      </td></tr>
<tr><td>Stator core losses                </td><td>    410.00  </td><td>W      </td></tr>
<tr><td>Rotor  copper losses              </td><td>    481.60  </td><td>W      </td></tr>
<tr><td>Stray load losses                 </td><td>    102.22  </td><td>W      </td></tr>
<tr><td>Friction losses                   </td><td>    180.00  </td><td>W      </td></tr>
<tr><td>Mechanical output                 </td><td> 18,500.00  </td><td>W      </td></tr>
<tr><td>Efficiency                        </td><td>     90.49  </td><td>%      </td></tr>
<tr><td>Nominal torque                    </td><td>    120.79  </td><td>Nm     </td></tr>
</table>
<br>
<table>
<tr><td>Stator resistance per phase       </td><td>  0.56     </td><td>&Omega;</td></tr>
<tr><td>Temperature coefficient           </td><td> copper    </td><td>       </td></tr>
<tr><td>Reference temperature             </td><td> 20        </td><td>&deg;C </td></tr>
<tr><td>Operation temperature             </td><td> 90        </td><td>&deg;C </td></tr>
<tr><td>Stator leakage reactance at 50 Hz </td><td>  1.52     </td><td>&Omega;</td></tr>
<tr><td>Main  field    reactance at 50 Hz </td><td> 66.40     </td><td>&Omega;</td></tr>
<tr><td>Rotor  leakage reactance at 50 Hz </td><td>  2.31     </td><td>&Omega;</td></tr>
<tr><td>Rotor  resistance per phase       </td><td>  0.42     </td><td>&Omega;</td></tr>
<tr><td>Temperature coefficient           </td><td> aluminium </td><td>       </td></tr>
<tr><td>Reference temperature             </td><td> 20        </td><td>&deg;C </td></tr>
<tr><td>Operation temperature             </td><td> 90        </td><td>&deg;C </td></tr>
</table>
<p>See:<br>
Anton Haumer, Christian Kral, Hansj&ouml;rg Kapeller, Thomas B&auml;uml, Johannes V. Gragger<br>
<a href=\"https://www.modelica.org/events/modelica2009/Proceedings/memorystick/pages/papers/0103/0103.pdf\">
The AdvancedMachines Library: Loss Models for Electric Machines</a><br>
Modelica 2009, 7<sup>th</sup> International Modelica Conference</p>
</HTML>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
                    extent={{-72,100},{68,80}},
                    lineColor={0,0,255},
                    textString=
                "Simulate for 5 seconds for starting the machine."),Text(
                    extent={{-100,-80},{100,-100}},
                    lineColor={0,0,255},
                    textString=
                "Continue the simulation for additional 5 seconds: a load ramp is applied.")}));
    end AIMC_withLosses;

    model AIMC_Initialize
      "Test example: Steady-State Initialization of AsynchronousInductionMachineSquirrelCage"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.AngularVelocity wSync=2*pi*fNominal/aimc.p;
      parameter Modelica_SIunits.Time tStart=0.5 "Start time";
      parameter Modelica_SIunits.Torque TLoad=161.4 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad(displayUnit="1/min")=
           1440.45*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage
        aimc(
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
        statorCoreParameters=aimcData.statorCoreParameters,
        strayLoadParameters=aimcData.strayLoadParameters,
        Lm=aimcData.Lm,
        Lrsigma=aimcData.Lrsigma,
        Rr=aimcData.Rr,
        TrRef=aimcData.TrRef,
        phiMechanical(fixed=true),
        TsOperational=293.15,
        alpha20r=aimcData.alpha20r,
        TrOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={-10,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        freqHz=fill(fNominal, m),
        V=fill(sqrt(2/3)*VNominal, m)) annotation (Placement(transformation(
            origin={-70,10},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-70,-20})));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-70,-50},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep torqueStep(
        useSupport=false,
        startTime=tStart,
        stepTorque=-TLoad,
        offsetTorque=0) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="D") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
        aimcData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    initial equation
      aimc.wMechanical = wSync;
      aimc.i_0_s = 0;
      der(aimc.idq_sr) = zeros(2);
      der(aimc.idq_rr) = zeros(2);
    equation
      connect(star.pin_n, ground.p) annotation (Line(points={{-70,-30},{-70,-30},
              {-70,-40}}, color={0,0,255}));
      connect(sineVoltage.plug_n, star.plug_p)
        annotation (Line(points={{-70,0},{-70,-10}}, color={0,0,255}));
      connect(terminalBox.plug_sn, aimc.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, aimc.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{-10,-28},{-10,-19},{-10,-10},{-10,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(loadInertia.flange_b, torqueStep.flange) annotation (Line(
          points={{60,-40},{70,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(aimc.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(sineVoltage.plug_p, currentQuasiRMSSensor.plug_p) annotation (
          Line(
          points={{-70,20},{-10,20},{-10,10}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Steady-State Initialization of Asynchronous induction machine with squirrel cage</b><br>
The asynchronous induction machine with squirrel cage is initialized in steady-state at no-load;
at time tStart a load torque step is applied.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>aimc.wMechanical: motor's speed</li>
<li>aimc.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</HTML>"));
    end AIMC_Initialize;
    annotation (Documentation(info="<HTML>
This package contains test examples of asynchronous induction machines.
</HTML>"));
  end AsynchronousInductionMachines;

  package SynchronousInductionMachines
    "Test examples of synchronous induction machines"
    extends Modelica_Icons.ExamplesPackage;
    model SMR_Inverter
      "Test example: SynchronousInductionMachineReluctanceRotor with inverter"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency f=50 "Actual frequency";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque TLoad=46 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor
        smr(
        p=smrData.p,
        fsNominal=smrData.fsNominal,
        Rs=smrData.Rs,
        TsRef=smrData.TsRef,
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
        TsOperational=293.15,
        alpha20s=smrData.alpha20s,
        ir(each fixed=true),
        TrOperational=293.15,
        alpha20r=smrData.alpha20r) annotation (Placement(transformation(extent=
                {{-20,-50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorDisplacementAngle(p=smr.p)
        annotation (Placement(transformation(
            origin={20,-40},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica_Blocks.Sources.Ramp ramp(height=f, duration=tRamp) annotation (
         Placement(transformation(extent={{-80,50},{-60,70}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.VfController vfController(
        final m=m,
        VNominal=VNominal,
        fNominal=fNominal) annotation (Placement(transformation(extent={{-40,50},
                {-20,70}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage(
          final m=m) annotation (Placement(transformation(
            origin={0,60},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep loadTorqueStep(
        startTime=tStep,
        stepTorque=-TLoad,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="Y") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_ReluctanceRotorData
        smrData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    initial equation
      smr.is[1:2] = zeros(2);
      //conditional damper cage currents are defined as fixed start values
    equation
      connect(signalVoltage.plug_n, star.plug_p)
        annotation (Line(points={{0,70},{0,90},{-50,90}}, color={0,0,255}));
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(ramp.y, vfController.u)
        annotation (Line(points={{-59,60},{-42,60}}, color={0,0,255}));
      connect(vfController.y, signalVoltage.v)
        annotation (Line(points={{-19,60},{-7,60}}, color={0,0,255}));
      connect(loadInertia.flange_b, loadTorqueStep.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(currentQuasiRMSSensor.plug_p, signalVoltage.plug_p)
        annotation (Line(points={{0,40},{0,42.5},{0,50}}, color={0,0,255}));
      connect(smr.plug_sn, rotorDisplacementAngle.plug_n) annotation (Line(
            points={{-16,-30},{-16,-20},{26,-20},{26,-30}}, color={0,0,255}));
      connect(smr.plug_sp, rotorDisplacementAngle.plug_p)
        annotation (Line(points={{-4,-30},{14,-30}}, color={0,0,255}));
      connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{-10,-28},{-10,0},{0,0},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, smr.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sn, smr.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(smr.flange, rotorDisplacementAngle.flange) annotation (Line(
          points={{0,-40},{10,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(smr.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Synchronous induction machine with reluctance rotor fed by an ideal inverter</b><br>
An ideal frequency inverter is modeled by using a VfController and a three-phase SignalVoltage.<br>
Frequency is raised by a ramp, causing the reluctance machine to start,
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>smr.wMechanical: motor's speed</li>
<li>smr.tauElectrical: motor's torque</li>
<li>rotorDisplacementAngle.rotorDisplacementAngle: rotor displacement angle</li>
</ul>
Default machine parameters of model <i>SM_ReluctanceRotor</i> are used.
</HTML>"));
    end SMR_Inverter;

    model SMPM_Inverter
      "Test example: PermanentMagnetSynchronousInductionMachine with inverter"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency f=50 "Actual frequency";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque TLoad=181.4 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
        smpm(
        p=smpmData.p,
        fsNominal=smpmData.fsNominal,
        Rs=smpmData.Rs,
        TsRef=smpmData.TsRef,
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
        permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters,
        TsOperational=293.15,
        alpha20s=smpmData.alpha20s,
        ir(each fixed=true),
        TrOperational=293.15,
        alpha20r=smpmData.alpha20r) annotation (Placement(transformation(extent=
               {{-20,-50},{0,-30}}, rotation=0)));

      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorDisplacementAngle(p=smpm.p)
        annotation (Placement(transformation(
            origin={20,-40},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.Ramp ramp(height=f, duration=tRamp) annotation (
         Placement(transformation(extent={{-80,50},{-60,70}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.VfController vfController(
        final m=m,
        VNominal=VNominal,
        fNominal=fNominal,
        BasePhase=+Modelica_Constants.pi/2) annotation (Placement(
            transformation(extent={{-40,50},{-20,70}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage(
          final m=m) annotation (Placement(transformation(
            origin={0,60},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep loadTorqueStep(
        startTime=tStep,
        stepTorque=-TLoad,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="Y") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
        smpmData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    initial equation
      smpm.is[1:2] = zeros(2);
      //conditional damper cage currents are defined as fixed start values
    equation
      connect(signalVoltage.plug_n, star.plug_p)
        annotation (Line(points={{0,70},{0,90},{-50,90}}, color={0,0,255}));
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(ramp.y, vfController.u)
        annotation (Line(points={{-59,60},{-42,60}}, color={0,0,255}));
      connect(vfController.y, signalVoltage.v)
        annotation (Line(points={{-19,60},{-7,60}}, color={0,0,255}));
      connect(loadInertia.flange_b, loadTorqueStep.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(signalVoltage.plug_p, currentQuasiRMSSensor.plug_p)
        annotation (Line(points={{0,50},{0,50},{0,40}}, color={0,0,255}));
      connect(rotorDisplacementAngle.plug_n, smpm.plug_sn) annotation (Line(
            points={{26,-30},{26,-20},{-16,-20},{-16,-30}}, color={0,0,255}));
      connect(rotorDisplacementAngle.plug_p, smpm.plug_sp)
        annotation (Line(points={{14,-30},{-4,-30}}, color={0,0,255}));
      connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{-10,-28},{-10,0},{0,0},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sn, smpm.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, smpm.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(smpm.flange, rotorDisplacementAngle.flange) annotation (Line(
          points={{0,-40},{10,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(smpm.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Permanent magnet synchronous induction machine fed by an ideal inverter</b><br>
An ideal frequency inverter is modeled by using a VfController and a three-phase SignalVoltage.<br>
Frequency is raised by a ramp, causing the permanent magnet synchronous induction machine to start,
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>smpm.wMechanical: motor's speed</li>
<li>smpm.tauElectrical: motor's torque</li>
<li>rotorDisplacementAngle.rotorDisplacementAngle: rotor displacement angle</li>
</ul>
Default machine parameters of model <i>SM_PermanentMagnet</i> are used.
<p>
<b>In practice it is nearly impossible to drive a PMSMD without current controller.</b>
</p>
</HTML>"));
    end SMPM_Inverter;

    model SMPM_CurrentSource
      "Test example: PermanentMagnetSynchronousInductionMachine fed by current source"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency f=50 "Actual frequency";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque TLoad=181.4 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
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
        annotation (Placement(transformation(extent={{-20,-50},{0,-30}},
              rotation=0)));
      Modelica_Electrical_MultiPhase.Sources.SignalCurrent signalCurrent(
          final m=m) annotation (Placement(transformation(
            origin={-10,50},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Utilities.CurrentController currentController(p=smpm.p)
        annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
      Modelica_Blocks.Sources.Constant iq(k=84.6)
        annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
      Modelica_Blocks.Sources.Constant id(k=-53.5)
        annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
      Modelica_Electrical_Machines.Sensors.VoltageQuasiRMSSensor voltageQuasiRMSSensor
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-30,-10})));
      Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-60,-10})));
      Modelica_Electrical_Analog.Basic.Ground groundM annotation (Placement(
            transformation(
            origin={-80,-28},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="Y") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorDisplacementAngle(p=smpm.p)
        annotation (Placement(transformation(
            origin={20,-40},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Sensors.AngleSensor angleSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={10,0})));
      Modelica_Mechanics_Rotational.Sensors.TorqueSensor torqueSensor
        annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={40,-60})));
      Modelica_Mechanics_Rotational.Sensors.SpeedSensor speedSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={30,0})));
      Modelica_Mechanics_Rotational.Components.Inertia inertiaLoad(J=0.29)
        annotation (Placement(transformation(extent={{50,-50},{70,-30}})));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticSpeedDependentTorque(tau_nominal=-181.4, w_nominal(
            displayUnit="rpm") = 157.07963267949)
        annotation (Placement(transformation(extent={{100,-50},{80,-30}})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
        smpmData(useDamperCage=false)
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={-10,0},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(rotorDisplacementAngle.plug_n, smpm.plug_sn) annotation (Line(
            points={{26,-30},{26,-20},{-16,-20},{-16,-30}}, color={0,0,255}));
      connect(rotorDisplacementAngle.plug_p, smpm.plug_sp)
        annotation (Line(points={{14,-30},{-4,-30}}, color={0,0,255}));
      connect(terminalBox.plug_sn, smpm.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, smpm.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(smpm.flange, rotorDisplacementAngle.flange) annotation (Line(
          points={{0,-40},{10,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(signalCurrent.plug_p, star.plug_p) annotation (Line(
          points={{-10,60},{-10,90},{-50,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(angleSensor.flange, rotorDisplacementAngle.flange) annotation (
          Line(
          points={{10,-10},{10,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(angleSensor.phi, currentController.phi) annotation (Line(
          points={{10,11},{10,30},{-40,30},{-40,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(id.y, currentController.id_rms) annotation (Line(
          points={{-69,70},{-60,70},{-60,56},{-52,56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(iq.y, currentController.iq_rms) annotation (Line(
          points={{-69,30},{-60,30},{-60,44},{-52,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(groundM.p, terminalBox.starpoint) annotation (Line(
          points={{-70,-28},{-19,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(smpm.flange, torqueSensor.flange_a) annotation (Line(
          points={{0,-40},{30,-40},{30,-60}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(voltageQuasiRMSSensor.plug_p, terminalBox.plugSupply)
        annotation (Line(
          points={{-20,-10},{-10,-10},{-10,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(starM.plug_p, voltageQuasiRMSSensor.plug_n) annotation (Line(
          points={{-50,-10},{-40,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(starM.pin_n, groundM.p) annotation (Line(
          points={{-70,-10},{-70,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentController.y, signalCurrent.i) annotation (Line(
          points={{-29,50},{-17,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(speedSensor.flange, smpm.flange) annotation (Line(
          points={{30,-10},{30,-40},{0,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(quadraticSpeedDependentTorque.flange, inertiaLoad.flange_b)
        annotation (Line(
          points={{80,-40},{70,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torqueSensor.flange_b, inertiaLoad.flange_a) annotation (Line(
          points={{50,-60},{50,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(signalCurrent.plug_n, currentQuasiRMSSensor.plug_p) annotation (
         Line(
          points={{-10,40},{-10,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentQuasiRMSSensor.plug_n, voltageQuasiRMSSensor.plug_p)
        annotation (Line(
          points={{-10,-10},{-20,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.0, Interval=0.001), Documentation(
            info="<html>
<p>A synchronous induction machine with permanent magnets accelerates a quadratic speed dependent load from standstill.
The rms values of d- and q-current in rotor fixed coordinate system are converted to three-phase currents,
and fed to the machine. The result shows that the torque is influenced by the q-current,
whereas the stator voltage is influenced by the d-current.</p>
<p>
Default machine parameters of model <a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">SM_PermanentMagnet</a> are used.
</p>
</html>"));
    end SMPM_CurrentSource;

    model SMPM_VoltageSource
      "Test example: PermanentMagnetSynchronousInductionMachine fed by FOC"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.Frequency f=50 "Actual frequency";
      parameter Modelica_SIunits.Time tRamp=1 "Frequency ramp";
      parameter Modelica_SIunits.Torque TLoad=181.4 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.2 "Time of load torque step";
      parameter Modelica_SIunits.Inertia JLoad=0.29 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
        smpm(
        phiMechanical(start=0, fixed=true),
        wMechanical(start=0, fixed=true),
        useSupport=false,
        useThermalPort=false,
        p=smpmData.p,
        fsNominal=smpmData.fsNominal,
        Rs=smpmData.Rs,
        TsRef=smpmData.TsRef,
        Lszero=smpmData.Lszero,
        Lssigma=smpmData.Lssigma,
        Jr=smpmData.Jr,
        Js=smpmData.Js,
        frictionParameters=smpmData.frictionParameters,
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
        TrOperational=293.15,
        alpha20r=smpmData.alpha20r) annotation (Placement(transformation(extent=
               {{-20,-50},{0,-30}}, rotation=0)));

      Modelica_Electrical_MultiPhase.Sources.SignalVoltage signalVoltage(
          final m=m) annotation (Placement(transformation(
            origin={-10,50},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Blocks.Sources.Constant iq(k=84.6)
        annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
      Modelica_Blocks.Sources.Constant id(k=-53.5)
        annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="Y") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Sensors.AngleSensor angleSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={10,0})));
      Modelica_Mechanics_Rotational.Components.Inertia inertiaLoad(J=0.29)
        annotation (Placement(transformation(extent={{50,-50},{70,-30}})));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticSpeedDependentTorque(tau_nominal=-181.4, w_nominal(
            displayUnit="rpm") = 157.07963267949)
        annotation (Placement(transformation(extent={{100,-50},{80,-30}})));
      Modelica_Electrical_MultiPhase.Sensors.CurrentSensor currentSensor(m=m)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-10,0})));
      Modelica_Electrical_Machines.Utilities.VoltageController voltageController(
        p=smpm.p,
        Ld=smpm.Lssigma + smpm.Lmd,
        Lq=smpm.Lssigma + smpm.Lmq,
        Rs=Modelica_Electrical_Machines.Thermal.convertResistance(
                smpm.Rs,
                smpm.TsRef,
                smpm.alpha20s,
                smpm.TsOperational),
        fsNominal=smpm.fsNominal,
        VsOpenCircuit=smpm.VsOpenCircuit)
        annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
      Modelica_Mechanics_Rotational.Sensors.TorqueSensor torqueSensor
        annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={40,-60})));
      Modelica_Mechanics_Rotational.Sensors.SpeedSensor speedSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={30,0})));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorDisplacementAngle(p=smpm.p)
        annotation (Placement(transformation(
            origin={20,-40},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundM annotation (Placement(
            transformation(
            origin={-80,-28},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star starM(final m=m) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-60,-10})));
      Modelica_Electrical_Machines.Sensors.VoltageQuasiRMSSensor voltageQuasiRMSSensor
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={-30,-10})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
        smpmData(useDamperCage=false)
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={-10,20},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    initial equation
      smpm.is[1:2] = zeros(2);
    equation
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(terminalBox.plug_sn, smpm.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, smpm.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(quadraticSpeedDependentTorque.flange, inertiaLoad.flange_b)
        annotation (Line(
          points={{80,-40},{70,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(smpm.flange, angleSensor.flange) annotation (Line(
          points={{0,-40},{10,-40},{10,-10}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(star.plug_p, signalVoltage.plug_n) annotation (Line(
          points={{-50,90},{-10,90},{-10,60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentSensor.plug_n, terminalBox.plugSupply) annotation (Line(
          points={{-10,-10},{-10,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(id.y, voltageController.id_rms) annotation (Line(
          points={{-69,70},{-60,70},{-60,56},{-52,56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(iq.y, voltageController.iq_rms) annotation (Line(
          points={{-69,30},{-60,30},{-60,44},{-52,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(angleSensor.phi, voltageController.phi) annotation (Line(
          points={{10,11},{10,30},{-34,30},{-34,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(voltageController.y, signalVoltage.v) annotation (Line(
          points={{-29,50},{-17,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(currentSensor.i, voltageController.iActual) annotation (Line(
          points={{-21,1.9984e-015},{-46,1.9984e-015},{-46,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inertiaLoad.flange_a, torqueSensor.flange_b) annotation (Line(
          points={{50,-40},{50,-60}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torqueSensor.flange_a, smpm.flange) annotation (Line(
          points={{30,-60},{30,-40},{0,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(speedSensor.flange, smpm.flange) annotation (Line(
          points={{30,-10},{30,-40},{0,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(rotorDisplacementAngle.flange, smpm.flange) annotation (Line(
          points={{10,-40},{0,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(rotorDisplacementAngle.plug_p, smpm.plug_sp) annotation (Line(
          points={{14,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(rotorDisplacementAngle.plug_n, smpm.plug_sn) annotation (Line(
          points={{26,-30},{26,-20},{-16,-20},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageQuasiRMSSensor.plug_p, currentSensor.plug_n) annotation (
         Line(
          points={{-20,-10},{-10,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(starM.plug_p, voltageQuasiRMSSensor.plug_n) annotation (Line(
          points={{-50,-10},{-40,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(groundM.p, starM.pin_n) annotation (Line(
          points={{-70,-28},{-70,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentQuasiRMSSensor.plug_n, currentSensor.plug_p) annotation (
         Line(
          points={{-10,10},{-10,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(signalVoltage.plug_p, currentQuasiRMSSensor.plug_p) annotation (
         Line(
          points={{-10,40},{-10,30}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.0, Interval=0.001), Documentation(
            info="<html>
<p>
A synchronous induction machine with permanent magnets accelerates a quadratic speed dependent load from standstill.
The rms values of d- and q-current in rotor fixed coordinate system are controlled by the voltageController,
and the output voltages fed to the machine. The result shows that the torque is influenced by the q-current,
whereas the stator voltage is influenced by the d-current.</p>
<p>
Default machine parameters of model <a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">SM_PermanentMagnet</a> are used.
</p>
</html>"));
    end SMPM_VoltageSource;

    model SMEE_Generator
      "Test example: ElectricalExcitedSynchronousInductionMachine as Generator"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage VNominal=100
        "Nominal RMS voltage per phase";
      parameter Modelica_SIunits.Frequency fNominal=50 "Nominal frequency";
      parameter Modelica_SIunits.AngularVelocity wActual(displayUnit="1/min")=
           1499*2*Modelica_Constants.pi/60 "Actual speed";
      parameter Modelica_SIunits.Current Ie=19 "Excitation current";
      parameter Modelica_SIunits.Current Ie0=10 "Initial excitation current";
      parameter Modelica_SIunits.Angle gamma0(displayUnit="deg") = 0
        "Initial rotor displacement angle";
      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited
        smee(
        phiMechanical(start=-(Modelica_Constants.pi + gamma0)/smee.p, fixed=
              true),
        fsNominal=smeeData.fsNominal,
        Rs=smeeData.Rs,
        TsRef=smeeData.TsRef,
        Lssigma=smeeData.Lssigma,
        Lmd=smeeData.Lmd,
        Lmq=smeeData.Lmq,
        Lrsigmad=smeeData.Lrsigmad,
        Lrsigmaq=smeeData.Lrsigmaq,
        Rrd=smeeData.Rrd,
        Rrq=smeeData.Rrq,
        TrRef=smeeData.TrRef,
        VsNominal=smeeData.VsNominal,
        IeOpenCircuit=smeeData.IeOpenCircuit,
        Re=smeeData.Re,
        TeRef=smeeData.TeRef,
        sigmae=smeeData.sigmae,
        p=2,
        Jr=0.29,
        Js=0.29,
        useDamperCage=true,
        statorCoreParameters(VRef=100),
        strayLoadParameters(IRef=100),
        brushParameters(ILinear=0.01),
        TsOperational=293.15,
        alpha20s=smeeData.alpha20s,
        ir(each fixed=true),
        TrOperational=293.15,
        alpha20r=smeeData.alpha20r,
        alpha20e=smeeData.alpha20e,
        TeOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.RotorDisplacementAngle rotorDisplacementAngle(p=smee.p)
        annotation (Placement(transformation(
            origin={20,-40},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundExcitation annotation (
          Placement(transformation(
            origin={-90,-50},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Sources.ConstantSpeed constantSpeed(
          final w_fixed=wActual) annotation (Placement(transformation(extent=
                {{90,-50},{70,-30}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.MechanicalPowerSensor mechanicalPowerSensor
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Electrical_Machines.Sensors.ElectricalPowerSensor electricalPowerSensor
        annotation (Placement(transformation(
            origin={0,60},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={0,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
        final m=m,
        final V=fill(VNominal*sqrt(2), m),
        final freqHz=fill(fNominal, m)) annotation (Placement(transformation(
              extent={{-20,80},{-40,100}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
          Placement(transformation(extent={{-50,80},{-70,100}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Sources.RampCurrent rampCurrent(
        duration=0.1,
        I=Ie - Ie0,
        offset=Ie0) annotation (Placement(transformation(
            origin={-50,-40},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="Y") annotation (Placement(transformation(extent={
                {-20,-30},{0,-10}}, rotation=0)));
      parameter Modelica_Electrical_Machines.Utilities.SynchronousMachineData smeeData(
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
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));

    initial equation
      smee.is[1:2] = zeros(2);
      //conditional damper cage currents are defined as fixed start values
    equation
      connect(rotorDisplacementAngle.plug_n, smee.plug_sn) annotation (Line(
            points={{26,-30},{26,-20},{-16,-20},{-16,-30}}, color={0,0,255}));
      connect(rotorDisplacementAngle.plug_p, smee.plug_sp)
        annotation (Line(points={{14,-30},{-4,-30}}, color={0,0,255}));
      connect(star.pin_n, ground.p)
        annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
      connect(star.plug_p, sineVoltage.plug_n)
        annotation (Line(points={{-50,90},{-40,90}}, color={0,0,255}));
      connect(electricalPowerSensor.plug_ni, currentQuasiRMSSensor.plug_p)
        annotation (Line(points={{0,50},{0,46},{0,40}}, color={0,0,255}));
      connect(mechanicalPowerSensor.flange_b, constantSpeed.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(sineVoltage.plug_p, electricalPowerSensor.plug_p)
        annotation (Line(points={{-20,90},{0,90},{0,70}}, color={0,0,255}));
      connect(rampCurrent.p, groundExcitation.p)
        annotation (Line(points={{-50,-50},{-80,-50}}, color={0,0,255}));
      connect(rampCurrent.p, smee.pin_en) annotation (Line(points={{-50,-50},
              {-40,-50},{-40,-46},{-20,-46}}, color={0,0,255}));
      connect(rampCurrent.n, smee.pin_ep) annotation (Line(points={{-50,-30},
              {-40,-30},{-40,-34},{-20,-34}}, color={0,0,255}));
      connect(electricalPowerSensor.plug_nv, smee.plug_sn) annotation (Line(
            points={{-10,60},{-16,60},{-16,-30}}, color={0,0,255}));
      connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{-10,-28},{-10,0},{0,0},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sn, smee.plug_sn) annotation (Line(
          points={{-16,-30},{-16,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, smee.plug_sp) annotation (Line(
          points={{-4,-30},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(smee.flange, rotorDisplacementAngle.flange) annotation (Line(
          points={{0,-40},{10,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(smee.flange, mechanicalPowerSensor.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=30, Interval=0.005), Documentation(info=
             "<HTML>
<b>Test example: Electrical excited synchronous induction machine as generator</b><br>
An electrically excited synchronous generator is connected to the grid and driven with constant speed.
Since speed is slightly smaller than synchronous speed corresponding to mains frequency,
rotor angle is very slowly increased. This allows to see several characteristics dependent on rotor angle.
Simulate for 30 seconds and plot (versus rotorDisplacementAngle.rotorDisplacementAngle):
<ul>
<li>smee.tauElectrical</li>
<li>currentQuasiRMSSensor.I</li>
<li>electricalPowerSensor.P</li>
<li>electricalPowerSensor.Q</li>
<li>mechanicalPowerSensor.P</li>
</ul>
Default machine parameters of model <i>SM_ElectricalExcited</i> are used.
</HTML>"));
    end SMEE_Generator;

    model SMEE_LoadDump
      "Test example: ElectricalExcitedSynchronousInductionMachine with voltage controller"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.AngularVelocity wNominal=2*pi*smeeData.fsNominal
          /smee.p "Nominal speed";
      parameter Modelica_SIunits.Impedance ZNominal=3*smeeData.VsNominal^2/
          smeeData.SNominal "Nominal load impedance";
      parameter Real powerFactor(
        min=0,
        max=1) = 0.8 "Load power factor";
      parameter Modelica_SIunits.Resistance RLoad=ZNominal*powerFactor
        "Load resistance";
      parameter Modelica_SIunits.Inductance LLoad=ZNominal*sqrt(1 -
          powerFactor^2)/(2*pi*smeeData.fsNominal) "Load inductance";
      parameter Modelica_SIunits.Voltage Ve0=smee.IeOpenCircuit*
          Modelica_Electrical_Machines.Thermal.convertResistance(
                smee.Re,
                smee.TeRef,
                smee.alpha20e,
                smee.TeOperational) "No load excitation voltage";
      parameter Real k=2*Ve0/smeeData.VsNominal "Voltage controller: gain";
      parameter Modelica_SIunits.Time Ti=smeeData.Td0Transient/2
        "Voltage controller: integral time constant";
      output Real controlError=(setPointGain.y - voltageQuasiRMSSensor.V)/
          smeeData.VsNominal;
      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited
        smee(
        fsNominal=smeeData.fsNominal,
        Rs=smeeData.Rs,
        TsRef=smeeData.TsRef,
        Lssigma=smeeData.Lssigma,
        Lmd=smeeData.Lmd,
        Lmq=smeeData.Lmq,
        Lrsigmad=smeeData.Lrsigmad,
        Lrsigmaq=smeeData.Lrsigmaq,
        Rrd=smeeData.Rrd,
        Rrq=smeeData.Rrq,
        TrRef=smeeData.TrRef,
        VsNominal=smeeData.VsNominal,
        IeOpenCircuit=smeeData.IeOpenCircuit,
        Re=smeeData.Re,
        TeRef=smeeData.TeRef,
        sigmae=smeeData.sigmae,
        useDamperCage=true,
        p=2,
        Jr=0.29,
        Js=0.29,
        statorCoreParameters(VRef=100),
        strayLoadParameters(IRef=100),
        brushParameters(ILinear=0.01),
        TsOperational=293.15,
        alpha20s=smeeData.alpha20s,
        ir(each fixed=true),
        TrOperational=293.15,
        alpha20r=smeeData.alpha20r,
        alpha20e=smeeData.alpha20e,
        TeOperational=293.15) annotation (Placement(transformation(extent={{0,-40},
                {20,-20}}, rotation=0)));
      parameter Modelica_Electrical_Machines.Utilities.SynchronousMachineData smeeData(
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
        TsSpecification=293.15,
        TsRef=293.15,
        alpha20s(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        TrSpecification=293.15,
        TrRef=293.15,
        alpha20r(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        TeSpecification=293.15,
        TeRef=293.15,
        alpha20e(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero)
        annotation (Placement(transformation(extent={{0,-70},{20,-50}})));

      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="Y") annotation (Placement(transformation(extent={
                {0,-20},{20,0}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-90,0},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Speed speed
        annotation (Placement(transformation(extent={{50,-40},{30,-20}})));
      Modelica_Blocks.Sources.Ramp speedRamp(height=wNominal, duration=1)
        annotation (Placement(transformation(extent={{80,-40},{60,-20}})));
      Modelica_Mechanics_Rotational.Sensors.SpeedSensor speedSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={30,-50})));
      Modelica_Blocks.Math.Gain setPointGain(k=(smeeData.VsNominal/wNominal)/
            unitMagneticFlux)
        annotation (Placement(transformation(extent={{-50,-90},{-70,-70}})));
      Modelica_Electrical_Machines.Sensors.VoltageQuasiRMSSensor voltageQuasiRMSSensor(
          ToSpacePhasor1(y(each start=1E-3, each fixed=true))) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,0})));
      Modelica_Blocks.Continuous.LimPID voltageController(
        controllerType=Modelica_Blocks.Types.SimpleController.PI,
        k=k,
        Ti=Ti,
        yMax=2.5*Ve0,
        yMin=0,
        initType=Modelica_Blocks.Types.InitPID.InitialState,
        Td=0.001)
        annotation (Placement(transformation(extent={{-70,-20},{-50,-40}})));
      Modelica_Electrical_Analog.Sources.SignalVoltage excitationVoltage
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-30,-30})));
      Modelica_Electrical_Analog.Basic.Ground groundExcitation annotation (
          Placement(transformation(
            origin={-30,-60},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
        annotation (Placement(transformation(
            origin={10,30},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Blocks.Sources.BooleanPulse loadControl(period=4, startTime=2)
        annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
      Modelica_Electrical_MultiPhase.Ideal.CloserWithArc switch(
        m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m),
        V0=fill(30, m),
        dVdt=fill(10e3, m),
        Vmax=fill(60, m))
        annotation (Placement(transformation(extent={{0,40},{-20,60}})));
      Modelica_Electrical_MultiPhase.Basic.Resistor loadResistor(m=m, R=fill(
            RLoad, m))
        annotation (Placement(transformation(extent={{-30,40},{-50,60}})));
      Modelica_Electrical_MultiPhase.Basic.Inductor loadInductor(m=m, L=fill(
            LLoad, m))
        annotation (Placement(transformation(extent={{-60,40},{-80,60}})));
      Modelica_Electrical_MultiPhase.Basic.Star star(m=m) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-90,30})));
    protected
      constant Modelica_SIunits.MagneticFlux unitMagneticFlux=1
        annotation (HideResult=true);
    initial equation
      smee.idq_sr = zeros(2);
      //conditional damper cage currents are defined as fixed start values
      smee.ie = 0;
    equation
      connect(terminalBox.plug_sn, smee.plug_sn) annotation (Line(
          points={{4,-20},{4,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, smee.plug_sp) annotation (Line(
          points={{16,-20},{16,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(excitationVoltage.p, smee.pin_ep) annotation (Line(
          points={{-30,-20},{-20,-20},{-20,-24},{0,-24}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(excitationVoltage.n, smee.pin_en) annotation (Line(
          points={{-30,-40},{-20,-40},{-20,-36},{0,-36}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(excitationVoltage.n, groundExcitation.p) annotation (Line(
          points={{-30,-40},{-30,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageQuasiRMSSensor.plug_n, smee.plug_sn) annotation (Line(
          points={{0,-10},{4,-10},{4,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageQuasiRMSSensor.plug_p, smee.plug_sp) annotation (Line(
          points={{0,10},{16,10},{16,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n)
        annotation (Line(
          points={{10,-18},{10,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(smee.flange, speed.flange) annotation (Line(
          points={{20,-30},{30,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(speed.flange, speedSensor.flange) annotation (Line(
          points={{30,-30},{30,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(speedRamp.y, speed.w_ref) annotation (Line(
          points={{59,-30},{52,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(setPointGain.y, voltageController.u_s) annotation (Line(
          points={{-71,-80},{-80,-80},{-80,-30},{-72,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(speedSensor.w, setPointGain.u) annotation (Line(
          points={{30,-61},{30,-80},{-48,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(voltageQuasiRMSSensor.V, voltageController.u_m) annotation (
          Line(
          points={{-11,0},{-60,0},{-60,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(voltageController.y, excitationVoltage.v) annotation (Line(
          points={{-49,-30},{-37,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(loadInductor.plug_p, loadResistor.plug_n) annotation (Line(
          points={{-60,50},{-50,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(loadResistor.plug_p, switch.plug_n) annotation (Line(
          points={{-30,50},{-20,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(switch.plug_p, currentQuasiRMSSensor.plug_p) annotation (Line(
          points={{0,50},{10,50},{10,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(star.plug_p, loadInductor.plug_n) annotation (Line(
          points={{-90,40},{-90,50},{-80,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(loadControl.y, switch.control[1]) annotation (Line(
          points={{-19,80},{-10,80},{-10,57}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(loadControl.y, switch.control[2]) annotation (Line(
          points={{-19,80},{-10,80},{-10,57}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(loadControl.y, switch.control[3]) annotation (Line(
          points={{-19,80},{-10,80},{-10,57}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(star.pin_n, ground.p) annotation (Line(
          points={{-90,20},{-90,10}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=10, Interval=0.001), Documentation(info=
             "<html>
<b>Test example: Electrical excited synchronous induction machine with voltage controller</b><br>
An electrically excited synchronous generator is started with a speed ramp, then driven with constant speed.
Voltage is controlled, the set point depends on speed. After start-up the generator is loaded, the load is rejected.
Simulate for 10 seconds and plot:
<ul>
<li>voltageQuasiRMSSensor.V</li>
<li>smee.tauElectrical</li>
<li>smee.ie</li>
</ul>
Default machine parameters of model <i>SM_ElectricalExcited</i> are used.
One could try to optimize the controller parameters.
</html>"));
    end SMEE_LoadDump;

    model SMEE_Rectifier
      "Test example: ElectricalExcitedSynchronousInductionMachine with rectifier"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.AngularVelocity wNominal=2*pi*smeeData.fsNominal
          /smee.p "Nominal speed";
      parameter Modelica_SIunits.Voltage VDC0=sqrt(2*3)*smeeData.VsNominal
        "No-load DC voltage";
      parameter Modelica_SIunits.Resistance RLoad=VDC0^2/smeeData.SNominal
        "Load resistance";
      parameter Modelica_SIunits.Voltage Ve0=smee.IeOpenCircuit*
          Modelica_Electrical_Machines.Thermal.convertResistance(
                smee.Re,
                smee.TeRef,
                smee.alpha20e,
                smee.TeOperational) "No load excitation voltage";
      parameter Real k=2*Ve0/smeeData.VsNominal "Voltage controller: gain";
      parameter Modelica_SIunits.Time Ti=smeeData.Td0Transient/2
        "Voltage controller: integral time constant";
      Modelica_Electrical_Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited
        smee(
        fsNominal=smeeData.fsNominal,
        Rs=smeeData.Rs,
        TsRef=smeeData.TsRef,
        Lssigma=smeeData.Lssigma,
        Lmd=smeeData.Lmd,
        Lmq=smeeData.Lmq,
        Lrsigmad=smeeData.Lrsigmad,
        Lrsigmaq=smeeData.Lrsigmaq,
        Rrd=smeeData.Rrd,
        Rrq=smeeData.Rrq,
        TrRef=smeeData.TrRef,
        VsNominal=smeeData.VsNominal,
        IeOpenCircuit=smeeData.IeOpenCircuit,
        Re=smeeData.Re,
        TeRef=smeeData.TeRef,
        sigmae=smeeData.sigmae,
        useDamperCage=true,
        p=2,
        Jr=0.29,
        Js=0.29,
        statorCoreParameters(VRef=100),
        strayLoadParameters(IRef=100),
        brushParameters(ILinear=0.01),
        TsOperational=293.15,
        alpha20s=smeeData.alpha20s,
        ir(each fixed=true),
        TrOperational=293.15,
        alpha20r=smeeData.alpha20r,
        alpha20e=smeeData.alpha20e,
        TeOperational=293.15) annotation (Placement(transformation(extent={{0,-40},
                {20,-20}}, rotation=0)));
      parameter Modelica_Electrical_Machines.Utilities.SynchronousMachineData smeeData(
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
        TsSpecification=293.15,
        TsRef=293.15,
        alpha20s(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        TrSpecification=293.15,
        TrRef=293.15,
        alpha20r(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        TeSpecification=293.15,
        TeRef=293.15,
        alpha20e(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero)
        annotation (Placement(transformation(extent={{0,-70},{20,-50}})));

      Modelica_Electrical_Machines.Utilities.TerminalBox terminalBox(
          terminalConnection="Y") annotation (Placement(transformation(extent={
                {0,-20},{20,0}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-20,60},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_Rotational.Sources.Speed speed
        annotation (Placement(transformation(extent={{50,-40},{30,-20}})));
      Modelica_Blocks.Sources.Constant constantSpeed(k=wNominal)
        annotation (Placement(transformation(extent={{80,-40},{60,-20}})));
      Modelica_Mechanics_Rotational.Sensors.SpeedSensor speedSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={30,-50})));
      Modelica_Blocks.Math.Gain setPointGain(k=(smeeData.VsNominal/wNominal)/
            unitMagneticFlux)
        annotation (Placement(transformation(extent={{-50,-90},{-70,-70}})));
      Modelica_Blocks.Continuous.LimPID voltageController(
        controllerType=Modelica_Blocks.Types.SimpleController.PI,
        k=k,
        Ti=Ti,
        yMax=2.5*Ve0,
        yMin=0,
        initType=Modelica_Blocks.Types.InitPID.InitialState,
        Td=0.001)
        annotation (Placement(transformation(extent={{-70,-20},{-50,-40}})));
      Modelica_Electrical_Analog.Sources.SignalVoltage excitationVoltage
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-30,-30})));
      Modelica_Electrical_Analog.Basic.Ground groundExcitation annotation (
          Placement(transformation(
            origin={-30,-60},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Star star1(m=m) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-20,90})));
      Modelica_Electrical_MultiPhase.Ideal.IdealDiode idealDiode1(
        m=m,
        Ron=fill(1E-5, m),
        Goff=fill(1E-5, m),
        Vknee=fill(0, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,80})));
      Modelica_Electrical_MultiPhase.Ideal.IdealDiode idealDiode2(
        m=m,
        Ron=fill(1E-5, m),
        Goff=fill(1E-5, m),
        Vknee=fill(0, m)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,40})));
      Modelica_Electrical_MultiPhase.Basic.Star star2(m=m) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-20,30})));
      Modelica_Electrical_Analog.Basic.Capacitor capacitor1(C=2*10E-6, v(
            fixed=true, start=0)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-40,80})));
      Modelica_Electrical_Analog.Basic.Capacitor capacitor2(C=2*10E-6, v(
            fixed=true, start=0)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-40,40})));
      Modelica_Electrical_Analog.Basic.Resistor resistor(R=RLoad) annotation (
         Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-50,60})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor voltageSensor
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={-80,60})));
      Modelica_Blocks.Continuous.Filter filter(
        analogFilter=Modelica_Blocks.Types.AnalogFilter.CriticalDamping,
        filterType=Modelica_Blocks.Types.FilterType.LowPass,
        order=2,
        f_cut=20,
        gain=1/sqrt(2*3),
        normalized=true) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,0})));
    protected
      constant Modelica_SIunits.MagneticFlux unitMagneticFlux=1
        annotation (HideResult=true);
    initial equation
      smee.is[1:2] = zeros(2);
      //conditional damper cage currents are defined as fixed start values
      smee.ie = 0;
    equation
      connect(terminalBox.plug_sn, smee.plug_sn) annotation (Line(
          points={{4,-20},{4,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(terminalBox.plug_sp, smee.plug_sp) annotation (Line(
          points={{16,-20},{16,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(excitationVoltage.p, smee.pin_ep) annotation (Line(
          points={{-30,-20},{-20,-20},{-20,-24},{0,-24}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(excitationVoltage.n, smee.pin_en) annotation (Line(
          points={{-30,-40},{-20,-40},{-20,-36},{0,-36}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(excitationVoltage.n, groundExcitation.p) annotation (Line(
          points={{-30,-40},{-30,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(smee.flange, speed.flange) annotation (Line(
          points={{20,-30},{30,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(speed.flange, speedSensor.flange) annotation (Line(
          points={{30,-30},{30,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(constantSpeed.y, speed.w_ref) annotation (Line(
          points={{59,-30},{52,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(setPointGain.y, voltageController.u_s) annotation (Line(
          points={{-71,-80},{-80,-80},{-80,-30},{-72,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(speedSensor.w, setPointGain.u) annotation (Line(
          points={{30,-61},{30,-80},{-48,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(voltageController.y, excitationVoltage.v) annotation (Line(
          points={{-49,-30},{-37,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(idealDiode1.plug_p, idealDiode2.plug_n) annotation (Line(
          points={{0,70},{0,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealDiode2.plug_p, star2.plug_p) annotation (Line(
          points={{0,30},{-10,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealDiode1.plug_n, star1.plug_p) annotation (Line(
          points={{0,90},{-10,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(capacitor2.n, star2.pin_n) annotation (Line(
          points={{-40,30},{-30,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(capacitor1.p, star1.pin_n) annotation (Line(
          points={{-40,90},{-30,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(capacitor1.n, capacitor2.p) annotation (Line(
          points={{-40,70},{-40,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(capacitor1.n, ground.p) annotation (Line(
          points={{-40,70},{-40,60},{-30,60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(filter.y, voltageController.u_m) annotation (Line(
          points={{-60,-11},{-60,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(voltageSensor.v, filter.u) annotation (Line(
          points={{-70,60},{-60,60},{-60,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(terminalBox.plugSupply, idealDiode2.plug_n) annotation (Line(
          points={{10,-18},{10,60},{0,60},{0,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor.p, capacitor1.p) annotation (Line(
          points={{-50,70},{-50,90},{-40,90}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor.n, capacitor2.n) annotation (Line(
          points={{-50,50},{-50,30},{-40,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSensor.n, capacitor2.n) annotation (Line(
          points={{-80,50},{-80,30},{-40,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(voltageSensor.p, capacitor1.p) annotation (Line(
          points={{-80,70},{-80,90},{-40,90}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=1.1, Interval=0.0001), Documentation(
            info="<html>
<p><b>Test example: Electrical excited synchronous induction machine with voltage controller</b></p><p>An electrically excited synchronous generator is driven with constant speed. Voltage is controlled, the set point depends on speed. The generator is loaded with a rectifier.</p>
<p>Default machine parameters of model <i>SM_ElectricalExcited</i> are used. </p>
</html>"));
    end SMEE_Rectifier;
    annotation (Documentation(info="<HTML>
This package contains test examples of synchronous induction machines.
</HTML>"));
  end SynchronousInductionMachines;

  package DCMachines "Test examples of DC machines"
    extends Modelica_Icons.ExamplesPackage;
    model DCPM_Start
      "Test example: DC with permanent magnet starting with voltage ramp"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Va=100 "Actual armature voltage";
      parameter Modelica_SIunits.Time tStart=0.2
        "Start of armature voltage ramp";
      parameter Modelica_SIunits.Time tRamp=0.8 "Armature voltage ramp";
      parameter Modelica_SIunits.Torque TLoad=63.66 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.5 "Time of load torque step";
      parameter Modelica_SIunits.Inertia JLoad=0.15 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(
        VaNominal=dcpmData.VaNominal,
        IaNominal=dcpmData.IaNominal,
        wNominal=dcpmData.wNominal,
        TaNominal=dcpmData.TaNominal,
        Ra=dcpmData.Ra,
        TaRef=dcpmData.TaRef,
        La=dcpmData.La,
        Jr=dcpmData.Jr,
        useSupport=false,
        Js=dcpmData.Js,
        frictionParameters=dcpmData.frictionParameters,
        coreParameters=dcpmData.coreParameters,
        strayLoadParameters=dcpmData.strayLoadParameters,
        brushParameters=dcpmData.brushParameters,
        TaOperational=293.15,
        alpha20a=dcpmData.alpha20a,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        ia(fixed=true)) annotation (Placement(transformation(extent={{-20,-50},
                {0,-30}}, rotation=0)));
      Modelica_Blocks.Sources.Ramp ramp(
        duration=tRamp,
        height=Va,
        startTime=tStart) annotation (Placement(transformation(extent={{-80,
                60},{-60,80}}, rotation=0)));
      Modelica_Electrical_Analog.Sources.SignalVoltage signalVoltage
        annotation (Placement(transformation(extent={{0,30},{-20,50}},
              rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-70,40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep loadTorqueStep(
        startTime=tStep,
        stepTorque=-TLoad,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcPermanentMagnetData
        dcpmData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    equation
      connect(ramp.y, signalVoltage.v) annotation (Line(points={{-59,70},{-10,
              70},{-10,47}}, color={0,0,255}));
      connect(signalVoltage.p, dcpm.pin_ap) annotation (Line(points={{0,40},{
              0,-20},{-4,-20},{-4,-30}}, color={0,0,255}));
      connect(signalVoltage.n, ground.p)
        annotation (Line(points={{-20,40},{-60,40}}, color={0,0,255}));
      connect(dcpm.pin_an, signalVoltage.n) annotation (Line(points={{-16,-30},
              {-16,-20},{-20,-20},{-20,40}}, color={0,0,255}));
      connect(loadInertia.flange_b, loadTorqueStep.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(dcpm.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.0, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Permanent magnet DC machine started with an armature voltage ramp</b><br>
A voltage ramp is applied to the armature, causing the DC machine to start,
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 2 seconds and plot (versus time):
<ul>
<li>dcpm.ia: armature current</li>
<li>dcpm.wMechanical: motor's speed</li>
<li>dcpm.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>DC_PermanentMagnet</i> are used.
</HTML>"));
    end DCPM_Start;

    model DCEE_Start
      "Test example: DC with electrical excitation starting with voltage ramp"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Va=100 "Actual armature voltage";
      parameter Modelica_SIunits.Time tStart=0.2
        "Start of armature voltage ramp";
      parameter Modelica_SIunits.Time tRamp=0.8 "Armature voltage ramp";
      parameter Modelica_SIunits.Voltage Ve=100 "Actual excitation voltage";
      parameter Modelica_SIunits.Torque TLoad=63.66 "Nominal load torque";
      parameter Modelica_SIunits.Time tStep=1.5 "Time of load torque step";
      parameter Modelica_SIunits.Inertia JLoad=0.15 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_ElectricalExcited
        dcee(
        VaNominal=dceeData.VaNominal,
        IaNominal=dceeData.IaNominal,
        wNominal=dceeData.wNominal,
        TaNominal=dceeData.TaNominal,
        Ra=dceeData.Ra,
        TaRef=dceeData.TaRef,
        La=dceeData.La,
        Jr=dceeData.Jr,
        useSupport=false,
        Js=dceeData.Js,
        frictionParameters=dceeData.frictionParameters,
        coreParameters=dceeData.coreParameters,
        strayLoadParameters=dceeData.strayLoadParameters,
        brushParameters=dceeData.brushParameters,
        IeNominal=dceeData.IeNominal,
        Re=dceeData.Re,
        TeRef=dceeData.TeRef,
        Le=dceeData.Le,
        sigmae=dceeData.sigmae,
        TaOperational=293.15,
        alpha20a=dceeData.alpha20a,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        ia(fixed=true),
        alpha20e=dceeData.alpha20e,
        TeOperational=293.15,
        ie(fixed=true)) annotation (Placement(transformation(extent={{-20,-50},
                {0,-30}}, rotation=0)));
      Modelica_Blocks.Sources.Ramp ramp(
        duration=tRamp,
        height=Va,
        startTime=tStart) annotation (Placement(transformation(extent={{-80,
                60},{-60,80}}, rotation=0)));
      Modelica_Electrical_Analog.Sources.SignalVoltage signalVoltage
        annotation (Placement(transformation(extent={{0,30},{-20,50}},
              rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-70,40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage(V=Ve)
        annotation (Placement(transformation(
            origin={-40,-40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundExcitation annotation (
          Placement(transformation(
            origin={-70,-50},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep loadTorqueStep(
        startTime=tStep,
        stepTorque=-TLoad,
        useSupport=false,
        offsetTorque=0) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcElectricalExcitedData
        dceeData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    equation
      connect(ramp.y, signalVoltage.v) annotation (Line(points={{-59,70},{-10,
              70},{-10,47}}, color={0,0,255}));
      connect(signalVoltage.p, dcee.pin_ap) annotation (Line(points={{0,40},{
              0,-20},{-4,-20},{-4,-30}}, color={0,0,255}));
      connect(signalVoltage.n, ground.p)
        annotation (Line(points={{-20,40},{-60,40}}, color={0,0,255}));
      connect(dcee.pin_an, ground.p) annotation (Line(points={{-16,-30},{-16,
              -20},{-20,-20},{-20,40},{-60,40}}, color={0,0,255}));
      connect(constantVoltage.n, groundExcitation.p)
        annotation (Line(points={{-40,-50},{-60,-50}}, color={0,0,255}));
      connect(dcee.pin_ep, constantVoltage.p) annotation (Line(points={{-20,-34},
              {-30,-34},{-30,-30},{-40,-30}}, color={0,0,255}));
      connect(dcee.pin_en, constantVoltage.n) annotation (Line(points={{-20,-46},
              {-30,-46},{-30,-50},{-40,-50}}, color={0,0,255}));
      connect(loadInertia.flange_b, loadTorqueStep.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(dcee.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.0, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Electrically separate excited DC machine started with an armature voltage ramp</b><br>
A voltage ramp is applied to the armature, causing the DC machine to start,
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 2 seconds and plot (versus time):
<ul>
<li>dcee.ia: armature current</li>
<li>dcee.wMechanical: motor's speed</li>
<li>dcee.tauElectrical: motor's torque</li>
<li>dcee.ie: excitation current</li>
</ul>
Default machine parameters of model <i>DC_ElectricalExcited</i> are used.
</HTML>"));
    end DCEE_Start;

    model DCSE_Start
      "Test example: DC with serial excitation starting with voltage ramp"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Va=100 "Actual armature voltage";
      parameter Modelica_SIunits.Time tStart=0.1 "Start of resistance ramp";
      parameter Modelica_SIunits.Time tRamp=0.9 "Resistance ramp";
      parameter Modelica_SIunits.Torque TLoad=63.66 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad(displayUnit="1/min")=
           1410*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.15 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_SeriesExcited dcse(
        VaNominal=dcseData.VaNominal,
        IaNominal=dcseData.IaNominal,
        wNominal=dcseData.wNominal,
        TaNominal=dcseData.TaNominal,
        TeNominal=dcseData.TeNominal,
        Ra=dcseData.Ra,
        TaRef=dcseData.TaRef,
        La=dcseData.La,
        Jr=dcseData.Jr,
        useSupport=false,
        Js=dcseData.Js,
        frictionParameters=dcseData.frictionParameters,
        coreParameters=dcseData.coreParameters,
        strayLoadParameters=dcseData.strayLoadParameters,
        brushParameters=dcseData.brushParameters,
        Re=dcseData.Re,
        TeRef=dcseData.TeRef,
        Le=dcseData.Le,
        sigmae=dcseData.sigmae,
        TaOperational=293.15,
        alpha20a=dcseData.alpha20a,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        ia(fixed=true),
        alpha20e=dcseData.alpha20e,
        TeOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Blocks.Sources.Ramp ramp(
        duration=tRamp,
        startTime=tStart,
        height=-1,
        offset=1) annotation (Placement(transformation(extent={{60,0},{40,20}},
              rotation=0)));
      Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage(V=Va)
        annotation (Placement(transformation(extent={{0,50},{-20,30}},
              rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-70,40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorque(
        w_nominal=wLoad,
        TorqueDirection=false,
        tau_nominal=-TLoad,
        useSupport=false) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.VariableResistor variableResistor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,10})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcSeriesExcitedData
        dcseData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    equation
      connect(constantVoltage.n, ground.p)
        annotation (Line(points={{-20,40},{-60,40}}, color={0,0,255}));
      connect(loadInertia.flange_b, quadraticLoadTorque.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(dcse.pin_an, dcse.pin_ep) annotation (Line(points={{-16,-30},{-20,
              -30},{-20,-34}}, color={0,0,255}));
      connect(dcse.pin_en, constantVoltage.n) annotation (Line(points={{-20,-46},
              {-30,-46},{-30,-20},{-20,-20},{-20,40}}, color={0,0,255}));
      connect(dcse.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(constantVoltage.p, variableResistor.p) annotation (Line(
          points={{0,40},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(variableResistor.n, dcse.pin_ap) annotation (Line(
          points={{0,0},{0,-20},{-4,-20},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ramp.y, variableResistor.R) annotation (Line(
          points={{39,10},{11,10}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.0, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Series excited DC machine started with a series resistor</b><br>
At constant source voltage, a series resistor limiting the armature current, is reduced according to a ramp, causing the DC machine to start,
and accelerating inertias against load torque quadratic dependent on speed, finally reaching nominal speed.<br>
Simulate for 2 seconds and plot (versus time):
<ul>
<li>dcse.ia: armature current</li>
<li>dcse.wMechanical: motor's speed</li>
<li>dcse.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>DC_SeriesExcited</i> are used.
</HTML>"));
    end DCSE_Start;

    model DCSE_SinglePhase
      "Test example: DC with serial excitation starting with voltage ramp"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Va=100 "Actual armature voltage RMS";
      parameter Modelica_SIunits.Time tStart=0.1 "Start of resistance ramp";
      parameter Modelica_SIunits.Time tRamp=0.9 "Resistance ramp";
      parameter Modelica_SIunits.Torque TLoad=63.66 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad(displayUnit="1/min")=
           1410*2*Modelica_Constants.pi/60 "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.15 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_SeriesExcited dcse(
        VaNominal=dcseData.VaNominal,
        IaNominal=dcseData.IaNominal,
        wNominal=dcseData.wNominal,
        TaNominal=dcseData.TaNominal,
        TeNominal=dcseData.TeNominal,
        Ra=dcseData.Ra,
        TaRef=dcseData.TaRef,
        La=dcseData.La,
        Jr=dcseData.Jr,
        useSupport=false,
        Js=dcseData.Js,
        frictionParameters=dcseData.frictionParameters,
        coreParameters=dcseData.coreParameters,
        strayLoadParameters=dcseData.strayLoadParameters,
        brushParameters=dcseData.brushParameters,
        Re=dcseData.Re,
        TeRef=dcseData.TeRef,
        Le=dcseData.Le,
        sigmae=dcseData.sigmae,
        TaOperational=293.15,
        alpha20a=dcseData.alpha20a,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        ia(fixed=true),
        alpha20e=dcseData.alpha20e,
        TeOperational=293.15) annotation (Placement(transformation(extent={{-20,
                -50},{0,-30}}, rotation=0)));
      Modelica_Blocks.Sources.Ramp ramp(
        duration=tRamp,
        startTime=tStart,
        height=-1,
        offset=1) annotation (Placement(transformation(extent={{60,0},{40,20}},
              rotation=0)));
      Modelica_Electrical_Analog.Sources.SineVoltage constantVoltage(V=sqrt(2)
            *Va, freqHz=50) annotation (Placement(transformation(extent={{0,
                50},{-20,30}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-70,40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        quadraticLoadTorque(
        w_nominal=wLoad,
        TorqueDirection=false,
        tau_nominal=-TLoad,
        useSupport=false) annotation (Placement(transformation(extent={{90,-50},
                {70,-30}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.VariableResistor variableResistor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,10})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcSeriesExcitedData
        dcseData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    equation
      connect(constantVoltage.n, ground.p)
        annotation (Line(points={{-20,40},{-60,40}}, color={0,0,255}));
      connect(loadInertia.flange_b, quadraticLoadTorque.flange)
        annotation (Line(points={{60,-40},{70,-40}}, color={0,0,0}));
      connect(dcse.pin_an, dcse.pin_ep) annotation (Line(points={{-16,-30},{-20,
              -30},{-20,-34}}, color={0,0,255}));
      connect(dcse.pin_en, constantVoltage.n) annotation (Line(points={{-20,-46},
              {-30,-46},{-30,-20},{-20,-20},{-20,40}}, color={0,0,255}));
      connect(dcse.flange, loadInertia.flange_a) annotation (Line(
          points={{0,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(constantVoltage.p, variableResistor.p) annotation (Line(
          points={{0,40},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(variableResistor.n, dcse.pin_ap) annotation (Line(
          points={{0,0},{0,-20},{-4,-20},{-4,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ramp.y, variableResistor.R) annotation (Line(
          points={{39,10},{11,10}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.0, Interval=0.0005), Documentation(
            info="<HTML>
<b>Test example: Series excited DC machine at singlephase AC voltage started with a series resistor</b><br>
At sinusoidal source voltage, a series resistor limiting the armature current, is reduced according to a ramp, causing the DC machine to start,
and accelerating inertias against load torque quadratic dependent on speed, finally reaching nominal speed.<br>
Simulate for 2 seconds and plot (versus time):
<ul>
<li>dcse.ia: armature current</li>
<li>dcse.wMechanical: motor's speed</li>
<li>dcse.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>DC_SeriesExcited</i> are used.<br>
<b>Note:</b><br>
Since both the field and the armature current are sinusoidal, the waveform of the torque is the square of sine.
Due to the additional inductive voltage drops, output of the motor is lower, compared to the same motor (DCSE_Start) at DC voltage.
</HTML>"));
    end DCSE_SinglePhase;
    /*
  model DC_CompareCharacteristics
    "Test example: Compare torque-speed characteristic of DC motors"
    extends Modelica.Icons.Example;
    parameter Modelica.SIunits.Voltage Va=100 "Actual armature voltage";
    parameter Modelica.SIunits.Voltage Ve=100 "Actual excitation voltage";
    parameter Modelica.SIunits.AngularVelocity w0=Modelica.SIunits.Conversions.from_rpm(1500)
      "No-load speed";
    parameter Modelica.SIunits.Torque TLoad=63.66 "Nominal load torque";
    parameter Modelica.SIunits.Time tStart=0.5 "Start of load torque ramp ramp";
    parameter Modelica.SIunits.Time tRamp=2.0 "Load torque ramp";
    parameter Modelica.SIunits.Inertia JLoad=0.15 "Load's moment of inertia";

    Machines.BasicMachines.DCMachines.DC_ElectricalExcited dcee(wMechanical(start=
           w0, fixed=true), ie(start=1, fixed=true))
      annotation (Placement(transformation(extent={{-20,-10},{0,10}},
            rotation=0)));
    Modelica.Electrical.Analog.Sources.ConstantVoltage armatureVoltage(V=Va)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
                                                                     rotation=90,
          origin={-80,70})));
    Modelica.Electrical.Analog.Basic.Ground groundArmature
      annotation (Placement(transformation(
          origin={-80,40},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Electrical.Analog.Sources.ConstantVoltage excitationVoltage(V=Ve)
      annotation (Placement(transformation(
          origin={-80,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Electrical.Analog.Basic.Ground groundExcitation
      annotation (Placement(transformation(
          origin={-80,-80},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Mechanics.Rotational.Components.Inertia loadInertia1(J=JLoad)
      annotation (Placement(transformation(extent={{10,-10},{30,10}},
            rotation=0)));
    Modelica.Mechanics.Rotational.Sources.Torque loadTorque1(useSupport=false)
      annotation (Placement(transformation(extent={{60,-10},{40,10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp ramp(
      startTime=tStart,
      height=-TLoad,
      duration=tRamp,
      offset=0) annotation (Placement(transformation(extent={{100,-10},{80,10}})));
  equation
    connect(loadInertia1.flange_b, loadTorque1.flange)
      annotation (Line(points={{30,0},{30,0},{40,0}},
                                                   color={0,0,0}));
    connect(dcee.flange, loadInertia1.flange_a)
                                               annotation (Line(
        points={{0,0},{10,0}},
        color={0,0,0},
        smooth=Smooth.None));

    connect(ramp.y, loadTorque1.tau)
                                    annotation (Line(
        points={{79,0},{62,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(armatureVoltage.n, groundArmature.p) annotation (Line(
        points={{-80,60},{-80,50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(excitationVoltage.n, groundExcitation.p) annotation (Line(
        points={{-80,-60},{-80,-70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(armatureVoltage.p, dcee.pin_ap) annotation (Line(
        points={{-80,80},{-30,80},{-30,20},{-4,20},{-4,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(armatureVoltage.n, dcee.pin_an) annotation (Line(
        points={{-80,60},{-40,60},{-40,10},{-16,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(excitationVoltage.p, dcee.pin_ep) annotation (Line(
        points={{-80,-40},{-60,-40},{-60,6},{-20,6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(excitationVoltage.n, dcee.pin_en) annotation (Line(
        points={{-80,-60},{-50,-60},{-50,-6},{-20,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (
      experiment(StopTime=3, Interval=0.001),
      Documentation(info="<HTML>
<b>Test example: Compare characteristic of DC motors</b><br>
The motors are started at no-load speed, then a load ramp is applied.<br>
Simulate for 3 seconds and plot (versus time):
<ul>
<li>dcxx.ia: armature current</li>
<li>dcxx.wMechanical: motor's speed</li>
<li>dcxx.tauElectrical: motor's torque</li>
</ul>
Default machine parameters are used.
</HTML>"));
  end DC_CompareCharacteristics;
*/
    model DCPM_Temperature
      "Test example: Investigate temperature dependency of a DCPM motor"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Va=100 "Actual armature voltage";
      parameter Modelica_SIunits.Voltage Ve=100 "Actual excitation voltage";
      parameter Modelica_SIunits.AngularVelocity w0=
          Modelica_SIunits.Conversions.from_rpm(1500) "No-load speed";
      parameter Modelica_SIunits.Torque TLoad=63.66 "Nominal load torque";
      parameter Modelica_SIunits.Inertia JLoad=0.15 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(
        wMechanical(start=w0, fixed=true),
        VaNominal=dcpmData.VaNominal,
        IaNominal=dcpmData.IaNominal,
        wNominal=dcpmData.wNominal,
        TaNominal=dcpmData.TaNominal,
        Ra=dcpmData.Ra,
        TaRef=dcpmData.TaRef,
        La=dcpmData.La,
        Jr=dcpmData.Jr,
        useSupport=false,
        Js=dcpmData.Js,
        frictionParameters=dcpmData.frictionParameters,
        coreParameters=dcpmData.coreParameters,
        strayLoadParameters=dcpmData.strayLoadParameters,
        brushParameters=dcpmData.brushParameters,
        phiMechanical(fixed=true),
        ia(fixed=true),
        TaOperational=293.15,
        alpha20a=dcpmData.alpha20a,
        useThermalPort=true) annotation (Placement(transformation(extent={{-20,
                -10},{0,10}}, rotation=0)));
      Modelica_Electrical_Analog.Sources.ConstantVoltage armatureVoltage(V=Va)
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-80,70})));
      Modelica_Electrical_Analog.Basic.Ground groundArmature annotation (
          Placement(transformation(
            origin={-80,40},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{10,-10},{30,10}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.TorqueStep loadTorque(
        useSupport=false,
        stepTorque=-TLoad,
        offsetTorque=0,
        startTime=0.1) annotation (Placement(transformation(extent={{60,-10},
                {40,10}}, rotation=0)));
      Modelica_Electrical_Machines.Thermal.DCMachines.ThermalAmbientDCPM thermalAmbientDCPM(
        useTemperatureInputs=true,
        Ta=293.15,
        Tpm=293.15)
        annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
      Modelica_Blocks.Sources.Exponentials exponential(
        offset=293.15,
        outMax=60,
        riseTime=3600,
        riseTimeConst=0.5,
        fallTimeConst=0.5,
        startTime=0.1)
        annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
      Modelica_Blocks.Sources.Constant const(k=293.15)
        annotation (Placement(transformation(extent={{40,-60},{20,-40}})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcPermanentMagnetData
        dcpmData(
        alpha20a(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Copper,
        TaNominal=353.15,
        TaRef=353.15)
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));

    equation
      connect(loadInertia.flange_b, loadTorque.flange)
        annotation (Line(points={{30,0},{30,0},{40,0}}, color={0,0,0}));
      connect(dcpm.flange, loadInertia.flange_a) annotation (Line(
          points={{0,0},{10,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(armatureVoltage.n, groundArmature.p) annotation (Line(
          points={{-80,60},{-80,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armatureVoltage.p, dcpm.pin_ap) annotation (Line(
          points={{-80,80},{-4,80},{-4,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armatureVoltage.n, dcpm.pin_an) annotation (Line(
          points={{-80,60},{-16,60},{-16,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(exponential.y, thermalAmbientDCPM.TArmature) annotation (Line(
          points={{-39,-50},{-18,-50},{-18,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, thermalAmbientDCPM.TPermanentMagnet) annotation (Line(
          points={{19,-50},{-10,-50},{-10,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(dcpm.thermalPort, thermalAmbientDCPM.thermalPort) annotation (
          Line(
          points={{-10,-10},{-10,-20}},
          color={195,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=3.0, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Investigate influence of armature temperature on a DCPM motor</b><br>
The motor starts at no-load speed, then a load step is applied.<br>
Beginning with the load step, the armature temperature rises exponentially from 20 degC to 80 degC.<br>
Simulate for 3 seconds and plot (versus time):
<ul>
<li>dcpm.ia: armature current</li>
<li>dcpm.wMechanical: motor's speed</li>
<li>dcpm.tauElectrical: motor's torque</li>
<li>thermalAmbientDCPM.Q_flow_a: motor's armature losses</li>
</ul>
Default machine parameters are used, but:
<ul>
<li>The armature winding material is set to Copper.</li>
<li>Armature reference temperature is set to 80 degC.</li>
<li>Nominal armature temperature is set to 80 degC.</li>
</ul>
So the machine is at the beginning in cold condition, ending in warm condition
(with the same armature resistance as the unmodified machine).
</HTML>"));
    end DCPM_Temperature;

    model DCPM_Cooling "Test example: Cooling of a DCPM motor"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Va=100 "Actual armature voltage";
      parameter Modelica_SIunits.Voltage Ve=100 "Actual excitation voltage";
      parameter Modelica_SIunits.AngularVelocity w0=
          Modelica_SIunits.Conversions.from_rpm(1500) "No-load speed";
      parameter Modelica_SIunits.Torque TLoad=63.66 "Nominal load torque";
      parameter Modelica_SIunits.Inertia JLoad=0.15 "Load's moment of inertia";
      parameter Modelica_SIunits.Temperature TAmbient=293.15
        "Ambient temperature";
      parameter Modelica_SIunits.HeatCapacity Ca=20 "Armature's heat capacity";
      parameter Modelica_SIunits.HeatCapacity Cc=50 "Core's heat capacity";
      final parameter Modelica_SIunits.Power Losses=dcpm.Ra*dcpm.IaNominal^2
        "Nominal Losses";
      final parameter Modelica_SIunits.Temperature T0=293.15
        "Reference temperature 20 degC";
      final parameter Modelica_SIunits.TemperatureDifference dTCoolant=10
        "Coolant's temperature rise";
      final parameter Modelica_SIunits.TemperatureDifference dTArmature=dcpm.TaNominal
           - T0 - dTCoolant/2 "Armature's temperature rise over coolant";
      parameter Modelica_SIunits.ThermalConductance G_armature_core=2*Losses/
          dTArmature "Heat conductance armature - core";
      parameter Modelica_SIunits.ThermalConductance G_core_cooling=2*Losses/
          dTArmature "Heat conductance core - cooling";
      parameter Modelica_SIunits.VolumeFlowRate CoolantFlow=50 "Coolant flow";
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(
        wMechanical(start=w0, fixed=true),
        VaNominal=dcpmData.VaNominal,
        IaNominal=dcpmData.IaNominal,
        wNominal=dcpmData.wNominal,
        TaNominal=dcpmData.TaNominal,
        Ra=dcpmData.Ra,
        TaRef=dcpmData.TaRef,
        La=dcpmData.La,
        Jr=dcpmData.Jr,
        useSupport=false,
        Js=dcpmData.Js,
        frictionParameters=dcpmData.frictionParameters,
        coreParameters=dcpmData.coreParameters,
        strayLoadParameters=dcpmData.strayLoadParameters,
        brushParameters=dcpmData.brushParameters,
        phiMechanical(fixed=true),
        ia(fixed=true),
        TaOperational=293.15,
        alpha20a=dcpmData.alpha20a,
        useThermalPort=true) annotation (Placement(transformation(extent={{-20,
                20},{0,40}}, rotation=0)));
      Modelica_Electrical_Analog.Sources.ConstantVoltage armatureVoltage(V=Va)
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-80,70})));
      Modelica_Electrical_Analog.Basic.Ground groundArmature annotation (
          Placement(transformation(
            origin={-80,40},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia(J=JLoad)
        annotation (Placement(transformation(extent={{10,20},{30,40}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Torque loadTorque(useSupport=
            false) annotation (Placement(transformation(extent={{60,20},{40,
                40}}, rotation=0)));
      Modelica_Blocks.Sources.Pulse pulse(
        amplitude=-1.5*TLoad,
        offset=0,
        period=1)
        annotation (Placement(transformation(extent={{90,20},{70,40}})));
      Modelica_Thermal_HeatTransfer.Components.HeatCapacitor armature(C=Ca, T(
            start=TAmbient, fixed=true)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-50,-40})));
      Modelica_Thermal_HeatTransfer.Components.ThermalConductor armatureCore(
          G=G_armature_core)
        annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
      Modelica_Thermal_HeatTransfer.Components.HeatCapacitor core(C=Cc, T(
            start=TAmbient, fixed=true)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-10,-40})));
      Modelica_Thermal_HeatTransfer.Components.ThermalConductor coreCooling(G=
           G_core_cooling)
        annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
      Modelica_Thermal_FluidHeatFlow.Sources.Ambient inlet(
          constantAmbientTemperature=TAmbient, constantAmbientPressure=0)
        annotation (Placement(transformation(extent={{-10,-80},{-30,-60}})));
      Modelica_Thermal_FluidHeatFlow.Sources.VolumeFlow volumeFlow(
        T0=TAmbient,
        constantVolumeFlow=CoolantFlow,
        m=0) annotation (Placement(transformation(extent={{0,-80},{20,-60}})));
      Modelica_Thermal_FluidHeatFlow.Components.HeatedPipe cooling(
        tapT=0.5,
        T0=TAmbient,
        m=0,
        h_g=0,
        V_flowLaminar=0.1,
        dpLaminar(displayUnit="Pa") = 0.1,
        V_flowNominal=1,
        dpNominal(displayUnit="Pa") = 1,
        T0fixed=false)
        annotation (Placement(transformation(extent={{30,-60},{50,-80}})));
      Modelica_Thermal_FluidHeatFlow.Sources.Ambient outlet(
          constantAmbientTemperature=TAmbient, constantAmbientPressure=0)
        annotation (Placement(transformation(extent={{60,-80},{80,-60}})));
      Modelica_Thermal_HeatTransfer.Sources.FixedTemperature fixedTemperature(
          T=TAmbient)
        annotation (Placement(transformation(extent={{42,-10},{22,10}})));
    protected
      Modelica_Electrical_Machines_Interfaces.DCMachines.ThermalPortDCPM thermalPort
        annotation (Placement(transformation(extent={{-14,-4},{-6,4}})));
    public
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcPermanentMagnetData
        dcpmData(
        alpha20a(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Copper,
        TaNominal=353.15,
        TaRef=353.15)
        annotation (Placement(transformation(extent={{-60,20},{-40,40}})));

    equation
      connect(loadInertia.flange_b, loadTorque.flange)
        annotation (Line(points={{30,30},{30,30},{40,30}}, color={0,0,0}));
      connect(dcpm.flange, loadInertia.flange_a) annotation (Line(
          points={{0,30},{10,30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(armatureVoltage.n, groundArmature.p) annotation (Line(
          points={{-80,60},{-80,50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armatureVoltage.p, dcpm.pin_ap) annotation (Line(
          points={{-80,80},{-4,80},{-4,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armatureVoltage.n, dcpm.pin_an) annotation (Line(
          points={{-80,60},{-16,60},{-16,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armature.port, armatureCore.port_a) annotation (Line(
          points={{-50,-30},{-40,-30}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(armatureCore.port_b, core.port) annotation (Line(
          points={{-20,-30},{-10,-30}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(core.port, coreCooling.port_a) annotation (Line(
          points={{-10,-30},{0,-30}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(pulse.y, loadTorque.tau) annotation (Line(
          points={{69,30},{62,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(coreCooling.port_b, cooling.heatPort) annotation (Line(
          points={{20,-30},{40,-30},{40,-60}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(cooling.flowPort_b, outlet.flowPort) annotation (Line(
          points={{50,-70},{60,-70}},
          color={255,0,0},
          smooth=Smooth.None));
      connect(inlet.flowPort, volumeFlow.flowPort_a) annotation (Line(
          points={{-10,-70},{0,-70}},
          color={255,0,0},
          smooth=Smooth.None));
      connect(volumeFlow.flowPort_b, cooling.flowPort_a) annotation (Line(
          points={{20,-70},{30,-70}},
          color={255,0,0},
          smooth=Smooth.None));
      connect(dcpm.thermalPort, thermalPort) annotation (Line(
          points={{-10,20},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armature.port, thermalPort.heatPortArmature) annotation (Line(
          points={{-50,-30},{-50,0},{-10,0}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(core.port, thermalPort.heatPortCore) annotation (Line(
          points={{-10,-30},{-10,0}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(fixedTemperature.port, thermalPort.heatPortStrayLoad)
        annotation (Line(
          points={{22,0},{-10,0}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(fixedTemperature.port, thermalPort.heatPortFriction)
        annotation (Line(
          points={{22,0},{-10,0}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(fixedTemperature.port, thermalPort.heatPortBrush) annotation (
          Line(
          points={{22,0},{-10,0}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(fixedTemperature.port, thermalPort.heatPortPermanentMagnet)
        annotation (Line(
          points={{22,0},{-10,0}},
          color={191,0,0},
          smooth=Smooth.None));
      annotation (experiment(StopTime=25, Interval=0.001), Documentation(info=
             "<HTML>
<b>Test example: Demonstrate cooling of a DCPM motor</b><br>
The motor starts at no-load speed, then load pulses are applied.<br>
The cooling circuit consists of armature's thermal capacitance,
a thermal conductance between armature and core, core's thermal capacitance and
a thermal conductance between core and coolant.
The coolant flow circuit consists of inlet, volume flow, a pipe connected to the core and the outlet.<br>
<b>Please note:</b>
<ul>
<li>All unused heat ports of the thermal port (i.e., without loss sources in the machine: brush, stray, friction, permanent magnet) have to be connected to a constant temperature source.</li>
<li>The thermal capacitances (i.e., time constants) are unusual small to provide short simulation time!</li>
<li>The coolant is a theoretical coolant with specific mass = 1 kg/m3 and cp = 1 J/kg.K.</li>
<li>The thermal conductances as well as the coolant flow are parametrized such way, that:</li>
</ul>
<ol>
<li>the total coolant's temperature rise is 10 K (over coolant inlet)</li>
<li>the core's temperature rise is 27.5 K (over coolant's average temperature between inlet and outlet)</li>
<li>the armature's temperature rise is 55 K (over coolant's average temperature between inlet and outlet)</li>
</ol>
Simulate for 25 seconds and plot (versus time):
<ul>
<li>armature.T: armature temperature</li>
<li>core.T: core temperature</li>
<li>cooling.T: coolant temperature at outlet</li>
</ul>
Therefore the armature temperature would reach nominal armature temperature at constant nominal load.<br>
Default machine parameters are used, but:
<ul>
<li>The armature winding material is set to Copper.</li>
<li>Armature reference temperature is set to 80 degC.</li>
<li>Nominal armature temperature is set to 80 degC.</li>
</ul>
</HTML>"));
    end DCPM_Cooling;

    model DCPM_QuasiStationary
      "Test example: Compare DCPM motors transient - quasistationary"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Va=100 "Actual armature voltage";
      parameter Modelica_SIunits.Voltage Ve=100 "Actual excitation voltage";
      parameter Modelica_SIunits.AngularVelocity w0=
          Modelica_SIunits.Conversions.from_rpm(1500) "No-load speed";
      parameter Modelica_SIunits.Torque TLoad=63.66 "Nominal load torque";
      parameter Modelica_SIunits.Inertia JLoad=0.15 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm1(
        VaNominal=dcpmData.VaNominal,
        IaNominal=dcpmData.IaNominal,
        wNominal=dcpmData.wNominal,
        TaNominal=dcpmData.TaNominal,
        Ra=dcpmData.Ra,
        TaRef=dcpmData.TaRef,
        La=dcpmData.La,
        Jr=dcpmData.Jr,
        useSupport=false,
        Js=dcpmData.Js,
        frictionParameters=dcpmData.frictionParameters,
        coreParameters=dcpmData.coreParameters,
        strayLoadParameters=dcpmData.strayLoadParameters,
        brushParameters=dcpmData.brushParameters,
        phiMechanical(fixed=true),
        ia(fixed=true),
        TaOperational=293.15,
        alpha20a=dcpmData.alpha20a,
        wMechanical(fixed=true, start=w0)) annotation (Placement(transformation(
              extent={{-20,20},{0,40}}, rotation=0)));
      Modelica_Electrical_Analog.Sources.ConstantVoltage armatureVoltage(V=Va)
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-80,50})));
      Modelica_Electrical_Analog.Basic.Ground groundArmature annotation (
          Placement(transformation(
            origin={-80,20},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia1(J=JLoad)
        annotation (Placement(transformation(extent={{10,20},{30,40}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Torque loadTorque1(useSupport=
            false) annotation (Placement(transformation(extent={{60,20},{40,
                40}}, rotation=0)));
      Modelica_Blocks.Sources.Pulse pulse(
        amplitude=-1.5*TLoad,
        offset=0,
        period=1)
        annotation (Placement(transformation(extent={{100,-10},{80,10}})));
      Modelica_Electrical_Machines.BasicMachines.QuasiStationaryDCMachines.DC_PermanentMagnet
        dcpm2(
        VaNominal=dcpmData.VaNominal,
        IaNominal=dcpmData.IaNominal,
        wNominal=dcpmData.wNominal,
        TaNominal=dcpmData.TaNominal,
        Ra=dcpmData.Ra,
        TaRef=dcpmData.TaRef,
        La=dcpmData.La,
        Jr=dcpmData.Jr,
        useSupport=false,
        Js=dcpmData.Js,
        frictionParameters=dcpmData.frictionParameters,
        coreParameters=dcpmData.coreParameters,
        strayLoadParameters=dcpmData.strayLoadParameters,
        brushParameters=dcpmData.brushParameters,
        phiMechanical(fixed=true),
        wMechanical(fixed=true, start=w0),
        TaOperational=293.15,
        alpha20a=dcpmData.alpha20a) annotation (Placement(transformation(extent=
               {{-20,-40},{0,-20}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia2(J=JLoad)
        annotation (Placement(transformation(extent={{10,-40},{30,-20}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.Torque loadTorque2(useSupport=
            false) annotation (Placement(transformation(extent={{60,-40},{40,
                -20}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcPermanentMagnetData
        dcpmData
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
    equation
      connect(loadInertia1.flange_b, loadTorque1.flange)
        annotation (Line(points={{30,30},{30,30},{40,30}}, color={0,0,0}));
      connect(dcpm1.flange, loadInertia1.flange_a) annotation (Line(
          points={{0,30},{10,30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(armatureVoltage.n, groundArmature.p) annotation (Line(
          points={{-80,40},{-80,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armatureVoltage.p, dcpm1.pin_ap) annotation (Line(
          points={{-80,60},{-4,60},{-4,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armatureVoltage.n, dcpm1.pin_an) annotation (Line(
          points={{-80,40},{-16,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pulse.y, loadTorque1.tau) annotation (Line(
          points={{79,0},{70,0},{70,30},{62,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(loadInertia2.flange_b, loadTorque2.flange) annotation (Line(
            points={{30,-30},{30,-30},{40,-30}}, color={0,0,0}));
      connect(dcpm2.flange, loadInertia2.flange_a) annotation (Line(
          points={{0,-30},{10,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(pulse.y, loadTorque2.tau) annotation (Line(
          points={{79,0},{70,0},{70,-30},{62,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(armatureVoltage.p, dcpm2.pin_ap) annotation (Line(
          points={{-80,60},{-40,60},{-40,0},{-4,0},{-4,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(armatureVoltage.n, dcpm2.pin_an) annotation (Line(
          points={{-80,40},{-60,40},{-60,-20},{-16,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.0, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Compare DCPM motors transient and quasistationary</b><br>
The motors start at no-load speed, then load pulses are applied.<br>
Simulate for 2 seconds and plot (versus time):
<ul>
<li>dcpm1.ia: armature current of transient model</li>
<li>dcpm1.wMechanical: motor's speed of transient model</li>
<li>dcpm1.tauElectrical: motor's torque of transient model</li>
<li>dcpm2.ia: armature current of quasistationary model</li>
<li>dcpm2.wMechanical: motor's speed of quasistationary model</li>
<li>dcpm2.tauElectrical: motor's torque of quasistationary model</li>
</ul>
</HTML>"));
    end DCPM_QuasiStationary;

    model DCPM_withLosses
      "Test example: Investigate influence of losses on DCPM motor performance"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      parameter Modelica_SIunits.Voltage Va=100 "Actual armature voltage";
      parameter Modelica_SIunits.Time tStart=0.2
        "Start of armature voltage ramp";
      parameter Modelica_SIunits.Time tRamp=0.8 "Armature voltage ramp";
      parameter Modelica_SIunits.Torque TLoad1=63.66 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad1=1425*2*pi/60
        "Nominal load speed";
      parameter Modelica_SIunits.Torque TLoad2=61.30 "Nominal load torque";
      parameter Modelica_SIunits.AngularVelocity wLoad2=1417.5*2*pi/60
        "Nominal load speed";
      parameter Modelica_SIunits.Inertia JLoad=0.15 "Load's moment of inertia";
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm1(
        VaNominal=dcpmData1.VaNominal,
        IaNominal=dcpmData1.IaNominal,
        wNominal=dcpmData1.wNominal,
        TaNominal=dcpmData1.TaNominal,
        Ra=dcpmData1.Ra,
        TaRef=dcpmData1.TaRef,
        La=dcpmData1.La,
        Jr=dcpmData1.Jr,
        useSupport=false,
        Js=dcpmData1.Js,
        frictionParameters=dcpmData1.frictionParameters,
        coreParameters=dcpmData1.coreParameters,
        strayLoadParameters=dcpmData1.strayLoadParameters,
        brushParameters=dcpmData1.brushParameters,
        TaOperational=293.15,
        alpha20a=dcpmData1.alpha20a,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        ia(fixed=true)) annotation (Placement(transformation(extent={{0,0},{20,
                20}}, rotation=0)));
      Modelica_Blocks.Sources.Ramp ramp(
        duration=tRamp,
        height=Va,
        startTime=tStart) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-70,70})));
      Modelica_Electrical_Analog.Sources.SignalVoltage signalVoltage
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-40,70})));
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            transformation(
            origin={-60,30},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia1(J=JLoad)
        annotation (Placement(transformation(extent={{30,0},{50,20}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        loadTorque1(
        useSupport=false,
        tau_nominal=-TLoad1,
        TorqueDirection=false,
        w_nominal=wLoad1) annotation (Placement(transformation(extent={{80,0},
                {60,20}}, rotation=0)));
      Modelica_Electrical_Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm2(
        VaNominal=dcpmData2.VaNominal,
        IaNominal=dcpmData2.IaNominal,
        wNominal=dcpmData2.wNominal,
        TaNominal=dcpmData2.TaNominal,
        Ra=dcpmData2.Ra,
        TaRef=dcpmData2.TaRef,
        La=dcpmData2.La,
        Jr=dcpmData2.Jr,
        useSupport=false,
        Js=dcpmData2.Js,
        frictionParameters=dcpmData2.frictionParameters,
        coreParameters=dcpmData2.coreParameters,
        strayLoadParameters=dcpmData2.strayLoadParameters,
        brushParameters=dcpmData2.brushParameters,
        alpha20a=dcpmData2.alpha20a,
        phiMechanical(fixed=true),
        wMechanical(fixed=true),
        ia(fixed=true),
        TaOperational=368.15,
        core(v(start=0))) annotation (Placement(transformation(extent={{0,-60},
                {20,-40}}, rotation=0)));
      Modelica_Mechanics_Rotational.Components.Inertia loadInertia2(J=JLoad)
        annotation (Placement(transformation(extent={{30,-60},{50,-40}},
              rotation=0)));
      Modelica_Mechanics_Rotational.Sources.QuadraticSpeedDependentTorque
        loadTorque2(
        useSupport=false,
        tau_nominal=-TLoad2,
        TorqueDirection=false,
        w_nominal=wLoad2) annotation (Placement(transformation(extent={{80,-60},
                {60,-40}}, rotation=0)));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcPermanentMagnetData
        dcpmData1
        annotation (Placement(transformation(extent={{0,60},{20,80}})));
      parameter
        Modelica_Electrical_Machines.Utilities.ParameterRecords.DcPermanentMagnetData
        dcpmData2(
        Ra=0.03864,
        alpha20a(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Copper,
        wNominal=148.44025288212,
        TaNominal=368.15,
        frictionParameters(PRef=100),
        coreParameters(PRef=200),
        strayLoadParameters(PRef=50),
        brushParameters(V=0.5))
        annotation (Placement(transformation(extent={{0,-100},{20,-80}})));

    equation
      connect(ramp.y, signalVoltage.v)
        annotation (Line(points={{-59,70},{-47,70}}, color={0,0,255}));
      connect(signalVoltage.n, ground.p) annotation (Line(points={{-40,60},{-40,
              60},{-40,40},{-60,40}}, color={0,0,255}));
      connect(loadInertia1.flange_b, loadTorque1.flange)
        annotation (Line(points={{50,10},{60,10}}, color={0,0,0}));
      connect(dcpm1.flange, loadInertia1.flange_a) annotation (Line(
          points={{20,10},{30,10}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(loadInertia2.flange_b, loadTorque2.flange)
        annotation (Line(points={{50,-50},{60,-50}}, color={0,0,0}));
      connect(dcpm2.flange, loadInertia2.flange_a) annotation (Line(
          points={{20,-50},{30,-50}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(signalVoltage.p, dcpm1.pin_ap) annotation (Line(
          points={{-40,80},{-20,80},{-20,40},{16,40},{16,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(signalVoltage.p, dcpm2.pin_ap) annotation (Line(
          points={{-40,80},{-20,80},{-20,-20},{16,-20},{16,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(signalVoltage.n, dcpm1.pin_an) annotation (Line(
          points={{-40,60},{-40,20},{4,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(signalVoltage.n, dcpm2.pin_an) annotation (Line(
          points={{-40,60},{-40,-40},{4,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (experiment(StopTime=2.0, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Investigate influence of losses on DCPM motor performance</b><br>
Both motors are started with a voltage ramp applied to the armature, causing the DC machines to start,
and accelerating inertias. Both machines are loading with a quadratic speed dependent load torque.<br>
The first machine <code>dcpm1</code> uses default machine parameters of model <i>DC_PermanentMagnet</i>,
the second machine <code>dcpm2</code> is parametrized with additional losses:<br>
<table>
<tr><td>                            </td><td>   dcpm1</td><td>   dcpm2</td><td>     </td></tr>
<tr><td>Armature voltage            </td><td>     100</td><td>     100</td><td>    V</td></tr>
<tr><td>Armature current            </td><td>     100</td><td>     100</td><td>    A</td></tr>
<tr><td>Inner voltage               </td><td>    95.0</td><td>    94.5</td><td>    V</td></tr>
<tr><td>Nominal speed               </td><td>  1425.0</td><td>  1417.5</td><td>  rpm</td></tr>
<tr><td>Armature resistance         </td><td> 0.05000</td><td> 0.03864</td><td>  Ohm</td></tr>
<tr><td>Temperature coefficient     </td><td>     n/a</td><td> 0.00392</td><td>  1/K</td></tr>
<tr><td>Reference temperature       </td><td>     n/a</td><td>      20</td><td> degC</td></tr>
<tr><td>Operation temperature       </td><td>     n/a</td><td>      95</td><td> degC</td></tr>
<tr><td>Brush voltage drop          </td><td>     n/a</td><td>     0.5</td><td>    V</td></tr>
<tr><td>Electrical input            </td><td>  10,000</td><td>  10,000</td><td>    W</td></tr>
<tr><td>Armature copper losses      </td><td>     500</td><td>     500</td><td>    W</td></tr>
<tr><td>Core losses                 </td><td>     n/a</td><td>     200</td><td>    W</td></tr>
<tr><td>Stray load losses           </td><td>     n/a</td><td>      50</td><td>    W</td></tr>
<tr><td>Friction losses             </td><td>     n/a</td><td>     100</td><td>    W</td></tr>
<tr><td>Brush losses                </td><td>     n/a</td><td>      50</td><td>    W</td></tr>
<tr><td>Mechanical output           </td><td>   9,500</td><td>   9,100</td><td>    W</td></tr>
<tr><td>Nominal torque              </td><td>   63,66</td><td>   61,30</td><td>   Nm</td></tr>
</table>
<br>
Note: The reference values (voltage, current, speed) are already propagated to the loss records,
using the nominal operation point.<br>
See:<br>
Anton Haumer, Christian Kral, Hansj&ouml;rg Kapeller, Thomas B&auml;uml, Johannes V. Gragger<br>
<a href=\"https://www.modelica.org/events/modelica2009/Proceedings/memorystick/pages/papers/0103/0103.pdf\">
The AdvancedMachines Library: Loss Models for Electric Machines</a><br>
Modelica 2009, 7<sup>th</sup> International Modelica Conference
</HTML>"));
    end DCPM_withLosses;
    annotation (Documentation(info="<HTML>
This package contains test examples of DC machines.
</HTML>"));
  end DCMachines;

  package Transformers "Test examples of transformers"
    extends Modelica_Icons.ExamplesPackage;
    model TransformerTestbench "Transformer Testbench"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Resistance RL[3]=fill(1/3, 3)
        "Load resistance";
      Modelica_Electrical_MultiPhase.Sources.SineVoltage source(freqHz=fill(
            50, 3), V=fill(sqrt(2/3)*100, 3)) annotation (Placement(
            transformation(
            origin={-90,-10},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star starS annotation (Placement(
            transformation(
            origin={-90,-40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundS annotation (Placement(
            transformation(extent={{-100,-80},{-80,-60}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.ElectricalPowerSensor electricalPowerSensorS
        annotation (Placement(transformation(extent={{-90,0},{-70,20}},
              rotation=0)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensorS
        annotation (Placement(transformation(extent={{-60,20},{-40,0}},
              rotation=0)));
      Modelica_Electrical_Machines.Sensors.VoltageQuasiRMSSensor voltageQuasiRMSSensorS
        annotation (Placement(transformation(
            origin={-50,-30},
            extent={{-10,10},{10,-10}},
            rotation=180)));
      Modelica_Electrical_MultiPhase.Basic.Delta deltaS annotation (Placement(
            transformation(
            origin={-50,-10},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_Analog.Basic.Resistor earth(R=1e6) annotation (
          Placement(transformation(
            origin={0,-40},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundT annotation (Placement(
            transformation(extent={{-10,-80},{10,-60}}, rotation=0)));
      Modelica_Electrical_Machines.Sensors.VoltageQuasiRMSSensor voltageRMSSensorL
        annotation (Placement(transformation(
            origin={50,-30},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_MultiPhase.Basic.Delta deltaL annotation (Placement(
            transformation(
            origin={50,-10},
            extent={{-10,10},{10,-10}},
            rotation=180)));
      Modelica_Electrical_Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensorL
        annotation (Placement(transformation(extent={{40,20},{60,0}}, rotation=
                0)));
      Modelica_Electrical_Machines.Sensors.ElectricalPowerSensor electricalPowerSensorL
        annotation (Placement(transformation(extent={{70,0},{90,20}}, rotation=
                0)));
      Modelica_Electrical_MultiPhase.Basic.Resistor load(R=RL) annotation (
          Placement(transformation(
            origin={90,-10},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star starL annotation (Placement(
            transformation(
            origin={90,-40},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundL annotation (Placement(
            transformation(extent={{80,-80},{100,-60}}, rotation=0)));
      parameter Modelica_Electrical_Machines.Utilities.TransformerData transformerData(
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
      Modelica_Electrical_Machines.BasicMachines.Transformers.Dy.Dy01 transformer(
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
      transformer.i2[1:2] = zeros(2);
    equation
      connect(starS.pin_n, groundS.p)
        annotation (Line(points={{-90,-50},{-90,-60}}, color={0,0,255}));
      connect(source.plug_n, starS.plug_p)
        annotation (Line(points={{-90,-20},{-90,-30}}, color={0,0,255}));
      connect(starL.pin_n, groundL.p)
        annotation (Line(points={{90,-50},{90,-60}}, color={0,0,255}));
      connect(load.plug_n, starL.plug_p)
        annotation (Line(points={{90,-20},{90,-30}}, color={0,0,255}));
      connect(earth.n, groundT.p)
        annotation (Line(points={{0,-50},{0,-50},{0,-60}}, color={0,0,255}));
      connect(electricalPowerSensorS.plug_nv, starS.plug_p) annotation (Line(
            points={{-80,0},{-80,-30},{-90,-30}}, color={0,0,255}));
      connect(source.plug_p, electricalPowerSensorS.plug_p)
        annotation (Line(points={{-90,0},{-90,10}}, color={0,0,255}));
      connect(electricalPowerSensorS.plug_ni, currentQuasiRMSSensorS.plug_p)
        annotation (Line(points={{-70,10},{-60,10}}, color={0,0,255}));
      connect(currentQuasiRMSSensorL.plug_n, electricalPowerSensorL.plug_p)
        annotation (Line(points={{60,10},{70,10}}, color={0,0,255}));
      connect(electricalPowerSensorL.plug_ni, load.plug_p)
        annotation (Line(points={{90,10},{90,0}}, color={0,0,255}));
      connect(electricalPowerSensorL.plug_nv, starL.plug_p) annotation (Line(
            points={{80,0},{80,-30},{90,-30}}, color={0,0,255}));
      connect(currentQuasiRMSSensorS.plug_n, transformer.plug1) annotation (
          Line(
          points={{-40,10},{-20,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(transformer.plug2, currentQuasiRMSSensorL.plug_p) annotation (
          Line(
          points={{20,10},{40,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(deltaS.plug_p, voltageQuasiRMSSensorS.plug_n) annotation (Line(
          points={{-60,-10},{-60,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(deltaS.plug_n, voltageQuasiRMSSensorS.plug_p) annotation (Line(
          points={{-40,-10},{-40,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentQuasiRMSSensorS.plug_n, deltaS.plug_n) annotation (Line(
          points={{-40,10},{-40,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(currentQuasiRMSSensorL.plug_p, deltaL.plug_n) annotation (Line(
          points={{40,10},{40,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(deltaL.plug_n, voltageRMSSensorL.plug_p) annotation (Line(
          points={{40,-10},{40,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(deltaL.plug_p, voltageRMSSensorL.plug_n) annotation (Line(
          points={{60,-10},{60,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Documentation(info="<HTML>
<h4>Transformer testbench:</h4>
<p>
You may choose different connections as well as vary the load (even not symmetrical).
</p>
<p>
<b>Please pay attention</b> to proper grounding of the primary and secondary part of the whole circuit.<br>
The primary and secondary starpoint are available as connectors, if the connection is not delta (D or d).
</p>
<p>
In some cases it may be necessary to ground the transformer's starpoint even though the source's or load's starpoint are grounded:
</p>
<ul>
<li>Yy ... Grounding of transformer's primary or secondary starpoint with reasonable high earthing resistance is necessary.</li>
<li>Yd ... No grounding necessary.</li>
<li>Yz ... Grounding of transformer's primary starpoint with reasonable high earthing resistance is necessary.</li>
<li>Dy ... No grounding necessary.</li>
<li>Dd ... No grounding necessary.</li>
<li>Dz ... No grounding necessary.</li>
</ul>
</HTML>"),
         experiment(StopTime=0.1, Interval=0.001));
    end TransformerTestbench;

    model AsymmetricalLoad "AsymmetricalLoad"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Resistance RL=1 "Load resistance";
      Modelica_Electrical_MultiPhase.Sources.SineVoltage source(freqHz=fill(
            50, 3), V=fill(sqrt(2/3)*100, 3)) annotation (Placement(
            transformation(
            origin={-90,-10},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star starS annotation (Placement(
            transformation(
            origin={-90,-40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundS annotation (Placement(
            transformation(extent={{-100,-80},{-80,-60}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.CurrentSensor currentSensorS
        annotation (Placement(transformation(extent={{-60,20},{-40,0}},
              rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground groundL annotation (Placement(
            transformation(extent={{0,-80},{20,-60}}, rotation=0)));
      parameter Modelica_Electrical_Machines.Utilities.TransformerData transformerData(
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
      Modelica_Electrical_Machines.BasicMachines.Transformers.Dy.Dy01 transformer(
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

      Modelica_Electrical_MultiPhase.Basic.PlugToPin_n plugToPin_n(k=1)
        annotation (Placement(transformation(extent={{20,0},{40,20}})));
      Modelica_Electrical_Analog.Basic.Resistor load(R=RL) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={50,0})));
      Modelica_Electrical_Analog.Basic.Resistor earth(R=1e6) annotation (
          Placement(transformation(
            origin={-10,-40},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundT annotation (Placement(
            transformation(extent={{-20,-80},{0,-60}}, rotation=0)));
    initial equation
      transformer.i2[1] = 0;
    equation
      connect(starS.pin_n, groundS.p)
        annotation (Line(points={{-90,-50},{-90,-60}}, color={0,0,255}));
      connect(source.plug_n, starS.plug_p)
        annotation (Line(points={{-90,-20},{-90,-30}}, color={0,0,255}));
      connect(currentSensorS.plug_n, transformer.plug1) annotation (Line(
          points={{-40,10},{-20,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(transformer.plug2, plugToPin_n.plug_n) annotation (Line(
          points={{20,10},{28,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(transformer.starpoint2, groundL.p) annotation (Line(
          points={{10,-10},{10,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(load.p, plugToPin_n.pin_n) annotation (Line(
          points={{50,10},{32,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(transformer.starpoint2, load.n) annotation (Line(
          points={{10,-10},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(source.plug_p, currentSensorS.plug_p) annotation (Line(
          points={{-90,0},{-90,10},{-60,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(earth.n, groundT.p) annotation (Line(points={{-10,-50},{-10,-50},
              {-10,-60}}, color={0,0,255}));
      annotation (Documentation(info="<HTML>
<h4>Asymmetrical (singlephase) load:</h4>
<p>
You may choose different connections.
</p>
<p>
<b>Please pay attention</b> to proper grounding of the primary and secondary part of the whole circuit.<br>
The primary and secondary starpoint are available as connectors, if the connection is not delta (D or d).
</p>
<p>
In some cases it may be necessary to ground the transformer's starpoint even though the source's or load's starpoint are grounded:
</p>
<ul>
<li>Yy with primary starpoint connected to source's starpoint: primary current in only one phase</li>
<li>Yy primary starpoint  not connected to source's starpoint: secondary voltage breaks down</li>
<li>Yz ... Grounding of transformer's primary starpoint with reasonable high earthing resistance is necessary.</li>
<li>Dy ... Load current in two   primary phases.</li>
<li>Dz ... Load current in three primary phases.</li>
</ul>
</HTML>"),
         experiment(StopTime=0.1, Interval=0.001));
    end AsymmetricalLoad;

    model Rectifier6pulse "6-pulse rectifier with 1 transformer"
      extends Modelica_Icons.Example;
      constant Integer m=3 "Number of phases";
      parameter Modelica_SIunits.Voltage V=100*sqrt(2/3)
        "Amplitude of star-voltage";
      parameter Modelica_SIunits.Frequency f=50 "Frequency";
      parameter Modelica_SIunits.Resistance RL=0.4 "Load resistance";
      parameter Modelica_SIunits.Capacitance C=0.005 "Total DC-capacitance";
      parameter Modelica_SIunits.Voltage VC0=sqrt(3)*V
        "Initial voltage of capacitance";
      Modelica_Electrical_MultiPhase.Sources.SineVoltage source(
        m=m,
        V=fill(V, m),
        freqHz=fill(f, m)) annotation (Placement(transformation(
            origin={-90,-10},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_MultiPhase.Basic.Star starAC(m=m) annotation (
          Placement(transformation(
            origin={-90,-40},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundAC annotation (Placement(
            transformation(extent={{-100,-80},{-80,-60}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Sensors.CurrentSensor currentSensor(m=m)
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
              rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealDiode diode1(
        m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m),
        Vknee=fill(0, m)) annotation (Placement(transformation(
            origin={-20,60},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      Modelica_Electrical_MultiPhase.Basic.Star star1(m=m) annotation (
          Placement(transformation(
            origin={0,70},
            extent={{10,10},{-10,-10}},
            rotation=180)));
      Modelica_Electrical_MultiPhase.Ideal.IdealDiode diode2(
        m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m),
        Vknee=fill(0, m)) annotation (Placement(transformation(
            origin={-20,20},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      Modelica_Electrical_MultiPhase.Basic.Star star2(m=m) annotation (
          Placement(transformation(extent={{-10,0},{10,20}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Resistor load(R=RL) annotation (
          Placement(transformation(
            origin={50,0},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Capacitor cDC1(C=2*C, v(start=VC0/2))
        annotation (Placement(transformation(
            origin={70,20},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Capacitor cDC2(C=2*C, v(start=VC0/2))
        annotation (Placement(transformation(
            origin={70,-20},
            extent={{-10,10},{10,-10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground groundDC annotation (Placement(
            transformation(extent={{80,-20},{100,0}}, rotation=0)));
      parameter Modelica_Electrical_Machines.Utilities.TransformerData transformerData1(
        C1=Modelica_Utilities.Strings.substring(
                transformer1.VectorGroup,
                1,
                1),
        C2=Modelica_Utilities.Strings.substring(
                transformer1.VectorGroup,
                2,
                2),
        f=50,
        V1=100,
        V2=100,
        SNominal=30E3,
        v_sc=0.05,
        P_sc=300) annotation (Placement(transformation(extent={{-60,60},{-40,80}},
              rotation=0)));
      Modelica_Electrical_Machines.BasicMachines.Transformers.Dy.Dy01 transformer1(
        n=transformerData1.n,
        R1=transformerData1.R1,
        L1sigma=transformerData1.L1sigma,
        R2=transformerData1.R2,
        L2sigma=transformerData1.L2sigma,
        T1Ref=293.15,
        alpha20_1(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        T2Ref=293.15,
        alpha20_2(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        T1Operational=293.15,
        T2Operational=293.15) annotation (Placement(transformation(extent={{-50,
                30},{-30,50}}, rotation=0)));

    initial equation
      cDC1.v = VC0/2;
      cDC2.v = VC0/2;
      transformer1.i2[1:2] = zeros(2);
    equation
      connect(cDC1.n, cDC2.p)
        annotation (Line(points={{70,10},{70,-10}}, color={0,0,255}));
      connect(cDC1.n, groundDC.p)
        annotation (Line(points={{70,10},{70,0},{90,0}}, color={0,0,255}));
      connect(starAC.plug_p, source.plug_n)
        annotation (Line(points={{-90,-30},{-90,-20}}, color={0,0,255}));
      connect(diode1.plug_n, star1.plug_p)
        annotation (Line(points={{-20,70},{-10,70}}, color={0,0,255}));
      connect(diode2.plug_p, star2.plug_p)
        annotation (Line(points={{-20,10},{-10,10}}, color={0,0,255}));
      connect(diode2.plug_n, diode1.plug_p)
        annotation (Line(points={{-20,30},{-20,50}}, color={0,0,255}));
      connect(starAC.pin_n, groundAC.p)
        annotation (Line(points={{-90,-50},{-90,-60}}, color={0,0,255}));
      connect(source.plug_p, currentSensor.plug_p)
        annotation (Line(points={{-90,0},{-85,0},{-80,0}}, color={0,0,255}));
      connect(load.p, cDC1.p)
        annotation (Line(points={{50,10},{50,30},{70,30}}, color={0,0,255}));
      connect(load.n, cDC2.n) annotation (Line(points={{50,-10},{50,-30},{70,
              -30}}, color={0,0,255}));
      connect(star1.pin_n, cDC1.p)
        annotation (Line(points={{10,70},{70,70},{70,30}}, color={0,0,255}));
      connect(star2.pin_n, cDC2.n) annotation (Line(points={{10,10},{20,10},{
              20,-70},{70,-70},{70,-30}}, color={0,0,255}));
      connect(transformer1.plug1, currentSensor.plug_n) annotation (Line(
          points={{-50,40},{-60,40},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(transformer1.plug2, diode1.plug_p) annotation (Line(
          points={{-30,40},{-20,40},{-20,50}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Documentation(info="<HTML>
Test example with multiphase components:<br>
Star-connected voltage source feeds via a transformer a diode bridge rectifier with a DC burden.<br>
Using f=50 Hz, simulate for 0.1 seconds (5 periods) and compare voltages and currents of source and DC burden,
neglecting initial transient.
</HTML>"),
         experiment(StopTime=0.1, Interval=0.0001));
    end Rectifier6pulse;

    model Rectifier12pulse "12-pulse rectifier with 2 transformers"
      extends Rectifier6pulse(RL=0.2);
      Modelica_Electrical_MultiPhase.Ideal.IdealDiode diode3(
        m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m),
        Vknee=fill(0, m)) annotation (Placement(transformation(
            origin={-20,-20},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      Modelica_Electrical_MultiPhase.Basic.Star star3(m=m) annotation (
          Placement(transformation(extent={{-10,0},{10,-20}}, rotation=0)));
      Modelica_Electrical_MultiPhase.Ideal.IdealDiode diode4(
        m=m,
        Ron=fill(1e-5, m),
        Goff=fill(1e-5, m),
        Vknee=fill(0, m)) annotation (Placement(transformation(
            origin={-20,-60},
            extent={{-10,10},{10,-10}},
            rotation=90)));
      Modelica_Electrical_MultiPhase.Basic.Star star4(m=m) annotation (
          Placement(transformation(extent={{-10,-60},{10,-80}}, rotation=0)));
      Modelica_Electrical_Machines.BasicMachines.Transformers.Dd.Dd00 transformer2(
        n=transformerData2.n,
        R1=transformerData2.R1,
        L1sigma=transformerData2.L1sigma,
        R2=transformerData2.R2,
        L2sigma=transformerData2.L2sigma,
        T1Ref=293.15,
        alpha20_1(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        T2Ref=293.15,
        alpha20_2(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
        T1Operational=293.15,
        T2Operational=293.15) annotation (Placement(transformation(extent={{-50,
                -50},{-30,-30}}, rotation=0)));

      parameter Modelica_Electrical_Machines.Utilities.TransformerData transformerData2(
        C1=Modelica_Utilities.Strings.substring(
                transformer2.VectorGroup,
                1,
                1),
        C2=Modelica_Utilities.Strings.substring(
                transformer2.VectorGroup,
                2,
                2),
        f=50,
        V1=100,
        V2=100,
        SNominal=30E3,
        v_sc=0.05,
        P_sc=300) annotation (Placement(transformation(extent={{-60,-80},{-40,-60}},
              rotation=0)));
    initial equation
      transformer2.core.plug_p1.pin[1:3].i = zeros(3);
    equation
      connect(diode3.plug_n, star3.plug_p)
        annotation (Line(points={{-20,-10},{-10,-10}}, color={0,0,255}));
      connect(diode4.plug_p, star4.plug_p)
        annotation (Line(points={{-20,-70},{-10,-70}}, color={0,0,255}));
      connect(diode4.plug_n, diode3.plug_p)
        annotation (Line(points={{-20,-50},{-20,-30}}, color={0,0,255}));
      connect(star4.pin_n, cDC2.n) annotation (Line(points={{10,-70},{70,-70},
              {70,-30}}, color={0,0,255}));
      connect(star3.pin_n, cDC1.p) annotation (Line(points={{10,-10},{18,-10},
              {18,-8},{22,-8},{22,-10},{30,-10},{30,70},{70,70},{70,30}},
            color={0,0,255}));
      connect(transformer2.plug2, diode4.plug_n) annotation (Line(
          points={{-30,-40},{-20,-40},{-20,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(transformer2.plug1, currentSensor.plug_n) annotation (Line(
          points={{-50,-40},{-60,-40},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Documentation(info="<HTML>
Test example with multiphase components:<br>
Star-connected voltage source feeds via two transformers (Dd0 and Dy1) two diode bridge rectifiers with a single DC burden.<br>
Using f=50 Hz, simulate for 0.1 seconds (5 periods) and compare voltages and currents of source and DC burden,
neglecting initial transient.
</HTML>"),
         experiment(StopTime=0.1, Interval=0.0001));
    end Rectifier12pulse;

    model AIMC_Transformer
      "Test example: AsynchronousInductionMachineSquirrelCage transformer starting"
      extends AsynchronousInductionMachines.AIMC_Transformer;
      annotation (experiment(StopTime=2.5, Interval=0.001), Documentation(
            info="<HTML>
<b>Test example: Asynchronous induction machine with squirrel cage - transformer starting</b><br>
At start time tStart1 three phase voltage is supplied to the asynchronous induction machine with squirrel cage via the transformer;
the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed;
at start time tStart2 the machine is fed directly from the voltage source, finally reaching nominal speed.<br>
Simulate for 2.5 seconds and plot (versus time):
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>aimc.wMechanical: motor's speed</li>
<li>aimc.tauElectrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</HTML>"));
    end AIMC_Transformer;
    annotation (Documentation(info="<HTML>
This package contains test examples of DC machines.
</HTML>"));
  end Transformers;
  annotation (Documentation(info="<HTML>
This package contains test examples of electric machines.
</HTML>",
        revisions="<HTML>
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
  <li> v1.01 2004/09/18 Anton Haumer<br>
       adapted to improved MoveToRotational</li>
  <li> v1.02 2004/09/19 Anton Haumer<br>
       added examples for DC machines</li>
  <li> v1.03 2004/09/24 Anton Haumer<br>
       usage of Sensors.CurrentRMSSensor<br>
       added example for DC machine with series excitation</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.3.1 2004/11/06 Anton Haumer<br>
       small changes in Utilities.VfController</li>
  <li> v1.52 2005/10/12 Anton Haumer<br>
       new example for electrical excited synchronous induction machine</li>
  <li> v1.6.1 2004/11/22 Anton Haumer<br>
       introduced Utilities.TerminalBox</li>
  <li> v2.1.2 2010/02/09 Anton Haumer<br>
       included new Examples (AIMC_Transformer, DC_Comparison)</li>
  </ul>
</HTML>"), uses(Modelica_Electrical_Machines_Interfaces(version="3.2.2"),
                Modelica_Thermal_FluidHeatFlow(version="3.2.2"),
                Modelica_Thermal_HeatTransfer(version="3.2.2"),
                Modelica_Utilities(version="3.2.2"),
                Modelica_Mechanics_Rotational(version="3.2.2"),
                Modelica_Blocks(version="3.2.2"),
                Modelica_Electrical_MultiPhase(version="3.2.2"),
                Modelica_Electrical_Analog(version="3.2.2"),
                Modelica_Electrical_Machines(version="3.2.2"),
                Modelica_Constants(version="3.2.2"),
                Modelica_SIunits(version="3.2.2"),
                Modelica_Icons(version="3.2.2")),
              version="3.2.2");
end Modelica_Electrical_Machines_Examples;
