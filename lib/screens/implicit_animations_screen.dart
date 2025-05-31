import 'package:flutter/material.dart';

class ImplictAnimationsScreen extends StatefulWidget {
  const ImplictAnimationsScreen({super.key});

  @override
  State<ImplictAnimationsScreen> createState() =>
      _ImplictAnimationsScreenState();
}

class _ImplictAnimationsScreenState extends State<ImplictAnimationsScreen> {
  bool _visiable = true;

  void _trigger() {
    setState(() {
      _visiable = !_visiable;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Implicit Animations")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 800),
              curve: Curves.elasticOut,
              height: size.width * 0.8,
              width: size.width * 0.8,

              transform: Matrix4.rotationZ(_visiable ? 1 : 0),
              transformAlignment: Alignment.center,
              decoration: BoxDecoration(
                color: _visiable ? Colors.red : Colors.amber,
                borderRadius: BorderRadius.circular(_visiable ? 100 : 0),
              ),
            ),
            TweenAnimationBuilder(
              // tween: Tween(begin: 10.0, end: 20.0),
              tween: ColorTween(begin: Colors.purple, end: Colors.red),
              curve: Curves.bounceInOut,
              duration: Duration(seconds: 5),
              builder: (context, value, child) => Image.network(
                "https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png",
                color: value,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _trigger, child: Text("GO")),
          ],
        ),
      ),
    );
  }
}
