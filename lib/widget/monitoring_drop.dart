import 'package:flutter/material.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/controllers/detail_lead_controller.dart';

class MonitoringDrop extends StatelessWidget {
  const MonitoringDrop(
      {Key? key,
      required this.hint,
      required this.data,
      required this.controller,required this.value})
      : super(key: key);
  final String hint;
  final List data;
  final DetailLeadController controller;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: DropdownButton<dynamic>(
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          elevation: 16,
          hint: Text(hint),
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(height: 1.0, color: Colors.grey[500]),
          value: value,
          onChanged: (val) => this.controller.changeValue(val),
          items: data
              .map((value) => DropdownMenuItem(
                    value: value.id,
                    child: Text(value.program),
                  ))
              .toList(),
        ));
  }
}
