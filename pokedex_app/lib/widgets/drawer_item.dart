import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;

  const DrawerItem({Key key, this.text, this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      // height: 55.0,
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.red[100]),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
