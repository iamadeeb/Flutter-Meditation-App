import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ThreeCircleButtonWithPlayIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const ThreeCircleButtonWithPlayIcon({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Circle 1
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
          width: 100,
          height: 100,
        ),

        // Circle 2
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
          ),
          width: 75,
          height: 75,
        ),

        // Circle 3
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          width: 50,
          height: 50,
        ),

        // Play icon
        IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: onPressed,
          iconSize: 30,
          color: Colors.black,
        ),
      ],
    );
  }
}

class GradientStatefulWidget extends StatefulWidget {
  @override
  _GradientStatefulWidgetState createState() => _GradientStatefulWidgetState();
}

class _GradientStatefulWidgetState extends State<GradientStatefulWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  LinearGradient _gradient = LinearGradient(
    colors: [Colors.black, Colors.red],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust the duration as needed
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.addListener(() {
      setState(() {
        _gradient = LinearGradient(
          colors: [
            Colors.black,
            Color.lerp(Colors.red, Colors.blue, _controller.value)!
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        );
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: _gradient,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Play button
            ThreeCircleButtonWithPlayIcon(
              onPressed: () {},
            ),
            DropdownButton(
              items: [
                DropdownMenuItem(
                  value: 'One',
                  child: Text('One'),
                ),
                DropdownMenuItem(
                  value: 'Two',
                  child: Text('Two'),
                ),
                DropdownMenuItem(
                  value: 'Three',
                  child: Text('Three'),
                ),
              ],
              onChanged: (value) {
                // Handle the selected value here.
              },
            ),
            // Settings button
            TextButton(
              onPressed: () {},
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientStatefulWidget(),
    );
  }
}
