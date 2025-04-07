import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Components/FileCard.dart';
import 'package:nimbus/Components/FolderCard.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionName(name: 'Recent files'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 170,
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FileCard(
                      name: 'File ($index)',
                      date: '15.07.2020',
                      size: '134 KB',
                      onPressed: () {},
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionName(name: 'My folders'),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(child: Text('Create a new folder')),
                            content: AppFormTextField(
                              hint: 'Projects',
                              label: 'Folder name',
                            ),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: Text('Cancel'),
                              ),
                              BlueButton(onPressed: () {}, label: 'Create'),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.add, color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return FolderCard(name: 'Folder ($index)');
                },
              ),
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
