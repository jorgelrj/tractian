import 'package:flutter/material.dart';

enum AssetStatus {
  operating,
  alert;

  Widget get iconIndicator {
    return switch (this) {
      operating => const Icon(Icons.circle, size: 12, color: Colors.green),
      alert => const Icon(Icons.circle, size: 12, color: Colors.red),
    };
  }
}
