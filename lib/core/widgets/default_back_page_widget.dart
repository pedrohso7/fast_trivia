import 'package:flutter/material.dart';

class DefaultBackPageWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const DefaultBackPageWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              // radius: 32,
              borderRadius: BorderRadius.circular(50),
              onTap: onTap,
              child: const Icon(
                Icons.chevron_left,
                color: Colors.black54,
                size: 45,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(-20, 0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
