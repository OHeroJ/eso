import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class LandingPage extends StatelessWidget {
  final Color? color;
  final Widget? title;
  final Brightness? brightness;
  const LandingPage({super.key, this.color, this.title, this.brightness});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: globalDecoration,
      child: Scaffold(
        backgroundColor: color,
        appBar: title == null
            ? null
            : AppBar(
                title: title,
                backgroundColor: Colors.transparent,
                titleSpacing: 0,
                elevation: 0,
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarBrightness: brightness),
              ),
        body: Center(
          child: SizedBox(width: 200, child: CupertinoActivityIndicator()),
        ),
      ),
    );
  }
}
