import 'package:flutter/material.dart';

class ArticlesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articles Screen',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Articles'),
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: <Widget>[
              _buildButton(context, 'mental illness', Icons.psychology,
                  '/mentalillness', Colors.greenAccent, Colors.white),
              _buildButton(context, 'therapy', Icons.local_hospital, '/therapy',
                  Colors.orange, Colors.white),
              _buildButton(context, 'Medicine', Icons.medication, '/medicine',
                  Colors.red, Colors.white),
              _buildButton(context, 'yoga', Icons.self_improvement, '/yoga , ',
                  Colors.purple, Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData icon,
      String route, Color backgroundColor, Color fontColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(text),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color>(fontColor),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
      ),
    );
  }
}
