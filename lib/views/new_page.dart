import 'package:amazon_customer/widgets/custom_bottom_bar_widget.dart';
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  String title;
  int selectedPage;
  NewPage({super.key, this.title = "Page 2", this.selectedPage = 1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(selectedPage: selectedPage),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
