import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:vector_math/vector_math.dart' as math;

class HomeMasterPage extends StatefulWidget {
  const HomeMasterPage({Key? key, required this.works, this.services, this.text_of_reviews, this.like}) : super(key: key);
  final works;
  final services;
  final text_of_reviews;
  final like;

  @override
  State<HomeMasterPage> createState() => _HomeMasterPageState();
}

class _HomeMasterPageState extends State<HomeMasterPage> {

  final _animationDuration = const Duration(milliseconds: 900);
  late Timer _timer;
  late Color _color;
  late final Color _heartColor = (widget.like == true) ? Color(0xFFF14D78): Colors.grey;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_animationDuration, (timer) => _changeColor());
    _color = Colors.grey.shade400;
  }

  void _changeColor() {
    final newColor = _color == Colors.grey.shade400 ? Colors.grey.shade300 : Colors.grey.shade400;
    setState(() {
      _color = newColor;
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.828;
    double height = MediaQuery.of(context).size.height * 0.68;


    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  constraints: BoxConstraints(maxWidth: width),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFF14D78).withOpacity(0.2),
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          side: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                            style: BorderStyle.solid,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Text('Написать', style: TextStyle(
                              color: Color(0xFFF14D78),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Evolventa'
                          ),),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFF14D78).withOpacity(0.2),
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          side: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                            style: BorderStyle.solid,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Text('Записаться', style: TextStyle(
                              color: Color(0xFFF14D78),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Evolventa'
                          ),),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFF14D78).withOpacity(0.2),
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          side: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                            style: BorderStyle.solid,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.5, horizontal: 15),
                          child: IconTheme(
                              data: IconThemeData(
                                  color: _heartColor,
                                  size: 30
                              ),
                              child: Icon(Icons.favorite_rounded)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DefaultTabController(
              length: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: width),
                      child: TabBar(
                        unselectedLabelColor: Colors.grey.shade800,
                        labelColor: Colors.white,
                        labelStyle: TextStyle(
                          fontFamily: 'Evolventa',
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                        splashBorderRadius: BorderRadius.circular(40),
                        indicator: BoxDecoration(
                            color: Color(0xFF76879B),
                            borderRadius: BorderRadius.circular(40)
                          ),
                        tabs: [
                          Tab(text: 'Работы',),
                          Tab(text: 'Услуги',),
                          Tab(text: 'Отзывы',),
                          ],
                        ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF76879B)),
                          borderRadius: BorderRadius.circular(40)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        alignment: Alignment.center,
                        height: height,
                        constraints: BoxConstraints(maxWidth: width),
                        //child: IndexedStack(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 11.5,
                                runSpacing: 3,
                                children: <Widget>[
                                  for(var item in widget.works)
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      width: width / 3 * 0.923,
                                      height: width / 3 * 0.923,
                                      child: GestureDetector(
                                        onTap: () {
                                          showGeneralDialog(
                                              transitionBuilder: (BuildContext context, Animation first, Animation second, widget) {
                                                return Transform.scale(
                                                  scale: first.value,
                                                  child: Opacity(
                                                    opacity: first.value,
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                                      child: Stack(
                                                          alignment: Alignment.center,
                                                          children: [
                                                            CachedNetworkImage(
                                                              height: MediaQuery.of(context).size.width * 0.9,
                                                              width: MediaQuery.of(context).size.width * 0.9,
                                                              imageUrl: item,
                                                              imageBuilder: (context, imageProvider) => Container(
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                      image: imageProvider,
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                    border: Border.all(
                                                                        width: 6,
                                                                        color: Colors.pinkAccent.withOpacity(0.2)
                                                                    ),
                                                                    borderRadius: BorderRadius.circular(30)
                                                                ),
                                                              ),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                              placeholder: (context, url) => AnimatedContainer(
                                                                duration: _animationDuration,
                                                                decoration: BoxDecoration(
                                                                    color: _color,
                                                                    borderRadius: BorderRadius.circular(30)
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            transitionDuration: Duration(milliseconds: 200),
                                            barrierDismissible: true,
                                            barrierLabel: '',
                                            context: context,
                                            pageBuilder: (context, first, second) => Container()
                                          );
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: item,
                                          imageBuilder: (context, imageProvider) => Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                              ),
                                              border: Border.all(),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                          placeholder: (context, url) => AnimatedContainer(
                                            duration: _animationDuration,
                                            decoration: BoxDecoration(
                                                color: _color,
                                              borderRadius: BorderRadius.circular(30)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      for (var item in widget.services)
                                        Text('Услуга: $item')
                                    ],
                                  ),
                                  Container(child: Text('Ширина экрана: ${(width/0.828).truncate()}'),),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      for (var item in widget.text_of_reviews)
                                        Text('Отзыв: $item')
                                    ],
                                  ),
                                  Container(
                                    //child: Text('Высота экрана: ${(height/0.68).truncate()}'),
                                    child: Text(widget.like.toString()),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
