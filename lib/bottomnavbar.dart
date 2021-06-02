import 'dart:io';

import 'package:flutter/material.dart';
import 'package:panik_musik/screens/home/homescreen.dart';
import 'package:panik_musik/screens/profile/profilepage.dart';
import 'package:panik_musik/services/songservice.dart';
import 'package:provider/provider.dart';

import 'models/song.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState(){
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>exit(0),
      child: Scaffold(
        appBar: AppBar(
          title:Text('Welcome')
        ),
        bottomNavigationBar: Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(14), topLeft: Radius.circular(14)),
          ),
          child: TabBar(  
            controller: _tabController,
            indicatorColor: Colors.transparent,
            tabs: [
              Icon(Icons.home),
              Icon(Icons.person)
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            StreamProvider<List<Song>>.value(
              value: SongService().songStream,
              initialData: [],
              child: HomePage(),
            ),
            ProfilePage()
          ]
        ),
      ),
    );
  }
}