import 'package:flutter/material.dart';
import 'package:canbus/node_cards/universal_card.dart';
import 'dimensions.dart';
import 'responsive_grid.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final nodes = testNodes;

    return Scaffold(
      appBar: AppBar(
        title: Text('M O B I L E! $width'),
      ),
      body:
        Row(
          children: [
            Expanded(
              child: 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                    ResponsiveGrid(
                      items: nodes
                    )
                )
            ),
          ],
        ),
    );
  }
}


class ClickButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        // 点击事件
        final snackBar = SnackBar(
          content: Text('你点击了中央按钮!'),
          duration: Duration(seconds: 1),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text(
        '点我试试',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}