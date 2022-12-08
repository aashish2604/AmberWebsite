import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageError extends StatelessWidget {
  const CachedNetworkImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: const Center(
        child: Text(
          'No Image',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
