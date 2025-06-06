import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  final String screenName;
  final Widget child;
  const AnalyticsScreen(
      {required this.screenName, required this.child, super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logScreenView(
      screenName: widget.screenName,
      screenClass: widget.screenName,
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
