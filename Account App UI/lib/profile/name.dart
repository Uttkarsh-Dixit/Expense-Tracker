import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Name extends StatefulWidget{
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  String displayName='Uttkarsh Dixit';

  @override
  void initState() {
    super.initState();
    _loadName();
  }
  Future<void> _saveName(String name) async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setString(displayName, name);
  }
  Future<void> _loadName() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String? name = prefs.getString('displayName');
    if(name!=null && name.isNotEmpty){
      setState(() {
        displayName=name;
      });
    }
  }

  void editName (){
    final TextEditingController controller= TextEditingController(text: displayName);
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Enter name to be Displayed.'),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Name',
              ),

            ),
            actions: [
              TextButton(
                  onPressed: ()=>Navigator.pop(context),
                  child: Text('Cancel')),
              ElevatedButton(
                  child: Text('Save'),
                  onPressed: (){
                    String newName = controller.text.trim();
                    if(newName.isNotEmpty){
                      setState(() {
                        displayName=newName;
                      });
                      _saveName(newName);
                    }
                    Navigator.pop(context);
                  },
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              // backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Username', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color.fromARGB(210,145, 145, 159)
                ),
                ),
                Text(displayName, style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),
                )
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: editName,
            )
            // Icon(Icons.edit)
          ],
        ),
      );
  }
}