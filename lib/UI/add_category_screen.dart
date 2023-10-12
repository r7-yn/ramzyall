import 'package:first/UI/articles_category_screen.dart';

import '../AppThem/appThem.dart';
import '../Moudle/category.dart';
import '../Utitlty/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCategoryScreen extends StatefulWidget {
  Category category;
  AddCategoryScreen(this.category);
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  DBHelper dbHelper = DBHelper();
  TextEditingController name = new TextEditingController();
  TextEditingController number = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    name.text =widget.category.cateName!;
    number.text = widget.category.articlesNumber.toString();
    return WillPopScope(
        onWillPop: () {
          return moveToLastScreen();
        },
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: mainColor,
                title: Text("اضافة"),
                  actions: [
      
      IconButton(onPressed: () => Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        ArticlesCategory()
  
        )), icon: Icon(Icons.arrow_circle_left_sharp) ,)

      ],
        
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: name,
                      onChanged: (vlue) {
                        widget.category.cateName = name.text;
                      },
                      decoration: InputDecoration(
                          labelText: 'اسم الفئة',
                          focusColor: mainColor,
                          hoverColor: mainColor,
                          prefixIcon: Icon(Icons.perm_contact_calendar),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: number,
                      onChanged: (vlue) {
                        widget.category.articlesNumber = int.parse(number.text);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'عدد المقالات ',
                          focusColor: mainColor,
                          hoverColor: mainColor,
                          prefixIcon: Icon(Icons.perm_contact_calendar),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    ElevatedButton(
                        child: Text("حفظ"),
                        onPressed: () {
                          _save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticlesCategory()));
                        })
                  ],
                ),
              ),
            )));
  }

  // Save data to database
  void _save() async {
    final Future<dynamic> dbFuture = dbHelper.createDatatbase();
    moveToLastScreen(); //This moves us back to the notes page
    int result;
    if (widget.category.id == 0) {
      // Case 1: Update operation
      print("samm${widget.category}");
      result = await dbHelper.insertToCateTable(widget.category);
      
    } else {
      // Case 2: Insert Operation
      print("samm2${widget.category}");
      result = await dbHelper.update(
          dbHelper.TABLE_CATE_NAME, dbHelper.CATE_ID, widget.category);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', ' Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  moveToLastScreen() {
    setState(() {});
    Navigator.pop(context, true);
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
