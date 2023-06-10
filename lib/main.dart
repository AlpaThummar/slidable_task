import 'package:controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:
        ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple,iconTheme: IconThemeData(color: Colors.green))),
    home: _Dismissiable(),
  ));
}

class _Dismissiable extends StatefulWidget {
  const _Dismissiable({Key? key}) : super(key: key);

  @override
  State<_Dismissiable> createState() => _DismissiableState();
}

class _DismissiableState extends State<_Dismissiable> {
  TextEditingController t1 = TextEditingController();

  List l = [
    "one",
    "two",
    "Thrre",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "nigne",
    "Ten"
  ];
  bool t = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (Orientation.portrait == orientation) {
          SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
          t = true;
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom]);
          t = false;
        }

        return Scaffold(
          appBar: (t)
              ? AppBar(
                  title: Text("Dismissable"),
                )
              : null,
          body: SlidableAutoCloseBehavior(
            child: ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                return Slidable(
                    startActionPane:
                        ActionPane(motion: BehindMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          l.remove(l[index]);
                          setState(() {});
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white60,
                        icon: Icons.delete,
                        label: "Delete",
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Container(
                                  height: 50,
                                  width: 25,
                                  color: Colors.black,
                                  child: Center(
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                actions: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.black,
                                          labelStyle: TextStyle(fontSize: 50)),
                                      controller: t1,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          l[index] = t1.text.toString();
                                          t1.text = "";
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "ok",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.green),
                                          ),
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white60,
                        icon: Icons.edit,
                        label: "Edit",
                      )
                    ]),
                    endActionPane:
                        ActionPane(motion: ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          l.remove(l[index]);
                          setState(() {});
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white60,
                        icon: Icons.delete,
                        label: "Delete",
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {});
                        },
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white60,
                        icon: Icons.edit,
                        label: "Edit",
                      )
                    ]),
                    child: Card(
                        child: ListTile(
                      title: Text("${l[index]}"),
                    )));
              },
            ),
          ),
        );
      },
    );
  }
}
