import 'package:flutter/material.dart';

class DlCardView extends StatefulWidget {
  const DlCardView({super.key, required this.child});
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
