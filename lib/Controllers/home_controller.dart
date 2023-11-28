

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  List<String> hobbies = [
    "Reading",
    "Traveling",
    "Cooking",
    "Hiking",
    "Painting",
    "Photography",
    "Gardening",
    "Gaming",
    "Writing",
    "Dancing",
    "Yoga",
    "Meditation",
    "Playing an Instrument",
    "Watching Movies",
    "Playing Sports",
    "Cycling",
    "Fishing",
    "Volunteering",
    "Learning a New Language",
    "DIY Projects",
    "Camping",
    "Running",
    "Bird Watching",
    "Collecting",
    "Sculpting",
    "Board Games",
    "Astronomy",
    "Surfing",
    "Skydiving",
    "Wine Tasting",
    "Sailing",
    "Pottery",
    "Calligraphy",
    "Mountain Climbing",
    "Stand-up Comedy",
    "Acting",
    "Magic Tricks",
    "Geocaching",
    "Knitting",
    "Chess",
    "Origami",
    "Beekeeping",
    "Scuba Diving",
    "Archery",
    "Horseback Riding",
    "Ice Skating",
    "Snowboarding",
    "Billiards",
    "Karate",
    "Table Tennis",
    "DJing",
    "Kite Flying",
    "Canoeing",
    "Paddleboarding",
    "Robotics",
    "Bird Watching",
    "Fencing",
    "Mixology",
    "Wine Making",
    "Ice Sculpting",
    "Juggling",
    "Podcasting",
    "Graffiti Art",
    "Historical Reenactment",
    "Parkour",
    "Bodybuilding",
    "Weightlifting",
    "Crossfit",
    "Ziplining",
    "Paragliding",
    "DIY Electronics",
    "Glassblowing",
    "Candle Making",
    "Ghost Hunting",
    "Metal Detecting",
    "Salsa Dancing",
    "Astrology",
    "Cartography",
    "Skateboarding",
    "BMX Riding",
    "Lacrosse",
    "Rugby",
    "Quilting",
    "Stargazing",
    "Beer Brewing",
    "Snowmobiling",
    "Skydiving",
    "Archery Tag",
    "Powerlifting",
  ];


  Future<void> uploadHobbies() async {
    final CollectionReference hobbiesCollection =
    FirebaseFirestore.instance.collection('hobbies');

    Map<String, String> hobbiesMap = {};

    for (int i = 0; i < hobbies.length; i++) {
      hobbiesMap[i.toString()] = hobbies[i];
    }

    try {
      await hobbiesCollection.doc('hobbies').set(hobbiesMap);
      print('Hobbies uploaded successfully');
    } catch (e) {
      print('Error uploading hobbies: $e');
    }
  }



}