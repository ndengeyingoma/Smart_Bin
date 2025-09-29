import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '© 2025 Smart Bin Monitoring System. All rights reserved.',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            'Making cities cleaner and smarter',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Powered by ', style: TextStyle(color: Colors.white70)),
              Text(
                'Flutter',
                style: TextStyle(
                  color: Colors.teal[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
