import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Utils/Format.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Format {
  late final HomeScreenController _controller;

  @override
  void initState() {
    _controller = context.read<HomeScreenController>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Nimbus',
          style: TextStyle(
            color: AppColors.fontColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _controller.exitPressed,
            icon: Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            AppFormTextField(
              onChanged: _controller.searchOnChanged,
              controller: _controller.searchController,
              prefixIcon: Icon(Icons.search_rounded),
              label: 'Search File',
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Your Files',
                      style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
