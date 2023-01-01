

import 'package:flutter/material.dart';
import 'package:trackapp/pages/doz.dart';
import '../services.dart/lists.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


List <String> doses = ['1 doz', '2 doz', '3 doz', '4 doz'];
List <String> ay = ['1 ay','2 ay', '3 ay', '4 ay', '5 ay', '6 - 12 ay', '12 - 24 ay', '2 yıl+', '5 yıl+'];



@override
  Widget build(BuildContext context) {

//void addData (Vaccine name, dozBilgisi, dozAraligi){ setState(() {
//  asilar.add(name);});}

  void addToVaccList(String vaccineName, String dozBilgim, String aralikBilgisi) {
      vaccList.add([false, vaccineName, dozBilgim, Icon(Icons.abc)]);
    }

    void asiEkle(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController vaccineNameController =
                TextEditingController();
            TextEditingController dozBilgisiController =
                TextEditingController();
            TextEditingController zamanController =
                TextEditingController();
            TextEditingController aralikController =
                TextEditingController();


            return AlertDialog(
              title: Text("Aşı Ekle"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  TextFormField(
                    controller: vaccineNameController,
                    decoration: InputDecoration(
                      labelText: 'Aşı Adını Giriniz'
                    ),
                  ),
              

              
                  TextFormField(
          controller: dozBilgisiController,
          decoration: InputDecoration(
            labelText: 'Doz Bilgisi Seçiniz' ,
            suffixIcon: PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              onSelected: (String value) {
              dozBilgisiController.text = value;
              },
              itemBuilder: (BuildContext context) {
                return doses
                    .map<PopupMenuItem<String>>((String value) {
                  return new PopupMenuItem(
                      child: new Text(value), value: value);
                }).toList();
              },
            ),
          ),
        ),



      TextFormField(
          controller: aralikController,
          decoration: InputDecoration(
            labelText: 'Doz Aralığı Seçiniz' ,
            suffixIcon: PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              onSelected: (String value) {
              aralikController.text = value;
              },
              itemBuilder: (BuildContext context) {
                return ay
                    .map<PopupMenuItem<String>>((String value) {
                  return new PopupMenuItem(
                      child: new Text(value), value: value);
                }).toList();
              },
            ),
          ),
        ),

     TextFormField(
                    controller: zamanController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.date_range_outlined),
                      labelText: 'Tarih Giriniz'
                    ),
            

                  ),


         ],
              ),
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color.fromARGB(255, 45, 163, 171)),
                        surfaceTintColor:
                            MaterialStateProperty.all(Color.fromARGB(255, 45, 163, 171))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("İptal")),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color.fromARGB(255, 45, 163, 171)),
                        surfaceTintColor:
                            MaterialStateProperty.all(Color.fromARGB(255, 45, 163, 171))),
                    onPressed: () {
                      setState(() {
                        addToVaccList(vaccineNameController.text,
                            dozBilgisiController.text, aralikController.text );
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Kaydet"))
              ],
            );
          });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        mini: true,
        backgroundColor: Color.fromARGB(255, 68, 143, 146),
        child: Icon(Icons.add),
        onPressed: (() {
          asiEkle(context);
        }),
      ),

      backgroundColor: Colors.grey[100],
      body: ListView(padding: EdgeInsets.zero, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(children: [
              Image.asset('assets/images/MainBackground.png'),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 140, 0, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(children: const [
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
                      "Aşılarınıza göz atabilirsiniz.",
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
        Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            // ignore: prefer_const_literals_to_create_immutables
          ),
        ),
        Padding(

          padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Aşılar",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),

            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: [
              ListTile(
                
                  leading: CircularProgressIndicator(
                    color: Color.fromARGB(255, 48, 178, 184),
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 161, 227, 230),
                    value: 1,
                  ),
                  
                  title: Text(
                    "Hepatit B",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                 
                  
                  trailing: IconButton(onPressed: () {
                     Navigator.push(context, 
                      
                      MaterialPageRoute(builder: (context) => ProgressPage())
                      );
                  }, iconSize: 30,
                    icon: const Icon(Icons.touch_app)),),
                  
              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Color.fromARGB(255, 48, 178, 184),
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 161, 227, 230),
                    value: 0.95,
                  ),
                  title: Text(
                    "Tetanos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  
                  trailing: IconButton(onPressed: () {
                     Navigator.push(context, 
                      
                      MaterialPageRoute(builder: (context) => ProgressPage())
                      );
                  }, 
                  iconSize: 30,
                  icon: const Icon(Icons.touch_app)),),
              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Color.fromARGB(255, 48, 178, 184),
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 161, 227, 230),
                    value: 0.8,
                  ),
                  title: Text(
                    "Suçiçeği",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  
                  
                  trailing: IconButton(onPressed: () {
                     Navigator.push(context, 
                      
                      MaterialPageRoute(builder: (context) => ProgressPage())
                      );
                  }, 
                  iconSize: 30,
                  icon: const Icon(Icons.touch_app)),),

              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color:Color.fromARGB(255, 48, 178, 184),
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 161, 227, 230),
                    value: 0.65,
                  ),
                  title: Text(
                    "KKK",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                 
                  
                  trailing: IconButton(onPressed: () {
                     Navigator.push(context, 
                      
                      MaterialPageRoute(builder: (context) => ProgressPage())
                      );
                  }, 
                  iconSize: 30,
                  icon: const Icon(Icons.touch_app)),),

            ]),
          ),
        ),
       
      ]),
    );
  }
}