import 'package:bottomnav_provider_sample/controllers/MainScreenController.dart';
import 'package:bottomnav_provider_sample/views/first_screen.dart';
import 'package:bottomnav_provider_sample/views/second_screen.dart';
import 'package:bottomnav_provider_sample/views/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  // 下タブのアイコンを配列に入れる
  final List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.lock),
      title: Text('あなたの秘密'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      title: Text('みんなの秘密'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text('設定'),
    )
  ];

  // 下タブのタップによって表示される画面を配列に入れる
  final List<StatelessWidget> _screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  // タイトルも下タブによって変わるので配列に入れる
  final List<String> _titles = ['あなたの秘密', 'みんなの秘密', '設定'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainScreenController>(
        create: (_) => MainScreenController(),
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
                title: Consumer<MainScreenController>(builder: (_, model, __) {
              // selectedTabIndexの値によってタイトルが変わる
              return Text(_titles[model.selectedTabIndex]);
            })),
            body: Consumer<MainScreenController>(builder: (_, model, __) {
              // selectedTabIndexの値によって表示される画面が変わる
              return _screens[model.selectedTabIndex];
            }),
            bottomNavigationBar:
                Consumer<MainScreenController>(builder: (_, model, __) {
              return BottomNavigationBar(
                items: _bottomNavItems,
                currentIndex: model.selectedTabIndex,
                selectedItemColor: Colors.amber[800],
                // selectedTabIndexの値を変更する関数
                onTap: model.changeTabIndex,
              );
            }),
          );
        });
  }
}
