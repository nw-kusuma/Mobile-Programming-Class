import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/layouts.dart';



class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage>
  with AutomaticKeepAliveClientMixin<BMIPage>{

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double? _bmi;

  String _message = 'No result yet, please enter your height an weight';

  void _calculate() {
    final double? _height = double.tryParse(_heightController.value.text);
    final double? _weight = double.tryParse(_weightController.value.text);

    if (_height == null || _height <= 0 || _weight == null || _weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = _weight / pow(_height / 100, 2);
      if (_bmi != null){
        if(_bmi! < 18.5) {
          _message = """You are underweight. 
                      \nYou have lower than normal body weight. 
                        You can eat bit more, but keep it in check.""";
        } else if (_bmi! < 25) {
          _message = """Your body is fine. 
                      \nYou have a normal body weight. Good job!""";
        } else if (_bmi! < 30) {
          _message = """You are overweight. 
                      \nYou have higher than normal body weight. 
                        Try exercising more and eat healthily.""";
        } else {
          _message = """You are obese. 
                      \nYou have a serious weight problem. 
                        Consider a diet program, consult with your doctor.""";
        }
      } else {_message;}
    });

    FocusScopeNode _currentFocus = FocusScope.of(context);
    if (!_currentFocus.hasPrimaryFocus) {
      _currentFocus.unfocus();
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: _size.width * 0.75,
            child: Card(
              color: Colors.white, 
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Height (cm)'),
                      controller: _heightController,
                    ),
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Weight (kg)'),
                      controller: _weightController,
                    ),
                    addVerticalSpace(15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      ElevatedButton(
                        onPressed: _calculate,
                        child: Text('Calculate',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        _bmi == null 
                              ? '- - -' 
                              : _bmi!.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 36.0, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ]),
                    addVerticalSpace(10.0),
                    Text(_message, textAlign: TextAlign.center)
                  ],
                ),
              ),
            ),
          ),
        )
      )
    );
  }
}