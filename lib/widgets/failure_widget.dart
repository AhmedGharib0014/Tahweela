import 'package:flutter/material.dart';
import 'package:tahweela/widgets/text_display.dart';

class FailureWidget extends StatelessWidget {
  final String text;

  FailureWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextDisplay(text: text),
    );
    ;
  }
}
