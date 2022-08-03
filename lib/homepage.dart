import 'dart:convert';
import 'package:bukit_vista_assessment/components/components.dart';
import 'package:bukit_vista_assessment/guest_detail.dart';
import 'package:bukit_vista_assessment/guest.dart';
import 'package:bukit_vista_assessment/guest_api.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      endDrawer: const drawerWidget(),
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [],
            ),
            child: Builder(builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: const Icon(Icons.menu));
            }),
          )
        ],
        centerTitle: true,
        title: const Text("Guest List"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(95),
          child: Container(
            height: 50,
            margin: const EdgeInsets.fromLTRB(20, 30, 80, 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your guest name',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
      body: FutureBuilder<List<guestData>>(
          future: guestapi.getUserLocally(context),
          builder: (context, snapshot) {
            final guests = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Some Error Occured!"),
                  );
                } else {
                  return Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: buildguest(guests!));
                }
            }
          }),
    );
  }

  Widget buildguest(List<guestData> guests) => ListView.builder(
      itemCount: guests.length,
      itemBuilder: (context, index) {
        final guest = guests[index];
        return Card(
          margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
          child: Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => details(guest: guest))),
              leading: CircleAvatar(
                radius: 30,
                // backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    guest.photo),
              ),
              title: Text(
                guest.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(guest.address),
              trailing: IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        );
      });
}
