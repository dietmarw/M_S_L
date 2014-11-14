within ;
package Modelica_Electrical_MultiPhase_Examples "Multiphase test examples"
  extends Modelica_Icons.ExamplesPackage;

  model TransformerYY "Test example with multiphase components"
    extends Modelica_Icons.Example;
    parameter Integer m=3 "Number of phases";
    parameter Modelica_SIunits.Voltage V=1 "Amplitude of Star-Voltage";
    parameter Modelica_SIunits.Frequency f=5 "Frequency";
    parameter Modelica_SIunits.Inductance Lm=1 "Transformer main inductance";
    parameter Modelica_SIunits.Inductance LT=0.003
      "Transformer stray inductance";
    parameter Modelica_SIunits.Resistance RT=0.05 "Transformer resistance";
    parameter Modelica_SIunits.Resistance RL=1 "Load Resistance";
    parameter Real nT=1 "Transformer ratio";
    Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
      V=fill(V, m),
      freqHz=fill(f, m),
      m=m) annotation (Placement(transformation(
          origin={-80,20},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica_Electrical_MultiPhase.Basic.Star starS(m=m) annotation (Placement(
          transformation(
          origin={-90,-62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground groundS annotation (Placement(
          transformation(extent={{-100,-100},{-80,-80}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Ideal.IdealTransformer idealTransformer(
      m=m,
      Lm1=fill(Lm, m),
      n=fill(nT, m)) annotation (Placement(transformation(extent={{-40,0},{-20,
              20}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Star starT1(m=m) annotation (Placement(
          transformation(
          origin={-40,-62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_MultiPhase.Basic.Star starT2(m=m) annotation (Placement(
          transformation(
          origin={-20,-62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground groundT2 annotation (Placement(
          transformation(extent={{-30,-100},{-10,-80}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Resistor transformerR(m=m, R=fill(RT,
          m)) annotation (Placement(transformation(extent={{0,10},{20,30}},
            rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Inductor transformerL(m=m, L=fill(LT,
          m)) annotation (Placement(transformation(extent={{30,10},{50,30}},
            rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Resistor loadR(m=m, R=fill(RL, m))
      annotation (Placement(transformation(extent={{70,10},{90,30}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Star starL(m=m) annotation (Placement(
          transformation(
          origin={90,-62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground groundT1 annotation (Placement(
          transformation(extent={{-50,-100},{-30,-80}}, rotation=0)));
  initial equation
    transformerL.i[1:m - 1] = zeros(m - 1) "Y-connection";
  equation
    connect(starS.pin_n, groundS.p)
      annotation (Line(points={{-90,-72},{-90,-80}}, color={0,0,255}));
    connect(starT1.pin_n, groundT1.p)
      annotation (Line(points={{-40,-72},{-40,-80}}, color={0,0,255}));
    connect(starT2.pin_n, groundT2.p) annotation (Line(points={{-20,-72},{-20,
            -76},{-20,-76},{-20,-80}}, color={0,0,255}));
    connect(starS.plug_p, sineVoltage.plug_n)
      annotation (Line(points={{-90,-52},{-90,20}}, color={0,0,255}));
    connect(sineVoltage.plug_p, idealTransformer.plug_p1)
      annotation (Line(points={{-70,20},{-40,20}}, color={0,0,255}));
    connect(idealTransformer.plug_n1, starT1.plug_p)
      annotation (Line(points={{-40,0},{-40,-52}}, color={0,0,255}));
    connect(starT2.plug_p, idealTransformer.plug_n2) annotation (Line(points=
            {{-20,-52},{-20,-26},{-20,0}}, color={0,0,255}));
    connect(idealTransformer.plug_p2, transformerR.plug_p)
      annotation (Line(points={{-20,20},{0,20}}, color={0,0,255}));
    connect(transformerR.plug_n, transformerL.plug_p)
      annotation (Line(points={{20,20},{30,20}}, color={0,0,255}));
    connect(transformerL.plug_n, loadR.plug_p)
      annotation (Line(points={{50,20},{70,20}}, color={0,0,255}));
    connect(loadR.plug_n, starL.plug_p)
      annotation (Line(points={{90,20},{90,-52}}, color={0,0,255}));
    annotation (Documentation(info="<HTML>
<p>
Test example with multiphase components:<br>
Star-connected voltage source feeds via a Y-Y-transformer with internal impedance (RT, LT) a load resistor RT.<br>
Using f=5 Hz LT=3mH defines nominal voltage drop of approximately 10 %.<br>
Simulate for 1 second (2 periods) and compare voltages and currents of source, transformer and load.
</p>
</HTML>"),
         experiment(StopTime=1.0, Interval=0.001));
  end TransformerYY;

  model TransformerYD "Test example with multiphase components"
    extends Modelica_Icons.Example;
    parameter Integer m=3 "Number of phases";
    parameter Modelica_SIunits.Voltage V=1 "Amplitude of Star-Voltage";
    parameter Modelica_SIunits.Frequency f=5 "Frequency";
    parameter Modelica_SIunits.Inductance Lm=1 "Transformer main inductance";
    parameter Modelica_SIunits.Inductance LT=0.003
      "Transformer stray inductance";
    parameter Modelica_SIunits.Resistance RT=0.05 "Transformer resistance";
    parameter Modelica_SIunits.Resistance RL=1 "Load Resistance";
    parameter Real nT=1/sqrt((1 - Modelica_Math.cos(2*Modelica_Constants.pi/m))
        ^2 + (Modelica_Math.sin(2*Modelica_Constants.pi/m))^2)
      "Transformer ratio";
    Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
      V=fill(V, m),
      freqHz=fill(f, m),
      m=m) annotation (Placement(transformation(
          origin={-80,20},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica_Electrical_MultiPhase.Basic.Star starS(m=m) annotation (Placement(
          transformation(
          origin={-90,-62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground groundS annotation (Placement(
          transformation(extent={{-100,-100},{-80,-80}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Ideal.IdealTransformer idealTransformer(
      m=m,
      n=fill(nT, m),
      Lm1=fill(Lm, m)) annotation (Placement(transformation(extent={{-40,0},{-20,
              20}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Star starT(m=m) annotation (Placement(
          transformation(
          origin={-40,-62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_MultiPhase.Basic.Delta deltaT2(m=m) annotation (
        Placement(transformation(
          origin={50,10},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground groundT annotation (Placement(
          transformation(extent={{-50,-100},{-30,-80}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Resistor transformerR(m=m, R=fill(RT/
          nT^2, m)) annotation (Placement(transformation(extent={{-10,10},{10,
              30}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Inductor transformerL(m=m, L=fill(LT/
          nT^2, m)) annotation (Placement(transformation(extent={{20,10},{40,30}},
            rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Resistor loadR(m=m, R=fill(RL, m))
      annotation (Placement(transformation(extent={{70,10},{90,30}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Star starL(m=m) annotation (Placement(
          transformation(
          origin={90,-62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground groundL annotation (Placement(
          transformation(extent={{80,-100},{100,-80}}, rotation=0)));
  initial equation
    transformerL.i[1:m] = zeros(m) "D-connection";
  equation
    connect(groundS.p, starS.pin_n)
      annotation (Line(points={{-90,-80},{-90,-72}}, color={0,0,255}));
    connect(groundT.p, starT.pin_n)
      annotation (Line(points={{-40,-80},{-40,-72}}, color={0,0,255}));
    connect(starS.plug_p, sineVoltage.plug_n)
      annotation (Line(points={{-90,-52},{-90,20}}, color={0,0,255}));
    connect(sineVoltage.plug_p, idealTransformer.plug_p1)
      annotation (Line(points={{-70,20},{-40,20}}, color={0,0,255}));
    connect(idealTransformer.plug_n1, starT.plug_p)
      annotation (Line(points={{-40,0},{-40,-52}}, color={0,0,255}));
    connect(idealTransformer.plug_p2, transformerR.plug_p)
      annotation (Line(points={{-20,20},{-10,20}}, color={0,0,255}));
    connect(transformerR.plug_n, transformerL.plug_p)
      annotation (Line(points={{10,20},{20,20}}, color={0,0,255}));
    connect(transformerL.plug_n, deltaT2.plug_p)
      annotation (Line(points={{40,20},{50,20}}, color={0,0,255}));
    connect(deltaT2.plug_n, idealTransformer.plug_n2)
      annotation (Line(points={{50,0},{-20,0}}, color={0,0,255}));
    connect(deltaT2.plug_p, loadR.plug_p)
      annotation (Line(points={{50,20},{70,20}}, color={0,0,255}));
    connect(loadR.plug_n, starL.plug_p)
      annotation (Line(points={{90,20},{90,-52}}, color={0,0,255}));
    connect(starL.pin_n, groundL.p)
      annotation (Line(points={{90,-72},{90,-80}}, color={0,0,255}));
    annotation (Documentation(info="<HTML>
<p>
Test example with multiphase components:<br>
Star-connected voltage source feeds via a Y-D-transformer with internal impedance (RT, LT) a load resistor RT.<br>
Using f=5 Hz LT=3mH defines nominal voltage drop of approximately 10 %.<br>
Simulate for 1 second (2 periods) and compare voltages and currents of source, transformer and load.
</p>
</HTML>"),
         experiment(StopTime=1.0, Interval=0.001));
  end TransformerYD;

  model Rectifier "Test example with multiphase components"
    extends Modelica_Icons.Example;
    parameter Integer m=3 "Number of phases";
    parameter Modelica_SIunits.Voltage V=1 "Amplitude of Star-Voltage";
    parameter Modelica_SIunits.Frequency f=5 "Frequency";
    parameter Modelica_SIunits.Inductance L=0.001 "Line Inductance";
    parameter Modelica_SIunits.Resistance RL=2 "Load Resistance";
    parameter Modelica_SIunits.Capacitance C=0.05 "Total DC-Capacitance";
    parameter Modelica_SIunits.Resistance RE=1E6 "Earthing Resistance";
    parameter Modelica_SIunits.Resistance Ron=1.E-5 "Closed diode resistance";
    parameter Modelica_SIunits.Conductance Goff=1.E-5
      "Opened diode conductance";
    parameter Modelica_SIunits.Voltage Vknee=0 "Threshold diode voltage";

    Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
      m=m,
      V=fill(V, m),
      freqHz=fill(f, m)) annotation (Placement(transformation(extent={{-70,10},
              {-90,-10}}, rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Star starS(m=m) annotation (Placement(
          transformation(
          origin={-90,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_MultiPhase.Basic.Inductor supplyL(m=m, L=fill(L, m))
      annotation (Placement(transformation(extent={{-52,-10},{-32,10}},
            rotation=0)));
    Modelica_Electrical_MultiPhase.Ideal.IdealDiode idealDiode1(
      m=m,
      Ron=fill(Ron, m),
      Goff=fill(Goff, m),
      Vknee=fill(Vknee, m)) annotation (Placement(transformation(
          origin={10,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Electrical_MultiPhase.Basic.Star star1(m=m) annotation (Placement(
          transformation(
          origin={10,50},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Electrical_MultiPhase.Ideal.IdealDiode idealDiode2(
      m=m,
      Ron=fill(Ron, m),
      Goff=fill(Goff, m),
      Vknee=fill(Vknee, m)) annotation (Placement(transformation(
          origin={10,-20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Electrical_MultiPhase.Basic.Star star2(m=m) annotation (Placement(
          transformation(
          origin={10,-50},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Resistor loadR(R=RL) annotation (
        Placement(transformation(
          origin={50,0},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Capacitor cDC1(C=2*C) annotation (
        Placement(transformation(
          origin={70,30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Capacitor cDC2(C=2*C) annotation (
        Placement(transformation(
          origin={70,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground groundDC annotation (Placement(
          transformation(extent={{80,-80},{100,-60}}, rotation=0)));
  initial equation
    cDC1.v = 0;
    cDC2.v = 0;
    supplyL.i[1:m - 1] = zeros(m - 1) "Y-connection";
  equation
    connect(cDC1.n, cDC2.p)
      annotation (Line(points={{70,20},{70,-20}}, color={0,0,255}));
    connect(cDC1.n, groundDC.p) annotation (Line(points={{70,20},{70,0},{90,0},
            {90,-60}}, color={0,0,255}));
    connect(starS.plug_p, sineVoltage.plug_n)
      annotation (Line(points={{-90,-40},{-90,0}}, color={0,0,255}));
    connect(sineVoltage.plug_p, supplyL.plug_p)
      annotation (Line(points={{-70,0},{-52,0}}, color={0,0,255}));
    connect(idealDiode1.plug_p, supplyL.plug_n)
      annotation (Line(points={{10,10},{10,0},{-32,0}}, color={0,0,255}));
    connect(idealDiode2.plug_n, supplyL.plug_n)
      annotation (Line(points={{10,-10},{10,0},{-32,0}}, color={0,0,255}));
    connect(idealDiode1.plug_n, star1.plug_p)
      annotation (Line(points={{10,30},{10,40}}, color={0,0,255}));
    connect(idealDiode2.plug_p, star2.plug_p) annotation (Line(points={{10,-30},
            {10,-35},{10,-40}}, color={0,0,255}));
    connect(star2.pin_n, loadR.n) annotation (Line(points={{10,-60},{50,-60},
            {50,-10}}, color={0,0,255}));
    connect(star2.pin_n, cDC2.n) annotation (Line(points={{10,-60},{70,-60},{
            70,-40}}, color={0,0,255}));
    connect(star1.pin_n, loadR.p)
      annotation (Line(points={{10,60},{50,60},{50,10}}, color={0,0,255}));
    connect(star1.pin_n, cDC1.p)
      annotation (Line(points={{10,60},{70,60},{70,40}}, color={0,0,255}));
    annotation (Documentation(info="<HTML>
<p>
Test example with multiphase components:<br>
Star-connected voltage source feeds via a line reactor a diode bridge rectifier with a DC burden.<br>
Using f=5 Hz, simulate for 1 second (2 periods) and compare voltages and currents of source and DC burden,
neglecting initial transient.
</p>
</HTML>"),
         experiment(StopTime=1.0, Interval=0.0001));
  end Rectifier;

  model TestSensors
    extends Modelica_Icons.Example;
    constant Integer m=3 "Number of phases";
    import Modelica_Constants.pi;
    parameter Modelica_SIunits.Voltage VRMS=100 "Nominal RMS voltage per phase";
    parameter Modelica_SIunits.Frequency f=50 "Frequency";
    parameter Modelica_SIunits.Resistance R=1/sqrt(2) "Load resistance";
    parameter Modelica_SIunits.Inductance L=1/sqrt(2)/(2*pi*f)
      "Load inductance";
    final parameter Modelica_SIunits.Current IRMS=VRMS/sqrt(R^2 + (2*pi*f*L)^
        2) "Steady state RMS current";
    Modelica_Electrical_MultiPhase.Sources.SineVoltage sineVoltage(
      final m=m,
      V=fill(sqrt(2)*VRMS, m),
      freqHz=fill(f, m)) annotation (Placement(transformation(
          origin={-20,70},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica_Electrical_MultiPhase.Basic.Star star(final m=m) annotation (
        Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=90,
          origin={-20,-70})));
    Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
          transformation(
          origin={-20,-100},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica_Electrical_MultiPhase.Basic.Resistor resistor(m=m, R=fill(R, m))
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={20,-10})));
    Modelica_Electrical_MultiPhase.Basic.Inductor inductor(m=m, L=fill(L, m))
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={20,-40})));
    Modelica_Electrical_MultiPhase.Basic.Star starLoad(m=m) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={20,-70})));
    Modelica_Electrical_MultiPhase.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor(m=m)
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={20,70})));
    Modelica_Blocks.Math.Feedback feedbackI
      annotation (Placement(transformation(extent={{70,60},{90,80}})));
    Modelica_Blocks.Sources.Constant constI(k=IRMS) annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=270,
          origin={80,40})));

    Modelica_Electrical_MultiPhase.Sensors.VoltageQuasiRMSSensor voltageQuasiRMSSensor(m=m)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,70})));
    Modelica_Blocks.Math.Feedback feedbackV
      annotation (Placement(transformation(extent={{-70,60},{-90,80}})));
    Modelica_Blocks.Sources.Constant constV(k=VRMS) annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=270,
          origin={-80,40})));
    Modelica_Electrical_MultiPhase.Sensors.PowerSensor powerSensor(m=m)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=90,
          origin={20,20})));
    Modelica_Blocks.Math.Feedback feedbackP
      annotation (Placement(transformation(extent={{50,10},{70,30}})));
    Modelica_Blocks.Sources.RealExpression realExpression(y=
          Modelica_Electrical_MultiPhase.Functions.activePower(
          voltageQuasiRMSSensor.v, currentQuasiRMSSensor.i)) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-10})));
  initial equation
    for k in 1:m - 1 loop
      inductor.i[k] = 0;
    end for;

  equation
    connect(star.pin_n, ground.p)
      annotation (Line(points={{-20,-80},{-20,-90}}, color={0,0,255}));
    connect(sineVoltage.plug_n, star.plug_p)
      annotation (Line(points={{-20,60},{-20,-60}}, color={0,0,255}));

    connect(resistor.plug_n, inductor.plug_p) annotation (Line(
        points={{20,-20},{20,-30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(inductor.plug_n, starLoad.plug_p) annotation (Line(
        points={{20,-50},{20,-60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(currentQuasiRMSSensor.I, feedbackI.u1) annotation (Line(
        points={{30,70},{72,70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(feedbackI.u2, constI.y) annotation (Line(
        points={{80,62},{80,51}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sineVoltage.plug_p, currentQuasiRMSSensor.plug_p) annotation (
        Line(
        points={{-20,80},{-20,90},{20,90},{20,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(voltageQuasiRMSSensor.plug_n, sineVoltage.plug_n) annotation (
        Line(
        points={{-50,60},{-20,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(voltageQuasiRMSSensor.plug_p, sineVoltage.plug_p) annotation (
        Line(
        points={{-50,80},{-20,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(feedbackV.u1, voltageQuasiRMSSensor.V) annotation (Line(
        points={{-72,70},{-60,70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(constV.y, feedbackV.u2) annotation (Line(
        points={{-80,51},{-80,62}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(powerSensor.nc, resistor.plug_p) annotation (Line(
        points={{20,10},{20,0}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(currentQuasiRMSSensor.plug_n, powerSensor.pc) annotation (Line(
        points={{20,60},{20,30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(powerSensor.pc, powerSensor.pv) annotation (Line(
        points={{20,30},{10,30},{10,20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(powerSensor.nv, starLoad.plug_p) annotation (Line(
        points={{30,20},{30,-60},{20,-60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(powerSensor.power, feedbackP.u1) annotation (Line(
        points={{31,28},{40,28},{40,20},{52,20}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(realExpression.y, feedbackP.u2) annotation (Line(
        points={{60,1},{60,12}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=0.1, Interval=0.0001), Documentation(info=
           "<HTML>
<p>
Test multiphase quasiRMS sensors: A sinusoidal source feeds a load consisting of resistor and inductor.
</p>
</HTML>"));
  end TestSensors;
  annotation (Documentation(info="<HTML>
<p>
This package contains test examples of analog electrical multiphase circuits.
</p>

</HTML>",
        revisions="<html>
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
  <li> v1.0 2004/10/01 Anton Haumer</li>
  </ul>
  </dd>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2013, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</dl>
</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Electrical_MultiPhase_Examples;
