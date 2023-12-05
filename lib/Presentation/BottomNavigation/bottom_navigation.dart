

import 'package:desiree/Presentation/Profile/profile_screen.dart';
import 'package:desiree/Presentation/BottomNavigation/reels_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Profile/hobbies_screen.dart';
import '../TextConfig/text_config.dart';
import 'desire_screen.dart';
import 'home_screen.dart';
import 'messages_screen.dart';

class BottomNavigationController extends GetxController{
  RxString selectedScreen = 'H/home'.obs;

  void changeSelectedScreen(String screen){
    selectedScreen.value  = screen;

  }

}

class BottomNavigationScreen extends StatelessWidget {
  final BottomNavigationController controller = Get.put(BottomNavigationController());

  BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.changeSelectedScreen('home');
        return Future(() => false);
      },
      child: Scaffold(

        body: Obx(
              () {
            return _buildScreen(controller.selectedScreen.value);
          },
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildScreen(String screen) {
    switch (screen) {
      case 'H/home':
        return const HomeScreen();
      case 'R/reels':
        return const ReelsScreen();
      case 'M/messages':
        return const MessagesScreen();
      case 'D/desire':
        return const DesireScreen();
      case 'P/profile':
        return const ProfileScreen();
      case 'P/hobbies':
        return const HobbiesScreen();
      default:
        return const HomeScreen();
    }
  }


  Widget _buildBottomNavigationBar() {
    return SafeArea(child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black, width: 0.1)),
      ),
      height: 73,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16,top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton('assets/svgs/home.svg','H/home', 'home',),
            _buildIconButton('assets/svg/favorite.svg','R/reels', 'reels'),
            _buildIconButton('assets/svg/community.svg','M/messages', 'Chat'),
            _buildIconButton('assets/svg/activity.svg','D/desire', 'Desires'),
            _buildIconButton('assets/svg/settings.svg','P/profile', 'Profile'),
          ],
        ),
      ),
    ));
  }

  Widget _buildIconButton(String assetPath,String route, String name) {
    return Obx(() => GestureDetector(
      onTap: (){
        controller.changeSelectedScreen(route);
      },
      child: Container(
        width: 63,
        height: double.infinity,


        decoration: BoxDecoration(
          color: controller.selectedScreen.value[0] == route[0] ? const Color(0xffFFD700) : Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),


        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetPath,height: 24,width: 24,),
            const SizedBox(height: 8.0,),
            AppText.smallBold(name)
          ],
        ),
      ),
    ));
  }
}

