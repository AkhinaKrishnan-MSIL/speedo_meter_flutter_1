import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_meter_flutter/Screens/mainScreen.dart';
import 'package:speedo_meter_flutter/bloc_pattern/speedo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>SpeedoBloc(speedoeventValue: 0),
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
          home:MainScreen()
      ),
    );
  }
}

