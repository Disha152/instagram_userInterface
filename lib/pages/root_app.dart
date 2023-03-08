import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_ui/pages/home_page.dart';
import 'package:instagram_ui/pages/search_page.dart';
import 'package:instagram_ui/themes/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }
  Widget getBody(){
    List<Widget> pages = [
      HomePage(),
      // ignore: prefer_const_constructors
      SearchPage(),
      const Center(
          child: Text("Upload Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white
          ),),
      ),
      const Center(
          child: Text("Activity Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white
          ),),
      ),
      const Center(
          child: Text("Account Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white
          ),),
      )
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }
  AppBar? getAppBar(){
    if(pageIndex == 0){
      return AppBar(
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset("assets/images/camera_icon.svg",width: 30,),
            const Text("Instagram",style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 35
            ),),
            SvgPicture.asset("assets/images/message_icon.svg",width: 30,),
          ],
        ),
      );
    }else if(pageIndex == 1){
      return null;
    }else if(pageIndex == 2){
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Upload"),
      );
    }else if(pageIndex == 3){
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Activity"),
      );
    }else{
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Account"),
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_active_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_active_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_active_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_active_icon.svg",
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(color: appFooterColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: SvgPicture.asset(
                  bottomItems[index],
                  width: 27,
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
