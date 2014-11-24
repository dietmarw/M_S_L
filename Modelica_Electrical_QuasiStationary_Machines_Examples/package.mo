within ;
encapsulated package Modelica_Electrical_QuasiStationary_Machines_Examples
  "Test examples"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Electrical_QuasiStationary;
  import Modelica_ComplexBlocks;
  import Modelica_Electrical_Machines;
  import Modelica_Utilities;
  extends Modelica_Icons.ExamplesPackage;

  model TransformerTestbench "Transformer Testbench"
    extends Modelica_Icons.Example;
    parameter Integer m=3 "Number of phases";
    parameter Modelica_SIunits.Resistance RL[m]=fill(1/3, m) "Load resistance";
    Modelica_Electrical_QuasiStationary.MultiPhase.Sources.VoltageSource source(
      f=50,
      V=fill(100/sqrt(3), 3),
      m=m) annotation (Placement(transformation(
          origin={-90,-10},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starS(m=m)
      annotation (Placement(transformation(
          origin={-90,-40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundS
      annotation (Placement(transformation(extent={{-100,-80},{-80,-60}},
            rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor electricalPowerSensorS(m=m)
      annotation (Placement(transformation(extent={{-90,0},{-70,20}}, rotation=
              0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.CurrentSensor currentSensorS(m=m)
      annotation (Placement(transformation(extent={{-60,20},{-40,0}}, rotation=
              0)));
    Modelica_ComplexBlocks.ComplexMath.ComplexToPolar polarIS[m] annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,40})));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.VoltageSensor voltageSensorS(m=m)
      annotation (Placement(transformation(
          origin={-50,-30},
          extent={{-10,10},{10,-10}},
          rotation=180)));
    Modelica_ComplexBlocks.ComplexMath.ComplexToPolar polarVS[m]
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-60})));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Delta deltaS(m=m)
      annotation (Placement(transformation(
          origin={-50,-10},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Resistor earth(R_ref=1e6)
      annotation (Placement(transformation(
          origin={0,-40},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundT
      annotation (Placement(transformation(extent={{-10,-80},{10,-60}},
            rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.VoltageSensor voltageSensorL(m=m)
      annotation (Placement(transformation(
          origin={50,-30},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica_ComplexBlocks.ComplexMath.ComplexToPolar polarVL[m]
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={50,-60})));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Delta deltaL(m=m)
      annotation (Placement(transformation(
          origin={50,-10},
          extent={{-10,10},{10,-10}},
          rotation=180)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.CurrentSensor currentSensorL(m=m)
      annotation (Placement(transformation(extent={{40,20},{60,0}}, rotation=0)));
    Modelica_ComplexBlocks.ComplexMath.ComplexToPolar polarIL[m]
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,40})));
    Modelica_Electrical_QuasiStationary.MultiPhase.Sensors.PowerSensor electricalPowerSensorL(m=m)
      annotation (Placement(transformation(extent={{70,0},{90,20}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor load(R_ref=RL,
        m=m) annotation (Placement(transformation(
          origin={90,-10},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Star starL(m=m)
      annotation (Placement(transformation(
          origin={90,-40},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica_Electrical_QuasiStationary.SinglePhase.Basic.Ground groundL
      annotation (Placement(transformation(extent={{80,-80},{100,-60}},
            rotation=0)));
    Modelica_Electrical_Machines.Utilities.TransformerData transformerData(
      C1=Modelica_Utilities.Strings.substring(
            transformer.VectorGroup,
            1,
            1),
      C2=Modelica_Utilities.Strings.substring(
            transformer.VectorGroup,
            2,
            2),
      f=50,
      V1=100,
      V2=100,
      SNominal=30E3,
      v_sc=0.05,
      P_sc=300) annotation (Placement(transformation(extent={{-10,40},{10,60}},
            rotation=0)));
    Modelica_Electrical_QuasiStationary.Machines.BasicMachines.Transformers.Yd.Yd01
      transformer(
      n=transformerData.n,
      R1=transformerData.R1,
      L1sigma=transformerData.L1sigma,
      R2=transformerData.R2,
      L2sigma=transformerData.L2sigma,
      T1Ref=293.15,
      alpha20_1(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
      T2Ref=293.15,
      alpha20_2(displayUnit="1/K") = Modelica_Electrical_Machines.Thermal.Constants.alpha20Zero,
      T1Operational=293.15,
      T2Operational=293.15) annotation (Placement(transformation(extent={{-20,-10},
              {20,30}}, rotation=0)));

  initial equation
    source.plug_p.reference.gamma = 0;

  equation
    connect(starS.pin_n, groundS.pin) annotation (Line(
        points={{-90,-50},{-90,-60}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(source.plug_n, starS.plug_p) annotation (Line(
        points={{-90,-20},{-90,-30}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(starL.pin_n, groundL.pin) annotation (Line(
        points={{90,-50},{90,-60}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(load.plug_n, starL.plug_p) annotation (Line(
        points={{90,-20},{90,-30}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(source.plug_p, electricalPowerSensorS.currentP) annotation (Line(
        points={{-90,0},{-90,10}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(electricalPowerSensorS.currentP, electricalPowerSensorS.voltageP)
      annotation (Line(
        points={{-90,10},{-90,20},{-80,20}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(electricalPowerSensorS.currentN, currentSensorS.plug_p)
      annotation (Line(
        points={{-70,10},{-60,10}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(currentSensorS.plug_n, transformer.plug1) annotation (Line(
        points={{-40,10},{-20,10}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(transformer.plug2, currentSensorL.plug_p) annotation (Line(
        points={{20,10},{40,10}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(currentSensorL.plug_n, electricalPowerSensorL.currentP)
      annotation (Line(
        points={{60,10},{70,10}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(electricalPowerSensorL.currentP, electricalPowerSensorL.voltageP)
      annotation (Line(
        points={{70,10},{70,20},{80,20}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(electricalPowerSensorL.currentN, load.plug_p) annotation (Line(
        points={{90,10},{90,0}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(electricalPowerSensorL.voltageN, starL.plug_p) annotation (Line(
        points={{80,0},{80,-30},{90,-30}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(electricalPowerSensorS.voltageN, starS.plug_p) annotation (Line(
        points={{-80,0},{-80,-30},{-90,-30}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(earth.pin_n, groundT.pin) annotation (Line(
        points={{0,-50},{0,-60}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(deltaS.plug_p, voltageSensorS.plug_n) annotation (Line(
        points={{-60,-10},{-60,-30}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(deltaS.plug_n, voltageSensorS.plug_p) annotation (Line(
        points={{-40,-10},{-40,-30}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(currentSensorS.plug_n, deltaS.plug_n) annotation (Line(
        points={{-40,10},{-40,-10}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(deltaL.plug_p, voltageSensorL.plug_n) annotation (Line(
        points={{60,-10},{60,-30}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(deltaL.plug_n, voltageSensorL.plug_p) annotation (Line(
        points={{40,-10},{40,-30}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(currentSensorL.plug_p, deltaL.plug_n) annotation (Line(
        points={{40,10},{40,-10}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(polarIS.u, currentSensorS.y) annotation (Line(
        points={{-50,28},{-50,21}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(polarIL.u, currentSensorL.y) annotation (Line(
        points={{50,28},{50,21}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSensorS.y, polarVS.u) annotation (Line(
        points={{-50,-41},{-50,-48}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSensorL.y, polarVL.u) annotation (Line(
        points={{50,-41},{50,-48}},
        color={85,170,255},
        smooth=Smooth.None));
    annotation (Documentation(info="<HTML>
Transformer testbench:<br>
You may choose different connections as well as vary the load (even not symmetrical).<br>
<b>Please pay attention</b> to proper grounding of the primary and secondary part of the whole circuit.<br>
The primary and secondary starpoint are available as connectors, if the connection is not delta (D or d).<br>
In some cases it may be necessary to ground the transformer's starpoint
even though the source's or load's starpoint are grounded; you may use a reasonable high earthing resistance.
</HTML>"),
         experiment(StopTime=0.1, Interval=0.001));
  end TransformerTestbench;
  annotation (Documentation(info="<html>
Examples to demonstrate the usage of quasistationary electric components.
</html>"), uses(Modelica_Utilities(version="3.2.2"),
                Modelica_Electrical_Machines(version="3.2.2"),
                Modelica_ComplexBlocks(version="3.2.2"),
                Modelica_Electrical_QuasiStationary(version="3.2.2"),
                Modelica_SIunits(version="3.2.2"),
                Modelica_Icons(version="3.2.2")),
              version="3.2.2");
end Modelica_Electrical_QuasiStationary_Machines_Examples;
