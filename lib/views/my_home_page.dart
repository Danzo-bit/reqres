import 'package:flutter/material.dart';
import 'package:vibes_n_friends/service/data_source/data_source.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // getUsers();
    // createUser('Job', 'Engineer');
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              // Text(local[0].firstName)
              FutureBuilder(
                future: getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      for (int x = 0; x < snapshot.data!.length; x++)
                        Column(
                          children: [
                            Text(snapshot.data![x].email),
                            Image.network(snapshot.data![x].avatar),
                          ],
                        ),
                      
                    ]);
                  }
                  return Text('loading...');
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
