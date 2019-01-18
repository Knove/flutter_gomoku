import 'package:flutter/material.dart';
import '../router/router.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Kn - AI Gomoku',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Create By Knove',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              color, Icons.nature_people, 'Player vs AI', 1, context),
          _buildButtonColumn(
              color, Icons.assignment_ind, 'Player vs Player', 2, context),
          //  _buildButtonColumn(color, Icons.share, 'SHARE', 0, context),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '',
        softWrap: true,
      ),
    );
    return ListView(
      children: [
        Image.asset(
          'assets/logo.jpg',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection,
        textSection,
      ],
    );
  }

  GestureDetector _buildButtonColumn(Color color, IconData icon, String label,
      int type, BuildContext context) {
    return GestureDetector(
        onTap: () {
          switch (type) {
            case 1:
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Gomoku(type)));
              break;
            default:
              break;
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ));
  }
}
