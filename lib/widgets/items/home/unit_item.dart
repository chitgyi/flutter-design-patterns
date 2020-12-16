import 'package:flutter/material.dart';

class UnitItem extends StatelessWidget {
  final String name;
  final bool isActived;
  final Function onTap;
  UnitItem({
    @required this.name,
    this.isActived = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isActived ? Colors.blue.shade900 : Colors.blue.shade300,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
