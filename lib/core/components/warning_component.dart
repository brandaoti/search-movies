import 'package:flutter/material.dart';

class WarningComponent extends StatelessWidget {
  const WarningComponent({
    Key? key,
    this.onRefresh,
  }) : super(key: key);

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Verifique sua conexão e tente novamente!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 50),
        IconButton(
          icon: const Icon(Icons.refresh),
          iconSize: 100,
          color: Colors.grey,
          onPressed: onRefresh,
        ),
      ],
    );
  }
}
