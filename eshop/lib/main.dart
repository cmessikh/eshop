import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'E-Shop Home Page'),
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
  final TextEditingController iconController = TextEditingController();
  String? selectedIcon = "";
  // ignore: non_constant_identifier_names
  String _chosen_category = "";

  void _updateCategory() {
    setState(() {
      _chosen_category = selectedIcon.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> iconEntries =
        <DropdownMenuEntry<String>>[];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownMenu<String>(
              controller: iconController,
              enableFilter: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('Category'),
              dropdownMenuEntries: iconEntries,
              inputDecorationTheme: const InputDecorationTheme(filled: true),
              onSelected: (String? icon) {
                setState(() {
                  selectedIcon = icon;
                });
              },
            ),
            Text(
              '$_chosen_category',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateCategory,
        tooltip: 'Update Category',
        child: const Icon(Icons.add),
      ),
    );
  }
}

enum CategoryLabel{
  tricots('Tricots'),
  pantalons('Pantalons'),
  chaussures('Chaussures');

  final String label;
  const CategoryLabel(this.label)
}