within ;
encapsulated package Modelica_StateGraph_Examples
  "Examples to demonstrate the usage of the components of the StateGraph library"
  import Modelica_Icons;
  import Modelica_StateGraph;
  import Modelica_Blocks;
  import Modelica_Constants;
  extends Modelica_Icons.ExamplesPackage;

  model FirstExample "A first simple StateGraph example"
    extends Modelica_Icons.Example;
    Modelica_StateGraph.InitialStep initialStep annotation (Placement(
          transformation(extent={{-48,0},{-28,20}}, rotation=0)));
    Modelica_StateGraph.Transition transition1(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-20,0},{0,20}}, rotation=0)));
    Modelica_StateGraph.Step step annotation (Placement(transformation(extent={
              {10,0},{30,20}}, rotation=0)));
    Modelica_StateGraph.Transition transition2(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{40,0},{60,20}}, rotation=0)));
      inner Modelica_StateGraph.StateGraphRoot stateGraphRoot
      annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  equation

    connect(initialStep.outPort[1], transition1.inPort)
      annotation (Line(points={{-27.5,10},{-14,10}}, color={0,0,0}));

    connect(transition1.outPort, step.inPort[1])
      annotation (Line(points={{-8.5,10},{9,10}}, color={0,0,0}));
    connect(step.outPort[1], transition2.inPort)
      annotation (Line(points={{30.5,10},{46,10}}, color={0,0,0}));
    connect(transition2.outPort, initialStep.inPort[1]) annotation (Line(points=
             {{51.5,10},{70,10},{70,32},{-62,32},{-62,10},{-49,10}}, color={0,0,
              0}));
    annotation (experiment(StopTime=5));
  end FirstExample;

  model FirstExample_Variant2
    "A variant of the first simple StateGraph example"
    extends Modelica_Icons.Example;
    Modelica_StateGraph.InitialStep initialStep annotation (Placement(
          transformation(extent={{-70,0},{-50,20}}, rotation=0)));
    Modelica_StateGraph.Transition transition1(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-42,0},{-22,20}}, rotation=
              0)));
    Modelica_StateGraph.StepWithSignal step annotation (Placement(
          transformation(extent={{-14,0},{6,20}}, rotation=0)));
    Modelica_StateGraph.TransitionWithSignal transition2 annotation (Placement(
          transformation(extent={{52,0},{72,20}}, rotation=0)));
    Modelica_Blocks.Logical.Timer timer annotation (Placement(transformation(
            extent={{6,-40},{26,-20}}, rotation=0)));
    Modelica_Blocks.Logical.GreaterEqualThreshold greaterEqual(threshold=1)
      annotation (Placement(transformation(extent={{36,-40},{56,-20}}, rotation=
               0)));
      inner Modelica_StateGraph.StateGraphRoot stateGraphRoot
      annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  equation

    connect(initialStep.outPort[1], transition1.inPort)
      annotation (Line(points={{-49.5,10},{-36,10}}, color={0,0,0}));

    connect(transition1.outPort, step.inPort[1])
      annotation (Line(points={{-30.5,10},{-15,10}}, color={0,0,0}));
    connect(step.active, timer.u) annotation (Line(points={{-4,-1},{-4,-30},{4,
              -30}}, color={255,0,255}));
    connect(step.outPort[1], transition2.inPort)
      annotation (Line(points={{6.5,10},{58,10}}, color={0,0,0}));
    connect(timer.y, greaterEqual.u)
      annotation (Line(points={{27,-30},{34,-30}}, color={0,0,255}));
    connect(greaterEqual.y, transition2.condition) annotation (Line(points={{57,
              -30},{62,-30},{62,-2}}, color={255,0,255}));
    connect(transition2.outPort, initialStep.inPort[1]) annotation (Line(points=
             {{63.5,10},{82,10},{82,32},{-80,32},{-80,10},{-71,10}}, color={0,0,
              0}));
    annotation (experiment(StopTime=5));
  end FirstExample_Variant2;

  model FirstExample_Variant3
    "A variant of the first simple StateGraph example"
    extends Modelica_Icons.Example;
    Modelica_StateGraph.InitialStep initialStep annotation (Placement(
          transformation(extent={{-70,0},{-50,20}}, rotation=0)));
    Modelica_StateGraph.Transition transition1(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-42,0},{-22,20}}, rotation=
              0)));
    Modelica_StateGraph.StepWithSignal step annotation (Placement(
          transformation(extent={{-14,0},{6,20}}, rotation=0)));
    Modelica_StateGraph.TransitionWithSignal transition2 annotation (Placement(
          transformation(extent={{56,0},{76,20}}, rotation=0)));
    Modelica_Blocks.Logical.Timer timer annotation (Placement(transformation(
            origin={-4,-30},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    Modelica_Blocks.Sources.BooleanExpression SetBoolean1(y=timer.y > 1) annotation (Placement(
            transformation(extent={{28,-40},{60,-20}}, rotation=0)));
    Modelica_Blocks.Sources.BooleanExpression SetBoolean2(y=step.active) annotation (Placement(
            transformation(extent={{-68,-40},{-36,-20}}, rotation=0)));
      inner Modelica_StateGraph.StateGraphRoot stateGraphRoot
      annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  equation

    connect(initialStep.outPort[1], transition1.inPort)
      annotation (Line(points={{-49.5,10},{-36,10}}, color={0,0,0}));

    connect(transition1.outPort, step.inPort[1])
      annotation (Line(points={{-30.5,10},{-15,10}}, color={0,0,0}));
    connect(step.active, timer.u) annotation (Line(points={{-4,-1},{-4,-9.5},{
              -4,-18},{-4,-18}}, color={255,0,255}));
    connect(step.outPort[1], transition2.inPort)
      annotation (Line(points={{6.5,10},{62,10}}, color={0,0,0}));
    connect(transition2.outPort, initialStep.inPort[1]) annotation (Line(points=
             {{67.5,10},{82,10},{82,32},{-80,32},{-80,10},{-71,10}}, color={0,0,
              0}));
    connect(SetBoolean1.y, transition2.condition) annotation (Line(points={{
              61.6,-30},{66,-30},{66,-2}}, color={255,0,255}));
    annotation (experiment(StopTime=5));
  end FirstExample_Variant3;

  model ExecutionPaths
    "Example to demonstrate parallel and alternative execution paths"

    extends Modelica_Icons.Example;

    Modelica_StateGraph.InitialStep step0 annotation (Placement(transformation(
            extent={{-140,-100},{-120,-80}}, rotation=0)));
    Modelica_StateGraph.Transition transition1(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-100,-100},{-80,-80}},
            rotation=0)));
    Modelica_StateGraph.Step step1 annotation (Placement(transformation(extent=
              {{-10,-40},{10,-20}}, rotation=0)));
    Modelica_StateGraph.Transition transition2(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{90,-100},{110,-80}},
            rotation=0)));
    Modelica_StateGraph.Step step6 annotation (Placement(transformation(extent=
              {{120,-100},{140,-80}}, rotation=0)));
    Modelica_StateGraph.Step step2 annotation (Placement(transformation(extent=
              {{-98,40},{-78,60}}, rotation=0)));
    Modelica_StateGraph.Transition transition3(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-42,80},{-22,100}},
            rotation=0)));
    Modelica_StateGraph.Transition transition4(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-42,40},{-22,60}}, rotation=
             0)));
    Modelica_StateGraph.Step step3 annotation (Placement(transformation(extent=
              {{-8,80},{12,100}}, rotation=0)));
    Modelica_StateGraph.Step step4 annotation (Placement(transformation(extent=
              {{-8,40},{12,60}}, rotation=0)));
    Modelica_StateGraph.Transition transition5(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{26,80},{46,100}}, rotation=
              0)));
    Modelica_StateGraph.Transition transition6(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{26,40},{46,60}}, rotation=0)));
    Modelica_StateGraph.Step step5 annotation (Placement(transformation(extent=
              {{80,40},{100,60}}, rotation=0)));
    Modelica_Blocks.Sources.RealExpression setReal(y=time)
                            annotation (Placement(transformation(extent={{21,
                -160},{41,-140}}, rotation=0)));
    Modelica_StateGraph.TransitionWithSignal transition7 annotation (Placement(
          transformation(extent={{9,-134},{-11,-114}}, rotation=0)));
    Modelica_Blocks.Sources.BooleanExpression setCondition(y=time > 7)
      annotation (Placement(transformation(extent={{-77,-160},{-19,-140}},
              rotation=0)));
    Modelica_StateGraph.Transition transition4a(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-42,0},{-22,20}}, rotation=
              0)));
    Modelica_StateGraph.Step step4a annotation (Placement(transformation(extent=
             {{-8,0},{12,20}}, rotation=0)));
    Modelica_StateGraph.Transition transition6a(enableTimer=true, waitTime=2)
      annotation (Placement(transformation(extent={{26,0},{46,20}}, rotation=0)));
    Modelica_StateGraph.Temporary.NumericValue NumericValue1 annotation (
        Placement(transformation(extent={{61,-160},{81,-140}}, rotation=0)));
    Modelica_StateGraph.Alternative alternative(nBranches=3) annotation (
        Placement(transformation(extent={{-70,-10},{72,110}}, rotation=0)));
    Modelica_StateGraph.Parallel Parallel1 annotation (Placement(transformation(
            extent={{-154,-50},{152,120}}, rotation=0)));
      inner Modelica_StateGraph.StateGraphRoot stateGraphRoot
      annotation (Placement(transformation(extent={{-160,120},{-140,140}})));
  equation
    connect(transition3.outPort, step3.inPort[1])
      annotation (Line(points={{-30.5,90},{-9,90}}, color={0,0,0}));
    connect(step3.outPort[1], transition5.inPort)
      annotation (Line(points={{12.5,90},{32,90}}, color={0,0,0}));
    connect(transition4.outPort, step4.inPort[1])
      annotation (Line(points={{-30.5,50},{-9,50}}, color={0,0,0}));
    connect(step4.outPort[1], transition6.inPort)
      annotation (Line(points={{12.5,50},{32,50}}, color={0,0,0}));
    connect(transition7.outPort, step0.inPort[1]) annotation (Line(points={{
              -2.5,-124},{-149,-124},{-149,-90},{-141,-90}}, color={0,0,0}));
    connect(step6.outPort[1], transition7.inPort) annotation (Line(points={{
              140.5,-90},{150,-90},{150,-124},{3,-124}}, color={0,0,0}));
    connect(transition4a.outPort, step4a.inPort[1])
      annotation (Line(points={{-30.5,10},{-9,10}}, color={0,0,0}));
    connect(step4a.outPort[1], transition6a.inPort)
      annotation (Line(points={{12.5,10},{32,10}}, color={0,0,0}));
    connect(setCondition.y, transition7.condition) annotation (Line(points={{
              -16.1,-150},{-1,-150},{-1,-136}}, color={255,0,255}));
    connect(setReal.y, NumericValue1.Value) annotation (Line(
          points={{42,-150},{59,-150}},
          color={0,0,255}));
    connect(transition3.inPort, alternative.split[1])  annotation (Line(points={{-36,90},
              {-55.09,90}},           color={0,0,0}));
    connect(transition4.inPort, alternative.split[2])  annotation (Line(points={{-36,50},
              {-55.09,50}},           color={0,0,0}));
    connect(transition4a.inPort, alternative.split[3])  annotation (Line(points={{-36,10},
              {-45.0125,10},{-45.0125,10},{-55.09,10}},          color={0,0,0}));
    connect(transition5.outPort, alternative.join[1])  annotation (Line(points={{37.5,90},
              {57.09,90}},            color={0,0,0}));
    connect(transition6.outPort, alternative.join[2])  annotation (Line(points={{37.5,50},
              {57.09,50}},            color={0,0,0}));
    connect(transition6a.outPort, alternative.join[3])  annotation (Line(points={{37.5,10},
              {46.7625,10},{46.7625,10},{57.09,10}},           color={0,0,0}));
    connect(step2.outPort[1], alternative.inPort)  annotation (Line(points={{
              -77.5,50},{-72.13,50}}, color={0,0,0}));
    connect(alternative.outPort, step5.inPort[1])
      annotation (Line(points={{73.42,50},{79,50}}, color={0,0,0}));
    connect(step2.inPort[1], Parallel1.split[1]) annotation (Line(points={{-99,
              50},{-118,50},{-118,78},{-119.575,78},{-119.575,77.5}}, color={0,
              0,0}));
    connect(step1.outPort[1], Parallel1.join[2]) annotation (Line(points={{10.5,
              -30},{118,-30},{118,-7.5},{117.575,-7.5}}, color={0,0,0}));
    connect(step0.outPort[1], transition1.inPort) annotation (Line(points={{
              -119.5,-90},{-94,-90}}, color={0,0,0}));
    connect(transition2.outPort, step6.inPort[1]) annotation (Line(points={{
              101.5,-90},{119,-90}}, color={0,0,0}));
    connect(transition1.outPort, Parallel1.inPort) annotation (Line(points={{
              -88.5,-90},{-70,-90},{-70,-64},{-174,-64},{-174,35},{-158.59,35}},
            color={0,0,0}));
    connect(Parallel1.outPort, transition2.inPort) annotation (Line(points={{
              155.06,35},{168,35},{168,-60},{80,-60},{80,-90},{96,-90}}, color=
              {0,0,0}));
    connect(step5.outPort[1], Parallel1.join[1]) annotation (Line(points={{
              100.5,50},{116,50},{116,77.5},{117.575,77.5}}, color={0,0,0}));
    connect(Parallel1.split[2], step1.inPort[1]) annotation (Line(points={{
              -119.575,-7.5},{-118,-8},{-118,-30},{-11,-30}}, color={0,0,0}));
    annotation (
      Documentation(info="<HTML>
<p>
This is an example to demonstrate in which way <b>parallel</b> activities
can be modelled by a StateGraph. When transition1 fires
(after 1 second), two branches are executed in parallel.
After 6 seconds the two branches are synchronized in order to arrive
at step6.
</p>
<p>
Before simulating the model, try to figure out whether which branch
of the alternative sequence is executed. Note, that alternatives
have priorities according to the port index (alternative.split[1]
has a higher priority to fire as alternative.split[2]).
</p>
</html>"),      experiment(StopTime=15));
  end ExecutionPaths;

  model ShowCompositeStep
    "Example to demonstrate parallel activities described by a StateGraph"

    extends Modelica_Icons.Example;

    Utilities.CompositeStep compositeStep
                                     annotation (Placement(transformation(
              extent={{-10,5},{20,35}}, rotation=0)));
    Modelica_StateGraph.InitialStep step0 annotation (Placement(transformation(
            extent={{-89,-10},{-69,10}}, rotation=0)));
    Modelica_StateGraph.Transition transition1(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-59,-10},{-39,10}},
            rotation=0)));
    Modelica_StateGraph.Step step1 annotation (Placement(transformation(extent=
              {{-4,-30},{16,-10}}, rotation=0)));
    Modelica_StateGraph.Transition transition2(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{45,-10},{65,10}}, rotation=
              0)));
    Modelica_StateGraph.Step step6 annotation (Placement(transformation(extent=
              {{71,-10},{91,10}}, rotation=0)));
    Modelica_StateGraph.TransitionWithSignal transition7 annotation (Placement(
          transformation(extent={{10,-70},{-10,-50}}, rotation=0)));
    Modelica_StateGraph.Parallel Parallel1 annotation (Placement(transformation(
            extent={{-30,-40},{36,40}}, rotation=0)));
    Modelica_Blocks.Sources.BooleanExpression setCondition(y=time > 7)
      annotation (Placement(transformation(extent={{-40,-90},{-10,-70}},
              rotation=0)));
      inner Modelica_StateGraph.StateGraphRoot stateGraphRoot
      annotation (Placement(transformation(extent={{-90,50},{-70,70}})));
  equation
    connect(step0.outPort[1], transition1.inPort)
      annotation (Line(points={{-68.5,0},{-53,0}}, color={0,0,0}));
    connect(transition7.outPort, step0.inPort[1]) annotation (Line(points={{
              -1.5,-60},{-98,-60},{-98,0},{-90,0}}, color={0,0,0}));
    connect(step6.outPort[1], transition7.inPort) annotation (Line(points={{
              91.5,0},{96,0},{96,-60},{4,-60}}, color={0,0,0}));
    connect(transition2.outPort, step6.inPort[1]) annotation (Line(
          points={{56.5,0},{70,0}},
          color={0,0,0}));
    connect(transition1.outPort, Parallel1.inPort) annotation (Line(points={{-47.5,0},
              {-30.99,0}},          color={0,0,0}));
    connect(Parallel1.outPort, transition2.inPort) annotation (Line(points={{36.66,0},
              {51,0}},          color={0,0,0}));
    connect(compositeStep.inPort, Parallel1.split[1])
                                                 annotation (Line(points={{-11,20},
              {-22.575,20}},     color={0,0,0}));
    connect(compositeStep.outPort, Parallel1.join[1])
                                                 annotation (Line(points={{20.5,20},
              {28.575,20}},     color={0,0,0}));
    connect(step1.inPort[1], Parallel1.split[2]) annotation (Line(points={{-5,-20},
              {-10,-20},{-10,-20},{-14,-20},{-14,-20},{-22.575,-20}},
                                   color={0,0,0}));
    connect(step1.outPort[1], Parallel1.join[2]) annotation (Line(points={{16.5,
              -20},{28.575,-20}}, color={0,0,0}));
    connect(setCondition.y, transition7.condition) annotation (Line(points={{
              -8.5,-80},{0,-80},{0,-72}}, color={255,0,255}));
    annotation (
      Documentation(info="<HTML>
<p>
This is the same example as \"ExecutionPaths\". The only difference
is that the alternative paths are included in a \"CompositeStep\".
</p>
</html>"), experiment(StopTime=15));
  end ShowCompositeStep;

  model ShowExceptions
    "Example to demonstrate how a hierarchically structured StateGraph can suspend and resume actions on different levels"

    extends Modelica_Icons.Example;

    Utilities.CompositeStep1 compositeStep
                                annotation (Placement(transformation(extent={{
                -20,25},{10,55}}, rotation=0)));
    Modelica_StateGraph.InitialStep initialStep annotation (Placement(
          transformation(extent={{-80,30},{-60,50}}, rotation=0)));
    Modelica_StateGraph.Transition transition1(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{-50,30},{-30,50}}, rotation=
             0)));
    Modelica_StateGraph.Transition transition2(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{20,30},{40,50}}, rotation=0)));
    Modelica_StateGraph.Transition transition3(enableTimer=true, waitTime=2)
      annotation (Placement(transformation(extent={{-55,-30},{-35,-10}},
            rotation=0)));
    Modelica_StateGraph.Step step1 annotation (Placement(transformation(extent=
              {{-24,-30},{-4,-10}}, rotation=0)));
    Modelica_StateGraph.Transition transition4(enableTimer=true, waitTime=1)
      annotation (Placement(transformation(extent={{10,-30},{30,-10}}, rotation=
             0)));
      inner Modelica_StateGraph.StateGraphRoot stateGraphRoot
      annotation (Placement(transformation(extent={{-90,-80},{-70,-60}})));
  equation

    connect(transition1.outPort, compositeStep.inPort)
      annotation (Line(points={{-38.5,40},{-21,40}}, color={0,0,0}));
    connect(initialStep.outPort[1], transition1.inPort)
      annotation (Line(points={{-59.5,40},{-44,40}}, color={0,0,0}));
    connect(compositeStep.outPort, transition2.inPort)
      annotation (Line(points={{10.5,40},{26,40}}, color={0,0,0}));
    connect(transition2.outPort, initialStep.inPort[1]) annotation (Line(points=
             {{31.5,40},{46,40},{46,80},{-90,80},{-90,40},{-81,40}}, color={0,0,
              0}));
    connect(compositeStep.suspend[1], transition3.inPort)
                                                  annotation (Line(points={{-12.5,
              24.5},{-12.5,10},{-60,10},{-60,-20},{-49,-20}},
                                                            color={0,0,0}));
    connect(transition3.outPort, step1.inPort[1]) annotation (Line(points={{
              -43.5,-20},{-25,-20}}, color={0,0,0}));
    connect(step1.outPort[1], transition4.inPort)
      annotation (Line(points={{-3.5,-20},{16,-20}}, color={0,0,0}));
    connect(transition4.outPort, compositeStep.resume[1])
                                                  annotation (Line(points={{21.5,
              -20},{40,-20},{40,10},{2.5,10},{2.5,24}},  color={0,0,0}));
    annotation (
      Documentation(info="<HTML>
<p>
CompositeStep \"compositeStep\" is a hierarchical StateGraph consisting of
two other subgraphs. Whenever component \"compositeStep\" is suspended,
all steps with in \"compositeStep\" are deactivated. By entering \"compositeStep\"
via its \"resume\" port, all steps within \"compositeStep\" are activated
according to their setting before leaving the \"compositeStep\" via its
\"suspend\" port.
</p>
</html>"),experiment(StopTime=20));
  end ShowExceptions;

  model ControlledTanks
    "Demonstrating the controller of a tank filling/emptying system"
    extends Modelica_Icons.Example;
    Utilities.TankController tankController
      annotation (Placement(transformation(extent={{-50,-20},{-10,20}},
              rotation=0)));
    Modelica_StateGraph.Temporary.RadioButton start(reset={stop.on,shut.on},
        buttonTimeTable={1,13,15,19}) annotation (Placement(transformation(
            extent={{-90,20},{-70,40}}, rotation=0)));
    Modelica_StateGraph.Temporary.RadioButton stop(reset={start.on,shut.on},
        buttonTimeTable={13,15,19,21}) annotation (Placement(transformation(
            extent={{-90,-10},{-70,10}}, rotation=0)));
    Modelica_StateGraph.Temporary.RadioButton shut(reset={start.on,stop.on},
        buttonTimeTable={21,100}) annotation (Placement(transformation(extent={
              {-90,-40},{-70,-20}}, rotation=0)));

    Utilities.Tank tank1 annotation (Placement(transformation(extent={{10,20},{
                60,70}}, rotation=0)));
    Utilities.Tank tank2 annotation (Placement(transformation(extent={{34,-60},
                {84,-10}}, rotation=0)));
    Utilities.valve valve1
      annotation (Placement(transformation(
            origin={22.5,72},
            extent={{-5.5,-5.5},{5.5,5.5}},
            rotation=270)));
    Utilities.Source source annotation (Placement(transformation(extent={{12.5,
                80.5},{32.5,100.5}}, rotation=0)));
    Utilities.valve valve2 annotation (Placement(transformation(
            origin={46.5,13},
            extent={{-7,-8},{7,8}},
            rotation=270)));
    Utilities.valve valve3
      annotation (Placement(transformation(
            origin={73.5,-77},
            extent={{-7,-8},{7,8}},
            rotation=270)));
      inner Modelica_StateGraph.StateGraphRoot stateGraphRoot
      annotation (Placement(transformation(extent={{-90,75},{-70,95}})));
  equation
    connect(tank1.outflow1, valve2.outflow1) annotation (Line(
          points={{50,33.75},{50,26.875},{46.5,26.875},{46.5,16.5}},
          color={0,0,0},
          thickness=0.5));
    connect(tank2.inflow1, valve2.inflow1) annotation (Line(
          points={{46.5,-18.75},{46.5,9.5}},
          color={0,0,0},
          thickness=0.5));
    connect(tank2.outflow1, valve3.outflow1) annotation (Line(
          points={{74,-46.25},{74,-73.5},{73.5,-73.5}},
          color={0,0,0},
          thickness=0.5));
    connect(tank1.inflow1, valve1.inflow1) annotation (Line(
          points={{22.5,61.25},{22.5,69.25}},
          color={0,0,0},
          thickness=0.5));
    connect(shut.on, tankController.shut) annotation (Line(points={{-69,-30},{
              -62,-30},{-62,-12},{-52,-12}}, color={255,0,255}));
    connect(stop.on, tankController.stop) annotation (Line(points={{-69,0},{-52,
              0}}, color={255,0,255}));
    connect(start.on, tankController.start) annotation (Line(points={{-69,30},{
              -60,30},{-60,12},{-52,12}}, color={255,0,255}));
    connect(tank1.levelSensor, tankController.level1) annotation (Line(points={
              {17.25,40},{-30,40},{-30,60},{-97,60},{-97,-50},{-42,-50},{-42,
              -22}}, color={0,0,255}));
    connect(tank2.levelSensor, tankController.level2) annotation (Line(points={
              {41.25,-40},{-18,-40},{-18,-22}}, color={0,0,255}));
    connect(tankController.valve1, valve1.valveControl) annotation (Line(points=
             {{-9,12},{10,12},{10,72},{18.1,72}}, color={255,0,255}));
    connect(tankController.valve2, valve2.valveControl) annotation (Line(points={{-9,0},{
              30,0},{30,13},{40.1,13}},         color={255,0,255}));
    connect(tankController.valve3, valve3.valveControl) annotation (Line(points=
             {{-9,-12},{23,-12},{23,-77},{67.1,-77}}, color={255,0,255}));

    connect(source.outflow1, valve1.outflow1) annotation (Line(
          points={{22.5,85.5},{22.5,74.75}},
          color={0,0,0},
          thickness=0.5));

    annotation (experiment(StopTime=100),
      Documentation(info="<html>
<p>
With this example the controller of a tank filling/emptying system
is demonstrated. This example is from Dressler (2004),
see <a href=\"modelica://Modelica.StateGraph.UsersGuide.Literature\">Literature</a>.
The basic operation is to fill and empty the two tanks:
</p>
<ol>
<li> Valve 1 is opened and tank 1 is filled.</li>
<li> When tank 1 reaches its fill level limit,
     valve 1 is closed. </li>
<li> After a waiting time, valve 2 is
     opened and the fluid flows from tank 1 into tank 2.</li>
<li> When tank 1 is empty, valve 2 is closed. </li>
<li> After a waiting time, valve 3 is opened and
     the fluid flows out of tank 2</li>
<li> When tank 3 is empty, valve 3 is closed</li>
</ol>
<p>
The above \"normal\" process can be influenced by three
buttons:
</p>
<ul>
<li> Button <b>start</b> starts the above process.
     When this button is pressed after a \"stop\" or
     \"shut\" operation, the process operation continues.
     </li>
<li> Button <b>stop</b> stops the above process by
     closing all valves. Then, the controller waits for
     further input (either \"start\" or \"shut\" operation).</li>
<li> Button <b>shut</b> is used to shutdown the process,
     by emptying at once both tanks. When this is achieved,
     the process goes back to its start configuration.
     Clicking on \"start\", restarts the process.</li>
</ul>

</html>"));
  end ControlledTanks;

  package Utilities "Utility components for the examples"
    extends Modelica_Icons.UtilitiesPackage;

    model TankController "Controller for tank system"
      extends Modelica_StateGraph.Interfaces.PartialStateGraphIcon;
      parameter Modelica_StateGraph.Temporary.SetRealParameter limit=0.98
        "Limit level of tank 1" annotation (Placement(transformation(extent={{-64,
                76},{-44,96}}, rotation=0)));
      parameter Modelica_StateGraph.Temporary.SetRealParameter waitTime=3
        "Wait time" annotation (Placement(transformation(extent={{-91,76},{-71,
                96}}, rotation=0)));

      Modelica_StateGraph.InitialStep s1(nIn=2) annotation (Placement(
            transformation(extent={{-72,30},{-52,50}}, rotation=0)));
      MakeProduct makeProduct(limit=limit, waitTime=waitTime)
        annotation (Placement(transformation(extent={{-20,25},{10,55}},
                rotation=0)));
      Modelica_StateGraph.Transition T1(condition=start) annotation (Placement(
            transformation(extent={{-50,50},{-30,30}}, rotation=0)));
      Modelica_StateGraph.Transition T2(condition=level2 < 0.001) annotation (
          Placement(transformation(extent={{27,50},{47,30}}, rotation=0)));
      Modelica_StateGraph.Transition T3(condition=stop) annotation (Placement(
            transformation(
            origin={-23,-1},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica_StateGraph.Step s2(nOut=2) annotation (Placement(transformation(
              extent={{-50,-60},{-30,-40}}, rotation=0)));
      Modelica_StateGraph.Transition T4(condition=start) annotation (Placement(
            transformation(
            origin={10,-1},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica_StateGraph.Transition T5(condition=shut) annotation (Placement(
            transformation(extent={{-6,-60},{14,-40}}, rotation=0)));
      Modelica_StateGraph.Step emptyTanks annotation (Placement(transformation(
              extent={{22,-60},{42,-40}}, rotation=0)));
      Modelica_StateGraph.Transition T6(condition=level1 + level2 < 0.001)
        annotation (Placement(transformation(extent={{45,-60},{65,-40}},
              rotation=0)));
      Modelica_Blocks.Interfaces.BooleanInput start
        annotation (Placement(transformation(extent={{-120,50},{-100,70}},
                rotation=0)));
      Modelica_Blocks.Interfaces.BooleanInput stop
        annotation (Placement(transformation(extent={{-120,-10},{-100,10}},
                rotation=0)));
      Modelica_Blocks.Interfaces.BooleanInput shut
        annotation (Placement(transformation(extent={{-120,-70},{-100,-50}},
                rotation=0)));
      Modelica_Blocks.Interfaces.RealInput level1
        annotation (Placement(transformation(
              origin={-60,-110},
              extent={{-10,-10},{10,10}},
              rotation=90)));
      Modelica_Blocks.Interfaces.RealInput level2
        annotation (Placement(transformation(
              origin={60,-110},
              extent={{-10,-10},{10,10}},
              rotation=90)));
      Modelica_Blocks.Interfaces.BooleanOutput valve1
        annotation (Placement(transformation(extent={{100,55},{110,65}},
                rotation=0)));
      Modelica_Blocks.Interfaces.BooleanOutput valve2
        annotation (Placement(transformation(extent={{100,-5},{110,5}},
                rotation=0)));
      Modelica_Blocks.Interfaces.BooleanOutput valve3
        annotation (Placement(transformation(extent={{100,-65},{110,-55}},
                rotation=0)));
      Modelica_Blocks.Sources.BooleanExpression setValve1(y=makeProduct.fillTank1.active)
        annotation (Placement(transformation(extent={{20,73},{80,92}}, rotation=
                 0)));
      Modelica_Blocks.Sources.BooleanExpression setValve2(y=makeProduct.fillTank2.active or emptyTanks.active)
        annotation (Placement(transformation(extent={{-25,-89},{80,-68}},
                rotation=0)));
      Modelica_Blocks.Sources.BooleanExpression setValve3(y=makeProduct.emptyTank2.active or emptyTanks.active)
        annotation (Placement(transformation(extent={{-26,-100},{80,-80}},
                rotation=0)));
    equation

      connect(s1.outPort[1], T1.inPort)
                                     annotation (Line(
            points={{-51.5,40},{-44,40}},
            color={0,0,0}));
      connect(T1.outPort, makeProduct.inPort) annotation (Line(
            points={{-38.5,40},{-21,40}},
            color={0,0,0}));
      connect(makeProduct.outPort, T2.inPort) annotation (Line(
            points={{10.5,40},{33,40}},
            color={0,0,0}));
      connect(T5.outPort, emptyTanks.inPort[1])
                                             annotation (Line(
            points={{5.5,-50},{21,-50}},
            color={0,0,0}));
      connect(emptyTanks.outPort[1], T6.inPort)
                                             annotation (Line(
            points={{42.5,-50},{51,-50}},
            color={0,0,0}));
      connect(setValve1.y, valve1)
        annotation (Line(points={{83,82.5},{90,82.5},{90,60},{105,60}}, color={
                255,0,255}));
      connect(setValve2.y, valve2)
        annotation (Line(points={{85.25,-78.5},{90,-78.5},{90,0},{105,0}},
              color={255,0,255}));
      connect(setValve3.y, valve3) annotation (Line(points={{85.3,-90},{95,-90},
                {95,-60},{105,-60}}, color={255,0,255}));
      connect(makeProduct.suspend[1], T3.inPort)
                                              annotation (Line(points={{-12.5,
                24.5},{-12.5,12},{-23,12},{-23,3}}, color={0,0,0}));
      connect(T3.outPort, s2.inPort[1])
                                     annotation (Line(points={{-23,-2.5},{-23,
                -20},{-66,-20},{-66,-50},{-51,-50}}, color={0,0,0}));
      connect(T4.outPort, makeProduct.resume[1])
                                              annotation (Line(points={{10,0.5},
                {10,15},{2.5,15},{2.5,24}}, color={0,0,0}));
      connect(level1, makeProduct.level1) annotation (Line(points={{-60,-110},{
                -60,-80},{-80,-80},{-80,20},{-30,20},{-30,28},{-22,28}}, color=
                {0,0,255}));
      connect(s2.outPort[1], T5.inPort) annotation (Line(points={{-29.5,-49.75},
                {-30,-49.75},{-30,-50},{0,-50}}, color={0,0,0}));
      connect(s2.outPort[2], T4.inPort) annotation (Line(points={{-29.5,-50.25},
                {-29,-50},{-8,-50},{-8,-25},{10,-25},{10,-5}}, color={0,0,0}));
      connect(T2.outPort, s1.inPort[1]) annotation (Line(points={{38.5,40},{70,
                40},{70,70},{-84,70},{-84,40},{-73,40},{-73,40.5}}, color={0,0,
                0}));
      connect(T6.outPort, s1.inPort[2]) annotation (Line(points={{56.5,-50},{70,
                -50},{70,70},{-84,70},{-84,40},{-74,40},{-73,39.5}}, color={0,0,
                0}));
      annotation (
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,0})}),
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Text(
                extent={{-100,68},{-32,54}},
                lineColor={0,0,0},
                textString="start"),
              Text(
                extent={{-100,6},{-32,-8}},
                lineColor={0,0,0},
                textString="stop"),
              Text(
                extent={{-100,-54},{-32,-68}},
                lineColor={0,0,0},
                textString="shut"),
              Text(
                extent={{-94,-82},{-18,-96}},
                lineColor={0,0,0},
                textString="level1"),
              Text(
                extent={{24,-84},{96,-98}},
                lineColor={0,0,0},
                textString="level2"),
              Text(
                extent={{31,68},{99,54}},
                lineColor={0,0,0},
                textString="valve1"),
              Text(
                extent={{33,9},{101,-5}},
                lineColor={0,0,0},
                textString="valve2"),
              Text(
                extent={{34,-53},{102,-67}},
                lineColor={0,0,0},
                textString="valve3")}));
    end TankController;

    model MakeProduct
      "State machine defining the time instants when to fill or empty a tank"
      extends Modelica_StateGraph.PartialCompositeStep;
      parameter Modelica_StateGraph.Temporary.SetRealParameter limit=0.98
        "Limit level of tank 1" annotation (Placement(transformation(extent={{-60,
                40},{-20,60}}, rotation=0)));
      parameter Modelica_StateGraph.Temporary.SetRealParameter waitTime=3
        "Wait time" annotation (Placement(transformation(extent={{-120,40},{-80,
                60}}, rotation=0)));

      Modelica_Blocks.Interfaces.RealInput level1
        annotation (Placement(transformation(extent={{-190,-140},{-150,-100}},
                rotation=0)));
      Modelica_StateGraph.Step fillTank1 annotation (Placement(transformation(
              extent={{-140,-10},{-120,10}}, rotation=0)));
      Modelica_StateGraph.Transition T1(condition=level1 > limit) annotation (
          Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
      Modelica_StateGraph.Step fillTank2 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica_StateGraph.Transition T3(condition=level1 < 0.001) annotation (
          Placement(transformation(extent={{20,-10},{40,10}}, rotation=0)));
      Modelica_StateGraph.Step emptyTank2 annotation (Placement(transformation(
              extent={{120,-10},{140,10}}, rotation=0)));
      Modelica_StateGraph.Step wait1 annotation (Placement(transformation(
              extent={{-80,-10},{-60,10}}, rotation=0)));
      Modelica_StateGraph.Transition T2(enableTimer=true, waitTime=waitTime)
        annotation (Placement(transformation(extent={{-50,-10},{-30,10}},
              rotation=0)));
      Modelica_StateGraph.Step wait2 annotation (Placement(transformation(
              extent={{54,-10},{74,10}}, rotation=0)));
      Modelica_StateGraph.Transition T4(enableTimer=true, waitTime=waitTime)
        annotation (Placement(transformation(extent={{82,-10},{102,10}},
              rotation=0)));
    equation
      connect(fillTank1.inPort[1], inPort)
                                        annotation (Line(
            points={{-141,0},{-160,0}},
            color={0,0,0}));
      connect(fillTank1.outPort[1], T1.inPort)
                                            annotation (Line(
            points={{-119.5,0},{-104,0}},
            color={0,0,0}));
      connect(fillTank2.outPort[1], T3.inPort)
                                            annotation (Line(
            points={{10.5,0},{26,0}},
            color={0,0,0}));
      connect(emptyTank2.outPort[1], outPort)
                                           annotation (Line(
            points={{140.5,0},{155,0}},
            color={0,0,0}));
      connect(wait1.outPort[1], T2.inPort)
                                        annotation (Line(points={{-59.5,0},{-44,
                0}}, color={0,0,0}));
      connect(T2.outPort, fillTank2.inPort[1])
                                            annotation (Line(points={{-38.5,0},
                {-11,0}}, color={0,0,0}));
      connect(T1.outPort, wait1.inPort[1])
                                        annotation (Line(points={{-98.5,0},{-81,
                0}}, color={0,0,0}));
      connect(wait2.outPort[1], T4.inPort)
                                        annotation (Line(points={{74.5,0},{88,0}},
              color={0,0,0}));
      connect(T3.outPort, wait2.inPort[1])
        annotation (Line(points={{31.5,0},{53,0}}, color={0,0,0}));
      connect(T4.outPort,emptyTank2.inPort[1])
                                             annotation (Line(points={{93.5,0},
                {119,0}}, color={0,0,0}));
    end MakeProduct;

    connector Inflow1
      "Inflow connector (this is a copy from Isolde Dressler's master thesis project)"

        import Units = Modelica_SIunits;

        input Units.VolumeFlowRate Fi "inflow";
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Polygon(
                points={{-100,-100},{0,100},{100,-100},{-100,-100}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
    end Inflow1;

    connector Inflow2
      "Inflow connector (this is a copy from Isolde Dressler's master thesis project)"

        import Units = Modelica_SIunits;

        output Units.VolumeFlowRate Fi "inflow";
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Polygon(
                points={{-100,-100},{0,100},{100,-100},{-100,-100}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
    end Inflow2;

    connector Outflow1
      "Outflow connector (this is a copy from Isolde Dressler's master thesis project)"

        import Units = Modelica_SIunits;

        output Units.VolumeFlowRate Fo "outflow";
      input Boolean open "valve open";
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Polygon(
                points={{-100,100},{0,-100},{100,100},{-100,100}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
    end Outflow1;

    connector Outflow2
      "Outflow connector (this is a copy from Isolde Dressler's master thesis project)"

        import Units = Modelica_SIunits;

        input Units.VolumeFlowRate Fo "outflow";
      output Boolean open "valve open";
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Polygon(
                points={{-100,100},{0,-100},{100,100},{-100,100}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
    end Outflow2;

    model valve
      "Simple valve model (this is a copy from Isolde Dressler's master thesis project)"

      Modelica_Blocks.Interfaces.BooleanInput valveControl
        annotation (Placement(transformation(
              origin={0,-80},
              extent={{-20,-20},{20,20}},
              rotation=90)));
      Inflow2 inflow1 annotation (Placement(transformation(
            origin={50,0},
            extent={{-50,-50},{50,50}},
            rotation=90)));
      Outflow2 outflow1 annotation (Placement(transformation(
            origin={-50,0},
            extent={{-50,-50},{50,50}},
            rotation=90)));
    equation
      outflow1.Fo = inflow1.Fi;
      outflow1.open = valveControl;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
          Line(points={{0,-60},{0,0}}, color={255,0,255})}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
              Line(
                points={{20,20},{20,20}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-131,125},{136,67}},
                lineColor={0,0,255},
                textString="%name"),
              Line(
                points={{0,0},{0,-60}},
                color={255,0,255})}));
    end valve;

    model Tank
      "Simple tank model (this is a copy from Isolde Dressler's master thesis project)"

      Modelica_Blocks.Interfaces.RealOutput levelSensor
        annotation (Placement(transformation(extent={{-61,-30},{-81,-10}},
                rotation=0)));

      Inflow1 inflow1 annotation (Placement(transformation(extent={{-55,60},{-45,
                70}}, rotation=0)));
      Outflow1 outflow1 annotation (Placement(transformation(extent={{55,-50},{
                65,-40}}, rotation=0)));
      Real level(start=0,fixed=true) "Tank level in % of max height";
      parameter Real A=1 "Ground area of tank in m^2";
      parameter Real a=0.2 "Area of drain hole in m^2";
      parameter Real hmax=1 "Max height of tank in m";
      constant Real g=Modelica_Constants.g_n;
    equation
      der(level) = (inflow1.Fi - outflow1.Fo)/(hmax*A);
      if outflow1.open then
        outflow1.Fo = sqrt(max(0,2*g*hmax*level))*a;
      else
        outflow1.Fo = 0;
      end if;
      levelSensor = level;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
              Text(
                extent={{-122,-82},{88,-42}},
                textString="%name",
                lineColor={0,0,255}),
              Rectangle(
                extent={{-60,60},{80,-40}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent=DynamicSelect({{-60,-40},{-60,-40}}, {{-60,-40},{80,(-40
                     + level*100)}}),
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={191,0,95})}));
    end Tank;

    model Source
      "Simple source model (this is a copy from Isolde Dressler's master thesis project)"

      Outflow1 outflow1 annotation (Placement(transformation(extent={{-10,-60},
                {10,-40}}, rotation=0)));
      parameter Real maxflow=1 "maximal flow out of source";
    equation
      if outflow1.open then
        outflow1.Fo = maxflow;
      else
        outflow1.Fo = 0;
      end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                extent={{-80,40},{80,-40}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-144,54},{152,114}},
                textString="%name",
                lineColor={0,0,255})}));
    end Source;

    model CompositeStep
      "State machine demonstrating a composite step (used in StateGraph.Examples.ShowCompositeStep)"
      extends Modelica_StateGraph.PartialCompositeStep;
      Modelica_StateGraph.Transition transition3(enableTimer=true, waitTime=1)
        annotation (Placement(transformation(extent={{-64,50},{-44,70}},
              rotation=0)));
      Modelica_StateGraph.Transition transition4(enableTimer=true, waitTime=1)
        annotation (Placement(transformation(extent={{-64,-10},{-44,10}},
              rotation=0)));
      Modelica_StateGraph.Step step3 annotation (Placement(transformation(
              extent={{-10,50},{10,70}}, rotation=0)));
      Modelica_StateGraph.Step step4 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica_StateGraph.Transition transition5(enableTimer=true, waitTime=2)
        annotation (Placement(transformation(extent={{36,50},{56,70}}, rotation=
               0)));
      Modelica_StateGraph.Transition transition6(enableTimer=true, waitTime=2)
        annotation (Placement(transformation(extent={{36,-10},{56,10}},
              rotation=0)));
      Modelica_StateGraph.Transition transition4a(enableTimer=true, waitTime=1)
        annotation (Placement(transformation(extent={{-64,-70},{-44,-50}},
              rotation=0)));
      Modelica_StateGraph.Step step4a annotation (Placement(transformation(
              extent={{-10,-70},{10,-50}}, rotation=0)));
      Modelica_StateGraph.Transition transition6a(enableTimer=true, waitTime=2)
        annotation (Placement(transformation(extent={{36,-70},{56,-50}},
              rotation=0)));
      Modelica_StateGraph.Step initStep annotation (Placement(transformation(
              extent={{-140,-10},{-120,10}}, rotation=0)));
      Modelica_StateGraph.Step exitStep annotation (Placement(transformation(
              extent={{120,-10},{140,10}}, rotation=0)));
      Modelica_StateGraph.Alternative Alternative1(nBranches=3) annotation (
          Placement(transformation(extent={{-98,-90},{98,90}}, rotation=0)));
    equation
      connect(transition3.outPort, step3.inPort[1])
        annotation (Line(points={{-52.5,60},{-11,60}}, color={0,0,0}));
      connect(step3.outPort[1], transition5.inPort)
        annotation (Line(points={{10.5,60},{42,60}}, color={0,0,0}));
      connect(transition4.outPort, step4.inPort[1])
        annotation (Line(points={{-52.5,0},{-11,0}}, color={0,0,0}));
      connect(step4.outPort[1], transition6.inPort)
        annotation (Line(points={{10.5,0},{42,0}}, color={0,0,0}));
      connect(transition4a.outPort, step4a.inPort[1])
        annotation (Line(points={{-52.5,-60},{-11,-60}}, color={0,0,0}));
      connect(step4a.outPort[1], transition6a.inPort)
        annotation (Line(points={{10.5,-60},{42,-60}}, color={0,0,0}));
      connect(initStep.inPort[1], inPort)
        annotation (Line(points={{-141,0},{-160,0}}, color={0,0,0}));
      connect(exitStep.outPort[1], outPort)
        annotation (Line(points={{140.5,0},{155,0}}, color={0,0,0}));
      connect(initStep.outPort[1], Alternative1.inPort) annotation (Line(points={{-119.5,
                0},{-100.94,0}},         color={0,0,0}));
      connect(Alternative1.outPort, exitStep.inPort[1])
        annotation (Line(points={{99.96,0},{119,0}}, color={0,0,0}));
      connect(transition3.inPort, Alternative1.split[1]) annotation (Line(
              points={{-58,60},{-77.42,60}}, color={0,0,0}));
      connect(transition4.inPort, Alternative1.split[2]) annotation (Line(
              points={{-58,0},{-67.975,0},{-77.42,0}},
                                 color={0,0,0}));
      connect(transition4a.inPort, Alternative1.split[3]) annotation (Line(
              points={{-58,-60},{-67.975,-60},{-77.42,-60}},
              color={0,0,0}));
      connect(transition5.outPort, Alternative1.join[1]) annotation (Line(
              points={{47.5,60},{77.42,60}}, color={0,0,0}));
      connect(transition6.outPort, Alternative1.join[2]) annotation (Line(
              points={{47.5,0},{60.725,0},{77.42,0}},
                                 color={0,0,0}));
      connect(transition6a.outPort, Alternative1.join[3]) annotation (Line(
              points={{47.5,-60},{60.725,-60},{77.42,-60}},              color=
                {0,0,0}));
    end CompositeStep;

    model CompositeStep1
      "Composite step used to demonstrate exceptions (in StateGraph.Examples.ShowExceptions)"
      extends Modelica_StateGraph.PartialCompositeStep;
      Modelica_StateGraph.Transition transition1(
        enableTimer=false,
        waitTime=0,
        condition=time > 8) annotation (Placement(transformation(extent={{-60,
                20},{-40,40}}, rotation=0)));
      Modelica_StateGraph.Step initStep annotation (Placement(transformation(
              extent={{-140,-10},{-120,10}}, rotation=0)));
      Modelica_StateGraph.Step exitStep annotation (Placement(transformation(
              extent={{110,-10},{130,10}}, rotation=0)));
      CompositeStep2 compositeStep11(waitTime=3)
                                           annotation (Placement(transformation(
                extent={{-20,15},{10,45}}, rotation=0)));
      CompositeStep2 compositeStep12(waitTime=2)
                                           annotation (Placement(transformation(
                extent={{-20,-45},{10,-15}}, rotation=0)));
      Modelica_StateGraph.Transition transition2(
        condition=time > 4,
        enableTimer=false,
        waitTime=0) annotation (Placement(transformation(extent={{-61,-40},{-41,
                -20}}, rotation=0)));
      Modelica_StateGraph.Transition transition3(enableTimer=false, waitTime=0)
        annotation (Placement(transformation(extent={{29,20},{49,40}}, rotation=
               0)));
      Modelica_StateGraph.Transition transition4(enableTimer=false, waitTime=0)
        annotation (Placement(transformation(extent={{29,-40},{49,-20}},
              rotation=0)));
      Modelica_StateGraph.Alternative Alternative1 annotation (Placement(
            transformation(extent={{-100,-60},{89,60}}, rotation=0)));
    equation
      connect(exitStep.outPort[1], outPort)
        annotation (Line(points={{130.5,0},{155,0}}, color={0,0,0}));
      connect(initStep.inPort[1], inPort)
        annotation (Line(points={{-141,0},{-160,0}}, color={0,0,0}));
      connect(transition1.outPort, compositeStep11.inPort)
        annotation (Line(points={{-48.5,30},{-21,30}}, color={0,0,0}));
      connect(transition2.outPort, compositeStep12.inPort)
                                                     annotation (Line(points={{
                -49.5,-30},{-21,-30}}, color={0,0,0}));
      connect(compositeStep11.outPort, transition3.inPort)
        annotation (Line(points={{10.5,30},{35,30}}, color={0,0,0}));
      connect(compositeStep12.outPort, transition4.inPort)
                                                     annotation (Line(points={{
                10.5,-30},{35,-30}}, color={0,0,0}));
      connect(initStep.outPort[1], Alternative1.inPort) annotation (Line(points=
               {{-119.5,0},{-102.835,0}}, color={0,0,0}));
      connect(Alternative1.outPort, exitStep.inPort[1])
        annotation (Line(points={{90.89,0},{109,0}}, color={0,0,0}));
      connect(transition1.inPort, Alternative1.split[1]) annotation (Line(
              points={{-54,30},{-80.155,30}},  color={0,0,0}));
      connect(transition2.inPort, Alternative1.split[2]) annotation (Line(
              points={{-55,-30},{-80.155,-30}},  color={0,0,0}));
      connect(transition3.outPort, Alternative1.join[1]) annotation (Line(
              points={{40.5,30},{69.155,30}},  color={0,0,0}));
      connect(transition4.outPort, Alternative1.join[2]) annotation (Line(
              points={{40.5,-30},{69.155,-30}},  color={0,0,0}));
    end CompositeStep1;

    model CompositeStep2
      "Composite step used to demonstrate exceptions (in StateGraph.Examples.ShowExceptions)"
      extends Modelica_StateGraph.PartialCompositeStep;
      Modelica_StateGraph.Transition transition(enableTimer=true, waitTime=
            waitTime) annotation (Placement(transformation(extent={{-30,-10},{-10,
                10}}, rotation=0)));
      Modelica_StateGraph.Step initStep annotation (Placement(transformation(
              extent={{-140,-10},{-120,10}}, rotation=0)));
      Modelica_StateGraph.Step exitStep annotation (Placement(transformation(
              extent={{110,-10},{130,10}}, rotation=0)));
      parameter Modelica_StateGraph.Temporary.SetRealParameter waitTime=2
        "waiting time in this composite step" annotation (Placement(
            transformation(extent={{-80,30},{-50,50}}, rotation=0)));
    equation
      connect(exitStep.outPort[1], outPort)
        annotation (Line(points={{130.5,0},{155,0}}, color={0,0,0}));
      connect(initStep.inPort[1], inPort)
        annotation (Line(points={{-141,0},{-160,0}}, color={0,0,0}));
      connect(initStep.outPort[1], transition.inPort)
        annotation (Line(points={{-119.5,0},{-24,0}}, color={0,0,0}));
      connect(transition.outPort, exitStep.inPort[1])
        annotation (Line(points={{-18.5,0},{109,0}}, color={0,0,0}));
    end CompositeStep2;

  end Utilities;
  annotation (uses(Modelica(version="3.2.1")));
end Modelica_StateGraph_Examples;
