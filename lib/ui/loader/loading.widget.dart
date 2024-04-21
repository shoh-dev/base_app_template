import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.shade200, blurRadius: 10, spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          strokeWidth: 2,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
