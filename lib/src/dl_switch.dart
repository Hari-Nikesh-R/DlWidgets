import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DlSwitch extends StatefulWidget {
  const DlSwitch({super.key, this.activeColor, this.dlSwitchType});
  final Color? activeColor;
  final DlSwitchType? dlSwitchType;

  @override
  State<DlSwitch> createState() => _DlSwitchState();
}

class _DlSwitchState extends State<DlSwitch> with SingleTickerProviderStateMixin   {
  bool toggle = false;
  bool isSwitched = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSwitch() {
    setState(() {
      isSwitched = !isSwitched;
      if (isSwitched) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.dlSwitchType == DlSwitchType.sunMoon ?GestureDetector(
      onTap: _toggleSwitch,
      child: Container(
        width: 100.0,
        height: 55.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: isSwitched ? Colors.orange : Colors.indigo[900],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: isSwitched ? Alignment.centerRight : Alignment.centerLeft,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context,child) {
                return Transform.translate(
                  offset: Offset(_animation.value, 0),
                  child: const Icon(
                    Icons.wb_cloudy_rounded,
                    color: Colors.yellow,
                    size: 30.0,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value, 0),
                  child: const Icon(
                    Icons.wb_sunny,
                    color: Colors.yellow,
                    size: 30.0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ) : Padding(padding:const EdgeInsets.all(12), child: CupertinoSwitch(
      activeColor: widget.activeColor ,
      value: toggle,
      onChanged: (bool value) {
        setState(() {
          toggle = value;
        });
      },
    ));
  }
}

enum DlSwitchType{
  sunMoon, custom
}
