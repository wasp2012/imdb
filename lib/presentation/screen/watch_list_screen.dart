import 'package:flutter/material.dart';

import '../widget/curved_bottom_navbar_widget.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WatchList')),
      bottomNavigationBar: CurvedBottomNavbarWidget(currentPage: 2),
    );
  }
}
