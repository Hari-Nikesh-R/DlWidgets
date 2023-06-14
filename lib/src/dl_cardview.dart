import 'package:flutter/material.dart';

/// Represents a custom card view widget.
class DlCardView extends StatefulWidget {

  /// Constructs a DlCardView widget.
  const DlCardView({super.key, required this.child});

  /// Specifies the child widget to be displayed within the card view.
  final Widget child;

  @override
  State<DlCardView> createState() => _DlCardViewState();
}

class _DlCardViewState extends State<DlCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(padding: const EdgeInsets.all(16), child: widget.child)
    );
  }
}
