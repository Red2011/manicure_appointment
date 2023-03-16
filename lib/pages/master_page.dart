import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:manicure_appointment/pages/home_page.dart';
import 'package:manicure_appointment/pages/navigation_bar_pages/chat_page.dart';
import 'package:manicure_appointment/pages/navigation_bar_pages/home_page.dart';
import 'package:manicure_appointment/pages/navigation_bar_pages/menu_page.dart';
import 'package:manicure_appointment/pages/navigation_bar_pages/search_page.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class MasterPage extends StatefulWidget {
  final String title;
  MasterPage(this.title);


  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? MasterPage('')) as MasterPage;



    dynamic master;
    for (var element in masterList){
      if (element['name'].toString() == arguments.title) {
        master = element;
      }
    }

    List stars = [];
    for(var i = 0; i < master['stars']; i++){
      stars.add(Colors.yellow.shade300);
    }
    if (stars.length < 6) {
      for (var i = 0; i < 5-master['stars']; i++) {
        stars.add(Colors.grey[500]);
      }
    }

    final pages = [
      HomeMasterPage(
        works: master['works'],
        services: master['services'],
        text_of_reviews: master['text_of_reviews'],
        like: master['like'],
        stars: master['stars'],
      ),
      ChatPage(),
      SearchPage(),
      MenuPage(),
    ];

    return Container(
      color: Color(0xffa4bdcc).withOpacity(0.4),
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
              extendBody: true,//позволяет сделать фоном body в navigationbar
              body: NestedScrollView(
              headerSliverBuilder: (context, isScrolled) {
                return [
                  SliverAppBar(
                    elevation: 0,
                    title: const Row(
                      //центрирование
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Маникюр'),
                        Padding(padding: EdgeInsets.only(left: 3)),
                        Icon(Icons.arrow_downward_outlined),
                      ],
                    ),
                    pinned: true,
                    backgroundColor: Colors.white,//цвет за шапкой
                    centerTitle: true,
                    expandedHeight: 180,
                    flexibleSpace: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xFFFFFFFF),
                                Color(0xffa4bdcc)
                              ],
                          )
                      ),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(top: 80),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                        Icons.account_circle_sharp,
                                        size: 90,
                                        color: Colors.black.withOpacity(0.1),
                                    ),
                                    const Padding(padding: EdgeInsets.only(left: 10)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(master['name'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[700],
                                                  fontSize: 15
                                              ),),
                                            const Padding(padding: EdgeInsets.only(left: 10)),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 3),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.brightness_1_rounded, color: Colors.grey[800], size: 15),
                                                  Icon(Icons.brightness_1_rounded, color: Colors.grey[800], size: 15),
                                                  Icon(Icons.brightness_1_rounded, color: Colors.grey[800], size: 15),
                                                ],
                                              ),

                                            ),
                                          ],
                                        ),
                                        Text(master['address'].toString()),
                                        TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            ),
                                            child: const Text(
                                              'Показать на карте',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  //margin: EdgeInsets.only(bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 50),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Отзывы: ${master['reviews']}',
                                              style: TextStyle(
                                                color: Colors.grey[600]
                                              ),),
                                           IconTheme(
                                               data: IconThemeData(
                                                 color: Colors.grey[500]
                                               ),
                                               child:  Padding(
                                                 padding: EdgeInsets.only(bottom: 4),
                                                 child: Row(
                                                   children: [
                                                     for (var item in stars)
                                                       Icon(Icons.star_rounded, color: item,),
                                                   ],
                                                 ),
                                               )
                                           )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ];
              },
              body: pages[index]
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                    color: Colors.grey[700],
                    size: 30
                )
              ),
              child: CurvedNavigationBar(
                color: Color(0xffd7e1e7).withOpacity(0.9),
                buttonBackgroundColor: Color(0xffd7e1e7).withOpacity(0.9),
                items: const [
                  CurvedNavigationBarItem(
                      child: Icon(Icons.home),
                      label: 'Домой'
                  ),
                  CurvedNavigationBarItem(
                      child: Icon(Icons.chat_rounded),
                      label: 'Чат'
                  ),
                  CurvedNavigationBarItem(
                      child: Icon(Icons.search),
                      label: 'Поиск'
                  ),
                  CurvedNavigationBarItem(
                      child:  Icon(Icons.menu),
                      label: 'Меню'
                  ),
                ],
                height: 75,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 500),
                index: index,
                onTap: (index) => setState(() {
                  this.index = index;
                })
              ),
            ),
            ),
        ),
      ),
    );
  }
}


