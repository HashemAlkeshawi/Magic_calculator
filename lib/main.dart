import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magic_calculator/screens/calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  List<String> passEquation = ['0', '0', '0'];

  var sharedpreferences = await SharedPreferences.getInstance();
  print(sharedpreferences.getStringList('passEquation'));

  sharedpreferences.getStringList('passEquation') ??
      sharedpreferences.setStringList('passEquation', passEquation);

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      fallbackLocale: Locale('en'),
      child: App()));
}

class App extends StatelessWidget {
  // ThemeData? theme = ThemeData.light();
  // changeTheme() {
  //   theme == ThemeData.dark()
  //       ? theme = ThemeData.light()
  //       : theme = ThemeData.dark();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData.dark(),
      // theme: theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Magic_calculator(),
    );
  }
}
