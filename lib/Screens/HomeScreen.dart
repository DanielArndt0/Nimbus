import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Controllers/FileCard.dart';
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
    _controller.refresh();
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
              onChanged: (p0) {
                setState(() {});
              },
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
                    Text('Recent'),
                    SizedBox(width: 10),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
                IconButton(
                  onPressed: _controller.addIconPressed,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            FutureBuilder(
              future: _controller.getFilesSimpleData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  Text('No data');
                }

                if (snapshot.data == null) {
                  Text('No data');
                }

                final filesRef = snapshot.data!;
                final filteredFiles =
                    filesRef.where((reference) {
                      return reference.name.toLowerCase().contains(
                        _controller.searchController.text.toLowerCase(),
                      );
                    }).toList();

                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: filteredFiles.length,
                    itemBuilder: (context, index) {
                      final file = filteredFiles[index];

                      return FutureBuilder(
                        future: _controller.getFileMetadata(ref: file.name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              height: 10,
                              width: 10,
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (!snapshot.hasData) {
                            Text('No data');
                          }

                          if (snapshot.data == null) {
                            Text('No data');
                          }

                          final metadata = snapshot.data!;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FileCard(
                              name: metadata.name,
                              date: formatDate(metadata.updated!),
                              size: formatBytes(metadata.size!),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
