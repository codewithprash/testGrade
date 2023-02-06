import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'main.dart';

class BcaPage extends StatefulWidget {
  const BcaPage({super.key});

  @override
  State<BcaPage> createState() => _BcaPageState();
}

class _BcaPageState extends State<BcaPage> {
  final year = [
    'DEC 2022, MAY 2023',
    'DEC 2021, MAY 2022',
    'DEC 2020, MAY 2021',
    'DEC 2019, MAY 2020',
    'DEC 2018, MAY 2019',
    'DEC 2017, MAY 2018',
    'DEC 2016, MAY 2017',
    'DEC 2015, MAY 2016',
  ];

  String? bca;
  String sem = "BCAI";
  String? i;

  final TextEditingController _roll = TextEditingController();

  DropdownMenuItem<String> buildMenuyear(String year) => DropdownMenuItem(
        value: year,
        child: Text(
          year,
          // style: Theme.of(context).textTheme.titleLarge,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        title: Text(
          'BCA',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('SESSION'),
                ),
                DropdownButton<String>(
                  hint: const Text('Select Session'),
                  value: bca,
                  isExpanded: false,
                  items: year.map(buildMenuyear).toList(),
                  onChanged: (value) => setState(() => bca = value),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('SEMESTER'),
                ),
                SegmentedButton<String>(
                  showSelectedIcon: false,
                  segments: const <ButtonSegment<String>>[
                    ButtonSegment<String>(
                      value: "BCAI",
                      label: Text('I'),
                    ),
                    ButtonSegment<String>(
                      value: "BCAII",
                      label: Text('II'),
                    ),
                    ButtonSegment<String>(
                      value: "BCAIII",
                      label: Text('III'),
                    ),
                    ButtonSegment<String>(
                      value: "BCAIV",
                      label: Text('IV'),
                    ),
                    ButtonSegment<String>(
                      value: "BCAV",
                      label: Text('V'),
                    ),
                    ButtonSegment<String>(
                      value: "BCAVI",
                      label: Text('VI'),
                    ),
                  ],
                  selected: <String>{sem},
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      sem = newSelection.first;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('ROLL NUMBER'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: _roll,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.numbers_rounded,
                        ),
                        hintText: 'Enter Roll Number',
                        filled: true),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FilledButton(
                  onPressed: () async {
                    if (bca?.isNotEmpty == true) {
                      if (sem == 'BCAII') {
                        i = '_501_SEM_';
                      } else if (sem == 'BCAIV') {
                        i = '_SEM_501_';
                      } else {
                        i = '_SEM_';
                      }

                      String? s1 = bca?.substring(6, 8);
                      String? s2 = bca?.substring(16, 18);
                      String ses = "$s1$s2";

                      String note = "$sem$i$ses";
                      String rollnum = _roll.text.trim();

                      String url =
                          'https://result.dbrauonlineservices.in/ResultDisp$note.aspx?rl=$rollnum';

                      if (await canLaunchUrlString(url)) {
                        await launchUrlString(url);
                      }
                    } else {
                      alertdialog(context);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Show Result'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Made with ❤ by @djprashh',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
