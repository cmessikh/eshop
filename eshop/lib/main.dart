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
        primarySwatch: Colors.purple,
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
  CategoryLabel? selectedCategory;
  // ignore: non_constant_identifier_names
  String _chosen_category = "";

  void _updateCategory() {
    setState(() {
      if (selectedCategory != null) {
        _chosen_category = selectedCategory!.label;
      } else {
        _chosen_category = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<CategoryLabel>> catEntries =
        <DropdownMenuEntry<CategoryLabel>>[];
    for (final CategoryLabel category in CategoryLabel.values) {
      catEntries.add(DropdownMenuEntry<CategoryLabel>(
          value: category, label: category.label));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownMenu<CategoryLabel>(
              controller: iconController,
              enableFilter: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('Category'),
              dropdownMenuEntries: catEntries,
              inputDecorationTheme: const InputDecorationTheme(filled: true),
              onSelected: (CategoryLabel? cat) {
                setState(() {
                  selectedCategory = cat;
                });
              },
            ),
            Text(
              _chosen_category,
              style: Theme.of(context).textTheme.headlineMedium,
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

enum CategoryLabel {
  tricots('Tricots'),
  pantalons('Pantalons'),
  chaussures('Chaussures');

  final String label;
  const CategoryLabel(this.label);
}
