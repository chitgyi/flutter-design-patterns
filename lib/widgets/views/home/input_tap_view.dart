import 'package:flutter/material.dart';
import 'package:test_3d/utils/math/UnitConverter.dart';
import 'package:test_3d/utils/unit.dart';
import 'package:test_3d/widgets/items/home/edit_text.dart';
import 'package:test_3d/widgets/views/home/input_unit_view.dart';

class InputTapView extends StatelessWidget {
  final _xController = TextEditingController();
  final _yController = TextEditingController();
  final _unitConverter = UnitConverter();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          'assets/images/SingleFooting.png',
        ),
        Divider(),
        InputUnitView(
          defaultIndex: 1, // meter in index 1
          leadingTitle: 'Length',
          units: lengthUnits,
          onTapItem: (unit) {
            _xController.text =
                _unitConverter.convert(unit.type, _xController.text);
            _yController.text =
                _unitConverter.convert(unit.type, _yController.text);

            ///call after all processed converted
            _unitConverter.refreshType();
          },
        ),
        EditText(
          controller: _xController,
          hintText: 'X',
          inputType: TextInputType.number,
        ),
        EditText(
          controller: _yController,
          hintText: 'Y',
          inputType: TextInputType.number,
        ),
      ],
    );
  }
}
