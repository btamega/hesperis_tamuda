import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({ Key? key }) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Français';
    return Drawer(
      child: ListView(
        children:  [
          const UserAccountsDrawerHeader(
            accountName: Text('Bougary TAMEGA'), 
            accountEmail: Text("bougarytamega77@gmail.com",),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                // child: Image(image: image),
              ),
            ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              // style: const TextStyle(color: Colors.deepPurple),
              // underline: Container(
              //   height: 2,
              //   color: Colors.deepPurpleAccent,
              // ),
              onChanged: (String? newValue) {
                setState(() {
                 dropdownValue = 'newValue';
                 });
              },
              items: <String>['Français', 'English', 'عربي']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            
            const ListTile(
              leading: Icon(Icons.history),
              
              title: Text("Historique de lecture"),
              onTap: null,
            ),
            const ListTile(
              leading: Icon(Icons.download),

              title: Text("Mes téléchargements"),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),

              title: const Text("Mes notifications"),
              trailing: ClipOval(
                child:Container(
                  color: Colors.red,
                width: 20,
                height : 20,
                child: const Center(
                  child: Text(
                    '9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),
                  ),
                ),
                ),
              ),
              
            ),
            const ListTile(
              leading: Icon(Icons.settings),

              title: Text("Paramètres"),
            ),
            const ListTile(
              leading: Icon(Icons.logout),

              title: Text("Se déconnecter"),
            ),
        ],
      ),
    );
  }
}