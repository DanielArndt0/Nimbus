import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/CloudFileCard.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Modals/AddFilesModal.dart';
import 'package:nimbus/Models/FileCloudModel.dart';
import 'package:nimbus/Utils/FileType.dart';
import 'package:nimbus/Utils/Format.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Format {
  late final HomeScreenController _controller;
  late final Stream<List<FileCloudModel>> _loadFilesStream;

  @override
  void initState() {
    _controller = context.read<HomeScreenController>();
    _loadFilesStream = _controller.loadFilesFromCloud();
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
              hint: '.pdf',
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Your Nimbus Files',
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
            SizedBox(height: 20),
            StreamBuilder<Object>(
              stream: _loadFilesStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return Text(
                    'No data',
                    style: TextStyle(
                      color: AppColors.subtext,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  );
                }

                final files = snapshot.data! as List<FileCloudModel>;

                if (files.isEmpty) {
                  return Text(
                    'Add your first file.',
                    style: TextStyle(
                      color: AppColors.subtext,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  );
                }

                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 130,
                    ),
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      final file = files[index];
                      return CloudFileCard(
                        file: file,
                        color: FileType.fileColor(fileType: file.type),
                        icon: FileType.fileIcon(fileType: file.type),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddFilesModal(controller: _controller),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
