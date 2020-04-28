import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('BM2'),
            Text('TIC TAC TOE'),
            GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: [
                  Container(
                      child: Text('Item 1'),
                      decoration: _boxDecoration(right: true, bottom: true)
                  ),
                  Container(
                      child: Text('Item 2'),
                      decoration: _boxDecoration(right: true, bottom: true, left: true)
                  ),
                  Container(
                      child: Text('Item 3'),
                      decoration: _boxDecoration(left: true, bottom: true)
                  ),

                  Container(
                      child: Text('Item 4'),
                      decoration: _boxDecoration(right: true, bottom: true, top: true)
                  ),
                  Container(
                      child: Text('Item 5'),
                      decoration: _boxDecoration(right: true, bottom: true, top: true, left: true)
                  ),
                  Container(
                      child: Text('Item 6'),
                      decoration: _boxDecoration(bottom: true, top: true, left: true)
                  ),

                  Container(
                      child: Text('Item 7'),
                      decoration: _boxDecoration(right: true, top: true)
                  ),
                  Container(
                      child: Text('Item 8'),
                      decoration: _boxDecoration(right: true, top: true, left: true)
                  ),
                  Container(
                      child: Text('Item 9'),
                      decoration: _boxDecoration(top: true, left: true)
                  ),
                ]
            ),
            SizedBox(height: 40),
            FloatingActionButton.extended(
              label: Text('RESET', style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.refresh, color: Colors.white,),
              onPressed: (){
                print('reset game');
              },
            ),
          ],
        )
      ),
    );
  }

  _boxDecoration({left: false, top: false, right: false, bottom: false}){
    const border = BorderSide(color: Colors.grey, width: 1);
    return BoxDecoration(
        border: Border(
          top: top ? border : BorderSide.none,
          left: left ? border : BorderSide.none,
          right: right ? border : BorderSide.none,
          bottom: bottom ? border : BorderSide.none,
        )
    );
  }
}
