import 'package:flutter/material.dart';
import 'package:hymnum/presentation/repertoire/models/repertoire_model.dart';
import 'package:hymnum/shared/utils/validation.dart';
import 'package:hymnum/presentation/repertoire/viewmodels/repertoire_viewmodel.dart';
import 'package:provider/provider.dart';

void showRenameRepertoireBottomSheet(
  RepertoireModel? repertoire, {
  required BuildContext context,
}) {
  final viewmodel = Provider.of<RepertoireViewmodel>(context, listen: false);
  String name = repertoire == null ? '' : repertoire.name;
  final textController = TextEditingController.fromValue(
    TextEditingValue(text: name),
  );
  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: Durations.short2,
      child: _BottomSheetContent(
        textController: textController,
        repertoireViewmodel: viewmodel,
        repertoire: repertoire,
        formKey: formKey,
      ),
    ),
  );
}

class _BottomSheetContent extends StatefulWidget {
  const _BottomSheetContent({
    required this.textController,
    required this.repertoireViewmodel,
    required this.repertoire,
    required this.formKey,
  });

  final RepertoireModel? repertoire;
  final RepertoireViewmodel repertoireViewmodel;
  final TextEditingController textController;
  final GlobalKey<FormState> formKey;

  @override
  State<_BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<_BottomSheetContent> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => focusNode.requestFocus(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: widget.formKey,
              child: TextFormField(
                focusNode: focusNode,
                validator: (value) =>
                    validateTextNotEmpty(value, 'Type the name'),
                decoration: InputDecoration(label: Text('Name')),
                controller: widget.textController,
                maxLength: 50,
                keyboardType: TextInputType.text,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              OutlinedButton(
                onPressed: () {
                  if (!widget.formKey.currentState!.validate()) return;
                  if (widget.repertoire == null) {
                    widget.repertoireViewmodel.add(
                      widget.textController.text.trim(),
                    );
                  } else {
                    widget.repertoireViewmodel.rename(
                      widget.repertoire!,
                      widget.textController.text.trim(),
                    );
                  }
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
