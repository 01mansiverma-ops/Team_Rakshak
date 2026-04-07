import 'package:flutter/material.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RakshakLink"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const SizedBox(height: 20),

            // 🚨 Emergency Title
            const Text(
              "Emergency Request",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 📍 Distance Info
            const Text(
              "Patient: 1.2 km away",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            const Text(
              "Urgent Case:",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            const Text(
              "Accept?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // 🚑 Ambulance Image (placeholder)
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("🚑 Ambulance Image"),
              ),
            ),

            const SizedBox(height: 40),

            // ✅ ❌ Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                // ACCEPT BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {
                    // Navigate to navigation screen
                    Navigator.pushNamed(context, '/navigation');
                  },
                  child: const Text(
                    "ACCEPT",
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                // REJECT BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "REJECT",
                    style: TextStyle(fontSize: 16),
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