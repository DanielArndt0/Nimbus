import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nimbus/Components/FolderCard.dart';
import 'package:nimbus/Components/FolderDetailsCard.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Modals/DeleteFolderModal.dart';
import 'package:nimbus/Models/FolderModel.dart';

class FoldersList extends StatelessWidget {
  final List<FolderModel> folders;
  final HomeScreenController controller;
  const FoldersList({
    super.key,
    required this.folders,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 5),
      itemCount: folders.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final folder = folders[index];
        return Slidable(
          key: ValueKey(0),
          startActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                autoClose: true,
                foregroundColor: Colors.red,
                icon: Icons.delete_outline_rounded,
                backgroundColor: Colors.red[50]!,
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder:
                        (context) => DeleteFolderModal(
                          controller: controller,
                          folder: folder,
                        ),
                  );
                },
              ),
            ],
          ),
          child: FolderCard(
            name: folder.name,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                enableDrag: true,
                builder: (context) => FolderDetailCard(folder: folder),
              );
            },
          ),
        );
      },
    );
  }
}
