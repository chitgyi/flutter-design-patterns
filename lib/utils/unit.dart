import 'package:flutter/foundation.dart';

enum UnitType { US, SI, NI, M, KM, CM, MM }

class Unit {
  final String name;
  final UnitType type;
  Unit({@required this.name, @required this.type});
}

final siUnits = [
  Unit(name: 'US', type: UnitType.US),
  Unit(name: 'SI', type: UnitType.SI),
  Unit(name: 'NI', type: UnitType.NI),
];

final lengthUnits = [
  Unit(name: 'km', type: UnitType.KM),
  Unit(name: 'm', type: UnitType.M),
  Unit(name: 'cm', type: UnitType.CM),
  Unit(name: 'mm', type: UnitType.MM)
];
