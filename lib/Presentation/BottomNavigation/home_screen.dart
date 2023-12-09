import 'package:desiree/Controllers/home_controller.dart';
import 'package:desiree/Presentation/TextConfig/text_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/forest_background.jpg'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffffa200)
                        .withOpacity(0.5), // Shadow color with opacity
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: Column(

               
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        
                      ),
                      SizedBox(width: 10,),
                      AppText.labelSmall('Hello sanan!'),

                    ],
                  ),
                  const Text(
                    'Desire +',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 66,
                        color: Colors.white),
                  ),
                 SizedBox(height: 100,),

                 Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          margin:EdgeInsets.zero,
                          color:Color(0xffffcedb4),
                          child: Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
                                child: AppText.small('Drafts'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Card(
                          color:Color(0xffffcedb4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
                            child: AppText.small('Mock'),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Card(
                          color:Color(0xffffcedb4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
                            child: AppText.small('Alias'),
                          ),
                        )
                      ],
                    ),
                  SizedBox(height: 14,),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: AppText.label('Personal status'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  height: 80,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/handshake.svg',
                        width: 40,
                        height: 40,
                      ),
                      AppText.small('Friends')
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  height: 80,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/heart.svg',
                        width: 40,
                        height: 40,
                      ),
                      AppText.small('Friends')
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  height: 80,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/romantic.svg',
                        width: 40,
                        height: 40,
                      ),
                      AppText.small('Friends'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xfff8b600), // Set the button color to yellow
                    elevation: 5, // Set the shadow elevation
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16), // Set the border radius
                    ),
                  ),
                  child: AppText.smallBold("AI search"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// return BackgroundWidget(
//   header: "Desire",
//   widget: Padding(
//
//     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
//     child: Column(
//       children: [
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: EdgeInsets.all(8),
//               height: 200,
//               width: 180,
//               decoration: ShapeDecoration(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     side: BorderSide(
//                         color: Colors.grey
//                     )
//
//                 ),
//
//                 gradient: const LinearGradient(
//                   begin: Alignment(0.00, -1.00),
//                   end: Alignment(0, 1),
//                   colors: [
//                     Color(0xffdac5a5),
//                     Color(0xffeaddcc),
//                     Color(0xfff1e9df)
//                   ],
//                 ),
//
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 100,width: 100,
//                     child: SvgPicture.asset('assets/svgs/robot_ai.svg'),
//                   ),
//
//                   AppText.labelSmall('AI powered Search',color: Colors.grey),
//
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(8),
//               height: 150,
//               width: 150,
//               decoration: ShapeDecoration(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     side: BorderSide(
//                         color: Colors.grey
//                     )
//
//                 ),
//
//                 gradient: const LinearGradient(
//                   begin: Alignment(0.00, -1.00),
//                   end: Alignment(0, 1),
//                   colors: [
//                     Color(0xffdac5a5),
//                     Color(0xffeaddcc),
//                     Color(0xfff1e9df)
//                   ],
//                 ),
//
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 80,width: 80,
//                     child: SvgPicture.asset('assets/svgs/robot_ai.svg'),
//                   ),
//
//                   AppText.labelSmall('AI powered Search',color: Colors.grey),
//
//                 ],
//               ),
//             )
//           ],
//         )
//
//
//
//       ],
//     ),
//   ), );
