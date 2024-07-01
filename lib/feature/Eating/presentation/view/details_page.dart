import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';
class DetailsPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final String image;

  const DetailsPage({super.key, 
    required this.title,
    required this.items,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: CustomTextStyles.lohit500style22),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(image,
                height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              title,
              style:  CustomTextStyles.lohit500style22,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    title: Text(item['name']!,style: CustomTextStyles.lohit500style20),
                    subtitle: Text('${item['category']} - ${item['serve']}',style: CustomTextStyles.lohit400style18),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
