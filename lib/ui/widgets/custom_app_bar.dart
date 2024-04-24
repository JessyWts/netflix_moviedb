import 'package:flutter/material.dart';
import 'package:netfix_moviedb/utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final IconThemeData? iconTheme;
  final List<Widget>? actions;

  const CustomAppBar({ super.key, this.title, this.backgroundColor, this.leading, this.iconTheme, this.actions, });

  @override
  Widget build(BuildContext context){
    return SliverAppBar(
      floating: true,
      snap: true,
      iconTheme: iconTheme ?? const IconThemeData(
          color: Colors.white
      ),
      backgroundColor: backgroundColor ?? kBackgroundColor,
      title: title,
      leading: leading,
      actions: actions,
    );
  }
}