


import 'package:desiree/Presentation/TextConfig/text_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../BottomNavigation/bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final BottomNavigationController _controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.person,color: Colors.white,),
        onPressed: () { 
          _controller.changeSelectedScreen('P/hobbies');
        },

      ),
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,

          ),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Software Engineer',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Text(
            'John Doe is a software engineer specializing in building cross-platform applications using Flutter.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.phone),
              SizedBox(width: 8),
              Text('+1 123 456 7890'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.email),
              SizedBox(width: 8),
              Text('john.doe@example.com'),
            ],
          ),
        ],
      ),
    );
  }
}
