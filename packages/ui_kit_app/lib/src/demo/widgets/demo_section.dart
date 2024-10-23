import 'package:flutter/material.dart';

class DemoSection extends StatelessWidget {
  final List<Widget> child;
  const DemoSection({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Divider(height: 2),
          ),
          SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Scrollbar(
                thumbVisibility: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: child,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Divider(height: 2),
          ),
        ],
      ),
    );
  }
}
