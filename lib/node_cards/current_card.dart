import 'package:flutter/material.dart';
// import 'package:canbus/canbus_provider.dart';
import 'dart:ui';

class CurrentCard extends StatefulWidget {
  final String dgn;

  const CurrentCard({
    required this.dgn,
  });

  @override
  State<CurrentCard> createState() => _CurrentCardState();
}

class _CurrentCardState extends State<CurrentCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Card width and height
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withValues(alpha: 0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.7),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(26),
              child: 
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ICON
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color:Colors.yellow.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      // Switch controller
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}