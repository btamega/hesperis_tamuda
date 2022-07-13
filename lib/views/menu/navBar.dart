import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Bougary TAMEGA'), 
            accountEmail: Text("bougarytamega77@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                // child: Image(image: image),
              ),
            ),
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