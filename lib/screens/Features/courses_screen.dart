import 'package:flutter/material.dart';
import '../Courses_Screens/Cybersecurity.dart';

class CoursesScreen extends StatelessWidget {
  static const String routeName = "CoursesFieldsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/courses.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Choose Your Field',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                ..._buildFieldButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFieldButtons(BuildContext context) {
    List<String> fields = [
      'Cybersecurity',
      'Networking',
      'Software Development',
      'Front End Developer',
      'Back End Developer',
      'Full Stack Developer',
      'Mobile Application Development',
      'Operating Systems',
      'UI/UX Design',
      'Cloud Computing',
      'Databases',
      'Database Administrator',
      'Data Science and Analytics',
      'C programming language',
      'C++ programming language',
      'C# programming language',
      'Information Technology',
      'Software Engineering',
      'Project Management',
    ];
    return fields.map((field) => FieldButton(text: field)).toList();
  }
}

class FieldButton extends StatelessWidget {
  final String text;

  FieldButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: TextButton(
          onPressed: () {
            if (text == "Cybersecurity") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cybersecurity()),
              );
            } else {
              print('Button pressed: $text');
            }
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
