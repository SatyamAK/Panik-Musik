import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panik_musik/pages/home_page.dart';
import 'package:panik_musik/pages/profile_page.dart';
import 'package:panik_musik/pages/search_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState(){
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(  
        height: 64,
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        child: TabBar(  
          controller: _tabController,
          tabs: const [
            Icon(FontAwesomeIcons.home),
            Icon(FontAwesomeIcons.search),
            Icon(FontAwesomeIcons.userAlt),
          ],
        ),
      ),
      body: TabBarView(  
        controller: _tabController,
        children: const [
          HomePage(),
          SearchPage(),
          ProfilePage()
        ],
      ),
    );
  }
}