within ;
encapsulated package Modelica_StateGraph_Interfaces
  "Connectors and partial models"
  import Modelica_Icons;
  import Modelica_StateGraph;
  import Modelica_SIunits;
  extends Modelica_Icons.InterfacesPackage;

  connector Step_in "Input port of a step"
    output Boolean occupied "true, if step is active" annotation (HideResult=true);
    input Boolean set "true, if transition fires and step is activated" annotation (HideResult=true);
    annotation (
   Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
   Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid), Text(
              extent={{-141,100},{100,60}},
              lineColor={0,0,0},
              textString="%name")}));
  end Step_in;

  connector Step_out "Output port of a step"
    output Boolean available "true, if step is active" annotation (HideResult=true);

    input Boolean reset "true, if transition fires and step is deactivated"
      annotation (HideResult=true);

    annotation (Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
                              Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(
              extent={{-100,50},{0,-50}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-100,100},{186,58}},
              lineColor={0,0,0},
              textString="%name")}));
  end Step_out;

  connector Transition_in "Input port of a transition"
    input Boolean available
      "true, if step connected to the transition input is active"
      annotation (HideResult=true);
    output Boolean reset
      "true, if transition fires and the step connected to the transition input is deactivated"
      annotation (HideResult=true);

    annotation (Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
                                            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid), Text(
              extent={{-141,100},{100,60}},
              lineColor={0,0,0},
              textString="%name")}));
  end Transition_in;

  connector Transition_out "Output port of a transition"
    input Boolean occupied
      "true, if step connected to the transition output is active"
      annotation (HideResult=true);
    output Boolean set
      "true, if transition fires and step connected to the transition output becomes active"
      annotation (HideResult=true);

    annotation (Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Text(
              extent={{-100,100},{146,60}},
              lineColor={0,0,0},
              textString="%name"), Rectangle(
              extent={{-100,50},{0,-50}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
  end Transition_out;

  connector CompositeStep_resume
    "Input port of a step (used for resume connector of a CompositeStep)"
    output Boolean occupied "true, if step is active" annotation (HideResult=true);
    input Boolean set "true, if transition fires and step is activated"
      annotation (HideResult=true);
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
                                            Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Rectangle(
              extent={{0,0},{0,0}},
              lineColor={255,255,255},
              pattern=LinePattern.None)}));
  end CompositeStep_resume;

  connector CompositeStep_suspend
    "Output port of a step (used for suspend connector of a CompositeStep)"

    output Boolean available "true, if step is active" annotation (HideResult=true);

    input Boolean reset "true, if transition fires and step is deactivated"
      annotation (HideResult=true);

    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
                              Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics={Rectangle(
              extent={{0,0},{0,0}},
              lineColor={255,255,255},
              pattern=LinePattern.None)}));
  end CompositeStep_suspend;

  connector CompositeStepStatePort_in
    "Communication port between a CompositeStep and the ordinary steps within the CompositeStep (suspend/resume are inputs)"

    input Boolean suspend
      "= true, if suspend transition of CompositeStep fires";
    input Boolean resume "= true, if resume transition of CompositeStep fires";
    Real activeStepsDummy
      "Dummy variable in order that connector fulfills restriction of connector"
                                                                                annotation(HideResult=true);
    flow Real activeSteps "Number of active steps in the CompositeStep";
  end CompositeStepStatePort_in;

  connector CompositeStepStatePort_out
    "Communication port between a CompositeStep and the ordinary steps within the CompositeStep (suspend/resume are outputs)"

    output Boolean suspend
      "= true, if suspend transition of CompositeStep fires";
    output Boolean resume "= true, if resume transition of CompositeStep fires";
    Real activeStepsDummy
      "Dummy variable in order that connector fulfills restriction of connector"
                                                                                 annotation(HideResult=true);
    flow Real activeSteps "Number of active steps in the CompositeStep";
  end CompositeStepStatePort_out;

  partial block PartialStep
    "Partial step with one input and one output transition port"

    parameter Integer nIn(min=0) = 1 "Number of input connections";
    parameter Integer nOut(min=0) = 1 "Number of output connections";

    /* localActive is introduced since component 'Step' has Boolean variable 'active'
     and component 'StepWithSignal' has connector instance 'active' defined
     and both components inherit from PartialStep
  */
    output Boolean localActive
      "= true if step is active, otherwise the step is not active"
      annotation (HideResult=true);
    Step_in inPort[nIn] "Vector of step input connectors" annotation (Placement(
          transformation(extent={{-120,10},{-100,-10}}, rotation=0)));
    Step_out outPort[nOut] "Vector of step output connectors" annotation (
        Placement(transformation(extent={{100,5},{110,-5}}, rotation=0)));
  protected
    outer CompositeStepState stateGraphRoot;
    model OuterStatePort
      CompositeStepStatePort_in subgraphStatePort;
    end OuterStatePort;
    OuterStatePort outerStatePort;

    Boolean newActive "Value of active in the next iteration"
      annotation (HideResult=true);
    Boolean oldActive "Value of active when CompositeStep was aborted";
  initial equation
    pre(newActive) = pre(localActive);
    pre(oldActive) = pre(localActive);
  equation
    connect(outerStatePort.subgraphStatePort, stateGraphRoot.subgraphStatePort);

    // Check that connections to the connector are correct
    for i in 1:nIn loop

    assert(cardinality(inPort[i]) <= 1,
           "Connector is connected to more than one transition (this is not allowed)");
    end for;

    for i in 1:nOut loop

    assert(cardinality(outPort[i]) <= 1,
           "Connector is connected to more than one transition (this is not allowed)");
    end for;

    // set active state
    localActive = pre(newActive);
    newActive = if outerStatePort.subgraphStatePort.resume then oldActive else
      (Modelica_StateGraph.Temporary.anyTrue(inPort.set) or localActive and
      not Modelica_StateGraph.Temporary.anyTrue(outPort.reset)) and not
      outerStatePort.subgraphStatePort.suspend;

    // Remember state for suspend action
    when outerStatePort.subgraphStatePort.suspend then
      oldActive = localActive;
    end when;

    // Report state to CompositeStep
    outerStatePort.subgraphStatePort.activeSteps = if localActive then 1.0 else 0.0;

    // Report state to input and output transitions
    for i in 1:nIn loop
      inPort[i].occupied = if i == 1 then localActive else
                                          inPort[i-1].occupied or
                                          inPort[i-1].set;
    end for;

    for i in 1:nOut loop
       outPort[i].available = if i == 1 then localActive else
                                             outPort[i-1].available and not
                                             outPort[i-1].reset;
    end for;

    // Default setting, if an inPort or an outPort is not connected
    for i in 1:nIn loop
      if cardinality(inPort[i]) == 0 then
        inPort[i].set = false;
      end if;
    end for;

    for i in 1:nOut loop
      if cardinality(outPort[i]) == 0 then
        outPort[i].reset = false;
      end if;
    end for;
  end PartialStep;

  partial block PartialTransition
    "Partial transition with input and output connections"
    input Boolean localCondition "= true, if transition may fire"
      annotation (HideResult=true);
    parameter Boolean enableTimer=false "= true, if timer is enabled"
      annotation (Evaluate=true, Dialog(group="Timer"));
    parameter Modelica_SIunits.Time waitTime(min=0)=0
      "Wait time before transition fires"
      annotation (Dialog(group="Timer", enable=enableTimer));
    output Modelica_SIunits.Time t
      "= actual waiting time (transition will fire when t > waitTime)";
    output Boolean enableFire "= true, if all firing conditions are true";
    output Boolean fire "= true, if transition fires" annotation (HideResult=true);

    Transition_in inPort "Vector of transition input connectors" annotation (
          Placement(transformation(extent={{-50,-10},{-30,10}}, rotation=0)));
    Transition_out outPort "Vector of transition output connectors" annotation (
         Placement(transformation(extent={{10,-5},{20,5}}, rotation=0)));
  protected
    Modelica_SIunits.Time t_start
      "Time instant at which the transition would fire, if waitTime would be zero";
    Real t_dummy;
  initial equation
    if enableTimer then
       pre(t_start) = time;
    end if;
    pre(enableFire) = false;
  equation
    assert(cardinality(inPort) == 1,
      "Connector inPort is not connected to exactly one other connector");
    assert(cardinality(outPort) == 1,
      "Connector outPort is not connected to exactly one other connector");

    // Handling of Timer
    if enableTimer then
      when enableFire then
        t_start = time;
      end when;
      t_dummy = time - t_start;
      t = if enableFire then t_dummy else 0;
      fire = enableFire and time >= t_start + waitTime;
    else
      t_start = 0;
      t_dummy = 0;
      t = 0;
      fire = enableFire;
    end if;

    // Determine fire setting and report it to the connected step
    enableFire = localCondition and inPort.available and not outPort.occupied;
    inPort.reset = fire;
    outPort.set = fire;
  end PartialTransition;

  partial block PartialStateGraphIcon "Icon for a StateGraph object"

    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{160,110},{-160,150}},
              textString="%name",
              lineColor={0,0,255})}));
  end PartialStateGraphIcon;

  model CompositeStepState
    "Communication channel between CompositeSteps and steps in the CompositeStep"

    output Boolean suspend = false;
    output Boolean resume =  false;
    CompositeStepStatePort_out subgraphStatePort;

  /*
    missingInnerMessage="No \"stateGraphRoot\" component is defined on highest level
of the StateGraph. A stateGraphRoot component is automatically introduced.
In order to get rid of this message, drag StateGraph.StateGraphRoot into the
top level your model.");
*/
  equation
    suspend = subgraphStatePort.suspend;
    resume  = subgraphStatePort.resume;
    subgraphStatePort.activeStepsDummy = 0;
    annotation (
      defaultComponentName="stateGraphRoot",
      defaultComponentPrefixes="inner",
      missingInnerMessage="A \"stateGraphRoot\" component was automatically introduced.");
  end CompositeStepState;
  annotation (uses(Modelica_SIunits(version="3.2.2"),
                   Modelica_StateGraph(version="3.2.2"),
                   Modelica_Icons(version="3.2.2")),
              version="3.2.2");
end Modelica_StateGraph_Interfaces;
