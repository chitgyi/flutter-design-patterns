import 'package:flutter/material.dart';
import 'package:test_3d/utils/unit.dart';
import 'package:test_3d/widgets/items/home/unit_item.dart';

class InputUnitView extends StatefulWidget {
  final String leadingTitle;
  final List<Unit> units;
  final Function(Unit) onTapItem;
  final int defaultIndex;

  InputUnitView({
    this.defaultIndex = 0,
    @required this.leadingTitle,
    @required this.units,
    this.onTapItem,
  });

  @override
  _InputUnitViewState createState() => _InputUnitViewState();
}

class _InputUnitViewState extends State<InputUnitView> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.defaultIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: FittedBox(
            child: Text(widget.leadingTitle),
            fit: BoxFit.scaleDown,
          ),
          width: 60,
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Wrap(
            children: widget.units
                .asMap()
                .entries
                .map(
                  (e) => UnitItem(
                    onTap: () {
                      currentIndex = e.key;
                      widget.onTapItem(e.value);
                      setState(() {});
                    },
                    name: e.value.name,
                    isActived: currentIndex == e.key,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
