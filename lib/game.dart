import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  String _message = 'IT\'S TURN OF X';
  IconData _currentIcon = Icons.clear;
  int moves = 0;
  bool playing = true;

  List _blocks = [];

  @override
  void initState() {
    _clearBlocks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('BM2'),
            Text('TIC TAC TOE', style: TextStyle(fontSize: 18),),
            SizedBox(height: 20,),
            Text(_message, style: TextStyle(fontSize: 34),),
            GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: [
                  Container(
                      child: _blocks[0]['widget'],
                      decoration: _boxDecoration(right: true, bottom: true)
                  ),
                  Container(
                      child: _blocks[1]['widget'],
                      decoration: _boxDecoration(right: true, bottom: true, left: true),
                  ),
                  InkWell(
                    child: Container(
                        child: _blocks[2]['widget'],
                        decoration: _boxDecoration(left: true, bottom: true)
                    ),
                    onTap: (){

                    },
                  ),

                  Container(
                      child: _blocks[3]['widget'],
                      decoration: _boxDecoration(right: true, bottom: true, top: true)
                  ),
                  Container(
                      child: _blocks[4]['widget'],
                      decoration: _boxDecoration(right: true, bottom: true, top: true, left: true)
                  ),
                  Container(
                      child: _blocks[5]['widget'],
                      decoration: _boxDecoration(bottom: true, top: true, left: true)
                  ),

                  Container(
                      child: _blocks[6]['widget'],
                      decoration: _boxDecoration(right: true, top: true)
                  ),
                  Container(
                      child: _blocks[7]['widget'],
                      decoration: _boxDecoration(right: true, top: true, left: true)
                  ),
                  Container(
                      child: _blocks[8]['widget'],
                      decoration: _boxDecoration(top: true, left: true)
                  ),
                ]
            ),
            SizedBox(height: 30),
            FloatingActionButton.extended(
              label: Text('RESET', style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.refresh, color: Colors.white,),
              onPressed: (){
                _clearBlocks();
              },
            ),
          ],
        )
      ),
    );
  }

  _changeBlock(int number){
    setState(() {
      if(playing){
        moves++;
        _blocks[number]['widget'] = Center(child: Icon(_currentIcon, size: 80));
        if(_currentIcon == Icons.clear){
          _currentIcon = Icons.panorama_fish_eye;
          _blocks[number]['value'] = 0;
          _message = 'IT\'S TURN OF O';
        } else {
          _blocks[number]['value'] = 1;
          _currentIcon = Icons.clear;
          _message = 'IT\'S TURN OF X';
        }
      }
    });

    if(moves >= 5) {
      _checkWinner();
    }
  }

  _checkWinner(){
    //TODO: check if there is a Winner
    //If moves = 9 and there's no Winner, its draw!
  }

  _clearBlocks(){
    setState(() {
      _blocks = [
        {'widget': InkWell(onTap: (){ _changeBlock(0); }), 'value': -1},
        {'widget': InkWell(onTap: (){ _changeBlock(1); }), 'value': -1},
        {'widget': InkWell(onTap: (){ _changeBlock(2); }), 'value': -1},

        {'widget': InkWell(onTap: (){ _changeBlock(3); }), 'value': -1},
        {'widget': InkWell(onTap: (){ _changeBlock(4); }), 'value': -1},
        {'widget': InkWell(onTap: (){ _changeBlock(5); }), 'value': -1},

        {'widget': InkWell(onTap: (){ _changeBlock(6); }), 'value': -1},
        {'widget': InkWell(onTap: (){ _changeBlock(7); }), 'value': -1},
        {'widget': InkWell(onTap: (){ _changeBlock(8); }), 'value': -1},
      ];
    });
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
