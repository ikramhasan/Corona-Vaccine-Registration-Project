import 'package:flutter/material.dart';

class HoverTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double fontSize;

  const HoverTextButton({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.fontSize,
  }) : super(key: key);

  @override
  _HoveTextrButtonState createState() => _HoveTextrButtonState();
}

class _HoveTextrButtonState extends State<HoverTextButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      onTap: widget.onTap,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: isHovering
              ? Theme.of(context).accentColor
              : Theme.of(context).disabledColor,
        ),
      ),
    );
  }
}
