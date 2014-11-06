within ;
package Modelica_Electrical_Analog "Library for analog electrical models"
import SI = Modelica_SIunits;

extends Modelica_Icons.Package;

  package Examples
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
</html>",     info="<html>
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
</html>",     info="<html>
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
</html>",     info="<html>
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
</html>",     revisions="<html>
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
</html>"),     experiment(StopTime=6));
    end CharacteristicThyristors;

    encapsulated model ChuaCircuit "Chua's circuit, ns, V, A"
      import Modelica_Electrical_Analog.Basic;
      import Modelica_Electrical_Analog.Examples.Utilities;
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
      import Modelica_Electrical_Analog.Examples.Utilities;
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
      Semiconductors.HeatingPMOS H_PMOS(useHeatPort=true)
      annotation (Placement(transformation(extent={{-40,40},{-20,60}}, rotation=0)));
      Semiconductors.HeatingNMOS H_NMOS(useHeatPort=true)
      annotation (Placement(transformation(extent={{-40,0},{-20,20}}, rotation=0)));
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
</html>"),     experiment(StopTime=5));
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
      Semiconductors.HeatingNPN T1(
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
        useHeatPort=true, ibe(start=0), vbc(start=0))
               annotation (Placement(transformation(extent={{-20,48},{0,68}},
              rotation=0)));
      Semiconductors.HeatingNPN T2(
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
        useHeatPort=true, ibe(start=0), vbc(start=0))
               annotation (Placement(transformation(extent={{20,-22},{40,-2}},
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
</html>"),     experiment(StopTime=200));
    end HeatingNPN_OrGate;

    model HeatingResistor "Heating resistor"
      extends Modelica_Icons.Example;
      Basic.HeatingResistor heatingResistor(
        R_ref=100,
        alpha=1e-3,
        T_ref=293.15, i(start=0))
                    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
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
</html>"),     experiment(StopTime=5));
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
</html>"),     experiment(StopTime=5));
    end HeatingRectifier;

    encapsulated model NandGate "CMOS NAND Gate (see Tietze/Schenk, page 157)"
      import Modelica_Electrical_Analog.Basic;
      import Modelica_Electrical_Analog.Sources;
      import Modelica_Electrical_Analog.Examples.Utilities;
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
      Semiconductors.ZDiode zDiode annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-20,-20})));
      Semiconductors.ZDiode zDiode1(v(start=0)) annotation (Placement(transformation(
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
</html>",    revisions="<html>
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
      Basic.Inductor Inductance1(L=Lnom, i(start=0, fixed=true)) annotation (Placement(transformation(
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
</html>",   revisions="<html>
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
</html>",     info="<html>
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
</html>",   info="<html>
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
</html>",   revisions="<html>
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
</html>",     info="<html>
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
</html>",     info="<html>
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
</html>",     revisions="<html>
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
        parameter Modelica_SIunits.Voltage vHys=1
          "(positive) hysteresis voltage";
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
        parameter Modelica_SIunits.Voltage vHys=1
          "(positive) hysteresis voltage";
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

        Semiconductors.PMOS TP1(
          W=6.5e-6,
          L=3.1e-6,
          Beta=1.05e-5,
          Vt=-1,
          K2=0.41,
          K5=0.8385,
          dW=-2.5e-6,
          dL=-2.1e-6) annotation (Placement(transformation(extent={{10,60},{30,80}},
                rotation=0)));
        Semiconductors.PMOS TP2(
          W=6.5e-6,
          L=3.1e-6,
          Beta=1.05e-5,
          Vt=-1,
          K2=0.41,
          K5=0.8385,
          dW=-2.5e-6,
          dL=-2.1e-6) annotation (Placement(transformation(extent={{-40,45},{-20,65}},
                rotation=0)));
        Semiconductors.NMOS TN1(
          W=6.5e-6,
          L=3.1e-6,
          Beta=4.1e-5,
          Vt=0.8,
          K2=1.144,
          K5=0.7311,
          dW=-2.5e-6,
          dL=-1.5e-6) annotation (Placement(transformation(extent={{10,15},{30,35}},
                rotation=0)));
        Semiconductors.NMOS TN2(
          W=6.5e-6,
          L=3.1e-6,
          Beta=4.1e-5,
          Vt=0.8,
          K2=1.144,
          K5=0.7311,
          dW=-2.5e-6,
          dL=-1.5e-6) annotation (Placement(transformation(extent={{10,-25},{30,-5}},
                rotation=0)));
        Basic.Capacitor C4(C=0.4e-13) annotation (Placement(transformation(
              origin={60,30},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Basic.Capacitor C7(C=0.4e-13) annotation (Placement(transformation(
              origin={55,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Basic.Ground Gnd annotation (Placement(transformation(extent={{40,-25},{50,
                  -15}}, rotation=0)));
        Basic.Ground Gnd2 annotation (Placement(transformation(extent={{55,0},{65,10}},
                rotation=0)));
        Basic.Ground Gnd3 annotation (Placement(transformation(extent={{50,-80},{60,
                  -70}}, rotation=0)));
        Basic.Ground Gnd6 annotation (Placement(transformation(extent={{-15,30},{-5,
                  40}}, rotation=0)));
        Basic.Ground Gnd7 annotation (Placement(transformation(extent={{40,15},{50,25}},
                rotation=0)));
        Basic.Ground Gnd8 annotation (Placement(transformation(extent={{40,60},{50,70}},
                rotation=0)));
        Interfaces.Pin x1 annotation (Placement(transformation(extent={{-110,40},{-90,
                  60}}, rotation=0)));
        Interfaces.Pin x2 annotation (Placement(transformation(extent={{-110,-60},{
                  -90,-40}}, rotation=0)));
        Interfaces.Pin Vdd annotation (Placement(transformation(extent={{-10,90},{10,
                  110}}, rotation=0)));
        Interfaces.Pin y annotation (Placement(transformation(extent={{90,-10},{110,
                  10}}, rotation=0)));
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
</html>",revisions="<html>
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
</html>"),Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{-94,93},{-44,70}},
                lineColor={0,0,255},
                textString="NAND")}));
      end Nand;

      model NonlinearResistor "Chua's resistor"
        extends Interfaces.OnePort;

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

        Ideal.ControlledIdealCommutingSwitch S(level=2.5) annotation (Placement(
              transformation(extent={{11.3333,-46},{58,0.6667}}, rotation=0)));
        Basic.Resistor R(R=0.01) annotation (Placement(transformation(extent={{-66,-48},
                  {-19.3333,-1.3333}}, rotation=0)));
        Interfaces.Pin p annotation (Placement(transformation(extent={{-110,-34},{-90,
                  -14}},rotation=0)));
        Interfaces.Pin n1 annotation (Placement(transformation(extent={{90,-14},{110,
                  6}},  rotation=0)));
        Interfaces.Pin n2 annotation (Placement(transformation(extent={{90,-60},{110,
                  -40}},
                rotation=0)));
        Interfaces.Pin control annotation (Placement(transformation(extent={{24,26},{
                  44,46}},  rotation=0)));
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
</html>"),       Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-90,86},{28,70}},
                lineColor={0,0,255},
                textString="Real Switch")}));
      end RealSwitch;

      model Transistor "Transistor with resistance an capacitance"

        Basic.Resistor rtb(R=0.05) annotation (Placement(transformation(extent={{-80,
                  -10},{-60,10}}, rotation=0)));
        Basic.Resistor rtc(R=0.1) annotation (Placement(transformation(extent={{40,0},
                  {60,20}}, rotation=0)));
        Basic.Capacitor ct(C=1e-10) annotation (Placement(transformation(
              origin={-40,-30},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Semiconductors.NPN Tr(
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
          UIC=true)   annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        Basic.Ground Ground1 annotation (Placement(transformation(extent={{-50,-80},{
                  -30,-60}}, rotation=0)));
        Interfaces.Pin c annotation (Placement(transformation(extent={{90,50},{110,70}},
                rotation=0)));
        Interfaces.Pin b annotation (Placement(transformation(extent={{-110,-10},{-90,
                  10}}, rotation=0)));
        Interfaces.Pin e annotation (Placement(transformation(extent={{90,-70},{110,
                  -50}}, rotation=0)));
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
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
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
</html>",   revisions="<html>
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
  end Examples;

  package Basic "Basic electrical components"

    extends Modelica_Icons.Package;

    model Ground "Ground node"

      Interfaces.Pin p annotation (Placement(transformation(
            origin={0,100},
            extent={{10,-10},{-10,10}},
            rotation=270)));
    equation
      p.v = 0;
      annotation (
        Documentation(info="<html>
<p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-60,50},{60,50}}, color={0,0,255}),
            Line(points={{-40,30},{40,30}}, color={0,0,255}),
            Line(points={{-20,10},{20,10}}, color={0,0,255}),
            Line(points={{0,90},{0,50}}, color={0,0,255}),
            Text(
              extent={{-144,-19},{156,-59}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(
                points={{-60,50},{60,50}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{-40,30},{40,30}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{-20,10},{20,10}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{0,96},{0,50}},
                thickness=0.5,
                color={0,0,255}),Text(
                extent={{-24,-38},{22,-6}},
                textString="p.v=0",
                lineColor={0,0,255})}));
    end Ground;

    model Resistor "Ideal linear electrical resistor"
      parameter Modelica_SIunits.Resistance R(start=1)
        "Resistance at temperature T_ref";
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";

      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
      Modelica_SIunits.Resistance R_actual
        "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";

    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      R_actual = R*(1 + alpha*(T_heatPort - T_ref));
      v = R_actual*i;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The linear resistor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i*R = v</i>. The Resistance <i>R</i> is allowed to be positive, zero, or negative.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-144,-40},{142,-72}},
              lineColor={0,0,0},
              textString="R=%R"),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-30}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-152,87},{148,47}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(extent={{-70,30},{70,-30}},
              lineColor={0,0,255}),Line(points={{-96,0},{-70,0}}, color={0,0,255}),
              Line(points={{70,0},{96,0}}, color={0,0,255})}));
    end Resistor;

    model HeatingResistor "Temperature dependent electrical resistor"
      parameter Modelica_SIunits.Resistance R_ref(start=1)
        "Resistance at temperature T_ref";
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R = R_ref*(1 + alpha*(heatPort.T - T_ref))";
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref,
          useHeatPort=true);
      Modelica_SIunits.Resistance R
        "Resistance = R_ref*(1 + alpha*(T_heatPort - T_ref))";
    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      R = R_ref*(1 + alpha*(T_heatPort - T_ref));
      v = R*i;
      LossPower = v*i;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-110,20},{-85,20}}, color={
              160,160,164}),Polygon(
                points={{-95,23},{-85,20},{-95,17},{-95,23}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{90,20},{115,20}},
              color={160,160,164}),Line(points={{-125,0},{-115,0}}, color={160,
              160,164}),Line(points={{-120,-5},{-120,5}}, color={160,160,164}),
              Text(
                extent={{-110,25},{-90,45}},
                lineColor={160,160,164},
                textString="i"),Polygon(
                points={{105,23},{115,20},{105,17},{105,23}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{115,0},{125,0}},
              color={160,160,164}),Text(
                extent={{90,45},{110,25}},
                lineColor={160,160,164},
                textString="i")}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-52,-50},{48,50}}, color={0,0,255}),
            Polygon(
              points={{40,52},{50,42},{54,56},{40,52}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-30}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-156,109},{144,69}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>This is a model for an electrical resistor where the generated heat is dissipated to the environment via connector <b>heatPort</b> and where the resistance R is temperature dependent according to the following equation:</p>
<pre>    R = R_ref*(1 + alpha*(heatPort.T - T_ref))</pre>
<p><b>alpha</b> is the <b>temperature coefficient of resistance</b>, which is often abbreviated as <b>TCR</b>. In resistor catalogues, it is usually defined as <b>X [ppm/K]</b> (parts per million, similarly to percentage) meaning <b>X*1.e-6 [1/K]</b>. Resistors are available for 1 .. 7000 ppm/K, i.e., alpha = 1e-6 .. 7e-3 1/K;</p>
<p>Via parameter <b>useHeatPort</b> the heatPort connector can be enabled and disabled (default = enabled). If it is disabled, the generated heat is transported implicitly to an internal temperature source with a fixed temperature of T_ref.</p><p>If the heatPort connector is enabled, it must be connected.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 2002   </i>
       by Anton Haumer<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end HeatingResistor;

    model Conductor "Ideal linear electrical conductor"
      parameter Modelica_SIunits.Conductance G(start=1)
        "Conductance at temperature T_ref";
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
      Modelica_SIunits.Conductance G_actual
        "Actual conductance = G_ref/(1 + alpha*(T_heatPort - T_ref))";

    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      G_actual = G/(1 + alpha*(T_heatPort - T_ref));
      i = G_actual*v;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The linear conductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i = v*G</i>. The Conductance <i>G</i> is allowed to be positive, zero, or negative.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of conductance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-30}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-152,87},{148,47}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-144,-38},{142,-70}},
              lineColor={0,0,0},
              textString="G=%G")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,0},{-70,0}}, color={0,0,
              255}),Line(points={{70,0},{96,0}}, color={0,0,255}),Rectangle(
              extent={{-70,30},{70,-30}}, lineColor={0,0,255})}));
    end Conductor;

    model Capacitor "Ideal linear electrical capacitor"
      extends Interfaces.OnePort(v(start=0));
      parameter Modelica_SIunits.Capacitance C(start=1) "Capacitance";

    equation
      i = C*der(v);
      annotation (
        Documentation(info="<html>
<p>The linear capacitor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i = C * dv/dt</i>. The Capacitance <i>C</i> is allowed to be positive or zero.</p>

</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-6,28},{-6,-28}}, color={0,0,255}),
            Line(points={{6,28},{6,-28}}, color={0,0,255}),
            Line(points={{-90,0},{-6,0}}, color={0,0,255}),
            Line(points={{6,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-136,-60},{136,-92}},
              lineColor={0,0,0},
              textString="C=%C"),
            Text(
              extent={{-150,85},{150,45}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(
                points={{-20,40},{-20,-40}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{20,40},{20,-40}},
                thickness=0.5,
                color={0,0,255}),Line(points={{-96,0},{-20,0}}, color={0,0,255}),
              Line(points={{20,0},{96,0}}, color={0,0,255})}));
    end Capacitor;

    model Inductor "Ideal linear electrical inductor"
      extends Interfaces.OnePort(i(start=0));
      parameter Modelica_SIunits.Inductance L(start=1) "Inductance";

    equation
      L*der(i) = v;
      annotation (
        Documentation(info="<html>
<p>The linear inductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>v = L * di/dt</i>. The Inductance <i>L</i> is allowed to be positive, or zero.</p>

</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
            Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-60,-30},{60,0}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-90,0},{-60,0}}, color={0,0,255}),
            Text(
              extent={{-138,-60},{144,-94}},
              lineColor={0,0,0},
              textString="L=%L"),
            Text(
              extent={{-152,79},{148,39}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-60,-15},{-30,15}},
              lineColor={0,0,255}),Ellipse(extent={{-30,-15},{0,15}}, lineColor={
              0,0,255}),Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
              Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),Rectangle(
                extent={{-60,-30},{60,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{60,0},{96,0}}, color=
               {0,0,255}),Line(points={{-96,0},{-60,0}}, color={0,0,255})}));
    end Inductor;

    model SaturatingInductor "Simple model of an inductor with saturation"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Current Inom(start=1) "Nominal current";
      parameter Modelica_SIunits.Inductance Lnom(start=1)
        "Nominal inductance at Nominal current";
      parameter Modelica_SIunits.Inductance Lzer(start=2*Lnom)
        "Inductance near current=0";
      parameter Modelica_SIunits.Inductance Linf(start=Lnom/2)
        "Inductance at large currents";
      Modelica_SIunits.Inductance Lact(start=Lzer) "Present inductance";
      Modelica_SIunits.MagneticFlux Psi(start=0, fixed=true) "Present flux";
    protected
      parameter Modelica_SIunits.Current Ipar(start=Inom/10, fixed=false);
    initial equation
      (Lnom - Linf) = (Lzer - Linf)*Ipar/Inom*(Modelica_Constants.pi/2 -
        Modelica_Math.atan(Ipar/Inom));
    equation
      assert(Lzer > Lnom +Modelica_Constants.eps,  "Lzer (= " + String(Lzer) +
        ") has to be > Lnom (= " + String(Lnom) + ")");
      assert(Linf < Lnom -Modelica_Constants.eps,  "Linf (= " + String(Linf) +
        ") has to be < Lnom (= " + String(Lnom) + ")");
      (Lact - Linf)*i/Ipar = (Lzer - Linf)*noEvent(Modelica_Math.atan(i/Ipar));
      Psi = Lact*i;
      v = der(Psi);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
            Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-60,-20},{62,0}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-90,0},{-60,0}}, color={0,0,255}),
            Rectangle(
              extent={{-60,-10},{60,-20}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={0,0,255}),
            Text(
              extent={{-148,-50},{152,-80}},
              lineColor={0,0,0},
              textString="Lnom=%Lnom"),
            Text(
              extent={{-148,91},{152,51}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>This model approximates the behaviour of an inductor with the influence of saturation, i.e., the value of the inductance depends on the current flowing through the inductor. The inductance decreases as current increases.</p><p>The parameters are:</p>
<ul>
<li>Inom...nominal current</li>
<li>Lnom...nominal inductance at nominal current</li>
<li>Lzer...inductance near current = 0; Lzer has to be greater than Lnom</li>
<li>Linf...inductance at large currents; Linf has to be less than Lnom </li>
</ul>
</html>",   revisions="<html>
<dl>
  <dt><b>Main Author:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting &amp; Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
  <dt><b>Release Notes:</b></dt>
  <dd>May 27, 2004: Implemented by Anton Haumer</dd>
 </dl>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-60,-15},{-30,15}},
              lineColor={0,0,255}),Ellipse(extent={{-30,-15},{0,15}}, lineColor={
              0,0,255}),Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
              Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),Rectangle(
                extent={{-60,-20},{62,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{60,0},{96,0}}, color=
               {0,0,255}),Line(points={{-96,0},{-60,0}}, color={0,0,255}),
              Rectangle(
                extent={{-60,-10},{60,-20}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={0,0,255})}));
    end SaturatingInductor;

    model Transformer "Transformer with two ports"
      extends Interfaces.TwoPort(i1(start=0),i2(start=0));
      parameter Modelica_SIunits.Inductance L1(start=1) "Primary inductance";
      parameter Modelica_SIunits.Inductance L2(start=1) "Secondary inductance";
      parameter Modelica_SIunits.Inductance M(start=1) "Coupling inductance";
      Real dv "Difference between voltage drop over primary inductor and 
    voltage drop over secondary inductor";
    equation
      v1 = L1*der(i1) + M*der(i2);

      /* Original equation:
        v2 = M*der(i1) + L2*der(i2);
     If L1 = L2 = M, then this model has one state less. However,
     it might be difficult for a tool to detect this. For this reason
     the model is defined with a relative potential:
  */
      dv = (L1 - M)*der(i1) + (M - L2)*der(i2);
      v2 = v1 - dv;

      annotation (
        Documentation(info="<html>
<p>The transformer is a two port. The left port voltage <i>v1</i>, left port current <i>i1</i>, right port voltage <i>v2</i> and right port current <i>i2</i> are connected by the following relation:</p>
<pre>         | v1 |         | L1   M  |  | i1&#39;; |
         |    |    =    |         |  |     |
         | v2 |         | M    L2 |  | i2&#39;; |</pre>
<p><i>L1</i>, <i>L2</i>, and <i>M</i> are the primary, secondary, and coupling inductances respectively.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-45,-50},{-20,-25}}, lineColor={0,0,255}),
            Ellipse(extent={{-45,-25},{-20,0}}, lineColor={0,0,255}),
            Ellipse(extent={{-45,0},{-20,25}}, lineColor={0,0,255}),
            Ellipse(extent={{-45,25},{-20,50}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-72,-60},{-33,60}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,50},{-32,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-32,-50}}, color={0,0,255}),
            Ellipse(extent={{20,-50},{45,-25}}, lineColor={0,0,255}),
            Ellipse(extent={{20,-25},{45,0}}, lineColor={0,0,255}),
            Ellipse(extent={{20,0},{45,25}}, lineColor={0,0,255}),
            Ellipse(extent={{20,25},{45,50}}, lineColor={0,0,255}),
            Rectangle(
              extent={{33,-60},{72,60}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{32,50},{90,50}}, color={0,0,255}),
            Line(points={{32,-50},{90,-50}}, color={0,0,255}),
            Text(
              extent={{-103,16},{-60,-10}},
              textString="L1",
              lineColor={0,0,0},
              pattern=LinePattern.Dot),
            Text(
              extent={{64,15},{105,-9}},
              textString="L2",
              lineColor={0,0,0},
              pattern=LinePattern.Dot),
            Text(
              extent={{-27,-71},{33,-97}},
              textString="M",
              lineColor={0,0,0}),
            Text(
              extent={{-153,113},{147,73}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-45,-50},{-20,-25}},
              lineColor={0,0,255}),Ellipse(extent={{-45,-25},{-20,0}}, lineColor=
              {0,0,255}),Ellipse(extent={{-45,0},{-20,25}}, lineColor={0,0,255}),
              Ellipse(extent={{-45,25},{-20,50}}, lineColor={0,0,255}),Rectangle(
                extent={{-72,-60},{-33,60}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,50},{-32,50}},
              color={0,0,255}),Line(points={{-96,-50},{-32,-50}}, color={0,0,255}),
              Ellipse(extent={{20,-50},{45,-25}}, lineColor={0,0,255}),Ellipse(
              extent={{20,-25},{45,0}}, lineColor={0,0,255}),Ellipse(extent={{20,
              0},{45,25}}, lineColor={0,0,255}),Ellipse(extent={{20,25},{45,50}},
              lineColor={0,0,255}),Rectangle(
                extent={{33,-60},{72,60}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{32,50},{96,50}},
              color={0,0,255}),Line(points={{32,-50},{96,-50}}, color={0,0,255})}));
    end Transformer;

    model M_Transformer "Generic transformer with free number of inductors"

      parameter Integer N(final min=1) = 3 "Number of inductors";
    protected
      parameter Integer dimL=div(N*(N + 1), 2);
    public
      parameter Modelica_SIunits.Inductance L[dimL]={1,0.1,0.2,2,0.3,3}
        "Inductances and coupling inductances";
      Modelica_Electrical_Analog.Interfaces.PositivePin p[N] "Positive pin"
        annotation (Placement(transformation(extent={{-80,-40},{-62,40}})));
      Modelica_Electrical_Analog.Interfaces.NegativePin n[N] "Negative pin"
        annotation (Placement(transformation(extent={{62,-40},{80,40}})));

      Modelica_SIunits.Voltage v[N] "Voltage drop over inductors";
      Modelica_SIunits.Current i[N](each start=0, fixed=true)
        "Current through inductors";
      parameter Modelica_SIunits.Inductance Lm[N, N](each final fixed=false)
        "Complete symmetric inductance matrix, calculated internally";

    initial equation
      for s in 1:N loop
        for z in 1:N loop
          Lm[z, s] = if (z >= s) then L[(s - 1)*N + z - div((s - 1)*s, 2)] else
            Lm[s, z];
        end for;
      end for;

    equation
      for j in 1:N loop
        v[j] = p[j].v - n[j].v;
        0 = p[j].i + n[j].i;
        i[j] = p[j].i;
      end for;

      v = Lm*der(i);

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Ellipse(extent={{-36,24},{-18,42}}, lineColor={0,0,255}),
            Ellipse(extent={{18,24},{36,42}}, lineColor={0,0,255}),
            Ellipse(extent={{0,24},{18,42}}, lineColor={0,0,255}),
            Ellipse(extent={{-18,24},{0,42}}, lineColor={0,0,255}),
            Rectangle(
              extent={{42,23},{-44,34}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-36,34},{-62,34}}, color={0,0,255}),
            Line(points={{62,34},{36,34}}, color={0,0,255}),
            Ellipse(extent={{-36,8},{-18,26}}, lineColor={0,0,255}),
            Ellipse(extent={{18,8},{36,26}}, lineColor={0,0,255}),
            Ellipse(extent={{0,8},{18,26}}, lineColor={0,0,255}),
            Ellipse(extent={{-18,8},{0,26}}, lineColor={0,0,255}),
            Rectangle(
              extent={{42,6},{-44,18}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-36,18},{-62,18}}, color={0,0,255}),
            Line(points={{62,18},{36,18}}, color={0,0,255}),
            Line(points={{-36,-29},{-62,-29}}, color={0,0,255}),
            Ellipse(extent={{-36,-40},{-18,-22}}, lineColor={0,0,255}),
            Ellipse(extent={{-18,-40},{0,-22}}, lineColor={0,0,255}),
            Ellipse(extent={{0,-40},{18,-22}}, lineColor={0,0,255}),
            Ellipse(extent={{18,-40},{36,-22}}, lineColor={0,0,255}),
            Line(points={{62,-29},{36,-29}}, color={0,0,255}),
            Rectangle(
              extent={{42,-42},{-44,-30}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{0,8},{0,-18}},
              color={0,0,255},
              pattern=LinePattern.Dot),
            Text(
              extent={{-150,103},{150,63}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>The model <i>M_Transformer</i> is a model of a transformer with the possibility to choose the number of inductors. Inside the model, an inductance matrix is built based on the inductance of the inductors and the coupling inductances between the inductors given as a parameter vector from the user of the model.</p>

<p>An example shows that approach:<br>
The user chooses a model with <b>three</b> inductors, that means the parameter <i><b>N</b></i> has to be <b>3</b>. Then he has to specify the inductances of the three inductors and the three coupling inductances. The coupling inductances are no real existing devices, but effects that occur between two inductors. The inductivities (main diagonal of the inductance matrix) and the coupling inductivities have to be specified in the parameter vector <i>L</i>. The length <i>dimL</i> of the parameter vector is calculated as follows: <i><b>dimL=(N*(N+1))/2</b></i></p>

<p>The following example shows how the parameter vector is used to fill in the inductance matrix. To specify the inductance matrix of a three inductances transformer (<i>N=3</i>):
</p>

<p>
<img
 src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Basic/M_Transformer-eq.png\"
 alt=\"L_m\">
</p>

<p>
the user has to allocate the parameter vector <i>L[6] </i>, since <i>Nv=(N*(N+1))/2=(3*(3+1))/2=6</i>. The parameter vector must be filled like this: <i>L=[1,0.1,0.2,2,0.3,3] </i>.</p>
<p>Inside the model, two loops are used to fill the inductance matrix to guarantee that it is filled in a symmetric way.</p>
</html>",   revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th>Version</th>
      <th>Revision</th>
      <th>Date</th>
      <th>Author</th>
      <th>Comment</th>
    </tr>
   <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\">4163</td>
      <td valign=\"top\">2010-09-11</td>
      <td valign=\"top\">Dietmar Winkler</td>
      <td valign=\"top\">Documentation corrected according to documentation guidelines.</td>
    </tr>
    <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\"></td>
      <td valign=\"top\">2008-11-24</td>
      <td valign=\"top\">Kristin Majetta</td>
      <td valign=\"top\">Documentation added.</td>
    </tr>
    <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\"></td>
      <td valign=\"top\">2008-11-16</td>
      <td valign=\"top\">Kristin Majetta</td>
      <td valign=\"top\">Initially implemented</td>
    </tr>
</table>
</html>"));
    end M_Transformer;

    model Gyrator "Gyrator"
      extends Interfaces.TwoPort;
      parameter Modelica_SIunits.Conductance G1(start=1) "Gyration conductance";
      parameter Modelica_SIunits.Conductance G2(start=1) "Gyration conductance";
    equation
      i1 = G2*v2;
      i2 = -G1*v1;
      annotation (
        Documentation(info="<html>
<p>A gyrator is a two-port element defined by the following equations:</p>
<pre>    i1 =  G2 * v2
    i2 = -G1 * v1</pre>
<p>where the constants <i>G1</i>, <i>G2</i> are called the gyration conductance.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,50},{90,50}}, color={0,0,255}),
            Line(points={{60,-50},{90,-50}}, color={0,0,255}),
            Line(points={{-40,30},{40,30}}, color={0,0,255}),
            Line(points={{-20,-20},{20,-20}}, color={0,0,255}),
            Polygon(
              points={{30,34},{40,30},{30,26},{30,34}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{-26,-19},{-16,-15},{-16,-23},{-26,-19}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-5,10},{-10,-10}}, color={0,0,0}),
            Line(points={{9,10},{4,-9}}, color={0,0,0}),
            Line(points={{-14,9},{16,10}}, color={0,0,0}),
            Text(
              extent={{-29,59},{30,30}},
              textString="G1",
              lineColor={0,0,0}),
            Text(
              extent={{-29,-29},{29,-58}},
              textString="G2",
              lineColor={0,0,0}),
            Text(
              extent={{-156,117},{144,77}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{-96,50},{-60,50}}, color={0,0,
              255}),Line(points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(
              points={{60,50},{96,50}}, color={0,0,255}),Line(points={{60,-50},{
              96,-50}}, color={0,0,255}),Line(points={{-40,30},{40,30}}, color={0,
              0,255}),Line(points={{-21,-22},{19,-22}}, color={0,0,255}),Polygon(
                points={{30,34},{40,30},{30,26},{30,34}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Polygon(
                points={{-20,-30},{-10,-26},{-10,-34},{-20,-30}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(
                points={{-4,5},{-6,-5}},
                thickness=1,
                color={0,0,255}),Line(
                points={{3,5},{1,-5}},
                thickness=1,
                color={0,0,255}),Line(
                points={{-8,5},{7,5}},
                thickness=1,
                color={0,0,255}),Text(
                extent={{-20,50},{20,35}},
                textString="G1",
                lineColor={0,0,255}),Text(
                extent={{-20,-35},{20,-50}},
                textString="G2",
                lineColor={0,0,255})}));
    end Gyrator;

    model EMF "Electromotoric force (electric/mechanic transformer)"
      parameter Boolean useSupport=false
        "= true, if support flange enabled, otherwise implicitly grounded"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.ElectricalTorqueConstant k(start=1)
        "Transformation coefficient";
      Modelica_SIunits.Voltage v "Voltage drop between the two pins";
      Modelica_SIunits.Current i
        "Current flowing from positive to negative pin";
      Modelica_SIunits.Angle phi
        "Angle of shaft flange with respect to support (= flange.phi - support.phi)";
      Modelica_SIunits.AngularVelocity w
        "Angular velocity of flange relative to support";
      Interfaces.PositivePin p annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Interfaces.NegativePin n annotation (Placement(transformation(
            origin={0,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_Rotational.Interfaces.Flange_b flange annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Mechanics_Rotational.Interfaces.Support support if
                                                         useSupport
        "Support/housing of emf shaft"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    protected
      Modelica_Mechanics_Rotational.Components.Fixed fixed if
                                                     not useSupport
        annotation (Placement(transformation(extent={{-90,-20},{-70,0}})));
      Modelica_Mechanics_Rotational.Interfaces.InternalSupport internalSupport(
          tau=-flange.tau)
        annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;

      phi = flange.phi - internalSupport.phi;
      w = der(phi);
      k*w = v;
      flange.tau = -k*i;
      connect(internalSupport.flange, support) annotation (Line(
          points={{-80,0},{-100,0}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(internalSupport.flange, fixed.flange) annotation (Line(
          points={{-80,0},{-80,-10}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (
        defaultComponentName="emf",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-85,10},{-36,-10}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192}),
            Line(points={{0,90},{0,40}}, color={0,0,255}),
            Rectangle(
              extent={{35,10},{100,-10}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192}),
            Ellipse(
              extent={{-40,40},{40,-40}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,-90},{0,-40}}, color={0,0,255}),
            Text(
              extent={{0,-50},{199,-90}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{0,80},{189,46}},
              lineColor={160,160,164},
              textString="k=%k"),
            Line(
              visible=not useSupport,
              points={{-100,-30},{-40,-30}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-100,-50},{-80,-30}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-80,-50},{-60,-30}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-60,-50},{-40,-30}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-70,-30},{-70,-10}},
              color={0,0,0})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-17,95},{-20,85},{-23,95},{-17,95}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{-20,110},{-20,85}},
              color={160,160,164}),Text(
                extent={{-40,110},{-30,90}},
                lineColor={160,160,164},
                textString="i"),Line(points={{9,75},{19,75}}, color={192,192,192}),
              Line(points={{-20,-110},{-20,-85}}, color={160,160,164}),Polygon(
                points={{-17,-100},{-20,-110},{-23,-100},{-17,-100}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Text(
                extent={{-40,-110},{-30,-90}},
                lineColor={160,160,164},
                textString="i"),Line(points={{8,-79},{18,-79}}, color={192,192,
              192}),Line(points={{14,80},{14,70}}, color={192,192,192})}),
        Documentation(info="<html>
<p>EMF transforms electrical energy into rotational mechanical energy. It is used as basic building block of an electrical motor. The mechanical connector flange can be connected to elements of the Modelica.Mechanics.Rotational library. flange.tau is the cut-torque, flange.phi is the angle at the rotational connection.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end EMF;

    model TranslationalEMF
      "Electromotoric force (electric/mechanic transformer)"
      parameter Boolean useSupport=false
        "= true, if support flange enabled, otherwise implicitly grounded"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.ElectricalForceConstant k(start=1)
        "Transformation coefficient";

      Modelica_SIunits.Voltage v "Voltage drop between the two pins";
      Modelica_SIunits.Current i
        "Current flowing from positive to negative pin";
      Modelica_SIunits.Position s "Position of flange relative to support";
      Modelica_SIunits.Velocity vel "Velocity of flange relative to support";

      Modelica_Electrical_Analog.Interfaces.PositivePin p annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Electrical_Analog.Interfaces.NegativePin n annotation (Placement(
            transformation(
            origin={0,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_Mechanics_Translational.Interfaces.Flange_b flange annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Mechanics_Translational.Interfaces.Support support if useSupport
        "Support/housing"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    protected
      Modelica_Mechanics_Translational.Components.Fixed fixed if not useSupport
        annotation (Placement(transformation(extent={{-90,-20},{-70,0}})));
      Modelica_Mechanics_Translational.Interfaces.InternalSupport internalSupport(
          f=-flange.f)
        annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;

      s = flange.s - internalSupport.s;
      vel = der(s);
      k*vel = v;
      flange.f = -k*i;
      connect(internalSupport.flange, support) annotation (Line(
          points={{-80,0},{-90,0},{-90,0},{-100,0}},
          color={0,127,0},
          smooth=Smooth.None));
      connect(internalSupport.flange, fixed.flange) annotation (Line(
          points={{-80,0},{-80,-10}},
          color={0,127,0},
          smooth=Smooth.None));
      annotation (
        defaultComponentName="emf",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-90,51},{-40,-50}},
              lineColor={0,0,0},
              fillColor={135,135,135},
              fillPattern=FillPattern.HorizontalCylinder),
            Rectangle(
              extent={{-21,20},{90,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,80},{148,44}},
              lineColor={160,160,164},
              textString="k=%k"),
            Line(points={{-30,49},{-30,80},{0,80},{0,91}}, color={0,0,255}),
            Line(points={{20,-49},{20,-80},{0,-80},{0,-89},{0,-90}}, color={0,0,
                  255}),
            Ellipse(extent={{-21,50},{9,-50}}, lineColor={0,0,255}),
            Ellipse(extent={{2,50},{32,-50}}, lineColor={0,0,255}),
            Ellipse(extent={{-43,50},{-13,-50}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-4,20},{-1,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{7,20},{10,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-14,20},{-11,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{19,20},{44,-20}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Line(
              visible=not useSupport,
              points={{-100,-70},{-40,-70}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-100,-90},{-80,-70}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-80,-90},{-60,-70}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-60,-90},{-40,-70}},
              color={0,0,0}),
            Line(
              visible=not useSupport,
              points={{-70,-70},{-70,-50}},
              color={0,0,0}),
            Text(
              extent={{0,-50},{199,-90}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-17,95},{-20,85},{-23,95},{-17,95}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{-20,110},{-20,85}},
              color={160,160,164}),Text(
                extent={{-40,110},{-30,90}},
                lineColor={160,160,164},
                textString="i"),Line(points={{9,75},{19,75}}, color={192,192,192}),
              Line(points={{-20,-110},{-20,-85}}, color={160,160,164}),Polygon(
                points={{-17,-100},{-20,-110},{-23,-100},{-17,-100}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Text(
                extent={{-40,-110},{-30,-90}},
                lineColor={160,160,164},
                textString="i"),Line(points={{8,-79},{18,-79}}, color={192,192,
              192}),Line(points={{14,80},{14,70}}, color={192,192,192}),Polygon(
                points={{140,3},{150,0},{140,-3},{140,3},{140,3}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>EMF transforms electrical energy into translational mechanical energy. It is used as basic building block of an electrical linear motor. The mechanical connector flange can be connected to elements of the Modelica.Mechanics.Translational library. flange.f is the cut-force, flange.s is the distance at the translational connection.</p>
</html>",   revisions="<html>
<dl>
<dt>2009</dt>
<dd>by Anton Haumer<br> initially implemented</dd>
</dl>
</html>"));
    end TranslationalEMF;

    model VCV "Linear voltage-controlled voltage source"
      extends Interfaces.TwoPort;
      parameter Real gain(start=1) "Voltage gain";

    equation
      v2 = v1*gain;
      i1 = 0;
      annotation (
        Documentation(info="<html>
<p>The linear voltage-controlled voltage source is a TwoPort. The right port voltage v2 is controlled by the left port voltage v1 via</p>
<pre>    v2 = v1 * gain. </pre>
<p>The left port current is zero. Any voltage gain can be chosen.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,70},{70,-70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-30,50}}, color={0,0,255}),
            Line(points={{-30,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{100,50},{30,50},{30,-50},{100,-50}}, color={0,0,255}),
            Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),
            Line(points={{-20,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,60},{10,63},{10,57},{20,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-148,-81},{152,-121}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,50},{-31,50}}, color={0,0,
              255}),Line(points={{-30,-50},{-96,-50}}, color={0,0,255}),Line(
              points={{96,50},{30,50},{30,-50},{96,-50}}, color={0,0,255}),
              Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),Rectangle(
              extent={{-70,70},{70,-70}}, lineColor={0,0,255}),Line(points={{-20,
              60},{20,60}}, color={0,0,255}),Polygon(
                points={{20,60},{10,63},{10,57},{20,60}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255})}));
    end VCV;

    model VCC "Linear voltage-controlled current source"
      extends Interfaces.TwoPort;
      parameter Modelica_SIunits.Conductance transConductance(start=1)
        "Transconductance";
    equation
      i2 = v1*transConductance;
      i1 = 0;
      annotation (
        Documentation(info="<html>
<p>The linear voltage-controlled current source is a TwoPort. The right port current i2 is controlled by the left port voltage v1 via</p>
<pre>    i2 = v1 * transConductance. </pre>
<p>The left port current is zero. Any transConductance can be chosen.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,70},{70,-70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-30,50}}, color={0,0,255}),
            Line(points={{-30,-50},{-90,-50}}, color={0,0,255}),
            Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),
            Line(points={{-20,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,60},{10,63},{10,57},{20,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{90,50},{30,50},{30,20}}, color={0,0,255}),
            Line(points={{91,-50},{30,-50},{30,-20}}, color={0,0,255}),
            Line(points={{10,0},{50,0}}, color={0,0,255}),
            Text(
              extent={{-143,-82},{157,-122}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,50},{-30,50}}, color={0,0,
              255}),Line(points={{-30,-50},{-96,-50}}, color={0,0,255}),Ellipse(
              extent={{10,20},{50,-20}}, lineColor={0,0,255}),Rectangle(extent={{
              -70,70},{70,-70}}, lineColor={0,0,255}),Line(points={{-20,60},{20,
              60}}, color={0,0,255}),Polygon(
                points={{20,60},{10,63},{10,57},{20,60}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{96,50},{30,50},{30,20}}, color=
               {0,0,255}),Line(points={{96,-50},{30,-50},{30,-20}}, color={0,0,
              255}),Line(points={{10,0},{50,0}}, color={0,0,255})}));
    end VCC;

    model CCV "Linear current-controlled voltage source"
      extends Interfaces.TwoPort;

      parameter Modelica_SIunits.Resistance transResistance(start=1)
        "Transresistance";

    equation
      v2 = i1*transResistance;
      v1 = 0;
      annotation (
        Documentation(info="<html>
<p>The linear current-controlled voltage source is a TwoPort. The right port voltage v2 is controlled by the left port current i1 via</p>
<pre>    v2 = i1 * transResistance. </pre>
<p>The left port voltage is zero. Any transResistance can be chosen.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,70},{70,-70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{100,50},{30,50},{30,-50},{100,-50}}, color={0,0,255}),
            Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),
            Line(points={{-20,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,60},{10,63},{10,57},{20,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-20,50},{-20,-50},{-90,-50}}, color={0,0,255}),
            Text(
              extent={{-140,-82},{160,-122}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{10,20},{50,-20}},
              lineColor={0,0,255}),Rectangle(extent={{-70,70},{70,-70}},
              lineColor={0,0,255}),Line(points={{-20,60},{20,60}}, color={0,0,255}),
              Polygon(
                points={{20,60},{10,63},{10,57},{20,60}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{96,50},{30,50},{30,-50},{96,-50}},
              color={0,0,255}),Line(points={{-96,50},{-30,50},{-30,-50},{-96,-50}},
              color={0,0,255})}));
    end CCV;

    model CCC "Linear current-controlled current source"
      extends Interfaces.TwoPort;
      parameter Real gain(start=1) "Current gain";

    equation
      i2 = i1*gain;
      v1 = 0;
      annotation (
        Documentation(info="<html>
<p>The linear current-controlled current source is a TwoPort. The right port current i2 is controlled by the left port current i1 via</p>
<pre>    i2 = i1 * gain. </pre>
<p>The left port voltage is zero. Any current gain can be chosen.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,70},{70,-70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-100,50},{-30,50},{-30,-50},{-100,-50}}, color={0,0,255}),
            Ellipse(extent={{10,20},{50,-20}}, lineColor={0,0,255}),
            Line(points={{-20,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,60},{10,63},{10,57},{20,60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{90,50},{30,50},{30,20}}, color={0,0,255}),
            Line(points={{91,-50},{30,-50},{30,-20}}, color={0,0,255}),
            Line(points={{10,0},{50,0}}, color={0,0,255}),
            Text(
              extent={{-146,-76},{154,-116}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{10,20},{50,-20}},
              lineColor={0,0,255}),Rectangle(extent={{-70,70},{70,-70}},
              lineColor={0,0,255}),Line(points={{-20,60},{20,60}}, color={0,0,255}),
              Polygon(
                points={{20,60},{10,63},{10,57},{20,60}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{96,50},{30,50},{30,20}}, color=
               {0,0,255}),Line(points={{96,-50},{30,-50},{30,-20}}, color={0,0,
              255}),Line(points={{10,0},{50,0}}, color={0,0,255}),Line(points={{-96,
              50},{-30,50},{-30,-50},{-96,-50}}, color={0,0,255})}));
    end CCC;

    model OpAmp "Simple nonideal model of an OpAmp with limitation"
      parameter Real Slope(start=10000)
        "Slope of the out.v/vin characteristic at vin=0";
      Modelica_Electrical_Analog.Interfaces.PositivePin in_p
        "Positive pin of the input port" annotation (Placement(transformation(
              extent={{-110,-60},{-90,-40}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin in_n
        "Negative pin of the input port" annotation (Placement(transformation(
              extent={{-90,40},{-110,60}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.PositivePin out "Output pin"
        annotation (Placement(transformation(extent={{110,-10},{90,10}},
              rotation=0)));
      Modelica_Electrical_Analog.Interfaces.PositivePin VMax
        "Positive output voltage limitation" annotation (Placement(
            transformation(extent={{-10,60},{10,80}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin VMin
        "Negative output voltage limitation" annotation (Placement(
            transformation(extent={{-10,-80},{10,-60}}, rotation=0)));
      Modelica_SIunits.Voltage vin "input voltage";
    protected
      Real f "auxiliary variable";
      Real absSlope;
    equation
      in_p.i = 0;
      in_n.i = 0;
      VMax.i = 0;
      VMin.i = 0;
      vin = in_p.v - in_n.v;
      f = 2/(VMax.v - VMin.v);
      absSlope = if (Slope < 0) then -Slope else Slope;
      out.v = (VMax.v + VMin.v)/2 + absSlope*vin/(1 + absSlope*smooth(0, (if (f*
        vin < 0) then -f*vin else f*vin)));
      annotation (
        Documentation(info="<html>
<p>The OpAmp is a simple nonideal model with a smooth out.v = f(vin) characteristic, where &quot;vin = in_p.v - in_n.v&quot;. The characteristic is limited by VMax.v and VMin.v. Its slope at vin=0 is the parameter Slope, which must be positive. (Therefore, the absolute value of Slope is taken into calculation.)</p>
</html>",   revisions="<html>
<ul>
<li><i> 2000   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-45,-10},{-20,-10},{-14,-9},{-11,-7},{-9,7},{-6,9},{0,
                  10},{20,10}}, color={0,0,255}),
            Line(points={{0,35},{0,80}}, color={0,0,255}),
            Line(points={{0,-35},{0,-80}}, color={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-149,138},{151,98}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{60,0},{-60,70},{-60,-70},{60,0}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{-45,-10},{-20,-10},{-14,-9},{-11,
              -7},{-9,7},{-6,9},{0,10},{20,10}}, color={0,0,255}),Line(points={{0,
              35},{0,70}}, color={0,0,255}),Line(points={{0,-35},{0,-70}}, color=
              {0,0,255}),Line(points={{-96,50},{-60,50}}, color={0,0,255}),Line(
              points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(points={{60,0},
              {96,0}}, color={0,0,255}),Line(points={{-55,50},{-45,50}}, color={0,
              0,255}),Line(points={{-50,-45},{-50,-55}}, color={0,0,255}),Line(
              points={{-55,-50},{-45,-50}}, color={0,0,255}),Text(
                extent={{-112,-93},{-91,-73}},
                lineColor={160,160,164},
                textString="in_p.i=0"),Polygon(
                points={{120,3},{110,0},{120,-3},{120,3}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Line(points={{111,0},{136,0}}, color={0,
              0,0}),Text(
                extent={{118,2},{135,17}},
                lineColor={0,0,0},
                textString="i2"),Text(
                extent={{-111,60},{-85,80}},
                lineColor={160,160,164},
                textString="in_n.i=0"),Line(
                points={{-100,-35},{-100,23},{-100,24}},
                color={160,160,164},
                arrow={Arrow.None,Arrow.Filled}),Text(
                extent={{-97,-16},{-74,4}},
                lineColor={160,160,164},
                textString="vin")}));
    end OpAmp;

    model OpAmpDetailed "Detailed model of an operational amplifier"
      // literature: Conelly, J.A.; Choi, P.: Macromodelling with SPICE. Englewood Cliffs: Prentice-Hall, 1992
      parameter Modelica_SIunits.Resistance Rdm=2.0e6
        "Input resistance (differential input mode)";
      parameter Modelica_SIunits.Resistance Rcm=2.0e9
        "Input resistance (common mode)";
      parameter Modelica_SIunits.Capacitance Cin=1.4e-12 "Input capacitance";
      parameter Modelica_SIunits.Voltage Vos=1.0e-3 "Input offset voltage";
      parameter Modelica_SIunits.Current Ib=80.0e-9 "Input bias current";
      parameter Modelica_SIunits.Current Ios=20.0e-9 "Input offset current";
      parameter Modelica_SIunits.Voltage vcp=0.0
        "Correction value for limiting by p_supply";
      parameter Modelica_SIunits.Voltage vcm=0.0
        "Correction value for limiting by msupply";
      parameter Real Avd0=106.0 "Differential amplifier [dB]";
      parameter Real CMRR=90.0 "Common-mode rejection [dB]";
      parameter Modelica_SIunits.Frequency fp1=5.0 "Dominant pole";
      parameter Modelica_SIunits.Frequency fp2=2.0e6 "Pole frequency";
      parameter Modelica_SIunits.Frequency fp3=20.0e6 "Pole frequency";
      parameter Modelica_SIunits.Frequency fp4=100.0e6 "Pole frequency";
      parameter Modelica_SIunits.Frequency fz=5.0e6 "Zero frequency";
      parameter Modelica_SIunits.VoltageSlope sr_p=0.5e6
        "Slew rate for increase";
      parameter Modelica_SIunits.VoltageSlope sr_m=0.5e6
        "Slew rate for decrease";
      parameter Modelica_SIunits.Resistance Rout=75.0 "Output resistance";
      parameter Modelica_SIunits.Current Imaxso=25.0e-3
        "Maximal output current (source current)";
      parameter Modelica_SIunits.Current Imaxsi=25.0e-3
        "Maximal output current (sink current)";

      // number of intervals: 2500, stop time: 0.003
      parameter Modelica_SIunits.Time Ts=0.0000012 "sampling time";

      // constant expressions
      constant Real Pi=3.141592654;

      // power supply
      final parameter Modelica_SIunits.Voltage vcp_abs=abs(vcp)
        "Positive correction value for limiting by p_supply";
      final parameter Modelica_SIunits.Voltage vcm_abs=abs(vcm)
        "Positive correction value for limiting by msupply";

      // input stage
      //  Ib = 0.5*(I1 + I2);
      //  Ios = I1 - I2;
      final parameter Modelica_SIunits.Current I1=Ib + Ios/2.0
        "Current of internal source I1";
      final parameter Modelica_SIunits.Current I2=Ib - Ios/2.0
        "Current of internal source I2";

      // gain stage (difference and common mode)
      final parameter Real Avd0_val=10.0^(Avd0/20.0) "differential mode gain";
      final parameter Real Avcm_val=(Avd0_val/(10.0^(CMRR/20.0)))/2.0
        "common mode gain";

      // slew rate stage
      final parameter Modelica_SIunits.VoltageSlope sr_p_val=abs(sr_p)
        "Value of slew rate for increase";
      final parameter Modelica_SIunits.VoltageSlope sr_m_val=-abs(sr_m)
        "Negative alue of slew rate for increase";

      // output stage
      final parameter Modelica_SIunits.Current Imaxso_val=abs(Imaxso)
        "Orientation out outp";
      final parameter Modelica_SIunits.Current Imaxsi_val=abs(Imaxsi)
        "Orientation into outp";

      Modelica_Electrical_Analog.Interfaces.PositivePin p
        "Positive pin of the input port" annotation (Placement(transformation(
              extent={{-111,-61},{-90,-40}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin m
        "Negative pin of the input port" annotation (Placement(transformation(
              extent={{-90,40},{-111,61}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.PositivePin outp "Output pin"
        annotation (Placement(transformation(extent={{110,-10},{90,10}},
              rotation=0)));
      Modelica_Electrical_Analog.Interfaces.PositivePin p_supply
        "Positive output voltage limitation" annotation (Placement(
            transformation(extent={{-8,65},{9,82}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin m_supply
        "Negative output voltage limitation" annotation (Placement(
            transformation(extent={{-9,-83},{9,-65}}, rotation=0)));

      // power supply
      Modelica_SIunits.Voltage v_pos;
      Modelica_SIunits.Voltage v_neg;

      // input stage
      Modelica_SIunits.Voltage v_vos;
      Modelica_SIunits.Voltage v_3;
      Modelica_SIunits.Voltage v_in;
      Modelica_SIunits.Voltage v_4;

      Modelica_SIunits.Current i_vos;
      Modelica_SIunits.Current i_3;
      Modelica_SIunits.Current i_r2;
      Modelica_SIunits.Current i_c3;
      Modelica_SIunits.Current i_4;

      // frequency response
      Real q_fr1;
      Real q_fr2;
      Real q_fr3;

      // gain stage
      Modelica_SIunits.Voltage q_sum;
      Modelica_SIunits.Voltage q_sum_help;
      Modelica_SIunits.Voltage q_fp1;

      // slew rate stage
      Modelica_SIunits.Voltage v_source;

      Modelica_SIunits.Voltage x "auxiliary variable for slew rate";

      // output stage
      Modelica_SIunits.Voltage v_out;

      Modelica_SIunits.Current i_out;

      // functions
      function FCNiout_limit "Internal limitation function"
        extends Modelica_Icons.Function;
        input Modelica_SIunits.Voltage v_source;
        input Modelica_SIunits.Voltage v_out;
        input Modelica_SIunits.Resistance Rout;
        input Modelica_SIunits.Current Imaxsi_val;
        input Modelica_SIunits.Current Imaxso_val;
        output Modelica_SIunits.Current result;

      algorithm
        if v_out > v_source + Rout*Imaxsi_val then
          result := Imaxsi_val;
        elseif v_out < v_source - Rout*Imaxso_val then
          result := -Imaxso_val;
        else
          result := (v_out - v_source)/Rout;
        end if;
        return;
        annotation (Documentation(info="<html>
<p>Internal limitation function, designed for OpAmpDetailed, not for purpose of external usage.</p>
</html>"));
      end FCNiout_limit;

      function FCNq_sum_limit "Internal limitation function"
        extends Modelica_Icons.Function;
        input Modelica_SIunits.Voltage q_sum;
        input Modelica_SIunits.Voltage q_sum_ltf;
        input Modelica_SIunits.Voltage v_pos;
        input Modelica_SIunits.Voltage v_neg;
        input Modelica_SIunits.Voltage vcp;
        input Modelica_SIunits.Voltage vcm;
        output Modelica_SIunits.Voltage result;

      algorithm
        if q_sum > v_pos - vcp and q_sum_ltf >= v_pos - vcp then
          result := v_pos - vcp;
        elseif q_sum < v_neg + vcm and q_sum_ltf <= v_neg + vcm then
          result := v_neg + vcm;
        else
          result := q_sum;
        end if;
        return;
        annotation (Documentation(info="<html>
<p>Internal limitation function, designed for OpAmpDetailed, not for purpose of external usage.</p>
</html>"));
      end FCNq_sum_limit;

    initial equation
      v_source = q_fp1;
      x = 0;
    equation
      assert(Rout > 0.0, "Rout must be > 0.0.");

      // power supply
      v_pos = p_supply.v;
      v_neg = m_supply.v;

      // input stage
      p.i = i_vos;
      m.i = i_4 - i_r2 - i_c3;
      0 = i_3 + i_r2 + i_c3 - i_vos;
      p.v - m.v = v_vos + v_in;
      v_4 = m.v;
      v_3 = p.v - v_vos;
      v_vos = Vos;
      i_3 = I1 + v_3/Rcm;
      v_in = Rdm*i_r2;
      i_c3 = Cin*der(v_in);
      i_4 = I2 + v_4/Rcm;

      // frequency response
      // Laplace transformation
      der(q_fr1) = 2.0*Pi*fp2*(v_in - q_fr1);
      q_fr2 + (1.0/(2.0*Pi*fp3))*der(q_fr2) = q_fr1 + (1.0/(2.0*Pi*fz))*der(q_fr1);
      der(q_fr3) = 2.0*Pi*fp4*(q_fr2 - q_fr3);

      // gain stage
      // Laplace transformation
      q_sum = Avd0_val*q_fr3 + Avcm_val*(v_3 + v_4);
      q_sum_help = FCNq_sum_limit(
          q_sum,
          q_fp1,
          v_pos,
          v_neg,
          vcp_abs,
          vcm_abs);
      der(q_fp1) = 2.0*Pi*fp1*(q_sum_help - q_fp1);

      // slew rate stage
      der(x) = (q_fp1 - v_source)/Ts;
      der(v_source) = smooth(0, noEvent(if der(x) > sr_p_val then sr_p_val else
        if der(x) < sr_m_val then sr_m_val else der(x)));

      // output stage
      v_out = outp.v;
      i_out = outp.i;
      i_out = FCNiout_limit(
          v_source,
          v_out,
          Rout,
          Imaxsi_val,
          Imaxso_val);

      p_supply.i = 0;
      m_supply.i = 0;

      annotation (
        Documentation(info="<html>
<p>The OpAmpDetailed model is a general operational amplifier model. The emphasis is on separating each important data sheet parameter into a sub-circuit independent of the other parameters. The model is broken down into five functional stages <b>input</b>, <b>frequency response</b>, <b>gain</b>, <b>slew rate</b> and an <b>output</b> stage. Each stage contains data sheet parameters to be modeled. This partitioning and the modelling of the separate submodels are based on the description in <b>[CP92]</b>.</p>
<p>Using <b>[CP92]</b> Joachim Haase (Fraunhofer Institute for Integrated Circuits, Design Automation Division) transferred 2001 operational amplifier models into VHDL-AMS. Now one of these models, the model &quot;amp(macro)&quot; was transferred into Modelica.</p>
<dl><dt><b>Reference:</b> </dt>
<dd><b>[CP92]</b> Conelly, J.A.; Choi, P.: Macromodelling with SPICE. Englewood Cliffs: Prentice-Hall, 1992 </dd>
</dl></html>",   revisions="<html>
<dl>
<dt><i>June 17, 2009</i></dt>
<dd>by Susann Wolf initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,35},{0,80}}, color={0,0,255}),
            Line(points={{0,-35},{0,-80}}, color={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-151,141},{149,101}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{60,0},{-60,70},{-60,-70},{60,0}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{0,35},{0,70}}, color={0,0,255}),
              Line(points={{0,-35},{0,-70}}, color={0,0,255}),Line(points={{-96,
              50},{-60,50}}, color={0,0,255}),Line(points={{-96,-50},{-60,-50}},
              color={0,0,255}),Line(points={{60,0},{96,0}}, color={0,0,255}),Line(
              points={{-55,50},{-45,50}}, color={0,0,255}),Line(points={{-50,-45},
              {-50,-55}}, color={0,0,255}),Line(points={{-55,-50},{-45,-50}},
              color={0,0,255}),Polygon(
                points={{120,3},{110,0},{120,-3},{120,3}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Line(points={{111,0},{136,0}}, color={0,
              0,0}),Text(
                extent={{114,2},{131,17}},
                lineColor={0,0,0},
                textString="i2"),Line(
                points={{-100,-35},{-100,23},{-100,24}},
                color={160,160,164},
                arrow={Arrow.None,Arrow.Filled}),Text(
                extent={{-97,-16},{-74,4}},
                lineColor={160,160,164},
                textString="vin")}));
    end OpAmpDetailed;

    model VariableResistor
      "Ideal linear electrical resistor with variable resistance"
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
      Modelica_SIunits.Resistance R_actual
        "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";
      Modelica_Blocks.Interfaces.RealInput R(unit="Ohm") annotation (Placement(
            transformation(
            origin={0,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      R_actual = R*(1 + alpha*(T_heatPort - T_ref));
      v = R_actual*i;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The linear resistor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i*R = v</b></i>
<br>The Resistance <i>R</i> is given as input signal.
<br><br><b>Attention!!!</b><br>It is recommended that the R signal should not cross the zero value. Otherwise depending on the surrounding circuit the probability of singularities is high.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,30}}, color={0,0,255}),
            Text(
              extent={{-148,-41},{152,-81}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,0},{-70,0}},
              color={0,0,255}),Line(points={{0,90},{0,30}}, color={0,0,255}),Line(
              points={{70,0},{96,0}}, color={0,0,255})}));
    end VariableResistor;

    model VariableConductor
      "Ideal linear electrical conductor with variable conductance"
      parameter Modelica_SIunits.Temperature T_ref=300.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of conductance (G_actual = G/(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
      Modelica_SIunits.Conductance G_actual
        "Actual conductance = G/(1 + alpha*(T_heatPort - T_ref))";
      Modelica_Blocks.Interfaces.RealInput G(unit="S") annotation (Placement(
            transformation(
            origin={0,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    equation
      assert((1 + alpha*(T_heatPort - T_ref)) >=Modelica_Constants.eps,
        "Temperature outside scope of model!");
      G_actual = G/(1 + alpha*(T_heatPort - T_ref));
      i = G_actual*v;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The linear conductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i = G*v</b></i>
<br>The Conductance <i>G</i> is given as input signal.
<br><br><b>Attention!!!</b>
<br>It is recommended that the G signal should not cross the zero value. Otherwise depending on the surrounding circuit the probability of singularities is high.</p>
</html>",   revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of conductance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{-70,0}}, color={0,0,255}),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,30}}, color={0,0,255}),
            Text(
              extent={{-148,-41},{152,-81}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,90},{0,30}}, color={0,0,255}),
              Line(points={{-96,0},{-70,0}}, color={0,0,255}),Line(points={{70,0},
              {96,0}}, color={0,0,255}),Rectangle(
                extent={{-70,30},{70,-30}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
    end VariableConductor;

    model VariableCapacitor
      "Ideal linear electrical capacitor with variable capacitance"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      Modelica_Blocks.Interfaces.RealInput C(unit="F") annotation (Placement(
            transformation(
            origin={0,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      parameter Modelica_SIunits.Capacitance Cmin=Modelica_Constants.eps
        "lower bound for variable capacitance";
      Modelica_SIunits.ElectricCharge Q;
      parameter Modelica_SIunits.Voltage IC=0 "Initial Value";
      parameter Boolean UIC=false;
    initial equation
      if UIC then
        v = IC;
      end if;
    equation
      assert(C >= 0, "Capacitance C (= " + String(C) + ") has to be >= 0!");
      // protect solver from index change
      Q = noEvent(max(C, Cmin))*v;
      i = der(Q);
      annotation (
        Documentation(info="<html>
<p>The linear capacitor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>i = dQ/dt</b></i> with <i><b>Q = C * v</b></i>.
<br>The capacitance <i>C</i> is given as input signal.
It is required that C &ge; 0, otherwise an assertion is raised. To avoid a variable index system,
C = Cmin, if 0 &le; C &lt; Cmin, where Cmin is a parameter with default value Modelica.Constants.eps.</p>
<p><br/>Besides the Cmin parameter the capacitor model has got the two parameters IC and UIC that belong together. With the IC parameter the user can specify an initial value of the voltage over the capacitor, which is defined from positive pin p to negative pin n (v=p.v - n.v).</p>
<p><br/>Hence the capacitor is charged at the beginning of the simulation. The other parameter UIC is of type Boolean. If UIC is true, the simulation tool uses</p>
<p><br/>the IC value at the initial calculation by adding the equation v= IC. If UIC is false, the IC value can be used (but it does not need to!) to calculate the initial values in order to simplify the numerical algorithms of initial calculation.</p>
</html>",   revisions="<html>
<ul>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}),graphics={
            Line(points={{-90,0},{-6,0}}, color={0,0,255}),
            Line(points={{6,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,30}}, color={0,0,255}),
            Line(points={{-6,28},{-6,-28}}, color={0,0,255}),
            Line(points={{6,28},{6,-28}}, color={0,0,255}),
            Text(
              extent={{-144,-43},{156,-83}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,0},{-14,0}}, color={0,0,
              255}),Line(points={{14,0},{96,0}}, color={0,0,255}),Line(points={{0,
              90},{0,30}}, color={0,0,255}),Line(
                points={{-14,28},{-14,-28}},
                thickness=0.5,
                color={0,0,255}),Line(
                points={{14,28},{14,-28}},
                thickness=0.5,
                color={0,0,255})}));
    end VariableCapacitor;

    model VariableInductor
      "Ideal linear electrical inductor with variable inductance"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      Modelica_Blocks.Interfaces.RealInput L(unit="H") annotation (Placement(
            transformation(
            origin={0,108},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica_SIunits.MagneticFlux Psi;
      parameter Modelica_SIunits.Inductance Lmin=Modelica_Constants.eps
        "lower bound for variable inductance";
      parameter Modelica_SIunits.Current IC=0 "Initial Value";
      parameter Boolean UIC=false;
    initial equation
      if UIC then
        i = IC;
      end if;
    equation
      assert(L >= 0, "Inductance L_ (= " + String(L) + ") has to be >= 0!");
      // protect solver from index change
      Psi = noEvent(max(L, Lmin))*i;
      v = der(Psi);
      annotation (
        Documentation(info="<html>
<p>The linear inductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by
<br><i><b>v = d Psi/dt </b></i>with <i><b>Psi = L * i </b></i>.
<br>The inductance <i>L</i> is as input signal.
It is required that L &ge; 0, otherwise an assertion is raised. To avoid a variable index system, L = Lmin, if 0 &le; L &lt; Lmin, where Lmin is a parameter with default value Modelica.Constants.eps.</p>
<p>Besides the Lmin parameter the inductor model has got the two parameters IC and UIC that belong together. With the IC parameter the user can specify an initial value of the current that flows through the inductor.</p>
<p><br/>Hence the inductor has an initial current at the beginning of the simulation. The other parameter UIC is of type Boolean. If UIC is true, the simulation tool uses</p>
<p><br/>the IC value at the initial calculation by adding the equation i= IC. If UIC is false, the IC value can be used (but it does not need to!) to calculate the initial values in order to simplify the numerical algorithms of initial calculation.</p>
</html>",   revisions="<html>
<ul>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}),graphics={
            Line(points={{-90,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,8}}, color={0,0,255}),
            Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
            Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
            Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-60,-30},{60,0}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-146,-47},{154,-87}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,0},{-60,0}}, color={0,0,
              255}),Line(points={{0,90},{0,8}}, color={0,0,255}),Ellipse(extent={
              {-60,-15},{-30,15}}, lineColor={0,0,255}),Ellipse(extent={{-30,-15},
              {0,15}}, lineColor={0,0,255}),Ellipse(extent={{0,-15},{30,15}},
              lineColor={0,0,255}),Ellipse(extent={{30,-15},{60,15}}, lineColor={
              0,0,255}),Rectangle(
                extent={{-60,-30},{62,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{60,0},{96,0}}, color=
               {0,0,255})}));
    end VariableInductor;

    model Potentiometer "Adjustable resistor"
      parameter Modelica_SIunits.Resistance R(start=1)
        "Resistance at temperature T_ref";
      parameter Modelica_SIunits.Temperature T_ref=293.15
        "Reference temperature";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=T_ref);
      parameter Boolean useRinput=false "use input for 0<r<1 (else constant)"
        annotation (
        Evaluate=true,
        HideResult=true,
        Dialog(group="potentiometer"));
      parameter Real rConstant(
        final min=0,
        final max=1) = 0.5 "Contact between n (r=0) and p (r=1)"
        annotation (Dialog(group="potentiometer", enable=not useRinput));
      Modelica_SIunits.Resistance Rp
        "Actual resistance between pin_p and contact";
      Modelica_SIunits.Resistance Rn
        "Actual resistance between contact and pin_n";
      Modelica_Electrical_Analog.Interfaces.PositivePin pin_p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica_Electrical_Analog.Interfaces.PositivePin contact annotation (
          Placement(transformation(extent={{90,-110},{110,-90}}),
            iconTransformation(extent={{90,-110},{110,-90}})));
      Modelica_Electrical_Analog.Interfaces.NegativePin pin_n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica_Blocks.Interfaces.RealInput r if useRinput annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-100,-110})));
    protected
      Modelica_Blocks.Sources.Constant rConst(final k=rConstant) if not useRinput
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-90,-50})));
      Modelica_Blocks.Interfaces.RealInput rInt
        annotation (Placement(transformation(extent={{-84,-84},{-76,-76}})));
    equation
      pin_p.i + pin_n.i + contact.i = 0;
      Rp = R*(1 + alpha*(T_heatPort - T_ref))*(1 - min(1, max(0, rInt)));
      Rn = R*(1 + alpha*(T_heatPort - T_ref))*min(1, max(0, rInt));
      pin_p.v - contact.v = Rp*pin_p.i;
      pin_n.v - contact.v = Rn*pin_n.i;
      LossPower = (pin_p.v - contact.v)*pin_p.i + (pin_n.v - contact.v)*pin_n.i;
      connect(rInt, r) annotation (Line(
          points={{-80,-80},{-100,-80},{-100,-110}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rInt, rConst.y) annotation (Line(
          points={{-80,-80},{-90,-80},{-90,-61}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Text(
              extent={{-100,80},{100,60}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-90,0},{-70,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{70,0},{90,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-30}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Line(
              points={{0,40},{0,-40},{100,-80},{100,-90}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              visible=useRinput,
              points={{-100,-90},{-100,-80},{0,-40}},
              color={0,0,255},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Line(
              visible=useHeatPort,
              points={{0,-90},{0,-40}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Polygon(
              points={{0,-30},{-4,-40},{4,-40},{0,-30}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
                       <p>This models a potentiometer where the sliding contact is placed  between pin_n (r = 0) and pin_p (r = 1), dependent on either the parameter rConstant or the signal input r. </p>
                       <p>The total resistance R is temperature dependent.</p>
                       </html>"));
    end Potentiometer;
    annotation (Documentation(info="<html>
<p>This package contains very basic analog electrical components such as resistor, conductor, condensator, inductor, and the ground (which is needed in each electrical circuit description. Furthermore, controlled sources, coupling components, and some improved (but nevertheless basic) are in this package.</p>
</html>",   revisions="<html>
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
</html>"),   Icon(graphics={
          Line(points={{-12,60},{-12,-60}}, color={0,0,0}),
          Line(points={{-80,0},{-12,0}}, color={0,0,0}),
          Line(points={{12,60},{12,-60}}, color={0,0,0}),
          Line(points={{12,0},{80,0}}, color={0,0,0})}));
  end Basic;

  package Ideal
    "Ideal electrical elements such as switches, diode, transformer, operational amplifier"

    extends Modelica_Icons.Package;

    model IdealDiode "Ideal diode"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Forward state-on differential resistance (closed diode resistance)";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Backward state-off conductance (opened diode conductance)";
      parameter Modelica_SIunits.Voltage Vknee(final min=0) = 0
        "Forward threshold voltage";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort;
      Boolean off(start=true) "Switching state";
    protected
      Real s(start=0, final unit="1")
        "Auxiliary variable for actual position on the ideal diode characteristic";
      /* s = 0: knee point
     s < 0: below knee point, diode conducting
     s > 0: above knee point, diode locking */
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      off = s < 0;
      v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
      i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;

      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<P>
This is an ideal switch which is<br><br>
<b>open </b>(off), if it is reversed biased (voltage drop less than 0)<br>
<b>closed</b> (on), if it is conducting (current > 0).<br>
<br/>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero conductance is not possible.
In order to prevent singularities during switching, the opened
diode has a small conductance <i>Gon</i> and the closed diode has a low
resistance <i>Roff</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Gon</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled.
</p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-156,101},{144,61}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,
              128,128}),Polygon(
                points={{70,4},{80,0},{70,-4},{70,4}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Line(points={{0,80},{0,-80}},
              color={128,128,128}),Polygon(
                points={{-4,70},{0,80},{4,70},{-4,70}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Text(
                extent={{10,80},{20,70}},
                lineColor={128,128,128},
                textString="i"),Text(
                extent={{70,-10},{80,-20}},
                lineColor={128,128,128},
                textString="v"),Line(
                points={{-80,-40},{-20,-10},{20,10},{40,70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{20,9},{20,0}},
                color={128,128,128},
                pattern=LinePattern.Dot),Text(
                extent={{20,0},{40,-10}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Vknee"),Text(
                extent={{20,70},{40,60}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Ron"),Text(
                extent={{-20,10},{0,0}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Goff"),Ellipse(
                extent={{18,12},{22,8}},
                pattern=LinePattern.Dot,
                lineColor={0,0,255})}));
    end IdealDiode;

    model IdealThyristor "Ideal thyristor"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed thyristor resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened thyristor conductance";
      parameter Modelica_SIunits.Voltage Vknee(final min=0) = 0
        "Forward threshold voltage";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Boolean off(start=true) "Switching state";
      Modelica_Blocks.Interfaces.BooleanInput fire annotation (Placement(
            transformation(
            origin={70,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s(final unit="1")
        "Auxiliary variable: if on then current, if opened then voltage";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      off = s < 0 or pre(off) and not fire;
      v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
      i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>This is an ideal thyristor model which is<br><br>
<b>open </b>(off), if the voltage drop is less than 0 or both the thyristor already open (off = true) and fire is false<br>
<b>closed</b> (not off), if both the voltage drop is greater or equal 0 and either the thyristor was already closed (off=false) or fire is true.
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero conductance is not possible.
In order to prevent singularities during switching, the opened
thyristor has a small conductance <i>Goff</i> and the closed thyristor has a low
resistance <i>Ron</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Goff</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Text(
              extent={{-150,-47},{150,-87}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Line(points={{30,20},{70,60},{70,90}}, color={0,0,255}),
            Line(points={{40,50},{60,30}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,
              128,128}),Polygon(
                points={{70,4},{80,0},{70,-4},{70,4}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Line(points={{0,80},{0,-80}},
              color={128,128,128}),Polygon(
                points={{-4,70},{0,80},{4,70},{-4,70}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Text(
                extent={{10,80},{20,70}},
                lineColor={128,128,128},
                textString="i"),Text(
                extent={{70,-10},{80,-20}},
                lineColor={128,128,128},
                textString="v"),Line(
                points={{-80,-40},{-20,-10},{20,10},{40,70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{20,9},{20,0}},
                color={128,128,128},
                pattern=LinePattern.Dot),Text(
                extent={{20,0},{40,-10}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Vknee"),Text(
                extent={{20,70},{40,60}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Ron"),Text(
                extent={{-20,10},{0,0}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Goff"),Ellipse(
                extent={{18,12},{22,8}},
                pattern=LinePattern.Dot,
                lineColor={0,0,255}),Line(
                points={{20,10},{70,40}},
                color={0,0,0},
                thickness=0.5)}));
    end IdealThyristor;

    model IdealGTOThyristor "Ideal GTO thyristor"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed thyristor resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened thyristor conductance";
      parameter Modelica_SIunits.Voltage Vknee(final min=0) = 0
        "Forward threshold voltage";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Boolean off(start=true) "Switching state";
      Modelica_Blocks.Interfaces.BooleanInput fire annotation (Placement(
            transformation(
            origin={70,110},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s(final unit="1")
        "Auxiliary variable: if on then current, if opened then voltage";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      off = s < 0 or not fire;
      v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
      i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>This is an ideal GTO thyristor model which is<br><br>
<b>open </b>(off), if the voltage drop is less than 0 or fire is false<br>
<b>closed</b> (not off), if the voltage drop is greater or equal 0  and fire is true.
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero conductance is not possible.
In order to prevent singularities during switching, the opened
thyristor has a small conductance <i>Goff</i> and the closed thyristor has a low
resistance <i>Ron</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Goff</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Line(points={{30,10},{70,50},{70,90}}, color={0,0,255}),
            Line(points={{50,50},{70,30}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-149,-43},{151,-83}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              points={{30,22},{70,62}},
              color={0,0,255},
              smooth=Smooth.None),
            Polygon(
              points={{44,43},{44,36},{51,36},{44,43}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Polygon(
              points={{46,33},{53,33},{53,26},{46,33}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Text(
              extent={{0,62},{0,34}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="GTO")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,
              128,128}),Polygon(
                points={{70,4},{80,0},{70,-4},{70,4}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Line(points={{0,80},{0,-80}},
              color={128,128,128}),Polygon(
                points={{-4,70},{0,80},{4,70},{-4,70}},
                lineColor={128,128,128},
                fillColor={128,128,128},
                fillPattern=FillPattern.Solid),Text(
                extent={{10,80},{20,70}},
                lineColor={128,128,128},
                textString="i"),Text(
                extent={{70,-10},{80,-20}},
                lineColor={128,128,128},
                textString="v"),Line(
                points={{-80,-40},{-20,-10},{20,10},{40,70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{20,9},{20,0}},
                color={128,128,128},
                pattern=LinePattern.Dot),Text(
                extent={{20,0},{40,-10}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Vknee"),Text(
                extent={{20,70},{40,60}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Ron"),Text(
                extent={{-20,10},{0,0}},
                lineColor={128,128,128},
                pattern=LinePattern.Dot,
                textString="Goff"),Ellipse(
                extent={{18,12},{22,8}},
                pattern=LinePattern.Dot,
                lineColor={0,0,255}),Line(
                points={{20,10},{70,40}},
                color={0,0,0},
                thickness=0.5)}));
    end IdealGTOThyristor;

    model IdealCommutingSwitch "Ideal commuting switch"
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Interfaces.PositivePin p annotation (Placement(transformation(extent={{-110,
                -10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n2 annotation (Placement(transformation(extent={{90,
                -10},{110,10}}, rotation=0)));
      Interfaces.NegativePin n1 annotation (Placement(transformation(extent={{90,
                40},{110,60}}, rotation=0)));
      Modelica_Blocks.Interfaces.BooleanInput control
        "true => p--n2 connected, false => p--n1 connected" annotation (Placement(
            transformation(
            origin={0,80},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s1(final unit="1");
      Real s2(final unit="1") "Auxiliary variables";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      0 = p.i + n2.i + n1.i;

      p.v - n1.v = (s1*unitCurrent)*(if (control) then 1 else Ron);
      n1.i = -(s1*unitVoltage)*(if (control) then Goff else 1);
      p.v - n2.v = (s2*unitCurrent)*(if (control) then Ron else 1);
      n2.i = -(s2*unitVoltage)*(if (control) then 1 else Goff);
      LossPower = p.i*p.v + n1.i*n1.v + n2.i*n2.v;
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
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Text(
              extent={{-80,0},{-60,22}},
              textString="p",
              lineColor={0,0,255}),
            Text(
              extent={{60,50},{80,72}},
              textString="n1",
              lineColor={0,0,255}),
            Text(
              extent={{60,0},{80,22}},
              textString="n2",
              lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,50},{90,50}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-148,-22},{152,-62}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,50},
              {96,50}}, color={0,0,255}),Line(points={{0,60},{0,25}}, color={0,0,
              255}),Line(points={{40,0},{96,0}}, color={0,0,255})}));
    end IdealCommutingSwitch;

    model IdealIntermediateSwitch "Ideal intermediate switch"
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Interfaces.PositivePin p1 annotation (Placement(transformation(extent={{-110,
                40},{-90,60}}, rotation=0)));
      Interfaces.PositivePin p2 annotation (Placement(transformation(extent={{-110,
                -10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n1 annotation (Placement(transformation(extent={{90,
                40},{110,60}}, rotation=0)));
      Interfaces.NegativePin n2 annotation (Placement(transformation(extent={{90,
                -10},{110,10}}, rotation=0)));
      Modelica_Blocks.Interfaces.BooleanInput control
        "true => p1--n2, p2--n1 connected, otherwise p1--n1, p2--n2  connected"
        annotation (Placement(transformation(
            origin={0,80},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s1(final unit="1");
      Real s2(final unit="1");
      Real s3(final unit="1");
      Real s4(final unit="1") "Auxiliary variables";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
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

      LossPower = p1.i*p1.v + p2.i*p2.v + n1.i*n1.v + n2.i*n2.v;
      annotation (
        Documentation(info="<html>
<p>The intermediate switch has four switching contact pins p1, p2, n1, and n2. The switching behaviour is controlled by the input signal control. If control is true, the pin p1 is connected to the pin n2, and the pin p2 is connected to the pin n1. Otherwise,if control is false, the pin p1 is connected to n1, and the pin p2 is connected to n2.</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/IdealIntermediateSwitch1.png\"
     alt=\"IdealIntermediateSwitch1.png\">
</p>

<p>In order to prevent singularities during switching, the opened switch has a (very low) conductance Goff and the closed switch has a (very low) resistance Ron.</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/IdealIntermediateSwitch2.png\"
     alt=\"IdealIntermediateSwitch2.png\">
</p>

<p>The limiting case is also allowed, i.e., the resistance Ron of the closed switch could be exactly zero and the conductance Goff of the open switch could be also exactly zero. Note, there are circuits, where a description with zero Ron or zero Goff is not possible. </p>
<p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled. The parameters are not temperature dependent. </p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-4,30},{4,22}}, lineColor={0,0,255}),
            Text(
              extent={{-80,50},{-60,72}},
              textString="p1",
              lineColor={0,0,255}),
            Text(
              extent={{-80,0},{-60,22}},
              textString="p2",
              lineColor={0,0,255}),
            Text(
              extent={{60,50},{80,72}},
              textString="n1",
              lineColor={0,0,255}),
            Text(
              extent={{60,0},{80,22}},
              textString="n2",
              lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-90,50},{-44,50}}, color={0,0,255}),
            Line(points={{-44,0},{40,50}}, color={0,0,255}),
            Line(points={{-44,50},{40,0}}, color={0,0,255}),
            Line(points={{40,50},{90,50}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-151,-24},{149,-64}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-4,29},{4,21}}, lineColor=
              {0,0,255}),Line(points={{-96,0},{-40,0}}, color={0,0,255}),Line(
              points={{-96,50},{-40,50}}, color={0,0,255}),Line(points={{-40,0},{
              40,50}}, color={0,0,255}),Line(points={{-40,50},{40,0}}, color={0,0,
              255}),Line(points={{40,50},{96,50}}, color={0,0,255}),Line(points={
              {0,60},{0,25}}, color={0,0,255}),Line(points={{40,0},{96,0}}, color=
               {0,0,255})}));
    end IdealIntermediateSwitch;

    model ControlledIdealCommutingSwitch "Controlled ideal commuting switch"
      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Interfaces.PositivePin p annotation (Placement(transformation(extent={{-110,
                -10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n2 annotation (Placement(transformation(extent={{90,
                -10},{110,10}}, rotation=0)));
      Interfaces.NegativePin n1 annotation (Placement(transformation(extent={{90,
                40},{110,60}}, rotation=0)));
      Interfaces.Pin control
        "Control pin: if control.v > level p--n2 connected, otherwise p--n1 connected"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    protected
      Real s1(final unit="1");
      Real s2(final unit="1") "Auxiliary variables";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      control.i = 0;
      0 = p.i + n2.i + n1.i;

      p.v - n1.v = (s1*unitCurrent)*(if (control.v > level) then 1 else Ron);
      n1.i = -(s1*unitVoltage)*(if (control.v > level) then Goff else 1);
      p.v - n2.v = (s2*unitCurrent)*(if (control.v > level) then Ron else 1);
      n2.i = -(s2*unitVoltage)*(if (control.v > level) then 1 else Goff);
      LossPower = p.i*p.v + n1.i*n1.v + n2.i*n2.v;
      annotation (
        Documentation(info="<HTML>
<P>
The commuting switch has a positive pin p and two negative pins n1 and n2.
The switching behaviour is controlled
by the control pin. If its voltage exceeds the value of the parameter level,
the pin p is connected with the negative pin n2. Otherwise, the pin p is
connected the negative pin n1.
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
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Text(
              extent={{-80,0},{-60,22}},
              textString="p",
              lineColor={0,0,255}),
            Text(
              extent={{60,50},{80,72}},
              textString="n1",
              lineColor={0,0,255}),
            Text(
              extent={{60,0},{80,22}},
              textString="n2",
              lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,50},{90,50}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-99},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-145,-21},{155,-61}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,50},
              {96,50}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255}),Line(points={{40,0},{96,0}}, color={0,0,255})}));
    end ControlledIdealCommutingSwitch;

    model ControlledIdealIntermediateSwitch
      "Controlled ideal intermediate switch"
      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Interfaces.PositivePin p1 annotation (Placement(transformation(extent={{-110,
                40},{-90,60}}, rotation=0)));
      Interfaces.PositivePin p2 annotation (Placement(transformation(extent={{-110,
                -10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n1 annotation (Placement(transformation(extent={{90,
                40},{110,60}}, rotation=0)));
      Interfaces.NegativePin n2 annotation (Placement(transformation(extent={{90,
                -10},{110,10}}, rotation=0)));
      Interfaces.Pin control "Control pin: if control.v > level p1--n2, p2--n1 connected,
         otherwise p1--n1, p2--n2  connected"   annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    protected
      Real s1(final unit="1");
      Real s2(final unit="1");
      Real s3(final unit="1");
      Real s4(final unit="1") "Auxiliary variables";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      control.i = 0;

      p1.v - n1.v = (s1*unitCurrent)*(if (control.v > level) then 1 else Ron);
      p2.v - n2.v = (s2*unitCurrent)*(if (control.v > level) then 1 else Ron);
      p1.v - n2.v = (s3*unitCurrent)*(if (control.v > level) then Ron else 1);
      p2.v - n1.v = (s4*unitCurrent)*(if (control.v > level) then Ron else 1);

      p1.i = if control.v > level then s1*unitVoltage*Goff + s3*unitCurrent else
        s1*unitCurrent + s3*unitVoltage*Goff;
      p2.i = if control.v > level then s2*unitVoltage*Goff + s4*unitCurrent else
        s2*unitCurrent + s4*unitVoltage*Goff;
      n1.i = if control.v > level then -s1*unitVoltage*Goff - s4*unitCurrent
         else -s1*unitCurrent - s4*unitVoltage*Goff;
      n2.i = if control.v > level then -s2*unitVoltage*Goff - s3*unitCurrent
         else -s2*unitCurrent - s3*unitVoltage*Goff;

      LossPower = p1.i*p1.v + p2.i*p2.v + n1.i*n1.v + n2.i*n2.v;
      annotation (
        Documentation(info="<html>
<p>The intermediate switch has four switching contact pins p1, p2, n1, and n2. The switching behaviour is controlled by the control pin. If its voltage exceeds the value of the parameter level, the pin p1 is connected to pin n2, and the pin p2 is connected to the pin n1. Otherwise, the pin p1 is connected to the pin n1, and the pin p2 is connected to the pin n2.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/ControlledIdealIntermediateSwitch1.png\"
     alt=\"ControlledIdealIntermediateSwitch1.png\">
</p>

<p>
In order to prevent singularities during switching, the opened switch has a (very low) conductance Goff and the closed switch has a (very low) resistance Ron.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/ControlledIdealIntermediateSwitch2.png\"
     alt=\"ControlledIdealIntermediateSwitch2.png\">
</p>

<p>
The limiting case is also allowed, i.e., the resistance Ron of the closed switch could be exactly zero and the conductance Goff of the open switch could be also exactly zero. Note, there are circuits, where a description with zero Ron or zero Goff is not possible. </p>
<p><br><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled. The parameters are not temperature dependent. </p>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-4,30},{4,22}}, lineColor={0,0,255}),
            Text(
              extent={{-80,50},{-60,72}},
              textString="p1",
              lineColor={0,0,255}),
            Text(
              extent={{-80,0},{-60,22}},
              textString="p2",
              lineColor={0,0,255}),
            Text(
              extent={{60,50},{80,72}},
              textString="n1",
              lineColor={0,0,255}),
            Text(
              extent={{60,0},{80,22}},
              textString="n2",
              lineColor={0,0,255}),
            Line(points={{-90,0},{-40,0}}, color={0,0,255}),
            Line(points={{-90,50},{-39,50}}, color={0,0,255}),
            Line(points={{-40,0},{40,50}}, color={0,0,255}),
            Line(points={{-40,50},{40,0}}, color={0,0,255}),
            Line(points={{40,50},{90,50}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,22}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-150,-23},{150,-63}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-4,29},{4,21}}, lineColor=
              {0,0,255}),Line(points={{-96,0},{-40,0}}, color={0,0,255}),Line(
              points={{-96,50},{-40,50}}, color={0,0,255}),Line(points={{-40,0},{
              40,50}}, color={0,0,255}),Line(points={{-40,50},{40,0}}, color={0,0,
              255}),Line(points={{40,50},{96,50}}, color={0,0,255}),Line(points={
              {0,96},{0,25}}, color={0,0,255}),Line(points={{40,0},{96,0}}, color=
               {0,0,255})}));
    end ControlledIdealIntermediateSwitch;

    model IdealOpAmp "Ideal operational amplifier (norator-nullator pair)"
      Modelica_SIunits.Voltage v1 "Voltage drop over the left port";
      Modelica_SIunits.Voltage v2 "Voltage drop over the right port";
      Modelica_SIunits.Current i1
        "Current flowing from pos. to neg. pin of the left port";
      Modelica_SIunits.Current i2
        "Current flowing from pos. to neg. pin of the right port";
      Interfaces.PositivePin p1 "Positive pin of the left port" annotation (
          Placement(transformation(extent={{-110,-60},{-90,-40}}, rotation=0)));
      Interfaces.NegativePin n1 "Negative pin of the left port" annotation (
          Placement(transformation(extent={{-110,40},{-90,60}}, rotation=0)));
      Interfaces.PositivePin p2 "Positive pin of the right port" annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Interfaces.NegativePin n2 "Negative pin of the right port" annotation (
          Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=270)));
    equation
      v1 = p1.v - n1.v;
      v2 = p2.v - n2.v;
      0 = p1.i + n1.i;
      0 = p2.i + n2.i;
      i1 = p1.i;
      i2 = p2.i;
      v1 = 0;
      i1 = 0;
      annotation (
        Documentation(info="<html>
<P>
The ideal OpAmp is a two-port. The left port is fixed to <i>v1=0</i> and <i>i1=0</i>
(nullator). At the right port both any voltage <i>v2</i> and any current <i>i2</i>
are possible (norator).
</P>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-35},{0,-91}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-150,126},{150,86}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{60,0},{-60,70},{-60,-70},{60,0}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{-96,50},{-60,50}}, color={0,0,
              255}),Line(points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(
              points={{60,0},{96,0}}, color={0,0,255}),Line(points={{0,-35},{0,-96}},
              color={0,0,255}),Line(points={{-55,50},{-45,50}}, color={0,0,255}),
              Line(points={{-50,-45},{-50,-55}}, color={0,0,255}),Line(points={{-55,
              -50},{-45,-50}}, color={0,0,255}),Text(
                extent={{-111,-39},{-90,-19}},
                lineColor={160,160,164},
                textString="p1.i=0"),Polygon(
                points={{120,3},{110,0},{120,-3},{120,3}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Line(points={{111,0},{136,0}}, color={0,
              0,0}),Text(
                extent={{118,2},{135,17}},
                lineColor={0,0,0},
                textString="i2"),Text(
                extent={{-111,60},{-90,80}},
                lineColor={160,160,164},
                textString="n1.i=0"),Line(points={{18,-111},{18,-86}}, color={160,
              160,164}),Polygon(
                points={{21,-101},{18,-111},{15,-101},{21,-101}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Text(
                extent={{22,-100},{39,-85}},
                lineColor={0,0,0},
                textString="i2")}));
    end IdealOpAmp;

    model IdealOpAmp3Pin
      "Ideal operational amplifier (norator-nullator pair), but 3 pins"
      Interfaces.PositivePin in_p "Positive pin of the input port" annotation (
          Placement(transformation(extent={{-110,-60},{-90,-40}}, rotation=0)));
      Interfaces.NegativePin in_n "Negative pin of the input port" annotation (
          Placement(transformation(extent={{-110,40},{-90,60}}, rotation=0)));
      Interfaces.PositivePin out "Output pin" annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
    equation
      in_p.v = in_n.v;
      in_p.i = 0;
      in_n.i = 0;
      annotation (
        Documentation(info="<html>
<P>
The ideal OpAmp with three pins is of exactly the same behaviour as the ideal
OpAmp with four pins. Only the negative output pin is left out.
Both the input voltage and current are fixed to zero (nullator).
At the output pin both any voltage <i>v2</i> and any current <i>i2</i>
are possible.
</P>
</html>",   revisions="<html>
<ul>
<li><i> 2002   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-149,117},{151,77}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{60,0},{-60,70},{-60,-70},{60,0}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{-96,50},{-60,50}}, color={0,0,
              255}),Line(points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(
              points={{60,0},{97,0}}, color={0,0,255}),Line(points={{-55,50},{-45,
              50}}, color={0,0,255}),Line(points={{-50,-45},{-50,-55}}, color={0,
              0,255}),Line(points={{-55,-50},{-45,-50}}, color={0,0,255}),Text(
                extent={{-111,-39},{-90,-19}},
                lineColor={160,160,164},
                textString="p1.i=0"),Polygon(
                points={{120,3},{110,0},{120,-3},{120,3}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Line(points={{111,0},{136,0}}, color={0,
              0,0}),Text(
                extent={{118,2},{135,17}},
                lineColor={0,0,0},
                textString="i2"),Text(
                extent={{-111,60},{-90,80}},
                lineColor={160,160,164},
                textString="n1.i=0")}));
    end IdealOpAmp3Pin;

    model IdealOpAmpLimited "Ideal operational amplifier with limitation"
      Interfaces.PositivePin in_p "Positive pin of the input port" annotation (
          Placement(transformation(extent={{-110,-60},{-90,-40}}, rotation=0)));
      Interfaces.NegativePin in_n "Negative pin of the input port" annotation (
          Placement(transformation(extent={{-110,40},{-90,60}}, rotation=0)));
      Interfaces.PositivePin out "Output pin" annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Interfaces.PositivePin VMax "Positive output voltage limitation"
        annotation (Placement(transformation(extent={{-10,60},{10,80}}, rotation=
                0)));
      Interfaces.NegativePin VMin "Negative output voltage limitation"
        annotation (Placement(transformation(extent={{-10,-80},{10,-60}},
              rotation=0)));
      Modelica_SIunits.Voltage vin "input voltage";
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);

    equation
      in_p.i = 0;
      in_n.i = 0;
      VMax.i = 0;
      VMin.i = 0;
      vin = in_p.v - in_n.v;
      in_p.v - in_n.v = unitVoltage*smooth(0, (if s < -1 then s + 1 else if s > 1
         then s - 1 else 0));
      out.v = smooth(0, if s < -1 then VMin.v else if s > 1 then VMax.v else (
        VMax.v - VMin.v)*s/2 + (VMax.v + VMin.v)/2);
      annotation (
        Documentation(info="<HTML>
<P>
The ideal OpAmp with limitation behaves like an ideal OpAmp without limitation,
if the output voltage is within the limits VMin and VMax. In this case
the input voltage vin = in_p.v - in_n.v is zero.
If the input voltage vin less than 0, the output voltage is out.v = VMin.
If the input voltage is vin larger than 0, the output voltage is out.v = VMax.
</P>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-45,-10},{-10,-10},{-10,10},{20,10}}, color={0,0,255}),
            Line(points={{0,35},{0,80}}, color={0,0,255}),
            Line(points={{0,-35},{0,-80}}, color={0,0,255}),
            Line(points={{-90,50},{-60,50}}, color={0,0,255}),
            Line(points={{-90,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-152,135},{148,95}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-45,-10},{-10,-10},{-10,10},{20,10}}, color={0,0,255}),
            Line(points={{0,35},{0,80}}, color={0,0,255}),
            Line(points={{0,-35},{0,-80}}, color={0,0,255}),
            Line(points={{-96,50},{-60,50}}, color={0,0,255}),
            Line(points={{-96,-50},{-60,-50}}, color={0,0,255}),
            Line(points={{60,0},{96,0}}, color={0,0,255}),
            Line(points={{-55,50},{-45,50}}, color={0,0,255}),
            Line(points={{-50,-45},{-50,-55}}, color={0,0,255}),
            Line(points={{-55,-50},{-45,-50}}, color={0,0,255}),
            Text(
              extent={{-111,-39},{-90,-19}},
              lineColor={160,160,164},
              textString="p1.i=0"),
            Polygon(
              points={{120,3},{110,0},{120,-3},{120,3}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={160,160,164}),
            Line(points={{111,0},{136,0}}, color={0,0,0}),
            Text(
              extent={{118,2},{135,17}},
              lineColor={0,0,0},
              textString="i2"),
            Text(
              extent={{-111,60},{-90,80}},
              lineColor={160,160,164},
              textString="n1.i=0")}));
    end IdealOpAmpLimited;

    model IdealizedOpAmpLimted
      "Idealized operational amplifier with limitation"
      parameter Real V0=15000.0 "No-load amplification";
      parameter Boolean useSupply=false
        "Use supply pins (otherwise constant supply" annotation (Evaluate=true);
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply voltage"
        annotation (Dialog(enable=not useSupply));
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply voltage"
        annotation (Dialog(enable=not useSupply));
      Modelica_SIunits.Voltage vps "Positive supply voltage";
      Modelica_SIunits.Voltage vns "Negative supply voltage";
      Modelica_SIunits.Voltage v_in=in_p.v - in_n.v "Input voltage difference";
      Modelica_SIunits.Voltage v_out=out.v "Ouput voltage to ground";
      Modelica_SIunits.Power p_in=in_p.v*in_p.i + in_n.v*in_n.i "Input power";
      Modelica_SIunits.Power p_out=out.v*out.i "Output power";
      Modelica_SIunits.Power p_s=-(p_in + p_out) "Supply power";
      Modelica_SIunits.Current i_s=p_s/(vps - vns) "Supply current";
      Modelica_Electrical_Analog.Interfaces.PositivePin in_p
        "Positive pin of the input port" annotation (Placement(transformation(
              extent={{-90,-70},{-110,-50}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin in_n
        "Negative pin of the input port" annotation (Placement(transformation(
              extent={{-110,50},{-90,70}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.PositivePin out
        "Pin of the output port" annotation (Placement(transformation(extent={{
                110,-10},{90,10}}, rotation=0), iconTransformation(extent={{110,
                -10},{90,10}})));
      //optional supply pins
      Modelica_Electrical_Analog.Interfaces.PositivePin s_p(final i=+i_s,
          final v=vps) if useSupply "Optional positive supply pin" annotation (
          Placement(transformation(extent={{10,90},{-10,110}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin s_n(final i=-i_s,
          final v=vns) if useSupply "Optional negative supply pin" annotation (
          Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
    equation
      if not useSupply then
        vps = Vps;
        vns = Vns;
      end if;
      in_p.i = 0;
      in_n.i = 0;
      v_out = smooth(0, min(Vps, max(Vns, V0*v_in)));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{60,0},{-60,70},{-60,-70},{60,0}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,60},{-60,60}}, color={0,0,255}),
            Line(points={{-90,-60},{-60,-60}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-48,32},{-28,32}}, color={0,0,255}),
            Line(points={{-39,-20},{-39,-41}}, color={0,0,255}),
            Line(points={{-50,-31},{-28,-31}}, color={0,0,255}),
            Text(
              extent={{-100,100},{100,80}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>Idealized operational amplifier with saturation: </p>
<ul>
<li>Input currents are zero. </li>
<li>No-load amplification is high (but not infinite). </li>
<li>Output voltage is limited between positive and negative supply. </li>
</ul>
<p>Supply voltage is either defined by parameter Vps and Vpn or by (optional) pins s_p and s_n. </p>
<p>In the first case the necessary power is drwan from an implicit internal supply, in the second case from the external supply.</p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics));
    end IdealizedOpAmpLimted;

    model IdealTransformer
      "Ideal transformer core with or without magnetization"
      extends Modelica_Electrical_Analog.Interfaces.TwoPort;
      parameter Real n(start=1) "Turns ratio primary:secondary voltage";
      parameter Boolean considerMagnetization=false
        "Choice of considering magnetization";
      parameter Modelica_SIunits.Inductance Lm1(start=1)
        "Magnetization inductance w.r.t. primary side"
        annotation (Dialog(enable=considerMagnetization));
    protected
      Modelica_SIunits.Current im1 "Magnetization current w.r.t. primary side";
      Modelica_SIunits.MagneticFlux psim1 "Magnetic flux w.r.t. primary side";
    equation
      im1 = i1 + i2/n;
      if considerMagnetization then
        psim1 = Lm1*im1;
        v1 = der(psim1);
      else
        psim1 = 0;
        im1 = 0;
      end if;
      v1 = n*v2;
      annotation (
        Documentation(info="<html>
<p>
The ideal transformer is a two-port circuit element;
in case of Boolean parameter <code>considerMagnetization = false</code> it is characterized by the following equations:
</p>
<pre> i2 = -i1*n;
 v2 =  v1/n;
</pre>
<p>
where <code>n</code> is a real number called the turns ratio.
Due to this equations, also DC voltages and currents are transformed - which is not the case for technical transformers.
</p>
<p>
In case of Boolean parameter <code>considerMagnetization = true</code> it is characterized by the following equations:
</p>
<pre>
 im1  = i1 + i2/n \"Magnetizing current w.r.t. primary side\";
 psim1= Lm1*im1   \"Magnetic flux w.r.t. primary side\";
 v1 = der(psim1)  \"Primary voltage\";
 v2 = v1/n        \"Secondary voltage\";
</pre>
<p>
where <code>Lm</code> denotes the magnetizing inductance.
Due to this equations, the DC offset of secondary voltages and currents decrement according to the time constant defined by the connected circuit.
</p>
<p>
Taking primary <code>L1sigma</code> and secondary <code>L2ssigma</code> leakage inductances into account,
compared with the <a href=\"modelica://Modelica.Electrical.Analog.Basic.Transformer\">basic transformer</a>
the following parameter conversion can be applied (which leads to identical results):
</p>
<pre>
 L1 = L1sigma + M*n \"Primary inductance at secondary no-load\";
 L2 = L2sigma + M/n \"Secondary inductance at primary no-load\";
  M  = Lm1/n         \"Mutual inductance\";
</pre>
<p>
For the backward conversion, one has to decide about the partitioning of the leakage to primary and secondary side.
</p>
</html>",   revisions="<html>
<ul>
<li><i>June 3, 2009   </i>
       magnetisation current added by Anton Haumer<br>
       </li>
<li><i>1998   </i>
       initially implemented by Christoph Clauss<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-45,-50},{-20,-25}}),
            Ellipse(extent={{-45,-25},{-20,0}}),
            Ellipse(extent={{-45,0},{-20,25}}),
            Ellipse(extent={{-45,25},{-20,50}}),
            Rectangle(
              extent={{-72,-60},{-33,60}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,50},{-32,50}}),
            Line(points={{-90,-50},{-32,-50}}),
            Ellipse(extent={{20,-50},{45,-25}}),
            Ellipse(extent={{20,-25},{45,0}}),
            Ellipse(extent={{20,0},{45,25}}),
            Ellipse(extent={{20,25},{45,50}}),
            Rectangle(
              extent={{33,-60},{72,60}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{32,50},{90,50}}),
            Line(points={{32,-50},{90,-50}}),
            Text(extent={{-100,-80},{100,-100}}, textString="n=%n"),
            Text(
              extent={{-100,10},{-80,-10}},
              lineColor={0,0,255},
              textString="1"),
            Text(
              extent={{80,10},{100,-10}},
              lineColor={0,0,255},
              textString="2"),
            Text(
              extent={{-146,115},{154,75}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(graphics={Text(
                extent={{-100,10},{0,-10}},
                lineColor={0,0,255},
                textString="1=primary"),Text(
                extent={{0,10},{100,-10}},
                lineColor={0,0,255},
                textString="2=secondary")}));
    end IdealTransformer;

    model IdealGyrator "Ideal gyrator"
      extends Interfaces.TwoPort;
      parameter Modelica_SIunits.Conductance G(start=1) "Gyration conductance";

    equation
      i1 = G*v2;
      i2 = -G*v1;
      annotation (
        Documentation(info="<html>
<p>
A gyrator is an ideal two-port element defined by the following equations:
<br><br>
<code>
    i1 =  G * v2<br>
    i2 = -G * v1<br>
</code>
<br>
where the constant <i>G</i> is called the gyration conductance.
</P>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-70,-30},{-10,30}}, lineColor={0,0,255}),
            Rectangle(
              extent={{-80,-40},{-41,40}},
              lineColor={255,255,255},
              pattern=LinePattern.Solid,
              lineThickness=0.25,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,50},{-40,50},{-40,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{-30,60},{20,60}}, color={0,0,255}),
            Polygon(
              points={{20,63},{30,60},{20,57},{20,63}},
              pattern=LinePattern.Solid,
              lineThickness=0.25,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Ellipse(extent={{10,-30},{70,30}}, lineColor={0,0,255}),
            Rectangle(
              extent={{80,-40},{40,40}},
              lineColor={255,255,255},
              pattern=LinePattern.Solid,
              lineThickness=0.25,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{90,50},{40,50},{40,-50},{90,-50}}, color={0,0,255}),
            Text(
              extent={{-152,116},{148,76}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-70,-30},{-10,30}},
              lineColor={0,0,255}),Rectangle(
                extent={{-80,-40},{-41,40}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,50},{-40,50},{-40,
              -50},{-96,-50}}, color={0,0,255}),Line(points={{-30,60},{20,60}},
              color={0,0,255}),Polygon(
                points={{20,63},{30,60},{20,57},{20,63}},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Ellipse(extent={{10,-30},{70,30}}, lineColor=
               {0,0,255}),Rectangle(
                extent={{80,-40},{40,40}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{96,50},{40,50},{40,-50},
              {96,-50}}, color={0,0,255})}));
    end IdealGyrator;

    model Idle "Idle branch"
      extends Interfaces.OnePort;
    equation
      i = 0;
      annotation (
        Documentation(info="<html>
<p>The model Idle is a simple idle running branch. That means between both pins no current is running. This ideal device is of no influence on the circuit. Therefore, it can be neglected in each case. For purposes of completeness this component is part of the MSL, as an opposite of the short cut.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-90,0},{-41,0}}, color={0,0,255}),
            Line(points={{91,0},{40,0}}, color={0,0,255}),
            Text(
              extent={{-153,112},{147,72}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{-96,0},{-41,0}}, color={0,0,255}),
              Line(points={{96,0},{40,0}}, color={0,0,255})}));
    end Idle;

    model Short "Short cut branch"
      extends Interfaces.OnePort;
    equation
      v = 0;
      annotation (
        Documentation(info="<html>
<p>The model Short is a simple short cut branch. That means the voltage drop between both pins is zero. This device could be neglected if both pins are combined to one node. Besides connecting the nodes of both pins this device has no further function.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{91,0},{-90,0}}, color={0,0,255}),
            Text(
              extent={{-151,113},{149,73}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{96,0},{-96,0}}, color={0,0,255}),
              Text(
                extent={{-100,100},{100,70}},
                textString="Short",
                lineColor={0,0,255})}));
    end Short;

    model IdealOpeningSwitch "Ideal electrical opener"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Blocks.Interfaces.BooleanInput control
        "true => switch open, false => p--n connected" annotation (Placement(
            transformation(
            origin={0,70},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      v = (s*unitCurrent)*(if control then 1 else Ron);
      i = (s*unitVoltage)*(if control then Goff else 1);

      LossPower = v*i;
      annotation (
        Documentation(info="<HTML>
<P>
The ideal opening switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the input signal control.
If control is true, pin p is not connected
with negative pin n. Otherwise, pin p is connected
with negative pin n.<br><br>

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
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,51},{0,26}}, color={0,0,255}),
            Line(points={{40,20},{40,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-151,-21},{149,-61}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Text(
                extent={{-100,-40},{100,-79}},
                textString="%name",
                lineColor={0,0,255}),Line(points={{0,51},{0,26}}, color={0,0,255}),
              Line(points={{40,20},{40,0}}, color={0,0,255})}));
    end IdealOpeningSwitch;

    model IdealClosingSwitch "Ideal electrical closer"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Blocks.Interfaces.BooleanInput control
        "true => p--n connected, false => switch open" annotation (Placement(
            transformation(
            origin={0,70},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      v = (s*unitCurrent)*(if control then Ron else 1);
      i = (s*unitVoltage)*(if control then 1 else Goff);

      LossPower = v*i;
      annotation (
        Documentation(info="<HTML>
<P>
The ideal closing switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by input signal control.
If control is true, pin p is connected
with negative pin n. Otherwise, pin p is not connected
with negative pin n.<br><br>

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
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,51},{0,26}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-152,-28},{148,-68}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Text(
                extent={{-100,-40},{100,-79}},
                textString="%name",
                lineColor={0,0,255}),Line(points={{0,51},{0,26}}, color={0,0,255})}));
    end IdealClosingSwitch;

    model ControlledIdealOpeningSwitch "Controlled ideal electrical opener"

      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Interfaces.PositivePin p annotation (Placement(transformation(extent={{-110,
                -10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n annotation (Placement(transformation(extent={{90,-10},
                {110,10}}, rotation=0)));
      Interfaces.Pin control
        "Control pin: control.v > level switch open, otherwise p--n connected"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      control.i = 0;
      0 = p.i + n.i;
      p.v - n.v = (s*unitCurrent)*(if (control.v > level) then 1 else Ron);
      p.i = (s*unitVoltage)*(if (control.v > level) then Goff else 1);

      LossPower = (p.v - n.v)*p.i;
      annotation (
        Documentation(info="<HTML>
<P>
The ideal switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the control pin.
If its voltage exceeds the voltage of the parameter level,
pin p is not connected with negative pin n.
Otherwise, pin p is connected with negative pin n.<br><br>

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
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,20},{40,0}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-150,-34},{150,-74}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255}),Line(points={{40,20},{40,0}}, color={0,0,255})}));
    end ControlledIdealOpeningSwitch;

    model ControlledIdealClosingSwitch "Controlled ideal electrical closer"

      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog.Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin control
        "Control pin: control.v > level switch closed, otherwise switch open"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    protected
      Real s(final unit="1") "Auxiliary variable";
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
    equation
      control.i = 0;
      0 = p.i + n.i;
      p.v - n.v = (s*unitCurrent)*(if (control.v > level) then Ron else 1);
      p.i = (s*unitVoltage)*(if (control.v > level) then 1 else Goff);

      LossPower = (p.v - n.v)*p.i;
      annotation (
        Documentation(info="<html>
<P>
The closing ideal switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the control pin.
If its voltage exceeds the voltage of the parameter level,
pin p is connected with negative pin n.
Otherwise, pin p is not connected with negative pin n.<br><br>

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
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,25}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-149,-32},{151,-72}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255})}));
    end ControlledIdealClosingSwitch;

    model OpenerWithArc "Ideal opening switch with simple arc model"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron=1E-5 "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff=1E-5
        "Opened switch conductance";
      parameter Modelica_SIunits.Voltage V0(start=30) "Initial arc voltage";
      parameter Modelica_SIunits.VoltageSlope dVdt(start=10E3)
        "Arc voltage slope";
      parameter Modelica_SIunits.Voltage Vmax(start=60) "Max. arc voltage";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Blocks.Interfaces.BooleanInput control
        "false => p--n connected, true => switch open" annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=270)));

    protected
      Boolean off=control;
      Boolean on=not off;
      discrete Modelica_SIunits.Time tSwitch(start=-Modelica_Constants.inf);
      Boolean quenched(start=true, fixed=true);
    equation
      when edge(off) then
        tSwitch = time;
      end when;
      quenched = off and (abs(i) <= abs(v)*Goff or pre(quenched));
      if on then
        v = Ron*i;
      else
        if quenched then
          i = Goff*v;
        else
          v = min(Vmax, V0 + dVdt*(time - tSwitch))*sign(i);
        end if;
      end if;
      LossPower = v*i;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{40,50},{32,32},{48,28},{40,18}}, color={255,0,0}),
            Ellipse(extent={{-44,4},{-36,-4}}),
            Line(points={{-90,0},{-44,0}}),
            Line(points={{-37,2},{40,50}}),
            Line(points={{40,0},{90,0}}),
            Line(points={{0,90},{0,26}}, color={255,85,255}),
            Line(points={{40,18},{40,0}}),
            Text(
              extent={{-150,-35},{150,-75}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(graphics={Line(points={{-60,60},{-60,-60},{60,-60}}, color={0,0,
              255}),Line(points={{-60,-60},{-40,-60},{-40,-40},{-20,40},{40,40}},
              color={0,0,0}),Text(
                extent={{30,-60},{50,-70}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-60,60},{-20,50}},
                lineColor={0,0,0},
                textString="voltage"),Text(
                extent={{-60,-30},{-40,-40}},
                lineColor={0,0,0},
                textString="V0"),Text(
                extent={{-50,40},{-30,30}},
                lineColor={0,0,0},
                textString="Vmax"),Text(
                extent={{-40,10},{-20,0}},
                lineColor={0,0,0},
                textString="dVdt"),Polygon(
                points={{-60,60},{-62,52},{-58,52},{-60,60}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Polygon(
                points={{60,-60},{54,-58},{54,-62},{60,-60}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This model is an extension to the <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch\">IdealOpeningSwitch</a>.
</p>
<p>
The basic model interrupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the switch is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the Boolean input <code>control</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e., the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the Boolean input <code>control</code> signals to close the switch again, the switch is closed immediately,
i.e., the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
Please note: In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<ul>
<li><i>June, 2009   </i>
       by Christoph Clauss<br> adapted to OpenerWithArc<br>
       </li>
<li><i>May, 2009   </i>
       by Anton Haumer<br> CloserWithArc initially implemented<br>
       </li>
</ul>
</html>"));
    end OpenerWithArc;

    model CloserWithArc "Ideal closing switch with simple arc model"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Resistance Ron=1E-5 "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff=1E-5
        "Opened switch conductance";
      parameter Modelica_SIunits.Voltage V0(start=30) "Initial arc voltage";
      parameter Modelica_SIunits.VoltageSlope dVdt(start=10E3)
        "Arc voltage slope";
      parameter Modelica_SIunits.Voltage Vmax(start=60) "Max. arc voltage";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Blocks.Interfaces.BooleanInput control
        "true => p--n connected, false => switch open" annotation (Placement(
            transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=270)));

    protected
      Boolean on=control;
      Boolean off(start=false, fixed=true);
      discrete Modelica_SIunits.Time tSwitch(start=-Modelica_Constants.inf);
      Boolean quenched(start=true, fixed=true);
    equation
      off = not on;
      when edge(off) then
        tSwitch = time;
      end when;
      quenched = off and (abs(i) <= abs(v)*Goff or pre(quenched));
      if on then
        v = Ron*i;
      else
        if quenched then
          i = Goff*v;
        else
          v = min(Vmax, V0 + dVdt*(time - tSwitch))*sign(i);
        end if;
      end if;
      LossPower = v*i;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{40,50},{32,24},{48,28},{40,0}}, color={255,0,0}),
            Ellipse(extent={{-44,4},{-36,-4}}),
            Line(points={{-90,0},{-44,0}}),
            Line(points={{-37,2},{40,50}}),
            Line(points={{40,0},{90,0}}),
            Line(points={{0,90},{0,26}}, color={255,85,255}),
            Text(
              extent={{-152,-29},{148,-69}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(graphics={Line(points={{-60,60},{-60,-60},{60,-60}}, color={0,0,
              255}),Line(points={{-60,-60},{-40,-60},{-40,-40},{-20,40},{40,40}},
              color={0,0,0}),Text(
                extent={{30,-60},{50,-70}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-60,60},{-20,50}},
                lineColor={0,0,0},
                textString="voltage"),Text(
                extent={{-60,-30},{-40,-40}},
                lineColor={0,0,0},
                textString="V0"),Text(
                extent={{-50,40},{-30,30}},
                lineColor={0,0,0},
                textString="Vmax"),Text(
                extent={{-40,10},{-20,0}},
                lineColor={0,0,0},
                textString="dVdt"),Polygon(
                points={{-60,60},{-62,52},{-58,52},{-60,60}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Polygon(
                points={{60,-60},{54,-58},{54,-62},{60,-60}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This model is an extension to the <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealClosingSwitch\">IdealClosingSwitch</a>.
</p>
<p>
The basic model interrupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the switch is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the Boolean input <code>control</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e., the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the Boolean input <code>control</code> signals to close the switch again, the switch is closed immediately,
i.e., the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
Please note: In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<ul>
<li><i>May, 2009   </i>
       by Anton Haumer<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end CloserWithArc;

    model ControlledOpenerWithArc
      "Controlled ideal electrical opener with simple arc model"

      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      parameter Modelica_SIunits.Voltage V0(start=30) "Initial arc voltage";
      parameter Modelica_SIunits.VoltageSlope dVdt(start=10E3)
        "Arc voltage slope";
      parameter Modelica_SIunits.Voltage Vmax(start=60) "Max. arc voltage";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog.Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin control
        "Control pin: control.v > level switch open, otherwise p--n connected"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_SIunits.Current i;
      Modelica_SIunits.Voltage v;
    protected
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
      Boolean off=(control.v > level);
      Boolean on=not off;
      discrete Modelica_SIunits.Time tSwitch(start=-Modelica_Constants.inf);
      Boolean quenched(start=true);
    equation
      control.i = 0;
      0 = p.i + n.i;
      i = p.i;
      p.v - n.v = v;

      when edge(off) then
        tSwitch = time;
      end when;
      quenched = off and (abs(i) <= abs(v)*Goff or pre(quenched));
      if on then
        v = Ron*i;
      else
        if quenched then
          i = Goff*v;
        else
          v = min(Vmax, V0 + dVdt*(time - tSwitch))*sign(i);
        end if;
      end if;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>

<p>
This model is an extension to the <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch\">IdealOpeningSwitch</a>.
</p>

<p>
The basic model interrupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the switch is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the control pin voltage <code>control.v</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e., the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the control pin <code>control.v</code> signals to close the switch again, the switch is closed immediately,
i.e., the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
<b>Please note:</b>
In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
</p>
<p>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>
</html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Christoph Clauss initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Line(points={{40,20},{40,0}}, color={0,0,255}),
            Line(points={{40,50},{32,34},{48,30},{40,20}}, color={255,0,0}),
            Text(
              extent={{-148,-34},{152,-74}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255}),Line(points={{40,20},{40,0}}, color={0,0,255})}));
    end ControlledOpenerWithArc;

    model ControlledCloserWithArc
      "Controlled ideal electrical closer with simple arc model"

      parameter Modelica_SIunits.Voltage level=0.5 "Switch level";
      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.E-5
        "Closed switch resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.E-5
        "Opened switch conductance";
      parameter Modelica_SIunits.Voltage V0(start=30) "Initial arc voltage";
      parameter Modelica_SIunits.VoltageSlope dVdt(start=10E3)
        "Arc voltage slope";
      parameter Modelica_SIunits.Voltage Vmax(start=60) "Max. arc voltage";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(final T=
           293.15);
      Modelica_Electrical_Analog.Interfaces.PositivePin p annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin n annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin control
        "Control pin: control.v > level switch closed, otherwise switch open"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_SIunits.Current i;
      Modelica_SIunits.Voltage v;
    protected
      constant Modelica_SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
      constant Modelica_SIunits.Current unitCurrent=1 annotation (HideResult=true);
      Boolean off(start=false, fixed=true);
      Boolean on=not off;
      discrete Modelica_SIunits.Time tSwitch(start=-Modelica_Constants.inf);
      Boolean quenched(start=true, fixed=true);
    equation
      off = (control.v < level);
      control.i = 0;
      0 = p.i + n.i;
      i = p.i;
      p.v - n.v = v;

      when edge(off) then
        tSwitch = time;
      end when;
      quenched = off and (abs(i) <= abs(v)*Goff or pre(quenched));
      if on then
        v = Ron*i;
      else
        if quenched then
          i = Goff*v;
        else
          v = min(Vmax, V0 + dVdt*(time - tSwitch))*sign(i);
        end if;
      end if;
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>
This model is an extension to the <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealClosingSwitch\">IdealClosingSwitch</a>.
</p>
<p>
The basic model interrupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the switch is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the control pin voltage <code>control.v</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e., the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the control pin <code>control.v</code> signals to close the switch again, the switch is closed immediately,
i.e., the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
<b>Please note:</b>
In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
</p>
<p>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled. The parameters are not temperature dependent.
</p>

</html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Christoph Clauss<br> initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
            Line(points={{-90,0},{-44,0}}, color={0,0,255}),
            Line(points={{-37,2},{40,50}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{0,90},{0,25}}, color={0,0,255}),
            Text(
              extent={{-100,-70},{100,-100}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{40,50},{32,24},{48,28},{40,0}}, color={255,0,0})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}},
              lineColor={0,0,255}),Line(points={{-96,0},{-44,0}}, color={0,0,255}),
              Line(points={{-37,2},{40,50}}, color={0,0,255}),Line(points={{40,0},
              {96,0}}, color={0,0,255}),Line(points={{0,96},{0,25}}, color={0,0,
              255})}));
    end ControlledCloserWithArc;

    model IdealTriac "Ideal triac, based on ideal thyristors"

      parameter Modelica_SIunits.Resistance Ron(final min=0) = 1.e-5
        "Closed triac resistance";
      parameter Modelica_SIunits.Conductance Goff(final min=0) = 1.e-5
        "Opened triac conductance";
      parameter Modelica_SIunits.Voltage Vknee(
        final min=0,
        start=0) = 0.8 "Threshold voltage for positive and negative phase";

      parameter Modelica_SIunits.Resistance Rdis=100
        "Resistance of disturbance elimination";
      parameter Modelica_SIunits.Capacitance Cdis=0.005
        "Capacity of disturbance elimination";

      Modelica_Electrical_Analog.Ideal.IdealThyristor idealThyristor(
        Ron=Ron,
        Goff=Goff,
        Vknee=Vknee) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-10,32})));
      Modelica_Electrical_Analog.Ideal.IdealThyristor idealThyristor1(
        Ron=Ron,
        Goff=Goff,
        Vknee=Vknee) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-10,-32})));
      Modelica_Electrical_Analog.Basic.Resistor resistor(R=Rdis)
        annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      Modelica_Electrical_Analog.Basic.Capacitor capacitor(C=Cdis)
        annotation (Placement(transformation(extent={{20,-10},{40,10}})));
      Modelica_Blocks.Interfaces.BooleanInput fire1 "Gate"
        annotation (Placement(transformation(extent={{-74,-106},{-46,-78}})));
      Modelica_Electrical_Analog.Interfaces.NegativePin n "Cathode"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica_Electrical_Analog.Interfaces.PositivePin p "Anode"
        annotation (Placement(transformation(extent={{94,-10},{114,10}})));
    equation

      connect(idealThyristor.n, capacitor.n) annotation (Line(
          points={{0,32},{40,32},{40,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(capacitor.n, idealThyristor1.p) annotation (Line(
          points={{40,0},{40,-32},{0,-32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealThyristor1.n, resistor.p) annotation (Line(
          points={{-20,-32},{-60,-32},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor.p, idealThyristor.p) annotation (Line(
          points={{-60,0},{-60,32},{-20,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(resistor.n, capacitor.p) annotation (Line(
          points={{-40,0},{20,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealThyristor1.fire, fire1) annotation (Line(
          points={{-17,-43},{-17,-92},{-60,-92}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(idealThyristor.fire, fire1) annotation (Line(
          points={{-3,43},{-3,60},{-80,60},{-80,-92},{-60,-92}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(n, idealThyristor.p) annotation (Line(
          points={{-100,0},{-90,0},{-90,40},{-20,40},{-20,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealThyristor1.p, p) annotation (Line(
          points={{0,-32},{0,-40},{80,-40},{80,0},{104,0}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Polygon(
              points={{-30,0},{-30,-100},{70,-50},{-30,0}},
              lineColor={0,0,0},
              smooth=Smooth.None),
            Polygon(
              points={{70,100},{70,0},{-30,50},{70,100}},
              lineColor={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{70,0},{70,-100}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{-30,0},{-30,100}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{-30,0},{-90,0}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{70,0},{110,0}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{-62,-86},{-62,-56},{-30,-44}},
              color={0,0,0},
              smooth=Smooth.None),
            Text(
              extent={{-102,130},{98,100}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>This is an ideal triac model based on an ideal thyristor model.</p>

<p>Two ideal thyristors (Modelica.Electrical.Analog.Ideal.IdealThyristor) are contrarily connected in parallel and additionally eliminated interference with a resistor (Rdis=100) and a capacitor (Cdis=0.005), which are connected in series.</p>

<p>The electrical component triac (TRIode Alternating Current switch) is, due to whose complex structure, a multifunctional applicable construction unit. The application area of this element is the manipulation of alternating current signals in frequency, voltage and/or current and also general blocking or filtering. However, compared to a thyristor the triac is only applied for substantial lesser currents, what is justified by whose sensitive structure. Generally one is limited to maximal voltages from 800 volt and currents from 40 ampere. For comparison maximal voltages of a thyristor are 8.000 volt and currents 5.000 ampere.</p>

<p>Structure and functionality:</p>

<p>Functionality of a triac is in principle the same like functionality of a thyristor, even connecting through of current starting from a certain voltage (knee voltage), but only if the current at anode and cathode is caused by a impulse current in the gate electrode. In case of the triac this process is also possible with reverse polarity, wherefore it is possible to control both half-waves of alternating currents. By means of gate electrodes, which are connected in a triac and why only one gate electrode is necessary, the point of time can be determined, at which the triac lets the alternating current signal pass. Thereby it is possible to affect the phase, at which the alternating current signal is cut. One speaks also of phase-angle control. Also depending on doping and specific structure knee voltage and maximal current carrying are alterable.</p>

<p>Characteristics:</p>
<ul>
<li>high switching times between on-state and off state up to activation of the reverse current phase </li>
<li>gate electrode are activated with (positive) impulse (called thyristor/triac firing), after firing thyristor path holds itself in state of low resistance or conductive state up to holding voltage is fallen below, it follows change to off state and next thyristor path can fire </li>
<li>in particular by switching of inductive components triacs generate harmonic waves, whose frequency ranges into broadcast sector and could there cause transmission disturbances; therefore triacs have to eliminate interference by inductors and capacitors </li>
</ul>
<p>Applications:</p>
<ul>
<li>any stepless exposure (dimmer) </li>
<li>engine speed adjustment of electric motors </li>
<li>further applications of phase-angle control (power electronics) </li>
<li>power packs </li>
</ul>
<p>As an additional information: this model is based on the Modelica.Electrical.Analog.Ideal.IdealThyristor.</p>
</html>",   revisions="<html>
<ul>
<li><i>November 25, 2009   </i> <br>

       by Susann Wolf <br><br>
       </li>
</ul>
</html>"));
    end IdealTriac;

    model AD_Converter "Simple n-bit analog to digital converter"
      import L = Modelica_Electrical_Digital.Interfaces.Logic;
      Modelica_Electrical_Analog.Interfaces.PositivePin p
        "Positive electrical pin (input)" annotation (Placement(transformation(
              extent={{-80,60},{-60,80}}, rotation=0), iconTransformation(
              extent={{-80,60},{-60,80}})));
      Modelica_Electrical_Analog.Interfaces.NegativePin n
        "Negative electrical pin (input)" annotation (Placement(transformation(
              extent={{-80,-80},{-60,-60}}, rotation=0), iconTransformation(
              extent={{-80,-80},{-60,-60}})));
      Modelica_Electrical_Digital.Interfaces.DigitalOutput y[N]
        "Digital output"
        annotation (Placement(transformation(extent={{60,-10},{80,10}}, rotation=
                0), iconTransformation(extent={{60,-10},{80,10}})));
      Modelica_Electrical_Digital.Interfaces.DigitalInput trig "Trigger input"
        annotation (Placement(transformation(extent={{-10,60},{10,80}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={0,90})));
      parameter Integer N(final min=1, start=8)
        "Resolution in bits - output signal width";
      parameter Modelica_SIunits.Voltage VRefHigh(start=10)
        "High reference voltage";
      parameter Modelica_SIunits.Voltage VRefLow(final max=VRefHigh, start=0)
        "Low reference voltage";
      parameter Modelica_SIunits.Resistance Rin(start=10^6) "Input resistance";
      Integer z;
      Real u;

    initial equation
      for i in 1:N loop
        y[i] = L.'X';
      end for;

    algorithm
      when (trig == L.'1' or trig == L.'H') then
        z := if u > VRefLow then integer((u - VRefLow)/(VRefHigh - VRefLow)*(2^N
           - 1) + 0.5) else 0;
        for i in 1:N loop
          y[i] := if mod(z, 2) > 0 then L.'1' else L.'0';
          z := div(z, 2);
        end for;
      end when;
    equation
      p.v - n.v = u;
      p.i*Rin = u;
      p.i + n.i = 0;
      annotation (Documentation(info="<html>
<P>
Simple analog to digital converter with a variable resolution of n bits.
It converts the input voltage <code>ppin.v-npin.v</code> to an n-vector of type Logic
(9-valued logic according to IEEE 1164 STD_ULOGIC). The input resistance between positive and negative pin is determined by <code>Rin</code>.
Further effects (like input capacities) have to be modeled outside the converter, since this should be a general model. </P>

<P>
The input signal range (VRefLo,VRefHi) is divided into 2^n-1 equally spaced stages of length Vlsb:=(VRefHi-VRefLo)/(2^n-1).
The output signal is the binary code of <code> k </code> as long as the input voltage takes values in the k-th stage, namely in the range from
<code> Vlsb*(k-0.5) </code> to <code> m*(k+0.5) </code>. This is called mid-tread operation. Additionally the output can only change
its value if the trigger signal <CODE> trig </CODE> of type Logic changes to '1' (forced or weak).
</P>

<P>
The output vector is a 'little-endian'. i.e., that the first bit y[1] is the least significant one (LSB).
</P>

<P>
This is an abstract model of an ADC. Therefore, it can not cover the dynamic behaviour of the converter.
Hence the output will change instantaneously when the trigger signal rises.
</P>

</html>",   revisions="<html>
<ul>
<li><i> October 13, 2009   </i>
       by Matthias Franke
       </li>
</ul>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(extent={{-60,80},{60,-80}}, lineColor={0,0,255}),
            Polygon(
              points={{-60,-80},{60,80},{60,-80},{-60,-80}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-60,40},{60,0}},
              lineColor={0,0,255},
              textString="%n-bit"),
            Text(
              extent={{-60,0},{60,-40}},
              lineColor={0,0,255},
              textString="ADC")}));
    end AD_Converter;

    model DA_Converter "Simple digital to analog converter"
      import L = Modelica_Electrical_Digital.Interfaces.Logic;
      Modelica_Electrical_Digital.Interfaces.DigitalInput trig "Trigger input"
        annotation (Placement(transformation(extent={{-10,60},{10,80}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={0,90})));
      Modelica_Electrical_Digital.Interfaces.DigitalInput x[N] "Digital input"
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
              rotation=0)));
      Modelica_Electrical_Analog.Interfaces.PositivePin p
        "Positive electrical pin (output)" annotation (Placement(transformation(
              extent={{60,60},{80,80}}, rotation=0), iconTransformation(extent=
                {{60,60},{80,80}})));
      Modelica_Electrical_Analog.Interfaces.NegativePin n
        "Negative electrical pin (output)" annotation (Placement(transformation(
              extent={{60,-80},{80,-60}}, rotation=0), iconTransformation(
              extent={{60,-80},{80,-60}})));

      Modelica_SIunits.Voltage vout;
      Real y(start=0);
      parameter Integer N(final min=1, start=8)
        "Resolution - input signal width";
      parameter Modelica_SIunits.Voltage Vref(start=10) "Reference voltage";

    algorithm
      when trig == L.'1' or trig == L.'H' then
        y := 0;
        for i in 1:N loop
          y := if (x[i] == L.'1' or x[i] == L.'H') then y + 2^(i - 1) else y;
        end for;
        vout := y*Vref/(2^N - 1);
      end when;

    equation
      p.v - n.v = vout;
      p.i + n.i = 0;

      annotation (Documentation(info="<html>
<p>Simple digital to analog converter with a variable input signal width of N bits. The input signal is an N-vector of type Logic (9-valued logic according to IEEE 1164 STD_ULOGIC). The output voltage of value <code>y</code> is generated by an ideal voltage source. The output can only change if the trigger signal <code>trig</code> of type Logic changes to &#39;;1&#39;; (forced or weak). In this case, the output voltage is calculated in the following way:
</p>
<pre>       N
  y = SUM ( x[i]*2^(i-1) )*Vref/(2^N-1),
      i=1
</pre>
<p>where x[i], i=1,...,N is 1 or 0. and Vref is the reference value. Therefore, the first bit in the input vector x[1] is the least significant one (LSB) and x[N] is the most significant bit (MSB).</p>
<p>This is an abstract model of a DAC. Hence, it can not cover the dynamic behaviour of the converter. Therefore the output will change instantaneously when the trigger signal rises.</p>
</html>",   revisions="<html>
<ul>
<li><i> October 13, 2009   </i>
       by Matthias Franke
       </li>
</ul>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(extent={{-60,80},{60,-80}}, lineColor={0,0,255}),
            Polygon(
              points={{-60,-80},{60,80},{-60,80},{-60,-80}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-60,40},{60,0}},
              lineColor={0,0,255},
              textString="%n-bit"),
            Text(
              extent={{-60,0},{60,-40}},
              lineColor={0,0,255},
              textString="DAC")}));
    end DA_Converter;
    annotation (Documentation(info="<html>
<p>This package contains electrical components with idealized behaviour. To enable more realistic applications than it is possible with pure realistic behavior some components are improved by additional features. E.g. the switches have resistances for the open or close case which can be parametrized.</p>
</html>",   revisions="<html>
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
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>
</html>"),   Icon(graphics={
          Line(points={{-90,0},{-40,0}}, color={0,0,0}),
          Line(points={{-40,0},{32,60}}, color={0,0,0}),
          Line(points={{40,0},{90,0}}, color={0,0,0})}));
  end Ideal;

  package Interfaces
    "Connectors and partial models for Analog electrical components"
    extends Modelica_Icons.InterfacesPackage;

    connector Pin "Pin of an electrical component"
      Modelica_SIunits.Voltage v "Potential at the pin" annotation (
          unassignedMessage="An electrical potential cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      flow Modelica_SIunits.Current i "Current flowing into the pin" annotation (
          unassignedMessage="An electrical current cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      annotation (defaultComponentName="pin",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-160,110},{40,50}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>Pin is the basic electric connector. It includes the voltage which consists between the pin and the ground node. The ground node is the node of (any) ground device (Modelica.Electrical.Basic.Ground). Furthermore, the pin includes the current, which is considered to be <b>positive</b> if it is flowing at the pin <b>into the device</b>.</p>
</html>"));
    end Pin;

    connector PositivePin "Positive pin of an electric component"
      Modelica_SIunits.Voltage v "Potential at the pin" annotation (
          unassignedMessage="An electrical potential cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      flow Modelica_SIunits.Current i "Current flowing into the pin" annotation (
          unassignedMessage="An electrical current cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      annotation (defaultComponentName="pin_p",
        Documentation(info="<html>
<p>Connectors PositivePin and NegativePin are nearly identical. The only difference is that the icons are different in order to identify more easily the pins of a component. Usually, connector PositivePin is used for the positive and connector NegativePin for the negative pin of an electrical component.</p>
</html>",                 revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-160,110},{40,50}},
              lineColor={0,0,255},
              textString="%name")}));
    end PositivePin;

    connector NegativePin "Negative pin of an electric component"
      Modelica_SIunits.Voltage v "Potential at the pin" annotation (
          unassignedMessage="An electrical potential cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      flow Modelica_SIunits.Current i "Current flowing into the pin" annotation (
          unassignedMessage="An electrical current cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      annotation (defaultComponentName="pin_n",
        Documentation(info="<html>
<p>Connectors PositivePin and NegativePin are nearly identical. The only difference is that the icons are different in order to identify more easily the pins of a component. Usually, connector PositivePin is used for the positive and connector NegativePin for the negative pin of an electrical component.</p>
</html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Christoph Clauss initially implemented
</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-40,110},{160,50}},
              textString="%name",
              lineColor={0,0,255})}));
    end NegativePin;

    partial model TwoPin "Component with two electrical pins"
      Modelica_SIunits.Voltage v
        "Voltage drop between the two pins (= p.v - n.v)";
      PositivePin p
        "Positive pin Positive pin (potential p.v > n.v for positive voltage drop v)"
                                                                                      annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      NegativePin n "Negative pin" annotation (Placement(transformation(extent={{
                90,-10},{110,10}}, rotation=0)));
    equation
      v = p.v - n.v;
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-120,3},{-110,0},{-120,-3},{-120,3}},
              lineColor={160,160,164},
              fillColor={160,160,164},
              fillPattern=FillPattern.Solid),
            Line(points={{-136,0},{-111,0}}, color={160,160,164}),
            Text(
              extent={{-134,5},{-117,20}},
              lineColor={160,160,164},
              textString="p.i"),
            Line(points={{110,0},{135,0}}, color={160,160,164}),
            Polygon(
              points={{120,3},{110,0},{120,-3},{120,3}},
              lineColor={160,160,164},
              fillColor={160,160,164},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{117,3},{134,18}},
              lineColor={160,160,164},
              textString="n.i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>TwoPin is a partial model with two pins and one internal variable for the voltage over the two pins. Internal currents are not defined. It is intended to be used in cases where the model which inherits TwoPin is composed by combining other components graphically, not by equations.</p>
</html>"));
    end TwoPin;

    partial model OnePort
      "Component with two electrical pins p and n and current i from p to n"

      Modelica_SIunits.Voltage v
        "Voltage drop between the two pins (= p.v - n.v)";
      Modelica_SIunits.Current i "Current flowing from pin p to pin n";
      PositivePin p
        "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      NegativePin n "Negative pin" annotation (Placement(transformation(extent={{
                110,-10},{90,10}}, rotation=0)));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation (
        Documentation(info="<html>
<p>Superclass of elements which have <b>two</b> electrical pins: the positive pin connector <i>p</i>, and the negative pin connector <i>n</i>. It is assumed that the current flowing into pin p is identical to the current flowing out of pin n. This current is provided explicitly as current i.</p>
</html>",
     revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-110,20},{-85,20}}, color={160,160,164}),
            Polygon(
              points={{-95,23},{-85,20},{-95,17},{-95,23}},
              lineColor={160,160,164},
              fillColor={160,160,164},
              fillPattern=FillPattern.Solid),
            Line(points={{90,20},{115,20}}, color={160,160,164}),
            Line(points={{-125,0},{-115,0}}, color={160,160,164}),
            Line(points={{-120,-5},{-120,5}}, color={160,160,164}),
            Text(
              extent={{-110,25},{-90,45}},
              lineColor={160,160,164},
              textString="i"),
            Polygon(
              points={{105,23},{115,20},{105,17},{105,23}},
              lineColor={160,160,164},
              fillColor={160,160,164},
              fillPattern=FillPattern.Solid),
            Line(points={{115,0},{125,0}}, color={160,160,164}),
            Text(
              extent={{90,45},{110,25}},
              lineColor={160,160,164},
              textString="i")}));
    end OnePort;

    partial model TwoPort
      "Component with two electrical ports, including current"
      Modelica_SIunits.Voltage v1 "Voltage drop over the left port";
      Modelica_SIunits.Voltage v2 "Voltage drop over the right port";
      Modelica_SIunits.Current i1
        "Current flowing from pos. to neg. pin of the left port";
      Modelica_SIunits.Current i2
        "Current flowing from pos. to neg. pin of the right port";
      PositivePin p1
        "Positive pin of the left port (potential p1.v > n1.v for positive voltage drop v1)"
                                                                                             annotation (Placement(
            transformation(extent={{-110,40},{-90,60}}, rotation=0)));
      NegativePin n1 "Negative pin of the left port" annotation (Placement(
            transformation(extent={{-90,-60},{-110,-40}}, rotation=0)));
      PositivePin p2
        "Positive pin of the right port (potential p2.v > n2.v for positive voltage drop v2)"
                                                                                              annotation (Placement(
            transformation(extent={{110,40},{90,60}}, rotation=0)));
      NegativePin n2 "Negative pin of the right port" annotation (Placement(
            transformation(extent={{90,-60},{110,-40}}, rotation=0)));
    equation
      v1 = p1.v - n1.v;
      v2 = p2.v - n2.v;
      0 = p1.i + n1.i;
      0 = p2.i + n2.i;
      i1 = p1.i;
      i2 = p2.i;
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-120,53},{-110,50},{-120,47},{-120,53}},
              lineColor={160,160,164},
              fillColor={160,160,164},
              fillPattern=FillPattern.Solid),
            Line(points={{-136,50},{-111,50}}, color={160,160,164}),
            Polygon(
              points={{127,-47},{137,-50},{127,-53},{127,-47}},
              lineColor={160,160,164},
              fillColor={160,160,164},
              fillPattern=FillPattern.Solid),
            Line(points={{111,-50},{136,-50}}, color={160,160,164}),
            Text(
              extent={{112,-44},{128,-29}},
              lineColor={160,160,164},
              textString="i2"),
            Text(
              extent={{118,52},{135,67}},
              lineColor={0,0,0},
              textString="i2"),
            Polygon(
              points={{120,53},{110,50},{120,47},{120,53}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={160,160,164}),
            Line(points={{111,50},{136,50}}, color={0,0,0}),
            Line(points={{-136,-49},{-111,-49}}, color={160,160,164}),
            Polygon(
              points={{-126,-46},{-136,-49},{-126,-52},{-126,-46}},
              lineColor={160,160,164},
              fillColor={160,160,164},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-127,-46},{-110,-31}},
              lineColor={160,160,164},
              textString="i1"),
            Text(
              extent={{-136,53},{-119,68}},
              lineColor={160,160,164},
              textString="i1")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>TwoPort is a partial model that consists of two ports. Like OnePort each port has two pins. It is assumed that the current flowing into the positive  pin   is identical to the current flowing out of pin n. This currents of each port are  provided explicitly as currents i1 and i2, the voltages respectively as v1 and v2.</p>
</html>"));
    end TwoPort;

    partial model ConditionalHeatPort
      "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

      parameter Boolean useHeatPort = false "=true, if heatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
      parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false" annotation(Dialog(enable=not useHeatPort));
      Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=T)=T_heatPort, Q_flow=-LossPower) if useHeatPort
        "Conditional heat port"
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-10,-110},{10,-90}})));
      Modelica_SIunits.Power LossPower
        "Loss power leaving component via heatPort";
      Modelica_SIunits.Temperature T_heatPort "Temperature of heatPort";
    equation
      if not useHeatPort then
         T_heatPort = T;
      end if;

      annotation (      Documentation(revisions="<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",     info="<html>
<p>
This partial model provides a conditional heating port for the connection to a thermal network.
</p>
<ul>
<li> If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal
     loss power flows internally to the ground. In this case, the parameter <b>T</b> specifies
     the fixed device temperature (the default for T = 20<sup>o</sup>C).</li>
<li> If <b>useHeatPort</b> is set to <b>true</b>, a heat port is available.</li>
</ul>

<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from
ConditionalHeatingPort model (<b>lossPower = ...</b>). As device temperature
<b>T_heatPort</b> can be used to describe the influence of the device temperature
on the model behaviour.
</p>
</html>"),     Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end ConditionalHeatPort;

    partial model AbsoluteSensor
      "Base class to measure the absolute value of a pin variable"
      extends Modelica_Icons.RotationalSensor;

      Interfaces.PositivePin p "Pin to be measured" annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Blocks.Interfaces.RealOutput y
        "Measured quantity as Real output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-70,0},{-90,0}}, color={0,0,0}),
            Line(points={{70,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Line(points={{-70,0},{-96,0}}, color={0,0,0}),
              Line(points={{70,0},{100,0}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The AbsoluteSensor is a partial model for converting values that can be calculated from one pin connector into a real valued signal. The special calculation has to be described in the model which inherits the AbsoluteSensor.  It is often used in sensor devices. To be a true sensor the modeller has to take care that the sensor model does not influence the electrical behavior to be measured.</p>
</html>"));

    end AbsoluteSensor;

    partial model RelativeSensor
      "Base class to measure a relative variable between two pins"
      extends Modelica_Icons.RotationalSensor;

      Interfaces.PositivePin p "Positive pin" annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n "Negative pin" annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Blocks.Interfaces.RealOutput y
        "Measured quantity as Real output signal" annotation (Placement(
            transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-70,0},{-90,0}}, color={0,0,0}),
            Line(points={{70,0},{90,0}}, color={0,0,0}),
            Line(points={{0,-90},{0,-70}}, color={0,0,255}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-70,0},{-96,0}}, color={0,0,0}),
            Line(points={{0,-90},{0,-70}}, color={0,0,255}),
            Line(points={{70,0},{96,0}}, color={0,0,0})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The RelaticeSensor is a partial model for converting values that can be calculated from two pin connectors into a real valued signal. The special calculation has to be described in the model which inherits the RelativeSensor.  It is often used in sensor devices. To be a true sensor the modeller has to take care that the sensor model does not influence the electrical behavior to be measured.</p>
</html>"));
    end RelativeSensor;

    partial model VoltageSource "Interface for voltage sources"
      extends OnePort;

      parameter Modelica_SIunits.Voltage offset=0 "Voltage offset";
      parameter Modelica_SIunits.Time startTime=0 "Time offset";
      replaceable Modelica_Blocks.Interfaces.SignalSource signalSource(
          final offset = offset, final startTime=startTime)
      annotation (Placement(transformation(extent={{70,70},{90,90}}, rotation=0)));
    equation
      v = signalSource.y;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{-90,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-120,50},{-20,0}},
              lineColor={0,0,255},
              textString="+"),
            Text(
              extent={{20,50},{120,0}},
              lineColor={0,0,255},
              textString="-")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The VoltageSource partial model prepares voltage sources by providing the pins, and the offset and startTime parameters, which are the same at all voltage sources. The source behavior is taken from Modelica.Blocks signal sources by inheritance and usage of the replaceable possibilities.</p>
</html>"));
    end VoltageSource;

    partial model CurrentSource "Interface for current sources"
      extends OnePort;
      parameter Modelica_SIunits.Current offset=0 "Current offset";
      parameter Modelica_SIunits.Time startTime=0 "Time offset";
      replaceable Modelica_Blocks.Interfaces.SignalSource signalSource(
          final offset = offset, final startTime=startTime) annotation (Placement(
            transformation(extent={{70,69},{91,89}}, rotation=0)));
    equation
      i = signalSource.y;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-50,0}}, color={0,0,255}),
            Line(points={{50,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-50},{0,50}}, color={0,0,255}),
            Text(
              extent={{-150,120},{150,80}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{90,0},{60,10},{60,-10},{90,0}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The CurrentSource partial model prepares current sources by providing the pins, and the offset and startTime parameters, which are the same at all current sources. The source behavior is taken from Modelica.Blocks signal sources by inheritance and usage of the replaceable possibilities.</p>
</html>"));
    end CurrentSource;

    annotation (Documentation(info="<html>
<p>This package contains connectors and interfaces (partial models) for analog electrical components. The partial models contain typical combinations of pins, and internal variables which are often used. Furthermore, the thermal heat port is in this package which can be included by inheritance.</p>
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
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>

<ul>
<li><i> 1998</i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end Interfaces;

  package Lines
    "Lossy and lossless segmented transmission lines, and LC distributed line models"
    extends Modelica_Icons.Package;

    model OLine "Lossy Transmission Line"
      //extends Interfaces.ThreePol;
      Modelica_Electrical_Analog.Interfaces.Pin p1 annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin p2 annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin p3 annotation (Placement(
            transformation(extent={{-10,-110},{10,-90}}, rotation=0)));
      Modelica_SIunits.Voltage v13;
      Modelica_SIunits.Voltage v23;
      Modelica_SIunits.Current i1;
      Modelica_SIunits.Current i2;
      parameter Real r(
        final min=Modelica_Constants.small,
        unit="Ohm/m",
        start=1) "Resistance per meter";
      parameter Real l(
        final min=Modelica_Constants.small,
        unit="H/m",
        start=1) "Inductance per meter";
      parameter Real g(
        final min=Modelica_Constants.small,
        unit="S/m",
        start=1) "Conductance per meter";
      parameter Real c(
        final min=Modelica_Constants.small,
        unit="F/m",
        start=1) "Capacitance per meter";
      parameter Modelica_SIunits.Length length(final min=Modelica_Constants.small,
          start=1) "Length of line";
      parameter Integer N(final min=1, start=1) "Number of lumped segments";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_R=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_G=0
        "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
      parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false"
        annotation (Dialog(enable=not useHeatPort));
      parameter Modelica_SIunits.Temperature T_ref=300.15;
      Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort if useHeatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-80,-80},{-60,-60}})));
    protected
      Modelica_Electrical_Analog.Basic.Resistor R[N + 1](
        R=fill(r*length/(N + 1), N + 1),
        T_ref=fill(T_ref, N + 1),
        alpha=fill(alpha_R, N + 1),
        useHeatPort=fill(useHeatPort, N + 1),
        T=fill(T, N + 1));
      Modelica_Electrical_Analog.Basic.Inductor L[N + 1](L=fill(l*length/(N + 1),
            N + 1));
      Modelica_Electrical_Analog.Basic.Capacitor C[N](C=fill(c*length/(N), N));
      Modelica_Electrical_Analog.Basic.Conductor G[N](
        G=fill(g*length/(N), N),
        T_ref=fill(T_ref, N),
        alpha=fill(alpha_G, N),
        useHeatPort=fill(useHeatPort, N),
        T=fill(T, N));
    equation
      v13 = p1.v - p3.v;
      v23 = p2.v - p3.v;
      i1 = p1.i;
      i2 = p2.i;
      connect(p1, R[1].p);
      for i in 1:N loop
        connect(R[i].n, L[i].p);
        connect(L[i].n, C[i].p);
        connect(L[i].n, G[i].p);
        connect(C[i].n, p3);
        connect(G[i].n, p3);
        connect(L[i].n, R[i + 1].p);
      end for;
      connect(R[N + 1].n, L[N + 1].p);
      connect(L[N + 1].n, p2);
      if useHeatPort then
        for i in 1:N + 1 loop
          connect(heatPort, R[i].heatPort);
        end for;
        for i in 1:N loop
          connect(heatPort, G[i].heatPort);
        end for;
      end if;
      annotation (
        Documentation(info="<html>
<p>Like in the picture below, the lossy transmission line OLine is a single-conductor lossy transmission line which consists of segments of lumped resistors and inductors in series and conductor and capacitors that are connected with the reference pin p3. The precision of the model depends on the number N of lumped segments.</p>
<p>To get a symmetric line model, the first resistor and inductor are cut into two parts (R1 and R_Nplus1, L1 and L_Nplus1). These two new resistors and inductors have the half of the resistance respectively inductance the original resistor respectively inductor.</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/OLine.png\"
     alt=\"OLine.png\">
</p>

<p>The capacitances are calculated with: C=c*length/N.
<br> The conductances are calculated with: G=g*length/N.
<br> The resistances are calculated with : R=r*length/(N+1).
<br> The inductances are calculated with : L=l*length/(N+1).
<br> For all capacitors, conductors, resistors and inductors the values of each segment are the same except of the first and last resistor and inductor, that only have the half of the above calculated value of the rest.
<br><p>The user has the possibility to enable a conditional heatport. If so, the OLine can be connected to a thermal network. When the parameter alpha is set to an value greater then zero, the OLine becomes temperature sensitive</p><p>due to their resistors which resistances are calculated by <code>R = R_ref*(1 + alpha*(heatPort.T - T_ref))</code> and conductors calculated by <code> (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref)).</code> </p>
<p>Note, this is different to the lumped line model of SPICE.</p>

<dl><dt><b>References:</b> </dt>
<dd>Johnson, B.; Quarles, T.; Newton, A. R.; Pederson, D. O.; Sangiovanni-Vincentelli, A.: SPICE3 Version 3e User&#39;;s Manual (April 1, 1991). Department of Electrical Engineering and Computer Sciences, University of California, Berkley p. 12, p. 106 - 107 </dd>
</dl></html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,-60},{0,-90}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-60,0},{-90,0}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-155,112},{145,72}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{0,-60},{0,-96}}, color={0,0,255}),
              Line(points={{60,0},{96,0}}, color={0,0,255}),Line(points={{-60,0},
              {-96,0}}, color={0,0,255}),Line(points={{30,30},{-30,30}}, color={0,
              0,255}),Line(points={{-30,40},{-30,20}}, color={0,0,255}),Line(
              points={{30,40},{30,20}}, color={0,0,255})}));
    end OLine;

    model M_OLine "Multiple OLine"

      parameter Modelica_SIunits.Length length(final min=Modelica_Constants.small)=
           0.1 "Length of line";
      parameter Integer N(final min=2) = 5 "Number of lumped segments";
      parameter Integer lines(final min=2) = 4 "Number of lines";
    protected
      parameter Integer dim_vector_lgc=div(lines*(lines + 1), 2);
    public
      parameter Real r[lines](
        each final min=Modelica_Constants.small,
        each unit="Ohm/m") = {4.76e5,1.72e5,1.72e5,1.72e5}
        "Resistance per meter";

      parameter Real l[dim_vector_lgc](
        each final min=Modelica_Constants.small,
        each unit="H/m") = {5.98e-7,4.44e-7,4.39e-7,3.99e-7,5.81e-7,4.09e-7,
        4.23e-7,5.96e-7,4.71e-7,6.06e-7} "Inductance per meter";

      parameter Real g[dim_vector_lgc](
        each final min=Modelica_Constants.small,
        each unit="S/m") = {8.05e-6,3.42e-5,2 - 91e-5,1.76e-6,9.16e-6,7.12e-6,
        2.43e-5,5.93e-6,4.19e-5,6.64e-6} "Conductance per meter";

      parameter Real c[dim_vector_lgc](
        each final min=Modelica_Constants.small,
        each unit="F/m") = {2.38e-11,1.01e-10,8.56e-11,5.09e-12,2.71e-11,2.09e-11,
        7.16e-11,1.83e-11,1.23e-10,2.07e-11} "Capacitance per meter";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_R=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_G=0
        "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
      parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false"
        annotation (Dialog(enable=not useHeatPort));
      parameter Modelica_SIunits.Temperature T_ref=300.15;
      Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort if useHeatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-80,-80},{-60,-60}})));
      model segment "Multiple line segment model"

        parameter Integer lines(final min=1) = 3 "Number of lines";
        parameter Integer dim_vector_lgc=div(lines*(lines + 1), 2)
          "Length of the vectors for l, g, c";
        Modelica_Electrical_Analog.Interfaces.PositivePin p[lines]
          "Positive pin" annotation (Placement(transformation(extent={{-60,-10},
                  {-40,10}}, rotation=0)));
        Modelica_Electrical_Analog.Interfaces.NegativePin n[lines]
          "Negative pin" annotation (Placement(transformation(extent={{40,-10},
                  {60,10}}, rotation=0)));

        parameter Real Cl[dim_vector_lgc]=fill(1, dim_vector_lgc)
          "Capacitance matrix";
        parameter Real Rl[lines]=fill(7, lines) "Resistance matrix";
        parameter Real Ll[dim_vector_lgc]=fill(2, dim_vector_lgc)
          "Inductance matrix";
        parameter Real Gl[dim_vector_lgc]=fill(1, dim_vector_lgc)
          "Conductance matrix";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_R
          "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_G
          "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
        parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
          annotation (
          Evaluate=true,
          HideResult=true,
          choices(checkBox=true));
        parameter Modelica_SIunits.Temperature T=293.15
          "Fixed device temperature if useHeatPort = false"
          annotation (Dialog(enable=not useHeatPort));
        parameter Modelica_SIunits.Temperature T_ref;

        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort if
          useHeatPort annotation (Placement(transformation(extent={{-10,-110},{10,
                  -90}}), iconTransformation(extent={{-80,-80},{-60,-60}})));

        Modelica_Electrical_Analog.Basic.Capacitor C[dim_vector_lgc](C=Cl);
        Modelica_Electrical_Analog.Basic.Resistor R[lines](
          R=Rl,
          T_ref=fill(T_ref, lines),
          alpha=fill(alpha_R, lines),
          useHeatPort=fill(useHeatPort, lines),
          T=fill(T, lines));
        Modelica_Electrical_Analog.Basic.Conductor G[dim_vector_lgc](
          G=Gl,
          T_ref=fill(T_ref, dim_vector_lgc),
          alpha=fill(alpha_G, dim_vector_lgc),
          useHeatPort=fill(useHeatPort, dim_vector_lgc),
          T=fill(T, dim_vector_lgc));
        Modelica_Electrical_Analog.Basic.M_Transformer inductance(N=lines, L=Ll);
        Modelica_Electrical_Analog.Basic.Ground M;

      equation
        for j in 1:lines - 1 loop

          connect(R[j].p, p[j]);
          connect(R[j].n, inductance.p[j]);
          connect(inductance.n[j], n[j]);
          connect(inductance.n[j], C[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)),
            2))].p);
          connect(C[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2))].n, M.p);
          connect(inductance.n[j], G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)),
            2))].p);
          connect(G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2))].n, M.p);

          for i in j + 1:lines loop
            connect(inductance.n[j], C[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)),
              2)) + 1 + i - (j + 1)].p);
            connect(C[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2)) + 1 + i
               - (j + 1)].n, inductance.n[i]);
            connect(inductance.n[j], G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)),
              2)) + 1 + i - (j + 1)].p);
            connect(G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2)) + 1 + i
               - (j + 1)].n, inductance.n[i]);

          end for;
        end for;
        connect(R[lines].p, p[lines]);
        connect(R[lines].n, inductance.p[lines]);
        connect(inductance.n[lines], n[lines]);
        connect(inductance.n[lines], C[dim_vector_lgc].p);
        connect(C[dim_vector_lgc].n, M.p);
        connect(inductance.n[lines], G[dim_vector_lgc].p);
        connect(G[dim_vector_lgc].n, M.p);

        if useHeatPort then

          for j in 1:lines - 1 loop
            connect(heatPort, R[j].heatPort);
            connect(heatPort, G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2))].heatPort);
            for i in j + 1:lines loop
              connect(heatPort, G[((1 + (j - 1)*lines) - div(((j - 2)*(j - 1)), 2))
                 + 1 + i - (j + 1)].heatPort);
            end for;
          end for;
          connect(heatPort, R[lines].heatPort);
          connect(heatPort, G[dim_vector_lgc].heatPort);
        end if;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(extent={{40,-40},{-40,40}},
                lineColor={0,0,255})}), Documentation(info="<html>
<p>The segment model is part of the multiple line model. It describes one line segment as outlined in the M_OLine description. Using the loop possibilities of Modelica it is formulated by connecting components the number of which depends on the number of lines.</p>
</html>"));
      end segment;

      model segment_last "Multiple line last segment model"

        Modelica_Electrical_Analog.Interfaces.PositivePin p[lines]
          "Positive pin" annotation (Placement(transformation(extent={{-40,-10},
                  {-20,10}}, rotation=0)));
        Modelica_Electrical_Analog.Interfaces.NegativePin n[lines]
          "Negative pin" annotation (Placement(transformation(extent={{20,-10},
                  {40,10}}, rotation=0)));
        parameter Integer lines(final min=1) = 3 "Number of lines";
        parameter Integer dim_vector_lgc=div(lines*(lines + 1), 2)
          "Length of the vectors for l, g, c";
        parameter Real Rl[lines]=fill(1, lines) "Resistance matrix";
        parameter Real Ll[dim_vector_lgc]=fill(1, dim_vector_lgc)
          "Inductance matrix";
        parameter Modelica_SIunits.LinearTemperatureCoefficient alpha_R
          "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
        parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
          annotation (
          Evaluate=true,
          HideResult=true,
          choices(checkBox=true));
        parameter Modelica_SIunits.Temperature T=293.15
          "Fixed device temperature if useHeatPort = false"
          annotation (Dialog(enable=not useHeatPort));
        parameter Modelica_SIunits.Temperature T_ref;
        Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort if
          useHeatPort annotation (Placement(transformation(extent={{-10,-110},{10,
                  -90}}), iconTransformation(extent={{-80,-80},{-60,-60}})));
        Modelica_Electrical_Analog.Basic.Resistor R[lines](
          R=Rl,
          T_ref=fill(T_ref, lines),
          useHeatPort=fill(useHeatPort, lines),
          T=fill(T, lines));
        Modelica_Electrical_Analog.Basic.M_Transformer inductance(N=lines, L=Ll);
        Modelica_Electrical_Analog.Basic.Ground M;

      equation
        for j in 1:lines - 1 loop

          connect(p[j], inductance.p[j]);
          connect(inductance.n[j], R[j].p);
          connect(R[j].n, n[j]);

        end for;
        connect(p[lines], inductance.p[lines]);
        connect(inductance.n[lines], R[lines].p);
        connect(R[lines].n, n[lines]);

        if useHeatPort then
          for j in 1:lines - 1 loop
            connect(heatPort, R[j].heatPort);
          end for;
          connect(heatPort, R[lines].heatPort);
        end if;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(extent={{20,-40},{-20,40}},
                lineColor={0,0,255})}), Documentation(info="<html>
<p>The segment_last model is part of the multiple line model. It describes the special  line segment which is used to get the line symmetrical as outlined in the M_OLine description. Using the loop possibilities of Modelica it is formulated by connecting components the number of which depends on the number of lines.</p>
</html>"));
      end segment_last;

      segment s[N - 1](
        lines=fill(lines, N - 1),
        dim_vector_lgc=fill(dim_vector_lgc, N - 1),
        Rl=fill(r*length/N, N - 1),
        Ll=fill(l*length/N, N - 1),
        Cl=fill(c*length/N, N - 1),
        Gl=fill(g*length/N, N - 1),
        alpha_R=fill(alpha_R, N - 1),
        alpha_G=fill(alpha_G, N - 1),
        T_ref=fill(T_ref, N - 1),
        useHeatPort=fill(useHeatPort, N - 1),
        T=fill(T, N - 1));
      segment s_first(
        lines=lines,
        dim_vector_lgc=dim_vector_lgc,
        Rl=r*length/(2*N),
        Cl=c*length/(N),
        Ll=l*length/(2*N),
        Gl=g*length/(N),
        alpha_R=alpha_R,
        alpha_G=alpha_G,
        T_ref=T_ref,
        useHeatPort=useHeatPort,
        T=T);
      segment_last s_last(
        lines=lines,
        Rl=r*length/(2*N),
        Ll=l*length/(2*N),
        alpha_R=alpha_R,
        T_ref=T_ref,
        useHeatPort=useHeatPort,
        T=T);
      Modelica_Electrical_Analog.Interfaces.PositivePin p[lines] "Positive pin"
        annotation (Placement(transformation(extent={{-100,-80},{-80,80}},
              rotation=0)));
      Modelica_Electrical_Analog.Interfaces.NegativePin n[lines] "Negative pin"
        annotation (Placement(transformation(extent={{80,-80},{100,80}},
              rotation=0)));

    equation
      connect(p, s_first.p);
      connect(s_first.n, s[1].p);
      for i in 1:N - 2 loop
        connect(s[i].n, s[i + 1].p);
      end for;
      connect(s[N - 1].n, s_last.p);
      connect(s_last.n, n);
      if useHeatPort then
        connect(heatPort, s_first.heatPort);
        for i in 1:N - 1 loop
          connect(heatPort, s[i].heatPort);
        end for;
        connect(heatPort, s_last.heatPort);
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{60,80},{-60,-80}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(points={{40,60},{40,40}}),
            Line(points={{40,50},{-40,50}}),
            Line(points={{-40,60},{-40,40}}),
            Line(points={{40,-40},{40,-60}}),
            Line(points={{40,-50},{-40,-50}}),
            Line(points={{-40,-40},{-40,-60}}),
            Line(points={{40,30},{40,10}}),
            Line(points={{40,20},{-40,20}}),
            Line(points={{-40,30},{-40,10}}),
            Line(
              points={{0,6},{0,-34}},
              color={0,0,255},
              pattern=LinePattern.Dot),
            Text(
              extent={{-146,135},{154,95}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>The M_OLine is a multi line model which consists of several segments and several single lines. Each segment consists of resistors and inductors that are connected in series in each single line, and of capacitors and conductors both between the lines and to the ground. The inductors are coupled to each other like in the M_Inductor model. The following picture shows the schematic of a segment with four single lines (lines=4):</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/segment.png\"
     alt=\"segment.png\">
</blockquote>

<p>The complete multi line consists of N segments and an auxiliary segment_last:</p>
<p align=\"center\"><code>-- segment_1 -- segment_2 -- ... -- segment_N -- segment_last --</code> </p>
<p>In the picture of the segment can be seen, that a single segment is asymmetric. Connecting such asymmetric segments in a series forces also an asymmetric multi line. To get a symmetric model which is useful for coupling and which guaranties the same pin properties, in the segment_1 only half valued resistors and inductors are used. The remaining resistors and inductors are at the other end of the line within the auxiliary segment_last. For the example with 4 lines the schematic of segment_last is like this:</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/segment_last.png\"
     alt=\"segment_last.png\">
</blockquote>

<p>The number of the capacitors and conductors depends on the number of single lines that are used, because each line is connected to every other line by both a capacitor and a conductor. One line consists of <b>at least two segments</b>. Inside the model M_OLine the model <i>segment</i> is used. This model represents one segment which is build as described above. For modelling the inductances and their mutual couplings the model M_Transformer is used. To fill the resistance vector, resistance values as many as lines are needed, e.g., if there are four lines, four resistances are needed. For example for a microelectronic line of 0.1m length, a sensible resistance-vector would be R=[4.76e5, 1.72e5, 1.72e5, 1.72e5].</p>
<p>Filling the matrices of the inductances, capacitances and conductances is a bit more complicated, because those components occur also between two lines and not only (like the resistor) in one line. The entries of the matrices are given by the user in form of a vector. The vector length dim_vector_lgc is calculated by <b>dim_vector_lgc = lines*(lines+1)/2</b>. Inside the model a symmetric inductance matrix, a symmetric capacitance matrix and a symmetric conductance matrix are built out of the entries of the vectors given by the user. The way of building is the same for each matrix, so the approach for filling one of the matrices will be shown at an example:</p>
<p>The number of lines is assumed to be four. To build the matrix, the model needs the values from the main diagonal and from the positions that are below the main diagonal. To get the following matrix</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Lines/M_OLine-eqMatrix.png\" alt=\"Matrix\"/>
</blockquote>

<p>the vector with dim_vector_lgc=4*5/2=10 has to appear in the following way: vector = [<b>1</b>, 0.1, 0.2, 0.4, <b>2</b>, 0.3 0.5, <b>3</b>, 0.6, <b>4</b>] </p>

<p>For the example of a microelectronic line of 0.1m length, which is used as default example for the M_OLine model, a sensible inductance-matrix would be </p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Lines/M_OLine-eqL.png\" alt=\"L\"/>
</blockquote>

<p>For the example of a microelectronic line of 0.1m length, which is used as default example for the M_OLine model, a sensible capacitance-matrix would be:</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Lines/M_OLine-eqC.png\" alt=\"C\"/>
</blockquote>

<p>For the example of a microelectronic line of 0.1m length, which is used as default example for the M_OLine model, a sensible conductance-matrix would be:</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Lines/M_OLine-eqG.png\" alt=\"G\"/>
</blockquote>

<p>The user has the possibility to enable a conditional heatport. If so, the M_OLine can be connected to a thermal network. When the parameter alpha is set to an value greater then zero, the M_OLine becomes temperature sensitive due to their resistors which resistances are calculated by R = R_ref*(1 + alpha*(heatPort.T - T_ref)) and conductors calculated by (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref)).</p>
</html>",   revisions="<HTML>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th>Version</th>
      <th>Revision</th>
      <th>Date</th>
      <th>Author</th>
      <th>Comment</th>
    </tr>
   <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\">4163</td>
      <td valign=\"top\">2010-09-11</td>
      <td valign=\"top\">Dietmar Winkler</td>
      <td valign=\"top\">Documentation corrected according to documentation guidelines.</td>
    </tr>
    <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\"></td>
      <td valign=\"top\">2008-11-24</td>
      <td valign=\"top\">Kristin Majetta</td>
      <td valign=\"top\">Documentation added.</td>
    </tr>
    <tr>
      <td valign=\"top\"></td>
      <td valign=\"top\"></td>
      <td valign=\"top\">2007-02-26</td>
      <td valign=\"top\">Kristin Majetta</td>
      <td valign=\"top\">Initially implemented</td>
    </tr>
</table>
</HTML>"));
    end M_OLine;

    model ULine "Lossy RC Line"
      //extends Interfaces.ThreePol;
      Modelica_Electrical_Analog.Interfaces.Pin p1 annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin p2 annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Electrical_Analog.Interfaces.Pin p3 annotation (Placement(
            transformation(extent={{-10,-110},{10,-90}}, rotation=0),
            iconTransformation(extent={{-10,-110},{10,-90}})));
      Modelica_SIunits.Voltage v13;
      Modelica_SIunits.Voltage v23;
      Modelica_SIunits.Current i1;
      Modelica_SIunits.Current i2;
      parameter Real r(
        final min=Modelica_Constants.small,
        unit="Ohm/m",
        start=1) "Resistance per meter";
      parameter Real c(
        final min=Modelica_Constants.small,
        unit="F/m",
        start=1) "Capacitance per meter";
      parameter Modelica_SIunits.Length length(final min=Modelica_Constants.small,
          start=1) "Length of line";
      parameter Integer N(final min=1, start=1) "Number of lumped segments";
      parameter Modelica_SIunits.LinearTemperatureCoefficient alpha=0
        "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      parameter Boolean useHeatPort=false "=true, if HeatPort is enabled"
        annotation (
        Evaluate=true,
        HideResult=true,
        choices(checkBox=true));
      parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false"
        annotation (Dialog(enable=not useHeatPort));
      parameter Modelica_SIunits.Temperature T_ref=300.15;
      Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort if useHeatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-80,-80},{-60,-60}})));
    protected
      Modelica_Electrical_Analog.Basic.Resistor R[N + 1](
        R=fill(r*length/(N + 1), N + 1),
        T_ref=fill(T_ref, N + 1),
        alpha=fill(alpha, N + 1),
        useHeatPort=fill(useHeatPort, N + 1),
        T=fill(T, N + 1));
      Modelica_Electrical_Analog.Basic.Capacitor C[N](C=fill(c*length/(N), N));
    equation
      v13 = p1.v - p3.v;
      v23 = p2.v - p3.v;
      i1 = p1.i;
      i2 = p2.i;
      connect(p1, R[1].p);
      for i in 1:N loop
        connect(R[i].n, R[i + 1].p);
      end for;
      for i in 1:N loop
        connect(R[i].n, C[i].p);
      end for;
      for i in 1:N loop
        connect(C[i].n, p3);
      end for;
      connect(R[N + 1].n, p2);
      if useHeatPort then
        for i in 1:N + 1 loop
          connect(heatPort, R[i].heatPort);
        end for;
      end if;
      annotation (
        Documentation(info="<html>
<p>As can be seen in the picture below, the lossy RC line ULine is a single conductor lossy transmission line which consists of segments of lumped series resistors and capacitors that are connected with the reference pin p3. The precision of the model depends on the number N of lumped segments.
<br>To get a symmetric line model, the first resistor is cut into two parts (R1 and R_Nplus1). These two new resistors have the half of the resistance of the original resistor.
</p>
<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/ULine.png\"
     alt=\"ULine.png\">
</blockquote>
<p>
The capacitances are calculated with: C=c*length/N.
<br>The resistances are calculated with: R=r*length/(N+1).
<br>For all capacitors and resistors the values of each segment are the same except for the first and last resistor, that only has the half of the above calculated value.<p>The user has the possibility to enable a conditional heatport. If so, the ULine can be connected to a thermal network. When the parameter alpha is set to an value greater then zero, the ULine becomes temperature sensitive</p>
<p>due to their resistors which resistances are calculated by <code>R = R_ref*(1 + alpha*(heatPort.T - T_ref)).</code> </p>
<p>Note, this is different compared with the lumped line model of SPICE.</p>
<p><b>References</b></p>
<dl><dt>Johnson, B.; Quarles, T.; Newton, A. R.; Pederson, D. O.; Sangiovanni-Vincentelli, A.</dt>
<dd>SPICE3 Version 3e User&#39;;s Manual (April 1, 1991). Department of Electrical Engineering and Computer Sciences, University of California, Berkley p. 22, p. 124 </dd>
</dl></html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Christoph Clauss initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,-60},{0,-90}}, color={0,0,255}),
            Line(points={{60,0},{90,0}}, color={0,0,255}),
            Line(points={{-60,0},{-90,0}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-154,117},{146,77}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{0,-60},{0,-96}}, color={0,0,255}),
              Line(points={{60,0},{96,0}}, color={0,0,255}),Line(points={{-60,0},
              {-96,0}}, color={0,0,255}),Line(points={{30,30},{-30,30}}, color={0,
              0,255}),Line(points={{-30,40},{-30,20}}, color={0,0,255}),Line(
              points={{30,40},{30,20}}, color={0,0,255})}));
    end ULine;

    model TLine1
      "Lossless transmission line with characteristic impedance Z0 and transmission delay TD"

      extends Modelica_Electrical_Analog.Interfaces.TwoPort;
      parameter Modelica_SIunits.Resistance Z0(start=1)
        "Characteristic impedance";
      parameter Modelica_SIunits.Time TD(start=1) "Transmission delay";
    protected
      Modelica_SIunits.Voltage er;
      Modelica_SIunits.Voltage es;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(TD > 0, "TD has to be positive");
      i1 = (v1 - es)/Z0;
      i2 = (v2 - er)/Z0;
      es = 2*delay(v2, TD) - delay(er, TD);
      er = 2*delay(v1, TD) - delay(es, TD);
      annotation (
        Documentation(info="<html>
<p>Lossless transmission line with characteristic impedance Z0 and transmission delay TD The lossless transmission line TLine1 is a two Port. Both port branches consist of a resistor with characteristic impedance Z0 and a controlled voltage source that takes into consideration the transmission delay TD. For further details see Branin&#39;;s article below. The model parameters can be derived from inductance and capacitance per length (L&#39;; resp. C&#39;;), i. e. Z0 = sqrt(L&#39;;/C&#39;;) and TD = sqrt(L&#39;;*C&#39;;)*length_of_line. Resistance R&#39;; and conductance C&#39;; per meter are assumed to be zero.</p>
<p><b>References:</b></p>
<dl><dt>Branin Jr., F. H.</dt>
<dd>Transient Analysis of Lossless Transmission Lines. Proceedings of the IEEE 55(1967), 2012 - 2013</dd>
<dt>Hoefer, E. E. E.; Nielinger, H.</dt>
<dd>SPICE : Analyseprogramm fuer elektronische Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985. </dd>
</dl></html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Joachim Haase<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(points={{60,-50},{90,-50}}, color={0,0,255}),
            Line(points={{60,50},{90,50}}, color={0,0,255}),
            Line(points={{-60,50},{-90,50}}, color={0,0,255}),
            Line(points={{-60,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-50,0},{50,-20}},
              textString="TLine1",
              lineColor={0,0,0}),
            Text(
              extent={{-152,122},{148,82}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}),graphics={Rectangle(extent={{-60,60},{60,-60}}, lineColor=
               {0,0,255}),Line(points={{60,-50},{96,-50}}, color={0,0,255}),Line(
              points={{60,50},{96,50}}, color={0,0,255}),Line(points={{-60,50},{-96,
              50}}, color={0,0,255}),Line(points={{-60,-50},{-96,-50}}, color={0,
              0,255}),Line(points={{30,30},{-30,30}}, color={0,0,255}),Line(
              points={{-30,40},{-30,20}}, color={0,0,255}),Line(points={{30,40},{
              30,20}}, color={0,0,255}),Text(
                extent={{-100,100},{100,70}},
                textString="TLine1",
                lineColor={0,0,255}),Text(
                extent={{-30,0},{31,-31}},
                textString="TLine1",
                lineColor={0,0,255})}));
    end TLine1;

    model TLine2
      "Lossless transmission line with characteristic impedance Z0, frequency F and normalized length NL"

      extends Modelica_Electrical_Analog.Interfaces.TwoPort;
      parameter Modelica_SIunits.Resistance Z0(start=1)
        "Characteristic impedance";
      parameter Modelica_SIunits.Frequency F(start=1) "Frequency";
      parameter Real NL(start=1) "Normalized length";
    protected
      Modelica_SIunits.Voltage er;
      Modelica_SIunits.Voltage es;
      parameter Modelica_SIunits.Time TD=NL/F;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(NL > 0, "NL has to be positive");
      assert(F > 0, "F has to be positive");
      i1 = (v1 - es)/Z0;
      i2 = (v2 - er)/Z0;
      es = 2*delay(v2, TD) - delay(er, TD);
      er = 2*delay(v1, TD) - delay(es, TD);
      annotation (
        Documentation(info="<html>
<p>Lossless transmission line with characteristic impedance Z0, frequency F and normalized length NL The lossless transmission line TLine2 is a two Port. Both port branches consist of a resistor with the value of the characteristic impedance Z0 and a controlled voltage source that takes into consideration the transmission delay. For further details see Branin&#39;;s article below. Resistance R&#39;; and conductance C&#39;; per meter are assumed to be zero. The characteristic impedance Z0 can be derived from inductance and capacitance per length (L&#39;; resp. C&#39;;), i. e. Z0 = sqrt(L&#39;;/C&#39;;). The normalized length NL is equal to the length of the line divided by the wavelength corresponding to the frequency F, i. e. the transmission delay TD is the quotient of NL and F.</p>
<p><b>References:</b></p>
<dl><dt>Branin Jr., F. H.</dt>
<dd>Transient Analysis of Lossless Transmission Lines. Proceedings of the IEEE 55(1967), 2012 - 2013</dd>
<dt>Hoefer, E. E. E.; Nielinger, H.</dt>
<dd>SPICE : Analyseprogramm fuer elektronische Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985. </dd>
</dl></html>",   revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Joachim Haase initially implemented</dd>
</dl>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(points={{60,-50},{90,-50}}, color={0,0,255}),
            Line(points={{60,50},{90,50}}, color={0,0,255}),
            Line(points={{-60,50},{-90,50}}, color={0,0,255}),
            Line(points={{-60,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-51,-10},{50,-31}},
              textString="TLine2",
              lineColor={0,0,0}),
            Text(
              extent={{-148,119},{152,79}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{60,-50},{96,-50}}, color={0,0,
              255}),Line(points={{60,50},{96,50}}, color={0,0,255}),Line(points={
              {-60,50},{-96,50}}, color={0,0,255}),Line(points={{-60,-50},{-96,-50}},
              color={0,0,255}),Line(points={{30,30},{-30,30}}, color={0,0,255}),
              Line(points={{-30,40},{-30,20}}, color={0,0,255}),Line(points={{30,
              40},{30,20}}, color={0,0,255}),Text(
                extent={{-100,100},{100,70}},
                textString="TLine2",
                lineColor={0,0,255})}));
    end TLine2;

    model TLine3
      "Lossless transmission line with characteristic impedance Z0 and frequency F"
      extends Modelica_Electrical_Analog.Interfaces.TwoPort;
      parameter Modelica_SIunits.Resistance Z0(start=1) "Natural impedance";
      parameter Modelica_SIunits.Frequency F(start=1) "Frequency";
    protected
      Modelica_SIunits.Voltage er;
      Modelica_SIunits.Voltage es;
      parameter Modelica_SIunits.Time TD=1/F/4;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(F > 0, "F has to be positive");
      i1 = (v1 - es)/Z0;
      i2 = (v2 - er)/Z0;
      es = 2*delay(v2, TD) - delay(er, TD);
      er = 2*delay(v1, TD) - delay(es, TD);
      annotation (
        Documentation(info="<html>
<p>Lossless transmission line with characteristic impedance Z0 and frequency F The lossless transmission line TLine3 is a two Port. Both port branches consist of a resistor with value of the characteristic impedance Z0 and a controlled voltage source that takes into consideration the transmission delay. For further details see Branin&#39;;s article below. Resistance R&#39;; and conductance C&#39;; per meter are assumed to be zero. The characteristic impedance Z0 can be derived from inductance and capacitance per length (L&#39;; resp. C&#39;;), i. e. Z0 = sqrt(L&#39;;/C&#39;;). The length of the line is equal to a quarter of the wavelength corresponding to the frequency F, i. e. the transmission delay is the quotient of 4 and F. In this case, the characteristic impedance is called natural impedance.</p>
<p><b>References:</b></p>
<dl><dt>Branin Jr., F. H.</dt>
<dd>Transient Analysis of Lossless Transmission Lines. Proceedings of the IEEE 55(1967), 2012 - 2013</dd>
<dt>Hoefer, E. E. E.; Nielinger, H.</dt>
<dd>SPICE : Analyseprogramm fuer elektronische Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985. </dd>
</dl></html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Joachim Haase<br> initially implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(points={{60,-50},{90,-50}}, color={0,0,255}),
            Line(points={{60,50},{90,50}}, color={0,0,255}),
            Line(points={{-60,50},{-90,50}}, color={0,0,255}),
            Line(points={{-60,-50},{-90,-50}}, color={0,0,255}),
            Line(points={{30,30},{-30,30}}, color={0,0,255}),
            Line(points={{-30,40},{-30,20}}, color={0,0,255}),
            Line(points={{30,40},{30,20}}, color={0,0,255}),
            Text(
              extent={{-50,-10},{51,-30}},
              textString="TLine3",
              lineColor={0,0,0}),
            Text(
              extent={{-155,124},{145,84}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
              lineColor={0,0,255}),Line(points={{60,-50},{96,-50}}, color={0,0,
              255}),Line(points={{60,50},{96,50}}, color={0,0,255}),Line(points={
              {-60,50},{-96,50}}, color={0,0,255}),Line(points={{-60,-50},{-96,-50}},
              color={0,0,255}),Line(points={{30,30},{-30,30}}, color={0,0,255}),
              Line(points={{-30,40},{-30,20}}, color={0,0,255}),Line(points={{30,
              40},{30,20}}, color={0,0,255}),Text(
                extent={{-100,100},{100,70}},
                textString="TLine3",
                lineColor={0,0,255})}));
    end TLine3;

    annotation (Documentation(info="<html>
<p>This package contains lossy and lossless segmented transmission lines, and LC distributed line models. The line models do not yet possess a conditional heating port.</p>
</html>",   revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
</dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Joachim.Haase/\">Joachim Haase;</a>
    &lt;<a href=\"mailto:haase@eas.iis.fhg.de\">haase@eas.iis.fhg.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden
</dd>
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>
</html>"),   Icon(graphics={
          Line(points={{-60,50},{-90,50}}, color={0,0,0}),
          Rectangle(
            extent={{-60,60},{60,-60}},
            lineColor={0,0,0}),
          Line(points={{-60,-50},{-90,-50}}, color={0,0,0}),
          Line(points={{36,20},{-36,20}}, color={0,0,0}),
          Line(points={{-36,40},{-36,0}},  color={0,0,0}),
          Line(points={{36,40},{36,0}},  color={0,0,0}),
          Line(points={{60,50},{90,50}}, color={0,0,0}),
          Line(points={{60,-50},{90,-50}}, color={0,0,0})}));
  end Lines;

  package Semiconductors
    "Semiconductor devices such as diode, MOS and bipolar transistor"
    extends Modelica_Icons.Package;
    import SIunits = Modelica_SIunits;

    model Diode "Simple diode"
      extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Current Ids=1.e-6 "Saturation current";
      parameter Modelica_SIunits.Voltage Vt=0.04
        "Voltage equivalent of temperature (kT/qn)";
      parameter Real Maxexp(final min=Modelica_Constants.small) = 15
        "Max. exponent for linear continuation";
      parameter Modelica_SIunits.Resistance R=1.e8 "Parallel ohmic resistance";
      extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=
            293.15);
    equation
      i = smooth(1,(if (v/Vt > Maxexp) then Ids*(exp(Maxexp)*(1 + v/Vt - Maxexp) - 1) +
        v/R else Ids*(exp(v/Vt) - 1) + v/R));
      LossPower = v*i;
      annotation (
        Documentation(info="<html>
<p>The simple diode is a one port. It consists of the diode itself and an parallel ohmic resistance <i>R</i>. The diode formula is:</p>
<pre>                v/vt
  i  =  ids ( e      - 1).</pre>
<p>If the exponent <i>v/vt</i> reaches the limit <i>maxex</i>, the diode characteristic is linearly continued to avoid overflow.</p><p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled yet. The parameters are not temperature dependent.</p>
</html>",
     revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> November 15, 2005   </i>
       by Christoph Clauss<br> smooth function added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Text(
              extent={{-150,-49},{149,-77}},
              lineColor={0,0,0},
              textString="Vt=%Vt"),
            Text(
              extent={{-154,100},{146,60}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,0,0},
              fillPattern=FillPattern.None),
            Line(points={{-96,0},{96,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255})}));
    end Diode;

   model ZDiode "Zener diode with 3 working areas"
     extends Modelica_Electrical_Analog.Interfaces.OnePort;
     parameter Modelica_SIunits.Current Ids=1.e-6 "Saturation current";
     parameter Modelica_SIunits.Voltage Vt=0.04
        "Voltage equivalent of temperature (kT/qn)";
     parameter Real Maxexp(final min=Modelica_Constants.small) = 30
        "Max. exponent for linear continuation";
     parameter Modelica_SIunits.Resistance R=1.e8 "Parallel ohmic resistance";
     parameter Modelica_SIunits.Voltage Bv=5.1
        "Breakthrough voltage = Zener- or Z-voltage";
     parameter Modelica_SIunits.Current Ibv=0.7 "Breakthrough knee current";
     parameter Real Nbv=0.74 "Breakthrough emission coefficient";
     extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=293.15);

     Real maxexp=exp(Maxexp);
   equation
      i = smooth(1, if (v>Maxexp*Vt) then
                Ids*( exp(Maxexp)*(1 + v/Vt - Maxexp)-1) + v/R else
             if ( (v+Bv)<-Maxexp*(Nbv*Vt)) then
                -Ids -Ibv* exp(Maxexp)*(1 - (v+Bv)/(Nbv*Vt) - Maxexp) +v/R else
                Ids*(exp(v/Vt)-1) - Ibv*exp(-(v+Bv)/(Nbv*Vt)) + v/R);
      LossPower = v*i;
            annotation (
              Documentation(info="<html>
<p>The simple Zener diode is a one port. It consists of the diode itself and an parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
<p>If the exponent in one of the two branches reaches the limit <i>Maxexp</i>, the diode characteristic is linearly continued to avoid overflow.</p>
<p><br>The Zener diode model permits (in contrast to the simple diode model) current in reverse direction if the breakdown voltage Bv (also known Zener knee voltage) is exceeded.</p>
<p>The thermal power is calculated by <i>i*v</i>.</p><p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled yet. The parameters are not temperature dependent.</p>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>April 5, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Text(
              extent={{-152,114},{148,74}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-101},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,0,0},
              fillPattern=FillPattern.None),
            Line(points={{-99,0},{96,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255})}));
   end ZDiode;

  model PMOS "Simple MOS Transistor"

    Interfaces.Pin D "Drain" annotation (Placement(transformation(extent={{90,
              40},{110,60}}, rotation=0)));
    Interfaces.Pin G "Gate" annotation (Placement(transformation(extent={{-90,
              -40},{-110,-60}}, rotation=0)));
    Interfaces.Pin S "Source" annotation (Placement(transformation(extent={{90,
              -40},{110,-60}}, rotation=0)));
    Interfaces.Pin B "Bulk" annotation (Placement(transformation(extent={{90,
              -10},{110,10}}, rotation=0)));
      parameter Modelica_SIunits.Length W=20.0e-6 "Width";
      parameter Modelica_SIunits.Length L=6.0e-6 "Length";
      parameter Modelica_SIunits.Transconductance Beta=0.0105e-3
        "Transconductance parameter";
      parameter Modelica_SIunits.Voltage Vt=-1.0 "Zero bias threshold voltage";
    parameter Real K2=0.41 "Bulk threshold parameter";
    parameter Real K5=0.839 "Reduction of pinch-off region";
      parameter Modelica_SIunits.Length dW=-2.5e-6 "Narrowing of channel";
      parameter Modelica_SIunits.Length dL=-2.1e-6 "Shortening of channel";
      parameter Modelica_SIunits.Resistance RDS=1.e+7 "Drain-Source-Resistance";
    extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=293.15);
    protected
    Real v;
    Real uds;
    Real ubs;
    Real ugst;
    Real ud;
    Real us;
    Real id;
    Real gds;

  equation
    assert( L + dL > 0, "PMOS: Effective length must be positive");
    assert( W + dW > 0, "PMOS: Effective width  must be positive");
    gds = if (RDS < 1.e-20 and RDS > -1.e-20) then 1.e20 else 1/RDS;
    v = Beta*(W + dW)/(L + dL);
    ud = smooth(0,if (D.v > S.v) then S.v else D.v);
    us = smooth(0,if (D.v > S.v) then D.v else S.v);
    uds = ud - us;
    ubs = smooth(0,if (B.v < us) then 0 else B.v - us);
    ugst = (G.v - us - Vt + K2*ubs)*K5;
    id = smooth(0,if (ugst >= 0) then uds*gds else if (ugst < uds) then -v*uds*(
      ugst - uds/2) + uds*gds else -v*ugst*ugst/2 + uds*gds);
    G.i = 0;
    D.i = smooth(0,if (D.v > S.v) then -id else id);
    S.i = smooth(0,if (D.v > S.v) then id else -id);
    B.i = 0;
    LossPower = D.i * (D.v - S.v);
    annotation (
      Documentation(info="<html>
<P>
The PMOS model is a simple model of a p-channel metal-oxide semiconductor
FET. It differs slightly from the device used in the SPICE simulator.
For more details please care for H. Spiro.
</P>
<P>
The model does not consider capacitances. A high drain-source resistance RDS
is included to avoid numerical difficulties.
<br><br>
<b>Please note: </b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled yet. The parameters are not temperature dependent.
</P>
<DL>
<DT><b>References:</b>
<DD>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag
  Muenchen Wien 1990.
</DL>
<P>
Some typical parameter sets are:
</P>
<PRE>
  W       L      Beta        Vt    K2     K5      DW       DL
  m       m      A/V^2       V     -      -       m        m
  50.e-6  8.e-6  0.0085e-3  -0.15  0.41   0.839  -3.8e-6  -4.0e-6
  20.e-6  6.e-6  0.0105e-3  -1.0   0.41   0.839  -2.5e-6  -2.1e-6
  30.e-6  5.e-6  0.0059e-3  -0.3   0.98   1.01    0       -3.9e-6
  30.e-6  5.e-6  0.0152e-3  -0.69  0.104  1.1    -0.8e-6  -0.4e-6
  30.e-6  5.e-6  0.0163e-3  -0.69  0.104  1.1    -0.8e-6  -0.4e-6
  30.e-6  5.e-6  0.0182e-3  -0.69  0.086  1.06   -0.1e-6  -0.6e-6
  20.e-6  6.e-6  0.0074e-3  -1.    0.4    0.59    0        0
</PRE>

</html>",
   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{91,50}}, color={0,0,255}),
            Line(points={{10,0},{90,0}}, color={0,0,255}),
            Line(points={{10,-50},{90,-50}}, color={0,0,255}),
            Polygon(
              points={{60,0},{40,5},{40,-5},{60,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-149,117},{151,77}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-90},{0,0}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-96,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{96,50}}, color={0,0,255}),
            Line(points={{10,0},{96,0}}, color={0,0,255}),
            Line(points={{10,-50},{96,-50}}, color={0,0,255}),
            Polygon(
              points={{60,0},{40,5},{40,-5},{60,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
  end PMOS;

  model NMOS "Simple MOS Transistor"

    Interfaces.Pin D "Drain" annotation (Placement(transformation(extent={{90,
              40},{110,60}}, rotation=0)));
    Interfaces.Pin G "Gate" annotation (Placement(transformation(extent={{-90,
              -40},{-110,-60}}, rotation=0)));
    Interfaces.Pin S "Source" annotation (Placement(transformation(extent={{90,
              -40},{110,-60}}, rotation=0)));
    Interfaces.Pin B "Bulk" annotation (Placement(transformation(extent={{90,
              -10},{110,10}}, rotation=0)));
      parameter Modelica_SIunits.Length W=20.e-6 "Width";
      parameter Modelica_SIunits.Length L=6.e-6 "Length";
      parameter Modelica_SIunits.Transconductance Beta=0.041e-3
        "Transconductance parameter";
      parameter Modelica_SIunits.Voltage Vt=0.8 "Zero bias threshold voltage";
    parameter Real K2=1.144 "Bulk threshold parameter";
    parameter Real K5=0.7311 "Reduction of pinch-off region";
      parameter Modelica_SIunits.Length dW=-2.5e-6 "narrowing of channel";
      parameter Modelica_SIunits.Length dL=-1.5e-6 "shortening of channel";
      parameter Modelica_SIunits.Resistance RDS=1.e+7 "Drain-Source-Resistance";
    extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=293.15);
    protected
    Real v;
    Real uds;
    Real ubs;
    Real ugst;
    Real ud;
    Real us;
    Real id;
    Real gds;

  equation
    assert( L + dL > 0, "NMOS: Effective length must be positive");
    assert( W + dW > 0, "NMOS: Effective width  must be positive");
    gds = if (RDS < 1.e-20 and RDS > -1.e-20) then 1.e20 else 1/RDS;
    v = Beta*(W + dW)/(L + dL);
    ud = smooth(0,if (D.v < S.v) then S.v else D.v);
    us = if (D.v < S.v) then D.v else S.v;
    uds = ud - us;
    ubs = smooth(0,if (B.v > us) then 0 else B.v - us);
    ugst = (G.v - us - Vt + K2*ubs)*K5;
    id = smooth(0,if (ugst <= 0) then uds*gds else if (ugst > uds) then v*uds*(ugst
       - uds/2) + uds*gds else v*ugst*ugst/2 + uds*gds);
    G.i = 0;
    D.i = smooth(0,if (D.v < S.v) then -id else id);
    S.i = smooth(0,if (D.v < S.v) then id else -id);
    B.i = 0;
    LossPower = D.i * (D.v - S.v);
    annotation (
      Documentation(info="<html>
<P>
The NMOS model is a simple model of a n-channel metal-oxide semiconductor
FET. It differs slightly from the device used in the SPICE simulator.
For more details please care for H. Spiro.
</P>
<P>
The model does not consider capacitances. A high drain-source resistance RDS
is included to avoid numerical difficulties.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled yet. The parameters are not temperature dependent.
</P>
<PRE>
  W       L      Beta         Vt      K2     K5       DW       DL
  m       m      A/V^2        V       -      -        m        m
  12.e-6  4.e-6  0.062e-3    -4.5     0.24   0.61    -1.2e-6  -0.9e-6      depletion
  60.e-6  3.e-6  0.048e-3     0.1     0.08   0.68    -1.2e-6  -0.9e-6      enhancement
  12.e-6  4.e-6  0.0625e-3   -0.8     0.21   0.78    -1.2e-6  -0.9e-6      zero
  50.e-6  8.e-6  0.0299e-3    0.24    1.144  0.7311  -5.4e-6  -4.e-6
  20.e-6  6.e-6  0.041e-3     0.8     1.144  0.7311  -2.5e-6  -1.5e-6
  30.e-6  9.e-6  0.025e-3    -4.0     0.861  0.878   -3.4e-6  -1.74e-6
  30.e-6  5.e-6  0.031e-3     0.6     1.5    0.72     0       -3.9e-6
  50.e-6  6.e-6  0.0414e-3   -3.8     0.34   0.8     -1.6e-6  -2.e-6       depletion
  50.e-6  5.e-6  0.03e-3      0.37    0.23   0.86    -1.6e-6  -2.e-6       enhancement
  50.e-6  6.e-6  0.038e-3    -0.9     0.23   0.707   -1.6e-6  -2.e-6       zero
  20.e-6  4.e-6  0.06776e-3   0.5409  0.065  0.71    -0.8e-6  -0.2e-6
  20.e-6  4.e-6  0.06505e-3   0.6209  0.065  0.71    -0.8e-6  -0.2e-6
  20.e-6  4.e-6  0.05365e-3   0.6909  0.03   0.8     -0.3e-6  -0.2e-6
  20.e-6  4.e-6  0.05365e-3   0.4909  0.03   0.8     -0.3e-6  -0.2e-6
  12.e-6  4.e-6  0.023e-3    -4.5     0.29   0.6      0        0           depletion
  60.e-6  3.e-6  0.022e-3     0.1     0.11   0.65     0        0           enhancement
  12.e-6  4.e-6  0.038e-3    -0.8     0.33   0.6      0        0           zero
  20.e-6  6.e-6  0.022e-3     0.8     1      0.66     0        0
</PRE>

<DL>
<DT><b>References:</b></DT>
<DD>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag
Muenchen Wien 1990.</DD>
</DL>
</html>",
   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{91,50}}, color={0,0,255}),
            Line(points={{10,0},{90,0}}, color={0,0,255}),
            Line(points={{10,-50},{90,-50}}, color={0,0,255}),
            Polygon(
              points={{40,0},{60,5},{60,-5},{40,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-155,119},{145,79}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,0}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-96,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{96,50}}, color={0,0,255}),
            Line(points={{10,0},{96,0}}, color={0,0,255}),
            Line(points={{10,-50},{96,-50}}, color={0,0,255}),
            Polygon(
              points={{40,0},{60,5},{60,-5},{40,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
  end NMOS;

  model NPN "Simple BJT according to Ebers-Moll"
    parameter Real Bf=50 "Forward beta";
    parameter Real Br=0.1 "Reverse beta";
      parameter Modelica_SIunits.Current Is=1.e-16
        "Transport saturation current";
      parameter Modelica_SIunits.InversePotential Vak=0.02
        "Early voltage (inverse), 1/Volt";
      parameter Modelica_SIunits.Time Tauf=0.12e-9 "Ideal forward transit time";
      parameter Modelica_SIunits.Time Taur=5e-9 "Ideal reverse transit time";
      parameter Modelica_SIunits.Capacitance Ccs=1e-12
        "Collector-substrate(ground) cap.";
      parameter Modelica_SIunits.Capacitance Cje=0.4e-12
        "Base-emitter zero bias depletion cap.";
      parameter Modelica_SIunits.Capacitance Cjc=0.5e-12
        "Base-coll. zero bias depletion cap.";
      parameter Modelica_SIunits.Voltage Phie=0.8
        "Base-emitter diffusion voltage";
    parameter Real Me=0.4 "Base-emitter gradation exponent";
      parameter Modelica_SIunits.Voltage Phic=0.8
        "Base-collector diffusion voltage";
    parameter Real Mc=0.333 "Base-collector gradation exponent";
      parameter Modelica_SIunits.Conductance Gbc=1e-15
        "Base-collector conductance";
      parameter Modelica_SIunits.Conductance Gbe=1e-15
        "Base-emitter conductance";
      parameter Modelica_SIunits.Voltage Vt=0.02585
        "Voltage equivalent of temperature";
    parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
    parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
    parameter Modelica_SIunits.Voltage IC=0 "Initial Value";
    parameter Boolean UIC = false;

    extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=293.15);
    protected
    Real vbc;
    Real vbe;
    Real qbk;
    Real ibc;
    Real ibe;
    Real cbc;
    Real cbe;
    Real ExMin;
    Real ExMax;
    Real Capcje;
    Real Capcjc;
    function pow "Just a helper function for x^y"
      extends Modelica_Icons.Function;
      input Real x;
      input Real y;
      output Real z;
    algorithm
      z:=x^y;
    end pow;
    public
    Modelica_Electrical_Analog.Interfaces.Pin C "Collector" annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.Pin B "Base" annotation (Placement(
            transformation(extent={{-90,-10},{-110,10}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.Pin E "Emitter" annotation (Placement(
            transformation(extent={{90,-40},{110,-60}}, rotation=0)));
  initial equation
    if UIC then
      C.v = IC;
    end if;

  equation
    ExMin = exp(EMin);
    ExMax = exp(EMax);
    vbc = B.v - C.v;
    vbe = B.v - E.v;
    qbk = 1 - vbc*Vak;

    ibc = smooth(1,if (vbc/Vt < EMin) then Is*(ExMin*(vbc/Vt - EMin + 1) - 1) + vbc*Gbc else
            if (vbc/Vt > EMax) then Is*(ExMax*(vbc/Vt - EMax + 1) - 1) + vbc*
      Gbc else Is*(exp(vbc/Vt) - 1) + vbc*Gbc);
    ibe = smooth(1,if (vbe/Vt < EMin) then Is*(ExMin*(vbe/Vt - EMin + 1) - 1) + vbe*Gbe else
            if (vbe/Vt > EMax) then Is*(ExMax*(vbe/Vt - EMax + 1) - 1) + vbe*
      Gbe else Is*(exp(vbe/Vt) - 1) + vbe*Gbe);
    Capcjc = smooth(1,(if (vbc/Phic > 0) then Cjc*(1 + Mc*vbc/Phic) else Cjc*pow(1 - vbc
      /Phic, -Mc)));
    Capcje = smooth(1,(if (vbe/Phie > 0) then Cje*(1 + Me*vbe/Phie) else Cje*pow(1 - vbe
      /Phie, -Me)));
    cbc = smooth(1,(if (vbc/Vt < EMin) then Taur*Is/Vt*ExMin*(vbc/Vt - EMin + 1) +
      Capcjc else if (vbc/Vt > EMax) then Taur*Is/Vt*ExMax*(vbc/Vt - EMax + 1)
       + Capcjc else Taur*Is/Vt*exp(vbc/Vt) + Capcjc));
    cbe = smooth(1,(if (vbe/Vt < EMin) then Tauf*Is/Vt*ExMin*(vbe/Vt - EMin + 1) +
      Capcje else if (vbe/Vt > EMax) then Tauf*Is/Vt*ExMax*(vbe/Vt - EMax + 1)
       + Capcje else Tauf*Is/Vt*exp(vbe/Vt) + Capcje));
    C.i = (ibe - ibc)*qbk - ibc/Br - cbc*der(vbc) + Ccs*der(C.v);
    B.i = ibe/Bf + ibc/Br + cbc*der(vbc) + cbe*der(vbe);
    E.i = -B.i - C.i + Ccs*der(C.v);

    LossPower = (C.v-E.v)*(ibe-ibc)*qbk + vbc*ibc/Br + vbe*ibe/Bf;
    annotation (
      Documentation(info="<html>
<P>
This model is a simple model of a bipolar NPN junction transistor according
to Ebers-Moll.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled yet. The parameters are not temperature dependent.
</P>
<P>
A typical parameter set is:
</P>
<PRE>
  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe    Vt
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS     V
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15  0.02585
</PRE>
<DL>
<DT><b>References:</b></DT>
<DD>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design.
Van Nostrand Reinhold, New York 1983
on page 317 ff.</DD>
</DL>
</html>",
   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>

<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-90,0}}, color={0,0,255}),
            Line(points={{91,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{91,-50}}, color={0,0,255}),
            Polygon(
              points={{30,-50},{24,-36},{16,-44},{30,-50}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-152,117},{148,77}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-100,0}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{100,-50}}, color={0,0,255}),
            Line(points={{100,50},{30,50}}, color={0,0,255}),
            Polygon(
              points={{30,-50},{24,-36},{16,-44},{30,-50}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
  end NPN;

  model PNP "Simple BJT according to Ebers-Moll"
    parameter Real Bf=50 "Forward beta";
    parameter Real Br=0.1 "Reverse beta";
      parameter Modelica_SIunits.Current Is=1.e-16
        "Transport saturation current";
      parameter Modelica_SIunits.InversePotential Vak=0.02
        "Early voltage (inverse), 1/Volt";
      parameter Modelica_SIunits.Time Tauf=0.12e-9 "Ideal forward transit time";
      parameter Modelica_SIunits.Time Taur=5e-9 "Ideal reverse transit time";
      parameter Modelica_SIunits.Capacitance Ccs=1e-12
        "Collector-substrate(ground) cap.";
      parameter Modelica_SIunits.Capacitance Cje=0.4e-12
        "Base-emitter zero bias depletion cap.";
      parameter Modelica_SIunits.Capacitance Cjc=0.5e-12
        "Base-coll. zero bias depletion cap.";
      parameter Modelica_SIunits.Voltage Phie=0.8
        "Base-emitter diffusion voltage";
    parameter Real Me=0.4 "Base-emitter gradation exponent";
      parameter Modelica_SIunits.Voltage Phic=0.8
        "Base-collector diffusion voltage";
    parameter Real Mc=0.333 "Base-collector gradation exponent";
      parameter Modelica_SIunits.Conductance Gbc=1e-15
        "Base-collector conductance";
      parameter Modelica_SIunits.Conductance Gbe=1e-15
        "Base-emitter conductance";
      parameter Modelica_SIunits.Voltage Vt=0.02585
        "Voltage equivalent of temperature";
    parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
    parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
    extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=293.15);
    protected
    Real vbc;
    Real vbe;
    Real qbk;
    Real ibc;
    Real ibe;
    Real cbc;
    Real cbe;
    Real ExMin;
    Real ExMax;
    Real Capcje;
    Real Capcjc;
    function pow "Just a helper function for x^y"
      extends Modelica_Icons.Function;
      input Real x;
      input Real y;
      output Real z;
    algorithm
      z:=x^y;
    end pow;
    public
    Modelica_Electrical_Analog.Interfaces.Pin C "Collector" annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.Pin B "Base" annotation (Placement(
            transformation(extent={{-90,-10},{-110,10}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.Pin E "Emitter" annotation (Placement(
            transformation(extent={{90,-40},{110,-60}}, rotation=0)));
  equation
    ExMin = exp(EMin);
    ExMax = exp(EMax);
    vbc = C.v - B.v;
    vbe = E.v - B.v;
    qbk = 1 - vbc*Vak;

    ibc = smooth(1,(if (vbc/Vt < EMin) then Is*(ExMin*(vbc/Vt - EMin + 1) - 1) + vbc*Gbc else
            if (vbc/Vt > EMax) then Is*(ExMax*(vbc/Vt - EMax + 1) - 1) + vbc*
      Gbc else Is*(exp(vbc/Vt) - 1) + vbc*Gbc));

    ibe = smooth(1,(if (vbe/Vt < EMin) then Is*(ExMin*(vbe/Vt - EMin + 1) - 1) + vbe*Gbe else
            if (vbe/Vt > EMax) then Is*(ExMax*(vbe/Vt - EMax + 1) - 1) + vbe*
      Gbe else Is*(exp(vbe/Vt) - 1) + vbe*Gbe));

    Capcjc = smooth(1,(if (vbc/Phic > 0) then Cjc*(1 + Mc*vbc/Phic) else Cjc*pow(1 - vbc
      /Phic, -Mc)));
    Capcje = smooth(1,if (vbe/Phie > 0) then Cje*(1 + Me*vbe/Phie) else Cje*pow(1 - vbe
      /Phie, -Me));
    cbc = smooth(1,(if (vbc/Vt < EMin) then Taur*Is/Vt*ExMin*(vbc/Vt - EMin + 1) +
      Capcjc else if (vbc/Vt > EMax) then Taur*Is/Vt*ExMax*(vbc/Vt - EMax + 1)
       + Capcjc else Taur*Is/Vt*exp(vbc/Vt) + Capcjc));
    cbe = smooth(1,(if (vbe/Vt < EMin) then Tauf*Is/Vt*ExMin*(vbe/Vt - EMin + 1) +
      Capcje else if (vbe/Vt > EMax) then Tauf*Is/Vt*ExMax*(vbe/Vt - EMax + 1)
       + Capcje else Tauf*Is/Vt*exp(vbe/Vt) + Capcje));
    C.i = -((ibe - ibc)*qbk - ibc/Br - cbc*der(vbc) - Ccs*der(C.v));
    B.i = -(ibe/Bf + ibc/Br + cbe*der(vbe) + cbc*der(vbc));
    E.i = -B.i - C.i + Ccs*der(C.v);

    LossPower = (E.v-C.v)*(ibe-ibc)*qbk + vbc*ibc/Br + vbe*ibe/Bf;
                                                                      annotation (
      Documentation(info="<html>
<P>
This model is a simple model of a bipolar PNP junction transistor according
to Ebers-Moll.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b>not</b> modelled yet. The parameters are not temperature dependent.
<P>
A typical parameter set is:
</P>
<PRE>
  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe    Vt
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS     V
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15  0.02585
</PRE>
<DL>
<DT><b>References:</b></DT>
<DD>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design.
Van Nostrand Reinhold, New York 1983
on page 317 ff.</DD>
</DL>
</html>",
   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>

<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-90,0}}, color={0,0,255}),
            Line(points={{91,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{91,-50}}, color={0,0,255}),
            Polygon(
              points={{-10,-10},{5,-17},{-3,-25},{-10,-10}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-158,119},{142,79}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-99,0}}, color={0,0,255}),
            Line(points={{100,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{99,-50}}, color={0,0,255}),
            Polygon(
              points={{-10,-10},{5,-17},{-3,-25},{-10,-10}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
  end PNP;

  model HeatingDiode "Simple diode with heating port"
    extends Modelica_Electrical_Analog.Interfaces.OnePort;
    parameter Modelica_SIunits.Current Ids=1.e-6 "Saturation current";
    /* parameter Modelica.SIunits.Voltage Vt=0.04 "Voltage equivalent of temperature (kT/qn)"; */
    parameter Real Maxexp(final min=Modelica_Constants.small) = 15
        "Max. exponent for linear continuation";
    parameter Modelica_SIunits.Resistance R=1.e8 "Parallel ohmic resistance";
    parameter Real EG=1.11 "activation energy";
    parameter Real N=1 "Emission coefficient";
    parameter Modelica_SIunits.Temperature TNOM=300.15
        "Parameter measurement temperature";
    parameter Real XTI=3 "Temperature exponent of saturation current";
    extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(
          useHeatPort=true);

    Modelica_SIunits.Temperature vt_t "Temperature voltage";
    Modelica_SIunits.Current id "diode current";
    protected
    Real k=1.380662e-23 "Boltzmann's constant, J/K";
    Real q=1.6021892e-19 "Electron charge, As";
    Modelica_SIunits.Temperature htemp "auxiliary temperature";
    Real aux;
    Real auxp;
    Real maxexp=exp(Maxexp);
  equation
    assert( T_heatPort > 0,"temperature must be positive");
    htemp = T_heatPort;
    vt_t = k*htemp/q;

    id = exlin((v/(N*vt_t)), Maxexp) - 1;

    aux = (htemp/TNOM - 1)*EG/(N*vt_t);
    auxp = exp(aux);

    i = Ids*id*pow(htemp/TNOM, XTI/N)*auxp + v/R;

    LossPower = i*v;
    annotation (
      Documentation(info="<html>
<P>
The simple diode is an electrical one port, where a heat port is added, which is
defined in the Modelica.Thermal library. It consists of the diode itself and an parallel ohmic
resistance <i>R</i>. The diode formula is:
</P>
<PRE>
                v/vt_t
  i  =  ids ( e        - 1).

</PRE>
where vt_t depends on the temperature of the heat port:
<PRE>
  vt_t = k*temp/q
</PRE>
<P>
If the exponent <i>v/vt_t</i> reaches the limit <i>maxex</i>, the diode characteristic is linearly
continued to avoid overflow.<br>
The thermal power is calculated by <i>i*v</i>.
</P>
</html>",   revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>April 5, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Text(
              extent={{-152,114},{148,74}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-101},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
      Diagram(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
          Polygon(
            points={{30,0},{-30,40},{-30,-40},{30,0}},
            lineColor={0,0,255},
            fillColor={255,0,0},
            fillPattern=FillPattern.None),
          Line(points={{-96,0},{96,0}}, color={0,0,255}),
          Line(points={{30,40},{30,-40}}, color={0,0,255})}));
  end HeatingDiode;

          model HeatingNMOS "Simple MOS Transistor with heating port"

            Modelica_Electrical_Analog.Interfaces.Pin D "Drain" annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin G "Gate" annotation (
          Placement(transformation(extent={{-90,-40},{-110,-60}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin S "Source" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin B "Bulk" annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
            parameter Modelica_SIunits.Length W=20.e-6 "Width";
            parameter Modelica_SIunits.Length L=6.e-6 "Length";
            parameter Modelica_SIunits.Transconductance Beta=0.041e-3
        "Transconductance parameter";
            parameter Modelica_SIunits.Voltage Vt=0.8
        "Zero bias threshold voltage";
            parameter Real K2=1.144 "Bulk threshold parameter";
            parameter Real K5=0.7311 "Reduction of pinch-off region";
            parameter Modelica_SIunits.Length dW=-2.5e-6 "Narrowing of channel";
            parameter Modelica_SIunits.Length dL=-1.5e-6
        "Shortening of channel";
            parameter Modelica_SIunits.Resistance RDS=1.e+7
        "Drain-Source-Resistance";
            parameter Modelica_SIunits.Temperature Tnom=300.15
        "Parameter measurement temperature";
            parameter Real kvt=-6.96e-3 "Fitting parameter for Vt";
            parameter Real kk2=6.0e-4 "Fitting parameter for K2";
            extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(
          useHeatPort=true);
    protected
            Real v;
            Real uds;
            Real ubs;
            Real ugst;
            Real ud;
            Real us;
            Real id;
            Real gds;
            Real beta_t;
            Real vt_t;
            Real k2_t;
          equation
            assert(L + dL > 0, "Heating NMOS: Effective length must be positive");
            assert(W + dW > 0, "Heating NMOS: Effective width  must be positive");
            assert(T_heatPort > 0,"Heating NMOS: Temperature must be positive");
            gds = if (RDS < 1.e-20 and RDS > -1.e-20) then 1.e20 else 1/RDS;
            v = beta_t*(W + dW)/(L + dL);
            ud = smooth(0,if (D.v < S.v) then S.v else D.v);
            us = smooth(0,if (D.v < S.v) then D.v else S.v);
            uds = ud - us;
            ubs = smooth(0,if (B.v > us) then 0 else B.v - us);
            ugst = (G.v - us - vt_t + k2_t*ubs)*K5;
            id = smooth(0,if (ugst <= 0) then uds*gds else if (ugst > uds) then v*uds*(
              ugst - uds/2) + uds*gds else v*ugst*ugst/2 + uds*gds);

            beta_t = Beta*pow((T_heatPort/Tnom), -1.5);
            vt_t = Vt*(1 + (T_heatPort - Tnom)*kvt);
            k2_t = K2*(1 + (T_heatPort - Tnom)*kk2);

            G.i = 0;
            D.i = smooth(0,if (D.v < S.v) then -id else id);
            S.i = smooth(0,if (D.v < S.v) then id else -id);
            B.i = 0;
            LossPower = D.i*(D.v - S.v);
            annotation (
              Documentation(info="<html>
<p>The NMOS model is a simple model of a n-channel metal-oxide semiconductor FET. It differs slightly from the device used in the SPICE simulator. For more details please care for H. Spiro.
<br> A heating port is added for thermal electric simulation. The heating port is defined in the Modelica.Thermal library.
<br>The model does not consider capacitances. A high drain-source resistance RDS is included to avoid numerical difficulties.
</p>
<PRE>
  W       L      Beta         Vt      K2     K5       DW       DL
  m       m      A/V^2        V       -      -        m        m
  12.e-6  4.e-6  0.062e-3    -4.5     0.24   0.61    -1.2e-6  -0.9e-6      depletion
  60.e-6  3.e-6  0.048e-3     0.1     0.08   0.68    -1.2e-6  -0.9e-6      enhancement
  12.e-6  4.e-6  0.0625e-3   -0.8     0.21   0.78    -1.2e-6  -0.9e-6      zero
  50.e-6  8.e-6  0.0299e-3    0.24    1.144  0.7311  -5.4e-6  -4.e-6
  20.e-6  6.e-6  0.041e-3     0.8     1.144  0.7311  -2.5e-6  -1.5e-6
  30.e-6  9.e-6  0.025e-3    -4.0     0.861  0.878   -3.4e-6  -1.74e-6
  30.e-6  5.e-6  0.031e-3     0.6     1.5    0.72     0       -3.9e-6
  50.e-6  6.e-6  0.0414e-3   -3.8     0.34   0.8     -1.6e-6  -2.e-6       depletion
  50.e-6  5.e-6  0.03e-3      0.37    0.23   0.86    -1.6e-6  -2.e-6       enhancement
  50.e-6  6.e-6  0.038e-3    -0.9     0.23   0.707   -1.6e-6  -2.e-6       zero
  20.e-6  4.e-6  0.06776e-3   0.5409  0.065  0.71    -0.8e-6  -0.2e-6
  20.e-6  4.e-6  0.06505e-3   0.6209  0.065  0.71    -0.8e-6  -0.2e-6
  20.e-6  4.e-6  0.05365e-3   0.6909  0.03   0.8     -0.3e-6  -0.2e-6
  20.e-6  4.e-6  0.05365e-3   0.4909  0.03   0.8     -0.3e-6  -0.2e-6
  12.e-6  4.e-6  0.023e-3    -4.5     0.29   0.6      0        0           depletion
  60.e-6  3.e-6  0.022e-3     0.1     0.11   0.65     0        0           enhancement
  12.e-6  4.e-6  0.038e-3    -0.8     0.33   0.6      0        0           zero
  20.e-6  6.e-6  0.022e-3     0.8     1      0.66     0        0
</PRE>
<p><b>References:</b></p>
<p>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag Muenchen Wien 1990.</p>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i>March 31, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{91,50}}, color={0,0,255}),
            Line(points={{10,0},{90,0}}, color={0,0,255}),
            Line(points={{10,-50},{90,-50}}, color={0,0,255}),
            Polygon(
              points={{40,0},{60,5},{60,-5},{40,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-152,118},{148,78}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,0}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-96,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{96,50}}, color={0,0,255}),
            Line(points={{10,0},{96,0}}, color={0,0,255}),
            Line(points={{10,-50},{96,-50}}, color={0,0,255}),
            Polygon(
              points={{40,0},{60,5},{60,-5},{40,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
          end HeatingNMOS;

          model HeatingPMOS "Simple PMOS Transistor with heating port"

            Modelica_Electrical_Analog.Interfaces.Pin D "Drain" annotation (
          Placement(transformation(extent={{90,40},{110,60}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin G "Gate" annotation (
          Placement(transformation(extent={{-90,-40},{-110,-60}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin S "Source" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin B "Bulk" annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
            parameter Modelica_SIunits.Length W=20.0e-6 "Width";
            parameter Modelica_SIunits.Length L=6.0e-6 "Length";
            parameter Modelica_SIunits.Transconductance Beta=0.0105e-3
        "Transconductance parameter";
            parameter Modelica_SIunits.Voltage Vt=-1.0
        "Zero bias threshold voltage";
            parameter Real K2=0.41 "Bulk threshold parameter";
            parameter Real K5=0.839 "Reduction of pinch-off region";
            parameter Modelica_SIunits.Length dW=-2.5e-6 "Narrowing of channel";
            parameter Modelica_SIunits.Length dL=-2.1e-6
        "Shortening of channel";
            parameter Modelica_SIunits.Resistance RDS=1.e+7
        "Drain-Source-Resistance";
            parameter Modelica_SIunits.Temperature Tnom=300.15
        "Parameter measurement temperature";
            parameter Real kvt=-2.9e-3 "Fitting parameter for Vt";
            parameter Real kk2=6.2e-4 "Fitting parameter for K2";
            extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(
          useHeatPort=true);
    protected
            Real v;
            Real uds;
            Real ubs;
            Real ugst;
            Real ud;
            Real us;
            Real id;
            Real gds;
            Real beta_t;
            Real vt_t;
            Real k2_t;
          equation
            assert(L + dL > 0, "HeatingPMOS: Effective length must be positive");
            assert(W + dW > 0, "HeatingPMOS: Effective width  must be positive");
            assert( T_heatPort > 0,"HeatingPMOS: Temperature must be positive");
            gds = if (RDS < 1.e-20 and RDS > -1.e-20) then 1.e20 else 1/RDS;
            v = beta_t*(W + dW)/(L + dL);
            ud = smooth(0,if (D.v > S.v) then S.v else D.v);
            us = smooth(0,if (D.v > S.v) then D.v else S.v);
            uds = ud - us;
            ubs = smooth(0,if (B.v < us) then 0 else B.v - us);
            ugst = (G.v - us - vt_t + k2_t*ubs)*K5;
            id = smooth(0,if (ugst >= 0) then uds*gds else if (ugst < uds) then -v*uds*(
              ugst - uds/2) + uds*gds else -v*ugst*ugst/2 + uds*gds);

            beta_t = Beta*pow((T_heatPort/Tnom), -1.5);
            vt_t = Vt*(1 + (T_heatPort - Tnom)*kvt);
            k2_t = K2*(1 + (T_heatPort - Tnom)*kk2);

            G.i = 0;
            D.i = smooth(0,if (D.v > S.v) then -id else id);
            S.i = smooth(0,if (D.v > S.v) then id else -id);
            B.i = 0;
            LossPower = D.i*(D.v - S.v);
            annotation (
              Documentation(info="<html>
<p>The PMOS model is a simple model of a p-channel metal-oxide semiconductor FET. It differs slightly from the device used in the SPICE simulator. For more details please care for H. Spiro.
<br>A heating port is added for thermal electric simulation. The heating port is defined in the Modelica.Thermal library.
<br>The model does not consider capacitances. A high drain-source resistance RDS is included to avoid numerical difficulties.</p>
<dl><dt><b>References:</b> </dt>
<dd>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag Muenchen Wien 1990. </dd>
</dl><p>Some typical parameter sets are:</p>
<PRE>
  W       L      Beta        Vt    K2     K5      DW       DL
  m       m      A/V^2       V     -      -       m        m
  50.e-6  8.e-6  0.0085e-3  -0.15  0.41   0.839  -3.8e-6  -4.0e-6
  20.e-6  6.e-6  0.0105e-3  -1.0   0.41   0.839  -2.5e-6  -2.1e-6
  30.e-6  5.e-6  0.0059e-3  -0.3   0.98   1.01    0       -3.9e-6
  30.e-6  5.e-6  0.0152e-3  -0.69  0.104  1.1    -0.8e-6  -0.4e-6
  30.e-6  5.e-6  0.0163e-3  -0.69  0.104  1.1    -0.8e-6  -0.4e-6
  30.e-6  5.e-6  0.0182e-3  -0.69  0.086  1.06   -0.1e-6  -0.6e-6
  20.e-6  6.e-6  0.0074e-3  -1.    0.4    0.59    0        0
</PRE>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i>March 31, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{91,50}}, color={0,0,255}),
            Line(points={{10,0},{90,0}}, color={0,0,255}),
            Line(points={{10,-50},{90,-50}}, color={0,0,255}),
            Polygon(
              points={{60,0},{40,5},{40,-5},{60,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-155,120},{145,80}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,0}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-100,-50},{-10,-50}}, color={0,0,255}),
            Line(points={{-10,-50},{-10,50}}, color={0,0,255}),
            Line(points={{10,70},{10,29}}, color={0,0,255}),
            Line(points={{10,20},{10,-21}}, color={0,0,255}),
            Line(points={{10,-30},{10,-71}}, color={0,0,255}),
            Line(points={{10,50},{96,50}}, color={0,0,255}),
            Line(points={{10,0},{101,0}}, color={0,0,255}),
            Line(points={{10,-50},{100,-50}}, color={0,0,255}),
            Polygon(
              points={{60,0},{40,5},{40,-5},{60,0}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
          end HeatingPMOS;

          model HeatingNPN
      "Simple NPN BJT according to Ebers-Moll with heating port"
            parameter Real Bf=50 "Forward beta";
            parameter Real Br=0.1 "Reverse beta";
            parameter Modelica_SIunits.Current Is=1.e-16
        "Transport saturation current";
            parameter Modelica_SIunits.InversePotential Vak=0.02
        "Early voltage (inverse), 1/Volt";
            parameter Modelica_SIunits.Time Tauf=0.12e-9
        "Ideal forward transit time";
            parameter Modelica_SIunits.Time Taur=5e-9
        "Ideal reverse transit time";
            parameter Modelica_SIunits.Capacitance Ccs=1e-12
        "Collector-substrate(ground) cap.";
            parameter Modelica_SIunits.Capacitance Cje=0.4e-12
        "Base-emitter zero bias depletion cap.";
            parameter Modelica_SIunits.Capacitance Cjc=0.5e-12
        "Base-coll. zero bias depletion cap.";
            parameter Modelica_SIunits.Voltage Phie=0.8
        "Base-emitter diffusion voltage";
            parameter Real Me=0.4 "Base-emitter gradation exponent";
            parameter Modelica_SIunits.Voltage Phic=0.8
        "Base-collector diffusion voltage";
            parameter Real Mc=0.333 "Base-collector gradation exponent";
            parameter Modelica_SIunits.Conductance Gbc=1e-15
        "Base-collector conductance";
            parameter Modelica_SIunits.Conductance Gbe=1e-15
        "Base-emitter conductance";
            parameter Real EMin=-100
        "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40
        "if x > EMax, the exp(x) function is linearized";
            parameter Modelica_SIunits.Temperature Tnom=300.15
        "Parameter measurement temperature";
            parameter Real XTI=3 "Temperature exponent for effect on Is";
            parameter Real XTB=0
        "Forward and reverse beta temperature exponent";
            parameter Real EG=1.11 "Energy gap for temperature effect on Is";
            parameter Real NF=1.0 "Forward current emission coefficient";
            parameter Real NR=1.0 "Reverse current emission coefficient";
            parameter Real K=1.3806226e-23 "Boltzmann's constant";
            parameter Real q=1.6021918e-19 "Elementary electronic charge";
            extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(
          useHeatPort=true);
            /*protected*/
            Real vbc;
            Real vbe;
            Real qbk;
            Real ibc;
            Real ibe;
            Real cbc;
            Real cbe;
            Real ExMin;
            Real ExMax;
            Real Capcje;
            Real Capcjc;
            Real is_t;
            Real br_t;
            Real bf_t;
            Real vt_t;
            Real hexp;
            Real htempexp;
    public
            Modelica_Electrical_Analog.Interfaces.Pin C "Collector" annotation (Placement(
            transformation(extent={{90,40},{110,60}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin B "Base" annotation (
          Placement(transformation(extent={{-90,-10},{-110,10}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin E "Emitter" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
          equation
            assert( T_heatPort > 0,"temperature must be positive");
            ExMin = exp(EMin);
            ExMax = exp(EMax);
            vbc = B.v - C.v;
            vbe = B.v - E.v;
            qbk = 1 - vbc*Vak;

            hexp = (T_heatPort/Tnom - 1)*EG/vt_t;
            htempexp = smooth(1,if (hexp < EMin) then ExMin*(hexp - EMin + 1) else if (
              hexp > EMax) then ExMax*(hexp - EMax + 1) else exp(hexp));

            is_t = Is*pow((T_heatPort/Tnom), XTI)*htempexp;
            br_t = Br*pow((T_heatPort/Tnom), XTB);
            bf_t = Bf*pow((T_heatPort/Tnom), XTB);
            vt_t = (K/q)*T_heatPort;

            ibc = smooth(1,(if (vbc/(NR*vt_t) < EMin) then is_t*(ExMin*(vbc/(NR*vt_t) -
              EMin + 1) - 1) + vbc*Gbc else if (vbc/(NR*vt_t) > EMax) then is_t*(
              ExMax*(vbc/(NR*vt_t) - EMax + 1) - 1) + vbc*Gbc else is_t*(exp(vbc/
              (NR*vt_t)) - 1) + vbc*Gbc));
            ibe = smooth(1,(if (vbe/(NF*vt_t) < EMin) then is_t*(ExMin*(vbe/(NF*vt_t) -
              EMin + 1) - 1) + vbe*Gbe else if (vbe/(NF*vt_t) > EMax) then is_t*(
              ExMax*(vbe/(NF*vt_t) - EMax + 1) - 1) + vbe*Gbe else is_t*(exp(vbe/
              (NF*vt_t)) - 1) + vbe*Gbe));
            Capcjc = smooth(1,(if (vbc/Phic > 0) then Cjc*(1 + Mc*vbc/Phic) else Cjc*pow(1
               - vbc/Phic, -Mc)));
            Capcje = smooth(1,(if (vbe/Phie > 0) then Cje*(1 + Me*vbe/Phie) else Cje*pow(1
               - vbe/Phie, -Me)));
            cbc = smooth(1,(if (vbc/(NR*vt_t) < EMin) then Taur*is_t/(NR*vt_t)*ExMin*(vbc/(
              NR*vt_t) - EMin + 1) + Capcjc else if (vbc/(NR*vt_t) > EMax) then
              Taur*is_t/(NR*vt_t)*ExMax*(vbc/(NR*vt_t) - EMax + 1) + Capcjc else
              Taur*is_t/(NR*vt_t)*exp(vbc/(NR*vt_t)) + Capcjc));
            cbe = smooth(1,(if (vbe/(NF*vt_t) < EMin) then Tauf*is_t/(NF*vt_t)*ExMin*(vbe/(
              NF*vt_t) - EMin + 1) + Capcje else if (vbe/(NF*vt_t) > EMax) then
              Tauf*is_t/(NF*vt_t)*ExMax*(vbe/(NF*vt_t) - EMax + 1) + Capcje else
              Tauf*is_t/(NF*vt_t)*exp(vbe/(NF*vt_t)) + Capcje));
            C.i = (ibe - ibc)*qbk - ibc/br_t - cbc*der(vbc) + Ccs*der(C.v);
            B.i = ibe/bf_t + ibc/br_t + cbc*der(vbc) + cbe*der(vbe);
            E.i = -B.i - C.i + Ccs*der(C.v);

            LossPower = (vbc*ibc/br_t + vbe*ibe/bf_t + (ibe - ibc)*qbk*(C.v - E.v));
            annotation (
              Documentation(info="<html>
<p>This model is a simple model of a bipolar NPN junction transistor according to Ebers-Moll.
<br>A heating port is added for thermal electric simulation. The heating port is defined in the Modelica.Thermal library.
<br>A typical parameter set is (the parameter Vt is no longer used):</p>
<pre>  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15</pre>
<p><b>References:</b></p>
<p>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design. Van Nostrand Reinhold, New York 1983 on page 317 ff.</p>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>March 20, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-90,0}}, color={0,0,255}),
            Line(points={{91,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{91,-50}}, color={0,0,255}),
            Polygon(
              points={{30,-50},{24,-36},{16,-44},{30,-50}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-162,125},{138,85}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-100,0}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{100,-50}}, color={0,0,255}),
            Line(points={{100,50},{30,50}}, color={0,0,255}),
            Polygon(
              points={{30,-50},{24,-36},{16,-44},{30,-50}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
          end HeatingNPN;

          model HeatingPNP
      "Simple PNP BJT according to Ebers-Moll with heating port"
            parameter Real Bf=50 "Forward beta";
            parameter Real Br=0.1 "Reverse beta";
            parameter Modelica_SIunits.Current Is=1.e-16
        "Transport saturation current";
            parameter Modelica_SIunits.InversePotential Vak=0.02
        "Early voltage (inverse), 1/Volt";
            parameter Modelica_SIunits.Time Tauf=0.12e-9
        "Ideal forward transit time";
            parameter Modelica_SIunits.Time Taur=5e-9
        "Ideal reverse transit time";
            parameter Modelica_SIunits.Capacitance Ccs=1e-12
        "Collector-substrate(ground) cap.";
            parameter Modelica_SIunits.Capacitance Cje=0.4e-12
        "Base-emitter zero bias depletion cap.";
            parameter Modelica_SIunits.Capacitance Cjc=0.5e-12
        "Base-coll. zero bias depletion cap.";
            parameter Modelica_SIunits.Voltage Phie=0.8
        "Base-emitter diffusion voltage";
            parameter Real Me=0.4 "Base-emitter gradation exponent";
            parameter Modelica_SIunits.Voltage Phic=0.8
        "Base-collector diffusion voltage";
            parameter Real Mc=0.333 "Base-collector gradation exponent";
            parameter Modelica_SIunits.Conductance Gbc=1e-15
        "Base-collector conductance";
            parameter Modelica_SIunits.Conductance Gbe=1e-15
        "Base-emitter conductance";
            parameter Real EMin=-100
        "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40
        "if x > EMax, the exp(x) function is linearized";
            parameter Modelica_SIunits.Temperature Tnom=300.15
        "Parameter measurement temperature";
            parameter Real XTI=3 "Temperature exponent for effect on Is";
            parameter Real XTB=0
        "Forward and reverse beta temperature exponent";
            parameter Real EG=1.11 "Energy gap for temperature effect on Is";
            parameter Real NF=1.0 "Forward current emission coefficient";
            parameter Real NR=1.0 "Reverse current emission coefficient";
            parameter Real K=1.3806226e-23 "Boltzmann's constant";
            parameter Real q=1.6021918e-19 "Elementary electronic charge";
            extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(
          useHeatPort=true);
    protected
            Real vcb;
            Real veb;
            Real qbk;
            Real icb;
            Real ieb;
            Real ccb;
            Real ceb;
            Real ExMin;
            Real ExMax;
            Real Capcje;
            Real Capcjc;
            Real is_t;
            Real br_t;
            Real bf_t;
            Real vt_t;
            Real hexp;
            Real htempexp;
    public
            Modelica_Electrical_Analog.Interfaces.Pin C "Collector" annotation (Placement(
            transformation(extent={{90,40},{110,60}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin B "Base" annotation (
          Placement(transformation(extent={{-90,-10},{-110,10}}, rotation=0)));
            Modelica_Electrical_Analog.Interfaces.Pin E "Emitter" annotation (
          Placement(transformation(extent={{90,-40},{110,-60}}, rotation=0)));
          equation
            assert( T_heatPort > 0,"temperature must be positive");
            ExMin = exp(EMin);
            ExMax = exp(EMax);
            vcb = C.v - B.v;
            veb = E.v - B.v;
            qbk = 1 - vcb*Vak;

            hexp = (T_heatPort/Tnom - 1)*EG/vt_t;
            htempexp = smooth(1,if (hexp < EMin) then ExMin*(hexp - EMin + 1) else if (
              hexp > EMax) then ExMax*(hexp - EMax + 1) else exp(hexp));

            is_t = Is*pow((T_heatPort/Tnom), XTI)*htempexp;
            br_t = Br*pow((T_heatPort/Tnom), XTB);
            bf_t = Bf*pow((T_heatPort/Tnom), XTB);
            vt_t = (K/q)*T_heatPort;

            icb = smooth(1,(if (vcb/(NR*vt_t) < EMin) then is_t*(ExMin*(vcb/(NR*vt_t) -
              EMin + 1) - 1) + vcb*Gbc else if (vcb/(NR*vt_t) > EMax) then is_t*(
              ExMax*(vcb/(NR*vt_t) - EMax + 1) - 1) + vcb*Gbc else is_t*(exp(vcb/
              (NR*vt_t)) - 1) + vcb*Gbc));

            ieb = smooth(1,(if (veb/(NF*vt_t) < EMin) then is_t*(ExMin*(veb/(NF*vt_t) -
              EMin + 1) - 1) + veb*Gbe else if (veb/(NF*vt_t) > EMax) then is_t*(
              ExMax*(veb/(NF*vt_t) - EMax + 1) - 1) + veb*Gbe else is_t*(exp(veb/
              (NF*vt_t)) - 1) + veb*Gbe));

            Capcjc = smooth(1,(if (vcb/Phic > 0) then Cjc*(1 + Mc*vcb/Phic) else Cjc*pow(1
               - vcb/Phic, -Mc)));
            Capcje = smooth(1,(if (veb/Phie > 0) then Cje*(1 + Me*veb/Phie) else Cje*pow(1
               - veb/Phie, -Me)));
            ccb = smooth(1,(if (vcb/(NR*vt_t) < EMin) then Taur*is_t/(NR*vt_t)*ExMin*(vcb/(
              NR*vt_t) - EMin + 1) + Capcjc else if (vcb/(NR*vt_t) > EMax) then
              Taur*is_t/(NR*vt_t)*ExMax*(vcb/(NR*vt_t) - EMax + 1) + Capcjc else
              Taur*is_t/(NR*vt_t)*exp(vcb/(NR*vt_t)) + Capcjc));
            ceb = smooth(1,(if (veb/(NF*vt_t) < EMin) then Tauf*is_t/(NF*vt_t)*ExMin*(veb/(
              NF*vt_t) - EMin + 1) + Capcje else if (veb/(NF*vt_t) > EMax) then
              Tauf*is_t/(NF*vt_t)*ExMax*(veb/(NF*vt_t) - EMax + 1) + Capcje else
              Tauf*is_t/(NF*vt_t)*exp(veb/(NF*vt_t)) + Capcje));
            C.i = icb/br_t + ccb*der(vcb) + Ccs*der(C.v) + (icb - ieb)*qbk;
            B.i = -ieb/bf_t - icb/br_t - ceb*der(veb) - ccb*der(vcb);
            E.i = -B.i - C.i + Ccs*der(C.v);

            LossPower = (vcb*icb/br_t + veb*ieb/bf_t + (icb - ieb)*qbk*(C.v- E.v));
            annotation (
              Documentation(info="<html>
<p>This model is a simple model of a bipolar PNP junction transistor according to Ebers-Moll.
<br>A heating port is added for thermal electric simulation. The heating port is defined in the Modelica.Thermal library.
<br>A typical parameter set is (the parameter Vt is no longer used):</p>
<pre>  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15</pre>
<p><b>References:</b></p>
<p>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design. Van Nostrand Reinhold, New York 1983 on page 317 ff.</p>
</html>",    revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>March 20, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-90,0}}, color={0,0,255}),
            Line(points={{91,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{91,-50}}, color={0,0,255}),
            Polygon(
              points={{-10,-10},{5,-17},{-3,-25},{-10,-10}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-155,117},{145,77}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
            Line(points={{-10,0},{-99,0}}, color={0,0,255}),
            Line(points={{96,50},{30,50}}, color={0,0,255}),
            Line(points={{30,50},{-10,10}}, color={0,0,255}),
            Line(points={{-10,-10},{30,-50}}, color={0,0,255}),
            Line(points={{30,-50},{96,-50}}, color={0,0,255}),
            Polygon(
              points={{-10,-10},{5,-17},{-3,-25},{-10,-10}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
          end HeatingPNP;

  protected
          function pow
      "Just a helper function for x^y in order that a symbolic engine can apply some transformations more easily"
            extends Modelica_Icons.Function;
            input Real x;
            input Real y;
            output Real z;
          algorithm
            z := x^y;
          end pow;

          function exlin
      "Exponential function linearly continued for x > Maxexp"
            extends Modelica_Icons.Function;
            input Real x;
            input Real Maxexp;
            output Real z;
          algorithm
            z := if x > Maxexp then exp(Maxexp)*(1 + x - Maxexp) else exp(x);
          end exlin;

  public
    model Thyristor "Simple Thyristor Model"
      parameter Modelica_SIunits.Voltage VDRM(final min=0) = 100
        "Forward breakthrough voltage";
      parameter Modelica_SIunits.Voltage VRRM(final min=0) = 100
        "Reverse breakthrough voltage";
      parameter Modelica_SIunits.Current IDRM=0.1 "Saturation current";
      parameter Modelica_SIunits.Voltage VTM= 1.7 "Conducting voltage";
      parameter Modelica_SIunits.Current IH=6e-3 "Holding current";
      parameter Modelica_SIunits.Current ITM= 25 "Conducting current";

      parameter Modelica_SIunits.Voltage VGT= 0.7 "Gate trigger voltage";
      parameter Modelica_SIunits.Current IGT= 5e-3 "Gate trigger current";

      parameter Modelica_SIunits.Time TON = 1e-6 "Switch on time";
      parameter Modelica_SIunits.Time TOFF = 15e-6 "Switch off time";
      parameter Modelica_SIunits.Voltage Vt=0.04
        "Voltage equivalent of temperature (kT/qn)";
      parameter Real Nbv=0.74 "Reverse Breakthrough emission coefficient";
     extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort;
      Real iGK "gate current";
      Real vGK "voltage between gate and cathode";
      Real vAK "voltage between anode and cathode";
      Real vControl(start=0);
      Real vContot;
      Real vConmain;

    public
      Modelica_Electrical_Analog.Interfaces.PositivePin Anode annotation (
          Placement(transformation(extent={{-95,-12},{-75,8}}),
            iconTransformation(extent={{-100,-10},{-80,10}})));
      Modelica_Electrical_Analog.Interfaces.NegativePin Cathode annotation (
          Placement(transformation(extent={{80,-10},{100,10}}),
            iconTransformation(extent={{80,-10},{100,10}})));
      Modelica_Electrical_Analog.Interfaces.PositivePin Gate annotation (
          Placement(transformation(extent={{60,80},{80,100}}),
            iconTransformation(extent={{60,80},{80,100}})));

    protected
      parameter Modelica_SIunits.Voltage Von=5;
      parameter Modelica_SIunits.Voltage Voff= 1.5;
      parameter Modelica_SIunits.Resistance Ron=(VTM-0.7)/ITM
        "Forward conducting mode resistance";
      parameter Modelica_SIunits.Resistance Roff=(VDRM^2)/VTM/IH
        "Blocking mode resistance";

    equation
      //Kirchhoff's equations
      Anode.i+Gate.i+Cathode.i=0;
      vGK=Gate.v-Cathode.v;
      vAK=Anode.v-Cathode.v;

      // Gate and Control voltage
      iGK = Gate.i;
      vGK = smooth(0,(if vGK < 0.65 then VGT/IGT*iGK else
            0.65^2/VGT+iGK*(VGT-0.65)/IGT));
      vContot = vConmain + smooth(0, if iGK < 0.95 * IGT then 0 else if iGK < 0.95*IGT + 1e-3 then 10000*(iGK-0.95*IGT)*vAK else 10* vAK);
      der(vControl)= (vContot - vControl) / (if (vContot - vControl) > 0 then 1.87*TON else 0.638*TOFF);

      // Anode-Cathode characteristics
      Anode.i= smooth(1, if vAK < -VRRM then -VRRM/Roff*exp(-(vAK+VRRM)/(Nbv*Vt)) else
             if vControl<Voff then vAK/Roff else
             if vControl<Von then vAK/(sqrt(Ron*Roff)*(Ron/Roff)^((3*((2*vControl-Von-Voff)/(2*(Von-Voff)))-4*((2*vControl-Von-Voff)/(2*(Von-Voff)))^3)/2)) else
              vAK/Ron);

      // holding effect and forward breakthrough
      vConmain = (if Anode.i>IH or vAK>VDRM then Von else 0);
      LossPower = Anode.i*Anode.v + Cathode.i*Cathode.v + Gate.i*Gate.v;
     annotation (
       Documentation(info="<html>
<p>This is a simple thyristor model with three pins: Anode, Cathode and Gate. There are three operating modes:conducting, blocking and reverse breakthrough.
<br>As long as the thyristor is in blocking mode it behaves like a linear resistance Roff=VDRM^2/(VTM*IH). But if the voltage between anode and cathode exceeds VDRM or a positive gate current flows for a sufficient time the mode changes to conducting mode. The model stays in conducting mode until the anode current falls below the holding current IH. There is no way to switch off the thyristor via the gate. If the voltage between anode and cathode is negative, the model represents a diode (parameters Vt, Nbv) with reverse breakthrough voltage VRRM. </p>
<p>The dV/dt switch on is not taken into account in this model. The gate circuit is not influenced by the main circuit.</p>
</html>",
      revisions=
        "<html>
<ul>
<li><i>May 12, 2009   </i>
       by Matthias Franke
       </li>
</ul>
</html>"),
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Line(points={{30,20},{70,60},{70,90}}, color={0,0,255}),
            Line(points={{40,50},{60,30}}, color={0,0,255}),
            Text(
              extent={{-142,-59},{158,-99}},
              textString="%name",
              lineColor={0,0,255})}),
       Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,0},{80,0}}, color={128,128,128}),
            Polygon(
              points={{70,4},{80,0},{70,-4},{70,4}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Line(points={{0,80},{0,-80}}, color={128,128,128}),
            Polygon(
              points={{-4,70},{0,80},{4,70},{-4,70}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{5,81},{15,71}},
              lineColor={128,128,128},
              textString="i"),
            Text(
              extent={{70,-10},{80,-20}},
              lineColor={128,128,128},
              textString="v"),
            Line(
              points={{20,9},{20,0}},
              color={128,128,128},
              pattern=LinePattern.Dot),
            Text(
              extent={{25,64},{45,54}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="Ron"),
            Line(
              points={{14,20},{25,73}},
              color={0,0,0},
              thickness=0.5),
            Line(
              points={{-57,-11},{55,9}},
              color={0,0,0},
              smooth=Smooth.None,
              thickness=0.5),
            Line(
              points={{-57,-11},{-59,-13},{-60,-18},{-63,-65}},
              color={0,0,0},
              thickness=0.5,
              smooth=Smooth.None),
            Text(
              extent={{-67,11},{-47,1}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="VRRM"),
            Text(
              extent={{44,-2},{64,-12}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="VDRM"),
            Line(
              points={{-57,1},{-57,-1}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{54,1},{54,-1}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{55,9},{54,11},{50,13},{17,17},{15,18},{14,20}},
              color={0,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-28,-9},{-8,-19}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="Roff"),
            Line(
              points={{2,20},{-2,20}},
              color={0,0,0},
              smooth=Smooth.None),
            Text(
              extent={{-14,23},{-2,16}},
              lineColor={128,128,128},
              pattern=LinePattern.Dot,
              textString="IH")}));
    end Thyristor;

    model SimpleTriac "Simple triac, based on Semiconductors.Thyristor model"

      parameter Modelica_SIunits.Voltage VDRM(final min=0) = 100
        "Forward breakthrough voltage";
      parameter Modelica_SIunits.Voltage VRRM(final min=0) = 100
        "Reverse breakthrough voltage";
      parameter Modelica_SIunits.Current IDRM=0.1 "Saturation current";
      parameter Modelica_SIunits.Voltage VTM= 1.7 "Conducting voltage";
      parameter Modelica_SIunits.Current IH=6e-3 "Holding current";
      parameter Modelica_SIunits.Current ITM= 25 "Conducting current";

      parameter Modelica_SIunits.Voltage VGT= 0.7 "Gate trigger voltage";
      parameter Modelica_SIunits.Current IGT= 5e-3 "Gate trigger current";

      parameter Modelica_SIunits.Time TON = 1e-6 "Switch on time";
      parameter Modelica_SIunits.Time TOFF = 15e-6 "Switch off time";
      parameter Modelica_SIunits.Voltage Vt=0.04
        "Voltage equivalent of temperature (kT/qn)";
      parameter Real Nbv=0.74 "Reverse Breakthrough emission coefficient";

      Modelica_Electrical_Analog.Interfaces.NegativePin n "Cathode"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica_Electrical_Analog.Interfaces.PositivePin p "Anode"
        annotation (Placement(transformation(extent={{94,-10},{114,10}})));
      Modelica_Electrical_Analog.Interfaces.PositivePin g "Gate"
        annotation (Placement(transformation(extent={{-72,-106},{-52,-86}})));
      Modelica_Electrical_Analog.Semiconductors.Thyristor thyristor(
        VDRM=VDRM,
        VRRM=VRRM,
        useHeatPort=useHeatPort,
        T=T) annotation (Placement(transformation(extent={{-20,30},{0,50}})));
      Modelica_Electrical_Analog.Semiconductors.Thyristor thyristor1(
        VDRM=VDRM,
        VRRM=VRRM,
        useHeatPort=useHeatPort,
        T=T) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-12,-40})));

      Modelica_Electrical_Analog.Ideal.IdealDiode idealDiode(Vknee=0)
        annotation (Placement(transformation(extent={{-40,58},{-20,78}})));
      Modelica_Electrical_Analog.Ideal.IdealDiode idealDiode1(Vknee=0)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-20,-72})));

    parameter Boolean useHeatPort = false "=true, if HeatPort is enabled"
      annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
    parameter Modelica_SIunits.Temperature T=293.15
        "Fixed device temperature if useHeatPort = false" annotation(Dialog(enable=not useHeatPort));

    Modelica_Thermal_HeatTransfer.Interfaces.HeatPort_a heatPort if useHeatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-10,-110},{10,-90}})));

    equation
      if useHeatPort then
       connect(heatPort, thyristor.heatPort);
       connect(heatPort, thyristor1.heatPort);
     end if;
      connect(thyristor.Anode, n) annotation (Line(
          points={{-19,40},{-18,40},{-18,48},{-70,48},{-70,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(thyristor1.Anode, p) annotation (Line(
          points={{-3,-40},{-2,-40},{-2,-60},{80,-60},{80,0},{104,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(thyristor1.Anode, thyristor.Cathode) annotation (Line(
          points={{-3,-40},{-2,-40},{-2,40},{-1,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(thyristor1.Cathode, thyristor.Anode) annotation (Line(
          points={{-21,-40},{-22,-40},{-22,40},{-19,40}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(thyristor.Gate, idealDiode.n) annotation (Line(
          points={{-3,49},{-3,59.5},{-20,59.5},{-20,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealDiode.p, g) annotation (Line(
          points={{-40,68},{-82,68},{-82,-96},{-62,-96}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealDiode1.n, thyristor1.Gate) annotation (Line(
          points={{-20,-62},{-20,-49},{-19,-49}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(idealDiode1.p, g) annotation (Line(
          points={{-20,-82},{-42,-82},{-42,-96},{-62,-96}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{-30,0},{-30,-100},{70,-50},{-30,0}},
              lineColor={0,0,255},
              smooth=Smooth.None),
            Polygon(
              points={{70,100},{70,0},{-30,50},{70,100}},
              lineColor={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{70,0},{70,-100}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-30,0},{-30,100}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-30,0},{-90,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{70,0},{110,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-62,-86},{-62,-56},{-30,-44}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{-102,130},{98,100}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>This is a simple TRIAC model based on the extended thyristor model Modelica.Electrical.Analog.Semiconductors.Thyristor.
<br>Two thyristors are contrarily connected in parallel, whereas each transistor is connected with a diode.
<br>Further information regarding the electrical component TRIAC can be detected in documentation of the ideal TRIAC model.
<br>As an additional information: this model is based on the Modelica.Electrical.Analog.Semiconductors.Thyristor.</p>
<p><b>Attention:</b> The model seems to be very sensitive with respect to the choice of some parameters (e.g., VDRM, VRRM). This is caused by the thyristor model. Further investigations are necessary.</p>
</html>",
       revisions="<html>
<ul>
<li><i>November 25, 2009   </i> <br>

       by Susann Wolf <br><br>
       </li>
</ul>
</html>"));
    end SimpleTriac;

    model Diode2 "Improved diode model"
       import SIunits = Modelica_SIunits;
        extends Modelica_Electrical_Analog.Interfaces.OnePort;
      parameter Modelica_SIunits.Voltage Vf=0.7 "Forward voltage";
      parameter Modelica_SIunits.Current Ids=1.e-13
        "Reverse saturation current";
      parameter Modelica_SIunits.Resistance Rs=16 "Ohmic resistance";
      parameter Modelica_SIunits.Voltage Vt=0.026 "Thermal voltage (kT/q)";
        parameter Real N = 1 "Emission coefficient";
      parameter Modelica_SIunits.Voltage Bv=100 "Reverse breakdown voltage";
      parameter Modelica_SIunits.Conductance Gp=1e-6
        "Parallel conductance for numerical stability";
    protected
      parameter Modelica_SIunits.Voltage VdMax=Vf + (N*Vt)
        "Linear continuation threshold";
      parameter Modelica_SIunits.Current iVdMax=Ids*(exp(VdMax/(N*Vt)) - 1)
        "Current at threshold";
      parameter Modelica_SIunits.Conductance diVdMax=Ids*exp(VdMax/(N*Vt))/(N*
          Vt) "Conductance at threshold";
      Modelica_SIunits.Voltage Vd "Voltage across pure diode part";
      Modelica_SIunits.Current id "diode current";
        extends Modelica_Electrical_Analog.Interfaces.ConditionalHeatPort(T=
            293.15);
    equation
        id = smooth(1,
                   if Vd < -Bv / 2 then
                       -Ids * (exp(-(Vd+Bv)/(N*Vt)) + 1 - 2*exp(-Bv/(2*N*Vt)))
                   elseif Vd < VdMax then
                       Ids * (exp(Vd/(N*Vt)) - 1)
                   else
                       iVdMax + (Vd - VdMax) * diVdMax);                        //Lower half of reverse biased region including breakdown.
                                                   //Upper half of reverse biased region, and forward biased region before conduction.
                                                          //Forward biased region after conduction

        v = Vd + id * Rs;
        i = id + v*Gp;
        LossPower=i*v;

        assert(Bv>0, "Bv must be grater then zero", AssertionLevel.error);
        assert(Vf>0, "Vf musst be greater then zero", AssertionLevel.error);
        assert(Vt>0, "Vt must be greater then zero", AssertionLevel.error);
      annotation (
        Documentation(info="<html>
<p>This diode model Modelica.Electrical.Analog.Semiconductors.Diode2 is an improved version of the existing diode model Modelica.Electrical.Analog.Semiconductors.Diode. It was proposed by Stefan Vorkoetter.The model is devided into three parts:</p>
<ul>
<li>lower half of reversed bias region including breakdown: -Ids * (exp(-(Vd+Bv)/(N*Vt)) + 1 - 2*exp(-Bv/(2*N*Vt)))</li>
<li>upper half of reverse biased region and forward biased region before conduction: Ids * (exp(Vd/(N*Vt)) - 1</li>
<li>forward biased region after conduction: iVdMax + (Vd-VdMax) * diVdMax</li>
</ul>
<p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled yet. The parameters are not temperature dependent.</p>
</html>",
     revisions="<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> November 15, 2005   </i>
       by Christoph Clauss<br> smooth function added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{40,0}}, color={0,0,255}),
            Line(points={{40,0},{90,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255}),
            Text(
              extent={{-154,100},{146,60}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=useHeatPort,
              points={{0,-100},{0,-20}},
              color={127,0,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{30,0},{-30,40},{-30,-40},{30,0}},
              lineColor={0,0,255},
              fillColor={255,0,0},
              fillPattern=FillPattern.None),
            Line(points={{-96,0},{96,0}}, color={0,0,255}),
            Line(points={{30,40},{30,-40}}, color={0,0,255})}));
    end Diode2;
    annotation (
      Documentation(info="<html>
<p>This package contains semiconductor devices:</p>
<ul>
<li>diode</li>
<li>MOS transistors</li>
<li>bipolar transistors</li>
<li>thyristor</li>
<li>triac</li>
</ul>
<p>Most of the semiconductor devices contain a conditional heat port, which is not active by default. If it is active the loss power is calculated to be used in a thermal net. The heating variants of the semiconductor devices are provided to use the thermal port temperature in the electric calculation. That means that for a true thermal electric interaction the heating device models have to be used.</p>
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
</dl>
</html>"),   Icon(graphics={
            Line(points={{-20,0},{-90,0}}, color={0,0,0}),
            Line(points={{-20,60},{-20,-60}}, color={0,0,0}),
            Line(points={{20,68},{-20,28}}, color={0,0,0}),
            Line(points={{80,68},{20,68}}, color={0,0,0}),
            Line(points={{-20,-30},{20,-70}}, color={0,0,0}),
            Line(points={{20,-70},{80,-70}}, color={0,0,0})}));
  end Semiconductors;

  package Sensors "Potential, voltage, current, and power sensors"

    extends Modelica_Icons.SensorsPackage;

    model PotentialSensor "Sensor to measure the potential"
      extends Modelica_Icons.RotationalSensor;

      Interfaces.PositivePin p "pin to be measured" annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_Blocks.Interfaces.RealOutput phi(unit="V")
        "Absolute voltage potential as output signal"
          annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
    equation
      p.i = 0;
      phi = p.v;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-29,-11},{30,-70}},
              lineColor={0,0,0},
              textString="V"),
            Line(points={{-70,0},{-90,0}}, color={0,0,255}),
            Line(points={{100,0},{70,0}}, color={0,0,127}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Line(points={{-70,0},{-96,0}}, color={0,0,0}),
              Line(points={{100,0},{70,0}}, color={0,0,127})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The potential sensor converts the voltage of a node (with respect to the ground node) into a real valued signal. It does not influence the current sum at the node which voltage is measured, therefore, the electrical behavior is not influenced by the sensor.</p>
</html>"));
    end PotentialSensor;

    model VoltageSensor "Sensor to measure the voltage between two pins"
      extends Modelica_Icons.RotationalSensor;

      Interfaces.PositivePin p "positive pin" annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n "negative pin" annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Blocks.Interfaces.RealOutput v(unit="V")
        "Voltage between pin p and n (= p.v - n.v) as output signal"
         annotation (Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));

    equation
      p.i = 0;
      n.i = 0;
      v = p.v - n.v;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-29,-11},{30,-70}},
              lineColor={0,0,0},
              textString="V"),
            Line(points={{-70,0},{-90,0}}, color={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-90},{0,-70}}, color={0,0,127}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-70,0},{-96,0}}, color={0,0,0}),
            Line(points={{70,0},{96,0}}, color={0,0,0}),
            Line(points={{0,-90},{0,-70}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The voltage sensor converts the voltage between the two connectors into a real valued signal. It does not influence the current sum at the nodes in between the voltage is measured, therefore, the electrical behavior is not influenced by the sensor.</p>
</html>"));
    end VoltageSensor;

    model CurrentSensor "Sensor to measure the current in a branch"
      extends Modelica_Icons.RotationalSensor;

      Interfaces.PositivePin p "positive pin" annotation (Placement(
            transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n "negative pin" annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
      Modelica_Blocks.Interfaces.RealOutput i(unit="A")
        "Current in the branch from p to n as output signal"
         annotation (Placement(transformation(
            origin={0,-100},
            extent={{10,-10},{-10,10}},
            rotation=90)));

    equation
      p.v = n.v;
      p.i = i;
      n.i = -i;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-29,-11},{30,-70}},
              lineColor={0,0,0},
              textString="A"),
            Line(points={{-70,0},{-90,0}}, color={0,0,255}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{70,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-90},{0,-70}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-153,79},{147,119}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{-70,0},{-96,0}}, color={0,0,0}),
            Line(points={{70,0},{96,0}}, color={0,0,0}),
            Line(points={{0,-90},{0,-70}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The current sensor converts the current flowing between the two connectors into a real valued signal. The two connectors are in the sensor connected like a short cut. The sensor has to be placed within an electrical connection in series.  It does not influence the current sum at the connected nodes. Therefore, the electrical behavior is not influenced by the sensor.</p>
</html>"));
    end CurrentSensor;

  model PowerSensor "Sensor to measure the power"
    extends Modelica_Icons.RotationalSensor;
    Modelica_Electrical_Analog.Interfaces.PositivePin pc
        "Positive pin, current path" annotation (Placement(transformation(
              extent={{-90,-10},{-110,10}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.NegativePin nc
        "Negative pin, current path" annotation (Placement(transformation(
              extent={{110,-10},{90,10}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.PositivePin pv
        "Positive pin, voltage path" annotation (Placement(transformation(
              extent={{-10,110},{10,90}}, rotation=0)));
    Modelica_Electrical_Analog.Interfaces.NegativePin nv
        "Negative pin, voltage path" annotation (Placement(transformation(
              extent={{10,-110},{-10,-90}}, rotation=0)));
    Modelica_Blocks.Interfaces.RealOutput power(unit="W")
        "Instantaneous power as output signal"
      annotation (Placement(transformation(
            origin={-80,-110},
            extent={{-10,10},{10,-10}},
            rotation=270)));
    Modelica_Electrical_Analog.Sensors.VoltageSensor voltageSensor annotation (
          Placement(transformation(
            origin={0,-30},
            extent={{10,10},{-10,-10}},
            rotation=90)));
    Modelica_Electrical_Analog.Sensors.CurrentSensor currentSensor annotation (
          Placement(transformation(extent={{-50,-10},{-30,10}}, rotation=0)));
    Modelica_Blocks.Math.Product product
      annotation (Placement(transformation(
            origin={-30,-50},
            extent={{-10,-10},{10,10}},
            rotation=270)));

  equation
    connect(pv, voltageSensor.p) annotation (Line(points={{0,100},{0,-20}},
                                  color={0,0,255}));
    connect(voltageSensor.n, nv) annotation (Line(points={{0,-40},{0,-63},{0,-100}},
                                                    color={0,0,255}));
    connect(pc, currentSensor.p)
      annotation (Line(points={{-100,0},{-50,0}}, color={0,0,255}));
    connect(currentSensor.n, nc)
      annotation (Line(points={{-30,0},{100,0}}, color={0,0,255}));
    connect(currentSensor.i, product.u2) annotation (Line(points={{-40,-10},{-40,
              -30},{-36,-30},{-36,-38}}, color={0,0,127}));
    connect(voltageSensor.v, product.u1) annotation (Line(points={{-10,-30},{-24,
              -30},{-24,-38}}, color={0,0,127}));
    connect(product.y, power) annotation (Line(points={{-30,-61},{-30,-80},{-80,
              -80},{-80,-110}}, color={0,0,127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Line(points=  {{0,100},{0,70}}, color=  {0,0,255}),
        Line(points=  {{0,-70},{0,-100}}, color=  {0,0,255}),
        Line(points=  {{-80,-100},{-80,-80},{-46,-52}}, color=  {0,0,127}),
        Line(points=  {{-100,0},{100,0}}, color=  {0,0,255}),
        Text(lineColor=  {0,0,255}, extent=  {{-150,120},{150,160}}, textString=  "%name"),
        Line(points=  {{0,70},{0,40}}),
        Text(extent=  {{-29,-70},{30,-11}}, textString=  "P")}),
      Documentation(info="<html>
<p>This power sensor measures instantaneous electrical power of a singlephase system and has a separated voltage and current path. The pins of the voltage path are pv and nv, the pins of the current path are pc and nc. The internal resistance of the current path is zero, the internal resistance of the voltage path is infinite.</p>
</html>",   revisions="<html>
<ul>
<li><i>January 12, 2006</i> by Anton Haumer implemented</li>
</ul>
</html>"));
  end PowerSensor;
    annotation (
      Documentation(info="<html>
<p>This package contains potential, voltage, and current sensors. The sensors can be used to convert voltages or currents into real signal values o be connected to components of the Blocks package. The sensors are designed in such a way that they do not influence the electrical behavior.</p>
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
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>
</html>"));
  end Sensors;

  package Sources "Time-dependent and controlled voltage and current sources"

    extends Modelica_Icons.SourcesPackage;

    model SignalVoltage
      "Generic voltage source using the input signal as source voltage"

      Interfaces.PositivePin p annotation (Placement(transformation(extent={{-110,
                -10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n annotation (Placement(transformation(extent={{110,
                -10},{90,10}}, rotation=0)));
      Modelica_Blocks.Interfaces.RealInput v(unit="V")
        "Voltage between pin p and n (= p.v - n.v) as input signal" annotation (
          Placement(transformation(
            origin={0,70},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica_SIunits.Current i "Current flowing from pin p to pin n";
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-50,0}}, color={0,0,255}),
            Line(points={{50,0},{90,0}}, color={0,0,255}),
            Line(points={{-50,0},{50,0}}, color={0,0,255}),
            Text(
              extent={{-150,-104},{150,-64}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-120,50},{-20,0}},
              lineColor={0,0,255},
              textString="+"),
            Text(
              extent={{20,50},{120,0}},
              lineColor={0,0,255},
              textString="-")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,0},{-50,0}},
              color={0,0,255}),Line(points={{50,0},{96,0}}, color={0,0,255}),Line(
              points={{-50,0},{50,0}}, color={0,0,255}),Line(points={{-109,20},{-84,
              20}}, color={160,160,164}),Polygon(
                points={{-94,23},{-84,20},{-94,17},{-94,23}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Line(points={{91,20},{116,20}},
              color={160,160,164}),Text(
                extent={{-109,25},{-89,45}},
                lineColor={160,160,164},
                textString="i"),Polygon(
                points={{106,23},{116,20},{106,17},{106,23}},
                lineColor={160,160,164},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),Text(
                extent={{91,45},{111,25}},
                lineColor={160,160,164},
                textString="i"),Line(points={{-119,-5},{-119,5}}, color={160,160,
              164}),Line(points={{-124,0},{-114,0}}, color={160,160,164}),Line(
              points={{116,0},{126,0}}, color={160,160,164})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The signal voltage source is a parameterless converter of real valued signals into a the source voltage. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a voltage sensor.</p>
</html>"));
    end SignalVoltage;

    model ConstantVoltage "Source for constant voltage"
      parameter Modelica_SIunits.Voltage V(start=1) "Value of constant voltage";
      extends Interfaces.OnePort;

    equation
      v = V;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{-10,0}}, color={0,0,255}),
            Line(points={{-10,60},{-10,-60}}, color={0,0,255}),
            Line(points={{0,30},{0,-30}}, color={0,0,255}),
            Line(points={{0,0},{90,0}}, color={0,0,255}),
            Text(
              extent={{-150,-112},{150,-72}},
              textString="%name=%V",
              lineColor={0,0,255}),
            Text(
              extent={{-120,50},{-20,0}},
              lineColor={0,0,255},
              textString="+"),
            Text(
              extent={{20,50},{120,0}},
              lineColor={0,0,255},
              textString="-")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-96,0},{-10,0}}, color={0,0,
              255}),Line(points={{-10,60},{-10,-60}}, color={0,0,255}),Line(
              points={{0,30},{0,-30}}, color={0,0,255}),Line(points={{0,0},{96,0}},
              color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The ConstantVoltage source is a simple source for an ideal constant voltage which is provided by a parameter. There is no internal resistance modeled. If it is used instead of a battery model it is not very realistic: This battery will never be unloaded.</p>
</html>"));
    end ConstantVoltage;

    model StepVoltage "Step voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Height of step";
      extends Interfaces.VoltageSource(redeclare Modelica_Blocks.Sources.Step
          signalSource(height=V));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-70,-70},{0,-70},{0,70},{69,70}},
                color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(
                points={{-80,-18},{0,-18},{0,50},{80,50}},
                color={0,0,0},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,
              192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Text(
                extent={{-21,-72},{25,-90}},
                lineColor={160,160,164},
                textString="startTime"),Line(
                points={{0,-17},{0,-71}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-68,-36},{-22,-54}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-13,50},{-13,-17}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{0,50},{-19,50},{0,50}},
                lineColor={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-13,50},{-16,37},{-9,37},{-13,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-68,26},{-22,8}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-13,-18},{-13,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-13,-18},{-16,-31},{-9,-31},{-13,-18}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-67,93},{-2,67}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end StepVoltage;

    model RampVoltage "Ramp voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Height of ramp";
      parameter Modelica_SIunits.Time duration(min=Modelica_Constants.small,
          start=2) "Duration of ramp";
      extends Interfaces.VoltageSource(redeclare Modelica_Blocks.Sources.Ramp
          signalSource(final height=V, final duration=duration));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(
                points={{-80,-20},{-20,-20},{50,50}},
                color={0,0,0},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,
              192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-40,-20},{-42,-30},{-38,-30},{-40,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-20},{-40,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-80,-33},{-41,-49}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-40,-70},{6,-88}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{-67,93},{-2,67}},
                lineColor={160,160,164},
                textString="v = p.v - n.v"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-20,-20},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-19,-20},{50,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Line(
                points={{50,50},{101,50}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{50,50},{50,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{50,-20},{42,-18},{42,-22},{50,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-20,-20},{-11,-18},{-11,-22},{-20,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{50,50},{48,40},{52,40},{50,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{50,-20},{48,-10},{52,-10},{50,-20},{50,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{53,25},{82,7}},
                lineColor={160,160,164},
                textString="V"),Text(
                extent={{0,-17},{35,-37}},
                lineColor={160,160,164},
                textString="duration")}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-80,-60},{-50,-60},{50,60},{80,60}},
                color={192,192,192})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end RampVoltage;

    model SineVoltage "Sine voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of sine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=1)
        "Frequency of sine wave";
      extends Interfaces.VoltageSource(redeclare Modelica_Blocks.Sources.Sine
          signalSource(
          amplitude=V,
          freqHz=freqHz,
          phase=phase));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-66,0},{-56.2,29.9},{-49.8,46.5},
                  {-44.2,58.1},{-39.3,65.2},{-34.3,69.2},{-29.4,69.8},{-24.5,67},
                  {-19.6,61},{-14.6,52},{-9,38.6},{-1.98,18.6},{12.79,-26.9},{
                  19.1,-44},{24.8,-56.2},{29.7,-64},{34.6,-68.6},{39.5,-70},{44.5,
                  -67.9},{49.4,-62.5},{54.3,-54.1},{59.9,-41.3},{67,-21.7},{74,0}},
                color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{100,-40}},
              color={192,192,192}),Polygon(
                points={{100,-40},{84,-34},{84,-46},{100,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,-2},{-32.6,32.2},{-27.1,51.1},{-22.3,64.4},{-18.1,
                72.6},{-13.9,77.1},{-8,78},{-5.42,74.6},{-1.201,67.7},{3.02,57.4},
                {7.84,42.1},{13.9,19.2},{26.5,-32.8},{32,-52.2},{36.8,-66.2},{41,
                -75.1},{45.2,-80.4},{49.5,-82},{53.7,-79.6},{57.9,-73.5},{62.1,-63.9},
                {66.9,-49.2},{73,-26.8},{79,-2}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-106,-11},{-60,-29}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-41,-2},{-41,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-60,-43},{-14,-61}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{76,-52},{100,-72}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-8,78},{45,78}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-41,-2},{52,-2}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{33,78},{30,65},{37,65},{33,78}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{33,78},{33,-2}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-69,109},{-4,83}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end SineVoltage;

    model CosineVoltage "Cosine voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of cosine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of cosine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=1)
        "Frequency of cosine wave";
      extends Interfaces.VoltageSource(redeclare Modelica_Blocks.Sources.Cosine
          signalSource(
          amplitude=V,
          freqHz=freqHz,
          phase=phase));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Line(
              points={{-71,70},{-68.4,69.8},{-63.5,67},{-58.6,61},{-53.6,52},{-48,
                  38.6},{-40.98,18.6},{-26.21,-26.9},{-19.9,-44},{-14.2,-56.2},{-9.3,
                  -64},{-4.4,-68.6},{0.5,-70},{5.5,-67.9},{10.4,-62.5},{15.3,-54.1},
                  {20.9,-41.3},{28,-21.7},{35,0}},
              color={192,192,192},
              smooth=Smooth.Bezier), Line(points={{35,0},{44.8,29.9},{51.2,46.5},
                  {56.8,58.1},{61.7,65.2},{66.7,69.2},{71.6,69.8}}, color={192,
                  192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{100,-40}},
              color={192,192,192}),Polygon(
                points={{100,-40},{84,-34},{84,-46},{100,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,78},{-38,78},{-35.42,74.6},{-31.201,67.7},{-26.98,
                57.4},{-22.16,42.1},{-16.1,19.2},{-3.5,-32.8},{2,-52.2},{6.8,-66.2},
                {11,-75.1},{15.2,-80.4},{19.5,-82},{23.7,-79.6},{27.9,-73.5},{
                32.1,-63.9},{36.9,-49.2},{43,-26.8},{49,-2},{49,-2},{57.4,32.2},{
                62.9,51.1},{67.7,64.4},{71.9,72.6},{76.1,77.1},{80,78}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-106,-11},{-60,-29}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-41,-2},{-41,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-60,-43},{-14,-61}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{76,-52},{100,-72}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-8,78},{45,78}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-41,-2},{52,-2}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{33,78},{30,65},{37,65},{33,78}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{33,78},{33,-2}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-69,109},{-4,83}},
                lineColor={160,160,164},
                textString="v = p.v - n.v"),Line(
                points={{-41,78},{-41,-2}},
                color={0,0,0},
                thickness=0.5)}),
        Documentation(revisions="<html>
<ul>
<li>Initially implemented by Christian Kral on 2013-05-14</li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end CosineVoltage;

    model ExpSineVoltage "Exponentially damped sine voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of sine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=2)
        "Frequency of sine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica_SIunits.Damping damping(start=1)
        "Damping coefficient of sine wave";
      extends Interfaces.VoltageSource(redeclare
          Modelica_Blocks.Sources.ExpSine
          signalSource(
          amplitude=V,
          freqHz=freqHz,
          phase=phase,
          damping=damping));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-64,-14},{-59.2,18.3},{-56,36.3},
                  {-52.7,50.5},{-49.5,60.2},{-46.3,65.3},{-43.1,65.6},{-39.9,61.3},
                  {-36.7,53.1},{-32.6,38.2},{-27,11.8},{-19,-27.9},{-14.2,-47.7},
                  {-10.1,-59.9},{-6.1,-67.2},{-2.1,-69.3},{1.9,-66.5},{5.9,-59.3},
                  {10.77,-46.1},{24.44,-0.3},{29.3,12.4},{34.1,20.8},{38.1,24},{
                  42.9,23.2},{47.8,17.8},{54.2,5.4},{67.1,-24.5},{73.5,-35.2},{
                  79.1,-39.9},{84.7,-39.9},{91.2,-34.5},{96,-27.8}}, color={192,
                  192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{85,-40}},
              color={192,192,192}),Polygon(
                points={{100,-40},{84,-34},{84,-46},{100,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},
                {-35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{-19.9,
                22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},{
                0.302,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},{
                25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,16.9},
                {56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,-18},{80,
                -12.1}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-78,1},{-55,-19}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-72,-36},{-26,-54}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{76,-44},{100,-64}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-50,0},{18,0}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-50,0},{-80,0}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-50,77},{-50,0}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{18,0},{18,76}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{18,73},{-50,73}}, color={
              192,192,192}),Text(
                extent={{-42,88},{9,74}},
                lineColor={160,160,164},
                textString="1/freqHz"),Polygon(
                points={{-50,73},{-41,75},{-41,71},{-50,73}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{18,73},{10,75},{10,71},{18,73}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-50,-61},{-19,-61}},
              color={192,192,192}),Polygon(
                points={{-18,-61},{-26,-59},{-26,-63},{-18,-61}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-51,-63},{-27,-75}},
                lineColor={160,160,164},
                textString="t"),Text(
                extent={{-82,-67},{108,-96}},
                lineColor={160,160,164},
                textString="V*exp(-damping*t)*sin(2*pi*freqHz*t+phase)"),Line(
                points={{-50,0},{-50,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-50,-54},{-50,-72}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{18,-76},{-1,-48}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-77,105},{-38,92}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end ExpSineVoltage;

    model ExponentialsVoltage "Rising and falling exponential voltage source"
      parameter Real vMax(start=1) "Upper bound for rising edge";
      parameter Modelica_SIunits.Time riseTime(min=0, start=0.5) "Rise time";
      parameter Modelica_SIunits.Time riseTimeConst(min=Modelica_Constants.small,
          start=0.1) "Rise time constant";
      parameter Modelica_SIunits.Time fallTimeConst(min=Modelica_Constants.small,
          start=riseTimeConst) "Fall time constant";
      extends Interfaces.VoltageSource(redeclare
          Modelica_Blocks.Sources.Exponentials signalSource(
          outMax=vMax,
          riseTime=riseTime,
          riseTimeConst=riseTimeConst,
          fallTimeConst=fallTimeConst));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-76,-59},{-73.2,-44.3},{-70.3,-31.1},
                  {-66.8,-16.6},{-63.3,-4},{-59.7,6.92},{-55.5,18.18},{-51.3,27.7},
                  {-46.3,37},{-40.6,45.5},{-34.3,53.1},{-27.2,59.6},{-18.7,65.3},
                  {-8.1,70.2},{-6,71},{-3.88,58.5},{-1.05,43.7},{1.78,30.8},{
                  4.606,19.45},{8.14,7.3},{11.68,-3},{15.9,-13.2},{20.2,-21.6},{
                  25.1,-29.5},{30.8,-36.4},{37.1,-42.3},{44.9,-47.5},{54.8,-51.8},
                  {64,-54.4}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-100,-70},{100,-70}}, color={
              192,192,192}),Polygon(
                points={{100,-70},{84,-64},{84,-76},{100,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,
                25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,
                74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{
                32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},
                {47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},
                {80.9,-18.5},{90.8,-22.8},{100,-25.4}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Text(
                extent={{-70,91},{-29,71}},
                lineColor={160,160,164},
                textString="outPort"),Text(
                extent={{-78,-43},{-46,-56}},
                lineColor={160,160,164},
                textString="offset"),Polygon(
                points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{-40,-60}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-40,-30},{-42,-40},{-38,-40},{-40,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-39,-30},{-80,-30}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-59,-71},{-13,-89}},
                lineColor={160,160,164},
                textString="startTime"),Polygon(
                points={{-40,-30},{-31,-28},{-31,-32},{-40,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-39,-30},{30,-30}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{30,-30},{22,-28},{22,-32},{30,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-26,-12},{19,-28}},
                lineColor={160,160,164},
                textString="riseTime"),Text(
                extent={{78,-76},{102,-96}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,
                25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,
                74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{
                32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},
                {47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},
                {80.9,-18.5},{90.8,-22.8},{100,-25.4}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-40,-30},{-80,-30}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{30,100},{30,-34}},
                color={192,192,192},
                pattern=LinePattern.Dash)}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end ExponentialsVoltage;

    model PulseVoltage "Pulse voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of pulse";
      parameter Real width(
        final min=Modelica_Constants.small,
        final max=100,
        start=50) "Width of pulse in % of period";
      parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small,
          start=1) "Time for one period";
      extends Interfaces.VoltageSource(redeclare Modelica_Blocks.Sources.Pulse
          signalSource(
          amplitude=V,
          width=width,
          period=period));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-70,-70},{-40,-70},{-40,70},{0,70},
                  {0,-70},{40,-70},{40,70},{80,70}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-34,0},{-34,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,-24},{-35,-36}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-40,-69},{6,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-20,0},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-80,0},{-20,0},{-20,50},{21,50},{21,0},{41,0},{41,50},{
                79,50}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-20,89},{-20,50}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{21,74},{21,50}},
                color={160,160,164},
                pattern=LinePattern.Dash),Line(
                points={{41,88},{41,50}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-20,83},{41,83}}, color={
              192,192,192}),Line(points={{-20,69},{21,69}}, color={192,192,192}),
              Text(
                extent={{-11,97},{35,85}},
                lineColor={160,160,164},
                textString="period"),Text(
                extent={{-18,81},{21,69}},
                lineColor={160,160,164},
                textString="width"),Line(
                points={{-53,50},{-20,50}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-34,50},{-34,0}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-78,34},{-37,20}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{-34,50},{-37,37},{-31,37},{-34,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{79,50},{79,0},{90,0}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-20,69},{-11,71},{-11,67},{-20,69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{21,69},{13,71},{13,67},{21,69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-20,83},{-11,85},{-11,81},{-20,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{41,83},{33,85},{33,81},{41,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,103},{-24,89}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end PulseVoltage;

    model SawToothVoltage "Saw tooth voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of saw tooth";
      parameter Modelica_SIunits.Time period(start=1) "Time for one period";
      extends Interfaces.VoltageSource(redeclare
          Modelica_Blocks.Sources.SawTooth
          signalSource(amplitude=V, period=period));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-85,-70},{-65,-70},{-5,71},{-5,-70},
                  {55,71},{55,-70}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,-20},{-37,-33},{-31,-33},{-34,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-34,-20},{-34,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,-24},{-35,-36}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-31,-69},{15,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-10,-20},{-10,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-10,88},{-10,-20}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{30,88},{30,59}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-10,83},{30,83}}, color={
              192,192,192}),Text(
                extent={{-12,97},{34,85}},
                lineColor={160,160,164},
                textString="period"),Line(
                points={{-44,60},{30,60}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-34,47},{-34,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-78,34},{-37,20}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{-34,60},{-37,47},{-30,47},{-34,60}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,83},{-1,85},{-1,81},{-10,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{30,83},{22,85},{22,81},{30,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-77,100},{-27,88}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end SawToothVoltage;

    model TrapezoidVoltage "Trapezoidal voltage source"
      parameter Modelica_SIunits.Voltage V(start=1) "Amplitude of trapezoid";
      parameter Modelica_SIunits.Time rising(final min=0, start=0)
        "Rising duration of trapezoid";
      parameter Modelica_SIunits.Time width(final min=0, start=0.5)
        "Width duration of trapezoid";
      parameter Modelica_SIunits.Time falling(final min=0, start=0)
        "Falling duration of trapezoid";
      parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small,
          start=1) "Time for one period";
      parameter Integer nperiod(start=-1)
        "Number of periods (< 0 means infinite number of periods)";
      extends Interfaces.VoltageSource(redeclare
          Modelica_Blocks.Sources.Trapezoid signalSource(
          amplitude=V,
          rising=rising,
          width=width,
          falling=falling,
          period=period,
          nperiod=nperiod));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-81,-70},{-60,-70},{-30,70},{1,70},
                  {30,-70},{51,-70},{80,70}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-45,-30},{-47,-41},{-43,-41},{-45,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-45,-30},{-45,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-86,-43},{-43,-55}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-47,-69},{-1,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-30,81},{-30,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-10,59},{-10,40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{20,59},{20,39}},
                color={160,160,164},
                pattern=LinePattern.Dash),Line(
                points={{40,59},{40,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-30,56},{40,56}}, color={
              192,192,192}),Text(
                extent={{-8,70},{21,60}},
                lineColor={160,160,164},
                textString="width"),Line(
                points={{-42,40},{-10,40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-39,40},{-39,-30}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-71,13},{-34,-1}},
                lineColor={160,160,164},
                textString="V"),Polygon(
                points={{-30,56},{-23,58},{-23,54},{-30,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,56},{-17,58},{-17,54},{-10,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-80,-30},{-30,-30},{-10,40},{20,40},{40,-30},{60,-30},{
                80,46},{100,46}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-39,40},{-41,29},{-37,29},{-39,40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-39,-30},{-41,-20},{-37,-20},{-39,-30},{-39,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{60,81},{60,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{40,56},{33,58},{33,54},{40,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{20,56},{27,58},{27,54},{20,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{20,56},{13,58},{13,54},{20,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,56},{-3,58},{-3,54},{-10,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-34,70},{-5,60}},
                lineColor={160,160,164},
                textString="rising"),Text(
                extent={{16,70},{45,60}},
                lineColor={160,160,164},
                textString="falling"),Text(
                extent={{-77,103},{-23,91}},
                lineColor={160,160,164},
                textString="v = p.v - n.v"),Line(points={{-30,76},{60,76}}, color=
               {192,192,192}),Polygon(
                points={{-30,76},{-21,78},{-21,74},{-30,76}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{60,76},{52,78},{52,74},{60,76}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-2,86},{25,77}},
                lineColor={160,160,164},
                textString="period")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end TrapezoidVoltage;

    model TableVoltage "Voltage source by linear interpolation in a table"
      parameter Real table[:, :]=[0, 0; 1, 1; 2, 4]
        "Table matrix (time = first column, voltage = second column)";
      extends Interfaces.VoltageSource(redeclare
          Modelica_Blocks.Sources.TimeTable signalSource(table=table));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-58,-36},{-58,84},{42,84},{42,-36},
                  {-58,-36},{-58,-6},{42,-6},{42,24},{-58,24},{-58,54},{42,54},{
                  42,84},{-8,84},{-8,-37}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-20,90},{30,-30}},
                lineColor={255,255,255},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-20,-30},{-20,90},{
              80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},
              {80,60},{80,90},{30,90},{30,-31}}, color={0,0,0}),Text(
                extent={{-77,-42},{-38,-58}},
                lineColor={160,160,164},
                textString="offset"),Polygon(
                points={{-31,-30},{-33,-40},{-29,-40},{-31,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-31,-70},{-33,-60},{-29,-60},{-31,-70},{-31,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-31,-30},{-31,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Line(
                points={{-20,-20},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-38,-70},{8,-88}},
                lineColor={160,160,164},
                textString="startTime"),Line(
                points={{-20,-30},{-80,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{66,-81},{91,-93}},
                lineColor={160,160,164},
                textString="time"),Text(
                extent={{-15,83},{24,68}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{33,83},{76,67}},
                lineColor={0,0,0},
                textString="v"),Text(
                extent={{-81,98},{-31,85}},
                lineColor={160,160,164},
                textString="v = p.v - n.v")}),
        Documentation(info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package.  Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
<p><br>This block generates a voltage source by <b>linear interpolation</b> in a table. The time points and voltage values are stored in a matrix <b>table[i,j]</b>, where the first column table[:,1] contains the time points and the second column contains the voltage to be interpolated. The table interpolation has the following properties:</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by <b>extrapolation</b> through the last or first two points of the table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and the voltage value is just returned independently of the actual time instant, i.e., this is a constant voltage source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined by the table can be shifted both in time and in the voltage. </li>
<li>The table is implemented in a numerically sound way by generating <b>time events</b> at interval boundaries.
    This generates continuously differentiable values for the integrator.</li>
</ul>
<p>Example:</p>
<pre>   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the voltage v =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the voltage v =  2.5,
    e.g., time = 2.0, the voltage v =  4.0,
    e.g., time = 5.0, the voltage v = 23.0 (i.e., extrapolation). </pre>
<p><br>  Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TableVoltage;

    model SignalCurrent
      "Generic current source using the input signal as source current"

      Interfaces.PositivePin p annotation (Placement(transformation(extent={{-110,
                -10},{-90,10}}, rotation=0)));
      Interfaces.NegativePin n annotation (Placement(transformation(extent={{110,
                -10},{90,10}}, rotation=0)));
      Modelica_SIunits.Voltage v
        "Voltage drop between the two pins (= p.v - n.v)";
      Modelica_Blocks.Interfaces.RealInput i(unit="A")
        "Current flowing from pin p to pin n as input signal" annotation (
          Placement(transformation(
            origin={0,70},
            extent={{-20,-20},{20,20}},
            rotation=270)));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-50,0}}, color={0,0,255}),
            Line(points={{50,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-50},{0,50}}, color={0,0,255}),
            Text(
              extent={{-150,-120},{150,-80}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{90,0},{60,10},{60,-10},{90,0}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,0},{-50,0}},
              color={0,0,255}),Line(points={{50,0},{96,0}}, color={0,0,255}),Line(
              points={{0,-50},{0,50}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The signal current source is a parameterless converter of real valued signals into a the source current. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a current sensor.</p>
</html>"));
    end SignalCurrent;

    model ConstantCurrent "Source for constant current"
      parameter Modelica_SIunits.Current I(start=1) "Value of constant current";
      extends Interfaces.OnePort;
    equation
      i = I;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-50,0}}, color={0,0,255}),
            Line(points={{50,0},{90,0}}, color={0,0,255}),
            Line(points={{0,-50},{0,50}}, color={0,0,255}),
            Text(
              extent={{-150,80},{150,120}},
              textString="%name=%I",
              lineColor={0,0,255}),
            Polygon(
              points={{90,0},{60,10},{60,-10},{90,0}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-96,0},{-50,0}},
              color={0,0,255}),Line(points={{50,0},{96,0}}, color={0,0,255}),Line(
              points={{0,-50},{0,50}}, color={0,0,255})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>The ConstantCurrent source is a simple source for an ideal constant current which is provided by a parameter. There is no internal resistance modeled. No further effects are modeled. Especially, the current flow will never end.</p>
</html>"));
    end ConstantCurrent;

    model StepCurrent "Step current source"
      parameter Modelica_SIunits.Current I(start=1) "Height of step";
      extends Interfaces.CurrentSource(redeclare Modelica_Blocks.Sources.Step
          signalSource(height=I));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-86,-70},{-14,-70},{-14,70},{57,
                  70}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(
                points={{-80,-18},{0,-18},{0,50},{80,50}},
                color={0,0,0},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,
              192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Text(
                extent={{-21,-72},{25,-90}},
                lineColor={160,160,164},
                textString="startTime"),Line(
                points={{0,-17},{0,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-68,-36},{-22,-54}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-13,50},{-13,-18}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{0,50},{-19,50},{0,50}},
                lineColor={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{-13,-18},{-16,-5},{-10,-5},{-13,-18},{-13,-18}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-13,50},{-16,37},{-9,37},{-13,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-68,26},{-22,8}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{-13,-70},{-16,-57},{-10,-57},{-13,-70},{-13,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-13,-18},{-13,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-13,-18},{-16,-31},{-10,-31},{-13,-18}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end StepCurrent;

    model RampCurrent "Ramp current source"
      parameter Modelica_SIunits.Current I(start=1) "Height of ramp";
      parameter Modelica_SIunits.Time duration(min=Modelica_Constants.small,
          start=2) "Duration of ramp";
      extends Interfaces.CurrentSource(redeclare Modelica_Blocks.Sources.Ramp
          signalSource(final height=I, final duration=duration));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(
                points={{-80,-20},{-20,-20},{50,50}},
                color={0,0,0},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,
              192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-40,-20},{-42,-30},{-38,-30},{-40,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-20},{-40,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-80,-33},{-41,-49}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-40,-70},{6,-88}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-20,-20},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-19,-20},{50,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Line(
                points={{50,50},{100,50}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{50,50},{50,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{50,-20},{42,-18},{42,-22},{50,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-20,-20},{-11,-18},{-11,-22},{-20,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{50,50},{48,40},{53,40},{50,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{50,-20},{47,-10},{52,-10},{50,-20},{50,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{53,25},{82,7}},
                lineColor={160,160,164},
                textString="I"),Text(
                extent={{0,-17},{35,-37}},
                lineColor={160,160,164},
                textString="duration"),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-80,-60},{-50,-60},{50,60},{80,60}},
                color={192,192,192})}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end RampCurrent;

    model SineCurrent "Sine current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of sine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=1)
        "Frequency of sine wave";
      extends Interfaces.CurrentSource(redeclare Modelica_Blocks.Sources.Sine
          signalSource(
          amplitude=I,
          freqHz=freqHz,
          phase=phase));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-70,0},{-60.2,29.9},{-53.8,46.5},
                  {-48.2,58.1},{-43.3,65.2},{-38.3,69.2},{-33.4,69.8},{-28.5,67},
                  {-23.6,61},{-18.6,52},{-13,38.6},{-5.98,18.6},{8.79,-26.9},{
                  15.1,-44},{20.8,-56.2},{25.7,-64},{30.6,-68.6},{35.5,-70},{40.5,
                  -67.9},{45.4,-62.5},{50.3,-54.1},{55.9,-41.3},{63,-21.7},{70,0}},
                color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{85,-40}},
              color={192,192,192}),Polygon(
                points={{101,-40},{85,-34},{85,-46},{101,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,-2},{-32.6,32.2},{-27.1,51.1},{-22.3,64.4},{-18.1,
                72.6},{-13.9,77.1},{-10,78},{-5.42,74.6},{-1.201,67.7},{3.02,57.4},
                {7.84,42.1},{13.9,19.2},{26.5,-32.8},{32,-52.2},{36.8,-66.2},{41,
                -75.1},{45.2,-80.4},{49.5,-82},{53.7,-79.6},{57.9,-73.5},{62.1,-63.9},
                {66.9,-49.2},{73,-26.8},{79,-2}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-106,-11},{-60,-29}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-41,-2},{-41,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-60,-43},{-14,-61}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{84,-52},{108,-72}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-10,78},{42,78}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-41,-2},{5,-2},{5,-2},{51,-2}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{33,78},{30,65},{37,65},{33,78}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{33,78},{33,-2}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-73,82},{-53,102}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end SineCurrent;

    model CosineCurrent "Cosine current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of cosine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of cosine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=1)
        "Frequency of cosine wave";
      extends Interfaces.CurrentSource(redeclare Modelica_Blocks.Sources.Cosine
          signalSource(
          amplitude=I,
          freqHz=freqHz,
          phase=phase));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(
              points={{-71,70},{-68.4,69.8},{-63.5,67},{-58.6,61},{-53.6,52},{-48,
                  38.6},{-40.98,18.6},{-26.21,-26.9},{-19.9,-44},{-14.2,-56.2},{-9.3,
                  -64},{-4.4,-68.6},{0.5,-70},{5.5,-67.9},{10.4,-62.5},{15.3,-54.1},
                  {20.9,-41.3},{28,-21.7},{35,0}},
              color={192,192,192},
              smooth=Smooth.Bezier), Line(points={{35,0},{44.8,29.9},{51.2,46.5},
                  {56.8,58.1},{61.7,65.2},{66.7,69.2},{71.6,69.8}}, color={192,
                  192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{85,-40}},
              color={192,192,192}),Polygon(
                points={{101,-40},{85,-34},{85,-46},{101,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-106,-11},{-60,-29}},
                lineColor={160,160,164},
                textString="offset"),Line(
                points={{-41,-2},{-41,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-60,-43},{-14,-61}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{84,-52},{108,-72}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-10,78},{42,78}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-41,-2},{5,-2},{5,-2},{51,-2}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{33,78},{30,65},{37,65},{33,78}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{33,78},{33,-2}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-73,82},{-53,102}},
                lineColor={192,192,192},
                textString="i"),Line(
                points={{-41,78},{-41,-2}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-41,78},{-38,78},{-35.42,74.6},{-31.201,67.7},{-26.98,
                57.4},{-22.16,42.1},{-16.1,19.2},{-3.5,-32.8},{2,-52.2},{6.8,-66.2},
                {11,-75.1},{15.2,-80.4},{19.5,-82},{23.7,-79.6},{27.9,-73.5},{
                32.1,-63.9},{36.9,-49.2},{43,-26.8},{49,-2}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{49,-2},{57.4,32.2},{62.9,51.1},{67.7,64.4},{71.9,72.6},{
                76.1,77.1},{80,78}},
                color={0,0,0},
                thickness=0.5)}),
        Documentation(revisions="<html>
<ul>
<li>Initially implemented by Christian Kral on 2013-05-14</li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end CosineCurrent;

    model ExpSineCurrent "Exponentially damped sine current source"
      parameter Real I(start=1) "Amplitude of sine wave";
      parameter Modelica_SIunits.Frequency freqHz(start=2)
        "Frequency of sine wave";
      parameter Modelica_SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica_SIunits.Damping damping(start=1)
        "Damping coefficient of sine wave";
      extends Interfaces.CurrentSource(redeclare
          Modelica_Blocks.Sources.ExpSine
          signalSource(
          amplitude=I,
          freqHz=freqHz,
          phase=phase,
          damping=damping));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-80,-14},{-75.2,18.3},{-72,36.3},
                  {-68.7,50.5},{-65.5,60.2},{-62.3,65.3},{-59.1,65.6},{-55.9,61.3},
                  {-52.7,53.1},{-48.6,38.2},{-43,11.8},{-35,-27.9},{-30.2,-47.7},
                  {-26.1,-59.9},{-22.1,-67.2},{-18.1,-69.3},{-14.1,-66.5},{-10.1,
                  -59.3},{-5.23,-46.1},{8.44,-0.3},{13.3,12.4},{18.1,20.8},{22.1,
                  24},{26.9,23.2},{31.8,17.8},{38.2,5.4},{51.1,-24.5},{57.5,-35.2},
                  {63.1,-39.9},{68.7,-39.9},{75.2,-34.5},{80,-27.8}}, color={192,
                  192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={
              192,192,192}),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{100,-40}},
              color={192,192,192}),Polygon(
                points={{100,-40},{84,-34},{84,-46},{100,-40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},
                {-35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{-19.9,
                22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},{
                0.302,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},{
                25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,16.9},
                {56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,-18},{80,
                -12.1}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-78,1},{-55,-19}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-72,-36},{-26,-54}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{76,-44},{100,-64}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-50,0},{18,0}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-50,0},{-80,0}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-50,77},{-50,0}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{18,-1},{18,76}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{18,73},{-50,73}}, color={
              192,192,192}),Text(
                extent={{-42,88},{9,74}},
                lineColor={160,160,164},
                textString="1/freqHz"),Polygon(
                points={{-50,73},{-41,75},{-41,71},{-50,73}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{18,73},{10,75},{10,71},{18,73}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-50,-61},{-19,-61}},
              color={192,192,192}),Polygon(
                points={{-18,-61},{-26,-59},{-26,-63},{-18,-61}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-51,-63},{-27,-75}},
                lineColor={160,160,164},
                textString="t"),Text(
                extent={{-82,-67},{108,-96}},
                lineColor={160,160,164},
                textString="I*exp(-damping*t)*sin(2*pi*freqHz*t+phase)"),Line(
                points={{-50,0},{-50,-40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-50,-54},{-50,-72}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{18,-76},{-1,-48}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-74,83},{-54,103}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end ExpSineCurrent;

    model ExponentialsCurrent "Rising and falling exponential current source"
      parameter Real iMax(start=1) "Upper bound for rising edge";
      parameter Modelica_SIunits.Time riseTime(min=0, start=0.5) "Rise time";
      parameter Modelica_SIunits.Time riseTimeConst(min=Modelica_Constants.small,
          start=0.1) "Rise time constant";
      parameter Modelica_SIunits.Time fallTimeConst(min=Modelica_Constants.small,
          start=riseTimeConst) "Fall time constant";
      extends Interfaces.CurrentSource(redeclare
          Modelica_Blocks.Sources.Exponentials signalSource(
          outMax=iMax,
          riseTime=riseTime,
          riseTimeConst=riseTimeConst,
          fallTimeConst=fallTimeConst));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-76,-59},{-73.2,-44.3},{-70.3,-31.1},
                  {-66.8,-16.6},{-63.3,-4},{-59.7,6.92},{-55.5,18.18},{-51.3,27.7},
                  {-46.3,37},{-40.6,45.5},{-34.3,53.1},{-27.2,59.6},{-18.7,65.3},
                  {-8.1,70.2},{-6,71},{-3.88,58.5},{-1.05,43.7},{1.78,30.8},{
                  4.606,19.45},{8.14,7.3},{11.68,-3},{15.9,-13.2},{20.2,-21.6},{
                  25.1,-29.5},{30.8,-36.4},{37.1,-42.3},{44.9,-47.5},{54.8,-51.8},
                  {64,-54.4}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-100,-70},{100,-70}}, color={
              192,192,192}),Polygon(
                points={{100,-70},{84,-64},{84,-76},{100,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,
                25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,
                74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{
                32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},
                {47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},
                {80.9,-18.5},{90.8,-22.8},{100,-25.4}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,90},{-80,-80}},
              color={192,192,192}),Polygon(
                points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{-40,-60}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-40,-30},{-42,-40},{-38,-40},{-40,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-39,-30},{-80,-30}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-59,-71},{-13,-89}},
                lineColor={160,160,164},
                textString="startTime"),Polygon(
                points={{-40,-30},{-31,-28},{-31,-32},{-40,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-40,-30},{30,-30}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{30,-30},{22,-28},{22,-32},{30,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-26,-12},{19,-28}},
                lineColor={160,160,164},
                textString="riseTime"),Line(
                points={{-40,-30},{-80,-30}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{30,100},{30,-34}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end ExponentialsCurrent;

    model PulseCurrent "Pulse current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of pulse";
      parameter Real width(
        final min=Modelica_Constants.small,
        final max=100,
        start=50) "Width of pulse in % of period";
      parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small,
          start=1) "Time for one period";
      extends Interfaces.CurrentSource(redeclare Modelica_Blocks.Sources.Pulse
          signalSource(
          amplitude=I,
          width=width,
          period=period));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-80,-67},{-50,-67},{-50,73},{-10,
                  73},{-10,-67},{30,-67},{30,73},{70,73}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-34,0},{-34,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,-24},{-35,-36}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-42,-69},{4,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-19,0},{-19,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-80,0},{-19,0},{-19,50},{21,50},{21,0},{41,0},{41,51},{
                80,51}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-19,88},{-19,49}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{21,74},{21,50}},
                color={160,160,164},
                pattern=LinePattern.Dash),Line(
                points={{41,88},{41,51}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-19,83},{41,83}}, color={
              192,192,192}),Line(points={{-19,69},{21,69}}, color={192,192,192}),
              Text(
                extent={{-9,97},{37,85}},
                lineColor={160,160,164},
                textString="period"),Text(
                extent={{-18,81},{21,69}},
                lineColor={160,160,164},
                textString="width"),Line(
                points={{-52,50},{-19,50}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-34,50},{-34,1}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-78,34},{-37,20}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{-34,50},{-37,37},{-31,37},{-34,50}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{80,51},{80,0},{90,0}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-19,69},{-10,71},{-10,67},{-19,69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{21,69},{13,71},{13,67},{21,69}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-19,83},{-10,85},{-10,81},{-19,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{41,83},{33,85},{33,81},{41,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));

    end PulseCurrent;

    model SawToothCurrent "Saw tooth current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of saw tooth";
      parameter Modelica_SIunits.Time period(start=1) "Time for one period";
      extends Interfaces.CurrentSource(redeclare
          Modelica_Blocks.Sources.SawTooth
          signalSource(amplitude=I, period=period));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-70,-71},{-50,-71},{10,70},{10,-71},
                  {70,70},{70,-71}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,-20},{-37,-33},{-31,-33},{-34,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-34,-20},{-34,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,-24},{-35,-36}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-31,-69},{15,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-10,-20},{-10,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-10,88},{-10,-20}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{30,88},{30,59}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-10,83},{30,83}}, color={
              192,192,192}),Text(
                extent={{-12,97},{34,85}},
                lineColor={160,160,164},
                textString="period"),Line(
                points={{-44,60},{30,60}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-34,60},{-34,-20}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-78,34},{-37,20}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{-34,60},{-37,47},{-31,47},{-34,60}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,83},{-1,85},{-1,81},{-10,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{30,83},{22,85},{22,81},{30,83}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end SawToothCurrent;

    model TrapezoidCurrent "Trapezoidal current source"
      parameter Modelica_SIunits.Current I(start=1) "Amplitude of trapezoid";
      parameter Modelica_SIunits.Time rising(final min=0, start=0)
        "Rising duration of trapezoid";
      parameter Modelica_SIunits.Time width(final min=0, start=0.5)
        "Width duration of trapezoid";
      parameter Modelica_SIunits.Time falling(final min=0, start=0)
        "Falling duration of trapezoid";
      parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small,
          start=1) "Time for one period";
      parameter Integer nperiod(start=-1)
        "Number of periods (< 0 means infinite number of periods)";
      extends Interfaces.CurrentSource(redeclare
          Modelica_Blocks.Sources.Trapezoid signalSource(
          amplitude=I,
          rising=rising,
          width=width,
          falling=falling,
          period=period,
          nperiod=nperiod));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-81,-66},{-60,-66},{-30,74},{1,74},
                  {30,-66},{51,-66},{80,74}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,90},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{90,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-45,-30},{-47,-41},{-43,-41},{-45,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-45,-30},{-45,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Polygon(
                points={{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-86,-43},{-43,-55}},
                lineColor={160,160,164},
                textString="offset"),Text(
                extent={{-47,-69},{-1,-87}},
                lineColor={160,160,164},
                textString="startTime"),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="time"),Line(
                points={{-30,79},{-30,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-10,59},{-10,40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{20,59},{20,40}},
                color={160,160,164},
                pattern=LinePattern.Dash),Line(
                points={{40,59},{40,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(points={{-21,75},{60,75}}, color={
              192,192,192}),Line(points={{-30,56},{40,56}}, color={192,192,192}),
              Text(
                extent={{-9,88},{37,76}},
                lineColor={160,160,164},
                textString="period"),Text(
                extent={{-8,70},{21,60}},
                lineColor={160,160,164},
                textString="width"),Line(
                points={{-42,40},{-10,40}},
                color={192,192,192},
                pattern=LinePattern.Dash),Line(
                points={{-39,40},{-39,-30}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Text(
                extent={{-77,14},{-40,0}},
                lineColor={160,160,164},
                textString="I"),Polygon(
                points={{-30,56},{-23,58},{-23,54},{-30,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,56},{-17,58},{-17,54},{-10,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-30,75},{-21,77},{-21,73},{-30,75}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{60,75},{52,77},{52,73},{60,75}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-80,-30},{-30,-30},{-10,40},{20,40},{40,-30},{60,-30},{
                80,40},{100,40}},
                color={0,0,0},
                thickness=0.5),Polygon(
                points={{-39,40},{-41,30},{-37,30},{-39,40}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-39,-30},{-41,-20},{-37,-20},{-39,-30},{-39,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{60,80},{60,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Polygon(
                points={{40,56},{33,58},{33,54},{40,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{20,56},{27,58},{27,54},{20,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{20,56},{13,58},{13,54},{20,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-10,56},{-3,58},{-3,54},{-10,56}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-34,70},{-5,60}},
                lineColor={160,160,164},
                textString="rising"),Text(
                extent={{16,70},{45,60}},
                lineColor={160,160,164},
                textString="falling"),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",   info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end TrapezoidCurrent;

    model TableCurrent "Current source by linear interpolation in a table"
      parameter Real table[:, :]=[0, 0; 1, 1; 2, 4]
        "Table matrix (time = first column, current = second column)";
      extends Interfaces.CurrentSource(redeclare
          Modelica_Blocks.Sources.TimeTable signalSource(table=table));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(points={{-66,-36},{-66,84},{34,84},{34,-36},
                  {-66,-36},{-66,-6},{34,-6},{34,24},{-66,24},{-66,54},{34,54},{
                  34,84},{-16,84},{-16,-37}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-20,90},{30,-30}},
                lineColor={255,255,255},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-20,-30},{-20,90},{
              80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},
              {80,60},{80,90},{30,90},{30,-31}}, color={0,0,0}),Text(
                extent={{-77,-42},{-38,-58}},
                lineColor={160,160,164},
                textString="offset"),Polygon(
                points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-30,-70},{-33,-60},{-28,-60},{-30,-70},{-30,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(
                points={{-31,-31},{-31,-70}},
                color={192,192,192},
                pattern=LinePattern.Solid,
                thickness=0.25,
                arrow={Arrow.None,Arrow.None}),Line(
                points={{-20,-20},{-20,-70}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{-38,-70},{8,-88}},
                lineColor={160,160,164},
                textString="startTime"),Line(
                points={{-20,-30},{-80,-30}},
                color={192,192,192},
                pattern=LinePattern.Dash),Text(
                extent={{66,-81},{91,-93}},
                lineColor={160,160,164},
                textString="time"),Text(
                extent={{-15,83},{24,68}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{33,83},{76,67}},
                lineColor={0,0,0},
                textString="i"),Text(
                extent={{-73,75},{-53,95}},
                lineColor={192,192,192},
                textString="i")}),
        Documentation(info="<html>
<p>This current source uses the corresponding signal source of the Modelica.Blocks.Sources package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
<p><br>This block generates a current source by <b>linear interpolation</b> in a table. The time points and current values are stored in a matrix <b>table[i,j]</b>, where the first column table[:,1] contains the time points and the second column contains the current to be interpolated. The table interpolation has the following properties:</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by <b>extrapolation</b> through the last or first two points of the table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and the current value is just returned independently of the actual time instant, i.e., this is a constant current source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined by the table can be shifted both in time and in the current. </li>
<li>The table is implemented in a numerically sound way by generating <b>time events</b> at interval boundaries.
    This generates continuously differentiable values for the integrator.</li>
</ul>
<p>Example:</p>
<pre>   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the current i =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the current i =  2.5,
    e.g., time = 2.0, the current i =  4.0,
    e.g., time = 5.0, the current i = 23.0 (i.e., extrapolation). </pre>
<p><br> Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>",   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TableCurrent;

    model SupplyVoltage "Supply voltage (positive and negative)"
      parameter Modelica_SIunits.Voltage Vps=+15 "Positive supply";
      parameter Modelica_SIunits.Voltage Vns=-15 "Negative supply";
      Modelica_Electrical_Analog.Interfaces.PositivePin pin_p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica_Electrical_Analog.Interfaces.NegativePin pin_n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica_Electrical_Analog.Interfaces.NegativePin ground
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      Modelica_Electrical_Analog.Sources.ConstantVoltage positiveSupply(final V=
            Vps)
        annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      Modelica_Electrical_Analog.Sources.ConstantVoltage negativeSupply(final V=-
            Vns)
        annotation (Placement(transformation(extent={{40,-10},{60,10}})));
    equation
      connect(pin_p, positiveSupply.p) annotation (Line(
          points={{-100,0},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(negativeSupply.n, pin_n) annotation (Line(
          points={{60,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(positiveSupply.n, ground) annotation (Line(
          points={{-40,0},{0,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ground, negativeSupply.p) annotation (Line(
          points={{0,0},{40,0}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Line(
              points={{-60,40},{-60,-40}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{40,40},{40,-40}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-40,20},{-40,-20}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{60,20},{60,-20}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-90,0},{-60,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{60,0},{90,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{-100,100},{100,80}},
              lineColor={0,0,255},
              textString="%name"),
            Line(
              points={{-40,0},{-10,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{10,0},{40,0}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{-100,40},{-80,20}},
              lineColor={0,0,255},
              textString="+"),
            Text(
              extent={{80,40},{100,20}},
              lineColor={0,0,255},
              textString="-"),
            Text(
              extent={{-10,40},{10,20}},
              lineColor={0,0,255},
              textString="0")}),
        Documentation(info="<html>
                       <p>This is a simple model of a constant supply voltage with positive and negative supply, the potential between positive and negative supply is accessible.</p>
                       </html>"));
    end SupplyVoltage;
    annotation (Documentation(info="<html>
<p>This package contains time-dependent and controlled voltage and current sources. Most of the sources use the behavior modeled in the Modelica.Blocks.Sources package. All sources are ideal in the sense that <b>no</b> internal resistances are included.</p>
</html>",   revisions="<html>
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
<dt>
<b>Copyright:</b>
</dt>
<dd>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</dd>
</dl>
</html>"));
  end Sources;
annotation (Documentation(info="<html>
<p>
This package contains packages for analog electrical components:</p>
<ul>
<li>Basic: basic components (resistor, capacitor, conductor, inductor, transformer, gyrator)</li>
<li>Semiconductors: semiconductor devices (diode, bipolar and MOS transistors)</li>
<li>Lines: transmission lines (lossy and lossless)</li>
<li>Ideal: ideal elements (switches, diode, transformer, idle, short, ...)</li>
<li>Sources: time-dependent and controlled voltage and current sources</li>
<li>Sensors: sensors to measure potential, voltage, and current</li>
</ul>
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
    D-01069 Dresden, Germany
</dd>
</dl>
</html>"), Icon(graphics={
        Line(
          points={{12,60},{12,-60}},
          color={0,0,0}),
        Line(
          points={{-12,60},{-12,-60}},
          color={0,0,0}),
        Line(points={{-80,0},{-12,0}}, color={0,0,0}),
        Line(points={{12,0},{80,0}}, color={0,0,0})}),
    uses);
end Modelica_Electrical_Analog;
