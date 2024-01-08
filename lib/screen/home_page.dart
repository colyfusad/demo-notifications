import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_notification/services/notification_services.dart';
import 'package:demo_notification/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  Color appBarColor = Colors.blue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializedNotification();
    notifyHelper.requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          ElevatedButton.icon
            (
              icon: Icon(Icons.notifications_outlined),
              onPressed: (){
                notifyHelper.showNotification(
                  title: "Theme changed",
                  body: "Oke em iuzz",
                  payload: "KokK"
                );
              },
              label: Text("Notifications"),),
          Text(
            "Coly of",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: appBarColor,
      leading: GestureDetector(
        onTap: () {
        if (appBarColor == Colors.blue) {
          setState(() {
            appBarColor = Colors.grey;
          });
        } else {
          setState(() {
            appBarColor = Colors.blue;
          });
        }
          ThemeService().switchTheme();
          NotifyHelper().displayNotification(
            title: "Theme changed",
            body: Get.isDarkMode?"Activated Light Theme":"Activated Dark Theme",
          );
        },
        child: Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: [
        Icon(
          Icons.person,
          size: 20,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
