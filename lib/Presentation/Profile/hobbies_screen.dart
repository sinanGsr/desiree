import 'package:flutter/material.dart';

import '../../Models/hobbiesModel.dart';

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({super.key});

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  final List<Hobby> hobbies = [
    Hobby(id: '1', name: 'Drawing'),
    Hobby(id: '2', name: 'Painting'),
    Hobby(id: '3', name: 'Playing Guitar'),
    Hobby(id: '4', name: 'Writing'),
    Hobby(id: '5', name: 'Dancing'),
    Hobby(id: '6', name: 'Cooking'),
    Hobby(id: '7', name: 'Drawing'),

  ];

  final List<int> selectedHobbies = [

  ];

  List<Color> colors = [

    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  List<Color> originalColors = [
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hobbies'),
        backgroundColor: Colors.orange,
      ),
      body: GridView.builder(
        itemCount: hobbies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                if(selectedHobbies.contains(int.parse(hobbies[index].id))){
                  selectedHobbies.remove(int.parse(hobbies[index].id));
                }else{
                  selectedHobbies.add(int.parse(hobbies[index].id));
                  print(selectedHobbies);

                }

              });
            },
            child: AnimatedContainer(
              height: 100,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              color: hobbies.contains(int.parse(hobbies[index].id))?colors.first:Colors.yellow,
              child: Center(
                child: Text(hobbies[index].name),
              ),
            ),
          );
        },
      ),
    );
  }
}