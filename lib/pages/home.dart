import 'package:dish_washer/pages/bottomsheet.dart';
// import 'package:dish_washer/pages/userpage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> body = [
    const Icon(Icons.search),
    const Icon(Icons.home),
    const Icon(Icons.mark_unread_chat_alt_rounded),
    const Icon(Icons.person),
  ];

  String dropdownValue = 'Ramapuram - Wood Creek Country, Chennai';
  List<String> listItems = [
    '15/155 Rajapalayam, Thoothukudi - 628002 ,fhdfghghergerrrhgeegtggggg',
    'Ramapuram - Wood Creek Country, Chennai',
    '15/150 Rajapalayam, Thoothukudi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 37,
            ),
            Stack(
              children: [
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 111, 42, 196),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 0, 0),
                    child: Text(
                      'plus',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 0,
                  top: 7,
                  child: Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 35),
                        child: Text(
                          'Wood Creek Country 2nd Main Rd',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: DropdownButton<String>(
                            isDense: false,
                            isExpanded: false,
                            value: dropdownValue,
                            //icon: Icon(Icons.arrow_drop_down),
                            underline: Container(
                              height: 2,
                              color: Colors.white10,
                            ),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: listItems
                                .map<DropdownMenuItem<String>>((String value) {
                              List<String> lines = value.split(',');

                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.71,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: lines[0],
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[600],
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        if (lines.length > 1) ...[
                                          TextSpan(
                                            text: ',\n',
                                            style: TextStyle(
                                              fontSize: 7,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          TextSpan(
                                            text: lines.sublist(1).join(','),
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                    softWrap: false,
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 20,
                          color: Colors
                              .black, // Set the color of the icon if needed
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 50,
              width: 330,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    //borderSide: BorderSide(width: 0.8),
                  ),
                  hintText: 'Search for',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const Bottomsheet());
                        },
                        child: Container(
                          height: 62,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/1.png'))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Women's Salon\n & Spa",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.grey[900]),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const Bottomsheet());
                      },
                      child: Container(
                        height: 62,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            image: const DecorationImage(
                                image: AssetImage('assets/images/2.png'))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Men's Salon & \n Massage",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, color: Colors.grey[900]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const Bottomsheet());
                        },
                        child: Container(
                          height: 62,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/3.png'))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "AC & Appliance\n Repair",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.grey[900]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const Bottomsheet());
                        },
                        child: Container(
                          height: 62,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/4.png'))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Cleaning & pest\n Control\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.grey[900]),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const Bottomsheet());
                      },
                      child: Container(
                        height: 62,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            image: const DecorationImage(
                                image: AssetImage('assets/images/5.png'))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Electrician\nPlumber &\nCarpenter",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, color: Colors.grey[900]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const Bottomsheet());
                        },
                        child: Container(
                          height: 62,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/6.png'))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Native Water\nPurifier\n ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.grey[900]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const Bottomsheet());
                    },
                    child: Container(
                      height: 82,
                      width: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Native smart\nLoks',
                              style: TextStyle(
                                color: Colors.black, // Set text color
                                fontSize: 11,
                              ),
                            ),
                          ),
                          const Spacer(), // Pushes the image to the right
                          Image.asset(
                            'assets/images/7.png',
                            height: 62, // Adjust as needed
                            width: 62, // Adjust as needed
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const Bottomsheet());
                    },
                    child: Container(
                      height: 82,
                      width: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Painting &\nWaterproffing',
                              style: TextStyle(
                                color: Colors.black, // Set text color
                                fontSize: 11,
                              ),
                            ),
                          ),
                          const Spacer(), // Pushes the image to the right
                          Image.asset(
                            'assets/images/8.png',
                            height: 62, // Adjust as needed
                            width: 62, // Adjust as needed
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 20),
              child: Text(
                'Plus exclusive deals',
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 104, 28, 197)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Text(
                'On our finest experience',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        
        type: BottomNavigationBarType.fixed,
        
        backgroundColor: Colors.white,
        
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
          
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mark_unread_chat_alt_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String dropdownValue =
//       'Rajapalayam , Thalamuthu Nagar, 15/155 , Thoothukudi- 628002';
//   List<String> addressItems = [
//     'Ramapuram, Wood Creek Country, Tulasin chennai-600013',
//     'Rajapalayam , Thalamuthu Nagar, 15/155 , Thoothukudi- 628002',
//     'Ramapuram, Wood Creek Country, Tulasin chennai-600013',
//     'Rajapalayam , Thalamuthu Nagar, 15/155 , Thoothukudi- 628002',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Plus',
//           style: TextStyle(
//             fontSize: 27,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 103, 41, 179),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Icon(
//               Icons.chevron_right_outlined,
//               color: Colors.white,
//               size: 35,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 'Wood Creek Country 2nd Main Rd',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               DropdownButton<String>(
//                 value: dropdownValue,
//                 isExpanded: true,
//                 icon: Icon(Icons.arrow_drop_down_outlined),
//                 style: TextStyle(fontSize: 17, color: Colors.black),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     dropdownValue = newValue!;
//                   });
//                 },
//                 items:
//                     addressItems.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       overflow: TextOverflow.visible,
//                       maxLines: value.length, // Ensures that the text does not overflow
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
