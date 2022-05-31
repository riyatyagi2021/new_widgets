import 'package:flutter/material.dart';
import 'package:trying_widgetss/new_trials/chips/multiselecetion_field.dart';
import 'multiselecetion.dart';

class ChipTrial extends StatefulWidget {
  const ChipTrial({Key? key}) : super(key: key);

  @override
  _ChipTrialState createState() => _ChipTrialState();
}

class _ChipTrialState extends State<ChipTrial> {
  List<String> values=[];
   ValueChanged<List>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text("Anything"),
                  MyMultiSelectionFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
