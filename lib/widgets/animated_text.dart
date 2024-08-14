import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration letterSpeed;
  final TextAlign align;

  const AnimatedText({
    super.key,
    required this.text,
    required this.style,
    this.align = TextAlign.center,
    this.letterSpeed = const Duration(milliseconds: 100),
  });

  @override
  AnimatedTextState createState() => AnimatedTextState();
}

class AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late String displayedText;

  @override
  void initState() {
    super.initState();
    displayedText = '';
    controller = AnimationController(
      duration: widget.letterSpeed * widget.text.length,
      vsync: this,
    )
      ..addListener(() {
        final index = (controller.value * widget.text.length).floor();
        setState(() {
          displayedText = widget.text.substring(0, index);
        });
      })
      ..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayedText,
      style: widget.style,
      textAlign: widget.align,
    );
  }
}
