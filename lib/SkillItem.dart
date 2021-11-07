import "package:flutter/material.dart";

class SkillItem extends StatelessWidget {
  const SkillItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(20, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        width: 110,
        child: Column(
          children: [
            Image.asset(
              "assets/images/photoshop.png",
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 4),
            Text("Flutter"),
          ],
        ),
      ),
    );
  }
}
