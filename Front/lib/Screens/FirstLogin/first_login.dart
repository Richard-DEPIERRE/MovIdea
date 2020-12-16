import 'package:ThinkWatch/Screens/FirstLogin/constant.dart';
import 'package:ThinkWatch/constants.dart';
import 'package:flutter/material.dart';

class FirstLogin extends StatefulWidget {
  @override
  _FirstLoginState createState() => _FirstLoginState();
}

class _FirstLoginState extends State<FirstLogin> {
  var children = <Widget>[];
  ScrollController controller = ScrollController();
  List<Widget> itemsData = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    children = <Widget>[];
    for (var i = 0; i < 20; i += 1) {
      children.add(new Container(
        margin: EdgeInsets.only(
          top: (i == 0) ? 20 : 10,
          bottom: (i == 19) ? 20 : 10,
          left: 15,
          right: 15,
        ),
        width: size.width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            onPressed: () {
              setState(() {
                genres[i]['color'] = false;
              });
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(genres[i]['path']),
                    fit: BoxFit.cover,
                    height: 30,
                  ),
                ),
                Text(
                  genres[i]['name'],
                  style: TextStyle(
                      color: (genres[i]['color'] == true)
                          ? Colors.black
                          : Colors.white,
                      fontSize: 28),
                ),
              ],
            ),
            color: (genres[i]['color'] == true)
                ? kPrimaryLightColor
                : kPrimaryColor,
          ),
        ),
      ));
    }
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: children.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return children[index];
        },
      ),
    );
  }
}
