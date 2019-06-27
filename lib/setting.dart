import 'package:flutter/material.dart';
import 'package:fubble/main.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  double bubbleCount = 200;
  double maxBubbleSize = 10;
  double speed = 1;
  Color color;
  double canvasWidth;
  double canvasHeight;

  static const colors = <Color>[
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.blueGrey
  ];
  final List<DropdownMenuItem<Color>> colorsList = colors.map((colr) {
    return DropdownMenuItem<Color>(
      value: colr,
      child: Text(
        colr.toString().padRight(5),
        style: TextStyle(color: colr),
      ),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_backup_restore),
            onPressed: () {
              setState(() {
                bubbleCount = 200;
                maxBubbleSize = 10;
                speed = 1;
                color = null;
                canvasWidth = null;
                canvasHeight = null;
              });
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Bubbles(
                        bubbleCount: bubbleCount,
                        maxBubbleSize: maxBubbleSize,
                        speed: speed,
                        canvasWidth: MediaQuery.of(context).size.width,
                        canvasHeight: MediaQuery.of(context).size.height,
                      ))),
        ),
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Number of bubbles',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    activeColor: Colors.indigoAccent,
                    min: 10.0,
                    divisions: 1040,
                    label: '${bubbleCount.round()}',
                    max: 1050.0,
                    onChanged: (value) {
                      setState(() => bubbleCount = value);
                    },
                    value: bubbleCount,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 2,
            child: Column(
              children: <Widget>[
                Text(
                  'Bubble Size',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Slider(
                  activeColor: Colors.indigoAccent,
                  min: 8.0,
                  divisions: 1040,
                  label: '${maxBubbleSize.round()}',
                  max: 50.0,
                  onChanged: (value) {
                    setState(() => maxBubbleSize = value);
                  },
                  value: maxBubbleSize,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 2,
            child: Column(
              children: <Widget>[
                Text(
                  'Bubble Speed',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Slider(
                  activeColor: Colors.indigoAccent,
                  min: 1.0,
                  divisions: 140,
                  label: '${speed.round()}',
                  max: 23.0,
                  onChanged: (value) {
                    setState(() => speed = value);
                  },
                  value: speed,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 2,
            child: Column(
              children: <Widget>[
                Text(
                  'Canvas width',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Slider(
                  activeColor: Colors.indigoAccent,
                  min: 120.0,
                  // label: '${canvasWidth}',
                  max: MediaQuery.of(context).size.width,
                  onChanged: (value) {
                    setState(() => canvasWidth = value);
                  },
                  value: canvasWidth == null
                      ? MediaQuery.of(context).size.width
                      : canvasWidth,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 2,
            child: Column(
              children: <Widget>[
                Text(
                  'Canvas Height',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Slider(
                  activeColor: Colors.indigoAccent,
                  min: 120.0,
                  // label: '${canvasHeight.round()}',
                  max: MediaQuery.of(context).size.height,
                  onChanged: (value) {
                    setState(() => canvasHeight = value);
                  },
                  value: canvasHeight == null
                      ? MediaQuery.of(context).size.height
                      : canvasHeight,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButton(
            value: color,
            hint: Text('Choose custom bubble color'),
            onChanged: (value) {
              setState(() {
                color = value;
              });
            },
            items: this.colorsList,
          ),
          Container(
            child: RaisedButton(
              elevation: 5,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Bubbles(
                              bubbleCount: bubbleCount,
                              maxBubbleSize: maxBubbleSize,
                              speed: speed,
                              color: color,
                              canvasWidth: canvasWidth,
                              canvasHeight: canvasHeight,
                            )));
              },
              child: Text(
                'Save Settings',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
            ),
            decoration: BoxDecoration(shape: BoxShape.circle),
          ),
          Expanded(child: SizedBox()),
          Text(
            'AskBuddie0S v1.0',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
