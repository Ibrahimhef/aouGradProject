import 'package:flutter/material.dart';
import 'package:saudi_toursim_guide/app_data.dart';
import 'package:saudi_toursim_guide/models/trip.dart';
import 'package:saudi_toursim_guide/screens/CommentsScreen.dart';
import 'package:saudi_toursim_guide/screens/Trips_category_screens.dart';
import 'package:saudi_toursim_guide/screens/Trips_detail.dart';
import 'package:saudi_toursim_guide/screens/login_screen.dart';
import 'package:saudi_toursim_guide/screens/registration_screen.dart';
import 'package:saudi_toursim_guide/screens/tabs_screen.dart';
import 'package:saudi_toursim_guide/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/Trips_category_screens.dart';
import './screens/Trips_detail.dart';

void main() async {
  //make sure that flutter widget
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Trip> _availableTrips = Trips;
    List<Trip> _favorate = [];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          CommentScreen.id: (context) => CommentScreen(),
          TripsCategoryScreens.id: (ctx) =>
              TripsCategoryScreens(_availableTrips),
          TripsDetail.id: (ctx) => TripsDetail(),
          TabsScreen.id: (context) => TabsScreen(_favorate),
        });
  }
}
