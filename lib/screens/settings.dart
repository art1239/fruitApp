import 'package:flutter/material.dart';
import 'package:fruitApp/data.dart';
import 'package:fruitApp/models/filter.dart';
import 'package:fruitApp/widgets/MainDrawer.dart';

class Settings extends StatefulWidget {
  static const String path = '/settings';
  final Function saveChanges;
  final Map<String, dynamic> settings;
  Settings(this.settings, this.saveChanges);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<Filter> filters = dummySettings;
  @override
  void initState() {
    filters.map(
      (filter) => Filter(
        subtitle: filter.subtitle,
        title: filter.title,
        value: widget.settings['${filter.title}'],
      ),
    );
    super.initState();
  }

  void updateSwitch(int index, bool newChoice) {
    setState(() {
      filters[index].value = newChoice;
    });
  }

  Widget buildConditionSwitch(String title, String content, int index) {
    return Container(
      margin: EdgeInsets.all(15),
      child: SwitchListTile(
        title: Text(title),
        value: filters[index].value,
        subtitle: Text(content),
        onChanged: (updatedChoice) => updateSwitch(index, updatedChoice),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.saveChanges(Map.fromIterable(
                filters,
                key: (item) => item.title.toString().split(' ').join(),
                value: (item) => item.value,
              )),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your choices',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return buildConditionSwitch(
                  filters[index].title,
                  filters[index].subtitle,
                  index,
                );
              },
              itemCount: filters.length,
            ),
          ),
        ],
      ),
    );
  }
}
