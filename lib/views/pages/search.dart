import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  Icon customIcon = const Icon(Icons.search);
  late Widget customSearchBar=const Text("SEARCH"); 
  @override
  void initState() {
    customSearchBar = const Text("SEARCH");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: customSearchBar,
          centerTitle: true,
          backgroundColor: const Color(0xff3b5998),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                customIcon = const Icon(Icons.cancel);
                customSearchBar = const ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                ),
                title: TextField(
                  decoration: InputDecoration(
                  hintText: 'Tapez votre recherche...',
                  hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  ),
                  border: InputBorder.none,
                  ),
                  style: TextStyle(
                  color: Colors.white,
                  ),
                ),
                );
                } else {
                customIcon = const Icon(Icons.search);
                customSearchBar = const Text('SEARCH');
                }
                });
            },
            icon: customIcon,
            )
            ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ],
          onTap: _onItemTapped,
          ),
      ),
   );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex==0) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
    } else if(_selectedIndex==1){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage(),));
    }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage(),));
    }
  }
}