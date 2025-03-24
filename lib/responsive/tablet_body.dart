import 'package:flutter/material.dart';
import 'package:canbus/node_cards/universal_card.dart';
import 'package:canbus/node_cards/current_card.dart';
import 'dimensions.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      // backgroundColor: Colors.deepPurple[200],
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 30,
                        runSpacing: 12.0,
                        children: [
                          UniversalCard(
                            icon: Icons.lightbulb_outline,
                            title: "客厅主灯",
                            subtitle: "已开启",
                            isActive: true,
                          ),
                          UniversalCard (
                            icon: Icons.thermostat,
                            title: "空调系统",
                            subtitle: "制冷模式 · 26℃",
                            isActive: false,
                          ),
                          UniversalCard(
                            icon: Icons.security,
                            title: "安防系统",
                            subtitle: "布防中",
                            isActive: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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