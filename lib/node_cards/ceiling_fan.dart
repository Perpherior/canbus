import 'package:flutter/material.dart';


class CeilingFan extends StatefulWidget {
  @override
  State<CeilingFan> createState() => _CeilingFanState();
}

class _CeilingFanState extends State<CeilingFan> {
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    
  }
}