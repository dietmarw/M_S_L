within ;
package Modelica_Electrical_QuasiStationary_MultiPhase_Examples "Test examples"
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
    Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource voltageSource(
      m=m,
      f=f,
      V=fill(V, m),
      phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
      gamma(fixed=true, start=0)) annotation (Placement(transformation(
          origin={-80,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star(m=m)
      annotation (Placement(transformation(
          origin={-80,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground
      annotation (Placement(transformation(extent={{-90,-90},{-70,-70}},
            rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_p plugToPin_p1(m=m, k=1)
      annotation (Placement(transformation(extent={{-10,40},{10,60}}, rotation=
              0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_p plugToPin_p2(k=2, m=m)
      annotation (Placement(transformation(extent={{-10,0},{10,20}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_p plugToPin_p3(k=3, m=m)
      annotation (Placement(transformation(extent={{-10,-40},{10,-20}},
            rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor powerSensor(m=m)
      annotation (Placement(transformation(extent={{-70,0},{-50,20}}, rotation=
              0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.CurrentSensor currentSensor(m=m)
      annotation (Placement(transformation(extent={{-40,0},{-20,20}}, rotation=
              0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Resistor resistor(R_ref=R)
      annotation (Placement(transformation(extent={{20,-40},{40,-20}}, rotation
            =0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Capacitor capacitor(C=C)
      annotation (Placement(transformation(extent={{20,0},{40,20}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Inductor inductor(L=L)
      annotation (Placement(transformation(extent={{20,40},{40,60}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star2(m=m)
      annotation (Placement(transformation(
          origin={80,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_n plugToPin_n1(m=m, k=1)
      annotation (Placement(transformation(
          origin={60,50},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_n plugToPin_n2(k=2, m=m)
      annotation (Placement(transformation(
          origin={60,10},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_n plugToPin_n3(k=3, m=m)
      annotation (Placement(transformation(
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
</html>"),
         experiment(StopTime=1.0, Interval=0.001));
  end BalancingStar;

  model BalancingDelta "Balancing an unsymmetrical delta-connected load"
    extends Modelica_Icons.Example;
    parameter Integer m=3 "Number of phases";
    parameter Modelica_SIunits.Voltage V_LL=100 "Source voltage line-to-line";
    parameter Modelica_SIunits.Frequency f=50 "Source frequency";
    parameter Modelica_SIunits.Resistance R=10 "Load resistance";
    parameter Modelica_SIunits.Inductance L=(R*sqrt(3))/(2*
        Modelica_Constants.pi
        *f) "Load inductance";
    parameter Modelica_SIunits.Capacitance C=1/(R*sqrt(3))/(2*
        Modelica_Constants.pi
        *f) "Load capacitance";
    Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource voltageSource(
      m=m,
      f=f,
      V=fill(V_LL, m),
      phi=-Modelica_Electrical_MultiPhase.Functions.symmetricOrientation(m),
      gamma(fixed=true, start=0)) annotation (Placement(transformation(
          origin={-70,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star star(m=m)
      annotation (Placement(transformation(
          origin={-70,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground ground
      annotation (Placement(transformation(extent={{-80,-90},{-60,-70}},
            rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_p plugToPin_p1(m=m, k=1)
      annotation (Placement(transformation(extent={{12,70},{32,90}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_p plugToPin_p2(k=2, m=m)
      annotation (Placement(transformation(extent={{10,0},{30,20}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.PlugToPin_p plugToPin_p3(k=3, m=m)
      annotation (Placement(transformation(extent={{10,-70},{30,-50}}, rotation
            =0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor powerSensor(m=m)
      annotation (Placement(transformation(extent={{-60,0},{-40,20}}, rotation=
              0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.CurrentSensor currentSensor(m=m)
      annotation (Placement(transformation(extent={{-30,0},{-10,20}}, rotation=
              0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Resistor resistor(R_ref=R)
      annotation (Placement(transformation(
          origin={70,30},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Capacitor capacitor(C=C)
      annotation (Placement(transformation(
          origin={40,32},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Inductor inductor(L=L)
      annotation (Placement(transformation(
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
</html>"),
         experiment(StopTime=1.0, Interval=0.001));
  end BalancingDelta;

  annotation (Documentation(info="<html>
Examples to demonstrate the usage of quasistationary electric components.
</html>"), uses(Modelica_ComplexBlocks(version="3.2.2"), Modelica(version=
            "3.2.1")));
end Modelica_Electrical_QuasiStationary_MultiPhase_Examples;
