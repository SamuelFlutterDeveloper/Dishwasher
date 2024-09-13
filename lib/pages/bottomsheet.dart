import 'package:dish_washer/pages/userpage.dart';
import 'package:flutter/material.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  Color _CircleAvatar = Colors.white;

  void _closeSheet() {
    setState(() {
      // _iconColor = Colors.red;
      _CircleAvatar = const Color.fromARGB(255, 230, 33, 33);
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 310),
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
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: _CircleAvatar,
                  child: GestureDetector(
                    onTap: _closeSheet,
                    child: const Icon(
                      Icons.close_rounded,
                      size: 20,
                      color:
                          Colors.black, // Set the color of the icon if needed
                    ),
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 340,
            //   ),
            //   child: Icon(Icons.close_rounded),
            // ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Cleaning & Pest Control',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text(
                'Cleaning',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Userpage()));
                        },
                        child: Container(
                          height: 72,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/bathroom cleaning.png'))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ElevatedButton(
                      Text(
                        "Bathroom &\n Kitchen\nCleaning",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                      ),
                      // onPressed: () {
                      //   showModalBottomSheet(
                      //       context: context, builder: (context) => Home()
                      //       );
                      // },
                      // ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Userpage()));
                      },
                      child: Container(
                        height: 72,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey[200],
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/house cleaning.png'))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Full Home\nCleanning \n",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Userpage()));
                        },
                        child: Container(
                          height: 72,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/carpet-cleaner.png'))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sofa &\nCarpet\nCleaning",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text(
                'Pest Control ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Userpage()));
                        },
                        child: Container(
                          height: 72,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/sink.png'))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ElevatedButton(
                      Text(
                        "Cockroach\nAnt &\nGeneral",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                      ),
                      // onPressed: () {
                      //   showModalBottomSheet(
                      //       context: context, builder: (context) => Home()
                      //       );
                      // },
                      // ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Userpage()));
                      },
                      child: Container(
                        height: 72,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey[200],
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/termite-control.png'))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Termite\nControl\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Userpage()));
                        },
                        child: Container(
                          height: 72,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/bed-bugs.png'))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bed Bugs\nControl\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
