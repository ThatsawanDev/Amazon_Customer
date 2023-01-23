import 'package:amazon_customer/sukhumvit_font.dart';
import 'package:amazon_customer/widgets/background_widget.dart';
import 'package:amazon_customer/widgets/custom_bottom_bar_widget.dart';
import 'package:amazon_customer/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<AssetImage> imgAsset = [
    const AssetImage('assets/images/exclusive1.png'),
    const AssetImage('assets/images/exclusive2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(selectedPage: 0),
      body: SafeArea(
        child: Stack(
          children: [
            const BackGroundWidget(),
            Column(
              children: [
                const ProfileWidget(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      // physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //order type
                            Container(
                              height: 140,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/preorder.png'),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 166,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/delivery.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7.0,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 166,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/catering.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //New and Promotion
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                height: 25,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: HexColor('#CD972F'))),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text('NEWS & PROMOTION', style: SukhumvitFont().sukhumvitSetSemiBold(14, HexColor('#CD972F'))),
                                ),
                              ),
                            ),
                            Container(
                              height: 155,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/promotion1.png'),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 160,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/promotion2.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7.0,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 160,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/promotion3.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //Online Exclusive
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7.0),
                              child: Container(
                                height: 25,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: HexColor('#CD972F'))),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text('Online Exclusive', style: SukhumvitFont().sukhumvitSetSemiBold(14, HexColor('#CD972F'))),
                                ),
                              ),
                            ),

                            CarouselSlider(
                              carouselController: _controller,
                              options: CarouselOptions(
                                height: 140.0,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1,
                                initialPage: 0,
                                // enableInfiniteScroll: true,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5),
                                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                // enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                              ),
                              items: imgAsset
                                  .map(
                                    (item) => GestureDetector(
                                      onTap: () => showBarModalBottomSheet(
                                        expand: true,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => Container(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: item,
                                            fit: BoxFit.fill,
                                          ),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgAsset.asMap().entries.map((entry) {
                                return Container(
                                  width: _current == entry.key ? 30 : 8.0,
                                  height: _current == entry.key ? 9 : 8.0,
                                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (_current == entry.key ? HexColor('#162C26') : HexColor('#C3C3C3')),
                                  ),
                                );
                              }).toList(),
                            ),

                            // Container Footer
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
