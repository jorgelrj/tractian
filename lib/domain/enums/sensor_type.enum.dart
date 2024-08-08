import 'package:flutter/material.dart';

enum SensorType {
  energy,
  vibration;

  Widget? get iconIndicator {
    return switch (this) {
      energy => const Icon(Icons.bolt, size: 12, color: Colors.green),
      _ => null,
    };
  }
}
