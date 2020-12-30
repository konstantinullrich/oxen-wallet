import 'package:flutter/material.dart';
import 'palette.dart';

class Themes {

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Lato',
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    hintColor: Palette.lightBlue,
    focusColor: Palette.lightGrey, // focused and enabled border color for text fields
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: OxenPalette.black
      ),
      caption: TextStyle(
        color: OxenPalette.black,
      ),
      button: TextStyle(
        color: OxenPalette.black,
          backgroundColor: OxenPalette.tealWithOpacity,
          decorationColor: OxenPalette.teal
      ),
      headline5: TextStyle(
        color: OxenPalette.black // account list tile, contact page
      ),
      subtitle2: TextStyle(
        color: Palette.wildDarkBlue // filters
      ),
      subtitle1: TextStyle(
        color: OxenPalette.black // transaction raw, trade raw
      ),
      overline: TextStyle(
        color: PaletteDark.darkThemeCloseButton // standart list row, transaction details
      )
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: OxenPalette.teal,
      disabledColor: Palette.wildDarkBlue,
      color: Palette.switchBackground,
      borderColor: Palette.switchBorder
    ),
    selectedRowColor: OxenPalette.tealWithOpacity,
    dividerColor: Palette.lightGrey,
    dividerTheme: DividerThemeData(
      color: Palette.lightGrey
    ),
    accentTextTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.grey,
        backgroundColor: Palette.creamyGrey // pin button color
      ),
      caption: TextStyle(
        color: Palette.wildDarkBlue, // clear button color, exchange page
        backgroundColor: Palette.brightBlue, // button blue background color
        decorationColor: Palette.cloudySky // button blue border color
      ),
      button: TextStyle(
        backgroundColor: Palette.indigo, // button indigo background color
        decorationColor: Palette.deepIndigo // button indigo border color
      ),
      subtitle2: TextStyle(
        color: OxenPalette.black,
        backgroundColor: Palette.lightLavender // send page border color
      ),
      headline5: TextStyle(
        color: Palette.lightGrey2, // receive page
        backgroundColor: Colors.white, // restore button background color
        decorationColor: Palette.darkGrey, // restore button border color
      ),
      subtitle1: TextStyle(
        color: Palette.lightBlue, // restore button description
        backgroundColor: Palette.lightGrey2 // change language background color
      ),
      overline: TextStyle(
        color: OxenPalette.blue, // send page text
        backgroundColor: OxenPalette.blue, // send page text
        decorationColor: Palette.manatee // send page text
      )
    ),
    cardColor: Palette.lavender,
    cardTheme: CardTheme(
      color: Palette.cadetBlue
    ),
    buttonColor: Palette.darkGrey,
    primaryIconTheme: IconThemeData(
      color: Colors.white
    ),
    accentIconTheme: IconThemeData(
      color: Colors.white
    )
  );


  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Lato',
    brightness: Brightness.dark,
    backgroundColor: PaletteDark.darkThemeBackgroundDark,
    scaffoldBackgroundColor: PaletteDark.darkThemeBlack,
    hintColor: PaletteDark.darkThemeGrey,
    focusColor: PaletteDark.darkThemeGreyWithOpacity, // focused and enabled border color for text fields
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: PaletteDark.darkThemeTitle
      ),
      caption: TextStyle(
        color: Colors.white
      ),
      button: TextStyle(
        color: Palette.wildDarkBlue,
        backgroundColor: OxenPalette.tealWithOpacity, // button indigo background color
        decorationColor: OxenPalette.teal // button indigo border color
      ),
      headline5: TextStyle(
        color: PaletteDark.darkThemeGrey // account list tile, contact page
      ),
      subtitle2: TextStyle(
        color: PaletteDark.darkThemeGrey // filters
      ),
        subtitle1: TextStyle(
        color: Palette.blueGrey // transaction raw, trade raw
      ),
      overline: TextStyle(
        color: PaletteDark.darkThemeGrey // standart list row, transaction details
      )
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: OxenPalette.teal,
      disabledColor: Palette.wildDarkBlue,
      color: PaletteDark.switchBackground,
      borderColor: PaletteDark.darkThemeMidGrey
    ),
    selectedRowColor: OxenPalette.tealWithOpacity,
    dividerColor: PaletteDark.darkThemeDarkGrey,
    dividerTheme: DividerThemeData(
      color: PaletteDark.darkThemeGreyWithOpacity
    ),
    accentTextTheme: TextTheme(
      headline6: TextStyle(
        color: PaletteDark.darkThemeTitle,
        backgroundColor: PaletteDark.darkThemePinDigitButton // pin button color
      ),
      caption: TextStyle(
        color: PaletteDark.darkThemeTitleViolet, // clear button color, exchange page
        backgroundColor: PaletteDark.darkThemeBlueButton, // button blue background color
        decorationColor: PaletteDark.darkThemeBlueButtonBorder // button blue border color
      ),
      button: TextStyle(
        backgroundColor: PaletteDark.darkThemeIndigoButton, // button indigo background color
        decorationColor: PaletteDark.darkThemeIndigoButtonBorder // button indigo border color
      ),
      subtitle2: TextStyle(
        color: PaletteDark.wildDarkBlueWithOpacity,
        backgroundColor: PaletteDark.darkThemeDarkGrey // send page border color
      ),
      headline5: TextStyle(
        color: PaletteDark.darkThemeBlack, // receive page
        backgroundColor: PaletteDark.darkThemeMidGrey, // restore button background color
        decorationColor: PaletteDark.darkThemeDarkGrey, // restore button border color
      ),
      subtitle1: TextStyle(
        color: Palette.wildDarkBlue, // restore button description
        backgroundColor: PaletteDark.darkThemeMidGrey // change language background color
      ),
      overline: TextStyle(
        color: PaletteDark.darkThemeTitle, // send page text
        backgroundColor: PaletteDark.darkThemeGrey, // send page text
        decorationColor: PaletteDark.darkThemeTitle // send page text
      )
    ),
    cardColor: PaletteDark.darkThemeMidGrey,
    cardTheme: CardTheme(
      color: PaletteDark.darkThemeGrey
    ),
    buttonColor: PaletteDark.darkThemePinButton,
    primaryIconTheme: IconThemeData(
      color: PaletteDark.darkThemeViolet
    ),
    accentIconTheme: IconThemeData(
      color: PaletteDark.darkThemeIndigoButtonBorder
    )
  );

}