import 'package:flutter/material.dart';
import 'dart:math';

class AdaptiveCard extends StatelessWidget {
  // final IconData icon;
  // final String text;

  final Map<String, dynamic> data;

  const AdaptiveCard({
    super.key,
    required this.data
  });
  // const AdaptiveCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          // 动态计算基准尺寸（取卡片宽高的最小值）
          final baseSize = min(constraints.maxWidth, constraints.maxHeight);
          
          return Padding(
            padding: EdgeInsets.all(baseSize * 0.05), // 内边距也按比例
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 等比缩放图标

                FittedBox(
                  child: Icon(
                    data['icon'],
                    size: baseSize * 0.2, // 图标占卡片尺寸的40%
                    color:
                      data['isActive']
                      ? Theme.of(context).colorScheme.primary
                      : const Color.fromARGB(255, 163, 150, 150),
                  ),
                ),
                SizedBox(height: baseSize * 0.05), // 间距也按比例
                // 等比缩放文本
                FittedBox(
                  fit: BoxFit.scaleDown, // 文本超出时自动缩小
                  child: Text(
                    data['title'],
                    style: TextStyle(
                      fontSize: baseSize * 0.15, // 字体大小按比例
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown, // 文本超出时自动缩小
                  child: Text(
                    data['subtitle'],
                    style: TextStyle(
                      fontSize: baseSize * 0.09, // 字体大小按比例                    
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}