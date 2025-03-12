import 'package:flutter/material.dart';
import '../details/internship_details_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSaved = false;

  final List<Map<String, String>> jobList = [
    {
      "company": "JUMIA",
      "title": "Java Developer (Full Time)",
      "location": "Cairo, Egypt - 1 month ago • Over 100 people clicked apply",
      "type1": "On-site",
      "type2": "Internship",
    },
    {
      "company": "Google",
      "title": "Software Engineer Intern (Remote)",
      "location": "San Francisco, USA - 2 weeks ago • 200+ applicants",
      "type1": "Remote",
      "type2": "Internship",
    },
    {
      "company": "Microsoft",
      "title": "Cloud Solutions Architect Intern",
      "location": "Seattle, USA - 3 weeks ago • 150+ applicants",
      "type1": "On-site",
      "type2": "Internship",
    },
    {
      "company": "Amazon",
      "title": "Backend Developer Internship",
      "location": "Berlin, Germany - 1 week ago • 80+ applicants",
      "type1": "Hybrid",
      "type2": "Internship",
    },
    {
      "company": "Tesla",
      "title": "AI & Machine Learning Intern",
      "location": "Austin, Texas - 2 weeks ago • 120+ applicants",
      "type1": "On-site",
      "type2": "Internship",
    },
    {
      "company": "Meta",
      "title": "Front-end Developer Internship",
      "location": "London, UK - 5 days ago • 90+ applicants",
      "type1": "Remote",
      "type2": "Internship",
    },
    {
      "company": "Apple",
      "title": "iOS Developer Intern",
      "location": "Cupertino, USA - 3 weeks ago • 110+ applicants",
      "type1": "On-site",
      "type2": "Internship",
    },
    {
      "company": "IBM",
      "title": "Data Science & AI Intern",
      "location": "New York, USA - 2 days ago • 70+ applicants",
      "type1": "Hybrid",
      "type2": "Internship",
    },
    {
      "company": "Netflix",
      "title": "Cybersecurity Intern",
      "location": "Los Angeles, USA - 1 month ago • 50+ applicants",
      "type1": "Remote",
      "type2": "Internship",
    },
    {
      "company": "Spotify",
      "title": "Software Engineering Intern",
      "location": "Stockholm, Sweden - 3 weeks ago • 100+ applicants",
      "type1": "On-site",
      "type2": "Internship",
    },
  ];


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.06),
            Text(
              "Welcome To Your Future!",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: Color(0xFF196AB3),
                height: 2,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              height: screenHeight * 0.06,
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                  prefixIcon: Icon(Icons.search, color: Colors.white, size: screenWidth * 0.06),
                  filled: true,
                  fillColor: Color(0xFF2252A1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  var job = jobList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: _buildJobCard(job, screenWidth, screenHeight),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(Map<String, String> job, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 1.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.045),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  job["company"]!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Text(
                  job["title"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            job["location"]!,
            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.033),
          ),
          SizedBox(height: screenHeight * 0.015),
          Row(
            children: [
              _buildTag(job["type1"]!, Icons.check),
              SizedBox(width: screenWidth * 0.02),
              _buildTag(job["type2"]!, Icons.check),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: screenHeight * 0.04,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InternshipDetailsScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF196AB3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    label: Text("See More", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04)),
                    icon: Icon(Icons.trending_up, color: Colors.white, size: screenWidth * 0.05),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: SizedBox(
                  height: screenHeight * 0.04,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: isSaved ? Colors.blue : Colors.white,
                      side: BorderSide(color: Colors.blue, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? Colors.white : Colors.blue,
                      size: screenWidth * 0.05,
                    ),
                    label: Text(
                      "Save",
                      style: TextStyle(
                        color: isSaved ? Colors.white : Colors.blue,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue, size: 16),
          SizedBox(width: 4),
          Text(text, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
