import 'package:flutter/material.dart';

class ToolsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tools'),
      ),
      body: Center(child: Text('Tools', style: TextStyle(fontSize: 60) ,),
      ),
    );
  }
}
