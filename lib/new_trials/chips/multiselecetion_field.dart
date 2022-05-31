import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chip_list.dart';


class MyMultiSelectionField<T> extends StatelessWidget {

  MyMultiSelectionField({
    Key? key,
    required this.onChanged,
    required this.values,
  }) : super( key: key );

  ValueChanged<List> onChanged;
  List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: InputDecoration(
            //border: InputBorder.none
          ),
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[ ]'))],
          onSubmitted: (String value) {
            if(value.length!=0){
              values.add(value);
            }
            onChanged(values);
          },
        ),
        MyChipList(
            values: values,
            chipBuilder: (String value) {
              return Chip(
                backgroundColor: Colors.teal,
                useDeleteButtonTooltip: true,
                 padding: EdgeInsets.symmetric(horizontal: 2),
                labelPadding:  EdgeInsets.symmetric(horizontal: 10),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                label: Text(value),
                onDeleted: () {
                  values.remove(value);
                  onChanged(values);
                },
              );
            }
        )
      ],
    );
  }
}
