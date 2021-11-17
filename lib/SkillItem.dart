import "package:flutter/material.dart";

class SkillItem extends StatelessWidget {
  final String text;
  final String image;
  final Color shadowColor;
  final bool isActive;

  const SkillItem({
    Key? key,
    required this.text,
    required this.image,
    required this.shadowColor,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            Image.asset(
              image,
              width: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}
