within ;
package Modelica_Electrical_Analog_Examples
  "Examples that demonstrate the usage of the Analog electrical components"
extends Modelica_Icons.ExamplesPackage;

  model CauerLowPassAnalog "Cauer low pass filter with analog components"
    extends Modelica_Icons.Example;

    parameter Modelica_SIunits.Inductance l1=1.304 "filter coefficient I1";
    parameter Modelica_SIunits.Inductance l2=0.8586 "filter coefficient I2";
    parameter Modelica_SIunits.Capacitance c1=1.072 "filter coefficient c1";
    parameter Modelica_SIunits.Capacitance c2=1/(1.704992^2*l1)
      "filter coefficient c2";
    parameter Modelica_SIunits.Capacitance c3=1.682 "filter coefficient c3";
    parameter Modelica_SIunits.Capacitance c4=1/(1.179945^2*l2)
      "filter coefficient c4";
    parameter Modelica_SIunits.Capacitance c5=0.7262 "filter coefficient c5";
    Modelica_Electrical_Analog.Basic.Ground G annotation (Placement(
          transformation(extent={{-10,-90},{10,-70}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C1(C=c1, v(start=0, fixed=true))
      annotation (Placement(transformation(
          origin={-60,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));

  Modelica_Electrical_Analog.Basic.Capacitor C2(C=c2) annotation (Placement(
          transformation(extent={{-40,20},{-20,40}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C3(C=c3, v(start=0, fixed=true))
      annotation (Placement(transformation(
          origin={0,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Capacitor C4(C=c4) annotation (Placement(
          transformation(extent={{20,20},{40,40}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C5(C=c5, v(start=0, fixed=true))
      annotation (Placement(transformation(
          origin={60,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Inductor L1(L=l1, i(start=0, fixed=true))
      annotation (Placement(transformation(extent={{-40,60},{-20,80}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Inductor L2(L=l2, i(start=0, fixed=true))
      annotation (Placement(transformation(extent={{20,60},{40,80}}, rotation=
             0)));
    Modelica_Electrical_Analog.Basic.Resistor R1(R=1) annotation (Placement(
          transformation(extent={{-100,20},{-80,40}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R2(R=1) annotation (Placement(
          transformation(
          origin={100,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Sources.StepVoltage V(
      startTime=1,
      offset=0,
      V=1) annotation (Placement(transformation(
          origin={-100,-10},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation
    connect(R1.n,C1.p) annotation (Line(points={{-80,30},{-60,30},{-60,-10}},
          color={0,0,255}));
    connect(C1.n,G.p) annotation (Line(points={{-60,-30},{-60,-50},{0,-50},{0,
          -70}}, color={0,0,255}));
    connect(L1.p,C2.p) annotation (Line(points={{-40,70},{-40,30}}, color=
          {0,0,255}));
    connect(L1.p,C1.p) annotation (Line(points={{-40,70},{-40,30},{-60,30},{-60,
          -10}}, color={0,0,255}));
    connect(L1.n,C2.n) annotation (Line(points={{-20,70},{-20,30}}, color={0,0,
          255}));
    connect(C2.n,C3.p) annotation (Line(points={{-20,30},{0,30},{0,-10}},
          color={0,0,255}));
    connect(C2.n,C4.p) annotation (Line(points={{-20,30},{20,30}}, color=
          {0,0,255}));
    connect(C2.n,L2.p) annotation (Line(points={{-20,30},{20,30},{20,70}}, color=
          {0,0,255}));
    connect(L2.n,C4.n) annotation (Line(points={{40,70},{40,30}}, color={0,0,
          255}));
    connect(C4.n,C5.p) annotation (Line(points={{40,30},{60,30},{60,-10}}, color=
          {0,0,255}));
    connect(C4.n,R2.p) annotation (Line(points={{40,30},{100,30},{100,-10}},
          color={0,0,255}));
    connect(C1.n,C3.n) annotation (Line(points={{-60,-30},{-60,-50},{0,-50},{0,
          -30}}, color={0,0,255}));
    connect(C1.n,C5.n) annotation (Line(points={{-60,-30},{-60,-50},{60,-50},{60,
          -30}}, color={0,0,255}));
    connect(R2.n,C1.n) annotation (Line(points={{100,-30},{100,-50},{-60,-50},{
          -60,-30}}, color={0,0,255}));
    connect(R1.p,V.p) annotation (Line(points={{-100,30},{-100,0}}, color={0,0,
          255}));
    connect(V.n,G.p) annotation (Line(points={{-100,-20},{-100,-70},{
           0,-70}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(
            preserveAspectRatio=false,extent={{-120,-100},{120,100}}), graphics={
          Rectangle(
            extent={{-62,32},{-58,28}},
            lineColor={0,0,255},
            fillColor={85,85,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-2,28},{2,32}},
            lineColor={0,0,255},
            fillColor={85,85,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{58,32},{62,28}},
            lineColor={0,0,255},
            fillColor={85,85,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{58,-48},{62,-52}},
            lineColor={0,0,255},
            fillColor={85,85,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-2,-48},{2,-52}},
            lineColor={0,0,255},
            fillColor={85,85,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-62,-48},{-58,-52}},
            lineColor={0,0,255},
            fillColor={85,85,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-120,100},{120,80}},
            textString="CauerLowPassAnalog",
            lineColor={0,0,255})}),
      experiment(StopTime=60),
      Documentation(revisions="<html>
<ul>
<li><i>January 13, 2006</i>
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>",   info="<html>
<p>The example Cauer Filter is a low-pass-filter of the fifth order. It is realized using an analog network. The voltage source V is the input voltage (step), and the R2.p.v is the filter output voltage. The pulse response is calculated.</p>
<p>The simulation end time should be 60. Please plot both V.p.v (input voltage) and R2.p.v (output voltage).</p>
</html>"));
  end CauerLowPassAnalog;

  model CauerLowPassOPV "Cauer low pass filter with operational amplifiers"
    extends Modelica_Icons.Example;

    parameter Modelica_SIunits.Capacitance l1=1.304 "filter coefficient i1";
    parameter Modelica_SIunits.Capacitance l2=0.8586 "filter coefficient i2";
    parameter Modelica_SIunits.Capacitance c1=1.072 "filter coefficient c1";
    parameter Modelica_SIunits.Capacitance c2=1/(1.704992^2*l1)
      "filter coefficient c2";
    parameter Modelica_SIunits.Capacitance c3=1.682 "filter coefficient c3";
    parameter Modelica_SIunits.Capacitance c4=1/(1.179945^2*l2)
      "filter coefficient c4";
    parameter Modelica_SIunits.Capacitance c5=0.7262 "filter coefficient c5";
    Modelica_Electrical_Analog.Basic.Capacitor C1(C=c1 + c2, v(start=0, fixed=
           true)) annotation (Placement(transformation(extent={{-192,10},{-172,
              30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C2(C=c2, v(start=0, fixed=true))
      annotation (Placement(transformation(extent={{-240,-90},{-220,-70}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C3(C=l1, v(start=0, fixed=true))
      annotation (Placement(transformation(extent={{-90,10},{-70,30}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C4(C=c4, v(start=0, fixed=true))
      annotation (Placement(transformation(extent={{-30,30},{-10,50}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C5(C=c2) annotation (Placement(
          transformation(extent={{-30,-120},{-10,-100}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R1(R=1) annotation (Placement(
          transformation(extent={{-240,-50},{-220,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R2(R=1) annotation (Placement(
          transformation(extent={{-240,-10},{-220,10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R3(R=1) annotation (Placement(
          transformation(extent={{-193,50},{-173,70}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op1 annotation (Placement(
          transformation(extent={{-200,-70},{-160,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground G annotation (Placement(
          transformation(extent={{-188,-96},{-174,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R4(R=-1) annotation (Placement(
          transformation(extent={{-140,-60},{-120,-40}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R5(R=-1) annotation (Placement(
          transformation(extent={{-140,-100},{-120,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op2 annotation (Placement(
          transformation(extent={{-100,-70},{-60,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op3 annotation (Placement(
          transformation(extent={{4,-72},{46,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground G1 annotation (Placement(
          transformation(extent={{-87,-96},{-73,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R6(R=1) annotation (Placement(
          transformation(extent={{-31,-10},{-11,10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R7(R=1) annotation (Placement(
          transformation(extent={{-31,-60},{-11,-40}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C6(C=c2 + c3 + c4) annotation (
       Placement(transformation(extent={{9,10},{29,30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R8(R=-1) annotation (Placement(
          transformation(extent={{60,-10},{80,10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R9(R=-1) annotation (Placement(
          transformation(extent={{60,-60},{80,-40}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R10(R=1) annotation (Placement(
          transformation(extent={{160,-60},{180,-40}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op4 annotation (Placement(
          transformation(extent={{100,-70},{140,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op5 annotation (Placement(
          transformation(extent={{200,-70},{240,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C7(C=l2, v(start=0, fixed=true))
      annotation (Placement(transformation(extent={{110,10},{130,30}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C8(C=c4) annotation (Placement(
          transformation(extent={{160,-150},{180,-130}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C9(C=c4 + c5) annotation (
        Placement(transformation(extent={{208,-10},{228,10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R11(R=1) annotation (Placement(
          transformation(extent={{209,30},{229,50}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n1 annotation (
        Placement(transformation(extent={{-214,-42},{-210,-38}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n2 annotation (
        Placement(transformation(extent={{-214,-2},{-210,2}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n3 annotation (
        Placement(transformation(extent={{-214,18},{-210,22}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n4 annotation (
        Placement(transformation(
          origin={-160,20},
          extent={{2,2},{-2,-2}},
          rotation=180)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n5 annotation (
        Placement(transformation(extent={{-114,-52},{-110,-48}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin p1 annotation (
        Placement(transformation(extent={{-154,-142},{-148,-138}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n6 annotation (
        Placement(transformation(extent={{-62,18},{-58,22}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n7 annotation (
        Placement(transformation(extent={{-6,-52},{-2,-48}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n8 annotation (
        Placement(transformation(extent={{-6,-2},{-2,2}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin p2 annotation (
        Placement(transformation(extent={{-6,18},{-2,22}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin out1 annotation (
        Placement(transformation(extent={{44,-142},{48,-138}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin p3 annotation (
        Placement(transformation(extent={{58,58},{62,62}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n9 annotation (
        Placement(transformation(extent={{86,-2},{90,2}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n10 annotation (
        Placement(transformation(extent={{86,-52},{90,-48}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n11 annotation (
        Placement(transformation(extent={{138,18},{142,22}}, rotation=0)));
  public
    Modelica_Electrical_Analog.Basic.Ground G2 annotation (Placement(
          transformation(extent={{12,-96},{26,-80}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n12 annotation (
        Placement(transformation(extent={{238,38},{242,42}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n13 annotation (
        Placement(transformation(extent={{238,-2},{242,2}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin p4 annotation (
        Placement(transformation(extent={{188,-2},{194,2}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n14 annotation (
        Placement(transformation(extent={{188,-52},{194,-48}}, rotation=0)));
  public
    Modelica_Electrical_Analog.Basic.Ground G3 annotation (Placement(
          transformation(extent={{113,-96},{127,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground G4 annotation (Placement(
          transformation(extent={{213,-96},{227,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.StepVoltage V(startTime=1, V=1)
      annotation (Placement(transformation(
          origin={-240,-170},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
          transformation(extent={{-246,-202},{-234,-190}}, rotation=0)));
  equation
    connect(Op1.in_p, G.p) annotation (Line(points={{-200,-60},{-200,-70},{-180,
            -70},{-180,-80},{-181,-80}}, color={0,0,255}));
    connect(G1.p, Op2.in_p) annotation (Line(points={{-80,-80},{-80,-70},{-100,
            -70},{-100,-60}}, color={0,0,255}));
    connect(R1.n, n1) annotation (Line(points={{-220,-40},{-212,-40}}, color={0,0,
            255}));
    connect(n1, Op1.in_n) annotation (Line(points={{-212,-40},{-200,-40}}, color=
            {0,0,255}));
    connect(C2.n, n1) annotation (Line(points={{-220,-80},{-212,-80},{-212,-40}},
          color={0,0,255}));
    connect(R2.n, n2)
      annotation (Line(points={{-220,0},{-218,0},{-216,0},{-212,0}},
                                                   color={0,0,255}));
    connect(n1, n2)
      annotation (Line(points={{-212,-40},{-212,0}}, color={0,0,255}));
    connect(n2, n3)
      annotation (Line(points={{-212,0},{-212,20}}, color={0,0,255}));
    connect(n3, C1.p)
      annotation (Line(points={{-212,20},{-192,20}}, color={0,0,255}));
    connect(n3, R3.p) annotation (Line(points={{-212,20},{-212,60},{-193,60}},
          color={0,0,255}));
    connect(C1.n, n4)
      annotation (Line(points={{-172,20},{-160,20}}, color={0,0,255}));
    connect(R3.n, n4) annotation (Line(points={{-173,60},{-160,60},{-160,20}},
          color={0,0,255}));
    connect(n4, Op1.out) annotation (Line(points={{-160,20},{-160,-50}}, color={0,
            0,255}));
    connect(R4.p, Op1.out) annotation (Line(points={{-140,-50},{-160,-50}}, color=
           {0,0,255}));
    connect(C5.p, Op1.out) annotation (Line(points={{-30,-110},{-160,-110},{-160,
            -50}}, color={0,0,255}));
    connect(R4.n, n5) annotation (Line(points={{-120,-50},{-112,-50}}, color={0,0,
            255}));
    connect(n5, Op2.in_n) annotation (Line(points={{-112,-50},{-112,-40},{-100,
            -40}}, color={0,0,255}));
    connect(C3.p, n5) annotation (Line(points={{-90,20},{-112,20},{-112,-50}},
          color={0,0,255}));
    connect(R5.n, n5) annotation (Line(points={{-120,-90},{-112,-90},{-112,-50}},
          color={0,0,255}));
    connect(R5.p, p1) annotation (Line(points={{-140,-90},{-151,-90},{-151,-140}},
          color={0,0,255}));
    connect(C2.p, p1) annotation (Line(points={{-240,-80},{-240,-140},{-151,-140}},
          color={0,0,255}));
    connect(C3.n, n6)
      annotation (Line(points={{-70,20},{-60,20}}, color={0,0,255}));
    connect(n6, Op2.out)
      annotation (Line(points={{-60,20},{-60,-50}}, color={0,0,255}));
    connect(R2.p, n6) annotation (Line(points={{-240,0},{-240,80},{-60,80},{-60,
            20}}, color={0,0,255}));
    connect(Op2.out, R7.p)
      annotation (Line(points={{-60,-50},{-31,-50}}, color={0,0,255}));
    connect(R7.n, n7)
      annotation (Line(points={{-11,-50},{-4,-50}}, color={0,0,255}));
    connect(n7, Op3.in_n) annotation (Line(points={{-4,-50},{-4,-40.5},{4,-40.5}},
          color={0,0,255}));
    connect(C5.n, n7) annotation (Line(points={{-10,-110},{-4,-110},{-4,-50}},
          color={0,0,255}));
    connect(R6.n, n8)
      annotation (Line(points={{-11,0},{-9.25,0},{-7.5,0},{-4,0}},
                                                color={0,0,255}));
    connect(n7, n8) annotation (Line(points={{-4,-50},{-4,0}},        color={0,0,
            255}));
    connect(C6.p, p2)
      annotation (Line(points={{9,20},{-4,20}}, color={0,0,255}));
    connect(n8, p2)
      annotation (Line(points={{-4,0},{-4,20}}, color={0,0,255}));
    connect(C4.n, p2) annotation (Line(points={{-10,40},{-4,40},{-4,20}}, color={
            0,0,255}));
    connect(C6.n, Op3.out) annotation (Line(points={{29,20},{46,20},{46,-51}},
          color={0,0,255}));
    connect(R9.p, Op3.out)
      annotation (Line(points={{60,-50},{54,-50},{54,-51},{46,-51}},
                                                   color={0,0,255}));
    connect(Op3.out, out1)
      annotation (Line(points={{46,-51},{46,-140}}, color={0,0,255}));
    connect(p1, out1) annotation (Line(points={{-151,-140},{46,-140}}, color={0,0,
            255}));
    connect(out1, C8.p) annotation (Line(points={{46,-140},{160,-140}}, color={0,
            0,255}));
    connect(C4.p, p3) annotation (Line(points={{-30,40},{-40,40},{-40,60},{60,60}},
          color={0,0,255}));
    connect(p3, R8.p)
      annotation (Line(points={{60,60},{60,0}}, color={0,0,255}));
    connect(R8.n, n9)
      annotation (Line(points={{80,0},{82,0},{84,0},{88,0}},
                                               color={0,0,255}));
    connect(n9, n10)
      annotation (Line(points={{88,0},{88,-50}}, color={0,0,255}));
    connect(R9.n, n10)
      annotation (Line(points={{80,-50},{88,-50}}, color={0,0,255}));
    connect(n10, Op4.in_n) annotation (Line(points={{88,-50},{88,-40},{100,-40}},
          color={0,0,255}));
    connect(n9, C7.p) annotation (Line(points={{88,0},{88,20},{110,20}}, color={0,
            0,255}));
    connect(C7.n, n11)
      annotation (Line(points={{130,20},{140,20}}, color={0,0,255}));
    connect(R6.p, n11) annotation (Line(points={{-31,0},{-48,0},{-48,80},{140,80},
            {140,20}}, color={0,0,255}));
    connect(n11, Op4.out)
      annotation (Line(points={{140,20},{140,-50}}, color={0,0,255}));
    connect(Op4.out, R10.p)
      annotation (Line(points={{140,-50},{160,-50}}, color={0,0,255}));
    connect(G2.p, Op3.in_p) annotation (Line(points={{19,-80},{4,-80},{4,-61.5}},
          color={0,0,255}));
    connect(R11.n, n12)
      annotation (Line(points={{229,40},{240,40}}, color={0,0,255}));
    connect(p3, n12) annotation (Line(points={{60,60},{240,60},{240,40}}, color={
            0,0,255}));
    connect(C9.n, n13)
      annotation (Line(points={{228,0},{231,0},{234,0},{240,0}},
                                                 color={0,0,255}));
    connect(n12, n13)
      annotation (Line(points={{240,40},{240,0}}, color={0,0,255}));
    connect(n13, Op5.out)
      annotation (Line(points={{240,0},{240,-50}}, color={0,0,255}));
    connect(C9.p, p4)
      annotation (Line(points={{208,0},{203.75,0},{199.5,0},{191,0}},
                                                 color={0,0,255}));
    connect(R11.p, p4) annotation (Line(points={{209,40},{191,40},{191,0}}, color=
           {0,0,255}));
    connect(R10.n, n14)
      annotation (Line(points={{180,-50},{191,-50}}, color={0,0,255}));
    connect(p4, n14)
      annotation (Line(points={{191,0},{191,-50}}, color={0,0,255}));
    connect(Op5.in_n, n14) annotation (Line(points={{200,-40},{191,-40},{191,-50}},
          color={0,0,255}));
    connect(C8.n, n14) annotation (Line(points={{180,-140},{191,-140},{191,-50}},
          color={0,0,255}));
    connect(Op4.in_p, G3.p) annotation (Line(points={{100,-60},{100,-80},{120,-80}},
          color={0,0,255}));
    connect(Op5.in_p, G4.p) annotation (Line(points={{200,-60},{200,-80},{220,-80}},
          color={0,0,255}));
    connect(V.p, Ground1.p)            annotation (Line(points={{-240,-180},{-240,
            -190}}, color={0,0,255}));
    connect(V.n, R1.p)            annotation (Line(points={{-240,-160},{-250,-160},
            {-250,-40},{-240,-40}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-250,
              -200},{250,200}}), graphics={Text(
            extent={{-130,172},{80,120}},
            textString="CauerLowPassOPV",
            lineColor={0,0,255})}),
      experiment(StopTime=60),
      Documentation(revisions="<html>
<ul>
<li><i>January 13, 2006</i>
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>",   info="<html>
<p>The example Cauer Filter is a low-pass-filter of the fifth order. It is realized using an analog network with operational amplifiers. The voltage source V is the input voltage (step), and the OP5.out.v is the filter output voltage. The pulse response is calculated.</p>
<p>This model is identical to the CauerLowPassAnalog example, but inverting. To get the same response as that of the CauerLowPassAnalog example, a negative voltage step is used as input.</p>
<p>The simulation end time should be 60. Please plot both V.v (which is the inverted input voltage) and OP5.p.v (output voltage). Compare this result with the CauerLowPassAnalog result.</p>
<p>During translation some warnings are issued concerning resistor values (Value=-1 not in range[0,1.e+100]). Do not worry about it. The negative values are o.k.</p>
</html>"));
  end CauerLowPassOPV;

  model CauerLowPassSC
    "Cauer low-pass filter with operational amplifiers and switched capacitors"
    extends Modelica_Icons.Example;

  model Rn "Negative resistance"
    parameter Modelica_SIunits.Time clock=1 "Clock";
    parameter Modelica_SIunits.Resistance R(min=Modelica_Constants.eps)=1
        "Resistance";
    Modelica_Blocks.Sources.BooleanPulse BooleanPulse1(period=clock)
      annotation (Placement(transformation(extent={{-10,50},{10,70}}, rotation=0)));

    Modelica_Electrical_Analog.Basic.Capacitor Capacitor1(C=clock/R)
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch1
        annotation (Placement(transformation(
            origin={-50,0},
            extent={{-10,-10},{10,10}},
            rotation=180)));
    Modelica_Electrical_Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch2
        annotation (Placement(transformation(extent={{40,-10},{60,10}},
              rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
            transformation(extent={{-66,-32},{-54,-20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Ground2 annotation (Placement(
            transformation(extent={{54,-32},{66,-20}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.NegativePin n1 annotation (
          Placement(transformation(extent={{-112,-10},{-92,10}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.NegativePin n2 annotation (
          Placement(transformation(extent={{90,-8},{110,12}}, rotation=0)));
  equation
    connect(IdealCommutingSwitch1.p,Capacitor1. p) annotation (Line(points={{-40,0},
              {-42,0},{-44,0},{-20,0}},                            color={0,0,255}));
    connect(Capacitor1.n,IdealCommutingSwitch2. p)
      annotation (Line(points={{20,0},{25,0},{30,0},{40,0}},
                                               color={0,0,255}));
    connect(IdealCommutingSwitch2.control,BooleanPulse1. y) annotation (Line(
            points={{50,8},{50,30},{20,30},{20,60},{11,60}}, color={255,0,255}));
    connect(IdealCommutingSwitch1.control,BooleanPulse1. y) annotation (Line(
            points={{-50,-8},{-50,30},{20,30},{20,60},{11,60}}, color={255,0,255}));
    connect(Ground2.p,IdealCommutingSwitch2. n2) annotation (Line(points={{60,-20},
              {60,0}}, color={0,0,255}));
    connect(IdealCommutingSwitch2.n1,n2)  annotation (Line(
          points={{60,5},{80,5},{80,2},{100,2}},
          color={0,0,255}));
    connect(n1, IdealCommutingSwitch1.n2) annotation (Line(
          points={{-102,0},{-81,0},{-60,0}},
          color={0,0,255}));
    connect(Ground1.p, IdealCommutingSwitch1.n1) annotation (Line(
          points={{-60,-20},{-60,-5}},
          color={0,0,255}));
    annotation (    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-80,32},{80,-30}},
              lineColor={0,0,255}),
            Text(
              extent={{-30,-40},{30,-72}},
              lineColor={0,0,0},
              textString="R=%R"),
            Line(points={{-74,0},{-80,0},{-60,0}}, color={85,255,85}),
            Line(points={{-80,-20},{-60,-20},{-60,-16},{-40,-8},{-4,-8}}, color={
                  85,255,85}),
            Line(points={{80,0},{60,0}}, color={85,255,85}),
            Line(points={{-60,2},{-60,-4}}, color={170,255,170}),
            Line(points={{-4,2},{-4,-18}}, color={85,255,85}),
            Line(points={{4,2},{4,-18}}, color={85,255,85}),
            Text(
              extent={{-60,80},{60,40}},
              lineColor={0,0,255},
              textString="%name"),
            Line(points={{-92,0},{-80,0}}, color={85,85,255}),
            Line(points={{90,0},{80,0},{80,0}}, color={85,85,255}),
            Line(points={{4,-8},{40,-8},{60,-4}}, color={85,255,85}),
            Line(points={{60,0},{60,-4}}, color={85,255,85}),
            Line(points={{60,-16},{60,-20},{80,-20}}, color={85,255,85})}),
        Documentation(info="<html>
<p>This model is a <b>negative</b> resistor without thermal behavior which is described as a switched capacitor model (care for the schematic).</p>
<p>The clock source is inside the model, its frequency can be chosen by parameter. Also the resistance is a parameter, it has to be <b>positive</b>. The internal (switched) capacitor is parametrized in such a way that the total resistance is independently from the frequency equal to the negative value of the <b>negative</b> resistance parameter.</p>
</html>"));
  end Rn;

  model Rp "Positive resistance"

    parameter Modelica_SIunits.Time clock=1 "Clock";
    parameter Modelica_SIunits.Resistance R(min=Modelica_Constants.eps)=1
        "Resistance";
    Modelica_Blocks.Sources.BooleanPulse BooleanPulse1(period=clock)
      annotation (Placement(transformation(extent={{-10,50},{10,70}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor Capacitor1(C=clock/R)
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch1
        annotation (Placement(transformation(
            origin={-50,0},
            extent={{-10,-10},{10,10}},
            rotation=180)));
    Modelica_Electrical_Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch2
        annotation (Placement(transformation(extent={{40,-10},{60,10}},
              rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
            transformation(
            origin={-60,46},
            extent={{-6,-6},{6,6}},
            rotation=180)));
    Modelica_Electrical_Analog.Basic.Ground Ground2 annotation (Placement(
            transformation(extent={{54,-44},{66,-32}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.NegativePin n1 annotation (
          Placement(transformation(extent={{-112,-10},{-92,10}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.NegativePin n2 annotation (
          Placement(transformation(extent={{90,-8},{110,12}}, rotation=0)));
  equation
    connect(IdealCommutingSwitch1.p, Capacitor1.p) annotation (Line(points={{-40,0},
              {-42,0},{-44,0},{-20,0}},                            color={0,0,255}));
    connect(Capacitor1.n, IdealCommutingSwitch2.p)
      annotation (Line(points={{20,0},{25,0},{30,0},{40,0}},
                                               color={0,0,255}));
    connect(IdealCommutingSwitch2.control, BooleanPulse1.y) annotation (Line(
            points={{50,8},{50,30},{20,30},{20,60},{11,60}}, color={255,0,255}));
    connect(IdealCommutingSwitch1.control, BooleanPulse1.y) annotation (Line(
            points={{-50,-8},{-50,30},{20,30},{20,60},{11,60}}, color={255,0,255}));
    connect(Ground1.p, IdealCommutingSwitch1.n2) annotation (Line(points={{-60,40},
              {-60,0}},                     color={0,0,255}));
    connect(Ground2.p, IdealCommutingSwitch2.n2) annotation (Line(points={{60,-32},
              {60,0}},          color={0,0,255}));
    connect(IdealCommutingSwitch1.n1, n1) annotation (Line(points={{-60,-5},{-99,
              -5},{-99,0},{-102,0}}, color={0,0,255}));
    connect(IdealCommutingSwitch2.n1, n2) annotation (Line(
          points={{60,5},{80,5},{80,2},{100,2}},
          color={0,0,255}));
    annotation (    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-80,30},{80,-32}},
              lineColor={0,0,255}),
            Line(points={{-92,0},{-80,0}}, color={85,85,255}),
            Line(points={{80,0},{92,0}}, color={85,85,255}),
            Text(
              extent={{-40,-40},{32,-72}},
              lineColor={0,0,0},
              textString="R=%R"),
            Line(points={{-74,0},{-80,0},{-60,0}}, color={85,255,85}),
            Line(points={{-80,-20},{-60,-20},{-60,-16},{-40,-10},{-4,-10}}, color=
                 {85,255,85}),
            Line(points={{4,-10},{40,-10},{60,-16},{60,-20},{80,-20}}, color={85,
                  255,85}),
            Line(points={{80,0},{60,0}}, color={85,255,85}),
            Line(points={{60,0},{60,-4}}, color={85,255,85}),
            Line(points={{-60,0},{-60,-6}}, color={170,255,170}),
            Line(points={{-4,0},{-4,-20}}, color={85,255,85}),
            Line(points={{4,0},{4,-20}}, color={85,255,85}),
            Text(
              extent={{-60,80},{60,40}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(info="<html>
<p>This model is a <b>positive</b> resistor without thermal behavior which is described as a switched capacitor model (care for the schematic).</p>
<p>The clock source is inside the model, its frequency can be chosen by parameter. Also the resistance is a parameter, it has to be <b>positive</b>. The internal (switched) capacitor is parametrized in such a way that the total resistance is independently from the frequency equal to the resistance parameter.</p>
</html>"));
  end Rp;

    parameter Modelica_SIunits.Capacitance l1=1.304 "filter coefficient i1";
    parameter Modelica_SIunits.Capacitance l2=0.8586 "filter coefficient i2";
    parameter Modelica_SIunits.Capacitance c1=1.072 "filter coefficient c1";
    parameter Modelica_SIunits.Capacitance c2=1/(1.704992^2*l1)
      "filter coefficient c2";
    parameter Modelica_SIunits.Capacitance c3=1.682 "filter coefficient c3";
    parameter Modelica_SIunits.Capacitance c4=1/(1.179945^2*l2)
      "filter coefficient c4";
    parameter Modelica_SIunits.Capacitance c5=0.7262 "filter coefficient c5";
    Modelica_Electrical_Analog.Basic.Capacitor C1(C=c1 + c2, v(start=0, fixed=
           true)) annotation (Placement(transformation(extent={{-193,30},{-173,
              50}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C2(C=c2, v(start=0, fixed=true))
      annotation (Placement(transformation(extent={{-241,-70},{-221,-50}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C3(C=l1, v(start=0, fixed=true))
      annotation (Placement(transformation(extent={{-91,30},{-71,50}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C4(C=c4, v(start=0, fixed=true))
      annotation (Placement(transformation(extent={{-31,50},{-11,70}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C5(C=c2) annotation (Placement(
          transformation(extent={{-31,-100},{-11,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op1 annotation (Placement(
          transformation(extent={{-201,-50},{-161,-10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground G annotation (Placement(
          transformation(extent={{-189,-76},{-175,-60}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op2 annotation (Placement(
          transformation(extent={{-101,-50},{-61,-10}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op3 annotation (Placement(
          transformation(extent={{5,-50},{45,-10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground G1 annotation (Placement(
          transformation(extent={{-88,-76},{-74,-60}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C6(C=c2 + c3 + c4) annotation (
       Placement(transformation(extent={{8,30},{28,50}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op4 annotation (Placement(
          transformation(extent={{99,-50},{139,-10}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealOpAmp3Pin Op5 annotation (Placement(
          transformation(extent={{199,-50},{239,-10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C7(C=l2, v(start=0, fixed=true))
      annotation (Placement(transformation(extent={{109,30},{129,50}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C8(C=c4) annotation (Placement(
          transformation(extent={{159,-130},{179,-110}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C9(C=c4 + c5) annotation (
        Placement(transformation(extent={{207,10},{227,30}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n1 annotation (
        Placement(transformation(extent={{-215,-22},{-211,-18}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n2 annotation (
        Placement(transformation(extent={{-215,18},{-211,22}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n3 annotation (
        Placement(transformation(extent={{-215,38},{-211,42}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n4 annotation (
        Placement(transformation(
          origin={-161,40},
          extent={{2,2},{-2,-2}},
          rotation=180)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n5 annotation (
        Placement(transformation(extent={{-115,-32},{-111,-28}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin p1 annotation (
        Placement(transformation(extent={{-155,-122},{-149,-118}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n6 annotation (
        Placement(transformation(extent={{-63,38},{-59,42}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n7 annotation (
        Placement(transformation(extent={{-7,-32},{-3,-28}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n8 annotation (
        Placement(transformation(extent={{-7,18},{-3,22}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin p2 annotation (
        Placement(transformation(extent={{-7,38},{-3,42}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin out1 annotation (
        Placement(transformation(extent={{43,-122},{47,-118}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin p3 annotation (
        Placement(transformation(extent={{57,78},{61,82}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n9 annotation (
        Placement(transformation(extent={{85,18},{89,22}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n10 annotation (
        Placement(transformation(extent={{85,-32},{89,-28}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n11 annotation (
        Placement(transformation(extent={{137,38},{141,42}}, rotation=0)));
  public
    Modelica_Electrical_Analog.Basic.Ground G2 annotation (Placement(
          transformation(extent={{11,-76},{25,-60}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n12 annotation (
        Placement(transformation(extent={{237,58},{241,62}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n13 annotation (
        Placement(transformation(extent={{237,18},{241,22}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.PositivePin p4 annotation (
        Placement(transformation(extent={{187,18},{193,22}}, rotation=0)));
  protected
    Modelica_Electrical_Analog.Interfaces.NegativePin n14 annotation (
        Placement(transformation(extent={{187,-32},{193,-28}}, rotation=0)));
  public
    Modelica_Electrical_Analog.Basic.Ground G3 annotation (Placement(
          transformation(extent={{112,-76},{126,-60}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground G4 annotation (Placement(
          transformation(extent={{212,-76},{226,-60}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.StepVoltage V(startTime=1, V=1)
      annotation (Placement(transformation(
          origin={-241,-150},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
          transformation(extent={{-247,-182},{-235,-170}}, rotation=0)));
    Rn R4(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{-140,-40},{
              -120,-20}}, rotation=0)));
    Rn R5(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{-140,-80},{
              -120,-60}}, rotation=0)));
    Rn R8(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{60,10},{80,30}},
            rotation=0)));
    Rn R9(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{60,-40},{80,
              -20}}, rotation=0)));
    Rp R1(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{-240,-30},{
              -220,-10}}, rotation=0)));
    Rp R2(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{-240,10},{-220,
              30}}, rotation=0)));
    Rp R3(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{-200,70},{-180,
              90}}, rotation=0)));
    Rp Rp1(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{-32,10},{-12,
              30}}, rotation=0)));
    Rp R7(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{-32,-40},{-12,
              -20}}, rotation=0)));
    Rp R10(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{160,-40},{180,
              -20}}, rotation=0)));
    Rp R11(clock=0.1, Capacitor1(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{208,50},{228,
              70}}, rotation=0)));
  equation
    connect(Op1.in_p,G. p) annotation (Line(points={{-201,-40},{-201,-50},{-181,
            -50},{-181,-60},{-182,-60}}, color={0,0,255}));
    connect(G1.p,Op2. in_p) annotation (Line(points={{-81,-60},{-81,-50},{-101,
            -50},{-101,-40}}, color={0,0,255}));
    connect(n1,Op1. in_n) annotation (Line(points={{-213,-20},{-201,-20}}, color=
            {0,0,255}));
    connect(C2.n,n1)  annotation (Line(points={{-221,-60},{-213,-60},{-213,-20}},
          color={0,0,255}));
    connect(n1,n2)
      annotation (Line(points={{-213,-20},{-213,20}}, color={0,0,255}));
    connect(n2,n3)
      annotation (Line(points={{-213,20},{-213,40}}, color={0,0,255}));
    connect(n3,C1. p)
      annotation (Line(points={{-213,40},{-193,40}}, color={0,0,255}));
    connect(C1.n,n4)
      annotation (Line(points={{-173,40},{-161,40}}, color={0,0,255}));
    connect(n4,Op1. out) annotation (Line(points={{-161,40},{-161,-30}}, color={0,
            0,255}));
    connect(C5.p,Op1. out) annotation (Line(points={{-31,-90},{-161,-90},{-161,
            -30}}, color={0,0,255}));
    connect(n5,Op2. in_n) annotation (Line(points={{-113,-30},{-113,-20},{-101,
            -20}}, color={0,0,255}));
    connect(C3.p,n5)  annotation (Line(points={{-91,40},{-113,40},{-113,-30}},
          color={0,0,255}));
    connect(C2.p,p1)  annotation (Line(points={{-241,-60},{-241,-120},{-152,-120}},
          color={0,0,255}));
    connect(C3.n,n6)
      annotation (Line(points={{-71,40},{-61,40}}, color={0,0,255}));
    connect(n6,Op2. out)
      annotation (Line(points={{-61,40},{-61,-30}}, color={0,0,255}));
    connect(n7,Op3. in_n) annotation (Line(points={{-5,-30},{-5,-20},{5,-20}},
          color={0,0,255}));
    connect(C5.n,n7)  annotation (Line(points={{-11,-90},{-5,-90},{-5,-30}},
          color={0,0,255}));
    connect(n7,n8)  annotation (Line(points={{-5,-30},{-5,20}}, color={0,0,255}));
    connect(C6.p,p2)
      annotation (Line(points={{8,40},{-5,40}}, color={0,0,255}));
    connect(n8,p2)
      annotation (Line(points={{-5,20},{-5,40}}, color={0,0,255}));
    connect(C4.n,p2)  annotation (Line(points={{-11,60},{-5,60},{-5,40}}, color={
            0,0,255}));
    connect(C6.n,Op3. out) annotation (Line(points={{28,40},{45,40},{45,-30}},
          color={0,0,255}));
    connect(Op3.out,out1)
      annotation (Line(points={{45,-30},{45,-120}}, color={0,0,255}));
    connect(p1,out1)  annotation (Line(points={{-152,-120},{45,-120}}, color={0,0,
            255}));
    connect(out1,C8. p) annotation (Line(points={{45,-120},{159,-120}}, color={0,
            0,255}));
    connect(C4.p,p3)  annotation (Line(points={{-31,60},{-41,60},{-41,80},{59,80}},
          color={0,0,255}));
    connect(n9,n10)
      annotation (Line(points={{87,20},{87,-30}}, color={0,0,255}));
    connect(n10,Op4. in_n) annotation (Line(points={{87,-30},{87,-20},{99,-20}},
          color={0,0,255}));
    connect(n9,C7. p) annotation (Line(points={{87,20},{87,40},{109,40}}, color={
            0,0,255}));
    connect(C7.n,n11)
      annotation (Line(points={{129,40},{139,40}}, color={0,0,255}));
    connect(n11,Op4. out)
      annotation (Line(points={{139,40},{139,-30}}, color={0,0,255}));
    connect(G2.p,Op3. in_p) annotation (Line(points={{18,-60},{5,-60},{5,-40}},
          color={0,0,255}));
    connect(p3,n12)  annotation (Line(points={{59,80},{239,80},{239,60}}, color={
            0,0,255}));
    connect(C9.n,n13)
      annotation (Line(points={{227,20},{239,20}}, color={0,0,255}));
    connect(n12,n13)
      annotation (Line(points={{239,60},{239,20}}, color={0,0,255}));
    connect(n13,Op5. out)
      annotation (Line(points={{239,20},{239,-30}}, color={0,0,255}));
    connect(C9.p,p4)
      annotation (Line(points={{207,20},{190,20}}, color={0,0,255}));
    connect(p4,n14)
      annotation (Line(points={{190,20},{190,-30}}, color={0,0,255}));
    connect(Op5.in_n,n14)  annotation (Line(points={{199,-20},{190,-20},{190,-30}},
          color={0,0,255}));
    connect(C8.n,n14)  annotation (Line(points={{179,-120},{190,-120},{190,-30}},
          color={0,0,255}));
    connect(Op4.in_p,G3. p) annotation (Line(points={{99,-40},{99,-60},{119,-60}},
          color={0,0,255}));
    connect(Op5.in_p,G4. p) annotation (Line(points={{199,-40},{199,-60},{219,-60}},
          color={0,0,255}));
    connect(V.p, Ground1.p)            annotation (Line(points={{-241,-160},{-241,
            -170}}, color={0,0,255}));
    connect(R4.n2, n5) annotation (Line(
        points={{-120,-29.8},{-116,-29.8},{-116,-30},{-113,-30}},
        color={0,0,255}));
    connect(Op1.out, R4.n1) annotation (Line(
        points={{-161,-30},{-140.2,-30}},
        color={0,0,255}));
    connect(R5.n1, p1) annotation (Line(
        points={{-140.2,-70},{-152,-70},{-152,-120}},
        color={0,0,255}));
    connect(R5.n2, n5) annotation (Line(
        points={{-120,-69.8},{-116,-69.8},{-116,-70},{-113,-70},{-113,-30}},
        color={0,0,255}));
    connect(p3, R8.n1) annotation (Line(
        points={{59,80},{59.8,80},{59.8,20}},
        color={0,0,255}));
    connect(R8.n2, n9) annotation (Line(
        points={{80,20.2},{84,20.2},{84,20},{87,20}},
        color={0,0,255}));
    connect(Op3.out, R9.n1) annotation (Line(
        points={{45,-30},{59.8,-30}},
        color={0,0,255}));
    connect(R9.n2, n10) annotation (Line(
        points={{80,-29.8},{84,-29.8},{84,-30},{87,-30}},
        color={0,0,255}));
    connect(R1.n1, V.n)            annotation (Line(
        points={{-240.2,-20},{-250,-20},{-250,-130},{-241,-130},{-241,-140}},
        color={0,0,255}));
    connect(R1.n2, n1) annotation (Line(
        points={{-220,-19.8},{-216,-19.8},{-216,-20},{-213,-20}},
        color={0,0,255}));
    connect(R2.n2, n2) annotation (Line(
        points={{-220,20.2},{-218,20.2},{-218,20},{-213,20}},
        color={0,0,255}));
    connect(R2.n1, n6) annotation (Line(
        points={{-240.2,20},{-240,20},{-240,100},{-61,100},{-61,40}},
        color={0,0,255}));
    connect(R3.n1, n3) annotation (Line(
        points={{-200.2,80},{-213,80},{-213,40}},
        color={0,0,255}));
    connect(R3.n2, n4) annotation (Line(
        points={{-180,80.2},{-170,80.2},{-170,80},{-161,80},{-161,40}},
        color={0,0,255}));
    connect(Rp1.n2, n8) annotation (Line(
        points={{-12,20.2},{-8,20.2},{-8,20},{-5,20}},
        color={0,0,255}));
    connect(Rp1.n1, n11) annotation (Line(
        points={{-32.2,20},{-52,20},{-52,100},{139,100},{139,40}},
        color={0,0,255}));
    connect(Op2.out, R7.n1) annotation (Line(
        points={{-61,-30},{-32.2,-30}},
        color={0,0,255}));
    connect(R7.n2, n7) annotation (Line(
        points={{-12,-29.8},{-8,-29.8},{-8,-30},{-5,-30}},
        color={0,0,255}));
    connect(R10.n1, Op4.out) annotation (Line(
        points={{159.8,-30},{139,-30}},
        color={0,0,255}));
    connect(R10.n2, n14) annotation (Line(
        points={{180,-29.8},{186,-29.8},{186,-30},{190,-30}},
        color={0,0,255}));
    connect(R11.n2, n12) annotation (Line(
        points={{228,60.2},{234,60.2},{234,60},{239,60}},
        color={0,0,255}));
    connect(R11.n1, p4) annotation (Line(
        points={{207.8,60},{190,60},{190,20}},
        color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-250,
              -200},{250,200}}), graphics={Text(
            extent={{-100,180},{94,140}},
            textString="CauerLowPassSC",
            lineColor={0,0,255})}),
      experiment(StopTime=60, Interval=0.04),
      Documentation(revisions="<html>
<ul>
<li><i>January 13, 2006</i>
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>",   info="<html>
<p>The example CauerLowPassSC is a low-pass-filter of the fifth order. It is realized using an switched-capacitor network with operational amplifiers. The voltage source V is the input voltage (step), and the OP5.out.v is the filter output voltage. The pulse response is calculated.</p>
<p>This model is identical to the CauerLowPassAnalog example, but inverting. To get the same response as that of the CauerLowPassAnalog example, a negative voltage step is used as input.</p>
<p>This model is identical to the CauerLowPassOPV example. But the resistors are realized by switched capacitors. There are two such resistors Rp (of value +1), and Rn (of value -1). In this models the switching clock source is included. In a typical switched capacitor circuit there would be a central clock source.</p>
<p>The simulation end time should be 60. Please plot both V.v (which is the inverted input voltage) and OP5.p.v (output voltage). Compare this result with the CauerLowPassAnalog result.</p>
<p>Due to the recharging of the capacitances after switching the performance of simulation is not as good as in the CauerLowPassOPV example.</p>
</html>"));
  end CauerLowPassSC;

  model CharacteristicIdealDiodes "Characteristic of ideal diodes"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Analog.Ideal.IdealDiode Ideal(
      Ron=0,
      Goff=0,
      Vknee=0) annotation (Placement(transformation(extent={{0,40},{20,60}},
            rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealDiode With_Ron_Goff(
      Ron=0.1,
      Goff=0.1,
      Vknee=0) annotation (Placement(transformation(extent={{0,0},{20,20}},
            rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealDiode With_Ron_Goff_Vknee(
      Ron=0.2,
      Goff=0.2,
      Vknee=5) annotation (Placement(transformation(extent={{0,-40},{20,-20}},
            rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage1(
      V=10,
      offset=-9,
      freqHz=1) annotation (Placement(transformation(
          origin={-40,0},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
          transformation(extent={{-50,-80},{-30,-60}}, rotation=0)));

    Modelica_Electrical_Analog.Basic.Resistor R1(R=1.e-3) annotation (
        Placement(transformation(extent={{60,40},{80,60}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R2(R=1.e-3) annotation (
        Placement(transformation(extent={{60,0},{80,20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R3(R=1.e-3) annotation (
        Placement(transformation(extent={{60,-40},{80,-20}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage2(
      V=10,
      offset=0,
      freqHz=1) annotation (Placement(transformation(
          origin={-60,40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage3(
      V=10,
      offset=0,
      freqHz=1) annotation (Placement(transformation(
          origin={-20,-40},
          extent={{-10,-10},{10,10}},
          rotation=270)));

  equation
    connect(Ground1.p, SineVoltage1.n)
      annotation (Line(points={{-40,-60},{-40,-10}}, color={0,0,255}));
    connect(Ideal.n, R1.p)
      annotation (Line(points={{20,50},{60,50}}, color={0,0,255}));
    connect(With_Ron_Goff.n, R2.p)
      annotation (Line(points={{20,10},{60,10}}, color={0,0,255}));
    connect(With_Ron_Goff_Vknee.n, R3.p)
      annotation (Line(points={{20,-30},{60,-30}}, color={0,0,255}));
    connect(R1.n, R2.n)
      annotation (Line(points={{80,50},{80,10}}, color={0,0,255}));
    connect(R2.n, R3.n)
      annotation (Line(points={{80,10},{80,-30}}, color={0,0,255}));
    connect(R3.n, Ground1.p)
      annotation (Line(points={{80,-30},{80,-60},{-40,-60}}, color={0,0,255}));
    connect(SineVoltage2.p, Ideal.p)
      annotation (Line(points={{-60,50},{0,50}}, color={0,0,255}));
    connect(SineVoltage2.n, Ground1.p)
      annotation (Line(points={{-60,30},{-60,-60},{-40,-60}}, color={0,0,255}));
    connect(SineVoltage1.p, With_Ron_Goff.p)
      annotation (Line(points={{-40,10},{0,10}}, color={0,0,255}));
    connect(With_Ron_Goff_Vknee.p, SineVoltage3.p)
      annotation (Line(points={{0,-30},{-20,-30}}, color={0,0,255}));
    connect(SineVoltage3.n, Ground1.p)
      annotation (Line(points={{-20,-50},{-20,-60},{-40,-60}}, color={0,0,255}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Text(
            extent={{-88,102},{92,48}},
            textString="Characteristic Ideal Diodes",
            lineColor={0,0,255})}),
      Documentation(info="<html>
<p>Three examples of ideal diodes are shown:
<br>the <b>totally ideal diode</b> (Ideal) with all parameters to be zero,
the <b>nearly ideal diode</b> with <i>Ron=0.1</i> and <i>Goff=0.1</i>
 and the nearly ideal but <b>displaced diode</b> with <i>Vknee=5</i> and <i>Ron=0.1</i> and <i>Goff=0.1</i>.
The resistance and conductance are chosen untypically high since the slopes should be seen in the graphics.
</p><p>Simulate until T=1 s.
Plot in separate windows:
Ideal.i versus Ideal.v, With_Ron_Goff.i versus With_Ron_Goff.v, With_Ron_Goff_Vknee.i versus With_Ron_Goff_Vknee.v
</p>
</html>",   revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),
      experiment(StopTime=1));
  end CharacteristicIdealDiodes;

  model CharacteristicThyristors "Characteristic of ideal thyristors"

    extends Modelica_Icons.Example;

    Modelica_Electrical_Analog.Ideal.IdealThyristor IdealThyristor1(off(start=
           true, fixed=true), Vknee=1) annotation (Placement(transformation(
            extent={{-20,30},{0,50}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage1(
      V=10,
      offset=0,
      freqHz=1) annotation (Placement(transformation(
          origin={-40,-62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
          transformation(extent={{-50,-108},{-30,-88}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R3(R=1.e-3) annotation (
        Placement(transformation(extent={{40,30},{60,50}}, rotation=0)));

    Modelica_Electrical_Analog.Ideal.IdealGTOThyristor IdealGTOThyristor1(off(fixed=
           true, start=true), Vknee=1) annotation (Placement(transformation(
            extent={{-20,0},{0,20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R1(R=1.e-3) annotation (
        Placement(transformation(extent={{40,0},{60,20}}, rotation=0)));

    Modelica_Blocks.Sources.BooleanTable booleanStep1(table={1.25,3.2,4.2,
          4.25,5.7,5.72})
      annotation (Placement(transformation(extent={{-68,44},{-48,64}})));
    Modelica_Electrical_Analog.Ideal.IdealThyristor IdealThyristor2(off(start=
           true, fixed=true), Vknee=1) annotation (Placement(transformation(
            extent={{-20,-52},{0,-32}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R2(R=1.e-3) annotation (
        Placement(transformation(extent={{40,-52},{60,-32}}, rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealGTOThyristor IdealGTOThyristor2(off(fixed=
           true, start=true), Vknee=1) annotation (Placement(transformation(
            extent={{-20,-82},{0,-62}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R4(R=1.e-3) annotation (
        Placement(transformation(extent={{40,-82},{60,-62}}, rotation=0)));
    Modelica_Blocks.Sources.BooleanPulse booleanPulse(
      width=20,
      period=1,
      startTime=0.15)
      annotation (Placement(transformation(extent={{-68,-32},{-48,-12}})));
  initial equation
   // IdealThyristor1.off = true;

  equation
    connect(IdealThyristor1.n, R3.p)
    annotation (Line(points={{0,40},{40,40}}, color={0,0,255}));
    connect(Ground1.p, SineVoltage1.n)
    annotation (Line(points={{-40,-88},{-40,-72}}, color={0,0,255}));
    connect(SineVoltage1.p, IdealThyristor1.p)
    annotation (Line(points={{-40,-52},{-40,40},{-20,40}},
                                                         color={0,0,255}));
    connect(IdealGTOThyristor1.n, R1.p)
    annotation (Line(points={{0,10},{40,10}},   color={0,0,255}));
    connect(R3.n, R1.n)
    annotation (Line(points={{60,40},{60,10}},  color={0,0,255}));
    connect(IdealGTOThyristor1.p, IdealThyristor1.p)
    annotation (Line(points={{-20,10},{-20,40}},  color={0,0,255}));
    connect(IdealGTOThyristor1.fire, IdealThyristor1.fire)
    annotation (Line(points={{-3,21},{-3,27.5},{-2,27.5},{-2,35},{-3,35},{-3,51}},
          color={255,0,255}));
    connect(IdealThyristor1.fire, booleanStep1.y) annotation (Line(
        points={{-3,51},{-3,54},{-47,54}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(IdealThyristor2.n,R2. p)
    annotation (Line(points={{0,-42},{40,-42}},
                                              color={0,0,255}));
    connect(IdealGTOThyristor2.n,R4. p)
    annotation (Line(points={{0,-72},{40,-72}}, color={0,0,255}));
    connect(R2.n,R4. n)
    annotation (Line(points={{60,-42},{60,-72}},color={0,0,255}));
    connect(IdealGTOThyristor2.p,IdealThyristor2. p)
    annotation (Line(points={{-20,-72},{-20,-42}},color={0,0,255}));
    connect(IdealGTOThyristor2.fire,IdealThyristor2. fire)
    annotation (Line(points={{-3,-61},{-3,-54.5},{-2,-54.5},{-2,-47},{-3,-47},{-3,
            -31}},
          color={255,0,255}));
    connect(R4.n, Ground1.p) annotation (Line(
        points={{60,-72},{60,-88},{-40,-88}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R2.n, R1.n) annotation (Line(
        points={{60,-42},{60,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(SineVoltage1.p, IdealThyristor2.p) annotation (Line(
        points={{-40,-52},{-40,-42},{-20,-42}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(booleanPulse.y, IdealThyristor2.fire) annotation (Line(
        points={{-47,-22},{-3,-22},{-3,-31}},
        color={255,0,255},
        smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}),       graphics={Text(
            extent={{-96,100},{98,60}},
            textString="Characteristic Thyristors",
            lineColor={0,0,255})}),        Documentation(info="<html>
<p>This example compares the behavior of the <b>ideal thyristor</b> and the <b>ideal GTO thyristor</b> with <i>Vknee=1</i> both. The thyristors IdealThyristor1 and IdealGTOThyristor1 are controlled by an unregular Boolean fire signal. The aim is to show several cases for the fire signal in combination with the state (s&lt;0 or s&gt;0)of the thyristors. Please simulate until 6 seconds and compare IdealThyristor1.v with IdealGTOThyristor1.v, the same with IdealThyristor1.s and IdealGTOThyristor1.s (attention: s is a protected variable in each thyristor). Also compare IdealThyristor1.off and IdealGTOThyristor1.off and have a look at the fire signal (e.g. IdealThyristor1.fire). It can be seen that the IdealGTOThyristor1 reacts on switching off the fire signal whereas the IdealThyristor1 does not show this behavior.</p>
<p>The other thyristors IdealThyristor2 and IdealGTOThyristor2 are controlled by an periodic Boolean fire signal to show a typical use case. Please compare IdealThyristor2.v with IdealGTOThyristor2.v</p>
</html>",
     revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Jan 23, 2013   </i>
       by Kristin Majetta and Christoph Clauss<br> revised<br>
       </li>
</ul>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),   experiment(StopTime=6));
  end CharacteristicThyristors;

  encapsulated model ChuaCircuit "Chua's circuit, ns, V, A"
    import Modelica_Electrical_Analog.Basic;
    import Modelica_Electrical_Analog_Examples.Utilities;
    import Icons = Modelica_Icons;
    import Modelica_Icons;
    extends Modelica_Icons.Example;

    Basic.Inductor L(L=18, i(start=0, fixed=true)) annotation (Placement(transformation(
          origin={-75,38},
          extent={{-25,-25},{25,25}},
          rotation=270)));
    Basic.Resistor Ro(R=12.5e-3) annotation (Placement(transformation(
          origin={-75,-17},
          extent={{-25,-25},{25,25}},
          rotation=270)));
    Basic.Conductor G(G=0.565) annotation (Placement(transformation(extent={{-25,38},
              {25,88}},      rotation=0)));
    Basic.Capacitor C1(C=10, v(start=4, fixed=true))                          annotation (Placement(transformation(
          origin={25,3},
          extent={{-25,-25},{25,25}},
          rotation=270)));
    Basic.Capacitor C2(C=100, v(start=0, fixed=true)) annotation (Placement(transformation(
          origin={-25,3},
          extent={{-25,-25},{25,25}},
          rotation=270)));
    Utilities.NonlinearResistor Nr(
      Ga(min=-1) = -0.757576,
      Gb(min=-1) = -0.409091,
      Ve=1) annotation (Placement(transformation(
          origin={75,3},
          extent={{-25,-25},{25,25}},
          rotation=270)));
    Basic.Ground Gnd annotation (Placement(transformation(extent={{-25,-112},{25,
              -62}}, rotation=0)));
  equation
    connect(L.n, Ro.p) annotation (Line(points={{-75,13},{-75,8}}));
    connect(C2.p, G.p) annotation (Line(
        points={{-25,28},{-25,45.5},{-25,45.5},{-25,63}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(L.p, G.p) annotation (Line(
        points={{-75,63},{-25,63}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G.n, Nr.p) annotation (Line(
        points={{25,63},{75,63},{75,28}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(C1.p, G.n) annotation (Line(
        points={{25,28},{25,45.5},{25,45.5},{25,63}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Ro.n, Gnd.p) annotation (Line(
        points={{-75,-42},{-75,-62},{0,-62}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(C2.n, Gnd.p) annotation (Line(
        points={{-25,-22},{-24,-22},{-24,-62},{0,-62}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Gnd.p, C1.n) annotation (Line(
        points={{0,-62},{25,-62},{25,-22}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Gnd.p, Nr.n) annotation (Line(
        points={{0,-62},{75,-62},{75,-22}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>Chua&#39;;s circuit is the most simple nonlinear circuit which shows chaotic behaviour. The circuit consists of linear basic elements (capacitors, resistor, conductor, inductor), and one nonlinear element, which is called Chua&#39;;s diode. The chaotic behaviour is simulated.</p>
<p>The simulation end time should be set to 5e4. To get the chaotic behaviour please plot C1.v. Choose C2.v as the independent variable .</p>
<p><b>Reference:</b></p>
<p>Kennedy, M.P.: Three Steps to Chaos - Part I: Evolution. IEEE Transactions on CAS I 40 (1993)10, 640-656</p>
</html>",
     revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
</dd>
</dl>
</html>"),
      experiment(StopTime=5e4, Interval=1),
      Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}), graphics={Text(
            extent={{-98,104},{-32,72}},
            lineColor={0,0,255},
            textString="Chua Circuit")}));
  end ChuaCircuit;

  encapsulated model DifferenceAmplifier
    "Simple NPN transistor amplifier circuit"
    import Modelica_Electrical_Analog.Basic;
    import Modelica_Electrical_Analog.Sources;
    import Modelica_Electrical_Analog_Examples.Utilities;
    import Icons = Modelica_Icons;
    import Modelica_Icons;
    extends Modelica_Icons.Example;

    Sources.ExpSineVoltage V1(
      V=0.2,
      freqHz=0.2e9,
      damping=0.1e8) annotation (Placement(transformation(
          origin={-90,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Sources.RampVoltage V2(V=15, duration=1e-9) annotation (Placement(
          transformation(
          origin={80,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Sources.RampCurrent I1(I=0.16, duration=1e-9) annotation (Placement(
          transformation(
          origin={-10,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Basic.Resistor R1(R=0.0001) annotation (Placement(transformation(extent={{-90,
              -20},{-70,0}}, rotation=0)));
    Basic.Resistor R2(R=100) annotation (Placement(transformation(
          origin={-40,30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Basic.Resistor R3(R=0.0001) annotation (Placement(transformation(extent={{70,
              -20},{90,0}}, rotation=0)));
    Basic.Resistor R4(R=100) annotation (Placement(transformation(
          origin={40,30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Basic.Capacitor C1(C=1e-10, v(start=0, fixed=true)) annotation (Placement(transformation(
          origin={-60,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Basic.Capacitor C4(C=1e-10, v(start=0, fixed=true)) annotation (Placement(transformation(extent={{10,
              -14},{30,6}}, rotation=0)));
    Basic.Capacitor C5(C=1e-10, v(start=0, fixed=true)) annotation (Placement(transformation(
          origin={10,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Basic.Capacitor C2(C=1e-10, v(start=0, fixed=true)) annotation (Placement(transformation(extent={{-30,
              -14},{-10,6}}, rotation=0)));
    Basic.Capacitor C3(C=1e-10, v(start=0, fixed=true)) annotation (Placement(transformation(
          origin={60,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Basic.Ground Gnd1 annotation (Placement(transformation(extent={{-95,-80},{-85,
              -70}}, rotation=0)));
    Basic.Ground Gnd9 annotation (Placement(transformation(extent={{75,20},{85,30}},
            rotation=0)));
    Basic.Ground Gnd3 annotation (Placement(transformation(extent={{-15,-20},{-5,
              -10}}, rotation=0)));
    Basic.Ground Gnd2 annotation (Placement(transformation(extent={{-65,-80},{-55,
              -70}}, rotation=0)));
    Basic.Ground Gnd6 annotation (Placement(transformation(extent={{5,-20},{15,
              -10}}, rotation=0)));
    Basic.Ground Gnd7 annotation (Placement(transformation(extent={{-15,-80},{-5,
              -70}}, rotation=0)));
    Basic.Ground Gnd8 annotation (Placement(transformation(extent={{5,-80},{15,
              -70}}, rotation=0)));
    Basic.Ground Gnd5 annotation (Placement(transformation(extent={{55,-80},{65,
              -70}}, rotation=0)));
    Basic.Ground Gnd4 annotation (Placement(transformation(extent={{85,-50},{95,
              -40}}, rotation=0)));
    Utilities.Transistor Transistor1(ct(v(start=0, fixed=true))) annotation (Placement(transformation(extent=
              {{-60,-20},{-40,0}}, rotation=0)));
    Utilities.Transistor Transistor2(ct(v(start=0, fixed=true))) annotation (Placement(transformation(extent=
              {{60,-20},{40,0}}, rotation=0)));
  equation
    connect(V1.n, Gnd1.p) annotation (Line(points={{-90,-60},{-90,-70}}, color={0,
            0,255}));
    connect(C1.n, Gnd2.p) annotation (Line(points={{-60,-60},{-60,-70}}, color={0,
            0,255}));
    connect(I1.n, Gnd7.p) annotation (Line(points={{-10,-60},{-10,-65},{-10,-70}},
          color={0,0,255}));
    connect(C5.n, Gnd8.p) annotation (Line(points={{10,-60},{10,-70}}, color={0,0,
            255}));
    connect(C3.n, Gnd5.p) annotation (Line(points={{60,-60},{60,-70}}, color={0,0,
            255}));
    connect(R3.n, Gnd4.p) annotation (Line(points={{90,-10},{90,-40}}, color={0,0,
            255}));
    connect(C2.n, Gnd3.p) annotation (Line(points={{-10,-4},{-10,-10}}, color={0,0,
            255}));
    connect(C4.p, Gnd6.p) annotation (Line(points={{10,-4},{10,-10}}, color={0,0,255}));
    connect(I1.p, C5.p) annotation (Line(points={{-10,-40},{10,-40}}, color={0,0,255}));
    connect(R1.p, V1.p) annotation (Line(points={{-90,-10},{-90,-40}}, color={0,0,
            255}));
    connect(R2.p, V2.p) annotation (Line(points={{-40,40},{-40,70},{80,70},{80,60}}, color=
            {0,0,255}));
    connect(R4.p, V2.p) annotation (Line(points={{40,40},{40,70},{80,70},{80,60}}, color=
            {0,0,255}));
    connect(V2.n, Gnd9.p) annotation (Line(points={{80,40},{80,30}}, color={0,0,255}));
    connect(R1.n, Transistor1.b) annotation (Line(points={{-70,-10},{-60,-10}}, color=
            {0,0,255}));
    connect(Transistor1.b, C1.p) annotation (Line(points={{-60,-10},{-60,-40}}, color=
            {0,0,255}));
    connect(Transistor1.c, C2.p) annotation (Line(points={{-40,-4},{-30,-4}}, color=
            {0,0,255}));
    connect(R2.n, Transistor1.c) annotation (Line(points={{-40,20},{-40,-4}}, color=
            {0,0,255}));
    connect(Transistor1.e, I1.p) annotation (Line(points={{-40,-16},{-30,-16},{
            -30,-40},{-10,-40}},
                             color={0,0,255}));
    connect(Transistor2.b, R3.p) annotation (Line(points={{60,-10},{70,-10}}, color=
            {0,0,255}));
    connect(Transistor2.b, C3.p) annotation (Line(points={{60,-10},{60,-40}}, color=
            {0,0,255}));
    connect(C4.n, Transistor2.c) annotation (Line(points={{30,-4},{40,-4}}, color=
            {0,0,255}));
    connect(R4.n, Transistor2.c) annotation (Line(points={{40,20},{40,-4}}, color=
            {0,0,255}));
    connect(C5.p, Transistor2.e) annotation (Line(points={{10,-40},{30,-40},{30,
            -16},{40,-16}},
                       color={0,0,255}));
    annotation (
      Documentation(info="<html>
<p>It is a simple NPN transistor amplifier circuit. The voltage difference between R1.p and R3.n is amplified. The output signal is the voltage between R2.n and R4.n. In this example the voltage at V1 is amplified because R3.n is grounded.</p>
<p>The simulation end time should be set to 1e- 8. Please plot the input voltage V1.v, and the output voltages R2.n.v, and R4.n.v.</p>
<p><b>Reference:</b></p>
<p>Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 59</p>
</html>",
     revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
</dl>
</html>"),
      experiment(StopTime=1),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Text(
            extent={{-98,106},{22,60}},
            lineColor={0,0,255},
            textString="Difference Amplifier")}));
  end DifferenceAmplifier;

  model HeatingMOSInverter "Heating MOS Inverter"
    extends Modelica_Icons.Example;
    Modelica_Electrical_Analog.Basic.Ground G annotation (Placement(
          transformation(extent={{-80,-40},{-60,-20}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage Sin(V=5, freqHz=1)
      annotation (Placement(transformation(
          origin={-70,0},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Modelica_Electrical_Analog.Basic.Capacitor Capacitor1(C=0.00001, v(start=
            0, fixed=true)) annotation (Placement(transformation(
          origin={30,10},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor HeatCapacitor1(C=0.01)
    annotation (Placement(transformation(
          origin={70,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor TC1(G=0.01)
    annotation (Placement(transformation(extent={{0,-50},{20,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Semiconductors.HeatingPMOS H_PMOS(useHeatPort=
          true) annotation (Placement(transformation(extent={{-40,40},{-20,60}},
            rotation=0)));
    Modelica_Electrical_Analog.Semiconductors.HeatingNMOS H_NMOS(useHeatPort=
          true) annotation (Placement(transformation(extent={{-40,0},{-20,20}},
            rotation=0)));
    Modelica_Electrical_Analog.Sources.RampVoltage V(V=5, duration=1.e-2)
      annotation (Placement(transformation(
          origin={50,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor TC2(G=0.01)
    annotation (Placement(transformation(extent={{0,-90},{20,-70}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Sources.FixedTemperature FixedTemperature1(T=
          300)
             annotation (Placement(transformation(
          origin={90,-30},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor TC3(G=0.01)
    annotation (Placement(transformation(extent={{50,-40},{70,-20}}, rotation=0)));

  initial equation
    HeatCapacitor1.T= 293.15;

  equation
    connect(Sin.n, G.p)
    annotation (Line(points={{-70,-10},{-70,-20}}, color={0,0,255}));
    connect(Capacitor1.n, G.p)
    annotation (Line(points={{30,0},{30,-20},{-70,-20}}, color={0,0,255}));

    connect(H_PMOS.S, H_NMOS.D)
    annotation (Line(points={{-20,45},{-20,15}}, color={0,0,255}));
    connect(H_NMOS.D, Capacitor1.p)
    annotation (Line(points={{-20,15},{-20,20},{30,20}}, color={0,0,255}));
    connect(H_NMOS.B, H_NMOS.S)
    annotation (Line(points={{-20,10},{-20,5}}, color={0,0,255}));
    connect(H_NMOS.S, G.p)
    annotation (Line(points={{-20,5},{-20,-20},{-70,-20}}, color={0,0,255}));
    connect(H_PMOS.B, H_PMOS.D)
    annotation (Line(points={{-20,50},{-20,55}}, color={0,0,255}));
    connect(V.p, H_PMOS.D)
    annotation (Line(points={{50,60},{-20,60},{-20,55}}, color={0,0,255}));
    connect(V.n, G.p)
    annotation (Line(points={{50,40},{50,-20},{-70,-20}}, color={0,0,255}));
    connect(TC1.port_b, HeatCapacitor1.port)
                                           annotation (Line(points={{20,-40},{40,
            -40},{40,-60},{60,-60}}, color={191,0,0}));
    connect(TC2.port_b, HeatCapacitor1.port)
                                           annotation (Line(points={{20,-80},{40,
            -80},{40,-60},{60,-60}}, color={191,0,0}));
    connect(TC1.port_a, H_PMOS.heatPort)
                                       annotation (Line(points={{0,-40},{-10,-40},
            {-10,40},{-30,40}}, color={191,0,0}));
    connect(TC2.port_a, H_NMOS.heatPort)
    annotation (Line(points={{0,-80},{-30,-80},{-30,0}}, color={191,0,0}));
    connect(TC3.port_b, FixedTemperature1.port)
                                              annotation (Line(points={{70,-30},{
            80,-30}},                   color={191,0,0}));
    connect(TC3.port_a, HeatCapacitor1.port)
                                           annotation (Line(points={{50,-30},{40,
            -30},{40,-60},{60,-60}}, color={191,0,0}));
    connect(Sin.p, H_NMOS.G) annotation (Line(
        points={{-70,10},{-54,10},{-54,5},{-40,5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(H_PMOS.G, Sin.p) annotation (Line(
        points={{-40,45},{-48,45},{-48,44},{-54,44},{-54,10},{-70,10}},
        color={0,0,255},
        smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,100},{-6,72}},
            textString="Heating MOS Inverter",
            lineColor={0,0,255})}),   Documentation(info="<html>
<p>The heating MOS inverter shows a heat flow always if a transistor is leading.</p>
<p>Simulate until T=5 s. Plot in separate windows:<br> Sin.p.v and Capacitor1.p.v<br>HeatCapacitor1.port.T and H_PMOS.heatPort.T and H_NMOS.heatPort.T<br>H_PMOS.heatPort.Q_flow and H_NMOS.heatPort.Q_flow</p>
</html>",
     revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),   experiment(StopTime=5));
  end HeatingMOSInverter;

  model HeatingNPN_OrGate "Heating NPN Or Gate"
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Capacitance CapVal=0 annotation(Evaluate=true);
    parameter Modelica_SIunits.Time tauVal=0 annotation(Evaluate=true);

    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor HeatCapacitor1(C=0.1)
    annotation (Placement(transformation(
          origin={76,-84},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor TC1(G=0.01)
    annotation (Placement(transformation(
          origin={90,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor TC2(G=0.01)
    annotation (Placement(transformation(
          origin={60,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Modelica_Electrical_Analog.Sources.RampVoltage V(V=6, duration=5)
      annotation (Placement(transformation(
          origin={90,38},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Sources.TrapezoidVoltage V1(
      V=6,
      startTime=55,
      rising=5,
      width=15,
      falling=5,
      period=50,
      nperiod=10) annotation (Placement(transformation(
          origin={-90,18},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Sources.TrapezoidVoltage V2(
      V=6,
      startTime=65,
      rising=5,
      width=15,
      falling=5,
      period=50,
      nperiod=10) annotation (Placement(transformation(
          origin={-50,-42},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Resistor R1(R=1800) annotation (
        Placement(transformation(extent={{-90,48},{-70,68}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R2(R=1800) annotation (
        Placement(transformation(extent={{-36,-22},{-16,-2}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor RI(R=40) annotation (Placement(
          transformation(extent={{60,58},{80,78}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Gnd annotation (Placement(
          transformation(extent={{80,0},{100,20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Gnd1 annotation (Placement(
          transformation(extent={{-100,-22},{-80,-2}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Gnd2 annotation (Placement(
          transformation(extent={{-60,-82},{-40,-62}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Gnd3 annotation (Placement(
          transformation(extent={{-10,16},{10,36}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Gnd4 annotation (Placement(
          transformation(extent={{30,-52},{50,-32}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Capacitor C1(C=CapVal) annotation (
        Placement(transformation(
          origin={-70,38},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Capacitor C2(C=CapVal) annotation (
        Placement(transformation(
          origin={60,42},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Capacitor C3(C=CapVal) annotation (
        Placement(transformation(
          origin={-16,-40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground Gnd5 annotation (Placement(
          transformation(extent={{-26,-76},{-6,-56}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Gnd6 annotation (Placement(
          transformation(extent={{50,6},{70,26}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Gnd7 annotation (Placement(
          transformation(extent={{-80,2},{-60,22}}, rotation=0)));
    Modelica_Electrical_Analog.Semiconductors.HeatingNPN T1(
      Bf=100,
      Br=1,
      Is=1.e-14,
      Vak=0,
      Tauf=tauVal,
      Taur=tauVal,
      Ccs=CapVal,
      Cje=CapVal,
      Cjc=CapVal,
      Phie=1,
      Me=0.5,
      Phic=1,
      Mc=0.5,
      Gbc=1.e-12,
      Gbe=1.e-12,
      EMax=40,
      vt_t(start=0.01, fixed=false),
      useHeatPort=true,
      ibe(start=0),
      vbc(start=0)) annotation (Placement(transformation(extent={{-20,48},{0,68}},
            rotation=0)));
    Modelica_Electrical_Analog.Semiconductors.HeatingNPN T2(
      Bf=100,
      Br=1,
      Is=1.e-14,
      Vak=0,
      Tauf=tauVal,
      Taur=tauVal,
      Ccs=CapVal,
      Cje=CapVal,
      Cjc=CapVal,
      Phie=1,
      Me=0.5,
      Phic=1,
      Mc=0.5,
      Gbc=1.e-12,
      Gbe=1.e-12,
      EMax=40,
      vt_t(start=0.01, fixed=false),
      useHeatPort=true,
      ibe(start=0),
      vbc(start=0)) annotation (Placement(transformation(extent={{20,-22},{40,-2}},
            rotation=0)));
  initial equation
    HeatCapacitor1.T= 293.15;

  equation
    connect(Gnd1.p, V1.n)
                        annotation (Line(points={{-90,-2},{-90,8}}, color={0,0,255}));
    connect(V1.p, R1.p)
                      annotation (Line(points={{-90,28},{-90,58}}, color={0,0,255}));
    connect(RI.n, V.p)
                     annotation (Line(points={{80,68},{90,68},{90,48}}, color={0,0,
            255}));
    connect(Gnd.p, V.n)
                      annotation (Line(points={{90,20},{90,28}}, color={0,0,255}));
    connect(V2.p, R2.p)
    annotation (Line(points={{-50,-32},{-50,-12},{-36,-12}}, color={0,0,255}));
    connect(Gnd2.p, V2.n)
                        annotation (Line(points={{-50,-62},{-50,-52}}, color={0,0,
            255}));
    connect(Gnd7.p, C1.n)
                        annotation (Line(points={{-70,22},{-70,28}}, color={0,0,255}));
    connect(C2.p, RI.p)
                      annotation (Line(points={{60,52},{60,68}}, color={0,0,255}));
    connect(Gnd6.p, C2.n)
                        annotation (Line(points={{60,26},{60,32}}, color={0,0,255}));
    connect(C3.p, R2.n)
    annotation (Line(points={{-16,-30},{-16,-21},{-16,-12}}, color={0,0,255}));
    connect(C1.p, R1.n)
                      annotation (Line(points={{-70,48},{-70,58}}, color={0,0,255}));
    connect(Gnd5.p, C3.n)
    annotation (Line(points={{-16,-56},{-16,-50}},           color={0,0,255}));
    connect(T1.B, R1.n)
    annotation (Line(points={{-20,58},{-70,58}}, color={0,0,255}));
    connect(T1.E, Gnd3.p)
    annotation (Line(points={{0,53},{0,48.75},{0,44.5},{0,36}},
                                             color={0,0,255}));
    connect(RI.p, T1.C)
                      annotation (Line(points={{60,68},{30,68},{30,63},{0,63}},
          color={0,0,255}));
    connect(T2.B, R2.n)
    annotation (Line(points={{20,-12},{-16,-12}}, color={0,0,255}));
    connect(T2.E, Gnd4.p)
    annotation (Line(points={{40,-17},{40,-32}}, color={0,0,255}));
    connect(T2.C, RI.p)
    annotation (Line(points={{40,-7},{40,68},{60,68}}, color={0,0,255}));
    connect(TC1.port_b, HeatCapacitor1.port)
                                           annotation (Line(points={{90,-60},{84,
            -60},{84,-74},{76,-74}}, color={191,0,0}));
    connect(TC2.port_b, HeatCapacitor1.port)
                                           annotation (Line(points={{60,-60},{68,
            -60},{68,-74},{76,-74}}, color={191,0,0}));
    connect(TC2.port_a, T2.heatPort)
    annotation (Line(points={{60,-40},{60,-22},{30,-22}}, color={191,0,0}));
    connect(TC1.port_a, T1.heatPort)
                                   annotation (Line(points={{90,-40},{90,2},{-10,
            2},{-10,48}}, color={191,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,100},{-6,72}},
            textString="Heating \"NPN or\" Gate",
            lineColor={0,0,255})}),    Documentation(info="<html>
<p>The heating &quot;NPN or&quot; gate shows a heat flow always if a transistor is leading.</p>
<p>Simulate until T=200 s. Plot in separate windows:
<br>V1.v and V2.v and C2.v
<br>HeatCapacitor1.port.T and T1.heatPort.T and T2.heatPort.T
<br>T1.heatPort.Q_flow and T2.heatPort.Q_flow</p>
</html>",
     revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),   experiment(StopTime=200));
  end HeatingNPN_OrGate;

  model HeatingResistor "Heating resistor"
    extends Modelica_Icons.Example;
    Modelica_Electrical_Analog.Basic.HeatingResistor heatingResistor(
      R_ref=100,
      alpha=1e-3,
      T_ref=293.15,
      i(start=0)) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=-90,
          origin={-32,34})));
    Modelica_Electrical_Analog.Basic.Ground G annotation (Placement(
          transformation(extent={{-80,0},{-60,20}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage1(V=220, freqHz=
         1) annotation (Placement(transformation(
          origin={-70,40},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Modelica_Thermal_HeatTransfer.Components.ThermalConductor thermalConductor(G=
          50)
    annotation (Placement(transformation(
          origin={4,34},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica_Thermal_HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=
         20) annotation (Placement(transformation(extent={{52,24},{32,44}})));
  equation
    connect(SineVoltage1.n, G.p)
    annotation (Line(points={{-70,30},{-70,20}}, color={0,0,255}));
    connect(heatingResistor.heatPort, thermalConductor.port_a)
                                                            annotation (Line(
          points={{-22,34},{-6,34}},                    color={191,0,0}));

    connect(SineVoltage1.p, heatingResistor.p) annotation (Line(
        points={{-70,50},{-32,50},{-32,44}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G.p, heatingResistor.n) annotation (Line(
        points={{-70,20},{-32,20},{-32,24}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(thermalConductor.port_b, fixedTemperature.port) annotation (Line(
        points={{14,34},{32,34}},
        color={191,0,0},
        smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-94,102},{0,74}},
            lineColor={0,0,255},
            textString="HeatingResistor")}),
                                  Documentation(info="<html>
<p>This is a very simple circuit consisting of a voltage source and a resistor. The loss power in the resistor is transported to the environment via its heatPort.</p>
</html>"),   experiment(StopTime=5));
  end HeatingResistor;

  model HeatingRectifier "Heating rectifier"
    extends Modelica_Icons.Example;
    Modelica_Electrical_Analog.Semiconductors.HeatingDiode HeatingDiode1(
        useHeatPort=true) annotation (Placement(transformation(extent={{-20,
              40},{0,60}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground G annotation (Placement(
          transformation(extent={{-80,0},{-60,20}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage1(V=1, freqHz=1)
      annotation (Placement(transformation(
          origin={-70,40},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Modelica_Electrical_Analog.Basic.Capacitor Capacitor1(C=1, v(start=0,
          fixed=true)) annotation (Placement(transformation(extent={{20,40},{
              40,60}}, rotation=0)));
    Modelica_Thermal_HeatTransfer.Components.HeatCapacitor HeatCapacitor1(C=1)
    annotation (Placement(transformation(
          origin={-20,-50},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica_Thermal_HeatTransfer.Components.ThermalConductor ThermalConductor1(G=10)
    annotation (Placement(transformation(
          origin={-20,-10},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Resistor R(R=1) annotation (Placement(
          transformation(extent={{20,70},{40,90}}, rotation=0)));
  initial equation
    HeatCapacitor1.T = 293.15;

  equation
    connect(SineVoltage1.p, HeatingDiode1.p)
    annotation (Line(points={{-70,50},{-20,50}}, color={0,0,255}));
    connect(SineVoltage1.n, G.p)
    annotation (Line(points={{-70,30},{-70,20}}, color={0,0,255}));
    connect(Capacitor1.n, G.p)
    annotation (Line(points={{40,50},{40,20},{-70,20}}, color={0,0,255}));
    connect(HeatingDiode1.n, Capacitor1.p)
    annotation (Line(points={{0,50},{20,50}}, color={0,0,255}));
    connect(HeatingDiode1.heatPort, ThermalConductor1.port_a)
                                                            annotation (Line(
          points={{-10,40},{-10,0},{-20,0}},            color={191,0,0}));
    connect(ThermalConductor1.port_b, HeatCapacitor1.port)
                                                         annotation (Line(points={{-20,-20},
            {-20,-25.75},{-20,-40}},
          color={191,0,0}));
    connect(R.p, Capacitor1.p)
    annotation (Line(points={{20,80},{20,50}}, color={0,0,255}));
    connect(R.n, Capacitor1.n)
    annotation (Line(points={{40,80},{40,50}}, color={0,0,255}));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-94,102},{0,74}},
            textString="HeatingRectifier",
            lineColor={0,0,255})}),
                                  Documentation(info="<html>
<p>The heating rectifier shows a heat flow always if the electrical capacitor is loaded.</p>
<p>Simulate until T=5 s.Plot in separate windows:
<br>SineVoltage1.v and Capacitor1.p.v
<br>HeatCapacitor1.port.T and HeatingDiode1.heatPort.T
<br>HeatingDiode1.heatPort.Q_flow
</p>
</html>",
     revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),   experiment(StopTime=5));
  end HeatingRectifier;

  encapsulated model NandGate "CMOS NAND Gate (see Tietze/Schenk, page 157)"
    import Modelica_Electrical_Analog.Basic;
    import Modelica_Electrical_Analog.Sources;
    import Modelica_Electrical_Analog_Examples.Utilities;
    import Icons = Modelica_Icons;
    import Modelica_Icons;
    extends Modelica_Icons.Example;

    Sources.TrapezoidVoltage VIN1(
      V=3.5,
      startTime=20e-9,
      rising=1e-9,
      width=19e-9,
      falling=1.e-9,
      period=40e-9,
      nperiod=-1)   annotation (Placement(transformation(
          origin={-70,20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Sources.TrapezoidVoltage VIN2(
      V=3.5,
      startTime=10e-9,
      rising=1e-9,
      width=19e-9,
      falling=1.e-9,
      period=40e-9,
      nperiod=-1)   annotation (Placement(transformation(
          origin={-70,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Sources.RampVoltage VDD(V=5, duration=1e-9) annotation (Placement(
          transformation(
          origin={50,70},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Basic.Ground Gnd1 annotation (Placement(transformation(extent={{45,43},{55,53}},
            rotation=0)));
    Basic.Ground Gnd4 annotation (Placement(transformation(extent={{-75,-5},{-65,
              5}}, rotation=0)));
    Basic.Ground Gnd5 annotation (Placement(transformation(extent={{-75,-55},{-65,
              -45}}, rotation=0)));
    Utilities.Nand Nand(C4(v(start=0, fixed=true)),C7(v(start=0, fixed=true))) annotation (Placement(transformation(extent={{-40,-45},{
              40,55}}, rotation=0)));
  equation
    connect(VDD.n, Gnd1.p) annotation (Line(points={{50,60},{50,53}}, color={0,0,255}));
    connect(VIN1.n, Gnd4.p) annotation (Line(points={{-70,10},{-70,5}}, color={0,0,255}));
    connect(VIN2.n, Gnd5.p) annotation (Line(points={{-70,-40},{-70,-45}}, color={0,0,255}));
    connect(Nand.Vdd, VDD.p) annotation (Line(points={{0,55},{0,90},{50,90},{50,
            80}}, color={0,0,255}));
    connect(VIN1.p, Nand.x1) annotation (Line(points={{-70,30},{-40,30}}, color={0,
            0,255}));
    connect(VIN2.p, Nand.x2) annotation (Line(points={{-70,-20},{-40,-20}}, color=
            {0,0,255}));
    annotation (Documentation(info="<html>
<p>The nand gate is a basic CMOS building block. It consists of four CMOS transistors. The output voltage Nand.y.v is low if and only if the two input voltages at Nand.x1.v and Nand.x2.v are both high. In this way the nand functionality is realized.</p>
<p>The simulation end time should be set to 1e-7. Please plot the input voltages Nand.x1.v, d Nand.x2.v, and the output voltage Nand.y.v.</p>
<p><b>Reference:</b></p>
<p>Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 157</p>
</html>",
     revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
</dl>
</html>"),
      experiment(StopTime=1e-007),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Text(
            extent={{-90,98},{-12,66}},
            lineColor={0,0,255},
            textString="NAND Gate")}));
  end NandGate;

  model OvervoltageProtection "Example for Zener diodes"
    extends Modelica_Icons.Example;

   Modelica_Electrical_Analog.Sources.SineVoltage sineVoltage(
      offset=0,
      V=10,
      freqHz=5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-66,6})));
   Modelica_Electrical_Analog.Basic.Resistor Rv(R=20)
      annotation (Placement(transformation(extent={{-56,32},{-36,52}})));
   Modelica_Electrical_Analog.Basic.Resistor RL(R=2000) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={26,4})));
   Modelica_Electrical_Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-30,-82},{-10,-62}})));
   Modelica_Electrical_Analog.Basic.Capacitor CL(C=1e-7, v(start=0, fixed=
            true)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={62,4})));
    Modelica_Electrical_Analog.Semiconductors.ZDiode zDiode annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-20,-20})));
    Modelica_Electrical_Analog.Semiconductors.ZDiode zDiode1(v(start=0))
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-20,22})));
  equation
   connect(sineVoltage.p, Rv.p) annotation (Line(
       points={{-66,16},{-66,42},{-56,42}},
       color={0,0,255},
       smooth=Smooth.None));
   connect(RL.p, CL.p) annotation (Line(
       points={{26,14},{62,14}},
       color={0,0,255},
       smooth=Smooth.None));
   connect(RL.n, CL.n) annotation (Line(
       points={{26,-6},{62,-6}},
       color={0,0,255},
       smooth=Smooth.None));
    connect(sineVoltage.n, zDiode.p) annotation (Line(
        points={{-66,-4},{-66,-30},{-20,-30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(zDiode.p, ground.p) annotation (Line(
        points={{-20,-30},{-20,-62}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(zDiode.p, RL.n) annotation (Line(
        points={{-20,-30},{26,-30},{26,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(zDiode1.p, Rv.n) annotation (Line(
        points={{-20,32},{-20,42},{-36,42}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(RL.p, Rv.n) annotation (Line(
        points={{26,14},{26,42},{-36,42}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(zDiode1.n, zDiode.n) annotation (Line(
        points={{-20,12},{-20,1},{-20,1},{-20,-10}},
        color={0,0,255},
        smooth=Smooth.None));
   annotation (   experiment(StopTime=0.4),
     Documentation(info="<html>
<p>This example is a simple circuit for overvoltage protection. If the voltage zDiode_1.n.v is too high, the Diode zDiode_2 breaks through and the voltage gets down.</p>
<p>The simulation end time should be set to 0.4. To get the typical behaviour please plot sineVoltage.p.v, RL.p.v, zDiode_2.n.v and zDiode_1.n.i.</p>
</html>",  revisions="<html>
<ul>
<li><i>February 02, 2009</i>
       by Kristin Majetta<br>
       documentation added</li>
<li><i> January 08, 2009   </i>
        by Matthias Franke <br>initially implemented
       </li>
</ul>
</html>"));
  end OvervoltageProtection;

  model Rectifier "B6 diode bridge"
    extends Modelica_Icons.Example;
    import Modelica_Electrical_Analog.Ideal;
    parameter Modelica_SIunits.Voltage VAC=400 "RMS line-to-line";
    parameter Modelica_SIunits.Frequency f=50 "line frequency";
    parameter Modelica_SIunits.Inductance LAC=60E-6 "line inductor";
    parameter Modelica_SIunits.Resistance Ron=1E-3 "diode forward resistance";
    parameter Modelica_SIunits.Conductance Goff=1E-3
      "diode backward conductance";
    parameter Modelica_SIunits.Voltage Vknee=2 "diode threshold voltage";
    parameter Modelica_SIunits.Capacitance CDC=15E-3 "DC capacitance";
    parameter Modelica_SIunits.Current IDC=500 "load current";
    output Modelica_SIunits.Voltage uDC;
    output Modelica_SIunits.Current iAC[3];
    output Modelica_SIunits.Voltage uAC[3];
    output Modelica_SIunits.Power Losses;

    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage1(freqHz=f, V=
          VAC*sqrt(2/3)) annotation (Placement(transformation(extent={{-70,10},
              {-90,30}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage2(
      freqHz=f,
      phase=-2/3*Modelica_Constants.pi,
      V=VAC*sqrt(2/3)) annotation (Placement(transformation(extent={{-70,-10},
              {-90,10}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage3(
      freqHz=f,
      phase=-4/3*Modelica_Constants.pi,
      V=VAC*sqrt(2/3)) annotation (Placement(transformation(extent={{-70,-30},
              {-90,-10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Inductor Inductor1(L=LAC) annotation (
        Placement(transformation(extent={{-60,10},{-40,30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Inductor Inductor2(L=LAC, i(start=0,
          fixed=true)) annotation (Placement(transformation(extent={{-60,-10},
              {-40,10}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Inductor Inductor3(L=LAC, i(start=0,
          fixed=true)) annotation (Placement(transformation(extent={{-60,-30},
              {-40,-10}}, rotation=0)));
    Ideal.IdealDiode IdealDiode1(
      Ron=Ron,
      Goff=Goff,
      Vknee=Vknee)
      annotation (Placement(transformation(
          origin={-20,40},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Ideal.IdealDiode IdealDiode2(
      Ron=Ron,
      Goff=Goff,
      Vknee=Vknee)
      annotation (Placement(transformation(
          origin={0,40},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Ideal.IdealDiode IdealDiode3(
      Ron=Ron,
      Goff=Goff,
      Vknee=Vknee)
      annotation (Placement(transformation(
          origin={20,40},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Ideal.IdealDiode IdealDiode4(
      Ron=Ron,
      Goff=Goff,
      Vknee=Vknee)
      annotation (Placement(transformation(
          origin={-20,-40},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Ideal.IdealDiode IdealDiode5(
      Ron=Ron,
      Goff=Goff,
      Vknee=Vknee)
      annotation (Placement(transformation(
          origin={0,-40},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Ideal.IdealDiode IdealDiode6(
      Ron=Ron,
      Goff=Goff,
      Vknee=Vknee)
      annotation (Placement(transformation(
          origin={20,-40},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Electrical_Analog.Basic.Capacitor Capacitor1(C=2*CDC)
      annotation (Placement(transformation(
          origin={40,40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Capacitor Capacitor2(C=2*CDC)
      annotation (Placement(transformation(
          origin={40,-40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
          transformation(extent={{40,-80},{60,-60}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SignalCurrent SignalCurrent1
      annotation (Placement(transformation(
          origin={60,0},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Blocks.Sources.Constant Constant1(k=IDC)
    annotation (Placement(transformation(extent={{100,-10},{80,10}}, rotation=0)));
  initial equation
    Capacitor1.v = VAC*sqrt(2)/2;
    Capacitor2.v = VAC*sqrt(2)/2;
  equation
    uDC = Capacitor1.v + Capacitor2.v;
    iAC = {Inductor1.i,Inductor2.i,Inductor3.i};
    uAC[1] = Inductor1.n.v - Inductor2.n.v;
    uAC[2] = Inductor2.n.v - Inductor3.n.v;
    uAC[3] = Inductor3.n.v - Inductor1.n.v;
    Losses = IdealDiode1.v*IdealDiode1.i + IdealDiode2.v*IdealDiode2.i +
      IdealDiode3.v*IdealDiode3.i + IdealDiode4.v*IdealDiode4.i +
      IdealDiode5.v*IdealDiode5.i + IdealDiode6.v*IdealDiode6.i;
    connect(SineVoltage1.n, SineVoltage2.n)
      annotation (Line(points={{-90,20},{-90,0}}, color={0,0,255}));
    connect(SineVoltage2.n, SineVoltage3.n)
      annotation (Line(points={{-90,0},{-90,-20}}, color={0,0,255}));
    connect(SineVoltage1.p, Inductor1.p)
      annotation (Line(points={{-70,20},{-60,20}}, color={0,0,255}));
    connect(SineVoltage2.p, Inductor2.p)
      annotation (Line(points={{-70,0},{-67.5,0},{-65,0},{-60,0}},
                                                 color={0,0,255}));
    connect(SineVoltage3.p, Inductor3.p)
      annotation (Line(points={{-70,-20},{-60,-20}}, color={0,0,255}));
    connect(IdealDiode1.p, IdealDiode4.n)
      annotation (Line(points={{-20,30},{-20,-30}}, color={0,0,255}));
    connect(IdealDiode2.p, IdealDiode5.n)
      annotation (Line(points={{0,30},{0,16},{0,0},{0,-30}},
                                 color={0,0,255}));
    connect(IdealDiode3.p, IdealDiode6.n)
      annotation (Line(points={{20,30},{20,-30}}, color={0,0,255}));
    connect(IdealDiode1.n, IdealDiode2.n)
      annotation (Line(points={{-20,50},{0,50}},            color={0,0,255}));
    connect(IdealDiode2.n, IdealDiode3.n)
      annotation (Line(points={{0,50},{20,50}},            color={0,0,255}));
    connect(IdealDiode4.p, IdealDiode5.p)
      annotation (Line(points={{-20,-50},{0,-50}},             color={0,0,255}));
    connect(IdealDiode5.p, IdealDiode6.p)
      annotation (Line(points={{0,-50},{20,-50}},             color={0,0,255}));
    connect(Capacitor2.n, IdealDiode6.p)
      annotation (Line(points={{40,-50},{20,-50}}, color={0,0,255}));
    connect(IdealDiode3.n, Capacitor1.p)
      annotation (Line(points={{20,50},{40,50}}, color={0,0,255}));
    connect(Capacitor1.n, Capacitor2.p)
      annotation (Line(points={{40,30},{40,-30}}, color={0,0,255}));
    connect(Capacitor2.p, Ground1.p)
      annotation (Line(points={{40,-30},{40,0},{50,0},{50,-60}}, color={0,0,255}));
    connect(Capacitor1.p, SignalCurrent1.p)
      annotation (Line(points={{40,50},{60,50},{60,10}}, color={0,0,255}));
    connect(SignalCurrent1.n, Capacitor2.n)
      annotation (Line(points={{60,-10},{60,-50},{40,-50}}, color={0,0,255}));
    connect(Constant1.y, SignalCurrent1.i)
      annotation (Line(points={{79,0},{79,0},{67,0}},                       color=
           {0,0,255}));
    connect(Inductor1.n, IdealDiode1.p)
      annotation (Line(points={{-40,20},{-20,20},{-20,30}}, color={0,0,255}));
    connect(Inductor2.n, IdealDiode2.p)
      annotation (Line(points={{-40,0},{0,0},{0,30}},
          color={0,0,255}));
    connect(Inductor3.n, IdealDiode3.p)
      annotation (Line(points={{-40,-20},{20,-20},{20,30}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Text(
            extent={{-80,90},{80,70}},
            lineColor={0,0,0},
            textString="Rectifier"),
          Line(points={{-16,18},{-16,2},{-18,6},{-14,6},{-16,2}}, color={0,0,0}),
          Line(points={{-30,22},{-26,20},{-30,18},{-30,22}}, color={0,0,0}),
          Line(points={{32,30},{32,-30},{30,-26},{34,-26},{32,-30}}, color={0,0,0}),
          Text(
            extent={{-38,16},{-22,8}},
            lineColor={0,0,0},
            textString="iAC"),
          Text(
            extent={{-14,8},{2,0}},
            lineColor={0,0,0},
            textString="uAC"),
          Text(
            extent={{22,-16},{38,-24}},
            lineColor={0,0,0},
            textString="uDC")}),
    experiment(StopTime=0.1, Interval=1e-005),
    Documentation(info="<html>
<p>The rectifier example shows a B6 diode bridge fed by a three phase sinusoidal voltage, loaded by a DC current.
DC capacitors start at ideal no-load voltage, thus making easier initial transient.</p>
<p>Simulate until T=0.1 s. Plot in separate windows:
<br>uDC ... DC-voltage
<br>iAC ... AC-currents 1..3
<br>uAC ... AC-voltages 1..3 (distorted)
<br>Try different load currents iDC = 0..approximately 500 A. You may watch losses (of the whole diode bridge) trying different diode parameters.</p>
</html>",
     revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Anton Haumer<br> realized<br>
       </li>
</ul>
</html>"));
  end Rectifier;

  model ShowSaturatingInductor
    "Simple demo to show behaviour of SaturatingInductor component"
    extends Modelica_Icons.Example;
    parameter Modelica_SIunits.Inductance Lzer=2 "Inductance near current=0";
    parameter Modelica_SIunits.Inductance Lnom=1
      "Nominal inductance at Nominal current";
    parameter Modelica_SIunits.Current Inom=1 "Nominal current";
    parameter Modelica_SIunits.Inductance Linf=0.5
      "Inductance at large currents";
    parameter Modelica_SIunits.Voltage U=1.25 "Source voltage (peak)";
    parameter Modelica_SIunits.Frequency f=1/(2*Modelica_Constants.pi)
      "Source frequency";
    parameter Modelica_SIunits.Angle phase=Modelica_Constants.pi/2
      "Source voltage phase shift";
    //output Modelica.SIunits.Voltage v "Voltage drop over saturating inductor";
    //output Modelica.SIunits.Current i "Current across saturating inductor";
    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage1(
      V=U,
      phase=phase,
      freqHz=f) annotation (Placement(transformation(
          origin={-60,-6},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
          transformation(extent={{-70,-36},{-50,-16}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.SaturatingInductor SaturatingInductance1(
      Lzer=Lzer,
      Lnom=Lnom,
      Inom=Inom,
      Linf=Linf,
      i(start=0)) annotation (Placement(transformation(
          origin={-20,0},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Inductor Inductance1(L=Lnom, i(start=0,
          fixed=true)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={20,0})));
  equation
    //v=SaturatingInductance1.v;
    //i=SaturatingInductance1.i;
    connect(SineVoltage1.n, Ground1.p) annotation (Line(points={{-60,-16},{-60,
            -16}}, color={0,0,255}));
    connect(SineVoltage1.n, SaturatingInductance1.n) annotation (Line(points={{-60,-16},
            {-20,-16},{-20,-10}},       color={0,0,255}));
    connect(SaturatingInductance1.p, SineVoltage1.p) annotation (Line(points={{-20,10},
            {-20,20},{-60,20},{-60,4}},     color={0,0,255}));
    connect(Inductance1.p, SineVoltage1.p) annotation (Line(
        points={{20,10},{20,20},{-60,20},{-60,4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Inductance1.n, SineVoltage1.n) annotation (Line(
        points={{20,-10},{20,-16},{-60,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={Text(
            extent={{-80,84},{70,38}},
            lineColor={0,0,255},
            textString="Show Saturating Inductor")}),
      experiment(StopTime=6.2832, Interval=0.01),
      Documentation(info="<html>
<p>This simple circuit uses the saturating inductor which has a changing inductivity.</p>
<p>This circuit should be simulated until 1 s. Compare <code>SaturatingInductance1.p.i</code> with <code>Inductance1.p.i</code> to see the difference between saturating and ideal inductor.</p>
</html>"));
  end ShowSaturatingInductor;

  model ShowVariableResistor "Simple demo of a VariableResistor model"
     extends Modelica_Icons.Example;

    Modelica_Electrical_Analog.Basic.VariableResistor VariableResistor
      annotation (Placement(transformation(extent={{-20,-20},{0,0}}, rotation=
             0)));
    Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
          transformation(extent={{-100,-80},{-80,-60}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground Ground2 annotation (Placement(
          transformation(extent={{60,-40},{80,-20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R1(R=1) annotation (Placement(
          transformation(extent={{-60,40},{-40,60}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R2(R=1) annotation (Placement(
          transformation(extent={{-20,40},{0,60}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R3(R=1) annotation (Placement(
          transformation(extent={{20,40},{40,60}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R4(R=1) annotation (Placement(
          transformation(extent={{-60,-20},{-40,0}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor R5(R=1) annotation (Placement(
          transformation(extent={{20,-20},{40,0}}, rotation=0)));

    Modelica_Electrical_Analog.Sources.SineVoltage SineVoltage1(V=1, freqHz=1)
      annotation (Placement(transformation(
          origin={-90,-30},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica_Blocks.Sources.Ramp Ramp1(height=5, offset=2,
      duration=2)
    annotation (Placement(transformation(
          origin={-10,20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation
    connect(R1.n, R2.p)             annotation (Line(points={{-40,50},{-20,50}},
          color={0,0,255}));
    connect(R2.n, R3.p)             annotation (Line(points={{0,50},{20,50}},
          color={0,0,255}));
    connect(R4.n, VariableResistor.p)       annotation (Line(points={{-40,-10},{
            -20,-10}}, color={0,0,255}));
    connect(VariableResistor.n, R5.p)       annotation (Line(points={{0,-10},{20,
            -10}}, color={0,0,255}));
    connect(R3.n, Ground2.p)      annotation (Line(points={{40,50},{70,50},{70,
            -20}}, color={0,0,255}));
    connect(Ground2.p, R5.n)      annotation (Line(points={{70,-20},{70,-10},{40,
            -10}}, color={0,0,255}));
    connect(SineVoltage1.p, Ground1.p)
                                     annotation (Line(points={{-90,-40},{-90,-60}},
          color={0,0,255}));
    connect(SineVoltage1.n, R1.p)      annotation (Line(points={{-90,-20},{-90,50},
            {-60,50}}, color={0,0,255}));
    connect(SineVoltage1.n, R4.p)      annotation (Line(points={{-90,-20},{-90,
            -10},{-60,-10}}, color={0,0,255}));
    connect(Ramp1.y, VariableResistor.R)           annotation (Line(points={{-10,9},
            {-10,4.5},{-10,1}},            color={0,0,255}));
  annotation (Documentation(info="<html>
<p>It is a simple test circuit for the VariableResistor. The VariableResistor should be compared with R2.</p>
<p>Simulate until T=1 s.</p>
</html>",
     revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Teresa Schlegel<br> realized<br>
       </li>
</ul>
</html>"),
    experiment(StopTime=1),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Text(
            extent={{-100,112},{80,40}},
            lineColor={0,0,255},
            textString="Example VariableResistor")}));
  end ShowVariableResistor;

  model SwitchWithArc "Comparison of switch models both with and without arc"

    extends Modelica_Icons.Example;
    Modelica_Blocks.Sources.BooleanPulse booleanPulse(period=1)
      annotation (Placement(transformation(extent={{-80,-30},{-60,-10}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground ground1 annotation (Placement(
          transformation(extent={{20,-20},{40,0}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage1(V=50)
      annotation (Placement(transformation(
          origin={-20,20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Inductor inductor1(L=0.1, i(start=0,
          fixed=true)) annotation (Placement(transformation(extent={{40,30},{
              60,50}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor resistor1(R=1) annotation (
        Placement(transformation(
          origin={80,20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Ideal.IdealClosingSwitch switch1 annotation (
        Placement(transformation(extent={{0,30},{20,50}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Ground ground2 annotation (Placement(
          transformation(extent={{20,-100},{40,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage2(V=50)
      annotation (Placement(transformation(
          origin={-20,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Inductor inductor2(L=0.1, i(start=0,
          fixed=true)) annotation (Placement(transformation(extent={{40,-50},
              {60,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor resistor2(R=1) annotation (
        Placement(transformation(
          origin={80,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Ideal.CloserWithArc switch2(
      dVdt=10000,
      V0=30,
      Vmax=60) annotation (Placement(transformation(extent={{0,-50},{20,-30}},
            rotation=0)));

  equation
    connect(inductor1.n,resistor1. p) annotation (Line(points={{60,40},{80,40},
            {80,30}}, color={0,0,255}));
    connect(resistor1.n,ground1. p)
      annotation (Line(points={{80,10},{80,0},{30,0}}, color={0,0,255}));
    connect(constantVoltage1.n,ground1. p)
      annotation (Line(points={{-20,10},{-20,0},{30,0}}, color={0,0,255}));
    connect(switch1.n,inductor1. p)
      annotation (Line(points={{20,40},{40,40}}, color={0,0,255}));
    connect(constantVoltage1.p,switch1. p) annotation (Line(points={{-20,30},{-20,
            40},{0,40}},     color={0,0,255}));
    connect(inductor2.n,resistor2. p) annotation (Line(points={{60,-40},{80,-40},
            {80,-50}}, color={0,0,255}));
    connect(resistor2.n,ground2. p)
      annotation (Line(points={{80,-70},{80,-80},{30,-80}}, color={0,0,255}));
    connect(constantVoltage2.n,ground2. p)
      annotation (Line(points={{-20,-70},{-20,-80},{30,-80}}, color={0,0,255}));
    connect(switch2.n,inductor2. p)
      annotation (Line(points={{20,-40},{40,-40}}, color={0,0,255}));
    connect(constantVoltage2.p,switch2. p) annotation (Line(points={{-20,-50},{
            -20,-40},{0,-40}}, color={0,0,255}));
    connect(booleanPulse.y, switch1.control)  annotation (Line(points={{-59,-20},
            {-40,-20},{-40,60},{10,60},{10,47}}, color={255,0,255}));
    connect(booleanPulse.y, switch2.control)  annotation (Line(points={{-59,-20},
            {10,-20},{10,-30}}, color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,80},{100,60}},
            lineColor={0,0,255},
            textString="Compare voltage and current of inductor1 and inductor2")}),
      experiment(
        StopTime=2,
        Interval=0.00025,
        Tolerance=1e-006),
      Documentation(info="<html>
<p align=\"justify\">This example is to compare the behaviour of switch models with and without an electric arc taking into consideration.</p>
<ul>
<li>Simulate until T=2 s. </li>
<li>Plot in one window:  <code>switch1.i</code> and <code>switch2.i</code> </li>
</ul>
<p>The difference in the closing area shows that the simple arc model avoids the suddenly switching.</p>
</html>", revisions="<html>
<ul>
<li><i>May, 2009   </i>
       by Anton Haumer<br> initially realized<br>
       </li>
</ul>
</html>"));
  end SwitchWithArc;

  model ThyristorBehaviourTest "Thyristor demonstration example"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{18,-40},{38,-20}})));
    Modelica_Electrical_Analog.Sources.SineVoltage sineVoltage(V=30, freqHz=
          10000) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-72,4})));
    Modelica_Electrical_Analog.Basic.Resistor resistor(R=10) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={8,20})));
    Modelica_Electrical_Analog.Sources.PulseCurrent pulseCurrent(
      width=10,
      period=0.0001,
      startTime=0.00002,
      I=0.005) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-8,70})));
    Modelica_Electrical_Analog.Semiconductors.Thyristor thyristor_v4_1(
      vControl(fixed=true),
      vAK(start=0),
      vGK(start=0))
      annotation (Placement(transformation(extent={{-44,30},{-24,50}})));
    Modelica_Electrical_Analog.Basic.Inductor inductor(L=2e-6, i(start=0,
          fixed=true)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={8,-4})));
  equation
    connect(sineVoltage.n, ground.p) annotation (Line(
        points={{-72,-6},{-72,-20},{28,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sineVoltage.p, thyristor_v4_1.Anode) annotation (Line(
        points={{-72,14},{-72,40},{-43,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor.p, thyristor_v4_1.Cathode) annotation (Line(
        points={{8,30},{8,40},{-25,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pulseCurrent.n, thyristor_v4_1.Gate) annotation (Line(
        points={{-18,70},{-26,70},{-26,49},{-27,49}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor.p, pulseCurrent.p) annotation (Line(
        points={{8,30},{8,70},{2,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor.n, inductor.p) annotation (Line(
        points={{8,10},{8,8},{8,6},{8,6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(inductor.n, ground.p) annotation (Line(
        points={{8,-14},{8,-20},{28,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (    experiment(StopTime=0.0002),
      Documentation(info="<html>
<p>This is a simple test circuit, to test the behavior of the thyristor model.</p><p>Interesting values to plot are Cathode.v, Gate.v and sineVoltage.p.v. and in another plot window pulseCurrent.p.i</p><p>The simulation time should be from 0 seconds to 2e-4 seconds.</p>
</html>"));
  end ThyristorBehaviourTest;

  model AmplifierWithOpAmpDetailed
    "Simple Amplifier circuit which uses OpAmpDetailed"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Analog.Basic.OpAmpDetailed opAmp
      annotation (Placement(transformation(extent={{-26,-4},{2,24}})));
    Modelica_Electrical_Analog.Basic.Resistor resistor(R=10000)
      annotation (Placement(transformation(extent={{-74,8},{-56,26}})));
    Modelica_Electrical_Analog.Basic.Resistor resistor1(R=20000)
      annotation (Placement(transformation(extent={{-22,46},{-4,64}})));
    Modelica_Electrical_Analog.Basic.Resistor resistor2(R=10000) annotation (
        Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=270,
          origin={21,-23})));
    Modelica_Electrical_Analog.Sources.SineVoltage sineVoltage(V=12, freqHz=
          1000) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-80,-30})));
    Modelica_Electrical_Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
    Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage(V=15)
      annotation (Placement(transformation(extent={{48,10},{68,30}})));
    Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage1(V=-15)
      annotation (Placement(transformation(extent={{48,-10},{68,10}})));
  initial equation
    resistor2.i = 0;
    opAmp.q_fp1 = 0;
    opAmp.q_fr1 = 0;
    opAmp.q_fr2 = 0;
    opAmp.q_fr3 = 0;

  equation
    connect(resistor.n, opAmp.m)       annotation (Line(
        points={{-56,17},{-34,17},{-34,17.07},{-26.07,17.07}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor1.n, resistor2.p) annotation (Line(
        points={{-4,55},{21,55},{21,-14}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor.p, sineVoltage.p) annotation (Line(
        points={{-74,17},{-80,17},{-80,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor1.p, opAmp.m)       annotation (Line(
        points={{-22,55},{-26.07,55},{-26.07,17.07}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sineVoltage.n, ground.p) annotation (Line(
        points={{-80,-40},{-10,-40},{-10,-50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(opAmp.p, ground.p)       annotation (Line(
        points={{-26.07,2.93},{-26.07,-20},{-10,-20},{-10,-50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor2.n, ground.p) annotation (Line(
        points={{21,-32},{21,-40},{-10,-40},{-10,-50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(opAmp.p_supply, constantVoltage.p)       annotation (Line(
        points={{-11.93,20.29},{18.035,20.29},{18.035,20},{48,20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(opAmp.m_supply, constantVoltage1.p)       annotation (Line(
        points={{-12,-0.36},{18,-0.36},{18,0},{48,0}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(constantVoltage.n, constantVoltage1.n) annotation (Line(
        points={{68,20},{80,20},{80,0},{68,0}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(constantVoltage1.n, ground.p) annotation (Line(
        points={{68,0},{80,0},{80,-40},{-10,-40},{-10,-50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(opAmp.outp, resistor2.p)       annotation (Line(
        points={{2,10},{21,10},{21,-14}},
        color={0,0,255},
        smooth=Smooth.None));

    annotation (
      experiment(
        StopTime=0.003,
        Interval=1.2e-6,
        Tolerance=2e-007),
      Documentation(revisions="<html>
<dl>
<dt>June 17, 2009</dt>
<dd>by Susann Wolf realized</dd>
</dl>
</html>",   info="<html>
<p>With the test circuit AmplifierWithOpAmpDetailed a time domain analysis of the example arrangement with a sinusoidal input voltage (12 V amplitude, frequency 1 kHz) using the operational amplifier model OpAmpDetailed is carried out. The working voltages are 15 V and -15 V.</p>
</html>"));
  end AmplifierWithOpAmpDetailed;

  model CompareTransformers
    "Transformer circuit to show the magnetization facilities"

    extends Modelica_Icons.Example;
    constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
    parameter Modelica_SIunits.Voltage Vdc=0.1 "DC offset of voltage source";
    parameter Modelica_SIunits.Voltage Vpeak=0.1
      "Peak voltage of voltage source";
    parameter Modelica_SIunits.Frequency f=10 "Frequency of voltage source";
    parameter Modelica_SIunits.Angle phi0=pi/2 "Phase of voltage source";
    parameter Real n=2 "Turns ratio primary:secondary voltage";
    parameter Modelica_SIunits.Resistance R1=0.01
      "Primary resistance w.r.t. primary side";
    parameter Modelica_SIunits.Inductance L1sigma=0.05/(2*pi*f)
      "Primary leakage inductance w.r.t. primary side";
    parameter Modelica_SIunits.Inductance Lm1= 10./(2*pi*f)
      "Magnetizing inductance w.r.t. primary side";
    parameter Modelica_SIunits.Inductance L2sigma=0.05/(2*pi*f)/n^2
      "Secondary leakage inductance w.r.t. secondary side";
    parameter Modelica_SIunits.Resistance R2=0.01/n^2
      "Secondary resistance w.r.t. secondary side";
    parameter Modelica_SIunits.Resistance RL=1/n^2 "Load resistance";
    final parameter Modelica_SIunits.Inductance L1=L1sigma + M*n
      "Primary no-load inductance";
    final parameter Modelica_SIunits.Inductance L2=L2sigma + M/n
      "Secondary no-load inductance";
    final parameter Modelica_SIunits.Inductance M=Lm1/n "Mutual inductance";
    output Modelica_SIunits.Voltage v1B = resistor11.n.v
      "Primary voltage, basic transformer";
    output Modelica_SIunits.Current i1B = resistor11.i
      "Primary current, basic transformer";
    output Modelica_SIunits.Voltage v2B = resistor12.p.v
      "Secondary voltage, basic transformer";
    output Modelica_SIunits.Current i2B = resistor12.i
      "Secondary current, basic transformer";
    output Modelica_SIunits.Voltage v1I = resistor21.n.v
      "Primary voltage, basic transformer";
    output Modelica_SIunits.Current i1I = resistor21.i
      "Primary current, basic transformer";
    output Modelica_SIunits.Voltage v2I = resistor22.p.v
      "Secondary voltage, basic transformer";
    output Modelica_SIunits.Current i2I = resistor22.i
      "Secondary current, basic transformer";
    Modelica_Electrical_Analog.Sources.SineVoltage sineVoltage1(
      V=Vpeak,
      phase=phi0,
      freqHz=f,
      offset=Vdc) annotation (Placement(transformation(
          origin={-80,40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground ground11 annotation (Placement(
          transformation(extent={{-90,0},{-70,20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor resistor11(R=R1) annotation (
        Placement(transformation(extent={{-80,50},{-60,70}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor resistor12(R=R2) annotation (
        Placement(transformation(extent={{60,50},{80,70}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor load1(R=RL) annotation (
        Placement(transformation(
          origin={80,40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground ground12 annotation (Placement(
          transformation(extent={{70,0},{90,20}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage sineVoltage2(
      V=Vpeak,
      phase=phi0,
      freqHz=f,
      offset=Vdc) annotation (Placement(transformation(
          origin={-80,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground ground21 annotation (Placement(
          transformation(extent={{-90,-90},{-70,-70}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor resistor21(R=R1) annotation (
        Placement(transformation(extent={{-80,-40},{-60,-20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Inductor inductor21(L=L1sigma)
      annotation (Placement(transformation(extent={{-50,-40},{-30,-20}},
            rotation=0)));
    Modelica_Electrical_Analog.Basic.Inductor inductor22(L=L2sigma, i(start=0,
          fixed=true)) annotation (Placement(transformation(extent={{30,-40},
              {50,-20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor resistor22(R=R2) annotation (
        Placement(transformation(extent={{60,-40},{80,-20}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor load2(R=RL) annotation (
        Placement(transformation(
          origin={80,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Ground ground22 annotation (Placement(
          transformation(extent={{70,-90},{90,-70}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Transformer basicTransformer(
      L1=L1,
      L2=L2,
      M=M) annotation (Placement(transformation(extent={{-10,40},{10,60}},
            rotation=0)));
    Modelica_Electrical_Analog.Ideal.IdealTransformer idealTransformer(
      n=n,
      Lm1=Lm1,
      considerMagnetization=false) annotation (Placement(transformation(
            extent={{-10,-50},{10,-30}}, rotation=0)));

  initial equation
   basicTransformer.i1=0;
   basicTransformer.i2=0;
  equation

    connect(sineVoltage1.n, ground11.p)
      annotation (Line(points={{-80,30},{-80,20}}, color={0,0,255}));
    connect(sineVoltage1.p, resistor11.p)
      annotation (Line(points={{-80,50},{-80,60}}, color={0,0,255}));
    connect(load1.n, ground12.p)
      annotation (Line(points={{80,30},{80,20}}, color={0,0,255}));
    connect(resistor12.n, load1.p)
      annotation (Line(points={{80,60},{80,50}}, color={0,0,255}));
    connect(sineVoltage2.n, ground21.p)
      annotation (Line(points={{-80,-60},{-80,-70}}, color={0,0,255}));
    connect(sineVoltage2.p, resistor21.p)
      annotation (Line(points={{-80,-40},{-80,-30}}, color={0,0,255}));
    connect(resistor21.n, inductor21.p)
      annotation (Line(points={{-60,-30},{-50,-30}}, color={0,0,255}));
    connect(inductor22.n, resistor22.p)
      annotation (Line(points={{50,-30},{60,-30}}, color={0,0,255}));
    connect(load2.n, ground22.p)
      annotation (Line(points={{80,-60},{80,-70}}, color={0,0,255}));
    connect(resistor22.n, load2.p)
      annotation (Line(points={{80,-30},{80,-40}}, color={0,0,255}));
    connect(ground11.p, basicTransformer.n1) annotation (Line(points={{-80,20},
            {-10,20},{-10,45}}, color={0,0,255}));
    connect(basicTransformer.n2, ground12.p) annotation (Line(points={{10,45},{10,
            20},{80,20}},    color={0,0,255}));
    connect(basicTransformer.p1, resistor11.n) annotation (Line(points={{-10,55},
            {-10,60},{-60,60}}, color={0,0,255}));
    connect(basicTransformer.p2, resistor12.p) annotation (Line(points={{10,55},{
            10,60},{60,60}},  color={0,0,255}));
    connect(ground21.p, idealTransformer.n1) annotation (Line(points={{-80,-70},
            {-10,-70},{-10,-45}}, color={0,0,255}));
    connect(ground22.p, idealTransformer.n2) annotation (Line(points={{80,-70},{
            10,-70},{10,-45}},  color={0,0,255}));
    connect(idealTransformer.p1, inductor21.n) annotation (Line(points={{-10,
            -35},{-10,-30},{-30,-30}}, color={0,0,255}));
    connect(idealTransformer.p2, inductor22.p) annotation (Line(points={{10,-35},
            {10,-30},{30,-30}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-60,-80},{60,-100}},
            lineColor={0,0,255},
            textString="try considerMagnetization=false/true"), Text(
            extent={{-60,20},{60,0}},
            lineColor={0,0,255},
            textString="Basic.Transformer (mutual inductance)")}),
      experiment(StopTime=50, Interval=0.001),
      Documentation(revisions="<html>
<dl>
<dt><i>2009</i></dt>
<dd>by Anton Haumer<br> initially implemented</dd>
</dl>
</html>", info="<html>
<p>This example is to demonstrate the behaviour of transformer models. The Basic.Transformer, which consists of mutual coupled inductors, is compared with the ideal transformer model. If the ideal model is used with considerMagnetization=true leakage inductances are taken into account, otherwise not.
The example is constructed in such a way that the ideal transformer circuit with considerMagnetization=true shows the same behaviour as the basic transformer.</p>
<p>Simulate until T=50 s with both considerMagnetization=false and considerMagnetization=true of the ideal transformer.
Plot in separate windows for comparison:
<br>basicTransformer.p1.v and idealTransformer.p1.v
<br>basicTransformer.p1.i and idealTransformer.p1.i
<br>basicTransformer.p2.v and idealTransformer.p2.v
basicTransformer.p2.i and idealTransformer.p2.i </p>
</html>"));
  end CompareTransformers;

  model ControlledSwitchWithArc
    "Comparison of controlled switch models both with and without arc"

    extends Modelica_Icons.Example;
    Modelica_Electrical_Analog.Basic.Ground ground1 annotation (Placement(
          transformation(extent={{20,-20},{40,0}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage1(V=50)
      annotation (Placement(transformation(
          origin={-20,20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Inductor inductor1(L=0.1) annotation (
        Placement(transformation(extent={{40,30},{60,50}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor resistor1(R=1) annotation (
        Placement(transformation(
          origin={80,20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Ideal.ControlledIdealClosingSwitch switch1
      annotation (Placement(transformation(extent={{0,30},{20,50}}, rotation=
              0)));
    Modelica_Electrical_Analog.Basic.Ground ground2 annotation (Placement(
          transformation(extent={{20,-100},{40,-80}}, rotation=0)));
    Modelica_Electrical_Analog.Sources.ConstantVoltage constantVoltage2(V=50)
      annotation (Placement(transformation(
          origin={-20,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Basic.Inductor inductor2(L=0.1) annotation (
        Placement(transformation(extent={{40,-50},{60,-30}}, rotation=0)));
    Modelica_Electrical_Analog.Basic.Resistor resistor2(R=1) annotation (
        Placement(transformation(
          origin={80,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Analog.Ideal.ControlledCloserWithArc switch2(
      V0=30,
      dVdt=10000,
      Vmax=60) annotation (Placement(transformation(extent={{0,-50},{20,-30}},
            rotation=0)));
    Modelica_Electrical_Analog.Sources.SineVoltage sineVoltage(V=1, freqHz=1)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-10})));
    Modelica_Electrical_Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));

  initial equation
    inductor1.i = 0;
    inductor2.i = 0;
  equation
    connect(inductor1.n,resistor1. p) annotation (Line(points={{60,40},{80,40},
            {80,30}}, color={0,0,255}));
    connect(resistor1.n,ground1. p)
      annotation (Line(points={{80,10},{80,0},{30,0}}, color={0,0,255}));
    connect(constantVoltage1.n,ground1. p)
      annotation (Line(points={{-20,10},{-20,0},{30,0}}, color={0,0,255}));
    connect(switch1.n,inductor1. p)
      annotation (Line(points={{20,40},{40,40}}, color={0,0,255}));
    connect(constantVoltage1.p,switch1. p) annotation (Line(points={{-20,30},{-20,
            40},{0,40}},     color={0,0,255}));
    connect(inductor2.n,resistor2. p) annotation (Line(points={{60,-40},{80,-40},
            {80,-50}}, color={0,0,255}));
    connect(resistor2.n,ground2. p)
      annotation (Line(points={{80,-70},{80,-80},{30,-80}}, color={0,0,255}));
    connect(constantVoltage2.n,ground2. p)
      annotation (Line(points={{-20,-70},{-20,-80},{30,-80}}, color={0,0,255}));
    connect(switch2.n,inductor2. p)
      annotation (Line(points={{20,-40},{40,-40}}, color={0,0,255}));
    connect(constantVoltage2.p,switch2. p) annotation (Line(points={{-20,-50},{
            -20,-40},{0,-40}}, color={0,0,255}));
    connect(sineVoltage.p, switch1.control) annotation (Line(
        points={{-70,0},{-40,0},{-40,50},{10,50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sineVoltage.p, switch2.control) annotation (Line(
        points={{-70,0},{-40,0},{-40,-30},{10,-30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sineVoltage.n, ground.p) annotation (Line(
        points={{-70,-20},{-70,-40}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-100,80},{100,60}},
            lineColor={0,0,255},
            textString="Compare voltage and current of inductor1 and inductor2")}),
      experiment(
        StopTime=6,
        Interval=0.00025,
        Tolerance=1e-006),
      Documentation(info="<html>
<p>This example is to compare the behaviour of switch models with and without an electric arc taking into consideration.</p>
<ul>
<li>Simulate until T=2 s. </li>
<li>Plot in one window: <code>switch1.i</code> and <code>switch2.i</code> </li>
</ul>
<p>The difference in the closing area shows that the simple arc model avoids the suddenly switching.</p>
</html>", revisions="<html>
<ul>
<li><i>May, 2009   </i>
       by Anton Haumer<br> initially realized<br>
       </li>
</ul>
</html>"));
  end ControlledSwitchWithArc;

  model SimpleTriacCircuit "Simple triac test circuit"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
    Modelica_Electrical_Analog.Basic.Inductor L(
      L=2e-6,
      i(start=0, fixed=true),
      p(v(start=0)))
      annotation (Placement(transformation(extent={{20,50},{40,70}})));
    Modelica_Electrical_Analog.Basic.Resistor R(R=10) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,30})));
    Modelica_Electrical_Analog.Sources.SineVoltage V(V=30, freqHz=10000)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,-10})));
    Modelica_Electrical_Analog.Semiconductors.SimpleTriac simpleTriac(
      VDRM=400,
      VRRM=400,
      thyristor1(vGK(start=0))) annotation (Placement(transformation(
          extent={{-13,-13},{11,11}},
          rotation=270,
          origin={1,23})));
    Modelica_Electrical_Analog.Sources.PulseCurrent pulseCurrent(
      I=0.005,
      width=10,
      startTime=0.00002,
      period=0.00005) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-40,-10})));

  initial equation
       simpleTriac.thyristor.vControl=0;
      simpleTriac.thyristor1.vControl=0;

  equation
    connect(L.n, R.p)               annotation (Line(
        points={{40,60},{60,60},{60,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R.n, V.p)                  annotation (Line(
        points={{60,20},{60,0}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(V.n, ground.p)           annotation (Line(
        points={{60,-20},{60,-40},{0,-40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(simpleTriac.p, ground.p) annotation (Line(
        points={{0,11.52},{0,-40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(simpleTriac.n, L.p)        annotation (Line(
        points={{0,36},{0,60},{20,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pulseCurrent.n, simpleTriac.g) annotation (Line(
        points={{-40,0},{-40,40},{-11.52,40},{-11.52,31.44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pulseCurrent.p, ground.p) annotation (Line(
        points={{-40,-20},{-40,-40},{0,-40}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (    experiment(
        StopTime=0.001,
        Interval=5e-7,
        Tolerance=1e-12),
      Documentation(revisions="<html>
<ul>
<li><i>November 25, 2009   </i> <br>

       by Susann Wolf <br><br>
       </li>
</ul>
</html>",   info="<html>
<p>The simple TRIAC example shows how the SimpleTriac is used within an alternating current circuit.</p>
<p>The TRIAC is not conducting until the Gate input g becomes positive. Then it becomes &quot;conducting&quot;. If the TRIAC voltage changes its direction, the TRIAC becomes blocking. Due to the antiparallel connection of the internal two thyristors the same behavior is repeated in the negative half-wave.</p>
<p>Simulate until 0.001 seconds. Display V.p.v (input voltage), simpleTriac.g.i  (gate input), and both simplelTriac.n.v and simpleTriac.n.i, which demonstrate the TRIAC behavior.</p>
</html>"));
  end SimpleTriacCircuit;

  model IdealTriacCircuit "Ideal triac test circuit"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-12,-40},{8,-20}})));
    Modelica_Electrical_Analog.Basic.Resistor R(R=20) annotation (Placement(
          transformation(
          extent={{-10,-10},{12,12}},
          rotation=0,
          origin={-44,32})));
    Modelica_Electrical_Analog.Sources.SineVoltage V(V=5, freqHz=2)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-42,-20})));
    Modelica_Blocks.Sources.BooleanPulse booleanPulse(width=50,
      period=0.25,
      startTime=0.1)
      annotation (Placement(transformation(extent={{-22,0},{-6,16}})));
   Modelica_Electrical_Analog.Ideal.IdealTriac idealTriac(
      capacitor(v(start=0, fixed=true)),
      idealThyristor(off(start=true, fixed=true)),
      idealThyristor1(off(start=true, fixed=true)))
      annotation (Placement(transformation(extent={{6,20},{32,46}})));

  equation
    connect(V.n, ground.p)            annotation (Line(
        points={{-32,-20},{-2,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R.p, V.p)                   annotation (Line(
        points={{-54,33},{-60,33},{-60,-20},{-52,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R.n, idealTriac.n)                      annotation (Line(
        points={{-32,33},{6,33}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(idealTriac.p, ground.p)               annotation (Line(
        points={{32.52,33},{42,33},{42,-20},{-2,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(idealTriac.fire1, booleanPulse.y)               annotation (Line(
        points={{11.2,21.04},{0,21.04},{0,8},{-5.2,8}},
        color={255,0,255},
        smooth=Smooth.None));
    annotation (    experiment(StopTime=2),
      Documentation(revisions="<html>
<ul>
<li><i>November 25, 2009   </i> <br>

       by Susann Wolf <br><br>
       </li>
</ul>
</html>",   info="<html>
<p>The simple ideal TRIAC example shows how a triac is used within an alternating current circuit.</p>
<p>The TRIAC is not conducting until the Boolean input becomes true (internally coded by 1, therefore the input is called fire<b>1</b>). Then it becomes &quot;conducting&quot;, the knee voltage is reached. If the TRIAC voltage falls below the knee voltage, the TRIAC becomes blocking. Due to the antiparallel connection of the internal two thyristors the same behavior is repeated in the negative half-wave.</p>
<p>Simulate until 2 seconds. Display V.p.v (input voltage), booleanPulse.y (fire1 input), and both idealTriac.n.v and idealTriac.n.i, which demonstrate the TRIAC behavior.</p>
</html>"));
  end IdealTriacCircuit;

  model AD_DA_conversion "Conversion circuit"
    extends Modelica_Icons.Example;
    parameter Integer N=7 "Digital signal width";
    Modelica_Electrical_Analog.Ideal.AD_Converter aD_Converter(
      N=N,
      Rin=1000000,
      VRefLow=0,
      VRefHigh=10)
      annotation (Placement(transformation(extent={{-14,-10},{12,16}})));
    Modelica_Electrical_Digital.Sources.Pulse pulse(
      pulse=Modelica_Electrical_Digital.Interfaces.Logic.'1',
      quiet=Modelica_Electrical_Digital.Interfaces.Logic.'0',
      nperiod=-1,
      width=1,
      period=0.001,
      startTime=0)
               annotation (Placement(transformation(extent={{-32,32},{-12,52}})));
    Modelica_Electrical_Analog.Ideal.DA_Converter dA_Converter(N=N, Vref=10)
      annotation (Placement(transformation(extent={{18,-10},{44,16}})));
    Modelica_Electrical_Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{44,-40},{64,-20}})));
    Modelica_Electrical_Analog.Sources.SineVoltage sineVoltage(
      V=5,
      freqHz=10,
      offset=5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-80,4})));
    Modelica_Electrical_Analog.Basic.Resistor resistor(R=1)
      annotation (Placement(transformation(extent={{-28,68},{-8,88}})));
  equation
    connect(pulse.y, aD_Converter.trig) annotation (Line(
        points={{-12,42},{-1,42},{-1,14.7}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(sineVoltage.p, aD_Converter.p) annotation (Line(
        points={{-80,14},{-38.5,14},{-38.5,12.1},{-10.1,12.1}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sineVoltage.n, aD_Converter.n) annotation (Line(
        points={{-80,-6},{-38,-6},{-38,-6.1},{-10.1,-6.1}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ground.p, sineVoltage.n) annotation (Line(
        points={{54,-20},{-80,-20},{-80,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(sineVoltage.p, resistor.p) annotation (Line(
        points={{-80,14},{-80,78},{-28,78}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dA_Converter.trig, pulse.y) annotation (Line(
        points={{31,14.7},{31,42},{-12,42}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(aD_Converter.y, dA_Converter.x) annotation (Line(
        points={{8.1,3},{21.9,3}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(dA_Converter.p, resistor.n) annotation (Line(
        points={{40.1,12.1},{40.1,78},{-8,78}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(dA_Converter.n, ground.p) annotation (Line(
        points={{40.1,-6.1},{54,-6.1},{54,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (    experiment(StopTime=0.2),
      Documentation(info="<html>
<p>The simple converter circuit converts an analog sine signal into a N-bit (by default a 4 bit) logic signal, which is converted backward into an analog signal.</p>
<ul>
<li>Simulate for 0.2 s.</li>
</ul>
<p>Compare the input voltage (aD_Converter.p.v) with the output voltage (dA_Converter.p.v). By changing N the influence of the digital signal width can be studied. Otherwise the trigger frequency pulse.period can be changed to see its influence.</p>
</html>",   revisions="<html>
<ul>
<li><i>October 13, 2009  </i>by Matthias Franke </li>
</ul>
</html>"));
  end AD_DA_conversion;

  package OpAmps
    extends Modelica_Icons.ExamplesPackage;
    model InvertingAmp "Inverting amplifier"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Real k=2 "Desired amplification";
      parameter Modelica_SIunits.Resistance R1=1000;
      parameter Modelica_SIunits.Resistance R2=k*R1;
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(
        Vps=Vps,
        Vns=Vns,
        out(i(start=0, fixed=false)))
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        V=2*Vin,
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        offset=-Vin,
        startTime=-(vIn.rising + vIn.width/2)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1)
        annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2)
        annotation (Placement(transformation(extent={{20,10},{0,30}})));
    equation
      connect(r1.n, r2.n) annotation (Line(
          points={{-20,20},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, opAmp.in_n) annotation (Line(
          points={{0,20},{-10,20},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.p, opAmp.out) annotation (Line(
          points={{20,20},{30,20},{30,0},{20,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, opAmp.in_p) annotation (Line(
          points={{-10,-80},{-10,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.p, r1.p) annotation (Line(
          points={{-80,10},{-80,20},{-40,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                        <p>This is an inverting amplifier. Resistance R1 can be choosen, R2 is defined by the desired amplfication k.</p>
                        </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end InvertingAmp;

    model NonInvertingAmp "Non-inverting amplifier"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Real k=2 "Desired amplification";
      parameter Modelica_SIunits.Resistance R1=1000;
      parameter Modelica_SIunits.Resistance R2=(k - 1)*R1;
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(
        Vps=Vps,
        Vns=Vns,
        out(i(start=0)))
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        V=2*Vin,
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        offset=-Vin,
        startTime=-(vIn.rising + vIn.width/2)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1) annotation (
          Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={10,40})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2) annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={10,20})));
    equation
      connect(opAmp.out, r2.p) annotation (Line(
          points={{20,0},{30,0},{30,20},{20,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r1.n, ground.p) annotation (Line(
          points={{20,40},{20,40},{80,40},{80,-80},{-10,-80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.p, opAmp.in_p) annotation (Line(
          points={{-80,10},{-20,10},{-20,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, opAmp.in_n) annotation (Line(
          points={{0,20},{-10,20},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, r1.p) annotation (Line(
          points={{0,20},{-10,20},{-10,40},{0,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                         <p>This is a non inverting amplifier. Resistance R1 can be choosen, R2 is defined by the desired amplfication k.</p>
                         </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end NonInvertingAmp;

    model VoltageFollower "Reproduce input voltage"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Modelica_SIunits.Resistance Ri=1
        "Inner resistance of input voltage source";
      parameter Modelica_SIunits.Resistance Rl=1 "Load resistance";
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(
        Vps=Vps,
        Vns=Vns,
        v_in(start=0))
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        V=2*Vin,
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        offset=-Vin,
        startTime=-(vIn.rising + vIn.width/2)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor ri(R=Ri)
        annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
      Modelica_Electrical_Analog.Basic.Resistor rl(R=Rl) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={30,-18})));
    equation
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, opAmp.in_n) annotation (Line(
          points={{20,0},{30,0},{30,20},{-10,20},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.p, ri.p) annotation (Line(
          points={{-80,10},{-60,10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ri.n, opAmp.in_p) annotation (Line(
          points={{-40,10},{-20,10},{-20,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, rl.p) annotation (Line(
          points={{20,0},{30,0},{30,-8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, rl.n) annotation (Line(
          points={{-10,-80},{30,-80},{30,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
    <p>This is a voltage follower. It reproduces the input voltage at the output without loading the input voltage source with a stiff output.</p>
                         </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end VoltageFollower;

    model Differentiator "Differentiating amplifier"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Real k=2 "Desired amplification";
      parameter Modelica_SIunits.Resistance R=1000;
      parameter Modelica_SIunits.Capacitance C=k/(2*pi*f*R);
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(Vps=Vps,
          Vns=Vns)
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        V=2*Vin,
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        offset=-Vin,
        startTime=-(vIn.rising + vIn.width/2)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r(R=R)
        annotation (Placement(transformation(extent={{20,10},{0,30}})));
      Modelica_Electrical_Analog.Basic.Capacitor c(C=C, v(fixed=true, start=0))
        annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
    equation
      connect(r.n, c.n) annotation (Line(
          points={{0,20},{-20,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.p, c.p) annotation (Line(
          points={{-80,10},{-80,20},{-40,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.n, ground.p) annotation (Line(
          points={{-80,-10},{-80,-80},{-10,-80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, opAmp.in_p) annotation (Line(
          points={{-10,-80},{-10,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.in_n, r.n) annotation (Line(
          points={{0,6},{-10,6},{-10,20},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r.p, opAmp.out) annotation (Line(
          points={{20,20},{30,20},{30,0},{20,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vOut.n, ground.p) annotation (Line(
          points={{50,-30},{50,-80},{-10,-80}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                        <p>This is a (inverting) differentiating amplifier. Resistance R can be choosen, capacitance C is defined by the desired time constant resp. frequency.</p>
                        </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end Differentiator;

    model Integrator "Integrating amplifier"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Real k=2 "Desired amplification";
      parameter Modelica_SIunits.Resistance R=1000;
      parameter Modelica_SIunits.Capacitance C=1/k/(2*pi*f*R);
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(
        Vps=Vps,
        Vns=Vns,
        v_in(start=0))
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        V=2*Vin,
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        offset=-Vin,
        startTime=-(vIn.rising + vIn.width/2)) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r(R=R)
        annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
      Modelica_Electrical_Analog.Basic.Capacitor c(C=C, v(fixed=true, start=0))
        annotation (Placement(transformation(extent={{20,10},{0,30}})));
    equation
      connect(c.n, r.n) annotation (Line(
          points={{0,20},{-20,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(c.p, opAmp.out) annotation (Line(
          points={{20,20},{30,20},{30,0},{20,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(c.n, opAmp.in_n) annotation (Line(
          points={{0,20},{-10,20},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, opAmp.in_p) annotation (Line(
          points={{-10,-80},{-10,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.p, r.p) annotation (Line(
          points={{-80,10},{-80,20},{-40,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                        <p>This is an (inverting) integrating amplifier. Resistance R can be choosen, capacitance C is defined by the desired time constant resp. frequency.</p>
                        </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end Integrator;

    model LowPass "Low-pass filter"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Real k=1 "Desired amplification";
      parameter Modelica_SIunits.Resistance R1=1000;
      parameter Modelica_SIunits.Resistance R2=k*R1;
      parameter Modelica_SIunits.Frequency fG=f/10;
      parameter Modelica_SIunits.Capacitance C=1/(2*pi*fG*R2);
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(
        Vps=Vps,
        Vns=Vns,
        v_in(start=0))
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        startTime=-(vIn.rising + vIn.width/2),
        V=Vin,
        offset=0) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1)
        annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2)
        annotation (Placement(transformation(extent={{20,10},{0,30}})));
      Modelica_Electrical_Analog.Basic.Capacitor c(C=C, v(fixed=true, start=0))
        annotation (Placement(transformation(extent={{20,30},{0,50}})));
    equation
      connect(r1.n, r2.n) annotation (Line(
          points={{-20,20},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, opAmp.in_n) annotation (Line(
          points={{0,20},{-10,20},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.p, opAmp.out) annotation (Line(
          points={{20,20},{30,20},{30,0},{20,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.p, c.p) annotation (Line(
          points={{20,20},{30,20},{30,40},{20,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(c.n, r2.n) annotation (Line(
          points={{0,40},{-10,40},{-10,20},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, opAmp.in_p) annotation (Line(
          points={{-10,-80},{-10,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.p, r1.p) annotation (Line(
          points={{-80,10},{-80,20},{-40,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                         <p>This is a (inverting) low pass filter. Resistance R1 can be choosen, resistance R2 is defined by the desired amplification k, capacitance C is defined by the desired cut-off frequency.</p>
                         </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end LowPass;

    model HighPass "High-pass filter"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Real k=1 "Desired amplification";
      parameter Modelica_SIunits.Resistance R1=1000;
      parameter Modelica_SIunits.Resistance R2=k*R1;
      parameter Modelica_SIunits.Frequency fG=f/10;
      parameter Modelica_SIunits.Capacitance C=1/(2*pi*fG*R1);
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(
        Vps=Vps,
        Vns=Vns,
        out(i(start=0)))
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        startTime=-(vIn.rising + vIn.width/2),
        V=Vin,
        offset=0) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1)
        annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2)
        annotation (Placement(transformation(extent={{20,10},{0,30}})));
      Modelica_Electrical_Analog.Basic.Capacitor c(C=C, v(fixed=true, start=0))
        annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
    equation
      connect(r1.n, r2.n) annotation (Line(
          points={{-20,20},{0,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, opAmp.in_n) annotation (Line(
          points={{0,20},{-10,20},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.p, opAmp.out) annotation (Line(
          points={{20,20},{30,20},{30,0},{20,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(c.n, r1.p) annotation (Line(
          points={{-50,20},{-40,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, opAmp.in_p) annotation (Line(
          points={{-10,-80},{-10,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.p, c.p) annotation (Line(
          points={{-80,10},{-80,20},{-70,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                         <p>This is a (inverting) high pass filter. Resistance R1 can be choosen, resistance R2 is defined by the desired amplification k, capacitance C is defined by the desired cut-off frequency.</p>
                         </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end HighPass;

    model Comparator "Comparator"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Modelica_SIunits.Voltage Vref=0 "Reference voltage";
      parameter Real k=(Vref - Vns)/(Vps - Vns);
      parameter Modelica_SIunits.Resistance R=1000;
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(Vps=Vps,
          Vns=Vns)
        annotation (Placement(transformation(extent={{0,10},{20,-10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        startTime=-(vIn.rising + vIn.width/2),
        V=2*Vin,
        offset=-Vin) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Potentiometer potentiometer(R=R,
          rConstant=k) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=0,
            origin={-10,-30})));
      Modelica_Electrical_Analog.Sources.SupplyVoltage supplyVoltage(Vps=Vps,
          Vns=Vns) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-10,-50})));
    equation
      connect(vIn.p, opAmp.in_p) annotation (Line(
          points={{-80,10},{-10,10},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(potentiometer.contact, opAmp.in_n) annotation (Line(
          points={{0,-20},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(potentiometer.pin_p, supplyVoltage.pin_p) annotation (Line(
          points={{-20,-30},{-20,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(potentiometer.pin_n, supplyVoltage.pin_n) annotation (Line(
          points={{0,-30},{0,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, supplyVoltage.ground) annotation (Line(
          points={{-10,-80},{-10,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                        <p>This is a comparator. Resistance R1 can be choosen, resistance R2 is defined by the desired reference voltage Vref (between Vn and Vp). The output switches between Vn for input voltage &LT; Vref and Vp for input voltage &GT; Vref.</p>
                        </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end Comparator;

    model InvertingSchmittTrigger "Schmitt trigger with hysteresis"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Modelica_SIunits.Voltage vHys=1 "(positive) hysteresis voltage";
      parameter Real k=vHys/Vps;
      parameter Modelica_SIunits.Resistance R1=1000;
      parameter Modelica_SIunits.Resistance R2=(1 - k)/k*R1;
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(
        Vps=Vps,
        Vns=Vns,
        out(i(start=0)))
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        startTime=-(vIn.rising + vIn.width/2),
        V=2*Vin,
        offset=-Vin) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={30,-60})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2) annotation (
          Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=90,
            origin={30,-20})));
    equation
      connect(r2.n, r1.p) annotation (Line(
          points={{30,-30},{30,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, r1.n) annotation (Line(
          points={{-10,-80},{30,-80},{30,-80},{30,-80},{30,-70},{30,-70}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, r2.p) annotation (Line(
          points={{20,0},{30,0},{30,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, opAmp.in_p) annotation (Line(
          points={{30,-30},{30,-40},{-10,-40},{-10,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vIn.p, opAmp.in_n) annotation (Line(
          points={{-80,10},{-20,10},{-20,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                        <p>This is a (inverting) Schmitt trigger. Resistance R1 can be choosen, resistance R2 is defined by the desired hysteresis. The output gets Vn for input voltage &GT; 0 + vHys and Vp for input voltage &LT; vHys*Vns/Vps.</p>
                        </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end InvertingSchmittTrigger;

    model SchmittTrigger "Schmitt trigger with hysteresis"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage Vin=5 "Amplitude of input voltage";
      parameter Modelica_SIunits.Frequency f=10 "Frequency of input voltage";
      parameter Modelica_SIunits.Voltage vHys=1 "(positive) hysteresis voltage";
      parameter Real k=vHys/Vps;
      parameter Modelica_SIunits.Resistance R1=1000;
      parameter Modelica_SIunits.Resistance R2=R1/k;
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(
        Vps=Vps,
        Vns=Vns,
        out(i(start=0)))
        annotation (Placement(transformation(extent={{0,10},{20,-10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
      Modelica_Electrical_Analog.Sources.TrapezoidVoltage vIn(
        rising=0.2/f,
        width=0.3/f,
        falling=0.2/f,
        period=1/f,
        nperiod=-1,
        startTime=-(vIn.rising + vIn.width/2),
        V=2*Vin,
        offset=-Vin) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,0})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-30,20})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2) annotation (
          Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={10,20})));
    equation
      connect(ground.p, vIn.n) annotation (Line(
          points={{-10,-80},{-80,-80},{-80,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-80},{50,-80},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.in_n, ground.p) annotation (Line(
          points={{0,-6},{-10,-6},{-10,-80}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, r2.n) annotation (Line(
          points={{20,0},{30,0},{30,20},{20,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.p, opAmp.in_p) annotation (Line(
          points={{0,20},{-10,20},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.p, r1.n) annotation (Line(
          points={{0,20},{-20,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r1.p, vIn.p) annotation (Line(
          points={{-40,20},{-80,20},{-80,10}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                        <p>This is a (non-inverting) Schmitt trigger. Resistance R1 can be choosen, resistance R2 is defined by the desired hysteresis. The output gets Vp for input voltage &GT; vHys and Vn for input voltage &LT; vHys*Vns/Vps.</p>
                        </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end SchmittTrigger;

    model Multivibrator "Multivibrator with Schmidt Trigger"
      extends Modelica_Icons.Example;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Frequency f=10 "Desired frequency";
      parameter Modelica_SIunits.Resistance R1=1000;
      parameter Modelica_SIunits.Resistance R2=1000;
      parameter Modelica_SIunits.Resistance R=1000;
      parameter Modelica_SIunits.Capacitance C=1/f/(2*R*log(1 + 2*R1/R2));
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp(Vps=Vps,
          Vns=Vns)
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={50,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1, i(start=0))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-10,-40})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2) annotation (
          Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=0,
            origin={10,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r(R=R)
        annotation (Placement(transformation(extent={{20,10},{0,30}})));
      Modelica_Electrical_Analog.Basic.Capacitor c(C=C, v(start=1, fixed=true))
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-30,-40})));
    equation
      connect(ground.p, r1.n) annotation (Line(
          points={{-10,-60},{-10,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{-10,-60},{50,-60},{50,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, vOut.p) annotation (Line(
          points={{20,0},{50,0},{50,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, c.n) annotation (Line(
          points={{-10,-60},{-30,-60},{-30,-50}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, r.p) annotation (Line(
          points={{20,0},{30,0},{30,20},{20,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r.n, opAmp.in_n) annotation (Line(
          points={{0,20},{-10,20},{-10,6},{0,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, r2.p) annotation (Line(
          points={{20,0},{30,0},{30,-20},{20,-20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, opAmp.in_p) annotation (Line(
          points={{0,-20},{-10,-20},{-10,-6},{0,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.in_p, r1.p) annotation (Line(
          points={{0,-6},{-10,-6},{-10,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r.n, c.p) annotation (Line(
          points={{0,20},{-30,20},{-30,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                        <p>This is a Multivibrator with Schmitt Trigger according to:</p>
                        <p>U. Tietze and C. Schenk, Halbleiter-Schaltungstechnik (German), 11th edition, Springer 1999, Chapter 6.5.3</p>
                        </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end Multivibrator;

    model SignalGenerator
      "Rectangle-Triangle generatorSchmitt trigger with hysteresis"
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      parameter Modelica_SIunits.Voltage VAmp=10 "Amplitude of output";
      parameter Modelica_SIunits.Resistance R1=1000;
      parameter Modelica_SIunits.Resistance R2=R1*Vps/VAmp;
      parameter Modelica_SIunits.Frequency f=10 "Desired frequency";
      parameter Modelica_SIunits.Resistance R=1000;
      parameter Modelica_SIunits.Capacitance C=Vps/VAmp/(4*f*R);
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp1(Vps=Vps,
          Vns=Vns)
        annotation (Placement(transformation(extent={{-60,10},{-40,-10}})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2, i(start=Vps/R2))
        annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={-50,20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-50,40})));
      Modelica_Electrical_Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp2(
        Vps=Vps,
        Vns=Vns,
        v_in(start=0))
        annotation (Placement(transformation(extent={{30,-10},{50,10}})));
      Modelica_Electrical_Analog.Basic.Capacitor c(C=C, v(fixed=true, start=0))
        annotation (Placement(transformation(extent={{50,10},{30,30}})));
      Modelica_Electrical_Analog.Basic.Resistor r(R=R)
        annotation (Placement(transformation(extent={{-10,10},{10,30}})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOutRectangle
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={-30,-20})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOutTriangle
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={60,-18})));
    equation
      connect(opAmp1.out, r2.n) annotation (Line(
          points={{-40,0},{-30,0},{-30,20},{-40,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp1.in_p, r2.p) annotation (Line(
          points={{-60,6},{-70,6},{-70,20},{-60,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp1.in_n, ground.p) annotation (Line(
          points={{-60,-6},{-70,-6},{-70,-40},{0,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp1.out, r.p) annotation (Line(
          points={{-40,0},{-30,0},{-30,20},{-10,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r.n, c.n) annotation (Line(
          points={{10,20},{30,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(c.p, opAmp2.out) annotation (Line(
          points={{50,20},{60,20},{60,0},{50,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, opAmp2.in_p) annotation (Line(
          points={{0,-40},{20,-40},{20,-6},{30,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(c.n, opAmp2.in_n) annotation (Line(
          points={{30,20},{20,20},{20,6},{30,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.p, r1.p) annotation (Line(
          points={{-60,20},{-70,20},{-70,40},{-60,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp2.out, r1.n) annotation (Line(
          points={{50,0},{60,0},{60,40},{-40,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp1.out, vOutRectangle.p) annotation (Line(
          points={{-40,0},{-30,0},{-30,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOutRectangle.n) annotation (Line(
          points={{0,-40},{-30,-40},{-30,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp2.out, vOutTriangle.p) annotation (Line(
          points={{50,0},{60,0},{60,-8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOutTriangle.n) annotation (Line(
          points={{0,-40},{60,-40},{60,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                        <p>This signal generator consists of a Schmitt Trigger and an integrator. The output of the first OpAmp (Schmidt Trigger) s a rectangular signal, the output of the second OpAmp (integrator) is a triangular signal. </p>
                        <p>The switching level of the comparator defines the ampltude of the triangle, the frequency is defined by: f = Vps/VAmp/(4*R*C) according to:</p>
                        <p>U. Tietze and C. Schenk, Halbleiter-Schaltungstechnik (German), 11th edition, Springer 1999, Chapter 14.5.2</p>
                        </html>"),
        experiment(
          StartTime=0,
          StopTime=1,
          Tolerance=1e-006,
          Interval=0.001));
    end SignalGenerator;

    model LCOscillator
      extends Modelica_Icons.Example;
      import Modelica_Constants.pi;
      parameter Modelica_SIunits.Voltage VAmp=10 "Amplitude of output";
      parameter Modelica_SIunits.Frequency f=1000 "Desired frequency";
      parameter Real A=1.001;
      parameter Modelica_SIunits.Inductance L=0.001;
      parameter Modelica_SIunits.Capacitance C=1/((2*pi*f)^2*L);
      parameter Modelica_SIunits.Resistance R=10000.0;
      parameter Modelica_SIunits.Resistance R1=10000.0;
      parameter Modelica_SIunits.Resistance R2=(A - 1)*R1;
      parameter Real gamma=(1 - A)/(2*R*C);
      Modelica_Electrical_Analog.Basic.Ground ground annotation (Placement(
            visible=true, transformation(
            origin={20,-50},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      Modelica_Electrical_Analog.Ideal.IdealizedOpAmpLimted opAmp
        annotation (Placement(transformation(extent={{-50,10},{-30,-10}})));
      Modelica_Electrical_Analog.Basic.Resistor r(R=R)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      Modelica_Electrical_Analog.Basic.Resistor r2(R=R2, i(start=0))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-20,-20})));
      Modelica_Electrical_Analog.Basic.Resistor r1(R=R1) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={0,-40})));
      Modelica_Electrical_Analog.Basic.Capacitor c(C=C, v(start=VAmp, fixed=
              true)) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={40,-20})));
      Modelica_Electrical_Analog.Basic.Inductor l(L=L, i(fixed=true, start=0))
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={20,-20})));
      Modelica_Electrical_Analog.Sensors.VoltageSensor vOut annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={60,-20})));
    equation
      connect(opAmp.out, r.p) annotation (Line(
          points={{-30,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(opAmp.out, r2.p) annotation (Line(
          points={{-30,0},{-20,0},{-20,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, r1.p) annotation (Line(
          points={{-20,-30},{-20,-40},{-10,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r2.n, opAmp.in_n) annotation (Line(
          points={{-20,-30},{-20,-40},{-60,-40},{-60,-6},{-50,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r1.n, ground.p) annotation (Line(
          points={{10,-40},{20,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r.n, opAmp.in_p) annotation (Line(
          points={{10,0},{20,0},{20,20},{-60,20},{-60,6},{-50,6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(l.n, ground.p) annotation (Line(
          points={{20,-30},{20,-40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r.n, l.p) annotation (Line(
          points={{10,0},{20,0},{20,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(c.p, l.p) annotation (Line(
          points={{40,-10},{20,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(c.n, l.n) annotation (Line(
          points={{40,-30},{20,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground.p, vOut.n) annotation (Line(
          points={{20,-40},{60,-40},{60,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(r.n, vOut.p) annotation (Line(
          points={{10,0},{60,0},{60,-10}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
                       <p>This is an LC oscillator according to:</p>
                       <p>U. Tietze and C. Schenk, Halbleiter-Schaltungstechnik (German), 11th edition, Springer 1999, Chapter 14.1</p>
                       </html>"),
        experiment(
          StartTime=0,
          StopTime=0.01,
          Tolerance=0.0001,
          Interval=1e-005));
    end LCOscillator;
  end OpAmps;

  package Utilities "Utility components used by package Examples"
  extends Modelica_Icons.UtilitiesPackage;

    model Nand "CMOS NAND Gate (see Tietze/Schenk, page 157)"

      Modelica_Electrical_Analog.Semiconductors.PMOS TP1(
        W=6.5e-6,
        L=3.1e-6,
        Beta=1.05e-5,
        Vt=-1,
        K2=0.41,
        K5=0.8385,
        dW=-2.5e-6,
        dL=-2.1e-6) annotation (Placement(transformation(extent={{10,60},{30,80}},
              rotation=0)));
      Modelica_Electrical_Analog.Semiconductors.PMOS TP2(
        W=6.5e-6,
        L=3.1e-6,
        Beta=1.05e-5,
        Vt=-1,
        K2=0.41,
        K5=0.8385,
        dW=-2.5e-6,
        dL=-2.1e-6) annotation (Placement(transformation(extent={{-40,45},{-20,
                65}}, rotation=0)));
      Modelica_Electrical_Analog.Semiconductors.NMOS TN1(
        W=6.5e-6,
        L=3.1e-6,
        Beta=4.1e-5,
        Vt=0.8,
        K2=1.144,
        K5=0.7311,
        dW=-2.5e-6,
        dL=-1.5e-6) annotation (Placement(transformation(extent={{10,15},{30,35}},
              rotation=0)));
      Modelica_Electrical_Analog.Semiconductors.NMOS TN2(
        W=6.5e-6,
        L=3.1e-6,
        Beta=4.1e-5,
        Vt=0.8,
        K2=1.144,
        K5=0.7311,
        dW=-2.5e-6,
        dL=-1.5e-6) annotation (Placement(transformation(extent={{10,-25},{30,-5}},
              rotation=0)));
      Modelica_Electrical_Analog.Basic.Capacitor C4(C=0.4e-13) annotation (
          Placement(transformation(
            origin={60,30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Capacitor C7(C=0.4e-13) annotation (
          Placement(transformation(
            origin={55,-50},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Basic.Ground Gnd annotation (Placement(
            transformation(extent={{40,-25},{50,-15}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground Gnd2 annotation (Placement(
            transformation(extent={{55,0},{65,10}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground Gnd3 annotation (Placement(
            transformation(extent={{50,-80},{60,-70}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground Gnd6 annotation (Placement(
            transformation(extent={{-15,30},{-5,40}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground Gnd7 annotation (Placement(
            transformation(extent={{40,15},{50,25}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground Gnd8 annotation (Placement(
            transformation(extent={{40,60},{50,70}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin x1 annotation (Placement(
            transformation(extent={{-110,40},{-90,60}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin x2 annotation (Placement(
            transformation(extent={{-110,-60},{-90,-40}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin Vdd annotation (Placement(
            transformation(extent={{-10,90},{10,110}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin y annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
    equation
      connect(TN1.S, TN2.D) annotation (Line(points={{30,20},{30,-10}}));
      connect(TN2.B, Gnd.p) annotation (Line(points={{30,-15},{38,-15},{38,-15},{45,
              -15}}));
      connect(TN2.D, C7.p) annotation (Line(points={{30,-10},{55,-10},{55,-40}}));
      connect(TN2.S, Gnd.p) annotation (Line(points={{30,-20},{38,-20},{38,-15},{45,
              -15}}));
      connect(TP1.S, TN1.D) annotation (Line(points={{30,65},{30,30}}));
      connect(TP1.G, TN1.G) annotation (Line(points={{10,65},{10,20}}));
      connect(C4.n, Gnd2.p) annotation (Line(points={{60,20},{60,10}}));
      connect(C7.n, Gnd3.p) annotation (Line(points={{55,-60},{55,-70}}));
      connect(TP2.B, Gnd6.p) annotation (Line(points={{-20,55},{-10,55},{-10,40}}));
      connect(TN1.B, Gnd7.p) annotation (Line(points={{30,25},{45,25}}));
      connect(TP1.B, Gnd8.p) annotation (Line(points={{30,70},{45,70}}));
      connect(TP2.G, x1) annotation (Line(points={{-40,50},{-100,50}}));
      connect(TP2.G, TN2.G) annotation (Line(points={{-40,50},{-40,-20},{10,-20}}));
      connect(TN1.G, x2) annotation (Line(points={{10,20},{-70,20},{-70,-50},{-100,
              -50}}));
      connect(TP2.S, TN1.D) annotation (Line(points={{-20,50},{30,50},{30,30}}));
      connect(TN1.D, C4.p) annotation (Line(points={{30,30},{30,50},{60,50},{60,40}}));
      connect(Vdd, TP1.D) annotation (Line(points={{0,100},{0,80},{30,80},{30,75}}));
      connect(TP2.D, Vdd) annotation (Line(points={{-20,60},{-20,80},{0,80},{0,100}}));
      connect(C4.p, y) annotation (Line(points={{60,40},{60,50},{80,50},{80,0},{100,
              0}}));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-50,70},{50,-70}},
              lineColor={0,0,0},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,5},{60,-5}},
              lineColor={0,0,0},
              pattern=LinePattern.None),
            Text(
              extent={{-16,50},{14,20}},
              lineColor={0,0,0},
              textString="&"),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Line(points={{0,70},{0,100}}, color={0,0,255}),
            Line(points={{-50,50},{-100,50}}, color={0,0,255}),
            Line(points={{-50,-50},{-100,-50}}, color={0,0,255}),
            Ellipse(extent={{50,5},{60,-5}}, lineColor={0,0,0}),
            Text(
              extent={{-100,34},{-90,24}},
              textString="x1",
              lineColor={0,0,255}),
            Text(
              extent={{-100,-65},{-90,-75}},
              textString="x2",
              lineColor={0,0,255}),
            Text(
              extent={{90,-15},{100,-25}},
              textString="y",
              lineColor={0,0,255}),
            Text(
              extent={{-151,-81},{149,-111}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(info="<html>
<p>The nand gate is a basic CMOS building block. It consists of four CMOS transistors.</p>
<p><b>Reference:</b></p>
<p>Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 157</p>
</html>",
       revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
</dl>
</html>"),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Text(
              extent={{-94,93},{-44,70}},
              lineColor={0,0,255},
              textString="NAND")}));
    end Nand;

    model NonlinearResistor "Chua's resistor"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;

      parameter Modelica_SIunits.Conductance Ga
        "Conductance in inner voltage range";
      parameter Modelica_SIunits.Conductance Gb
        "Conductance in outer voltage range";
      parameter Modelica_SIunits.Voltage Ve "Inner voltage range limit";
    equation
      i = if (v < -Ve) then Gb*(v + Ve) - Ga*Ve else if (v > Ve) then Gb*(v - Ve)
         + Ga*Ve else Ga*v;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{-50,-60},{50,60}}, color={0,0,255}),
            Polygon(
              points={{50,60},{38,52},{44,46},{50,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-150,97},{150,67}},
              lineColor={0,0,255},
              textString="%name")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{-50,-60},{50,60}}, color={0,0,255}),
            Polygon(
              points={{50,60},{38,52},{44,46},{50,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-100,100},{100,70}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>This is the only nonlinear component for Chua&#39;;s circuit. It is a piecewise linear resistor with both an inner and an outer range, which includes the inner one. The slopes of both ranges are given by parameters. The resistance characteristic is continuous. For Chua&#39;;s circuit both slopes have to be chosen to be negative.</p>
</html>"));
    end NonlinearResistor;

    model RealSwitch "Ideal switch with resistance"

      Modelica_Electrical_Analog.Ideal.ControlledIdealCommutingSwitch S(level=2.5)
        annotation (Placement(transformation(extent={{11.3333,-46},{58,0.6667}},
              rotation=0)));
      Modelica_Electrical_Analog.Basic.Resistor R(R=0.01) annotation (Placement(
            transformation(extent={{-66,-48},{-19.3333,-1.3333}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin p annotation (Placement(
            transformation(extent={{-110,-34},{-90,-14}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin n1 annotation (Placement(
            transformation(extent={{90,-14},{110,6}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin n2 annotation (Placement(
            transformation(extent={{90,-60},{110,-40}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin control annotation (Placement(
            transformation(extent={{24,26},{44,46}}, rotation=0)));
    equation
      connect(p, R.p) annotation (Line(points={{-100,-24},{-66,-24.6667}}));
      connect(R.n, S.p) annotation (Line(points={{-19.3333,-24.6667},{11.3333,
              -22.6667}}));
      connect(n1, S.n1) annotation (Line(points={{100,-4},{58,-11}}));
      connect(n2, S.n2) annotation (Line(points={{100,-50},{58,-22.6667}}));
      connect(control, S.control) annotation (Line(points={{34,36},{34.6666,0.6667}}));
      annotation (
        Documentation(info="<html>
<p>This component is a special kind of a commuting switch which possesses an additional constant resistance. This resistance was necessary in an example. It is not designed for common use.</p>
</html>"),     Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-90,86},{28,70}},
              lineColor={0,0,255},
              textString="Real Switch")}));
    end RealSwitch;

    model Transistor "Transistor with resistance an capacitance"

      Modelica_Electrical_Analog.Basic.Resistor rtb(R=0.05) annotation (
          Placement(transformation(extent={{-80,-10},{-60,10}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Resistor rtc(R=0.1) annotation (
          Placement(transformation(extent={{40,0},{60,20}}, rotation=0)));
      Modelica_Electrical_Analog.Basic.Capacitor ct(C=1e-10) annotation (
          Placement(transformation(
            origin={-40,-30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_Electrical_Analog.Semiconductors.NPN Tr(
        Bf=50,
        Br=0.1,
        Is=1e-16,
        Vak=0.02,
        Tauf=0.12e-9,
        Taur=5e-9,
        Ccs=1e-12,
        Cje=0.4e-12,
        Cjc=0.5e-12,
        Phie=0.8,
        Me=0.4,
        Phic=0.8,
        Mc=0.333,
        Gbc=1e-15,
        Gbe=1e-15,
        Vt=0.02585,
        UIC=true) annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=0)));
      Modelica_Electrical_Analog.Basic.Ground Ground1 annotation (Placement(
            transformation(extent={{-50,-80},{-30,-60}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin c annotation (Placement(
            transformation(extent={{90,50},{110,70}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin b annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin e annotation (Placement(
            transformation(extent={{90,-70},{110,-50}}, rotation=0)));
    equation
      connect(rtb.n, Tr.B) annotation (Line(points={{-60,0},{-20,0}}));
      connect(rtb.n, ct.p) annotation (Line(points={{-60,0},{-40,0},{-40,-20}}));
      connect(ct.n, Ground1.p) annotation (Line(points={{-40,-40},{-40,-60}}));
      connect(Tr.C, rtc.p) annotation (Line(points={{20,10},{40,10}}));
      connect(rtc.n, c) annotation (Line(points={{60,10},{80,10},{80,60},{100,60}}));
      connect(b, rtb.p) annotation (Line(points={{-100,0},{-80,0}}));
      connect(Tr.E, e) annotation (Line(points={{20,-10},{80,-10},{80,-60},{100,-60}}));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-80,80},{80,-80}}, lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{80,60},{100,60}}, color={0,0,255}),
            Line(points={{80,-60},{100,-60}}, color={0,0,255}),
            Line(points={{-100,0},{-80,0}}, color={0,0,255}),
            Line(points={{-60,0},{-10,0}}, color={0,0,255}),
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{60,60},{40,60},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{40,-60},{60,-60}}, color={0,0,255}),
            Text(
              extent={{-150,120},{150,90}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(info="<html>
<p>Since the simple bipolar transistor model does not have base or collector resistances both are added in this component. Additionally, a capacity is added to the base pin. See the schematic for more details.  In such a way the transistor model can be enhanced to become more common.</p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Text(
              extent={{-76,82},{-2,54}},
              lineColor={0,0,255},
              textString="Transistor")}));
    end Transistor;
  annotation (
    Documentation(info="<html>
<p>This package contains some utility components used by package examples. These components are auxiliary components that should not be used like true MLS components since they are designed the purpose of the examples only, not for common use.</p>
</html>",
     revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
</dl>
</html>"));
  end Utilities;
annotation (Documentation(info="<html>
<p>This package contains examples that demonstrate the usage of the components of the Electrical.Analog library.</p>
<p>The examples are simple to understand. They will show a typical behavior of the components, and they will give hints to users.</p>
</html>", revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
</dl>
</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Electrical_Analog_Examples;
