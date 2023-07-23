import 'package:flutter/material.dart';

import 'package:quizpage/pages/quizpage.dart';

class SelectSubjectPage extends StatefulWidget {
  final String classSelected;
  final List subjects;
  const SelectSubjectPage({
    Key? key,
    required this.classSelected,
    required this.subjects,
  }) : super(key: key);

  @override
  State<SelectSubjectPage> createState() => _SelectClassPageState();
}

class _SelectClassPageState extends State<SelectSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Subject : ${widget.classSelected}"),
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
        child: ListView.builder(
          itemCount: widget.subjects.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(
                              chapters: widget.subjects[index]['chapters']),
                        ));
                  },
                  title: Text(widget.subjects[index]['subject'].toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
