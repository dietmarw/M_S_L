within ;
package Modelica_Thermal_FluidHeatFlow
  "Simple components for 1-dimensional incompressible thermo-fluid flow models"
  extends Modelica_Icons.Package;

  package UsersGuide "User's Guide"
    extends Modelica_Icons.Information;

    class Contact "Contact"
      extends Modelica_Icons.Contact;
      annotation (Documentation(info="<html>
<h4>Contact</h4>

<p>
Anton Haumer<br>
<a href=\"http://www.haumer.at\">Technical Consulting &amp; Electrical Engineering</a><br>
3423 St. Andrae-Woerdern, Austria<br>
email: <a HREF=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a><br>
</p>

<p>
  Dr. Christian Kral<br>
  <a href=\"http://christiankral.net/\">Electric Machines, Drives and Systems</a><br>
  A-1060 Vienna, Austria<br>
  email: <a href=\"mailto:dr.christian.kral@gmail.com\">dr.christian.kral@gmail.com</a>
</p>

<h4>Acknowledgements</h4>

<p>
Copyright &copy; 1998-2013, Modelica Association, Anton Haumer, Christian Kral and AIT.
</p>

</html>"));
    end Contact;

    class ReleaseNotes "Release Notes"
      extends Modelica_Icons.ReleaseNotes;
      annotation (Documentation(info="<html>

  <h5>3.2.2, 2010-06-25</h5>
  <ul>
  <li> Added users guide package including contact and relase notes</li>
  </ul>

  <h5>1.6.7, 2010-06-25 (Christian Kral)</h5>
  <ul>
  <li>Changed company name of Arsenal Research to AIT</li>
  </ul>

  <h5>1.6.6, 2007-11-13 (Anton Haumer)</h5>
  <ul>
  <li> Replaced all nonSIunits</li>
  <li> Some renaming to be more concise</li>
  </ul>

  <h5>1.6.5, 2007-08-26 (Anton Haumer)</h5>
  <ul>
  <li> Fixed unit bug in SimpleFriction</li>
  </ul>

  <h5>1.6.4, 2007-08-24 (Anton Haumer)</h5>
  <ul>
  <li> Removed redeclare type SignalType</li>
  </ul>

  <h5>1.6.3, 2007-08-21 (Anton Haumer)</h5>
  <ul>
  <li> Improved documentation</li>
  </ul>

  <h5>1.6.2, 2007-08-20 (Anton Haumer)</h5>
  <ul>
  <li> Improved documentation</li>
  </ul>

  <h5>1.6.1, 2007-08-12 (Anton Haumer)</h5>
  <ul>
  <li> Improved documentation</li>
  <li> Removed type TemperatureDifference since this is defined in Modelica.SIunits</li>
  </ul>

  <h5>1.60, 2007-01-23 (Anton Haumer)</h5>
  <ul>
  <li> New parameter tapT defining Temperature of heatPort </li>
  </ul>

  <h5>1.50 2005-09-07 (Anton Haumer)</h5>
  <ul>
  <li> SemiLinear works fine</li>
  </ul>

  <h5>1.43 Beta 2005-06-20 (Anton Haumer)</h5>
  <ul>
  <li> Test of mixing / semiLinear</li>
  <li>New test example: OneMass</li
       <li>New test example: TwoMass</li>
  </ul>

  <h5>1.42 Beta, 2005-06-18 (Anton Haumer)</h5>
  <ul>
  <li> New test example: ParallelPumpDropOut</i></li>
  </ul>

  <h5>1.40, 2005-06-13 (Anton Haumer)</h5>
  <ul>
  <li> Stable release</li>
  </ul>

  <h5>1.33 Beta, 2005-06-07 (Anton Haumer)</h5>
  <ul>
  <li> Corrected usage of simpleFlow</li>
  </ul>

  <h5>1.31 Beta, 2005/06/04 Anton Haumer</h5>
  <ul>
  <li>New example: PumpAndValve</li>
  <li>New example: PumpDropOut</li>
  </ul>

  <h5>1.30 Beta, 2005-06-02 (Anton Haumer)</h5>
  <ul>
  <li> Friction losses are fed to medium</li>
  </ul>

  <h5>1.20 Beta, 2005-02-18 (Anton Haumer)</h5>
  <ul>
  <li>Introduced geodetic height in Components.Pipes</li>
  <li>New models: Components.Valve, Sources.IdealPump</li>
  </ul>

  <h5>1.11, 2005-02-18 (Anton Haumer)</h5>
  <ul>
  <li>Corrected usage of cv and cp</li>
  </ul>

  <h5>1.10, 2005-02-15 (Anton Haumer)</h5>
  <ul>
  <li>Reorganisation of the package</li>
  </ul>

  <h5>1.00, 2005-02-01 (Anton Haumer)</h5>
  <ul>
  <li>First stable official release</li>
  </ul>

</html>"));
    end ReleaseNotes;

    annotation (Documentation(info="<html>
<p>
This library provides simple components for 1-dimensional incompressible thermo-fluid flow models.
</p>
</html>"));
  end UsersGuide;

  package Components "Basic components (pipes, valves)"
    extends Modelica_Icons.Package;

    model IsolatedPipe "Pipe without heat exchange"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.TwoPort(
                                          final tapT=1);
      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.SimpleFriction;
      parameter Modelica_SIunits.Length h_g(start=0)
        "Geodetic height (height difference from flowPort_a to flowPort_b)";
    equation
      // coupling with FrictionModel
      volumeFlow = V_flow;
      dp = pressureDrop + medium.rho*Modelica_Constants.g_n*h_g;
      // no energy exchange with medium
      Q_flow = Q_friction;
    annotation (Documentation(info="<HTML>
Pipe without heat exchange.<br>
Thermodynamic equations are defined by Partials.TwoPortMass(Q_flow = 0).<br>
<b>Note:</b> Setting parameter m (mass of medium within pipe) to zero
leads to neglection of temperature transient cv*m*der(T).
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-90,20},{90,-20}},
              lineColor={255,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid), Text(extent={{-150,100},{150,40}},
                textString="%name")}));
    end IsolatedPipe;

    model HeatedPipe "Pipe with heat exchange"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.TwoPort;
      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.SimpleFriction;
      parameter Modelica_SIunits.Length h_g(start=0)
        "Geodetic height (heigth difference from flowPort_a to flowPort_b)";
      Modelica_Thermal_HeatTransfer_Interfaces.HeatPort_a heatPort
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}},
              rotation=0)));
    equation
      // coupling with FrictionModel
      volumeFlow = V_flow;
      dp = pressureDrop + medium.rho*Modelica_Constants.g_n*h_g;
      // energy exchange with medium
      Q_flow = heatPort.Q_flow + Q_friction;
      // defines heatPort's temperature
      heatPort.T = T_q;
    annotation (Documentation(info="<HTML>
Pipe with heat exchange.<br>
Thermodynamic equations are defined by Partials.TwoPort.<br>
Q_flow is defined by heatPort.Q_flow.<br>
<b>Note:</b> Setting parameter m (mass of medium within pipe) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
<b>Note:</b> Injecting heat into a pipe with zero massflow causes
temperature rise defined by storing heat in medium's mass.
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-90,20},{90,-20}},
              lineColor={255,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Text(extent={{-150,100},{150,40}}, textString="%name"),
            Polygon(
              points={{-10,-90},{-10,-40},{0,-20},{10,-40},{10,-90},{-10,-90}},
              lineColor={255,0,0})}));
    end HeatedPipe;

    model Valve "Simple valve"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.TwoPort(
                                          m(start=0), final tapT=1);
      parameter Boolean LinearCharacteristic(start=true)
        "Type of characteristic"
        annotation(Dialog(group="Standard characteristic"), choices(choice=true "Linear", choice=false
            "Exponential"));
      parameter Real y1(min=small, start=1) "Max. valve opening"
        annotation(Dialog(group="Standard characteristic"));
      parameter Modelica_SIunits.VolumeFlowRate Kv1(min=small, start=1)
        "Max. flow @ y = y1"
        annotation(Dialog(group="Standard characteristic"));
      parameter Real kv0(min=small,max=1-small, start=0.01)
        "Leakage flow / max.flow @ y = 0"
        annotation(Dialog(group="Standard characteristic"));
      parameter Modelica_SIunits.Pressure dp0(start=1) "Standard pressure drop"
        annotation(Dialog(group="Standard characteristic"));
      parameter Modelica_SIunits.Density rho0(start=10)
        "Standard medium's density"
        annotation(Dialog(group="Standard characteristic"));
      parameter Real frictionLoss(min=0, max=1, start=0)
        "Part of friction losses fed to medium";
    protected
      constant Modelica_SIunits.VolumeFlowRate unitVolumeFlowRate = 1;
      constant Real small=Modelica_Constants.small;
      constant Modelica_SIunits.VolumeFlowRate smallVolumeFlowRate = eps*unitVolumeFlowRate;
      constant Real eps=Modelica_Constants.eps;
      Real yLim = max(min(y,y1),0) "Limited valve opening";
      Modelica_SIunits.VolumeFlowRate Kv "Standard flow rate";
    public
      Modelica_Blocks_Interfaces.RealInput y
        annotation (Placement(transformation(
            origin={0,90},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    initial algorithm
      assert(y1>small, "Valve characteristic: y1 has to be > 0 !");
      assert(Kv1>smallVolumeFlowRate, "Valve characteristic: Kv1 has to be > 0 !");
      assert(kv0>small, "Valve characteristic: kv0 has to be > 0 !");
      assert(kv0<1-eps, "Valve characteristic: kv0 has to be < 1 !");
    equation
      // evaluate standard characteristic
      Kv/Kv1 = if LinearCharacteristic then (kv0 + (1-kv0)*yLim/y1) else kv0*exp(Modelica_Math.log(1/kv0)*yLim/y1);
      // pressure drop under real conditions
      dp/dp0 = medium.rho/rho0*(V_flow/Kv)*abs(V_flow/Kv);
      // no energy exchange with medium
      Q_flow = frictionLoss*V_flow*dp;
    annotation (Documentation(info="<HTML>
<p>Simple controlled valve.</p>
<p>
Standard characteristic Kv=<i>f </i>(y) is given at standard conditions (dp0, rho0),
</p>
<ul>
<li>either linear :<code> Kv/Kv1 = Kv0/Kv1 + (1-Kv0/Kv1) * y/Y1</code></li>
<li>or exponential:<code> Kv/Kv1 = Kv0/Kv1 * exp[log(Kv1/Kv0) * y/Y1]</code></li>
</ul>
<p>
where:
</p>
<ul>
<li><code>Kv0 ... min. flow @ y = 0</code></li>
<li><code>Y1 .... max. valve opening</code></li>
<li><code>Kv1 ... max. flow @ y = Y1</code></li>
</ul>
<p>
Flow resistance under real conditions is calculated by
</p>
<blockquote><pre>
V_flow**2 * rho / dp = Kv(y)**2 * rho0 / dp0
</pre></blockquote>
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Text(extent={{-150,-60},{150,-120}}, textString="%name"),
            Polygon(
              points={{-90,10},{-60,10},{-60,60},{0,0},{60,60},{60,10},{90,10},
                  {90,-10},{60,-10},{60,-60},{0,0},{-60,-60},{-60,-10},{-90,-10},
                  {-90,10}},
              lineColor={255,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Line(points={{0,80},{0,0}}, color={0,0,127})}));
    end Valve;
  annotation (Documentation(info="<HTML>
<p>This package contains components:</p>
<ul>
<li>pipe without heat exchange</li>
<li>pipe with heat exchange</li>
<li>valve (simple controlled valve)</li>
</ul>
<p>
Pressure drop is taken from partial model SimpleFriction. 
Thermodynamic equations are defined in partial models (package Partials).</p>

</HTML>", revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.20 Beta 2005/02/18 Anton Haumer<br>
       introduced geodetic height in Components.Pipes<br>
       <i>new models: Components.Valve</i></li>
  <li> v1.30 Beta 2005/06/02 Anton Haumer<br>
       friction losses are fed to medium</li>
  </ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={
      Polygon(
        origin = {6,40},
        lineColor = {0,0,255},
        fillColor = {0,128,255},
        fillPattern = FillPattern.Solid,
        points = {{-56,10},{-56,-90},{-6,-40},{44,10},{44,-90},{-56,10}}),
      Polygon(
        origin = {6,40},
        lineColor = {0,0,127},
        fillColor = {0,0,127},
        fillPattern = FillPattern.Solid,
        points = {{-16,10},{4,10},{-6,-10},{-16,10}}),
      Line(
        origin = {6,40},
        points = {{-6,-10},{-6,-40},{-6,-38}},
        color = {0,0,127})}));
  end Components;

  package Media "Medium properties"
    extends Modelica_Icons.MaterialPropertiesPackage;

    record Medium "Record containing media properties"
      extends Modelica_Icons.Record;
      parameter Modelica_SIunits.Density rho = 1 "Density";
      parameter Modelica_SIunits.SpecificHeatCapacity cp = 1
        "Specific heat capacity at constant pressure";
      parameter Modelica_SIunits.SpecificHeatCapacity cv = 1
        "Specific heat capacity at constant volume";
      parameter Modelica_SIunits.ThermalConductivity lamda = 1
        "Thermal conductivity";
      parameter Modelica_SIunits.KinematicViscosity nue = 1
        "Kinematic viscosity";
      annotation (Documentation(info="<html>
Record containing (constant) medium properties.
</html>"));
    end Medium;

    record Air_30degC "Medium: properties of air at 30 degC"
    extends Medium(
      rho=1.149,
      cp=1007,
      cv= 720,
      lamda=0.0264,
      nue=16.3E-6);
      annotation (Documentation(info="<html>
Medium: properties of air at 30 degC
</html>"));
    end Air_30degC;

    record Air_70degC "Medium: properties of air at 70 degC"
    extends Medium(
      rho=1.015,
      cp=1010,
      cv= 723,
      lamda=0.0293,
      nue=20.3E-6);
      annotation (Documentation(info="<html>
Medium: properties of air at 70 degC
</html>"));
    end Air_70degC;

    record Water "Medium: properties of water"
    extends Medium(
      rho=995.6,
      cp=4177,
      cv=4177,
      lamda=0.615,
      nue=0.8E-6);
      annotation (Documentation(info="<html>
Medium: properties of water
</html>"));
    end Water;
  annotation (Documentation(info="<HTML>
<p>This package contains definitions of medium properties.</p>

</HTML>", revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.11 2005/02/18 Anton Haumer<br>
       corrected usage of cv and cp</li>
  </ul>
</html>"));
  end Media;

  package Sensors "Ideal sensors to measure port properties"
    extends Modelica_Icons.SensorsPackage;

    model PressureSensor "Absolute pressure sensor"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.AbsoluteSensor(
                                                 y(unit="Pa", displayUnit="bar")
          "Absolute pressure as output signal");
    equation
      y = flowPort.p;
    annotation (Documentation(info="<HTML>
pSensor measures the absolute pressure.<br>
Thermodynamic equations are defined by Partials.AbsoluteSensor.
</HTML>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics={Text(
              extent={{-22,-20},{20,-60}},
              lineColor={0,0,255},
              textString="p")}));
    end PressureSensor;

    model TemperatureSensor "Absolute temperature sensor"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.AbsoluteSensor(
                                                 y(unit="K")
          "Absolute temperature as output signal");
    equation
      medium.cp*y = flowPort.h;
    annotation (Documentation(info="<HTML>
TSensor measures the absolute temperature (Kelvin).<br>
Thermodynamic equations are defined by Partials.AbsoluteSensor.
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Text(extent={{-22,-20},{20,-60}},
              lineColor={0,0,255},
              textString="T")}));
    end TemperatureSensor;

    model RelPressureSensor "Pressure difference sensor"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.RelativeSensor(
                                                 y(unit="Pa", displayUnit="bar")
          "Pressure difference as output signal");
    equation
      y = flowPort_a.p - flowPort_b.p;
    annotation (Documentation(info="<HTML>
dpSensor measures the pressure drop between flowPort_a and flowPort_b.<br>
Thermodynamic equations are defined by Partials.RelativeSensor.
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Text(extent={{-22,-20},{20,-60}},
              lineColor={0,0,255},
              textString="dp")}));
    end RelPressureSensor;

    model RelTemperatureSensor "Temperature difference sensor"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.RelativeSensor(
                                                 y(unit="K")
          "Temperature difference as output signal");
    equation
      medium.cp*y = flowPort_a.h - flowPort_b.h;
    annotation (Documentation(info="<HTML>
dTSensor measures the temperature difference between flowPort_a and flowPort_b.<br>
Thermodynamic equations are defined by Partials.RelativeSensor.<br>
<b>Note:</b> Connected flowPorts have the same temperature (mixing temperature)!<br>
Since mixing my occur, the outlet temperature of a component may be different from the connector's temperature.<br>
Outlet temperature is defined by variable T of the corresponding component.
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Text(extent={{-22,-20},{20,-60}},
              lineColor={0,0,255},
              textString="dT")}));
    end RelTemperatureSensor;

    model MassFlowSensor "Mass flow sensor"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.FlowSensor(
                                             y(unit="kg/s")
          "Mass flow as output signal");
    equation
      y = V_flow*medium.rho;
    annotation (Documentation(info="<HTML>
m_flowSensor measures the mass flow rate.<br>
Thermodynamic equations are defined by Partials.FlowSensor.
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Text(extent={{-22,-20},{20,-60}},
              lineColor={0,0,255},
              textString="m")}));
    end MassFlowSensor;

    model VolumeFlowSensor "Volume flow sensor"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.FlowSensor(
                                             y(unit="m3/s")
          "Volume flow as output signal");
    equation
      y = V_flow;
    annotation (Documentation(info="<HTML>
V_flowSensor measures the volume flow rate.<br>
Thermodynamic equations are defined by Partials.FlowSensor.
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Text(extent={{-22,-20},{20,-60}},
              lineColor={0,0,255},
              textString="V")}));
    end VolumeFlowSensor;

    model EnthalpyFlowSensor "Enthalpy flow sensor"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.FlowSensor(
                                             y(unit="W")
          "Enthalpy flow as output signal");
    equation
      y = flowPort_a.H_flow;
    annotation (Documentation(info="<HTML>
H_flowSensor measures the enthalpy flow rate.<br>
Thermodynamic equations are defined by Partials.FlowSensor.
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Text(extent={{-22,-20},{20,-60}},
              lineColor={0,0,255},
              textString="H")}));
    end EnthalpyFlowSensor;
  annotation (Documentation(info="<HTML>
<p>This package contains sensors:</p>
<ul>
<li>pSensor: absolute pressure</li>
<li>TSensor: absolute temperature (Kelvin)</li>
<li>dpSensor: pressure drop between flowPort_a and flowPort_b</li>
<li>dTSensor: temperature difference between flowPort_a and flowPort_b</li>
<li>m_flowSensor: measures mass flow rate</li>
<li>V_flowSensor: measures volume flow rate</li>
<li>H_flowSensor: measures enthalpy flow rate</li>
</ul>

<p>Some of the sensors do not need access to medium properties for measuring,
but it is necessary to define the medium in the connector (check of connections).
Thermodynamic equations are defined in partial models (package Interfaces.Partials). 
All sensors are considered massless, they do not change mass flow or enthalpy flow.</p>

</HTML>", revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  </ul>
</html>"));
  end Sensors;

  package Sources "Ideal fluid sources, e.g., ambient, volume flow"
    extends Modelica_Icons.SourcesPackage;

    model Ambient "Ambient with constant properties"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.Ambient;
      parameter Boolean usePressureInput=false
        "Enable / disable pressure input"
        annotation(Evaluate=true);
      parameter Modelica_SIunits.Pressure constantAmbientPressure(start=0)
        "Ambient pressure"
        annotation(Dialog(enable=not usePressureInput));
      parameter Boolean useTemperatureInput=false
        "Enable / disable temperature input"
        annotation(Evaluate=true);
      parameter Modelica_SIunits.Temperature constantAmbientTemperature(start=293.15, displayUnit="degC")
        "Ambient temperature"
        annotation(Dialog(enable=not useTemperatureInput));
      Modelica_Blocks_Interfaces.RealInput ambientPressure=pAmbient if usePressureInput
        annotation (Placement(transformation(extent={{110,60},{90,80}},
              rotation=0)));
      Modelica_Blocks_Interfaces.RealInput ambientTemperature=TAmbient if useTemperatureInput
        annotation (Placement(transformation(extent={{110,-60},{90,-80}},
              rotation=0)));
    protected
      Modelica_SIunits.Pressure pAmbient;
      Modelica_SIunits.Temperature TAmbient;
    equation
      if not usePressureInput then
        pAmbient = constantAmbientPressure;
      end if;
      if not useTemperatureInput then
        TAmbient = constantAmbientTemperature;
      end if;
      flowPort.p = pAmbient;
      T = TAmbient;
    annotation (Documentation(info="<HTML>
(Infinite) ambient with constant pressure and temperature.<br>
Thermodynamic equations are defined by Partials.Ambient.
</HTML>"),        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Text(
              extent={{20,80},{80,20}},
              lineColor={0,0,0},
              textString="p"), Text(
              extent={{20,-20},{80,-80}},
              lineColor={0,0,0},
              textString="T")}));
    end Ambient;

    model AbsolutePressure "Defines absolute pressure level"

      parameter Media.Medium medium=Media.Medium() "medium"
        annotation (choicesAllMatching=true);
      parameter Modelica_SIunits.Pressure p(start=0) "Pressure ground";
      Modelica_Thermal_FluidHeatFlow_Interfaces.FlowPort_a flowPort(final
          medium=medium) annotation (Placement(transformation(extent={{-110,-10},
                {-90,10}}, rotation=0)));
    equation
      // defining pressure
      flowPort.p = p;
      // no energy exchange; no mass flow by default
      flowPort.H_flow = 0;
    annotation (Documentation(info="<HTML>
AbsolutePressure to define pressure level of a closed cooling cycle.
Coolant's mass flow, temperature and enthalpy flow are not affected.<br>
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Text(extent={{-150,150},{150,90}},
              lineColor={0,0,255},
              textString="%name"),
           Ellipse(extent={{-90,90},{90,-90}},
              lineColor={255,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end AbsolutePressure;

    model VolumeFlow "Enforces constant volume flow"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.TwoPort(
                                          final tapT=1);
      parameter Boolean useVolumeFlowInput=false
        "Enable / disable volume flow input"
        annotation(Evaluate=true);
      parameter Modelica_SIunits.VolumeFlowRate constantVolumeFlow(start=1)
        "Volume flow rate"
        annotation(Dialog(enable=not useVolumeFlowInput));
      Modelica_Blocks_Interfaces.RealInput volumeFlow=internalVolumeFlow if useVolumeFlowInput
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    protected
      Modelica_SIunits.VolumeFlowRate internalVolumeFlow;
    equation
      if not useVolumeFlowInput then
        internalVolumeFlow = constantVolumeFlow;
      end if;
      Q_flow = 0;
      V_flow = internalVolumeFlow;
    annotation (Documentation(info="<HTML>
Fan resp. pump with constant volume flow rate. Pressure increase is the response of the whole system.
Coolant's temperature and enthalpy flow are not affected.<br>
Setting parameter m (mass of medium within fan/pump) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Thermodynamic equations are defined by Partials.TwoPort.
</HTML>"), Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Ellipse(
              extent={{-90,90},{90,-90}},
              lineColor={255,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-90},{150,-150}},
              lineColor={0,0,255},
              textString="%name"),
            Polygon(
              points={{-60,68},{90,10},{90,-10},{-60,-68},{-60,68}},
              lineColor={255,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-40,20},{0,-20}},
              lineColor={0,0,0},
              textString="V")}));
    end VolumeFlow;

    model PressureIncrease "Enforces constant pressure increase"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.TwoPort(
                                          final tapT=1);
      parameter Boolean usePressureIncreaseInput=false
        "Enable / disable pressure increase input"
        annotation(Evaluate=true);
      parameter Modelica_SIunits.Pressure constantPressureIncrease(start=1)
        "Pressure increase"
        annotation(Dialog(enable=not usePressureIncreaseInput));
      Modelica_Blocks_Interfaces.RealInput pressureIncrease=internalPressureIncrease if usePressureIncreaseInput
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    protected
      Modelica_SIunits.Pressure internalPressureIncrease;
    equation
      if not usePressureIncreaseInput then
        internalPressureIncrease = constantPressureIncrease;
      end if;
      Q_flow = 0;
      dp = -internalPressureIncrease;
    annotation (Documentation(info="<HTML>
Fan resp. pump with constant pressure increase. Mass resp. volume flow is the response of the whole system.
Coolant's temperature and enthalpy flow are not affected.<br>
Setting parameter m (mass of medium within fan/pump) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Thermodynamic equations are defined by Partials.TwoPort.
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Ellipse(
              extent={{-90,90},{90,-90}},
              lineColor={255,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-90},{150,-150}},
              lineColor={0,0,255},
              textString="%name"),
            Polygon(
              points={{-60,68},{90,10},{90,-10},{-60,-68},{-60,68}},
              lineColor={0,0,255},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-40,20},{0,-20}},
              lineColor={0,0,0},
              textString="dp")}));
    end PressureIncrease;

    model IdealPump "Model of an ideal pump"

      extends Modelica_Thermal_FluidHeatFlow_Interfaces.Partials.TwoPort(
                                          final tapT=1);
      parameter Modelica_SIunits.AngularVelocity wNominal(start=1, displayUnit="1/min")
        "Nominal speed"
          annotation(Dialog(group="Pump characteristic"));
      parameter Modelica_SIunits.Pressure dp0(start=2)
        "Max. pressure increase @ V_flow=0"
          annotation(Dialog(group="Pump characteristic"));
      parameter Modelica_SIunits.VolumeFlowRate V_flow0(start=2)
        "Max. volume flow rate @ dp=0"
          annotation(Dialog(group="Pump characteristic"));
      Modelica_SIunits.AngularVelocity w=der(flange_a.phi) "Speed";
    protected
      Modelica_SIunits.Pressure dp1;
      Modelica_SIunits.VolumeFlowRate V_flow1;
    public
      Modelica_Mechanics_Rotational_Interfaces.Flange_a flange_a
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}},
              rotation=0)));
    equation
      // pump characteristic
      dp1 = dp0*sign(w/wNominal)*(w/wNominal)^2;
      V_flow1 = V_flow0*(w/wNominal);
      if noEvent(abs(w)<Modelica_Constants.small) then
        dp = 0;
        flange_a.tau = 0;
      else
        dp = -dp1*(1-noEvent(abs(V_flow/V_flow1)));
        flange_a.tau*w = -dp*V_flow;
      end if;
      // no energy exchange with medium
      Q_flow = 0;
    annotation (Documentation(info="<HTML>
Simple fan resp. pump where characteristic is dependent on shaft's speed, <br>
torque * speed = pressure increase * volume flow (without losses)<br>
Pressure increase versus volume flow is defined by a linear function,
from dp0(V_flow=0) to V_flow0(dp=0).<br>
The axis intersections vary with speed as follows:
<ul>
<li>dp prop. speed^2</li>
<li>V_flow prop. speed</li>
</ul>
Coolant's temperature and enthalpy flow are not affected.<br>
Setting parameter m (mass of medium within fan/pump) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Thermodynamic equations are defined by Partials.TwoPort.
</HTML>"), Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Ellipse(
              extent={{-90,90},{90,-90}},
              lineColor={255,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,150},{150,90}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-10,-40},{10,-100}},
              lineColor={0,0,0},
              fillPattern=FillPattern.VerticalCylinder,
              fillColor={175,175,175}),
            Polygon(
              points={{-60,68},{90,10},{90,-10},{-60,-68},{-60,68}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={0,0,255})}));
    end IdealPump;
  annotation (Documentation(info="<HTML>
This package contains different types of sources:
<ul>
<li>Ambient with constant or prescribed pressure and temperature</li>
<li>AbsolutePressure to define pressure level of a closed cooling cycle.</li>
<li>Constant and prescribed volume flow</li>
<li>Constant and prescribed pressure increase</li>
<li>Simple pump with mechanical flange</li>
</ul>
<p>Thermodynamic equations are defined in partial models (package Interfaces.Partials).
All fans / pumps are considered without losses, they do not change enthalpy flow.</p>

</HTML>", revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.20 Beta 2005/02/18 Anton Haumer<br>
       <i>new model: IdealPump</i></li>
  </ul>
</html>"));
  end Sources;

  annotation (
    Documentation(info="<HTML>
<p>This package contains very simple-to-use components to model coolant flows as needed to simulate cooling e.g., of electric machines:</p>
<ul>
<li>Components: components like different types of pipe models</li>
<li>Examples: some test examples</li>
<li>Interfaces: definition of connectors and partial models
(containing the core thermodynamic equations)</li>
<li>Media: definition of media properties</li>
<li>Sensors: various sensors for pressure, temperature, volume and enthalpy flow</li>
<li>Sources: various flow sources</li>
</ul>
<b>Variables used in connectors:</b>
<ul>
<li>Pressure p</li>
<li>flow MassFlowRate m_flow</li>
<li>SpecificEnthalpy h</li>
<li>flow EnthalpyFlowRate H_flow</li>
</ul>
<p>EnthalpyFlowRate means the Enthalpy = cp<sub>constant</sub> * m * T that is carried by the medium's flow.</p>
<b>Limitations and assumptions:</b>
<ul>
<li>Splitting and mixing of coolant flows (media with the same cp) is possible.</li>
<li>Reversing the direction of flow is possible.</li>
<li>The medium is considered to be incompressible.</li>
<li>No mixtures of media is taken into consideration.</li>
<li>The medium may not change its phase.</li>
<li>Medium properties are kept constant.</li>
<li>Pressure changes are only due to pressure drop and geodetic height difference rho*g*h (if h > 0).</li>
<li>A user-defined part (0..1) of the friction losses (V_flow*dp) are fed to the medium.</li>
<li><b>Note:</b> Connected flowPorts have the same temperature (mixing temperature)!<br>
Since mixing may occur, the outlet temperature may be different from the connector's temperature.<br>
Outlet temperature is defined by variable T of the corresponding component.</li>
</ul>
<b>Further development:</b>
<ul>
<li>Additional components like tanks (if needed)</li>
</ul>

<p>
Copyright &copy; 1998-2013, Modelica Association, Anton Haumer, Christian Kral and AIT.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</HTML>", revisions="<HTML>

</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={
      Polygon(
        origin = {11.533,37.938},
        lineColor = {0,128,255},
        fillColor = {0,128,255},
        fillPattern = FillPattern.Solid,
        points = {{-80,10},{-60,-10},{-80,-30},{-20,-30},{0,-10},{-20,10},{-80,10}}),
      Polygon(
        origin = {11.533,37.938},
        lineColor = {255,0,0},
        fillColor = {255,0,0},
        fillPattern = FillPattern.Solid,
        points = {{-40,-90},{-20,-70},{0,-90},{0,-50},{-20,-30},{-40,-50},{-40,-90}}),
      Polygon(
        origin = {11.533,37.938},
        lineColor = {255,128,0},
        fillColor = {255,128,0},
        fillPattern = FillPattern.Solid,
        points = {{-20,10},{0,-10},{-20,-30},{40,-30},{60,-10},{40,10},{-20,10}})}),
    uses(Modelica(version="3.2.1")));
end Modelica_Thermal_FluidHeatFlow;
