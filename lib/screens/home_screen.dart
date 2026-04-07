import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RakshakLink"),
        backgroundColor: Colors.blue,
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("History"),
            ),
          ],
        ),
      ),

      body: Column(
        children: [

          // 📍 MAP SECTION (Placeholder for now)
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  "Map View (Google Maps here)",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),

          // 🚨 SOS BUTTON SECTION
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                GestureDetector(
                  onTap: () {
                    // Navigate to ambulance screen
                    Navigator.pushNamed(context, '/ambulance');
                  },
                  child: Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "SOS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "EMERGENCY",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ),
          ),

          // 🏥 HOSPITAL INFO CARD
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 5)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Nearest Hospital Info:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("City Hospital"),
                  Text("ICU Beds Available: Yes"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}