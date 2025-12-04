import 'package:flutter/material.dart';
import 'package:hymnum/presentation/repertoire/viewmodels/repertoire_viewmodel.dart';
import 'package:hymnum/presentation/repertoire/views/widgets/empty_list_message.dart';
import 'package:hymnum/presentation/repertoire/views/widgets/rename_repertoire_bottom_sheet.dart';
import 'package:hymnum/presentation/repertoire/views/widgets/repertory_list_item.dart';
import 'package:provider/provider.dart';


class RepertoiresPage extends StatelessWidget {
  const RepertoiresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<RepertoireViewmodel>();
    return Stack(
      children: [
        SizedBox.expand(
          child: viewmodel.repertoires.isNotEmpty
              ? ListView.builder(
                  itemCount: viewmodel.repertoires.length,
                  itemBuilder: (context, index) =>
                      RepertoryListItem(viewmodel.findByIndex(index)!),
                )
              : SizedBox.shrink(),
        ),
        if (viewmodel.repertoires.isEmpty) EmptyListMessage(),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(15),
          child: IconButton.filled(
            tooltip: 'Add repertory',
            onPressed: () => showRenameRepertoireBottomSheet(null, context: context),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}