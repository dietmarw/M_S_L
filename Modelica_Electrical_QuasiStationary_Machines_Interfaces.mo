within ;
package Modelica_Electrical_QuasiStationary_Machines_Interfaces
  "SpacePhasor connector and PartialMachines"
  extends Modelica_Icons.InterfacesPackage;

  partial model PartialBasicTransformer
    "Partial model of three-phase transformer"
    extends Modelica_Electrical_Machines.Icons.QuasiStationaryTransformer;
    constant Integer m(min=1) = 3 "Number of phases";
    constant String VectorGroup="Yy00";
    parameter Real n(start=1)
      "Ratio primary voltage (line-to-line) / secondary voltage (line-to-line)";
    parameter Modelica_SIunits.Resistance R1(start=5E-3/(if C1 == "D" then 1
           else 3)) "Primary resistance per phase at TRef"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Temperature T1Ref(start=293.15)
      "Reference temperature of primary resistance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter
      Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
      alpha20_1(start=0)
      "Temperature coefficient of primary resistance at 20 degC"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Inductance L1sigma(start=78E-6/(if C1 == "D"
           then 1 else 3)) "Primary stray inductance per phase"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Resistance R2(start=5E-3/(if C2 == "d" then 1
           else 3)) "Secondary resistance per phase at TRef"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Temperature T2Ref(start=293.15)
      "Reference temperature of secondary resistance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter
      Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
      alpha20_2(start=0)
      "Temperature coefficient of secondary resistance at 20 degC"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Inductance L2sigma(start=78E-6/(if C2 == "d"
           then 1 else 3)) "Secondary stray inductance per phase"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Boolean useThermalPort=false
      "Enable / disable (=fixed temperatures) thermal port"
      annotation (Evaluate=true);
    parameter Modelica_SIunits.Temperature T1Operational(start=293.15)
      "Operational temperature of primary resistance" annotation (Dialog(
          group="Operational temperatures", enable=not useThermalPort));
    parameter Modelica_SIunits.Temperature T2Operational(start=293.15)
      "Operational temperature of secondary resistance" annotation (Dialog(
          group="Operational temperatures", enable=not useThermalPort));
    output Modelica_Electrical_Machines.Interfaces.PowerBalanceTransformer
      powerBalance(
      final power1=sum({Modelica_ComplexMath.real(v1[j]*
          Modelica_ComplexMath.conj(i1[j])) for j in 1:m}),
      final power2=sum({Modelica_ComplexMath.real(v2[j]*
          Modelica_ComplexMath.conj(-i2[j])) for j in 1:m}),
      final lossPower1=-sum(r1.resistor.LossPower),
      final lossPower2=-sum(r2.resistor.LossPower),
      final lossPowerCore=0) "Power balance";
    output Modelica_SIunits.ComplexVoltage v1[m]=plug1.pin.v "Primary voltage";
    output Modelica_SIunits.ComplexCurrent i1[m]=plug1.pin.i "Primary current";
    output Modelica_SIunits.ComplexVoltage v2[m]=plug2.pin.v
      "Secondary voltage";
    output Modelica_SIunits.ComplexCurrent i2[m]=plug2.pin.i
      "Secondary current";
  protected
    constant String C1=Modelica_Utilities.Strings.substring(
            VectorGroup,
            1,
            1);
    constant String C2=Modelica_Utilities.Strings.substring(
            VectorGroup,
            2,
            2);
    parameter Real ni=n*(if C2 == "z" then sqrt(3) else 2)*(if C2 == "d"
         then 1 else sqrt(3))/(if C1 == "D" then 1 else sqrt(3));
  public
    Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces.PositivePlug plug1(final m=m)
      "Primary plug" annotation (Placement(transformation(extent={{-110,-10},{-90,
              10}}, rotation=0)));
    Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces.NegativePlug plug2(final m=m)
      "Secondary plug" annotation (Placement(transformation(extent={{90,-10},{
              110,10}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor r1(
      final m=m,
      final R_ref=fill(R1, m),
      final T_ref=fill(T1Ref, m),
      final alpha_ref=fill(Modelica_Electrical_Machines.Thermal.convertAlpha(
          alpha20_1, T1Ref), m),
      final useHeatPort=true,
      final T=fill(T1Ref, m)) annotation (Placement(transformation(extent={{-90,
              10},{-70,-10}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Inductor l1sigma(final m=m,
        final L=fill(L1sigma, m)) annotation (Placement(transformation(extent={
              {-70,-10},{-50,10}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Resistor r2(
      final m=m,
      final R_ref=fill(R2, m),
      final T_ref=fill(T2Ref, m),
      final alpha_ref=fill(Modelica_Electrical_Machines.Thermal.convertAlpha(
          alpha20_2, T2Ref), m),
      final useHeatPort=true,
      final T=fill(T2Ref, m)) annotation (Placement(transformation(extent={{70,
              10},{90,-10}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.MultiPhase.Basic.Inductor l2sigma(final m=m,
        final L=fill(L2sigma, m)) annotation (Placement(transformation(extent={
              {50,-10},{70,10}}, rotation=0)));
    Modelica_Electrical_QuasiStationary.Machines.BasicMachines.Components.IdealCore
      core(
      final m=m,
      final n12=ni,
      final n13=ni) annotation (Placement(transformation(extent={{-10,-10},{10,
              10}}, rotation=0)));
    Modelica_Electrical_Machines.Interfaces.ThermalPortTransformer
      thermalPort if useThermalPort
      annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    Modelica_Electrical_Machines.Thermal.ThermalAmbientTransformer
      thermalAmbient(
      final useTemperatureInputs=false,
      final T1=T1Operational,
      final T2=T2Operational) if not useThermalPort annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,80})));
  protected
    Modelica_Electrical_Machines.Interfaces.ThermalPortTransformer
      internalThermalPort
      annotation (Placement(transformation(extent={{-4,76},{4,84}})));
  equation
    connect(r1.plug_n, l1sigma.plug_p)
      annotation (Line(points={{-70,0},{-70,0}}, color={85,170,255}));
    connect(l2sigma.plug_n, r2.plug_p)
      annotation (Line(points={{70,0},{70,0}}, color={85,170,255}));
    connect(plug1, r1.plug_p)
      annotation (Line(points={{-100,0},{-90,0}}, color={85,170,255}));
    connect(r2.plug_n, plug2)
      annotation (Line(points={{90,0},{100,0}}, color={85,170,255}));
    connect(thermalPort, internalThermalPort) annotation (Line(
        points={{0,100},{0,80}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
        points={{-20,80},{0,80}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(r1.heatPort, internalThermalPort.heatPort1) annotation (Line(
        points={{-80,10},{-80,60},{0,60},{0,80}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(r2.heatPort, internalThermalPort.heatPort2) annotation (Line(
        points={{80,10},{80,60},{0,60},{0,80}},
        color={191,0,0},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{0,-60},{0,-100}},
            lineColor={0,0,0},
            textString="%VectorGroup"), Text(
            extent={{0,100},{0,60}},
            lineColor={0,0,255},
            textString="%name")}), Documentation(info="<html>
Partial model of a three-phase transformer, containing primary and secondary resistances and stray inductances, as well as the iron core.
Circuit layout (vector group) of primary and secondary windings have to be defined.
<br><b>Default values for transformer's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td valign=\"top\">turns ratio n</td>
<td valign=\"top\">1</td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">nominal frequency fNominal</td>
<td valign=\"top\">50</td><td valign=\"top\">Hz</td>
</tr>
<tr>
<td valign=\"top\">nominal voltage per phase</td>
<td valign=\"top\">100</td><td valign=\"top\">V RMS</td>
</tr>
<tr>
<td valign=\"top\">nominal current per phase</td>
<td valign=\"top\">100</td><td valign=\"top\">A RMS</td>
</tr>
<tr>
<td valign=\"top\">nominal apparent power</td>
<td valign=\"top\">30</td><td valign=\"top\">kVA</td>
</tr>
<tr>
<td valign=\"top\">primary resistance R1</td>
<td valign=\"top\">0.005</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature T1Ref</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20_1 </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">primary stray inductance L1sigma</td>
<td valign=\"top\">78E-6</td><td valign=\"top\">H per phase</td>
</tr>
<tr>
<td valign=\"top\">secondary resistance R2</td>
<td valign=\"top\">0.005</td><td valign=\"top\">Ohm per phase at reference temperature</td>
</tr>
<tr>
<td valign=\"top\">reference temperature T2Ref</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">temperature coefficient alpha20_2 </td>
<td valign=\"top\">0</td><td valign=\"top\">1/K</td>
</tr>
<tr>
<td valign=\"top\">secondary stray inductance L2sigma</td>
<td valign=\"top\">78E-6</td><td valign=\"top\">H per phase</td>
</tr>
<tr>
<td valign=\"top\">operational temperature T1Operational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">operational temperature T2Operational</td>
<td valign=\"top\">20</td><td valign=\"top\">&deg;C</td>
</tr>
<tr>
<td valign=\"top\">These values give the operational parameters:</td>
<td valign=\"top\"> </td><td valign=\"top\"> </td>
</tr>
<tr>
<td valign=\"top\">nominal voltage drop</td>
<td valign=\"top\">0.05</td><td valign=\"top\">p.u.</td>
</tr>
<tr>
<td valign=\"top\">nominal copper losses</td>
<td valign=\"top\">300</td><td valign=\"top\">W</td>
</tr>
</table>
</html>"));
  end PartialBasicTransformer;
  annotation (Documentation(info="<html>
<p>
This package contains the quasi stationary space phasor connector and partial models for quasi stationary machine models.
</p>
</html>"), uses(Modelica(version="3.2.1")));
end Modelica_Electrical_QuasiStationary_Machines_Interfaces;
