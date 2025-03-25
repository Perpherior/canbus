import 'package:flutter/material.dart';
// import 'package:canbus/canbus_provider.dart';
import 'dart:ui';
import 'package:canbus/responsive/dimensions.dart';

class UniversalCard extends StatefulWidget {
  final Map<String, dynamic> data;

  const UniversalCard({super.key,
    required this.data
  });

  @override
  State<UniversalCard> createState() => _UniversalCardState();
}

class _UniversalCardState extends State<UniversalCard> {
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    _isActive = widget.data['isActive'];
  }

  @override
  Widget build(BuildContext context) {
    // final canbusProvider = context.watch<CanbusProvider>();

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isActive 
            ? Colors.white.withValues(alpha: 0.5)
            : Colors.grey.withValues(alpha: 0.8),
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
                          color: _isActive 
                              ? Colors.yellow.withValues(alpha: 0.7)
                              : Colors.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: 
                          FractionallySizedBox(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            child: Icon(
                              widget.data['icon'],
                              color: _isActive
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey[600],
                            size: 28,
                                                     ),
                          ),
                      ),
                      const SizedBox(width: 100),
                      
                      // Switch controller
                      Transform.scale(
                        scale: 0.8,
                        child: Switch.adaptive(
                          value: _isActive,
                          onChanged: (value) {
                            setState(() => _isActive = value);
                          },
                          activeColor: Theme.of(context).colorScheme.primary,
                          thumbColor: WidgetStateProperty.all(Colors.white),
                          trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return Theme.of(context).colorScheme.primary;
                              }
                              return Colors.grey[300];
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50), 
                  // Title / subtitle row
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.data['title'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.data['subtitle'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}