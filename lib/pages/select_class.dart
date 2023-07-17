import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizpage/pages/select_subject.dart';

class SelectClassPage extends StatefulWidget {
  const SelectClassPage({super.key});

  @override
  State<SelectClassPage> createState() => _SelectClassPageState();
}

class _SelectClassPageState extends State<SelectClassPage> {
  final _url =
      "https://script.google.com/macros/s/AKfycbx6XHINVUVLE3Tne-sKgmaQsdWeyaAdsdEtpS6uH7lA7a59EfzozXHdUwkKgOmpC9FudA/exec";

  List classes = [];
  List subjects = [];
  bool _loading = true;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      setState(() {
        _loading = false;
        List body = jsonDecode(response.body);
        for (var element in body) {
          classes.add(element['class']);
          subjects.add(element['subjects']);
        }
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Class"),
        titleSpacing: 2,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(96, 188, 250, 1),
              Color.fromRGBO(96, 188, 250, 0.78),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: (_loading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: classes.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectSubjectPage(
                                    classSelected: classes[index],
                                    subjects: subjects[index]),
                              ));
                        },
                        title: Text(classes[index].toString()),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
