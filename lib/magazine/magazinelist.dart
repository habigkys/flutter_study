import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';
import 'package:imitate_sirloin/magazine/magazine.dart';
import 'package:imitate_sirloin/model/magazineListModel.dart';

class MagazineListPage extends StatelessWidget {
  const MagazineListPage({super.key});

  final String title = '매거진';

  fontColor(int i){
    if(i >= 2){
      return "white";
    }else{
      return "black";
    }
  }

  containerProvider(BuildContext context){
    var containerList = <Widget>[];
    final magazineList = List<MagazineListModel>.generate(
      5,
      (i) => MagazineListModel(
        i+1,
        'Label ${i+1}',
        'Sub Title ${i+1}',
        'Main Title ${i+1}',
        fontColor(i),
        'Date ${i+1}',
      ),
    );

    fontColorDecider(String color){
      switch(color){
        case "white":
          return Colors.white;
        case "black":
          return Colors.black;
      }
    }

    magazineList.forEach((magazineListModel) {
      containerList.add(
        GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MagazinePage(arguments: magazineListModel))
            );
          },
          child: Container(
            height: 400.0,
            margin: const EdgeInsets.all(30.0),
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
    });

    return containerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: title),
      body: Center(
        child: ListView(
          children: containerProvider(context),
        ),
      ),
    );

    
  }
}