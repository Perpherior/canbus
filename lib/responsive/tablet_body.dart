import 'package:flutter/material.dart';
import 'package:canbus/node_cards/universal_card.dart';
import 'package:canbus/node_cards/current_card.dart';
import 'dimensions.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final nodes = testNodes;

    return Scaffold(
      appBar: AppBar(
        title: Text('T A B L E T $width'),
      ),
      body:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            spacing: 30,
            children: [
              Expanded(
                child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2, // 每行显示 2 个
                        childAspectRatio: 1.8, // 宽高比
                        mainAxisSpacing: 20, // 垂直间距
                        crossAxisSpacing: 20, // 水平间距
                        children: 
                        List.generate(
                          nodes.length, // 总数量
                          (index) => 
                            UniversalCard(data: nodes[index]),
                          ),
                        ),
                  )
              ),
              SizedBox(
                width: sidebarWidth,
                child: CurrentCard(
                  dgn: "123",
                ),
              ),
            ],
          ),
        ),
    );
  }
}