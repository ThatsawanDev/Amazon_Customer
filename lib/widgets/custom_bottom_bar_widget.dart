import 'package:amazon_customer/router/route_config.dart';
import 'package:amazon_customer/sukhumvit_font.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomBottomBar extends StatefulWidget {
  final int selectedPage;
  const CustomBottomBar({super.key, this.selectedPage = 0});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomNavigationMenu(
                label: 'หน้าหลัก',
                isSelected: widget.selectedPage == 0,
                icon: const AssetImage("assets/icons/home-alt.png"),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, RouteConfig.homePage, ((route) => false));
                },
              ),
              VerticalDivider(
                width: 0,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: HexColor('#C3C3C3').withOpacity(.5),
              ),
              BottomNavigationMenu(
                label: 'เมนู',
                isSelected: widget.selectedPage == 1,
                icon: const AssetImage("assets/icons/mug-hot.png"),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, RouteConfig.newPage1, ((route) => false));
                },
              ),
              VerticalDivider(
                width: 0,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: HexColor('#C3C3C3').withOpacity(.5),
              ),
              BottomNavigationMenu(
                label: 'ออเดอร์',
                isSelected: widget.selectedPage == 2,
                icon: const AssetImage("assets/icons/list-alt.png"),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, RouteConfig.newPage2, ((route) => false));
                },
              ),
              VerticalDivider(
                width: 0,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: HexColor('#C3C3C3').withOpacity(.5),
              ),
              BottomNavigationMenu(
                label: 'สาขา',
                isSelected: widget.selectedPage == 3,
                icon: const AssetImage("assets/icons/map-marker-alt.png"),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, RouteConfig.newPage3, ((route) => false));
                },
              ),
              VerticalDivider(
                width: 0,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: HexColor('#C3C3C3').withOpacity(.5),
              ),
              BottomNavigationMenu(
                label: 'ฉัน',
                isSelected: widget.selectedPage == 4,
                icon: const AssetImage("assets/icons/user-alt.png"),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, RouteConfig.newPage4, ((route) => false));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationMenu extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final AssetImage icon;
  final bool isSelected;
  final Color selectedColor = HexColor('#162C26');
  final Color defaultColor = HexColor('#C3C3C3');

  BottomNavigationMenu({super.key, required this.icon, required this.label, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              icon,
              size: 24,
              color: isSelected ? selectedColor : defaultColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: SukhumvitFont().sukhumvitSetText(10, isSelected ? selectedColor : defaultColor),
            ),
          ],
        ),
      ),
    );
  }
}
