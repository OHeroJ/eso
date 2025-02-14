import 'package:flutter/material.dart';

/// icon text
class IconText extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final double? iconSize;
  final Axis direction;

  /// icon padding
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow overflow;
  final TextAlign? textAlign;

  const IconText(this.text,
      {super.key,
      this.icon,
      this.iconSize,
      this.direction = Axis.horizontal,
      this.style,
      this.maxLines,
      this.softWrap,
      this.padding,
      this.textAlign,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return Text(text ?? '', style: style);
    }

    if (text == null || text!.isEmpty) {
      return (padding == null
          ? icon!
          : Padding(padding: padding!, child: icon));
    }

    return RichText(
      text: TextSpan(style: style, children: [
        WidgetSpan(
            child: IconTheme(
          data: IconThemeData(
              size: iconSize ??
                  (style == null || style!.fontSize == null
                      ? 16
                      : style!.fontSize! + 1),
              color: style == null ? null : style!.color),
          child: padding == null
              ? icon!
              : Padding(
                  padding: padding!,
                  child: icon,
                ),
        )),
        TextSpan(text: direction == Axis.horizontal ? text : "\n$text"),
      ]),
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ??
          (direction == Axis.horizontal ? TextAlign.start : TextAlign.center),
    );
  }
}
