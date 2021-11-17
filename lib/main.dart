import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_ui/SkillItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleThemeMode() {
    setState(() {
      if (themeMode == ThemeMode.dark) {
        this.themeMode = ThemeMode.light;
      } else {
        this.themeMode = ThemeMode.dark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('fa'),
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme('fa')
          : MyAppThemeConfig.light().getTheme('fa'),
      home: Home(toggleThemeMode: toggleThemeMode),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAppThemeConfig {
  static const faPrimaryFontFamily = "iransans";

  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Color appBarTextColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Colors.grey.shade100.withOpacity(0.1),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        appBarTextColor = Colors.white,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Colors.black.withOpacity(0.1),
        backgroundColor = Colors.white,
        appBarColor = Colors.pink,
        appBarTextColor = Colors.white,
        brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
      primarySwatch: Colors.pink,
      primaryColor: primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.pink.shade400),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
      textTheme: languageCode == "en" ? enPrimaryTextTheme : faPrimaryTextTheme,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        labelStyle: TextStyle(color: primaryTextColor, fontSize: 16),
      ),
      hintColor: surfaceColor,
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
      ),
    );
  }

  TextTheme get enPrimaryTextTheme {
    return GoogleFonts.latoTextTheme(
      TextTheme(
        bodyText1: TextStyle(
          fontSize: 15,
          color: secondaryTextColor,
        ),
        headline1: TextStyle(
          fontSize: 18,
          color: primaryTextColor,
        ),
        headline2: TextStyle(
          fontSize: 14,
          color: primaryTextColor,
        ),
        headline3: TextStyle(
          fontSize: 13,
          color: primaryTextColor,
        ),
        headline6: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: appBarTextColor,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          color: primaryTextColor,
        ),
        subtitle2: TextStyle(
          fontSize: 12,
          color: secondaryTextColor,
        ),
      ),
    );
  }

  TextTheme get faPrimaryTextTheme {
    return TextTheme(
      bodyText1: TextStyle(
        fontSize: 13,
        color: secondaryTextColor,
        fontFamily: faPrimaryFontFamily,
        fontWeight: FontWeight.w500,
      ),
      headline1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: primaryTextColor,
        fontFamily: faPrimaryFontFamily,
      ),
      headline2: TextStyle(
        fontSize: 14,
        color: primaryTextColor,
        fontFamily: faPrimaryFontFamily,
      ),
      headline3: TextStyle(
        fontSize: 13,
        color: primaryTextColor,
        fontFamily: faPrimaryFontFamily,
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: appBarTextColor,
        fontFamily: faPrimaryFontFamily,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        color: primaryTextColor,
        fontFamily: faPrimaryFontFamily,
      ),
      subtitle2: TextStyle(
        fontSize: 12,
        color: secondaryTextColor,
        fontFamily: faPrimaryFontFamily,
      ),
    );
  }
}

enum Skill { photoshop, xd, illustrator, afterEffects, lightRoom }

class Home extends StatefulWidget {
  final Function() toggleThemeMode;

  const Home({Key? key, required this.toggleThemeMode});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Skill _skill = Skill.photoshop;

  void _updateSelectedSkill(Skill skill) {
    setState(() {
      this._skill = skill;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _locale.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: widget.toggleThemeMode,
            icon: Icon(CupertinoIcons.moon),
            color: Theme.of(context).textTheme.headline6!.color,
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          _locale.name,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 4),
                        Text(
                          _locale.job,
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
                              _locale.location,
                              style: Theme.of(context).textTheme.subtitle2,
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
                _locale.summary,
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
                          type: Skill.photoshop,
                          text: "Photoshop",
                          image: "assets/images/photoshop.png",
                          isActive: _skill == Skill.photoshop,
                          shadowColor: Colors.blue,
                          onTap: () => _updateSelectedSkill(Skill.photoshop),
                        ),
                        SkillItem(
                          type: Skill.xd,
                          text: "Adobe XD",
                          image: "assets/images/xd.png",
                          isActive: _skill == Skill.xd,
                          shadowColor: Colors.pink,
                          onTap: () => _updateSelectedSkill(Skill.xd),
                        ),
                        SkillItem(
                          type: Skill.illustrator,
                          text: "illustrator",
                          image: "assets/images/illustrator.png",
                          isActive: _skill == Skill.illustrator,
                          shadowColor: Colors.orange,
                          onTap: () => _updateSelectedSkill(Skill.illustrator),
                        ),
                        SkillItem(
                          type: Skill.afterEffects,
                          text: "After Effect",
                          image: "assets/images/aftereffects.png",
                          isActive: _skill == Skill.afterEffects,
                          shadowColor: Colors.blue.shade800,
                          onTap: () => _updateSelectedSkill(Skill.afterEffects),
                        ),
                        SkillItem(
                          type: Skill.lightRoom,
                          text: "Lightroom",
                          image: "assets/images/lightroom.png",
                          isActive: _skill == Skill.lightRoom,
                          shadowColor: Colors.blue.shade600,
                          onTap: () => _updateSelectedSkill(Skill.lightRoom),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Informations",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
                      style: ButtonStyle(),
                    ),
                  ),
                  SizedBox(height: 28),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
