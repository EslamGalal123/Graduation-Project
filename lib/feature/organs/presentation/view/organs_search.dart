import 'package:diiabest/feature/organs/presentation/widget/eyes_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/foot_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/heart_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/skin_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/teeth_view.dart';
import 'package:flutter/material.dart';
class organsView extends StatefulWidget {
  const organsView({super.key});

  @override
  State<organsView> createState() => _organsViewState();
}
class _organsViewState extends State<organsView> {
  static String searchQuery = '';
  List<Map<String, dynamic>> getFilteredItems() {
    return [
      {'title': 'Teeth', 'value': 1, 'page': const TeethView()},
      {'title': 'Skin', 'value': 2, 'page': const SkinView()},
      {'title': 'Foot', 'value': 3, 'page': const FootView()},
      {'title': 'Eyes', 'value': 6, 'page': const EyesView()},
      {'title': 'Heart', 'value': 11, 'page': const HeartView()},
    ].where((item) {
      final title = item['title'] as String;
      return title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  int? organ;

  void navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = getFilteredItems();
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                "Select the affected Organ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration:  InputDecoration(
                    hintText: 'Search', prefixIcon: const Icon(Icons.search),
                     border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:const BorderSide(color: Colors.grey, width: 2.0),
              ),
                  contentPadding:const EdgeInsets.symmetric(vertical: 10, horizontal: 10), // تحديد المسافة الداخلية
),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: filteredItems.map((item) {
                  return RadioListTile(
                    title: Text(
                      item['title'] as String,
                      style:Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: item['value'],
                    groupValue: organ,
                    onChanged: (value) {
                      setState(() {
                        organ = value as int?;
                        navigateToPage(item['page'] as Widget);
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
