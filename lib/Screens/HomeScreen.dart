import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/NavDrawer.dart';
import 'package:nimbus/Components/SectionName.dart';
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
      drawer: NavDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor: Colors.white.withAlpha(10),
              title: Text(
                'My Nimbus',
                style: TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppFormTextField(
                onChanged: _controller.searchOnChanged,
                controller: _controller.searchController,
                prefixIcon: Icon(Icons.search_rounded),
                label: 'Search File',
                hint: '.pdf',
              ),
              SizedBox(height: 20),
              SectionName(name: 'Recent files'),
              SizedBox(height: 20),
              SectionName(name: 'My folders'),
              SizedBox(height: 10),
              // MyFoldersSection(stream: _loadFilesStream, controller: _controller),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
