import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHelloWorld = true;

  List<String> switchLogs = [];

  void updateSwitchLogs(bool newValue) {
    String log = '${DateFormat.Hms().format(DateTime.now())}: '
        '${newValue ? "Hello world" : "Bye world"}';
    setState(() {
      switchLogs.add(log);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Theme'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello world'),
              Switch(
                value: isHelloWorld,
                onChanged: (newValue) {
                  setState(() {
                    isHelloWorld = newValue;
                    updateSwitchLogs(newValue);
                  });
                },
              ),
              const Text('Bye world'),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(isHelloWorld),
                ),
              );
            },
            child: const Text('Go to Second Screen'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Switch Logs:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: switchLogs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(switchLogs[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final bool isHelloWorld;

  const SecondScreen(this.isHelloWorld, {super.key});

  @override
  Widget build(BuildContext context) {
    String message = isHelloWorld ? 'Привет мир' : 'Пока мир';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
