import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';
import 'package:meals_app/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.settings, this.onSettingsChange, {super.key});

  final Settings settings;
  final Function(Settings) onSettingsChange;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glúten',
                    'Só exibe refeições sem glúten',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value),
                  ),
                  _createSwitch(
                    'Vegetarianas',
                    'Só exibe refeições vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
