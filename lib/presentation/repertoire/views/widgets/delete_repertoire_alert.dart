import 'package:flutter/material.dart';
import 'package:hymnum/presentation/repertoire/models/repertoire_model.dart';
import 'package:hymnum/presentation/repertoire/viewmodels/repertoire_viewmodel.dart';
import 'package:provider/provider.dart';

void showDeleteRepertoireAlert({
  required BuildContext context,
  required RepertoireModel repertoire
}) {
  final viewmodel = Provider.of<RepertoireViewmodel>(context, listen: false);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Delete repertory?'),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () {
            viewmodel.delete(repertoire);
            Navigator.pop(context);
          },
          child: Text(
            'Delete',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ],
    ),
  );
}
