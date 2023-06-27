import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _selected;
  List<Map> _myJson = [
    {'id': '1', 'image': 'assets/images/india.png', 'name': 'INDIA'},
    {'id': '2', 'image': 'assets/images/canada.png', 'name': 'CANADA'},
    {'id': '3', 'image': 'assets/images/poland.png', 'name': 'POLAND'},
    {'id': '4', 'image': 'assets/images/usa.png', 'name': 'USA'},
    {'id': '5', 'image': 'assets/images/africa.png', 'name': 'AFRICA'},
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDown App"),
      ),
      body: Center(
        child: Container(
          width: width - 20,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      hint: const Text('Select Country'),
                      value: _selected,
                      onChanged: (newValue) {
                        setState(() {
                          _selected = newValue as String?;
                        });
                      },
                      items: _myJson.map((Country) {
                        return DropdownMenuItem(
                          value: Country['id'],
                          child: Row(
                            children: [
                              Image.asset(
                                Country['image'],
                                width: 30,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(Country['name']),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
