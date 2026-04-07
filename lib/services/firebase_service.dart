import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 🚨 Create Emergency Request
  static Future<void> createEmergency({
    required String userId,
    required double lat,
    required double lng,
  }) async {
    await _db.collection('emergencies').add({
      'userId': userId,
      'location': GeoPoint(lat, lng),
      'status': 'pending',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // 🚑 Accept Emergency (Ambulance side)
  static Future<void> acceptEmergency(String docId, String ambulanceId) async {
    await _db.collection('emergencies').doc(docId).update({
      'status': 'accepted',
      'ambulanceId': ambulanceId,
    });
  }

  // ❌ Reject Emergency
  static Future<void> rejectEmergency(String docId) async {
    await _db.collection('emergencies').doc(docId).update({
      'status': 'rejected',
    });
  }

  // 📍 Update Ambulance Location
  static Future<void> updateAmbulanceLocation({
    required String ambulanceId,
    required double lat,
    required double lng,
  }) async {
    await _db.collection('ambulances').doc(ambulanceId).set({
      'location': GeoPoint(lat, lng),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  // 🔄 Listen to Emergency Requests (Realtime)
  static Stream<QuerySnapshot> getEmergencies() {
    return _db
        .collection('emergencies')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // 📍 Listen to Ambulance Location
  static Stream<DocumentSnapshot> getAmbulanceLocation(String ambulanceId) {
    return _db
        .collection('ambulances')
        .doc(ambulanceId)
        .snapshots();
  }

  // 🏥 Update Hospital Data
  static Future<void> updateHospitalData({
    required String hospitalId,
    required int icuBeds,
    required int doctors,
  }) async {
    await _db.collection('hospitals').doc(hospitalId).set({
      'icuBeds': icuBeds,
      'doctors': doctors,
    }, SetOptions(merge: true));
  }
}