

import 'package:flutter/material.dart';

import '../services.dart/lists.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {

  int counter = 0;
  @override
  Widget build(BuildContext context) {

 return Scaffold(
  
    floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Color.fromARGB(255, 68, 143, 146),
        child: Icon(Icons.turn_left),
        onPressed: (() {
          Navigator.pop(context);
        }),
      ),
      
      backgroundColor: Colors.grey[100],
      body: ListView(padding: EdgeInsets.zero, children: [
       
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(children: [
              Image.asset('assets/images/background.png'),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 140, 0, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(children: [
                    Text(
                      "Merhabalar!",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Bu aşının geriye ${dozList.length - counter} dozu kaldı.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ]),
                ),
              )
            ]),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Doz yapıldıktan sonra işaretlemeyi unutma.",
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                      Text("${((counter / dozList.length) * 100).round()}%",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 16))
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                        minHeight: 12,
                        color: Color.fromARGB(255, 37, 147, 188),
                        backgroundColor: Color.fromARGB(255, 146, 218, 240),
                        value: (counter / dozList.length)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Divider(),
                ),
                SizedBox(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: dozList.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                          title: Text(dozList[index][1]),
                          subtitle: Text(dozList[index][2]),
                          trailing: dozList[index][3],
                          leading: Checkbox(
                            value: dozList[index][0],
                            onChanged: ((value) {
                              setState(() {
                                if (value == false) {
                                  counter -= 1;
                                  print(counter.toString());
                                  dozList[index][0] = value;
                                } else
                                  counter += 1;
                                print(counter.toString());
                                dozList[index][0] = value;
                              });
                            }),
                          ));
                    },
                  ),
                )
              ],
              
            ),
          ),
        
        )
      ]),
    );

}
  
}