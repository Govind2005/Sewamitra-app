import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sewamitra/chatbot/chatbot_screen.dart';
import 'package:sewamitra/screens/base/volunteer_page.dart';
import 'package:sewamitra/services/survival_guide.dart';

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomCurveClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade50,
                    Colors.blue.shade100,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'SewaMitra',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900, // Maximum bold weight
                              color: Colors.blue,
                              fontFamily: 'Oswald', // Apply Oswald font here
                            ),
                          ),
                          const SizedBox(width: 10), // Adds some spacing between the text and the image
                          ClipOval(
                            child: Image.asset(
                              'assets/images/sewa-mitra-logo.png',
                              height: 50,  // Adjust this value to match your desired height
                              width: 50,   // Keep it square to maintain the circular shape
                              fit: BoxFit.cover,  // Ensures the image fits inside the circle
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Uniting India in\nCrisis Response',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w900, // Maximum bold weight
                          height: 1.3,
                          fontFamily: 'Oswald', // Apply Oswald font here
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Empowering communities across India with real-time disaster management solutions.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade600,
                          height: 1.5,
                          fontWeight: FontWeight.w900, // Maximum bold weight
                          // fontFamily: 'Oswald', // Apply Oswald font here
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Our Services Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SurvivalGuidePage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.book, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Disaster Guidelines',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900, // Maximum bold weight
                              color: Colors.white,
                              fontFamily: 'Oswald', // Apply Oswald font here
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Volunteer Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VolunteerPage()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blue, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.volunteer_activism,
                            color: Colors.blue,
                            size: 32,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Help as a Volunteer',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600, // Maximum bold weight
                              color: Colors.blue,
                              // fontFamily: 'Oswald', // Apply Oswald font here
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChatbotScreen()), // Replace with your chatbot page
          );
        },
        child: Icon(Icons.chat, color: Colors.white),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
    );
  }
}
