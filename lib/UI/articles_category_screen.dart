import '../AppThem/appThem.dart';
import '../Moudle/category.dart';
import '../Utitlty/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first/Dashboard.dart';
import 'add_category_screen.dart';

class ArticlesCategory extends StatefulWidget {
  @override
  _ArticlesCategoryState createState() => _ArticlesCategoryState();
}

class _ArticlesCategoryState extends State<ArticlesCategory> {
  DBHelper dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text("Word Articles"),
              actions: [
      
      IconButton(onPressed: () => Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        myhome()
  
        )), icon: Icon(Icons.arrow_circle_left_sharp) ,)

      ],
        
          ),
          body: FutureBuilder(
              future: dbHelper.getCategoryList(dbHelper.TABLE_CATE_NAME),
              builder: (context, sanpShot) {
                if (sanpShot.connectionState == ConnectionState.done) {
                  if (sanpShot.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: sanpShot.data!.length,
                        itemBuilder: (context, int index) {
                          return Card(
                            child: Column(
                              children: [
                                Text(sanpShot.data![index].cateName!),
                                Row(
                                  children: [
                                    InkWell(
                                      child: Icon(Icons.edit),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddCategoryScreen(sanpShot
                                                        .data![index])));
                                      },
                                    ),
                                    InkWell(
                                      child: Icon(Icons.delete),
                                      onTap: () {
                                        _delete(context, sanpShot.data![index]);
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return Text("no data");
                  }
                } else {
                  return Text("no connection");
                }
              }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: pinkColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddCategoryScreen(Category(0, "", 0))));
            },
          ),
        ));
  }

  void _delete(BuildContext context, Category category) async {
    int result = await dbHelper.deleteFromTable(
        dbHelper.TABLE_CATE_NAME, category.id!, dbHelper.CATE_ID);
    setState(() {});
    if (result != 0) {
      _showSnackBar(context, ' Deleted  Successfully');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
