import 'package:flutter/material.dart';

class ColumnWithSeparator extends StatelessWidget {

  final List<Widget> children;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  ColumnWithSeparator({this.children,this.padding,this.margin,this.crossAxisAlignment,this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.stretch,
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