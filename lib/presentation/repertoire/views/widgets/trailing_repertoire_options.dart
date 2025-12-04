import 'package:flutter/material.dart';
import 'package:hymnum/presentation/repertoire/models/repertoire_model.dart';
import 'package:hymnum/presentation/repertoire/views/widgets/delete_repertoire_alert.dart';
import 'package:hymnum/presentation/repertoire/views/widgets/rename_repertoire_bottom_sheet.dart';

class TrailingRepertoireOptions extends StatelessWidget {
  const TrailingRepertoireOptions(this._repertoire, {super.key});

  final RepertoireModel _repertoire;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
            showRenameRepertoireBottomSheet(_repertoire, context: context);
          },
          label: Text('Rename'),
          icon: Icon(Icons.abc),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              showDeleteRepertoireAlert(context: context, repertoire: _repertoire);
            },
            label: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
