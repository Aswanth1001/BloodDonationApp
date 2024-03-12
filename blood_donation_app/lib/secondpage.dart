import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Add Users"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Donor name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'MObile number'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(label: Text("Select Blood Groups")),
              items: bloodgroup
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                selectedgroup = val as String?;
              },
            ),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {},
              child: Text(
                "submit",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  final bloodgroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedgroup;
}
