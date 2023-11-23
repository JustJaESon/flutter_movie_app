// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StatusFailedWidget extends StatelessWidget {
  final String message;
  const StatusFailedWidget({
    Key? key,
    required this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.grey,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(message)),
    );
  }
}
