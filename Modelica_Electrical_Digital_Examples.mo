within ;
encapsulated package Modelica_Electrical_Digital_Examples
  "Examples that demonstrate the usage of the Digital electrical components"
  import Modelica_Icons;
  import Modelica_Electrical_Digital;
  import Modelica_SIunits;
  extends Modelica_Icons.ExamplesPackage;

  model Multiplexer "4 to 1 Bit Multiplexer Example"
    import D = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    D.Sources.Clock CLK(period=20, startTime=0, width=50)  annotation (Placement(transformation(
            extent={{-80,-56},{-60,-36}}, rotation=0)));
    D.Sources.Table D0(
      y0=L.'0',
      x={L.'1',L.'0',L.'1',L.'0'},
      t={50,100,145,200}) annotation (Placement(transformation(extent={{-80,58},
          {-60,78}},         rotation=0)));
    D.Sources.Table D1(
      y0=L.'0',
      x={L.'1',L.'0',L.'1',L.'0'},
      t={22,140,150,180}) annotation (Placement(transformation(extent={{-80,32},
          {-60,52}},         rotation=0)));
    D.Examples.Utilities.MUX4 MUX annotation (Placement(transformation(extent={{-10,0},
          {70,80}},             rotation=0)));
    D.Sources.Table D2(
      y0=L.'0',
      x={L.'1',L.'0',L.'1',L.'0'},
      t={22,140,150,180}) annotation (Placement(transformation(extent={{-80,6},
          {-60,26}},     rotation=0)));
    D.Sources.Table D3(
      y0=L.'0',
      x={L.'1',L.'0',L.'1',L.'0'},
      t={22,140,150,180}) annotation (Placement(transformation(extent={{-80,-20},
          {-60,0}},          rotation=0)));
    D.Examples.Utilities.JKFF FF annotation (Placement(transformation(extent={{-20,-62},
          {0,-42}},                rotation=0)));
    D.Sources.Set Enable(x=L.'1')                                            annotation (Placement(transformation(extent={{-80,-82},
          {-60,-62}},          rotation=0)));
  equation
    connect(CLK.y, FF.clk) annotation (Line(
        points={{-60,-46},{-36,-46},{-36,-52},{-20,-52}},
        color={127,0,127}));
    connect(Enable.y, FF.k) annotation (Line(
        points={{-60,-72},{-30,-72},{-30,-59},{-20,-59}},
        color={127,0,127}));
    connect(Enable.y, FF.j) annotation (Line(
        points={{-60,-72},{-30,-72},{-30,-45},{-20,-45}},
        color={127,0,127}));
    connect(CLK.y, MUX.a0) annotation (Line(
        points={{-60,-46},{-36,-46},{-36,22.4},{-10,22.4}},
        color={127,0,127}));
    connect(D0.y, MUX.d0) annotation (Line(
        points={{-60,68},{-10,68}},
        color={127,0,127}));
    connect(D1.y, MUX.d1) annotation (Line(
        points={{-60,42},{-54,42},{-54,57.6},{-10,57.6}},
        color={127,0,127}));
    connect(D2.y, MUX.d2) annotation (Line(
        points={{-60,16},{-50,16},{-50,47.2},{-10,47.2}},
        color={127,0,127}));
    connect(D3.y, MUX.d3) annotation (Line(
        points={{-60,-10},{-46,-10},{-46,36.8},{-10,36.8}},
        color={127,0,127}));
    connect(FF.q, MUX.a1) annotation (Line(
        points={{0,-45},{2,-45},{2,-22},{-20,-22},{-20,12},{-10,12}},
        color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>The multiplexer converts a parallel 4 bit signal in a sequential 1 bit stream. The multiplexer component is composed by basic gates. It can be found in the Utilities subpackage. The example is designed to test and demonstrate the basic gate components.</p>
</html>"),      experiment(StopTime=250));
  end Multiplexer;

  model FlipFlop "Pulse Triggered Master Slave Flip-Flop"
    import D = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    D.Examples.Utilities.JKFF FF
                   annotation (Placement(transformation(extent={{-10,-40},{70,
              40}}, rotation=0)));
    D.Sources.Clock CLK(period=10, startTime=0, width=50)  annotation (Placement(transformation(
            extent={{-80,-10},{-60,10}}, rotation=0)));
    D.Sources.Table J(
      y0=L.'0',
      x={L.'1',L.'0',L.'1',L.'0'},
      t={50,100,145,200}) annotation (Placement(transformation(extent={{-80,
              18},{-60,38}}, rotation=0)));
    D.Sources.Table K(
      y0=L.'0',
      x={L.'1',L.'0',L.'1',L.'0'},
      t={22,140,150,180}) annotation (Placement(transformation(extent={{-80,
              -38},{-60,-18}}, rotation=0)));
  equation
    connect(J.y, FF.j)     annotation (Line(
        points={{-60,28},{-10,28}},
        color={127,0,127}));
    connect(CLK.y, FF.clk)    annotation (Line(
        points={{-60,0},{-10,0}},
        color={127,0,127}));
    connect(K.y, FF.k)      annotation (Line(
        points={{-60,-28},{-10,-28}},
        color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>A pulse-triggered master-slave flip-flop is demonstrated. The flipflop component is composed by basic gates. It can be found in the Utilities subpackage. The example is designed to test and demonstrate the basic gate components.</p>
</html>"),      experiment(StopTime=250));
  end FlipFlop;

  model HalfAdder "Adding circuit for binary numbers without input carry bit"
    import Digital = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Digital.Sources.Table a(
      t={1,2,3,4},
      x={L.'1',L.'0',L.'1',L.'0'},
      y0=L.'0') annotation (Placement(transformation(extent={{-80,18},{-60,38}},
            rotation=0)));
    Digital.Sources.Table b(
      x={L.'1',L.'0'},
      t={2,4},
      y0=L.'0') annotation (Placement(transformation(extent={{-80,-38},{-60,-18}},
            rotation=0)));
    Utilities.HalfAdder Adder(
      delayTime=0.3,
      AND(G2(y(start=L.'U', fixed=true))),
      XOR(G2(y(start=L.'U', fixed=true)))) annotation (Placement(transformation(
            extent={{-40,-40},{40,40}}, rotation=0)));
    Digital.Converters.LogicToReal s(
      n=1,
      value_U=0.5,
      value_X=0.5,
      value_0=0,
      value_1=1,
      value_Z=0.5,
      value_W=0.5,
      value_L=0,
      value_H=1,
      value_m=0.5) annotation (Placement(transformation(extent={{60,18},{80,38}},
            rotation=0)));
    Digital.Converters.LogicToReal c(
      n=1,
      value_U=0.5,
      value_X=0.5,
      value_0=0,
      value_1=1,
      value_Z=0.5,
      value_W=0.5,
      value_L=0,
      value_H=1,
      value_m=0.5) annotation (Placement(transformation(extent={{60,-38},{80,-18}},
            rotation=0)));
  equation
    connect(b.y,Adder. b) annotation (Line(
        points={{-60,-28},{-40,-28}},
        color={127,0,127}));
    connect(a.y,Adder. a) annotation (Line(
        points={{-60,28},{-40,28}},
        color={127,0,127}));
    connect(Adder.s, s.x[1]) annotation (Line(points={{40,28},{65,28}}, color=
           {127,0,127}));
    connect(Adder.c, c.x[1]) annotation (Line(points={{40,-28},{65,-28}},
          color={127,0,127}));
    annotation (
      Documentation(info="<HTML>
<p>
This example demonstrates an adding circuit for binary numbers, which internally realizes the interconnection to
And and to Xor in the final sum.</p>
<br>
<br>
1 + 0 = 1<br>
0 + 1 = 1<br>
1 + 1 = 10<br>
0 + 0 = 0
<br>
<br>
<b>a</b> + <b>b</b> = <b>s</b>
<br>(The carry of this adding is <b>c</b>.)
<br>
<br>and
<br>
<br>
<b>a</b> * <b>b</b> = <b>s</b>
<br>  (It is an interconnection to And.)
<br>
<br>
<b>a</b> * <b>b</b> + <b>a</b> * <b>b</b> = <b>a</b> Xor <b>b</b> = <b>c</b>
<br>(It is an interconnection to Xor.)
<br>
<pre>
   <b>a</b>     <b>b</b>     <b>c</b>      <b>s</b>     <b>t</b>

   1     0     1      0     1
   0     1     1      0     2
   1     1     0      1     3
   0     0     0      0     4
</pre>
<p>
<b>t</b> is the pick-up instant of the next bit(s) in the simulation.
The simulation stop time should be 5 seconds.
</p>
</HTML>"),      experiment(StopTime=5));
  end HalfAdder;

  model FullAdder "Full 1 Bit Adder Example"
    import D = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    D.Examples.Utilities.FullAdder Adder1                  annotation (Placement(
          transformation(extent={{0,-30},{60,30}}, rotation=0)));
    D.Converters.LogicToReal s(value_0=0, value_1=1, value_H=1, value_L=0, value_m=0.5, value_U=0.5, value_W=0.5, value_X=0.5, value_Z=0.5, n=1)
                             annotation (Placement(transformation(extent={{70,
              12},{90,32}}, rotation=0)));
    D.Converters.LogicToReal c_out(value_0=0, value_1=1, value_H=1, value_L=0, value_m=0.5, value_U=0.5, value_W=0.5, value_X=0.5, value_Z=0.5, n=1)
                                 annotation (Placement(transformation(extent=
              {{70,-32},{90,-12}}, rotation=0)));
    D.Examples.Utilities.Counter3 Counter
      annotation (Placement(transformation(extent={{-60,-18},{-20,22}},
            rotation=0)));
    D.Sources.Set Enable(x=L.'1')       annotation (Placement(transformation(
            extent={{-90,6},{-70,26}}, rotation=0)));
    D.Sources.Clock CLK(period=1, startTime=0, width=50)       annotation (Placement(transformation(extent={{
              -90,-22},{-70,-2}}, rotation=0)));
  equation
    connect(Adder1.s, s.x[1])
                             annotation (Line(points={{60.3,21},{68,21},{68,
            22},{75,22}}, color={127,0,127}));
    connect(Adder1.c_out, c_out.x[1])
                                     annotation (Line(points={{60,-21},{68,
            -21},{68,-22},{75,-22}}, color={127,0,127}));
    connect(CLK.y, Counter.count) annotation (Line(points={{-70,-12},{-60,-12}},
          color={127,0,127}));
    connect(Enable.y, Counter.enable) annotation (Line(points={{-70,16},{-60,
            16}}, color={127,0,127}));
    connect(Counter.q2, Adder1.a) annotation (Line(points={{-20,16},{-10,16},
            {-10,21},{0,21}}, color={127,0,127}));
    connect(Counter.q1, Adder1.b) annotation (Line(points={{-20,2},{-10,2},{
            -10,9},{0,9}}, color={127,0,127}));
    connect(Counter.q0, Adder1.c_in) annotation (Line(points={{-20,-12},{-10,
            -12},{-10,-21},{0,-21}}, color={127,0,127}));
    annotation (
      Documentation(info="<HTML>
<p>
<br>It is an adding circuit for binary numbers with input carry bit, which consists of two HalfAdders.
<br>
<br>
<b>a</b>.y, <b>b</b>.y and <b>c</b>.y are the inputs of the FullAdder.
<br>
<b>c</b>out = <b>Or1</b>.y and <b>h</b>.s are the outputs of the FullAdder.
<br>
<br>
<b>t</b> is the pick-up instant of the next bit(s) in the simulation.</p>
<pre>   <b>a</b>.y      <b>b</b>.y      <b>c</b>.y     <b>c</b>out        <b>h</b>.s        <b>t</b> </pre>

<pre>
     1        0        0        0          1        1
     0        1        0        0          1        2
     0        0        1        0          1        3
     1        1        0        1          0        4
     0        1        1        1          0        5
     1        0        1        1          0        6
     1        1        1        1          1        7
     0        0        0        0          0        8
</pre>
<p>
The simulation stop time should be 10 seconds.
</p>
</html>"),      experiment(StopTime=10));
  end FullAdder;

  model Adder4 "4 Bit Adder Example"
    import Digital = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital.Interfaces.Logic;

    extends Modelica_Icons.Example;

    Digital.Sources.Table b4(
      y0=L.'0',
      x={L.'1',L.'0'},
      t={1,3}) annotation (Placement(transformation(extent={{70,-20},{110,20}},
            rotation=0)));
    Digital.Sources.Table b1(
      x={L.'1',L.'0',L.'1'},
      y0=L.'0',
      t={1,2,3}) annotation (Placement(transformation(extent={{-170,-20},{-130,
              20}}, rotation=0)));
    Digital.Sources.Table b2(
      y0=L.'0',
      x={L.'1'},
      t={4}) annotation (Placement(transformation(extent={{-90,-20},{-50,20}},
            rotation=0)));
    Digital.Sources.Table b3(
      y0=L.'0',
      x={L.'1'},
      t={1}) annotation (Placement(transformation(extent={{-10,-20},{30,20}},
            rotation=0)));
    Digital.Sources.Table a1(
      y0=L.'0',
      x={L.'1',L.'0',L.'1'},
      t={1,2,3}) annotation (Placement(transformation(extent={{-170,40},{-130,
              80}}, rotation=0)));
    Digital.Sources.Table a2(
      y0=L.'0',
      x={L.'1'},
      t={1}) annotation (Placement(transformation(extent={{-90,40},{-50,80}},
            rotation=0)));
    Digital.Sources.Table a3(
      y0=L.'0',
      x={L.'1',L.'0'},
      t={1,4}) annotation (Placement(transformation(extent={{-8,40},{30,80}},
            rotation=0)));
    Digital.Sources.Table a4(
      y0=L.'0',
      x={L.'0'},
      t={1}) annotation (Placement(transformation(extent={{70,40},{110,80}},
            rotation=0)));
    Digital.Sources.Set Set(x=L.'0') annotation (Placement(transformation(
          origin={-150,-74},
          extent={{20,20},{-20,-20}},
          rotation=180)));
    Utilities.FullAdder Adder1(Adder1(AND(G2(y(start=L.'U', fixed=true))), XOR(
            G2(y(start=L.'U', fixed=true)))), Adder2(AND(G2(y(start=L.'U',
                fixed=true))), XOR(G2(y(start=L.'U', fixed=true)))))
      annotation (Placement(transformation(extent={{-100,-80},{-60,-40}},
            rotation=0)));
    Utilities.FullAdder Adder2(Adder1(AND(G2(y(start=L.'U', fixed=true))), XOR(
            G2(y(start=L.'U', fixed=true)))), Adder2(AND(G2(y(start=L.'U',
                fixed=true))), XOR(G2(y(start=L.'U', fixed=true)))))
      annotation (Placement(transformation(extent={{-20,-80},{20,-40}},
            rotation=0)));
    Utilities.FullAdder Adder3(Adder1(AND(G2(y(start=L.'U', fixed=true))), XOR(
            G2(y(start=L.'U', fixed=true)))), Adder2(AND(G2(y(start=L.'U',
                fixed=true))), XOR(G2(y(start=L.'U', fixed=true)))))
      annotation (Placement(transformation(extent={{60,-80},{100,-40}},
            rotation=0)));
    Utilities.FullAdder Adder4(Adder1(AND(G2(y(start=L.'U', fixed=true))), XOR(
            G2(y(start=L.'U', fixed=true)))), Adder2(AND(G2(y(start=L.'U',
                fixed=true))), XOR(G2(y(start=L.'U', fixed=true)))))
      annotation (Placement(transformation(extent={{140,-80},{180,-40}},
            rotation=0)));
  equation
    connect(b1.y, Adder1.b)  annotation (Line(
        points={{-130,0},{-120,0},{-120,-54},{-100,-54}},
        color={127,0,127}));
    connect(a1.y, Adder1.a)  annotation (Line(
        points={{-130,60},{-110,60},{-110,-46},{-100,-46}},
        color={127,0,127}));
    connect(Set.y, Adder1.c_in)  annotation (Line(
        points={{-130,-74},{-100,-74}},
        color={127,0,127}));
    connect(Adder1.c_out, Adder2.c_in)  annotation (Line(
        points={{-60,-74},{-20,-74}},
        color={127,0,127}));
    connect(Adder2.c_out, Adder3.c_in) annotation (Line(
        points={{20,-74},{60,-74}},
        color={127,0,127}));
    connect(Adder3.c_out, Adder4.c_in) annotation (Line(
        points={{100,-74},{140,-74}},
        color={127,0,127}));
    connect(b2.y, Adder2.b) annotation (Line(
        points={{-50,0},{-40,0},{-40,-54},{-20,-54}},
        color={127,0,127}));
    connect(a2.y, Adder2.a) annotation (Line(
        points={{-50,60},{-30,60},{-30,-46},{-20,-46}},
        color={127,0,127}));
    connect(b3.y, Adder3.b) annotation (Line(
        points={{30,0},{40,0},{40,-54},{60,-54}},
        color={127,0,127}));
    connect(a3.y, Adder3.a) annotation (Line(
        points={{30,60},{50,60},{50,-46},{60,-46}},
        color={127,0,127}));
    connect(b4.y, Adder4.b) annotation (Line(
        points={{110,0},{120,0},{120,-54},{140,-54}},
        color={127,0,127}));
    connect(a4.y, Adder4.a) annotation (Line(
        points={{110,60},{130,60},{130,-46},{140,-46}},
        color={127,0,127}));
    annotation (
      Diagram(coordinateSystem(extent = {{-200,-100},{200,100}})),
      Documentation(info="<HTML>
<p>
Four FullAdders are combined to built a four bit adder unit.
</p>
<br>
<br>
In dependence on time five additions are carried out:
<br>
<pre>
at t = 0                            at t = 1
 a       0 0 0 0                       a      1 1 1 0
 b    +  0 0 0 0                       b   +  1 0 1 1
 <b>s     0 0 0 0 0</b>                      <b>s     1 0 0 1 0</b>
at t = 2                             at t = 3
 a       0 1 1 0                       a      1 1 1 0
 b    +  0 0 1 1                       b   +  1 0 1 0
 <b>s     1 0 1 0 0</b>                      <b>s     0 0 0 1 1</b>

at t = 4
 a      1 1 0 0
 b   +  1 1 1 0
 <b>s    0 0 1 0 1</b>
 </pre>
<p>
To show the influence of delay a large delay time of 0.1s is chosen.
Furthermore, all signals are initialized with U, the uninitialized value.
Please remember, that the nine logic values are coded by the numbers 1,...,9.
The summands a and b can be found at the output signals of the taba and tabb sources.
The result can be seen in the output signals of the FullAdders according to:</p>
<pre>
      a                       <b>a4</b>.y      <b>a3</b>.y      <b>a2</b>.y      <b>a1</b>.y
      b                       <b>b4</b>.y      <b>b3</b>.y      <b>b2</b>.y      <b>b1</b>.y
      sum   <b>Adder4</b>.c_out  <b>Adder4.s</b>  <b>Adder3.s</b>  <b>Adder2.s</b>  <b>Adder1.s</b>
</pre>
<p>The simulation stop time has to be 5s.</p>
</html>"),      experiment(StopTime=5));
  end Adder4;

  model Counter3 "3 Bit Counter Example"
    import D = Modelica_Electrical_Digital;
    extends Modelica_Icons.Example;

    D.Sources.Step Enable(after=D.Interfaces.Logic.'1', before=D.Interfaces.Logic.'0', stepTime=1)       annotation (Placement(transformation(extent={
              {-90,8},{-50,48}}, rotation=0)));
    D.Sources.Clock Clock(period=1, startTime=0, width=50)       annotation (Placement(transformation(extent={
              {-90,-48},{-50,-8}}, rotation=0)));
    D.Examples.Utilities.Counter3 Counter
      annotation (Placement(transformation(extent={{-30,-40},{50,40}},
            rotation=0)));
  equation
    connect(Enable.y, Counter.enable) annotation (Line(
        points={{-50,28},{-30,28}},
        color={127,0,127}));
    connect(Clock.y, Counter.count) annotation (Line(
        points={{-50,-28},{-30,-28}},
        color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>The three bit counter example is built up by components of the Utilities package which uses components of the Gates library.</p>
<p>The counter counts the high-low slopes of the clock signal, if the enable signal is set to be true. Otherwise if it is set to zero the counter is not counting.</p>
<p>Plot Counter.count (clock signal), and Counter.enable, and the output bit signals Counter.q0, Counter.q1, and Counter.q2.</p>
</html>"),      experiment(StopTime=10));
  end Counter3;

  model Counter "Generic N Bit Counter Example"
    import D = Modelica_Electrical_Digital;
    extends Modelica_Icons.Example;

    D.Sources.Step Enable(after=D.Interfaces.Logic.'1', before=D.Interfaces.Logic.'0', stepTime=1)       annotation (Placement(transformation(extent={
              {-90,8},{-50,48}}, rotation=0)));
    D.Sources.Clock Clock(period=1, startTime=0, width=50)       annotation (Placement(transformation(extent={
              {-90,-48},{-50,-8}}, rotation=0)));
    D.Examples.Utilities.Counter Counter(n=4)
      annotation (Placement(transformation(extent={{-30,-40},{50,40}},
            rotation=0)));
    D.Converters.LogicToReal Q0(value_0=0, value_1=1, value_H=1, value_L=0, value_m=0.5, value_U=0.5, value_W=0.5, value_X=0.5, value_Z=0.5, n=1) annotation (Placement(transformation(extent={
              {66,-40},{86,-20}}, rotation=0)));
    D.Converters.LogicToReal Q1(value_0=0, value_1=1, value_H=1, value_L=0, value_m=0.5, value_U=0.5, value_W=0.5, value_X=0.5, value_Z=0.5, n=1) annotation (Placement(transformation(extent={
              {66,-20},{86,0}}, rotation=0)));
    D.Converters.LogicToReal Q2(value_0=0, value_1=1, value_H=1, value_L=0, value_m=0.5, value_U=0.5, value_W=0.5, value_X=0.5, value_Z=0.5, n=1) annotation (Placement(transformation(extent={
              {66,0},{86,20}}, rotation=0)));
    D.Converters.LogicToReal Q3(value_0=0, value_1=1, value_H=1, value_L=0, value_m=0.5, value_U=0.5, value_W=0.5, value_X=0.5, value_Z=0.5, n=1) annotation (Placement(transformation(extent={
              {66,20},{86,40}}, rotation=0)));
  equation
    connect(Enable.y, Counter.enable) annotation (Line(
        points={{-50,28},{-30,28}},
        color={127,0,127}));
    connect(Clock.y, Counter.count) annotation (Line(
        points={{-50,-28},{-30,-28}},
        color={127,0,127}));
    connect(Q0.x[1], Counter.q[1]) annotation (Line(points={{71,-30},{58,-30},
            {58,-24},{50,-24}}, color={127,0,127}));
    connect(Q1.x[1], Counter.q[2]) annotation (Line(points={{71,-10},{60,-10},
            {60,-8},{50,-8}}, color={127,0,127}));
    connect(Q2.x[1], Counter.q[3]) annotation (Line(points={{71,10},{60,10},{
            60,8},{50,8}}, color={127,0,127}));
    connect(Q3.x[1], Counter.q[4]) annotation (Line(points={{71,30},{60,30},{
            60,24},{50,24}}, color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>The counter example is built up by components of the Utilities package which uses components of the Gates library. It demonstrates the generic counter model. The parameter n is the number of counting bits. In this example it is set to 4.</p>
<p>The counter counts the high-low slopes of the clock signal, if the enable signal is set to be true. Otherwise if it is set to zero the counter is not counting.</p>
<p>Plot Counter.count (clock signal), and Counter.enable, and the output bit signals Counter.q[0], Counter.q[1], Counter.q[2], and Counter.q[3]</p>
</html>"),      experiment(StopTime=100));
  end Counter;

  model VectorDelay "Vector delay"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Delay.InertialDelaySensitiveVector delay(
      final tHL=1,
      final tLH=2,
      final n=3,
      inertialDelaySensitive(each y(start=L.'U', fixed=true)))
      annotation (Placement(transformation(extent={{-36,-28},{40,48}})));
    Modelica_Electrical_Digital.Sources.Table table(x={L.'0',L.'1',L.'0',
      L.'1',L.'0'}, t={0,1,5,7,8})
  annotation (Placement(transformation(extent={{-96,40},{-76,60}})));
    Modelica_Electrical_Digital.Sources.Table table1(x={L.'0',L.'1'}, t={
      0,1})
  annotation (Placement(transformation(extent={{-96,0},{-76,20}})));
    Modelica_Electrical_Digital.Sources.Table table2(x={L.'0',L.'1',L.'0'},
    t={0,1,6})
  annotation (Placement(transformation(extent={{-96,-50},{-76,-30}})));
  equation

    connect(table.y, delay.x[1]) annotation (Line(
        points={{-76,50},{-30.68,50},{-30.68,6.13667}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(table1.y, delay.x[2]) annotation (Line(
        points={{-76,10},{-30.68,10},{-30.68,9.81}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(table2.y, delay.x[3]) annotation (Line(
        points={{-76,-40},{-30.68,-40},{-30.68,13.4833}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (        Documentation(info="<html>
<p>This example is a simple test of the vector valued sensitive delay component. The delay times are chosen different from each other. To examine the results plot both the input vector x and the output vector y.</p>
</html>"),
  experiment(StopTime=10));
  end VectorDelay;

  model DFFREG "Pulse triggered D-Register-Bank, high active reset"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table clock(x={L.'0',L.'1',L.'0',
      L.'1',L.'0',L.'1',L.'0'}, t={0,7,8,10,11,15,16})
  annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
    Modelica_Electrical_Digital.Sources.Table data_0(x={L.'1',L.'0'}, t={
      0,12})
  annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    Modelica_Electrical_Digital.Sources.Table reset(x={L.'0',L.'1',L.'0'},
    t={0,1,2})
  annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
    Modelica_Electrical_Digital.Sources.Table data_1(t={0,10}, x={L.'H',L.
      'X'})
  annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
    Modelica_Electrical_Digital.Registers.DFFREG dFFREG(
  n=2,
  tHL=5,
  tLH=6,
  delay(inertialDelaySensitive(each y(start=L.'U', fixed=true))),
  dFFR(clock(start=L.'U', fixed=true), reset(start=L.'U', fixed=true)))
  annotation (Placement(transformation(extent={{-24,-26},{70,68}})));

  equation
    connect(clock.y, dFFREG.clock) annotation (Line(
        points={{-66,-22},{-46,-22},{-46,11.6},{-20.24,11.6}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(reset.y, dFFREG.reset) annotation (Line(
        points={{-66,-60},{-20.24,-60},{-20.24,-7.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y, dFFREG.dataIn[1]) annotation (Line(
        points={{-66,18},{-44,18},{-44,37.92},{-20.24,37.92}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y, dFFREG.dataIn[2]) annotation (Line(
        points={{-66,50},{-44,50},{-44,41.68},{-20.24,41.68}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (            experiment(StopTime=25),
  Documentation(info="<html>
<p>This example is a simple test of the Registers.DFFREG component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the the truth table which is documented in the DFFREG component.</p>
</html>"));
  end DFFREG;

  model DFFREGL "Pulse triggered D-Register-Bank, low active reset"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table clock(x={L.'0',L.'1',L.'0',
      L.'1',L.'0',L.'1',L.'0'}, t={0,7,8,10,11,15,16})
  annotation (Placement(transformation(extent={{-86,-30},{-66,-10}})));
    Modelica_Electrical_Digital.Sources.Table data_0(x={L.'1',L.'0'}, t={
      0,12})
  annotation (Placement(transformation(extent={{-88,10},{-68,30}})));
    Modelica_Electrical_Digital.Sources.Table reset(t={0,1,2}, x={L.'1',L.
      '0',L.'1'})
  annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
    Modelica_Electrical_Digital.Sources.Table data_1(t={0,10}, x={L.'H',L.
      'X'})
  annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
    Modelica_Electrical_Digital.Registers.DFFREGL dFFREGL(
  n=2,
  tHL=5,
  tLH=6,
  delay(inertialDelaySensitive(each y(start=L.'U', fixed=true))),
  dFFR(clock(start=L.'U', fixed=true), reset(start=L.'U', fixed=true)))
  annotation (Placement(transformation(extent={{-41,-39},{62,65}})));
  equation

    connect(reset.y, dFFREGL.reset) annotation (Line(
        points={{-66,-60},{-36.88,-60},{-36.88,-18.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(clock.y, dFFREGL.clock) annotation (Line(
        points={{-66,-20},{-62,-20},{-62,2.6},{-36.88,2.6}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y, dFFREGL.dataIn[1]) annotation (Line(
        points={{-68,20},{-52,20},{-52,31.72},{-36.88,31.72}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y, dFFREGL.dataIn[2]) annotation (Line(
        points={{-66,50},{-52,50},{-52,35.88},{-36.88,35.88}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (            experiment(StopTime=25),
  Documentation(info="<html>
<p>This example is a simple test of the Registers.DFFREGL component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the the truth table which is documented in the DFFREGL component.</p>
</html>"));
  end DFFREGL;

  model DFFREGSRH "Pulse triggered D-Register-Bank, high active set and reset"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table clock(x={L.'0',L.'1',L.'0'},
    t={0,10,11})
  annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
    Modelica_Electrical_Digital.Sources.Table data_0(x={L.'W'}, t={0})
  annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    Modelica_Electrical_Digital.Sources.Table reset(x={L.'0',L.'1',L.'0'},
    t={0,1,2})
  annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
    Modelica_Electrical_Digital.Sources.Table data_1(x={L.'0'}, t={0})
  annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
    Modelica_Electrical_Digital.Sources.Table set(x={L.'0',L.'1',L.'0'},
    t={0,5,6})
  annotation (Placement(transformation(extent={{-86,74},{-66,94}})));
    Modelica_Electrical_Digital.Registers.DFFREGSRH dFFREGSRH(
  tHL=2,
  tLH=3,
  n=2) annotation (Placement(transformation(extent={{-34,-37},{73,71}})));
  equation

    connect(clock.y, dFFREGSRH.clock) annotation (Line(
        points={{-66,-22},{-50,-22},{-50,6.2},{-29.72,6.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(set.y, dFFREGSRH.set) annotation (Line(
        points={{-66,84},{-48,84},{-48,60.2},{-29.72,60.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(reset.y, dFFREGSRH.reset) annotation (Line(
        points={{-66,-60},{-29.72,-60},{-29.72,-15.4}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y, dFFREGSRH.dataIn[1]) annotation (Line(
        points={{-66,18},{-48,18},{-48,36.44},{-29.72,36.44}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y, dFFREGSRH.dataIn[2]) annotation (Line(
        points={{-66,50},{-48,50},{-48,40.76},{-29.72,40.76}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (            experiment(StopTime=15),
  Documentation(info="<html>
<p>This example is a simple test of the Registers.DFFREGSRH component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the the truth table which is documented in the DFFREGSRH component.</p>
</html>"));
  end DFFREGSRH;

  model DFFREGSRL "Pulse triggered D-Register-Bank, low active set and reset"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table clock(x={L.'0',L.'1',L.'0'},
    t={0,10,11})
  annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
    Modelica_Electrical_Digital.Sources.Table data_0(x={L.'W'}, t={0})
  annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    Modelica_Electrical_Digital.Sources.Table reset(t={0,1,2}, x={L.'1',L.
      '0',L.'1'})
  annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
    Modelica_Electrical_Digital.Sources.Table data_1(x={L.'0'}, t={0})
  annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
    Modelica_Electrical_Digital.Sources.Table set(t={0,5,6}, x={L.'1',L.
      '0',L.'1'})
  annotation (Placement(transformation(extent={{-86,74},{-66,94}})));
    Modelica_Electrical_Digital.Registers.DFFREGSRL dFFREGSRL(
  tHL=2,
  tLH=3,
  n=2) annotation (Placement(transformation(extent={{-45,-54},{81,72}})));
  equation
    connect(reset.y, dFFREGSRL.reset) annotation (Line(
        points={{-66,-60},{-39.96,-60},{-39.96,-28.8}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(clock.y, dFFREGSRL.clock) annotation (Line(
        points={{-66,-22},{-56,-22},{-56,-3.6},{-39.96,-3.6}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(set.y, dFFREGSRL.set) annotation (Line(
        points={{-66,84},{-39.96,84},{-39.96,59.4}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y, dFFREGSRL.dataIn[1]) annotation (Line(
        points={{-66,18},{-56,18},{-56,31.68},{-39.96,31.68}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y, dFFREGSRL.dataIn[2]) annotation (Line(
        points={{-66,50},{-56,50},{-56,36.72},{-39.96,36.72}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (            experiment(StopTime=15),
  Documentation(info="<html>
<p>This example is a simple test of the Registers.DFFREGSRL component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the the truth table which is documented in the DFFREGSRL component.</p>
</html>"));
  end DFFREGSRL;

  model DLATREG "Level sensitive D-Register-Bank, high active reset"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table enable(x={L.'0',L.'1',L.'0'},
    t={0,10,18})
  annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
    Modelica_Electrical_Digital.Sources.Table data_0(x={L.'W',L.'1'}, t={
      0,15})
  annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    Modelica_Electrical_Digital.Sources.Table reset(x={L.'0',L.'1',L.'0',
      L.'1',L.'0'}, t={0,1,2,20,21})
  annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
    Modelica_Electrical_Digital.Sources.Table data_1(x={L.'0',L.'1'}, t={
      0,16})
  annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
    Modelica_Electrical_Digital.Registers.DLATREG dLATREG(
  n=2,
  tHL=2,
  tLH=3,
  delay(inertialDelaySensitive(each y(start=L.'U', fixed=true))))
  annotation (Placement(transformation(extent={{-45,-50},{84,79}})));
  equation

    connect(reset.y, dLATREG.reset) annotation (Line(
        points={{-66,-60},{-39.84,-60},{-39.84,-24.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(enable.y, dLATREG.enable) annotation (Line(
        points={{-66,-22},{-56,-22},{-56,1.6},{-39.84,1.6}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y, dLATREG.dataIn[1]) annotation (Line(
        points={{-66,18},{-56,18},{-56,37.72},{-39.84,37.72}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y, dLATREG.dataIn[2]) annotation (Line(
        points={{-66,50},{-56,50},{-56,42.88},{-39.84,42.88}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (            experiment(StopTime=25),
  Documentation(info="<html>
<p>This example is a simple test of the Registers.DLATREG component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the the truth table which is documented in the DLATREG component.</p>
</html>"));
  end DLATREG;

  model DLATREGL "Level sensitive D-Register-Bank, low active reset"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table enable(x={L.'0',L.'1',L.'0'},
    t={0,10,18})
  annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
    Modelica_Electrical_Digital.Sources.Table data_0(x={L.'W',L.'1'}, t={
      0,15})
  annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    Modelica_Electrical_Digital.Sources.Table reset(t={0,1,2,20,21}, x={L.
      '1',L.'0',L.'1',L.'0',L.'1'})
  annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
    Modelica_Electrical_Digital.Sources.Table data_1(x={L.'0',L.'1'}, t={
      0,16})
  annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
    Modelica_Electrical_Digital.Registers.DLATREGL dLATREGL(
  tHL=2,
  tLH=3,
  n=2,
  delay(inertialDelaySensitive(each y(start=L.'U', fixed=true))))
  annotation (Placement(transformation(extent={{-45,-50},{84,79}})));
  equation

    connect(reset.y, dLATREGL.reset) annotation (Line(
        points={{-66,-60},{-39.84,-60},{-39.84,-24.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(enable.y, dLATREGL.enable) annotation (Line(
        points={{-66,-22},{-54,-22},{-54,1.6},{-39.84,1.6}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y, dLATREGL.dataIn[1]) annotation (Line(
        points={{-66,18},{-56,18},{-56,37.72},{-39.84,37.72}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y, dLATREGL.dataIn[2]) annotation (Line(
        points={{-66,50},{-56,50},{-56,42.88},{-39.84,42.88}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (            experiment(StopTime=25),
  Documentation(info="<html>
<p>This example is a simple test of the Registers.DLATREGL component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the the truth table which is documented in the DLATREGL component.</p>
</html>"));
  end DLATREGL;

  model DLATREGSRH "Level sensitive D-Register-Bank, high active set and reset"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table enable(x={L.'0',L.'1',L.'0'},
    t={0,10,18})
  annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
    Modelica_Electrical_Digital.Sources.Table data_0(x={L.'W',L.'1'}, t={
      0,15})
  annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    Modelica_Electrical_Digital.Sources.Table reset(x={L.'0',L.'1',L.'0',
      L.'1',L.'0'}, t={0,1,2,20,21})
  annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
    Modelica_Electrical_Digital.Sources.Table data_1(x={L.'0',L.'1'}, t={
      0,16})
  annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
    Modelica_Electrical_Digital.Sources.Table set(x={L.'0',L.'1',L.'0'},
    t={0,5,6})
  annotation (Placement(transformation(extent={{-86,74},{-66,94}})));
    Modelica_Electrical_Digital.Registers.DLATREGSRH dLATREGSRH(
  tHL=2,
  tLH=3,
  n=2,
  delay(inertialDelaySensitive(each y(start=L.'U', fixed=true))))
  annotation (Placement(transformation(extent={{-45,-42},{69,71}})));
  equation

    connect(reset.y, dLATREGSRH.reset) annotation (Line(
        points={{-66,-60},{-40.44,-60},{-40.44,-19.4}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(enable.y, dLATREGSRH.enable) annotation (Line(
        points={{-66,-22},{-52,-22},{-52,3.2},{-40.44,3.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y, dLATREGSRH.dataIn[1]) annotation (Line(
        points={{-66,18},{-52,18},{-52,34.84},{-40.44,34.84}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y, dLATREGSRH.dataIn[2]) annotation (Line(
        points={{-66,50},{-52,50},{-52,39.36},{-40.44,39.36}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(set.y, dLATREGSRH.set) annotation (Line(
        points={{-66,84},{-40.44,84},{-40.44,59.7}},
        color={127,0,127},
        smooth=Smooth.None));

    annotation (            experiment(StopTime=25),
  Documentation(info="<html>
<p>This example is a simple test of the Registers.DLATREGSRH component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the the truth table which is documented in the DLATREGSRH component.</p>
</html>"));
  end DLATREGSRH;

  model DLATREGSRL "Level sensitive D-Register-Bank, low active set and reset"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table enable(t={0,10,18}, x={L.
      '0',L.'1',L.'0'})
  annotation (Placement(transformation(extent={{-86,-32},{-66,-12}})));
    Modelica_Electrical_Digital.Sources.Table data_0(x={L.'W',L.'1'}, t={
      0,15})
  annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
    Modelica_Electrical_Digital.Sources.Table reset(t={0,1,2,20,21}, x={L.
      '1',L.'0',L.'1',L.'0',L.'1'})
  annotation (Placement(transformation(extent={{-86,-70},{-66,-50}})));
    Modelica_Electrical_Digital.Sources.Table data_1(x={L.'0',L.'1'}, t={
      0,16})
  annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
    Modelica_Electrical_Digital.Sources.Table set(t={0,5,6}, x={L.'1',L.
      '0',L.'1'})
  annotation (Placement(transformation(extent={{-86,74},{-66,94}})));
    Modelica_Electrical_Digital.Registers.DLATREGSRL dLATREGSRL(
  tHL=2,
  tLH=3,
  n=2,
  delay(inertialDelaySensitive(each y(start=L.'U', fixed=true))))
  annotation (Placement(transformation(extent={{-45,-43},{69,71}})));
  equation

    connect(reset.y, dLATREGSRL.reset) annotation (Line(
        points={{-66,-60},{-40.44,-60},{-40.44,-20.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(enable.y, dLATREGSRL.enable) annotation (Line(
        points={{-66,-22},{-56,-22},{-56,2.6},{-40.44,2.6}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y, dLATREGSRL.dataIn[1]) annotation (Line(
        points={{-66,18},{-56,18},{-56,34.52},{-40.44,34.52}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y, dLATREGSRL.dataIn[2]) annotation (Line(
        points={{-66,50},{-56,50},{-56,39.08},{-40.44,39.08}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(set.y, dLATREGSRL.set) annotation (Line(
        points={{-66,84},{-40.44,84},{-40.44,59.6}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (            experiment(StopTime=25),
  Documentation(info="<html>
<p>This example is a simple test of the Registers.DLATREGSRL component. The data width is set to two. After simulation plot both the dataIn and the dataOut vectors. To verify the results compare the the truth table which is documented in the DLATREGSRL component.</p>
</html>"));
  end DLATREGSRL;

  model NXFER "Functionality test of NXFERGATE"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;
    Modelica_Electrical_Digital.Sources.Table e_table(
  y0=L.'U',
  x={L.'0',L.'1',L.'Z'},
  t={0,5,9})
  annotation (Placement(transformation(extent={{-75,30},{-55,50}})));
    Modelica_Electrical_Digital.Sources.Table x_table(
  y0=L.'U',
  x={L.'1',L.'0'},
  t={1,7})
  annotation (Placement(transformation(extent={{-75,-20},{-55,0}})));
    Modelica_Electrical_Digital.Tristates.NXFERGATE nXFERGATE(tHL=1, tLH=
      1)
  annotation (Placement(transformation(extent={{-40,-52},{52,41}})));
  equation

    connect(x_table.y, nXFERGATE.x) annotation (Line(
        points={{-55,-10},{-45.2,-10},{-45.2,-10.15},{-35.4,-10.15}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(e_table.y, nXFERGATE.enable) annotation (Line(
        points={{-55,40},{-35.4,40},{-35.4,27.05}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=12),
      Documentation(info="<html>
<p>This example is a simple test of the Tristates.NXFERGATE component.</p>
</html>"));
  end NXFER;

  model NRXFER "Functionality test of NRXFERGATE"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table e_table(
  y0=L.'U',
  x={L.'0',L.'1',L.'Z'},
  t={0,5,9})
  annotation (Placement(transformation(extent={{-75,30},{-55,50}})));
    Modelica_Electrical_Digital.Sources.Table x_table(
  y0=L.'U',
  x={L.'1',L.'0'},
  t={1,7})
  annotation (Placement(transformation(extent={{-75,-20},{-55,0}})));
    Modelica_Electrical_Digital.Tristates.NRXFERGATE nRXFERGATE(tHL=1,
    tLH=1)
  annotation (Placement(transformation(extent={{-40,-54},{58,44}})));
  equation
    connect(x_table.y, nRXFERGATE.x) annotation (Line(
        points={{-55,-10},{-45.05,-10},{-45.05,-9.9},{-35.1,-9.9}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(e_table.y, nRXFERGATE.enable) annotation (Line(
        points={{-55,40},{-35.1,40},{-35.1,29.3}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=12),
      Documentation(info="<html>
<p>This example is a simple test of the Tristates.NRXFER component.  After simulation until 12 s plot x, enable, and y of the <code>nRXFERGATE </code>component. To verify the result compare to the truth table <code>NRXferTable</code>.</p>
</html>"));
  end NRXFER;

  model BUF3S "Functionality test of BUF3S"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;
    Modelica_Electrical_Digital.Sources.Table e_table(
  y0=L.'U',
  x={L.'0',L.'1',L.'Z'},
  t={0,5,9})
  annotation (Placement(transformation(extent={{-75,30},{-55,50}})));
    Modelica_Electrical_Digital.Sources.Table x_table(
  y0=L.'U',
  x={L.'1',L.'0'},
  t={1,7})
  annotation (Placement(transformation(extent={{-75,-20},{-55,0}})));
    Modelica_Electrical_Digital.Tristates.BUF3S bUF3S(
  tHL=1,
  tLH=1,
  strength=Modelica_Electrical_Digital.Interfaces.Strength.'S_X01')
  annotation (Placement(transformation(extent={{-40,-50},{48,38}})));
  equation
    connect(x_table.y, bUF3S.x) annotation (Line(
        points={{-55,-10},{-35.6,-10.4}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(e_table.y, bUF3S.enable) annotation (Line(
        points={{-55,40},{-35.6,40},{-35.6,24.8}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=12),
      Documentation(info="<html>
<p>This example is a simple test of the Tristates.BUF3S component.  After simulation until 12 s plot x, enable, and y of the <code>bUF3S</code> component. To verify the result compare to the truth table Buf3sTable.</p>
</html>"));
  end BUF3S;

  model INV3S "Functionality test of INV3S"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Sources.Table e_table(
  y0=L.'U',
  x={L.'0',L.'1',L.'Z'},
  t={0,5,9})
  annotation (Placement(transformation(extent={{-75,30},{-55,50}})));
    Modelica_Electrical_Digital.Sources.Table x_table(
  y0=L.'U',
  x={L.'1',L.'0'},
  t={1,7})
  annotation (Placement(transformation(extent={{-75,-20},{-55,0}})));
    Modelica_Electrical_Digital.Tristates.INV3S iNV3S
  annotation (Placement(transformation(extent={{-34,-44},{42,32}})));
  equation
    connect(x_table.y, iNV3S.x) annotation (Line(
        points={{-55,-10},{-42.6,-10},{-42.6,-9.8},{-30.2,-9.8}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(e_table.y, iNV3S.enable) annotation (Line(
        points={{-55,40},{-30.2,40},{-30.2,20.6}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=12),
      Documentation(info="<html>
<p>This example is a simple test of the Tristates.INV3S component. After simulation until 12 s plot x, enable, and y of the <code>iNV3S</code> component. To verify the result compare to the truth table <code>T.UX01Table</code>.</p>
</html>"));
  end INV3S;

  model WiredX "Functionality test of WiredX"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;
  Modelica_Electrical_Digital.Sources.Table e_table2(
  y0=L.'U',
  x={L.'0',L.'1',L.'0'},
  t={0,3,9})
  annotation (Placement(transformation(extent={{-85,68},{-65,88}})));
    Modelica_Electrical_Digital.Sources.Table x_table2(
  y0=L.'U',
  x={L.'1',L.'0'},
  t={1,7})
  annotation (Placement(transformation(extent={{-85,18},{-65,38}})));
    Modelica_Electrical_Digital.Tristates.BUF3S bUF3S2(
  tHL=1,
  tLH=1,
  strength=Modelica_Electrical_Digital.Interfaces.Strength.'S_X01')
  annotation (Placement(transformation(extent={{-48,-1},{16,63}})));
    Modelica_Electrical_Digital.Sources.Table e_table1(
  y0=L.'U',
  t={0,3,9},
  x={L.'0',L.'1',L.'0'})
  annotation (Placement(transformation(extent={{-85,-24},{-65,-4}})));
    Modelica_Electrical_Digital.Sources.Table x_table1(
  y0=L.'U',
  x={L.'0',L.'1',L.'0'},
  t={1,5,7})
  annotation (Placement(transformation(extent={{-85,-74},{-65,-54}})));
    Modelica_Electrical_Digital.Tristates.BUF3S bUF3S1(
  tHL=1,
  tLH=1,
  strength=Modelica_Electrical_Digital.Interfaces.Strength.'S_X01')
  annotation (Placement(transformation(extent={{-52,-94},{14,-28}})));
    Modelica_Electrical_Digital.Tristates.WiredX wiredX(n=2)
  annotation (Placement(transformation(extent={{26,-38},{80,16}})));
  equation
    connect(x_table2.y, bUF3S2.x)
                                annotation (Line(
        points={{-65,28},{-44.8,27.8}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(e_table2.y, bUF3S2.enable)
                                     annotation (Line(
        points={{-65,78},{-44.8,78},{-44.8,53.4}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(x_table1.y, bUF3S1.x)
                                annotation (Line(
        points={{-65,-64},{-48.7,-64.3}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(e_table1.y, bUF3S1.enable)
                                     annotation (Line(
        points={{-65,-14},{-48.7,-14},{-48.7,-37.9}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(bUF3S1.y, wiredX.x[1]) annotation (Line(
        points={{10.7,-64.3},{24,-64.3},{24,-21.8},{36.8,-21.8}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(bUF3S2.y, wiredX.x[2]) annotation (Line(
        points={{12.8,27.8},{26,27.8},{26,-0.2},{36.8,-0.2}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=12),
      Documentation(info="<html>
<p>This example is a simple test of the Tristates.WiredX component. The input width is set to two. After simulation until 12 s plot x[1], x[2], and y of the WiredX component. To verify the result compare to the truth table  Tables.ResolutionTable.</p>
</html>"));
  end WiredX;

  model MUX2x1 "Simple Multiplexer test"
    import D = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;
    D.Multiplexers.MUX2x1 Mux2x1
      annotation (Placement(transformation(extent={{-34,-48},{56,48}})));
    D.Sources.Table Input1(
      y0=L.'U',
      x={L.'X',L.'0',L.'1',L.'0',L.'X',L.'U'},
      t={2,4,6,8,10,12})
      annotation (Placement(transformation(extent={{-90,14},{-70,34}})));
    D.Sources.Step Select(
      before=L.'0',
      after=L.'1',
      stepTime=7)
      annotation (Placement(transformation(extent={{-90,58},{-70,78}})));
    D.Sources.Table Input0(
      y0=L.'U',
      t={2,4,6,8,10,12},
      x={L.'1',L.'X',L.'0',L.'X',L.'1',L.'U'})
      annotation (Placement(transformation(extent={{-90,-34},{-70,-14}})));
  equation
    connect(Select.y, Mux2x1.sel) annotation (Line(
        points={{-70,68},{11,68},{11,43.2}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(Input0.y, Mux2x1.in0) annotation (Line(
        points={{-70,-24},{-29.5,-24}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(Input1.y, Mux2x1.in1) annotation (Line(
        points={{-70,24},{-29.5,24}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=15),
      Documentation(info="<html>
<p>This example is a simple test of a single multiplexer component with 2 inputs prescribed by sources, one select input, and one output. After simulation until 15 s plot Mux2x1.in0, Mux2x1.in1, Mux2x1.sel, and Mux2x1.out. Compare the output signal with the input signals. If the select signal changes, the output switches to the other input.</p>
</html>"));
  end MUX2x1;

  model RAM "Simple RAM test example"
    import L = Modelica_Electrical_Digital.Interfaces.Logic;
    extends Modelica_Icons.Example;

    Modelica_Electrical_Digital.Memories.DLATRAM dLATRAM
  annotation (Placement(transformation(extent={{-11,-41},{103,73}})));
    Modelica_Electrical_Digital.Sources.Table addr_1(
  y0=L.'U',
  x={L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',L.'U',L.'X',L.'0',L.
      '1',L.'Z',L.'W',L.'L',L.'H',L.'-',L.'U',L.'X',L.'0',L.'1',L.'Z',L.
      'W',L.'L',L.'H',L.'-',L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.
      'H',L.'-',L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',L.
      'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',L.'U',L.'X',L.
      '0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-',L.'U',L.'X',L.'0',L.'1',L.
      'Z',L.'W',L.'L',L.'H',L.'-',L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.
      'L',L.'H',L.'-'},
  t={5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,
      115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,
      200,205,210,215,220,225,230,235,240,245,250,255,260,265,270,275,280,
      285,290,295,300,305,310,315,320,325,330,335,340,345,350,355,360,365,
      370,375,380,385,390,395,400})
  annotation (Placement(transformation(extent={{-78,76},{-58,96}})));
    Modelica_Electrical_Digital.Sources.Set data_1(x=L.'0')
  annotation (Placement(transformation(extent={{-78,20},{-58,40}})));
    Modelica_Electrical_Digital.Sources.Set data_0(x=L.'0')
  annotation (Placement(transformation(extent={{-78,-8},{-58,12}})));
    Modelica_Electrical_Digital.Sources.Set WE(x=L.'1')
  annotation (Placement(transformation(extent={{-78,-70},{-58,-50}})));
    Modelica_Electrical_Digital.Sources.Table addr_0(
  y0=L.'U',
  t={45,90,135,180,225,270,315,360},
  x={L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'-'})
  annotation (Placement(transformation(extent={{-78,48},{-58,68}})));
    Modelica_Electrical_Digital.Sources.Set RE(x=L.'1')
  annotation (Placement(transformation(extent={{-78,-38},{-58,-18}})));

  equation
    connect(RE.y,dLATRAM. RE) annotation (Line(
        points={{-58,-28},{-28,-28},{-28,4.6},{-6.44,4.6}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(WE.y,dLATRAM. WE) annotation (Line(
        points={{-58,-60},{-24,-60},{-24,-12.5},{-6.44,-12.5}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(addr_0.y,dLATRAM. addr[1]) annotation (Line(
        points={{-58,58},{-34,58},{-34,47.35},{-5.3,47.35}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(addr_1.y,dLATRAM. addr[2]) annotation (Line(
        points={{-58,86},{-32,86},{-32,53.05},{-5.3,53.05}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_1.y,dLATRAM. dataIn[2]) annotation (Line(
        points={{-58,30},{-32,30},{-32,30.25},{-5.3,30.25}},
        color={127,0,127},
        smooth=Smooth.None));
    connect(data_0.y,dLATRAM. dataIn[1]) annotation (Line(
        points={{-58,2},{-34,2},{-34,24.55},{-5.3,24.55}},
        color={127,0,127},
        smooth=Smooth.None));
    annotation (experiment(StopTime=400),
      Documentation(info="<html>
<p>This example is a simple and uncomplete test of a single DLATRAM component . After simulation until 400 s plot dLATRAM.addr[1], dLATRAM.addr[2], and dLATRAM.dataOUT[1], dLATRAM.dataOut[2]. The address inputs are  prescribed with all possible combinations of logic values. It can be checked in which cases of address values the output is 'X' or '0'. </p>
</html>"));
  end RAM;

package Utilities "Utility components used by package Examples"
  extends Modelica_Icons.UtilitiesPackage;

  model MUX4 "4 to 1 Bit Multiplexer"
  import D = Modelica_Electrical_Digital;
  import L = Modelica_Electrical_Digital.Interfaces.Logic;

    parameter Modelica_SIunits.Time delayTime=0.001 "Delay time";
    parameter D.Interfaces.Logic q0=L.'0' "Initial value";
      D.Interfaces.DigitalInput d0 annotation (Placement(transformation(
              extent={{-110,60},{-90,80}}, rotation=0)));
      D.Interfaces.DigitalInput d1 annotation (Placement(transformation(
              extent={{-110,34},{-90,54}}, rotation=0)));
      D.Interfaces.DigitalInput d2 annotation (Placement(transformation(
              extent={{-110,8},{-90,28}}, rotation=0)));
      D.Interfaces.DigitalInput d3 annotation (Placement(transformation(
              extent={{-110,-18},{-90,2}}, rotation=0)));
      D.Interfaces.DigitalInput a0 annotation (Placement(transformation(
              extent={{-110,-54},{-90,-34}}, rotation=0)));
      D.Interfaces.DigitalInput a1 annotation (Placement(transformation(
              extent={{-110,-80},{-90,-60}}, rotation=0)));
      D.Interfaces.DigitalOutput d annotation (Placement(transformation(
              extent={{90,-10},{110,10}}, rotation=0)));
      D.Basic.Or Or1(n=4) annotation (Placement(transformation(extent={{50,20},
                {70,40}}, rotation=0)));
      D.Basic.And And1(n=3) annotation (Placement(transformation(extent={{-20,
                60},{0,80}}, rotation=0)));
      D.Basic.And And2(n=3) annotation (Placement(transformation(extent={{-20,
                34},{0,54}}, rotation=0)));
      D.Basic.And And3(n=3) annotation (Placement(transformation(extent={{-20,
                8},{0,28}}, rotation=0)));
      D.Basic.And And4(n=3) annotation (Placement(transformation(extent={{-20,
                -18},{0,2}}, rotation=0)));
      D.Basic.Not Not1 annotation (Placement(transformation(extent={{-76,-54},
                {-56,-34}}, rotation=0)));
      D.Basic.Not Not2 annotation (Placement(transformation(extent={{-76,-80},
                {-56,-60}}, rotation=0)));
  equation
      connect(a0, Not1.x) annotation (Line(
          points={{-100,-44},{-72,-44}},
          color={127,0,127}));
      connect(a1, Not2.x) annotation (Line(
          points={{-100,-70},{-72,-70}},
          color={127,0,127}));
      connect(d0, And1.x[2]) annotation (Line(
          points={{-100,70},{-58,70},{-58,70},{-16,70}},
          color={127,0,127}));
      connect(d1, And2.x[2]) annotation (Line(
          points={{-100,44},{-16,44}},
          color={127,0,127}));
      connect(d2, And3.x[2]) annotation (Line(
          points={{-100,18},{-16,18}},
          color={127,0,127}));
      connect(d3, And4.x[2]) annotation (Line(
          points={{-100,-8},{-58,-8},{-58,-8},{-16,-8}},
          color={127,0,127}));
      connect(And4.y, Or1.x[1]) annotation (Line(
          points={{0,-8},{40,-8},{40,24},{54,24}},
          color={127,0,127}));
      connect(And3.y, Or1.x[2]) annotation (Line(
          points={{0,18},{20,18},{20,28},{54,28}},
          color={127,0,127}));
      connect(And2.y, Or1.x[3]) annotation (Line(
          points={{0,44},{20,44},{20,32},{54,32}},
          color={127,0,127}));
      connect(And1.y, Or1.x[4]) annotation (Line(
          points={{0,70},{40,70},{40,36},{54,36}},
          color={127,0,127}));
      connect(Or1.y, d) annotation (Line(
          points={{70,30},{80,30},{80,0},{100,0}},
          color={127,0,127}));
      connect(Not1.y, And1.x[3]) annotation (Line(
          points={{-56,-44},{-50,-44},{-50,75.3333},{-16,75.3333}},
          color={127,0,127}));
      connect(Not1.y, And3.x[3]) annotation (Line(
          points={{-56,-44},{-50,-44},{-50,23.3333},{-16,23.3333}},
          color={127,0,127}));
      connect(Not2.y, And1.x[1]) annotation (Line(
          points={{-56,-70},{-40,-70},{-40,64.6667},{-16,64.6667}},
          color={127,0,127}));
      connect(Not2.y, And2.x[1]) annotation (Line(
          points={{-56,-70},{-40,-70},{-40,38.6667},{-16,38.6667}},
          color={127,0,127}));
      connect(a0, And4.x[3]) annotation (Line(
          points={{-100,-44},{-80,-44},{-80,-2.66667},{-16,-2.66667}},
          color={127,0,127}));
      connect(a0, And2.x[3]) annotation (Line(
          points={{-100,-44},{-80,-44},{-80,49.3333},{-16,49.3333}},
          color={127,0,127}));
      connect(a1, And4.x[1]) annotation (Line(
          points={{-100,-70},{-80,-70},{-80,-90},{-30,-90},{-30,-13.3333},
          {-16,-13.3333}},
          color={127,0,127}));
      connect(a1, And3.x[1]) annotation (Line(
          points={{-100,-70},{-80,-70},{-80,-90},{-30,-90},{-30,12.6667},
          {-16,12.6667}},
          color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>MUX4 is a four bit multiplexer which is built up by And, Not, and Or gates according to the schematic.</p>
<p>The parameters delayTime and q0 are prepared but <b>not</b> yet used in the component. The MUX4 component uses standard values in its components.</p>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,100},{-60,-100}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{60,100},{60,-100}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-86,80},{-64,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="D0"),
        Text(
          extent={{64,12},{86,-8}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="D"),
        Text(
          extent={{-150,-100},{150,-160}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          extent={{-60,100},{60,40}},
          lineColor={0,0,0},
          textString="MUX"),
        Text(
          extent={{-86,-60},{-64,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="A1"),
        Text(
          extent={{-86,54},{-64,34}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="D1"),
        Text(
          extent={{-86,28},{-64,8}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="D2"),
        Text(
          extent={{-86,2},{-64,-18}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="D3"),
        Text(
          extent={{-86,-36},{-64,-56}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="A0")}));
  end MUX4;

  model RS "Unclocked RS FlipFlop"
    import D = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital.Interfaces.Logic;

    parameter Modelica_SIunits.Time delayTime=0 "Delay time";
    parameter D.Interfaces.Logic q0=L.'U' "Initial value of output";
    D.Basic.Nor Nor1   annotation (Placement(transformation(extent={{-40,42},
                {0,82}}, rotation=0)));
    D.Basic.Nor Nor2   annotation (Placement(transformation(extent={{-40,-82},
                {0,-42}}, rotation=0)));
    D.Interfaces.DigitalInput s   annotation (Placement(transformation(extent=
               {{-110,60},{-90,80}}, rotation=0)));
    D.Interfaces.DigitalInput r    annotation (Placement(transformation(
              extent={{-110,-80},{-90,-60}}, rotation=0)));
    D.Interfaces.DigitalOutput q   annotation (Placement(transformation(
              extent={{90,60},{110,80}}, rotation=0)));
    D.Interfaces.DigitalOutput qn   annotation (Placement(transformation(
              extent={{90,-80},{110,-60}}, rotation=0)));
    D.Delay.TransportDelay TD1(delayTime=delayTime,y0=q0)
        annotation (Placement(transformation(extent={{-60,-64},{-40,-44}},
              rotation=0)));
  equation
    connect(s, Nor1.x[2])   annotation (Line(points={{-100,70},{-32,70}},
            color={127,0,127}));
    connect(r, Nor2.x[1])    annotation (Line(points={{-100,-70},{-32,-70}},
            color={127,0,127}));
    connect(Nor2.y, Nor1.x[1])   annotation (Line(points={{0,-62},{20,-62},{
              20,-20},{-70,20},{-70,54},{-32,54}}, color={127,0,127}));
    connect(Nor1.y,qn)    annotation (Line(
          points={{0,62},{50,62},{50,-70},{100,-70}},
          color={127,0,127}));
    connect(Nor2.y,q)    annotation (Line(
          points={{0,-62},{70,-62},{70,70},{100,70}},
          color={127,0,127}));
    connect(TD1.y, Nor2.x[2]) annotation (Line(points={{-40,-54},{-32,-54}},
            color={127,0,127}));
    connect(TD1.x, Nor1.y) annotation (Line(points={{-56,-54},{-70,-54},{-70,
              -20},{20,20},{20,62},{0,62}}, color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>RS is a basic component for e.g., the RS (set-reset) flipflop, which is built up by Nor gates according to the schematic. To avoid a numerical loop a small transport delay is inserted which delay time is a parameter of the RS component. Also its initial value can be set by parameter.</p>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,100},{100,40}},
          lineColor={0,0,0},
          textString="RS"),
        Line(
          points={{-60,100},{-60,-100}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{60,100},{60,-100}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-86,-60},{-64,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="R"),
        Text(
          extent={{-86,80},{-64,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="S"),
        Text(
          extent={{64,80},{86,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),
        Text(
          extent={{64,-60},{86,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="QN"),
        Text(
          extent={{-150,-100},{150,-160}},
          lineColor={0,0,255},
          textString="%name")}));
  end RS;

  model RSFF "Unclocked RS FlipFlop"
  import D = Modelica_Electrical_Digital;
  import L = Modelica_Electrical_Digital.Interfaces.Logic;

    parameter Modelica_SIunits.Time delayTime=0.01 "Delay time";
    parameter D.Interfaces.Logic q0=L.'U' "Initial value";
    D.Interfaces.DigitalInput s   annotation (Placement(transformation(extent=
               {{-110,60},{-90,80}}, rotation=0)));
    D.Interfaces.DigitalInput r     annotation (Placement(transformation(
              extent={{-110,-80},{-90,-60}}, rotation=0)));
    D.Interfaces.DigitalOutput q annotation (Placement(transformation(extent=
                {{90,60},{110,80}}, rotation=0)));
    D.Interfaces.DigitalOutput qn "not Q"
      annotation (Placement(transformation(extent={{90,-80},{110,-60}},
              rotation=0)));
    D.Interfaces.DigitalInput clk       annotation (Placement(transformation(
              extent={{-110,-10},{-90,10}}, rotation=0)));
    D.Examples.Utilities.RS RS1(delayTime=delayTime,q0=q0)
                                      annotation (Placement(transformation(
              extent={{-10,-40},{70,40}}, rotation=0)));
    D.Basic.And And1       annotation (Placement(transformation(extent={{-70,
                8},{-30,48}}, rotation=0)));
    D.Basic.And And2       annotation (Placement(transformation(extent={{-70,
                -48},{-30,-8}}, rotation=0)));
  equation
    connect(And2.y, RS1.r)
                          annotation (Line(
          points={{-30,-28},{-10,-28}},
          color={127,0,127}));
    connect(And1.y, RS1.s)
                          annotation (Line(
          points={{-30,28},{-10,28}},
          color={127,0,127}));
    connect(s, And1.x[2]) annotation (Line(
          points={{-100,70},{-70,70},{-70,36},{-62,36}},
          color={127,0,127}));
    connect(clk, And1.x[1]) annotation (Line(
          points={{-100,0},{-70,0},{-70,20},{-62,20}},
          color={127,0,127}));
    connect(clk, And2.x[2]) annotation (Line(
          points={{-100,0},{-70,0},{-70,-20},{-62,-20}},
          color={127,0,127}));
    connect(r, And2.x[1]) annotation (Line(
          points={{-100,-70},{-70,-70},{-70,-36},{-62,-36}},
          color={127,0,127}));
    connect(RS1.q,q) annotation (Line(
          points={{70,28},{80,28},{80,70},{100,70}},
          color={127,0,127}));
    connect(RS1.qn,qn) annotation (Line(
          points={{70,-28},{80,-28},{80,-70},{100,-70}},
          color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>Basing on the RS component RSFF is a RS (set-reset) flipflop composed according the schematic. Its parameter delayTime is the delay time of the RS component transport delay, q0 is the initial value of that delay.</p>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,100},{100,40}},
          lineColor={0,0,0},
          textString="RS"),
        Line(
          points={{-60,100},{-60,-100}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{60,100},{60,-100}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-86,-60},{-64,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="R"),
        Text(
          extent={{-86,80},{-64,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="S"),
        Text(
          extent={{64,80},{86,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),
        Text(
          extent={{64,-60},{86,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="QN"),
        Line(points={{-90,20},{-60,0},{-90,-20}}, color={0,0,0}),
        Text(
          extent={{-150,-100},{150,-160}},
          lineColor={0,0,255},
          textString="%name")}));
  end RSFF;

  model DFF "D FlipFlop"
    import D = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital.Interfaces.Logic;

    parameter Modelica_SIunits.Time Tdel=0.01 "Delay time";
    parameter L QInit=L.'U' "Initial value";
    D.Interfaces.DigitalInput d   annotation (Placement(transformation(extent=
               {{-110,60},{-90,80}}, rotation=0)));
    D.Interfaces.DigitalOutput q annotation (Placement(transformation(extent=
                {{90,60},{110,80}}, rotation=0)));
    D.Interfaces.DigitalOutput qn "not Q"
      annotation (Placement(transformation(extent={{90,-80},{110,-60}},
              rotation=0)));
    D.Interfaces.DigitalInput clk       annotation (Placement(transformation(
              extent={{-110,-10},{-90,10}}, rotation=0)));
    D.Examples.Utilities.RSFF RSFF1   annotation (Placement(transformation(
              extent={{-10,-40},{70,40}}, rotation=0)));
    D.Basic.Not Not1      annotation (Placement(transformation(extent={{-70,
                -48},{-30,-8}}, rotation=0)));
  equation
    connect(RSFF1.q,q)
                     annotation (Line(
          points={{70,28},{80,28},{80,70},{100,70}},
          color={127,0,127}));
    connect(RSFF1.qn,qn)
                       annotation (Line(
          points={{70,-28},{80,-28},{80,-70},{100,-70}},
          color={127,0,127}));
    connect(Not1.y, RSFF1.r)
                           annotation (Line(
          points={{-30,-28},{-22,-28},{-10,-28}},
          color={127,0,127}));
    connect(d, Not1.x)  annotation (Line(
          points={{-100,70},{-80,70},{-80,-28},{-62,-28}},
          color={127,0,127}));
    connect(d, RSFF1.s)  annotation (Line(
          points={{-100,70},{-80,70},{-80,28},{-10,28}},
          color={127,0,127}));
  connect(clk, RSFF1.clk) annotation (Line(
      points={{-100,0},{-10,0}},
      color={127,0,127},
      smooth=Smooth.None));
    annotation (
      Documentation(info="<html>
<p>Basing on the RS component DFF is a D  flipflop composed according the schematic. Its parameter delayTime is the delay time of the RS component transport delay, q0 is the initial value of that delay.</p>
</html>"),
       Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,100},{-60,-100}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{60,100},{60,-100}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-86,80},{-64,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="D"),
        Text(
          extent={{64,80},{86,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),
        Text(
          extent={{64,-60},{86,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="QN"),
        Line(points={{-90,20},{-60,0},{-90,-20}}, color={0,0,0}),
        Text(
          extent={{-150,-100},{150,-160}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          extent={{-100,100},{100,40}},
          lineColor={0,0,0},
          textString="D")}));
  end DFF;

  model JKFF "JK FlipFlop"
  import D = Modelica_Electrical_Digital;
  import L = Modelica_Electrical_Digital.Interfaces.Logic;

    parameter Modelica_SIunits.Time delayTime=0.001 "Delay time";
    parameter D.Interfaces.Logic q0=L.'0' "Initial value";
    D.Interfaces.DigitalInput j   annotation (Placement(transformation(extent=
               {{-110,60},{-90,80}}, rotation=0)));
    D.Interfaces.DigitalOutput q annotation (Placement(transformation(extent=
                {{90,60},{110,80}}, rotation=0)));
    D.Interfaces.DigitalOutput qn "not Q"
      annotation (Placement(transformation(extent={{90,-80},{110,-60}},
              rotation=0)));
    D.Interfaces.DigitalInput clk       annotation (Placement(transformation(
              extent={{-110,-10},{-90,10}}, rotation=0)));
    D.Interfaces.DigitalInput k   annotation (Placement(transformation(extent=
               {{-110,-80},{-90,-60}}, rotation=0)));
      D.Examples.Utilities.RS RS1(delayTime=delayTime,q0=q0)
                                   annotation (Placement(transformation(
              extent={{30,-24},{70,16}}, rotation=0)));
      D.Examples.Utilities.RS RS2(delayTime=delayTime,q0=q0)
                                   annotation (Placement(transformation(
              extent={{-44,-20},{-4,20}}, rotation=0)));
      D.Basic.And And1(n=3) annotation (Placement(transformation(extent={{-70,
                4},{-50,24}}, rotation=0)));
      D.Basic.And And2(n=3) annotation (Placement(transformation(extent={{-70,
                -24},{-50,-4}}, rotation=0)));
      D.Basic.And And3 annotation (Placement(transformation(extent={{4,0},{24,
                20}}, rotation=0)));
      D.Basic.And And4 annotation (Placement(transformation(extent={{4,-28},{
                24,-8}}, rotation=0)));
      D.Basic.Not Not1 annotation (Placement(transformation(extent={{-34,-66},
                {-14,-46}}, rotation=0)));
  equation
      connect(And2.y, RS2.r) annotation (Line(points={{-50,-14},{-44,-14}},
            color={127,0,127}));
      connect(And1.y, RS2.s) annotation (Line(points={{-50,14},{-44,14}},
            color={127,0,127}));
      connect(clk, And2.x[3]) annotation (Line(points={{-100,0},{-74,0},{
          -74,-8.66667},{-66,-8.66667}}, color={127,0,127}));
      connect(clk, And1.x[1]) annotation (Line(points={{-100,0},{-74,0},{
          -74,8.66667},{-66,8.66667}}, color={127,0,127}));
      connect(k, And2.x[2]) annotation (Line(points={{-100,-70},{-74,-70},{
              -74,-14},{-66,-14}}, color={127,0,127}));
      connect(And4.y, RS1.r) annotation (Line(points={{24,-18},{30,-18}},
            color={127,0,127}));
      connect(And3.y, RS1.s) annotation (Line(points={{24,10},{30,10}}, color=
             {127,0,127}));
      connect(RS2.qn, And4.x[2]) annotation (Line(points={{-4,-14},{8,-14}},
            color={127,0,127}));
      connect(RS2.q, And3.x[2]) annotation (Line(points={{-4,14},{8,14}},
            color={127,0,127}));
      connect(clk, Not1.x) annotation (Line(points={{-100,0},{-80,0},{-80,-56},
              {-30,-56}}, color={127,0,127}));
      connect(Not1.y, And3.x[1]) annotation (Line(points={{-14,-56},{2,-56},{
              2,6},{8,6}}, color={127,0,127}));
      connect(Not1.y, And4.x[1]) annotation (Line(points={{-14,-56},{2,-56},{
              2,-22},{8,-22}}, color={127,0,127}));
      connect(j, And1.x[2]) annotation (Line(points={{-100,70},{-74,70},{-74,
              14},{-66,14}}, color={127,0,127}));
      connect(RS1.q, And2.x[1]) annotation (Line(points={{70,10},{80,10},
          {80,-36},{-70,-36},{-70,-19.3333},{-66,-19.3333}}, color={127,0,127}));
      connect(RS1.qn, And1.x[3]) annotation (Line(points={{70,-18},{86,
          -18},{86,36},{-70,36},{-70,19.3333},{-66,19.3333}},
                                                            color={127,0,127}));
    connect(RS1.qn, q) annotation (Line(points={{70,-18},{86,-18},{86,70},{
              100,70}}, color={127,0,127}));
    connect(RS1.q, qn) annotation (Line(points={{70,10},{80,10},{80,-70},{100,
              -70}}, color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>Basing on the RS component JKFF is a J-K-flipflop composed according the schematic. Its parameter delayTime is the delay time of the RS component transport delay, q0 is the initial value of that delay.</p>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,100},{-60,-100}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{60,100},{60,-100}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-86,80},{-64,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="J"),
        Text(
          extent={{64,80},{86,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),
        Text(
          extent={{64,-60},{86,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="QN"),
        Line(points={{-90,20},{-60,0},{-90,-20}}, color={0,0,0}),
        Text(
          extent={{-150,-100},{150,-160}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          extent={{-100,100},{100,40}},
          lineColor={0,0,0},
          textString="JK"),
        Text(
          extent={{-86,-60},{-64,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="K")}));
  end JKFF;

            model HalfAdder "Half adder"
              import L = Modelica_Electrical_Digital.Interfaces.Logic;
              parameter Real delayTime=0 "Delay time";
              Modelica_Electrical_Digital.Interfaces.DigitalInput b annotation (Placement(
            transformation(extent={{-110,-80},{-90,-60}}, rotation=0)));
              Modelica_Electrical_Digital.Interfaces.DigitalOutput s
        annotation (Placement(transformation(extent={{90,60},{110,80}},
              rotation=0)));
              Modelica_Electrical_Digital.Interfaces.DigitalInput a annotation (Placement(
            transformation(extent={{-110,60},{-90,80}}, rotation=0)));
              Modelica_Electrical_Digital.Interfaces.DigitalOutput c
        annotation (Placement(transformation(extent={{90,-80},{110,-60}},
              rotation=0)));
              Modelica_Electrical_Digital.Gates.AndGate AND(
        tLH=delayTime,
        tHL=delayTime,
        G2(y(start=L.'U', fixed=true))) annotation (Placement(transformation(
              extent={{-20,-82},{20,-42}}, rotation=0)));
              Modelica_Electrical_Digital.Gates.XorGate XOR(
        tLH=delayTime,
        tHL=delayTime,
        G2(y(start=L.'U', fixed=true))) annotation (Placement(transformation(
              extent={{-20,42},{20,82}}, rotation=0)));

            equation
              connect(AND.y, c)
                             annotation (Line(points={{20,-62},{60,-62},{60,-70},
              {100,-70}}, color={127,0,127}));
              connect(XOR.y, s)
                             annotation (Line(points={{20,62},{60,62},{60,70},
              {100,70}}, color={127,0,127}));
              connect(b, AND.x[1])
                                annotation (Line(points={{-100,-70},{-12,-70}},
            color={127,0,127}));
              connect(b, XOR.x[1])
                                annotation (Line(points={{-100,-70},{-30,-70},
              {-30,54},{-12,54}}, color={127,0,127}));
              connect(a, XOR.x[2])
                                annotation (Line(points={{-100,70},{-12,70}},
            color={127,0,127}));
              connect(a, AND.x[2])
                                annotation (Line(points={{-100,70},{-40,70},{
              -40,-54},{-12,-54}}, color={127,0,127}));
              annotation ( Icon(coordinateSystem(preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Rectangle(
                            extent={{-90,100},{90,-100}},
                            lineColor={0,0,0},
                            lineThickness=0.5,
                            fillColor={255,255,170},
                            fillPattern=FillPattern.Solid),Text(
                            extent={{-90,80},{-60,60}},
                            lineColor={0,0,0},
                            textString="a"),Text(
                            extent={{-90,-60},{-60,-80}},
                            lineColor={0,0,0},
                            textString="b"),Text(
                            extent={{60,80},{90,60}},
                            lineColor={0,0,0},
                            textString="s"),Text(
                            extent={{60,-60},{90,-80}},
                            lineColor={0,0,0},
                            textString="c"),Text(
                            extent={{-150,-100},{150,-160}},
                            lineColor={0,0,255},
                            textString="%name"),Text(
                            extent={{-100,100},{100,0}},
                            lineColor={0,0,0},
                            textString="+"),Line(
                            points={{-60,100},{-60,-100}},
                            color={0,0,0},
                            thickness=0.5),Line(
                            points={{60,100},{60,-100}},
                            color={0,0,0},
                            thickness=0.5)}),
                Documentation(info="<html>
<p>HalfAdder is a two bit adder which is composed by Gates components.</p>
<p>Its logic behavior is like this:</p>
<p><b>HalfAdder behavior</b></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><h4>input a</h4></td>
<td valign=\"top\"><h4>input b</h4></td>
<td valign=\"top\"><h4>sum s</h4></td>
<td valign=\"top\"><h4>carry c</h4></td>
</tr>
<tr>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
</tr>
<tr>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
</tr>
<tr>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
</tr>
<tr>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
</tr>
</table>
<p>The parameter delayTime is the delay time (tLH=tHL) of both the components.</p>
</html>"));
            end HalfAdder;

  model FullAdder "Adding circuit for binary numbers with input carry bit"

    HalfAdder Adder2(delayTime=0.001)
                                    annotation (Placement(transformation(
              extent={{10,36},{50,76}}, rotation=0)));
    HalfAdder Adder1(delayTime=0.001)
                                     annotation (Placement(transformation(
              extent={{-60,36},{-20,76}}, rotation=0)));
    Modelica_Electrical_Digital.Interfaces.DigitalInput a annotation (
      Placement(transformation(
        origin={-100,70},
        extent={{-10,-10},{10,10}},
        rotation=180)));
    Modelica_Electrical_Digital.Interfaces.DigitalInput b annotation (
      Placement(transformation(
        origin={-100,30},
        extent={{-10,-10},{10,10}},
        rotation=180)));
    Modelica_Electrical_Digital.Interfaces.DigitalInput c_in annotation (
      Placement(transformation(
        origin={-100,-70},
        extent={{-10,-10},{10,10}},
        rotation=180)));
    Modelica_Electrical_Digital.Interfaces.DigitalOutput s annotation (
      Placement(transformation(
        origin={101,70},
        extent={{11,-10},{-11,10}},
        rotation=180)));
    Modelica_Electrical_Digital.Interfaces.DigitalOutput c_out
    annotation (Placement(transformation(
        origin={100,-70},
        extent={{10,-10},{-10,10}},
        rotation=180)));
    Modelica_Electrical_Digital.Basic.Or OR annotation (Placement(
        transformation(extent={{10,-90},{50,-50}}, rotation=0)));
  equation

    connect(c_out, OR.y)   annotation (Line(
          points={{100,-70},{50,-70}},
          color={127,0,127}));
    connect(Adder2.c, OR.x[2])
                             annotation (Line(
          points={{50,42},{70,42},{70,-40},{10,-40},{10,-62},{18,-62}},
          color={127,0,127}));
    connect(Adder2.s, s)
      annotation (Line(points={{50,70},{101,70}}, color={127,0,127}));
      connect(Adder1.a, a) annotation (Line(points={{-60,70},{-100,70}},
            color={127,0,127}));
      connect(b, Adder1.b) annotation (Line(points={{-100,30},{-70,30},{-70,
              42},{-60,42}}, color={127,0,127}));
      connect(Adder1.s, Adder2.a) annotation (Line(points={{-20,70},{10,70}},
            color={127,0,127}));
      connect(Adder1.c, OR.x[1]) annotation (Line(points={{-20,42},{-10,42},{
              -10,-78},{18,-78}}, color={127,0,127}));
      connect(c_in, Adder2.b) annotation (Line(points={{-100,-70},{0,-70},{0,
              42},{10,42}}, color={127,0,127}));
    annotation (
      Documentation(info="<html>
<p>FullAdder is a two bit adder with additional carry in bit which is composed by Gates components.</p>
<p>Its logic behavior is like this:</p>
<p><b>FullAdder behavior</b></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><h4>input a</h4></td>
<td valign=\"top\"><h4>input b</h4></td>
<td valign=\"top\"><h4>input carry c_in</h4></td>
<td valign=\"top\"><h4>sum s</h4></td>
<td valign=\"top\"><h4>output carry c_out</h4></td>
</tr>
<tr>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
</tr>
<tr>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
</tr>
<tr>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
</tr>
<tr>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
</tr>
<tr>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
</tr>
<tr>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
</tr>
<tr>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>1</p></td>
</tr>
<tr>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>1</p></td>
</tr>
</table>
</html>"),
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,-96},{150,-151}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          extent={{-86,80},{-64,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="a"),
        Text(
          extent={{-86,40},{-64,20}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="b"),
        Text(
          extent={{-86,-60},{-64,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="c_in"),
        Text(
          extent={{60,-60},{90,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="c_out"),
        Text(
          extent={{64,80},{86,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="s"),
        Text(
          extent={{-100,100},{100,0}},
          lineColor={0,0,0},
          textString="+"),
        Line(
          points={{-60,100},{-60,-100}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{60,100},{60,-100}},
          color={0,0,0},
          thickness=0.5)}));
  end FullAdder;

  model Adder "Generic N Bit Adder"
  import Digital = Modelica_Electrical_Digital;

    parameter Integer n=2 "Number of single adders";
    FullAdder Adder[n] annotation (Placement(transformation(extent={{-20,-20},{
                20,20}}, rotation=0)));
    Modelica_Electrical_Digital.Interfaces.DigitalInput a[n] annotation (
      Placement(transformation(extent={{-110,60},{-90,80}}, rotation=0)));
    Modelica_Electrical_Digital.Interfaces.DigitalInput b[n] annotation (
      Placement(transformation(extent={{-110,20},{-90,40}}, rotation=0)));
    Modelica_Electrical_Digital.Interfaces.DigitalInput c_in annotation (
      Placement(transformation(extent={{-110,-80},{-90,-60}}, rotation=0)));
    Modelica_Electrical_Digital.Interfaces.DigitalOutput s[n] annotation (
     Placement(transformation(extent={{90,60},{110,80}}, rotation=0)));
    Modelica_Electrical_Digital.Interfaces.DigitalOutput c_out
    annotation (Placement(transformation(extent={{90,-80},{110,-60}},
          rotation=0)));
  equation
    connect(c_in,Adder[1].c_in);
    for i in 1:n loop
      connect(a[i],Adder[i].a);
      connect(b[i],Adder[i].b);
      connect(Adder[i].a,s[i]);
      if i>1 then
        connect(Adder[i-1].c_out,Adder[i].c_in);
      end if;
    end for;
    connect(Adder[n].c_out,c_out);
    annotation (
      Documentation(info="<html>
<p>The Adder is a generic n bit adder which is composed as a chain of FullAdder components. n can be chosen by the user, a and b are the n bit input vectors, s is the sum vector, and c_out is the carry bit of the &quot;highes&quot; FullAdder.   All components are built up by Gate components.</p>
</html>"),
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{68,80},{88,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="S"),
        Text(
          extent={{-150,-100},{150,-160}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          extent={{-40,60},{40,20}},
          lineColor={0,0,0},
          textString="Adder"),
        Text(
          extent={{48,-60},{88,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Cout"),
        Text(
          extent={{-90,-60},{-50,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Cin"),
        Text(
          extent={{-88,80},{-68,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="A"),
        Text(
          extent={{-88,40},{-68,20}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="B")}));
  end Adder;

  model Counter3 "3 Bit Counter"
  import D = Modelica_Electrical_Digital;
  import L = Modelica_Electrical_Digital.Interfaces.Logic;

    D.Interfaces.DigitalInput enable
                                   annotation (Placement(transformation(
              extent={{-110,60},{-90,80}}, rotation=0)));
    D.Interfaces.DigitalOutput q2 annotation (Placement(transformation(extent=
               {{90,60},{110,80}}, rotation=0)));
    D.Interfaces.DigitalInput count
                                   annotation (Placement(transformation(
              extent={{-110,-80},{-90,-60}}, rotation=0)));
    D.Examples.Utilities.JKFF FF1
         annotation (Placement(transformation(extent={{-74,-20},{-34,20}},
              rotation=0)));
    D.Examples.Utilities.JKFF FF2
         annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=0)));
    D.Examples.Utilities.JKFF FF3
         annotation (Placement(transformation(extent={{34,-20},{74,20}},
              rotation=0)));
    D.Interfaces.DigitalOutput q1 annotation (Placement(transformation(extent=
               {{90,-10},{110,10}}, rotation=0)));
    D.Interfaces.DigitalOutput q0 annotation (Placement(transformation(extent=
               {{90,-80},{110,-60}}, rotation=0)));
  equation
    connect(enable, FF1.j)       annotation (Line(
          points={{-100,70},{-80,70},{-80,14},{-74,14}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(enable, FF1.k)      annotation (Line(
          points={{-100,70},{-80,70},{-80,-14},{-74,-14}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(count, FF1.clk)      annotation (Line(
          points={{-100,-70},{-86,-70},{-86,0},{-74,0}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(FF1.q, FF2.clk)        annotation (Line(
          points={{-34,14},{-30,14},{-30,0},{-20,0}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(FF2.q, FF3.clk)        annotation (Line(
          points={{20,14},{24,14},{24,0},{34,0}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(FF2.j, enable)       annotation (Line(
          points={{-20,14},{-26,14},{-26,70},{-100,70}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(FF2.k, FF2.j)         annotation (Line(
          points={{-20,-14},{-26,-14},{-26,14},{-20,14}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(FF3.k, FF3.j)         annotation (Line(
          points={{34,-14},{28,-14},{28,14},{34,14}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(FF3.j, enable)       annotation (Line(
          points={{34,14},{28,14},{28,70},{-100,70}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(FF3.q, q2)     annotation (Line(
          points={{74,14},{80,14},{80,70},{100,70}},
          color={127,0,127},
          fillPattern=FillPattern.Solid));
    connect(FF1.q, q0) annotation (Line(points={{-34,14},{-30,14},{-30,-70},{
              100,-70}}, color={127,0,127}));
    connect(FF2.q, q1) annotation (Line(points={{20,14},{24,14},{24,-50},{86,
              -50},{86,0},{100,0}}, color={127,0,127}));
     annotation (
       Documentation(info="<html>
<p>The Counter3 counts the high-low slopes of the count signal, if the enable signal is set to be true. It is composed by three JK flipflops. q0, q1, and q2 are the bits of the resulting number, where q0 is the lowest, and q2 the highest bit.</p>
</html>"),
       Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,80},{-40,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="ENABLE"),
        Text(
          extent={{64,80},{86,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q2"),
        Text(
          extent={{64,-60},{86,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q0"),
        Text(
          extent={{-150,-100},{150,-160}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          extent={{-60,40},{60,0}},
          lineColor={0,0,0},
          textString="Counter3"),
        Text(
          extent={{-80,-60},{-40,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="COUNT"),
        Text(
          extent={{62,8},{84,-12}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q1")}));
  end Counter3;

  model Counter "Generic N Bit Counter"
  import D = Modelica_Electrical_Digital;
  import L = Modelica_Electrical_Digital.Interfaces.Logic;

    parameter Integer n=3 "Number of bits";
    parameter Modelica_SIunits.Time delayTime=0.001 "Delay of each JKFF";
    parameter D.Interfaces.Logic q0=L.'0' "Initial value";
    D.Interfaces.DigitalInput enable
                                  annotation (Placement(transformation(extent=
               {{-110,60},{-90,80}}, rotation=0)));
    D.Interfaces.DigitalInput count
                                  annotation (Placement(transformation(extent=
               {{-110,-80},{-90,-60}}, rotation=0)));
    D.Examples.Utilities.JKFF FF[n](each delayTime=delayTime,each q0=q0);
    D.Interfaces.DigitalOutput q[n] annotation (Placement(transformation(
              extent={{90,-80},{110,80}}, rotation=0)));
  equation
    connect(enable,FF[1].j);
    connect(enable,FF[1].k);
    connect(count,FF[1].clk);
    connect(FF[1].q,q[1]);
    for i in 2:n loop
      connect(enable,FF[i].j);
      connect(enable,FF[i].k);
      connect(FF[i-1].q,FF[i].clk);
      connect(FF[i].q,q[i]);
    end for;
    annotation (
      Documentation(info="<html>
<p>The Counter is a generic component, which counts the high-low slopes of the count signal, if the enable signal is set to be true. It is composed by  n JK flipflops. q is the resulting number, where q[0] is the lowest, and q[n] the highest bit.</p>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(
          extent={{90,80},{110,-80}},
          lineColor={127,0,127},
          fillColor={127,0,127},
          fillPattern=FillPattern.Solid)}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{90,80},{110,-80}},
          lineColor={127,0,127},
          fillColor={127,0,127},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-90,100},{90,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,80},{-40,60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="ENABLE"),
        Text(
          extent={{66,8},{88,-12}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),
        Text(
          extent={{-150,-100},{150,-160}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          extent={{-40,40},{40,0}},
          lineColor={0,0,0},
          textString="Counter"),
        Text(
          extent={{-80,-60},{-40,-80}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="COUNT")}));
  end Counter;
    annotation (Documentation(info="<html>
<p>This package contains utility components used by package Examples. Each component is built up hierarchically by components of the Gates package. In this way the Gates components were tested, and their usage is demonstrated.</p>
</html>"));
end Utilities;

  annotation (                                Documentation(info="<html>
<p>This package contains examples that demonstrate the usage of the components of the Electrical.Digital library.</p>
<p>The examples are simple to understand. They will show a typical behavior of the components, and they will give hints to users.</p>
</html>"),
              uses(Modelica_SIunits(version="3.2.2"),
                   Modelica_Electrical_Digital(version="3.2.2"),
                   Modelica_Icons(version="3.2.2")),
              version="3.2.2");

end Modelica_Electrical_Digital_Examples;
