import 'package:flutter/material.dart';

class MonitoringDrop extends StatelessWidget {
  const MonitoringDrop({Key? key, required this.hint}) : super(key: key);
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: DropdownButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          elevation: 16,
          hint: Text(hint),
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(height: 1.0, color: Colors.grey[500]),
          onChanged: (String? newValue) {},
          items: <String>['KTP', 'Paspor', 'Kartu Pelajar', 'No Telepon']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value.isEmpty ? "KTP" : value),
            );
          }).toList()),
    );
  }
}
