import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loka/controllers/home.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes List'),
      ),
      body: Center(
        child: Obx(() => controller.isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: controller.recipes.length,
                itemBuilder: (context, index) {
                  final item = controller.recipes[index];
                  return GestureDetector(
                      onTap: () => controller.details(item),
                      child: ListTile(
                        title: Text(item.name ?? '-'),
                        subtitle: Text(item.category ?? '-'),
                      ));
                },
              )),
      ),
    );
  }
}
