import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

class MarksheetDown extends StatefulWidget {
  const MarksheetDown({super.key});

  @override
  State<MarksheetDown> createState() => _MarksheetDownState();
}

class _MarksheetDownState extends State<MarksheetDown> {
  final year = [
    '2021-2022',
    '2020-2021',
    '2019-2020',
    '2018-2019',
    '2017-2018',
    '2016-2017',
    '2015-2016',
  ];
  DropdownMenuItem<String> buildMenuyear(String year) => DropdownMenuItem(
        value: year,
        child: Text(
          year,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
  String? cc;
  String batch = "501";

  final TextEditingController _roll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Marksheet downloder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  value: cc,
                  isExpanded: false,
                  items: year.map(buildMenuyear).toList(),
                  onChanged: (value) => setState(() => cc = value),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('COURSE'),
                ),
                SegmentedButton<String>(
                  showSelectedIcon: false,
                  segments: const <ButtonSegment<String>>[
                    ButtonSegment<String>(
                      value: "501",
                      label: Text('BCA VI'),
                    ),
                    ButtonSegment<String>(
                      value: "507",
                      label: Text('BBA VI'),
                    ),
                  ],
                  selected: <String>{batch},
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      batch = newSelection.first;
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('ROLL NUMBER'),
                ),
                SizedBox(
                  width: 300,
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
                    if (cc?.isNotEmpty == true) {
                      String rollnum = _roll.text.trim();
                      String? s1 = cc?.substring(0, 5);
                      String? s2 = cc?.substring(7);
                      String ses = "$s1$s2";

                      String url =
                          "http://vallet.co.in/GenerateDigitalMarksheetQRcodeSEM.aspx?ROLLNO=$rollnum&courseid=$batch&SESSION=$ses&semno=6";
                      if (await canLaunchUrlString(url)) {
                        await launchUrlString(url);
                      }
                    } else {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Select Session'),
                            content: const Text(
                                'First select session then press "Download" button'),
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
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Marksheet downloder'),
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
