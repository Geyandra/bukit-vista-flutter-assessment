import 'package:bukit_vista_assessment/components/components.dart';
import 'package:bukit_vista_assessment/guest.dart';
import 'package:bukit_vista_assessment/homepage.dart';
import 'package:flutter/material.dart';

class details extends StatelessWidget {
  final guestData guest;
  const details({required this.guest, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: const NavBar(),
        appBar: AppBar(
          title: const Text("Guest Details"),
          centerTitle: true,
          leading: const backbutton(),
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 28),
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(guest.photo),
                  ),
                  title: Text(
                    guest.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Guest since " + guest.guest),
                ),
              ),
            ),
            const TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  const Tab(
                    text: 'Overview',
                  ),
                  const Tab(
                    text: 'Bookings',
                  ),
                  Tab(
                    text: 'Personas',
                  ),
                ]),
            SizedBox(
              height: 420,
              child: TabBarView(children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        title: const Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          guest.email,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 85, 84, 84),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        title: const Text(
                          "Phone Number",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          guest.phone,
                          style: const TextStyle(
                              color: const Color.fromARGB(255, 85, 84, 84),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        title: const Text(
                          "Guest Origin",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          guest.address,
                          style: const TextStyle(
                              color: const Color.fromARGB(255, 85, 84, 84),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    BookingCard(
                      codebooking: guest.booking_id,
                      statusbooking: "Confirmed",
                      colorbackground: const Color.fromARGB(255, 210, 235, 211),
                      colortext: const Color.fromARGB(255, 110, 199, 113),
                      hotelname: "Pondok Lulik #20",
                      stay: "14 Dec 2021 - 14 Jan 2022",
                      margincard: const EdgeInsets.only(top: 30, right: 20, left: 17),
                      tap: () => showModalBottomSheet(
                          enableDrag: true,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          context: context,
                          builder: (context) => Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 25, right: 25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 150, bottom: 40),
                                        height: 2,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: const Text(
                                                "Check in",
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 3),
                                              child: Text(
                                                guest.checkin_time,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        255, 67, 65, 65),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 3),
                                              child: Text(
                                                guest.checkin,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: const Color.fromARGB(
                                                        255, 108, 105, 105)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                "assets/night.png",
                                                width: 20,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "3 Nights",
                                                style: TextStyle(
                                                    color:
                                                        Colors.blue.shade800),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              child: const Text(
                                                "Check out",
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 3),
                                              child: Text(
                                                guest.checkout_time,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        255, 67, 65, 65),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 3),
                                              child: Text(
                                                guest.checkout,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: const Color.fromARGB(
                                                        255, 108, 105, 105)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        column(
                                          align: CrossAxisAlignment.start,
                                          ftext: "Booking ID",
                                          stext: guest.booking_id,
                                        ),
                                        column(
                                            align: CrossAxisAlignment.end,
                                            ftext: "Booking Status",
                                            stext: guest.booking_status)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        column(
                                            align: CrossAxisAlignment.start,
                                            ftext: "Number of guest",
                                            stext: guest.number_guest),
                                        column(
                                            align: CrossAxisAlignment.end,
                                            ftext: "Booking value",
                                            stext: r"$ " + guest.booking_value),
                                      ],
                                    ),
                                    column(
                                        align: CrossAxisAlignment.start,
                                        ftext: "Phone number",
                                        stext: guest.phone),
                                    Container(
                                      margin:
                                          const EdgeInsets.symmetric(vertical: 25),
                                      child: const Text(
                                        "Hosting details",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 96, 93, 93)),
                                      ),
                                    ),
                                    column(
                                        align: CrossAxisAlignment.start,
                                        ftext: "Host",
                                        stext: guest.host),
                                    column(
                                        align: CrossAxisAlignment.start,
                                        ftext: "Profile name",
                                        stext: guest.profile_name),
                                    column(
                                        align: CrossAxisAlignment.start,
                                        ftext: "Property Unit",
                                        stext: guest.property),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: const Text(
                                            "Listing name",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 3, bottom: 40),
                                          child: Text(
                                            guest.listing,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.orange.shade400,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                    ),
                    BookingCard(
                      codebooking: "HMASJKSSCL",
                      statusbooking: "Canceled",
                      colorbackground: Colors.red.shade100,
                      colortext: Colors.red,
                      hotelname: "Atra Bamboology",
                      stay: "14 Dec 2021 - 14 Jan 2022",
                      margincard: const EdgeInsets.only(top: 10, right: 20, left: 20),
                      tap: () => showModalBottomSheet(
                          enableDrag: true,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          context: context,
                          builder: (context) => Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 25, right: 25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 150, bottom: 40),
                                        height: 2,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: const Text(
                                                "Check in",
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 3),
                                              child: Text(
                                                guest.checkin_time,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        255, 67, 65, 65),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 3),
                                              child: Text(
                                                guest.checkin,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: const Color.fromARGB(
                                                        255, 108, 105, 105)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                "assets/night.png",
                                                width: 20,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "3 Nights",
                                                style: TextStyle(
                                                    color:
                                                        Colors.blue.shade800),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              child: const Text(
                                                "Check out",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 3),
                                              child: Text(
                                                guest.checkout_time,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        255, 67, 65, 65),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 3),
                                              child: Text(
                                                guest.checkout,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: const Color.fromARGB(
                                                        255, 108, 105, 105)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        column(
                                          align: CrossAxisAlignment.start,
                                          ftext: "Booking ID",
                                          stext: guest.booking_id,
                                        ),
                                        column(
                                            align: CrossAxisAlignment.end,
                                            ftext: "Booking Status",
                                            stext: guest.booking_status)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        column(
                                            align: CrossAxisAlignment.start,
                                            ftext: "Number of guest",
                                            stext: guest.number_guest),
                                        column(
                                            align: CrossAxisAlignment.end,
                                            ftext: "Booking value",
                                            stext: r"$ " + guest.booking_value),
                                      ],
                                    ),
                                    column(
                                        align: CrossAxisAlignment.start,
                                        ftext: "Phone number",
                                        stext: guest.phone),
                                    Container(
                                      margin:
                                          const EdgeInsets.symmetric(vertical: 25),
                                      child: const Text(
                                        "Hosting details",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 96, 93, 93)),
                                      ),
                                    ),
                                    column(
                                        align: CrossAxisAlignment.start,
                                        ftext: "Host",
                                        stext: guest.host),
                                    column(
                                        align: CrossAxisAlignment.start,
                                        ftext: "Profile name",
                                        stext: guest.profile_name),
                                    column(
                                        align: CrossAxisAlignment.start,
                                        ftext: "Property Unit",
                                        stext: guest.property),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: const Text(
                                            "Listing name",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 3, bottom: 40),
                                          child: Text(
                                            guest.listing,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.orange.shade400,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "Personas",
                        style: const TextStyle(fontSize: 60),
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
