import 'package:flutter/material.dart';

class StatusLoadingWidget extends StatelessWidget {
  const StatusLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
