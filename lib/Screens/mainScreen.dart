import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_meter_flutter/Screens/circle.dart';
import 'package:speedo_meter_flutter/Screens/reading_value.dart';
import 'package:speedo_meter_flutter/bloc_pattern/speedo_bloc.dart';
import 'package:speedo_meter_flutter/bloc_pattern/speedo_event.dart';
import 'package:speedo_meter_flutter/bloc_pattern/speedo_state.dart';
import 'package:speedo_meter_flutter/constants.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final myController = TextEditingController();
  String? textvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
            child: Text(
              Constants.speedoMeter,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Card(
                color: Colors.white30,
                child: SizedBox(
                  height: 150,
                  width: 400,
                  child: Center(
                    child: Column(children: [
                      TextField(
                        onChanged: (value) {
                          textvalue = value;
                        },
                        controller: myController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter the Number',
                          label: Center(child: Text(Constants.textfieldText)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<SpeedoBloc>().add(
                                (ClickEvent(int.tryParse(textvalue ?? '0') ?? 0))
                            );
                          },
                          child: Text(Constants.buttonText)),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      //child: Container(
                      //  width: 200,
                      //  height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: BlocBuilder<SpeedoBloc,SpeedoState>(
                          builder: (context, state) {
                            print('----> SpeedoValue : ${state.SpeedoValue}');
                            if(state is SpeedmeterState){
                              print('---> SpeedmeterState : ${state.speedmetervalue}');
                              textvalue = state.speedmetervalue.toString();
                            }
                            return CustomPaint(
                              size: const Size(300, 300),
                              painter: Circle(
                                  value: int.tryParse(textvalue ?? '0') ?? 0),
                              foregroundPainter: ReadingValue(),
                            );
                          }
                        ),
                      ),
                      // ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

      // Center(
      //   child: CustomPaint(
      //     size: Size(200, 200),
      //     painter: SpeedometerPainter(),
      //   ),
      // ),
    );

  }
}
