import 'package:flutter/material.dart';
import 'package:hymnum/presentation/repertoire/models/repertoire_model.dart';
import 'package:hymnum/shared/widgets/child_sized_modal_bottom_sheet.dart';
import 'package:hymnum/presentation/repertoire/views/widgets/trailing_repertoire_options.dart';

class RepertoryListItem extends StatelessWidget {
  const RepertoryListItem(this._repertoire, {super.key});

  final RepertoireModel _repertoire;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_repertoire.name),
        tileColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        subtitle: Text('Musics: ${_repertoire.length}'),

        // onTap: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MusicsPage(_repertoire)),
        // ),
        trailing: IconButton(
          onPressed: () => showChildSizedModalBottomSheet(
            context: context,
            child: TrailingRepertoireOptions(_repertoire),
          ),
          icon: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
