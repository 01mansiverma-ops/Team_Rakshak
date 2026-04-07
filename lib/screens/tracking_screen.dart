import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Tracking"),
        backgroundColor: Colors.blue,
      ),

      body: Stack(
        children: [

          // 🗺️ MAP VIEW (Placeholder for Google Map)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[300],
            child: const Center(
              child: Text(
                "Map View (Ambulance Tracking)",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          // 🚑 Ambulance Info Card
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10)
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Ambulance Status",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Row(
                    children: [
                      Icon(Icons.local_hospital, color: Colors.red),
                      SizedBox(width: 8),
                      Text("Driver: Rajesh Kumar"),
                    ],
                  ),

                  const SizedBox(height: 6),

                  const Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("ETA: 5 mins"),
                    ],
                  ),

                  const SizedBox(height: 6),

                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.green),
                      SizedBox(width: 8),
                      Text("Distance: 1.2 km"),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // 📞 Call Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.all(12),
                      ),
                      onPressed: () {
                        // Add call functionality later
                      },
                      icon: const Icon(Icons.call),
                      label: const Text("Call Driver"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}