import "package:flutter/material.dart";
import 'package:profile_ui/main.dart';

class SkillItem extends StatelessWidget {
  final String text;
  final Skill type;
  final String image;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const SkillItem({
    Key? key,
    required this.text,
    required this.type,
    required this.image,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Color.fromARGB(20, 255, 255, 255),
                borderRadius: BorderRadius.circular(16),
              )
            : null,
        padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
        width: 100,
        child: Column(
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.8),
                          blurRadius: 15,
                        )
                      ],
                    )
                  : null,
              child: Image.asset(
                image,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}
