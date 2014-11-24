within ;
encapsulated package Modelica_Blocks
  "Library of basic input/output control blocks (continuous, discrete, logical, table blocks)"
import SI = Modelica_SIunits;
  import Modelica_Icons;
  import Modelica_Constants;
  import Modelica_Utilities;
  import Modelica_Math;
  import Modelica_Blocks_Interfaces;


extends Modelica_Icons.Package;

  package Continuous
    "Library of continuous control blocks with internal states"

    import Interfaces =
           Modelica_Blocks_Interfaces;
    import SIunits = Modelica_SIunits;
    extends Modelica_Icons.Package;

    block Integrator "Output the integral of the input signal"
      import Modelica_Blocks.Types.Init;
      parameter Real k(unit="1")=1 "Integrator gain";

      /* InitialState is the default, because it was the default in Modelica 2.2
     and therefore this setting is backward compatible
  */
      parameter Init initType=Init.InitialState
        "Type of initialization (1: no init, 2: steady state, 3,4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real y_start=0 "Initial or guess value of output (= state)"
        annotation (Dialog(group="Initialization"));
      extends Interfaces.SISO(y(start=y_start));

    initial equation
      if initType == Init.SteadyState then
         der(y) = 0;
      elseif initType == Init.InitialState or
             initType == Init.InitialOutput then
        y = y_start;
      end if;
    equation
      der(y) = k*u;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes output <b>y</b> (element-wise) as
<i>integral</i> of the input <b>u</b> multiplied with
the gain <i>k</i>:
</p>
<pre>
         k
     y = - u
         s
</pre>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

</html>"),     Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100.0,-100.0},{100.0,100.0}},
              initialScale=0.1),
            graphics={
              Line(
                visible=true,
                points={{-80.0,78.0},{-80.0,-90.0}},
                color={192,192,192}),
              Polygon(
                visible=true,
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
              Line(
                visible=true,
                points={{-90.0,-80.0},{82.0,-80.0}},
                color={192,192,192}),
              Polygon(
                visible=true,
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
              Text(
                visible=true,
                lineColor={192,192,192},
                extent={{0.0,-70.0},{60.0,-10.0}},
                textString="I"),
              Text(
                visible=true,
                extent={{-150.0,-150.0},{150.0,-110.0}},
                textString="k=%k"),
              Line(
                visible=true,
                points={{-80.0,-80.0},{80.0,80.0}},
                color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-36,60},{32,2}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-32,0},{36,-58}},
              lineColor={0,0,0},
              textString="s"),
            Line(points={{-46,0},{46,0}}, color={0,0,0})}));
    end Integrator;

    block LimIntegrator "Integrator with limited value of the output"
      import Modelica_Blocks.Types.Init;
      parameter Real k(unit="1")=1 "Integrator gain";
      parameter Real outMax(start=1) "Upper limit of output";
      parameter Real outMin=-outMax "Lower limit of output";
      parameter Init initType=Init.InitialState
        "Type of initialization (1: no init, 2: steady state, 3/4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Boolean limitsAtInit = true
        "= false, if limits are ignored during initialization (i.e., der(y)=k*u)"
        annotation(Evaluate=true, Dialog(group="Initialization"));
      parameter Real y_start=0
        "Initial or guess value of output (must be in the limits outMin .. outMax)"
        annotation (Dialog(group="Initialization"));
      parameter Boolean strict=false
        "= true, if strict limits with noEvent(..)"
        annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
      extends Interfaces.SISO(y(start=y_start));

    initial equation
      if initType == Init.SteadyState then
         der(y) = 0;
      elseif initType == Init.InitialState or
             initType == Init.InitialOutput then
        y = y_start;
      end if;
    equation
      if initial() and not limitsAtInit then
         der(y) = k*u;
         assert(y >= outMin - 0.001*abs(outMax-outMin) and y <= outMax + 0.001*abs(outMax-outMin),
              "LimIntegrator: During initialization the limits have been ignored.\n"
            + "However, the result is that the output y is not within the required limits:\n"
            + "  y = " + String(y) + ", outMin = " + String(outMin) + ", outMax = " + String(outMax));
      elseif strict then
         der(y) = noEvent(if y < outMin and k*u < 0 or y > outMax and k*u > 0 then 0 else k*u);
      else
         der(y) = if y < outMin and k*u < 0 or y > outMax and k*u > 0 then 0 else k*u;
      end if;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes <b>y</b> (element-wise) as <i>integral</i>
of the input <b>u</b> multiplied with the gain <i>k</i>. If the
integral reaches a given upper or lower <i>limit</i> and the
input will drive the integral outside of this bound, the
integration is halted and only restarted if the input drives
the integral away from the bounds.
</p>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

<p>
If parameter <b>limitAtInit</b> = <b>false</b>, the limits of the
integrator are removed from the initialization problem which
leads to a much simpler equation system. After initialization has been
performed, it is checked via an assert whether the output is in the
defined limits. For backward compatibility reasons
<b>limitAtInit</b> = <b>true</b>. In most cases it is best
to use <b>limitAtInit</b> = <b>false</b>.
</p>
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
            Polygon(
              points={{90,-80},{68,-72},{68,-88},{90,-80}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{20,20},{80,20}}, color={0,0,127}),
            Text(
              extent={{0,-10},{60,-70}},
              lineColor={192,192,192},
              textString="I"),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="k=%k"),
            Line(
              visible=strict,
              points={{20,20},{80,20}},
              color={255,0,0},
              smooth=Smooth.None)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Text(
              extent={{-54,46},{-4,-48}},
              lineColor={0,0,0},
              textString="lim"),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-8,60},{60,2}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-8,-2},{60,-60}},
              lineColor={0,0,0},
              textString="s"),
            Line(points={{4,0},{46,0}}, color={0,0,0})}));
    end LimIntegrator;

    block Derivative "Approximated derivative block"
      import Modelica_Blocks.Types.Init;
      parameter Real k(unit="1")=1 "Gains";
      parameter SIunits.Time T(min=Modelica_Constants.small)=0.01
        "Time constants (T>0 required; T=0 is ideal derivative block)";
      parameter Init initType=Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real x_start=0 "Initial or guess value of state"
        annotation (Dialog(group="Initialization"));
      parameter Real y_start=0 "Initial value of output (= state)"
        annotation(Dialog(enable=initType == Init.InitialOutput, group=
              "Initialization"));
      extends Interfaces.SISO;

      output Real x(start=x_start) "State of block";

    protected
      parameter Boolean zeroGain = abs(k) <Modelica_Constants.eps;
    initial equation
      if initType == Init.SteadyState then
        der(x) = 0;
      elseif initType == Init.InitialState then
        x = x_start;
      elseif initType == Init.InitialOutput then
        if zeroGain then
           x = u;
        else
           y = y_start;
        end if;
      end if;
    equation
      der(x) = if zeroGain then 0 else (u - x)/T;
      y = if zeroGain then 0 else (k/T)*(u - x);
      annotation (
        Documentation(info="<html>
<p>
This blocks defines the transfer function between the
input u and the output y
(element-wise) as <i>approximated derivative</i>:
</p>
<pre>
             k * s
     y = ------------ * u
            T * s + 1
</pre>
<p>
If you would like to be able to change easily between different
transfer functions (FirstOrder, SecondOrder, ... ) by changing
parameters, use the general block <b>TransferFunction</b> instead
and model a derivative block with parameters<br>
b = {k,0}, a = {T, 1}.
</p>

<p>
If k=0, the block reduces to y=0.
</p>
</html>"),     Icon(
        coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Line(visible=true,
            points={{-80.0,78.0},{-80.0,-90.0}},
          color={192,192,192}),
      Polygon(visible=true,
          lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
      Line(visible=true,
          points={{-90.0,-80.0},{82.0,-80.0}},
        color={192,192,192}),
      Polygon(visible=true,
          lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
      Line(visible=  true,
        origin=  {-24.667,-27.333},
        points=  {{-55.333,87.333},{-19.333,-40.667},{86.667,-52.667}},
        color=  {0,0,127},
        smooth=  Smooth.Bezier),
      Text(visible=true,
          lineColor={192,192,192},
        extent={{-30.0,14.0},{86.0,60.0}},
        textString="DT1"),
      Text(visible=true,
          extent={{-150.0,-150.0},{150.0,-110.0}},
        textString="k=%k")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-54,52},{50,10}},
              lineColor={0,0,0},
              textString="k s"),
            Text(
              extent={{-54,-6},{52,-52}},
              lineColor={0,0,0},
              textString="T s + 1"),
            Line(points={{-50,0},{50,0}}, color={0,0,0}),
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}));
    end Derivative;

    block FirstOrder "First order transfer function block (= 1 pole)"
      import Modelica_Blocks.Types.Init;
      parameter Real k(unit="1")=1 "Gain";
      parameter SIunits.Time T(start=1) "Time Constant";
      parameter Init initType=Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3/4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real y_start=0 "Initial or guess value of output (= state)"
        annotation (Dialog(group="Initialization"));

      extends Interfaces.SISO(y(start=y_start));

    initial equation
      if initType == Init.SteadyState then
        der(y) = 0;
      elseif initType == Init.InitialState or initType == Init.InitialOutput then
        y = y_start;
      end if;
    equation
      der(y) = (k*u - y)/T;
      annotation (
        Documentation(info="<HTML>
<p>
This blocks defines the transfer function between the input u
and the output y (element-wise) as <i>first order</i> system:
</p>
<pre>
               k
     y = ------------ * u
            T * s + 1
</pre>
<p>
If you would like to be able to change easily between different
transfer functions (FirstOrder, SecondOrder, ... ) by changing
parameters, use the general block <b>TransferFunction</b> instead
and model a first order SISO system with parameters<br>
b = {k}, a = {T, 1}.
</p>
<pre>
Example:
   parameter: k = 0.3, T = 0.4
   results in:
             0.3
      y = ----------- * u
          0.4 s + 1.0
</pre>

</html>"),     Icon(
      coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
        initialScale=0.1),
        graphics={
      Line(visible=true,
          points={{-80.0,78.0},{-80.0,-90.0}},
        color={192,192,192}),
      Polygon(visible=true,
        lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
      Line(visible=true,
        points={{-90.0,-80.0},{82.0,-80.0}},
        color={192,192,192}),
      Polygon(visible=true,
        lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
      Line(visible=  true,
          origin=  {-26.667,6.667},
          points=  {{106.667,43.333},{-13.333,29.333},{-53.333,-86.667}},
          color=  {0,0,127},
          smooth=  Smooth.Bezier),
      Text(visible=true,
        lineColor={192,192,192},
        extent={{0.0,-60.0},{60.0,0.0}},
        textString="PT1"),
      Text(visible=true,
        extent={{-150.0,-150.0},{150.0,-110.0}},
        textString="T=%T")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-48,52},{50,8}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-54,-6},{56,-56}},
              lineColor={0,0,0},
              textString="T s + 1"),
            Line(points={{-50,0},{50,0}}, color={0,0,0}),
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}));
    end FirstOrder;

    block SecondOrder "Second order transfer function block (= 2 poles)"
      import Modelica_Blocks.Types.Init;
      parameter Real k(unit="1")=1 "Gain";
      parameter Real w(start=1) "Angular frequency";
      parameter Real D(start=1) "Damping";
      parameter Init initType=Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3/4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real y_start=0 "Initial or guess value of output (= state)"
        annotation (Dialog(group="Initialization"));
      parameter Real yd_start=0
        "Initial or guess value of derivative of output (= state)"
        annotation (Dialog(group="Initialization"));

      extends Interfaces.SISO(y(start=y_start));
      output Real yd(start=yd_start) "Derivative of y";

    initial equation
      if initType == Init.SteadyState then
        der(y) = 0;
        der(yd) = 0;
      elseif initType == Init.InitialState or initType == Init.InitialOutput then
        y = y_start;
        yd = yd_start;
      end if;
    equation
      der(y) = yd;
      der(yd) = w*(w*(k*u - y) - 2*D*yd);
      annotation (
        Documentation(info="<HTML>
<p>
This blocks defines the transfer function between the input u and
the output y (element-wise) as <i>second order</i> system:
</p>
<pre>
                             k
     y = ---------------------------------------- * u
            ( s / w )^2 + 2*D*( s / w ) + 1
</pre>
<p>
If you would like to be able to change easily between different
transfer functions (FirstOrder, SecondOrder, ... ) by changing
parameters, use the general model class <b>TransferFunction</b>
instead and model a second order SISO system with parameters<br>
b = {k}, a = {1/w^2, 2*D/w, 1}.
</p>
<pre>
Example:

   parameter: k =  0.3,  w = 0.5,  D = 0.4
   results in:
                  0.3
      y = ------------------- * u
          4.0 s^2 + 1.6 s + 1
</pre>

</html>"),     Icon(
          coordinateSystem(preserveAspectRatio=true,
                extent={{-100.0,-100.0},{100.0,100.0}},
              initialScale=0.1),
              graphics={
          Line(visible=true,
                points={{-80.0,78.0},{-80.0,-90.0}},
              color={192,192,192}),
        Polygon(visible=true,
              lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
        Line(visible=true,
              points={{-90.0,-80.0},{82.0,-80.0}},
            color={192,192,192}),
        Polygon(visible=true,
              lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
        Line(visible=  true,
            origin=  {-1.939,-1.816},
            points=  {{81.939,36.056},{65.362,36.056},{14.39,-26.199},{-29.966,113.485},{-65.374,-61.217},{-78.061,-78.184}},
            color=  {0,0,127},
            smooth=  Smooth.Bezier),
        Text(visible=true,
              lineColor={192,192,192},
            extent={{0.0,-70.0},{60.0,-10.0}},
            textString="PT2"),
        Text(visible=true,
              extent={{-150.0,-150.0},{150.0,-110.0}},
            textString="w=%w")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Text(
              extent={{-60,60},{60,14}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-60,8},{-32,-20}},
              lineColor={0,0,0},
              textString="s"),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Line(points={{-50,14},{50,14}}, color={0,0,0}),
            Line(points={{-54,-20},{-38,-20}}, color={0,0,0}),
            Text(
              extent={{-52,-26},{-36,-48}},
              lineColor={0,0,0},
              textString="w"),
            Line(points={{-50,2},{-56,-8},{-56,-28},{-52,-46}}, color={0,0,0}),
            Line(points={{-40,2},{-34,-10},{-34,-30},{-38,-46}}, color={0,0,0}),
            Text(
              extent={{-34,8},{-22,-10}},
              lineColor={0,0,0},
              textString="2"),
            Text(
              extent={{-34,-6},{6,-36}},
              lineColor={0,0,0},
              textString="+2D"),
            Text(
              extent={{2,8},{30,-20}},
              lineColor={0,0,0},
              textString="s"),
            Line(points={{8,-20},{24,-20}}, color={0,0,0}),
            Text(
              extent={{10,-26},{26,-48}},
              lineColor={0,0,0},
              textString="w"),
            Line(points={{12,2},{6,-8},{6,-28},{10,-46}}, color={0,0,0}),
            Line(points={{22,2},{28,-10},{28,-30},{24,-46}}, color={0,0,0}),
            Text(
              extent={{30,2},{58,-42}},
              lineColor={0,0,0},
              textString="+1")}));
    end SecondOrder;

    block PI "Proportional-Integral controller"
      import Modelica_Blocks.Types.Init;
      parameter Real k(unit="1")=1 "Gain";
      parameter SIunits.Time T(start=1, min=Modelica_Constants.small)
        "Time Constant (T>0 required)";
      parameter Init initType=Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real x_start=0 "Initial or guess value of state"
        annotation (Dialog(group="Initialization"));
      parameter Real y_start=0 "Initial value of output"
        annotation(Dialog(enable=initType == Init.SteadyState or initType == Init.InitialOutput, group=
              "Initialization"));

      extends Interfaces.SISO;
      output Real x(start=x_start) "State of block";

    initial equation
      if initType == Init.SteadyState then
        der(x) = 0;
      elseif initType == Init.InitialState then
        x = x_start;
      elseif initType == Init.InitialOutput then
        y = y_start;
      end if;
    equation
      der(x) = u/T;
      y = k*(x + u);
      annotation (defaultComponentName="PI",
        Documentation(info="<html>
<p>
This blocks defines the transfer function between the input u and
the output y (element-wise) as <i>PI</i> system:
</p>
<pre>
                 1
   y = k * (1 + ---) * u
                T*s
           T*s + 1
     = k * ------- * u
             T*s
</pre>
<p>
If you would like to be able to change easily between different
transfer functions (FirstOrder, SecondOrder, ... ) by changing
parameters, use the general model class <b>TransferFunction</b>
instead and model a PI SISO system with parameters<br>
b = {k*T, k}, a = {T, 0}.
</p>
<pre>
Example:

   parameter: k = 0.3,  T = 0.4

   results in:
               0.4 s + 1
      y = 0.3 ----------- * u
                 0.4 s
</pre>

<p>
It might be difficult to initialize the PI component in steady state
due to the integrator part.
This is discussed in the description of package
<a href=\"modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
            Polygon(
              points={{90,-80},{68,-72},{68,-88},{90,-80}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points=  {{-80.0,-80.0},{-80.0,-20.0},{60.0,80.0}}, color=  {0,0,127}),
            Text(
              extent={{0,6},{60,-56}},
              lineColor={192,192,192},
              textString="PI"),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="T=%T")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Text(
              extent={{-68,24},{-24,-18}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-32,48},{60,0}},
              lineColor={0,0,0},
              textString="T s + 1"),
            Text(
              extent={{-30,-8},{52,-40}},
              lineColor={0,0,0},
              textString="T s"),
            Line(points={{-24,0},{54,0}}, color={0,0,0}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{62,0},{100,0}}, color={0,0,255})}));
    end PI;

    block PID "PID-controller in additive description form"
      import Modelica_Blocks.Types.InitPID;
      import Modelica_Blocks.Types.Init;
      extends Interfaces.SISO;

      parameter Real k(unit="1")=1 "Gain";
      parameter SIunits.Time Ti(min=Modelica_Constants.small, start=0.5)
        "Time Constant of Integrator";
      parameter SIunits.Time Td(min=0, start=0.1)
        "Time Constant of Derivative block";
      parameter Real Nd(min=Modelica_Constants.small) = 10
        "The higher Nd, the more ideal the derivative block";
      parameter InitPID initType=InitPID.DoNotUse_InitialIntegratorState
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real xi_start=0
        "Initial or guess value value for integrator output (= integrator state)"
        annotation (Dialog(group="Initialization"));
      parameter Real xd_start=0
        "Initial or guess value for state of derivative block"
        annotation (Dialog(group="Initialization"));
      parameter Real y_start=0 "Initial value of output"
        annotation(Dialog(enable=initType == InitPID.InitialOutput, group=
              "Initialization"));
      constant SIunits.Time unitTime=1 annotation (HideResult=true);

      Math.Gain P(k=1) "Proportional part of PID controller" annotation (
          Placement(transformation(extent={{-60,60},{-20,100}}, rotation=0)));
      Integrator I(
        k=unitTime/Ti,
        y_start=xi_start,
        initType=if initType == InitPID.SteadyState then Init.SteadyState else
            if initType == InitPID.InitialState or initType == InitPID.DoNotUse_InitialIntegratorState
             then Init.InitialState else Init.NoInit)
        "Integral part of PID controller" annotation (Placement(transformation(
              extent={{-60,-20},{-20,20}}, rotation=0)));
      Derivative D(
        k=Td/unitTime,
        T=max([Td/Nd,100*Modelica_Constants.eps]),
        x_start=xd_start,
        initType=if initType == InitPID.SteadyState or initType == InitPID.InitialOutput
             then Init.SteadyState else if initType == InitPID.InitialState
             then Init.InitialState else Init.NoInit)
        "Derivative part of PID controller" annotation (Placement(
            transformation(extent={{-60,-100},{-20,-60}}, rotation=0)));
      Math.Gain Gain(k=k) "Gain of PID controller" annotation (Placement(
            transformation(extent={{60,-10},{80,10}}, rotation=0)));
      Math.Add3 Add annotation (Placement(transformation(extent={{20,-10},{40,
                10}}, rotation=0)));
    initial equation
      if initType==InitPID.InitialOutput then
         y = y_start;
      end if;

    equation
      connect(u, P.u) annotation (Line(points={{-120,0},{-80,0},{-80,80},{-64,80}},
            color={0,0,127}));
      connect(u, I.u)
        annotation (Line(points={{-120,0},{-64,0}}, color={0,0,127}));
      connect(u, D.u) annotation (Line(points={{-120,0},{-80,0},{-80,-80},{-64,
              -80}}, color={0,0,127}));
      connect(P.y, Add.u1) annotation (Line(points={{-18,80},{0,80},{0,8},{18,8}},
            color={0,0,127}));
      connect(I.y, Add.u2)
        annotation (Line(points={{-18,0},{18,0}}, color={0,0,127}));
      connect(D.y, Add.u3) annotation (Line(points={{-18,-80},{0,-80},{0,-8},{18,
              -8}}, color={0,0,127}));
      connect(Add.y, Gain.u)
        annotation (Line(points={{41,0},{58,0}}, color={0,0,127}));
      connect(Gain.y, y)
        annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
      annotation (defaultComponentName="PID",
        Icon(
            coordinateSystem(preserveAspectRatio=true,
                extent={{-100.0,-100.0},{100.0,100.0}},
                initialScale=0.1),
                graphics={
            Line(visible=true,
                points={{-80.0,78.0},{-80.0,-90.0}},
                color={192,192,192}),
          Polygon(visible=true,
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid,
              points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
          Line(visible=true,
              points={{-90.0,-80.0},{82.0,-80.0}},
              color={192,192,192}),
          Polygon(visible=true,
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid,
              points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
          Line(visible=  true, points=  {{-80,-80},{-80,-20},{60,80}}, color=  {0,0,127}),
          Text(visible=true,
              lineColor={192,192,192},
              extent={{-20.0,-60.0},{80.0,-20.0}},
              textString="PID"),
          Text(visible=true,
              extent={{-150.0,-150.0},{150.0,-110.0}},
              textString="Ti=%Ti")}),
        Documentation(info="<HTML>
<p>
This is the text-book version of a PID-controller.
For a more practically useful PID-controller, use
block LimPID.
</p>

<p>
The PID block can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in
<a href=\"modelica://Modelica.Blocks.Types.InitPID\">Modelica.Blocks.Types.InitPID</a>.
This type is identical to
<a href=\"modelica://Modelica.Blocks.Types.Init\">Types.Init</a>,
with the only exception that the additional option
<b>DoNotUse_InitialIntegratorState</b> is added for
backward compatibility reasons (= integrator is initialized with
InitialState whereas differential part is initialized with
NoInit which was the initialization in version 2.2 of the Modelica
standard library).
</p>

<p>
Based on the setting of initType, the integrator (I) and derivative (D)
blocks inside the PID controller are initialized according to the following table:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>initType</b></td>
      <td valign=\"top\"><b>I.initType</b></td>
      <td valign=\"top\"><b>D.initType</b></td></tr>

  <tr><td valign=\"top\"><b>NoInit</b></td>
      <td valign=\"top\">NoInit</td>
      <td valign=\"top\">NoInit</td></tr>

  <tr><td valign=\"top\"><b>SteadyState</b></td>
      <td valign=\"top\">SteadyState</td>
      <td valign=\"top\">SteadyState</td></tr>

  <tr><td valign=\"top\"><b>InitialState</b></td>
      <td valign=\"top\">InitialState</td>
      <td valign=\"top\">InitialState</td></tr>

  <tr><td valign=\"top\"><b>InitialOutput</b><br>
          and initial equation: y = y_start</td>
      <td valign=\"top\">NoInit</td>
      <td valign=\"top\">SteadyState</td></tr>

  <tr><td valign=\"top\"><b>DoNotUse_InitialIntegratorState</b></td>
      <td valign=\"top\">InitialState</td>
      <td valign=\"top\">NoInit</td></tr>
</table>

<p>
In many cases, the most useful initial condition is
<b>SteadyState</b> because initial transients are then no longer
present. If initType = InitPID.SteadyState, then in some
cases difficulties might occur. The reason is the
equation of the integrator:
</p>

<pre>
   <b>der</b>(y) = k*u;
</pre>

<p>
The steady state equation \"der(x)=0\" leads to the condition that the input u to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is natural to
initialize it with zero. As sketched this is, however, not possible.
The solution is to not initialize u or the variable that is used
to compute u by an algebraic equation.
</p>

</html>"));
    end PID;

    block LimPID
      "P, PI, PD, and PID controller with limited output, anti-windup compensation and setpoint weighting"
      import Modelica_Blocks.Types.InitPID;
      import Modelica_Blocks.Types.Init;
      import Modelica_Blocks.Types.SimpleController;
      extends Interfaces.SVcontrol;
      output Real controlError = u_s - u_m
        "Control error (set point - measurement)";

      parameter .Modelica_Blocks.Types.SimpleController controllerType=.Modelica_Blocks.Types.SimpleController.PID
        "Type of controller";
      parameter Real k(min=0, unit="1") = 1 "Gain of controller";
      parameter SIunits.Time Ti(min=Modelica_Constants.small)=0.5
        "Time constant of Integrator block" annotation (Dialog(enable=
              controllerType == .Modelica.Blocks.Types.SimpleController.PI or
              controllerType == .Modelica.Blocks.Types.SimpleController.PID));
      parameter SIunits.Time Td(min=0)=0.1 "Time constant of Derivative block"
        annotation (Dialog(enable=controllerType == .Modelica.Blocks.Types.SimpleController.PD
               or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
      parameter Real yMax(start=1) "Upper limit of output";
      parameter Real yMin=-yMax "Lower limit of output";
      parameter Real wp(min=0) = 1
        "Set-point weight for Proportional block (0..1)";
      parameter Real wd(min=0) = 0
        "Set-point weight for Derivative block (0..1)"
           annotation(Dialog(enable=controllerType==.Modelica.Blocks.Types.SimpleController.PD or
                                    controllerType==.Modelica.Blocks.Types.SimpleController.PID));
      parameter Real Ni(min=100*Modelica_Constants.eps) = 0.9
        "Ni*Ti is time constant of anti-windup compensation"
         annotation(Dialog(enable=controllerType==.Modelica.Blocks.Types.SimpleController.PI or
                                  controllerType==.Modelica.Blocks.Types.SimpleController.PID));
      parameter Real Nd(min=100*Modelica_Constants.eps) = 10
        "The higher Nd, the more ideal the derivative block"
           annotation(Dialog(enable=controllerType==.Modelica.Blocks.Types.SimpleController.PD or
                                    controllerType==.Modelica.Blocks.Types.SimpleController.PID));
      parameter .Modelica_Blocks.Types.InitPID initType=.Modelica_Blocks.Types.InitPID.DoNotUse_InitialIntegratorState
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Boolean limitsAtInit = true
        "= false, if limits are ignored during initialization"
        annotation(Evaluate=true, Dialog(group="Initialization"));
      parameter Real xi_start=0
        "Initial or guess value value for integrator output (= integrator state)"
        annotation (Dialog(group="Initialization",
                    enable=controllerType==.Modelica.Blocks.Types.SimpleController.PI or
                           controllerType==.Modelica.Blocks.Types.SimpleController.PID));
      parameter Real xd_start=0
        "Initial or guess value for state of derivative block"
        annotation (Dialog(group="Initialization",
                             enable=controllerType==.Modelica.Blocks.Types.SimpleController.PD or
                                    controllerType==.Modelica.Blocks.Types.SimpleController.PID));
      parameter Real y_start=0 "Initial value of output"
        annotation(Dialog(enable=initType == .Modelica.Blocks.Types.InitPID.InitialOutput, group=
              "Initialization"));
      parameter Boolean strict=false
        "= true, if strict limits with noEvent(..)"
        annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
      constant SIunits.Time unitTime=1 annotation (HideResult=true);
      Math.Add addP(k1=wp, k2=-1) annotation (Placement(transformation(extent={
                {-80,40},{-60,60}}, rotation=0)));
      Math.Add addD(k1=wd, k2=-1) if with_D annotation (Placement(
            transformation(extent={{-80,-10},{-60,10}}, rotation=0)));
      Math.Gain P(k=1) annotation (Placement(transformation(extent={{-40,40},{-20,
                60}}, rotation=0)));
      Integrator I(
        k=unitTime/Ti,
        y_start=xi_start,
        initType=if initType == InitPID.SteadyState then Init.SteadyState else
            if initType == InitPID.InitialState or initType == InitPID.DoNotUse_InitialIntegratorState
             then Init.InitialState else Init.NoInit) if with_I annotation (
          Placement(transformation(extent={{-40,-60},{-20,-40}}, rotation=0)));
      Derivative D(
        k=Td/unitTime,
        T=max([Td/Nd,1.e-14]),
        x_start=xd_start,
        initType=if initType == InitPID.SteadyState or initType == InitPID.InitialOutput
             then Init.SteadyState else if initType == InitPID.InitialState
             then Init.InitialState else Init.NoInit) if with_D annotation (
          Placement(transformation(extent={{-40,-10},{-20,10}}, rotation=0)));
      Math.Gain gainPID(k=k) annotation (Placement(transformation(extent={{30,-10},
                {50,10}}, rotation=0)));
      Math.Add3 addPID annotation (Placement(transformation(extent={{0,-10},{20,
                10}}, rotation=0)));
      Math.Add3 addI(k2=-1) if with_I annotation (Placement(transformation(
              extent={{-80,-60},{-60,-40}}, rotation=0)));
      Math.Add addSat(k1=+1, k2=-1) if with_I annotation (Placement(
            transformation(
            origin={80,-50},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Math.Gain gainTrack(k=1/(k*Ni)) if with_I annotation (Placement(
            transformation(extent={{40,-80},{20,-60}}, rotation=0)));
      Nonlinear.Limiter limiter(
        uMax=yMax,
        uMin=yMin,
        strict=strict,
        limitsAtInit=limitsAtInit) annotation (Placement(transformation(extent=
                {{70,-10},{90,10}}, rotation=0)));
    protected
      parameter Boolean with_I = controllerType==SimpleController.PI or
                                 controllerType==SimpleController.PID annotation(Evaluate=true, HideResult=true);
      parameter Boolean with_D = controllerType==SimpleController.PD or
                                 controllerType==SimpleController.PID annotation(Evaluate=true, HideResult=true);
    public
      Sources.Constant Dzero(k=0) if not with_D
        annotation (Placement(transformation(extent={{-30,20},{-20,30}}, rotation=
               0)));
      Sources.Constant Izero(k=0) if not with_I
        annotation (Placement(transformation(extent={{10,-55},{0,-45}}, rotation=
                0)));
    initial equation
      if initType==InitPID.InitialOutput then
         gainPID.y = y_start;
      end if;
    equation
      assert(yMax >= yMin, "LimPID: Limits must be consistent. However, yMax (=" + String(yMax) +
                           ") < yMin (=" + String(yMin) + ")");
      if initType == InitPID.InitialOutput and (y_start < yMin or y_start > yMax) then
        Modelica_Utilities.Streams.error("LimPID: Start value y_start (=" +
          String(y_start) + ") is outside of the limits of yMin (=" + String(
          yMin) + ") and yMax (=" + String(yMax) + ")");
      end if;
      assert(limitsAtInit or not limitsAtInit and y >= yMin and y <= yMax,
             "LimPID: During initialization the limits have been switched off.\n" +
             "After initialization, the output y (=" + String(y) +
             ") is outside of the limits of yMin (=" + String(yMin) +") and yMax (=" + String(yMax) + ")");

      connect(u_s, addP.u1) annotation (Line(points={{-120,0},{-96,0},{-96,56},{
              -82,56}}, color={0,0,127}));
      connect(u_s, addD.u1) annotation (Line(points={{-120,0},{-96,0},{-96,6},{
              -82,6}}, color={0,0,127}));
      connect(u_s, addI.u1) annotation (Line(points={{-120,0},{-96,0},{-96,-42},{
              -82,-42}}, color={0,0,127}));
      connect(addP.y, P.u) annotation (Line(points={{-59,50},{-42,50}}, color={0,
              0,127}));
      connect(addD.y, D.u)
        annotation (Line(points={{-59,0},{-42,0}}, color={0,0,127}));
      connect(addI.y, I.u) annotation (Line(points={{-59,-50},{-42,-50}}, color={
              0,0,127}));
      connect(P.y, addPID.u1) annotation (Line(points={{-19,50},{-10,50},{-10,8},
              {-2,8}}, color={0,0,127}));
      connect(D.y, addPID.u2)
        annotation (Line(points={{-19,0},{-2,0}}, color={0,0,127}));
      connect(I.y, addPID.u3) annotation (Line(points={{-19,-50},{-10,-50},{-10,
              -8},{-2,-8}}, color={0,0,127}));
      connect(addPID.y, gainPID.u)
        annotation (Line(points={{21,0},{28,0}}, color={0,0,127}));
      connect(gainPID.y, addSat.u2) annotation (Line(points={{51,0},{60,0},{60,
              -20},{74,-20},{74,-38}}, color={0,0,127}));
      connect(gainPID.y, limiter.u)
        annotation (Line(points={{51,0},{68,0}}, color={0,0,127}));
      connect(limiter.y, addSat.u1) annotation (Line(points={{91,0},{94,0},{94,
              -20},{86,-20},{86,-38}}, color={0,0,127}));
      connect(limiter.y, y)
        annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
      connect(addSat.y, gainTrack.u) annotation (Line(points={{80,-61},{80,-70},{
              42,-70}}, color={0,0,127}));
      connect(gainTrack.y, addI.u3) annotation (Line(points={{19,-70},{-88,-70},{
              -88,-58},{-82,-58}}, color={0,0,127}));
      connect(u_m, addP.u2) annotation (Line(
          points={{0,-120},{0,-92},{-92,-92},{-92,44},{-82,44}},
          color={0,0,127},
          thickness=0.5));
      connect(u_m, addD.u2) annotation (Line(
          points={{0,-120},{0,-92},{-92,-92},{-92,-6},{-82,-6}},
          color={0,0,127},
          thickness=0.5));
      connect(u_m, addI.u2) annotation (Line(
          points={{0,-120},{0,-92},{-92,-92},{-92,-50},{-82,-50}},
          color={0,0,127},
          thickness=0.5));
      connect(Dzero.y, addPID.u2) annotation (Line(points={{-19.5,25},{-14,25},{
              -14,0},{-2,0}}, color={0,0,127}));
      connect(Izero.y, addPID.u3) annotation (Line(points={{-0.5,-50},{-10,-50},{
              -10,-8},{-2,-8}}, color={0,0,127}));
      annotation (defaultComponentName="PID",
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
            Polygon(
              points={{90,-80},{68,-72},{68,-88},{90,-80}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{-80,-20},{30,60},{80,60}}, color={0,0,127}),
            Text(
              extent={{-20,-20},{80,-60}},
              lineColor={192,192,192},
              textString="%controllerType"),
            Line(
              visible=strict,
              points={{30,60},{81,60}},
              color={255,0,0},
              smooth=Smooth.None)}),
        Documentation(info="<HTML>
<p>
Via parameter <b>controllerType</b> either <b>P</b>, <b>PI</b>, <b>PD</b>,
or <b>PID</b> can be selected. If, e.g., PI is selected, all components belonging to the
D-part are removed from the block (via conditional declarations).
The example model
<a href=\"modelica://Modelica.Blocks.Examples.PID_Controller\">Modelica.Blocks.Examples.PID_Controller</a>
demonstrates the usage of this controller.
Several practical aspects of PID controller design are incorporated
according to chapter 3 of the book:
</p>

<dl>
<dt>&Aring;str&ouml;m K.J., and H&auml;gglund T.:</dt>
<dd> <b>PID Controllers: Theory, Design, and Tuning</b>.
     Instrument Society of America, 2nd edition, 1995.
</dd>
</dl>

<p>
Besides the additive <b>proportional, integral</b> and <b>derivative</b>
part of this controller, the following features are present:
</p>
<ul>
<li> The output of this controller is limited. If the controller is
     in its limits, anti-windup compensation is activated to drive
     the integrator state to zero. </li>
<li> The high-frequency gain of the derivative part is limited
     to avoid excessive amplification of measurement noise.</li>
<li> Setpoint weighting is present, which allows to weight
     the setpoint in the proportional and the derivative part
     independently from the measurement. The controller will respond
     to load disturbances and measurement noise independently of this setting
     (parameters wp, wd). However, setpoint changes will depend on this
     setting. For example, it is useful to set the setpoint weight wd
     for the derivative part to zero, if steps may occur in the
     setpoint signal.</li>
</ul>

<p>
The parameters of the controller can be manually adjusted by performing
simulations of the closed loop system (= controller + plant connected
together) and using the following strategy:
</p>

<ol>
<li> Set very large limits, e.g., yMax = Modelica.Constants.inf</li>
<li> Select a <b>P</b>-controller and manually enlarge parameter <b>k</b>
     (the total gain of the controller) until the closed-loop response
     cannot be improved any more.</li>
<li> Select a <b>PI</b>-controller and manually adjust parameters
     <b>k</b> and <b>Ti</b> (the time constant of the integrator).
     The first value of Ti can be selected, such that it is in the
     order of the time constant of the oscillations occurring with
     the P-controller. If, e.g., vibrations in the order of T=10 ms
     occur in the previous step, start with Ti=0.01 s.</li>
<li> If you want to make the reaction of the control loop faster
     (but probably less robust against disturbances and measurement noise)
     select a <b>PID</b>-Controller and manually adjust parameters
     <b>k</b>, <b>Ti</b>, <b>Td</b> (time constant of derivative block).</li>
<li> Set the limits yMax and yMin according to your specification.</li>
<li> Perform simulations such that the output of the PID controller
     goes in its limits. Tune <b>Ni</b> (Ni*Ti is the time constant of
     the anti-windup compensation) such that the input to the limiter
     block (= limiter.u) goes quickly enough back to its limits.
     If Ni is decreased, this happens faster. If Ni=infinity, the
     anti-windup compensation is switched off and the controller works bad.</li>
</ol>

<p>
<b>Initialization</b>
</p>

<p>
This block can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in
<a href=\"modelica://Modelica.Blocks.Types.InitPID\">Modelica.Blocks.Types.InitPID</a>.
This type is identical to
<a href=\"modelica://Modelica.Blocks.Types.Init\">Types.Init</a>,
with the only exception that the additional option
<b>DoNotUse_InitialIntegratorState</b> is added for
backward compatibility reasons (= integrator is initialized with
InitialState whereas differential part is initialized with
NoInit which was the initialization in version 2.2 of the Modelica
standard library).
</p>

<p>
Based on the setting of initType, the integrator (I) and derivative (D)
blocks inside the PID controller are initialized according to the following table:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>initType</b></td>
      <td valign=\"top\"><b>I.initType</b></td>
      <td valign=\"top\"><b>D.initType</b></td></tr>

  <tr><td valign=\"top\"><b>NoInit</b></td>
      <td valign=\"top\">NoInit</td>
      <td valign=\"top\">NoInit</td></tr>

  <tr><td valign=\"top\"><b>SteadyState</b></td>
      <td valign=\"top\">SteadyState</td>
      <td valign=\"top\">SteadyState</td></tr>

  <tr><td valign=\"top\"><b>InitialState</b></td>
      <td valign=\"top\">InitialState</td>
      <td valign=\"top\">InitialState</td></tr>

  <tr><td valign=\"top\"><b>InitialOutput</b><br>
          and initial equation: y = y_start</td>
      <td valign=\"top\">NoInit</td>
      <td valign=\"top\">SteadyState</td></tr>

  <tr><td valign=\"top\"><b>DoNotUse_InitialIntegratorState</b></td>
      <td valign=\"top\">InitialState</td>
      <td valign=\"top\">NoInit</td></tr>
</table>

<p>
In many cases, the most useful initial condition is
<b>SteadyState</b> because initial transients are then no longer
present. If initType = InitPID.SteadyState, then in some
cases difficulties might occur. The reason is the
equation of the integrator:
</p>

<pre>
   <b>der</b>(y) = k*u;
</pre>

<p>
The steady state equation \"der(x)=0\" leads to the condition that the input u to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is natural to
initialize it with zero. As sketched this is, however, not possible.
The solution is to not initialize u_m or the variable that is used
to compute u_m by an algebraic equation.
</p>

<p>
If parameter <b>limitAtInit</b> = <b>false</b>, the limits at the
output of this controller block are removed from the initialization problem which
leads to a much simpler equation system. After initialization has been
performed, it is checked via an assert whether the output is in the
defined limits. For backward compatibility reasons
<b>limitAtInit</b> = <b>true</b>. In most cases it is best
to use <b>limitAtInit</b> = <b>false</b>.
</p>
</html>"));
    end LimPID;

    block TransferFunction "Linear transfer function"
      import Modelica_Blocks.Types.Init;
      extends Interfaces.SISO;

      parameter Real b[:]={1}
        "Numerator coefficients of transfer function (e.g., 2*s+3 is specified as {2,3})";
      parameter Real a[:]={1}
        "Denominator coefficients of transfer function (e.g., 5*s+6 is specified as {5,6})";
      parameter Init initType=Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real x_start[size(a, 1) - 1]=zeros(nx)
        "Initial or guess values of states"
        annotation (Dialog(group="Initialization"));
      parameter Real y_start=0
        "Initial value of output (derivatives of y are zero upto nx-1-th derivative)"
        annotation(Dialog(enable=initType == Init.InitialOutput, group=
              "Initialization"));
      output Real x[size(a, 1) - 1](start=x_start)
        "State of transfer function from controller canonical form";
    protected
      parameter Integer na=size(a, 1)
        "Size of Denominator of transfer function.";
      parameter Integer nb=size(b, 1) "Size of Numerator of transfer function.";
      parameter Integer nx=size(a, 1) - 1;
      parameter Real bb[:] = vector([zeros(max(0,na-nb),1);b]);
      parameter Real d = bb[1]/a[1];
      parameter Real a_end = if a[end] > 100*Modelica_Constants.eps*sqrt(a*a) then a[end] else 1.0;
      Real x_scaled[size(x,1)] "Scaled vector x";

    initial equation
      if initType == Init.SteadyState then
        der(x_scaled) = zeros(nx);
      elseif initType == Init.InitialState then
        x_scaled = x_start*a_end;
      elseif initType == Init.InitialOutput then
        y = y_start;
        der(x_scaled[2:nx]) = zeros(nx-1);
      end if;
    equation
      assert(size(b,1) <= size(a,1), "Transfer function is not proper");
      if nx == 0 then
         y = d*u;
      else
         der(x_scaled[1])    = (-a[2:na]*x_scaled + a_end*u)/a[1];
         der(x_scaled[2:nx]) = x_scaled[1:nx-1];
         y = ((bb[2:na] - d*a[2:na])*x_scaled)/a_end + d*u;
         x = x_scaled/a_end;
      end if;
      annotation (
        Documentation(info="<html>
<p>
This block defines the transfer function between the input
u and the output y
as (nb = dimension of b, na = dimension of a):
</p>
<pre>
           b[1]*s^[nb-1] + b[2]*s^[nb-2] + ... + b[nb]
   y(s) = --------------------------------------------- * u(s)
           a[1]*s^[na-1] + a[2]*s^[na-2] + ... + a[na]
</pre>
<p>
State variables <b>x</b> are defined according to <b>controller canonical</b>
form. Internally, vector <b>x</b> is scaled to improve the numerics (the states in versions before version 3.0 of the Modelica Standard Library have been not scaled). This scaling is
not visible from the outside of this block because the non-scaled vector <b>x</b>
is provided as output signal and the start value is with respect to the non-scaled
vector <b>x</b>.
Initial values of the states <b>x</b> can be set via parameter <b>x_start</b>.
</p>

<p>
Example:
</p>
<pre>
     TransferFunction g(b = {2,4}, a = {1,3});
</pre>
<p>
results in the following transfer function:
</p>
<pre>
        2*s + 4
   y = --------- * u
         s + 3
</pre>
</html>"),
        Icon(
            coordinateSystem(preserveAspectRatio=true,
              extent={{-100.0,-100.0},{100.0,100.0}},
              initialScale=0.1),
              graphics={
            Line(visible=true,
              points={{-80.0,0.0},{80.0,0.0}},
              color={0,0,127}),
          Text(visible=true,
            lineColor={0,0,127},
            extent={{-90.0,10.0},{90.0,90.0}},
            textString="b(s)"),
          Text(visible=true,
            lineColor={0,0,127},
            extent={{-90.0,-90.0},{90.0,-10.0}},
            textString="a(s)")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{40,0},{-40,0}}, color={0,0,0}),
            Text(
              extent={{-55,55},{55,5}},
              lineColor={0,0,0},
              textString="b(s)"),
            Text(
              extent={{-55,-5},{55,-55}},
              lineColor={0,0,0},
              textString="a(s)"),
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}));
    end TransferFunction;

    block StateSpace "Linear state space system"
      import Modelica_Blocks.Types.Init;
      parameter Real A[:, size(A, 1)]=[1, 0; 0, 1]
        "Matrix A of state space model (e.g., A=[1, 0; 0, 1])";
      parameter Real B[size(A, 1), :]=[1; 1]
        "Matrix B of state space model (e.g., B=[1; 1])";
      parameter Real C[:, size(A, 1)]=[1, 1]
        "Matrix C of state space model (e.g., C=[1, 1])";
      parameter Real D[size(C, 1), size(B, 2)]=zeros(size(C, 1), size(B, 2))
        "Matrix D of state space model";
      parameter Init initType=Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real x_start[nx]=zeros(nx) "Initial or guess values of states"
        annotation (Dialog(group="Initialization"));
      parameter Real y_start[ny]=zeros(ny)
        "Initial values of outputs (remaining states are in steady state if possible)"
        annotation(Dialog(enable=initType == Init.InitialOutput, group=
              "Initialization"));

      extends Interfaces.MIMO(final nin=size(B, 2), final nout=size(C, 1));
      output Real x[size(A, 1)](start=x_start) "State vector";

    protected
      parameter Integer nx = size(A, 1) "number of states";
      parameter Integer ny = size(C, 1) "number of outputs";
    initial equation
      if initType == Init.SteadyState then
        der(x) = zeros(nx);
      elseif initType == Init.InitialState then
        x = x_start;
      elseif initType == Init.InitialOutput then
        x = Modelica_Math.Matrices.equalityLeastSquares(
              A,
              -B*u,
              C,
              y_start - D*u);
      end if;
    equation
      der(x) = A*x + B*u;
      y = C*x + D*u;
      annotation (
        Documentation(info="<HTML>
<p>
The State Space block defines the relation
between the input u and the output
y in state space form:
</p>
<pre>

    der(x) = A * x + B * u
        y  = C * x + D * u
</pre>
<p>
The input is a vector of length nu, the output is a vector
of length ny and nx is the number of states. Accordingly
</p>
<pre>
        A has the dimension: A(nx,nx),
        B has the dimension: B(nx,nu),
        C has the dimension: C(ny,nx),
        D has the dimension: D(ny,nu)
</pre>
<p>
Example:
</p>
<pre>
     parameter: A = [0.12, 2;3, 1.5]
     parameter: B = [2, 7;3, 1]
     parameter: C = [0.1, 2]
     parameter: D = zeros(ny,nu)
results in the following equations:
  [der(x[1])]   [0.12  2.00] [x[1]]   [2.0  7.0] [u[1]]
  [         ] = [          ]*[    ] + [        ]*[    ]
  [der(x[2])]   [3.00  1.50] [x[2]]   [0.1  2.0] [u[2]]
                             [x[1]]            [u[1]]
       y[1]   = [0.1  2.0] * [    ] + [0  0] * [    ]
                             [x[2]]            [u[2]]
</pre>
</html>"),     Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}),
          graphics={
        Text(extent={{-90,10},{-10,90}},
          textString="A",
          lineColor={0,0,127}),
        Text(extent={{10,10},{90,90}},
          textString="B",
          lineColor={0,0,127}),
        Text(extent={{-90,-10},{-10,-90}},
          textString="C",
          lineColor={0,0,127}),
        Text(extent={{10,-10},{90,-90}},
          textString="D",
          lineColor={0,0,127}),
        Line(points={{0,-90},{0,90}},
          color={192,192,192}),
        Line(points={{-90,0},{90,0}},
          color={192,192,192})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Text(
              extent={{-60,40},{60,0}},
              lineColor={0,0,0},
              textString="sx=Ax+Bu"),
            Text(
              extent={{-60,0},{60,-40}},
              lineColor={0,0,0},
              textString=" y=Cx+Du"),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}));
    end StateSpace;

    block Der "Derivative of input (= analytic differentiations)"
        extends Interfaces.SISO;

    equation
      y = der(u);
        annotation (defaultComponentName="der1",
     Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-96,28},{94,-24}},
              textString="der()",
              lineColor={0,0,127})}),
            Documentation(info="<HTML>
<p>
Defines that the output y is the <i>derivative</i>
of the input u. Note, that Modelica.Blocks.Continuous.Derivative
computes the derivative in an approximate sense, where as this block computes
the derivative exactly. This requires that the input u is differentiated
by the Modelica translator, if this derivative is not yet present in
the model.
</p>
</HTML>"));
    end Der;

    block LowpassButterworth
      "Output the input signal filtered with a low pass Butterworth filter of any order"

      import Modelica_Blocks.Types.Init;

      extends Interfaces.SISO;

      parameter Integer n(min=1) = 2 "Order of filter";
      parameter SIunits.Frequency f(start=1) "Cut-off frequency";
      parameter Init initType=Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real x1_start[m]=zeros(m)
        "Initial or guess values of states 1 (der(x1)=x2)"
        annotation (Dialog(group="Initialization"));
      parameter Real x2_start[m]=zeros(m) "Initial or guess values of states 2"
        annotation (Dialog(group="Initialization"));
      parameter Real xr_start=0.0
        "Initial or guess value of real pole for uneven order otherwise dummy"
        annotation (Dialog(group="Initialization"));
      parameter Real y_start=0.0
        "Initial value of output (states are initialized in steady state if possible)"
         annotation(Dialog(enable=initType == Init.InitialOutput, group=
              "Initialization"));

      output Real x1[m](start=x1_start)
        "states 1 of second order filters (der(x1) = x2)";
      output Real x2[m](start=x2_start) "states 2 of second order filters";
      output Real xr(start=xr_start)
        "state of real pole for uneven order otherwise dummy";
    protected
      constant Real pi=Modelica_Constants.pi;
      parameter Integer m=integer(n/2);
      parameter Boolean evenOrder = 2*m == n;
      parameter Real w=2*pi*f;
      Real z[m + 1];
      Real polereal[m];
      Real poleimag[m];
      Real realpol;
      Real k2[m];
      Real D[m];
      Real w0[m];
      Real k1;
      Real T;
    initial equation
      if initType == Init.SteadyState then
        der(x1) = zeros(m);
        der(x2) = zeros(m);
        if not evenOrder then
          der(xr) = 0.0;
        end if;
      elseif initType == Init.InitialState then
        x1 = x1_start;
        x2 = x2_start;
        if not evenOrder then
          xr = xr_start;
        end if;
      elseif initType == Init.InitialOutput then
        y = y_start;
        der(x1) = zeros(m);
        if evenOrder then
          if m > 1 then
            der(x2[1:m-1]) = zeros(m-1);
          end if;
        else
          der(x1) = zeros(m);
        end if;
      end if;
    equation
      k2 = ones(m);
      k1 = 1;
      z[1] = u;

      // calculate filter parameters
      for i in 1:m loop
        // poles of prototype lowpass
        polereal[i] = cos(pi/2 + pi/n*(i - 0.5));
        poleimag[i] = sin(pi/2 + pi/n*(i - 0.5));
        // scaling and calculation of second order filter coefficients
        w0[i] = (polereal[i]^2 + poleimag[i]^2)*w;
        D[i] = -polereal[i]/w0[i]*w;
      end for;
      realpol = 1*w;
      T = 1/realpol;

      // calculate second order filters
      for i in 1:m loop
        der(x1[i]) = x2[i];
        der(x2[i]) = k2[i]*w0[i]^2*z[i] - 2*D[i]*w0[i]*x2[i] - w0[i]^2*x1[i];
        z[i + 1] = x1[i];
      end for;

      // calculate first order filter if necessary
      if evenOrder then
        // even order
        xr = 0;
        y = z[m + 1];
      else
        // uneven order
        der(xr) = (k1*z[m + 1] - xr)/T;
        y = xr;
      end if;
      annotation (
        Icon(
            coordinateSystem(preserveAspectRatio=true,
                extent={{-100.0,-100.0},{100.0,100.0}},
                initialScale=0.1),
                graphics={
            Line(visible=true,
                points={{-80.0,78.0},{-80.0,-90.0}},
                color={192,192,192}),
            Polygon(visible=true,
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                points={{-79.5584,91.817},{-87.5584,69.817},{-71.5584,69.817},{-79.5584,91.817}}),
            Line(visible=  true,
                origin=  {-1.939,-1.816},
                points=  {{81.939,36.056},{65.362,36.056},{14.39,-26.199},{-29.966,113.485},{-65.374,-61.217},{-78.061,-78.184}},
                color=  {0,0,127},
                smooth=  Smooth.Bezier),
            Line(visible=true,
                points={{-90.9779,-80.7697},{81.0221,-80.7697}},
                color={192,192,192}),
            Polygon(visible=true,
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                points={{91.3375,-79.8233},{69.3375,-71.8233},{69.3375,-87.8233},{91.3375,-79.8233}}),
            Text(visible=true,
                lineColor={192,192,192},
                extent={{-45.1735,-68.0},{92.0,-11.47}},
                textString="LowpassButterworthFilter"),
            Text(visible=true,
                extent={{8.0,-146.0},{8.0,-106.0}},
                textString="f=%f"),
            Text(visible=true,
                lineColor={192,192,192},
                extent={{-2.0,48.0},{94.0,94.0}},
                textString="%n")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Line(points={{40,0},{-40,0}}, color={0,0,0}),
            Text(
              extent={{-55,55},{55,5}},
              lineColor={0,0,0},
              textString="1"),
            Text(
              extent={{-55,-5},{55,-55}},
              lineColor={0,0,0},
              textString="a(s)"),
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}),
        Documentation(info="<html>
<p>
This block defines the transfer function between the input u
and the output y as an n-th order low pass filter with <i>Butterworth</i>
characteristics and cut-off frequency f. It is implemented as
a series of second order filters and a first order filter.
Butterworth filters have the feature that the amplitude at the
cut-off frequency f is 1/sqrt(2) (= 3 dB), i.e., they are
always \"normalized\". Step responses of the Butterworth filter of
different orders are shown in the next figure:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Butterworth.png\"
     alt=\"Butterworth.png\">
</p>

<p>
If transients at the simulation start shall be avoided, the filter
should be initialized in steady state (e.g., using option
initType=Modelica.Blocks.Types.Init.SteadyState).
</p>

</html>"));
    end LowpassButterworth;

    block CriticalDamping
      "Output the input signal filtered with an n-th order filter with critical damping"

      import Modelica_Blocks.Types.Init;
      extends Interfaces.SISO;

      parameter Integer n=2 "Order of filter";
      parameter SIunits.Frequency f(start=1) "Cut-off frequency";
      parameter Boolean normalized = true
        "= true, if amplitude at f_cut is 3 dB, otherwise unmodified filter";
      parameter Init initType=Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
        annotation (Evaluate=true, Dialog(group="Initialization"));
      parameter Real x_start[n]=zeros(n) "Initial or guess values of states"
        annotation (Dialog(group="Initialization"));
      parameter Real y_start=0.0
        "Initial value of output (remaining states are in steady state)"
        annotation(Dialog(enable=initType == Init.InitialOutput, group=
              "Initialization"));

      output Real x[n](start=x_start) "Filter states";
    protected
      parameter Real alpha=if normalized then sqrt(2^(1/n) - 1) else 1.0
        "Frequency correction factor for normalized filter";
      parameter Real w=2*Modelica_Constants.pi*f/alpha;
    initial equation
      if initType == Init.SteadyState then
        der(x) = zeros(n);
      elseif initType == Init.InitialState then
        x = x_start;
      elseif initType == Init.InitialOutput then
        y = y_start;
        der(x[1:n-1]) = zeros(n-1);
      end if;
    equation
      der(x[1]) = (u - x[1])*w;
      for i in 2:n loop
        der(x[i]) = (x[i - 1] - x[i])*w;
      end for;
      y = x[n];
      annotation (
        Icon(
            coordinateSystem(preserveAspectRatio=true,
              extent={{-100.0,-100.0},{100.0,100.0}},
              initialScale=0.1),
              graphics={
            Line(visible=true,
              points={{-80.6897,77.6256},{-80.6897,-90.3744}},
              color={192,192,192}),
            Polygon(visible=true,
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid,
              points={{-79.7044,90.6305},{-87.7044,68.6305},{-71.7044,68.6305},{-79.7044,90.6305}}),
            Line(visible=true,
              points={{-90.0,-80.0},{82.0,-80.0}},
              color={192,192,192}),
            Polygon(visible=true,
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid,
              points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
            Text(visible=true,
              lineColor={192,192,192},
              extent={{0.0,-60.0},{60.0,0.0}},
              textString="PTn"),
            Line(visible=  true,
              origin=  {-17.976,-6.521},
              points=  {{96.962,55.158},{16.42,50.489},{-18.988,18.583},{-32.024,-53.479},{-62.024,-73.479}},
              color=  {0,0,127},
              smooth=  Smooth.Bezier),
            Text(visible=true,
              lineColor={192,192,192},
              extent={{-70.0,48.0},{26.0,94.0}},
              textString="%n"),
            Text(visible=true,
              extent={{8.0,-146.0},{8.0,-106.0}},
              textString="f=%f")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Line(points={{40,0},{-40,0}}, color={0,0,0}),
            Text(
              extent={{-55,55},{55,5}},
              lineColor={0,0,0},
              textString="1"),
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-54,-6},{44,-56}},
              lineColor={0,0,0},
              textString="(s/w + 1)"),
            Text(
              extent={{38,-10},{58,-30}},
              lineColor={0,0,0},
              textString="n")}),
        Documentation(info="<html>
<p>This block defines the transfer function between the
input u and the output y
as an n-th order filter with <i>critical damping</i>
characteristics and cut-off frequency f. It is
implemented as a series of first order filters.
This filter type is especially useful to filter the input of an
inverse model, since the filter does not introduce any transients.
</p>

<p>
If parameter <b>normalized</b> = <b>true</b> (default), the filter
is normalized such that the amplitude of the filter transfer function
at the cut-off frequency f is 1/sqrt(2) (= 3 dB). Otherwise, the filter
is not normalized, i.e., it is unmodified. A normalized filter is usually
much better for applications, since filters of different orders are
\"comparable\", whereas non-normalized filters usually require to adapt the
cut-off frequency, when the order of the filter is changed.
Figures of the filter step responses are shown below.
Note, in versions before version 3.0 of the Modelica Standard library,
the CriticalDamping filter was provided only in non-normalized form.
</p>

<p>If transients at the simulation start shall be avoided, the filter
should be initialized in steady state (e.g., using option
initType=Modelica.Blocks.Types.Init.SteadyState).
</p>

<p>
The critical damping filter is defined as
</p>

<pre>
    &alpha; = <b>if</b> normalized <b>then</b> <b>sqrt</b>(2^(1/n) - 1) <b>else</b> 1 // frequency correction factor
    &omega; = 2*&pi;*f/&alpha;
              1
    y = ------------- * u
         (s/w + 1)^n

</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/CriticalDampingNormalized.png\"
     alt=\"CriticalDampingNormalized.png\">
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/CriticalDampingNonNormalized.png\"
     alt=\"CriticalDampingNonNormalized.png\">
</p>

</html>"));
    end CriticalDamping;

    block Filter
      "Continuous low pass, high pass, band pass or band stop IIR-filter of type CriticalDamping, Bessel, Butterworth or ChebyshevI"
      import Modelica_Blocks.Continuous.Internal;

      extends Interfaces.SISO;

      parameter Types.AnalogFilter analogFilter=Types.AnalogFilter.CriticalDamping
        "Analog filter characteristics (CriticalDamping/Bessel/Butterworth/ChebyshevI)";
      parameter Types.FilterType filterType=Types.FilterType.LowPass
        "Type of filter (LowPass/HighPass/BandPass/BandStop)";
      parameter Integer order(min=1) = 2 "Order of filter";
      parameter SIunits.Frequency f_cut "Cut-off frequency";
      parameter Real gain=1.0
        "Gain (= amplitude of frequency response at zero frequency)";
      parameter Real A_ripple(unit="dB") = 0.5
        "Pass band ripple for Chebyshev filter (otherwise not used); > 0 required"
        annotation(Dialog(enable=analogFilter==Modelica.Blocks.Types.AnalogFilter.ChebyshevI));
      parameter SIunits.Frequency f_min=0
        "Band of band pass/stop filter is f_min (A=-3db*gain) .. f_cut (A=-3db*gain)"
        annotation (Dialog(enable=filterType == Modelica.Blocks.Types.FilterType.BandPass
               or filterType == Modelica.Blocks.Types.FilterType.BandStop));
      parameter Boolean normalized=true
        "= true, if amplitude at f_cut = -3db, otherwise unmodified filter";
      parameter Types.Init init=Types.Init.SteadyState
        "Type of initialization (no init/steady state/initial state/initial output)"
        annotation (Evaluate=true, Dialog(tab="Advanced"));
      final parameter Integer nx = if filterType ==Types.FilterType.LowPass                  or
                                      filterType ==Types.FilterType.HighPass                  then
                                      order else 2*order;
      parameter Real x_start[nx] = zeros(nx)
        "Initial or guess values of states"
        annotation(Dialog(tab="Advanced"));
      parameter Real y_start = 0 "Initial value of output"
        annotation(Dialog(tab="Advanced"));
      parameter Real u_nominal = 1.0
        "Nominal value of input (used for scaling the states)"
      annotation(Dialog(tab="Advanced"));
      Interfaces.RealOutput x[nx] "Filter states";

    protected
      parameter Integer ncr = if analogFilter ==Types.AnalogFilter.CriticalDamping                  then
                                 order else mod(order,2);
      parameter Integer nc0 = if analogFilter ==Types.AnalogFilter.CriticalDamping                  then
                                 0 else integer(order/2);
      parameter Integer na = if filterType ==Types.FilterType.BandPass                  or
                                filterType ==Types.FilterType.BandStop                  then order else
                             if analogFilter ==Types.AnalogFilter.CriticalDamping                  then
                                0 else integer(order/2);
      parameter Integer nr = if filterType ==Types.FilterType.BandPass                  or
                                filterType ==Types.FilterType.BandStop                  then 0 else
                             if analogFilter ==Types.AnalogFilter.CriticalDamping                  then
                                order else mod(order,2);

      // Coefficients of prototype base filter (low pass filter with w_cut = 1 rad/s)
      parameter Real cr[ncr](each fixed=false);
      parameter Real c0[nc0](each fixed=false);
      parameter Real c1[nc0](each fixed=false);

      // Coefficients for differential equations.
      parameter Real r[nr](each fixed=false);
      parameter Real a[na](each fixed=false);
      parameter Real b[na](each fixed=false);
      parameter Real ku[na](each fixed=false);
      parameter Real k1[if filterType == Modelica_Blocks.Types.FilterType.LowPass
         then 0 else na](each fixed=false);
      parameter Real k2[if filterType == Modelica_Blocks.Types.FilterType.LowPass
         then 0 else na](each fixed=false);

      // Auxiliary variables
      Real uu[na+nr+1];

    initial equation
      if analogFilter == Modelica_Blocks.Types.AnalogFilter.CriticalDamping then
        cr = Internal.Filter.base.CriticalDamping(order, normalized);
      elseif analogFilter == Modelica_Blocks.Types.AnalogFilter.Bessel then
        (cr,c0,c1) = Internal.Filter.base.Bessel(order, normalized);
      elseif analogFilter == Modelica_Blocks.Types.AnalogFilter.Butterworth then
        (cr,c0,c1) = Internal.Filter.base.Butterworth(order, normalized);
      elseif analogFilter == Modelica_Blocks.Types.AnalogFilter.ChebyshevI then
        (cr,c0,c1) = Internal.Filter.base.ChebyshevI(
              order,
              A_ripple,
              normalized);
       end if;

      if filterType == Modelica_Blocks.Types.FilterType.LowPass then
        (r,a,b,ku) = Internal.Filter.roots.lowPass(
              cr,
              c0,
              c1,
              f_cut);
      elseif filterType == Modelica_Blocks.Types.FilterType.HighPass then
        (r,a,b,ku,k1,k2) = Internal.Filter.roots.highPass(
              cr,
              c0,
              c1,
              f_cut);
      elseif filterType == Modelica_Blocks.Types.FilterType.BandPass then
        (a,b,ku,k1,k2) = Internal.Filter.roots.bandPass(
              cr,
              c0,
              c1,
              f_min,
              f_cut);
      elseif filterType == Modelica_Blocks.Types.FilterType.BandStop then
        (a,b,ku,k1,k2) = Internal.Filter.roots.bandStop(
              cr,
              c0,
              c1,
              f_min,
              f_cut);
       end if;

      if init == Modelica_Blocks.Types.Init.InitialState then
          x = x_start;
      elseif init == Modelica_Blocks.Types.Init.SteadyState then
          der(x) = zeros(nx);
      elseif init == Modelica_Blocks.Types.Init.InitialOutput then
          y = y_start;
          if nx > 1 then
             der(x[1:nx-1]) = zeros(nx-1);
          end if;
       end if;

    equation
       assert(u_nominal > 0, "u_nominal > 0 required");
      assert(filterType == Modelica_Blocks.Types.FilterType.LowPass or
        filterType == Modelica_Blocks.Types.FilterType.HighPass or f_min > 0,
        "f_min > 0 required for band pass and band stop filter");
       assert(A_ripple > 0, "A_ripple > 0 required");
       assert(f_cut > 0, "f_cut > 0 required");

       /* All filters have the same basic differential equations:
        Real poles:
           der(x) = r*x - r*u
        Complex conjugate poles:
           der(x1) = a*x1 - b*x2 + ku*u;
           der(x2) = b*x1 + a*x2;
   */
       uu[1] = u/u_nominal;
       for i in 1:nr loop
          der(x[i]) = r[i]*(x[i] - uu[i]);
       end for;
       for i in 1:na loop
          der(x[nr+2*i-1]) = a[i]*x[nr+2*i-1] - b[i]*x[nr+2*i] + ku[i]*uu[nr+i];
          der(x[nr+2*i])   = b[i]*x[nr+2*i-1] + a[i]*x[nr+2*i];
       end for;

       // The output equation is different for the different filter types
      if filterType == Modelica_Blocks.Types.FilterType.LowPass then
          /* Low pass filter
           Real poles             :  y = x
           Complex conjugate poles:  y = x2
      */
          for i in 1:nr loop
             uu[i+1] = x[i];
          end for;
          for i in 1:na loop
             uu[nr+i+1] = x[nr+2*i];
          end for;

      elseif filterType == Modelica_Blocks.Types.FilterType.HighPass then
          /* High pass filter
           Real poles             :  y = -x + u;
           Complex conjugate poles:  y = k1*x1 + k2*x2 + u;
      */
          for i in 1:nr loop
             uu[i+1] = -x[i] + uu[i];
          end for;
          for i in 1:na loop
             uu[nr+i+1] = k1[i]*x[nr+2*i-1] + k2[i]*x[nr+2*i] + uu[nr+i];
          end for;

      elseif filterType == Modelica_Blocks.Types.FilterType.BandPass then
          /* Band pass filter
           Complex conjugate poles:  y = k1*x1 + k2*x2;
      */
          for i in 1:na loop
             uu[nr+i+1] = k1[i]*x[nr+2*i-1] + k2[i]*x[nr+2*i];
          end for;

      elseif filterType == Modelica_Blocks.Types.FilterType.BandStop then
          /* Band pass filter
           Complex conjugate poles:  y = k1*x1 + k2*x2 + u;
      */
          for i in 1:na loop
             uu[nr+i+1] = k1[i]*x[nr+2*i-1] + k2[i]*x[nr+2*i] + uu[nr+i];
          end for;

       else
          assert(false, "filterType (= " + String(filterType) + ") is unknown");
          uu = zeros(na+nr+1);
       end if;

       y = (gain*u_nominal)*uu[nr+na+1];

      annotation (
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Line(visible=true,
            points={{-80.0,80.0},{-80.0,-88.0}},
            color={192,192,192}),
          Polygon(visible=true,
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{-80.0,92.0},{-88.0,70.0},{-72.0,70.0},{-80.0,92.0}}),
          Line(visible=true,
            points={{-90.0,-78.0},{82.0,-78.0}},
            color={192,192,192}),
          Polygon(visible=true,
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{90.0,-78.0},{68.0,-70.0},{68.0,-86.0},{90.0,-78.0}}),
          Text(visible=true,
            lineColor={192,192,192},
            extent={{-66.0,52.0},{88.0,90.0}},
            textString="%order"),
          Text(visible=true,
            fillPattern=FillPattern.Solid,
            extent={{-138.0,-140.0},{162.0,-110.0}},
            textString="f_cut=%f_cut"),
          Rectangle(visible=true,
            lineColor={160,160,164},
            fillColor={255,255,255},
            fillPattern=FillPattern.Backward,
            extent={{-80.0,-78.0},{22.0,10.0}}),
          Line(visible=  true, origin=  {3.333,-6.667}, points=  {{-83.333,34.667},{24.667,34.667},{42.667,-71.333}}, color=  {0,0,127}, smooth=  Smooth.Bezier)}),
        Documentation(info="<html>

<p>
This blocks models various types of filters:
</p>

<blockquote>
<b>low pass, high pass, band pass, and band stop filters</b>
</blockquote>

<p>
using various filter characteristics:
</p>

<blockquote>
<b>CriticalDamping, Bessel, Butterworth, Chebyshev Type I filters</b>
</blockquote>

<p>
By default, a filter block is initialized in <b>steady-state</b>, in order to
avoid unwanted oscillations at the beginning. In special cases, it might be
useful to select one of the other initialization options under tab
\"Advanced\".
</p>

<p>
Typical frequency responses for the 4 supported low pass filter types
are shown in the next figure:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Blocks/LowPassOrder4Filters.png\"
     alt=\"LowPassOrder4Filters.png\">
</blockquote>

<p>
The step responses of the same low pass filters are shown in the next figure,
starting from a steady state initial filter with initial input = 0.2:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Blocks/LowPassOrder4FiltersStepResponse.png\"
     alt=\"LowPassOrder4FiltersStepResponse.png\">
</blockquote>

<p>
Obviously, the frequency responses give a somewhat wrong impression
of the filter characteristics: Although Butterworth and Chebyshev
filters have a significantly steeper magnitude as the
CriticalDamping and Bessel filters, the step responses of
the latter ones are much better. This means for example, that
a CriticalDamping or a Bessel filter should be selected,
if a filter is mainly used to make a non-linear inverse model
realizable.
</p>

<p>
Typical frequency responses for the 4 supported high pass filter types
are shown in the next figure:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Blocks/HighPassOrder4Filters.png\"
     alt=\"HighPassOrder4Filters.png\">
</blockquote>

<p>
The corresponding step responses of these high pass filters are
shown in the next figure:
</p>
<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Blocks/HighPassOrder4FiltersStepResponse.png\"
     alt=\"HighPassOrder4FiltersStepResponse.png\">
</blockquote>

<p>
All filters are available in <b>normalized</b> (default) and non-normalized form.
In the normalized form, the amplitude of the filter transfer function
at the cut-off frequency f_cut is -3 dB (= 10^(-3/20) = 0.70794..).
Note, when comparing the filters of this function with other software systems,
the setting of \"normalized\" has to be selected appropriately. For example, the signal processing
toolbox of Matlab provides the filters in non-normalized form and
therefore a comparison makes only sense, if normalized = <b>false</b>
is set. A normalized filter is usually better suited for applications,
since filters of different orders are \"comparable\",
whereas non-normalized filters usually require to adapt the
cut-off frequency, when the order of the filter is changed.
See a comparison of \"normalized\" and \"non-normalized\" filters at hand of
CriticalDamping filters of order 1,2,3:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Blocks/CriticalDampingNormalized.png\"
     alt=\"CriticalDampingNormalized.png\">
</blockquote>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Blocks/CriticalDampingNonNormalized.png\"
     alt=\"CriticalDampingNonNormalized.png\">
</blockquote>

<h4>Implementation</h4>

<p>
The filters are implemented in the following, reliable way:
</p>

<ol>
<li> A prototype low pass filter with a cut-off angular frequency of 1 rad/s is constructed
     from the desired analogFilter and the desired normalization.</li>

<li> This prototype low pass filter is transformed to the desired filterType and the
     desired cut-off frequency f_cut using a transformation on the Laplace variable \"s\".</li>

<li> The resulting first and second order transfer functions are implemented in
     state space form, using the \"eigen value\" representation of a transfer function:
     <pre>

  // second order block with eigen values: a +/- jb
  <b>der</b>(x1) = a*x1 - b*x2 + (a^2 + b^2)/b*u;
  <b>der</b>(x2) = b*x1 + a*x2;
       y  = x2;
     </pre>
     The dc-gain from the input to the output of this block is one and the selected
     states are in the order of the input (if \"u\" is in the order of \"one\", then the
     states are also in the order of \"one\"). In the \"Advanced\" tab, a \"nominal\" value for
     the input \"u\" can be given. If appropriately selected, the states are in the order of \"one\" and
     then step-size control is always appropriate.</li>
</ol>

<h4>References</h4>

<dl>
<dt>Tietze U., and Schenk C. (2002):</dt>
<dd> <b>Halbleiter-Schaltungstechnik</b>.
     Springer Verlag, 12. Auflage, pp. 815-852.</dd>
</dl>

</html>",   revisions="<html>
<dl>
  <dt><b>Main Author:</b></dt>
  <dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>,
      DLR Oberpfaffenhofen.</dd>
</dl>

<h4>Acknowledgement</h4>

<p>
The development of this block was partially funded by BMBF within the
     <a href=\"http://www.eurosyslib.com/\">ITEA2 EUROSYSLIB</a>
      project.
</p>

</html>"));
    end Filter;

    package Internal
      "Internal utility functions and blocks that should not be directly utilized by the user"
        extends Modelica_Icons.InternalPackage;
      package Filter
        "Internal utility functions for filters that should not be directly used"
          extends Modelica_Icons.InternalPackage;
        package base
          "Prototype low pass filters with cut-off frequency of 1 rad/s (other filters are derived by transformation from these base filters)"
            extends Modelica_Icons.InternalPackage;
        function CriticalDamping
            "Return base filter coefficients of CriticalDamping filter (= low pass filter with w_cut = 1 rad/s)"
          extends Modelica_Icons.Function;

          input Integer order(min=1) "Order of filter";
          input Boolean normalized=true
              "= true, if amplitude at f_cut = -3db, otherwise unmodified filter";

          output Real cr[order] "Coefficients of real poles";
          protected
          Real alpha=1.0 "Frequency correction factor";
          Real alpha2 "= alpha*alpha";
          Real den1[order]
              "[p] coefficients of denominator first order polynomials (a*p + 1)";
          Real den2[0,2]
              "[p^2, p] coefficients of denominator second order polynomials (b*p^2 + a*p + 1)";
          Real c0[0] "Coefficients of s^0 term if conjugate complex pole";
          Real c1[0] "Coefficients of s^1 term if conjugate complex pole";
        algorithm
          if normalized then
             // alpha := sqrt(2^(1/order) - 1);
             alpha := sqrt(10^(3/10/order)-1);
          else
             alpha := 1.0;
          end if;

          for i in 1:order loop
             den1[i] := alpha;
          end for;

          // Determine polynomials with highest power of s equal to one
            (cr,c0,c1) := Utilities.toHighestPowerOne(den1, den2);
        end CriticalDamping;

        function Bessel
            "Return base filter coefficients of Bessel filter (= low pass filter with w_cut = 1 rad/s)"
          extends Modelica_Icons.Function;

          input Integer order(min=1) "Order of filter";
          input Boolean normalized=true
              "= true, if amplitude at f_cut = -3db, otherwise unmodified filter";

          output Real cr[mod(order, 2)] "Coefficient of real pole";
          output Real c0[integer(order/2)]
              "Coefficients of s^0 term if conjugate complex pole";
          output Real c1[integer(order/2)]
              "Coefficients of s^1 term if conjugate complex pole";
          protected
          Real alpha=1.0 "Frequency correction factor";
          Real alpha2 "= alpha*alpha";
          Real den1[size(cr,1)]
              "[p] coefficients of denominator first order polynomials (a*p + 1)";
          Real den2[size(c0, 1),2]
              "[p^2, p] coefficients of denominator second order polynomials (b*p^2 + a*p + 1)";
        algorithm
            (den1,den2,alpha) := Utilities.BesselBaseCoefficients(order);
          if not normalized then
             alpha2 := alpha*alpha;
             for i in 1:size(c0, 1) loop
               den2[i, 1] := den2[i, 1]*alpha2;
               den2[i, 2] := den2[i, 2]*alpha;
             end for;
             if size(cr,1) == 1 then
               den1[1] := den1[1]*alpha;
             end if;
             end if;

          // Determine polynomials with highest power of s equal to one
            (cr,c0,c1) := Utilities.toHighestPowerOne(den1, den2);
        end Bessel;

        function Butterworth
            "Return base filter coefficients of Butterworth filter (= low pass filter with w_cut = 1 rad/s)"
          extends Modelica_Icons.Function;

          input Integer order(min=1) "Order of filter";
          input Boolean normalized=true
              "= true, if amplitude at f_cut = -3db, otherwise unmodified filter";

          output Real cr[mod(order, 2)] "Coefficient of real pole";
          output Real c0[integer(order/2)]
              "Coefficients of s^0 term if conjugate complex pole";
          output Real c1[integer(order/2)]
              "Coefficients of s^1 term if conjugate complex pole";
          protected
          Real alpha=1.0 "Frequency correction factor";
          Real alpha2 "= alpha*alpha";
          Real den1[size(cr,1)]
              "[p] coefficients of denominator first order polynomials (a*p + 1)";
          Real den2[size(c0, 1),2]
              "[p^2, p] coefficients of denominator second order polynomials (b*p^2 + a*p + 1)";
          constant Real pi=Modelica_Constants.pi;
        algorithm
          for i in 1:size(c0, 1) loop
            den2[i, 1] := 1.0;
            den2[i, 2] := -2*Modelica_Math.cos(pi*(0.5 + (i - 0.5)/order));
          end for;
          if size(cr,1) == 1 then
            den1[1] := 1.0;
          end if;

          /* Transformation of filter transfer function with "new(p) = alpha*p"
     in order that the filter transfer function has an amplitude of
     -3 db at the cutoff frequency
  */
          /*
    if normalized then
      alpha := Internal.normalizationFactor(den1, den2);
      alpha2 := alpha*alpha;
      for i in 1:size(c0, 1) loop
        den2[i, 1] := den2[i, 1]*alpha2;
        den2[i, 2] := den2[i, 2]*alpha;
      end for;
      if size(cr,1) == 1 then
        den1[1] := den1[1]*alpha;
      end if;
    end if;
  */

          // Determine polynomials with highest power of s equal to one
            (cr,c0,c1) := Utilities.toHighestPowerOne(den1, den2);
        end Butterworth;

        function ChebyshevI
            "Return base filter coefficients of Chebyshev I filter (= low pass filter with w_cut = 1 rad/s)"
            import Modelica_Math.asinh;
          extends Modelica_Icons.Function;

          input Integer order(min=1) "Order of filter";
          input Real A_ripple = 0.5 "Pass band ripple in [dB]";
          input Boolean normalized=true
              "= true, if amplitude at f_cut = -3db, otherwise unmodified filter";

          output Real cr[mod(order, 2)] "Coefficient of real pole";
          output Real c0[integer(order/2)]
              "Coefficients of s^0 term if conjugate complex pole";
          output Real c1[integer(order/2)]
              "Coefficients of s^1 term if conjugate complex pole";
          protected
          Real epsilon;
          Real fac;
          Real alpha=1.0 "Frequency correction factor";
          Real alpha2 "= alpha*alpha";
          Real den1[size(cr,1)]
              "[p] coefficients of denominator first order polynomials (a*p + 1)";
          Real den2[size(c0, 1),2]
              "[p^2, p] coefficients of denominator second order polynomials (b*p^2 + a*p + 1)";
          constant Real pi=Modelica_Constants.pi;
        algorithm
            epsilon := sqrt(10^(A_ripple/10) - 1);
            fac := asinh(1/epsilon)/order;

            den1 := fill(1/sinh(fac),size(den1,1));
            if size(cr,1) == 0 then
               for i in 1:size(c0, 1) loop
                  den2[i,1] :=1/(cosh(fac)^2 - cos((2*i - 1)*pi/(2*order))^2);
                  den2[i,2] :=2*den2[i, 1]*sinh(fac)*cos((2*i - 1)*pi/(2*order));
               end for;
            else
               for i in 1:size(c0, 1) loop
                  den2[i,1] :=1/(cosh(fac)^2 - cos(i*pi/order)^2);
                  den2[i,2] :=2*den2[i, 1]*sinh(fac)*cos(i*pi/order);
               end for;
            end if;

            /* Transformation of filter transfer function with "new(p) = alpha*p"
       in order that the filter transfer function has an amplitude of
       -3 db at the cutoff frequency
    */
            if normalized then
              alpha := Utilities.normalizationFactor(den1, den2);
              alpha2 := alpha*alpha;
              for i in 1:size(c0, 1) loop
                den2[i, 1] := den2[i, 1]*alpha2;
                den2[i, 2] := den2[i, 2]*alpha;
              end for;
              den1 := den1*alpha;
            end if;

          // Determine polynomials with highest power of s equal to one
            (cr,c0,c1) := Utilities.toHighestPowerOne(den1, den2);
        end ChebyshevI;
        end base;

        package coefficients "Filter coefficients"
            extends Modelica_Icons.InternalPackage;
        function lowPass
            "Return low pass filter coefficients at given cut-off frequency"
          extends Modelica_Icons.Function;

          input Real cr_in[:] "Coefficients of real poles";
          input Real c0_in[:]
              "Coefficients of s^0 term if conjugate complex pole";
          input Real c1_in[size(c0_in,1)]
              "Coefficients of s^1 term if conjugate complex pole";
          input SIunits.Frequency f_cut "Cut-off frequency";

          output Real cr[size(cr_in,1)] "Coefficient of real pole";
          output Real c0[size(c0_in,1)]
              "Coefficients of s^0 term if conjugate complex pole";
          output Real c1[size(c0_in,1)]
              "Coefficients of s^1 term if conjugate complex pole";

          protected
          constant Real pi=Modelica_Constants.pi;
          SIunits.AngularVelocity w_cut=2*pi*f_cut "Cut-off angular frequency";
          Real w_cut2=w_cut*w_cut;

        algorithm
          assert(f_cut > 0, "Cut-off frequency f_cut must be positive");

          /* Change filter coefficients according to transformation new(s) = s/w_cut
     s + cr           -> (s/w) + cr              = (s + w*cr)/w
     s^2 + c1*s + c0  -> (s/w)^2 + c1*(s/w) + c0 = (s^2 + (c1*w)*s + (c0*w^2))/w^2
  */
          cr := w_cut*cr_in;
          c1 := w_cut*c1_in;
          c0 := w_cut2*c0_in;

        end lowPass;

        function highPass
            "Return high pass filter coefficients at given cut-off frequency"
          extends Modelica_Icons.Function;

          input Real cr_in[:] "Coefficients of real poles";
          input Real c0_in[:]
              "Coefficients of s^0 term if conjugate complex pole";
          input Real c1_in[size(c0_in,1)]
              "Coefficients of s^1 term if conjugate complex pole";
          input SIunits.Frequency f_cut "Cut-off frequency";

          output Real cr[size(cr_in,1)] "Coefficient of real pole";
          output Real c0[size(c0_in,1)]
              "Coefficients of s^0 term if conjugate complex pole";
          output Real c1[size(c0_in,1)]
              "Coefficients of s^1 term if conjugate complex pole";

          protected
          constant Real pi=Modelica_Constants.pi;
          SIunits.AngularVelocity w_cut=2*pi*f_cut "Cut-off angular frequency";
          Real w_cut2=w_cut*w_cut;

        algorithm
          assert(f_cut > 0, "Cut-off frequency f_cut must be positive");

          /* Change filter coefficients according to transformation: new(s) = 1/s
        1/(s + cr)          -> 1/(1/s + cr)                = (1/cr)*s / (s + (1/cr))
        1/(s^2 + c1*s + c0) -> 1/((1/s)^2 + c1*(1/s) + c0) = (1/c0)*s^2 / (s^2 + (c1/c0)*s + 1/c0)

     Check whether transformed roots are also conjugate complex:
        c0 - c1^2/4 > 0  -> (1/c0) - (c1/c0)^2 / 4
                            = (c0 - c1^2/4) / c0^2 > 0
        It is therefore guaranteed that the roots remain conjugate complex

     Change filter coefficients according to transformation new(s) = s/w_cut
        s + 1/cr                -> (s/w) + 1/cr                   = (s + w/cr)/w
        s^2 + (c1/c0)*s + 1/c0  -> (s/w)^2 + (c1/c0)*(s/w) + 1/c0 = (s^2 + (w*c1/c0)*s + (w^2/c0))/w^2
  */
          for i in 1:size(cr_in,1) loop
             cr[i] := w_cut/cr_in[i];
          end for;

          for i in 1:size(c0_in,1) loop
             c0[i] := w_cut2/c0_in[i];
             c1[i] := w_cut*c1_in[i]/c0_in[i];
          end for;

        end highPass;

        function bandPass
            "Return band pass filter coefficients at given cut-off frequency"
          extends Modelica_Icons.Function;

          input Real cr_in[:] "Coefficients of real poles";
          input Real c0_in[:]
              "Coefficients of s^0 term if conjugate complex pole";
          input Real c1_in[size(c0_in,1)]
              "Coefficients of s^1 term if conjugate complex pole";
          input SIunits.Frequency f_min
              "Band of band pass filter is f_min (A=-3db) .. f_max (A=-3db)";
          input SIunits.Frequency f_max "Upper band frequency";

          output Real cr[0] "Coefficient of real pole";
          output Real c0[size(cr_in,1) + 2*size(c0_in,1)]
              "Coefficients of s^0 term if conjugate complex pole";
          output Real c1[size(cr_in,1) + 2*size(c0_in,1)]
              "Coefficients of s^1 term if conjugate complex pole";
          output Real cn "Numerator coefficient of the PT2 terms";
          protected
          constant Real pi=Modelica_Constants.pi;
          SIunits.Frequency f0=sqrt(f_min*f_max);
          SIunits.AngularVelocity w_cut=2*pi*f0 "Cut-off angular frequency";
          Real w_band = (f_max - f_min) / f0;
          Real w_cut2=w_cut*w_cut;
          Real c;
          Real alpha;
          Integer j;
        algorithm
          assert(f_min > 0 and f_min < f_max, "Band frequencies f_min and f_max are wrong");

            /* The band pass filter is derived from the low pass filter by
       the transformation new(s) = (s + 1/s)/w   (w = w_band = (f_max - f_min)/sqrt(f_max*f_min) )

       1/(s + cr)         -> 1/((s/w + 1/s/w) + cr)
                             = w*s / (s^2 + cr*w*s + 1)

       1/(s^2 + c1*s + c0) -> 1/( (s+1/s)^2/w^2 + c1*(s + 1/s)/w + c0 )
                              = 1 /( ( s^2 + 1/s^2 + 2)/w^2 + (s + 1/s)*c1/w + c0 )
                              = w^2*s^2 / (s^4 + 2*s^2 + 1 + (s^3 + s)*c1*w + c0*w^2*s^2)
                              = w^2*s^2 / (s^4 + c1*w*s^3 + (2+c0*w^2)*s^2 + c1*w*s + 1)

                              Assume the following description with PT2:
                              = w^2*s^2 /( (s^2 + s*(c/alpha) + 1/alpha^2)*
                                           (s^2 + s*(c*alpha) + alpha^2) )
                              = w^2*s^2 / ( s^4 + c*(alpha + 1/alpha)*s^3
                                                + (alpha^2 + 1/alpha^2 + c^2)*s^2
                                                + c*(alpha + 1/alpha)*s + 1 )

                              and therefore:
                                c*(alpha + 1/alpha) = c1*w       -> c = c1*w / (alpha + 1/alpha)
                                                                      = c1*w*alpha/(1+alpha^2)
                                alpha^2 + 1/alpha^2 + c^2 = 2+c0*w^2 -> equation to determine alpha
                                alpha^4 + 1 + c1^2*w^2*alpha^4/(1+alpha^2)^2 = (2+c0*w^2)*alpha^2
                                or z = alpha^2
                                z^2 + c^1^2*w^2*z^2/(1+z)^2 - (2+c0*w^2)*z + 1 = 0

     Check whether roots remain conjugate complex
        c0 - (c1/2)^2 > 0:    1/alpha^2 - (c/alpha)^2/4
                              = 1/alpha^2*(1 - c^2/4)    -> not possible to figure this out

     Afterwards, change filter coefficients according to transformation new(s) = s/w_cut
        w_band*s/(s^2 + c1*s + c0)  -> w_band*(s/w)/((s/w)^2 + c1*(s/w) + c0 =
                                       (w_band/w)*s/(s^2 + (c1*w)*s + (c0*w^2))/w^2) =
                                       (w_band*w)*s/(s^2 + (c1*w)*s + (c0*w^2))
    */
            for i in 1:size(cr_in,1) loop
               c1[i] := w_cut*cr_in[i]*w_band;
               c0[i] := w_cut2;
            end for;

            for i in 1:size(c1_in,1) loop
              alpha := Utilities.bandPassAlpha(
                        c1_in[i],
                        c0_in[i],
                        w_band);
               c       := c1_in[i]*w_band / (alpha + 1/alpha);
               j       := size(cr_in,1) + 2*i - 1;
               c1[j]   := w_cut*c/alpha;
               c1[j+1] := w_cut*c*alpha;
               c0[j]   := w_cut2/alpha^2;
               c0[j+1] := w_cut2*alpha^2;
            end for;

            cn :=w_band*w_cut;

        end bandPass;

        function bandStop
            "Return band stop filter coefficients at given cut-off frequency"
          extends Modelica_Icons.Function;

          input Real cr_in[:] "Coefficients of real poles";
          input Real c0_in[:]
              "Coefficients of s^0 term if conjugate complex pole";
          input Real c1_in[size(c0_in,1)]
              "Coefficients of s^1 term if conjugate complex pole";
          input SIunits.Frequency f_min
              "Band of band stop filter is f_min (A=-3db) .. f_max (A=-3db)";
          input SIunits.Frequency f_max "Upper band frequency";

          output Real cr[0] "Coefficient of real pole";
          output Real c0[size(cr_in,1) + 2*size(c0_in,1)]
              "Coefficients of s^0 term if conjugate complex pole";
          output Real c1[size(cr_in,1) + 2*size(c0_in,1)]
              "Coefficients of s^1 term if conjugate complex pole";
          protected
          constant Real pi=Modelica_Constants.pi;
          SIunits.Frequency f0=sqrt(f_min*f_max);
          SIunits.AngularVelocity w_cut=2*pi*f0 "Cut-off angular frequency";
          Real w_band = (f_max - f_min) / f0;
          Real w_cut2=w_cut*w_cut;
          Real c;
          Real ww;
          Real alpha;
          Integer j;
        algorithm
          assert(f_min > 0 and f_min < f_max, "Band frequencies f_min and f_max are wrong");

            /* The band pass filter is derived from the low pass filter by
       the transformation new(s) = (s + 1/s)/w   (w = w_band = (f_max - f_min)/sqrt(f_max*f_min) )

       1/(s + cr)         -> 1/((s/w + 1/s/w) + cr)
                             = w*s / (s^2 + cr*w*s + 1)

       1/(s^2 + c1*s + c0) -> 1/( (s+1/s)^2/w^2 + c1*(s + 1/s)/w + c0 )
                              = 1 /( ( s^2 + 1/s^2 + 2)/w^2 + (s + 1/s)*c1/w + c0 )
                              = w^2*s^2 / (s^4 + 2*s^2 + 1 + (s^3 + s)*c1*w + c0*w^2*s^2)
                              = w^2*s^2 / (s^4 + c1*w*s^3 + (2+c0*w^2)*s^2 + c1*w*s + 1)

                              Assume the following description with PT2:
                              = w^2*s^2 /( (s^2 + s*(c/alpha) + 1/alpha^2)*
                                           (s^2 + s*(c*alpha) + alpha^2) )
                              = w^2*s^2 / ( s^4 + c*(alpha + 1/alpha)*s^3
                                                + (alpha^2 + 1/alpha^2 + c^2)*s^2
                                                + c*(alpha + 1/alpha)*s + 1 )

                              and therefore:
                                c*(alpha + 1/alpha) = c1*w       -> c = c1*w / (alpha + 1/alpha)
                                                                      = c1*w*alpha/(1+alpha^2)
                                alpha^2 + 1/alpha^2 + c^2 = 2+c0*w^2 -> equation to determine alpha
                                alpha^4 + 1 + c1^2*w^2*alpha^4/(1+alpha^2)^2 = (2+c0*w^2)*alpha^2
                                or z = alpha^2
                                z^2 + c^1^2*w^2*z^2/(1+z)^2 - (2+c0*w^2)*z + 1 = 0

       The band stop filter is derived from the low pass filter by
       the transformation new(s) = w/( (s + 1/s) )   (w = w_band = (f_max - f_min)/sqrt(f_max*f_min) )

       cr/(s + cr)         -> 1/(( w/(s + 1/s) ) + cr)
                              = (s^2 + 1) / (s^2 + (w/cr)*s + 1)

       c0/(s^2 + c1*s + c0) -> c0/( w^2/(s + 1/s)^2 + c1*w/(s + 1/s) + c0 )
                               = c0*(s^2 + 1)^2 / (s^4 + c1*w*s^3/c0 + (2+w^2/b)*s^2 + c1*w*s/c0 + 1)

                               Assume the following description with PT2:
                               = c0*(s^2 + 1)^2 / ( (s^2 + s*(c/alpha) + 1/alpha^2)*
                                                    (s^2 + s*(c*alpha) + alpha^2) )
                               = c0*(s^2 + 1)^2 / (  s^4 + c*(alpha + 1/alpha)*s^3
                                                         + (alpha^2 + 1/alpha^2 + c^2)*s^2
                                                         + c*(alpha + 1/alpha)*p + 1 )

                            and therefore:
                              c*(alpha + 1/alpha) = c1*w/b         -> c = c1*w/(c0*(alpha + 1/alpha))
                              alpha^2 + 1/alpha^2 + c^2 = 2+w^2/c0 -> equation to determine alpha
                              alpha^4 + 1 + (c1*w/c0*alpha^2)^2/(1+alpha^2)^2 = (2+w^2/c0)*alpha^2
                              or z = alpha^2
                              z^2 + (c1*w/c0*z)^2/(1+z)^2 - (2+w^2/c0)*z + 1 = 0

                            same as:  ww = w/c0
                              z^2 + (c1*ww*z)^2/(1+z)^2 - (2+c0*ww)*z + 1 = 0  -> same equation as for BandPass

     Afterwards, change filter coefficients according to transformation new(s) = s/w_cut
        c0*(s^2+1)(s^2 + c1*s + c0)  -> c0*((s/w)^2 + 1) / ((s/w)^2 + c1*(s/w) + c0 =
                                        c0/w^2*(s^2 + w^2) / (s^2 + (c1*w)*s + (c0*w^2))/w^2) =
                                        (s^2 + c0*w^2) / (s^2 + (c1*w)*s + (c0*w^2))
    */
            for i in 1:size(cr_in,1) loop
               c1[i] := w_cut*w_band/cr_in[i];
               c0[i] := w_cut2;
            end for;

            for i in 1:size(c1_in,1) loop
               ww      := w_band/c0_in[i];
              alpha := Utilities.bandPassAlpha(
                        c1_in[i],
                        c0_in[i],
                        ww);
               c       := c1_in[i]*ww / (alpha + 1/alpha);
               j       := size(cr_in,1) + 2*i - 1;
               c1[j]   := w_cut*c/alpha;
               c1[j+1] := w_cut*c*alpha;
               c0[j]   := w_cut2/alpha^2;
               c0[j+1] := w_cut2*alpha^2;
            end for;

        end bandStop;
        end coefficients;

        package roots
          "Filter roots and gain as needed for block implementations"
            extends Modelica_Icons.InternalPackage;
        function lowPass
            "Return low pass filter roots as needed for block for given cut-off frequency"
          extends Modelica_Icons.Function;

          input Real cr_in[:] "Coefficients of real poles of base filter";
          input Real c0_in[:]
              "Coefficients of s^0 term of base filter if conjugate complex pole";
          input Real c1_in[size(c0_in,1)]
              "Coefficients of s^1 term of base filter if conjugate complex pole";
          input SIunits.Frequency f_cut "Cut-off frequency";

          output Real r[size(cr_in,1)] "Real eigenvalues";
          output Real a[size(c0_in,1)]
              "Real parts of complex conjugate eigenvalues";
          output Real b[size(c0_in,1)]
              "Imaginary parts of complex conjugate eigenvalues";
          output Real ku[size(c0_in,1)] "Input gain";
          protected
          Real c0[size(c0_in,1)];
          Real c1[size(c0_in,1)];
          Real cr[size(cr_in,1)];
        algorithm
          // Get coefficients of low pass filter at f_cut
          (cr, c0, c1) :=coefficients.lowPass(cr_in, c0_in, c1_in, f_cut);

          // Transform coefficients in to root
          for i in 1:size(cr_in,1) loop
            r[i] :=-cr[i];
          end for;

          for i in 1:size(c0_in,1) loop
            a [i] :=-c1[i]/2;
            b [i] :=sqrt(c0[i] - a[i]*a[i]);
            ku[i] :=c0[i]/b[i];
          end for;

          annotation (Documentation(info="<html>

<p>
The goal is to implement the filter in the following form:
</p>

<pre>
  // real pole:
   der(x) = r*x - r*u
       y  = x

  // complex conjugate poles:
  der(x1) = a*x1 - b*x2 + ku*u;
  der(x2) = b*x1 + a*x2;
       y  = x2;

            ku = (a^2 + b^2)/b
</pre>
<p>
This representation has the following transfer function:
</p>
<pre>
// real pole:
    s*y = r*y - r*u
  or
    (s-r)*y = -r*u
  or
    y = -r/(s-r)*u

  comparing coefficients with
    y = cr/(s + cr)*u  ->  r = -cr      // r is the real eigenvalue

// complex conjugate poles
    s*x2 =  a*x2 + b*x1
    s*x1 = -b*x2 + a*x1 + ku*u
  or
    (s-a)*x2               = b*x1  ->  x2 = b/(s-a)*x1
    (s + b^2/(s-a) - a)*x1 = ku*u  ->  (s(s-a) + b^2 - a*(s-a))*x1  = ku*(s-a)*u
                                   ->  (s^2 - 2*a*s + a^2 + b^2)*x1 = ku*(s-a)*u
  or
    x1 = ku*(s-a)/(s^2 - 2*a*s + a^2 + b^2)*u
    x2 = b/(s-a)*ku*(s-a)/(s^2 - 2*a*s + a^2 + b^2)*u
       = b*ku/(s^2 - 2*a*s + a^2 + b^2)*u
    y  = x2

  comparing coefficients with
    y = c0/(s^2 + c1*s + c0)*u  ->  a  = -c1/2
                                    b  = sqrt(c0 - a^2)
                                    ku = c0/b
                                       = (a^2 + b^2)/b

  comparing with eigenvalue representation:
    (s - (a+jb))*(s - (a-jb)) = s^2 -2*a*s + a^2 + b^2
  shows that:
    a: real part of eigenvalue
    b: imaginary part of eigenvalue

  time -> infinity:
    y(s=0) = x2(s=0) = 1
             x1(s=0) = -ku*a/(a^2 + b^2)*u
                     = -(a/b)*u
</pre>

</html>"));
        end lowPass;

        function highPass
            "Return high pass filter roots as needed for block for given cut-off frequency"
          extends Modelica_Icons.Function;

          input Real cr_in[:] "Coefficients of real poles of base filter";
          input Real c0_in[:]
              "Coefficients of s^0 term of base filter if conjugate complex pole";
          input Real c1_in[size(c0_in,1)]
              "Coefficients of s^1 term of base filter if conjugate complex pole";
          input SIunits.Frequency f_cut "Cut-off frequency";

          output Real r[size(cr_in,1)] "Real eigenvalues";
          output Real a[size(c0_in,1)]
              "Real parts of complex conjugate eigenvalues";
          output Real b[size(c0_in,1)]
              "Imaginary parts of complex conjugate eigenvalues";
          output Real ku[size(c0_in,1)] "Gains of input terms";
          output Real k1[size(c0_in,1)] "Gains of y = k1*x1 + k2*x + u";
          output Real k2[size(c0_in,1)] "Gains of y = k1*x1 + k2*x + u";
          protected
          Real c0[size(c0_in,1)];
          Real c1[size(c0_in,1)];
          Real cr[size(cr_in,1)];
          Real ba2;
        algorithm
          // Get coefficients of high pass filter at f_cut
          (cr, c0, c1) :=coefficients.highPass(cr_in, c0_in, c1_in, f_cut);

          // Transform coefficients in to roots
          for i in 1:size(cr_in,1) loop
            r[i] :=-cr[i];
          end for;

          for i in 1:size(c0_in,1) loop
            a[i]  := -c1[i]/2;
            b[i]  := sqrt(c0[i] - a[i]*a[i]);
            ku[i] := c0[i]/b[i];
            k1[i] := 2*a[i]/ku[i];
            ba2   := (b[i]/a[i])^2;
            k2[i] := (1-ba2)/(1+ba2);
          end for;

          annotation (Documentation(info="<html>

<p>
The goal is to implement the filter in the following form:
</p>

<pre>
  // real pole:
   der(x) = r*x - r*u
       y  = -x + u

  // complex conjugate poles:
  der(x1) = a*x1 - b*x2 + ku*u;
  der(x2) = b*x1 + a*x2;
       y  = k1*x1 + k2*x2 + u;

            ku = (a^2 + b^2)/b
            k1 = 2*a/ku
            k2 = (a^2 - b^2) / (b*ku)
               = (a^2 - b^2) / (a^2 + b^2)
               = (1 - (b/a)^2) / (1 + (b/a)^2)

</pre>
<p>
This representation has the following transfer function:
</p>
<pre>
// real pole:
    s*x = r*x - r*u
  or
    (s-r)*x = -r*u   -> x = -r/(s-r)*u
  or
    y = r/(s-r)*u + (s-r)/(s-r)*u
      = (r+s-r)/(s-r)*u
      = s/(s-r)*u

  comparing coefficients with
    y = s/(s + cr)*u  ->  r = -cr      // r is the real eigenvalue

// complex conjugate poles
    s*x2 =  a*x2 + b*x1
    s*x1 = -b*x2 + a*x1 + ku*u
  or
    (s-a)*x2               = b*x1  ->  x2 = b/(s-a)*x1
    (s + b^2/(s-a) - a)*x1 = ku*u  ->  (s(s-a) + b^2 - a*(s-a))*x1  = ku*(s-a)*u
                                   ->  (s^2 - 2*a*s + a^2 + b^2)*x1 = ku*(s-a)*u
  or
    x1 = ku*(s-a)/(s^2 - 2*a*s + a^2 + b^2)*u
    x2 = b/(s-a)*ku*(s-a)/(s^2 - 2*a*s + a^2 + b^2)*u
       = b*ku/(s^2 - 2*a*s + a^2 + b^2)*u
    y  = k1*x1 + k2*x2 + u
       = (k1*ku*(s-a) + k2*b*ku +  s^2 - 2*a*s + a^2 + b^2) /
         (s^2 - 2*a*s + a^2 + b^2)*u
       = (s^2 + (k1*ku - 2*a)*s + k2*b*ku - k1*ku*a + a^2 + b^2) /
         (s^2 - 2*a*s + a^2 + b^2)*u
       = (s^2 + (2*a-2*a)*s + a^2 - b^2 - 2*a^2 + a^2 + b^2) /
         (s^2 - 2*a*s + a^2 + b^2)*u
       = s^2 / (s^2 - 2*a*s + a^2 + b^2)*u

  comparing coefficients with
    y = s^2/(s^2 + c1*s + c0)*u  ->  a = -c1/2
                                     b = sqrt(c0 - a^2)

  comparing with eigenvalue representation:
    (s - (a+jb))*(s - (a-jb)) = s^2 -2*a*s + a^2 + b^2
  shows that:
    a: real part of eigenvalue
    b: imaginary part of eigenvalue
</pre>

</html>"));
        end highPass;

        function bandPass
            "Return band pass filter roots as needed for block for given cut-off frequency"
          extends Modelica_Icons.Function;

          input Real cr_in[:] "Coefficients of real poles of base filter";
          input Real c0_in[:]
              "Coefficients of s^0 term of base filter if conjugate complex pole";
          input Real c1_in[size(c0_in,1)]
              "Coefficients of s^1 term of base filter if conjugate complex pole";
          input SIunits.Frequency f_min
              "Band of band pass filter is f_min (A=-3db) .. f_max (A=-3db)";
          input SIunits.Frequency f_max "Upper band frequency";

          output Real a[size(cr_in,1) + 2*size(c0_in,1)]
              "Real parts of complex conjugate eigenvalues";
          output Real b[size(cr_in,1) + 2*size(c0_in,1)]
              "Imaginary parts of complex conjugate eigenvalues";
          output Real ku[size(cr_in,1) + 2*size(c0_in,1)]
              "Gains of input terms";
          output Real k1[size(cr_in,1) + 2*size(c0_in,1)]
              "Gains of y = k1*x1 + k2*x";
          output Real k2[size(cr_in,1) + 2*size(c0_in,1)]
              "Gains of y = k1*x1 + k2*x";
          protected
          Real cr[0];
          Real c0[size(a,1)];
          Real c1[size(a,1)];
          Real cn;
          Real bb;
        algorithm
          // Get coefficients of band pass filter at f_cut
          (cr, c0, c1, cn) :=coefficients.bandPass(cr_in, c0_in, c1_in, f_min, f_max);

          // Transform coefficients in to roots
          for i in 1:size(a,1) loop
            a[i]  := -c1[i]/2;
            bb    := c0[i] - a[i]*a[i];
            assert(bb >= 0, "\nNot possible to use band pass filter, since transformation results in\n"+
                            "system that does not have conjugate complex poles.\n" +
                            "Try to use another analog filter for the band pass.\n");
            b[i]  := sqrt(bb);
            ku[i] := c0[i]/b[i];
            k1[i] := cn/ku[i];
            k2[i] := cn*a[i]/(b[i]*ku[i]);
          end for;

          annotation (Documentation(info="<html>

<p>
The goal is to implement the filter in the following form:
</p>

<pre>
  // complex conjugate poles:
  der(x1) = a*x1 - b*x2 + ku*u;
  der(x2) = b*x1 + a*x2;
       y  = k1*x1 + k2*x2;

            ku = (a^2 + b^2)/b
            k1 = cn/ku
            k2 = cn*a/(b*ku)
</pre>
<p>
This representation has the following transfer function:
</p>
<pre>
// complex conjugate poles
    s*x2 =  a*x2 + b*x1
    s*x1 = -b*x2 + a*x1 + ku*u
  or
    (s-a)*x2               = b*x1  ->  x2 = b/(s-a)*x1
    (s + b^2/(s-a) - a)*x1 = ku*u  ->  (s(s-a) + b^2 - a*(s-a))*x1  = ku*(s-a)*u
                                   ->  (s^2 - 2*a*s + a^2 + b^2)*x1 = ku*(s-a)*u
  or
    x1 = ku*(s-a)/(s^2 - 2*a*s + a^2 + b^2)*u
    x2 = b/(s-a)*ku*(s-a)/(s^2 - 2*a*s + a^2 + b^2)*u
       = b*ku/(s^2 - 2*a*s + a^2 + b^2)*u
    y  = k1*x1 + k2*x2
       = (k1*ku*(s-a) + k2*b*ku) / (s^2 - 2*a*s + a^2 + b^2)*u
       = (k1*ku*s + k2*b*ku - k1*ku*a) / (s^2 - 2*a*s + a^2 + b^2)*u
       = (cn*s + cn*a - cn*a) / (s^2 - 2*a*s + a^2 + b^2)*u
       = cn*s / (s^2 - 2*a*s + a^2 + b^2)*u

  comparing coefficients with
    y = cn*s / (s^2 + c1*s + c0)*u  ->  a = -c1/2
                                        b = sqrt(c0 - a^2)

  comparing with eigenvalue representation:
    (s - (a+jb))*(s - (a-jb)) = s^2 -2*a*s + a^2 + b^2
  shows that:
    a: real part of eigenvalue
    b: imaginary part of eigenvalue
</pre>

</html>"));
        end bandPass;

        function bandStop
            "Return band stop filter roots as needed for block for given cut-off frequency"
          extends Modelica_Icons.Function;

          input Real cr_in[:] "Coefficients of real poles of base filter";
          input Real c0_in[:]
              "Coefficients of s^0 term of base filter if conjugate complex pole";
          input Real c1_in[size(c0_in,1)]
              "Coefficients of s^1 term of base filter if conjugate complex pole";
          input SIunits.Frequency f_min
              "Band of band stop filter is f_min (A=-3db) .. f_max (A=-3db)";
          input SIunits.Frequency f_max "Upper band frequency";

          output Real a[size(cr_in,1) + 2*size(c0_in,1)]
              "Real parts of complex conjugate eigenvalues";
          output Real b[size(cr_in,1) + 2*size(c0_in,1)]
              "Imaginary parts of complex conjugate eigenvalues";
          output Real ku[size(cr_in,1) + 2*size(c0_in,1)]
              "Gains of input terms";
          output Real k1[size(cr_in,1) + 2*size(c0_in,1)]
              "Gains of y = k1*x1 + k2*x";
          output Real k2[size(cr_in,1) + 2*size(c0_in,1)]
              "Gains of y = k1*x1 + k2*x";
          protected
          Real cr[0];
          Real c0[size(a,1)];
          Real c1[size(a,1)];
          Real cn;
          Real bb;
        algorithm
          // Get coefficients of band stop filter at f_cut
          (cr, c0, c1) :=coefficients.bandStop(cr_in, c0_in, c1_in, f_min, f_max);

          // Transform coefficients in to roots
          for i in 1:size(a,1) loop
            a[i]  := -c1[i]/2;
            bb    := c0[i] - a[i]*a[i];
            assert(bb >= 0, "\nNot possible to use band stop filter, since transformation results in\n"+
                            "system that does not have conjugate complex poles.\n" +
                            "Try to use another analog filter for the band stop filter.\n");
            b[i]  := sqrt(bb);
            ku[i] := c0[i]/b[i];
            k1[i] := 2*a[i]/ku[i];
            k2[i] := (c0[i] + a[i]^2 - b[i]^2)/(b[i]*ku[i]);
          end for;

          annotation (Documentation(info="<html>

<p>
The goal is to implement the filter in the following form:
</p>

<pre>
  // complex conjugate poles:
  der(x1) = a*x1 - b*x2 + ku*u;
  der(x2) = b*x1 + a*x2;
       y  = k1*x1 + k2*x2 + u;

            ku = (a^2 + b^2)/b
            k1 = 2*a/ku
            k2 = (c0 + a^2 - b^2)/(b*ku)
</pre>
<p>
This representation has the following transfer function:
</p>
<pre>
// complex conjugate poles
    s*x2 =  a*x2 + b*x1
    s*x1 = -b*x2 + a*x1 + ku*u
  or
    (s-a)*x2               = b*x1  ->  x2 = b/(s-a)*x1
    (s + b^2/(s-a) - a)*x1 = ku*u  ->  (s(s-a) + b^2 - a*(s-a))*x1  = ku*(s-a)*u
                                   ->  (s^2 - 2*a*s + a^2 + b^2)*x1 = ku*(s-a)*u
  or
    x1 = ku*(s-a)/(s^2 - 2*a*s + a^2 + b^2)*u
    x2 = b/(s-a)*ku*(s-a)/(s^2 - 2*a*s + a^2 + b^2)*u
       = b*ku/(s^2 - 2*a*s + a^2 + b^2)*u
    y  = k1*x1 + k2*x2 + u
       = (k1*ku*(s-a) + k2*b*ku + s^2 - 2*a*s + a^2 + b^2) / (s^2 - 2*a*s + a^2 + b^2)*u
       = (s^2 + (k1*ku-2*a)*s + k2*b*ku - k1*ku*a + a^2 + b^2) / (s^2 - 2*a*s + a^2 + b^2)*u
       = (s^2 + c0 + a^2 - b^2 - 2*a^2 + a^2 + b^2) / (s^2 - 2*a*s + a^2 + b^2)*u
       = (s^2 + c0) / (s^2 - 2*a*s + a^2 + b^2)*u

  comparing coefficients with
    y = (s^2 + c0) / (s^2 + c1*s + c0)*u  ->  a = -c1/2
                                              b = sqrt(c0 - a^2)

  comparing with eigenvalue representation:
    (s - (a+jb))*(s - (a-jb)) = s^2 -2*a*s + a^2 + b^2
  shows that:
    a: real part of eigenvalue
    b: imaginary part of eigenvalue
</pre>

</html>"));
        end bandStop;
        end roots;

        package Utilities "Utility functions for filter computations"
            extends Modelica_Icons.InternalPackage;
          function BesselBaseCoefficients
            "Return coefficients of normalized low pass Bessel filter (= gain at cut-off frequency 1 rad/s is decreased 3dB)"
            extends Modelica_Icons.Function;

            import Modelica_Utilities.Streams;
            input Integer order "Order of filter in the range 1..41";
            output Real c1[mod(order, 2)]
              "[p] coefficients of Bessel denominator polynomials (a*p + 1)";
            output Real c2[integer(order/2),2]
              "[p^2, p] coefficients of Bessel denominator polynomials (b2*p^2 + b1*p + 1)";
            output Real alpha "Normalization factor";
          algorithm
            if order == 1 then
              alpha := 1.002377293007601;
              c1[1] := 0.9976283451109835;
            elseif order == 2 then
              alpha := 0.7356641785819585;
              c2[1, 1] := 0.6159132201783791;
              c2[1, 2] := 1.359315879600889;
            elseif order == 3 then
              alpha := 0.5704770156982642;
              c1[1] := 0.7548574865985343;
              c2[1, 1] := 0.4756958028827457;
              c2[1, 2] := 0.9980615136104388;
            elseif order == 4 then
              alpha := 0.4737978580281427;
              c2[1, 1] := 0.4873729247240677;
              c2[1, 2] := 1.337564170455762;
              c2[2, 1] := 0.3877724315741958;
              c2[2, 2] := 0.7730405590839861;
            elseif order == 5 then
              alpha := 0.4126226974763408;
              c1[1] := 0.6645723262620757;
              c2[1, 1] := 0.4115231900614016;
              c2[1, 2] := 1.138349926728708;
              c2[2, 1] := 0.3234938702877912;
              c2[2, 2] := 0.6205992985771313;
            elseif order == 6 then
              alpha := 0.3705098000736233;
              c2[1, 1] := 0.3874508649098960;
              c2[1, 2] := 1.219740879520741;
              c2[2, 1] := 0.3493298843155746;
              c2[2, 2] := 0.9670265529381365;
              c2[3, 1] := 0.2747419229514599;
              c2[3, 2] := 0.5122165075105700;
            elseif order == 7 then
              alpha := 0.3393452623586350;
              c1[1] := 0.5927147125821412;
              c2[1, 1] := 0.3383379423919174;
              c2[1, 2] := 1.092630816438030;
              c2[2, 1] := 0.3001025788696046;
              c2[2, 2] := 0.8289928256598656;
              c2[3, 1] := 0.2372867471539579;
              c2[3, 2] := 0.4325128641920154;
            elseif order == 8 then
              alpha := 0.3150267393795002;
              c2[1, 1] := 0.3151115975207653;
              c2[1, 2] := 1.109403015460190;
              c2[2, 1] := 0.2969344839572762;
              c2[2, 2] := 0.9737455812222699;
              c2[3, 1] := 0.2612545921889538;
              c2[3, 2] := 0.7190394712068573;
              c2[4, 1] := 0.2080523342974281;
              c2[4, 2] := 0.3721456473047434;
            elseif order == 9 then
              alpha := 0.2953310177184124;
              c1[1] := 0.5377196679501422;
              c2[1, 1] := 0.2824689124281034;
              c2[1, 2] := 1.022646191567475;
              c2[2, 1] := 0.2626824161383468;
              c2[2, 2] := 0.8695626454762596;
              c2[3, 1] := 0.2302781917677917;
              c2[3, 2] := 0.6309047553448520;
              c2[4, 1] := 0.1847991729757028;
              c2[4, 2] := 0.3251978031287202;
            elseif order == 10 then
              alpha := 0.2789426890619463;
              c2[1, 1] := 0.2640769908255582;
              c2[1, 2] := 1.019788132875305;
              c2[2, 1] := 0.2540802639216947;
              c2[2, 2] := 0.9377020417760623;
              c2[3, 1] := 0.2343577229427963;
              c2[3, 2] := 0.7802229808216112;
              c2[4, 1] := 0.2052193139338624;
              c2[4, 2] := 0.5594176813008133;
              c2[5, 1] := 0.1659546953748916;
              c2[5, 2] := 0.2878349616233292;
            elseif order == 11 then
              alpha := 0.2650227766037203;
              c1[1] := 0.4950265498954191;
              c2[1, 1] := 0.2411858478546218;
              c2[1, 2] := 0.9567800996387417;
              c2[2, 1] := 0.2296849355380925;
              c2[2, 2] := 0.8592523717113126;
              c2[3, 1] := 0.2107851705677406;
              c2[3, 2] := 0.7040216048898129;
              c2[4, 1] := 0.1846461385164021;
              c2[4, 2] := 0.5006729207276717;
              c2[5, 1] := 0.1504217970817433;
              c2[5, 2] := 0.2575070491320295;
            elseif order == 12 then
              alpha := 0.2530051198547209;
              c2[1, 1] := 0.2268294941204543;
              c2[1, 2] := 0.9473116570034053;
              c2[2, 1] := 0.2207657387793729;
              c2[2, 2] := 0.8933728946287606;
              c2[3, 1] := 0.2087600700376653;
              c2[3, 2] := 0.7886236252756229;
              c2[4, 1] := 0.1909959101492760;
              c2[4, 2] := 0.6389263649257017;
              c2[5, 1] := 0.1675208146048472;
              c2[5, 2] := 0.4517847275162215;
              c2[6, 1] := 0.1374257286372761;
              c2[6, 2] := 0.2324699157474680;
            elseif order == 13 then
              alpha := 0.2424910397561007;
              c1[1] := 0.4608848369928040;
              c2[1, 1] := 0.2099813050274780;
              c2[1, 2] := 0.8992478823790660;
              c2[2, 1] := 0.2027250423101359;
              c2[2, 2] := 0.8328117484224146;
              c2[3, 1] := 0.1907635894058731;
              c2[3, 2] := 0.7257379204691213;
              c2[4, 1] := 0.1742280397887686;
              c2[4, 2] := 0.5830640944868014;
              c2[5, 1] := 0.1530858190490478;
              c2[5, 2] := 0.4106192089751885;
              c2[6, 1] := 0.1264090712880446;
              c2[6, 2] := 0.2114980230156001;
            elseif order == 14 then
              alpha := 0.2331902368695848;
              c2[1, 1] := 0.1986162311411235;
              c2[1, 2] := 0.8876961808055535;
              c2[2, 1] := 0.1946683341271615;
              c2[2, 2] := 0.8500754229171967;
              c2[3, 1] := 0.1868331332895056;
              c2[3, 2] := 0.7764629313723603;
              c2[4, 1] := 0.1752118757862992;
              c2[4, 2] := 0.6699720402924552;
              c2[5, 1] := 0.1598906457908402;
              c2[5, 2] := 0.5348446712848934;
              c2[6, 1] := 0.1407810153019944;
              c2[6, 2] := 0.3755841316563539;
              c2[7, 1] := 0.1169627966707339;
              c2[7, 2] := 0.1937088226304455;
            elseif order == 15 then
              alpha := 0.2248854870552422;
              c1[1] := 0.4328492272335646;
              c2[1, 1] := 0.1857292591004588;
              c2[1, 2] := 0.8496337061962563;
              c2[2, 1] := 0.1808644178280136;
              c2[2, 2] := 0.8020517898136011;
              c2[3, 1] := 0.1728264404199081;
              c2[3, 2] := 0.7247449729331105;
              c2[4, 1] := 0.1616970125901954;
              c2[4, 2] := 0.6205369315943097;
              c2[5, 1] := 0.1475257264578426;
              c2[5, 2] := 0.4929612162355906;
              c2[6, 1] := 0.1301861023357119;
              c2[6, 2] := 0.3454770708040735;
              c2[7, 1] := 0.1087810777120188;
              c2[7, 2] := 0.1784526655428406;
            elseif order == 16 then
              alpha := 0.2174105053474761;
              c2[1, 1] := 0.1765637967473151;
              c2[1, 2] := 0.8377453068635511;
              c2[2, 1] := 0.1738525357503125;
              c2[2, 2] := 0.8102988957433199;
              c2[3, 1] := 0.1684627004613343;
              c2[3, 2] := 0.7563265923413258;
              c2[4, 1] := 0.1604519074815815;
              c2[4, 2] := 0.6776082294687619;
              c2[5, 1] := 0.1498828607802206;
              c2[5, 2] := 0.5766417034027680;
              c2[6, 1] := 0.1367764717792823;
              c2[6, 2] := 0.4563528264410489;
              c2[7, 1] := 0.1209810465419295;
              c2[7, 2] := 0.3193782657322374;
              c2[8, 1] := 0.1016312648007554;
              c2[8, 2] := 0.1652419227369036;
            elseif order == 17 then
              alpha := 0.2106355148193306;
              c1[1] := 0.4093223608497299;
              c2[1, 1] := 0.1664014345826274;
              c2[1, 2] := 0.8067173752345952;
              c2[2, 1] := 0.1629839591538256;
              c2[2, 2] := 0.7712924931447541;
              c2[3, 1] := 0.1573277802512491;
              c2[3, 2] := 0.7134213666303411;
              c2[4, 1] := 0.1494828185148637;
              c2[4, 2] := 0.6347841731714884;
              c2[5, 1] := 0.1394948812681826;
              c2[5, 2] := 0.5375594414619047;
              c2[6, 1] := 0.1273627583380806;
              c2[6, 2] := 0.4241608926375478;
              c2[7, 1] := 0.1129187258461290;
              c2[7, 2] := 0.2965752009703245;
              c2[8, 1] := 0.9533357359908857e-1;
              c2[8, 2] := 0.1537041700889585;
            elseif order == 18 then
              alpha := 0.2044575288651841;
              c2[1, 1] := 0.1588768571976356;
              c2[1, 2] := 0.7951914263212913;
              c2[2, 1] := 0.1569357024981854;
              c2[2, 2] := 0.7744529690772538;
              c2[3, 1] := 0.1530722206358810;
              c2[3, 2] := 0.7335304425992080;
              c2[4, 1] := 0.1473206710524167;
              c2[4, 2] := 0.6735038935387268;
              c2[5, 1] := 0.1397225420331520;
              c2[5, 2] := 0.5959151542621590;
              c2[6, 1] := 0.1303092459809849;
              c2[6, 2] := 0.5026483447894845;
              c2[7, 1] := 0.1190627367060072;
              c2[7, 2] := 0.3956893824587150;
              c2[8, 1] := 0.1058058030798994;
              c2[8, 2] := 0.2765091830730650;
              c2[9, 1] := 0.8974708108800873e-1;
              c2[9, 2] := 0.1435505288284833;
            elseif order == 19 then
              alpha := 0.1987936248083529;
              c1[1] := 0.3892259966869526;
              c2[1, 1] := 0.1506640012172225;
              c2[1, 2] := 0.7693121733774260;
              c2[2, 1] := 0.1481728062796673;
              c2[2, 2] := 0.7421133586741549;
              c2[3, 1] := 0.1440444668388838;
              c2[3, 2] := 0.6975075386214800;
              c2[4, 1] := 0.1383101628540374;
              c2[4, 2] := 0.6365464378910025;
              c2[5, 1] := 0.1310032283190998;
              c2[5, 2] := 0.5606211948462122;
              c2[6, 1] := 0.1221431166405330;
              c2[6, 2] := 0.4713530424221445;
              c2[7, 1] := 0.1116991161103884;
              c2[7, 2] := 0.3703717538617073;
              c2[8, 1] := 0.9948917351196349e-1;
              c2[8, 2] := 0.2587371155559744;
              c2[9, 1] := 0.8475989238107367e-1;
              c2[9, 2] := 0.1345537894555993;
            elseif order == 20 then
              alpha := 0.1935761760416219;
              c2[1, 1] := 0.1443871348337404;
              c2[1, 2] := 0.7584165598446141;
              c2[2, 1] := 0.1429501891353184;
              c2[2, 2] := 0.7423000962318863;
              c2[3, 1] := 0.1400877384920004;
              c2[3, 2] := 0.7104185332215555;
              c2[4, 1] := 0.1358210369491446;
              c2[4, 2] := 0.6634599783272630;
              c2[5, 1] := 0.1301773703034290;
              c2[5, 2] := 0.6024175491895959;
              c2[6, 1] := 0.1231826501439148;
              c2[6, 2] := 0.5285332736326852;
              c2[7, 1] := 0.1148465498575254;
              c2[7, 2] := 0.4431977385498628;
              c2[8, 1] := 0.1051289462376788;
              c2[8, 2] := 0.3477444062821162;
              c2[9, 1] := 0.9384622797485121e-1;
              c2[9, 2] := 0.2429038300327729;
              c2[10, 1] := 0.8028211612831444e-1;
              c2[10, 2] := 0.1265329974009533;
            elseif order == 21 then
              alpha := 0.1887494014766075;
              c1[1] := 0.3718070668941645;
              c2[1, 1] := 0.1376151928386445;
              c2[1, 2] := 0.7364290859445481;
              c2[2, 1] := 0.1357438914390695;
              c2[2, 2] := 0.7150167318935022;
              c2[3, 1] := 0.1326398453462415;
              c2[3, 2] := 0.6798001808470175;
              c2[4, 1] := 0.1283231214897678;
              c2[4, 2] := 0.6314663440439816;
              c2[5, 1] := 0.1228169159777534;
              c2[5, 2] := 0.5709353626166905;
              c2[6, 1] := 0.1161406100773184;
              c2[6, 2] := 0.4993087153571335;
              c2[7, 1] := 0.1082959649233524;
              c2[7, 2] := 0.4177766148584385;
              c2[8, 1] := 0.9923596957485723e-1;
              c2[8, 2] := 0.3274257287232124;
              c2[9, 1] := 0.8877776108724853e-1;
              c2[9, 2] := 0.2287218166767916;
              c2[10, 1] := 0.7624076527736326e-1;
              c2[10, 2] := 0.1193423971506988;
            elseif order == 22 then
              alpha := 0.1842668221199706;
              c2[1, 1] := 0.1323053462701543;
              c2[1, 2] := 0.7262446126765204;
              c2[2, 1] := 0.1312121721769772;
              c2[2, 2] := 0.7134286088450949;
              c2[3, 1] := 0.1290330911166814;
              c2[3, 2] := 0.6880287870435514;
              c2[4, 1] := 0.1257817990372067;
              c2[4, 2] := 0.6505015800059301;
              c2[5, 1] := 0.1214765261983008;
              c2[5, 2] := 0.6015107185211451;
              c2[6, 1] := 0.1161365140967959;
              c2[6, 2] := 0.5418983553698413;
              c2[7, 1] := 0.1097755171533100;
              c2[7, 2] := 0.4726370779831614;
              c2[8, 1] := 0.1023889478519956;
              c2[8, 2] := 0.3947439506537486;
              c2[9, 1] := 0.9392485861253800e-1;
              c2[9, 2] := 0.3090996703083202;
              c2[10, 1] := 0.8420273775456455e-1;
              c2[10, 2] := 0.2159561978556017;
              c2[11, 1] := 0.7257600023938262e-1;
              c2[11, 2] := 0.1128633732721116;
            elseif order == 23 then
              alpha := 0.1800893554453722;
              c1[1] := 0.3565232673929280;
              c2[1, 1] := 0.1266275171652706;
              c2[1, 2] := 0.7072778066734162;
              c2[2, 1] := 0.1251865227648538;
              c2[2, 2] := 0.6900676345785905;
              c2[3, 1] := 0.1227944815236645;
              c2[3, 2] := 0.6617011100576023;
              c2[4, 1] := 0.1194647013077667;
              c2[4, 2] := 0.6226432315773119;
              c2[5, 1] := 0.1152132989252356;
              c2[5, 2] := 0.5735222810625359;
              c2[6, 1] := 0.1100558598478487;
              c2[6, 2] := 0.5151027978024605;
              c2[7, 1] := 0.1040013558214886;
              c2[7, 2] := 0.4482410942032739;
              c2[8, 1] := 0.9704014176512626e-1;
              c2[8, 2] := 0.3738049984631116;
              c2[9, 1] := 0.8911683905758054e-1;
              c2[9, 2] := 0.2925028692588410;
              c2[10, 1] := 0.8005438265072295e-1;
              c2[10, 2] := 0.2044134600278901;
              c2[11, 1] := 0.6923832296800832e-1;
              c2[11, 2] := 0.1069984887283394;
            elseif order == 24 then
              alpha := 0.1761838665838427;
              c2[1, 1] := 0.1220804912720132;
              c2[1, 2] := 0.6978026874156063;
              c2[2, 1] := 0.1212296762358897;
              c2[2, 2] := 0.6874139794926736;
              c2[3, 1] := 0.1195328372961027;
              c2[3, 2] := 0.6667954259551859;
              c2[4, 1] := 0.1169990987333593;
              c2[4, 2] := 0.6362602049901176;
              c2[5, 1] := 0.1136409040480130;
              c2[5, 2] := 0.5962662188435553;
              c2[6, 1] := 0.1094722001757955;
              c2[6, 2] := 0.5474001634109253;
              c2[7, 1] := 0.1045052832229087;
              c2[7, 2] := 0.4903523180249535;
              c2[8, 1] := 0.9874509806025907e-1;
              c2[8, 2] := 0.4258751523524645;
              c2[9, 1] := 0.9217799943472177e-1;
              c2[9, 2] := 0.3547079765396403;
              c2[10, 1] := 0.8474633796250476e-1;
              c2[10, 2] := 0.2774145482392767;
              c2[11, 1] := 0.7627722381240495e-1;
              c2[11, 2] := 0.1939329108084139;
              c2[12, 1] := 0.6618645465422745e-1;
              c2[12, 2] := 0.1016670147947242;
            elseif order == 25 then
              alpha := 0.1725220521949266;
              c1[1] := 0.3429735385896000;
              c2[1, 1] := 0.1172525033170618;
              c2[1, 2] := 0.6812327932576614;
              c2[2, 1] := 0.1161194585333535;
              c2[2, 2] := 0.6671566071153211;
              c2[3, 1] := 0.1142375145794466;
              c2[3, 2] := 0.6439167855053158;
              c2[4, 1] := 0.1116157454252308;
              c2[4, 2] := 0.6118378416180135;
              c2[5, 1] := 0.1082654809459177;
              c2[5, 2] := 0.5713609763370088;
              c2[6, 1] := 0.1041985674230918;
              c2[6, 2] := 0.5230289949762722;
              c2[7, 1] := 0.9942439308123559e-1;
              c2[7, 2] := 0.4674627926041906;
              c2[8, 1] := 0.9394453593830893e-1;
              c2[8, 2] := 0.4053226688298811;
              c2[9, 1] := 0.8774221237222533e-1;
              c2[9, 2] := 0.3372372276379071;
              c2[10, 1] := 0.8075839512216483e-1;
              c2[10, 2] := 0.2636485508005428;
              c2[11, 1] := 0.7282483286646764e-1;
              c2[11, 2] := 0.1843801345273085;
              c2[12, 1] := 0.6338571166846652e-1;
              c2[12, 2] := 0.9680153764737715e-1;
            elseif order == 26 then
              alpha := 0.1690795702796737;
              c2[1, 1] := 0.1133168695796030;
              c2[1, 2] := 0.6724297955493932;
              c2[2, 1] := 0.1126417845769961;
              c2[2, 2] := 0.6638709519790540;
              c2[3, 1] := 0.1112948749545606;
              c2[3, 2] := 0.6468652038763624;
              c2[4, 1] := 0.1092823986944244;
              c2[4, 2] := 0.6216337070799265;
              c2[5, 1] := 0.1066130386697976;
              c2[5, 2] := 0.5885011413992190;
              c2[6, 1] := 0.1032969057045413;
              c2[6, 2] := 0.5478864278297548;
              c2[7, 1] := 0.9934388184210715e-1;
              c2[7, 2] := 0.5002885306054287;
              c2[8, 1] := 0.9476081523436283e-1;
              c2[8, 2] := 0.4462644847551711;
              c2[9, 1] := 0.8954648464575577e-1;
              c2[9, 2] := 0.3863930785049522;
              c2[10, 1] := 0.8368166847159917e-1;
              c2[10, 2] := 0.3212074592527143;
              c2[11, 1] := 0.7710664731701103e-1;
              c2[11, 2] := 0.2510470347119383;
              c2[12, 1] := 0.6965807988411425e-1;
              c2[12, 2] := 0.1756419294111342;
              c2[13, 1] := 0.6080674930548766e-1;
              c2[13, 2] := 0.9234535279274277e-1;
            elseif order == 27 then
              alpha := 0.1658353543067995;
              c1[1] := 0.3308543720638957;
              c2[1, 1] := 0.1091618578712746;
              c2[1, 2] := 0.6577977071169651;
              c2[2, 1] := 0.1082549561495043;
              c2[2, 2] := 0.6461121666520275;
              c2[3, 1] := 0.1067479247890451;
              c2[3, 2] := 0.6267937760991321;
              c2[4, 1] := 0.1046471079537577;
              c2[4, 2] := 0.6000750116745808;
              c2[5, 1] := 0.1019605976654259;
              c2[5, 2] := 0.5662734183049320;
              c2[6, 1] := 0.9869726954433709e-1;
              c2[6, 2] := 0.5257827234948534;
              c2[7, 1] := 0.9486520934132483e-1;
              c2[7, 2] := 0.4790595019077763;
              c2[8, 1] := 0.9046906518775348e-1;
              c2[8, 2] := 0.4266025862147336;
              c2[9, 1] := 0.8550529998276152e-1;
              c2[9, 2] := 0.3689188223512328;
              c2[10, 1] := 0.7995282239306020e-1;
              c2[10, 2] := 0.3064589322702932;
              c2[11, 1] := 0.7375174596252882e-1;
              c2[11, 2] := 0.2394754504667310;
              c2[12, 1] := 0.6674377263329041e-1;
              c2[12, 2] := 0.1676223546666024;
              c2[13, 1] := 0.5842458027529246e-1;
              c2[13, 2] := 0.8825044329219431e-1;
            elseif order == 28 then
              alpha := 0.1627710671942929;
              c2[1, 1] := 0.1057232656113488;
              c2[1, 2] := 0.6496161226860832;
              c2[2, 1] := 0.1051786825724864;
              c2[2, 2] := 0.6424661279909941;
              c2[3, 1] := 0.1040917964935006;
              c2[3, 2] := 0.6282470268918791;
              c2[4, 1] := 0.1024670101953951;
              c2[4, 2] := 0.6071189030701136;
              c2[5, 1] := 0.1003105109519892;
              c2[5, 2] := 0.5793175191747016;
              c2[6, 1] := 0.9762969425430802e-1;
              c2[6, 2] := 0.5451486608855443;
              c2[7, 1] := 0.9443223803058400e-1;
              c2[7, 2] := 0.5049796971628137;
              c2[8, 1] := 0.9072460982036488e-1;
              c2[8, 2] := 0.4592270546572523;
              c2[9, 1] := 0.8650956423253280e-1;
              c2[9, 2] := 0.4083368605952977;
              c2[10, 1] := 0.8178165740374893e-1;
              c2[10, 2] := 0.3527525188880655;
              c2[11, 1] := 0.7651838885868020e-1;
              c2[11, 2] := 0.2928534570013572;
              c2[12, 1] := 0.7066010532447490e-1;
              c2[12, 2] := 0.2288185204390681;
              c2[13, 1] := 0.6405358596145789e-1;
              c2[13, 2] := 0.1602396172588190;
              c2[14, 1] := 0.5621780070227172e-1;
              c2[14, 2] := 0.8447589564915071e-1;
            elseif order == 29 then
              alpha := 0.1598706626277596;
              c1[1] := 0.3199314513011623;
              c2[1, 1] := 0.1021101032532951;
              c2[1, 2] := 0.6365758882240111;
              c2[2, 1] := 0.1013729819392774;
              c2[2, 2] := 0.6267495975736321;
              c2[3, 1] := 0.1001476175660628;
              c2[3, 2] := 0.6104876178266819;
              c2[4, 1] := 0.9843854640428316e-1;
              c2[4, 2] := 0.5879603139195113;
              c2[5, 1] := 0.9625164534591696e-1;
              c2[5, 2] := 0.5594012291050210;
              c2[6, 1] := 0.9359356960417668e-1;
              c2[6, 2] := 0.5251016150410664;
              c2[7, 1] := 0.9047086748649986e-1;
              c2[7, 2] := 0.4854024475590397;
              c2[8, 1] := 0.8688856407189167e-1;
              c2[8, 2] := 0.4406826457109709;
              c2[9, 1] := 0.8284779224069856e-1;
              c2[9, 2] := 0.3913408089298914;
              c2[10, 1] := 0.7834154620997181e-1;
              c2[10, 2] := 0.3377643999400627;
              c2[11, 1] := 0.7334628941928766e-1;
              c2[11, 2] := 0.2802710651919946;
              c2[12, 1] := 0.6780290487362146e-1;
              c2[12, 2] := 0.2189770008083379;
              c2[13, 1] := 0.6156321231528423e-1;
              c2[13, 2] := 0.1534235999306070;
              c2[14, 1] := 0.5416797446761512e-1;
              c2[14, 2] := 0.8098664736760292e-1;
            elseif order == 30 then
              alpha := 0.1571200296252450;
              c2[1, 1] := 0.9908074847842124e-1;
              c2[1, 2] := 0.6289618807831557;
              c2[2, 1] := 0.9863509708328196e-1;
              c2[2, 2] := 0.6229164525571278;
              c2[3, 1] := 0.9774542692037148e-1;
              c2[3, 2] := 0.6108853364240036;
              c2[4, 1] := 0.9641490581986484e-1;
              c2[4, 2] := 0.5929869253412513;
              c2[5, 1] := 0.9464802912225441e-1;
              c2[5, 2] := 0.5693960175547550;
              c2[6, 1] := 0.9245027206218041e-1;
              c2[6, 2] := 0.5403402396359503;
              c2[7, 1] := 0.8982754584112941e-1;
              c2[7, 2] := 0.5060948065875106;
              c2[8, 1] := 0.8678535291732599e-1;
              c2[8, 2] := 0.4669749797983789;
              c2[9, 1] := 0.8332744242052199e-1;
              c2[9, 2] := 0.4233249626334694;
              c2[10, 1] := 0.7945356393775309e-1;
              c2[10, 2] := 0.3755006094498054;
              c2[11, 1] := 0.7515543969833788e-1;
              c2[11, 2] := 0.3238400339292700;
              c2[12, 1] := 0.7040879901685638e-1;
              c2[12, 2] := 0.2686072427439079;
              c2[13, 1] := 0.6515528854010540e-1;
              c2[13, 2] := 0.2098650589782619;
              c2[14, 1] := 0.5925168237177876e-1;
              c2[14, 2] := 0.1471138832654873;
              c2[15, 1] := 0.5225913954211672e-1;
              c2[15, 2] := 0.7775248839507864e-1;
            elseif order == 31 then
              alpha := 0.1545067022920929;
              c1[1] := 0.3100206996451866;
              c2[1, 1] := 0.9591020358831668e-1;
              c2[1, 2] := 0.6172474793293396;
              c2[2, 1] := 0.9530301275601203e-1;
              c2[2, 2] := 0.6088916323460413;
              c2[3, 1] := 0.9429332655402368e-1;
              c2[3, 2] := 0.5950511595503025;
              c2[4, 1] := 0.9288445429894548e-1;
              c2[4, 2] := 0.5758534119053522;
              c2[5, 1] := 0.9108073420087422e-1;
              c2[5, 2] := 0.5514734636081183;
              c2[6, 1] := 0.8888719137536870e-1;
              c2[6, 2] := 0.5221306199481831;
              c2[7, 1] := 0.8630901440239650e-1;
              c2[7, 2] := 0.4880834248148061;
              c2[8, 1] := 0.8335074993373294e-1;
              c2[8, 2] := 0.4496225358496770;
              c2[9, 1] := 0.8001502494376102e-1;
              c2[9, 2] := 0.4070602306679052;
              c2[10, 1] := 0.7630041338037624e-1;
              c2[10, 2] := 0.3607139804818122;
              c2[11, 1] := 0.7219760885744920e-1;
              c2[11, 2] := 0.3108783301229550;
              c2[12, 1] := 0.6768185077153345e-1;
              c2[12, 2] := 0.2577706252514497;
              c2[13, 1] := 0.6269571766328638e-1;
              c2[13, 2] := 0.2014081375889921;
              c2[14, 1] := 0.5710081766945065e-1;
              c2[14, 2] := 0.1412581515841926;
              c2[15, 1] := 0.5047740914807019e-1;
              c2[15, 2] := 0.7474725873250158e-1;
            elseif order == 32 then
              alpha := 0.1520196210848210;
              c2[1, 1] := 0.9322163554339406e-1;
              c2[1, 2] := 0.6101488690506050;
              c2[2, 1] := 0.9285233997694042e-1;
              c2[2, 2] := 0.6049832320721264;
              c2[3, 1] := 0.9211494244473163e-1;
              c2[3, 2] := 0.5946969295569034;
              c2[4, 1] := 0.9101176786042449e-1;
              c2[4, 2] := 0.5793791854364477;
              c2[5, 1] := 0.8954614071360517e-1;
              c2[5, 2] := 0.5591619969234026;
              c2[6, 1] := 0.8772216763680164e-1;
              c2[6, 2] := 0.5342177994699602;
              c2[7, 1] := 0.8554440426912734e-1;
              c2[7, 2] := 0.5047560942986598;
              c2[8, 1] := 0.8301735302045588e-1;
              c2[8, 2] := 0.4710187048140929;
              c2[9, 1] := 0.8014469519188161e-1;
              c2[9, 2] := 0.4332730387207936;
              c2[10, 1] := 0.7692807528893225e-1;
              c2[10, 2] := 0.3918021436411035;
              c2[11, 1] := 0.7336507157284898e-1;
              c2[11, 2] := 0.3468890521471250;
              c2[12, 1] := 0.6944555312763458e-1;
              c2[12, 2] := 0.2987898029050460;
              c2[13, 1] := 0.6514446669420571e-1;
              c2[13, 2] := 0.2476810747407199;
              c2[14, 1] := 0.6040544477732702e-1;
              c2[14, 2] := 0.1935412053397663;
              c2[15, 1] := 0.5509478650672775e-1;
              c2[15, 2] := 0.1358108994174911;
              c2[16, 1] := 0.4881064725720192e-1;
              c2[16, 2] := 0.7194819894416505e-1;
            elseif order == 33 then
              alpha := 0.1496489351138032;
              c1[1] := 0.3009752799176432;
              c2[1, 1] := 0.9041725460994505e-1;
              c2[1, 2] := 0.5995521047364046;
              c2[2, 1] := 0.8991117804113002e-1;
              c2[2, 2] := 0.5923764112099496;
              c2[3, 1] := 0.8906941547422532e-1;
              c2[3, 2] := 0.5804822013853129;
              c2[4, 1] := 0.8789442491445575e-1;
              c2[4, 2] := 0.5639663528946501;
              c2[5, 1] := 0.8638945831033775e-1;
              c2[5, 2] := 0.5429623519607796;
              c2[6, 1] := 0.8455834602616358e-1;
              c2[6, 2] := 0.5176379938389326;
              c2[7, 1] := 0.8240517431382334e-1;
              c2[7, 2] := 0.4881921474066189;
              c2[8, 1] := 0.7993380417355076e-1;
              c2[8, 2] := 0.4548502528082586;
              c2[9, 1] := 0.7714713890732801e-1;
              c2[9, 2] := 0.4178579388038483;
              c2[10, 1] := 0.7404596598181127e-1;
              c2[10, 2] := 0.3774715722484659;
              c2[11, 1] := 0.7062702339160462e-1;
              c2[11, 2] := 0.3339432938810453;
              c2[12, 1] := 0.6687952672391507e-1;
              c2[12, 2] := 0.2874950693388235;
              c2[13, 1] := 0.6277828912909767e-1;
              c2[13, 2] := 0.2382680702894708;
              c2[14, 1] := 0.5826808305383988e-1;
              c2[14, 2] := 0.1862073169968455;
              c2[15, 1] := 0.5321974125363517e-1;
              c2[15, 2] := 0.1307323751236313;
              c2[16, 1] := 0.4724820282032780e-1;
              c2[16, 2] := 0.6933542082177094e-1;
            elseif order == 34 then
              alpha := 0.1473858373968463;
              c2[1, 1] := 0.8801537152275983e-1;
              c2[1, 2] := 0.5929204288972172;
              c2[2, 1] := 0.8770594341007476e-1;
              c2[2, 2] := 0.5884653382247518;
              c2[3, 1] := 0.8708797598072095e-1;
              c2[3, 2] := 0.5795895850253119;
              c2[4, 1] := 0.8616320590689187e-1;
              c2[4, 2] := 0.5663615383647170;
              c2[5, 1] := 0.8493413175570858e-1;
              c2[5, 2] := 0.5488825092350877;
              c2[6, 1] := 0.8340387368687513e-1;
              c2[6, 2] := 0.5272851839324592;
              c2[7, 1] := 0.8157596213131521e-1;
              c2[7, 2] := 0.5017313864372913;
              c2[8, 1] := 0.7945402670834270e-1;
              c2[8, 2] := 0.4724089864574216;
              c2[9, 1] := 0.7704133559556429e-1;
              c2[9, 2] := 0.4395276256463053;
              c2[10, 1] := 0.7434009635219704e-1;
              c2[10, 2] := 0.4033126590648964;
              c2[11, 1] := 0.7135035113853376e-1;
              c2[11, 2] := 0.3639961488919042;
              c2[12, 1] := 0.6806813160738834e-1;
              c2[12, 2] := 0.3218025212900124;
              c2[13, 1] := 0.6448214312000864e-1;
              c2[13, 2] := 0.2769235521088158;
              c2[14, 1] := 0.6056719318430530e-1;
              c2[14, 2] := 0.2294693573271038;
              c2[15, 1] := 0.5626925196925040e-1;
              c2[15, 2] := 0.1793564218840015;
              c2[16, 1] := 0.5146352031547277e-1;
              c2[16, 2] := 0.1259877129326412;
              c2[17, 1] := 0.4578069074410591e-1;
              c2[17, 2] := 0.6689147319568768e-1;
            elseif order == 35 then
              alpha := 0.1452224267615486;
              c1[1] := 0.2926764667564367;
              c2[1, 1] := 0.8551731299267280e-1;
              c2[1, 2] := 0.5832758214629523;
              c2[2, 1] := 0.8509109732853060e-1;
              c2[2, 2] := 0.5770596582643844;
              c2[3, 1] := 0.8438201446671953e-1;
              c2[3, 2] := 0.5667497616665494;
              c2[4, 1] := 0.8339191981579831e-1;
              c2[4, 2] := 0.5524209816238369;
              c2[5, 1] := 0.8212328610083385e-1;
              c2[5, 2] := 0.5341766459916322;
              c2[6, 1] := 0.8057906332198853e-1;
              c2[6, 2] := 0.5121470053512750;
              c2[7, 1] := 0.7876247299954955e-1;
              c2[7, 2] := 0.4864870722254752;
              c2[8, 1] := 0.7667670879950268e-1;
              c2[8, 2] := 0.4573736721705665;
              c2[9, 1] := 0.7432449556218945e-1;
              c2[9, 2] := 0.4250013835198991;
              c2[10, 1] := 0.7170742126011575e-1;
              c2[10, 2] := 0.3895767735915445;
              c2[11, 1] := 0.6882488171701314e-1;
              c2[11, 2] := 0.3513097926737368;
              c2[12, 1] := 0.6567231746957568e-1;
              c2[12, 2] := 0.3103999917596611;
              c2[13, 1] := 0.6223804362223595e-1;
              c2[13, 2] := 0.2670123611280899;
              c2[14, 1] := 0.5849696460782910e-1;
              c2[14, 2] := 0.2212298104867592;
              c2[15, 1] := 0.5439628409499822e-1;
              c2[15, 2] := 0.1729443731341637;
              c2[16, 1] := 0.4981540179136920e-1;
              c2[16, 2] := 0.1215462157134930;
              c2[17, 1] := 0.4439981033536435e-1;
              c2[17, 2] := 0.6460098363520967e-1;
            elseif order == 36 then
              alpha := 0.1431515914458580;
              c2[1, 1] := 0.8335881847130301e-1;
              c2[1, 2] := 0.5770670512160201;
              c2[2, 1] := 0.8309698922852212e-1;
              c2[2, 2] := 0.5731929100172432;
              c2[3, 1] := 0.8257400347039723e-1;
              c2[3, 2] := 0.5654713811993058;
              c2[4, 1] := 0.8179117911600136e-1;
              c2[4, 2] := 0.5539556343603020;
              c2[5, 1] := 0.8075042173126963e-1;
              c2[5, 2] := 0.5387245649546684;
              c2[6, 1] := 0.7945413151258206e-1;
              c2[6, 2] := 0.5198817177723069;
              c2[7, 1] := 0.7790506514288866e-1;
              c2[7, 2] := 0.4975537629595409;
              c2[8, 1] := 0.7610613635339480e-1;
              c2[8, 2] := 0.4718884193866789;
              c2[9, 1] := 0.7406012816626425e-1;
              c2[9, 2] := 0.4430516443136726;
              c2[10, 1] := 0.7176927060205631e-1;
              c2[10, 2] := 0.4112237708115829;
              c2[11, 1] := 0.6923460172504251e-1;
              c2[11, 2] := 0.3765940116389730;
              c2[12, 1] := 0.6645495833489556e-1;
              c2[12, 2] := 0.3393522147815403;
              c2[13, 1] := 0.6342528888937094e-1;
              c2[13, 2] := 0.2996755899575573;
              c2[14, 1] := 0.6013361864949449e-1;
              c2[14, 2] := 0.2577053294053830;
              c2[15, 1] := 0.5655503081322404e-1;
              c2[15, 2] := 0.2135004731531631;
              c2[16, 1] := 0.5263798119559069e-1;
              c2[16, 2] := 0.1669320999865636;
              c2[17, 1] := 0.4826589873626196e-1;
              c2[17, 2] := 0.1173807590715484;
              c2[18, 1] := 0.4309819397289806e-1;
              c2[18, 2] := 0.6245036108880222e-1;
            elseif order == 37 then
              alpha := 0.1411669104782917;
              c1[1] := 0.2850271036215707;
              c2[1, 1] := 0.8111958235023328e-1;
              c2[1, 2] := 0.5682412610563970;
              c2[2, 1] := 0.8075727567979578e-1;
              c2[2, 2] := 0.5628142923227016;
              c2[3, 1] := 0.8015440554413301e-1;
              c2[3, 2] := 0.5538087696879930;
              c2[4, 1] := 0.7931239302677386e-1;
              c2[4, 2] := 0.5412833323304460;
              c2[5, 1] := 0.7823314328639347e-1;
              c2[5, 2] := 0.5253190555393968;
              c2[6, 1] := 0.7691895211595101e-1;
              c2[6, 2] := 0.5060183741977191;
              c2[7, 1] := 0.7537237072011853e-1;
              c2[7, 2] := 0.4835036020049034;
              c2[8, 1] := 0.7359601294804538e-1;
              c2[8, 2] := 0.4579149413954837;
              c2[9, 1] := 0.7159227884849299e-1;
              c2[9, 2] := 0.4294078049978829;
              c2[10, 1] := 0.6936295002846032e-1;
              c2[10, 2] := 0.3981491350382047;
              c2[11, 1] := 0.6690857785828917e-1;
              c2[11, 2] := 0.3643121502867948;
              c2[12, 1] := 0.6422751692085542e-1;
              c2[12, 2] := 0.3280684291406284;
              c2[13, 1] := 0.6131430866206096e-1;
              c2[13, 2] := 0.2895750997170303;
              c2[14, 1] := 0.5815677249570920e-1;
              c2[14, 2] := 0.2489521814805720;
              c2[15, 1] := 0.5473023527947980e-1;
              c2[15, 2] := 0.2062377435955363;
              c2[16, 1] := 0.5098441033167034e-1;
              c2[16, 2] := 0.1612849131645336;
              c2[17, 1] := 0.4680658811093562e-1;
              c2[17, 2] := 0.1134672937045305;
              c2[18, 1] := 0.4186928031694695e-1;
              c2[18, 2] := 0.6042754777339966e-1;
            elseif order == 38 then
              alpha := 0.1392625697140030;
              c2[1, 1] := 0.7916943373658329e-1;
              c2[1, 2] := 0.5624158631591745;
              c2[2, 1] := 0.7894592250257840e-1;
              c2[2, 2] := 0.5590219398777304;
              c2[3, 1] := 0.7849941672384930e-1;
              c2[3, 2] := 0.5522551628416841;
              c2[4, 1] := 0.7783093084875645e-1;
              c2[4, 2] := 0.5421574325808380;
              c2[5, 1] := 0.7694193770482690e-1;
              c2[5, 2] := 0.5287909941093643;
              c2[6, 1] := 0.7583430534712885e-1;
              c2[6, 2] := 0.5122376814029880;
              c2[7, 1] := 0.7451020436122948e-1;
              c2[7, 2] := 0.4925978555548549;
              c2[8, 1] := 0.7297197617673508e-1;
              c2[8, 2] := 0.4699889739625235;
              c2[9, 1] := 0.7122194706992953e-1;
              c2[9, 2] := 0.4445436860615774;
              c2[10, 1] := 0.6926216260386816e-1;
              c2[10, 2] := 0.4164072786327193;
              c2[11, 1] := 0.6709399961255503e-1;
              c2[11, 2] := 0.3857341621868851;
              c2[12, 1] := 0.6471757977022456e-1;
              c2[12, 2] := 0.3526828388476838;
              c2[13, 1] := 0.6213084287116965e-1;
              c2[13, 2] := 0.3174082831364342;
              c2[14, 1] := 0.5932799638550641e-1;
              c2[14, 2] := 0.2800495563550299;
              c2[15, 1] := 0.5629672408524944e-1;
              c2[15, 2] := 0.2407078154782509;
              c2[16, 1] := 0.5301264751544952e-1;
              c2[16, 2] := 0.1994026830553859;
              c2[17, 1] := 0.4942673259817896e-1;
              c2[17, 2] := 0.1559719194038917;
              c2[18, 1] := 0.4542996716979947e-1;
              c2[18, 2] := 0.1097844277878470;
              c2[19, 1] := 0.4070720755433961e-1;
              c2[19, 2] := 0.5852181110523043e-1;
            elseif order == 39 then
              alpha := 0.1374332900196804;
              c1[1] := 0.2779468246419593;
              c2[1, 1] := 0.7715084161825772e-1;
              c2[1, 2] := 0.5543001331300056;
              c2[2, 1] := 0.7684028301163326e-1;
              c2[2, 2] := 0.5495289890712267;
              c2[3, 1] := 0.7632343924866024e-1;
              c2[3, 2] := 0.5416083298429741;
              c2[4, 1] := 0.7560141319808483e-1;
              c2[4, 2] := 0.5305846713929198;
              c2[5, 1] := 0.7467569064745969e-1;
              c2[5, 2] := 0.5165224112570647;
              c2[6, 1] := 0.7354807648551346e-1;
              c2[6, 2] := 0.4995030679271456;
              c2[7, 1] := 0.7222060351121389e-1;
              c2[7, 2] := 0.4796242430956156;
              c2[8, 1] := 0.7069540462458585e-1;
              c2[8, 2] := 0.4569982440368368;
              c2[9, 1] := 0.6897453353492381e-1;
              c2[9, 2] := 0.4317502624832354;
              c2[10, 1] := 0.6705970959388781e-1;
              c2[10, 2] := 0.4040159353969854;
              c2[11, 1] := 0.6495194541066725e-1;
              c2[11, 2] := 0.3739379843169939;
              c2[12, 1] := 0.6265098412417610e-1;
              c2[12, 2] := 0.3416613843816217;
              c2[13, 1] := 0.6015440984955930e-1;
              c2[13, 2] := 0.3073260166338746;
              c2[14, 1] := 0.5745615876877304e-1;
              c2[14, 2] := 0.2710546723961181;
              c2[15, 1] := 0.5454383762391338e-1;
              c2[15, 2] := 0.2329316824061170;
              c2[16, 1] := 0.5139340231935751e-1;
              c2[16, 2] := 0.1929604256043231;
              c2[17, 1] := 0.4795705862458131e-1;
              c2[17, 2] := 0.1509655259246037;
              c2[18, 1] := 0.4412933231935506e-1;
              c2[18, 2] := 0.1063130748962878;
              c2[19, 1] := 0.3960672309405603e-1;
              c2[19, 2] := 0.5672356837211527e-1;
            elseif order == 40 then
              alpha := 0.1356742655825434;
              c2[1, 1] := 0.7538038374294594e-1;
              c2[1, 2] := 0.5488228264329617;
              c2[2, 1] := 0.7518806529402738e-1;
              c2[2, 2] := 0.5458297722483311;
              c2[3, 1] := 0.7480383050347119e-1;
              c2[3, 2] := 0.5398604576730540;
              c2[4, 1] := 0.7422847031965465e-1;
              c2[4, 2] := 0.5309482987446206;
              c2[5, 1] := 0.7346313704205006e-1;
              c2[5, 2] := 0.5191429845322307;
              c2[6, 1] := 0.7250930053201402e-1;
              c2[6, 2] := 0.5045099368431007;
              c2[7, 1] := 0.7136868456879621e-1;
              c2[7, 2] := 0.4871295553902607;
              c2[8, 1] := 0.7004317764946634e-1;
              c2[8, 2] := 0.4670962098860498;
              c2[9, 1] := 0.6853470921527828e-1;
              c2[9, 2] := 0.4445169164956202;
              c2[10, 1] := 0.6684507689945471e-1;
              c2[10, 2] := 0.4195095960479698;
              c2[11, 1] := 0.6497570123412630e-1;
              c2[11, 2] := 0.3922007419030645;
              c2[12, 1] := 0.6292726794917847e-1;
              c2[12, 2] := 0.3627221993494397;
              c2[13, 1] := 0.6069918741663154e-1;
              c2[13, 2] := 0.3312065181294388;
              c2[14, 1] := 0.5828873983769410e-1;
              c2[14, 2] := 0.2977798532686911;
              c2[15, 1] := 0.5568964389813015e-1;
              c2[15, 2] := 0.2625503293999835;
              c2[16, 1] := 0.5288947816690705e-1;
              c2[16, 2] := 0.2255872486520188;
              c2[17, 1] := 0.4986456327645859e-1;
              c2[17, 2] := 0.1868796731919594;
              c2[18, 1] := 0.4656832613054458e-1;
              c2[18, 2] := 0.1462410193532463;
              c2[19, 1] := 0.4289867647614935e-1;
              c2[19, 2] := 0.1030361558710747;
              c2[20, 1] := 0.3856310684054106e-1;
              c2[20, 2] := 0.5502423832293889e-1;
            elseif order == 41 then
              alpha := 0.1339811106984253;
              c1[1] := 0.2713685065531391;
              c2[1, 1] := 0.7355140275160984e-1;
              c2[1, 2] := 0.5413274778282860;
              c2[2, 1] := 0.7328319082267173e-1;
              c2[2, 2] := 0.5371064088294270;
              c2[3, 1] := 0.7283676160772547e-1;
              c2[3, 2] := 0.5300963437270770;
              c2[4, 1] := 0.7221298133014343e-1;
              c2[4, 2] := 0.5203345998371490;
              c2[5, 1] := 0.7141302173623395e-1;
              c2[5, 2] := 0.5078728971879841;
              c2[6, 1] := 0.7043831559982149e-1;
              c2[6, 2] := 0.4927768111819803;
              c2[7, 1] := 0.6929049381827268e-1;
              c2[7, 2] := 0.4751250308594139;
              c2[8, 1] := 0.6797129849758392e-1;
              c2[8, 2] := 0.4550083840638406;
              c2[9, 1] := 0.6648246325101609e-1;
              c2[9, 2] := 0.4325285673076087;
              c2[10, 1] := 0.6482554675958526e-1;
              c2[10, 2] := 0.4077964789091151;
              c2[11, 1] := 0.6300169683004558e-1;
              c2[11, 2] := 0.3809299858742483;
              c2[12, 1] := 0.6101130648543355e-1;
              c2[12, 2] := 0.3520508315700898;
              c2[13, 1] := 0.5885349417435808e-1;
              c2[13, 2] := 0.3212801560701271;
              c2[14, 1] := 0.5652528148656809e-1;
              c2[14, 2] := 0.2887316252774887;
              c2[15, 1] := 0.5402021575818373e-1;
              c2[15, 2] := 0.2545001287790888;
              c2[16, 1] := 0.5132588802608274e-1;
              c2[16, 2] := 0.2186415296842951;
              c2[17, 1] := 0.4841900639702602e-1;
              c2[17, 2] := 0.1811322622296060;
              c2[18, 1] := 0.4525419574485134e-1;
              c2[18, 2] := 0.1417762065404688;
              c2[19, 1] := 0.4173260173087802e-1;
              c2[19, 2] := 0.9993834530966510e-1;
              c2[20, 1] := 0.3757210572966463e-1;
              c2[20, 2] := 0.5341611499960143e-1;
            else
              Streams.error("Input argument order (= " + String(order) +
                ") of Bessel filter is not in the range 1..41");
            end if;

            annotation (Documentation(info="<html><p>The transfer function H(p) of a <i>n</i> 'th order Bessel filter is given by</p>
<blockquote><pre>
        Bn(0)
H(p) = -------
        Bn(p)
 </pre>
</blockquote>
<p>with the denominator polynomial</p>
<blockquote><pre>
         n             n  (2n - k)!       p^k
Bn(p) = sum c_k*p^k = sum ----------- * -------   (1)
        k=0           k=0 (n - k)!k!    2^(n-k)
</pre></blockquote>
<p>and the numerator</p>
<blockquote><pre>
               (2n)!     1
Bn(0) = c_0 = ------- * ---- .                    (2)
                n!      2^n
 </pre></blockquote>
<p>Although the coefficients c_k are integer numbers, it is not advisable to use the
polynomials in an unfactorized form because the coefficients are fast growing with order
n (c_0 is approximately 0.3e24 and 0.8e59 for order n=20 and order n=40
respectively).</p>

<p>Therefore, the polynomial Bn(p) is factorized to first and second order polynomials with
real coefficients corresponding to zeros and poles representation that is used in this library.</p>

<p>The function returns the coefficients which resulted from factorization of the normalized transfer function</p>
<blockquote><pre>
H'(p') = H(p),  p' = p/w0
</pre></blockquote>
<p>as well as</p>
<blockquote><pre>
alpha = 1/w0
</pre></blockquote>
<p>the reciprocal of the cut of frequency w0 where the gain of the transfer function is
decreased 3dB.</p>

<p>Both, coefficients and cut off frequency were calculated symbolically and were eventually evaluated
with high precision calculation. The results were stored in this function as real
numbers.</p>

<h4>Calculation of normalized Bessel filter coefficients</h4>
<p>Equation</p>
<blockquote><pre>
abs(H(j*w0)) = abs(Bn(0)/Bn(j*w0)) = 10^(-3/20)
</pre></blockquote>
<p>which must be fulfilled for cut off frequency w = w0 leads to</p>
<blockquote><pre>
[Re(Bn(j*w0))]^2 + [Im(Bn(j*w0))]^2 - (Bn(0)^2)*10^(3/10) = 0
</pre></blockquote>
<p>which has exactly one real solution w0 for each order n. This solutions of w0 are
calculated symbolically first and evaluated by using high precise values of the
coefficients c_k calculated by following (1) and (2).</p>

<p>With w0, the coefficients of the factorized polynomial can be computed by calculating the
zeros of the denominator polynomial</p>
<blockquote><pre>
        n
Bn(p) = sum w0^k*c_k*(p/w0)^k
        k=0
</pre></blockquote>
<p>of the normalized transfer function H'(p'). There exist n/2 of conjugate complex
pairs of zeros (beta +-j*gamma) if n is even and one additional real zero (alpha) if n is
odd. Finally, the coefficients a, b1_k, b2_k of the polynomials</p>
<blockquote><pre> a*p + 1,  n is odd </pre></blockquote>
<p>and</p>
<blockquote><pre>
b2_k*p^2 + b1_k*p + 1,   k = 1,... div(n,2)
</pre></blockquote>
<p>results from</p>
<blockquote><pre>
a = -1/alpha
</pre></blockquote>
<p>and</p>
<blockquote><pre>
b2_k = 1/(beta_k^2 + gamma_k^2) b1_k = -2*beta_k/(beta_k^2 + gamma_k^2)
</pre></blockquote>
</html>"));
          end BesselBaseCoefficients;

          function toHighestPowerOne
            "Transform filter to form with highest power of s equal 1"
            extends Modelica_Icons.Function;

            input Real den1[:]
              "[s] coefficients of polynomials (den1[i]*s + 1)";
            input Real den2[:,2]
              "[s^2, s] coefficients of polynomials (den2[i,1]*s^2 + den2[i,2]*s + 1)";
            output Real cr[size(den1, 1)]
              "[s^0] coefficients of polynomials cr[i]*(s+1/cr[i])";
            output Real c0[size(den2, 1)]
              "[s^0] coefficients of polynomials (s^2 + (den2[i,2]/den2[i,1])*s + (1/den2[i,1]))";
            output Real c1[size(den2, 1)]
              "[s^1] coefficients of polynomials (s^2 + (den2[i,2]/den2[i,1])*s + (1/den2[i,1]))";
          algorithm
            for i in 1:size(den1, 1) loop
              cr[i] := 1/den1[i];
            end for;

            for i in 1:size(den2, 1) loop
              c1[i] := den2[i, 2]/den2[i, 1];
              c0[i] := 1/den2[i, 1];
            end for;
          end toHighestPowerOne;

          function normalizationFactor
            "Compute correction factor of low pass filter such that amplitude at cut-off frequency is -3db (=10^(-3/20) = 0.70794...)"
            extends Modelica_Icons.Function;

            import Modelica_Utilities.Streams;

            input Real c1[:]
              "[p] coefficients of denominator polynomials (c1[i}*p + 1)";
            input Real c2[:,2]
              "[p^2, p] coefficients of denominator polynomials (c2[i,1]*p^2 + c2[i,2]*p + 1)";
            output Real alpha "Correction factor (replace p by alpha*p)";
          protected
            Real alpha_min;
            Real alpha_max;

            function normalizationResidue
              "Residue of correction factor computation"
              extends Modelica_Icons.Function;
              input Real c1[:]
                "[p] coefficients of denominator polynomials (c1[i]*p + 1)";
              input Real c2[:,2]
                "[p^2, p] coefficients of denominator polynomials (c2[i,1]*p^2 + c2[i,2]*p + 1)";
              input Real alpha;
              output Real residue;
            protected
              constant Real beta= 10^(-3/20)
                "Amplitude of -3db required, i.e., -3db = 20*log(beta)";
              Real cc1;
              Real cc2;
              Real p;
              Real alpha2=alpha*alpha;
              Real alpha4=alpha2*alpha2;
              Real A2=1.0;
            algorithm
              assert(size(c1,1) <= 1, "Internal error 2 (should not occur)");
              if size(c1, 1) == 1 then
                cc1 := c1[1]*c1[1];
                p := 1 + cc1*alpha2;
                A2 := A2*p;
              end if;
              for i in 1:size(c2, 1) loop
                cc1 := c2[i, 2]*c2[i, 2] - 2*c2[i, 1];
                cc2 := c2[i, 1]*c2[i, 1];
                p := 1 + cc1*alpha2 + cc2*alpha4;
                A2 := A2*p;
              end for;
              residue := 1/sqrt(A2) - beta;
            end normalizationResidue;

            function findInterval "Find interval for the root"
              extends Modelica_Icons.Function;
              input Real c1[:]
                "[p] coefficients of denominator polynomials (a*p + 1)";
              input Real c2[:,2]
                "[p^2, p] coefficients of denominator polynomials (b*p^2 + a*p + 1)";
              output Real alpha_min;
              output Real alpha_max;
            protected
              Real alpha = 1.0;
              Real residue;
            algorithm
              alpha_min :=0;
              residue := normalizationResidue(c1, c2, alpha);
              if residue < 0 then
                 alpha_max :=alpha;
              else
                 while residue >= 0 loop
                    alpha := 1.1*alpha;
                    residue := normalizationResidue(c1, c2, alpha);
                 end while;
                 alpha_max :=alpha;
              end if;
            end findInterval;

          function solveOneNonlinearEquation
              "Solve f(u) = 0; f(u_min) and f(u_max) must have different signs"
              extends Modelica_Icons.Function;
              import Modelica_Utilities.Streams.error;

            input Real c1[:]
                "[p] coefficients of denominator polynomials (c1[i]*p + 1)";
            input Real c2[:,2]
                "[p^2, p] coefficients of denominator polynomials (c2[i,1]*p^2 + c2[i,2]*p + 1)";
            input Real u_min "Lower bound of search interval";
            input Real u_max "Upper bound of search interval";
            input Real tolerance=100*Modelica_Constants.eps
                "Relative tolerance of solution u";
            output Real u "Value of independent variable so that f(u) = 0";

            protected
            constant Real eps=Modelica_Constants.eps "machine epsilon";
            Real a=u_min "Current best minimum interval value";
            Real b=u_max "Current best maximum interval value";
            Real c "Intermediate point a <= c <= b";
            Real d;
            Real e "b - a";
            Real m;
            Real s;
            Real p;
            Real q;
            Real r;
            Real tol;
            Real fa "= f(a)";
            Real fb "= f(b)";
            Real fc;
            Boolean found=false;
          algorithm
            // Check that f(u_min) and f(u_max) have different sign
            fa := normalizationResidue(c1,c2,u_min);
            fb := normalizationResidue(c1,c2,u_max);
            fc := fb;
            if fa > 0.0 and fb > 0.0 or fa < 0.0 and fb < 0.0 then
              error(
                "The arguments u_min and u_max to solveOneNonlinearEquation(..)\n" +
                "do not bracket the root of the single non-linear equation:\n" +
                "  u_min  = " + String(u_min) + "\n" + "  u_max  = " + String(u_max)
                 + "\n" + "  fa = f(u_min) = " + String(fa) + "\n" +
                "  fb = f(u_max) = " + String(fb) + "\n" +
                "fa and fb must have opposite sign which is not the case");
            end if;

            // Initialize variables
            c := a;
            fc := fa;
            e := b - a;
            d := e;

            // Search loop
            while not found loop
              if abs(fc) < abs(fb) then
                a := b;
                b := c;
                c := a;
                fa := fb;
                fb := fc;
                fc := fa;
              end if;

              tol := 2*eps*abs(b) + tolerance;
              m := (c - b)/2;

              if abs(m) <= tol or fb == 0.0 then
                // root found (interval is small enough)
                found := true;
                u := b;
              else
                // Determine if a bisection is needed
                if abs(e) < tol or abs(fa) <= abs(fb) then
                  e := m;
                  d := e;
                else
                  s := fb/fa;
                  if a == c then
                    // linear interpolation
                    p := 2*m*s;
                    q := 1 - s;
                  else
                    // inverse quadratic interpolation
                    q := fa/fc;
                    r := fb/fc;
                    p := s*(2*m*q*(q - r) - (b - a)*(r - 1));
                    q := (q - 1)*(r - 1)*(s - 1);
                  end if;

                  if p > 0 then
                    q := -q;
                  else
                    p := -p;
                  end if;

                  s := e;
                  e := d;
                  if 2*p < 3*m*q - abs(tol*q) and p < abs(0.5*s*q) then
                    // interpolation successful
                    d := p/q;
                  else
                    // use bi-section
                    e := m;
                    d := e;
                  end if;
                end if;

                // Best guess value is defined as "a"
                a := b;
                fa := fb;
                b := b + (if abs(d) > tol then d else if m > 0 then tol else -tol);
                fb := normalizationResidue(c1,c2,b);

                if fb > 0 and fc > 0 or fb < 0 and fc < 0 then
                  // initialize variables
                  c := a;
                  fc := fa;
                  e := b - a;
                  d := e;
                end if;
              end if;
            end while;

            annotation (Documentation(info="<html>

<p>
This function determines the solution of <b>one non-linear algebraic equation</b> \"y=f(u)\"
in <b>one unknown</b> \"u\" in a reliable way. It is one of the best numerical
algorithms for this purpose. As input, the nonlinear function f(u)
has to be given, as well as an interval u_min, u_max that
contains the solution, i.e., \"f(u_min)\" and \"f(u_max)\" must
have a different sign. If possible, a smaller interval is computed by
inverse quadratic interpolation (interpolating with a quadratic polynomial
through the last 3 points and computing the zero). If this fails,
bisection is used, which always reduces the interval by a factor of 2.
The inverse quadratic interpolation method has superlinear convergence.
This is roughly the same convergence rate as a globally convergent Newton
method, but without the need to compute derivatives of the non-linear
function. The solver function is a direct mapping of the Algol 60 procedure
\"zero\" to Modelica, from:
</p>

<dl>
<dt> Brent R.P.:</dt>
<dd> <b>Algorithms for Minimization without derivatives</b>.
     Prentice Hall, 1973, pp. 58-59.</dd>
</dl>

</html>"));
          end solveOneNonlinearEquation;

          algorithm
             // Find interval for alpha
             (alpha_min, alpha_max) :=findInterval(c1, c2);

             // Compute alpha, so that abs(G(p)) = -3db
             alpha :=solveOneNonlinearEquation(
              c1,
              c2,
              alpha_min,
              alpha_max);
          end normalizationFactor;

          encapsulated function bandPassAlpha "Return alpha for band pass"
            import Modelica_Icons;
            import Modelica_SIunits;
            import Modelica_Constants;
            extends Modelica_Icons.Function;

             input Real a "Coefficient of s^1";
             input Real b "Coefficient of s^0";
             input Modelica_SIunits.AngularVelocity w
              "Bandwidth angular frequency";
             output Real alpha "Alpha factor to build up band pass";

          protected
            Real alpha_min;
            Real alpha_max;
            Real z_min;
            Real z_max;
            Real z;

            function residue "Residue of non-linear equation"
              extends Modelica_Icons.Function;
              input Real a;
              input Real b;
              input Real w;
              input Real z;
              output Real res;
            algorithm
              res := z^2 + (a*w*z/(1+z))^2 - (2+b*w^2)*z + 1;
            end residue;

          function solveOneNonlinearEquation
              "Solve f(u) = 0; f(u_min) and f(u_max) must have different signs"
              extends Modelica_Icons.Function;
              import Modelica_Utilities.Streams.error;

            input Real aa;
            input Real bb;
            input Real ww;
            input Real u_min "Lower bound of search interval";
            input Real u_max "Upper bound of search interval";
            input Real tolerance=100*Modelica_Constants.eps
                "Relative tolerance of solution u";
            output Real u "Value of independent variable so that f(u) = 0";

            protected
            constant Real eps=Modelica_Constants.eps "machine epsilon";
            Real a=u_min "Current best minimum interval value";
            Real b=u_max "Current best maximum interval value";
            Real c "Intermediate point a <= c <= b";
            Real d;
            Real e "b - a";
            Real m;
            Real s;
            Real p;
            Real q;
            Real r;
            Real tol;
            Real fa "= f(a)";
            Real fb "= f(b)";
            Real fc;
            Boolean found=false;
          algorithm
            // Check that f(u_min) and f(u_max) have different sign
            fa := residue(aa,bb,ww,u_min);
            fb := residue(aa,bb,ww,u_max);
            fc := fb;
            if fa > 0.0 and fb > 0.0 or fa < 0.0 and fb < 0.0 then
              error(
                "The arguments u_min and u_max to solveOneNonlinearEquation(..)\n" +
                "do not bracket the root of the single non-linear equation:\n" +
                "  u_min  = " + String(u_min) + "\n" + "  u_max  = " + String(u_max)
                 + "\n" + "  fa = f(u_min) = " + String(fa) + "\n" +
                "  fb = f(u_max) = " + String(fb) + "\n" +
                "fa and fb must have opposite sign which is not the case");
            end if;

            // Initialize variables
            c := a;
            fc := fa;
            e := b - a;
            d := e;

            // Search loop
            while not found loop
              if abs(fc) < abs(fb) then
                a := b;
                b := c;
                c := a;
                fa := fb;
                fb := fc;
                fc := fa;
              end if;

              tol := 2*eps*abs(b) + tolerance;
              m := (c - b)/2;

              if abs(m) <= tol or fb == 0.0 then
                // root found (interval is small enough)
                found := true;
                u := b;
              else
                // Determine if a bisection is needed
                if abs(e) < tol or abs(fa) <= abs(fb) then
                  e := m;
                  d := e;
                else
                  s := fb/fa;
                  if a == c then
                    // linear interpolation
                    p := 2*m*s;
                    q := 1 - s;
                  else
                    // inverse quadratic interpolation
                    q := fa/fc;
                    r := fb/fc;
                    p := s*(2*m*q*(q - r) - (b - a)*(r - 1));
                    q := (q - 1)*(r - 1)*(s - 1);
                  end if;

                  if p > 0 then
                    q := -q;
                  else
                    p := -p;
                  end if;

                  s := e;
                  e := d;
                  if 2*p < 3*m*q - abs(tol*q) and p < abs(0.5*s*q) then
                    // interpolation successful
                    d := p/q;
                  else
                    // use bi-section
                    e := m;
                    d := e;
                  end if;
                end if;

                // Best guess value is defined as "a"
                a := b;
                fa := fb;
                b := b + (if abs(d) > tol then d else if m > 0 then tol else -tol);
                fb := residue(aa,bb,ww,b);

                if fb > 0 and fc > 0 or fb < 0 and fc < 0 then
                  // initialize variables
                  c := a;
                  fc := fa;
                  e := b - a;
                  d := e;
                end if;
              end if;
            end while;

            annotation (Documentation(info="<html>

<p>
This function determines the solution of <b>one non-linear algebraic equation</b> \"y=f(u)\"
in <b>one unknown</b> \"u\" in a reliable way. It is one of the best numerical
algorithms for this purpose. As input, the nonlinear function f(u)
has to be given, as well as an interval u_min, u_max that
contains the solution, i.e., \"f(u_min)\" and \"f(u_max)\" must
have a different sign. If possible, a smaller interval is computed by
inverse quadratic interpolation (interpolating with a quadratic polynomial
through the last 3 points and computing the zero). If this fails,
bisection is used, which always reduces the interval by a factor of 2.
The inverse quadratic interpolation method has superlinear convergence.
This is roughly the same convergence rate as a globally convergent Newton
method, but without the need to compute derivatives of the non-linear
function. The solver function is a direct mapping of the Algol 60 procedure
\"zero\" to Modelica, from:
</p>

<dl>
<dt> Brent R.P.:</dt>
<dd> <b>Algorithms for Minimization without derivatives</b>.
     Prentice Hall, 1973, pp. 58-59.</dd>
</dl>

</html>"));
          end solveOneNonlinearEquation;

          algorithm
            assert( a^2/4 - b <= 0,  "Band pass transformation cannot be computed");
            z :=solveOneNonlinearEquation(a, b, w, 0, 1);
            alpha := sqrt(z);

            annotation (Documentation(info="<html>
<p>
A band pass with bandwidth \"w\" is determined from a low pass
</p>

<pre>
  1/(p^2 + a*p + b)
</pre>

<p>
with the transformation
</p>

<pre>
  new(p) = (p + 1/p)/w
</pre>

<p>
This results in the following derivation:
</p>

<pre>
  1/(p^2 + a*p + b) -> 1/( (p+1/p)^2/w^2 + a*(p + 1/p)/w + b )
                     = 1 /( ( p^2 + 1/p^2 + 2)/w^2 + (p + 1/p)*a/w + b )
                     = w^2*p^2 / (p^4 + 2*p^2 + 1 + (p^3 + p)a*w + b*w^2*p^2)
                     = w^2*p^2 / (p^4 + a*w*p^3 + (2+b*w^2)*p^2 + a*w*p + 1)
</pre>

<p>
This 4th order transfer function shall be split in to two transfer functions of order 2 each
for numerical reasons. With the following formulation, the fourth order
polynomial can be represented (with the unknowns \"c\" and \"alpha\"):
</p>

<pre>
  g(p) = w^2*p^2 / ( (p*alpha)^2 + c*(p*alpha) + 1) * ( (p/alpha)^2 + c*(p/alpha) + 1)
       = w^2*p^2 / ( p^4 + c*(alpha + 1/alpha)*p^3 + (alpha^2 + 1/alpha^2 + c^2)*p^2
                                                   + c*(alpha + 1/alpha)*p + 1 )
</pre>

<p>
Comparison of coefficients:
</p>

<pre>
  c*(alpha + 1/alpha) = a*w           -> c = a*w / (alpha + 1/alpha)
  alpha^2 + 1/alpha^2 + c^2 = 2+b*w^2 -> equation to determine alpha

  alpha^4 + 1 + a^2*w^2*alpha^4/(1+alpha^2)^2 = (2+b*w^2)*alpha^2
    or z = alpha^2
  z^2 + a^2*w^2*z^2/(1+z)^2 - (2+b*w^2)*z + 1 = 0
</pre>

<p>
Therefore the last equation has to be solved for \"z\" (basically, this means to compute
a real zero of a fourth order polynomial):
</p>

<pre>
   solve: 0 = f(z)  = z^2 + a^2*w^2*z^2/(1+z)^2 - (2+b*w^2)*z + 1  for \"z\"
              f(0)  = 1  &gt; 0
              f(1)  = 1 + a^2*w^2/4 - (2+b*w^2) + 1
                    = (a^2/4 - b)*w^2  &lt; 0
                    // since b - a^2/4 > 0 requirement for complex conjugate poles
   -> 0 &lt; z &lt; 1
</pre>

<p>
This function computes the solution of this equation and returns \"alpha = sqrt(z)\";
</p>

</html>"));
          end bandPassAlpha;
        end Utilities;
      end Filter;
    end Internal;
    annotation (
      Documentation(info="<html>
<p>
This package contains basic <b>continuous</b> input/output blocks
described by differential equations.
</p>

<p>
All blocks of this package can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in
<a href=\"modelica://Modelica.Blocks.Types.Init\">Modelica.Blocks.Types.Init</a>:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Name</b></td>
      <td valign=\"top\"><b>Description</b></td></tr>

  <tr><td valign=\"top\"><b>Init.NoInit</b></td>
      <td valign=\"top\">no initialization (start values are used as guess values with fixed=false)</td></tr>

  <tr><td valign=\"top\"><b>Init.SteadyState</b></td>
      <td valign=\"top\">steady state initialization (derivatives of states are zero)</td></tr>

  <tr><td valign=\"top\"><b>Init.InitialState</b></td>
      <td valign=\"top\">Initialization with initial states</td></tr>

  <tr><td valign=\"top\"><b>Init.InitialOutput</b></td>
      <td valign=\"top\">Initialization with initial outputs (and steady state of the states if possible)</td></tr>
</table>

<p>
For backward compatibility reasons the default of all blocks is
<b>Init.NoInit</b>, with the exception of Integrator and LimIntegrator
where the default is <b>Init.InitialState</b> (this was the initialization
defined in version 2.2 of the Modelica standard library).
</p>

<p>
In many cases, the most useful initial condition is
<b>Init.SteadyState</b> because initial transients are then no longer
present. The drawback is that in combination with a non-linear
plant, non-linear algebraic equations occur that might be
difficult to solve if appropriate guess values for the
iteration variables are not provided (i.e., start values with fixed=false).
However, it is often already useful to just initialize
the linear blocks from the Continuous blocks library in SteadyState.
This is uncritical, because only linear algebraic equations occur.
If Init.NoInit is set, then the start values for the states are
interpreted as <b>guess</b> values and are propagated to the
states with fixed=<b>false</b>.
</p>

<p>
Note, initialization with Init.SteadyState is usually difficult
for a block that contains an integrator
(Integrator, LimIntegrator, PI, PID, LimPID).
This is due to the basic equation of an integrator:
</p>

<pre>
  <b>initial equation</b>
     <b>der</b>(y) = 0;   // Init.SteadyState
  <b>equation</b>
     <b>der</b>(y) = k*u;
</pre>

<p>
The steady state equation leads to the condition that the input to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is always defined by
Init.InitialState or Init.SteadyState initialization.
</p>

<p>
In such a case, <b>Init.NoInit</b> has to be selected for the integrator
and an additional initial equation has to be added to the system
to which the integrator is connected. E.g., useful initial conditions
for a 1-dim. rotational inertia controlled by a PI controller are that
<b>angle</b>, <b>speed</b>, and <b>acceleration</b> of the inertia are zero.
</p>

</html>"),   Icon(graphics={Line(
            origin={0.061,4.184},
            points={{81.939,36.056},{65.362,36.056},{14.39,-26.199},{-29.966,
                113.485},{-65.374,-61.217},{-78.061,-78.184}},
            color={95,95,95},
            smooth=Smooth.Bezier)}));
  end Continuous;

  package Discrete
    "Library of discrete input/output blocks with fixed sample period"

    extends Modelica_Icons.Package;

    block Sampler "Ideal sampling of continuous signals"
      extends Modelica_Blocks_Interfaces.DiscreteSISO;

    equation
      when {sampleTrigger, initial()} then
        y = u;
      end when;
      annotation (
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Ellipse(visible=true,
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{25.0,-10.0},{45.0,10.0}}),
          Line(visible=true,
            points={{-100.0,0.0},{-45.0,0.0}},
            color={0,0,127}),
          Line(visible=true,
            points={{45.0,0.0},{100.0,0.0}},
            color={0,0,127}),
          Line(visible=true,
            points={{-35.0,0.0},{30.0,35.0}},
            color={0,0,127}),
          Ellipse(visible=true,
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{-45.0,-10.0},{-25.0,10.0}})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Ellipse(
              extent={{-25,-10},{-45,10}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{45,-10},{25,10}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{-45,0}}, color={0,0,255}),
            Line(points={{45,0},{100,0}}, color={0,0,255}),
            Line(points={{-35,0},{30,35}}, color={0,0,255})}),
        Documentation(info="<HTML>
<p>
Samples the continues input signal with a sampling rate defined
via parameter <b>samplePeriod</b>.
</p>
</html>"));
    end Sampler;

    block ZeroOrderHold "Zero order hold of a sampled-data system"
      extends Modelica_Blocks_Interfaces.DiscreteSISO;
      output Real ySample(start=0, fixed=true);

    equation
      when {sampleTrigger, initial()} then
        ySample = u;
      end when;
      /* Define y=ySample with an infinitesimal delay to break potential
       algebraic loops if both the continuous and the discrete part have
       direct feedthrough
    */
      y = pre(ySample);
      annotation (
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Line(visible=true,
            points={{-78.0,-42.0},{-52.0,-42.0},{-52.0,0.0},{-26.0,0.0},{-26.0,24.0},{-6.0,24.0},{-6.0,64.0},{18.0,64.0},{18.0,20.0},{38.0,20.0},{38.0,0.0},{44.0,0.0},{44.0,0.0},{62.0,0.0}},
            color={0,0,127})}),
        Documentation(info="<HTML>
<p>
The output is identical to the sampled input signal at sample
time instants and holds the output at the value of the last
sample instant during the sample points.
</p>
</html>"));
    end ZeroOrderHold;

    block FirstOrderHold "First order hold of a sampled-data system"
      extends Modelica_Blocks_Interfaces.DiscreteSISO;
    protected
      SI.Time tSample;
      Real uSample;
      Real pre_uSample;
      Real c;
    initial equation
      pre(tSample) = time;
      pre(uSample) = u;
      pre(pre_uSample) = u;
      pre(c) = 0.0;
    equation
      when sampleTrigger then
        tSample = time;
        uSample = u;
        pre_uSample = pre(uSample);
        c = if firstTrigger then 0 else (uSample - pre_uSample)/samplePeriod;
      end when;
      /* Use pre_uSample and pre(c) to break potential algebraic loops by an
       infinitesimal delay if both the continuous and the discrete part
       have direct feedthrough.
    */
      y = pre_uSample + pre(c)*(time - tSample);
      annotation (
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Line(visible=true,
            points={{-79.0,-41.0},{-59.0,-33.0},{-40.0,1.0},{-20.0,9.0},{0.0,63.0},{21.0,20.0},{41.0,10.0},{60.0,20.0}},
            color={0,0,127}),
          Line(visible=true,
            points={{60.0,20.0},{81.0,10.0}},
            color={0,0,127})}),
        Documentation(info="<HTML>
<p>
The output signal is the extrapolation through the
values of the last two sampled input signals.
</p>
</html>"));
    end FirstOrderHold;

    block UnitDelay "Unit Delay Block"
      parameter Real y_start=0 "Initial value of output signal";
      extends Modelica_Blocks_Interfaces.DiscreteSISO;

    equation
      when sampleTrigger then
        y = pre(u);
      end when;

    initial equation
        y = y_start;
      annotation (
        Documentation(info="<html>
<p>
This block describes a unit delay:
</p>
<pre>
          1
     y = --- * u
          z
</pre>
<p>
that is, the output signal y is the input signal u of the
previous sample instant. Before the second sample instant,
the output y is identical to parameter yStart.
</p>

</html>"),     Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Line(visible=true,
          points={{-30.0,0.0},{30.0,0.0}},
          color={0,0,127}),
        Text(visible=true,
          lineColor={0,0,127},
          extent={{-90.0,10.0},{90.0,90.0}},
          textString="1"),
        Text(visible=true,
          lineColor={0,0,127},
          extent={{-90.0,-90.0},{90.0,-10.0}},
          textString="z")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Text(
              extent={{-160,10},{-140,-10}},
              textString="u",
              lineColor={0,0,255}),
            Text(
              extent={{115,10},{135,-10}},
              textString="y",
              lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Line(points={{40,0},{-40,0}}, color={0,0,0}),
            Text(
              extent={{-55,55},{55,5}},
              lineColor={0,0,0},
              textString="1"),
            Text(
              extent={{-55,-5},{55,-55}},
              lineColor={0,0,0},
              textString="z")}));
    end UnitDelay;

    block TransferFunction "Discrete Transfer Function block"
      parameter Real b[:]={1} "Numerator coefficients of transfer function.";
      parameter Real a[:]={1} "Denominator coefficients of transfer function.";
      extends Modelica_Blocks_Interfaces.DiscreteSISO;
      output Real x[size(a, 1) - 1](each start=0, each fixed=true)
        "State of transfer function from controller canonical form";
    protected
      parameter Integer nb=size(b, 1) "Size of Numerator of transfer function";
      parameter Integer na=size(a, 1)
        "Size of Denominator of transfer function";
      Real x1;
      Real xext[size(a, 1)];

    equation
      when sampleTrigger then
        /* State variables x are defined according to
       controller canonical form. */
        x1 = (u - a[2:size(a, 1)]*pre(x))/a[1];
        xext = vector([x1; pre(x)]);
        x = xext[1:size(x, 1)];
        y = vector([zeros(na - nb, 1); b])*xext;
      end when;
      /* This is a non-sampled equation and above there are two separate
       when-clauses. This breaks feedback loops without direct terms,
       since in that case y will be independent of x1 (and only dependent
       on pre(x)).
    */
      /* Corresponding (simpler) version using when-semantics of Modelica 1.3:
   equation
     when sampleTrigger then
      [x; xn] = [x1; pre(x)];
      [u] = transpose([a])*[x1; pre(x)];
      [y] = transpose([zeros(na - nb, 1); b])*[x1; pre(x)];
     end when;
*/
      annotation (
        Documentation(info="<html>
<p>The <b>discrete transfer function</b> block defines the
transfer function between the input signal u and the output
signal y. The numerator has the order nb-1, the denominator
has the order na-1.</p>
<pre>
          b(1)*z^(nb-1) + b(2)*z^(nb-2) + ... + b(nb)
   y(z) = -------------------------------------------- * u(z)
          a(1)*z^(na-1) + a(2)*z^(na-2) + ... + a(na)
</pre>
<p>State variables <b>x</b> are defined according to
<b>controller canonical</b> form. Initial values of the
states can be set as start values of <b>x</b>.</p>
<p>Example:</p>
<pre>     Blocks.Discrete.TransferFunction g(b = {2,4}, a = {1,3});
</pre>
<p>results in the following transfer function:</p>
<pre>        2*z + 4
   y = --------- * u
         z + 3
</pre>

</html>",   revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>November 15, 2000</i>
    by <a href=\"http://www.dynasim.se\">Hans Olsson</a>:<br>
    Converted to when-semantics of Modelica 1.4 with special
    care to avoid unnecessary algebraic loops.</li>
<li><i>June 18, 2000</i>
    by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
    Realized based on a corresponding model of Dieter Moormann
    and Hilding Elmqvist.</li>
</ul>
</html>"),
        Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Line(visible=true,
          points={{82.0,0.0},{-84.0,0.0}},
          color={0,0,127}),
        Text(visible=true,
          lineColor={0,0,127},
          extent={{-92.0,12.0},{86.0,92.0}},
          textString="b(z)"),
        Text(visible=true,
          lineColor={0,0,127},
          extent={{-90.0,-90.0},{90.0,-12.0}},
          textString="a(z)")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(
              points={{40,0},{-44,0}},
              color={0,0,0},
              thickness=0.5),
            Text(
              extent={{-54,54},{54,4}},
              lineColor={0,0,0},
              textString="b(z)"),
            Text(
              extent={{-54,-6},{56,-56}},
              lineColor={0,0,0},
              textString="a(z)"),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}));
    end TransferFunction;

    block StateSpace "Discrete State Space block"
      parameter Real A[:, size(A, 1)]=[1, 0; 0, 1]
        "Matrix A of state space model";
      parameter Real B[size(A, 1), :]=[1; 1] "Matrix B of state space model";
      parameter Real C[:, size(A, 1)]=[1, 1] "Matrix C of state space model";
      parameter Real D[size(C, 1), size(B, 2)]=zeros(size(C, 1), size(B, 2))
        "Matrix D of state space model";

      extends Modelica_Blocks_Interfaces.DiscreteMIMO(
                                      final nin=size(B, 2), final nout=size(C, 1));
      output Real x[size(A, 1)] "State vector";

    equation
      when sampleTrigger then
        x = A*pre(x) + B*u;
        y = C*pre(x) + D*u;
      end when;
      annotation (
        Documentation(info="<html>
<p>
The <b>discrete state space</b> block defines the relation
between the input u=inPort.signal and the output
y=outPort.signal in state space form:
</p>
<pre>
    x = A * pre(x) + B * u
    y = C * pre(x) + D * u
</pre>
<p>
where pre(x) is the value of the discrete state x at
the previous sample time instant.
The input is a vector of length nu, the output is a vector
of length ny and nx is the number of states. Accordingly
</p>
<pre>
        A has the dimension: A(nx,nx),
        B has the dimension: B(nx,nu),
        C has the dimension: C(ny,nx),
        D has the dimension: D(ny,nu)
</pre>
<p>
Example:
</p>
<pre>
     parameter: A = [0.12, 2;3, 1.5]
     parameter: B = [2, 7;3, 1]
     parameter: C = [0.1, 2]
     parameter: D = zeros(ny,nu)

results in the following equations:
  [x[1]]   [0.12  2.00] [pre(x[1])]   [2.0  7.0] [u[1]]
  [    ] = [          ]*[         ] + [        ]*[    ]
  [x[2]]   [3.00  1.50] [pre(x[2])]   [0.1  2.0] [u[2]]
                             [pre(x[1])]            [u[1]]
       y[1]   = [0.1  2.0] * [         ] + [0  0] * [    ]
                             [pre(x[2])]            [u[2]]
</pre>
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-90,15},{-15,90}},
              textString="A",
              lineColor={0,0,127}),
            Text(
              extent={{15,15},{90,90}},
              textString="B",
              lineColor={0,0,127}),
            Text(
              extent={{-52,28},{54,-20}},
              textString="z",
              lineColor={0,0,127}),
            Text(
              extent={{-90,-15},{-15,-90}},
              textString="C",
              lineColor={0,0,127}),
            Text(
              extent={{15,-15},{90,-90}},
              textString="D",
              lineColor={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Text(
              extent={{-54,50},{52,-10}},
              lineColor={0,0,0},
              textString="zx=Ax+Bu"),
            Text(
              extent={{-56,14},{54,-50}},
              lineColor={0,0,0},
              textString="  y=Cx+Du"),
            Line(points={{-102,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}));
    end StateSpace;

    block TriggeredSampler "Triggered sampling of continuous signals"
      extends Icons.DiscreteBlock;
      parameter Real y_start=0 "initial value of output signal";

      Modelica_Blocks_Interfaces.RealInput u
        "Connector with a Real input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y
        "Connector with a Real output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanInput trigger annotation (Placement(
            transformation(
            origin={0,-118},
            extent={{-20,-20},{20,20}},
            rotation=90)));
    equation
      when trigger then
        y = u;
      end when;
    initial equation
      y = y_start;
      annotation (
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Ellipse(visible=true,
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{25.0,-10.0},{45.0,10.0}}),
          Line(visible=true,
            points={{-100.0,0.0},{-45.0,0.0}},
            color={0,0,127}),
          Line(visible=true,
            points={{45.0,0.0},{100.0,0.0}},
            color={0,0,127}),
          Line(visible=true,
            points={{0.0,-100.0},{0.0,-26.0}},
            color={255,0,255}),
          Line(visible=true,
            points={{-35.0,0.0},{28.0,-48.0}},
            color={0,0,127}),
          Ellipse(visible=true,
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{-45.0,-10.0},{-25.0,10.0}})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Ellipse(
              extent={{-25,-10},{-45,10}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{45,-10},{25,10}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{-45,0}}, color={0,0,255}),
            Line(points={{45,0},{100,0}}, color={0,0,255}),
            Line(points={{-35,0},{28,-48}}, color={0,0,255}),
            Line(points={{0,-100},{0,-26}}, color={255,0,255})}),
        Documentation(info="<HTML>
<p>
Samples the continuous input signal whenever the trigger input
signal is rising (i.e., trigger changes from <b>false</b> to
<b>true</b>) and provides the sampled input signal as output.
Before the first sampling, the output signal is equal to
the initial value defined via parameter <b>y0</b>.
</p>
</html>"));
    end TriggeredSampler;

    block TriggeredMax
      "Compute maximum, absolute value of continuous signal at trigger instants"

      extends Icons.DiscreteBlock;
      Modelica_Blocks_Interfaces.RealInput u
        "Connector with a Real input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y
        "Connector with a Real output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanInput trigger annotation (Placement(
            transformation(
            origin={0,-118},
            extent={{-20,-20},{20,20}},
            rotation=90)));
    equation
      when trigger then
         y = max(pre(y), abs(u));
      end when;
    initial equation
      y = 0;
      annotation (
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Ellipse(visible=true,
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{25.0,-10.0},{45.0,10.0}}),
          Line(visible=true,
            points={{-100.0,0.0},{-45.0,0.0}},
            color={0,0,127}),
          Line(visible=true,
            points={{45.0,0.0},{100.0,0.0}},
            color={0,0,127}),
          Line(visible=true,
            points={{0.0,-100.0},{0.0,-26.0}},
            color={255,0,255}),
          Line(visible=true,
            points={{-35.0,0.0},{28.0,-48.0}},
            color={0,0,127}),
          Text(visible=true,
            extent={{-86.0,24.0},{82.0,82.0}},
            color={0,0,127},
            textString="max"),
          Ellipse(visible=true,
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{-45.0,-10.0},{-25.0,10.0}})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Ellipse(
              extent={{-25,-10},{-45,10}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{45,-10},{25,10}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{-45,0}}, color={0,0,255}),
            Line(points={{45,0},{100,0}}, color={0,0,255}),
            Line(points={{-35,0},{28,-48}}, color={0,0,255}),
            Line(points={{0,-100},{0,-26}}, color={255,0,255})}),
        Documentation(info="<HTML>
<p>
Samples the continuous input signal whenever the trigger input
signal is rising (i.e., trigger changes from <b>false</b> to
<b>true</b>). The maximum, absolute value of the input signal
at the sampling point is provided as output signal.
</p>
</html>"));
    end TriggeredMax;
    annotation (Documentation(info="<html>
<p>
This package contains <b>discrete control blocks</b>
with <b>fixed sample period</b>.
Every component of this package is structured in the following way:
</p>
<ol>
<li> A component has <b>continuous real</b> input and output signals.</li>
<li> The <b>input</b> signals are <b>sampled</b> by the given sample period
     defined via parameter <b>samplePeriod</b>.
     The first sample instant is defined by parameter <b>startTime</b>.
<li> The <b>output</b> signals are computed from the sampled input signals.
</ol>
<p>
A <b>sampled data system</b> may consist of components of package <b>Discrete</b>
and of every other purely <b>algebraic</b> input/output block, such
as the components of packages <b>Modelica.Blocks.Math</b>,
<b>Modelica.Blocks.Nonlinear</b> or <b>Modelica.Blocks.Sources</b>.
</p>

</html>",   revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New components TriggeredSampler and TriggeredMax added.</li>
<li><i>June 18, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized based on a corresponding library of Dieter Moormann and
       Hilding Elmqvist.</li>
</ul>
</html>"),   Icon(graphics={
          Line(points={{-88,0},{-45,0}}, color={95,95,95}),
          Ellipse(
            lineColor={95,95,95},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{-45,-10},{-25,10}}),
          Line(points={{-35,0},{24,52}}, color={95,95,95}),
          Ellipse(
            lineColor={95,95,95},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{25,-10},{45,10}}),
          Line(points={{45,0},{82,0}}, color={95,95,95})}));
  end Discrete;

  package Interaction
    "Library of user interaction blocks to input and to show variables in a diagram animation"
    extends Modelica_Icons.Package;

    package Show "Library of blocks to show variables in a diagram animation"
      extends Modelica_Icons.Package;

      block RealValue
        "Show Real value from numberPort or from number input field in diagram layer dynamically"
        parameter Boolean use_numberPort = true "= true, if numberPort enabled"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
        input Real number = 0.0
          "Number to visualize if use_numberPort=false (time varying)"
          annotation(Dialog(enable=not use_numberPort), HideResult=true);
        parameter Integer significantDigits(min=1) = 2
          "Number of significant digits to be shown";

        Modelica_Blocks_Interfaces.RealInput numberPort if use_numberPort
          "Number to be shown in diagram layer if use_numberPort = true"
          annotation (HideResult=true, Placement(transformation(extent={{-130,-15},
                  {-100,15}})));
         Modelica_Blocks_Interfaces.RealOutput showNumber;
      equation
        if use_numberPort then
           connect(numberPort, showNumber);
        else
           showNumber = number;
        end if;

        annotation (Icon(
            coordinateSystem(preserveAspectRatio=false,
              extent={{-100.0,-100.0},{100.0,100.0}},
              initialScale=0.1),
              graphics={
            Rectangle(visible=true,
              lineColor={0,0,127},
              fillColor={236,233,216},
              fillPattern=FillPattern.Solid,
              lineThickness=5.0,
              borderPattern=BorderPattern.Raised,
              extent={{-100.0,-40.0},{100.0,40.0}}),
            Text(visible=true,
              extent={{-94.0,-34.0},{96.0,34.0}},
              textString=DynamicSelect("0.0", String(showNumber, significantDigits=significantDigits))),
            Text(visible=not use_numberPort,
              extent={{-150.0,-70.0},{150.0,-50.0}},
              textString="%number")}), Documentation(info="<html>
<p>
This block visualizes a Real number in a diagram animation.
The number to be visualized can be defined in the following ways:
</p>

<ul>
<li> If useNumberPort = <b>true</b> (which is the default), a Real
     input is present and this input variable is shown.</li>

<li> If useNumberPort = <b>false</b> no input connector is present.
     Instead, a Real input field is activated in the parameter menu
     and the Real expression from this input menu is shown.</li>
</ul>

<p>
The two versions of the block are shown in the following image (in the right variant, the
name of the variable value that is displayed is also shown below the icon):
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Interaction/RealValue.png\"
     alt=\"RealValue.png\">
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.RealNetwork1\">Modelica.Blocks.Examples.RealNetwork1</a>.
</p>
</html>"));
      end RealValue;

      block IntegerValue
        "Show Integer value from numberPort or from number input field in diagram layer dynamically"
        parameter Boolean use_numberPort = true "= true, if numberPort enabled"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
        input Integer number=0
          "Number to visualize if use_numberPort=false (time varying)"
          annotation(Dialog(enable=not use_numberPort), HideResult=true);
        Modelica_Blocks_Interfaces.IntegerInput numberPort if use_numberPort
          "Number to be shown in diagram layer if use_numberPort = true"
          annotation (HideResult=true, Placement(transformation(extent={{-130,-15},
                  {-100,15}})));
         Modelica_Blocks_Interfaces.IntegerOutput showNumber;
      equation
        if use_numberPort then
           connect(numberPort, showNumber);
        else
           showNumber = number;
        end if;

        annotation (Icon(
            coordinateSystem(preserveAspectRatio=false,
              extent={{-100.0,-100.0},{100.0,100.0}},
              initialScale=0.1),
              graphics={
            Rectangle(visible=true,
              lineColor={0,0,127},
              fillColor={236,233,216},
              fillPattern=FillPattern.Solid,
              lineThickness=5.0,
              borderPattern=BorderPattern.Raised,
              extent={{-100.0,-40.0},{100.0,40.0}}),
            Text(visible=true,
              extent={{-94.0,-34.0},{96.0,34.0}},
              textString=DynamicSelect("0", String(showNumber))),
            Text(visible=not use_numberPort,
              extent={{-150.0,-70.0},{150.0,-50.0}},
              textString="%number")}), Documentation(info="<html>
<p>
This block visualizes an Integer number in a diagram animation.
The number to be visualized can be defined in the following ways:
</p>

<ul>
<li> If useNumberPort = <b>true</b> (which is the default), an Integer
     input is present and this input variable is shown.</li>

<li> If useNumberPort = <b>false</b> no input connector is present.
     Instead, an Integer input field is activated in the parameter menu
     and the Integer expression from this input menu is shown.</li>
</ul>

<p>
The two versions of the block are shown in the following image (in the right variant, the
name of the variable value that is displayed is also shown below the icon):
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Interaction/IntegerValue.png\"
     alt=\"IntegerValue.png\">
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.IntegerNetwork1\">Modelica.Blocks.Examples.IntegerNetwork1</a>.
</p>
</html>"));
      end IntegerValue;

      block BooleanValue
        "Show Boolean value from numberPort or from number input field in diagram layer dynamically"
        parameter Boolean use_activePort = true "= true, if activePort enabled"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
        input Boolean active=false
          "Boolean variable to visualize if use_activePort=false (time varying)"
          annotation(Dialog(enable=not use_activePort),HideResult=true);
        Modelica_Blocks_Interfaces.BooleanInput activePort if use_activePort
          "Boolean variable to be shown in diagram layer if use_activePort = true"
          annotation (HideResult=true, Placement(transformation(extent={{-130,-15},
                  {-100,15}})));

         Modelica_Blocks_Interfaces.BooleanOutput showActive;
      equation
        if use_activePort then
           connect(activePort, showActive);
        else
           showActive = active;
        end if;

        annotation (Icon(
            coordinateSystem(preserveAspectRatio=false,
              extent={{-100.0,-100.0},{100.0,100.0}},
              initialScale=0.1),
              graphics={
            Text(visible=not use_activePort,
              extent={{-188.0,-80.0},{62.0,-60.0}},
              textString="%active"),
            Ellipse(visible=true,
              lineColor={64,64,64},
              fillColor=DynamicSelect({192,192,192}, if showActive > 0.5 then {0,255,0} else {235,235,235}),
              pattern=LinePattern.None,
              fillPattern=FillPattern.Sphere,
              extent={{-100.0,-40.0},{-20.0,40.0}})}), Documentation(info="<html>
<p>
This block visualizes a Boolean variable in a diagram animation.
The Boolean variable to be visualized can be defined in the following ways:
</p>

<ul>
<li> If useActivePort = <b>true</b> (which is the default), a Boolean
     input is present and this input variable is shown.</li>

<li> If useActivePort = <b>false</b> no input connector is present.
     Instead, a Boolean input field is activated in the parameter menu
     and the Boolean expression from this input menu is shown.</li>
</ul>

<p>
If the Boolean variable is <b>false</b> the block is \"grey\", otherwise, it is \"green\".
The two versions of the block are shown in the following image (in the right variant, the
name of the variable value that is displayed is also shown below the icon):
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Interaction/BooleanValue.png\"
     alt=\"BooleanValue.png\">
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>
</html>"));
      end BooleanValue;
    end Show;
    annotation (Icon(graphics={Text(
            extent={{-98,-30},{96,34}},
            textString="0",
            lineColor={0,0,0})}));
  end Interaction;

  package Logical "Library of components with Boolean input and output signals"
    extends Modelica_Icons.Package;

    block And "Logical 'and': y = u1 and u2"
      extends Modelica_Blocks_Interfaces.partialBooleanSI2SO;
    equation
      y = u1 and u2;
      annotation (
        defaultComponentName="and1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="and")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if all inputs are <b>true</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end And;

    block Or "Logical 'or': y = u1 or u2"
      extends Modelica_Blocks_Interfaces.partialBooleanSI2SO;
    equation
      y = u1 or u2;
      annotation (
        defaultComponentName="or1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="or")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if at least one input is <b>true</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end Or;

    block Xor "Logical 'xor': y = u1 xor u2"
      extends Modelica_Blocks_Interfaces.partialBooleanSI2SO;
    equation
      y = not ((u1 and u2) or (not u1 and not u2));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="xor")}), Documentation(info="<html>
<p>
The output is <b>true</b> if exactly one input is <b>true</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end Xor;

    block Nor "Logical 'nor': y = not (u1 or u2)"
      extends Modelica_Blocks_Interfaces.partialBooleanSI2SO;
    equation
      y = not (u1 or u2);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="nor")}), Documentation(info="<html>
<p>
The output is <b>true</b> if none of the inputs is <b>true</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end Nor;

    block Nand "Logical 'nand': y = not (u1 and u2)"
      extends Modelica_Blocks_Interfaces.partialBooleanSI2SO;
    equation
      y = not (u1 and u2);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="nand")}), Documentation(info="<html>
<p>
The output is <b>true</b> if at least one input is <b>false</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end Nand;

    block Not "Logical 'not': y = not u"
      extends Modelica_Blocks_Interfaces.partialBooleanSISO;

    equation
      y = not u;
      annotation (
        defaultComponentName="not1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="not")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if the input is <b>false</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end Not;

    block Pre
      "Breaks algebraic loops by an infinitesimal small time delay (y = pre(u): event iteration continues until u = pre(u))"

      parameter Boolean pre_u_start=false
        "Start value of pre(u) at initial time";
      extends Modelica_Blocks_Interfaces.partialBooleanSISO;

    initial equation
      pre(u) = pre_u_start;
    equation
      y = pre(u);
      annotation (
        defaultComponentName="pre1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="pre")}),
        Documentation(info="<html>
<p>
This block delays the Boolean input by an infinitesimal small time delay and
therefore breaks algebraic loops. In a network of logical blocks, in every
\"closed connection loop\" at least one logical block must have a delay,
since algebraic systems of Boolean equations are not solvable.
</p>

<p>
The \"Pre\" block returns the value of the \"input\" signal from the
last \"event iteration\". The \"event iteration\" stops, once both
values are identical (u = pre(u)).
</p>
</html>"));
    end Pre;

    block Edge
      "Output y is true, if the input u has a rising edge (y = edge(u))"

      parameter Boolean pre_u_start=false
        "Start value of pre(u) at initial time";
      extends Modelica_Blocks_Interfaces.partialBooleanSISO;

    initial equation
      pre(u) = pre_u_start;
    equation
      y = edge(u);
      annotation (
        defaultComponentName="edge1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="edge")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if the Boolean input has a rising edge
from <b>false</b> to <b>true</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end Edge;

    block FallingEdge
      "Output y is true, if the input u has a falling edge (y = edge(not u))"

      parameter Boolean pre_u_start=false
        "Start value of pre(u) at initial time";
      extends Modelica_Blocks_Interfaces.partialBooleanSISO;

    protected
      Boolean not_u=not u;
    initial equation
      pre(not_u) = not pre_u_start;
    equation
      y = edge(not_u);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="falling")}), Documentation(info="<html>
<p>
The output is <b>true</b> if the Boolean input has a falling edge
from <b>true</b> to <b>false</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end FallingEdge;

    block Change
      "Output y is true, if the input u has a rising or falling edge (y = change(u))"

      parameter Boolean pre_u_start=false
        "Start value of pre(u) at initial time";
      extends Modelica_Blocks_Interfaces.partialBooleanSISO;

    initial equation
      pre(u) = pre_u_start;
    equation
      y = change(u);
      annotation (
        defaultComponentName="change1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="change")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if the Boolean input has either a rising edge
from <b>false</b> to <b>true</b> or a falling edge from
<b>true</b> to <b>false</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end Change;

    block GreaterThreshold
      "Output y is true, if input u is greater than threshold"
      extends Modelica_Blocks_Interfaces.partialBooleanThresholdComparison;
    equation
      y = u > threshold;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,-40},{60,40}},
              lineColor={0,0,0},
              textString=">")}), Documentation(info="<html>
<p>
The output is <b>true</b> if the Real input is greater than
parameter <b>threshold</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end GreaterThreshold;

    block GreaterEqualThreshold
      "Output y is true, if input u is greater or equal than threshold"

      extends Modelica_Blocks_Interfaces.partialBooleanThresholdComparison;
    equation
      y = u >= threshold;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,-40},{60,40}},
              lineColor={0,0,0},
              textString=">=")}), Documentation(info="<html>
<p>
The output is <b>true</b> if the Real input is greater than or equal to
parameter <b>threshold</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end GreaterEqualThreshold;

    block LessThreshold "Output y is true, if input u is less than threshold"

      extends Modelica_Blocks_Interfaces.partialBooleanThresholdComparison;
    equation
      y = u < threshold;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,-40},{60,40}},
              lineColor={0,0,0},
              textString="<")}), Documentation(info="<html>
<p>
The output is <b>true</b> if the Real input is less than
parameter <b>threshold</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end LessThreshold;

    block LessEqualThreshold
      "Output y is true, if input u is less or equal than threshold"
      extends Modelica_Blocks_Interfaces.partialBooleanThresholdComparison;
    equation
      y = u <= threshold;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,-40},{60,40}},
              lineColor={0,0,0},
              textString="<=")}), Documentation(info="<html>
<p>
The output is <b>true</b> if the Real input is less than or equal to
parameter <b>threshold</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
    end LessEqualThreshold;

    block Greater "Output y is true, if input u1 is greater than input u2"
      extends Modelica_Blocks_Interfaces.partialBooleanComparison;

    equation
      y = u1 > u2;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics={
            Ellipse(extent={{32,10},{52,-10}}, lineColor={0,0,127}),
            Line(points={{-100,-80},{42,-80},{42,0}}, color={0,0,127}),
            Line(
              points={{-54,22},{-8,2},{-54,-18}},
              color={0,0,0},
              smooth=Smooth.None,
              thickness=0.5)}), Documentation(info="<html>
<p>
The output is <b>true</b> if Real input u1 is greater than
Real input u2, otherwise the output is <b>false</b>.
</p>
</html>"));
    end Greater;

    block GreaterEqual
      "Output y is true, if input u1 is greater or equal than input u2"
      extends Modelica_Blocks_Interfaces.partialBooleanComparison;

    equation
      y = u1 >= u2;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics={
            Ellipse(extent={{32,10},{52,-10}}, lineColor={0,0,127}),
            Line(points={{-100,-80},{42,-80},{42,0}}, color={0,0,127}),
            Line(
              points={{-54,22},{-8,2},{-54,-18}},
              color={0,0,0},
              smooth=Smooth.None,
              thickness=0.5),
            Line(
              points={{-52,-36},{-6,-14}},
              color={0,0,0},
              thickness=0.5,
              smooth=Smooth.None)}), Documentation(info="<html>
<p>
The output is <b>true</b> if Real input u1 is greater than or equal to
Real input u2, otherwise the output is <b>false</b>.
</p>
</html>"));
    end GreaterEqual;

    block Less "Output y is true, if input u1 is less than input u2"
      extends Modelica_Blocks_Interfaces.partialBooleanComparison;

    equation
      y = u1 < u2;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics={
            Ellipse(extent={{32,10},{52,-10}}, lineColor={0,0,127}),
            Line(points={{-100,-80},{42,-80},{42,0}}, color={0,0,127}),
            Line(
              points={{-6,18},{-50,-2},{-6,-20}},
              color={0,0,0},
              thickness=0.5,
              smooth=Smooth.None)}), Documentation(info="<html>
<p>
The output is <b>true</b> if Real input u1 is less than
Real input u2, otherwise the output is <b>false</b>.
</p>
</html>"));
    end Less;

    block LessEqual
      "Output y is true, if input u1 is less or equal than input u2"
      extends Modelica_Blocks_Interfaces.partialBooleanComparison;

    equation
      y = u1 <= u2;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
                -100},{100,100}}), graphics={
            Ellipse(extent={{32,10},{52,-10}}, lineColor={0,0,127}),
            Line(points={{-100,-80},{42,-80},{42,0}}, color={0,0,127}),
            Line(
              points={{-10,20},{-54,0},{-10,-18}},
              color={0,0,0},
              thickness=0.5,
              smooth=Smooth.None),
            Line(
              points={{-54,-18},{-14,-34}},
              color={0,0,0},
              thickness=0.5,
              smooth=Smooth.None)}), Documentation(info="<html>
<p>
The output is <b>true</b> if Real input u1 is less than or equal to
Real input u2, otherwise the output is <b>false</b>.
</p>
</html>"));
    end LessEqual;

    block ZeroCrossing "Trigger zero crossing of input u"
      extends Modelica_Blocks_Interfaces.partialBooleanSO;
      Modelica_Blocks_Interfaces.RealInput u annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanInput enable
        "Zero input crossing is triggered if the enable input signal is true"
        annotation (Placement(transformation(
            origin={0,-120},
            extent={{-20,-20},{20,20}},
            rotation=90)));

    protected
      Boolean disable=not enable;
      Boolean u_pos;
    initial equation
      pre(u_pos) = false;
      pre(enable) = false;
      pre(disable) = not pre(enable);
    equation
      u_pos = enable and u >= 0;
      y = change(u_pos) and not edge(enable) and not edge(disable);
      annotation (Documentation(info="<HTML>
<p>
The output \"y\" is <b>true</b> at the
time instant when the input \"u\" becomes
zero, provided the input \"enable\" is
<b>true</b>. At all other time instants, the output \"y\" is <b>false</b>.
If the input \"u\" is zero at a time instant when the \"enable\"
input changes its value, then the output y is <b>false</b>.
</p>
<p>
Note, that in the plot window of a Modelica simulator, the output of
this block is usually identically to <b>false</b>, because the output
may only be <b>true</b> at an event instant, but not during
continuous integration. In order to check that this component is
actually working as expected, one should connect its output to, e.g.,
component <i>ModelicaAdditions.Blocks.Discrete.TriggeredSampler</i>.
</p>
</HTML>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Line(points={{-78,68},{-78,-80}}, color={192,192,192}),
            Polygon(
              points={{-78,90},{-86,68},{-70,68},{-78,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-88,0},{70,0}}, color={192,192,192}),
            Line(points={{-78,0},{-73.2,32.3},{-70,50.3},{-66.7,64.5},{-63.5,74.2},
                  {-60.3,79.3},{-57.1,79.6},{-53.9,75.3},{-50.7,67.1},{-46.6,52.2},
                  {-41,25.8},{-33,-13.9},{-28.2,-33.7},{-24.1,-45.9},{-20.1,-53.2},
                  {-16.1,-55.3},{-12.1,-52.5},{-8.1,-45.3},{-3.23,-32.1},{10.44,
                  13.7},{15.3,26.4},{20.1,34.8},{24.1,38},{28.9,37.2},{33.8,31.8},
                  {40.2,19.4},{53.1,-10.5},{59.5,-21.2},{65.1,-25.9},{70.7,-25.9},
                  {77.2,-20.5},{82,-13.8}}, color={192,192,192}, smooth=  Smooth.Bezier),
            Polygon(
              points={{92,0},{70,8},{70,-8},{92,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-36,-59},{-36,81}}, color={255,0,255}),
            Line(points={{6,-59},{6,81}}, color={255,0,255}),
            Line(points={{49,-59},{49,81}}, color={255,0,255}),
            Line(points={{-78,0},{70,0}}, color={255,0,255})}));
    end ZeroCrossing;

    block LogicalSwitch "Logical Switch"
      extends Modelica_Blocks_Interfaces.partialBooleanSI3SO;

    equation
      y = if u2 then u1 else u3;
      annotation (Documentation(info="<html>
<p>The LogicalSwitch switches, depending on the
Boolean u2 connector (the middle connector),
between the two possible input signals
u1 (upper connector) and u3 (lower connector).</p>
<p>If u2 is true, connector y is set equal to
u1, else it is set equal to u3.</p>
</html>"),   Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
              initialScale=0.1),
              graphics={
            Line(
              points={{12,0},{100,0}},
              color={255,0,255}),
            Line(
              points={{-100,0},{-40,0}},
              color={255,0,255}),
            Line(
              points={{-100,-80},{-40,-80},{-40,-80}},
              color={255,0,255}),
            Line(points={{-40,12},{-40,-10}}, color={255,0,255}),
            Line(points={{-100,80},{-40,80}}, color={255,0,255}),
            Line(
              points={{-40,80},{8,2}},
              color={255,0,255},
              thickness=1),
            Ellipse(visible=true,
              lineColor={0,0,127},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{2.0,-6.0},{18.0,8.0}})}));
    end LogicalSwitch;

    block Switch "Switch between two Real signals"
      extends Icons.PartialBooleanBlock;
      Modelica_Blocks_Interfaces.RealInput u1
        "Connector of first Real input signal" annotation (Placement(
            transformation(extent={{-140,60},{-100,100}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanInput u2
        "Connector of Boolean input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u3
        "Connector of second Real input signal" annotation (Placement(
            transformation(extent={{-140,-100},{-100,-60}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));

    equation
      y = if u2 then u1 else u3;
      annotation (
        defaultComponentName="switch1",
        Documentation(info="<html>
<p>The Logical.Switch switches, depending on the
logical connector u2 (the middle connector)
between the two possible input signals
u1 (upper connector) and u3 (lower connector).</p>
<p>If u2 is <b>true</b>, the output signal y is set equal to
u1, else it is set equal to u3.</p>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.1), graphics={
            Line(points={{12.0,0.0},{100.0,0.0}},
              color={0,0,127}),
            Line(points={{-100.0,0.0},{-40.0,0.0}},
              color={255,0,255}),
            Line(points={{-100.0,-80.0},{-40.0,-80.0},{-40.0,-80.0}},
              color={0,0,127}),
            Line(points={{-40.0,12.0},{-40.0,-12.0}},
              color={255,0,255}),
            Line(points={{-100.0,80.0},{-38.0,80.0}},
              color={0,0,127}),
            Line(points={{-38.0,80.0},{6.0,2.0}},
              color={0,0,127},
              thickness=1.0),
            Ellipse(lineColor={0,0,255},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{2.0,-8.0},{18.0,8.0}})}));
    end Switch;

    block Hysteresis "Transform Real to Boolean signal with Hysteresis"

      extends Icons.PartialBooleanBlock;
      parameter Real uLow(start=0) "if y=true and u<=uLow, switch to y=false";
      parameter Real uHigh(start=1) "if y=false and u>=uHigh, switch to y=true";
      parameter Boolean pre_y_start=false "Value of pre(y) at initial time";

      Modelica_Blocks_Interfaces.RealInput u annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanOutput y annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));

    initial equation
      pre(y) = pre_y_start;
    equation
      y = u > uHigh or pre(y) and u >= uLow;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-65,89},{-73,67},{-57,67},{-65,89}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-65,67},{-65,-81}},
              color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
              192,192}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{70,-80},{94,-100}},
                lineColor={160,160,164},
                textString="u"),Text(
                extent={{-65,93},{-12,75}},
                lineColor={160,160,164},
                textString="y"),Line(
                points={{-80,-70},{30,-70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-50,10},{80,10}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-50,10},{-50,-70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{30,10},{30,-70}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-10,-65},{0,-70},{-10,-75}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-10,15},{-20,10},{-10,5}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{-55,-20},{-50,-30},{-44,-20}},
                color={0,0,0},
                thickness=0.5),Line(
                points={{25,-30},{30,-19},{35,-30}},
                color={0,0,0},
                thickness=0.5),Text(
                extent={{-99,2},{-70,18}},
                lineColor={160,160,164},
                textString="true"),Text(
                extent={{-98,-87},{-66,-73}},
                lineColor={160,160,164},
                textString="false"),Text(
                extent={{19,-87},{44,-70}},
                lineColor={0,0,0},
                textString="uHigh"),Text(
                extent={{-63,-88},{-38,-71}},
                lineColor={0,0,0},
                textString="uLow"),Line(points={{-69,10},{-60,10}}, color={160,
              160,164})}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-29}}, color={192,192,192}),
            Polygon(
              points={{92,-29},{70,-21},{70,-37},{92,-29}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-79,-29},{84,-29}}, color={192,192,192}),
            Line(points={{-79,-29},{41,-29}}, color={0,0,0}),
            Line(points={{-15,-21},{1,-29},{-15,-36}}, color={0,0,0}),
            Line(points={{41,51},{41,-29}}, color={0,0,0}),
            Line(points={{33,3},{41,22},{50,3}}, color={0,0,0}),
            Line(points={{-49,51},{81,51}}, color={0,0,0}),
            Line(points={{-4,59},{-19,51},{-4,43}}, color={0,0,0}),
            Line(points={{-59,29},{-49,11},{-39,29}}, color={0,0,0}),
            Line(points={{-49,51},{-49,-29}}, color={0,0,0}),
            Text(
              extent={{-92,-49},{-9,-92}},
              lineColor={192,192,192},
              textString="%uLow"),
            Text(
              extent={{2,-49},{91,-92}},
              lineColor={192,192,192},
              textString="%uHigh"),
            Rectangle(extent={{-91,-49},{-8,-92}}, lineColor={192,192,192}),
            Line(points={{-49,-29},{-49,-49}}, color={192,192,192}),
            Rectangle(extent={{2,-49},{91,-92}}, lineColor={192,192,192}),
            Line(points={{41,-29},{41,-49}}, color={192,192,192})}),
        Documentation(info="<HTML>
<p>
This block transforms a <b>Real</b> input signal into a <b>Boolean</b>
output signal:
</p>
<ul>
<li> When the output was <b>false</b> and the input becomes
     <b>greater</b> than parameter <b>uHigh</b>, the output
     switches to <b>true</b>.</li>
<li> When the output was <b>true</b> and the input becomes
     <b>less</b> than parameter <b>uLow</b>, the output
     switches to <b>false</b>.</li>
</ul>
<p>
The start value of the output is defined via parameter
<b>pre_y_start</b> (= value of pre(y) at initial time).
The default value of this parameter is <b>false</b>.
</p>
</html>"));
    end Hysteresis;

    block OnOffController "On-off controller"
      extends Icons.PartialBooleanBlock;
      Modelica_Blocks_Interfaces.RealInput reference
        "Connector of Real input signal used as reference signal" annotation (
          Placement(transformation(extent={{-140,80},{-100,40}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u
        "Connector of Real input signal used as measurement signal" annotation (
         Placement(transformation(extent={{-140,-40},{-100,-80}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanOutput y
        "Connector of Real output signal used as actuator signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));

      parameter Real bandwidth(start=0.1) "Bandwidth around reference signal";
      parameter Boolean pre_y_start=false "Value of pre(y) at initial time";

    initial equation
      pre(y) = pre_y_start;
    equation
      y = pre(y) and (u < reference + bandwidth/2) or (u < reference - bandwidth/
        2);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}, initialScale=0.1), graphics={
            Text(
              extent={{-92,74},{44,44}},
              lineThickness=0.5,
              textString="reference"),
            Text(
              extent={{-94,-52},{-34,-74}},
              textString="u"),
            Line(points={{-76.0,-32.0},{-68.0,-6.0},{-50.0,26.0},{-24.0,40.0},{-2.0,42.0},{16.0,36.0},{32.0,28.0},{48.0,12.0},{58.0,-6.0},{68.0,-28.0}},
              color={0,0,127}),
            Line(points={{-78.0,-2.0},{-6.0,18.0},{82.0,-12.0}},
              color={255,0,0}),
            Line(points={{-78.0,12.0},{-6.0,30.0},{82.0,0.0}}),
            Line(points={{-78.0,-16.0},{-6.0,4.0},{82.0,-26.0}}),
            Line(points={{-82.0,-18.0},{-56.0,-18.0},{-56.0,-40.0},{64.0,-40.0},{64.0,-20.0},{90.0,-20.0}},
              color={255,0,255})}), Documentation(info="<html>
<p>The block OnOffController sets the output signal <b>y</b> to <b>true</b> when
the input signal <b>u</b> falls below the <b>reference</b> signal minus half of
the bandwidth and sets the output signal <b>y</b> to <b>false</b> when the input
signal <b>u</b> exceeds the <b>reference</b> signal plus half of the bandwidth.</p>
</html>"));
    end OnOffController;

    block TriggeredTrapezoid "Triggered trapezoid generator"
      extends Icons.PartialBooleanBlock;

      parameter Real amplitude=1 "Amplitude of trapezoid";
      parameter SI.Time rising(final min=0)=0 "Rising duration of trapezoid";
      parameter SI.Time falling(final min=0)=rising
        "Falling duration of trapezoid";
      parameter Real offset=0 "Offset of output signal";

      Modelica_Blocks_Interfaces.BooleanInput u
        "Connector of Boolean input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));

    protected
      discrete Real endValue "Value of y at time of recent edge";
      discrete Real rate "Current rising/falling rate";
      discrete SI.Time T "Predicted time of output reaching endValue";
    equation
      y = if time < T then endValue - (T - time)*rate else endValue;

      when {initial(),u,not u} then
        endValue = if u then offset + amplitude else offset;
        rate = if u and (rising > 0) then amplitude/rising else if not u and (
          falling > 0) then -amplitude/falling else 0;
        T = if u and not (rising > 0) or not u and not (falling > 0) or not abs(
          amplitude) > 0 or initial() then time else time + (endValue - pre(y))/
          rate;
      end when;
      annotation (
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Line(visible=true,
            points={{-60.0,-70.0},{-60.0,-70.0},{-30.0,40.0},{8.0,40.0},{40.0,-70.0},{40.0,-70.0}},
            color={0,0,127}),
          Line(visible=true,
            points={{-90.0,-70.0},{82.0,-70.0}},
            color={192,192,192}),
          Line(visible=true,
            points={{-80.0,68.0},{-80.0,-80.0}},
            color={192,192,192}),
          Polygon(visible=true,
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{90.0,-70.0},{68.0,-62.0},{68.0,-78.0},{90.0,-70.0}}),
          Polygon(visible=true,
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
          Line(visible=true,
            points={{-80.0,-70.0},{-60.0,-70.0},{-60.0,24.0},{8.0,24.0},{8.0,-70.0},{60.0,-70.0}},
            color={255,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,-20},{-60,-20},{-30,40},{
              8,40},{40,-20},{60,-20}}, color={0,0,255}),Line(points={{-90,-70},{
              82,-70}}, color={0,0,0}),Line(points={{-80,68},{-80,-80}}, color={0,
              0,0}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-80,-68},{-60,-68},{
              -60,-42},{8,-42},{8,-68},{60,-68}}, color={255,0,255}),Line(
                points={{-60,40},{-60,-42}},
                color={0,0,0},
                pattern=LinePattern.Dot),Line(
                points={{8,-42},{8,40}},
                color={0,0,0},
                pattern=LinePattern.Dot),Line(points={{-60,40},{-30,40}}, color={
              0,0,0}),Line(points={{8,-20},{40,-20}}, color={0,0,0}),Line(points=
              {{-20,40},{-20,-20}}, color={0,0,0}),Line(points={{-20,-20},{-20,-70}},
              color={0,0,0}),Text(
                extent={{-44,50},{-44,40}},
                lineColor={0,0,0},
                textString="rising"),Text(
                extent={{24,-10},{24,-20}},
                lineColor={0,0,0},
                textString="falling"),Polygon(
                points={{-60,40},{-56,42},{-56,38},{-60,40}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-30,40},{-34,42},{-34,38},{-30,40}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{8,-20},{12,-18},{12,-22},{8,-20}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{40,-20},{36,-18},{36,-22},{40,-20}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-22,-24},{-20,-20},{-18,-24},{-22,-24}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-18,-66},{-22,-66},{-20,-70},{-18,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-22,36},{-20,40},{-18,36},{-22,36}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-18,-16},{-22,-16},{-20,-20},{-18,-16}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-40,6},{0,-4}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Text(
                extent={{-20,6},{-20,-4}},
                lineColor={0,0,0},
                textString="amplitude"),Rectangle(
                extent={{-40,-48},{0,-58}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Text(
                extent={{-20,-48},{-20,-58}},
                lineColor={0,0,0},
                textString="offset"),Text(
                extent={{60,-82},{94,-92}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-88,-4},{-54,-14}},
                lineColor={0,0,0},
                textString="y"),Text(
                extent={{-88,-46},{-54,-56}},
                lineColor={0,0,0},
                textString="u")}),
        Documentation(info="<HTML>
<p>The block TriggeredTrapezoid has a Boolean input and a real
output signal and requires the parameters <i>amplitude</i>,
<i>rising</i>, <i>falling</i> and <i>offset</i>. The
output signal <b>y</b> represents a trapezoidal signal dependent on the
input signal <b>u</b>.
</p>
<p>The behaviour is as follows: Assume the initial input to be false. In this
case, the output will be <i>offset</i>. After a rising edge (i.e., the input
changes from false to true), the output is rising during <i>rising</i> to the
sum of <i>offset</i> and <i>amplitude</i>. In contrast, after a falling
edge (i.e., the input changes from true to false), the output is falling
during <i>falling</i> to a value of <i>offset</i>.
</p>
<p>Note, that the case of edges before expiration of rising or falling is
handled properly.</p>
</html>"));
    end TriggeredTrapezoid;

    block Timer
      "Timer measuring the time from the time instant where the Boolean input became true"

      extends Icons.PartialBooleanBlock;
      Modelica_Blocks_Interfaces.BooleanInput u
        "Connector of Boolean input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));

    protected
      discrete SI.Time entryTime "Time instant when u became true";
    initial equation
      pre(entryTime) = 0;
    equation
      when u then
        entryTime = time;
      end when;
      y = if u then time - entryTime else 0.0;
      annotation (
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Line(visible=true,
            points={{-90.0,-70.0},{82.0,-70.0}},
            color={192,192,192}),
          Line(visible=true,
            points={{-80.0,68.0},{-80.0,-80.0}},
            color={192,192,192}),
          Polygon(visible=true,
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{90.0,-70.0},{68.0,-62.0},{68.0,-78.0},{90.0,-70.0}}),
          Polygon(visible=true,
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
          Line(visible=true,
            points={{-80.0,-70.0},{-60.0,-70.0},{-60.0,-26.0},{38.0,-26.0},{38.0,-70.0},{66.0,-70.0}},
            color={255,0,255}),
          Line(visible=true,
            points={{-80.0,0.0},{-62.0,0.0},{40.0,90.0},{40.0,0.0},{68.0,0.0}},
            color={0,0,127})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-90,-70},{82,-70}}, color={0,
              0,0}),Line(points={{-80,68},{-80,-80}}, color={0,0,0}),Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-80,-68},{-60,-68},{
              -60,-40},{20,-40},{20,-68},{60,-68}}, color={255,0,255}),Line(
              points={{-80,-20},{-60,-20},{20,60},{20,-20},{60,-20},{60,-20}},
              color={0,0,255}),Text(
                extent={{-88,6},{-54,-4}},
                lineColor={0,0,0},
                textString="y"),Text(
                extent={{48,-80},{84,-88}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-88,-36},{-54,-46}},
                lineColor={0,0,0},
                textString="u")}),
        Documentation(info="<HTML>
<p> When the Boolean input \"u\" becomes <b>true</b>, the timer is started
and the output \"y\" is the time from the time instant where u became true.
The timer is stopped and the output is reset to zero, once the
input becomes false.
</p>
</html>"));
    end Timer;

    block RSFlipFlop "A basic RS Flip Flop"
      extends Icons.PartialBooleanBlock;
      parameter Boolean Qini=false "Start value of Q at initial time";
      Modelica_Blocks_Interfaces.BooleanOutput Q annotation (Placement(
            transformation(extent={{100,50},{120,70}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanOutput QI annotation (Placement(
            transformation(extent={{100,-70},{120,-50}}, rotation=0)));
      Nor nor annotation (Placement(transformation(extent={{-20,20},{0,40}},
              rotation=0)));
      Nor nor1 annotation (Placement(transformation(extent={{-20,-20},{0,0}},
              rotation=0)));
      Pre pre(pre_u_start=not (Qini)) annotation (Placement(transformation(
              extent={{10,20},{30,40}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanInput S
        annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
      Modelica_Blocks_Interfaces.BooleanInput R
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
    equation
      connect(nor1.y, nor.u2) annotation (Line(points={{1,-10},{40,-10},{40,-40},
              {-60,-40},{-60,22},{-22,22}}, color={255,0,255}));
      connect(nor1.y, Q) annotation (Line(points={{1,-10},{60,-10},{60,60},{110,
              60}}, color={255,0,255}));
      connect(nor.y, pre.u)
        annotation (Line(points={{1,30},{8,30}}, color={255,0,255}));
      connect(pre.y, nor1.u1) annotation (Line(points={{31,30},{40,30},{40,10},{-40,
              10},{-40,-10},{-22,-10}}, color={255,0,255}));
      connect(pre.y, QI) annotation (Line(points={{31,30},{80,30},{80,-60},{110,-60}},
            color={255,0,255}));
      connect(S, nor.u1) annotation (Line(
          points={{-120,60},{-40,60},{-40,30},{-22,30}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(R, nor1.u2) annotation (Line(
          points={{-120,-60},{-40,-60},{-40,-18},{-22,-18}},
          color={255,0,255},
          smooth=Smooth.None));
    annotation (
      Icon(graphics={
          Text(
            extent={{-60,-30},{-20,-90}},
            lineColor={0,0,0},
            textString="R"),
          Text(
            extent={{-62,90},{-22,30}},
            lineColor={0,0,0},
            textString="S"),
          Text(
            extent={{20,90},{60,30}},
            lineColor={0,0,0},
            textString="Q"),
          Text(
            extent={{6,-30},{66,-90}},
            lineColor={0,0,0},
            textString="Q!"),
          Ellipse(
            extent={{-73,54},{-87,68}},
            lineColor=DynamicSelect({235,235,235}, if S > 0.5 then {0,255,0}
                 else {235,235,235}),
            fillColor=DynamicSelect({235,235,235}, if S > 0.5 then {0,255,0}
                 else {235,235,235}),
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{83,-53},{69,-67}},
            lineColor=DynamicSelect({235,235,235}, if QI > 0.5 then {0,255,0}
                 else {235,235,235}),
            fillColor=DynamicSelect({235,235,235}, if QI > 0.5 then {0,255,0}
                 else {235,235,235}),
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-71,-52},{-85,-66}},
            lineColor=DynamicSelect({235,235,235}, if R > 0.5 then {0,255,0}
                 else {235,235,235}),
            fillColor=DynamicSelect({235,235,235}, if R > 0.5 then {0,255,0}
                 else {235,235,235}),
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{71,67},{85,53}},
            lineColor=DynamicSelect({235,235,235}, if Q > 0.5 then {0,255,0}
                 else {235,235,235}),
            fillColor=DynamicSelect({235,235,235}, if Q > 0.5 then {0,255,0}
                 else {235,235,235}),
            fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
The output <code>Q</code> is set by the input <code>S</code> and reset by the input <code>R</code>, and keeps its value in between. <code>QI</code> is the inverse of <code>Q</code>.
</p>
</html>"));
    end RSFlipFlop;

    block TerminateSimulation "Terminate simulation if condition is fulfilled"

      Modelica_Blocks_Interfaces.BooleanOutput condition=false
        "Terminate simulation when condition becomes true" annotation (Dialog,
          Placement(transformation(extent={{200,-10},{220,10}}, rotation=0)));
      parameter String terminationText="... End condition reached"
        "Text that will be displayed when simulation is terminated";

    equation
      when condition then
        terminate(terminationText);
      end when;
      annotation (Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-200.0,-20.0},{200.0,20.0}},
            initialScale=0.2),
            graphics={
          Rectangle(visible=true,
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineThickness=5.0,
            borderPattern=BorderPattern.Raised,
            extent={{-200.0,-20.0},{200.0,20.0}}),
          Text(visible=true,
            extent={{-166.0,-15.0},{194.0,15.0}},
            textString="%condition"),
          Rectangle(visible=true,
            fillColor={161,35,41},
            fillPattern=FillPattern.Solid,
            borderPattern=BorderPattern.Raised,
            extent={{-194.0,-14.0},{-168.0,14.0}}),
          Text(visible=true,
            lineColor={0,0,255},
            extent={{-200.0,22.0},{200.0,46.0}},
            textString="%name")}), Documentation(info="<html>
<p>
In the parameter menu, a <b>time varying</b> expression can be defined
via variable <b>condition</b>, for example \"condition = x &lt; 0\",
where \"x\" is a variable that is declared in the model in which the
\"TerminateSimulation\" block is present.
If this expression becomes <b>true</b>,
the simulation is (successfully) terminated. A termination message
explaining the reason for the termination can be given via
parameter \"terminationText\".
</p>

</html>"));
    end TerminateSimulation;
    annotation (Documentation(info="<html>
<p>
This package provides blocks with Boolean input and output signals
to describe logical networks. A typical example for a logical
network built with package Logical is shown in the next figure:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/LogicalNetwork1.png\"
     alt=\"LogicalNetwork1.png\">
</p>

<p>
The actual value of Boolean input and/or output signals is displayed
in the respective block icon as \"circle\", where \"white\" color means
value <b>false</b> and \"green\" color means value <b>true</b>. These
values are visualized in a diagram animation.
</p>
</html>"),   Icon(graphics={Line(
            visible=true,
            points={{-86,-22},{-50,-22},{-50,22},{48,22},{48,-22},{88,-24}},
            color={255,0,255})}));
  end Logical;

  package Math "Library of Real mathematical functions as input/output blocks"
    import SIunits = Modelica_SIunits;
    import Interfaces =
           Modelica_Blocks_Interfaces;
    extends Modelica_Icons.Package;

    encapsulated package UnitConversions
      "Conversion blocks to convert between SI and non-SI unit signals"
      import SI = Modelica_SIunits;
      import NonSI = Modelica_SIunits.Conversions.NonSIunits;
      import Modelica_Icons;
      import Modelica_SIunits;
      import Modelica_Blocks_Interfaces;
      extends Modelica_Icons.Package;

      block To_degC "Convert from Kelvin to degCelsius"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="K"), y(
              unit="degC"));

      equation
        y =Modelica_SIunits.Conversions.to_degC(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="K"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="degC")}), Documentation(info="<html>
<p>
This block converts the input signal from Kelvin to degCelsius and returns
the result as output signal.
</p>
</html>"));
      end To_degC;

      block From_degC "Convert from degCelsius to Kelvin"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="degC"),
            y(unit="K"));
      equation
        y =Modelica_SIunits.Conversions.from_degC(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="degC"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="K")}), Documentation(info="<html>
<p>
This block converts the input signal from degCelsius to Kelvin and returns
the result as output signal.
</p>
</html>"));
      end From_degC;

      block To_degF "Convert from Kelvin to degFahrenheit"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="K"), y(
              unit="degF"));
      equation
        y =Modelica_SIunits.Conversions.to_degF(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="K"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="degF")}), Documentation(info="<html>
<p>
This block converts the input signal from Kelvin to degFahrenheit and returns
the result as output signal.
</p>
</html>"));
      end To_degF;

      block From_degF "Convert from degFahrenheit to Kelvin"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="degF"),
            y(unit="K"));
      equation
        y =Modelica_SIunits.Conversions.from_degF(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="degF"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="K")}), Documentation(info="<html>
<p>
This block converts the input signal from degFahrenheit to Kelvin and returns
the result as output signal.
</p>
</html>"));
      end From_degF;

      block To_degRk "Convert from Kelvin to degRankine"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="K"), y(
              unit="degRk"));
      equation
        y =Modelica_SIunits.Conversions.to_degRk(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="K"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="degRk")}), Documentation(info="<html>
<p>
This block converts the input signal from Kelvin to degRankine and returns
the result as output signal.
</p>
</html>"));
      end To_degRk;

      block From_degRk "Convert from degRankine to Kelvin"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="degRk"),
            y(unit="K"));
      equation
        y =Modelica_SIunits.Conversions.from_degRk(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="degRk"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="K")}), Documentation(info="<html>
<p>
This block converts the input signal from degRankine to Kelvin and returns
the result as output signal.
</p>
</html>"));
      end From_degRk;

      block To_deg "Convert from radian to degree"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="rad"),
            y(unit="deg"));
      equation
        y =Modelica_SIunits.Conversions.to_deg(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="rad"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="deg")}), Documentation(info="<html>
<p>
This block converts the input signal from radian to degree and returns
the result as output signal.
</p>
</html>"));
      end To_deg;

      block From_deg "Convert from degree to radian"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="deg"),
            y(unit="rad"));
      equation
        y =Modelica_SIunits.Conversions.from_deg(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="deg"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="rad")}), Documentation(info="<html>
<p>
This block converts the input signal from degree to radian and returns
the result as output signal.
</p>
</html>"));
      end From_deg;

      block To_rpm "Convert from radian per second to revolutions per minute"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="rad/s"),
            y(unit="1/min"));
      equation
        y =Modelica_SIunits.Conversions.to_rpm(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{26,82},{-98,50}},
                    lineColor={0,0,0},
                    textString="rad/s"),Text(
                    extent={{100,-42},{-62,-74}},
                    lineColor={0,0,0},
                    textString="1/min")}), Documentation(info="<html>
<p>
This block converts the input signal from radian per second to revolutions per minute and returns
the result as output signal.
</p>
</html>"));
      end To_rpm;

      block From_rpm "Convert from revolutions per minute to radian per second"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="1/min"),
            y(unit="rad/s"));
      equation
        y =Modelica_SIunits.Conversions.from_rpm(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{50,84},{-94,56}},
                    lineColor={0,0,0},
                    textString="1/min"),Text(
                    extent={{94,-42},{-26,-74}},
                    lineColor={0,0,0},
                    textString="rad/s")}), Documentation(info="<html>
<p>
This block converts the input signal from revolutions per minute to radian per second and returns
the result as output signal.
</p>
</html>"));
      end From_rpm;

      block To_kmh "Convert from metre per second to kilometre per hour"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="m/s"),
            y(unit="km/h"));
      equation
        y =Modelica_SIunits.Conversions.to_kmh(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{0,82},{-96,42}},
                    lineColor={0,0,0},
                    textString="m/s"),Text(
                    extent={{92,-40},{-14,-84}},
                    lineColor={0,0,0},
                    textString="km/h")}), Documentation(info="<html>
<p>
This block converts the input signal from metre per second to kilometre per hour and returns
the result as output signal.
</p>
</html>"));
      end To_kmh;

      block From_kmh "Convert from kilometre per hour to metre per second"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="km/h"),
            y(unit="m/s"));
      equation
        y =Modelica_SIunits.Conversions.from_kmh(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{26,80},{-96,48}},
                    lineColor={0,0,0},
                    textString="km/h"),Text(
                    extent={{92,-46},{-20,-82}},
                    lineColor={0,0,0},
                    textString="m/s")}), Documentation(info="<html>
<p>
This block converts the input signal from kilometre per hour to metre per second and returns
the result as output signal.
</p>
</html>"));
      end From_kmh;

      block To_day "Convert from second to day"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="s"), y(
              unit="d"));
      equation
        y =Modelica_SIunits.Conversions.to_day(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="s"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="day")}), Documentation(info="<html>
<p>
This block converts the input signal from second to day and returns
the result as output signal.
</p>
</html>"));
      end To_day;

      block From_day "Convert from day to second"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="d"), y(
              unit="s"));
      equation
        y =Modelica_SIunits.Conversions.from_day(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="day"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="s")}), Documentation(info="<html>
<p>
This block converts the input signal from day to second and returns
the result as output signal.
</p>
</html>"));
      end From_day;

      block To_hour "Convert from second to hour"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="s"), y(
              unit="h"));
      equation
        y =Modelica_SIunits.Conversions.to_hour(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="s"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="hour")}), Documentation(info="<html>
<p>
This block converts the input signal from second to hour and returns
the result as output signal.
</p>
</html>"));
      end To_hour;

      block From_hour "Convert from hour to second"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="h"), y(
              unit="s"));
      equation
        y =Modelica_SIunits.Conversions.from_hour(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="hour"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="s")}), Documentation(info="<html>
<p>
This block converts the input signal from hour to second and returns
the result as output signal.
</p>
</html>"));
      end From_hour;

      block To_minute "Convert from second to minute"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="s"), y(
              unit="min"));
      equation
        y =Modelica_SIunits.Conversions.to_minute(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="s"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="minute")}), Documentation(info="<html>
<p>
This block converts the input signal from second to minute and returns
the result as output signal.
</p>
</html>"));
      end To_minute;

      block From_minute "Convert from minute to second"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="min"),
            y(unit="s"));
      equation
        y =Modelica_SIunits.Conversions.from_minute(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="minute"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="s")}), Documentation(info="<html>
<p>
This block converts the input signal from minute to second and returns
the result as output signal.
</p>
</html>"));
      end From_minute;

      block To_litre "Convert from cubic metre to litre"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="m3"), y(
              unit="l"));
      equation
        y =Modelica_SIunits.Conversions.to_litre(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="m3"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="litre")}), Documentation(info="<html>
<p>
This block converts the input signal from metre to litre and returns
the result as output signal.
</p>
</html>"));
      end To_litre;

      block From_litre "Convert from litre to cubic metre"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="l"), y(
              unit="m3"));
      equation
        y =Modelica_SIunits.Conversions.from_litre(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="litre"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="m3")}), Documentation(info="<html>
<p>
This block converts the input signal from litre to cubic metre and returns
the result as output signal.
</p>
</html>"));
      end From_litre;

      block To_kWh "Convert from Joule to kilo Watt hour"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="J"), y(
              unit="kW.h"));
      equation
        y =Modelica_SIunits.Conversions.to_kWh(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="J"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="kW.h")}), Documentation(info="<html>
<p>
This block converts the input signal from Joule to kilo Watt hour and returns
the result as output signal.
</p>
</html>"));
      end To_kWh;

      block From_kWh "Convert from kilo Watt hour to Joule"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="kW.h"),
            y(unit="J"));
      equation
        y =Modelica_SIunits.Conversions.from_kWh(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="kW.h"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="J")}), Documentation(info="<html>
<p>
This block converts the input signal from kilo Watt hour to Joule and returns
the result as output signal.
</p>
</html>"));
      end From_kWh;

      block To_bar "Convert from Pascal to bar"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="Pa"), y(
              unit="bar"));
      equation
        y =Modelica_SIunits.Conversions.to_bar(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="Pa"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="bar")}), Documentation(info="<html>
<p>
This block converts the input signal from Pascal to bar and returns
the result as output signal.
</p>
</html>"));
      end To_bar;

      block From_bar "Convert from bar to Pascal"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="bar"),
            y(unit="Pa"));
      equation
        y =Modelica_SIunits.Conversions.from_bar(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="bar"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="Pa")}), Documentation(info="<html>
<p>
This block converts the input signal from bar to Pascal and returns
the result as output signal.
</p>
</html>"));
      end From_bar;

      block To_gps "Convert from kilogram per second to gram per second"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="kg/s"),
            y(unit="g/s"));
      equation
        y =Modelica_SIunits.Conversions.to_gps(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="kg/s"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="g/s")}), Documentation(info="<html>
<p>
This block converts the input signal from kilogram per second to gram per seconds and returns
the result as output signal.
</p>
</html>"));
      end To_gps;

      block From_gps "Convert from gram per second to kilogram per second"
        extends Modelica_Blocks_Interfaces.PartialConversionBlock(    u(unit="g/s"),
            y(unit="kg/s"));
      equation
        y =Modelica_SIunits.Conversions.from_gps(u);
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                    extent={{-20,100},{-100,20}},
                    lineColor={0,0,0},
                    textString="g/s"),Text(
                    extent={{100,-20},{20,-100}},
                    lineColor={0,0,0},
                    textString="kg/s")}), Documentation(info="<html>
<p>
This block converts the input signal from gram per second to kilogram per second and returns
the result as output signal.
</p>
</html>"));
      end From_gps;
      annotation (Documentation(info="<html>
<p>
This package consists of blocks that convert an input signal
with a specific unit to an output signal in another unit
(e.g., conversion of an angle signal from \"deg\" to \"rad\").
</p>

</html>"));
    end UnitConversions;

    block InverseBlockConstraints
      "Construct inverse model by requiring that two inputs and two outputs are identical (replaces the previously, unbalanced, TwoInputs and TwoOutputs blocks)"

      Modelica_Blocks_Interfaces.RealInput u1 "Input signal 1 (u1 = u2)"
        annotation (Placement(transformation(extent={{-240,-20},{-200,20}},
              rotation=0), iconTransformation(extent={{-240,-20},{-200,20}})));
      Modelica_Blocks_Interfaces.RealInput u2 "Input signal 2 (u1 = u2)"
        annotation (Placement(transformation(extent={{-140,-20},{-180,20}},
              rotation=0), iconTransformation(extent={{-140,-20},{-180,20}})));
      Modelica_Blocks_Interfaces.RealOutput y1 "Output signal 1 (y1 = y2)"
        annotation (Placement(transformation(extent={{200,-10},{220,10}},
              rotation=0), iconTransformation(extent={{200,-10},{220,10}})));
      Modelica_Blocks_Interfaces.RealOutput y2 "Output signal 2 (y2 = y2)"
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={170,0}), iconTransformation(extent={{180,-10},{160,10}})));

    equation
      u1 = u2;
      y1 = y2;
      annotation (
        __Dymola_structurallyIncomplete=true,
        defaultConnectionStructurallyInconsistent=true,
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-120},{200,
                120}}), graphics={
            Line(
              points={{180,0},{200,0}},
              color={0,0,127},
              smooth=Smooth.None),
            Line(
              points={{-200,0},{-180,0}},
              color={0,0,127},
              smooth=Smooth.None),
            Rectangle(extent={{-190,120},{190,-120}}, lineColor={135,135,135})}),
        Documentation(info="<html>
<p>
Exchange input and output signals of a block, i.e., the previous
block inputs become block outputs and the previous block outputs become
block inputs. This block is used to construct inverse models.
Its usage is demonstrated in example:
<a href=\"modelica://Modelica.Blocks.Examples.InverseModel\">Modelica.Blocks.Examples.InverseModel</a>.
</p>

<p>
Note, if a block shall be inverted that has several input and output blocks,
then this can be easily achieved by using a vector of InverseBlockConstraints
instances:
</p>

<pre>
   InverseBlockConstraint invert[3];  // Block to be inverted has 3 input signals
</pre>
</html>"));
    end InverseBlockConstraints;

    block Gain "Output the product of a gain value with the input signal"

      parameter Real k(start=1, unit="1")
        "Gain value multiplied with input signal";
    public
      Modelica_Blocks_Interfaces.RealInput u "Input signal connector"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y "Output signal connector"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));

    equation
      y = k*u;
      annotation (
        Documentation(info="<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{-100,-100},{-100,100},{100,0},{-100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-140},{150,-100}},
              lineColor={0,0,0},
              textString="k=%k"),
            Text(
              extent={{-150,140},{150,100}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Text(
                extent={{-76,38},{0,-34}},
                textString="k",
                lineColor={0,0,255})}));
    end Gain;

    block MatrixGain
      "Output the product of a gain matrix with the input signal vector"

      parameter Real K[:, :]=[1, 0; 0, 1]
        "Gain matrix which is multiplied with the input";
      extends Modelica_Blocks_Interfaces.MIMO(
                              final nin=size(K, 2), final nout=size(K, 1));
    equation
      y = K*u;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes output vector <b>y</b> as <i>product</i> of the
gain matrix <b>K</b> with the input signal vector <b>u</b>:
</p>
<pre>
    <b>y</b> = <b>K</b> * <b>u</b>;
</pre>
<p>
Example:
</p>
<pre>
   parameter: <b>K</b> = [0.12 2; 3 1.5]

   results in the following equations:

     | y[1] |     | 0.12  2.00 |   | u[1] |
     |      |  =  |            | * |      |
     | y[2] |     | 3.00  1.50 |   | u[2] |
</pre>

</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,-60},{90,60}},
              lineColor={160,160,164},
              textString="*K"), Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Text(
                extent={{-90,-60},{90,60}},
                lineColor={160,160,164},
                textString="*K")}));
    end MatrixGain;

    block MultiSum "Sum of Reals: y = k[1]*u[1] + k[2]*u[2] + ... + k[n]*u[n]"
      extends Modelica_Blocks_Interfaces.PartialRealMISO;
      parameter Real k[nu]=fill(1, nu) "Input gains";
    equation
      if size(u, 1) > 0 then
        y = k*u;
      else
        y = 0;
      end if;

      annotation (Icon(graphics={Text(
              extent={{-200,-110},{200,-140}},
              lineColor={0,0,0},
              fillColor={255,213,170},
              fillPattern=FillPattern.Solid,
              textString="%k"), Text(
              extent={{-72,68},{92,-68}},
              lineColor={0,0,0},
              fillColor={255,213,170},
              fillPattern=FillPattern.Solid,
              textString="+")}), Documentation(info="<html>
<p>
This blocks computes the scalar Real output \"y\" as sum of the elements of the
Real input signal vector u:
</p>
<blockquote><pre>
y = k[1]*u[1] + k[2]*u[2] + ... k[N]*u[N];
</pre></blockquote>

<p>
The input connector is a vector of Real input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.RealNetwork1\">Modelica.Blocks.Examples.RealNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to zero: y=0.
</p>

</html>"));
    end MultiSum;

    block MultiProduct "Product of Reals: y = u[1]*u[2]* ... *u[n]"
      extends Modelica_Blocks_Interfaces.PartialRealMISO;
    equation
      if size(u, 1) > 0 then
        y = product(u);
      else
        y = 0;
      end if;

      annotation (Icon(graphics={Text(
              extent={{-74,50},{94,-94}},
              lineColor={0,0,0},
              fillColor={255,213,170},
              fillPattern=FillPattern.Solid,
              textString="*")}), Documentation(info="<html>
<p>
This blocks computes the scalar Real output \"y\" as product of the elements of the
Real input signal vector u:
</p>
<blockquote><pre>
y = u[1]*u[2]* ... *u[N];
</pre></blockquote>

<p>
The input connector is a vector of Real input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.RealNetwork1\">Modelica.Blocks.Examples.RealNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to zero: y=0.
</p>
</html>"));
    end MultiProduct;

    block MultiSwitch
      "Set Real expression that is associated with the first active input signal"

      input Real expr[nu]=fill(0.0, nu)
        "y = if u[i] then expr[i] else y_default (time varying)"
        annotation (Dialog);
      parameter Real y_default=0.0
        "Default value of output y if all u[i] = false";

      parameter Integer nu(min=0) = 0 "Number of input connections"
        annotation (Dialog(connectorSizing=true), HideResult=true);
      parameter Integer precision(min=0) = 3
        "Number of significant digits to be shown in dynamic diagram layer for y"
        annotation (Dialog(tab="Advanced"));

      Modelica_Blocks_Interfaces.BooleanVectorInput u[nu]
        "Set y = expr[i], if u[i] = true"
        annotation (Placement(transformation(extent={{-110,30},{-90,-30}})));
      Modelica_Blocks_Interfaces.RealOutput y "Output depending on expression"
        annotation (Placement(transformation(extent={{300,-10},{320,10}})));

    protected
      Integer firstActiveIndex;
    initial equation
      pre(u) = fill(false, nu);
    equation
      firstActiveIndex = Modelica_Math.BooleanVectors.firstTrueIndex(u);
      y = if firstActiveIndex == 0 then y_default else expr[firstActiveIndex];
      annotation (
        defaultComponentName="multiSwitch1",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{300,
                100}}), graphics={
            Rectangle(
              extent={{-100,-51},{300,50}},
              lineThickness=5.0,
              lineColor={0,0,0},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised),
            Text(
              extent={{-86,16},{295,-17}},
              lineColor={0,0,0},
              fillColor={255,246,238},
              fillPattern=FillPattern.Solid,
              textString="%expr"),
            Text(
              extent={{310,-25},{410,-45}},
              lineColor={0,0,0},
              textString=DynamicSelect(" ", String(
                    y,
                    minimumLength=1,
                    significantDigits=integer(precision)))),
            Text(
              extent={{-100,-60},{300,-90}},
              lineColor={0,0,0},
              textString="else: %y_default"),
            Text(
              extent={{-100,100},{300,60}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>
This block has a vector of Boolean input signals u[nu] and a vector of
(time varying) Real expressions expr[nu]. The output signal y is
set to expr[i], if i is the first element in the input vector u that is true. If all input signals are
false, y is set to parameter \"y_default\".
</p>

<blockquote><pre>
  // Conceptual equation (not valid Modelica)
  i = 'first element of u[:] that is true';
  y = <b>if</b> i==0 <b>then</b> y_default <b>else</b> expr[i];
</pre></blockquote>

<p>
The input connector is a vector of Boolean input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.RealNetwork1\">Modelica.Blocks.Examples.RealNetwork1</a>.
</p>

</html>"));
    end MultiSwitch;

    block Sum "Output the sum of the elements of the input vector"
      extends Modelica_Blocks_Interfaces.MISO;
      parameter Real k[nin]=ones(nin) "Optional: sum coefficients";
    equation
      y = k*u;
      annotation (
        defaultComponentName="sum1",
        Documentation(info="<html>
<p>
This blocks computes output <b>y</b> as
<i>sum</i> of the elements of the input signal vector
<b>u</b>:
</p>
<pre>
    <b>y</b> = <b>u</b>[1] + <b>u</b>[2] + ...;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   nin = 3;

  results in the following equations:

     y = u[1] + u[2] + u[3];
</pre>

</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Line(
              points={{26,42},{-34,42},{6,2},{-34,-38},{26,-38}},
              color={0,0,0},
              thickness=0.25), Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{26,42},{-34,42},{6,2},{-34,-38},{26,-38}},
                color={0,0,0},
                thickness=0.25)}));
    end Sum;

    block Feedback "Output difference between commanded and feedback input"

      Modelica_Blocks_Interfaces.RealInput u1 annotation (Placement(
            transformation(extent={{-100,-20},{-60,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u2 annotation (Placement(
            transformation(
            origin={0,-80},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      Modelica_Blocks_Interfaces.RealOutput y annotation (Placement(
            transformation(extent={{80,-10},{100,10}}, rotation=0)));

    equation
      y = u1 - u2;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes output <b>y</b> as <i>difference</i> of the
commanded input <b>u1</b> and the feedback
input <b>u2</b>:
</p>
<pre>
    <b>y</b> = <b>u1</b> - <b>u2</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   n = 2

  results in the following equations:

     y = u1 - u2
</pre>

</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.1), graphics={
            Ellipse(
              lineColor={0,0,127},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              extent={{-20,-20},{20,20}}),
            Line(points={{-60,0},{-20,0}}, color={0,0,127}),
            Line(points={{20,0},{80,0}}, color={0,0,127}),
            Line(points={{0,-20},{0,-60}}, color={0,0,127}),
            Text(extent={{-14,-94},{82,0}}, textString="-"),
            Text(
              lineColor={0,0,255},
              extent={{-150,44},{150,94}},
              textString="%name")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(
                extent={{-20,20},{20,-20}},
                pattern=LinePattern.Solid,
                lineThickness=0.25,
                fillColor={235,235,235},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),Line(points={{-60,0},{-20,0}}, color={0,0,
              255}),Line(points={{20,0},{80,0}}, color={0,0,255}),Line(points={{0,
              -20},{0,-60}}, color={0,0,255}),Text(
                extent={{-12,10},{84,-84}},
                lineColor={0,0,0},
                textString="-")}));
    end Feedback;

    block Add "Output the sum of the two inputs"
      extends Modelica_Blocks_Interfaces.SI2SO;

      parameter Real k1=+1 "Gain of upper input";
      parameter Real k2=+1 "Gain of lower input";

    equation
      y = k1*u1 + k2*u2;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes output <b>y</b> as <i>sum</i> of the
two input signals <b>u1</b> and <b>u2</b>:
</p>
<pre>
    <b>y</b> = k1*<b>u1</b> + k2*<b>u2</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   k1= +2, k2= -3

  results in the following equations:

     y = 2 * u1 - 3 * u2
</pre>

</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.1), graphics={
            Text(
              lineColor={0,0,255},
              extent={{-150,110},{150,150}},
              textString="%name"),
            Line(points={{-100,60},{-74,24},{-44,24}}, color={0,0,127}),
            Line(points={{-100,-60},{-74,-28},{-42,-28}}, color={0,0,127}),
            Ellipse(lineColor={0,0,127}, extent={{-50,-50},{50,50}}),
            Line(points={{50,0},{100,0}}, color={0,0,127}),
            Text(extent={{-38,-34},{38,34}}, textString="+"),
            Text(extent={{-100,52},{5,92}}, textString="%k1"),
            Text(extent={{-100,-92},{5,-52}}, textString="%k2")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{50,0},{100,0}},
              color={0,0,255}),Line(points={{-100,60},{-74,24},{-44,24}}, color={
              0,0,127}),Line(points={{-100,-60},{-74,-28},{-42,-28}}, color={0,0,
              127}),Ellipse(extent={{-50,50},{50,-50}}, lineColor={0,0,127}),Line(
              points={{50,0},{100,0}}, color={0,0,127}),Text(
                extent={{-36,38},{40,-30}},
                lineColor={0,0,0},
                textString="+"),Text(
                extent={{-100,52},{5,92}},
                lineColor={0,0,0},
                textString="k1"),Text(
                extent={{-100,-52},{5,-92}},
                lineColor={0,0,0},
                textString="k2")}));
    end Add;

    block Add3 "Output the sum of the three inputs"
      extends Icons.Block;

      parameter Real k1=+1 "Gain of upper input";
      parameter Real k2=+1 "Gain of middle input";
      parameter Real k3=+1 "Gain of lower input";
      Modelica_Blocks_Interfaces.RealInput u1
        "Connector 1 of Real input signals" annotation (Placement(
            transformation(extent={{-140,60},{-100,100}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u2
        "Connector 2 of Real input signals" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u3
        "Connector 3 of Real input signals" annotation (Placement(
            transformation(extent={{-140,-100},{-100,-60}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y
        "Connector of Real output signals" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));

    equation
      y = k1*u1 + k2*u2 + k3*u3;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes output <b>y</b> as <i>sum</i> of the
three input signals <b>u1</b>, <b>u2</b> and <b>u3</b>:
</p>
<pre>
    <b>y</b> = k1*<b>u1</b> + k2*<b>u2</b> + k3*<b>u3</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   k1= +2, k2= -3, k3=1;

  results in the following equations:

     y = 2 * u1 - 3 * u2 + u3;
</pre>

</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Text(
              extent={{-100,50},{5,90}},
              lineColor={0,0,0},
              textString="%k1"),
            Text(
              extent={{-100,-20},{5,20}},
              lineColor={0,0,0},
              textString="%k2"),
            Text(
              extent={{-100,-50},{5,-90}},
              lineColor={0,0,0},
              textString="%k3"),
            Text(
              extent={{2,36},{100,-44}},
              lineColor={0,0,0},
              textString="+")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Text(
                extent={{-100,50},{5,90}},
                lineColor={0,0,0},
                textString="k1"),Text(
                extent={{-100,-20},{5,20}},
                lineColor={0,0,0},
                textString="k2"),Text(
                extent={{-100,-50},{5,-90}},
                lineColor={0,0,0},
                textString="k3"),Text(
                extent={{2,46},{100,-34}},
                lineColor={0,0,0},
                textString="+")}));
    end Add3;

    block Product "Output product of the two inputs"
      extends Modelica_Blocks_Interfaces.SI2SO;

    equation
      y = u1*u2;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <i>product</i> of the corresponding elements of
the two inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>
    y = u1 * u2;
</pre>

</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.1), graphics={
            Line(points={{-100,60},{-40,60},{-30,40}}, color={0,0,127}),
            Line(points={{-100,-60},{-40,-60},{-30,-40}}, color={0,0,127}),
            Line(points={{50,0},{100,0}}, color={0,0,127}),
            Line(points={{-30,0},{30,0}}),
            Line(points={{-15,25.99},{15,-25.99}}),
            Line(points={{-15,-25.99},{15,25.99}}),
            Ellipse(lineColor={0,0,127}, extent={{-50,-50},{50,50}})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-100,60},{-40,60},{-30,
              40}}, color={0,0,255}),Line(points={{-100,-60},{-40,-60},{-30,-40}},
              color={0,0,255}),Line(points={{50,0},{100,0}}, color={0,0,255}),
              Line(points={{-30,0},{30,0}}, color={0,0,0}),Line(points={{-15,
              25.99},{15,-25.99}}, color={0,0,0}),Line(points={{-15,-25.99},{15,
              25.99}}, color={0,0,0}),Ellipse(extent={{-50,50},{50,-50}},
              lineColor={0,0,255})}));
    end Product;

    block Division "Output first input divided by second input"
      extends Modelica_Blocks_Interfaces.SI2SO;

    equation
      y = u1/u2;
      annotation (
        Documentation(info="<html>
<p>
This block computes the output <b>y</b> (element-wise)
by <i>dividing</i> the corresponding elements of
the two inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>
    y = u1 / u2;
</pre>

</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.1), graphics={
            Line(points={{50,0},{100,0}}, color={0,0,127}),
            Line(points={{-30,0},{30,0}}),
            Ellipse(fillPattern=FillPattern.Solid, extent={{-5,20},{5,30}}),
            Ellipse(fillPattern=FillPattern.Solid, extent={{-5,-30},{5,-20}}),
            Ellipse(lineColor={0,0,127}, extent={{-50,-50},{50,50}}),
            Text(
              lineColor={0,0,255},
              extent={{-150,110},{150,150}},
              textString="%name"),
            Line(points={{-100,60},{-66,60},{-40,30}}, color={0,0,127}),
            Line(points={{-100,-60},{0,-60},{0,-50}}, color={0,0,127})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{50,0},{100,0}},
              color={0,0,255}),Line(points={{-30,0},{30,0}}, color={0,0,0}),
              Ellipse(
                extent={{-5,20},{5,30}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{-5,-20},{5,-30}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Ellipse(extent={{-50,50},{50,-50}},
              lineColor={0,0,255}),Line(points={{-100,60},{-66,60},{-40,30}},
              color={0,0,255}),Line(points={{-100,-60},{0,-60},{0,-50}}, color={0,
              0,255})}));
    end Division;

    block Abs "Output the absolute value of the input"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter Boolean generateEvent=false
        "Choose whether events shall be generated" annotation (Evaluate=true);
    equation
      //y = abs(u);
      y = if generateEvent then (if u >= 0 then u else -u) else (if noEvent(u >=
        0) then u else -u);
      annotation (
        defaultComponentName="abs1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{92,0},{70,8},{70,-8},{92,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,80},{0,0},{80,80}}, color={0,0,0}),
            Line(points={{0,-14},{0,68}}, color={192,192,192}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-34,-28},{38,-76}},
              lineColor={192,192,192},
              textString="abs"),
            Line(points={{-88,0},{76,0}}, color={192,192,192})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-100,0},{76,0}}, color={192,
              192,192}),Polygon(
                points={{92,0},{76,6},{76,-6},{92,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,80},{0,0},{80,80}},
              color={0,0,0}),Line(points={{0,-80},{0,68}}, color={192,192,192}),
              Polygon(
                points={{0,90},{-8,68},{8,68},{0,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{0,-80},{0,68}},
              color={192,192,192}),Polygon(
                points={{0,90},{-8,68},{8,68},{0,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{7,98},{34,78}},
                lineColor={160,160,164},
                textString="u"),Text(
                extent={{74,-8},{96,-28}},
                lineColor={160,160,164},
                textString="y"),Text(
                extent={{52,-3},{72,-23}},
                textString="1",
                lineColor={0,0,255}),Text(
                extent={{-86,-1},{-66,-21}},
                textString="-1",
                lineColor={0,0,255}),Text(
                extent={{-28,79},{-8,59}},
                textString="1",
                lineColor={0,0,255})}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b>
as <i>absolute value</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>abs</b>( u );
</pre>
<p>
The Boolean parameter generateEvent decides whether Events are generated at zero crossing (Modelica specification before 3) or not.
</p>
</html>"));
    end Abs;

    block Sign "Output the sign of the input"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter Boolean generateEvent=false
        "Choose whether events shall be generated" annotation (Evaluate=true);
    equation
      //y = sign(u);
      y = if generateEvent then (if u > 0 then 1 elseif u < 0 then -1 else 0)
         else (if noEvent(u > 0) then 1 elseif noEvent(u < 0) then -1 else 0);
      annotation (
        defaultComponentName="sign1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{0,-80}}, color={0,0,0}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Text(
              extent={{-90,72},{-18,24}},
              lineColor={192,192,192},
              textString="sign"),
            Line(points={{0,80},{80,80}}, color={0,0,0}),
            Rectangle(
              extent={{-2,2},{2,-4}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-90,0},{68,0}}, color={192,
              192,192}),Polygon(
                points={{90,0},{68,8},{68,-8},{90,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{0,-80}},
              color={0,0,0}),Line(points={{-0.01,0},{0.01,0}}, color={0,0,0}),
              Line(points={{0,80},{80,80}}, color={0,0,0}),Rectangle(
                extent={{-2,2},{2,-4}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{0,-90},{0,84}},
              color={192,192,192}),Text(
                extent={{7,102},{32,82}},
                lineColor={160,160,164},
                textString="y"),Text(
                extent={{70,-6},{94,-26}},
                lineColor={160,160,164},
                textString="u"),Text(
                extent={{-25,86},{-5,70}},
                textString="1",
                lineColor={0,0,255}),Text(
                extent={{5,-72},{25,-88}},
                textString="-1",
                lineColor={0,0,255})}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b>
as <b>sign</b> of the input <b>u</b>:
</p>
<pre>
         1  <b>if</b> u &gt; 0
    y =  0  <b>if</b> u == 0
        -1  <b>if</b> u &lt; 0
</pre>
<p>
The Boolean parameter generateEvent decides whether Events are generated at zero crossing (Modelica specification before 3) or not.
</p>
</html>"));
    end Sign;

    block Sqrt "Output the square root of the input (input >= 0 required)"
      extends Modelica_Blocks_Interfaces.SISO;

    equation
      y = sqrt(u);
      annotation (
        defaultComponentName="sqrt1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-90,-80},{68,-80}}, color={192,192,192}),
            Polygon(
              points={{90,-80},{68,-72},{68,-88},{90,-80}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-80},{-79.2,-68.7},{-78.4,-64},{-76.8,-57.3},{-73.6,-47.9},
                  {-67.9,-36.1},{-59.1,-22.2},{-46.2,-6.49},{-28.5,10.7},{-4.42,
                  30},{27.7,51.3},{69.5,74.7},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-88},{-80,68}}, color={192,192,192}),
            Text(
              extent={{-8,-4},{64,-52}},
              lineColor={192,192,192},
              textString="sqrt")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-92,-80},{84,-80}}, color={
              192,192,192}),Polygon(
                points={{100,-80},{84,-74},{84,-86},{100,-80}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-79.2,-68.7},
              {-78.4,-64},{-76.8,-57.3},{-73.6,-47.9},{-67.9,-36.1},{-59.1,-22.2},
              {-46.2,-6.49},{-28.5,10.7},{-4.42,30},{27.7,51.3},{69.5,74.7},{80,
              80}}, color={0,0,0}),Polygon(
                points={{-80,98},{-86,82},{-74,82},{-80,98}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-90},{-80,84}},
              color={192,192,192}),Text(
                extent={{-71,98},{-44,78}},
                lineColor={160,160,164},
                textString="y"),Text(
                extent={{60,-52},{84,-72}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b>
as <i>square root</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>sqrt</b>( u );
</pre>
<p>
All elements of the input vector shall be zero or positive.
Otherwise an error occurs.
</p>

</html>"));
    end Sqrt;

    block Sin "Output the sine of the input"
      extends Modelica_Blocks_Interfaces.SISO;
    equation
      y = Modelica_Math.sin(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Line(
              points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},
                  {-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},
                  {-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},
                  {29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{
                  57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{12,84},{84,36}},
              lineColor={192,192,192},
              textString="sin")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,80},{-88,80}}, color={192,
              192,192}),Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
              Line(points={{-80,-90},{-80,84}}, color={192,192,192}),Text(
                extent={{-75,98},{-46,78}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{-80,96},{-86,80},{-74,80},{-80,96}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,0},{84,0}},
              color={192,192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,0},{-68.7,34.2},
              {-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,
              76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},
              {17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,
              -77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}},
              color={0,0,0}),Text(
                extent={{-105,72},{-85,88}},
                textString="1",
                lineColor={0,0,255}),Text(
                extent={{70,25},{90,5}},
                textString="2*pi",
                lineColor={0,0,255}),Text(
                extent={{-105,-72},{-85,-88}},
                textString="-1",
                lineColor={0,0,255}),Text(
                extent={{76,-10},{98,-30}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b>
as <b>sine</b> of the input <b>u</b>:
</p>
<pre>
    y = <b>sin</b>( u );
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/sin.png\"
     alt=\"sin.png\">
</p>

</html>"));
    end Sin;

    block Cos "Output the cosine of the input"
      extends Modelica_Blocks_Interfaces.SISO;

    equation
      y = Modelica_Math.cos(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,80},{-74.4,78.1},{-68.7,72.3},{-63.1,63},{-56.7,48.7},
                  {-48.6,26.6},{-29.3,-32.5},{-22.1,-51.7},{-15.7,-65.3},{-10.1,-73.8},
                  {-4.42,-78.8},{1.21,-79.9},{6.83,-77.1},{12.5,-70.6},{18.1,-60.6},
                  {24.5,-45.7},{32.6,-23},{50.3,31.3},{57.5,50.7},{63.9,64.6},{
                  69.5,73.4},{75.2,78.6},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Text(
              extent={{-36,82},{36,34}},
              lineColor={192,192,192},
              textString="cos")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,80},{-88,80}}, color={192,
              192,192}),Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
              Line(points={{-80,-90},{-80,84}}, color={192,192,192}),Text(
                extent={{-75,102},{-48,82}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-103,72},{-83,88}},
                textString="1",
                lineColor={0,0,255}),Text(
                extent={{-79,-72},{-59,-88}},
                textString="-1",
                lineColor={0,0,255}),Text(
                extent={{70,25},{90,5}},
                textString="2*pi",
                lineColor={0,0,255}),Line(points={{-100,0},{84,0}}, color={192,
              192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,80},{-74.4,78.1},
              {-68.7,72.3},{-63.1,63},{-56.7,48.7},{-48.6,26.6},{-29.3,-32.5},{-22.1,
              -51.7},{-15.7,-65.3},{-10.1,-73.8},{-4.42,-78.8},{1.21,-79.9},{6.83,
              -77.1},{12.5,-70.6},{18.1,-60.6},{24.5,-45.7},{32.6,-23},{50.3,31.3},
              {57.5,50.7},{63.9,64.6},{69.5,73.4},{75.2,78.6},{80,80}}, color={0,
              0,0}),Text(
                extent={{74,-4},{98,-24}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b>
as <b>cos</b> of the input <b>u</b>:
</p>
<pre>
    y = <b>cos</b>( u );
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/cos.png\"
     alt=\"cos.png\">
</p>

</html>"));
    end Cos;

    block Tan "Output the tangent of the input"
      extends Modelica_Blocks_Interfaces.SISO;

    equation
      y = Modelica_Math.tan(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Line(
              points={{-80,-80},{-78.4,-68.4},{-76.8,-59.7},{-74.4,-50},{-71.2,-40.9},
                  {-67.1,-33},{-60.7,-24.8},{-51.1,-17.2},{-35.8,-9.98},{-4.42,-1.07},
                  {33.4,9.12},{49.4,16.2},{59.1,23.2},{65.5,30.6},{70.4,39.1},{
                  73.6,47.4},{76,56.1},{77.6,63.8},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-90,72},{-18,24}},
              lineColor={192,192,192},
              textString="tan")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-88},{0,86}}, color={192,192,192}),Text(
                extent={{11,100},{38,80}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,102},{-6,86},{6,86},{0,102}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-37,-72},{-17,-88}},
                textString="-5.8",
                lineColor={0,0,255}),Text(
                extent={{-33,86},{-13,70}},
                textString=" 5.8",
                lineColor={0,0,255}),Text(
                extent={{70,25},{90,5}},
                textString="1.4",
                lineColor={0,0,255}),Line(points={{-100,0},{84,0}}, color={192,
              192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-78.4,-68.4},
              {-76.8,-59.7},{-74.4,-50},{-71.2,-40.9},{-67.1,-33},{-60.7,-24.8},{
              -51.1,-17.2},{-35.8,-9.98},{-4.42,-1.07},{33.4,9.12},{49.4,16.2},{
              59.1,23.2},{65.5,30.6},{70.4,39.1},{73.6,47.4},{76,56.1},{77.6,63.8},
              {80,80}}, color={0,0,0}),Text(
                extent={{70,-6},{94,-26}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b>
as <b>tan</b> of the input <b>u</b>:
</p>
<pre>
    y = <b>tan</b>( u );
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/tan.png\"
     alt=\"tan.png\">
</p>

</html>"));
    end Tan;

    block Asin "Output the arc sine of the input"
      extends Modelica_Blocks_Interfaces.SISO;

    equation
      y = Modelica_Math.asin(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Line(
              points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,
                  -49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{
                  68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-88,78},{-16,30}},
              lineColor={192,192,192},
              textString="asin")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-90},{0,84}}, color={192,192,192}),Text(
                extent={{9,102},{36,82}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Text(
                extent={{-40,-72},{-15,-88}},
                textString="-pi/2",
                lineColor={0,0,255}),Text(
                extent={{-38,88},{-13,72}},
                textString=" pi/2",
                lineColor={0,0,255}),Text(
                extent={{70,25},{90,5}},
                textString="+1",
                lineColor={0,0,255}),Text(
                extent={{-90,21},{-70,1}},
                textString="-1",
                lineColor={0,0,255}),Line(points={{-100,0},{84,0}}, color={192,
              192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-79.2,-72.8},
              {-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},
              {37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}},
              color={0,0,0}),Text(
                extent={{74,-4},{100,-26}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>sine-inverse</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>asin</b>( u );
</pre>
<p>
The absolute values of the elements of the input <b>u</b> need to
be less or equal to one (<b>abs</b>( u ) <= 1).
Otherwise an error occurs.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/asin.png\"
     alt=\"atan.png\">
</p>

</html>"));
    end Asin;

    block Acos "Output the arc cosine of the input"
      extends Modelica_Blocks_Interfaces.SISO;
    equation
      y = Modelica_Math.acos(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,80},{-79.2,72.8},{-77.6,67.5},{-73.6,59.4},{-66.3,49.8},
                  {-53.5,37.3},{-30.2,19.7},{37.4,-24.8},{57.5,-40.8},{68.7,-52.7},
                  {75.2,-62.2},{77.6,-67.5},{80,-80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Line(points={{0,-88},{0,68}}, color={192,192,192}),
            Line(points={{-90,-80},{68,-80}}, color={192,192,192}),
            Polygon(
              points={{90,-80},{68,-72},{68,-88},{90,-80}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-86,-14},{-14,-62}},
              lineColor={192,192,192},
              textString="acos")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-90},{0,84}}, color={192,192,192}),Text(
                extent={{13,100},{42,82}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,-80},{84,-80}},
              color={192,192,192}),Polygon(
                points={{100,-80},{84,-74},{84,-86},{100,-80}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,80},{-79.2,72.8},
              {-77.6,67.5},{-73.6,59.4},{-66.3,49.8},{-53.5,37.3},{-30.2,19.7},{
              37.4,-24.8},{57.5,-40.8},{68.7,-52.7},{75.2,-62.2},{77.6,-67.5},{80,
              -80}}, color={0,0,0}),Text(
                extent={{-30,88},{-5,72}},
                textString=" pi",
                lineColor={0,0,255}),Text(
                extent={{-94,-57},{-74,-77}},
                textString="-1",
                lineColor={0,0,255}),Text(
                extent={{80,-45},{100,-65}},
                textString="+1",
                lineColor={0,0,255}),Text(
                extent={{76,-84},{102,-102}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>cosine-inverse</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>acos</b>( u );
</pre>
<p>
The absolute values of the elements of the input <b>u</b> need to
be less or equal to one (<b>abs</b>( u ) <= 1).
Otherwise an error occurs.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/acos.png\"
     alt=\"acos.png\">
</p>

</html>"));
    end Acos;

    block Atan "Output the arc tangent of the input"
      extends Modelica_Blocks_Interfaces.SISO;
    equation
      y = Modelica_Math.atan(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Line(
              points={{-80,-80},{-52.7,-75.2},{-37.4,-69.7},{-26.9,-63},{-19.7,-55.2},
                  {-14.1,-45.8},{-10.1,-36.4},{-6.03,-23.9},{-1.21,-5.06},{5.23,
                  21},{9.25,34.1},{13.3,44.2},{18.1,52.9},{24.5,60.8},{33.4,67.6},
                  {47,73.6},{69.5,78.6},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-86,68},{-14,20}},
              lineColor={192,192,192},
              textString="atan")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-90},{0,84}}, color={192,192,192}),Text(
                extent={{13,102},{42,82}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,0},{84,0}},
              color={192,192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-52.7,-75.2},
              {-37.4,-69.7},{-26.9,-63},{-19.7,-55.2},{-14.1,-45.8},{-10.1,-36.4},
              {-6.03,-23.9},{-1.21,-5.06},{5.23,21},{9.25,34.1},{13.3,44.2},{18.1,
              52.9},{24.5,60.8},{33.4,67.6},{47,73.6},{69.5,78.6},{80,80}}, color=
               {0,0,0}),Text(
                extent={{-32,91},{-12,71}},
                textString="1.4",
                lineColor={0,0,255}),Text(
                extent={{-32,-71},{-12,-91}},
                textString="-1.4",
                lineColor={0,0,255}),Text(
                extent={{73,26},{93,10}},
                textString=" 5.8",
                lineColor={0,0,255}),Text(
                extent={{-103,20},{-83,4}},
                textString="-5.8",
                lineColor={0,0,255}),Text(
                extent={{66,-8},{94,-28}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>tangent-inverse</i> of the input <b>u</b>:
</p>
<pre>
    y= <b>atan</b>( u );
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/atan.png\"
     alt=\"atan.png\">
</p>

</html>"));
    end Atan;

    block Atan2 "Output atan(u1/u2) of the inputs u1 and u2"
      extends Modelica_Blocks_Interfaces.SI2SO;
    equation
      y = Modelica_Math.atan2(u1, u2);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-34.9},{-46.1,-31.4},{-29.4,-27.1},{-18.3,-21.5},{-10.3,
                  -14.5},{-2.03,-3.17},{7.97,11.6},{15.5,19.4},{24.3,25},{39,30},
                  {62.1,33.5},{80,34.9}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Line(
              points={{-80,45.1},{-45.9,48.7},{-29.1,52.9},{-18.1,58.6},{-10.2,
                  65.8},{-1.82,77.2},{0,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Line(
              points={{0,-80},{8.93,-67.2},{17.1,-59.3},{27.3,-53.6},{42.1,-49.4},
                  {69.9,-45.8},{80,-45.1}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Text(
              extent={{-90,-46},{-18,-94}},
              lineColor={192,192,192},
              textString="atan2")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-90},{0,84}}, color={192,192,192}),Text(
                extent={{11,98},{42,78}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,0},{84,0}},
              color={192,192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{0,-80},{8.93,-67.2},
              {17.1,-59.3},{27.3,-53.6},{42.1,-49.4},{69.9,-45.8},{80,-45.1}},
              color={0,0,0}),Line(points={{-80,-34.9},{-46.1,-31.4},{-29.4,-27.1},
              {-18.3,-21.5},{-10.3,-14.5},{-2.03,-3.17},{7.97,11.6},{15.5,19.4},{
              24.3,25},{39,30},{62.1,33.5},{80,34.9}}, color={0,0,0}),Line(points=
               {{-80,45.1},{-45.9,48.7},{-29.1,52.9},{-18.1,58.6},{-10.2,65.8},{-1.82,
              77.2},{0,80}}, color={0,0,0}),Text(
                extent={{-30,89},{-10,70}},
                textString="pi",
                lineColor={0,0,255}),Text(
                extent={{-30,-69},{-10,-88}},
                textString="-pi",
                lineColor={0,0,255}),Text(
                extent={{-30,49},{-10,30}},
                textString="pi/2",
                lineColor={0,0,255}),Line(points={{0,40},{-8,40}}, color={192,192,
              192}),Line(points={{0,-40},{-8,-40}}, color={192,192,192}),Text(
                extent={{-30,-31},{-10,-50}},
                textString="-pi/2",
                lineColor={0,0,255}),Text(
                extent={{48,0},{100,-34}},
                lineColor={160,160,164},
                textString="u1 / u2")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>tangent-inverse</i> of the input <b>u1</b> divided by
input <b>u2</b>:
</p>
<pre>
    y = <b>atan2</b>( u1, u2 );
</pre>
<p>
u1 and u2 shall not be zero at the same time instant.
<b>Atan2</b> uses the sign of u1 and u2 in order to construct
the solution in the range -180 deg &le; y &le; 180 deg, whereas
block <b>Atan</b> gives a solution in the range
-90 deg &le; y &le; 90 deg.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/atan2.png\"
     alt=\"atan2.png\">
</p>

</html>"));
    end Atan2;

    block Sinh "Output the hyperbolic sine of the input"
      extends Modelica_Blocks_Interfaces.SISO;

    equation
      y = Modelica_Math.sinh(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-86,80},{-14,32}},
              lineColor={192,192,192},
              textString="sinh"),
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Line(
              points={{-80,-80},{-76,-65.4},{-71.2,-51.4},{-65.5,-38.8},{-59.1,-28.1},
                  {-51.1,-18.7},{-41.4,-11.4},{-27.7,-5.5},{-4.42,-0.653},{24.5,
                  4.57},{39,10.1},{49.4,17.2},{57.5,25.9},{63.9,35.8},{69.5,47.4},
                  {74.4,60.4},{78.4,73.8},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-90},{0,84}}, color={192,192,192}),Text(
                extent={{9,98},{34,78}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,0},{84,0}},
              color={192,192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-76,-65.4},
              {-71.2,-51.4},{-65.5,-38.8},{-59.1,-28.1},{-51.1,-18.7},{-41.4,-11.4},
              {-27.7,-5.5},{-4.42,-0.653},{24.5,4.57},{39,10.1},{49.4,17.2},{57.5,
              25.9},{63.9,35.8},{69.5,47.4},{74.4,60.4},{78.4,73.8},{80,80}},
              color={0,0,0}),Text(
                extent={{-31,72},{-11,88}},
                textString="27",
                lineColor={0,0,255}),Text(
                extent={{-35,-88},{-15,-72}},
                textString="-27",
                lineColor={0,0,255}),Text(
                extent={{70,25},{90,5}},
                textString="4",
                lineColor={0,0,255}),Text(
                extent={{-98,21},{-78,1}},
                textString="-4",
                lineColor={0,0,255}),Text(
                extent={{72,-6},{96,-26}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>hyperbolic sine</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>sinh</b>( u );
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/sinh.png\"
     alt=\"sinh.png\">
</p>

</html>"));
    end Sinh;

    block Cosh "Output the hyperbolic cosine of the input"
      extends Modelica_Blocks_Interfaces.SISO;
    equation
      y = Modelica_Math.cosh(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Text(
              extent={{4,66},{66,20}},
              lineColor={192,192,192},
              textString="cosh"),
            Line(
              points={{-80,80},{-77.6,61.1},{-74.4,39.3},{-71.2,20.7},{-67.1,1.29},
                  {-63.1,-14.6},{-58.3,-29.8},{-52.7,-43.5},{-46.2,-55.1},{-39,-64.3},
                  {-30.2,-71.7},{-18.9,-77.1},{-4.42,-79.9},{10.9,-79.1},{23.7,-75.2},
                  {34.2,-68.7},{42.2,-60.6},{48.6,-51.2},{54.3,-40},{59.1,-27.5},
                  {63.1,-14.6},{67.1,1.29},{71.2,20.7},{74.4,39.3},{77.6,61.1},{
                  80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Line(points={{-90,-86.083},{68,-86.083}}, color={192,192,192}),
            Polygon(
              points={{90,-86.083},{68,-78.083},{68,-94.083},{90,-86.083}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-90},{0,84}}, color={192,192,192}),Text(
                extent={{11,98},{38,78}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,-86.083},{84,-86.083}},
              color={192,192,192}),Polygon(
                points={{100,-86.083},{84,-80.083},{84,-92.083},{100,-86.083}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,80},{-77.6,61.1},
              {-74.4,39.3},{-71.2,20.7},{-67.1,1.29},{-63.1,-14.6},{-58.3,-29.8},
              {-52.7,-43.5},{-46.2,-55.1},{-39,-64.3},{-30.2,-71.7},{-18.9,-77.1},
              {-4.42,-79.9},{10.9,-79.1},{23.7,-75.2},{34.2,-68.7},{42.2,-60.6},{
              48.6,-51.2},{54.3,-40},{59.1,-27.5},{63.1,-14.6},{67.1,1.29},{71.2,
              20.7},{74.4,39.3},{77.6,61.1},{80,80}}, color={0,0,0}),Text(
                extent={{-31,72},{-11,88}},
                textString="27",
                lineColor={0,0,255}),Text(
                extent={{62,-67},{82,-87}},
                textString="4",
                lineColor={0,0,255}),Text(
                extent={{-104,-63},{-84,-83}},
                textString="-4",
                lineColor={0,0,255}),Text(
                extent={{78,-54},{100,-74}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>hyperbolic cosine</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>cosh</b>( u );
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/cosh.png\"
     alt=\"cosh.png\">
</p>

</html>"));
    end Cosh;

    block Tanh "Output the hyperbolic tangent of the input"
      extends Modelica_Blocks_Interfaces.SISO;
    equation
      y = Modelica_Math.tanh(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{0,-90},{0,84}}, color={192,192,192}),
            Line(points={{-100,0},{84,0}}, color={192,192,192}),
            Line(
              points={{-80,-80},{-47.8,-78.7},{-35.8,-75.7},{-27.7,-70.6},{-22.1,
                  -64.2},{-17.3,-55.9},{-12.5,-44.3},{-7.64,-29.2},{-1.21,-4.82},
                  {6.83,26.3},{11.7,42},{16.5,54.2},{21.3,63.1},{26.9,69.9},{34.2,
                  75},{45.4,78.4},{72,79.9},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-88,72},{-16,24}},
              lineColor={192,192,192},
              textString="tanh"),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-90},{0,84}}, color={192,192,192}),Text(
                extent={{9,98},{42,80}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,0},{84,0}},
              color={192,192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-47.8,-78.7},
              {-35.8,-75.7},{-27.7,-70.6},{-22.1,-64.2},{-17.3,-55.9},{-12.5,-44.3},
              {-7.64,-29.2},{-1.21,-4.82},{6.83,26.3},{11.7,42},{16.5,54.2},{21.3,
              63.1},{26.9,69.9},{34.2,75},{45.4,78.4},{72,79.9},{80,80}}, color={
              0,0,0}),Text(
                extent={{70,25},{90,5}},
                textString="4",
                lineColor={0,0,255}),Text(
                extent={{-106,21},{-86,1}},
                textString="-4",
                lineColor={0,0,255}),Text(
                extent={{-29,72},{-9,88}},
                textString="1",
                lineColor={0,0,255}),Text(
                extent={{3,-72},{23,-88}},
                textString="-1",
                lineColor={0,0,255}),Text(
                extent={{72,-8},{98,-26}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>hyperbolic tangent</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>tanh</b>( u );
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/tanh.png\"
     alt=\"tanh.png\">
</p>

</html>"));
    end Tanh;

    block Exp "Output the exponential (base e) of the input"
      extends Modelica_Blocks_Interfaces.SISO;

    equation
      y = Modelica_Math.exp(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-86,50},{-14,2}},
              lineColor={192,192,192},
              textString="exp"),
            Line(points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},
                  {34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{
                  67.1,18.6},{72,38.2},{76,57.6},{80,80}}, color={0,0,0}),
            Line(
              points={{-90,-80.3976},{68,-80.3976}},
              color={192,192,192},
              smooth=Smooth.Bezier),
            Polygon(
              points={{90,-80.3976},{68,-72.3976},{68,-88.3976},{90,-80.3976}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,
              192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(
              points={{0,-90},{0,84}}, color={192,192,192}),Text(
                extent={{9,100},{40,80}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{0,100},{-6,84},{6,84},{0,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,-80.3976},{84,-80.3976}},
              color={192,192,192}),Polygon(
                points={{100,-80.3976},{84,-74.3976},{84,-86.3976},{100,-80.3976}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-31,-77.9},
              {-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},
              {56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}},
              color={0,0,0}),Text(
                extent={{-31,72},{-11,88}},
                textString="20",
                lineColor={0,0,255}),Text(
                extent={{-92,-83},{-72,-103}},
                textString="-3",
                lineColor={0,0,255}),Text(
                extent={{70,-83},{90,-103}},
                textString="3",
                lineColor={0,0,255}),Text(
                extent={{-18,-53},{2,-73}},
                textString="1",
                lineColor={0,0,255}),Text(
                extent={{66,-52},{96,-72}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>exponential</i> (of base e) of the input <b>u</b>:
</p>
<pre>
    y = <b>exp</b>( u );
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/exp.png\"
     alt=\"exp.png\">
</p>

</html>"));
    end Exp;

    block Log
      "Output the natural (base e) logarithm of the input (input > 0 required)"

      extends Modelica_Blocks_Interfaces.SISO;
    equation
      y = Modelica_Math.log(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},
                  {-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},
                  {-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-6,-24},{66,-72}},
              lineColor={192,192,192},
              textString="log")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,80},{-88,80}}, color={192,
              192,192}),Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
              Line(points={{-80,-90},{-80,84}}, color={192,192,192}),Text(
                extent={{-67,98},{-40,80}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,0},{84,0}},
              color={192,192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-79.2,-50.6},
              {-78.4,-37},{-77.6,-28},{-76.8,-21.3},{-75.2,-11.4},{-72.8,-1.31},{
              -69.5,8.08},{-64.7,17.9},{-57.5,28},{-47,38.1},{-31.8,48.1},{-10.1,
              58},{22.1,68},{68.7,78.1},{80,80}}, color={0,0,0}),Text(
                extent={{-105,72},{-85,88}},
                textString="3",
                lineColor={0,0,255}),Text(
                extent={{-109,-88},{-89,-72}},
                textString="-3",
                lineColor={0,0,255}),Text(
                extent={{70,-3},{90,-23}},
                textString="20",
                lineColor={0,0,255}),Text(
                extent={{-78,-1},{-58,-21}},
                textString="1",
                lineColor={0,0,255}),Text(
                extent={{68,28},{94,8}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>natural (base e) logarithm</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>log</b>( u );
</pre>
<p>
An error occurs if the elements of the input <b>u</b> are
zero or negative.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/log.png\"
     alt=\"log.png\">
</p>

</html>"));
    end Log;

    block Log10
      "Output the base 10 logarithm of the input (input > 0 required)"

      extends Modelica_Blocks_Interfaces.SISO;
    equation
      y = Modelica_Math.log10(u);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Line(
              points={{-79.8,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},
                  {-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},
                  {-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}},
              color={0,0,0},
              smooth=Smooth.Bezier),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
            Text(
              extent={{-30,-22},{60,-70}},
              lineColor={192,192,192},
              textString="log10")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,80},{-88,80}}, color={192,
              192,192}),Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
              Line(points={{-80,-90},{-80,84}}, color={192,192,192}),Text(
                extent={{-65,96},{-38,78}},
                lineColor={160,160,164},
                textString="y"),Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-100,0},{84,0}},
              color={192,192,192}),Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-79.8,-80},{-79.2,-50.6},
              {-78.4,-37},{-77.6,-28},{-76.8,-21.3},{-75.2,-11.4},{-72.8,-1.31},{
              -69.5,8.08},{-64.7,17.9},{-57.5,28},{-47,38.1},{-31.8,48.1},{-10.1,
              58},{22.1,68},{68.7,78.1},{80,80}}, color={0,0,0}),Text(
                extent={{70,-3},{90,-23}},
                textString="20",
                lineColor={0,0,255}),Text(
                extent={{-78,-1},{-58,-21}},
                textString="1",
                lineColor={0,0,255}),Text(
                extent={{-109,72},{-89,88}},
                textString=" 1.3",
                lineColor={0,0,255}),Text(
                extent={{-109,-88},{-89,-72}},
                textString="-1.3",
                lineColor={0,0,255}),Text(
                extent={{62,30},{90,10}},
                lineColor={160,160,164},
                textString="u")}),
        Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>base 10 logarithm</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>log10</b>( u );
</pre>
<p>
An error occurs if the elements of the input <b>u</b> are
zero or negative.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/log10.png\"
     alt=\"log10.png\">
</p>

</html>"));
    end Log10;

    block RealToInteger "Convert Real to Integer signal"
      extends Icons.IntegerBlock;
    public
      Modelica_Blocks_Interfaces.RealInput u "Connector of Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0)));
      Modelica_Blocks_Interfaces.IntegerOutput y
        "Connector of Integer output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = if (u > 0) then integer(floor(u + 0.5)) else integer(ceil(u - 0.5));
      annotation (Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1), graphics={
            Text(
              lineColor={0,0,127},
              extent={{-100.0,-40.0},{0.0,40.0}},
              textString="R"),
            Text(
              lineColor={255,127,0},
              extent={{20.0,-40.0},{120.0,40.0}},
              textString="I"),
            Polygon(
              lineColor={255,127,0},
              fillColor={255,127,0},
              fillPattern=FillPattern.Solid,
              points={{50.0,0.0},{30.0,20.0},{30.0,10.0},{0.0,10.0},{0.0,-10.0},{
                  30.0,-10.0},{30.0,-20.0},{50.0,0.0}})}), Documentation(info="<html>
<p>
This block computes the output <b>y</b>
as <i>nearest integer value</i> of the input <b>u</b>:
</p>
<pre>    y = <b>integer</b>( <b>floor</b>( u + 0.5 ) )  for  u &gt; 0;
    y = <b>integer</b>( <b>ceil </b>( u - 0.5 ) )  for  u &lt; 0;
</pre>
</html>"));
    end RealToInteger;

    block IntegerToReal "Convert Integer to Real signals"
      extends Icons.Block;
      Modelica_Blocks_Interfaces.IntegerInput u
        "Connector of Integer input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
    equation
      y = u;
      annotation (Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1), graphics={
            Text(
              lineColor={255,127,0},
              extent={{-120.0,-40.0},{-20.0,40.0}},
              textString="I"),
            Text(
              lineColor={0,0,127},
              fillPattern=FillPattern.Solid,
              extent={{0.0,-40.0},{100.0,40.0}},
              textString="R"),
            Polygon(
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              points={{10.0,0.0},{-10.0,20.0},{-10.0,10.0},{-40.0,10.0},{-40.0,-10.0},
                  {-10.0,-10.0},{-10.0,-20.0},{10.0,0.0}})}), Documentation(info="<html>
<p>
This block computes the output <b>y</b>
as <i>Real equivalent</i> of the Integer input <b>u</b>:
</p>
<pre>    y = u;
</pre>
<p>where <b>u</b> is of Integer and <b>y</b> of Real type.</p>
</html>"));
    end IntegerToReal;

    block BooleanToReal "Convert Boolean to Real signal"
      extends Modelica_Blocks_Interfaces.partialBooleanSI;
      parameter Real realTrue=1.0 "Output signal for true Boolean input";
      parameter Real realFalse=0.0 "Output signal for false Boolean input";

      Modelica_Blocks_Interfaces.RealOutput y "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));

    equation
      y = if u then realTrue else realFalse;
      annotation (Documentation(info="<html>
<p>
This block computes the output <b>y</b>
as <i>Real equivalent</i> of the Boolean input <b>u</b>:
</p>
<pre>    y = <b>if</b> u <b>then</b> realTrue <b>else</b> realFalse;
</pre>
<p>where <b>u</b> is of Boolean and <b>y</b> of Real type,
and <b>realTrue</b> and <b>realFalse</b> are parameters.
</p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{-86,92},{-6,10}},
              lineColor={255,0,255},
              textString="B"),
            Polygon(
              points={{-12,-46},{-32,-26},{-32,-36},{-64,-36},{-64,-56},{-32,-56},
                  {-32,-66},{-12,-46}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Text(
              extent={{8,-4},{92,-94}},
              textString="R",
              lineColor={0,0,127})}));
    end BooleanToReal;

    block BooleanToInteger "Convert Boolean to Integer signal"
      extends Modelica_Blocks_Interfaces.partialBooleanSI;
      parameter Integer integerTrue=1 "Output signal for true Boolean input";
      parameter Integer integerFalse=0 "Output signal for false Boolean input";

      Modelica_Blocks_Interfaces.IntegerOutput y
        "Connector of Integer output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));

    equation
      y = if u then integerTrue else integerFalse;
      annotation (Documentation(info="<html>
<p>
This block computes the output <b>y</b>
as <i>Integer equivalent</i> of the Boolean input <b>u</b>:
</p>
<pre>    y = <b>if</b> u <b>then</b> integerTrue <b>else</b> integerFalse;
</pre>
<p>where <b>u</b> is of Boolean and <b>y</b> of Integer type,
and <b>integerTrue</b> and <b>integerFalse</b> are parameters.
</p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{-86,92},{-6,10}},
              lineColor={255,0,255},
              textString="B"),
            Polygon(
              points={{-12,-46},{-32,-26},{-32,-36},{-64,-36},{-64,-56},{-32,-56},
                  {-32,-66},{-12,-46}},
              lineColor={255,170,85},
              fillColor={255,170,85},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{8,-4},{92,-94}},
              lineColor={255,170,85},
              textString="I")}));
    end BooleanToInteger;

    block RealToBoolean "Convert Real to Boolean signal"

      Modelica_Blocks_Interfaces.RealInput u "Connector of Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0)));
      extends Modelica_Blocks_Interfaces.partialBooleanSO;
      parameter Real threshold=0.5
        "Output signal y is true, if input u >= threshold";

    equation
      y = u >= threshold;
      annotation (Documentation(info="<html>
<p>
This block computes the Boolean output <b>y</b>
from the Real input <b>u</b> by the equation:
</p>

<pre>    y = u &ge; threshold;
</pre>

<p>
where <b>threshold</b> is a parameter.
</p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{-86,92},{-6,10}},
              lineColor={0,0,127},
              textString="R"),
            Polygon(
              points={{-12,-46},{-32,-26},{-32,-36},{-64,-36},{-64,-56},{-32,-56},
                  {-32,-66},{-12,-46}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{8,-4},{92,-94}},
              lineColor={255,0,255},
              textString="B")}));
    end RealToBoolean;

    block IntegerToBoolean "Convert Integer to Boolean signal"

      Modelica_Blocks_Interfaces.IntegerInput u
        "Connector of Integer input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      extends Modelica_Blocks_Interfaces.partialBooleanSO;
      parameter Integer threshold=1
        "Output signal y is true, if input u >= threshold";

    equation
      y = u >= threshold;
      annotation (Documentation(info="<html>
<p>
This block computes the Boolean output <b>y</b>
from the Integer input <b>u</b> by the equation:
</p>

<pre>    y = u &ge; threshold;
</pre>

<p>
where <b>threshold</b> is a parameter.
</p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{-86,92},{-6,10}},
              lineColor={255,128,0},
              textString="I"),
            Polygon(
              points={{-12,-46},{-32,-26},{-32,-36},{-64,-36},{-64,-56},{-32,-56},
                  {-32,-66},{-12,-46}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{8,-4},{92,-94}},
              lineColor={255,0,255},
              textString="B")}));
    end IntegerToBoolean;

    block RectangularToPolar
      "Convert rectangular coordinates to polar coordinates"
      extends Icons.Block;
      Modelica_Blocks_Interfaces.RealInput u_re
        "Real part of rectangular representation" annotation (Placement(
            transformation(extent={{-140,40},{-100,80}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u_im
        "Imaginary part of rectangular representation" annotation (Placement(
            transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y_abs
        "Length of polar representation" annotation (Placement(transformation(
              extent={{100,50},{120,70}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y_arg
        "Angle of polar representation" annotation (Placement(transformation(
              extent={{100,-70},{120,-50}}, rotation=0)));

    equation
      y_abs = sqrt(u_re*u_re + u_im*u_im);
      y_arg = Modelica_Math.atan2(u_im, u_re);
      annotation (Icon(graphics={
            Text(
              extent={{-90,80},{-20,40}},
              lineColor={0,0,0},
              textString="re"),
            Text(
              extent={{-90,-40},{-20,-80}},
              lineColor={0,0,0},
              textString="im"),
            Text(
              extent={{20,80},{90,40}},
              lineColor={0,0,0},
              textString="abs"),
            Text(
              extent={{20,-40},{90,-80}},
              lineColor={0,0,0},
              textString="arg")}), Documentation(info="<html>
<p>
The input values of this block are the rectangular components
<code>u_re</code> and <code>u_im</code> of a phasor in two dimensions.
This block calculates the length <code>y_abs</code> and
the angle <code>y_arg</code> of the polar representation of this phasor.
</p>

<pre>
  y_abs = abs(u_re + j*u_im) = sqrt( u_re<sup>2</sup> + u_im<sup>2</sup> )
  y_arg = arg(u_re + j*u_im) = atan2(u_im, u_re)
</pre>
</html>"));
    end RectangularToPolar;

    block PolarToRectangular
      "Convert polar coordinates to rectangular coordinates"
      extends Icons.Block;
      Modelica_Blocks_Interfaces.RealInput u_abs
        "Length of polar representation" annotation (Placement(transformation(
              extent={{-140,40},{-100,80}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u_arg
        "Angle of polar representation" annotation (Placement(transformation(
              extent={{-140,-80},{-100,-40}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y_re
        "Real part of rectangular representation" annotation (Placement(
            transformation(extent={{100,50},{120,70}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y_im
        "Imaginary part of rectangular representation" annotation (Placement(
            transformation(extent={{100,-70},{120,-50}}, rotation=0)));

    equation
      y_re = u_abs*Modelica_Math.cos(u_arg);
      y_im = u_abs*Modelica_Math.sin(u_arg);
      annotation (Icon(graphics={
            Text(
              extent={{-90,80},{-20,40}},
              lineColor={0,0,0},
              textString="abs"),
            Text(
              extent={{-90,-40},{-20,-80}},
              lineColor={0,0,0},
              textString="arg"),
            Text(
              extent={{20,80},{90,40}},
              lineColor={0,0,0},
              textString="re"),
            Text(
              extent={{20,-40},{90,-80}},
              lineColor={0,0,0},
              textString="im")}), Documentation(info="<html>
<p>
The input values of this block are the polar components <code>uabs</code> and <code>uarg</code> of a phasor.
This block calculates the components <code>y_re</code> and <code>y_im</code> of the rectangular representation of this phasor.
</p>
<pre>
   y_re = u_abs * cos( u_arg )
   y_im = u_abs * sin( u_arg )
</pre>
</html>"));
    end PolarToRectangular;

    block Mean "Calculate mean over period 1/f"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter SIunits.Frequency f(start=50) "Base frequency";
      parameter Real x0=0 "Start value of integrator state";
      parameter Boolean yGreaterOrEqualZero=false
        "=true, if output y is guaranteed to be >= 0 for the exact solution"
        annotation (Evaluate=true, Dialog(tab="Advanced"));
    protected
      parameter SIunits.Time t0(fixed=false) "Start time of simulation";
      Real x "Integrator state";
    initial equation
      t0 = time;
      x = x0;
      y = 0;
    equation
      der(x) = u;
      when sample(t0 + 1/f, 1/f) then
        y = if not yGreaterOrEqualZero then f*pre(x) else max(0.0, f*pre(x));
        reinit(x, 0);
      end when;
      annotation (Documentation(info="<html>
<p>
This block calculates the mean of the input signal u over the given period 1/f:
</p>
<pre>
1 T
- &int; u(t) dt
T 0
</pre>
<p>
Note: The output is updated after each period defined by 1/f.
</p>

<p>
If parameter <b>yGreaterOrEqualZero</b> in the Advanced tab is <b>true</b> (default = <b>false</b>),
then the modeller provides the information that the mean of the input signal is guaranteed
to be &ge; 0 for the exact solution. However, due to inaccuracies in the numerical integration scheme,
the output might be slightly negative. If this parameter is set to true, then the output is
explicitly set to 0.0, if the mean value results in a negative value.
</p>
</html>"),   Icon(graphics={Text(
              extent={{-80,60},{80,20}},
              lineColor={0,0,0},
              textString="mean"), Text(
              extent={{-80,-20},{80,-60}},
              lineColor={0,0,0},
              textString="f=%f")}));
    end Mean;

    block RectifiedMean "Calculate rectified mean over period 1/f"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter SIunits.Frequency f(start=50) "Base frequency";
      parameter Real x0=0 "Start value of integrator state";
      Mean mean(final f=f, final x0=x0)
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Abs abs1
        annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    equation
      connect(u, abs1.u) annotation (Line(
          points={{-120,0},{-62,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(abs1.y, mean.u) annotation (Line(
          points={{-39,0},{-2,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mean.y, y) annotation (Line(
          points={{21,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Documentation(info="<html>
<p>
This block calculates the rectified mean of the input signal u over the given period 1/f, using the
<a href=\"modelica://Modelica.Blocks.Math.Mean\">mean block</a>.
</p>
<p>
Note: The output is updated after each period defined by 1/f.
</p>
</html>"),   Icon(graphics={Text(
              extent={{-80,60},{80,20}},
              lineColor={0,0,0},
              textString="RM"), Text(
              extent={{-80,-20},{80,-60}},
              lineColor={0,0,0},
              textString="f=%f")}));
    end RectifiedMean;

    block RootMeanSquare "Calculate root mean square over period 1/f"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter SIunits.Frequency f(start=50) "Base frequency";
      parameter Real x0=0 "Start value of integrator state";
      MultiProduct product(nu=2)
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Mean mean(
        final f=f,
        final yGreaterOrEqualZero=true,
        final x0=x0)
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Sqrt sqrt1
        annotation (Placement(transformation(extent={{40,-10},{60,10}})));
    equation

      connect(product.y, mean.u) annotation (Line(
          points={{-18.3,0},{-2,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mean.y, sqrt1.u) annotation (Line(
          points={{21,0},{38,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sqrt1.y, y) annotation (Line(
          points={{61,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, product.u[1]) annotation (Line(
          points={{-120,0},{-60,0},{-60,3.5},{-40,3.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, product.u[2]) annotation (Line(
          points={{-120,0},{-60,0},{-60,-3.5},{-40,-3.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Documentation(info="<html>
<p>
This block calculates the root mean square of the input signal u over the given period 1/f, using the
<a href=\"modelica://Modelica.Blocks.Math.Mean\">mean block</a>.
</p>
<p>
Note: The output is updated after each period defined by 1/f.
</p>
</html>"),   Icon(graphics={Text(
              extent={{-80,60},{80,20}},
              lineColor={0,0,0},
              textString="RMS"), Text(
              extent={{-80,-20},{80,-60}},
              lineColor={0,0,0},
              textString="f=%f")}));
    end RootMeanSquare;

    block Harmonic "Calculate harmonic over period 1/f"
      extends Icons.Block;
      parameter SIunits.Frequency f(start=50) "Base frequency";
      parameter Integer k(start=1) "Order of harmonic";
      parameter Real x0Cos=0 "Start value of cos integrator state";
      parameter Real x0Sin=0 "Start value of sin integrator state";
      Sources.Sine sin1(
        final amplitude=sqrt(2),
        final phase=Modelica_Constants.pi/2,
        final freqHz=k*f) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,70})));
      Sources.Sine sin2(
        final amplitude=sqrt(2),
        final phase=0,
        final freqHz=k*f) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-70})));
      MultiProduct product1(nu=2)
        annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
      MultiProduct product2(nu=2)
        annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
      Mean mean1(final f=f, final x0=x0Cos)
        annotation (Placement(transformation(extent={{-20,30},{0,50}})));
      Mean mean2(final f=f, final x0=x0Sin)
        annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
      Modelica_Blocks_Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica_Blocks_Interfaces.RealOutput y_rms
        "Root mean square of polar representation" annotation (Placement(
            transformation(extent={{100,50},{120,70}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y_arg
        "Angle of polar representation" annotation (Placement(transformation(
              extent={{100,-70},{120,-50}}, rotation=0)));
      RectangularToPolar rectangularToPolar
        annotation (Placement(transformation(extent={{40,-12},{60,8}})));
    equation

      connect(product2.y, mean2.u) annotation (Line(
          points={{-38.3,-40},{-22,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, mean1.u) annotation (Line(
          points={{-38.3,40},{-22,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mean1.y, rectangularToPolar.u_re) annotation (Line(
          points={{1,40},{20,40},{20,4},{38,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mean2.y, rectangularToPolar.u_im) annotation (Line(
          points={{1,-40},{20,-40},{20,-8},{38,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rectangularToPolar.y_abs, y_rms) annotation (Line(
          points={{61,4},{80,4},{80,60},{110,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rectangularToPolar.y_arg, y_arg) annotation (Line(
          points={{61,-8},{80,-8},{80,-60},{110,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sin1.y, product1.u[1]) annotation (Line(
          points={{-80,59},{-80,59},{-80,43.5},{-60,43.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, product1.u[2]) annotation (Line(
          points={{-120,0},{-80,0},{-80,36.5},{-60,36.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, product2.u[1]) annotation (Line(
          points={{-120,0},{-80,0},{-80,-36.5},{-60,-36.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sin2.y, product2.u[2]) annotation (Line(
          points={{-80,-59},{-80,-43.5},{-60,-43.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Documentation(info="<html>
<p>
This block calculates the root mean square and the phase angle of a single harmonic <i>k</i> of the input signal u over the given period 1/f, using the
<a href=\"modelica://Modelica.Blocks.Math.Mean\">mean block</a>.
</p>
<p>
Note: The output is updated after each period defined by 1/f.
</p>
<p>
Note: The harmonic is defined by <code>&radic;2 rms cos(k 2 &pi; f t - arg)</code>
</p>
</html>"),   Icon(graphics={
            Text(
              extent={{-80,60},{80,20}},
              lineColor={0,0,0},
              textString="H%k"),
            Text(
              extent={{-80,-20},{80,-60}},
              lineColor={0,0,0},
              textString="f=%f"),
            Text(
              extent={{20,100},{100,60}},
              lineColor={0,0,0},
              textString="rms"),
            Text(
              extent={{20,-60},{100,-100}},
              lineColor={0,0,0},
              textString="arg")}));
    end Harmonic;

    block Max "Pass through the largest signal"
      extends Modelica_Blocks_Interfaces.SI2SO;
    equation
      y = max(u1, u2);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,36},{90,-36}},
              lineColor={160,160,164},
              textString="max()")}), Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>maximum</i>
of the two Real inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>    y = <b>max</b> ( u1 , u2 );
</pre>
</html>"));
    end Max;

    block Min "Pass through the smallest signal"
      extends Modelica_Blocks_Interfaces.SI2SO;
    equation
      y = min(u1, u2);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,36},{90,-36}},
              lineColor={160,160,164},
              textString="min()")}), Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>minimum</i> of
the two Real inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>    y = <b>min</b> ( u1 , u2 );
</pre>
</html>"));
    end Min;

    block MinMax
      "Output the minimum and the maximum element of the input vector"
      extends Icons.Block;
      parameter Integer nu(min=0) = 0 "Number of input connections"
        annotation (Dialog(connectorSizing=true), HideResult=true);
      Modelica_Blocks_Interfaces.RealVectorInput u[nu]
        annotation (Placement(transformation(extent={{-120,70},{-80,-70}})));
      Modelica_Blocks_Interfaces.RealOutput yMax annotation (Placement(
            transformation(extent={{100,50},{120,70}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput yMin annotation (Placement(
            transformation(extent={{100,-70},{120,-50}}, rotation=0)));
    equation
      yMax = max(u);
      yMin = min(u);
      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            initialScale=0.1), graphics={Text(
              extent={{-12,80},{100,40}},
              lineColor={0,0,0},
              textString="yMax"), Text(
              extent={{-10,-40},{100,-80}},
              lineColor={0,0,0},
              textString="yMin")}), Documentation(info="<html>
<p>
Determines the minimum and maximum element of the input vector and
provide both values as output.
</p>
</html>"));
    end MinMax;

    block LinearDependency "Output a linear combination of the two inputs"
      extends Modelica_Blocks_Interfaces.SI2SO;
      parameter Real y0=0 "Initial value";
      parameter Real k1=0 "u1 dependency";
      parameter Real k2=0 "u2 dependency";
    equation
      y = y0*(1 + k1*u1 + k2*u2);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Line(
              points={{-100,60},{100,0},{-100,-60}},
              color={0,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-14,88},{94,32}},
              lineColor={0,0,0},
              textString="%k1"),
            Text(
              extent={{-40,-48},{96,-96}},
              lineColor={0,0,0},
              textString="%k2"),
            Text(
              extent={{-94,26},{8,-30}},
              lineColor={0,0,0},
              textString="%y0")}), Documentation(info="<html>
<p>
Determine the linear combination of the two inputs:
<code>y = y0*(1 + k1*u1 + k2*u2)</code>
</p>
</html>"));
    end LinearDependency;

    block Edge "Indicates rising edge of Boolean signal"
      extends Modelica_Blocks_Interfaces.BooleanSISO;
    equation
      y = edge(u);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,36},{90,-36}},
              lineColor={160,160,164},
              textString="edge()")}), Documentation(info="<html>
<p>
This block sets the Boolean output <b>y</b> to true,
when the Boolean input <b>u</b> shows a <i>rising edge</i>:
</p>
<pre>    y = <b>edge</b>( u );
</pre>
</html>"));
    end Edge;

    block BooleanChange "Indicates Boolean signal changing"
      extends Modelica_Blocks_Interfaces.BooleanSISO;
    equation
      y = change(u);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,36},{90,-36}},
              lineColor={160,160,164},
              textString="change()")}), Documentation(info="<html>
<p>
This block sets the Boolean output <b>y</b> to true, when the
Boolean input <b>u</b> shows a <i>rising or falling edge</i>,
i.e., when the signal changes:
</p>
<pre>    y = <b>change</b>( u );
</pre>
</html>"));
    end BooleanChange;

    block IntegerChange "Indicates integer signal changing"
      extends Modelica_Blocks_Interfaces.IntegerSIBooleanSO;
    equation
      y = change(u);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,36},{90,-36}},
              lineColor={160,160,164},
              textString="change()")}), Documentation(info="<html>
<p>
This block sets the Boolean output <b>y</b> to true, when the
Integer input <b>u</b> changes:
</p>
<pre>    y = <b>change</b>( u );
</pre>
</html>"));
    end IntegerChange;

    annotation (Documentation(info="<html>
<p>
This package contains basic <b>mathematical operations</b>,
such as summation and multiplication, and basic <b>mathematical
functions</b>, such as <b>sqrt</b> and <b>sin</b>, as
input/output blocks. All blocks of this library can be either
connected with continuous blocks or with sampled-data blocks.
</p>
</html>",   revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New blocks added: RealToInteger, IntegerToReal, Max, Min, Edge, BooleanChange, IntegerChange.</li>
<li><i>August 7, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized (partly based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist).
</li>
</ul>
</html>"),   Icon(graphics={Line(
            points={{-80,-2},{-68.7,32.2},{-61.5,51.1},{-55.1,64.4},{-49.4,72.6},
                {-43.8,77.1},{-38.2,77.8},{-32.6,74.6},{-26.9,67.7},{-21.3,57.4},
                {-14.9,42.1},{-6.83,19.2},{10.1,-32.8},{17.3,-52.2},{23.7,-66.2},
                {29.3,-75.1},{35,-80.4},{40.6,-82},{46.2,-79.6},{51.9,-73.5},{
                57.5,-63.9},{63.9,-49.2},{72,-26.8},{80,-2}},
            color={95,95,95},
            smooth=Smooth.Bezier)}));
  end Math;

  package MathInteger
    "Library of Integer mathematical functions as input/output blocks"
    extends Modelica_Icons.Package;
  block MultiSwitch
      "Set Integer expression that is associated with the first active input signal"

    input Integer expr[nu]=fill(0, nu)
        "y = if u[i] then expr[i] elseif use_pre_as_default then pre(y) else y_default"
                                                                                                   annotation(Dialog);
    parameter Integer y_default=0
        "Default value of output y if use_pre_as_default=false, as well as pre(y) at initial time";

    parameter Boolean use_pre_as_default=true
        "= true, y holds its last value if all u[i]=false, otherwise y=y_default"
          annotation(HideResult=true, choices(checkBox=true));
    parameter Integer nu(min=0) = 0 "Number of input connections"
            annotation(Dialog(connectorSizing=true), HideResult=true);

    Modelica_Blocks_Interfaces.BooleanVectorInput u[nu]
        "Set y = expr[i], if u[i] = true"
        annotation (Placement(transformation(extent={{-110,30},{-90,-30}})));
    Modelica_Blocks_Interfaces.IntegerOutput y "Output depending on expression"
        annotation (Placement(transformation(extent={{300,-10},{320,10}})));

    protected
    Integer firstActiveIndex;
  initial equation
    pre(y) = y_default;
  equation
    firstActiveIndex = Modelica_Math.BooleanVectors.firstTrueIndex(
                                                    u);
    y = if firstActiveIndex > 0 then expr[firstActiveIndex] else
        if use_pre_as_default then pre(y) else y_default;
    annotation (defaultComponentName="multiSwitch1",             Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{300,100}}), graphics={
              Text(
                extent={{310,-25},{410,-45}},
                lineColor={0,0,0},
                textString=DynamicSelect(" ", String(
                    y,
                    minimumLength=1,
                    significantDigits=0))),
              Text(
                visible=not use_pre_as_default,
                extent={{-100,-60},{300,-90}},
                lineColor={0,0,0},
                textString="else: %y_default"),
              Text(
                visible=use_pre_as_default,
                extent={{-100,-50},{300,-80}},
                lineColor={0,0,0},
                textString="else: pre(y)"),
              Rectangle(
                extent={{-100,-40},{300,40}},
                lineColor={0,0,0},
                fillColor={255,213,170},
                fillPattern=FillPattern.Solid,
                borderPattern=BorderPattern.Raised),
              Text(
                extent={{-100,90},{300,50}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-80,15},{290,-15}},
                lineColor={0,0,0},
                fillColor={255,246,238},
                fillPattern=FillPattern.Solid,
                textString="%expr")}),
      Documentation(info="<html>
<p>
This block has a vector of Boolean input signals u[nu] and a vector of
(time varying) Integer expressions expr[nu]. The output signal y is
set to expr[i], if i is the first element in the input vector u that is true. If all input signals are
false, y is set to parameter \"y_default\" or the last value is kept, if use_pre_as_default = <b>true</b>.
</p>

<blockquote><pre>
  // Conceptual equation (not valid Modelica)
  i = 'first element of u[:] that is true';
  y = <b>if</b> i==0 <b>then</b> (<b>if</b> use_pre_as_default <b>then</b> pre(y)
                                          <b>else</b> y_default)
      <b>else</b> expr[i];
</pre></blockquote>

<p>
The input connector is a vector of Boolean input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.IntegerNetwork1\">Modelica.Blocks.Examples.IntegerNetwork1</a>.
</p>

</html>"));
  end MultiSwitch;

    block Sum "Sum of Integers: y = k[1]*u[1] + k[2]*u[2] + ... + k[n]*u[n]"
       extends Modelica_Blocks_Interfaces.PartialIntegerMISO;
       parameter Integer k[nu] = fill(1,nu) "Input gains";
    equation
      if size(u,1) > 0 then
         y = k*u;
      else
         y = 0;
      end if;
      annotation (Icon(graphics={Text(
                extent={{-200,-110},{200,-140}},
                lineColor={0,0,0},
                fillColor={255,213,170},
                fillPattern=FillPattern.Solid,
                textString="%k"), Text(
                extent={{-72,68},{92,-68}},
                lineColor={0,0,0},
                fillColor={255,213,170},
                fillPattern=FillPattern.Solid,
                textString="+")}), Documentation(info="<html>
<p>
This blocks computes the scalar Integer output \"y\" as sum of the elements of the
Integer input signal vector u:
</p>
<blockquote><pre>
y = k[1]*u[1] + k[2]*u[2] + ... k[N]*u[N];
</pre></blockquote>

<p>
The input connector is a vector of Integer input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.IntegerNetwork1\">Modelica.Blocks.Examples.IntegerNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to zero: y=0.
</p>
</html>"));
    end Sum;

    block Product "Product of Integer: y = u[1]*u[2]* ... *u[n]"
       extends Modelica_Blocks_Interfaces.PartialIntegerMISO;
    equation
      if size(u,1) > 0 then
         y = product(u);
      else
         y = 0;
      end if;

      annotation (Icon(graphics={Text(
                extent={{-74,50},{94,-94}},
                lineColor={0,0,0},
                fillColor={255,213,170},
                fillPattern=FillPattern.Solid,
                textString="*")}), Documentation(info="<html>
<p>
This blocks computes the scalar Integer output \"y\" as product of the elements of the
Integer input signal vector u:
</p>
<blockquote><pre>
y = u[1]*u[2]* ... *u[N];
</pre></blockquote>

<p>
The input connector is a vector of Integer input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.IntegerNetwork1\">Modelica.Blocks.Examples.IntegerNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to zero: y=0.
</p>
</html>"));
    end Product;

    block TriggeredAdd
      "Add input to previous value of output, if rising edge of trigger port"
      extends Modelica_Blocks_Interfaces.PartialIntegerSISO;

      parameter Boolean use_reset = false "=true, if reset port enabled"
            annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
      parameter Boolean use_set = false
        "=true, if set port enabled and used as default value when reset"
            annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
      parameter Integer y_start = 0
        "Initial and reset value of y if set port is not used";

      Modelica_Blocks_Interfaces.BooleanInput trigger annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-60,-120})));
      Modelica_Blocks_Interfaces.BooleanInput reset if use_reset annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={60,-120})));
      Modelica_Blocks_Interfaces.IntegerInput set if use_set annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={60,120}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={28,98})));
    protected
      Modelica_Blocks_Interfaces.BooleanOutput local_reset
        annotation (HideResult=true);
      Modelica_Blocks_Interfaces.IntegerOutput local_set;
    initial equation
      pre(y) = y_start;
    equation
      if use_reset then
         connect(reset, local_reset);
           if use_set then
             connect(set, local_set);
           else
             local_set = y_start;
           end if;
      else
         local_reset = false;
         local_set = 0;
      end if;

      when {trigger, local_reset} then
         y = if local_reset then local_set else pre(y) + u;
      end when;
      annotation (       Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics={
              Line(
                points={{-100,0},{32,76}},
                color={255,128,0},
                smooth=Smooth.None,
                pattern=LinePattern.Dot),
              Line(
                points={{-100,0},{32,-20}},
                color={255,128,0},
                pattern=LinePattern.Dot,
                smooth=Smooth.None),
              Line(
                points={{-54,-56},{-26,-56},{-26,-20},{32,-20},{32,76}},
                color={0,0,0},
                smooth=Smooth.None),
              Line(
                points={{-60,-100},{32,-20}},
                color={255,0,255},
                pattern=LinePattern.Dot,
                smooth=Smooth.None),
              Text(
                visible=use_reset,
                extent={{-28,-62},{94,-86}},
                lineColor={0,0,0},
                textString="reset")}),
        Documentation(info="<html>
<p>
Add input to previous value of output, if rising edge of trigger port

<p>
This block has one Integer input \"u\", one Boolean input \"trigger\",
an optional Boolean input \"reset\", an optional Integer input \"set\", and
an Integer output \"y\".
The optional inputs can be activated with the \"use_reset\" and
\"use_set\" flags, respectively.
</p>

<p>
The input \"u\" is added to the previous value of the
output \"y\" if the \"trigger\" port has a rising edge. At the start of the
simulation \"y = y_start\".
</p>

<p>
If the \"reset\" port is enabled, then the output \"y\" is reset to \"set\"
or to \"y_start\" (if the \"set\" port is not enabled), whenever the \"reset\"
port has a rising edge.
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.IntegerNetwork1\">Modelica.Blocks.Examples.IntegerNetwork1</a>.
</p>

</html>"));
    end TriggeredAdd;
    annotation (Documentation(info="<html>
<p>
This package contains basic <b>mathematical operations</b>
on <b>Integer</b> signals.
</p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Line(
            points={{-74,-66},{-46,-66},{-46,-30},{12,-30},{12,66}},
            color={255,128,0}), Line(
            points={{12,66},{70,66}},
            color={255,128,0})}));
  end MathInteger;

  package MathBoolean
    "Library of Boolean mathematical functions as input/output blocks"
    extends Modelica_Icons.Package;

  block MultiSwitch
      "Set Boolean expression that is associated with the first active input signal"

    input Boolean expr[nu]=fill(false, nu)
        "y = if u[i] then expr[i] else y_default (time varying)"            annotation(Dialog);
    parameter Boolean use_pre_as_default=true
        "set true to hold last value as default (y_default = pre(y))"
          annotation(HideResult=true, choices(checkBox=true));
    parameter Boolean y_default=false
        "Default value of output y if all u[i] = false"
                                                      annotation(Dialog(enable = not use_pre_as_default));

    parameter Integer nu(min=0) = 0 "Number of input connections"
            annotation(Dialog(connectorSizing=true), HideResult=true);

    Modelica_Blocks_Interfaces.BooleanVectorInput u[nu]
        "Set y = expr[i], if u[i] = true"
        annotation (Placement(transformation(extent={{-110,30},{-90,-30}})));
    Modelica_Blocks_Interfaces.BooleanOutput y "Output depending on expression"
        annotation (Placement(transformation(extent={{300,-10},{320,10}})));

    protected
    Integer firstActiveIndex;
  initial equation
    pre(y) = y_default;
  equation
      firstActiveIndex =
        Modelica_Math.BooleanVectors.firstTrueIndex(
                                     u);
     y = if firstActiveIndex == 0 then (if use_pre_as_default then pre(y) else y_default) else
                                       expr[firstActiveIndex];
    annotation (
      defaultComponentName="set1",
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{300,100}}), graphics={
              Text(
                visible=not use_pre_as_default,
                extent={{-100,-60},{300,-90}},
                lineColor={0,0,0},
                textString="else: %y_default"),
              Text(
                visible=use_pre_as_default,
                extent={{-100,-60},{300,-90}},
                lineColor={0,0,0},
                textString="else: pre(y)"),
              Text(
                extent={{-99,99},{300,59}},
                textString="%name",
                lineColor={0,0,255}),
              Rectangle(
                extent={{-100,-51},{300,50}},
                lineColor={255,127,0},
                lineThickness=5.0,
                fillColor={210,210,210},
                fillPattern=FillPattern.Solid,
                borderPattern=BorderPattern.Raised),
              Text(
                extent={{-84,16},{273,-15}},
                lineColor={0,0,0},
                fillColor={255,246,238},
                fillPattern=FillPattern.Solid,
                textString="%expr"),
              Ellipse(
                extent={{275,8},{289,-6}},
                lineColor=DynamicSelect({235,235,235}, if y > 0.5 then {0,255,0} else
                          {235,235,235}),
                fillColor=DynamicSelect({235,235,235}, if y > 0.5 then {0,255,0} else
                          {235,235,235}),
                fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>
The block has a vector of Boolean input signals u[nu] and a vector of
(time varying) Boolean expressions expr[:]. The output signal y is
set to expr[i], if i is the first element in the input vector u that is true.
If all input signals are false, y is set to parameter \"y_default\" or the
previous value of y is kept if parameter use_pre_as_default = <b>true</b>:
</p>

<blockquote><pre>
  // Conceptual equation (not valid Modelica)
  i = 'first element of u[:] that is true';
  y = <b>if</b> i==0 <b>then</b> (<b>if</b> use_pre_as_default <b>then</b> pre(y)
                                          <b>else</b> y_default)
      <b>else</b> expr[i];
</pre></blockquote>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

</html>"));
  end MultiSwitch;

    block And "Logical 'and': y = u[1] and u[2] and ... and u[nu]"
      extends Modelica_Blocks_Interfaces.PartialBooleanMISO;

    equation
      y = Modelica_Math.BooleanVectors.allTrue(
                                u);
      annotation (defaultComponentName="and1", Icon(graphics={Text(
                extent={{-76,40},{60,-40}},
                lineColor={0,0,0},
                textString="and")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if all inputs are <b>true</b>, otherwise
the output is <b>false</b>.
</p>

<p>
The input connector is a vector of Boolean input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to <b>false</b>: y=false.
</p>
</html>"));
    end And;

    block Or "Logical 'or': y = u[1] or u[2] or ... or u[nu]"
      extends Modelica_Blocks_Interfaces.PartialBooleanMISO;

    equation
      y = Modelica_Math.BooleanVectors.anyTrue(
                                u);
      annotation (defaultComponentName="or1", Icon(graphics={Text(
                extent={{-80,40},{60,-40}},
                lineColor={0,0,0},
                textString="or")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if at least one input is <b>true</b>, otherwise
the output is <b>false</b>.
</p>

<p>
The input connector is a vector of Boolean input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to <b>false</b>: y=false.
</p>

</html>"));
    end Or;

    block Xor
      "Logical 'xor': y = oneTrue(u)  (y is true, if exactly one element of u is true, otherwise it is false)"
      extends Modelica_Blocks_Interfaces.PartialBooleanMISO;

    equation
      y = Modelica_Math.BooleanVectors.oneTrue(
                                u);
      annotation (defaultComponentName="xor1", Icon(graphics={Text(
                extent={{-80,40},{60,-40}},
                lineColor={0,0,0},
                textString="xor")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if exactly one input is <b>true</b>, otherwise
the output is <b>false</b>.
</p>

<p>
The input connector is a vector of Boolean input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to <b>false</b>: y=false.
</p>

</html>"));
    end Xor;

    block Nand "Logical 'nand': y = not ( u[1] and u[2] and ... and u[nu] )"
      extends Modelica_Blocks_Interfaces.PartialBooleanMISO;

    equation
      y = not Modelica_Math.BooleanVectors.allTrue(
                                    u);
      annotation (defaultComponentName="nand1", Icon(graphics={Text(
                extent={{-78,36},{64,-30}},
                lineColor={0,0,0},
                textString="nand")}),
        Documentation(info="<html>
<p>
The output is <b>true</b> if at least one input is <b>false</b>, otherwise
the output is <b>false</b>.
</p>

<p>
The input connector is a vector of Boolean input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to <b>false</b>: y=false.
</p>

</html>"));
    end Nand;

    block Nor "Logical 'nor': y = not ( u[1] or u[2] or ... or u[nu] )"
      extends Modelica_Blocks_Interfaces.PartialBooleanMISO;

    equation
      y = not Modelica_Math.BooleanVectors.anyTrue(
                                    u);
      annotation (defaultComponentName="nor1", Icon(graphics={Text(
                extent={{-80,40},{60,-40}},
                lineColor={0,0,0},
                textString="nor")}),
        Documentation(info="<html>
<p>
The output is <b>false</b> if at least one input is <b>true</b>, otherwise
the output is <b>true</b>.
</p>

<p>
The input connector is a vector of Boolean input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

<p>
If no connection to the input connector \"u\" is present,
the output is set to <b>false</b>: y=false.
</p>
</html>"));
    end Nor;

    block Not "Logical 'not': y = not u"
      extends Modelica_Blocks_Interfaces.PartialBooleanSISO_small;

    equation
      y = not u;
      annotation (defaultComponentName="not1", Icon(graphics={Text(
                extent={{-98,40},{42,-40}},
                lineColor={0,0,0},
              textString="not")}),
        Documentation(info="<html>
<p>
The output is <b>false</b> if at least one input is <b>true</b>, otherwise
the output is <b>true</b>.
</p>

<p>
The input connector is a vector of Boolean input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>
</html>"));
    end Not;

    block RisingEdge
      "Output y is true, if the input u has a rising edge, otherwise it is false (y = edge(u))"
       parameter Boolean pre_u_start = false "Value of pre(u) at initial time";
       extends Modelica_Blocks_Interfaces.PartialBooleanSISO_small;
    initial equation
      pre(u) = pre_u_start;
    equation
      y = edge(u);
          annotation (defaultComponentName="rising1", Icon(graphics={Line(points=
                    {{-80,-68},{-36,-68},{-36,-24},{22,-24},{22,-68},{66,-68}},
                  color={0,0,0}), Line(points={{-80,32},{-36,32},{-36,76},{-36,76},
                    {-36,32},{66,32}}, color={255,0,255})}),
                                     Documentation(info="<html>
<p>
A rising edge of the Boolean input u results in y = <b>true</b> at this
time instant. At all other time instants, y = <b>false</b>.
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

</html>"));
    end RisingEdge;

    block FallingEdge
      "Output y is true, if the input u has a falling edge, otherwise it is false (y = edge(not u))"
       parameter Boolean pre_u_start = false "Value of pre(u) at initial time";
       extends Modelica_Blocks_Interfaces.PartialBooleanSISO_small;
    protected
      Boolean not_u = not u annotation(HideResult=true);
    initial equation
      pre(not_u) = not pre_u_start;
    equation
      y = edge(not_u);
          annotation (defaultComponentName="falling1", Icon(graphics={Line(points=
                   {{-80,-68},{-36,-68},{-36,-24},{22,-24},{22,-68},{66,-68}},
                  color={0,0,0}), Line(points={{-80,32},{24,32},{24,76},{24,76},{
                    24,32},{66,32}}, color={255,0,255})}),
                                     Documentation(info="<html>
<p>
A falling edge of the Boolean input u results in y = <b>true</b> at this
time instant. At all other time instants, y = <b>false</b>.
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

</html>"));
    end FallingEdge;

    block ChangingEdge
      "Output y is true, if the input u has either a rising or a falling edge and otherwise it is false (y=change(u))"
       parameter Boolean pre_u_start = false "Value of pre(u) at initial time";
       extends Modelica_Blocks_Interfaces.PartialBooleanSISO_small;
    initial equation
      pre(u) = pre_u_start;
    equation
      y = change(u);
          annotation (defaultComponentName="changing1", Icon(graphics={
              Line(points={{-80,-68},{-36,-68},{-36,-24},{22,-24},{22,-68},{66,-68}},
                  color={0,0,0}),
              Line(points={{-80,32},{-36,32},{-36,76},{-36,76},{-36,32},{66,32}},
                  color={255,0,255}),
              Line(
                points={{24,32},{24,76}},
                color={255,0,255},
                smooth=Smooth.None)}),
                                     Documentation(info="<html>
<p>
A changing edge, i.e., either rising or falling,
of the Boolean input u results in y = <b>true</b> at this
time instant. At all other time instants, y = <b>false</b>.
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

</html>"));
    end ChangingEdge;

    block OnDelay
      "Delay a rising edge of the input, but do not delay a falling edge."
          extends Modelica_Blocks_Interfaces.PartialBooleanSISO_small;
          parameter SI.Time delayTime "Delay time";

    protected
          Boolean delaySignal(start=false,fixed=true);
          discrete SI.Time t_next;
    initial equation
          pre(u) = false;
          pre(t_next) = time - 1;
    algorithm
          when initial() then
             delaySignal := u;
             t_next := time - 1;
          elsewhen u then
             delaySignal := true;
             t_next := time + delayTime;
          elsewhen not u then
             delaySignal := false;
             t_next := time - 1;
          end when;
    equation
          if delaySignal then
             y = time >= t_next;
          else
             y = false;
          end if;
          annotation (Icon(graphics={
              Text(
                extent={{-250,-120},{250,-150}},
                lineColor={0,0,0},
                textString="%delayTime s"),
              Line(points={{-80,-66},{-60,-66},{-60,-22},{38,-22},{38,-66},{66,-66}},
                  color={0,0,0}),
              Line(points={{-80,32},{-4,32},{-4,76},{38,76},{38,32},{66,32}},
                  color={255,0,255})}),
                                     Documentation(info="<html>
<p>
A rising edge of the Boolean input u gives a delayed output.
A falling edge of the input is immediately given to the output.
</p>

<p>
Simulation results of a typical example with a delay time of 0.1 s
is shown in the next figure.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/MathBoolean/OnDelay1.png\"
     alt=\"OnDelay1.png\">
<br>
<img src=\"modelica://Modelica/Resources/Images/Blocks/MathBoolean/OnDelay2.png\"
     alt=\"OnDelay2.png\">
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

</html>"));
    end OnDelay;

    annotation (Documentation(info="<html>
<p>
This package contains basic <b>mathematical operations</b>
on <b>Boolean</b> signals.
</p>

<p>
Package MathBoolean is a new design that shall replace in the future the
<a href=\"modelica://Modelica.Blocks.Logical\">Logical</a> package.
The new features are:
</p>

<ul>
<li> If useful, blocks may have an arbitrary number of inputs (e.g., \"And\" block with 2,3,4,...
     Boolean inputs). This is based on the \"connectorSizing\" annotation which
     allows a tool to conveniently handle vectors of connectors. </li>

<li> The blocks are smaller in size, so that the diagram area is better
     utilized for trivial blocks such as \"And\" or \"Or\".</li>

</ul>

</html>"),   Icon(graphics={Line(points={{-80,-16},{-4,-16},{-4,28},{38,28},{38,
                -16},{66,-16}}, color={255,0,255})}));
  end MathBoolean;

  package Nonlinear
    "Library of discontinuous or non-differentiable algebraic control blocks"
    import Interfaces =
           Modelica_Blocks_Interfaces;
    extends Modelica_Icons.Package;

        block Limiter "Limit the range of a signal"
          parameter Real uMax(start=1) "Upper limits of input signals";
          parameter Real uMin= -uMax "Lower limits of input signals";
          parameter Boolean strict=false
        "= true, if strict limits with noEvent(..)"
            annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
          parameter Boolean limitsAtInit=true
        "= false, if limits are ignored during initialization (i.e., y=u)"
            annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
          extends Modelica_Blocks_Interfaces.SISO;

        equation
          assert(uMax >= uMin, "Limiter: Limits must be consistent. However, uMax (=" + String(uMax) +
                               ") < uMin (=" + String(uMin) + ")");
          if initial() and not limitsAtInit then
             y = u;
             assert(u >= uMin - 0.01*abs(uMin) and
                    u <= uMax + 0.01*abs(uMax),
                   "Limiter: During initialization the limits have been ignored.\n"+
                   "However, the result is that the input u is not within the required limits:\n"+
                   "  u = " + String(u) + ", uMin = " + String(uMin) + ", uMax = " + String(uMax));
          elseif strict then
             y = smooth(0, noEvent(if u > uMax then uMax else if u < uMin then uMin else u));
          else
             y = smooth(0,if u > uMax then uMax else if u < uMin then uMin else u);
          end if;
          annotation (
            Documentation(info="<html>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the specified upper and lower
limits. If this is not the case, the corresponding limits are passed
as output.
</p>
</html>"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{0,-90},{0,68}}, color={192,192,192}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,-8},{68,8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="uMax=%uMax"),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              visible=strict,
              points={{50,70},{80,70}},
              color={255,0,0},
              smooth=Smooth.None),
            Line(
              visible=strict,
              points={{-80,-70},{-50,-70}},
              color={255,0,0},
              smooth=Smooth.None)}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{0,-60},{0,50}}, color={192,192,192}),
            Polygon(
              points={{0,60},{-5,50},{5,50},{0,60}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-60,0},{50,0}}, color={192,192,192}),
            Polygon(
              points={{60,0},{50,-5},{50,5},{60,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),
            Text(
              extent={{46,-6},{68,-18}},
              lineColor={128,128,128},
              textString="u"),
            Text(
              extent={{-30,70},{-5,50}},
              lineColor={128,128,128},
              textString="y"),
            Text(
              extent={{-58,-54},{-28,-42}},
              lineColor={128,128,128},
              textString="uMin"),
            Text(
              extent={{26,40},{66,56}},
              lineColor={128,128,128},
              textString="uMax")}));
        end Limiter;

    block VariableLimiter "Limit the range of a signal with variable limits"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter Boolean strict=false
        "= true, if strict limits with noEvent(..)"
        annotation (Evaluate=true, choices(checkBox=true));
      parameter Boolean limitsAtInit=true
        "= false, if limits are ignored during initialization (i.e., y=u)"
        annotation (Evaluate=true, choices(checkBox=true));
      Modelica_Blocks_Interfaces.RealInput limit1
        "Connector of Real input signal used as maximum of input u" annotation (
         Placement(transformation(extent={{-140,60},{-100,100}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput limit2
        "Connector of Real input signal used as minimum of input u" annotation (
         Placement(transformation(extent={{-140,-100},{-100,-60}}, rotation=0)));
    protected
      Real uMax;
      Real uMin;

    equation
      if strict then
        uMax = noEvent(max(limit1, limit2));
        uMin = noEvent(min(limit1, limit2));
      else
        uMax = max(limit1, limit2);
        uMin = min(limit1, limit2);
      end if;

      if initial() and not limitsAtInit then
         y = u;
         assert(u >= uMin - 0.01*abs(uMin) and
                u <= uMax + 0.01*abs(uMax),
               "VariableLimiter: During initialization the limits have been ignored.\n"+
               "However, the result is that the input u is not within the required limits:\n"+
               "  u = " + String(u) + ", uMin = " + String(uMin) + ", uMax = " + String(uMax));
      elseif strict then
        y = smooth(0, noEvent(if u > uMax then uMax else if u < uMin then uMin else u));
      else
         y = smooth(0,if u > uMax then uMax else if u < uMin then uMin else u);
      end if;
      annotation (
        Documentation(info="<html>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the upper and lower
limits specified by the two additional inputs limit1 and
limit2. If this is not the case, the corresponding limit
is passed as output.
</p>
</html>"),     Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{0,-90},{0,68}}, color={192,192,192}),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,-8},{68,8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{-100,80},{66,80},{66,70}}, color={0,0,127}),
            Line(points={{-100,-80},{-64,-80},{-64,-70}}, color={0,0,127}),
            Polygon(points={{-64,-70},{-66,-74},{-62,-74},{-64,-70}}, lineColor={
                  0,0,127}),
            Polygon(points={{66,70},{64,74},{68,74},{66,70}}, lineColor={0,0,127}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              visible=strict,
              points={{50,70},{80,70}},
              color={255,0,0},
              smooth=Smooth.None),
            Line(
              visible=strict,
              points={{-80,-70},{-50,-70}},
              color={255,0,0},
              smooth=Smooth.None)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Line(points={{0,-60},{0,50}}, color={192,192,192}),
            Polygon(
              points={{0,60},{-5,50},{5,50},{0,60}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-60,0},{50,0}}, color={192,192,192}),
            Polygon(
              points={{60,0},{50,-5},{50,5},{60,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),
            Text(
              extent={{46,-6},{68,-18}},
              lineColor={128,128,128},
              textString="inPort"),
            Text(
              extent={{-30,70},{-5,50}},
              lineColor={128,128,128},
              textString="outPort"),
            Text(
              extent={{-66,-40},{-26,-20}},
              lineColor={128,128,128},
              textString="uMin"),
            Text(
              extent={{30,20},{70,40}},
              lineColor={128,128,128},
              textString="uMax"),
            Line(points={{-100,80},{40,80},{40,40}}, color={0,0,127}),
            Line(points={{-100,-80},{-40,-80},{-40,-40}}, color={0,0,127}),
            Polygon(points={{40,40},{35,50},{45,50},{40,40}}, lineColor={0,0,127}),
            Polygon(points={{-40,-40},{-45,-50},{-35,-50},{-40,-40}}, lineColor={
                  0,0,127})}));
    end VariableLimiter;

    block SlewRateLimiter "Limits the slew rate of a signal"
      extends Modelica_Blocks_Interfaces.SISO;
      import Modelica_Constants.small;
      parameter SI.DampingCoefficient Rising(min=small)=1
        "Maximum rising slew rate [+small..+inf)";
      parameter SI.DampingCoefficient Falling(max=-small)=-Rising
        "Maximum falling slew rate (-inf..-small]";
      parameter SI.Time Td(min=small)=0.001 "Derivative time constant";
      parameter Boolean strict=false
        "= true, if strict limits with noEvent(..)"
        annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
    initial equation
        y = u;
    equation
      if strict then
        der(y) = smooth(1, noEvent(min(max((u - y)/Td, Falling), Rising)));
      else
        der(y) = smooth(1, min(max((u - y)/Td, Falling), Rising));
      end if;
      annotation (Icon(graphics={
        Line(points={{-90,0},{68,0}}, color={192,192,192}),
        Line(points={{0,-90},{0,68}}, color={192,192,192}),
        Polygon(
          points={{0,90},{-8,68},{8,68},{0,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{90,0},{68,-8},{68,8},{90,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-50,-70},{50,70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          visible=strict,
          points={{50,70},{-50,-70}},
          color={255,0,0},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p>The <code>SlewRateLimiter</code> block limits the slew rate of its input signal in the range of <code>[Falling, Rising]</code>.</p>
<p>To ensure this for arbitrary inputs and in order to produce a differential output, the input is numerically differentiated
with derivative time constant <code>Td</code>. Smaller time constant <code>Td</code> means nearer ideal derivative.</p>
<p><em>Note: The user has to choose the derivative time constant according to the nature of the input signal.</em></p>
</html>",
    revisions="<html>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<th>Revision</th>
<th>Date</th>
<th>Author</th>
<th>Comment</th>
</tr>
<tr>
<td valign=\"top\">4954</td>
<td valign=\"top\">2012-03-02</td>
<td valign=\"top\">A. Haumer &amp; D. Winkler</td>
<td valign=\"top\"><p>Initial version based on discussion in <a href=\"https://trac.modelica.org/Modelica/ticket/529/Modelica\">#529</a></p></td>
</tr>
</table>
</html>"));
    end SlewRateLimiter;

        block DeadZone "Provide a region of zero output"
          parameter Real uMax(start=1) "Upper limits of dead zones";
          parameter Real uMin=-uMax "Lower limits of dead zones";
          parameter Boolean deadZoneAtInit = true
        "= false, if dead zone is ignored during initialization (i.e., y=u)";
          extends Modelica_Blocks_Interfaces.SISO;

        equation
          assert(uMax >= uMin, "DeadZone: Limits must be consistent. However, uMax (=" + String(uMax) +
                               ") < uMin (=" + String(uMin) + ")");

          if initial() and not deadZoneAtInit then
             y = u;
          else
             y = smooth(0,if u > uMax then u - uMax else if u < uMin then u - uMin else 0);
          end if;
          annotation (
            Documentation(info="<html>
<p>
The DeadZone block defines a region of zero output.
</p>
<p>
If the input is within uMin ... uMax, the output
is zero. Outside of this zone, the output is a linear
function of the input with a slope of 1.
</p>
</html>"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{0,-90},{0,68}}, color={192,192,192}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,-8},{68,8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-60},{-20,0},{20,0},{80,60}}, color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={160,160,164},
              textString="uMax=%uMax"),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{0,-60},{0,50}}, color={192,192,192}),
            Polygon(
              points={{0,60},{-5,50},{5,50},{0,60}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-76,0},{74,0}}, color={192,192,192}),
            Polygon(
              points={{84,0},{74,-5},{74,5},{84,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-81,-40},{-38,0},{40,0},{80,40}}, color={0,0,0}),
            Text(
              extent={{62,-7},{88,-25}},
              lineColor={128,128,128},
              textString="u"),
            Text(
              extent={{-36,72},{-5,50}},
              lineColor={128,128,128},
              textString="y"),
            Text(
              extent={{-51,1},{-28,19}},
              lineColor={128,128,128},
              textString="uMin"),
            Text(
              extent={{27,21},{52,5}},
              lineColor={128,128,128},
              textString="uMax")}));
        end DeadZone;

    block FixedDelay "Delay block with fixed DelayTime"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter SI.Time delayTime(start=1)
        "Delay time of output with respect to input signal";

    equation
      y = delay(u, delayTime);
      annotation (
        Documentation(info="<html>
<p>
The Input signal is delayed by a given time instant, or more precisely:
</p>
<pre>
   y = u(time - delayTime) for time &gt; time.start + delayTime
     = u(time.start)       for time &le; time.start + delayTime
</pre>
</html>"),     Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Text(
          extent={{8.0,-142.0},{8.0,-102.0}},
          textString="delayTime=%delayTime"),
        Line(
          points={{-92.0,0.0},{-80.7,34.2},{-73.5,53.1},{-67.1,66.4},{-61.4,74.6},{-55.8,79.1},{-50.2,79.8},{-44.6,76.6},{-38.9,69.7},{-33.3,59.4},{-26.9,44.1},{-18.83,21.2},{-1.9,-30.8},{5.3,-50.2},{11.7,-64.2},{17.3,-73.1},{23.0,-78.4},{28.6,-80.0},{34.2,-77.6},{39.9,-71.5},{45.5,-61.9},{51.9,-47.2},{60.0,-24.8},{68.0,0.0}},
          color={0,0,127},
          smooth=Smooth.Bezier),
        Line(
          points={{-62.0,0.0},{-50.7,34.2},{-43.5,53.1},{-37.1,66.4},{-31.4,74.6},{-25.8,79.1},{-20.2,79.8},{-14.6,76.6},{-8.9,69.7},{-3.3,59.4},{3.1,44.1},{11.17,21.2},{28.1,-30.8},{35.3,-50.2},{41.7,-64.2},{47.3,-73.1},{53.0,-78.4},{58.6,-80.0},{64.2,-77.6},{69.9,-71.5},{75.5,-61.9},{81.9,-47.2},{90.0,-24.8},{98.0,0.0}},
          color={160,160,164},
          smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,80},{-88,80}}, color={192,192,192}),
            Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
            Line(points={{-80,-88},{-80,86}}, color={192,192,192}),
            Text(
              extent={{-75,98},{-46,78}},
              lineColor={0,0,255},
              textString="outPort"),
            Polygon(
              points={{-80,96},{-86,80},{-74,80},{-80,96}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{84,0}}, color={192,192,192}),
            Polygon(
              points={{100,0},{84,6},{84,-6},{100,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,
                  74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,
                  59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,
                  -64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},
                  {57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,127},
                  smooth=Smooth.Bezier),
            Text(
              extent={{-24,98},{-2,78}},
              lineColor={0,0,0},
              textString="inPort"),
            Line(points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,
                  74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,
                  59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},
                  {45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{
                  73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}}, color={0,0,0},
                  smooth=Smooth.Bezier),
            Text(
              extent={{67,22},{96,6}},
              lineColor={160,160,164},
              textString="time"),
            Line(points={{-64,-30},{-64,0}}, color={192,192,192}),
            Text(
              extent={{-58,-42},{-58,-32}},
              textString="delayTime",
              lineColor={0,0,255}),
            Line(points={{-94,-26},{-80,-26}}, color={192,192,192}),
            Line(points={{-64,-26},{-50,-26}}, color={192,192,192}),
            Polygon(
              points={{-80,-26},{-88,-24},{-88,-28},{-80,-26}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-56,-24},{-64,-26},{-56,-28},{-56,-24}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid)}));
    end FixedDelay;

    block PadeDelay "Pade approximation of delay block with fixed DelayTime"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter SI.Time delayTime(start=1)
        "Delay time of output with respect to input signal";
      parameter Integer n(min=1) = 1 "Order of Pade approximation";
      parameter Integer m(
        min=1,
        max=n) = n "Order of numerator";

    protected
      Real x1dot "Derivative of first state of TransferFcn";
      Real xn "Highest order state of TransferFcn";
      Real a[n + 1];
      Real b[m + 1];

    public
      final output Real x[n]
        "State of transfer function from controller canonical form";

    protected
      function padeCoefficients
        extends Modelica_Icons.Function;
        input Real T "delay time";
        input Integer n "order of denominator";
        input Integer m "order of numerator";
        output Real b[m + 1] "numerator coefficients of transfer function";
        output Real a[n + 1] "denominator coefficients of transfer function";
      protected
        Real nm;
      algorithm
        a[1] := 1;
        b[1] := 1;
        nm := n + m;

        for i in 1:n loop
          a[i + 1] := a[i]*(T*((n - i + 1)/(nm - i + 1))/i);
          if i <= m then
            b[i + 1] := -b[i]*(T*((m - i + 1)/(nm - i + 1))/i);
          end if;
        end for;

        b := b[m + 1:-1:1];
        a := a[n + 1:-1:1];
      end padeCoefficients;
    equation

      (b,a) = padeCoefficients(delayTime, n, m);

      [der(x); xn] = [x1dot; x];
      [u] = transpose([a])*[x1dot; x];
      [y] = transpose([zeros(n - m, 1); b])*[x1dot; x];

    initial equation
      x[n] = u;
      annotation (
        Documentation(info="<html>
<p>
The Input signal is delayed by a given time instant, or more precisely:
</p>
<pre>
   y = u(time - delayTime) for time &gt; time.start + delayTime
     = u(time.start)       for time &le; time.start + delayTime
</pre>
<p>
The delay is approximated by a Pade approximation, i.e., by
a transfer function
</p>
<pre>
           b[1]*s^m + b[2]*s^[m-1] + ... + b[m+1]
   y(s) = --------------------------------------------- * u(s)
           a[1]*s^n + a[2]*s^[n-1] + ... + a[n+1]
</pre>
<p>
where the coefficients b[:] and a[:] are calculated such that the
coefficients of the Taylor expansion of the delay exp(-T*s) around s=0
are identical upto order n+m.
</p>
<p>
The main advantage of this approach is that the delay is
approximated by a linear differential equation system, which
is continuous and continuously differentiable. For example, it
is uncritical to linearize a system containing a Pade-approximated
delay.
</p>
<p>
The standard text book version uses order \"m=n\", which is
also the default setting of this block. The setting
\"m=n-1\" may yield a better approximation in certain cases.
</p>
<h5>Literature:</h5>
<p>Otto Foellinger: Regelungstechnik, 8. Auflage,
chapter 11.9, page 412-414, Huethig Verlag Heidelberg, 1994
</p>
</html>"),     Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Text(extent={{8.0,-142.0},{8.0,-102.0}},
          textString="delayTime=%delayTime"),
        Line(points={{-94.0,0.0},{-82.7,34.2},{-75.5,53.1},{-69.1,66.4},{-63.4,74.6},{-57.8,79.1},{-52.2,79.8},{-46.6,76.6},{-40.9,69.7},{-35.3,59.4},{-28.9,44.1},{-20.83,21.2},{-3.9,-30.8},{3.3,-50.2},{9.7,-64.2},{15.3,-73.1},{21.0,-78.4},{26.6,-80.0},{32.2,-77.6},{37.9,-71.5},{43.5,-61.9},{49.9,-47.2},{58.0,-24.8},{66.0,0.0}},
          color={0,0,127},
          smooth=Smooth.Bezier),
        Line(points={{-72.0,0.0},{-60.7,34.2},{-53.5,53.1},{-47.1,66.4},{-41.4,74.6},{-35.8,79.1},{-30.2,79.8},{-24.6,76.6},{-18.9,69.7},{-13.3,59.4},{-6.9,44.1},{1.17,21.2},{18.1,-30.8},{25.3,-50.2},{31.7,-64.2},{37.3,-73.1},{43.0,-78.4},{48.6,-80.0},{54.2,-77.6},{59.9,-71.5},{65.5,-61.9},{71.9,-47.2},{80.0,-24.8},{88.0,0.0}},
          color={160,160,164},
          smooth=Smooth.Bezier),
        Text(lineColor={160,160,164},
          extent={{-10.0,38.0},{100.0,100.0}},
          textString="m=%m"),
        Text(lineColor={160,160,164},
          extent={{-98.0,-96.0},{6.0,-34.0}},
          textString="n=%n")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,80},{-88,80}}, color={192,192,192}),
            Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
            Line(points={{-80,-88},{-80,86}}, color={192,192,192}),
            Text(
              extent={{-75,98},{-46,78}},
              lineColor={0,0,255},
              textString="outPort"),
            Polygon(
              points={{-80,96},{-86,80},{-74,80},{-80,96}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{84,0}}, color={192,192,192}),
            Polygon(
              points={{100,0},{84,6},{84,-6},{100,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,
                  74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,
                  59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,
                  -64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},
                  {57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,127},
                  smooth=Smooth.Bezier),
            Text(
              extent={{-24,98},{-2,78}},
              lineColor={0,0,0},
              textString="inPort"),
            Line(points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,
                  74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,
                  59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},
                  {45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{
                  73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}}, color={0,0,0},
                  smooth=Smooth.Bezier),
            Text(
              extent={{67,22},{96,6}},
              lineColor={160,160,164},
              textString="time"),
            Line(points={{-64,-30},{-64,0}}, color={192,192,192}),
            Text(
              extent={{-58,-42},{-58,-32}},
              textString="delayTime",
              lineColor={0,0,255}),
            Line(points={{-94,-26},{-80,-26}}, color={192,192,192}),
            Line(points={{-64,-26},{-50,-26}}, color={192,192,192}),
            Polygon(
              points={{-80,-26},{-88,-24},{-88,-28},{-80,-26}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-56,-24},{-64,-26},{-56,-28},{-56,-24}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid)}));
    end PadeDelay;

    block VariableDelay "Delay block with variable DelayTime"
      extends Modelica_Blocks_Interfaces.SISO;
      parameter Real delayMax(min=0, start=1) "maximum delay time";

      Modelica_Blocks_Interfaces.RealInput delayTime annotation (Placement(
            transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
    equation
      y = delay(u, delayTime, delayMax);
      annotation (
        Documentation(info="<html>
<p>
The Input signal is delayed by a given time instant, or more precisely:
</p>
<pre>
   y = u(time - delayTime) for time &gt; time.start + delayTime
     = u(time.start)       for time &le; time.start + delayTime
</pre>
<p>
where delayTime is an additional input signal which must follow
the following relationship:
</p>
<pre>  0 &le; delayTime &le; delayMax
</pre>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100.0,-100.0},{100.0,100.0}}, initialScale=0.1), graphics={
        Text(extent={{-100.0,-148.0},{100.0,-108.0}},
          textString="delayMax=%delayMax"),
        Line(points={{-92.0,0.0},{-80.7,34.2},{-73.5,53.1},{-67.1,66.4},{-61.4,74.6},{-55.8,79.1},{-50.2,79.8},{-44.6,76.6},{-38.9,69.7},{-33.3,59.4},{-26.9,44.1},{-18.83,21.2},{-1.9,-30.8},{5.3,-50.2},{11.7,-64.2},{17.3,-73.1},{23.0,-78.4},{28.6,-80.0},{34.2,-77.6},{39.9,-71.5},{45.5,-61.9},{51.9,-47.2},{60.0,-24.8},{68.0,0.0}},
          color={0,0,127},
          smooth=Smooth.Bezier),
        Line(points={{-64.0,0.0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},{45.3,-73.1},{51.0,-78.4},{56.6,-80.0},{62.2,-77.6},{67.9,-71.5},{73.5,-61.9},{79.9,-47.2},{88.0,-24.8},{96.0,0.0}},
          smooth=Smooth.Bezier),
        Polygon(fillPattern=FillPattern.Solid,
          lineColor={0,0,127},
          fillColor={0,0,127},
          points={{6.0,4.0},{-14.0,-2.0},{-6.0,-12.0},{6.0,4.0}}),
        Line(color={0,0,127},
          points={{-100.0,-60.0},{-76.0,-60.0},{-8.0,-6.0}})}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-80,96},{-86,80},{-74,80},{-80,96}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-69,98},{-40,78}},
          lineColor={0,0,255},
          textString="outPort"),
        Line(points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,
              74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,
              59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},
              {45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{
              73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}}, color={0,0,0},
              smooth=Smooth.Bezier),
        Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,
              74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,
              59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,
              -64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},
              {57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,127},
              smooth=Smooth.Bezier),
        Line(points={{-100,0},{84,0}}, color={192,192,192}),
        Polygon(
          points={{100,0},{84,6},{84,-6},{100,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{67,22},{96,6}},
          lineColor={160,160,164},
          textString="time"),
        Text(
          extent={{-58,-42},{-58,-32}},
          textString="delayTime",
          lineColor={0,0,255}),
        Line(points={{-80,-88},{-80,86}}, color={192,192,192}),
        Text(
          extent={{-24,98},{-2,78}},
          lineColor={0,0,0},
          textString="inPort"),
        Polygon(
          points={{-80,-26},{-88,-24},{-88,-28},{-80,-26}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-56,-24},{-64,-26},{-56,-28},{-56,-24}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-64,-26},{-50,-26}}, color={192,192,192}),
        Line(points={{-94,-26},{-80,-26}}, color={192,192,192}),
        Line(
          points={{-100,-60},{-70,-60},{-64,-44}},
          arrow={Arrow.None,Arrow.Filled},
          color={0,0,127}),
        Line(points={{-64,-30},{-64,0}}, color={192,192,192})}));
    end VariableDelay;

        annotation (
          Documentation(info="<html>
<p>
This package contains <b>discontinuous</b> and
<b>non-differentiable, algebraic</b> input/output blocks.
</p>
</html>",   revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New block VariableLimiter added.
<li><i>August 22, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.
</li>
</ul>
</html>"),   Icon(graphics={Line(points={{-80,-66},{-26,-66},{28,52},{88,52}},
              color={95,95,95})}));
  end Nonlinear;

  package Routing "Library of blocks to combine and extract signals"
    extends Modelica_Icons.Package;

    block Replicator "Signal replicator"
      extends Modelica_Blocks_Interfaces.SIMO;
    equation
      y = fill(u, nout);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-100,0},{-6,0}}, color={0,0,127}),
            Line(points={{100,0},{10,0}}, color={0,0,127}),
            Line(points={{0,0},{100,10}}, color={0,0,127}),
            Line(points={{0,0},{100,-10}}, color={0,0,127}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              lineColor={0,0,0},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This block replicates the input signal to an array of <code>nout</code> identical output signals.
</p>
</html>"));
    end Replicator;

    block IntegerReplicator "Integer signal replicator"
      extends Icons.IntegerBlock;
      parameter Integer nout=1 "Number of outputs";
      Modelica_Blocks_Interfaces.IntegerInput u
        "Connector of Integer input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.IntegerOutput y[nout]
        "Connector of Integer output signals" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation

      y = fill(u, nout);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-100,0},{-6,0}}, color={255,127,0}),
            Line(points={{100,0},{10,0}}, color={255,127,0}),
            Line(points={{0,0},{100,10}}, color={255,127,0}),
            Line(points={{0,0},{100,-10}}, color={255,127,0}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              lineColor={0,0,0},
              fillColor={255,127,0},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This block replicates the Integer input signal to an array of <code>nout</code> identical Integer output signals.
</p>
</html>"));
    end IntegerReplicator;

    block BooleanReplicator "Boolean signal replicator"
      extends Icons.BooleanBlock;
      parameter Integer nout=1 "Number of outputs";
      Modelica_Blocks_Interfaces.BooleanInput u
        "Connector of Boolean input signal" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanOutput y[nout]
        "Connector of Boolean output signals" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation

      y = fill(u, nout);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-100,0},{-6,0}}, color={255,0,255}),
            Line(points={{100,0},{10,0}}, color={255,0,255}),
            Line(points={{0,0},{100,10}}, color={255,0,255}),
            Line(points={{0,0},{100,-10}}, color={255,0,255}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              lineColor={0,0,0},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This block replicates the Boolean input signal to an array of <code>nout</code> identical Boolean output signals.
</p>
</html>"));
    end BooleanReplicator;

  block ExtractSignal "Extract signals from an input signal vector"
    extends Modelica_Blocks_Interfaces.MIMO;
    parameter Integer extract[nout]=1:nout "Extracting vector";

  equation
    for i in 1:nout loop
      y[i] = u[extract[i]];

    end for;
    annotation (
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-90,51},{-50,-49}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Rectangle(
              extent={{50,50},{90,-50}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Polygon(
              points={{-94.4104,1.90792},{-94.4104,-2.09208},{-90.4104,-0.0920762},
                  {-94.4104,1.90792}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{-72,2},{-60.1395,12.907},{-49.1395,12.907}}, color={0,0,
                  127}),
            Line(points={{-73,4},{-59,40},{-49,40}}, color={0,0,127}),
            Line(points={{-113,0},{-76.0373,-0.0180176}}, color={0,0,127}),
            Ellipse(
              extent={{-81.0437,4.59255},{-71.0437,-4.90745}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{-73,-5},{-60,-40},{-49,-40}}, color={0,0,127}),
            Line(points={{-72,-2},{-60.0698,-12.907},{-49.0698,-12.907}}, color={
                  0,0,127}),
            Polygon(
              points={{-48.8808,-11},{-48.8808,-15},{-44.8808,-13},{-48.8808,-11}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{-46,13},{-35,13},{35,-30},{45,-30}}, color={0,0,127}),
            Line(points={{-45,40},{-35,40},{35,0},{44,0}}, color={0,0,127}),
            Line(points={{-45,-40},{-34,-40},{35,30},{44,30}}, color={0,0,127}),
            Polygon(
              points={{-49,42},{-49,38},{-45,40},{-49,42}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Polygon(
              points={{-48.8728,-38.0295},{-48.8728,-42.0295},{-44.8728,-40.0295},
                  {-48.8728,-38.0295}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Polygon(
              points={{-48.9983,14.8801},{-48.9983,10.8801},{-44.9983,12.8801},{-48.9983,
                  14.8801}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Ellipse(
              extent={{69.3052,4.12743},{79.3052,-5.37257}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{80,0},{100,0}}, color={0,0,127}),
            Polygon(
              points={{43.1618,32.3085},{43.1618,28.3085},{47.1618,30.3085},{
                  43.1618,32.3085}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Polygon(
              points={{43.2575,1.80443},{43.2575,-2.19557},{47.2575,-0.195573},{
                  43.2575,1.80443}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Polygon(
              points={{43.8805,-28.1745},{43.8805,-32.1745},{47.8805,-30.1745},{
                  43.8805,-28.1745}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{48,0},{70,0}}, color={0,0,127}),
            Line(points={{47,30},{60,30},{73,3}}, color={0,0,127}),
            Line(points={{49,-30},{60,-30},{74,-4}}, color={0,0,127}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="extract=%extract")}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-90,50},{-50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{50,50},{90,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-94.4104,1.90792},{-94.4104,-2.09208},{-90.4104,-0.0920762},
                  {-94.4104,1.90792}},
              lineColor={0,0,255},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-72,2},{-60.1395,12.907},{-49.1395,12.907}}, color={0,0,
                  255}),
            Line(points={{-73,4},{-59,40},{-49,40}}, color={0,0,255}),
            Line(points={{-112,0},{-75.0373,-0.0180176}}, color={0,0,255}),
            Ellipse(
              extent={{-80.0437,4.59255},{-70.0437,-4.90745}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-73,-5},{-60,-40},{-49,-40}}, color={0,0,255}),
            Line(points={{-72,-2},{-60.0698,-12.907},{-49.0698,-12.907}}, color={
                  0,0,255}),
            Polygon(
              points={{-48.8808,-11},{-48.8808,-15},{-44.8808,-13},{-48.8808,-11}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-46,13},{-35,13},{35,-30},{45,-30}}, color={0,0,255}),
            Line(points={{-45,40},{-35,40},{35,0},{44,0}}, color={0,0,255}),
            Line(points={{-45,-40},{-34,-40},{35,30},{44,30}}, color={0,0,255}),
            Polygon(
              points={{-49,42},{-49,38},{-45,40},{-49,42}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48.8728,-38.0295},{-48.8728,-42.0295},{-44.8728,-40.0295},
                  {-48.8728,-38.0295}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48.9983,14.8801},{-48.9983,10.8801},{-44.9983,12.8801},{-48.9983,
                  14.8801}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70.3052,4.12743},{80.3052,-5.37257}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Line(points={{80,0},{105,0}}, color={0,0,255}),
            Polygon(
              points={{44.1618,32.3085},{44.1618,28.3085},{48.1618,30.3085},{
                  44.1618,32.3085}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{44.2575,1.80443},{44.2575,-2.19557},{48.2575,-0.195573},{
                  44.2575,1.80443}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{44.8805,-28.1745},{44.8805,-32.1745},{48.8805,-30.1745},{
                  44.8805,-28.1745}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Line(points={{48,0},{70,0}}, color={0,0,255}),
            Line(points={{47,30},{60,30},{73,3}}, color={0,0,255}),
            Line(points={{49,-30},{60,-30},{74,-4}}, color={0,0,255}),
            Rectangle(extent={{-100,80},{100,-81}}, lineColor={0,0,255})}),
      Documentation(info="<HTML>
<p>Extract signals from the input connector and transfer them
to the output connector.</p>
<p>The extracting scheme is given by the integer vector 'extract'.
This vector specifies, which input signals are taken and in which
order they are transferred to the output vector. Note, that the
dimension of 'extract' has to match the number of outputs.
Additionally, the dimensions of the input connector signals and
the output connector signals have to be explicitly defined via the
parameters 'nin' and 'nout'.</p>
<p>Example:</p>
<pre>     nin = 7 \"Number of inputs\";
     nout = 4 \"Number of outputs\";
     extract[nout] = {6,3,3,2} \"Extracting vector\";
</pre>
<p>extracts four output signals (nout=4) from the seven elements of the
input vector (nin=7):</p>
<pre>   output no. 1 is set equal to input no. 6
   output no. 2 is set equal to input no. 3
   output no. 3 is set equal to input no. 3
   output no. 4 is set equal to input no. 2
</pre>
</html>"));
  end ExtractSignal;

  block Extractor
      "Extract scalar signal out of signal vector dependent on IntegerRealInput index"

    extends Modelica_Blocks_Interfaces.MISO;

    parameter Boolean allowOutOfRange=false "Index may be out of range";
    parameter Real outOfRangeValue=1e10
        "Output signal if index is out of range";

    Modelica_Blocks_Interfaces.IntegerInput index annotation (Placement(
            transformation(
            origin={0,-120},
            extent={{-20,-20},{20,20}},
            rotation=90)));
    protected
    Real k[nin];
  equation

    when {initial(),change(index)} then

      for i in 1:nin loop
        k[i] = if index == i then 1 else 0;

      end for;

    end when;

    y = if not allowOutOfRange or index > 0 and index <= nin then
                k*u else outOfRangeValue;
    annotation (Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-80,50},{-40,-50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-84.4104,1.9079},{-84.4104,-2.09208},{-80.4104,-0.09208},{
                  -84.4104,1.9079}},
              lineColor={0,0,127},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-62,2},{-50.1395,12.907},{-39.1395,12.907}}, color={0,0,
                  127}),
            Line(points={{-63,4},{-49,40},{-39,40}}, color={0,0,127}),
            Line(points={{-102,0},{-65.0373,-0.01802}}, color={0,0,127}),
            Ellipse(
              extent={{-70.0437,4.5925},{-60.0437,-4.90745}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Line(points={{-63,-5},{-50,-40},{-39,-40}}, color={0,0,127}),
            Line(points={{-62,-2},{-50.0698,-12.907},{-39.0698,-12.907}}, color={
                  0,0,127}),
            Polygon(
              points={{-38.8808,-11},{-38.8808,-15},{-34.8808,-13},{-38.8808,-11}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-39,42},{-39,38},{-35,40},{-39,42}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-38.8728,-38.0295},{-38.8728,-42.0295},{-34.8728,-40.0295},
                  {-38.8728,-38.0295}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-38.9983,14.8801},{-38.9983,10.8801},{-34.9983,12.8801},{-38.9983,
                  14.8801}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-30,50},{30,-50}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{100,0},{0,0}}, color={0,0,127}),
            Line(points={{0,2},{0,-104}}, color={255,128,0}),
            Line(points={{-35,40},{-20,40}}, color={0,0,127}),
            Line(points={{-35,13},{-20,13}}, color={0,0,127}),
            Line(points={{-35,-13},{-20,-13}}, color={0,0,127}),
            Line(points={{-35,-40},{-20,-40}}, color={0,0,127}),
            Polygon(points={{0,0},{-20,13},{-20,13},{0,0},{0,0}}, lineColor={0,0,
                  127}),
            Ellipse(
              extent={{-6,6},{6,-6}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid)}),
                              Documentation(info="<html>
<p>This block extracts a scalar output signal out the
vector of input signals dependent on the Integer
value of the additional u index:</p>
<pre>    y = u [ index ] ;
</pre>
<p>where index is an additional Integer input signal.</p>
</html>"));
  end Extractor;

    block Multiplex2 "Multiplexer block for two input connectors"
      extends Icons.Block;
      parameter Integer n1=1 "dimension of input signal connector 1";
      parameter Integer n2=1 "dimension of input signal connector 2";
      Modelica_Blocks_Interfaces.RealInput u1[n1]
        "Connector of Real input signals 1" annotation (Placement(
            transformation(extent={{-140,40},{-100,80}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u2[n2]
        "Connector of Real input signals 2" annotation (Placement(
            transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y[n1 + n2]
        "Connector of Real output signals" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));

    equation
      [y] = [u1; u2];
      annotation (
        Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the two input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1 and n2.
</p>
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{8,0},{102,0}}, color={0,0,127}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{-98,60},{-60,60},{-4,6}}, color={0,0,127}),
            Line(points={{-98,-60},{-60,-60},{-4,-4}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-98,60},{-60,60},{-4,6}}, color={0,0,255}),
            Line(points={{-98,-60},{-60,-60},{-4,-4}}, color={0,0,255}),
            Line(points={{8,0},{102,0}}, color={0,0,255}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
    end Multiplex2;

    block Multiplex3 "Multiplexer block for three input connectors"
      extends Icons.Block;
      parameter Integer n1=1 "dimension of input signal connector 1";
      parameter Integer n2=1 "dimension of input signal connector 2";
      parameter Integer n3=1 "dimension of input signal connector 3";
      Modelica_Blocks_Interfaces.RealInput u1[n1]
        "Connector of Real input signals 1" annotation (Placement(
            transformation(extent={{-140,50},{-100,90}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u2[n2]
        "Connector of Real input signals 2" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u3[n3]
        "Connector of Real input signals 3" annotation (Placement(
            transformation(extent={{-140,-90},{-100,-50}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y[n1 + n2 + n3]
        "Connector of Real output signals" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));

    equation
      [y] = [u1; u2; u3];
      annotation (
        Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the three input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2 and n3.
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{8,0},{102,0}}, color={0,0,127}),
            Line(points={{-100,70},{-60,70},{-4,6}}, color={0,0,127}),
            Line(points={{-100,0},{-12,0}}, color={0,0,127}),
            Line(points={{-100,-70},{-62,-70},{-4,-4}}, color={0,0,127}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-100,70},{-60,70},{-4,6}}, color={0,0,255}),
            Line(points={{-100,-70},{-62,-70},{-4,-4}}, color={0,0,255}),
            Line(points={{8,0},{102,0}}, color={0,0,255}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-100,0},{-12,0}}, color={0,0,255})}));
    end Multiplex3;

    block Multiplex4 "Multiplexer block for four input connectors"
      extends Icons.Block;
      parameter Integer n1=1 "dimension of input signal connector 1";
      parameter Integer n2=1 "dimension of input signal connector 2";
      parameter Integer n3=1 "dimension of input signal connector 3";
      parameter Integer n4=1 "dimension of input signal connector 4";
      Modelica_Blocks_Interfaces.RealInput u1[n1]
        "Connector of Real input signals 1" annotation (Placement(
            transformation(extent={{-140,70},{-100,110}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u2[n2]
        "Connector of Real input signals 2" annotation (Placement(
            transformation(extent={{-140,10},{-100,50}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u3[n3]
        "Connector of Real input signals 3" annotation (Placement(
            transformation(extent={{-140,-50},{-100,-10}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u4[n4]
        "Connector of Real input signals 4" annotation (Placement(
            transformation(extent={{-140,-110},{-100,-70}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y[n1 + n2 + n3 + n4]
        "Connector of Real output signals" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));

    equation
      [y] = [u1; u2; u3; u4];
      annotation (
        Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the four input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2, n3 and n4.
</p>
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{8,0},{102,0}}, color={0,0,127}),
            Line(points={{-100,90},{-60,90},{-3,4}}, color={0,0,127}),
            Line(points={{-100,30},{-60,30},{-9,0}}, color={0,0,127}),
            Line(points={{-99,-30},{-59,-30},{-10,-5}}, color={0,0,127}),
            Line(points={{-100,-90},{-60,-90},{-5,-6}}, color={0,0,127}),
            Ellipse(
              extent={{-15,15},{15,-15}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-100,90},{-60,90},{-3,4}}, color={0,0,255}),
            Line(points={{-100,-90},{-60,-90},{-5,-6}}, color={0,0,255}),
            Line(points={{8,0},{102,0}}, color={0,0,255}),
            Ellipse(
              extent={{-15,15},{15,-15}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-100,30},{-60,30},{-9,0}}, color={0,0,255}),
            Line(points={{-99,-30},{-59,-30},{-10,-5}}, color={0,0,255})}));
    end Multiplex4;

    block Multiplex5 "Multiplexer block for five input connectors"
      extends Icons.Block;
      parameter Integer n1=1 "dimension of input signal connector 1";
      parameter Integer n2=1 "dimension of input signal connector 2";
      parameter Integer n3=1 "dimension of input signal connector 3";
      parameter Integer n4=1 "dimension of input signal connector 4";
      parameter Integer n5=1 "dimension of input signal connector 5";
      Modelica_Blocks_Interfaces.RealInput u1[n1]
        "Connector of Real input signals 1" annotation (Placement(
            transformation(extent={{-140,80},{-100,120}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u2[n2]
        "Connector of Real input signals 2" annotation (Placement(
            transformation(extent={{-140,30},{-100,70}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u3[n3]
        "Connector of Real input signals 3" annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u4[n4]
        "Connector of Real input signals 4" annotation (Placement(
            transformation(extent={{-140,-70},{-100,-30}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u5[n5]
        "Connector of Real input signals 5" annotation (Placement(
            transformation(extent={{-140,-120},{-100,-80}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y[n1 + n2 + n3 + n4 + n5]
        "Connector of Real output signals" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));

    equation
      [y] = [u1; u2; u3; u4; u5];
      annotation (
        Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the five input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2, n3, n4 and n5.
</p>
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{8,0},{102,0}}, color={0,0,255}),
            Line(points={{-100,100},{-60,100},{-4,6}}, color={0,0,127}),
            Line(points={{-99,50},{-60,50},{-8,5}}, color={0,0,127}),
            Line(points={{-100,0},{-7,0}}, color={0,0,127}),
            Line(points={{-99,-50},{-60,-50},{-9,-6}}, color={0,0,127}),
            Line(points={{-100,-100},{-60,-100},{-4,-4}}, color={0,0,127}),
            Ellipse(
              extent={{-15,15},{15,-15}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-100,100},{-60,100},{-4,6}}, color={0,0,255}),
            Line(points={{-100,-100},{-60,-100},{-4,-4}}, color={0,0,255}),
            Line(points={{8,0},{102,0}}, color={0,0,255}),
            Ellipse(
              extent={{-15,15},{15,-15}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-99,50},{-60,50},{-8,5}}, color={0,0,255}),
            Line(points={{-100,0},{-7,0}}, color={0,0,255}),
            Line(points={{-99,-50},{-60,-50},{-9,-6}}, color={0,0,255})}));
    end Multiplex5;

    block Multiplex6 "Multiplexer block for six input connectors"
      extends Icons.Block;
      parameter Integer n1=1 "dimension of input signal connector 1";
      parameter Integer n2=1 "dimension of input signal connector 2";
      parameter Integer n3=1 "dimension of input signal connector 3";
      parameter Integer n4=1 "dimension of input signal connector 4";
      parameter Integer n5=1 "dimension of input signal connector 5";
      parameter Integer n6=1 "dimension of input signal connector 6";
      Modelica_Blocks_Interfaces.RealInput u1[n1]
        "Connector of Real input signals 1" annotation (Placement(
            transformation(extent={{-124,73},{-100,97}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u2[n2]
        "Connector of Real input signals 2" annotation (Placement(
            transformation(extent={{-124,39},{-100,63}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u3[n3]
        "Connector of Real input signals 3" annotation (Placement(
            transformation(extent={{-124,5},{-100,29}}, rotation=0)));

      Modelica_Blocks_Interfaces.RealInput u4[n4]
        "Connector of Real input signals 4" annotation (Placement(
            transformation(extent={{-124,-29},{-100,-5}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u5[n5]
        "Connector of Real input signals 5" annotation (Placement(
            transformation(extent={{-124,-63},{-100,-39}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealInput u6[n6]
        "Connector of Real input signals 6" annotation (Placement(
            transformation(extent={{-124,-97},{-100,-73}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y[n1 + n2 + n3 + n4 + n5 + n6]
        "Connector of Real output signals" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));

    equation
      [y] = [u1; u2; u3; u4; u5; u6];
      annotation (
        Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the six input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2, n3, n4, n5 and n6.
</p>
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{8,0},{102,0}}, color={0,0,127}),
            Ellipse(
              extent={{-15,15},{15,-15}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{-99,85},{-61,85},{-3,11}}, color={0,0,127}),
            Line(points={{-100,51},{-61,51},{-7,6}}, color={0,0,127}),
            Line(points={{-101,17},{-60,17},{-9,2}}, color={0,0,127}),
            Line(points={{-100,-18},{-60,-18},{-11,-4}}, color={0,0,127}),
            Line(points={{-99,-50},{-60,-50},{-9,-6}}, color={0,0,127}),
            Line(points={{-100,-85},{-60,-85},{-3,-10}}, color={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-99,85},{-61,85},{-3,11}}, color={0,0,255}),
            Line(points={{-100,-85},{-60,-85},{-3,-10}}, color={0,0,255}),
            Line(points={{8,0},{102,0}}, color={0,0,255}),
            Ellipse(
              extent={{-15,15},{15,-15}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-100,51},{-61,51},{-7,6}}, color={0,0,255}),
            Line(points={{-99,-50},{-60,-50},{-9,-6}}, color={0,0,255}),
            Line(points={{-101,17},{-60,17},{-9,2}}, color={0,0,255}),
            Line(points={{-100,-18},{-60,-18},{-11,-4}}, color={0,0,255})}));
    end Multiplex6;

    block DeMultiplex2 "DeMultiplexer block for two output connectors"
      extends Icons.Block;
      parameter Integer n1=1 "dimension of output signal connector 1";
      parameter Integer n2=1 "dimension of output signal connector 2";
      Modelica_Blocks_Interfaces.RealInput u[n1 + n2]
        "Connector of Real input signals" annotation (Placement(transformation(
              extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y1[n1]
        "Connector of Real output signals 1" annotation (Placement(
            transformation(extent={{100,50},{120,70}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y2[n2]
        "Connector of Real output signals 2" annotation (Placement(
            transformation(extent={{100,-70},{120,-50}}, rotation=0)));

    equation
      [u] = [y1; y2];
      annotation (
        Documentation(info="<HTML>
<p>
The input connector is <b>split</b> up into two output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1 and n2.
</p>
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}),
          graphics={
            Line(points={{100,60},{60,60},{10,8}}, color={0,0,127}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{100,-60},{60,-60},{8,-8}}, color={0,0,127}),
            Line(points={{-100,0},{-6,0}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{100,60},{60,60},{10,8}}, color={0,0,255}),
            Line(points={{100,-60},{60,-60},{8,-8}}, color={0,0,255}),
            Line(points={{-100,0},{-6,0}}, color={0,0,255}),
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
    end DeMultiplex2;

    block DeMultiplex3 "DeMultiplexer block for three output connectors"
      extends Icons.Block;
      parameter Integer n1=1 "dimension of output signal connector 1";
      parameter Integer n2=1 "dimension of output signal connector 2";
      parameter Integer n3=1 "dimension of output signal connector 3";
      Modelica_Blocks_Interfaces.RealInput u[n1 + n2 + n3]
        "Connector of Real input signals" annotation (Placement(transformation(
              extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y1[n1]
        "Connector of Real output signals 1" annotation (Placement(
            transformation(extent={{100,60},{120,80}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y2[n2]
        "Connector of Real output signals 2" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y3[n3]
        "Connector of Real output signals 3" annotation (Placement(
            transformation(extent={{100,-80},{120,-60}}, rotation=0)));

    equation
      [u] = [y1; y2; y3];
      annotation (
        Documentation(info="<HTML>
<p>
The input connector is <b>split</b> into three output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1, n2 and n3.
</p>
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-100,0},{-6,0}}, color={0,0,127}),
            Line(points={{100,70},{60,70},{4,5}}, color={0,0,127}),
            Line(points={{0,0},{101,0}}, color={0,0,127}),
            Line(points={{100,-70},{61,-70},{5,-5}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{100,70},{60,70},{4,5}}, color={0,0,255}),
            Line(points={{100,-70},{61,-70},{5,-5}}, color={0,0,255}),
            Line(points={{-100,0},{-6,0}}, color={0,0,255}),
            Ellipse(
              extent={{-16,15},{14,-15}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{0,0},{101,0}}, color={0,0,255})}));
    end DeMultiplex3;

    block DeMultiplex4 "DeMultiplexer block for four output connectors"

      extends Icons.Block;
      parameter Integer n1=1 "dimension of output signal connector 1";
      parameter Integer n2=1 "dimension of output signal connector 2";
      parameter Integer n3=1 "dimension of output signal connector 3";
      parameter Integer n4=1 "dimension of output signal connector 4";
      Modelica_Blocks_Interfaces.RealInput u[n1 + n2 + n3 + n4]
        "Connector of Real input signals" annotation (Placement(transformation(
              extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y1[n1]
        "Connector of Real output signals 1" annotation (Placement(
            transformation(extent={{100,80},{120,100}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y2[n2]
        "Connector of Real output signals 2" annotation (Placement(
            transformation(extent={{100,20},{120,40}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y3[n3]
        "Connector of Real output signals 3" annotation (Placement(
            transformation(extent={{100,-40},{120,-20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y4[n4]
        "Connector of Real output signals 4" annotation (Placement(
            transformation(extent={{100,-100},{120,-80}}, rotation=0)));

    equation
      [u] = [y1; y2; y3; y4];
      annotation (
        Documentation(info="<HTML>
<p>
The input connector is <b>split</b> into four output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1, n2, n3 and n4.
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{-100,0},{-6,0}}, color={0,0,127}),
            Line(points={{100,90},{60,90},{6,5}}, color={0,0,127}),
            Line(points={{100,30},{60,30},{9,2}}, color={0,0,127}),
            Line(points={{100,-30},{60,-30},{8,-4}}, color={0,0,127}),
            Line(points={{99,-90},{60,-90},{6,-6}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{100,90},{60,90},{6,5}}, color={0,0,255}),
            Line(points={{99,-90},{60,-90},{6,-6}}, color={0,0,255}),
            Line(points={{-100,0},{-6,0}}, color={0,0,255}),
            Line(points={{100,30},{60,30},{9,2}}, color={0,0,255}),
            Line(points={{100,-30},{60,-30},{8,-4}}, color={0,0,255}),
            Ellipse(
              extent={{-16,15},{14,-15}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}));
    end DeMultiplex4;

    block DeMultiplex5 "DeMultiplexer block for five output connectors"

      extends Icons.Block;
      parameter Integer n1=1 "dimension of output signal connector 1";
      parameter Integer n2=1 "dimension of output signal connector 2";
      parameter Integer n3=1 "dimension of output signal connector 3";
      parameter Integer n4=1 "dimension of output signal connector 4";
      parameter Integer n5=1 "dimension of output signal connector 5";
      Modelica_Blocks_Interfaces.RealInput u[n1 + n2 + n3 + n4 + n5]
        "Connector of Real input signals" annotation (Placement(transformation(
              extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y1[n1]
        "Connector of Real output signals 1" annotation (Placement(
            transformation(extent={{100,70},{120,90}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y2[n2]
        "Connector of Real output signals 2" annotation (Placement(
            transformation(extent={{100,30},{120,50}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y3[n3]
        "Connector of Real output signals 3" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y4[n4]
        "Connector of Real output signals 4" annotation (Placement(
            transformation(extent={{100,-50},{120,-30}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y5[n5]
        "Connector of Real output signals 5" annotation (Placement(
            transformation(extent={{100,-90},{120,-70}}, rotation=0)));

    equation
      [u] = [y1; y2; y3; y4; y5];
      annotation (
        Documentation(info="<HTML>
<p>
The input connector is <b>split</b> into five output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1, n2, n3, n4 and n5.
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{-100,0},{-6,0}}, color={0,0,127}),
            Line(points={{99,80},{60,80},{6,5}}, color={0,0,127}),
            Line(points={{100,40},{60,40},{10,3}}, color={0,0,127}),
            Line(points={{100,0},{10,0}}, color={0,0,127}),
            Line(points={{100,-40},{61,-40},{11,-7}}, color={0,0,127}),
            Line(points={{100,-80},{60,-80},{7,-5}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{99,80},{60,80},{6,5}}, color={0,0,255}),
            Line(points={{100,-80},{60,-80},{7,-5}}, color={0,0,255}),
            Line(points={{-100,0},{-6,0}}, color={0,0,255}),
            Ellipse(
              extent={{-14,15},{16,-15}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{100,40},{60,40},{10,3}}, color={0,0,255}),
            Line(points={{100,0},{10,0}}, color={0,0,255}),
            Line(points={{100,-40},{61,-40},{11,-7}}, color={0,0,255})}));
    end DeMultiplex5;

    block DeMultiplex6 "DeMultiplexer block for six output connectors"
      extends Icons.Block;
      parameter Integer n1=1 "dimension of output signal connector 1";
      parameter Integer n2=1 "dimension of output signal connector 2";
      parameter Integer n3=1 "dimension of output signal connector 3";
      parameter Integer n4=1 "dimension of output signal connector 4";
      parameter Integer n5=1 "dimension of output signal connector 5";
      parameter Integer n6=1 "dimension of output signal connector 6";
      Modelica_Blocks_Interfaces.RealInput u[n1 + n2 + n3 + n4 + n5 + n6]
        "Connector of Real input signals" annotation (Placement(transformation(
              extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y1[n1]
        "Connector of Real output signals 1" annotation (Placement(
            transformation(extent={{100,80},{120,100}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y2[n2]
        "Connector of Real output signals 2" annotation (Placement(
            transformation(extent={{100,44},{120,64}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y3[n3]
        "Connector of Real output signals 3" annotation (Placement(
            transformation(extent={{100,8},{120,28}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y4[n4]
        "Connector of Real output signals 4" annotation (Placement(
            transformation(extent={{100,-28},{120,-8}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y5[n5]
        "Connector of Real output signals 5" annotation (Placement(
            transformation(extent={{100,-64},{120,-44}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y6[n6]
        "Connector of Real output signals 6" annotation (Placement(
            transformation(extent={{100,-100},{120,-80}}, rotation=0)));

    equation
      [u] = [y1; y2; y3; y4; y5; y6];
      annotation (
        Documentation(info="<HTML>
<p>
The input connector is <b>split</b> into six output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1, n2, n3, n4, n5 and n6.
</html>"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
              extent={{-14,16},{16,-14}},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,127}),
            Line(points={{-100,0},{-6,0}}, color={0,0,127}),
            Line(points={{99,90},{60,90},{5,10}}, color={0,0,127}),
            Line(points={{100,53},{60,53},{8,6}}, color={0,0,127}),
            Line(points={{100,18},{59,18},{7,2}}, color={0,0,127}),
            Line(points={{100,-19},{60,-19},{13,-2}}, color={0,0,127}),
            Line(points={{99,-54},{60,-54},{9,-1}}, color={0,0,127}),
            Line(points={{100,-91},{60,-91},{3,-7}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{99,90},{60,90},{5,10}}, color={0,0,255}),
            Line(points={{100,-91},{60,-91},{3,-7}}, color={0,0,255}),
            Line(points={{-100,0},{-6,0}}, color={0,0,255}),
            Ellipse(
              extent={{-14,15},{16,-15}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{100,53},{60,53},{8,6}}, color={0,0,255}),
            Line(points={{99,-54},{60,-54},{9,-1}}, color={0,0,255}),
            Line(points={{100,18},{59,18},{7,2}}, color={0,0,255}),
            Line(points={{100,-19},{60,-19},{13,-2}}, color={0,0,255})}));
    end DeMultiplex6;

    model RealPassThrough "Pass a Real signal through without modification"

      extends Icons.Block;

      Modelica_Blocks_Interfaces.RealInput u "Input signal" annotation (
          HideResult=true, Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput y "Output signal" annotation (
          HideResult=true, Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
    equation
      y = u;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Line(points={{-100,0},{100,0}},
                color={0,0,127})}),
                        Documentation(info="<html>
<p>
Passes a Real signal through without modification.  Enables signals to be read out of one bus, have their name changed and be sent back to a bus.
</p>
</html>"));
    end RealPassThrough;

    model IntegerPassThrough
      "Pass a Integer signal through without modification"
      extends Icons.IntegerBlock;

      Modelica_Blocks_Interfaces.IntegerInput u "Input signal" annotation (
          Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.IntegerOutput y "Output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = u;

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Line(points={{-100,0},{100,0}},
                color={255,128,0})}),
                        Documentation(info="<html>
<p>Passes a Integer signal through without modification.  Enables signals to be read out of one bus, have their name changed and be sent back to a bus.</p>
</html>"));
    end IntegerPassThrough;

    model BooleanPassThrough
      "Pass a Boolean signal through without modification"
      extends Icons.BooleanBlock;

      Modelica_Blocks_Interfaces.BooleanInput u "Input signal" annotation (
          Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanOutput y "Output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = u;
      annotation (                         Documentation(info="<html>
<p>Passes a Boolean signal through without modification.  Enables signals to be read out of one bus, have their name changed and be sent back to a bus.</p>
</html>"),
        Icon(
          coordinateSystem(preserveAspectRatio=true,
              extent={{-100.0,-100.0},{100.0,100.0}},
              initialScale=0.1),
              graphics={
          Line(
            points={{-100.0,0.0},{100.0,0.0}},
            color={255,0,255})}));
    end BooleanPassThrough;
    annotation (Documentation(info="<html>
<p>
This package contains blocks to combine and extract signals.
</p>
</html>"),   Icon(graphics={
          Line(points={{-90,0},{4,0}}, color={95,95,95}),
          Line(points={{88,65},{48,65},{-8,0}}, color={95,95,95}),
          Line(points={{-8,0},{93,0}}, color={95,95,95}),
          Line(points={{87,-65},{48,-65},{-8,0}}, color={95,95,95})}));
  end Routing;

  package Sources
    "Library of signal source blocks generating Real and Boolean signals"
    import Interfaces =
           Modelica_Blocks_Interfaces;
    import SIunits = Modelica_SIunits;
    extends Modelica_Icons.SourcesPackage;

    block RealExpression "Set output signal to a time varying Real expression"

      Modelica_Blocks_Interfaces.RealOutput y=0.0 "Value of Real output"
        annotation (Dialog(group="Time varying output signal"), Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));

      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised),
            Text(
              extent={{-96,15},{96,-15}},
              lineColor={0,0,0},
              textString="%y"),
            Text(
              extent={{-150,90},{140,50}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>
The (time varying) Real output signal of this block can be defined in its
parameter menu via variable <b>y</b>. The purpose is to support the
easy definition of Real expressions in a block diagram. For example,
in the y-menu the definition \"if time &lt; 1 then 0 else 1\" can be given in order
to define that the output signal is one, if time &ge; 1 and otherwise
it is zero. Note, that \"time\" is a built-in variable that is always
accessible and represents the \"model time\" and that
Variable <b>y</b> is both a variable and a connector.
</p>
</html>"));

    end RealExpression;

    block IntegerExpression
      "Set output signal to a time varying Integer expression"

      Modelica_Blocks_Interfaces.IntegerOutput y=0 "Value of Integer output"
        annotation (Dialog(group="Time varying output signal"), Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));

      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised),
            Text(
              extent={{-96,15},{96,-15}},
              lineColor={0,0,0},
              textString="%y"),
            Text(
              extent={{-150,90},{140,50}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(info="<html>
<p>
The (time varying) Integer output signal of this block can be defined in its
parameter menu via variable <b>y</b>. The purpose is to support the
easy definition of Integer expressions in a block diagram. For example,
in the y-menu the definition \"if time &lt; 1 then 0 else 1\" can be given in order
to define that the output signal is one, if time &ge; 1 and otherwise
it is zero. Note, that \"time\" is a built-in variable that is always
accessible and represents the \"model time\" and that
Variable <b>y</b> is both a variable and a connector.
</p>
</html>"));

    end IntegerExpression;

    block BooleanExpression
      "Set output signal to a time varying Boolean expression"

      Modelica_Blocks_Interfaces.BooleanOutput y=false
        "Value of Boolean output" annotation (Dialog(group=
              "Time varying output signal"), Placement(transformation(extent={{
                100,-10},{120,10}}, rotation=0)));

      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised),
            Text(
              extent={{-96,15},{96,-15}},
              lineColor={0,0,0},
              textString="%y"),
            Text(
              extent={{-150,90},{140,50}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{100,10},{120,0},{100,-10},{100,10}},
              lineColor=DynamicSelect({255,0,255}, if y > 0.5 then {0,255,0}
                   else {255,0,255}),
              fillColor=DynamicSelect({255,255,255}, if y > 0.5 then {0,255,0}
                   else {255,255,255}),
              fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
The (time varying) Boolean output signal of this block can be defined in its
parameter menu via variable <b>y</b>. The purpose is to support the
easy definition of Boolean expressions in a block diagram. For example,
in the y-menu the definition \"time &gt;= 1 and time &lt;= 2\" can be given in order
to define that the output signal is <b>true</b> in the time interval
1 &le; time &le; 2 and otherwise it is <b>false</b>.
Note, that \"time\" is a built-in variable that is always
accessible and represents the \"model time\" and that
Variable <b>y</b> is both a variable and a connector.
</p>
</html>"));

    end BooleanExpression;

    block Clock "Generate actual time signal"
      parameter SIunits.Time offset=0 "Offset of output signal";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;

    equation
      y = offset + (if time < startTime then 0 else time - startTime);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Ellipse(extent={{-80,80},{80,-80}}, lineColor={160,160,164}),
            Line(points={{0,80},{0,60}}, color={160,160,164}),
            Line(points={{80,0},{60,0}}, color={160,160,164}),
            Line(points={{0,-80},{0,-60}}, color={160,160,164}),
            Line(points={{-80,0},{-60,0}}, color={160,160,164}),
            Line(points={{37,70},{26,50}}, color={160,160,164}),
            Line(points={{70,38},{49,26}}, color={160,160,164}),
            Line(points={{71,-37},{52,-27}}, color={160,160,164}),
            Line(points={{39,-70},{29,-51}}, color={160,160,164}),
            Line(points={{-39,-70},{-29,-52}}, color={160,160,164}),
            Line(points={{-71,-37},{-50,-26}}, color={160,160,164}),
            Line(points={{-71,37},{-54,28}}, color={160,160,164}),
            Line(points={{-38,70},{-28,51}}, color={160,160,164}),
            Line(
              points={{0,0},{-50,50}},
              color={0,0,0},
              thickness=0.5),
            Line(
              points={{0,0},{40,0}},
              color={0,0,0},
              thickness=0.5),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="startTime=%startTime")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-80,90},{-85,68},{-75,68},{-80,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
            Line(
              points={{-80,0},{-10,0},{60,70}},
              color={0,0,255},
              thickness=0.5),
            Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
            Polygon(
              points={{90,-70},{68,-64},{68,-76},{90,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-34,0},{-34,-70}},   color={95,95,95}),
            Polygon(
              points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-77,-28},{-35,-40}},
              lineColor={0,0,0},
              textString="offset"),
            Text(
              extent={{-30,-73},{18,-86}},
              lineColor={0,0,0},
              textString="startTime"),
            Text(
              extent={{-81,91},{-40,71}},
              lineColor={0,0,0},
              textString="y"),
            Text(
              extent={{63,-79},{94,-89}},
              lineColor={0,0,0},
              textString="time"),
            Line(points={{-10,0},{-10,-70}}, color={95,95,95}),
            Line(points={{-10,0},{50,0}}, color={95,95,95}),
            Line(points={{50,0},{50,60}}, color={95,95,95}),
            Text(
              extent={{35,33},{50,23}},
              lineColor={0,0,0},
              textString="1"),
            Text(
              extent={{14,13},{32,1}},
              lineColor={0,0,0},
              textString="1")}),
        Documentation(info="<html>
<p>
The Real output y is a clock signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Clock.png\"
     alt=\"Clock.png\">
</p>
</html>"));
    end Clock;

    block Constant "Generate constant signal of type Real"
      parameter Real k(start=1) "Constant output value";
      extends Modelica_Blocks_Interfaces.SO;

    equation
      y = k;
      annotation (
        defaultComponentName="const",
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,0},{80,0}}, color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="k=%k")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-80,90},{-86,68},{-74,68},{-80,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
            Line(
              points={{-80,0},{80,0}},
              color={0,0,255},
              thickness=0.5),
            Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
            Polygon(
              points={{90,-70},{68,-64},{68,-76},{90,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-83,92},{-30,74}},
              lineColor={0,0,0},
              textString="y"),
            Text(
              extent={{70,-80},{94,-100}},
              lineColor={0,0,0},
              textString="time"),
            Text(
              extent={{-101,8},{-81,-12}},
              lineColor={0,0,0},
              textString="k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Constant.png\"
     alt=\"Constant.png\">
</p>
</html>"));
    end Constant;

    block Step "Generate step signal of type Real"
      parameter Real height=1 "Height of step";
      extends Modelica_Blocks_Interfaces.SignalSource;

    equation
      y = offset + (if time < startTime then 0 else height);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{0,-70},{0,50},{80,50}}, color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="startTime=%startTime")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-80,90},{-86,68},{-74,68},{-80,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
            Line(
              points={{-80,-18},{0,-18},{0,50},{80,50}},
              color={0,0,255},
              thickness=0.5),
            Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
            Polygon(
              points={{90,-70},{68,-64},{68,-76},{90,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{70,-80},{94,-100}},
              lineColor={0,0,0},
              textString="time"),
            Text(
              extent={{-21,-72},{25,-90}},
              lineColor={0,0,0},
              textString="startTime"),
            Line(points={{0,-18},{0,-70}}, color={95,95,95}),
            Text(
              extent={{-68,-36},{-22,-54}},
              lineColor={0,0,0},
              textString="offset"),
            Line(points={{-13,50},{-13,-17}}, color={95,95,95}),
            Polygon(
              points={{0,50},{-21,50},{0,50}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-13,-18},{-16,-5},{-10,-5},{-13,-18},{-13,-18}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-13,50},{-16,37},{-10,37},{-13,50}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-68,26},{-22,8}},
              lineColor={0,0,0},
              textString="height"),
            Polygon(
              points={{-13,-70},{-16,-57},{-10,-57},{-13,-70},{-13,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-13,-18},{-13,-70}}, color={95,95,95}),
            Polygon(
              points={{-13,-18},{-16,-31},{-10,-31},{-13,-18}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-72,100},{-31,80}},
              lineColor={0,0,0},
              textString="y")}),
        Documentation(info="<html>
<p>
The Real output y is a step signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Step.png\"
     alt=\"Step.png\">
</p>

</html>"));
    end Step;

    block Ramp "Generate ramp signal"
      parameter Real height=1 "Height of ramps";
      parameter SIunits.Time duration(min=0.0, start=2)
        "Duration of ramp (= 0.0 gives a Step)";
      parameter Real offset=0 "Offset of output signal";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;

    equation
      y = offset + (if time < startTime then 0 else if time < (startTime +
        duration) then (time - startTime)*height/duration else height);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{-40,-70},{31,38}}, color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="duration=%duration"),
            Line(points={{31,38},{86,38}}, color={0,0,0})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-80,90},{-86,68},{-74,68},{-80,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
            Line(
              points={{-80,-20},{-20,-20},{50,50}},
              color={0,0,255},
              thickness=0.5),
            Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
            Polygon(
              points={{90,-70},{68,-64},{68,-76},{90,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,-20},{-42,-30},{-38,-30},{-40,-20}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-40,-20},{-40,-70}},
              color={95,95,95},
              thickness=0.25,
              arrow={Arrow.None,Arrow.None}),
            Polygon(
              points={{-40,-70},{-42,-60},{-38,-60},{-40,-70},{-40,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-72,-39},{-34,-50}},
              lineColor={0,0,0},
              textString="offset"),
            Text(
              extent={{-38,-72},{6,-83}},
              lineColor={0,0,0},
              textString="startTime"),
            Text(
              extent={{-78,92},{-37,72}},
              lineColor={0,0,0},
              textString="y"),
            Text(
              extent={{70,-80},{94,-91}},
              lineColor={0,0,0},
              textString="time"),
            Line(points={{-20,-20},{-20,-70}}, color={95,95,95}),
            Line(
              points={{-19,-20},{50,-20}},
              color={95,95,95},
              thickness=0.25,
              arrow={Arrow.None,Arrow.None}),
            Line(
              points={{50,50},{101,50}},
              color={0,0,255},
              thickness=0.5),
            Line(
              points={{50,50},{50,-20}},
              color={95,95,95},
              thickness=0.25,
              arrow={Arrow.None,Arrow.None}),
            Polygon(
              points={{50,-20},{42,-18},{42,-22},{50,-20}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-20,-20},{-11,-18},{-11,-22},{-20,-20}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{50,50},{48,40},{52,40},{50,50}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{50,-20},{48,-10},{52,-10},{50,-20},{50,-20}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{53,23},{82,10}},
              lineColor={0,0,0},
              textString="height"),
            Text(
              extent={{-2,-21},{37,-33}},
              lineColor={0,0,0},
              textString="duration")}),
        Documentation(info="<html>
<p>
The Real output y is a ramp signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Ramp.png\"
     alt=\"Ramp.png\">
</p>

<p>
If parameter duration is set to 0.0, the limiting case of a Step signal is achieved.
</p>
</html>"));
    end Ramp;

    block Sine "Generate sine signal"
      parameter Real amplitude=1 "Amplitude of sine wave";
      parameter SIunits.Frequency freqHz(start=1) "Frequency of sine wave";
      parameter SIunits.Angle phase=0 "Phase of sine wave";
      parameter Real offset=0 "Offset of output signal";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;
    protected
      constant Real pi=Modelica_Constants.pi;

    equation
      y = offset + (if time < startTime then 0 else amplitude*Modelica_Math.sin(2
        *pi*freqHz*(time - startTime) + phase));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,
                  74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,
                  59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,
                  -64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},
                  {57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,0}, smooth=  Smooth.Bezier),
            Text(
              extent={{-147,-152},{153,-112}},
              lineColor={0,0,0},
              textString="freqHz=%freqHz")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,-90},{-80,84}}, color={95,95,95}),
            Polygon(
              points={{-80,97},{-84,81},{-76,81},{-80,97}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-99,-40},{85,-40}}, color={95,95,95}),
            Polygon(
              points={{97,-40},{81,-36},{81,-45},{97,-40}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-41,-2},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},
                  {-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.201,69.7},{4.02,59.4},
                  {8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{
                  42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{
                  63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}},
              color={0,0,255},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Line(
              points={{-41,-2},{-80,-2}},
              color={0,0,255},
              thickness=0.5),
            Text(
              extent={{-87,12},{-40,0}},
              lineColor={0,0,0},
              textString="offset"),
            Line(points={{-41,-2},{-41,-40}}, color={95,95,95}),
            Text(
              extent={{-60,-43},{-14,-54}},
              lineColor={0,0,0},
              textString="startTime"),
            Text(
              extent={{75,-47},{100,-60}},
              lineColor={0,0,0},
              textString="time"),
            Text(
              extent={{-80,99},{-40,82}},
              lineColor={0,0,0},
              textString="y"),
            Line(points={{-9,80},{43,80}}, color={95,95,95}),
            Line(points={{-41,-2},{50,-2}}, color={95,95,95}),
            Polygon(
              points={{33,80},{30,67},{36,67},{33,80}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{37,57},{83,39}},
              lineColor={0,0,0},
              textString="amplitude"),
            Polygon(
              points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{33,80},{33,-2}}, color={95,95,95})}),
        Documentation(info="<html>
<p>
The Real output y is a sine signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Sine.png\"
     alt=\"Sine.png\">
</p>
</html>"));
    end Sine;

    block Cosine "Generate cosine signal"
      parameter Real amplitude=1 "Amplitude of cosine wave";
      parameter SIunits.Frequency freqHz(start=1) "Frequency of cosine wave";
      parameter SIunits.Angle phase=0 "Phase of cosine wave";
      parameter Real offset=0 "Offset of output signal";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;
    protected
      constant Real pi=Modelica_Constants.pi;

    equation
      y = offset + (if time < startTime then 0 else amplitude*Modelica_Math.cos(2
        *pi*freqHz*(time - startTime) + phase));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,80},{-76.2,79.8},{-70.6,76.6},{-64.9,69.7},{-59.3,
                  59.4},{-52.9,44.1},{-44.83,21.2},{-27.9,-30.8},{-20.7,-50.2},{-14.3,
                  -64.2},{-8.7,-73.1},{-3,-78.4},{2.6,-80},{8.2,-77.6},{13.9,-71.5},
                  {19.5,-61.9},{25.9,-47.2},{34,-24.8},{42,0}}, color={0,0,0}, smooth=Smooth.Bezier),
            Text(
              extent={{-147,-152},{153,-112}},
              lineColor={0,0,0},
              textString="freqHz=%freqHz"),
            Line(points={{42,1},{53.3,35.2},{60.5,54.1},{66.9,67.4},{72.6,75.6},{
                  78.2,80.1},{83.8,80.8}}, color={0,0,0})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={95,95,
              95}),Polygon(
                points={{-80,97},{-84,81},{-76,81},{-80,97}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(points={{-99,-40},{85,-40}},
              color={95,95,95}),Polygon(
                points={{97,-40},{81,-36},{81,-45},{97,-40}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,255},
                thickness=0.5),Text(
                extent={{-87,12},{-40,0}},
                lineColor={0,0,0},
                textString="offset"),Line(points={{-41,-2},{-41,-40}}, color={95,
              95,95}),Text(
                extent={{-60,-43},{-14,-54}},
                lineColor={0,0,0},
                textString="startTime"),Text(
                extent={{75,-47},{100,-60}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-80,99},{-40,82}},
                lineColor={0,0,0},
                textString="y"),Line(points={{-41,80},{43,80}}, color={95,95,95}),
              Line(points={{-41,-2},{40,-2}}, color={95,95,95}),Polygon(
                points={{33,80},{30,67},{36,67},{33,80}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Text(
                extent={{37,57},{83,39}},
                lineColor={0,0,0},
                textString="amplitude"),Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(points={{33,80},{33,-2}},
              color={95,95,95}),Line(
                points={{-41,80},{-38,79},{-35.42,75.6},{-31.201,68.7},{-26.98,
                58.4},{-22.16,43.1},{-16.1,20.2},{-3.5,-31.8},{2,-51.2},{6.8,-65.2},
                {11,-74.1},{15.2,-79.4},{19.5,-81},{23.7,-78.6},{27.9,-72.5},{
                32.1,-62.9},{36.9,-48.2},{43,-25.8},{49,-1},{49,-1},{57.4,33.2},{
                62.9,52.1},{67.7,65.4},{71.9,73.6},{76.1,78.1},{80,79}},
                color={0,0,255},
                thickness=0.5,
                smooth=Smooth.Bezier),Line(
                points={{-41,80},{-41,-2}},
                color={0,0,255},
                thickness=0.5)}),
        Documentation(info="<html>
<p>
The Real output y is a cosine signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Cosine.png\"
     alt=\"Cosine.png\">
</p>
</html>"));
    end Cosine;

    block ExpSine "Generate exponentially damped sine signal"
      parameter Real amplitude=1 "Amplitude of sine wave";
      parameter SIunits.Frequency freqHz(start=2) "Frequency of sine wave";
      parameter SIunits.Angle phase=0 "Phase of sine wave";
      parameter SIunits.Damping damping(start=1)
        "Damping coefficient of sine wave";
      parameter Real offset=0 "Offset of output signal";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;
    protected
      constant Real pi=Modelica_Constants.pi;

    equation
      y = offset + (if time < startTime then 0 else amplitude*Modelica_Math.exp(-
        (time - startTime)*damping)*Modelica_Math.sin(2*pi*freqHz*(time -
        startTime) + phase));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,0},{-75.2,32.3},{-72,50.3},{-68.7,64.5},{-65.5,74.2},
                  {-62.3,79.3},{-59.1,79.6},{-55.9,75.3},{-52.7,67.1},{-48.6,52.2},
                  {-43,25.8},{-35,-13.9},{-30.2,-33.7},{-26.1,-45.9},{-22.1,-53.2},
                  {-18.1,-55.3},{-14.1,-52.5},{-10.1,-45.3},{-5.23,-32.1},{8.44,
                  13.7},{13.3,26.4},{18.1,34.8},{22.1,38},{26.9,37.2},{31.8,31.8},
                  {38.2,19.4},{51.1,-10.5},{57.5,-21.2},{63.1,-25.9},{68.7,-25.9},
                  {75.2,-20.5},{80,-13.8}}, color={0,0,0}, smooth=  Smooth.Bezier),
            Text(
              extent={{-147,-152},{153,-112}},
              lineColor={0,0,0},
              textString="freqHz=%freqHz")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-86,-90},{-86,84}}, color={95,95,95}),
            Polygon(
              points={{-86,98},{-90,82},{-82,82},{-86,98}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-99,-40},{85,-40}}, color={95,95,95}),
            Polygon(
              points={{97,-40},{81,-35},{81,-44},{97,-40}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},{
                  -35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{
                  -19.9,22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},
                  {0.302,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},
                  {25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,
                  16.9},{56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,
                  -18},{80,-12.1}},
              color={0,0,255},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Text(
              extent={{-80,17},{-57,-3}},
              lineColor={0,0,0},
              textString="offset"),
            Text(
              extent={{-72,-43},{-25,-53}},
              lineColor={0,0,0},
              textString="startTime"),
            Text(
              extent={{77,-53},{101,-64}},
              lineColor={0,0,0},
              textString="time"),
            Text(
              extent={{-89,99},{-49,82}},
              lineColor={0,0,0},
              textString="y"),
            Line(points={{-50,0},{18,0}}, color={95,95,95}),
            Line(
              points={{-50,0},{-86,0}},
              color={0,0,255},
              thickness=0.5),
            Line(points={{-50,77},{-50,0}}, color={95,95,95}),
            Line(points={{18,-1},{18,76}}, color={95,95,95}),
            Line(points={{18,73},{-50,73}}, color={95,95,95}),
            Text(
              extent={{-42,83},{9,74}},
              lineColor={0,0,0},
              textString="1/freqHz"),
            Polygon(
              points={{-50,73},{-41,75},{-41,71},{-50,73}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{18,73},{10,75},{10,71},{18,73}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-50,-61},{-19,-61}}, color={95,95,95}),
            Polygon(
              points={{-18,-61},{-26,-59},{-26,-63},{-18,-61}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-51,-63},{-27,-75}},
              lineColor={0,0,0},
              textString="t"),
            Text(
              extent={{-83,-69},{100,-96}},
              lineColor={0,0,0},
              textString="amplitude*exp(-damping*t)*sin(2*pi*freqHz*t+phase)"),
            Line(points={{-50,0},{-50,-40}}, color={95,95,95}),
            Line(points={{-50,-54},{-50,-72}}, color={95,95,95}),
            Line(points={{-15,-77},{-1,-48}}, color={95,95,95})}),
        Documentation(info="<html>
<p>
The Real output y is a sine signal with exponentially changing amplitude:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/ExpSine.png\"
     alt=\"ExpSine.png\">
</p>
</html>"));
    end ExpSine;

    model Exponentials "Generate a rising and falling exponential signal"

      parameter Real outMax=1 "Height of output for infinite riseTime";
      parameter SIunits.Time riseTime(min=0, start=0.5) "Rise time";
      parameter SIunits.Time riseTimeConst(min=Modelica_Constants.small)=0.1
        "Rise time constant; rising is defined as outMax*(1-exp(-riseTime/riseTimeConst))";
      parameter SIunits.Time fallTimeConst(min=Modelica_Constants.small)=
        riseTimeConst "Fall time constant";
      parameter Real offset=0 "Offset of output signal";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;
    protected
      Real y_riseTime;

    equation
      y_riseTime = outMax*(1 - Modelica_Math.exp(-riseTime/riseTimeConst));
      y = offset + (if (time < startTime) then 0 else if (time < (startTime +
        riseTime)) then outMax*(1 - Modelica_Math.exp(-(time - startTime)/
        riseTimeConst)) else y_riseTime*Modelica_Math.exp(-(time - startTime -
        riseTime)/fallTimeConst));

      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-70},{68,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{-77.2,-55.3},{-74.3,-42.1},{-70.8,-27.6},{-67.3,
                  -15},{-63.7,-4.08},{-59.5,7.18},{-55.3,16.7},{-50.3,26},{-44.6,
                  34.5},{-38.3,42.1},{-31.2,48.6},{-22.7,54.3},{-12.1,59.2},{-10,
                  60},{-7.88,47.5},{-5.05,32.7},{-2.22,19.8},{0.606,8.45},{4.14,-3.7},
                  {7.68,-14},{11.9,-24.2},{16.2,-32.6},{21.1,-40.5},{26.8,-47.4},
                  {33.1,-53.3},{40.9,-58.5},{50.8,-62.8},{60,-65.4}}, color={0,0,
                  0}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="riseTime=%riseTime")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-90,-74},{84,-74}}, color={95,95,95}),
            Polygon(
              points={{97,-74},{81,-70},{81,-78},{97,-74}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-40,-34},{-37.2,-19.3},{-34.3,-6.1},{-30.8,8.4},{-27.3,21},
                  {-23.7,31.92},{-19.5,43.18},{-15.3,52.7},{-10.3,62},{-4.6,70.5},
                  {1.7,78.1},{8.8,84.6},{17.3,90.3},{27.9,95.2},{30,96},{32.12,
                  83.5},{34.95,68.7},{37.78,55.8},{40.606,44.45},{44.14,32.3},{
                  47.68,22},{51.9,11.8},{56.2,3.4},{61.1,-4.5},{66.8,-11.4},{73.1,
                  -17.3},{80.9,-22.5},{90.8,-26.8},{100,-29.4}},
              color={0,0,255},
              thickness=0.5),
            Polygon(
              points={{-80,86},{-86,64},{-74,64},{-80,86}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,64},{-80,-84}}, color={95,95,95}),
            Text(
              extent={{-81,87},{-40,67}},
              lineColor={95,95,95},
              textString="y"),
            Text(
              extent={{-71,-46},{-38,-55}},
              lineColor={0,0,0},
              textString="offset"),
            Polygon(
              points={{-40,-74},{-42,-64},{-38,-64},{-40,-74},{-40,-74}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-40,-34},{-40,-74}}, color={95,95,95}),
            Polygon(
              points={{-40,-34},{-42,-44},{-38,-44},{-40,-34}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-39,-34},{-80,-34}},
              color={0,0,255},
              thickness=0.5),
            Text(
              extent={{-62,-76},{-17,-85}},
              lineColor={0,0,0},
              textString="startTime"),
            Polygon(
              points={{-40,-34},{-31,-32},{-31,-36},{-40,-34}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-40,-34},{30,-34}}, color={95,95,95}),
            Polygon(
              points={{30,-34},{22,-32},{22,-36},{30,-34}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-26,-22},{19,-32}},
              lineColor={0,0,0},
              textString="riseTime"),
            Text(
              extent={{75,-79},{98,-90}},
              lineColor={0,0,0},
              textString="time"),
            Line(points={{30,96},{30,-38}}, color={95,95,95})}),
        Documentation(info="<html>
<p>
The Real output y is a rising exponential followed
by a falling exponential signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Exponentials.png\"
     alt=\"Exponentials.png\">
</p>
</html>"));
    end Exponentials;

    block Pulse "Generate pulse signal of type Real"
      parameter Real amplitude=1 "Amplitude of pulse";
      parameter Real width(
        final min=Modelica_Constants.small,
        final max=100) = 50 "Width of pulse in % of period";
      parameter SIunits.Time period(final min=Modelica_Constants.small, start=1)
        "Time for one period";
      parameter Integer nperiod=-1
        "Number of periods (< 0 means infinite number of periods)";
      parameter Real offset=0 "Offset of output signals";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;
    protected
      SIunits.Time T_width=period*width/100;
      SIunits.Time T_start "Start time of current period";
      Integer count "Period count";
    initial algorithm
      count := integer((time - startTime)/period);
      T_start := startTime + count*period;
    equation
      when integer((time - startTime)/period) > pre(count) then
        count = pre(count) + 1;
        T_start = time;
      end when;
      y = offset + (if (time < startTime or nperiod == 0 or (nperiod > 0 and
        count >= nperiod)) then 0 else if time < T_start + T_width then amplitude
         else 0);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{-40,-70},{-40,44},{0,44},{0,-70},{40,-70},{40,
                  44},{79,44}}, color={0,0,0}),
            Text(
              extent={{-147,-152},{153,-112}},
              lineColor={0,0,0},
              textString="period=%period")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-80,90},{-85,68},{-75,68},{-80,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
            Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
            Polygon(
              points={{90,-70},{68,-65},{68,-75},{90,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-34,0},{-34,-70}},  color={95,95,95}),
            Polygon(
              points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-78,-24},{-35,-36}},
              lineColor={0,0,0},
              textString="offset"),
            Text(
              extent={{-30,-72},{16,-81}},
              lineColor={0,0,0},
              textString="startTime"),
            Text(
              extent={{-82,96},{-49,79}},
              lineColor={0,0,0},
              textString="y"),
            Text(
              extent={{66,-80},{87,-90}},
              lineColor={0,0,0},
              textString="time"),
            Line(points={{-10,0},{-10,-70}}, color={95,95,95}),
            Line(
              points={{-80,0},{-10,0},{-10,50},{30,50},{30,0},{50,0},{50,50},{90,
                  50}},
              color={0,0,255},
              thickness=0.5),
            Line(points={{-10,88},{-10,50}}, color={95,95,95}),
            Line(points={{30,74},{30,50}}, color={95,95,95}),
            Line(points={{50,88},{50,50}}, color={95,95,95}),
            Line(points={{-10,83},{50,83}}, color={95,95,95}),
            Line(points={{-10,69},{30,69}}, color={95,95,95}),
            Text(
              extent={{-3,93},{39,84}},
              lineColor={0,0,0},
              textString="period"),
            Text(
              extent={{-7,78},{30,69}},
              lineColor={0,0,0},
              textString="width"),
            Line(points={{-43,50},{-10,50}}, color={95,95,95}),
            Line(points={{-34,50},{-34,0}}, color={95,95,95}),
            Text(
              extent={{-77,30},{-37,21}},
              lineColor={0,0,0},
              textString="amplitude"),
            Polygon(
              points={{-34,50},{-37,37},{-31,37},{-34,50}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{90,50},{90,0},{100,0}},
              color={0,0,255},
              thickness=0.5),
            Polygon(
              points={{-10,69},{-1,71},{-1,67},{-10,69}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{30,69},{22,71},{22,67},{30,69}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-10,83},{-1,85},{-1,81},{-10,83}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{50,83},{42,85},{42,81},{50,83}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
The Real output y is a pulse signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Pulse.png\"
     alt=\"Pulse.png\">
</p>
</html>"));
    end Pulse;

    block SawTooth "Generate saw tooth signal"
      parameter Real amplitude=1 "Amplitude of saw tooth";
      parameter SIunits.Time period(final min=Modelica_Constants.small, start=1)
        "Time for one period";
      parameter Integer nperiod=-1
        "Number of periods (< 0 means infinite number of periods)";
      parameter Real offset=0 "Offset of output signals";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;
    protected
      SIunits.Time T_start(final start=startTime)
        "Start time of current period";
      Integer count "Period count";
    initial algorithm
      count := integer((time - startTime)/period);
      T_start := startTime + count*period;
    equation
      when integer((time - startTime)/period) > pre(count) then
        count = pre(count) + 1;
        T_start = time;
      end when;
      y = offset + (if (time < startTime or nperiod == 0 or (nperiod > 0 and
        count >= nperiod)) then 0 else amplitude*(time - T_start)/period);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{-60,-70},{0,40},{0,-70},{60,41},{60,-70}},
                color={0,0,0}),
            Text(
              extent={{-147,-152},{153,-112}},
              lineColor={0,0,0},
              textString="period=%period")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-80,90},{-86,68},{-74,68},{-80,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
            Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
            Polygon(
              points={{90,-70},{68,-65},{68,-75},{90,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-34,-20},{-37,-33},{-31,-33},{-34,-20}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-34,-20},{-34,-70}}, color={95,95,95}),
            Polygon(
              points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-65,-39},{-29,-47}},
              lineColor={0,0,0},
              textString="offset"),
            Text(
              extent={{-29,-72},{13,-80}},
              lineColor={0,0,0},
              textString="startTime"),
            Text(
              extent={{-82,92},{-43,76}},
              lineColor={0,0,0},
              textString="y"),
            Text(
              extent={{67,-78},{88,-87}},
              lineColor={0,0,0},
              textString="time"),
            Line(points={{-10,-20},{-10,-70}}, color={95,95,95}),
            Line(points={{-10,88},{-10,-20}}, color={95,95,95}),
            Line(points={{30,88},{30,59}}, color={95,95,95}),
            Line(points={{-10,83},{30,83}}, color={95,95,95}),
            Text(
              extent={{-12,94},{34,85}},
              lineColor={0,0,0},
              textString="period"),
            Line(points={{-44,60},{30,60}}, color={95,95,95}),
            Line(points={{-34,47},{-34,-20}},color={95,95,95}),
            Text(
              extent={{-73,25},{-36,16}},
              lineColor={0,0,0},
              textString="amplitude"),
            Polygon(
              points={{-34,60},{-37,47},{-31,47},{-34,60}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-10,83},{-1,85},{-1,81},{-10,83}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{30,83},{22,85},{22,81},{30,83}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}},
              color={0,0,255},
              thickness=0.5)}),
        Documentation(info="<html>
<p>
The Real output y is a saw tooth signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/SawTooth.png\"
     alt=\"SawTooth.png\">
</p>
</html>"));
    end SawTooth;

    block Trapezoid "Generate trapezoidal signal of type Real"
      parameter Real amplitude=1 "Amplitude of trapezoid";
      parameter SIunits.Time rising(final min=0)=0
        "Rising duration of trapezoid";
      parameter SIunits.Time width(final min=0)=0.5
        "Width duration of trapezoid";
      parameter SIunits.Time falling(final min=0)=0
        "Falling duration of trapezoid";
      parameter SIunits.Time period(final min=Modelica_Constants.small, start=1)
        "Time for one period";
      parameter Integer nperiod=-1
        "Number of periods (< 0 means infinite number of periods)";
      parameter Real offset=0 "Offset of output signal";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      extends Modelica_Blocks_Interfaces.SO;
    protected
      parameter SIunits.Time T_rising=rising
        "End time of rising phase within one period";
      parameter SIunits.Time T_width=T_rising + width
        "End time of width phase within one period";
      parameter SIunits.Time T_falling=T_width + falling
        "End time of falling phase within one period";
      SIunits.Time T_start "Start time of current period";
      Integer count "Period count";
    initial algorithm
      count := integer((time - startTime)/period);
      T_start := startTime + count*period;
    equation
      when integer((time - startTime)/period) > pre(count) then
        count = pre(count) + 1;
        T_start = time;
      end when;
      y = offset + (if (time < startTime or nperiod == 0 or (nperiod > 0 and
        count >= nperiod)) then 0 else if (time < T_start + T_rising) then
        amplitude*(time - T_start)/rising else if (time < T_start + T_width)
         then amplitude else if (time < T_start + T_falling) then amplitude*(
        T_start + T_falling - time)/falling else 0);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-147,-152},{153,-112}},
              lineColor={0,0,0},
              textString="period=%period"),
            Line(points={{-81,-70},{-60,-70},{-30,40},{9,40},{39,-70},{61,-70},{
                  90,40}}, color={0,0,0})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-81,90},{-87,68},{-75,68},{-81,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-81,68},{-81,-80}}, color={95,95,95}),
            Line(points={{-91,-70},{81,-70}}, color={95,95,95}),
            Polygon(
              points={{89,-70},{67,-65},{67,-76},{89,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-46,-30},{-48,-41},{-44,-41},{-46,-30}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-46,-30},{-46,-70}},
              color={95,95,95},
              pattern=LinePattern.Solid,
              arrow={Arrow.None,Arrow.None}),
            Polygon(
              points={{-46,-70},{-48,-60},{-44,-60},{-46,-70},{-46,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-80,-46},{-42,-55}},
              lineColor={0,0,0},
              textString="offset"),
            Text(
              extent={{-49,-71},{-6,-81}},
              lineColor={0,0,0},
              textString="startTime"),
            Text(
              extent={{-80,95},{-47,80}},
              lineColor={0,0,0},
              textString="y"),
            Text(
              extent={{66,-78},{89,-89}},
              lineColor={0,0,0},
              textString="time"),
            Line(
              points={{-31,82},{-31,-70}},
              color={95,95,95},
              pattern=LinePattern.Dash),
            Line(
              points={{-11,59},{-11,40}},
              color={95,95,95},
              pattern=LinePattern.Dash),
            Line(
              points={{19,59},{19,40}},
              color={95,95,95},
              pattern=LinePattern.Dash),
            Line(
              points={{39,59},{39,-30}},
              color={95,95,95},
              pattern=LinePattern.Dash),
            Line(points={{-31,76},{59,76}}, color={95,95,95}),
            Line(points={{-31,56},{39,56}}, color={95,95,95}),
            Text(
              extent={{-3,86},{24,77}},
              lineColor={0,0,0},
              textString="period"),
            Text(
              extent={{-11,68},{18,59}},
              lineColor={0,0,0},
              textString="width"),
            Line(
              points={{-43,40},{-11,40}},
              color={95,95,95},
              pattern=LinePattern.Dash),
            Line(
              points={{-40,40},{-40,-30}},
              color={95,95,95},
              pattern=LinePattern.Solid,
              arrow={Arrow.None,Arrow.None}),
            Text(
              extent={{-77,11},{-44,1}},
              lineColor={0,0,0},
              textString="amplitude"),
            Polygon(
              points={{-31,56},{-24,58},{-24,54},{-31,56}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-11,56},{-18,58},{-18,54},{-11,56}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-31,76},{-22,78},{-22,74},{-31,76}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{59,76},{51,78},{51,74},{59,76}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-81,-30},{-31,-30},{-11,40},{19,40},{39,-30},{59,-30},{79,
                  40},{99,40}},
              color={0,0,255},
              thickness=0.5),
            Polygon(
              points={{-40,40},{-42,29},{-38,29},{-40,40}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,-30},{-42,-20},{-38,-20},{-40,-30},{-40,-30}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{59,84},{59,-30}},
              color={95,95,95},
              pattern=LinePattern.Dash),
            Polygon(
              points={{39,56},{32,58},{32,54},{39,56}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{19,56},{26,58},{26,54},{19,56}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{19,56},{12,58},{12,54},{19,56}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-11,56},{-4,58},{-4,54},{-11,56}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-35,68},{-6,60}},
              lineColor={0,0,0},
              textString="rising"),
            Text(
              extent={{16,68},{44,60}},
              lineColor={0,0,0},
              textString="falling")}),
        Documentation(info="<html>
<p>
The Real output y is a trapezoid signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Trapezoid.png\"
     alt=\"Trapezoid\">
</p>
</html>"));
    end Trapezoid;

    block KinematicPTP
      "Move as fast as possible along a distance within given kinematic constraints"

      parameter Real deltaq[:]={1} "Distance to move";
      parameter Real qd_max[:](each final min=Modelica_Constants.small) = {1}
        "Maximum velocities der(q)";
      parameter Real qdd_max[:](each final min=Modelica_Constants.small) = {1}
        "Maximum accelerations der(qd)";
      parameter SIunits.Time startTime=0
        "Time instant at which movement starts";

      extends Modelica_Blocks_Interfaces.MO(
                            final nout=max([size(deltaq, 1); size(qd_max, 1);
            size(qdd_max, 1)]));

    protected
      parameter Real p_deltaq[nout]=(if size(deltaq, 1) == 1 then ones(nout)*
          deltaq[1] else deltaq);
      parameter Real p_qd_max[nout]=(if size(qd_max, 1) == 1 then ones(nout)*
          qd_max[1] else qd_max);
      parameter Real p_qdd_max[nout]=(if size(qdd_max, 1) == 1 then ones(nout)*
          qdd_max[1] else qdd_max);
      Real sd_max;
      Real sdd_max;
      Real sdd;
      Real aux1[nout];
      Real aux2[nout];
      SIunits.Time Ta1;
      SIunits.Time Ta2;
      SIunits.Time Tv;
      SIunits.Time Te;
      Boolean noWphase;

    equation
      for i in 1:nout loop
        aux1[i] = p_deltaq[i]/p_qd_max[i];
        aux2[i] = p_deltaq[i]/p_qdd_max[i];
      end for;
      sd_max = 1/max(abs(aux1));
      sdd_max = 1/max(abs(aux2));

      Ta1 = sqrt(1/sdd_max);
      Ta2 = sd_max/sdd_max;
      noWphase = Ta2 >= Ta1;
      Tv = if noWphase then Ta1 else 1/sd_max;
      Te = if noWphase then Ta1 + Ta1 else Tv + Ta2;

      // path-acceleration
      sdd = if time < startTime then 0 else ((if noWphase then (if time < Ta1 +
        startTime then sdd_max else (if time < Te + startTime then -sdd_max else
        0)) else (if time < Ta2 + startTime then sdd_max else (if time < Tv +
        startTime then 0 else (if time < Te + startTime then -sdd_max else 0)))));

      // acceleration
      y = p_deltaq*sdd;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,78},{-80,-82}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,88},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{82,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,0},{-70,0},{-70,70},{-30,70},{-30,0},{20,0},{20,-70},{
                  60,-70},{60,0},{68,0}},
              color={0,0,0},
              thickness=0.25),
            Text(
              extent={{2,80},{80,20}},
              lineColor={192,192,192},
              textString="acc"),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="deltaq=%deltaq")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,78},{-80,-72}}, color={95,95,95}),
            Polygon(
              points={{-80,91},{-86,71},{-75,71},{-80,91},{-80,91}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{82,0}}, color={95,95,95}),
            Polygon(
              points={{89,0},{68,5},{68,-5},{89,0}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,0},{-70,0},{-70,70},{-30,70},{-30,0},{20,0},{20,-70},{
                  60,-70},{60,0},{68,0}},
              color={0,0,255},
              thickness=0.5),
            Text(
              extent={{-73,95},{-16,80}},
              lineColor={0,0,0},
              textString="acceleration"),
            Text(
              extent={{66,20},{88,8}},
              lineColor={0,0,0},
              textString="time")}),
            Documentation(info="<HTML>
<p>
The goal is to move as <b>fast</b> as possible along a distance
<b>deltaq</b>
under given <b>kinematical constraints</b>. The distance can be a positional or
angular range. In robotics such a movement is called <b>PTP</b> (Point-To-Point).
This source block generates the <b>acceleration</b> qdd of this signal
as output:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/KinematicPTP.png\"
     alt=\"KinematicPTP.png\">
</p>

<p>
After integrating the output two times, the position q is
obtained. The signal is constructed in such a way that it is not possible
to move faster, given the <b>maximally</b> allowed <b>velocity</b> qd_max and
the <b>maximally</b> allowed <b>acceleration</b> qdd_max.
</p>
<p>
If several distances are given (vector deltaq has more than 1 element),
an acceleration output vector is constructed such that all signals
are in the same periods in the acceleration, constant velocity
and deceleration phase. This means that only one of the signals
is at its limits whereas the others are synchronized in such a way
that the end point is reached at the same time instant.
</p>

<p>
This element is useful to generate a reference signal for a controller
which controls a drive train or in combination with model
Modelica.Mechanics.Rotational.<b>Accelerate</b> to drive
a flange according to a given acceleration.
</p>

</html>",   revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>June 27, 2001</i>
       by Bernhard Bachmann.<br>
       Bug fixed that element is also correct if startTime is not zero.</li>
<li><i>Nov. 3, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Vectorized and moved from Rotational to Blocks.Sources.</li>
<li><i>June 29, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       realized.</li>
</ul>
</html>"));
    end KinematicPTP;

    block KinematicPTP2
      "Move as fast as possible from start to end position within given kinematic constraints with output signals q, qd=der(q), qdd=der(qd)"

      parameter Real q_begin[:]={0} "Start position";
      parameter Real q_end[:]={1} "End position";
      parameter Real qd_max[:](each final min=Modelica_Constants.small) = {1}
        "Maximum velocities der(q)";
      parameter Real qdd_max[:](each final min=Modelica_Constants.small) = {1}
        "Maximum accelerations der(qd)";
      parameter SIunits.Time startTime=0
        "Time instant at which movement starts";

      extends Icons.Block;
      final parameter Integer nout=max([size(q_begin, 1); size(q_end, 1); size(
          qd_max, 1); size(qdd_max, 1)])
        "Number of output signals (= dimension of q, qd, qdd, moving)";
      output SIunits.Time endTime "Time instant at which movement stops";

      Modelica_Blocks_Interfaces.RealOutput q[nout]
        "Reference position of path planning" annotation (Placement(
            transformation(extent={{100,70},{120,90}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput qd[nout]
        "Reference speed of path planning" annotation (Placement(transformation(
              extent={{100,20},{120,40}}, rotation=0)));
      Modelica_Blocks_Interfaces.RealOutput qdd[nout]
        "Reference acceleration of path planning" annotation (Placement(
            transformation(extent={{100,-40},{120,-20}}, rotation=0)));
      Modelica_Blocks_Interfaces.BooleanOutput moving[nout]
        "= true, if end position not yet reached; = false, if end position reached or axis is completely at rest"
        annotation (Placement(transformation(extent={{100,-90},{120,-70}},
              rotation=0)));

    protected
      parameter Real p_q_begin[nout]=(if size(q_begin, 1) == 1 then ones(nout)*
          q_begin[1] else q_begin);
      parameter Real p_q_end[nout]=(if size(q_end, 1) == 1 then ones(nout)*q_end[
          1] else q_end);
      parameter Real p_qd_max[nout]=(if size(qd_max, 1) == 1 then ones(nout)*
          qd_max[1] else qd_max);
      parameter Real p_qdd_max[nout]=(if size(qdd_max, 1) == 1 then ones(nout)*
          qdd_max[1] else qdd_max);
      parameter Real p_deltaq[nout]=p_q_end - p_q_begin;
      constant Real eps=10*Modelica_Constants.eps;
      Boolean motion_ref;
      Real sd_max_inv;
      Real sdd_max_inv;
      Real sd_max;
      Real sdd_max;
      Real sdd;
      Real aux1[nout];
      Real aux2[nout];
      SIunits.Time Ta1;
      SIunits.Time Ta2;
      SIunits.Time Tv;
      SIunits.Time Te;
      Boolean noWphase;
      SIunits.Time Ta1s;
      SIunits.Time Ta2s;
      SIunits.Time Tvs;
      SIunits.Time Tes;
      Real sd_max2;
      Real s1;
      Real s2;
      Real s3;
      Real s;
      Real sd;

    equation
      for i in 1:nout loop
        aux1[i] = p_deltaq[i]/p_qd_max[i];
        aux2[i] = p_deltaq[i]/p_qdd_max[i];
      end for;

      sd_max_inv = max(abs(aux1));
      sdd_max_inv = max(abs(aux2));

      if sd_max_inv <= eps or sdd_max_inv <= eps then
        sd_max = 0;
        sdd_max = 0;
        Ta1 = 0;
        Ta2 = 0;
        noWphase = false;
        Tv = 0;
        Te = 0;
        Ta1s = 0;
        Ta2s = 0;
        Tvs = 0;
        Tes = 0;
        sd_max2 = 0;
        s1 = 0;
        s2 = 0;
        s3 = 0;
        s = 0;
      else
        sd_max = 1/max(abs(aux1));
        sdd_max = 1/max(abs(aux2));
        Ta1 = sqrt(1/sdd_max);
        Ta2 = sd_max/sdd_max;
        noWphase = Ta2 >= Ta1;
        Tv = if noWphase then Ta1 else 1/sd_max;
        Te = if noWphase then Ta1 + Ta1 else Tv + Ta2;
        Ta1s = Ta1 + startTime;
        Ta2s = Ta2 + startTime;
        Tvs = Tv + startTime;
        Tes = Te + startTime;
        sd_max2 = sdd_max*Ta1;
        s1 = sdd_max*(if noWphase then Ta1*Ta1 else Ta2*Ta2)/2;
        s2 = s1 + (if noWphase then sd_max2*(Te - Ta1) - (sdd_max/2)*(Te - Ta1)^2
           else sd_max*(Tv - Ta2));
        s3 = s2 + sd_max*(Te - Tv) - (sdd_max/2)*(Te - Tv)*(Te - Tv);

        if time < startTime then
          s = 0;
        elseif noWphase then
          if time < Ta1s then
            s = (sdd_max/2)*(time - startTime)*(time - startTime);
          elseif time < Tes then
            s = s1 + sd_max2*(time - Ta1s) - (sdd_max/2)*(time - Ta1s)*(time -
              Ta1s);
          else
            s = s2;
          end if;
        elseif time < Ta2s then
          s = (sdd_max/2)*(time - startTime)*(time - startTime);
        elseif time < Tvs then
          s = s1 + sd_max*(time - Ta2s);
        elseif time < Tes then
          s = s2 + sd_max*(time - Tvs) - (sdd_max/2)*(time - Tvs)*(time - Tvs);
        else
          s = s3;
        end if;

      end if;

      sd = der(s);
      sdd = der(sd);

      qdd = p_deltaq*sdd;
      qd = p_deltaq*sd;
      q = p_q_begin + p_deltaq*s;
      endTime = Tes;

      // report when axis is moving
      motion_ref = time <= endTime;
      for i in 1:nout loop
        moving[i] = if abs(q_begin[i] - q_end[i]) > eps then motion_ref else
          false;
      end for;

      annotation (
        defaultComponentName="kinematicPTP",
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,78},{-80,-82}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,88},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{17,0}}, color={192,192,192}),
            Line(
              points={{-80,0},{-70,0},{-70,70},{-50,70},{-50,0},{-15,0},{-15,-70},
                  {5,-70},{5,0},{18,0}},
              color={0,0,0},
              thickness=0.25),
            Text(
              extent={{34,96},{94,66}},
              lineColor={0,0,0},
              textString="q"),
            Text(
              extent={{40,44},{96,14}},
              lineColor={0,0,0},
              textString="qd"),
            Text(
              extent={{32,-18},{99,-44}},
              lineColor={0,0,0},
              textString="qdd"),
            Text(
              extent={{-32,-74},{97,-96}},
              lineColor={0,0,0},
              textString="moving")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,78},{-80,-70}}, color={95,95,95}),
            Polygon(
              points={{-80,94},{-86,74},{-74,74},{-80,94},{-80,94}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{82,0}}, color={95,95,95}),
            Polygon(
              points={{90,0},{68,6},{68,-6},{90,0}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,0},{-70,0},{-70,70},{-30,70},{-30,0},{20,0},{20,-70},{
                  60,-70},{60,0},{68,0}},
              color={0,0,255},
              thickness=0.5),
            Text(
              extent={{-72,96},{-15,81}},
              lineColor={0,0,0},
              textString="acceleration"),
            Text(
              extent={{69,18},{91,6}},
              lineColor={0,0,0},
              textString="time")}),
        Documentation(info="<html>
<p>
The goal is to move as <b>fast</b> as possible from start position <b>q_begin</b>
to end position <b>q_end</b>
under given <b>kinematical constraints</b>. The positions can be translational or
rotational definitions (i.e., q_begin/q_end is given). In robotics such a movement is called <b>PTP</b> (Point-To-Point).
This source block generates the <b>position</b> q(t), the
<b>speed</b> qd(t) = der(q), and the <b>acceleration</b> qdd = der(qd)
as output. The signals are constructed in such a way that it is not possible
to move faster, given the <b>maximally</b> allowed <b>velocity</b> qd_max and
the <b>maximally</b> allowed <b>acceleration</b> qdd_max:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/KinematicPTP2.png\"
     alt=\"KinematicPTP2.png\">
</p>

<p>
If vectors q_begin/q_end have more than 1 element,
the output vectors are constructed such that all signals
are in the same periods in the acceleration, constant velocity
and deceleration phase. This means that only one of the signals
is at its limits whereas the others are synchronized in such a way
that the end point is reached at the same time instant.
</p>

<p>
This element is useful to generate a reference signal for a controller
which controls, e.g., a drive train, or to drive
a flange according to a given acceleration.
</p>

</html>",   revisions="<html>
<ul>
<li><i>March 24, 2007</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Non-standard Modelica function \"constrain(..)\" replaced by standard
       Modelica implementation (via internal function position()).<br>
       New output signal \"moving\" added.</li>
<li><i>June 27, 2001</i>
       by Bernhard Bachmann.<br>
       Bug fixed that element is also correct if startTime is not zero.</li>
<li><i>Nov. 3, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Vectorized and moved from Rotational to Blocks.Sources.</li>
<li><i>June 29, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       realized.</li>
</ul>
</html>"));
    end KinematicPTP2;

    block TimeTable
      "Generate a (possibly discontinuous) signal by linear interpolation in a table"

      parameter Real table[:, 2] = fill(0.0, 0, 2)
        "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])";
      parameter Real offset=0 "Offset of output signal";
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
      parameter SIunits.Time timeScale(min=Modelica_Constants.eps)=1
        "Time scale of first table column" annotation (Evaluate=true);
      extends Modelica_Blocks_Interfaces.SO;
    protected
      Real a "Interpolation coefficients a of actual interval (y=a*x+b)";
      Real b "Interpolation coefficients b of actual interval (y=a*x+b)";
      Integer last(start=1) "Last used lower grid index";
      discrete SIunits.Time nextEvent(start=0, fixed=true) "Next event instant";
      discrete Real nextEventScaled(start=0, fixed=true)
        "Next scaled event instant";
      Real timeScaled "Scaled time";

      function getInterpolationCoefficients
        "Determine interpolation coefficients and next time event"
        extends Modelica_Icons.Function;
        input Real table[:, 2] "Table for interpolation";
        input Real offset "y-offset";
        input Real startTimeScaled "Scaled time-offset";
        input Real timeScaled "Actual scaled time instant";
        input Integer last "Last used lower grid index";
        input Real TimeEps
          "Relative epsilon to check for identical time instants";
        output Real a "Interpolation coefficients a (y=a*x + b)";
        output Real b "Interpolation coefficients b (y=a*x + b)";
        output Real nextEventScaled "Next scaled event instant";
        output Integer next "New lower grid index";
      protected
        Integer columns=2 "Column to be interpolated";
        Integer ncol=2 "Number of columns to be interpolated";
        Integer nrow=size(table, 1) "Number of table rows";
        Integer next0;
        Real tp;
        Real dt;
      algorithm
        next := last;
        nextEventScaled := timeScaled - TimeEps*abs(timeScaled);
        // in case there are no more time events
        tp := timeScaled + TimeEps*abs(timeScaled) - startTimeScaled;

        if tp < 0.0 then
          // First event not yet reached
          nextEventScaled := startTimeScaled;
          a := 0;
          b := offset;
        elseif nrow < 2 then
          // Special action if table has only one row
          a := 0;
          b := offset + table[1, columns];
        else

          // Find next time event instant. Note, that two consecutive time instants
          // in the table may be identical due to a discontinuous point.
          while next < nrow and tp >= table[next, 1] loop
            next := next + 1;
          end while;

          // Define next time event, if last table entry not reached
          if next < nrow then
            nextEventScaled := startTimeScaled + table[next, 1];
          end if;

          // Determine interpolation coefficients
          next0 := next - 1;
          dt := table[next, 1] - table[next0, 1];
          if dt <= TimeEps*abs(table[next, 1]) then
            // Interpolation interval is not big enough, use "next" value
            a := 0;
            b := offset + table[next, columns];
          else
            a := (table[next, columns] - table[next0, columns])/dt;
            b := offset + table[next0, columns] - a*table[next0, 1];
          end if;
        end if;
        // Take into account startTimeScaled "a*(time - startTime) + b"
        b := b - a*startTimeScaled;
      end getInterpolationCoefficients;
    algorithm
      timeScaled := time/timeScale;
      when {timeScaled >= pre(nextEventScaled),initial()} then
        (a,b,nextEventScaled,last) := getInterpolationCoefficients(
            table,
            offset,
            startTime/timeScale,
            timeScaled,
            last,
            100*Modelica_Constants.eps);
        nextEvent := nextEventScaled*timeScale;
      end when;
    equation
      y = a*timeScaled + b;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-48,70},{2,-50}},
              lineColor={255,255,255},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-48,-50},{-48,70},{52,70},{52,-50},{-48,-50},{-48,-20},
                  {52,-20},{52,10},{-48,10},{-48,40},{52,40},{52,70},{2,70},{2,-51}},
                color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="offset=%offset")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Polygon(
              points={{-80,90},{-85,68},{-74,68},{-80,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
            Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
            Polygon(
              points={{88,-70},{68,-65},{68,-74},{88,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-20,90},{30,-30}},
              lineColor={255,255,255},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{
                  80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{30,90},{30,-31}},
                color={0,0,0}),
            Text(
              extent={{-70,-42},{-32,-54}},
              lineColor={0,0,0},
              textString="offset"),
            Polygon(
              points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-31,-70},{-34,-60},{-29,-60},{-31,-70},{-31,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-31,-32},{-31,-70}}, color={95,95,95}),
            Line(points={{-20,-30},{-20,-70}}, color={95,95,95}),
            Text(
              extent={{-38,-73},{8,-83}},
              lineColor={0,0,0},
              textString="startTime"),
            Line(points={{-20,-30},{-80,-30}}, color={95,95,95}),
            Text(
              extent={{-76,93},{-44,75}},
              lineColor={0,0,0},
              textString="y"),
            Text(
              extent={{66,-78},{90,-88}},
              lineColor={0,0,0},
              textString="time"),
            Text(
              extent={{-15,83},{24,68}},
              lineColor={0,0,0},
              textString="time"),
            Text(
              extent={{33,83},{76,67}},
              lineColor={0,0,0},
              textString="y")}),
            Documentation(info="<HTML>
<p>
This block generates an output signal by <b>linear interpolation</b> in
a table. The time points and function values are stored in a matrix
<strong><code>table[i,j]</code></strong>, where the first column table[:,1] contains the
time points and the second column contains the data to be interpolated.
The table interpolation has the following properties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    <b>extrapolation</b> through the last or first two points of the
    table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the function value is just returned independently of the
    actual time instant.</li>
<li>Via parameters <strong><code>startTime</code></strong> and <strong><code>offset</code></strong> the curve defined
    by the table can be shifted both in time and in the ordinate value.</li>
<li>The first point in time <strong>always</strong> has to be set to <strong><code>0</code></strong>, e.g.,
    <strong><code>table=[1,1;2,2]</code></strong> is <strong>illegal</strong>. If you want to
    shift the time table in time use the  <strong><code>startTime</code></strong> parameter instead.</li>
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries.
    This generates continuously differentiable values for the integrator.</li>
<li>Via parameter <b>timeScale</b> the first column of the table array can
    be scaled, e.g. if the table array is given in hours (instead of seconds)
    <b>timeScale</b> shall be set to 3600.</li>
</ul>
<p>
Example:
</p>
<pre>
   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the output y =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the output y =  2.5,
    e.g., time = 2.0, the output y =  4.0,
    e.g., time = 5.0, the output y = 23.0 (i.e., extrapolation).
</pre>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/TimeTable.png\"
     alt=\"TimeTable.png\">
</p>

</html>",   revisions="<html>
<h4>Release Notes</h4>
<ul>
<li><i>Oct. 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Corrected interface from
<pre>
    parameter Real table[:, :]=[0, 0; 1, 1; 2, 4];
</pre>
       to
<pre>
    parameter Real table[:, <b>2</b>]=[0, 0; 1, 1; 2, 4];
</pre>
       </li>
<li><i>Nov. 7, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>
</html>"));
    end TimeTable;

    block CombiTimeTable
      "Table look-up with respect to time and linear/periodic extrapolation methods (data from matrix/file)"
      extends Modelica_Blocks_Interfaces.MO(final nout=max([size(columns, 1);
            size(offset, 1)]));
      parameter Boolean tableOnFile=false
        "= true, if table is defined on file or in function usertab"
        annotation (Dialog(group="Table data definition"));
      parameter Real table[:, :] = fill(0.0, 0, 2)
        "Table matrix (time = first column; e.g., table=[0,2])"
        annotation (Dialog(group="Table data definition",enable=not tableOnFile));
      parameter String tableName="NoName"
        "Table name on file or in function usertab (see docu)"
        annotation (Dialog(group="Table data definition",enable=tableOnFile));
      parameter String fileName="NoName" "File where matrix is stored"
        annotation (Dialog(
          group="Table data definition",
          enable=tableOnFile,
          loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
              caption="Open file in which table is present")));
      parameter Boolean verboseRead=true
        "= true, if info message that file is loading is to be printed"
        annotation (Dialog(group="Table data definition",enable=tableOnFile));
      parameter Integer columns[:]=2:size(table, 2)
        "Columns of table to be interpolated"
        annotation (Dialog(group="Table data interpretation"));
      parameter Types.Smoothness smoothness=Types.Smoothness.LinearSegments
        "Smoothness of table interpolation"
        annotation (Dialog(group="Table data interpretation"));
      parameter Types.Extrapolation extrapolation=Types.Extrapolation.LastTwoPoints
        "Extrapolation of data outside the definition range"
        annotation (Dialog(group="Table data interpretation"));
      parameter Real offset[:]={0} "Offsets of output signals"
        annotation (Dialog(group="Table data interpretation"));
      parameter SIunits.Time startTime=0 "Output = offset for time < startTime"
        annotation (Dialog(group="Table data interpretation"));
      parameter SIunits.Time timeScale(min=Modelica_Constants.eps)=1
        "Time scale of first table column"
        annotation (Dialog(group="Table data interpretation"), Evaluate=true);
      final parameter SIunits.Time t_min(fixed=false)
        "Minimum abscissa value defined in table";
      final parameter SIunits.Time t_max(fixed=false)
        "Maximum abscissa value defined in table";
      final parameter Real t_minScaled(fixed=false)
        "Minimum (scaled) abscissa value defined in table";
      final parameter Real t_maxScaled(fixed=false)
        "Maximum (scaled) abscissa value defined in table";
    protected
      final parameter Real p_offset[nout]=(if size(offset, 1) == 1 then ones(nout)*offset[1] else offset)
        "Offsets of output signals";
      Types.ExternalCombiTimeTable tableID=Types.ExternalCombiTimeTable(
              if tableOnFile then tableName else "NoName",
              if tableOnFile and fileName <> "NoName" and not
            Modelica_Utilities.Strings.isEmpty(fileName) then fileName else
            "NoName",
              table,
              startTime/timeScale,
              columns,
              smoothness,
              extrapolation) "External table object";
      discrete SIunits.Time nextTimeEvent(start=0, fixed=true)
        "Next time event instant";
      discrete Real nextTimeEventScaled(start=0, fixed=true)
        "Next scaled time event instant";
      parameter Real tableOnFileRead(fixed=false)
        "= 1, if table was successfully read from file";
      constant Real DBL_MAX = 1.7976931348623158e+308;
      Real timeScaled "Scaled time";

      function readTableData
        "Read table data from ASCII text or MATLAB MAT-file"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTimeTable tableID;
        input Boolean forceRead = false
          "= true: Force reading of table data; = false: Only read, if not yet read.";
        output Real readSuccess "Table read success";
        input Boolean verboseRead
          "= true: Print info message; = false: No info message";
        external"C" readSuccess = ModelicaStandardTables_CombiTimeTable_read(tableID, forceRead, verboseRead)
          annotation (Library={"ModelicaStandardTables"});
      end readTableData;

      function getTableValue
        "Interpolate 1-dim. table where first column is time"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTimeTable tableID;
        input Integer icol;
        input SIunits.Time timeIn;
        discrete input SIunits.Time nextTimeEvent;
        discrete input SIunits.Time pre_nextTimeEvent;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output Real y;
        external"C" y = ModelicaStandardTables_CombiTimeTable_getValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent)
          annotation (Library={"ModelicaStandardTables"});
        annotation (derivative(
            noDerivative=nextTimeEvent,
            noDerivative=pre_nextTimeEvent,
            noDerivative=tableAvailable) = getDerTableValue);
      end getTableValue;

      function getTableValueNoDer
        "Interpolate 1-dim. table where first column is time (but do not provide a derivative function)"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTimeTable tableID;
        input Integer icol;
        input SIunits.Time timeIn;
        discrete input SIunits.Time nextTimeEvent;
        discrete input SIunits.Time pre_nextTimeEvent;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output Real y;
        external"C" y = ModelicaStandardTables_CombiTimeTable_getValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent)
          annotation (Library={"ModelicaStandardTables"});
      end getTableValueNoDer;

      function getDerTableValue
        "Derivative of interpolated 1-dim. table where first column is time"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTimeTable tableID;
        input Integer icol;
        input SIunits.Time timeIn;
        discrete input SIunits.Time nextTimeEvent;
        discrete input SIunits.Time pre_nextTimeEvent;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        input Real der_timeIn;
        output Real der_y;
        external"C" der_y = ModelicaStandardTables_CombiTimeTable_getDerValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent, der_timeIn)
          annotation (Library={"ModelicaStandardTables"});
      end getDerTableValue;

      function getTableTimeTmin
        "Return minimum time value of 1-dim. table where first column is time"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTimeTable tableID;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output SIunits.Time timeMin "Minimum time value in table";
        external"C" timeMin = ModelicaStandardTables_CombiTimeTable_minimumTime(tableID)
          annotation (Library={"ModelicaStandardTables"});
      end getTableTimeTmin;

      function getTableTimeTmax
        "Return maximum time value of 1-dim. table where first column is time"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTimeTable tableID;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output SIunits.Time timeMax "Maximum time value in table";
        external"C" timeMax = ModelicaStandardTables_CombiTimeTable_maximumTime(tableID)
          annotation (Library={"ModelicaStandardTables"});
      end getTableTimeTmax;

      function getNextTimeEvent
        "Return next time event value of 1-dim. table where first column is time"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTimeTable tableID;
        input SIunits.Time timeIn;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output SIunits.Time nextTimeEvent "Next time event in table";
        external"C" nextTimeEvent = ModelicaStandardTables_CombiTimeTable_nextTimeEvent(tableID, timeIn)
          annotation (Library={"ModelicaStandardTables"});
      end getNextTimeEvent;

    initial algorithm
      if tableOnFile then
        tableOnFileRead := readTableData(tableID, false, verboseRead);
      else
        tableOnFileRead := 1.;
      end if;
      t_minScaled := getTableTimeTmin(tableID, tableOnFileRead);
      t_maxScaled := getTableTimeTmax(tableID, tableOnFileRead);
      t_min := t_minScaled*timeScale;
      t_max := t_maxScaled*timeScale;
    equation
      if tableOnFile then
        assert(tableName <> "NoName",
          "tableOnFile = true and no table name given");
      else
        assert(size(table, 1) > 0 and size(table, 2) > 0,
          "tableOnFile = false and parameter table is an empty matrix");
      end if;
      timeScaled = time/timeScale;
      when {timeScaled >= pre(nextTimeEventScaled),initial()} then
        nextTimeEventScaled = getNextTimeEvent(tableID, timeScaled, tableOnFileRead);
        if (nextTimeEventScaled < DBL_MAX) then
          nextTimeEvent = nextTimeEventScaled*timeScale;
        else
          nextTimeEvent = DBL_MAX;
        end if;
      end when;
      if smoothness == Modelica_Blocks.Types.Smoothness.ConstantSegments then
        for i in 1:nout loop
          y[i] = p_offset[i] + getTableValueNoDer(tableID, i, timeScaled, nextTimeEventScaled, pre(nextTimeEventScaled), tableOnFileRead);
        end for;
      else
        for i in 1:nout loop
          y[i] = p_offset[i] + getTableValue(tableID, i, timeScaled, nextTimeEventScaled, pre(nextTimeEventScaled), tableOnFileRead);
        end for;
      end if;
      annotation (
        Documentation(info="<HTML>
<p>
This block generates an output signal y[:] by <b>linear interpolation</b> in
a table. The time points and function values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the other columns contain the data to be interpolated.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/CombiTimeTable.png\"
     alt=\"CombiTimeTable.png\">
</p>

<p>
Via parameter <b>columns</b> it can be defined which columns of the
table are interpolated. If, e.g., columns={2,4}, it is assumed that
2 output signals are present and that the first output is computed
by interpolation of column 2 and the second output is computed
by interpolation of column 4 of the table matrix.
The table interpolation has the following properties:
</p>
<ul>
<li>The time points need to be <b>strictly increasing</b> if smoothness
    is ContinuousDerivative, otherwise <b>monotonically increasing</b>.</li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    extrapolation according to the setting of parameter
    <b>extrapolation</b>:
<pre>
  extrapolation = 1: hold the first or last value of the table,
                     if outside of the table scope.
                = 2: extrapolate by using the derivative at the first/last table
                     points if outside of the table scope.
                     (If smoothness is LinearSegments or ConstantSegments
                     this means to extrapolate linearly through the first/last
                     two table points.).
                = 3: periodically repeat the table data
                     (periodical function).
                = 4: no extrapolation, i.e. extrapolation triggers an error
</pre></li>
<li>Via parameter <b>smoothness</b> it is defined how the data is interpolated:
<pre>
  smoothness = 1: linear interpolation
             = 2: smooth interpolation with Akima-splines such
                  that der(y) is continuous, also if extrapolated.
             = 3: constant segments
</pre></li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the table values of this row are just returned.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the ordinate value.
    The time instants stored in the table are therefore <b>relative</b>
    to <b>startTime</b>.
    If time &lt; startTime, no interpolation is performed and the offset
    is used as ordinate value for all outputs.</li>
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries.
    This generates continuously differentiable values for the integrator.</li>
<li>Via parameter <b>timeScale</b> the first column of the table array can
    be scaled, e.g. if the table array is given in hours (instead of seconds)
    <b>timeScale</b> shall be set to 3600.</li>
<li>For special applications it is sometimes needed to know the minimum
    and maximum time instant defined in the table as a parameter. For this
    reason parameters <b>t_min</b>/<b>t_minScaled</b> and
    <b>t_max</b>/<b>t_maxScaled</b> are provided and can be
    accessed from the outside of the table object. Whereas <b>t_min</b> and
    <b>t_max</b> define the scaled abscissa values (using parameter
    <b>timeScale</b>) in SIunits.Time, <b>t_minScaled</b> and
    <b>t_maxScaled</b> define the unitless original abscissa values of
    the table.</li>
</ul>
<p>
Example:
</p>
<pre>
   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]; extrapolation = 3 (default)
If, e.g., time = 1.0, the output y =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the output y =  2.5,
    e.g., time = 2.0, the output y =  4.0,
    e.g., time = 5.0, the output y = 23.0 (i.e., extrapolation via last 2 points).
</pre>
<p>
The table matrix can be defined in the following ways:
</p>
<ol>
<li> Explicitly supplied as <b>parameter matrix</b> \"table\",
     and the other parameters have the following values:
<pre>
   tableName is \"NoName\" or has only blanks,
   fileName  is \"NoName\" or has only blanks.
</pre></li>
<li> <b>Read</b> from a <b>file</b> \"fileName\" where the matrix is stored as
      \"tableName\". Both ASCII and MAT-file format is possible.
      (The ASCII format is described below).
      The MAT-file format comes in four different versions: v4, v6, v7 and v7.3.
      The library supports at least v4, v6 and v7 whereas v7.3 is optional.
      It is most convenient to generate the MAT-file from FreeMat or MATLAB&reg;
      by command
<pre>
   save tables.mat tab1 tab2 tab3
</pre>
      or Scilab by command
<pre>
   savematfile tables.mat tab1 tab2 tab3
</pre>
      when the three tables tab1, tab2, tab3 should be used from the model.<br>
      Note, a fileName can be defined as URI by using the helper function
      <a href=\"modelica://Modelica.Utilities.Files.loadResource\">loadResource</a>.</li>
<li>  Statically stored in function \"usertab\" in file \"usertab.c\".
      The matrix is identified by \"tableName\". Parameter
      fileName = \"NoName\" or has only blanks. Row-wise storage is always to be
      preferred as otherwise the table is reallocated and transposed.</li>
</ol>
<p>
When the constant \"NO_FILE_SYSTEM\" is defined, all file I/O related parts of the
source code are removed by the C-preprocessor, such that no access to files takes place.
</p>
<p>
If tables are read from an ASCII-file, the file needs to have the
following structure (\"-----\" is not part of the file content):
</p>
<pre>
-----------------------------------------------------
#1
double tab1(6,2)   # comment line
  0   0
  1   0
  1   1
  2   4
  3   9
  4  16
double tab2(6,2)   # another comment line
  0   0
  2   0
  2   2
  4   8
  6  18
  8  32
-----------------------------------------------------
</pre>
<p>
Note, that the first two characters in the file need to be
\"#1\" (a line comment defining the version number of the file format).
Afterwards, the corresponding matrix has to be declared
with type (= \"double\" or \"float\"), name and actual dimensions.
Finally, in successive rows of the file, the elements of the matrix
have to be given. The elements have to be provided as a sequence of
numbers in row-wise order (therefore a matrix row can span several
lines in the file and need not start at the beginning of a line).
Numbers have to be given according to C syntax (such as 2.3, -2, +2.e4).
Number separators are spaces, tab (\t), comma (,), or semicolon (;).
Several matrices may be defined one after another. Line comments start
with the hash symbol (#) and can appear everywhere.
Other characters, like trailing non comments, are not allowed in the file.
</p>
<p>
MATLAB is a registered trademark of The MathWorks, Inc.
</p>
</html>",   revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>April 09, 2013</i>
       by Thomas Beutlich:<br>
       Implemented as external object.</li>
<li><i>March 31, 2001</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Used CombiTableTime as a basis and added the
       arguments <b>extrapolation, columns, startTime</b>.
       This allows periodic function definitions.</li>
</ul>
</html>"),
        Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Polygon(visible=true,
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
        Line(visible=true,
          points={{-80.0,68.0},{-80.0,-80.0}},
          color={192,192,192}),
        Line(visible=true,
          points={{-90.0,-70.0},{82.0,-70.0}},
          color={192,192,192}),
        Polygon(visible=true,
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{90.0,-70.0},{68.0,-62.0},{68.0,-78.0},{90.0,-70.0}}),
        Rectangle(visible=true,
          lineColor={255,255,255},
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-48.0,-50.0},{2.0,70.0}}),
        Line(visible=true,
          points={{-48.0,-50.0},{-48.0,70.0},{52.0,70.0},{52.0,-50.0},{-48.0,-50.0},{-48.0,-20.0},{52.0,-20.0},{52.0,10.0},{-48.0,10.0},{-48.0,40.0},{52.0,40.0},{52.0,70.0},{2.0,70.0},{2.0,-51.0}})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
            Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-20,90},{20,-30}},
              lineColor={255,255,255},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{
                  80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{20,90},{20,-30}},
                color={0,0,0}),
            Text(
              extent={{-71,-42},{-32,-54}},
              lineColor={0,0,0},
              textString="offset"),
            Polygon(
              points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-31,-70},{-34,-60},{-29,-60},{-31,-70},{-31,-70}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(points={{-31,-31},{-31,-70}}, color={95,95,95}),
            Line(points={{-20,-30},{-20,-70}}, color={95,95,95}),
            Text(
              extent={{-42,-74},{6,-84}},
              lineColor={0,0,0},
              textString="startTime"),
            Line(points={{-20,-30},{-80,-30}}, color={95,95,95}),
            Text(
              extent={{-73,93},{-44,74}},
              lineColor={0,0,0},
              textString="y"),
            Text(
              extent={{66,-81},{92,-92}},
              lineColor={0,0,0},
              textString="time"),
            Text(
              extent={{-19,83},{20,68}},
              lineColor={0,0,0},
              textString="time"),
            Text(
              extent={{21,82},{50,68}},
              lineColor={0,0,0},
              textString="y[1]"),
            Line(points={{50,90},{50,-30}}, color={0,0,0}),
            Line(points={{80,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{34,-30},{71,-42}},
              textString="columns",
              lineColor={0,0,255}),
            Text(
              extent={{51,82},{80,68}},
              lineColor={0,0,0},
              textString="y[2]")}));
    end CombiTimeTable;

    block BooleanConstant "Generate constant signal of type Boolean"
      parameter Boolean k=true "Constant output value";
      extends Modelica_Blocks_Interfaces.partialBooleanSource;

    equation
      y = k;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}),
              Text(
              extent={{-150,-140},{150,-110}},
              lineColor={0,0,0},
              textString="%k")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(
              points={{-70,0},{80,0}},
              color={0,0,255},
              thickness=0.5),
            Text(
              extent={{-69,20},{-49,0}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-96,6},{-76,-4}},
              lineColor={0,0,0},
              textString="true"),
            Text(
              extent={{-98,-58},{-72,-68}},
              lineColor={0,0,0},
              textString="false")}),
          Documentation(info="<html>
<p>
The Boolean output y is a constant signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/BooleanConstant.png\"
     alt=\"BooleanConstant.png\">
</p>
</html>"));
    end BooleanConstant;

    block BooleanStep "Generate step signal of type Boolean"
      parameter SIunits.Time startTime=0 "Time instant of step start";
      parameter Boolean startValue=false "Output before startTime";

      extends Modelica_Blocks_Interfaces.partialBooleanSource;
    equation
      y = if time >= startTime then not startValue else startValue;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(
              visible=not startValue,
              points={{-80,-70},{0,-70},{0,50},{80,50}},
              color={0,0,0}),
            Line(
              visible=startValue,
              points={{-80,50},{0,50},{0,-70},{68,-70}},
              color={0,0,0}),
            Text(
              extent={{-150,-140},{150,-110}},
              lineColor={0,0,0},
              textString="%startTime")}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Line(
                points={{-80,-70},{0,-70},{0,50},{80,50}},
                color={0,0,255},
                thickness=0.5),Text(
                extent={{-15,-74},{20,-82}},
                lineColor={0,0,0},
                textString="startTime"),Polygon(
                points={{2,50},{-80,50},{2,50}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Text(
                extent={{-66,62},{-22,48}},
                lineColor={0,0,0},
                textString="not startValue"),Text(
                extent={{-68,-58},{-36,-72}},
                lineColor={0,0,0},
                textString="startValue")}),
        Documentation(info="<html>
<p>
The Boolean output y is a step signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/BooleanStep.png\"
     alt=\"BooleanStep.png\">
</p>
</html>"));
    end BooleanStep;

    block BooleanPulse "Generate pulse signal of type Boolean"

      parameter Real width(
        final min=Modelica_Constants.small,
        final max=100) = 50 "Width of pulse in % of period";
      parameter SIunits.Time period(final min=Modelica_Constants.small, start=1)
        "Time for one period";
      parameter SIunits.Time startTime=0 "Time instant of first pulse";
      extends Modelica_Blocks_Interfaces.partialBooleanSource;

    protected
      parameter SIunits.Time Twidth=period*width/100 "width of one pulse"
        annotation (HideResult=true);
      discrete SIunits.Time pulsStart "Start time of pulse"
        annotation (HideResult=true);
    initial equation
      pulsStart = startTime;
    equation
      when sample(startTime, period) then
        pulsStart = time;
      end when;
      y = time >= pulsStart and time < pulsStart + Twidth;
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Text(
              extent={{-150,-140},{150,-110}},
              lineColor={0,0,0},
              textString="%period"), Line(points={{-80,-70},{-40,-70},{-40,44},{0,
                  44},{0,-70},{40,-70},{40,44},{79,44}}, color={0,0,0})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-60,-74},{-19,-82}},
              lineColor={0,0,0},
              textString="startTime"),
            Line(
              points={{-78,-70},{-40,-70},{-40,20},{20,20},{20,-70},{50,-70},{50,
                  20},{100,20}},
              color={0,0,255},
              thickness=0.5),
            Line(points={{-40,61},{-40,21}}, color={95,95,95}),
            Line(points={{20,44},{20,20}}, color={95,95,95}),
            Line(points={{50,58},{50,20}}, color={95,95,95}),
            Line(points={{-40,53},{50,53}}, color={95,95,95}),
            Line(points={{-40,35},{20,35}}, color={95,95,95}),
            Text(
              extent={{-30,65},{16,55}},
              lineColor={0,0,0},
              textString="period"),
            Text(
              extent={{-33,47},{14,37}},
              lineColor={0,0,0},
              textString="width"),
            Line(points={{-70,20},{-41,20}}, color={95,95,95}),
            Polygon(
              points={{-40,35},{-31,37},{-31,33},{-40,35}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{20,35},{12,37},{12,33},{20,35}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,53},{-31,55},{-31,51},{-40,53}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{50,53},{42,55},{42,51},{50,53}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-95,26},{-66,17}},
              lineColor={0,0,0},
              textString="true"),
            Text(
              extent={{-96,-60},{-75,-69}},
              lineColor={0,0,0},
              textString="false")}),
          Documentation(info="<html>
<p>
The Boolean output y is a pulse signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Pulse.png\"
     alt=\"Pulse.png\">
</p>
</html>"));
    end BooleanPulse;

    block SampleTrigger "Generate sample trigger signal"
      parameter SIunits.Time period(final min=Modelica_Constants.small, start=
            0.01) "Sample period";
      parameter SIunits.Time startTime=0 "Time instant of first sample trigger";
      extends Modelica_Blocks_Interfaces.partialBooleanSource;

    equation
      y = sample(startTime, period);
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-60,-70},{-60,70}}, color={0,0,0}),
            Line(points={{-20,-70},{-20,70}}, color={0,0,0}),
            Line(points={{20,-70},{20,70}}, color={0,0,0}),
            Line(points={{60,-70},{60,70}}, color={0,0,0}),
            Text(
              extent={{-150,-140},{150,-110}},
              lineColor={0,0,0},
              textString="%period")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-51,-72},{-11,-81}},
              lineColor={0,0,0},
              textString="startTime"),
            Line(points={{-30,47},{-30,19}}, color={95,95,95}),
            Line(points={{0,47},{0,18}}, color={95,95,95}),
            Line(points={{-30,41},{0,41}}, color={95,95,95}),
            Text(
              extent={{-37,61},{9,49}},
              lineColor={0,0,0},
              textString="period"),
            Line(points={{-73,19},{-30,19}}, color={95,95,95}),
            Polygon(
              points={{-30,41},{-21,43},{-21,39},{-30,41}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{0,41},{-8,43},{-8,39},{0,41}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-91,23},{-71,13}},
              lineColor={0,0,0},
              textString="true"),
            Text(
              extent={{-90,-59},{-70,-68}},
              lineColor={0,0,0},
              textString="false"),
            Line(
              points={{0,-70},{0,19}},
              color={0,0,255},
              thickness=0.5),
            Line(
              points={{-30,-70},{-30,19}},
              color={0,0,255},
              thickness=0.5),
            Line(
              points={{30,-70},{30,19}},
              color={0,0,255},
              thickness=0.5),
            Line(
              points={{60,-70},{60,19}},
              color={0,0,255},
              thickness=0.5)}),
          Documentation(info="<html>
<p>
The Boolean output y is a trigger signal where the output y is only <b>true</b>
at sample times (defined by parameter <b>period</b>) and is otherwise
<b>false</b>.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/SampleTrigger.png\"
     alt=\"SampleTrigger.png\">
</p>
</html>"));
    end SampleTrigger;

    block BooleanTable
      "Generate a Boolean output signal based on a vector of time instants"

      parameter Boolean startValue=false
        "Start value of y. At time = table[1], y changes to 'not startValue'";
      parameter SIunits.Time table[:]={0,1}
        "Vector of time points. At every time point, the output y gets its opposite value (e.g., table={0,1})";
      extends Modelica_Blocks_Interfaces.partialBooleanSource;

    protected
      function getFirstIndex "Get first index of table and check table"
        extends Modelica_Icons.Function;
        input Real table[:] "Vector of time instants";
        input SIunits.Time simulationStartTime "Simulation start time";
        input Boolean startValue "Value of y for y < table[1]";
        output Integer index "First index to be used";
        output SIunits.Time nextTime "Time instant of first event";
        output Boolean y "Value of y at simulationStartTime";
      protected
        SIunits.Time t_last;
        Integer j;
        Integer n=size(table, 1) "Number of table points";
      algorithm
        if size(table, 1) == 0 then
          index := 0;
          nextTime := -Modelica_Constants.inf;
          y := startValue;
        elseif size(table, 1) == 1 then
          index := 1;
          if table[1] > simulationStartTime then
            nextTime := table[1];
            y := startValue;
          else
            nextTime := simulationStartTime;
            y := startValue;
          end if;
        else

          // Check whether time values are strict monotonically increasing
          t_last := table[1];
          for i in 2:n loop
            assert(table[i] > t_last,
              "Time values of table not strict monotonically increasing: table["
               + String(i - 1) + "] = " + String(table[i - 1]) + "table[" +
              String(i) + "] = " + String(table[i]));
          end for;

          // Determine first index in table
          j := 1;
          y := startValue;
          while j < n and table[j] <= simulationStartTime loop
            y := not y;
            j := j + 1;
          end while;

          if j == 1 then
            nextTime := table[1];
            y := startValue;
          elseif j == n and table[n] <= simulationStartTime then
            nextTime := simulationStartTime - 1;
            y := not y;
          else
            nextTime := table[j];
          end if;

          index := j;
        end if;
      end getFirstIndex;

      parameter Integer n=size(table, 1) "Number of table points";
      SIunits.Time nextTime;
      Integer index "Index of actual table entry";
    initial algorithm
      (index,nextTime,y) := getFirstIndex(
          table,
          time,
          startValue);
    algorithm
      when time >= pre(nextTime) and n > 0 then
        if index < n then
          index := index + 1;
          nextTime := table[index];
          y := not y;
        elseif index == n then
          index := index + 1;
          y := not y;
        end if;
      end when;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-18,70},{32,-50}},
              lineColor={255,255,255},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid), Line(points={{-18,-50},{-18,70},{32,
                  70},{32,-50},{-18,-50},{-18,-20},{32,-20},{32,10},{-18,10},{-18,
                  40},{32,40},{32,70},{32,70},{32,-51}}, color={0,0,0})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}),graphics={Rectangle(
                extent={{-34,66},{16,-54}},
                lineColor={255,255,255},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-34,-54},{-34,66},{
              16,66},{16,-54},{-34,-54},{-34,-24},{16,-24},{16,6},{-34,6},{-34,36},
              {16,36},{16,66},{16,66},{16,-55}}, color={0,0,0}),Text(
                extent={{-29,59},{10,44}},
                lineColor={0,0,0},
                textString="time")}),
        Documentation(info="<html>
<p>
The Boolean output y is a signal defined by parameter vector <b>table</b>.
In the vector time points are stored. At every time point, the output y
changes its value to the negated value of the previous one.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/BooleanTable.png\"
     alt=\"BooleanTable.png\">
</p>
</html>"));
    end BooleanTable;

    block RadioButtonSource "Boolean signal source that mimics a radio button"

      parameter SIunits.Time buttonTimeTable[:]={0,1}
        "Time instants where button is pressed";
      input Boolean reset[:]={false}
        "Reset button to false, if an element of reset becomes true"
        annotation (Dialog(group="Time varying expressions"));

      Modelica_Blocks_Interfaces.BooleanOutput on(start=false, fixed=true)
        annotation (Placement(transformation(extent={{100,-15},{130,15}},
              rotation=0)));
    protected
      BooleanTable table(table=buttonTimeTable);
      parameter Integer nReset=size(reset, 1);
      Boolean pre_reset[nReset];
    initial equation
      pre(pre_reset) = fill(false, nReset);
      pre(reset) = fill(false, nReset);
    algorithm
      pre_reset := pre(reset);
      when pre_reset then
        on := false;
      end when;

      when change(table.y) then
        on := true;
      end when;

      annotation (Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              borderPattern=BorderPattern.Raised,
              fillColor=DynamicSelect({192,192,192}, if on > 0.5 then {0,255,0}
                   else {192,192,192}),
              fillPattern=DynamicSelect(FillPattern.Solid, if on > 0.5 then
                  FillPattern.Solid else FillPattern.Solid),
              lineColor={128,128,128},
              lineThickness=5.0), Text(
              extent={{-300,110},{300,175}},
              lineColor={0,0,255},
              textString="%name")}), Documentation(info="<html>
<p>
Boolean signal source that mimics a radio button:
Via a table, a radio button is pressed (i.e., the output 'on' is set to true) and is reset when an element of the Boolean vector
'reset' becomes true. If both appear at the same time instant, setting
the button according to the table has a higher priority as resetting
the button. Example:
</p>

<pre>
  RadioButtonSource start(buttonTimeTable={1,3}, reset={stop.on});
  RadioButtonSource stop (buttonTimeTable={2,4}, reset={start.on});
</pre>

<p>
The \"start\" button is pressed at time=1 s and time=3 s,
whereas the \"stop\" button is pressed at time=2 s and time=4 s.
This gives the following result:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/RadioButtonSource.png\"
     alt=\"RadioButtonSource.png\">
</blockquote>

<p>
This example is also available in
<a href=\"modelica://Modelica.Blocks.Examples.Interaction1\">Modelica.Blocks.Examples.Interaction1</a>
</p>

</html>"));
    end RadioButtonSource;

    block IntegerConstant "Generate constant signal of type Integer"
      parameter Integer k(start=1) "Constant output value";
      extends Modelica_Blocks_Interfaces.IntegerSO;

    equation
      y = k;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,0},{80,0}}, color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="k=%k")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,90},{-86,68},{-74,68},{-80,90}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={95,95,95}),Line(
                points={{-80,0},{80,0}},
                color={0,0,255},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
              Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Text(
                extent={{-81,92},{-38,74}},
                lineColor={0,0,0},
                textString="y"),Text(
                extent={{66,-82},{94,-94}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-101,8},{-81,-12}},
                lineColor={0,0,0},
                textString="k")}),
        Documentation(info="<html>
<p>
The Integer output y is a constant signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/IntegerConstant.png\"
     alt=\"IntegerConstant.png\">
</p>
</html>"));
    end IntegerConstant;

    block IntegerStep "Generate step signal of type Integer"
      parameter Integer height=1 "Height of step";
      extends Modelica_Blocks_Interfaces.IntegerSignalSource;
    equation
      y = offset + (if time < startTime then 0 else height);
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{0,-70},{0,50},{80,50}}, color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="startTime=%startTime")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
                points={{-80,88},{-86,68},{-74,68},{-80,88}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
              color={95,95,95}),Line(
                points={{-80,-18},{0,-18},{0,50},{80,50}},
                color={0,0,255},
                thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
              Polygon(
                points={{90,-70},{70,-66},{70,-74},{90,-70}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Text(
                extent={{66,-78},{92,-88}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{-21,-76},{26,-88}},
                lineColor={0,0,0},
                textString="startTime"),Line(points={{0,-17},{0,-71}}, color={95,
              95,95}),Text(
                extent={{-60,-36},{-12,-48}},
                lineColor={0,0,0},
                textString="offset"),Line(points={{-13,50},{-13,-17}}, color={95,
              95,95}),Polygon(
                points={{2,50},{-19,50},{2,50}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-13,50},{-16,37},{-9,37},{-13,50}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Text(
                extent={{-58,22},{-12,10}},
                lineColor={0,0,0},
                textString="height"),Polygon(
                points={{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(points={{-13,-18},{-13,-70}},
              color={95,95,95}),Polygon(
                points={{-13,-18},{-16,-31},{-9,-31},{-13,-18}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Text(
                extent={{-78,96},{-44,80}},
                lineColor={0,0,0},
                textString="y")}),
        Documentation(info="<html>
<p>
The Integer output y is a step signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/IntegerStep.png\"
     alt=\"IntegerStep.png\">
</p>
</html>"));
    end IntegerStep;

    block IntegerTable
      "Generate an Integer output signal based on a table matrix with [time, yi] values"

      parameter Real table[:, 2]=fill(
            0,
            0,
            2) "Table matrix (first column: time; second column: y)";

      extends Modelica_Blocks_Interfaces.IntegerSO;

    protected
      function getFirstIndex "Get first index of table and check table"
        extends Modelica_Icons.Function;
        input Real table[:, 2] "Table matrix";
        input SIunits.Time simulationStartTime "Simulation start time";
        output Integer index "First index to be used";
        output SIunits.Time nextTime "Time instant of first event";
        output Integer y "Value of y at simulationStartTime";
      protected
        SIunits.Time t_last;
        Integer j;
        Integer n=size(table, 1) "Number of table points";
      algorithm
        if size(table, 1) == 0 then
          index := 0;
          nextTime := simulationStartTime - 1;
          y := 0;
        else
          // Check whether time values are strict monotonically increasing
          t_last := table[1, 1];
          for i in 2:n loop
            assert(table[i, 1] > t_last,
              "Time values of table not strict monotonically increasing: table["
               + String(i - 1) + ",1] = " + String(table[i - 1, 1]) + "table[" +
              String(i) + ",1] = " + String(table[i, 1]));
          end for;

          // Check that all values in the second column are Integer values
          for i in 1:n loop
            assert(rem(table[i, 2], 1) == 0.0,
              "Table value is not an Integer: table[" + String(i) + ",2] = " +
              String(table[i, 2]));
          end for;

          // Determine index in table for "nextTime"
          j := 1;
          y := integer(table[1, 2]);
          while j < n and table[j, 1] <= simulationStartTime loop
            j := j + 1;
          end while;

          if j == 1 then
            nextTime := table[1, 1];
            y := integer(table[1, 2]);
          elseif j == n and table[n, 1] <= simulationStartTime then
            nextTime := simulationStartTime - 1;
            y := integer(table[n, 2]);
          else
            nextTime := table[j, 1];
            y := integer(table[j - 1, 2]);
          end if;

          index := j;
        end if;
      end getFirstIndex;

      parameter Integer n=size(table, 1) "Number of table points";
      SIunits.Time nextTime;
      Integer index "Index of actual table entry";
    initial algorithm
      (index,nextTime,y) := getFirstIndex(table, time);
    equation
      assert(size(table, 1) > 0, "No table values defined.");
      when time >= pre(nextTime) then
        y = integer(table[pre(index), 2]);
        index = pre(index) + 1;
        nextTime = if index <= n then table[index, 1] else pre(nextTime) - 1;
      end when;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-80,64},{-80,-84}}, color={192,192,192}),
            Polygon(
              points={{-80,86},{-88,64},{-72,64},{-80,86}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-74},{82,-74}}, color={192,192,192}),
            Polygon(
              points={{90,-74},{68,-66},{68,-82},{90,-74}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-46,68},{4,-52}},
              lineColor={255,255,255},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-46,-52},{-46,68},{54,68},{54,-52},{-46,-52},{-46,-22},
                  {54,-22},{54,8},{-46,8},{-46,38},{54,38},{54,68},{4,68},{4,-53}},
                color={0,0,0})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}),graphics={Rectangle(
                extent={{-40,60},{10,-60}},
                lineColor={255,255,255},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),Line(points={{-40,-60},{-40,60},{
              60,60},{60,-60},{-40,-60},{-40,-30},{60,-30},{60,0},{-40,0},{-40,30},
              {60,30},{60,60},{10,60},{10,-61}}, color={0,0,0}),Text(
                extent={{-35,53},{4,38}},
                lineColor={0,0,0},
                textString="time"),Text(
                extent={{13,53},{56,37}},
                lineColor={0,0,0},
                textString="y"),Text(
                extent={{66,-88},{90,-98}},
                lineColor={0,0,0},
                textString="time"),Polygon(
                points={{88,-80},{68,-75},{68,-84},{88,-80}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(points={{-90,-80},{82,-80}},
              color={95,95,95}),Line(points={{-80,58},{-80,-90}}, color={95,95,95}),
              Polygon(
                points={{-80,80},{-85,58},{-74,58},{-80,80}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Text(
                extent={{-76,83},{-44,65}},
                lineColor={0,0,0},
                textString="y")}),
        Documentation(info="<html>

<p>
This block generates an Integer output signal by using a table.
The time points and y-values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
Real time points and the second column contains the Integer value of the
output y at this time point.
</p>

<p>
An assert is triggered, if no table values are provided, if the
time points are not strict monotonically increasing, or if
the second column of the table matrix does not contain Integer values.
</p>

<p>
If the simulation time is less than the first table time instant,
then the output y = table[1,2].<br>
If the simulation time is greater than the last table time instant,
then the output y = table[end,2].
</p>

<p>
Example:
</p>
<pre>
   table = [  0, 1;
              1, 4;
            1.5, 5;
              2, 6];
</pre>
<p>
results in the following output:
</p>

<blockquote><p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/IntegerTable.png\"
     alt=\"IntegerTable.png\">
</p></blockquote>

</html>"));
    end IntegerTable;
    annotation (Documentation(info="<HTML>
<p>
This package contains <b>source</b> components, i.e., blocks which
have only output signals. These blocks are used as signal generators
for Real, Integer and Boolean signals.
</p>

<p>
All Real source signals (with the exception of the Constant source)
have at least the following two parameters:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>offset</b></td>
      <td valign=\"top\">Value which is added to the signal</td>
  </tr>
  <tr><td valign=\"top\"><b>startTime</b></td>
      <td valign=\"top\">Start time of signal. For time &lt; startTime,
                the output y is set to offset.</td>
  </tr>
</table>

<p>
The <b>offset</b> parameter is especially useful in order to shift
the corresponding source, such that at initial time the system
is stationary. To determine the corresponding value of offset,
usually requires a trimming calculation.
</p>
</html>",   revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Integer sources added. Step, TimeTable and BooleanStep slightly changed.</li>
<li><i>Nov. 8, 1999</i>
       by <a href=\"mailto:clauss@eas.iis.fhg.de\">Christoph Clau&szlig;</a>,
       <a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>,
       <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New sources: Exponentials, TimeTable. Trapezoid slightly enhanced
       (nperiod=-1 is an infinite number of periods).</li>
<li><i>Oct. 31, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       <a href=\"mailto:clauss@eas.iis.fhg.de\">Christoph Clau&szlig;</a>,
       <a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>,
       All sources vectorized. New sources: ExpSine, Trapezoid,
       BooleanConstant, BooleanStep, BooleanPulse, SampleTrigger.
       Improved documentation, especially detailed description of
       signals in diagram layer.</li>
<li><i>June 29, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"));
  end Sources;

  package Tables
    "Library of blocks to interpolate in one and two-dimensional tables"
    extends Modelica_Icons.Package;
    block CombiTable1D
      "Table look-up in one dimension (matrix/file) with n inputs and n outputs"
      extends Modelica_Blocks_Interfaces.MIMOs(final n=size(columns, 1));
      parameter Boolean tableOnFile=false
        "= true, if table is defined on file or in function usertab"
        annotation (Dialog(group="Table data definition"));
      parameter Real table[:, :] = fill(0.0, 0, 2)
        "Table matrix (grid = first column; e.g., table=[0,2])"
        annotation (Dialog(group="Table data definition",enable=not tableOnFile));
      parameter String tableName="NoName"
        "Table name on file or in function usertab (see docu)"
        annotation (Dialog(group="Table data definition",enable=tableOnFile));
      parameter String fileName="NoName" "File where matrix is stored"
        annotation (Dialog(
          group="Table data definition",
          enable=tableOnFile,
          loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
              caption="Open file in which table is present")));
      parameter Boolean verboseRead=true
        "= true, if info message that file is loading is to be printed"
        annotation (Dialog(group="Table data definition",enable=tableOnFile));
      parameter Integer columns[:]=2:size(table, 2)
        "Columns of table to be interpolated"
        annotation (Dialog(group="Table data interpretation"));
      parameter Types.Smoothness smoothness=Types.Smoothness.LinearSegments
        "Smoothness of table interpolation"
        annotation (Dialog(group="Table data interpretation"));
    protected
      Types.ExternalCombiTable1D tableID=Types.ExternalCombiTable1D(
              if tableOnFile then tableName else "NoName",
              if tableOnFile and fileName <> "NoName" and not
            Modelica_Utilities.Strings.isEmpty(fileName) then fileName else
            "NoName",
              table,
              columns,
              smoothness) "External table object";
      parameter Real tableOnFileRead(fixed=false)
        "= 1, if table was successfully read from file";

      function readTableData
        "Read table data from ASCII text or MATLAB MAT-file"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable1D tableID;
        input Boolean forceRead = false
          "= true: Force reading of table data; = false: Only read, if not yet read.";
        input Boolean verboseRead
          "= true: Print info message; = false: No info message";
        output Real readSuccess "Table read success";
        external"C" readSuccess = ModelicaStandardTables_CombiTable1D_read(tableID, forceRead, verboseRead)
          annotation (Library={"ModelicaStandardTables"});
      end readTableData;

      function getTableValue "Interpolate 1-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable1D tableID;
        input Integer icol;
        input Real u;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output Real y;
        external"C" y = ModelicaStandardTables_CombiTable1D_getValue(tableID, icol, u)
          annotation (Library={"ModelicaStandardTables"});
        annotation (derivative(noDerivative=tableAvailable) = getDerTableValue);
      end getTableValue;

      function getTableValueNoDer
        "Interpolate 1-dim. table defined by matrix (but do not provide a derivative function)"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable1D tableID;
        input Integer icol;
        input Real u;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output Real y;
        external"C" y = ModelicaStandardTables_CombiTable1D_getValue(tableID, icol, u)
          annotation (Library={"ModelicaStandardTables"});
      end getTableValueNoDer;

      function getDerTableValue
        "Derivative of interpolated 1-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable1D tableID;
        input Integer icol;
        input Real u;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        input Real der_u;
        output Real der_y;
        external"C" der_y = ModelicaStandardTables_CombiTable1D_getDerValue(tableID, icol, u, der_u)
          annotation (Library={"ModelicaStandardTables"});
      end getDerTableValue;

    initial algorithm
      if tableOnFile then
        tableOnFileRead := readTableData(tableID, false, verboseRead);
      else
        tableOnFileRead := 1.;
      end if;
    equation
      if tableOnFile then
        assert(tableName <> "NoName",
          "tableOnFile = true and no table name given");
      else
        assert(size(table, 1) > 0 and size(table, 2) > 0,
          "tableOnFile = false and parameter table is an empty matrix");
      end if;
      if smoothness == Modelica_Blocks.Types.Smoothness.ConstantSegments then
        for i in 1:n loop
          y[i] = getTableValueNoDer(tableID, i, u[i], tableOnFileRead);
        end for;
      else
        for i in 1:n loop
          y[i] = getTableValue(tableID, i, u[i], tableOnFileRead);
        end for;
      end if;
      annotation (
        Documentation(info="<html>
<p>
<b>Linear interpolation</b> in <b>one</b> dimension of a <b>table</b>.
Via parameter <b>columns</b> it can be defined how many columns of the
table are interpolated. If, e.g., columns={2,4}, it is assumed that 2 input
and 2 output signals are present and that the first output interpolates
the first input via column 2 and the second output interpolates the
second input via column 4 of the table matrix.
</p>
<p>
The grid points and function values are stored in a matrix \"table[i,j]\",
where the first column \"table[:,1]\" contains the grid points and the
other columns contain the data to be interpolated. Example:
</p>
<pre>
   table = [0,  0;
            1,  1;
            2,  4;
            4, 16]
   If, e.g., the input u = 1.0, the output y =  1.0,
       e.g., the input u = 1.5, the output y =  2.5,
       e.g., the input u = 2.0, the output y =  4.0,
       e.g., the input u =-1.0, the output y = -1.0 (i.e., extrapolation).
</pre>
<ul>
<li> The interpolation is <b>efficient</b>, because a search for a new interpolation
     starts at the interval used in the last call.</li>
<li> If the table has only <b>one row</b>, the table value is returned,
     independent of the value of the input signal.</li>
<li> If the input signal <b>u[i]</b> is <b>outside</b> of the defined <b>interval</b>, i.e.,
     u[i] &gt; table[size(table,1),i+1] or u[i] &lt; table[1,1], the corresponding
     value is also determined by linear
     interpolation through the last or first two points of the table.</li>
<li> The grid values (first column) have to be strictly increasing.</li>
</ul>
<p>
The table matrix can be defined in the following ways:
</p>
<ol>
<li> Explicitly supplied as <b>parameter matrix</b> \"table\",
     and the other parameters have the following values:
<pre>
   tableName is \"NoName\" or has only blanks,
   fileName  is \"NoName\" or has only blanks.
</pre></li>
<li> <b>Read</b> from a <b>file</b> \"fileName\" where the matrix is stored as
      \"tableName\". Both ASCII and MAT-file format is possible.
      (The ASCII format is described below).
      The MAT-file format comes in four different versions: v4, v6, v7 and v7.3.
      The library supports at least v4, v6 and v7 whereas v7.3 is optional.
      It is most convenient to generate the MAT-file from FreeMat or MATLAB&reg;
      by command
<pre>
   save tables.mat tab1 tab2 tab3
</pre>
      or Scilab by command
<pre>
   savematfile tables.mat tab1 tab2 tab3
</pre>
      when the three tables tab1, tab2, tab3 should be used from the model.<br>
      Note, a fileName can be defined as URI by using the helper function
      <a href=\"modelica://Modelica.Utilities.Files.loadResource\">loadResource</a>.</li>
<li>  Statically stored in function \"usertab\" in file \"usertab.c\".
      The matrix is identified by \"tableName\". Parameter
      fileName = \"NoName\" or has only blanks. Row-wise storage is always to be
      preferred as otherwise the table is reallocated and transposed.
      See the <a href=\"modelica://Modelica.Blocks.Tables\">Tables</a> package
      documentation for more details.</li>
</ol>
<p>
When the constant \"NO_FILE_SYSTEM\" is defined, all file I/O related parts of the
source code are removed by the C-preprocessor, such that no access to files takes place.
</p>
<p>
If tables are read from an ASCII-file, the file needs to have the
following structure (\"-----\" is not part of the file content):
</p>
<pre>
-----------------------------------------------------
#1
double tab1(5,2)   # comment line
  0   0
  1   1
  2   4
  3   9
  4  16
double tab2(5,2)   # another comment line
  0   0
  2   2
  4   8
  6  18
  8  32
-----------------------------------------------------
</pre>
<p>
Note, that the first two characters in the file need to be
\"#1\" (a line comment defining the version number of the file format).
Afterwards, the corresponding matrix has to be declared
with type (= \"double\" or \"float\"), name and actual dimensions.
Finally, in successive rows of the file, the elements of the matrix
have to be given. The elements have to be provided as a sequence of
numbers in row-wise order (therefore a matrix row can span several
lines in the file and need not start at the beginning of a line).
Numbers have to be given according to C syntax (such as 2.3, -2, +2.e4).
Number separators are spaces, tab (\t), comma (,), or semicolon (;).
Several matrices may be defined one after another. Line comments start
with the hash symbol (#) and can appear everywhere.
Other characters, like trailing non comments, are not allowed in the file.
</p>
<p>
MATLAB is a registered trademark of The MathWorks, Inc.
</p>
</html>"),
        Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Line(points={{-60.0,40.0},{-60.0,-40.0},{60.0,-40.0},{60.0,40.0},{30.0,40.0},{30.0,-40.0},{-30.0,-40.0},{-30.0,40.0},{-60.0,40.0},{-60.0,20.0},{60.0,20.0},{60.0,0.0},{-60.0,0.0},{-60.0,-20.0},{60.0,-20.0},{60.0,-40.0},{-60.0,-40.0},{-60.0,40.0},{60.0,40.0},{60.0,-40.0}}),
        Line(points={{0.0,40.0},{0.0,-40.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-60.0,20.0},{-30.0,40.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-60.0,0.0},{-30.0,20.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-60.0,-20.0},{-30.0,0.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-60.0,-40.0},{-30.0,-20.0}})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-100,0},{-58,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-100,100},{100,64}},
              textString="1 dimensional linear table interpolation",
              lineColor={0,0,255}),
            Line(points={{-54,40},{-54,-40},{54,-40},{54,40},{28,40},{28,-40},{-28,
                  -40},{-28,40},{-54,40},{-54,20},{54,20},{54,0},{-54,0},{-54,-20},
                  {54,-20},{54,-40},{-54,-40},{-54,40},{54,40},{54,-40}}, color={
                  0,0,0}),
            Line(points={{0,40},{0,-40}}, color={0,0,0}),
            Rectangle(
              extent={{-54,40},{-28,20}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,20},{-28,0}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,0},{-28,-20}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,-20},{-28,-40}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-50,54},{-32,42}},
              textString="u[1]/[2]",
              lineColor={0,0,255}),
            Text(
              extent={{-24,54},{0,42}},
              textString="y[1]",
              lineColor={0,0,255}),
            Text(
              extent={{-2,-40},{30,-54}},
              textString="columns",
              lineColor={0,0,255}),
            Text(
              extent={{2,54},{26,42}},
              textString="y[2]",
              lineColor={0,0,255})}));
    end CombiTable1D;

    block CombiTable1Ds
      "Table look-up in one dimension (matrix/file) with one input and n outputs"
      extends Modelica_Blocks_Interfaces.SIMO(final nout=size(columns, 1));
      parameter Boolean tableOnFile=false
        "= true, if table is defined on file or in function usertab"
        annotation (Dialog(group="Table data definition"));
      parameter Real table[:, :] = fill(0.0, 0, 2)
        "Table matrix (grid = first column; e.g., table=[0,2])"
        annotation (Dialog(group="Table data definition",enable=not tableOnFile));
      parameter String tableName="NoName"
        "Table name on file or in function usertab (see docu)"
        annotation (Dialog(group="Table data definition",enable=tableOnFile));
      parameter String fileName="NoName" "File where matrix is stored"
        annotation (Dialog(
          group="Table data definition",
          enable=tableOnFile,
          loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
              caption="Open file in which table is present")));
      parameter Boolean verboseRead=true
        "= true, if info message that file is loading is to be printed"
        annotation (Dialog(group="Table data definition",enable=tableOnFile));
      parameter Integer columns[:]=2:size(table, 2)
        "Columns of table to be interpolated"
        annotation (Dialog(group="Table data interpretation"));
      parameter Types.Smoothness smoothness=Types.Smoothness.LinearSegments
        "Smoothness of table interpolation"
        annotation (Dialog(group="Table data interpretation"));
    protected
      Types.ExternalCombiTable1D tableID=Types.ExternalCombiTable1D(
              if tableOnFile then tableName else "NoName",
              if tableOnFile and fileName <> "NoName" and not
            Modelica_Utilities.Strings.isEmpty(fileName) then fileName else
            "NoName",
              table,
              columns,
              smoothness) "External table object";
      parameter Real tableOnFileRead(fixed=false)
        "= 1, if table was successfully read from file";

      function readTableData
        "Read table data from ASCII text or MATLAB MAT-file"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable1D tableID;
        input Boolean forceRead = false
          "= true: Force reading of table data; = false: Only read, if not yet read.";
        input Boolean verboseRead
          "= true: Print info message; = false: No info message";
        output Real readSuccess "Table read success";
        external"C" readSuccess = ModelicaStandardTables_CombiTable1D_read(tableID, forceRead, verboseRead)
          annotation (Library={"ModelicaStandardTables"});
      end readTableData;

      function getTableValue "Interpolate 1-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable1D tableID;
        input Integer icol;
        input Real u;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output Real y;
        external"C" y = ModelicaStandardTables_CombiTable1D_getValue(tableID, icol, u)
          annotation (Library={"ModelicaStandardTables"});
        annotation (derivative(noDerivative=tableAvailable) = getDerTableValue);
      end getTableValue;

      function getTableValueNoDer
        "Interpolate 1-dim. table defined by matrix (but do not provide a derivative function)"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable1D tableID;
        input Integer icol;
        input Real u;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output Real y;
        external"C" y = ModelicaStandardTables_CombiTable1D_getValue(tableID, icol, u)
          annotation (Library={"ModelicaStandardTables"});
      end getTableValueNoDer;

      function getDerTableValue
        "Derivative of interpolated 1-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable1D tableID;
        input Integer icol;
        input Real u;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        input Real der_u;
        output Real der_y;
        external"C" der_y = ModelicaStandardTables_CombiTable1D_getDerValue(tableID, icol, u, der_u)
          annotation (Library={"ModelicaStandardTables"});
      end getDerTableValue;

    initial algorithm
      if tableOnFile then
        tableOnFileRead := readTableData(tableID, false, verboseRead);
      else
        tableOnFileRead := 1.;
      end if;
    equation
      if tableOnFile then
        assert(tableName <> "NoName",
          "tableOnFile = true and no table name given");
      else
        assert(size(table, 1) > 0 and size(table, 2) > 0,
          "tableOnFile = false and parameter table is an empty matrix");
      end if;
      if smoothness == Modelica_Blocks.Types.Smoothness.ConstantSegments then
        for i in 1:nout loop
          y[i] = getTableValueNoDer(tableID, i, u, tableOnFileRead);
        end for;
      else
        for i in 1:nout loop
          y[i] = getTableValue(tableID, i, u, tableOnFileRead);
        end for;
      end if;
      annotation (
        Documentation(info="<html>
<p>
<b>Linear interpolation</b> in <b>one</b> dimension of a <b>table</b>.
Via parameter <b>columns</b> it can be defined how many columns of the
table are interpolated. If, e.g., icol={2,4}, it is assumed that one input
and 2 output signals are present and that the first output interpolates
via column 2 and the second output interpolates via column 4 of the
table matrix.
</p>
<p>
The grid points and function values are stored in a matrix \"table[i,j]\",
where the first column \"table[:,1]\" contains the grid points and the
other columns contain the data to be interpolated. Example:
</p>
<pre>
   table = [0,  0;
            1,  1;
            2,  4;
            4, 16]
   If, e.g., the input u = 1.0, the output y =  1.0,
       e.g., the input u = 1.5, the output y =  2.5,
       e.g., the input u = 2.0, the output y =  4.0,
       e.g., the input u =-1.0, the output y = -1.0 (i.e., extrapolation).
</pre>
<ul>
<li> The interpolation is <b>efficient</b>, because a search for a new interpolation
     starts at the interval used in the last call.</li>
<li> If the table has only <b>one row</b>, the table value is returned,
     independent of the value of the input signal.</li>
<li> If the input signal <b>u</b> is <b>outside</b> of the defined <b>interval</b>, i.e.,
     u &gt; table[size(table,1),1] or u &lt; table[1,1], the corresponding
     value is also determined by linear
     interpolation through the last or first two points of the table.</li>
<li> The grid values (first column) have to be strictly increasing.</li>
</ul>
<p>
The table matrix can be defined in the following ways:
</p>
<ol>
<li> Explicitly supplied as <b>parameter matrix</b> \"table\",
     and the other parameters have the following values:
<pre>
   tableName is \"NoName\" or has only blanks,
   fileName  is \"NoName\" or has only blanks.
</pre></li>
<li> <b>Read</b> from a <b>file</b> \"fileName\" where the matrix is stored as
      \"tableName\". Both ASCII and MAT-file format is possible.
      (The ASCII format is described below).
      The MAT-file format comes in four different versions: v4, v6, v7 and v7.3.
      The library supports at least v4, v6 and v7 whereas v7.3 is optional.
      It is most convenient to generate the MAT-file from FreeMat or MATLAB&reg;
      by command
<pre>
   save tables.mat tab1 tab2 tab3
</pre>
      or Scilab by command
<pre>
   savematfile tables.mat tab1 tab2 tab3
</pre>
      when the three tables tab1, tab2, tab3 should be used from the model.<br>
      Note, a fileName can be defined as URI by using the helper function
      <a href=\"modelica://Modelica.Utilities.Files.loadResource\">loadResource</a>.</li>
<li>  Statically stored in function \"usertab\" in file \"usertab.c\".
      The matrix is identified by \"tableName\". Parameter
      fileName = \"NoName\" or has only blanks. Row-wise storage is always to be
      preferred as otherwise the table is reallocated and transposed.
      See the <a href=\"modelica://Modelica.Blocks.Tables\">Tables</a> package
      documentation for more details.</li>
</ol>
<p>
When the constant \"NO_FILE_SYSTEM\" is defined, all file I/O related parts of the
source code are removed by the C-preprocessor, such that no access to files takes place.
</p>
<p>
If tables are read from an ASCII-file, the file needs to have the
following structure (\"-----\" is not part of the file content):
</p>
<pre>
-----------------------------------------------------
#1
double tab1(5,2)   # comment line
  0   0
  1   1
  2   4
  3   9
  4  16
double tab2(5,2)   # another comment line
  0   0
  2   2
  4   8
  6  18
  8  32
-----------------------------------------------------
</pre>
<p>
Note, that the first two characters in the file need to be
\"#1\" (a line comment defining the version number of the file format).
Afterwards, the corresponding matrix has to be declared
with type (= \"double\" or \"float\"), name and actual dimensions.
Finally, in successive rows of the file, the elements of the matrix
have to be given. The elements have to be provided as a sequence of
numbers in row-wise order (therefore a matrix row can span several
lines in the file and need not start at the beginning of a line).
Numbers have to be given according to C syntax (such as 2.3, -2, +2.e4).
Number separators are spaces, tab (\t), comma (,), or semicolon (;).
Several matrices may be defined one after another. Line comments start
with the hash symbol (#) and can appear everywhere.
Other characters, like trailing non comments, are not allowed in the file.
</p>
<p>
MATLAB is a registered trademark of The MathWorks, Inc.
</p>
</html>"),
        Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Line(points={{-60.0,40.0},{-60.0,-40.0},{60.0,-40.0},{60.0,40.0},{30.0,40.0},{30.0,-40.0},{-30.0,-40.0},{-30.0,40.0},{-60.0,40.0},{-60.0,20.0},{60.0,20.0},{60.0,0.0},{-60.0,0.0},{-60.0,-20.0},{60.0,-20.0},{60.0,-40.0},{-60.0,-40.0},{-60.0,40.0},{60.0,40.0},{60.0,-40.0}}),
        Line(points={{0.0,40.0},{0.0,-40.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-60.0,20.0},{-30.0,40.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-60.0,0.0},{-30.0,20.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-60.0,-20.0},{-30.0,0.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-60.0,-40.0},{-30.0,-20.0}})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{-100,0},{-58,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-100,100},{100,64}},
              textString="1 dimensional linear table interpolation",
              lineColor={0,0,255}),
            Line(points={{-54,40},{-54,-40},{54,-40},{54,40},{28,40},{28,-40},{-28,
                  -40},{-28,40},{-54,40},{-54,20},{54,20},{54,0},{-54,0},{-54,-20},
                  {54,-20},{54,-40},{-54,-40},{-54,40},{54,40},{54,-40}}, color={
                  0,0,0}),
            Line(points={{0,40},{0,-40}}, color={0,0,0}),
            Rectangle(
              extent={{-54,40},{-28,20}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,20},{-28,0}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,0},{-28,-20}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,-20},{-28,-40}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-52,56},{-34,44}},
              textString="u",
              lineColor={0,0,255}),
            Text(
              extent={{-22,54},{2,42}},
              textString="y[1]",
              lineColor={0,0,255}),
            Text(
              extent={{4,54},{28,42}},
              textString="y[2]",
              lineColor={0,0,255}),
            Text(
              extent={{0,-40},{32,-54}},
              textString="columns",
              lineColor={0,0,255})}));
    end CombiTable1Ds;

    block CombiTable2D "Table look-up in two dimensions (matrix/file)"
      extends Modelica_Blocks_Interfaces.SI2SO;
      parameter Boolean tableOnFile=false
        "= true, if table is defined on file or in function usertab"
        annotation (Dialog(group="Table data definition"));
      parameter Real table[:, :] = fill(0.0, 0, 2)
        "Table matrix (grid u1 = first column, grid u2 = first row; e.g., table=[0,0;0,1])"
        annotation (Dialog(group="Table data definition",enable=not tableOnFile));
      parameter String tableName="NoName"
        "Table name on file or in function usertab (see docu)"
        annotation (Dialog(group="Table data definition",enable=tableOnFile));
      parameter String fileName="NoName" "File where matrix is stored"
        annotation (Dialog(
          group="Table data definition",
          enable=tableOnFile,
          loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
              caption="Open file in which table is present")));
      parameter Boolean verboseRead=true
        "= true, if info message that file is loading is to be printed"
        annotation (Dialog(group="Table data definition",enable=tableOnFile));
      parameter Types.Smoothness smoothness=Types.Smoothness.LinearSegments
        "Smoothness of table interpolation"
        annotation (Dialog(group="Table data interpretation"));
    protected
      Types.ExternalCombiTable2D tableID=Types.ExternalCombiTable2D(
              if tableOnFile then tableName else "NoName",
              if tableOnFile and fileName <> "NoName" and not
            Modelica_Utilities.Strings.isEmpty(fileName) then fileName else
            "NoName",
              table,
              smoothness) "External table object";
      parameter Real tableOnFileRead(fixed=false)
        "= 1, if table was successfully read from file";

      function readTableData
        "Read table data from ASCII text or MATLAB MAT-file"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable2D tableID;
        input Boolean forceRead = false
          "= true: Force reading of table data; = false: Only read, if not yet read.";
        input Boolean verboseRead
          "= true: Print info message; = false: No info message";
        output Real readSuccess "Table read success";
        external"C" readSuccess = ModelicaStandardTables_CombiTable2D_read(tableID, forceRead, verboseRead)
          annotation (Library={"ModelicaStandardTables"});
      end readTableData;

      function getTableValue "Interpolate 2-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable2D tableID;
        input Real u1;
        input Real u2;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output Real y;
        external"C" y = ModelicaStandardTables_CombiTable2D_getValue(tableID, u1, u2)
          annotation (Library={"ModelicaStandardTables"});
        annotation (derivative(noDerivative=tableAvailable) = getDerTableValue);
      end getTableValue;

      function getTableValueNoDer
        "Interpolate 2-dim. table defined by matrix (but do not provide a derivative function)"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable2D tableID;
        input Real u1;
        input Real u2;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        output Real y;
        external"C" y = ModelicaStandardTables_CombiTable2D_getValue(tableID, u1, u2)
          annotation (Library={"ModelicaStandardTables"});
      end getTableValueNoDer;

      function getDerTableValue
        "Derivative of interpolated 2-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input Types.ExternalCombiTable2D tableID;
        input Real u1;
        input Real u2;
        input Real tableAvailable
          "Dummy input to ensure correct sorting of function calls";
        input Real der_u1;
        input Real der_u2;
        output Real der_y;
        external"C" der_y = ModelicaStandardTables_CombiTable2D_getDerValue(tableID, u1, u2, der_u1, der_u2)
          annotation (Library={"ModelicaStandardTables"});
      end getDerTableValue;

    initial algorithm
      if tableOnFile then
        tableOnFileRead := readTableData(tableID, false, verboseRead);
      else
        tableOnFileRead := 1.;
      end if;
    equation
      if tableOnFile then
        assert(tableName <> "NoName",
          "tableOnFile = true and no table name given");
      else
        assert(size(table, 1) > 0 and size(table, 2) > 0,
          "tableOnFile = false and parameter table is an empty matrix");
      end if;
      if smoothness == Modelica_Blocks.Types.Smoothness.ConstantSegments then
        y = getTableValueNoDer(tableID, u1, u2, tableOnFileRead);
      else
        y = getTableValue(tableID, u1, u2, tableOnFileRead);
      end if;
      annotation (
        Documentation(info="<html>
<p>
<b>Linear interpolation</b> in <b>two</b> dimensions of a <b>table</b>.
The grid points and function values are stored in a matrix \"table[i,j]\",
where:
</p>
<ul>
<li> the first column \"table[2:,1]\" contains the u[1] grid points,</li>
<li> the first row \"table[1,2:]\" contains the u[2] grid points,</li>
<li> the other rows and columns contain the data to be interpolated.</li>
</ul>
<p>
Example:
</p>
<pre>
           |       |       |       |
           |  1.0  |  2.0  |  3.0  |  // u2
       ----*-------*-------*-------*
       1.0 |  1.0  |  3.0  |  5.0  |
       ----*-------*-------*-------*
       2.0 |  2.0  |  4.0  |  6.0  |
       ----*-------*-------*-------*
     // u1
   is defined as
      table = [0.0,   1.0,   2.0,   3.0;
               1.0,   1.0,   3.0,   5.0;
               2.0,   2.0,   4.0,   6.0]
   If, e.g., the input u is [1.0;1.0], the output y is 1.0,
       e.g., the input u is [2.0;1.5], the output y is 3.0.
</pre>
<ul>
<li> The interpolation is <b>efficient</b>, because a search for a new
     interpolation starts at the interval used in the last call.</li>
<li> If the table has only <b>one element</b>, the table value is returned,
     independent of the value of the input signal.</li>
<li> If the input signal <b>u1</b> or <b>u2</b> is <b>outside</b> of the defined
     <b>interval</b>, the corresponding value is also determined by linear
     interpolation through the last or first two points of the table.</li>
<li> The grid values (first column and first row) have to be strictly
     increasing.</li>
</ul>
<p>
The table matrix can be defined in the following ways:
</p>
<ol>
<li> Explicitly supplied as <b>parameter matrix</b> \"table\",
     and the other parameters have the following values:
<pre>
   tableName is \"NoName\" or has only blanks,
   fileName  is \"NoName\" or has only blanks.
</pre></li>
<li> <b>Read</b> from a <b>file</b> \"fileName\" where the matrix is stored as
      \"tableName\". Both ASCII and MAT-file format is possible.
      (The ASCII format is described below).
      The MAT-file format comes in four different versions: v4, v6, v7 and v7.3.
      The library supports at least v4, v6 and v7 whereas v7.3 is optional.
      It is most convenient to generate the MAT-file from FreeMat or MATLAB&reg;
      by command
<pre>
   save tables.mat tab1 tab2 tab3
</pre>
      or Scilab by command
<pre>
   savematfile tables.mat tab1 tab2 tab3
</pre>
      when the three tables tab1, tab2, tab3 should be used from the model.<br>
      Note, a fileName can be defined as URI by using the helper function
      <a href=\"modelica://Modelica.Utilities.Files.loadResource\">loadResource</a>.</li>
<li>  Statically stored in function \"usertab\" in file \"usertab.c\".
      The matrix is identified by \"tableName\". Parameter
      fileName = \"NoName\" or has only blanks. Row-wise storage is always to be
      preferred as otherwise the table is reallocated and transposed.
      See the <a href=\"modelica://Modelica.Blocks.Tables\">Tables</a> package
      documentation for more details.</li>
</ol>
<p>
When the constant \"NO_FILE_SYSTEM\" is defined, all file I/O related parts of the
source code are removed by the C-preprocessor, such that no access to files takes place.
</p>
<p>
If tables are read from an ASCII-file, the file needs to have the
following structure (\"-----\" is not part of the file content):
</p>
<pre>
-----------------------------------------------------
#1
double table2D_1(3,4)   # comment line
0.0  1.0  2.0  3.0  # u[2] grid points
1.0  1.0  3.0  5.0
2.0  2.0  4.0  6.0

double table2D_2(4,4)   # comment line
0.0  1.0  2.0  3.0  # u[2] grid points
1.0  1.0  3.0  5.0
2.0  2.0  4.0  6.0
3.0  3.0  5.0  7.0
-----------------------------------------------------
</pre>
<p>
Note, that the first two characters in the file need to be
\"#1\" (a line comment defining the version number of the file format).
Afterwards, the corresponding matrix has to be declared
with type (= \"double\" or \"float\"), name and actual dimensions.
Finally, in successive rows of the file, the elements of the matrix
have to be given. The elements have to be provided as a sequence of
numbers in row-wise order (therefore a matrix row can span several
lines in the file and need not start at the beginning of a line).
Numbers have to be given according to C syntax (such as 2.3, -2, +2.e4).
Number separators are spaces, tab (\t), comma (,), or semicolon (;).
Several matrices may be defined one after another. Line comments start
with the hash symbol (#) and can appear everywhere.
Other characters, like trailing non comments, are not allowed in the file.
The matrix elements are interpreted in exactly the same way
as if the matrix is given as a parameter. For example, the first
column \"table2D_1[2:,1]\" contains the u[1] grid points,
and the first row \"table2D_1[1,2:]\" contains the u[2] grid points.
</p>

<p>
MATLAB is a registered trademark of The MathWorks, Inc.
</p>
</html>"),
        Icon(
        coordinateSystem(preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}},
          initialScale=0.1),
          graphics={
        Line(points={{-60.0,40.0},{-60.0,-40.0},{60.0,-40.0},{60.0,40.0},{30.0,40.0},{30.0,-40.0},{-30.0,-40.0},{-30.0,40.0},{-60.0,40.0},{-60.0,20.0},{60.0,20.0},{60.0,0.0},{-60.0,0.0},{-60.0,-20.0},{60.0,-20.0},{60.0,-40.0},{-60.0,-40.0},{-60.0,40.0},{60.0,40.0},{60.0,-40.0}}),
        Line(points={{0.0,40.0},{0.0,-40.0}}),
        Line(points={{-60.0,40.0},{-30.0,20.0}}),
        Line(points={{-30.0,40.0},{-60.0,20.0}}),
        Rectangle(origin={2.3077,-0.0},
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-62.3077,0.0},{-32.3077,20.0}}),
        Rectangle(origin={2.3077,-0.0},
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-62.3077,-20.0},{-32.3077,0.0}}),
        Rectangle(origin={2.3077,-0.0},
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-62.3077,-40.0},{-32.3077,-20.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-30.0,20.0},{0.0,40.0}}),
        Rectangle(fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{0.0,20.0},{30.0,40.0}}),
        Rectangle(origin={-2.3077,-0.0},
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{32.3077,20.0},{62.3077,40.0}})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-60}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-100,100},{100,64}},
              textString="2 dimensional linear table interpolation",
              lineColor={0,0,255}),
            Line(points={{-54,40},{-54,-40},{54,-40},{54,40},{28,40},{28,-40},{-28,
                  -40},{-28,40},{-54,40},{-54,20},{54,20},{54,0},{-54,0},{-54,-20},
                  {54,-20},{54,-40},{-54,-40},{-54,40},{54,40},{54,-40}}, color={
                  0,0,0}),
            Line(points={{0,40},{0,-40}}, color={0,0,0}),
            Rectangle(
              extent={{-54,20},{-28,0}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,0},{-28,-20}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,-20},{-28,-40}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-28,40},{0,20}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{0,40},{28,20}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{28,40},{54,20}},
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-54,40},{-28,20}}, color={0,0,0}),
            Line(points={{-28,40},{-54,20}}, color={0,0,0}),
            Text(
              extent={{-54,-40},{-30,-56}},
              textString="u1",
              lineColor={0,0,255}),
            Text(
              extent={{28,58},{52,44}},
              textString="u2",
              lineColor={0,0,255}),
            Text(
              extent={{-2,12},{32,-22}},
              textString="y",
              lineColor={0,0,255})}));
    end CombiTable2D;
    annotation (Documentation(info="<html>
<p>This package contains blocks for one- and two-dimensional interpolation in tables. </p>
<h4>Special interest topic: Statically stored tables for real-time simulation targets</h4>
<p>Especially for use on real-time platform targets (e.g., HIL-simulators) with <b>no file system</b>, it is possible to statically
store tables using a function &quot;usertab&quot; in a file conventionally named &quot;usertab.c&quot;. This can be more efficient than providing the tables as Modelica parameter arrays.</p>
<p>This is achieved by providing the tables in a specific structure as C-code and compiling that C-code together with the rest of the simulation model into a binary
that can be executed on the target platform. The &quot;Resources/Data/Tables/&quot; subdirectory of the MSL installation directory contains the files
<a href=\"modelica://Modelica/Resources/Data/Tables/usertab.c\">&quot;usertab.c&quot;</a> and <a href=\"modelica://Modelica/Resources/Data/Tables/usertab.h\">&quot;usertab.h&quot;</a>
that can be used as a template for own developments. While &quot;usertab.c&quot; would be typically used unmodified, the
&quot;usertab.h&quot; needs to adapted for the own needs.</p>
<p>In order to work it is necessary that the compiler pulls in the &quot;usertab.c&quot; file. Different Modelica tools might provide different mechanisms to do so.
Please consult the respective documentation/support for your Modelica tool.</p>
<p>A possible (though a bit &quot;hackish&quot;) Modelica standard conformant approach is to pull in the required files by utilizing a &quot;dummy&quot;-function that uses the Modelica external function
interface to pull in the required &quot;usertab.c&quot;. An example how this can be done is given below.</p>
<pre>
model Test25_usertab \"Test utilizing the usertab.c interface\"
  extends Modelica.Icons.Example;
public
  Modelica.Blocks.Sources.RealExpression realExpression(y=getUsertab(t_new.y))
    annotation (Placement(transformation(extent={{-40,-34},{-10,-14}})));
  Modelica.Blocks.Tables.CombiTable1D t_new(tableOnFile=true, tableName=\"TestTable_1D_a\")
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Sources.Clock clock
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
protected
  encapsulated function getUsertab
    input Real dummy_u[:];
    output Real dummy_y;
    external \"C\" dummy_y=  mydummyfunc(dummy_u);
    annotation(IncludeDirectory=\"modelica://Modelica/Resources/Data/Tables\",
           Include = \"#include \"usertab.c\"
 double mydummyfunc(const double* dummy_in) {
        return 0;
}
\");
  end getUsertab;
equation
  connect(clock.y,t_new. u[1]) annotation (Line(
      points={{-59,10},{-42,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (experiment(StartTime=0, StopTime=5), uses(Modelica(version=\"3.2.1\")));
end Test25_usertab;
</pre>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={
          Rectangle(
            extent={{-76,-26},{80,-76}},
            lineColor={95,95,95},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-76,24},{80,-26}},
            lineColor={95,95,95},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-76,74},{80,24}},
            lineColor={95,95,95},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-28,74},{-28,-76}},
            color={95,95,95}),
          Line(
            points={{24,74},{24,-76}},
            color={95,95,95})}));
  end Tables;

  package Types
    "Library of constants and types with choices, especially to build menus"
    extends Modelica_Icons.TypesPackage;

    type Smoothness = enumeration(
        LinearSegments "Table points are linearly interpolated",
        ContinuousDerivative
          "Table points are interpolated such that the first derivative is continuous",

        ConstantSegments
          "Table points are not interpolated, but the value from the previous abscissa point is returned")
      "Enumeration defining the smoothness of table interpolation";

    type Extrapolation = enumeration(
        HoldLastPoint
          "Hold the first/last table point outside of the table scope",
        LastTwoPoints
          "Extrapolate by using the derivative at the first/last table points outside of the table scope",

        Periodic "Repeat the table scope periodically",
        NoExtrapolation "Extrapolation triggers an error")
      "Enumeration defining the extrapolation of time table interpolation";

    type Init = enumeration(
        NoInit
          "No initialization (start values are used as guess values with fixed=false)",

        SteadyState
          "Steady state initialization (derivatives of states are zero)",
        InitialState "Initialization with initial states",
        InitialOutput
          "Initialization with initial outputs (and steady state of the states if possible)")
      "Enumeration defining initialization of a block" annotation (Evaluate=true,
      Documentation(info="<html>
  <p>The following initialization alternatives are available:</p>
  <dl>
    <dt><code><strong>NoInit</strong></code></dt>
      <dd>No initialization (start values are used as guess values with <code>fixed=false</code>)</dd>
    <dt><code><strong>SteadyState</strong></code></dt>
      <dd>Steady state initialization (derivatives of states are zero)</dd>
    <dt><code><strong>InitialState</strong></code></dt>
      <dd>Initialization with initial states</dd>
    <dt><code><strong>InitialOutput</strong></code></dt>
      <dd>Initialization with initial outputs (and steady state of the states if possible)</dd>
  </dl>
</html>"));

    type InitPID = enumeration(
        NoInit
          "No initialization (start values are used as guess values with fixed=false)",

        SteadyState
          "Steady state initialization (derivatives of states are zero)",
        InitialState "Initialization with initial states",
        InitialOutput
          "Initialization with initial outputs (and steady state of the states if possible)",

        DoNotUse_InitialIntegratorState
          "Don not use, only for backward compatibility (initialize only integrator state)")
      "Enumeration defining initialization of PID and LimPID blocks" annotation (
        Evaluate=true, Documentation(info="<html>
<p>
This initialization type is identical to <a href=\"modelica://Modelica.Blocks.Types.Init\">Types.Init</a> and has just one
additional option <strong><code>DoNotUse_InitialIntegratorState</code></strong>. This option
is introduced in order that the default initialization for the
<code>Continuous.PID</code> and <code>Continuous.LimPID</code> blocks are backward
compatible. In Modelica 2.2, the integrators have been initialized
with their given states where as the D-part has not been initialized.
The option <strong><code>DoNotUse_InitialIntegratorState</code></strong> leads to this
initialization definition.
</p>

 <p>The following initialization alternatives are available:</p>
  <dl>
    <dt><code><strong>NoInit</strong></code></dt>
      <dd>No initialization (start values are used as guess values with <code>fixed=false</code>)</dd>
    <dt><code><strong>SteadyState</strong></code></dt>
      <dd>Steady state initialization (derivatives of states are zero)</dd>
    <dt><code><strong>InitialState</strong></code></dt>
      <dd>Initialization with initial states</dd>
    <dt><code><strong>InitialOutput</strong></code></dt>
      <dd>Initialization with initial outputs (and steady state of the states if possible)</dd>
    <dt><code><strong>DoNotUse_InitialIntegratorState</strong></code></dt>
      <dd>Don not use, only for backward compatibility (initialize only integrator state)</dd>
  </dl>
</html>"));

    type SimpleController = enumeration(
        P "P controller",
        PI "PI controller",
        PD "PD controller",
        PID "PID controller")
      "Enumeration defining P, PI, PD, or PID simple controller type" annotation (
       Evaluate=true);

    type AnalogFilter = enumeration(
        CriticalDamping "Filter with critical damping",
        Bessel "Bessel filter",
        Butterworth "Butterworth filter",
        ChebyshevI "Chebyshev I filter")
      "Enumeration defining the method of filtering" annotation (Evaluate=true);

    type FilterType = enumeration(
        LowPass "Low pass filter",
        HighPass "High pass filter",
        BandPass "Band pass filter",
        BandStop "Band stop / notch filter")
      "Enumeration of analog filter types (low, high, band pass or band stop filter)"
      annotation (Evaluate=true);

    class ExternalCombiTimeTable
      "External object of 1-dim. table where first column is time"
      extends ExternalObject;

      function constructor "Initialize 1-dim. table where first column is time"
        extends Modelica_Icons.Function;
        input String tableName "Table name";
        input String fileName "File name";
        input Real table[:, :];
        input SI.Time startTime;
        input Integer columns[:];
        input Smoothness smoothness;
        input Extrapolation extrapolation;
        output ExternalCombiTimeTable externalCombiTimeTable;
      external"C" externalCombiTimeTable =
          ModelicaStandardTables_CombiTimeTable_init(
              tableName,
              fileName,
              table,
              size(table, 1),
              size(table, 2),
              startTime,
              columns,
              size(columns, 1),
              smoothness,
              extrapolation) annotation (Library={"ModelicaStandardTables"});
      end constructor;

      function destructor "Terminate 1-dim. table where first column is time"
        extends Modelica_Icons.Function;
        input ExternalCombiTimeTable externalCombiTimeTable;
      external"C" ModelicaStandardTables_CombiTimeTable_close(
          externalCombiTimeTable) annotation (Library={"ModelicaStandardTables"});
      end destructor;

    end ExternalCombiTimeTable;

    class ExternalCombiTable1D
      "External object of 1-dim. table defined by matrix"
      extends ExternalObject;

      function constructor "Initialize 1-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input String tableName "Table name";
        input String fileName "File name";
        input Real table[:, :];
        input Integer columns[:];
        input Smoothness smoothness;
        output ExternalCombiTable1D externalCombiTable1D;
      external"C" externalCombiTable1D = ModelicaStandardTables_CombiTable1D_init(
              tableName,
              fileName,
              table,
              size(table, 1),
              size(table, 2),
              columns,
              size(columns, 1),
              smoothness) annotation (Library={"ModelicaStandardTables"});
      end constructor;

      function destructor "Terminate 1-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input ExternalCombiTable1D externalCombiTable1D;
      external"C" ModelicaStandardTables_CombiTable1D_close(externalCombiTable1D)
          annotation (Library={"ModelicaStandardTables"});
      end destructor;

    end ExternalCombiTable1D;

    class ExternalCombiTable2D
      "External object of 2-dim. table defined by matrix"
      extends ExternalObject;

      function constructor "Initialize 2-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input String tableName "Table name";
        input String fileName "File name";
        input Real table[:, :];
        input Smoothness smoothness;
        output ExternalCombiTable2D externalCombiTable2D;
      external"C" externalCombiTable2D = ModelicaStandardTables_CombiTable2D_init(
              tableName,
              fileName,
              table,
              size(table, 1),
              size(table, 2),
              smoothness) annotation (Library={"ModelicaStandardTables"});
      end constructor;

      function destructor "Terminate 2-dim. table defined by matrix"
        extends Modelica_Icons.Function;
        input ExternalCombiTable2D externalCombiTable2D;
      external"C" ModelicaStandardTables_CombiTable2D_close(externalCombiTable2D)
          annotation (Library={"ModelicaStandardTables"});
      end destructor;

    end ExternalCombiTable2D;
    annotation (Documentation(info="<HTML>
<p>
In this package <b>types</b>, <b>constants</b> and <b>external objects</b> are defined that are used
in library Modelica.Blocks. The types have additional annotation choices
definitions that define the menus to be built up in the graphical
user interface when the type is used as parameter in a declaration.
</p>
</HTML>"));
  end Types;

  package Icons "Icons for Blocks"
      extends Modelica_Icons.IconsPackage;
      partial block Block "Basic graphical layout of input/output block"

        annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package Modelica.Blocks inherit directly or indirectly
from this block.
</p>
</html>"));

      end Block;

      partial block BooleanBlock "Basic graphical layout of Boolean block"

        annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
Boolean block (no declarations, no equations).
</p>
</html>"));

      end BooleanBlock;

      partial block DiscreteBlock
      "Graphical layout of discrete block component icon"

        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,127},
              fillColor={223,211,169},
              lineThickness=5.0,
              borderPattern=BorderPattern.Raised,
              fillPattern=FillPattern.Solid), Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
                             Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
discrete block (no declarations, no equations), e.g.,
from Blocks.Discrete.
</p>
</html>"));
      end DiscreteBlock;

  partial block IntegerBlock "Basic graphical layout of Integer block"

    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={255,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
          Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
Integer block (no declarations, no equations).
</p>
</html>"));
  end IntegerBlock;

    partial block PartialBooleanBlock "Basic graphical layout of logical block"

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={210,210,210},
              lineThickness=5.0,
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised), Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),                        Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
Boolean block (no declarations, no equations) used especially
in the Blocks.Logical library.
</p>
</html>"));
    end PartialBooleanBlock;
  end Icons;
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100.0,-100.0},{100.0,100.0}}, initialScale=0.1), graphics={
      Rectangle(
        origin={0.0,35.1488},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}}),
      Rectangle(
        origin={0.0,-34.8512},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}}),
      Line(
        origin={-51.25,0.0},
        points={{21.25,-35.0},{-13.75,-35.0},{-13.75,35.0},{6.25,35.0}}),
      Polygon(
        origin={-40.0,35.0},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{10.0,0.0},{-5.0,5.0},{-5.0,-5.0}}),
      Line(
        origin={51.25,0.0},
        points={{-21.25,35.0},{13.75,35.0},{13.75,-35.0},{-6.25,-35.0}}),
      Polygon(
        origin={40.0,-35.0},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{-10.0,0.0},{5.0,5.0},{5.0,-5.0}})}), Documentation(info="<html>
<p>
This library contains input/output blocks to build up block diagrams.
</p>

<dl>
<dt><b>Main Author:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>
<p>
Copyright &copy; 1998-2013, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>", revisions="<html>
<ul>
<li><i>June 23, 2004</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Introduced new block connectors and adapted all blocks to the new connectors.
       Included subpackages Continuous, Discrete, Logical, Nonlinear from
       package ModelicaAdditions.Blocks.
       Included subpackage ModelicaAdditions.Table in Modelica.Blocks.Sources
       and in the new package Modelica.Blocks.Tables.
       Added new blocks to Blocks.Sources and Blocks.Logical.
       </li>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New subpackage Examples, additional components.
       </li>
<li><i>June 20, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and
       Michael Tiller:<br>
       Introduced a replaceable signal type into
       Blocks.Interfaces.RealInput/RealOutput:
<pre>
   replaceable type SignalType = Real
</pre>
       in order that the type of the signal of an input/output block
       can be changed to a physical type, for example:
<pre>
   Sine sin1(outPort(redeclare type SignalType=Modelica.SIunits.Torque))
</pre>
      </li>
<li><i>Sept. 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Renamed to Blocks. New subpackages Math, Nonlinear.
       Additional components in subpackages Interfaces, Continuous
       and Sources. </li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"),
    uses(Modelica_Blocks_Interfaces(version="3.2.2"),
         Modelica_Math(version="3.2.2"),
         Modelica_Utilities(version="3.2.2"),
         Modelica_Constants(version="3.2.2"),
         Modelica_Icons(version="3.2.2"),
         Modelica_Blocks(version="3.2.2")),
    version="3.2.2");
end Modelica_Blocks;
