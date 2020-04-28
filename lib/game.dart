import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  IconData _currentIcon = Icons.clear;
  int _moves = 0;
  bool _playing = true;

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
            Text('TIC TAC TOE', style: TextStyle(fontSize: 22),),
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
      if(_playing){
        _moves++;
        _blocks[number]['widget'] = Center(child: Icon(_currentIcon, size: 80));
        if(_currentIcon == Icons.clear){
          _currentIcon = Icons.panorama_fish_eye;
          _blocks[number]['value'] = 0;
        } else {
          _blocks[number]['value'] = 1;
          _currentIcon = Icons.clear;
        }
      }
    });

    if(_moves >= 5) {
      _checkWinner();
    }
  }

  _checkWinner(){
    //Rows
    _checkPath(0, 1, 2);
    _checkPath(3, 4, 5);
    _checkPath(6, 7, 8);
    //Columns
    _checkPath(0, 3, 6);
    _checkPath(1, 4, 7);
    _checkPath(2, 5, 8);
    //Diagonals
    _checkPath(0, 4, 8);
    _checkPath(2, 4, 6);
  }

  _checkPath(int init, int middle, int end){
    bool equals = _blocks[init]['value'] != -1 && _blocks[init]['value'] == _blocks[middle]['value'] && _blocks[init]['value'] == _blocks[end]['value'];
    if(equals){
      setState(() {
        _playing = false;
        _blocks[init]['widget'] = Container(color: Colors.grey[300],child: _blocks[init]['widget']);
        _blocks[middle]['widget'] = Container(color: Colors.grey[300],child: _blocks[middle]['widget']);
        _blocks[end]['widget'] = Container(color: Colors.grey[300],child: _blocks[end]['widget']);
      });
    }
  }

  _clearBlocks(){
    setState(() {
      _playing = true;
      _currentIcon = Icons.clear;
      _moves = 0;
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
