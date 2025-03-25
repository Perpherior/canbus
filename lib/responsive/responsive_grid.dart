import 'package:flutter/material.dart';
import 'package:canbus/node_cards/adaptive_card.dart';
import 'dart:math';

class ResponsiveGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ResponsiveGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        // 根据屏幕宽度动态计算列数
        final crossAxisCount = max(2, (constraints.maxWidth / 200).floor());
        
        return GridView.builder(
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1.3, // 保持卡片为正方形
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemCount: items.length,
          itemBuilder: (_, index) => AdaptiveCard(
            data: items[index]
          ),
        );
      },
    );
  }
}