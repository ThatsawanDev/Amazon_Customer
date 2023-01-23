import 'package:amazon_customer/sukhumvit_font.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool networkError = false;
  NetworkImage backgroundImage = const NetworkImage('https://nationaltoday.com/wp-content/uploads/2022/10/Minatozaki-Sana.jpg');
  AssetImage backgroundImageFallback = const AssetImage('assets/images/default_profile.png');

  String point = "999,999";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 20, top: 5.0),
      child: Container(
        height: 100,
        color: Colors.transparent,
        child: Row(
          children: [
            //picture profile
            Container(
              width: 70.0,
              height: 70.0,
              decoration: !networkError
                  ? BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: backgroundImage,
                        onError: (Object e, StackTrace? stackTrace) {
                          setState(() {
                            networkError = true;
                          });
                        },
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    )
                  : BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: backgroundImageFallback,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
            ),
            //hello text
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'อรุณสวัสดิ์',
                    style: SukhumvitFont().sukhumvitSetText(16, HexColor('#E2E0D8')),
                  ),
                  Text(
                    'คุณซานะ มินาโตะซากิ',
                    style: SukhumvitFont().sukhumvitSetSemiBold(18, HexColor('#E2E0D8')),
                  ),
                  //blue card point
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Container(
                      height: 26,
                      constraints: const BoxConstraints(minWidth: 85),
                      decoration: BoxDecoration(
                        color: (point == "0") ? HexColor('#FFFFFF') : HexColor('#CD972F'),
                        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: (point == "0")
                                ? Image.asset('assets/images/blue_point0.png', scale: .5)
                                : Image.asset('assets/images/blue_point.png', scale: .5),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0, bottom: 2),
                            child: Text(
                              point,
                              textAlign: TextAlign.center,
                              style: (point == "0")
                                  ? SukhumvitFont().sukhumvitSetSemiBold(16, HexColor('#1B3A33'))
                                  : SukhumvitFont().sukhumvitSetSemiBold(16, HexColor('#FFFFFF')),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
