import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  int values = 0;
  String Name = '_';
  double height = 0.0;
  bool isSwitch = false;
  String desc = '_';

  void initState() {
    super.initState();
    pref();
  }

  void pref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
   values = sp.getInt('id')??0;
    desc = sp.getString('description')??'';
   Name= sp.getString('Name')??'';
   height= sp.getDouble('height')??0.0;
   isSwitch= sp.getBool('gf')??false;
   setState(() { });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Text(values.toString()),
            trailing: Text(height.toString()),
            title: Text(Name),
            subtitle: Text(desc),
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Shared preference'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setInt('id', 2);   sp.setString('description', 'my nmae is narendra');
          sp.setString('Name', 'narendra');
          sp.setDouble('height', 9.3);
          sp.setBool('gf', true);
          setState(() {
            
          });
        },
        child: Icon(Icons.add_to_drive),
      ),
    );
  }
}
