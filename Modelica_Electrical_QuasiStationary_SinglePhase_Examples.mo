within ;
encapsulated package Modelica_Electrical_QuasiStationary_SinglePhase_Examples
  "Test examples"
  import Modelica_Icons;
  import Modelica_Blocks;
  import Modelica_Electrical_QuasiStationary;
  import Modelica_Constants;
  import Modelica_ComplexBlocks;
  import Modelica_SIunits;
  import Modelica_Electrical_Analog;
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
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground
      annotation (Placement(transformation(extent={{-40,-60},{-20,-40}},
            rotation=0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Resistor resistor(R_ref=0.1)
      annotation (Placement(transformation(extent={{10,-10},{30,10}}, rotation=
              0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Inductor inductor(L=1/(2*
          Modelica_Constants.pi)) annotation (Placement(transformation(extent={
              {40,-10},{60,10}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Capacitor capacitor(C=1/(2*
          Modelica_Constants.pi)) annotation (Placement(transformation(extent={
              {70,-10},{90,10}}, rotation=0)));
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
</html>"),
         experiment(StopTime=1.0, Interval=0.001));
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
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground
      annotation (Placement(transformation(extent={{-40,-20},{-20,0}}, rotation=
             0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Resistor resistor(R_ref=10)
      annotation (Placement(transformation(
          origin={-10,20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Inductor inductor(L=1/(2*
          Modelica_Constants.pi)) annotation (Placement(transformation(
          origin={10,20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Capacitor capacitor(C=1/(2*
          Modelica_Constants.pi)) annotation (Placement(transformation(
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
</html>"),
         experiment(StopTime=1.0, Interval=0.001));
  end ParallelResonance;

  model Rectifier "Rectifier example"
    extends Modelica_Icons.Example;
    import Modelica_Constants.pi;
    parameter Modelica_SIunits.Voltage VAC=100 "AC rms voltage";
    parameter Real conversionFactor=1 "Ratio of DC voltage / AC rms voltage";
    Modelica_Electrical_QuasiStationary.SinglePhase.Sources.VoltageSource voltageQS(
      f=50,
      V=VAC,
      phi=0,
      i(re(start=0), im(start=0)),
      gamma(fixed=true, start=0)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-80,50})));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Resistor resistorQS(R_ref=
          50E-3)
      annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
    Modelica_Electrical_QuasiStationary.SinglePhase.Sensors.CurrentSensor currentSensorQS
      annotation (Placement(transformation(extent={{-40,70},{-20,50}})));
    Modelica_ComplexBlocks.ComplexMath.ComplexToPolar iQS
      annotation (Placement(transformation(extent={{-20,70},{0,90}})));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundQS
      annotation (Placement(transformation(extent={{-20,10},{0,30}})));
    Modelica_Electrical_QuasiStationary.SinglePhase.Utilities.IdealACDCConverter
      rectifierQS(conversionFactor=conversionFactor)
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
    Modelica_Electrical_QuasiStationary.SinglePhase.Utilities.GraetzRectifier rectifierAC
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
</html>"),
         experiment(StopTime=1.0, Interval=0.0001));
  end Rectifier;

  annotation (Documentation(info="<html>
Examples to demonstrate the usage of quasistationary electric components.
</html>"), uses(Modelica_ComplexBlocks(version="3.2.2"), Modelica(version=
            "3.2.1")));
end Modelica_Electrical_QuasiStationary_SinglePhase_Examples;
