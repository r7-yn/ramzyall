import 'package:flutter/material.dart';



class ict6 extends StatefulWidget {
  State createState() => ict6_();
}

class ict6_ extends State<ict6> {
  List<String> l = [];
  @override
  Widget build(BuildContext context) {
    TextEditingController con = new TextEditingController();
    return Column(
      
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Enter'),
            controller: con,
            onSubmitted: (v) => setState(() {
              l.add(v);
            }),
          ),
        ),
        Expanded(
            child: Container(
                child: ListView.builder(
                    itemCount: l.length,
                    itemBuilder: (BuildContext ctx, int i) {
                      return Card(
                        elevation: 10,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => setState(() {
                                    l.removeAt(i);
                                  })),
                          title: Text(l[i]),
                        ),
                      );
                    }))),
      ],
    );
  }
}
