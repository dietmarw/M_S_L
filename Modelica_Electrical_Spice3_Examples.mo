within ;
encapsulated package Modelica_Electrical_Spice3_Examples "Example circuits"
  import Modelica_Icons;
  import Modelica_Electrical_Spice3;
extends Modelica_Icons.ExamplesPackage;

  model Inverter "Simple inverter circuit"
  //--------------------------------------------------------------------------------------------------------------

  //--------------------------------------------------------------------------------------------------------------
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp(
      modelcard(
        RD=0,
        RS=0,
        CBD=0,
        CBS=0),
      Sinternal(start=0),
      IC=-1e40) annotation (Placement(transformation(extent={{-14,8},{6,28}})));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn(modelcard(
        RD=0,
        RS=0,
        CBD=0,
        CBS=0), IC=-1e40)
      annotation (Placement(transformation(extent={{-14,-34},{6,-14}})));
    Modelica_Electrical_Spice3.Basic.Ground ground
      annotation (Placement(transformation(extent={{-14,-60},{6,-40}})));
    Modelica_Electrical_Spice3.Sources.V_pulse vin(
      V2=5,
      TD=4e-12,
      TR=0.1e-12,
      TF=0.1e-12,
      PW=1e-12,
      PER=2e-12) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-40,-16})));
    Modelica_Electrical_Spice3.Sources.V_pulse v(V2=5, TR=0.1e-12) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={40,-4})));
  equation
    connect(mn.D,mp. S)    annotation (Line(
        points={{-4,-14},{-4,8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(mp.G,mn. G)    annotation (Line(
        points={{-14,17.9},{-14,-24.1}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(mn.S,mn. B)     annotation (Line(
        points={{-4,-34},{6,-34},{6,-24}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(mp.B,mp. D)   annotation (Line(
        points={{6,18},{6,28},{-4,28}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(mn.S, ground.p)   annotation (Line(
        points={{-4,-34},{-4,-40}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(v.p,mp. D)         annotation (Line(
        points={{40,6},{40,28},{-4,28}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v.n, ground.p)        annotation (Line(
        points={{40,-14},{40,-40},{-4,-40}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(vin.p,mp. G)      annotation (Line(
        points={{-40,-6},{-40,17.9},{-14,17.9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(vin.n, ground.p)     annotation (Line(
        points={{-40,-26},{-40,-40},{-4,-40}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (        experiment(
        StopTime=1e-11,
        Interval=5e-15,
        Tolerance=1e-7),
      Documentation(info="<html>
<p>An inverter is an electrical circuit that consists of a PMOS and a NMOS transistor. Its task is to turn the input voltage from high potential to low potential or the other way round.</p>
<p>Simulate until 1.e-11 s. Display the input voltage Vin.p.v as well as the output voltage mp.S.v. It shows that the input voltage is inverted.</p>
</html>",
        revisions="<html>
<ul>
<li><i>March 2009 </i>by Kristin Majetta initially implemented</li>
</ul>
</html>"));
  end Inverter;

  model InvertersApartRecord
    "Two inverters where transistor models use different modelcard instances"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Basic.Ground ground annotation (Placement(
          transformation(extent={{-38,-80},{-18,-60}}, rotation=0)));
  //--------------------------------------------------------------------------------------------------------------
  /*apart record: For each transistor in the circuit a record with the technologieparameters is made available
  as an instance of the record modelcardMOS */
    parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardMOS MPmos(
      GAMMA=0.37,
      CBD=0,
      CBS=0) "Specified modelcardMOS for MPmos";
                                          //instance of record modelcardMOS
    parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardMOS MNmos(
      GAMMA=0.37,
      LAMBDA=0.02,
      CBD=0,
      CBS=0) "Specified modelcardMOS for MNmos";
                                           //instance of record modelcardMOS
    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp1(modelcard=MPmos, IC=-1e40)
      annotation (Placement(transformation(extent={{-38,20},{-18,40}}, rotation=
             0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn1(modelcard=MNmos, IC=-1e40)
      annotation (Placement(transformation(extent={{-38,-30},{-18,-10}},
            rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp2(modelcard=MPmos, IC=-1e40)
      annotation (Placement(transformation(extent={{2,20},{22,40}}, rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn2(modelcard=MNmos, IC=-1e40)
      annotation (Placement(transformation(extent={{2,-30},{22,-10}}, rotation=
              0)));
  //--------------------------------------------------------------------------------------------------------------

    Modelica_Electrical_Spice3.Basic.C_Capacitor c1(
      C=1e-5,
      IC=0,
      UIC=true) annotation (Placement(transformation(
          origin={-8,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Basic.C_Capacitor c2(
      C=1e-5,
      IC=0,
      UIC=true) annotation (Placement(transformation(
          origin={34,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Modelica_Electrical_Spice3.Sources.V_pulse vin(
      V2=5,
      TD=2,
      TR=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-60,-32})));
    Modelica_Electrical_Spice3.Sources.V_pulse v(V2=5, TR=1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,-32})));
  equation
    connect(mp1.B, mp1.D) annotation (Line(points={{-18,30},{-18,40},{-28,
            40}},
          color={0,0,255}));
    connect(mn1.S, ground.p)
      annotation (Line(points={{-28,-30},{-28,-60}}, color={0,0,255}));
    connect(mp1.S, mn1.D)
      annotation (Line(points={{-28,20},{-28,-10}}, color={0,0,255}));
    connect(mn1.G, mp1.G) annotation (Line(points={{-38,-20.1},{-38,29.9}},
          color={0,0,255}));
    connect(mn1.B, mn1.S) annotation (Line(points={{-18,-20},{-18,-30},{-28,
            -30}},
          color={0,0,255}));
    connect(mp2.B, mp2.D) annotation (Line(points={{22,30},{22,40},{12,40}},
          color={0,0,255}));
    connect(mn2.S, ground.p) annotation (Line(points={{12,-30},{12,-60},{-28,
            -60}}, color={0,0,255}));
    connect(mp2.S, mn2.D)
      annotation (Line(points={{12,20},{12,-10}}, color={0,0,255}));
    connect(mn2.G, mp2.G) annotation (Line(points={{2,-20.1},{2,29.9}},
          color={0,0,255}));
    connect(mn2.B, mn2.S) annotation (Line(points={{22,-20},{22,-30},{12,
            -30}}, color={0,0,255}));
    connect(mp2.G, mn1.D) annotation (Line(points={{2,29.9},{2,0},{-28,0},{
            -28,-10}},  color={0,0,255}));
    connect(c1.p, mn1.D) annotation (Line(points={{-8,-20},{-8,0},{-28,0},{
            -28,-10}}, color={0,0,255}));
    connect(mn2.D, c2.p) annotation (Line(points={{12,-10},{12,0},{34,0},{34,
            -20}}, color={0,0,255}));
    connect(c2.n, ground.p) annotation (Line(points={{34,-40},{34,-60},{-28,
            -60}}, color={0,0,255}));
    connect(c1.n, ground.p) annotation (Line(points={{-8,-40},{-8,-60},{-28,
            -60}}, color={0,0,255}));
    connect(mp1.G, vin.p)    annotation (Line(
        points={{-38,29.9},{-60,29.9},{-60,-22}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(vin.n, ground.p)    annotation (Line(
        points={{-60,-42},{-60,-60},{-28,-60}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(v.p, mp2.D)       annotation (Line(
        points={{60,-22},{60,40},{12,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(mp1.D, mp2.D) annotation (Line(
        points={{-28,40},{12,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v.n, ground.p)       annotation (Line(
        points={{60,-42},{60,-60},{-28,-60}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (        experiment(StopTime=5),
      Documentation(info="<html>
<p>An inverter is an electrical circuit that consists of a PMOS and a NMOS. Its task is to turn the input voltage from high potential to low potential or the other way round. This circuit <i>InverterApartModel</i> contains two inverters. The input voltage of the first inverter is nearly equal to the output voltage of the second inverter. Capacities cause some differences.</p>
<p>To see the typical behavior of the circuit the input voltages and the output voltages should be plotted. Besides that it can be interesting to watch the output voltage of the first inverter. Simulated until t=5s.</p>
<p>Input voltages: vin.p.v and v.p.v</p>
<p>Output voltage of the first inverter: mn1.ND.v</p>
<p>Output voltage of the second Inverter: mn2.ND.v</p>
<p>This example shows one possibility to make the record of the technology parameters available for more than one transistor. For each transistor in the circuit a record with the technology parameters is made available as an instance of the record modelcardMOS. In this circuit we need two different records for technology parameters, one for PMOS (MPmos) and one for NMOS (MNmos). This instances of the record for the technology parameters were made available for every transistor as one of theirs parameters (Spice3.Repository.MOS mn1(mtype=0, modelcard=MNmos).</p>
</html>",
        revisions="<html>
<ul>
<li><i>April 2009 </i>by Kristin Majetta initially implemented</li>
</ul>
</html>"));
  end InvertersApartRecord;

  model InvertersExtendedModel
    "Two inverters with MOS models defined by inheritance"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Basic.Ground ground annotation (Placement(
          transformation(extent={{-40,-80},{-20,-60}}, rotation=0)));
  //--------------------------------------------------------------------------------------------------------------
  /*extended model: For each set of technology parameters an apart model has to be defined. Every transistor extends
  this model. In this process the required technology parameters are specified. */

    model MPmos "PMOS transistor with specified modelcard"
      parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardMOS M(
        GAMMA=0.37,
        CBD=0,
        CBS=0);
      extends Modelica_Electrical_Spice3.Semiconductors.M_PMOS(modelcard=M);
      annotation (Documentation(info="<html>
<p>This model MPmos is inherited by the model <i>InverterExtendedModel</i> to build an inverter circuit. For detailed information</p><p>please see <i>InverterExtendedModel</i>.</p>
</html>"));
    end MPmos;

    model MNmos "NMOS transistor with specified modelcard"
      parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardMOS M(
        GAMMA=0.37,
        LAMBDA=0.02,
        CBD=0,
        CBS=0);
      extends Modelica_Electrical_Spice3.Semiconductors.M_NMOS(modelcard=M);
      annotation (Documentation(info="<html>
<p>This model MNmos is inherited by the model <i>InverterExtendedModel</i> to build an inverter circuit. For detailed information</p><p>please see <i>InverterExtendedModel</i>.</p>
</html>"));
    end MNmos;

    MPmos mp1(IC=-1e40) annotation (Placement(transformation(extent={{-40,20},{-20,40}},
            rotation=0)));
    MNmos mn1(IC=-1e40) annotation (Placement(transformation(extent={{-40,-30},{-20,-10}},
            rotation=0)));
    MPmos mp2(IC=-1e40) annotation (Placement(transformation(extent={{0,20},{20,40}},
            rotation=0)));
    MNmos mn2(IC=-1e40) annotation (Placement(transformation(extent={{0,-30},{20,-10}},
            rotation=0)));
  //--------------------------------------------------------------------------------------------------------------

    Modelica_Electrical_Spice3.Basic.C_Capacitor c1(
      C=1e-5,
      IC=0,
      UIC=true) annotation (Placement(transformation(
          origin={-10,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Basic.C_Capacitor c2(
      C=1e-5,
      IC=0,
      UIC=true) annotation (Placement(transformation(
          origin={32,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Modelica_Electrical_Spice3.Sources.V_pulse vin(
      V2=5,
      TD=2,
      TR=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-60,-22})));
    Modelica_Electrical_Spice3.Sources.V_pulse v(V2=5, TR=1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={56,-22})));
  equation
    connect(mp1.B, mp1.D) annotation (Line(points={{-20,30},{-20,40},{-30,40}},
          color={0,0,255}));
    connect(mn1.S, ground.p)
      annotation (Line(points={{-30,-30},{-30,-60}}, color={0,0,255}));
    connect(mp1.S, mn1.D)
      annotation (Line(points={{-30,20},{-30,-10}}, color={0,0,255}));
    connect(mn1.G, mp1.G) annotation (Line(points={{-40,-20.1},{-40,29.9}},
          color={0,0,255}));
    connect(mn1.B, mn1.S) annotation (Line(points={{-20,-20},{-20,-30},{-30,-30}},
          color={0,0,255}));
    connect(mp2.B, mp2.D) annotation (Line(points={{20,30},{20,40},{10,40}},
          color={0,0,255}));
    connect(mn2.S, ground.p) annotation (Line(points={{10,-30},{10,-60},{-30,-60}},
                   color={0,0,255}));
    connect(mp2.S, mn2.D)
      annotation (Line(points={{10,20},{10,-10}}, color={0,0,255}));
    connect(mn2.G, mp2.G) annotation (Line(points={{0,-20.1},{0,29.9}},
          color={0,0,255}));
    connect(mn2.B, mn2.S) annotation (Line(points={{20,-20},{20,-30},{10,-30}},
                   color={0,0,255}));
    connect(mp2.G, mn1.D) annotation (Line(points={{0,29.9},{0,0},{-30,0},{-30,-10}},
                        color={0,0,255}));
    connect(c1.p, mn1.D) annotation (Line(points={{-10,-20},{-10,0},{-30,0},{
            -30,-10}}, color={0,0,255}));
    connect(mn2.D, c2.p) annotation (Line(points={{10,-10},{10,0},{32,0},{32,-20}},
                   color={0,0,255}));
    connect(c2.n, ground.p) annotation (Line(points={{32,-40},{32,-60},{-30,
            -60}}, color={0,0,255}));
    connect(c1.n, ground.p) annotation (Line(points={{-10,-40},{-10,-60},{-30,
            -60}}, color={0,0,255}));
    connect(vin.p, mp1.G)    annotation (Line(
        points={{-60,-12},{-60,26},{-40,26},{-40,29.9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(vin.n, ground.p)    annotation (Line(
        points={{-60,-32},{-60,-60},{-30,-60}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(v.p, mp2.D)       annotation (Line(
        points={{56,-12},{56,40},{10,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(mp2.D, mp1.D) annotation (Line(
        points={{10,40},{-30,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v.n, ground.p)       annotation (Line(
        points={{56,-32},{56,-60},{-30,-60}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (        experiment(StopTime=5),
      Documentation(info="<html>
<p>An inverter is an electrical circuit that consists of a PMOS and a NMOS. Its task is to turn the input voltage from high potential to low potential or the other way round. This circuit <i>InverterExtendedModel</i> contains two inverters. The input voltage of the first inverter is nearly equal to the output voltage of the second inverter. Capacities cause some differences.</p>
<p>To see the typical behavior of the circuit the input voltages and the output voltages should be plotted. Besides that it can be interesting to watch the output voltage of the first inverter. Simulated until t=5s.</p>
<p>Input voltages: vin.p.v and v.p.v</p>
<p>Output voltage of the first inverter: mn1.ND.v</p>
<p>Output voltage of the second Inverter: mn2.ND.v</p>
<p>This example shows one possibility to make the record of the technology parameters available for more than one transistor. For each set of technology parameters an apart model has to be defined (in this example: MPmos ans MNmos). Inside the model definition the technology parameters are appointed (Spice3.Semiconductors.modelcardMOS M(GAMMA=0.37, LAMBDA=0.02)). Every model extends a transistor. In this process the required technologieparameters are specified (extends Spice3.Repository.MOS(final mtype=1, modelcard=M). To make transistors available in the circuit instances of the defined models are applied (MPmos mp1; MNmos mn1; MPmos mp2; MNmos mn2;).</p>
</html>",
        revisions="<html>
<ul>
<li><i>April 2009 </i>by Kristin Majetta initially implemented</li>
</ul>
</html>"));
  end InvertersExtendedModel;

  model FourInverters
    "Four inverters with MOSFET level 1, using private record as model card"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Basic.Ground ground annotation (Placement(
          transformation(extent={{-74,-80},{-54,-60}}, rotation=0)));

    parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardMOS modp(CBD=0,
        CBS=0) "private PMOS modelcard";
    parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardMOS modn(CBD=0,
        CBS=0) "private NMOS modelcard";

    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp1(modelcard=modp, IC=-1e40)
      annotation (Placement(transformation(extent={{-74,20},{-54,40}}, rotation=
             0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn1(modelcard=modn, IC=-1e40)
      annotation (Placement(transformation(extent={{-74,-30},{-54,-10}},
            rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp2(modelcard=modp, IC=-1e40)
      annotation (Placement(transformation(extent={{-34,20},{-14,40}}, rotation=
             0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn2(modelcard=modn, IC=-1e40)
      annotation (Placement(transformation(extent={{-34,-30},{-14,-10}},
            rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp3(modelcard=modp, IC=-1e40)
      annotation (Placement(transformation(extent={{6,20},{26,40}}, rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp4(modelcard=modn, IC=-1e40)
      annotation (Placement(transformation(extent={{46,20},{66,40}}, rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn3(modelcard=modp, IC=-1e40)
      annotation (Placement(transformation(extent={{6,-30},{26,-10}}, rotation=
              0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn4(modelcard=modn, IC=-1e40)
      annotation (Placement(transformation(extent={{46,-30},{66,-10}}, rotation=
             0)));
    Modelica_Electrical_Spice3.Basic.C_Capacitor c1(
      C=10e-6,
      IC=0,
      UIC=true) annotation (Placement(transformation(
          origin={-44,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Basic.C_Capacitor c2(
      C=10e-6,
      IC=0,
      UIC=true) annotation (Placement(transformation(
          origin={-2,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Basic.C_Capacitor c3(
      C=10e-6,
      IC=0,
      UIC=true) annotation (Placement(transformation(
          origin={36,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Basic.C_Capacitor c4(
      C=10e-6,
      IC=0,
      UIC=true) annotation (Placement(transformation(
          origin={76,-30},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Sources.V_pulse vin(
      V2=5,
      TD=2,
      TR=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-86,-42})));
    Modelica_Electrical_Spice3.Sources.V_pulse v(V2=5, TR=1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={92,-48})));
  equation
    connect(mp1.B, mp1.D) annotation (Line(points={{-54,30},{-54,40},{-64,
            40}},
          color={0,0,255}));
    connect(mn1.S, ground.p)
      annotation (Line(points={{-64,-30},{-64,-60}}, color={0,0,255}));
    connect(mp1.S, mn1.D)
      annotation (Line(points={{-64,20},{-64,-10}}, color={0,0,255}));
    connect(mn1.G, mp1.G) annotation (Line(points={{-74,-20.1},{-74,29.9}},
          color={0,0,255}));
    connect(mn1.B, mn1.S) annotation (Line(points={{-54,-20},{-54,-30},{-64,
            -30}},
          color={0,0,255}));
    connect(mp2.B, mp2.D) annotation (Line(points={{-14,30},{-14,40},{-24,
            40}},
          color={0,0,255}));
    connect(mn2.S, ground.p) annotation (Line(points={{-24,-30},{-24,-60},{
            -64,-60}},
                   color={0,0,255}));
    connect(mp2.S, mn2.D)
      annotation (Line(points={{-24,20},{-24,-10}},
                                                  color={0,0,255}));
    connect(mn2.G, mp2.G) annotation (Line(points={{-34,-20.1},{-34,29.9}},
          color={0,0,255}));
    connect(mn2.B, mn2.S) annotation (Line(points={{-14,-20},{-14,-30},{-24,
            -30}}, color={0,0,255}));
    connect(c1.p, mn1.D) annotation (Line(points={{-44,-20},{-44,0},{-64,0},
            {-64,-10}},color={0,0,255}));
    connect(mn2.D, c2.p) annotation (Line(points={{-24,-10},{-24,0},{-2,0},{
            -2,-20}},
                   color={0,0,255}));
    connect(c2.n, ground.p) annotation (Line(points={{-2,-40},{-2,-60},{-64,
            -60}}, color={0,0,255}));
    connect(c1.n, ground.p) annotation (Line(points={{-44,-40},{-44,-60},{-64,
            -60}}, color={0,0,255}));
    connect(c3.n, ground.p) annotation (Line(points={{36,-40},{36,-60},{-64,
            -60}}, color={0,0,255}));
    connect(c4.n, ground.p) annotation (Line(points={{76,-40},{76,-60},{-64,
            -60}}, color={0,0,255}));
    connect(mn4.B, mn4.S) annotation (Line(points={{66,-20},{66,-30},{56,
            -30}}, color={0,0,255}));
    connect(mn3.B, mn3.S) annotation (Line(points={{26,-20},{26,-30},{16,
            -30}}, color={0,0,255}));
    connect(mp3.B, mp3.D) annotation (Line(points={{26,30},{26,40},{16,40}},
          color={0,0,255}));
    connect(mp4.B, mp4.D) annotation (Line(points={{66,30},{66,40},{56,40}},
                  color={0,0,255}));
    connect(mp3.S, mn3.D)
      annotation (Line(points={{16,20},{16,-10}}, color={0,0,255}));
    connect(mp4.S, mn4.D)
      annotation (Line(points={{56,20},{56,-10}},   color={0,0,255}));
    connect(mn3.S, ground.p) annotation (Line(points={{16,-30},{16,-60},{-64,
            -60}}, color={0,0,255}));
    connect(mn4.S, ground.p) annotation (Line(points={{56,-30},{56,-60},{-64,
            -60}},     color={0,0,255}));
    connect(c3.p, mn3.D) annotation (Line(points={{36,-20},{36,0},{16,0},{16,
            -10}}, color={0,0,255}));
    connect(c4.p, mn4.D) annotation (Line(points={{76,-20},{76,0},{56,0},{56,
            -10}},      color={0,0,255}));
    connect(c2.p, mn3.G) annotation (Line(points={{-2,-20},{2,-20},{2,-20.1},
            {6,-20.1}},         color={0,0,255}));
    connect(mn3.G, mp3.G) annotation (Line(points={{6,-20.1},{6,29.9}},
          color={0,0,255}));
    connect(c3.p, mn4.G) annotation (Line(points={{36,-20},{41,-20},{41,
            -20.1},{46,-20.1}},  color={0,0,255}));
    connect(mn4.G, mp4.G) annotation (Line(points={{46,-20.1},{46,29.9}},
          color={0,0,255}));
    connect(c1.p, mn2.G) annotation (Line(points={{-44,-20},{-39,-20},{-39,
            -20.1},{-34,-20.1}},color={0,0,255}));
    connect(vin.p, mn1.G)    annotation (Line(
        points={{-86,-32},{-86,0},{-74,0},{-74,-20.1}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(vin.n, ground.p)    annotation (Line(
        points={{-86,-52},{-86,-60},{-64,-60}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(v.p, mp4.D)       annotation (Line(
        points={{92,-38},{92,40},{56,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v.n, ground.p)       annotation (Line(
        points={{92,-58},{92,-60},{-64,-60}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(mp3.D, mp4.D) annotation (Line(
        points={{16,40},{56,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(mp2.D, mp3.D) annotation (Line(
        points={{-24,40},{16,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(mp1.D, mp2.D) annotation (Line(
        points={{-64,40},{-24,40}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (        experiment(StopTime=5),
      Documentation(info="<html>
<p>This circuit that contains four inverter was designed to show the functionality of the MOS transistor models. To see the behavior of the circuit the output voltages of each inverter should be displayed (mp1.NS.v, mp2.NS.v, mp3.NS.v, mp4.NS.v). The output voltages of the second an fourth inverter and the input voltage of the first inverter have the same potential. The output voltages of the first and third inverter have the opposite potential compared with inverter 2 and 4.</p>
<p>Simulate until t=5s. The output values should be: mp1.NS.v, mp2.NS.v, mp3.NS.v, mp4.NS.v and vgate.p.v</p>
</html>",
        revisions="<html>
<ul>
<li><i>April 2009 </i>by Kristin Majetta initially implemented</li>
</ul>
</html>"));
  end FourInverters;

  model Nand "MOS Nand gate circuit"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp1(
      L=2e-5,
      W=1e-5,
      modelcard(
        PHI=0.7,
        CBD=0,
        CBS=0),
      Sinternal(start=0),
      IC=-1e40) annotation (Placement(transformation(extent={{-22,24},{-2,44}},
            rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp2(modelcard(
        PHI=0.7,
        CBD=0,
        CBS=0), IC=-1e40) annotation (Placement(transformation(extent={{24,24},
              {44,44}}, rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn2(
      Dinternal(start=0),
      modelcard(CBD=0, CBS=0),
      IC=-1e40) annotation (Placement(transformation(extent={{-24,-44},{-4,-24}},
            rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn1(modelcard(CBD=0, CBS=0),
        IC=-1e40) annotation (Placement(transformation(extent={{-24,-10},{-4,10}},
            rotation=0)));
    Modelica_Electrical_Spice3.Sources.V_constant vconstant(V=5) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={62,34})));
    Modelica_Electrical_Spice3.Basic.Ground ground annotation (Placement(
          transformation(extent={{20,-100},{40,-80}}, rotation=0)));
    Modelica_Electrical_Spice3.Sources.V_pulse vin1(
      TR=1e-9,
      TF=1e-9,
      V2=5,
      TD=2e-8,
      PW=4e-8,
      PER=8e-8) annotation (Placement(transformation(
          origin={-50,24},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Sources.V_pulse vin2(
      V2=5,
      TR=1e-9,
      TF=1e-9,
      TD=1e-8,
      PW=4e-8,
      PER=8e-8) annotation (Placement(transformation(
          origin={-52,-44},
          extent={{-10,-10},{10,10}},
          rotation=270)));

  equation
    connect(mp1.B, mp1.D)       annotation (Line(points={{-2,34},{-2,44},{
            -12,44}},  color={0,0,255}));
    connect(mp2.B, mp2.D)         annotation (Line(points={{44,34},{44,44},
            {34,44}}, color={0,0,255}));
    connect(vconstant.p, mp2.D)      annotation (Line(points={{62,44},{62,44},
            {34,44}}, color={0,0,255}));
    connect(mp2.D, mp1.D)
      annotation (Line(points={{34,44},{-12,44}}, color={0,0,255}));
    connect(mp1.G, mn1.G)        annotation (Line(points={{-22,33.9},{-22,
            16},{-24,16},{-24,-0.1}},
                    color={0,0,255}));
    connect(mp1.G, vin1.p)     annotation (Line(points={{-22,33.9},{-38,33.9},
            {-38,34},{-50,34}}, color={0,0,255}));
    connect(vin1.n, ground.p)  annotation (Line(points={{-50,14},{-62,14},{
            -62,-80},{30,-80}},color={0,0,255}));
    connect(mp2.G, mn2.G)        annotation (Line(points={{24,33.9},{24,14},
            {-32,14},{-32,-34.1},{-24,-34.1}},
                                            color={0,0,255}));
    connect(mn2.G, vin2.p)     annotation (Line(points={{-24,-34.1},{-38,
            -34.1},{-38,-34},{-52,-34}},
                                color={0,0,255}));
    connect(vin2.n, ground.p)  annotation (Line(points={{-52,-54},{-52,-80},{
            30,-80}},color={0,0,255}));
    connect(mn2.S, ground.p)    annotation (Line(points={{-14,-44},{-14,-80},
            {30,-80}},color={0,0,255}));
    connect(mn1.B, mn2.B)
      annotation (Line(points={{-4,0},{-4,-34}},   color={0,0,255}));
    connect(mn2.B, mn2.S)       annotation (Line(points={{-4,-34},{-4,-44},
            {-14,-44}}, color={0,0,255}));
    connect(mn1.S, mn2.D)
      annotation (Line(points={{-14,-10},{-14,-24}},
                                                  color={0,0,255}));
    connect(mp1.S, mn1.D)
      annotation (Line(points={{-12,24},{-12,18},{-14,18},{-14,10}},
                                                   color={0,0,255}));
    connect(mp2.S, mn1.D)         annotation (Line(points={{34,24},{34,10},
            {-14,10}}, color={0,0,255}));
    connect(vconstant.n, ground.p)  annotation (Line(points={{62,24},{62,-80},
            {30,-80}},color={0,0,255}));
    annotation (        Documentation(info="<html>
<p>In nearly every electronic the basic circuit &quot;nand&quot; are used. A nand contains two PMOS and two NMOS. The faulty wiring can be seen in the graphical mode. If and only if the two input voltages have high potential, the output voltage has low potential, otherwise the output voltage has high potential.</p>
<p>Nand truth table (1 means true, it is represented by the 5V voltage):</p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>input voltage vin1</p></td>
<td><p>input voltage vin2</p></td>
<td><p>output voltage mNMOS1.NS</p></td>
</tr>
<tr>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
</tr>
<tr>
<td><p>0</p></td>
<td><p>1</p></td>
<td><p>1</p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
</tr>
</table>
<p>Simulate until t=2e-7s. Display the two input voltages vin1.p.v and vin2.p.v and the output voltage mNMOS1.ND.v, which becomes zero only if both input values are high.</p>
</html>",
        revisions="<html>
<ul>
<li><i>May 2009 </i>by Kristin Majetta initially implemented</li>
</ul>
</html>"),
      experiment(StopTime=2e-007));
  end Nand;

  model Nor "MOS NOR gate circuit"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp1(
      modelcard(
        RD=1e-4,
        RS=1e-4,
        CBD=1e-5,
        CBS=1e-5,
        CGSO=1e-5,
        CGDO=1e-5,
        CGBO=1e-5),
      Dinternal(start=0, fixed=true),
      Sinternal(start=0, fixed=true),
      IC=-1e40) annotation (Placement(transformation(extent={{-16,24},{4,44}},
            rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_PMOS mp2(
      modelcard(
        RD=1e-4,
        RS=1e-4,
        CBD=1e-5,
        CBS=1e-5,
        CGSO=1e-5,
        CGDO=1e-5,
        CGBO=1e-5),
      Dinternal(start=0, fixed=true),
      Sinternal(start=0, fixed=true),
      IC=-1e40) annotation (Placement(transformation(extent={{-16,-6},{4,14}},
            rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn1(
      modelcard(
        RD=1e-4,
        RS=1e-4,
        CBD=1e-5,
        CBS=1e-5,
        CGSO=1e-5,
        CGDO=1e-5,
        CGBO=1e-5),
      Dinternal(start=0, fixed=true),
      Sinternal(start=0, fixed=true),
      IC=-1e40) annotation (Placement(transformation(extent={{-16,-44},{4,-24}},
            rotation=0)));
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS mn2(
      modelcard(
        RD=1e-4,
        RS=1e-4,
        CBD=1e-5,
        CBS=1e-5,
        CGSO=1e-5,
        CGDO=1e-5,
        CGBO=1e-5),
      Dinternal(start=0, fixed=true),
      Sinternal(start=0, fixed=true),
      IC=-1e40) annotation (Placement(transformation(extent={{32,-44},{52,-24}},
            rotation=0)));
    Modelica_Electrical_Spice3.Basic.Ground ground annotation (Placement(
          transformation(extent={{28,-100},{48,-80}}, rotation=0)));
    Modelica_Electrical_Spice3.Sources.V_pulse vin1(
      V2=5,
      TR=0.001,
      TF=0.001,
      PW=2,
      PER=10,
      TD=2) annotation (Placement(transformation(
          origin={-42,24},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Sources.V_pulse vin2(
      V2=5,
      TR=0.001,
      TF=0.001,
      PW=2,
      PER=10,
      TD=1) annotation (Placement(transformation(
          origin={-44,-44},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_Spice3.Sources.V_pulse v(
      TD=0.5,
      TR=0.1,
      V2=5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={62,34})));
  equation
    connect(mn1.B, mn1.S)       annotation (Line(points={{4,-34},{4,-44},{
            -6,-44}},   color={0,0,255}));
    connect(mn2.B, mn2.S)         annotation (Line(points={{52,-34},{52,-44},
            {42,-44}}, color={0,0,255}));
    connect(mn2.S, ground.p)     annotation (Line(points={{42,-44},{38,-44},
            {38,-80}},
                     color={0,0,255}));
    connect(mn1.S, ground.p)    annotation (Line(points={{-6,-44},{-6,-80},{
            38,-80}}, color={0,0,255}));
    connect(vin2.p, mn1.G)        annotation (Line(points={{-44,-34},{-29,
            -34},{-29,-34.1},{-16,-34.1}},
                                    color={0,0,255}));
    connect(vin2.n, ground.p)     annotation (Line(points={{-44,-54},{-44,-80},
            {38,-80}},color={0,0,255}));
    connect(vin1.p, mp1.G)       annotation (Line(points={{-42,34},{-29,34},
            {-29,33.9},{-16,33.9}}, color={0,0,255}));
    connect(vin1.n, ground.p)    annotation (Line(points={{-42,14},{-64,14},{
            -64,-80},{38,-80}},color={0,0,255}));
    connect(mp1.S, mp2.D)
      annotation (Line(points={{-6,24},{-6,14}},   color={0,0,255}));
    connect(mp2.S, mn1.D)        annotation (Line(points={{-6,-6},{-6,-24}},
          color={0,0,255}));
    connect(mn2.D, mn1.D)        annotation (Line(points={{42,-24},{-6,-24}},
          color={0,0,255}));
    connect(vin2.p, mp2.G)         annotation (Line(points={{-44,-34},{-44,4},
            {-16,4},{-16,3.9}},   color={0,0,255}));
    connect(vin1.p, mn2.G)        annotation (Line(points={{-42,34},{-28,34},
            {-28,-18},{32,-18},{32,-34.1}},
                                       color={0,0,255}));
    connect(mp1.B, mp1.D)       annotation (Line(
        points={{4,34},{4,44},{-6,44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(mp2.B, mp1.B)        annotation (Line(
        points={{4,4},{4,34}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v.p, mp1.D)           annotation (Line(
        points={{62,44},{-6,44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v.n, ground.p)        annotation (Line(
        points={{62,24},{62,-80},{38,-80}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (        Documentation(info="<html>
<p>In nearly every electronic the basic circuit &quot;nor&quot; is used. A nor contains two PMOS and two NMOS. The faulty wiring can be seen in the graphical mode. If and only if the two input voltages have low potential, the output voltage has high potential, otherwise the output voltage has low potential.</p>
<p>Nor truth table (1 means true, it is represented by the 5V voltage):</p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>input voltage vin1</p></td>
<td><p>input voltage vin2</p></td>
<td><p>output voltage m_PMOS1.NS</p></td>
</tr>
<tr>
<td><p>0</p></td>
<td><p>0</p></td>
<td><p>1</p></td>
</tr>
<tr>
<td><p>0</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>0</p></td>
<td><p>0</p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>1</p></td>
<td><p>0</p></td>
</tr>
</table>
<p>Simulate until t=5s. Display the two input voltages vin1.p.v and vin2.p.v and the output voltage mPMOS1.NS.v.</p>
<p>The output value in the example shows a behaviour &quot;near&quot; the one of the truth table, since the capacitances are huge. Therefore loading is not finished before the next input changes.</p>
</html>",
        revisions="<html>
<ul>
<li><i>March 2009 </i>by Kristin Majetta initially implemented</li>
</ul>
</html>"),
      experiment(StopTime=5));
  end Nor;

  model Graetz "Graetz rectifier circuit"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Semiconductors.D_DIODE D1(
      IC=-1e40,
      SENS_AREA=false,
      modelcarddiode(CJO=1e-7),
      pin(start=0, fixed=true)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={0,14})));
    Modelica_Electrical_Spice3.Semiconductors.D_DIODE D3(
      IC=-1e40,
      SENS_AREA=false,
      modelcarddiode(CJO=1e-7),
      n(v(start=0, fixed=true))) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={20,-8})));
    Modelica_Electrical_Spice3.Semiconductors.D_DIODE D4(
      IC=-1e40,
      SENS_AREA=false,
      modelcarddiode(CJO=1e-7)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={1,-30})));
    Modelica_Electrical_Spice3.Semiconductors.D_DIODE D2(
      IC=-1e40,
      SENS_AREA=false,
      modelcarddiode(CJO=1e-7)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-20,-8})));
    Modelica_Electrical_Spice3.Semiconductors.R_Resistor rout(R=10) annotation (
       Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={42,-7})));
    Modelica_Electrical_Spice3.Sources.V_sin vsin(VA=10, FREQ=200) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-44,-8})));
    Modelica_Electrical_Spice3.Basic.Ground ground
      annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
  equation
    connect(D1.n, D3.p) annotation (Line(
        points={{10,14},{20,14},{20,2}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(D2.p, D1.p) annotation (Line(
        points={{-20,2},{-20,14},{-10,14}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(D4.n, D3.n) annotation (Line(
        points={{11,-30},{20,-30},{20,-18}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(D4.p, D2.n) annotation (Line(
        points={{-9,-30},{-20,-30},{-20,-18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(D4.p, ground.p) annotation (Line(
        points={{-9,-30},{-20,-30},{-20,-40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(vsin.n, ground.p)  annotation (Line(
        points={{-44,-18},{-44,-40},{-20,-40}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(D4.n, rout.p)       annotation (Line(
        points={{11,-30},{42,-30},{42,-17}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rout.n, D1.p)       annotation (Line(
        points={{42,3},{42,26},{-20,26},{-20,14},{-10,14}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(D3.p, vsin.p)  annotation (Line(
        points={{20,2},{20,40},{-44,40},{-44,2}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (
      experiment(StopTime=0.025),
      Documentation(info="<html>
<p>The Graetz rectifier circuit is to show the behaviour of diodes.</p>
<p>Simulator until 0.025 s. Then display the input voltage vsin.p.v. The rout.p.v voltage is the rectified voltage result, which is pulsing mostly in the positive range.</p>
</html>",
        revisions="<html>
<ul>
<li><i>Jan. 2010 </i>by Kristin Majetta initially implemented</li>
</ul>
</html>"));
  end Graetz;

  model Oscillator "Oscillator circuit"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Basic.R_Resistor r(R=1000) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-36,20})));
    Modelica_Electrical_Spice3.Basic.C_Capacitor c(C=1e-7)
      annotation (Placement(transformation(extent={{-32,0},{-12,20}})));
    Modelica_Electrical_Spice3.Basic.C_Capacitor c1(C=1e-7)
      annotation (Placement(transformation(extent={{24,0},{44,20}})));
    Modelica_Electrical_Spice3.Basic.R_Resistor r1(R=22000) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-6,20})));
    Modelica_Electrical_Spice3.Basic.R_Resistor r2(R=22000) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={18,20})));
    Modelica_Electrical_Spice3.Basic.R_Resistor r3(R=1000) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,20})));
    Modelica_Electrical_Spice3.Semiconductors.Q_NPNBJT T1(modelcard(CJE=1e-9,
          CJC=1e-9), vbe(start=0, fixed=true)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-30,-24})));
    Modelica_Electrical_Spice3.Semiconductors.Q_NPNBJT T2(modelcard(CJE=1e-9,
          CJC=1e-9), vbe(start=0, fixed=true))
      annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
    Modelica_Electrical_Spice3.Basic.Ground ground1
      annotation (Placement(transformation(extent={{-78,-34},{-58,-14}})));
    Modelica_Electrical_Spice3.Basic.Ground ground2
      annotation (Placement(transformation(extent={{50,-60},{70,-40}})));
    Modelica_Electrical_Spice3.Basic.R_Resistor r4(R=10000) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={64,-2})));
    Modelica_Electrical_Spice3.Sources.V_pulse v(
      V2=8,
      TD=0.0005,
      TR=0.01,
      PW=1000,
      PER=1000,
      TF=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-68,20})));

  equation
    connect(r.n,r1. n) annotation (Line(
        points={{-36,30},{-6,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(r1.n,r2. n) annotation (Line(
        points={{-6,30},{18,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(r2.n,r3. n) annotation (Line(
        points={{18,30},{50,30}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(r.p,c. p) annotation (Line(
        points={{-36,10},{-32,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(c.n,r1. p) annotation (Line(
        points={{-12,10},{-6,10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(r2.p,c1. p) annotation (Line(
        points={{18,10},{24,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(c1.n,r3. p) annotation (Line(
        points={{44,10},{50,10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(r1.p, T2.B)     annotation (Line(
        points={{-6,10},{-6,-30},{30.4,-30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(r2.p, T1.B)    annotation (Line(
        points={{18,10},{18,-24},{-20.4,-24}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(T1.C, r.p)    annotation (Line(
        points={{-33,-34},{-48,-34},{-48,10},{-36,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(T1.E, ground1.p)    annotation (Line(
        points={{-33,-14},{-68,-14}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(T2.E, ground2.p)     annotation (Line(
        points={{43,-40},{60,-40}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(r3.p, T2.C)     annotation (Line(
        points={{50,10},{50,-20},{43,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(r3.p, r4.p)         annotation (Line(
        points={{50,10},{58,10},{58,8},{64,8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ground2.p, r4.n)         annotation (Line(
        points={{60,-40},{60,-12},{64,-12}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v.p, r.n)       annotation (Line(
        points={{-68,30},{-36,30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v.n, ground1.p)       annotation (Line(
        points={{-68,10},{-68,-14}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      experiment(StopTime=0.025),
      Documentation(info="<html>
<p>The oscillator circuit demonstrates the usage of BJT transistors.</p>
<p>Simulate until 0.025 s. Display v.p.v, which is rising until 5 V. Furthermore display r4.p.v, which starts oscillating.</p>
</html>",
        revisions="<html>
<ul>
<li><i>Jan. 2010 </i>by Jonathan Gerbet initially implemented</li>
</ul>
</html>"));
  end Oscillator;

  model CoupledInductors
    extends Modelica_Icons.Example;
    Modelica_Electrical_Spice3.Basic.Ground ground
      annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
    Modelica_Electrical_Spice3.Sources.V_sin sineVoltage(VA=220, FREQ=50)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-90,20})));
    Modelica_Electrical_Spice3.Basic.R_Resistor R1(R=1)
      annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
    Modelica_Electrical_Spice3.Basic.L_Inductor L1(L=1, UIC=false)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-40,40})));
    Modelica_Electrical_Spice3.Basic.L_Inductor L2(L=0.01) annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={20,60})));
    Modelica_Electrical_Spice3.Basic.R_Resistor R2(R=1) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={42,80})));
    Modelica_Electrical_Spice3.Basic.K_CoupledInductors k1(k=0.1)
      annotation (Placement(transformation(extent={{-20,50},{0,70}})));
    Modelica_Electrical_Spice3.Basic.R_Resistor R3(R=1000) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,50})));
    Modelica_Electrical_Spice3.Basic.C_Capacitor C1(C=1.e-6) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={80,50})));
    Modelica_Electrical_Spice3.Basic.L_Inductor L3(L=0.01) annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=270,
          origin={20,-40})));
    Modelica_Electrical_Spice3.Basic.R_Resistor R4(R=1) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={42,-20})));
    Modelica_Electrical_Spice3.Basic.R_Resistor R5(R=1000) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,-50})));
    Modelica_Electrical_Spice3.Basic.C_Capacitor C2(C=2.e-3) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={80,-50})));
    Modelica_Electrical_Spice3.Basic.K_CoupledInductors k2(k=0.05)
      annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
    Modelica_Electrical_Spice3.Basic.K_CoupledInductors k3(k=0.05)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={6,10})));
  equation
    connect(sineVoltage.n, ground.p) annotation (Line(
        points={{-90,10},{-90,-80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R1.p, sineVoltage.p) annotation (Line(
        points={{-80,80},{-90,80},{-90,30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R1.n, L1.p) annotation (Line(
        points={{-60,80},{-40,80},{-40,50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(L1.n, ground.p) annotation (Line(
        points={{-40,30},{-40,-80},{-90,-80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(C1.n, R3.n) annotation (Line(
        points={{80,40},{60,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(L2.n, R3.n) annotation (Line(
        points={{20,50},{20,40},{60,40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(C1.p, R2.p) annotation (Line(
        points={{80,60},{80,80},{52,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R3.p, R2.p) annotation (Line(
        points={{60,60},{60,80},{52,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R2.n, L2.p) annotation (Line(
        points={{32,80},{20,80},{20,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(C2.n, R5.n) annotation (Line(
        points={{80,-60},{60,-60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(L3.n, R5.n) annotation (Line(
        points={{20,-50},{20,-60},{60,-60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(C2.p, R4.p) annotation (Line(
        points={{80,-40},{80,-20},{52,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R5.p, R4.p) annotation (Line(
        points={{60,-40},{60,-20},{52,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(R4.n, L3.p) annotation (Line(
        points={{32,-20},{20,-20},{20,-30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(C1.n, ground.p) annotation (Line(
        points={{80,40},{90,40},{90,-80},{-90,-80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(C2.n, ground.p) annotation (Line(
        points={{80,-60},{90,-60},{90,-80},{-90,-80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(L1.ICP, k2.inductiveCouplePin1) annotation (Line(
        points={{-31.6,40},{-28,40},{-28,-40},{-20,-40}},
        color={170,85,255},
        smooth=Smooth.None));
    connect(k2.inductiveCouplePin2, L3.ICP) annotation (Line(
        points={{0,-40},{11.6,-40}},
        color={170,85,255},
        smooth=Smooth.None));
    connect(L3.ICP, k3.inductiveCouplePin1) annotation (Line(
        points={{11.6,-40},{6,-40},{6,0}},
        color={170,85,255},
        smooth=Smooth.None));
    connect(k3.inductiveCouplePin2, L2.ICP) annotation (Line(
        points={{6,20},{6,60},{11.6,60}},
        color={170,85,255},
        smooth=Smooth.None));
    connect(L2.ICP, k1.inductiveCouplePin2) annotation (Line(
        points={{11.6,60},{0,60}},
        color={170,85,255},
        smooth=Smooth.None));
    connect(L1.ICP, k1.inductiveCouplePin1) annotation (Line(
        points={{-31.6,40},{-28,40},{-28,60},{-20,60}},
        color={170,85,255},
        smooth=Smooth.None));
    annotation (
      experiment(StopTime=0.2),
      Documentation(info="<html>
<p>The coupled inductor circuit demonstrates how different inductors can be coupled using the Component K_CoupledInductors from package Basic</p>
<p>Simulate until 0.2s, and display the behaviour of the parts that are coupled via <code>K</code>, such as <code>C1.p.v</code>, and <code>C2.p.v</code>.</p>
</html>"));
  end CoupledInductors;

  model CascodeCircuit
  extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Semiconductors.J_NJFJFET J1(
      S(v(start=0)),
      modelcard(CGS=0, CGD=0),
      AREA=1)
      annotation (Placement(transformation(extent={{-54,38},{-34,58}})));
    Modelica_Electrical_Spice3.Semiconductors.J_NJFJFET J2(modelcard(CGS=0,
          CGD=0), AREA=1)
      annotation (Placement(transformation(extent={{-54,4},{-34,24}})));
    Modelica_Electrical_Spice3.Basic.R_Resistor RC(R=200, v(start=0))
      annotation (Placement(transformation(extent={{-44,60},{-24,80}})));
    Modelica_Electrical_Spice3.Basic.Ground ground
      annotation (Placement(transformation(extent={{-54,-26},{-34,-6}})));
    Modelica_Electrical_Spice3.Sources.V_constant UDD(V=10) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-10,60})));
    Modelica_Electrical_Spice3.Sources.V_constant U0(V=2) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-72,38})));
    Modelica_Electrical_Spice3.Sources.V_sin v_sin(FREQ=10, VA=2) annotation (
       Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-66,4})));
  equation
    connect(J2.D, J1.S)        annotation (Line(
        points={{-44,24},{-44,38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ground.p, J2.S)     annotation (Line(
        points={{-44,-6},{-44,4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v_sin.p, J2.G) annotation (Line(
        points={{-66,14},{-60,14},{-60,13.9},{-54,13.9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(v_sin.n, ground.p) annotation (Line(
        points={{-66,-6},{-44,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(U0.p, J1.G) annotation (Line(
        points={{-72,48},{-63,48},{-63,47.9},{-54,47.9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(U0.n, ground.p) annotation (Line(
        points={{-72,28},{-80,28},{-80,-6},{-44,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(J1.D, RC.p) annotation (Line(
        points={{-44,58},{-44,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(UDD.p, RC.n) annotation (Line(
        points={{-10,70},{-24,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(UDD.n, ground.p) annotation (Line(
        points={{-10,50},{-10,-6},{-44,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (        Documentation(info="<html>
<p>This model is a simple JFET cascode circuit. The J2 gate variation (v_sin.p.v) is transformed to the J2 drain variation (J2.D.v). </p>
<p><br/>Simulate until 0.2s, and display the mentioned voltages.</p>
</html>",
        revisions="<html>
<ul>
<li><i>Aug. 2011 </i>by Kristin Majetta initially implemented</li>
</ul>
</html>"),
        experiment(
        StopTime=0.2,
        Interval=2e-4,
        Tolerance=1e-007));
  end CascodeCircuit;

  model Spice3BenchmarkDifferentialPair "Simple differential pair"
    extends Modelica_Icons.Example;
    Modelica_Electrical_Spice3.Sources.V_pulse VCC(
      V1=0,
      V2=12,
      TD=0,
      TR=2e-009,
      TF=2e-009,
      PW=3);
    Modelica_Electrical_Spice3.Sources.V_pulse VEE(
      V1=0,
      V2=-12,
      TD=0,
      TR=2e-009,
      TF=2e-009,
      PW=3);
    Modelica_Electrical_Spice3.Sources.V_sin VIN(
      VO=0,
      VA=0.01,
      FREQ=5);
    Modelica_Electrical_Spice3.Basic.R_Resistor RS1(R=1000, v(start=0));
    Modelica_Electrical_Spice3.Basic.R_Resistor RS2(R=1000);
    Modelica_Electrical_Spice3.Semiconductors.Q_NPNBJT Q1(
      modelcard=MOD1,
      Binternal(start=0),
      vbe(start=0, fixed=true));
    Modelica_Electrical_Spice3.Semiconductors.Q_NPNBJT Q2(
      modelcard=MOD1,
      icapbe(start=0),
      vbc(start=0),
      vbe(start=0, fixed=true));
    Modelica_Electrical_Spice3.Basic.R_Resistor RC1(R=10000, v(start=0));
    Modelica_Electrical_Spice3.Basic.R_Resistor RC2(R=10000);
    Modelica_Electrical_Spice3.Basic.R_Resistor RE(R=10000);
    Modelica_Electrical_Spice3.Sources.V_constant VIE(V=0);
    parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardBJT MOD1(
      BF=50,
      VAF=50,
      IS=1e-012,
      RB=100,
      CJC=5e-09,
      TF=6e-010);
    Modelica_Electrical_Spice3.Basic.Ground g;

    Real OutputVoltage;

  protected
    Modelica_Electrical_Analog.Interfaces.Pin n7;
    Modelica_Electrical_Analog.Interfaces.Pin n0;
    Modelica_Electrical_Analog.Interfaces.Pin n8;
    Modelica_Electrical_Analog.Interfaces.Pin n1;
    Modelica_Electrical_Analog.Interfaces.Pin n2;
    Modelica_Electrical_Analog.Interfaces.Pin n6;
    Modelica_Electrical_Analog.Interfaces.Pin n3;
    Modelica_Electrical_Analog.Interfaces.Pin n42;
    Modelica_Electrical_Analog.Interfaces.Pin n5;
    Modelica_Electrical_Analog.Interfaces.Pin n41;
  initial equation
    der(Q1.vbc)=0;
    der(Q2.vbc)=0;
  equation
    OutputVoltage=Q2.C.v - Q1.C.v;
    connect(g.p,n0);
    connect(VCC.p, n7);
    connect(VCC.n, n0);
    connect(VEE.p, n8);
    connect(VEE.n, n0);
    connect(VIN.p, n1);
    connect(VIN.n, n0);
    connect(RS1.p, n1);
    connect(RS1.n, n2);
    connect(RS2.p, n6);
    connect(RS2.n, n0);
    connect(Q1.C, n3);
    connect(Q1.B, n2);
    connect(Q1.E, n42);
    connect(Q2.C, n5);
    connect(Q2.B, n6);
    connect(Q2.E, n42);
    connect(RC1.p, n7);
    connect(RC1.n, n3);
    connect(RC2.p, n7);
    connect(RC2.n, n5);
    connect(RE.p, n41);
    connect(RE.n, n8);
    connect(VIE.p, n41);
    connect(VIE.n, n42);

    annotation (experiment(StopTime=1, Interval=0.001,
        Tolerance=1e-005),
        Documentation(info="<html>
<p>This Differential pair model is one of the five benchmark circuits described in the SPICE3 Version e3 User&apos;s Manual (see information of package Spice3).</p>
<p>The differential pair circuit is operating in the differential mode. This means the input voltage VIN that is only applied at one transistor
is amplified. To comprehend this behavior the user is recommended to simulate from t=0 to t=1s and observe \"VIN.p.v\" which is the input voltage and \"Outputvoltage\" which is the
amplified output voltage.</p>
<p>Original SPICE3 netlist of the Differential pair:</p>
<pre>
SIMPLE DIFFERENTIAL PAIR<br/>
VCC 7 0 12<br/>
VEE 8 0 -12<br/>
VIN 1 0 AC 1<br/>
RS1 1 2 1K<br/>
RS2 6 0 1K<br/>
Q1 3 2 4 MOD1<br/>
Q2 5 6 4 MOD1<br/>
RC1 7 3 10K<br/>
RC2 7 5 10K<br/>
RE 4 8 10K<br/>
.MODEL MOD1 NPN BF=50 VAF=50 IS=1.E-12 RB=100 CJC=.5PF TF=.6NS<br/>
.TF V(5) VIN<br/>
.AC DEC 10 1 100MEG<br/>
.END
</pre>
<p>In the Modelica representation the tiny capacity CJC was set to 1.e-9F to get a higher numerical
robustness. In future the numerical behavior will be analysed to be able to apply the original value
CJC=.5PF.</p>
</html>"));
  end Spice3BenchmarkDifferentialPair;

  model Spice3BenchmarkMosfetCharacterization "Mos output characteristics"
    extends Modelica_Icons.Example;

    Modelica_Electrical_Spice3.Sources.V_pulse VDS(
      V1=0,
      V2=10,
      TD=0,
      TR=1e-008,
      TF=1e-008,
      PW=1,
      PER=1);
    Modelica_Electrical_Spice3.Sources.V_pulse VGS(
      V1=0,
      V2=5,
      TD=4e-008,
      TR=1e-009,
      TF=1e-009,
      PW=1e-008,
      PER=2e-008);
    Modelica_Electrical_Spice3.Semiconductors.M_NMOS M1(
      modelcard=MOD1,
      L=4e-006,
      W=6e-006,
      AD=1e-011,
      AS=1e-011,
      IC=-1e40);
    // * VIDS MEASURES ID, WE COULD HAVE USED VDS, BUT ID WOULD BE NEGATIVE
    Modelica_Electrical_Spice3.Sources.V_constant VIDS(V=0);
    parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardMOS MOD1(
      VTO=-2,
      NSUB=1e+015,
      UO=550,
      CBD=0,
      CBS=0);

  record SpiceConstants
    // NODE
    // NOPAGE
  end SpiceConstants;

    Modelica_Electrical_Spice3.Basic.Ground g;

  protected
    Modelica_Electrical_Analog.Interfaces.Pin n3;
    Modelica_Electrical_Analog.Interfaces.Pin n0;
    Modelica_Electrical_Analog.Interfaces.Pin n2;
    Modelica_Electrical_Analog.Interfaces.Pin n1;

  equation
    connect(g.p,n0);
    connect(VDS.p, n3);
    connect(VDS.n, n0);
    connect(VGS.p, n2);
    connect(VGS.n, n0);
    connect(M1.D, n1);
    connect(M1.G, n2);
    connect(M1.S, n0);
    connect(M1.B, n0);
    connect(VIDS.p, n3);
    connect(VIDS.n, n1);

    annotation ( experiment(StopTime=1e-007, Interval=1e-009),
      Documentation(info="<html>
<p>This Mosfet Characterization model is one of the five benchmark circuits described in the SPICE3 Version e3 User&apos;s Manual (see information of package Spice3). </p>
<p>This circuit is a very simple one than consists of an NMOS transistor level 1 that is connected to voltage sources at gate and drain node whereas the drain voltage source supplies the
operating voltage. The user is recommended to simulate from t=0 to t=1e-7s and observe the gate node voltage (\"VGS.p.v\") and the transistor current (\"M1.D.i\").
It can be seen that the current is increasing with increasing gate voltage which means the conductivity of the transistor is increasing. The opposite case occurs for decreasing gate voltage. </p>
<p>Original SPICE3 netlist of the MOSFET characterization circuit:</p>
<pre>
MOS OUTPUT CHARACTERISTICS<br/>
.OPTIONS NODE NOPAGE<br/>
VDS 3 0<br/>
VGS 2 0<br/>
M1 1 2 0 0 MOD1 L=4U W=6U AD=10P AS=10P<br/>
*VIDS MEASURES ID, WE COULD HAVE USED VDS, BUT IT WOULD BE NEGATIVE VIDS 3 1
.MODEL MOD1 NMOS VTO=-2 NSUB=1.0E15 UO=550<br/>
.DC VDS 0 10 .5 VGS 0 5 1<br/>
.END
</pre>
</html>"));
  end Spice3BenchmarkMosfetCharacterization;

  model Spice3BenchmarkRtlInverter "Simple RTL inverter"
    extends Modelica_Icons.Example;
    Modelica_Electrical_Spice3.Sources.V_constant VCC(V=5);
    Modelica_Electrical_Spice3.Sources.V_pulse VIN(
      V1=0,
      V2=5,
      TD=2e-009,
      TR=2e-009,
      TF=2e-009,
      PW=3e-008);
    Modelica_Electrical_Spice3.Basic.R_Resistor RB(R=10000);
    Modelica_Electrical_Spice3.Semiconductors.Q_NPNBJT Q1(
      modelcard=Q11,
      vbc(start=0, fixed=true),
      vbe(start=0, fixed=true));
    Modelica_Electrical_Spice3.Basic.R_Resistor RC(R=1000);
    parameter Modelica_Electrical_Spice3.Semiconductors.ModelcardBJT Q11(
      BF=20,
      RB=100,
      TF=1e-010,
      CJC=2e-012);
    Modelica_Electrical_Spice3.Basic.Ground g;

  protected
    Modelica_Electrical_Analog.Interfaces.Pin n4;
    Modelica_Electrical_Analog.Interfaces.Pin n0;
    Modelica_Electrical_Analog.Interfaces.Pin n1;
    Modelica_Electrical_Analog.Interfaces.Pin n2;
    Modelica_Electrical_Analog.Interfaces.Pin n3;

  equation
    connect(g.p,n0);
    connect(VCC.p, n4);
    connect(VCC.n, n0);
    connect(VIN.p, n1);
    connect(VIN.n, n0);
    connect(RB.p, n1);
    connect(RB.n, n2);
    connect(Q1.C, n3);
    connect(Q1.B, n2);
    connect(Q1.E, n0);
    connect(RC.p, n3);
    connect(RC.n, n4);

    annotation (experiment(
        StopTime=1e-007,
        Interval=1e-010,
        Tolerance=1e-008),
      Documentation(info="<html>
<p>This RTL Inverter model is one of the five benchmark circuits described in the SPICE3 Version e3 User&apos;s Manual (see information of package Spice3). </p>
<p>This simple RTL inverter (resistor transistor logic) circuits inverts the input voltage which means the output voltage has high potential if the input voltage
has low potential and the other way round. To comprehend this behaviour the user is recommended to simulate from t=0 to t=1e-7s and observe the input voltage (VIN.p.v)
and the output voltage (Q1.C.v)</p>
<p>Original SPICE3 netlist of the RTL inverter:</p>
<pre>
SIMPLE RTL INVERTER<br/>
VCC 4 0 5<br/>
VIN 1 0 PULSE 0 5 2NS 2NS 2NS 30NS<br/>
RB 1 2 10K<br/>
Q1 3 2 0 Q1<br/>
RC 3 4 1K<br/>
.MODEL Q1 NPN BF 20 RB 100 TF .1NS CJC 2PF<br/>
.DC VIN 0 5 0.1<br/>
.TRAN 1NS 100NS<br/>
.END
</pre>
</html>"));
  end Spice3BenchmarkRtlInverter;

  model Spice3BenchmarkFourBitBinaryAdder
    "ADDER - 4 BIT ALL-NAND-GATE BINARY ADDER"
    extends Modelica_Icons.Example;
    import Modelica_Electrical_Spice3.*;

    output Real X1_p9_v =  X1.p9.v;
    output Real X1_p10_v = X1.p10.v;
    output Real X1_p11_v = X1.p11.v;
    output Real X1_p12_v = X1.p12.v;
    output Real X1_p14_v = X1.p14.v;
    output Real X1_p1_v =  X1.p1.v;
    output Real X1_p2_v =  X1.p2.v;
    output Real X1_p3_v =  X1.p3.v;
    output Real X1_p4_v =  X1.p4.v;
    output Real X1_p5_v =  X1.p5.v;
    output Real X1_p6_v =  X1.p6.v;
    output Real X1_p7_v =  X1.p7.v;
    output Real X1_p8_v =  X1.p8.v;

    // *** SUBCIRCUIT DEFINITIONS

  model NAND ".SUBCKT NAND 1 2 3 4"

    parameter Semiconductors.ModelcardDIODE DMOD;
    parameter Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);

    // *   NODES:  INPUT(2), OUTPUT, VCC
    Semiconductors.Q_NPNBJT Q1(modelcard=QMOD);
    Semiconductors.D_DIODE D1CLAMP(modelcarddiode=DMOD, SENS_AREA=false, IC=-1e40);
    Semiconductors.Q_NPNBJT Q2(modelcard=QMOD);
    Semiconductors.D_DIODE D2CLAMP(modelcarddiode=DMOD, SENS_AREA=false, IC=-1e40);
    Basic.R_Resistor RB(R=4000);
    Basic.R_Resistor R1(R=1600);
    Semiconductors.Q_NPNBJT Q3(modelcard=QMOD);
    Basic.R_Resistor R2(R=1000);
    Basic.R_Resistor RC(R=130);
    Semiconductors.Q_NPNBJT Q4(modelcard=QMOD);
    Semiconductors.D_DIODE DVBEDROP(modelcarddiode=DMOD, SENS_AREA=false, IC=-1e40);
    Semiconductors.Q_NPNBJT Q5(modelcard=QMOD);
    Basic.Ground g;
    Modelica_Electrical_Analog.Interfaces.Pin p1;
    Modelica_Electrical_Analog.Interfaces.Pin p2;
    Modelica_Electrical_Analog.Interfaces.Pin p3;
    Modelica_Electrical_Analog.Interfaces.Pin p4;

    protected
    Modelica_Electrical_Analog.Interfaces.Pin n1;
    Modelica_Electrical_Analog.Interfaces.Pin n2;
    Modelica_Electrical_Analog.Interfaces.Pin n3;
    Modelica_Electrical_Analog.Interfaces.Pin n4;
    Modelica_Electrical_Analog.Interfaces.Pin n9;
    Modelica_Electrical_Analog.Interfaces.Pin n5;
    Modelica_Electrical_Analog.Interfaces.Pin n0;
    Modelica_Electrical_Analog.Interfaces.Pin n6;
    Modelica_Electrical_Analog.Interfaces.Pin n8;
    Modelica_Electrical_Analog.Interfaces.Pin n7;
    Modelica_Electrical_Analog.Interfaces.Pin n10;

  equation
    connect(g.p,n0);
    connect(p1,n1);
    connect(p2,n2);
    connect(p3,n3);
    connect(p4,n4);
    connect(Q1.C, n9);
    connect(Q1.B, n5);
    connect(Q1.E, n1);
    connect(D1CLAMP.p, n0);
    connect(D1CLAMP.n, n1);
    connect(Q2.C, n9);
    connect(Q2.B, n5);
    connect(Q2.E, n2);
    connect(D2CLAMP.p, n0);
    connect(D2CLAMP.n, n2);
    connect(RB.p, n4);
    connect(RB.n, n5);
    connect(R1.p, n4);
    connect(R1.n, n6);
    connect(Q3.C, n6);
    connect(Q3.B, n9);
    connect(Q3.E, n8);
    connect(R2.p, n8);
    connect(R2.n, n0);
    connect(RC.p, n4);
    connect(RC.n, n7);
    connect(Q4.C, n7);
    connect(Q4.B, n6);
    connect(Q4.E, n10);
    connect(DVBEDROP.p, n10);
    connect(DVBEDROP.n, n3);
    connect(Q5.C, n3);
    connect(Q5.B, n8);
    connect(Q5.E, n0);

  end NAND;

  model ONEBIT ".SUBCKT ONEBIT 1 2 3 4 5 6"

    parameter Semiconductors.ModelcardDIODE DMOD;
    parameter Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);

    // *   NODES:  INPUT(2), CARRY-IN, OUTPUT, CARRY-OUT, VCC
    NAND X1;
    NAND X2;
    NAND X3;
    NAND X4;
    NAND X5;
    NAND X6;
    NAND X7;
    NAND X8;
    NAND X9;
    Modelica_Electrical_Analog.Interfaces.Pin p1;
    Modelica_Electrical_Analog.Interfaces.Pin p2;
    Modelica_Electrical_Analog.Interfaces.Pin p3;
    Modelica_Electrical_Analog.Interfaces.Pin p4;
    Modelica_Electrical_Analog.Interfaces.Pin p5;
    Modelica_Electrical_Analog.Interfaces.Pin p6;

    protected
    Modelica_Electrical_Analog.Interfaces.Pin n1;
    Modelica_Electrical_Analog.Interfaces.Pin n2;
    Modelica_Electrical_Analog.Interfaces.Pin n3;
    Modelica_Electrical_Analog.Interfaces.Pin n4;
    Modelica_Electrical_Analog.Interfaces.Pin n5;
    Modelica_Electrical_Analog.Interfaces.Pin n6;
    Modelica_Electrical_Analog.Interfaces.Pin n7;
    Modelica_Electrical_Analog.Interfaces.Pin n8;
    Modelica_Electrical_Analog.Interfaces.Pin n9;
    Modelica_Electrical_Analog.Interfaces.Pin n10;
    Modelica_Electrical_Analog.Interfaces.Pin n11;
    Modelica_Electrical_Analog.Interfaces.Pin n12;
    Modelica_Electrical_Analog.Interfaces.Pin n13;

  equation
    connect(p1,n1);
    connect(p2,n2);
    connect(p3,n3);
    connect(p4,n4);
    connect(p5,n5);
    connect(p6,n6);
    connect(X1.p1, n1);
    connect(X1.p2, n2);
    connect(X1.p3, n7);
    connect(X1.p4, n6);
    connect(X2.p1, n1);
    connect(X2.p2, n7);
    connect(X2.p3, n8);
    connect(X2.p4, n6);
    connect(X3.p1, n2);
    connect(X3.p2, n7);
    connect(X3.p3, n9);
    connect(X3.p4, n6);
    connect(X4.p1, n8);
    connect(X4.p2, n9);
    connect(X4.p3, n10);
    connect(X4.p4, n6);
    connect(X5.p1, n3);
    connect(X5.p2, n10);
    connect(X5.p3, n11);
    connect(X5.p4, n6);
    connect(X6.p1, n3);
    connect(X6.p2, n11);
    connect(X6.p3, n12);
    connect(X6.p4, n6);
    connect(X7.p1, n10);
    connect(X7.p2, n11);
    connect(X7.p3, n13);
    connect(X7.p4, n6);
    connect(X8.p1, n12);
    connect(X8.p2, n13);
    connect(X8.p3, n4);
    connect(X8.p4, n6);
    connect(X9.p1, n11);
    connect(X9.p2, n7);
    connect(X9.p3, n5);
    connect(X9.p4, n6);

  end ONEBIT;

  model TWOBIT ".SUBCKT TWOBIT 1 2 3 4 5 6 7 8 9"

    parameter Semiconductors.ModelcardDIODE DMOD;
    parameter Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);

    // *   NODES:  INPUT - BIT0(2) / BIT1(2), OUTPUT - BIT0 / BIT1,
    // *           CARRY-IN, CARRY-OUT, VCC
    ONEBIT X1;
    ONEBIT X2;
    Modelica_Electrical_Analog.Interfaces.Pin p1;
    Modelica_Electrical_Analog.Interfaces.Pin p2;
    Modelica_Electrical_Analog.Interfaces.Pin p3;
    Modelica_Electrical_Analog.Interfaces.Pin p4;
    Modelica_Electrical_Analog.Interfaces.Pin p5;
    Modelica_Electrical_Analog.Interfaces.Pin p6;
    Modelica_Electrical_Analog.Interfaces.Pin p7;
    Modelica_Electrical_Analog.Interfaces.Pin p8;
    Modelica_Electrical_Analog.Interfaces.Pin p9;

    protected
    Modelica_Electrical_Analog.Interfaces.Pin n1;
    Modelica_Electrical_Analog.Interfaces.Pin n2;
    Modelica_Electrical_Analog.Interfaces.Pin n3;
    Modelica_Electrical_Analog.Interfaces.Pin n4;
    Modelica_Electrical_Analog.Interfaces.Pin n5;
    Modelica_Electrical_Analog.Interfaces.Pin n6;
    Modelica_Electrical_Analog.Interfaces.Pin n7;
    Modelica_Electrical_Analog.Interfaces.Pin n8;
    Modelica_Electrical_Analog.Interfaces.Pin n9;
    Modelica_Electrical_Analog.Interfaces.Pin n10;

  equation
    connect(p1,n1);
    connect(p2,n2);
    connect(p3,n3);
    connect(p4,n4);
    connect(p5,n5);
    connect(p6,n6);
    connect(p7,n7);
    connect(p8,n8);
    connect(p9,n9);
    connect(X1.p1, n1);
    connect(X1.p2, n2);
    connect(X1.p3, n7);
    connect(X1.p4, n5);
    connect(X1.p5, n10);
    connect(X1.p6, n9);
    connect(X2.p1, n3);
    connect(X2.p2, n4);
    connect(X2.p3, n10);
    connect(X2.p4, n6);
    connect(X2.p5, n8);
    connect(X2.p6, n9);

  end TWOBIT;

  model FOURBIT ".SUBCKT FOURBIT 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"

    parameter Semiconductors.ModelcardDIODE DMOD;
    parameter Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);

    // *   NODES:  INPUT - BIT0(2) / BIT1(2) / BIT2(2) / BIT3(2),
    // *           OUTPUT - BIT0 / BIT1 / BIT2 / BIT3, CARRY-IN, CARRY-OUT, VCC
    TWOBIT X1;
    TWOBIT X2;
    Modelica_Electrical_Analog.Interfaces.Pin p1;
    Modelica_Electrical_Analog.Interfaces.Pin p2;
    Modelica_Electrical_Analog.Interfaces.Pin p3;
    Modelica_Electrical_Analog.Interfaces.Pin p4;
    Modelica_Electrical_Analog.Interfaces.Pin p5;
    Modelica_Electrical_Analog.Interfaces.Pin p6;
    Modelica_Electrical_Analog.Interfaces.Pin p7;
    Modelica_Electrical_Analog.Interfaces.Pin p8;
    Modelica_Electrical_Analog.Interfaces.Pin p9;
    Modelica_Electrical_Analog.Interfaces.Pin p10;
    Modelica_Electrical_Analog.Interfaces.Pin p11;
    Modelica_Electrical_Analog.Interfaces.Pin p12;
    Modelica_Electrical_Analog.Interfaces.Pin p13;
    Modelica_Electrical_Analog.Interfaces.Pin p14;
    Modelica_Electrical_Analog.Interfaces.Pin p15;

    protected
    Modelica_Electrical_Analog.Interfaces.Pin n1;
    Modelica_Electrical_Analog.Interfaces.Pin n2;
    Modelica_Electrical_Analog.Interfaces.Pin n3;
    Modelica_Electrical_Analog.Interfaces.Pin n4;
    Modelica_Electrical_Analog.Interfaces.Pin n5;
    Modelica_Electrical_Analog.Interfaces.Pin n6;
    Modelica_Electrical_Analog.Interfaces.Pin n7;
    Modelica_Electrical_Analog.Interfaces.Pin n8;
    Modelica_Electrical_Analog.Interfaces.Pin n9;
    Modelica_Electrical_Analog.Interfaces.Pin n10;
    Modelica_Electrical_Analog.Interfaces.Pin n11;
    Modelica_Electrical_Analog.Interfaces.Pin n12;
    Modelica_Electrical_Analog.Interfaces.Pin n13;
    Modelica_Electrical_Analog.Interfaces.Pin n14;
    Modelica_Electrical_Analog.Interfaces.Pin n15;
    Modelica_Electrical_Analog.Interfaces.Pin n16;

  equation
    connect(p1,n1);
    connect(p2,n2);
    connect(p3,n3);
    connect(p4,n4);
    connect(p5,n5);
    connect(p6,n6);
    connect(p7,n7);
    connect(p8,n8);
    connect(p9,n9);
    connect(p10,n10);
    connect(p11,n11);
    connect(p12,n12);
    connect(p13,n13);
    connect(p14,n14);
    connect(p15,n15);
    connect(X1.p1, n1);
    connect(X1.p2, n2);
    connect(X1.p3, n3);
    connect(X1.p4, n4);
    connect(X1.p5, n9);
    connect(X1.p6, n10);
    connect(X1.p7, n13);
    connect(X1.p8, n16);
    connect(X1.p9, n15);
    connect(X2.p1, n5);
    connect(X2.p2, n6);
    connect(X2.p3, n7);
    connect(X2.p4, n8);
    connect(X2.p5, n11);
    connect(X2.p6, n12);
    connect(X2.p7, n16);
    connect(X2.p8, n14);
    connect(X2.p9, n15);

  end FOURBIT;

    // *** DEFINE NOMINAL CIRCUIT
    parameter Semiconductors.ModelcardDIODE DMOD;
    parameter Semiconductors.ModelcardBJT QMOD(BF=75, RB=100, CJE=1e-012, CJC=3e-012);
    Sources.V_constant VCC(V=5);
    Sources.V_pulse VIN1A( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=1e-008, PER=5e-008);
    Sources.V_pulse VIN1B( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=2e-008, PER=1e-007);
    Sources.V_pulse VIN2A( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=4e-008, PER=2e-007);
    Sources.V_pulse VIN2B( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=8e-008, PER=4e-007);
    Sources.V_pulse VIN3A( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=1.6e-007, PER=8e-007);
    Sources.V_pulse VIN3B( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=3.2e-007, PER=1.6e-006);
    Sources.V_pulse VIN4A( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=6.4e-007, PER=3.2e-006);
    Sources.V_pulse VIN4B( V1=0, V2=3, TD=0, TR=1e-008, TF=1e-008, PW=1.28e-006, PER=6.4e-006);
    FOURBIT X1( X1(   X1( X1( Q1(vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true),vbe(start=0))),
                          X2( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                          X3( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X4( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X5( Q1(vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X6( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0))),
                          X7( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true), vbc(start=0, fixed=true)),
                              RC(v(start=0))),
                          X8( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0),vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                          X9( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0)))),
                       X2(X1( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true))),
                          X2( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X3( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X4( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                          X5( Q1(vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X6( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X7( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X8( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true),vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                          X9( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0))))),
                X2(   X1( X1( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true))),
                          X2( Q1(vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X3( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X4( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                          X5( Q1(vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X6( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X7( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X8( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                          X9( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0)))),
                      X2( X1( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbc(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true)),
                              RC(v(start=0))),
                          X2( Q1(vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X3( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X4( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                          X5( Q1(vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X6( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbe(start=0, fixed=true))),
                          X7( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              RC(v(start=0))),
                          X8( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))),
                          X9( Q1(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q2(vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q3(Binternal(start=0), icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q4(Binternal(start=0),icapbe(start=0), vbc(start=0, fixed=true), vbe(start=0, fixed=true)),
                              Q5(vbc(start=0, fixed=true), vbe(start=0, fixed=true))))));

    Basic.R_Resistor RBIT0(R=1000);
    Basic.R_Resistor RBIT1(R=1000);
    Basic.R_Resistor RBIT2(R=1000);
    Basic.R_Resistor RBIT3(R=1000);
    Basic.R_Resistor RCOUT(R=1000);
    // *** (FOR THOSE WITH MONEY (AND MEMORY) TO BURN)
    Basic.Ground g;

  protected
    Modelica_Electrical_Analog.Interfaces.Pin n99;
    Modelica_Electrical_Analog.Interfaces.Pin n0;
    Modelica_Electrical_Analog.Interfaces.Pin n1;
    Modelica_Electrical_Analog.Interfaces.Pin n2;
    Modelica_Electrical_Analog.Interfaces.Pin n3;
    Modelica_Electrical_Analog.Interfaces.Pin n4;
    Modelica_Electrical_Analog.Interfaces.Pin n5;
    Modelica_Electrical_Analog.Interfaces.Pin n6;
    Modelica_Electrical_Analog.Interfaces.Pin n7;
    Modelica_Electrical_Analog.Interfaces.Pin n8;
    Modelica_Electrical_Analog.Interfaces.Pin n9;
    Modelica_Electrical_Analog.Interfaces.Pin n10;
    Modelica_Electrical_Analog.Interfaces.Pin n11;
    Modelica_Electrical_Analog.Interfaces.Pin n12;
    Modelica_Electrical_Analog.Interfaces.Pin n13;

  equation
    connect(g.p,n0);
    connect(VCC.p, n99);
    connect(VCC.n, n0);
    connect(VIN1A.p, n1);
    connect(VIN1A.n, n0);
    connect(VIN1B.p, n2);
    connect(VIN1B.n, n0);
    connect(VIN2A.p, n3);
    connect(VIN2A.n, n0);
    connect(VIN2B.p, n4);
    connect(VIN2B.n, n0);
    connect(VIN3A.p, n5);
    connect(VIN3A.n, n0);
    connect(VIN3B.p, n6);
    connect(VIN3B.n, n0);
    connect(VIN4A.p, n7);
    connect(VIN4A.n, n0);
    connect(VIN4B.p, n8);
    connect(VIN4B.n, n0);
    connect(X1.p1, n1);
    connect(X1.p2, n2);
    connect(X1.p3, n3);
    connect(X1.p4, n4);
    connect(X1.p5, n5);
    connect(X1.p6, n6);
    connect(X1.p7, n7);
    connect(X1.p8, n8);
    connect(X1.p9, n9);
    connect(X1.p10, n10);
    connect(X1.p11, n11);
    connect(X1.p12, n12);
    connect(X1.p13, n0);
    connect(X1.p14, n13);
    connect(X1.p15, n99);
    connect(RBIT0.p, n9);
    connect(RBIT0.n, n0);
    connect(RBIT1.p, n10);
    connect(RBIT1.n, n0);
    connect(RBIT2.p, n11);
    connect(RBIT2.n, n0);
    connect(RBIT3.p, n12);
    connect(RBIT3.n, n0);
    connect(RCOUT.p, n13);
    connect(RCOUT.n, n0);

    annotation (experiment(StopTime=1e-006, Interval=1e-009),
      Documentation(info="<html>
<p>This Four Bit Binary Adder model is one of the five benchmark circuits described in the SPICE3 Version e3 User&apos;s Manual (see information of package Spice3). </p>
<p>The model adds two 4-bit numbers (Number A and Number B). It has eight inputs where the first one is the lowest-order bit of the first number (Number A Bit0), the second is the lowest-order bit of the second number (Number B Bit0), the third one is the second-order bit of the first number (Number A Bit1) and so on. The Four Bit Binary Adder has four outputs where the first one (Sum Bit0) is the lowest-order bit, the second and the third one (Sum Bit1 and Sum Bit2) are the next two bits and the last one (Sum Bit3) is the highest-order bit. The picture illustrates the pin-assignment.</p>
<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Spice3/FourBitBinaryAdder.jpg\"
     alt=\"segment.png\">
</blockquote>

<p>Inside the model the names of the inputs refer to the names in the picture as follows:</p>
<p>X1_p1_v --> Number A Bit0</p>
<p>X1_p2_v --> Number B Bit0</p>
<p>X1_p3_v --> Number A Bit1</p>
<p>X1_p4_v --> Number B Bit1</p>
<p>X1_p5_v --> Number A Bit2</p>
<p>X1_p6_v --> Number B Bit2</p>
<p>X1_p7_v --> Number A Bit3</p>
<p>X1_p8_v --> Number B Bit3</p>
<p>X1_p9_v --> Sum Bit0</p>
<p>X1_p10_v --> Sum Bit1</p>
<p>X1_p11_v --> Sum Bit2</p>
<p>X1_p12_v --> Sum Bit3</p>
<p>X1_p14_v --> Cout</p>
<p>The Four Bit Binary Adder is built out of two two bit adders which respectively are built out of two one bit adders. One one bit adder is build out of nine NAND circuits. </p>
<p>Please note, that the simulation time of the Four Bit Binary Adder can take several hours due to its immense size (e.g. 11387 equations).</p>
<p>The user is recommended to simulate from t=0 to t=1e-6s and observe the eight inputs (X1_p1_v, ..., X1_p8_v) and the four outputs (X1_p9_v, ..., X1_p12_v) and the carryout output (X1_p14_v).</p>
<p><b>The timing of the single transistors of the adder causes a delay which makes it hard to recognize the adder behaviour. Since the Four Bit Binary Adder is a SPICE3 benchmark, the circuit is not changed in order to see the adder behaviour in a better way.</b></p>
<p>Original SPICE3 netlist of the Four Bit Binary Adder:</p>
<pre>
ADDER - 4 BIT ALL-NAND-GATE BINARY ADDER

*** SUBCIRCUIT DEFINITIONS
.SUBCKT NAND 1 2 3 4
*   NODES:  INPUT(2), OUTPUT, VCC
Q1        9  5  1 QMOD
D1CLAMP   0  1    DMOD
Q2        9  5  2 QMOD
D2CLAMP   0  2    DMOD
RB        4  5    4K
R1        4  6    1.6K
Q3        6  9  8 QMOD
R2        8  0    1K
RC        4  7    130
Q4        7  6 10 QMOD
DVBEDROP 10  3    DMOD
Q5        3  8  0 QMOD
.ENDS NAND

.SUBCKT ONEBIT 1 2 3 4 5 6
*   NODES:  INPUT(2), CARRY-IN, OUTPUT, CARRY-OUT, VCC
X1   1  2  7  6   NAND
X2   1  7  8  6   NAND
X3   2  7  9  6   NAND
X4   8  9 10  6   NAND
X5   3 10 11  6   NAND
X6   3 11 12  6   NAND
X7  10 11 13  6   NAND
X8  12 13  4  6   NAND
X9  11  7  5  6   NAND
.ENDS ONEBIT

.SUBCKT TWOBIT 1 2 3 4 5 6 7 8 9
*   NODES:  INPUT - BIT0(2) / BIT1(2), OUTPUT - BIT0 / BIT1,
*           CARRY-IN, CARRY-OUT, VCC
X1   1  2  7  5 10  9   ONEBIT
X2   3  4 10  6  8  9   ONEBIT
.ENDS TWOBIT

.SUBCKT FOURBIT 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
*   NODES:  INPUT - BIT0(2) / BIT1(2) / BIT2(2) / BIT3(2),
*           OUTPUT - BIT0 / BIT1 / BIT2 / BIT3, CARRY-IN, CARRY-OUT, VCC
X1   1  2  3  4  9 10 13 16 15   TWOBIT
X2   5  6  7  8 11 12 16 14 15   TWOBIT
.ENDS FOURBIT

*** DEFINE NOMINAL CIRCUIT
.MODEL DMOD D
.MODEL QMOD NPN(BF=75 RB=100 CJE=1PF CJC=3PF)
VCC   99  0   DC 5V
VIN1A  1  0   PULSE(0 3 0 10NS 10NS   10NS   50NS)
VIN1B  2  0   PULSE(0 3 0 10NS 10NS   20NS  100NS)
VIN2A  3  0   PULSE(0 3 0 10NS 10NS   40NS  200NS)
VIN2B  4  0   PULSE(0 3 0 10NS 10NS   80NS  400NS)
VIN3A  5  0   PULSE(0 3 0 10NS 10NS  160NS  800NS)
VIN3B  6  0   PULSE(0 3 0 10NS 10NS  320NS 1600NS)
VIN4A  7  0   PULSE(0 3 0 10NS 10NS  640NS 3200NS)
VIN4B  8  0   PULSE(0 3 0 10NS 10NS 1280NS 6400NS)
X1     1  2  3  4  5  6  7  8  9 10 11 12  0 13 99 FOURBIT
RBIT0  9  0   1K
RBIT1 10  0   1K
RBIT2 11  0   1K
RBIT3 12  0   1K
RCOUT 13  0   1K

*** (FOR THOSE WITH MONEY (AND MEMORY) TO BURN)
.TRAN 1NS 6400NS UIC

.control
run
set options no break

*plot v(1) v(2)
*plot v(3) v(4)
*plot v(5) v(6)
*plot v(7) v(8)
*plot v(9) v(10)
*plot v(11) v(12)
*plot v(13)
*print v(9) v(10)
print v(11) v(12) v(13)

.endc

.END
</pre>
<p>The model is built out of several subcircuits which were described only ones and used several times. </p>
</html>"));
  end Spice3BenchmarkFourBitBinaryAdder;
  annotation (Documentation(info="<html>
<p>This package Example circuits contains some useful examples to demonstrate how the library is working and how the models can be used.</p>
</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Electrical_Spice3_Examples;
