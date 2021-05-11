import 'package:flutter/material.dart';

Widget CustomAppBar(BuildContext context, _drawerKey) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            //spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          color: Theme.of(context).primaryColor,
          child: Row(
            children: [
              ClipOval(
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/pokedex-button.png'))),
                  child: TextButton(
                      child: null,
                      onPressed: () {
                        _drawerKey.currentState.openEndDrawer();
                      }),
                ),
              ),
              Container(
                //padding: EdgeInsets.only(top: 10.0),
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Image.asset('assets/red.png'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Image.asset('assets/yellow.png'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Image.asset('assets/green.png'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
