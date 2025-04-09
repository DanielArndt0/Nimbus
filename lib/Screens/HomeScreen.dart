import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/FileCard.dart';
import 'package:nimbus/Components/NavDrawer.dart';
import 'package:nimbus/Components/SectionName.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Modals/CreateFolderModal.dart';
import 'package:nimbus/Models/FolderModel.dart';

import 'package:nimbus/Utils/Format.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Format {
  late final HomeScreenController _controller;
  late final Stream<List<FolderModel>> _streamGetFolders;

  @override
  void initState() {
    _controller = context.read<HomeScreenController>();
    _streamGetFolders = _controller.getFolders();
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
                  SectionName(name: 'My files'),
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
                        builder:
                            (context) =>
                                CreateFolderModal(controller: _controller),
                      );
                    },
                    icon: Icon(Icons.add, color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(height: 10),
              StreamBuilder<List<FolderModel>>(
                stream: _streamGetFolders,
                builder:
                    (context, snapshot) => _controller.streamTreatment(
                      context: context,
                      snapshot: snapshot,
                    ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColors.primary,
        initialActiveIndex: 2,
        items: [
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.pie_chart_rounded, title: 'Storage'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.settings, title: 'Settings'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
      ),
    );
  }
}
