import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/home_page/home_page.dart';
import 'package:flutter_sample/pages/hot_key/hotkey_page.dart';
import 'package:flutter_sample/pages/knowledge/knowledge_page.dart';
import 'package:flutter_sample/pages/profile/profile_page.dart';
import 'package:flutter_sample/widget/bottomNavigationBar.dart';


class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final List<String> labels = ["首页", "热点", "体系", "我的"];
  final List<Widget> pages = [];
  final List<String> icons = [
    "assets/images/icon_home_grey.png",
    "assets/images/icon_hot_key_grey.png",
    "assets/images/icon_knowledge_grey.png",
    "assets/images/icon_personal_grey.png",
  ];
  final List<String> activeIcons = [
    "assets/images/icon_home_selected.png",
    "assets/images/icon_hot_key_selected.png",
    "assets/images/icon_knowledge_selected.png",
    "assets/images/icon_personal_selected.png",
  ];

  @override
  void initState() {
    super.initState();
    initTabItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,appBar: null,body: CustomBottomnavigationbar(labels: labels, pages: pages, icons: icons, activeIcons: activeIcons,tapCompletion: (value) => {

    },),);
  }

  void initTabItems(){
    pages.addAll([
      HomePage(),
      HotkeyPage(),
      KnowledgePage(),
      ProfilePage()
    ]);
  }
}
