import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Components/LocalFileCard.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:provider/provider.dart';

class AddFilesModal extends StatelessWidget {
  final HomeScreenController controller;
  const AddFilesModal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 50),
      child: Column(
        children: [
          const Row(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Add files',
                    style: TextStyle(color: AppColors.fontColor, fontSize: 24),
                  ),
                ],
              ),
              IconButton(
                onPressed: controller.selectFiles,
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Divider(),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: controller.isLoading,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return CircularProgressIndicator();
                }
                return ValueListenableBuilder(
                  valueListenable: controller.uploadFilesNotifier,
                  builder: (context, files, _) {
                    if (files.isEmpty) {
                      return Center(
                        child: Text(
                          'Add your first file.',
                          style: TextStyle(
                            color: AppColors.subtext,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 5),
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];
                        return ChangeNotifierProvider.value(
                          value: file,
                          child: LocalFileCard(
                            onLongPressStart: (details) {
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  details.globalPosition.dx,
                                  details.globalPosition.dy,
                                  details.globalPosition.dx,
                                  details.globalPosition.dy,
                                ),
                                items: [
                                  PopupMenuItem(
                                    child: Text('Remove'),
                                    onTap: () {
                                      controller.uploadFilesNotifier.value
                                          .removeWhere(
                                            (element) =>
                                                element.name == file.name,
                                          );
                                      controller
                                          .uploadFilesNotifier
                                          .value = List.from(
                                        controller.uploadFilesNotifier.value,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: controller.uploadFilesNotifier,
                builder: (context, files, child) {
                  return Expanded(
                    child: BlueButton(
                      onPressed:
                          files.isEmpty ? null : controller.uploadSelectedFiles,
                      label: 'Upload Files',
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
