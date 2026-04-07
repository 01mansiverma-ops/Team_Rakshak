import 'package:flutter/material.dart';

class HospitalDashboard extends StatelessWidget {
  const HospitalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital Dashboard"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            // 📊 STATUS CARDS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusCard("ICU Beds", "5 Available", Colors.green),
                _buildStatusCard("Ambulances", "3 Active", Colors.orange),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusCard("Doctors", "8 On Duty", Colors.blue),
                _buildStatusCard("Emergency", "2 Cases", Colors.red),
              ],
            ),

            const SizedBox(height: 20),

            // 🚑 INCOMING PATIENTS LIST
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Incoming Patients",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _buildPatientCard("Rahul Sharma", "Critical", "2 min"),
                  _buildPatientCard("Anita Verma", "Moderate", "5 min"),
                  _buildPatientCard("Amit Singh", "Stable", "8 min"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 📊 STATUS CARD WIDGET
  Widget _buildStatusCard(String title, String value, Color color) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth * 0.43,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
        );
      },
    );
  }

  // 🚑 PATIENT CARD WIDGET
  Widget _buildPatientCard(String name, String condition, String eta) {
    Color conditionColor;

    switch (condition) {
      case "Critical":
        conditionColor = Colors.red;
        break;
      case "Moderate":
        conditionColor = Colors.orange;
        break;
      default:
        conditionColor = Colors.green;
    }

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Text("ETA: $eta"),
        trailing: Text(
          condition,
          style: TextStyle(
            color: conditionColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
