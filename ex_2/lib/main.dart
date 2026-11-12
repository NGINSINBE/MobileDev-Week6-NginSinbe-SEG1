
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Enum for icon position
enum IconPosition {
  left,
  right,
}

// Enum for button type
enum ButtonType {
  primary,
  secondary,
  disabled,
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Buttons'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButton(
                label: 'Primary Button',
                icon: Icons.check,
              ),
              SizedBox(height: 16),

              CustomButton(
                label: 'Secondary Button',
                icon: Icons.favorite,
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 16),

              CustomButton(
                label: 'Disabled Button',
                icon: Icons.block,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable CustomButton widget
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;

    if (buttonType == ButtonType.primary) {
      buttonColor = Colors.blue;
    } else if (buttonType == ButtonType.secondary) {
      buttonColor = Colors.green;
    } else {
      buttonColor = Colors.grey;
    }

    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled
          ? null
          : () {
              print('$label clicked');
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(icon),
            const SizedBox(width: 8),
          ],

          Text(label),

          if (iconPosition == IconPosition.right) ...[
            const SizedBox(width: 8),
            Icon(icon),
          ],
        ],
      ),
    );
  }
}
