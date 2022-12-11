import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';
import 'package:imitate_sirloin/magazine/magazine.dart';
import 'package:imitate_sirloin/model/magazineListModel.dart';

class MagazineListPage extends StatelessWidget {
  const MagazineListPage({super.key});

  final String title = '매거진';

  fontColor(int i){
    if((i%5+1) >= 3){
      return "white";
    }else{
      return "black";
    }
  }

  fontColorDecider(String color){
    switch(color){
      case "white":
        return Colors.white;
      case "black":
        return Colors.black;
    }
  }

  listViewBuilder(BuildContext context){
    var containerList = containerProvider(context);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: containerList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: containerList,
        );
      }
    );
  }

  List<Widget> containerProvider(BuildContext context){
    var containerList = <Widget>[];
    final magazineList = List<MagazineListModel>.generate(
      5,
      (i) => MagazineListModel(
        i+1,
        'Label ${i+1}',
        'Sub Title ${i+1}',
        'Main Title ${i+1}',
        fontColor(i),
        AssetImage("images/${i%5+1}.webp"),
        'Date ${i+1}',
      ),
    );

    for (var magazineListModel in magazineList) {
      containerList.add(
        GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MagazinePage(id: magazineListModel.id))
            );
          },
          child: Container(
            height: 400.0,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
              image : DecorationImage(
                image: AssetImage("images/${magazineListModel.id}.webp"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 270.0,
                ),
                SizedBox(
                  height: 100.0,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(magazineListModel.label,
                        style: TextStyle(
                          fontSize: 12,
                          color: fontColorDecider(magazineListModel.fontColor),
                        ),
                      ),
                      Text(magazineListModel.mainTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: fontColorDecider(magazineListModel.fontColor),
                        ),
                      ),
                      Text(magazineListModel.subTitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: fontColorDecider(magazineListModel.fontColor),
                        ),
                      ),
                      Text(''),
                      Text(magazineListModel.date,
                        style: TextStyle(
                          fontSize: 12,
                          color: fontColorDecider(magazineListModel.fontColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return containerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: title),
      // body: listViewBuilder(context),
      body: Center(
        child: ListView(
          children: containerProvider(context),
        ),
      ),
    );
  }
}