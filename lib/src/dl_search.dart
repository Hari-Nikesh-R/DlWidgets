import 'package:dlwidgets/dlwidgets.dart';
import 'package:flutter/material.dart';

class DlSearch extends StatefulWidget {
  const DlSearch(
      {super.key,
      required this.dlTextFormFieldImpl,
      this.activeColor,
      this.isCenter,
      this.searchIconPosition,
      this.onClickOnTrailIcon});

  final DlTextFormFieldImpl dlTextFormFieldImpl;
  final Color? activeColor;
  final bool? isCenter;
  final SearchIconPosition? searchIconPosition;
  final Function? onClickOnTrailIcon;

  @override
  State<DlSearch> createState() => _DlSearchState();
}

class _DlSearchState extends State<DlSearch> {
  @override
  Widget build(BuildContext context) {
    return (widget.searchIconPosition == SearchIconPosition.leading)
        ? DlTextFormField(
            input: widget.dlTextFormFieldImpl,
            leadingIcon: const Icon(Icons.search),
            isPassword: false,
            isCenter: widget.isCenter,
            activeColor: widget.activeColor ?? Colors.blue)
        : DlTextFormField(
            input: widget.dlTextFormFieldImpl,
            trailingIcon: IconButton(
                onPressed: () {
                  if (widget.onClickOnTrailIcon != null) {
                    widget.onClickOnTrailIcon!();
                  }
                },
                icon: const Icon(Icons.search)),
            isPassword: false,
            isCenter: widget.isCenter,
            activeColor: widget.activeColor ?? Colors.blue);
  }
}

enum SearchIconPosition { leading, trail }
