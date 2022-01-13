import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData baseTheme({ColorScheme cScheme, Color background, Color text}) {
  return ThemeData(
      fontFamily: 'Poppins',
      colorScheme: cScheme,
      scaffoldBackgroundColor: background,
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: text),
        headline2: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: text),
        headline3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: text),
        headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: text),
        bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: background),
        bodyText2: TextStyle(fontSize: 16.0, color: text),
      ),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: text, fontWeight: FontWeight.bold),
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: text),
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: text),
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: text.withAlpha(87)),
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: text),
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
      )
  );
}

ThemeData genLightTheme (){

  var primary = Color(0xFF07054C);
  var primarytrans = Color(0xB31156BD);
  var secondary = Color(0xFFDB4D20);
  var secondarytrans = Color(0xFF697EAF);
  var accent = Color(0xFF07054C);
  var surface = Color(0xFFFFFFFF);
  var background = Color(0xFFFFC738);

  ColorScheme cScheme = ColorScheme(
      primary: primary,
      primaryVariant: secondarytrans,
      secondary: secondary,
      secondaryVariant: primarytrans,

      surface: surface, //box gradient 1
      background: secondarytrans, //box gradient 2
      error: primarytrans, //shadows
      onPrimary: background,
      onSecondary: surface,
      onSurface: primary,
      onBackground: primary,
      onError: primary, //menu buttons
      brightness: Brightness.light
  );
  return baseTheme(
    cScheme: cScheme,
    background: background,
    text: accent
  );
}

ThemeData genDarkTheme (){

  var primary = Color(0xFFFFC738);
  var primarytrans = Color(0x87FFC738);
  var secondary = Color(0xFFDB4D20);
  var secondarytrans = Color(0x87DB4D20);
  var accent = Color(0xFF78524a);
  var surface = Color(0xFF07054C);
  var background = Color(0xFF07054C);
  var text = Color(0xFFFFFFFF);
  var shadow = Color(0x87473F3C);

  ColorScheme cScheme = ColorScheme(
      primary: primary,
      primaryVariant: primarytrans,
      secondary: secondary,
      secondaryVariant: secondarytrans,

      surface: accent, //box gradient 2
      background: surface, //box gradient 1
      error: shadow, //shadows
      onPrimary: background,
      onSecondary: text,
      onSurface: text,
      onBackground: secondary,

      onError: surface, //menu buttons
      brightness: Brightness.dark
  );
  return baseTheme(
      cScheme: cScheme,
      background: background,
      text: text
  );
}

ThemeData lightTheme = genLightTheme();
ThemeData darkTheme = genDarkTheme();

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  get getTheme => _themeData;
  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}