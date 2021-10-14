import 'package:contact_list/provider_setup.dart';
import 'package:contact_list/ui/views/contact_create_view.dart';
import 'package:contact_list/ui/views/contact_detail_view.dart';
import 'package:contact_list/ui/views/contact_edit_view.dart';
import 'package:contact_list/ui/views/empty_content_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:contact_list/ui/views/contact_view.dart';

void main() async {
  // Initialize the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Contact List',
        // Theme data follows Visa Digital Brand Guidelines Ver 1.0
        theme: ThemeData(
          primaryColor: const Color(0xff1a1f71),
          primaryColorLight: const Color(0xfffa9b00),
          backgroundColor: Colors.white,
          shadowColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(
            color: Color(0xff1a1f71),
            elevation: 0,
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: 21,
              color: Colors.grey[700],
            ),
            bodyText1: TextStyle(
              fontSize: 19,
              color: Colors.grey[500],
            ),
            bodyText2: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        home: ContactView(),
        routes: {
          ContactView.routeName: (context) => ContactView(),
          ContactDetailView.routeName: (context) => ContactDetailView(),
          ContactEditView.routeName: (context) => ContactEditView(),
          ContactCreateView.routeName: (context) => ContactCreateView(),
          EmptyContentView.routeName: (context) => EmptyContentView(),
        },
      ),
    );
  }
}
