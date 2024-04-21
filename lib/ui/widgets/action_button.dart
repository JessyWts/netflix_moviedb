import 'package:flutter/material.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color color;

const ActionButton({ super.key, required this.label, required this.icon, required this.bgColor, required this.color });

  @override
  Widget build(BuildContext context){
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(width: 5.0,),
          ReusableText(text: label, color: color, fontSize: 16.0, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}