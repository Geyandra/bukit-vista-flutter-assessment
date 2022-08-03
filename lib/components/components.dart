import 'package:bukit_vista_assessment/homepage.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        fixedColor: Colors.blue,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const Homepage())),
                  icon: const Icon(Icons.home)),
              backgroundColor: Colors.white,
              label: "Home"),
          const BottomNavigationBarItem(
              icon: const Icon(Icons.wallet), label: "Wallet"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: "Notification"),
          const BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: "Profile"),
        ]);
  }
}

class column extends StatelessWidget {
  final CrossAxisAlignment align;
  final String ftext;
  final String stext;
  const column({
    required this.align,
    required this.ftext,
    required this.stext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: align, children: [
      Container(
        child: Text(
          ftext,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 3, bottom: 10),
        child: Text(
          stext,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 96, 93, 93),
              fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}

class BookingCard extends StatelessWidget {
  final String codebooking;
  final String statusbooking;
  final Color colorbackground;
  final Color colortext;
  final String hotelname;
  final String stay;
  final margincard;
  final dynamic tap;
  const BookingCard({
    required this.codebooking,
    required this.statusbooking,
    required this.colorbackground,
    required this.colortext,
    required this.hotelname,
    required this.stay,
    this.tap,
    this.margincard,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Card(
        margin: margincard,
        child: Container(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.orange.shade50,
                    ),
                    child: const Icon(
                      Icons.home_outlined,
                      color: Colors.orange,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 17),
                    child: Text(
                      codebooking,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: const EdgeInsets.only(left: 73),
                    decoration: BoxDecoration(
                        color: colorbackground,
                        borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(18),
                            bottomLeft: const Radius.circular(18))),
                    child: Text(
                      statusbooking,
                      style: TextStyle(
                          color: colortext,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 7, left: 54),
                child: Text(
                  hotelname,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 54, bottom: 16),
                child: Text(
                  stay,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class backbutton extends StatelessWidget {
  const backbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const Homepage())),
      icon: const Icon(Icons.arrow_back_ios_sharp),
    );
  }
}

class drawerWidget extends StatelessWidget {
  const drawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            buildMenuItem(
                text: "Profile",
                icon: Icons.person_outline,
                onTap: () => selecteditem(context, 0)),
            const SizedBox(height: 20),
            buildMenuItem(
                text: "Friend List",
                icon: Icons.group_outlined,
                onTap: () => selecteditem(context, 1)),
            const SizedBox(height: 20),
            buildMenuItem(
                text: "Sosmed",
                icon: Icons.phone_android_sharp,
                onTap: () => selecteditem(context, 2)),
            const SizedBox(
              height: 400,
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            buildMenuItem(
                text: "Logout",
                icon: Icons.logout_outlined,
                onTap: () => selecteditem(context, 3)),
          ],
        ),
      ),
    );
  }

  Widget buildheader({
    required String urlimg,
    required String name,
    required String email,
    required VoidCallback onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://w0.peakpx.com/wallpaper/751/41/HD-wallpaper-women-mood-girl-portrait-profile-sunset.jpg"),
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    final color = Colors.black;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: onTap,
    );
  }

  void selecteditem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Homepage();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Homepage();
        }));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Homepage();
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Homepage();
        }));
        break;
    }
  }
}
