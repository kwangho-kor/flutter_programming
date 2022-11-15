import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Stateful 위젯 데모',
      home: Scaffold(
        appBar: AppBar(title: Text('Stateful 위젯 데모')),
        body: _MyStatefulWidget(),
      ),
    ));

class _MyStatefulWidget extends StatefulWidget {
  @override
  State createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_MyStatefulWidget> {
  String _buttonState = 'OFF'; // = 'OFF' null safety정책으로 선언하지 않으면 에러나는듯

  @override
  void initState() {
    super.initState();
    print('initState(): 기본값을 설정합니다.');
    _buttonState = 'OFF';
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies() 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    print('build() 호출됨');
    return Column(
      children: <Widget>[
        ElevatedButton(                 // RaisedButton은 더이상 사용하지 않고 ElevatedButton으로 바뀜
          child: Text('버튼을 누르세요'),
          onPressed: _onClick,
        ),
        Row(
          children: <Widget>[
            Text('버튼 상태: '),
            Text(_buttonState),
          ],
        )
      ],
    );
  }

  void _onClick() {
    print('_onClick() 호출됨');
    setState(() {
      print('setState() 호출됨');
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
  }

  @override
  void didUpdateWidget(_MyStatefulWidget oldWidget) {
    print('didUpdateWidget()');
  }

  @override
  void deactivate() {
    print('deactivate()');
  }

  @override
  void dispose() {
    print('dispose()');
  }
}
