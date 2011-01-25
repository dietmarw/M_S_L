within Modelica.Media.IdealGases.Common;
package FluidData "Critical data, dipole moments and related data"

  record FluidConstants "Extended fluid constants"
    extends Modelica.Media.Interfaces.PartialMedium.FluidConstants;
    PartialMedium.Temperature criticalTemperature "critical temperature";
    PartialMedium.AbsolutePressure criticalPressure "critical pressure";
    PartialMedium.MolarVolume criticalMolarVolume "critical molar Volume";
    Real acentricFactor "Pitzer acentric factor";
    PartialMedium.Temperature triplePointTemperature "triple point temperature";
    PartialMedium.AbsolutePressure triplePointPressure "triple point pressure";
    PartialMedium.Temperature meltingPoint "melting point at 101325 Pa";
    PartialMedium.Temperature normalBoilingPoint
      "normal boiling point (at 101325 Pa)";
    PartialMedium.DipoleMoment dipoleMoment
      "dipole moment of molecule in Debye (1 debye = 3.33564e10-30 C.m)";
    Boolean hasIdealGasHeatCapacity=false
      "true if ideal gas heat capacity is available";
    Boolean hasCriticalData=false "true if critical data are known";
    Boolean hasDipoleMoment=false "true if a dipole moment known";
    Boolean hasFundamentalEquation=false "true if a fundamental equation";
    Boolean hasLiquidHeatCapacity=false
      "true if liquid heat capacity is available";
    Boolean hasSolidHeatCapacity=false
      "true if solid heat capacity is available";
    Boolean hasAccurateViscosityData=false
      "true if accurate data for a viscosity function is available";
    Boolean hasAccurateConductivityData=false
      "true if accurate data for thermal conductivity is available";
    Boolean hasVapourPressureCurve=false
      "true if vapour pressure data, e.g. Antoine coefficents are known";
    Boolean hasAcentricFactor=false "true if Pitzer accentric factor is known";
    PartialMedium.SpecificEnthalpy HCRIT0=0.0
      "Critical specific enthalpy of the fundamental equation";
    PartialMedium.SpecificEntropy SCRIT0=0.0
      "Critical specific entropy of the fundamental equation";
    PartialMedium.SpecificEnthalpy deltah=0.0
      "Difference between specific enthalpy model (h_m) and f.eq. (h_f) (h_m - h_f)";
    PartialMedium.SpecificEntropy deltas=0.0
      "Difference between specific enthalpy model (s_m) and f.eq. (s_f) (s_m - s_f)";
  end FluidConstants;
  extends Modelica.Icons.Library;

  import Modelica.Media.Interfaces.PartialMedium;
  import Modelica.Media.IdealGases.Common.SingleGasesData;

  constant FluidConstants N2(
                       chemicalFormula =        "N2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7727-37-9",
                       meltingPoint =            63.15,
                       normalBoilingPoint =      77.35,
                       criticalTemperature =    126.20,
                       criticalPressure =        33.98e5,
                       criticalMolarVolume =     90.10e-6,
                       acentricFactor =           0.037,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.N2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants O2(
                       chemicalFormula =        "O2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7782-44-7",
                       meltingPoint =            54.36,
                       normalBoilingPoint =      90.17,
                       criticalTemperature =    154.58,
                       criticalPressure =        50.43e5,
                       criticalMolarVolume =     73.37e-6,
                       acentricFactor =         0.022,
                       dipoleMoment =           0.0,
                       molarMass =              SingleGasesData.O2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants CL2(
                       chemicalFormula =        "CL2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7782-50-5",
                       meltingPoint =           172.19,
                       normalBoilingPoint =     239.12,
                       criticalTemperature =    417.00,
                       criticalPressure =        77.00e5,
                       criticalMolarVolume =    124.00e-6,
                       acentricFactor =         0.069,
                       dipoleMoment =           0.0,
                       molarMass =              SingleGasesData.CL2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants F2(
                       chemicalFormula =        "F2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7782-41-4",
                       meltingPoint =            53.48,
                       normalBoilingPoint =      84.95,
                       criticalTemperature =    144.30,
                       criticalPressure =        52.15e5,
                       criticalMolarVolume =     66.20e-6,
                       acentricFactor =           0.051,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.F2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants CO2(
                       chemicalFormula =        "CO2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "124-38-9",
                       meltingPoint =           216.58,
                       normalBoilingPoint =     -1.0,
                       criticalTemperature =    304.12,
                       criticalPressure =        73.74e5,
                       criticalMolarVolume =     94.07e-6,
                       acentricFactor =           0.225,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.CO2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true); // does not exist!

  constant FluidConstants CO(
                       chemicalFormula =        "CO",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "630-08-0",
                       meltingPoint =            68.15,
                       normalBoilingPoint =      81.66,
                       criticalTemperature =    132.85,
                       criticalPressure =        34.94e5,
                       criticalMolarVolume =     93.10e-6,
                       acentricFactor =           0.045,
                       dipoleMoment =             0.1,
                       molarMass =              SingleGasesData.CO.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants H2(
                       chemicalFormula =        "H2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "800000-51-5",
                       meltingPoint =            13.56,
                       normalBoilingPoint =      20.38,
                       criticalTemperature =     33.25,
                       criticalPressure =        12.97e5,
                       criticalMolarVolume =     65.00e-6,
                       acentricFactor =          -0.216,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.H2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants H2O(
                       chemicalFormula =        "H2O",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7732-18-5",
                       meltingPoint =           273.15,
                       normalBoilingPoint =     373.15,
                       criticalTemperature =    647.14,
                       criticalPressure =       220.64e5,
                       criticalMolarVolume =     55.95e-6,
                       acentricFactor =           0.344,
                       dipoleMoment =             1.8,
                       molarMass =              SingleGasesData.H2O.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants N2O(
                       chemicalFormula =        "N2O",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "10024-97-2",
                       meltingPoint =           182.33,
                       normalBoilingPoint =     184.67,
                       criticalTemperature =    309.60,
                       criticalPressure =        72.55e5,
                       criticalMolarVolume =     97.00e-6,
                       acentricFactor =         0.142,
                       dipoleMoment =           0.2,
                       molarMass =              SingleGasesData.N2O.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants NO(
                       chemicalFormula =        "NO",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "10102-43-9",
                       meltingPoint =           109.51,
                       normalBoilingPoint =     121.38,
                       criticalTemperature =    180.00,
                       criticalPressure =        64.80e5,
                       criticalMolarVolume =     58.00e-6,
                       acentricFactor =           0.582,
                       dipoleMoment =             0.2,
                       molarMass =              SingleGasesData.NO.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants NO2(
                       chemicalFormula =        "NO2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "10102-44-0",
                       meltingPoint =           261.95,
                       normalBoilingPoint =     294.0,
                       criticalTemperature =    431.35,
                       criticalPressure =       101.33e5,
                       criticalMolarVolume =    82.5e-6,
                       acentricFactor =         0.849,
                       dipoleMoment =           0.32,
                       molarMass =              SingleGasesData.NO2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants NH3(
                       chemicalFormula =        "NH3",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7664-41-7",
                       meltingPoint =           195.41,
                       normalBoilingPoint =     239.82,
                       criticalTemperature =    405.40,
                       criticalPressure =       113.53e5,
                       criticalMolarVolume =     72.47e-6,
                       acentricFactor =           0.257,
                       dipoleMoment =             1.5,
                       molarMass =              SingleGasesData.NH3.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants SO2(
                       chemicalFormula =        "SO2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7446-09-5",
                       meltingPoint =           197.67,
                       normalBoilingPoint =     263.13,
                       criticalTemperature =    430.80,
                       criticalPressure =        78.84e5,
                       criticalMolarVolume =    122.00e-6,
                       acentricFactor =         0.245,
                       dipoleMoment =           1.6,
                       molarMass =              SingleGasesData.SO2.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants SO3(
                       chemicalFormula =        "SO3",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7446-11-9",
                       meltingPoint =           289.95,
                       normalBoilingPoint =     317.90,
                       criticalTemperature =    490.90,
                       criticalPressure =        82.10e5,
                       criticalMolarVolume =    126.50e-6,
                       acentricFactor =         0.422,
                       dipoleMoment =           0.0,
                       molarMass =              SingleGasesData.SO3.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants Ar(
                       chemicalFormula =        "Ar",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7440-37-1",
                       meltingPoint =            83.80,
                       normalBoilingPoint =      87.27,
                       criticalTemperature =    150.86,
                       criticalPressure =        48.98e5,
                       criticalMolarVolume =     74.57e-6,
                       acentricFactor =          -0.002,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.Ar.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants He(
                       chemicalFormula =        "He",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7440-59-7",
                       meltingPoint =             2.15,
                       normalBoilingPoint =       4.30,
                       criticalTemperature =      5.19,
                       criticalPressure =         2.27e5,
                       criticalMolarVolume =     57.30e-6,
                       acentricFactor =          -0.390,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.He.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

 constant FluidConstants Ne(
                       chemicalFormula =        "Ne",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "7440-01-9",
                       meltingPoint =            24.56,
                       normalBoilingPoint =      27.07,
                       criticalTemperature =     44.40,
                       criticalPressure =        27.60e5,
                       criticalMolarVolume =     41.70e-6,
                       acentricFactor =          -0.016,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.Ne.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants CH4(
                       chemicalFormula =        "CH4",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "74-82-8",
                       meltingPoint =            90.69,
                       normalBoilingPoint =     111.66,
                       criticalTemperature =    190.56,
                       criticalPressure =        45.99e5,
                       criticalMolarVolume =     98.60e-6,
                       acentricFactor =           0.011,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.CH4.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C2H6(
                       chemicalFormula =        "C2H6",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "74-84-0",
                       meltingPoint =            90.35,
                       normalBoilingPoint =     184.55,
                       criticalTemperature =    305.32,
                       criticalPressure =        48.72e5,
                       criticalMolarVolume =    145.50e-6,
                       acentricFactor =           0.099,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C2H6.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C3H8(
                       chemicalFormula =        "C3H8",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "74-98-6",
                       meltingPoint =            91.45,
                       normalBoilingPoint =     231.02,
                       criticalTemperature =    369.83,
                       criticalPressure =        42.48e5,
                       criticalMolarVolume =    200.00e-6,
                       acentricFactor =           0.152,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C3H8.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C4H10_n_butane(
                       chemicalFormula =        "C4H10",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "106-97-8",
                       meltingPoint =           134.79,
                       normalBoilingPoint =     272.66,
                       criticalTemperature =    425.12,
                       criticalPressure =        37.96e5,
                       criticalMolarVolume =    255.00e-6,
                       acentricFactor =           0.20,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C4H10_n_butane.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C5H12_n_pentane(
                       chemicalFormula =        "C5H12",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "109-66-0",
                       meltingPoint =           143.43,
                       normalBoilingPoint =     309.22,
                       criticalTemperature =    469.70,
                       criticalPressure =        33.70e5,
                       criticalMolarVolume =    311.00e-6,
                       acentricFactor =           0.252,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C5H12_n_pentane.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C6H14_n_hexane(
                       chemicalFormula =        "C6H14",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "110-54-3",
                       meltingPoint =           177.84,
                       normalBoilingPoint =     341.88,
                       criticalTemperature =    507.60,
                       criticalPressure =        30.25e5,
                       criticalMolarVolume =    368.00e-6,
                       acentricFactor =           0.300,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C6H14_n_hexane.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C7H16_n_heptane(
                       chemicalFormula =        "C7H16",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "142-82-5",
                       meltingPoint =           182.59,
                       normalBoilingPoint =     371.57,
                       criticalTemperature =    540.20,
                       criticalPressure =        27.40e5,
                       criticalMolarVolume =    428.00e-6,
                       acentricFactor =           0.350,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C7H16_n_heptane.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C2H4(
                       chemicalFormula =        "C2H4",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "74-85-1",
                       meltingPoint =           103.99,
                       normalBoilingPoint =     169.42,
                       criticalTemperature =    282.34,
                       criticalPressure =        50.41e5,
                       criticalMolarVolume =    131.10e-6,
                       acentricFactor =           0.087,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C2H4.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C3H6_propylene(
                       chemicalFormula =        "C3H6",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "115-07-1",
                       meltingPoint =            87.89,
                       normalBoilingPoint =     225.46,
                       criticalTemperature =    364.90,
                       criticalPressure =        46.00e5,
                       criticalMolarVolume =    184.60e-6,
                       acentricFactor =           0.142,
                       dipoleMoment =             0.4,
                       molarMass =              SingleGasesData.C3H6_propylene.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C4H8_1_butene(
                       chemicalFormula =        "C4H8",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "106-98-9",
                       meltingPoint =            87.79,
                       normalBoilingPoint =     266.92,
                       criticalTemperature =    419.50,
                       criticalPressure =        40.20e5,
                       criticalMolarVolume =    240.80e-6,
                       acentricFactor =           0.194,
                       dipoleMoment =             0.3,
                       molarMass =              SingleGasesData.C4H8_1_butene.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C5H10_1_pentene(
                       chemicalFormula =        "C5H10",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "109-67-1",
                       meltingPoint =           106.95,
                       normalBoilingPoint =     303.11,
                       criticalTemperature =    464.80,
                       criticalPressure =        35.60e5,
                       criticalMolarVolume =    298.40e-6,
                       acentricFactor =           0.237,
                       dipoleMoment =             0.4,
                       molarMass =              SingleGasesData.C5H10_1_pentene.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C6H12_1_hexene(
                       chemicalFormula =        "C6H12",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "592-41-6",
                       meltingPoint =           133.34,
                       normalBoilingPoint =     336.63,
                       criticalTemperature =    504.00,
                       criticalPressure =        31.43e5,
                       criticalMolarVolume =    355.10e-6,
                       acentricFactor =           0.281,
                       dipoleMoment =             0.4,
                       molarMass =              SingleGasesData.C6H12_1_hexene.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C7H14_1_heptene(
                       chemicalFormula =        "C7H14",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "592-76-7",
                       meltingPoint =           153.45,
                       normalBoilingPoint =     366.79,
                       criticalTemperature =    537.30,
                       criticalPressure =        29.20e5,
                       criticalMolarVolume =    409.00e-6,
                       acentricFactor =           0.343,
                       dipoleMoment =             0.3,
                       molarMass =              SingleGasesData.C7H14_1_heptene.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C2H2_vinylidene(
                       chemicalFormula =        "C2H2",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "74-86-2",
                       meltingPoint =           192.35,
                       normalBoilingPoint =     188.40,
                       criticalTemperature =    308.30,
                       criticalPressure =        61.14e5,
                       criticalMolarVolume =    112.20e-6,
                       acentricFactor =           0.189,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C2H2_vinylidene.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C6H6(
                       chemicalFormula =        "C6H6",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "71-43-2",
                       meltingPoint =           278.68,
                       normalBoilingPoint =     353.24,
                       criticalTemperature =    562.05,
                       criticalPressure =        48.95e5,
                       criticalMolarVolume =    256.00e-6,
                       acentricFactor =           0.210,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C6H6.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C8H18_n_octane(
                       chemicalFormula =        "C8H18",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "111-65-9",
                       meltingPoint =           216.39,
                       normalBoilingPoint =     398.82,
                       criticalTemperature =    568.70,
                       criticalPressure =        24.90e5,
                       criticalMolarVolume =    492.00e-6,
                       acentricFactor =           0.399,
                       dipoleMoment =             0.0,
                       molarMass =              SingleGasesData.C8H18_n_octane.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C8H10_ethylbenz(
                       chemicalFormula =        "C8H10",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "100-41-4",
                       meltingPoint =           178.18,
                       normalBoilingPoint =     409.36,
                       criticalTemperature =    617.15,
                       criticalPressure =        36.09e5,
                       criticalMolarVolume =    374.00e-6,
                       acentricFactor =           0.304,
                       dipoleMoment =             0.4,
                       molarMass =              SingleGasesData.C8H10_ethylbenz.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants CH3OH(
                       chemicalFormula =        "CH3OH",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "67-56-1",
                       meltingPoint =           175.49,
                       normalBoilingPoint =     337.69,
                       criticalTemperature =    512.64,
                       criticalPressure =        80.97e5,
                       criticalMolarVolume =    118.00e-6,
                       acentricFactor =           0.565,
                       dipoleMoment =             1.7,
                       molarMass =              SingleGasesData.CH3OH.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C2H5OH(
                       chemicalFormula =        "C2H5OH",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "64-17-5",
                       meltingPoint =           159.05,
                       normalBoilingPoint =     351.80,
                       criticalTemperature =    513.92,
                       criticalPressure =        61.48e5,
                       criticalMolarVolume =    167.00e-6,
                       acentricFactor =           0.649,
                       dipoleMoment =             1.7,
                       molarMass =              SingleGasesData.C2H5OH.MM,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C3H7OH(
                       chemicalFormula =        "C3H7OH",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "71-23-8",
                       meltingPoint =           147.00,
                       normalBoilingPoint =     370.93,
                       criticalTemperature =    536.78,
                       criticalPressure =        51.75e5,
                       criticalMolarVolume =    219.00e-6,
                       acentricFactor =           0.629,
                       dipoleMoment =             1.7,
                       molarMass =              60.1e-3,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  constant FluidConstants C4H9OH(
                       chemicalFormula =        "C4H9OH",
                       iupacName =              "unknown",
                       structureFormula =       "unknown",
                       casRegistryNumber =      "71-36-3",
                       meltingPoint =           183.35,
                       normalBoilingPoint =     390.88,
                       criticalTemperature =    563.05,
                       criticalPressure =        44.23e5,
                       criticalMolarVolume =    275.00e-6,
                       acentricFactor =           0.589,
                       dipoleMoment =             1.8,
                       molarMass =              74.12e-3,
                       hasDipoleMoment =       true,
                       hasIdealGasHeatCapacity=true,
                       hasCriticalData =       true,
                       hasAcentricFactor =     true);

  annotation (Documentation(info="<html>
<p>
This package contains FluidConstants data records for the following 37 gases
(see also the description in
<a href=\"Modelica://Modelica.Media.IdealGases\">Modelica.Media.IdealGases</a>):
</p>
<pre>
Argon             Methane          Methanol       Carbon Monoxide  Carbon Dioxide
Acetylene         Ethylene         Ethanol        Ethane           Propylene
Propane           1-Propanol       1-Butene       N-Butane         1-Pentene
N-Pentane         Benzene          1-Hexene       N-Hexane         1-Heptane
N-Heptane         Ethylbenzene     N-Octane       Chlorine         Fluorine
Hydrogen          Steam            Helium         Ammonia          Nitric Oxide
Nitrogen Dioxide  Nitrogen         Nitrous        Oxide            Neon Oxygen
Sulfur Dioxide    Sulfur Trioxide
</pre>

</html>"));
end FluidData;
