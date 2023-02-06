import 'package:flutter/material.dart';
import 'package:testgrade/bbapage.dart';
import 'package:testgrade/marksheetdown.dart';
import 'package:testgrade/bcapage.dart';
import 'package:testgrade/bscbio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'testGrade',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const Dash(),
    );
  }
}

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          centerTitle: true,
          title: Text(
            'testGrade',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 300,
                  width: 350,
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 8.0),
                    childAspectRatio: 2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      FilledButton.tonalIcon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BcaPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        icon: const Icon(
                          Icons.computer,
                          size: 30,
                        ),
                        label: const Text(
                          "BCA",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BbaPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        icon: const Icon(
                          Icons.business_center_outlined,
                          size: 30,
                        ),
                        label: const Text(
                          "BBA",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BscBio(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        icon: const Icon(
                          Icons.biotech_outlined,
                          size: 30,
                        ),
                        label: const Text(
                          "BSC BioTech",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Coming Soon!'),
                                content: const Text(
                                    'jld he ye bhi add hoga Dhanyawaad'),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Okey'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        icon: const Icon(
                          Icons.business_center_outlined,
                          size: 30,
                        ),
                        label: const Text(
                          "MBA",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
                FilledButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MarksheetDown(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.download),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Marksheet Downloder",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Made with ❤ by @djprashh',
                ),
              ],
            ),
          ),
        ));
  }
}

Future<void> alertdialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Session'),
        content:
            const Text('First select session then press "Show Result" button'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
