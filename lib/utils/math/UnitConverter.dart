import 'package:test_3d/utils/unit.dart';

class UnitConverter {
  UnitType fromUnit;
  UnitType toUnit;

  //set default
  UnitConverter({this.fromUnit = UnitType.M});

  String convert(UnitType newType, String numString) {
    toUnit = newType;
    if (numString.isEmpty) {
      return numString;
    } else {
      return num.parse(numString).from(fromUnit).to(toUnit).toString();
    }
  }

  void refreshType() => fromUnit = toUnit;
}

extension Converter on num {
  // convert to standard unit(m)
  num from(UnitType type) {
    try {
      switch (type) {
        case UnitType.MM:
          return this / 1000;
          break;
        case UnitType.CM:
          return this / 100;
          break;
        case UnitType.KM:
          return this * 1000;
          break;
        //standard unit is metre
        default:
          return this;
      }
    } catch (e) {
      return 0;
    }
  }

  num to(UnitType type) {
    try {
      switch (type) {
        case UnitType.MM:
          return this * 1000;
          break;
        case UnitType.CM:
          return this * 100;
          break;
        case UnitType.KM:
          return this / 1000;
          break;
        default:
          return this;
      }
    } catch (e) {
      return 0;
    }
  }
}
