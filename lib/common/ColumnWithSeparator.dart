import 'package:flutter/material.dart';

class ColumnWithSeparator extends StatelessWidget {

  final List<Widget> children;
  final EdgeInsets padding;
  final EdgeInsets margin;

  ColumnWithSeparator({this.children,this.padding,this.margin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children.map((c)=>
      Container(
          margin: margin,
          padding: padding,
          child:c ,
        )
      ).toList(),
    );
  }
}