import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitness_app/provider/base_model.dart';
import 'dart:developer';

class HomeScreenViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController addweightController = TextEditingController();
  int selectedIndex = 0;
  final PageController pageController = PageController();

  // Variable to store the last added weight
  String? lastWeight;
  int? milliseconds;
  int? monthNumber;

  ///On tapping bottom nav bar items
  void onItemTapped(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    notifyListeners();
  }

  ///Adding new value to sub-collection:
  void save() {
    String? uid = auth.currentUser?.uid;
    // debugPrint('uid: $uid');

    if (uid != null) {
      db.collection('weights').doc(uid).collection("userWeights").add({
        'value': addweightController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
        'docId': db
            .collection('weights')
            .doc(uid)
            .collection("userWeights")
            .doc()
            .id,
      });
    }
    addweightController.clear();
  }

  int getMonthNumberFromMilliseconds(int millisecondsSinceEpoch) {
    // Convert milliseconds since epoch to DateTime object
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

    // Extract the month number from the DateTime object
    int monthNumber = dateTime.month;

    return monthNumber;
  }

  void getLastWeight() async {
    String? uid = auth.currentUser?.uid;
    debugPrint('uid: $uid');

    if (uid != null) {
      try {
        final snapshot = await db
            .collection('weights')
            .doc(uid)
            .collection('userWeights')
            .orderBy('time', descending: true)
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          lastWeight = snapshot.docs.first.data()['value'];
          milliseconds = snapshot.docs.first.data()['time'];
          monthNumber = getMonthNumberFromMilliseconds(milliseconds!);

          return;
        } else {
          return null;
        }
      } catch (e) {
        log('Error fetching last weight: $e');
        return null;
      }
    } else {
      return null;
    }
  }
}
