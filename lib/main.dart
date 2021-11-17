import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_ui/SkillItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.pink.shade900,
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyText1: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(200, 255, 255, 255),
            ),
            headline1: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            headline3: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
            headline6: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            subtitle1: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(200, 255, 255, 255),
            ),
          ),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Amir Vahedi',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.moon),
          )
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/profile.jpg",
                      width: 72,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amir Vahedix",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Full-Stack Developer",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              size: 14,
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Tehran, Iran",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Skills",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        CupertinoIcons.chevron_down,
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SkillItem(
                          text: "Photoshop",
                          image: "assets/images/photoshop.png",
                          isActive: true,
                          shadowColor: Colors.blue,
                        ),
                        SkillItem(
                          text: "Adobe XD",
                          image: "assets/images/xd.png",
                          isActive: false,
                          shadowColor: Colors.pink,
                        ),
                        SkillItem(
                          text: "illustrator",
                          image: "assets/images/illustrator.png",
                          isActive: false,
                          shadowColor: Colors.orange,
                        ),
                        SkillItem(
                          text: "After Effect",
                          image: "assets/images/aftereffects.png",
                          isActive: false,
                          shadowColor: Colors.blue.shade800,
                        ),
                        SkillItem(
                          text: "Lightroom",
                          image: "assets/images/lightroom.png",
                          isActive: false,
                          shadowColor: Colors.blue.shade600,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
