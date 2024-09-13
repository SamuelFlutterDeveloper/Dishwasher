import 'dart:convert';
// import 'dart:io';
// import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as htpp;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List data = [];
  Future<void> fetchdata() async {
    final res =
        await htpp.get(Uri.parse("https://api.restful-api.dev/objects/ff80818191028543019102af75e10084"));
    print('API');
    print(res.body.toString());
    setState(() {
      data = jsonDecode(res.body)['data'];
    });
  }

  Future<void> InsertData() async {
    final res = await htpp.post(
      Uri.parse("https://api.restful-api.dev/objects"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": "Samuel",
        "data": {
          "roll no": "96120104022",
          "dept": "Computer Science & engineering",
          "passed out": "2024",
          "cgpa": "7.52",
          "age": "21",
        }
      }),
    );
    print(res.body.toString());
  }

  @override
  void initState() {
    // fetchdata();
    InsertData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api'),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: GestureDetector(
                child: const Icon(Icons.delete_outlined),
                onTap: () {
                  setState(() {
                    data.removeWhere(
                        (PopEntry) => PopEntry["id"] == data[index]['id']);
                  });
                },
              ),
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(data[index]['avatar']),
              ),
              title: Text(
                data[index]['first_name'],
                style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                data[index]['first_name'],
                style: const TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
              ),
            );
          }),
    );
  }
}
