import 'package:flutter/material.dart';

import 'multiselecetion.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  List _ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyMultiSelectionFormField(
                      decoration: const InputDecoration(
                        labelText: 'Ingredients',
                      ),
                      validator: (ingredients) => (ingredients?.length ?? 0) < 3
                          ? 'Please add at least 3 ingredients'
                          : null,
                      onSaved: (ingredients) {
                        _ingredients = ingredients!;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _formKey.currentState!.save();
                          });
                        }
                      },
                      child: const Text('Submit'),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _ingredients.length,
                        itemBuilder: (context, index) {
                          return Text('${_ingredients[index]}');
                        }
                    )
                  ],
                )
            )
        ),
      ),
    );
  }
}
