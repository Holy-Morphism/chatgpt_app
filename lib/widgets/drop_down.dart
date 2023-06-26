import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../models/api_models.dart';
import '../providers/models_provider.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? currentModel; // 'gpt-3.5-turbo-16k';
  @override
  Widget build(BuildContext context) {
    final models = Provider.of<ModelsProvider>(context, listen: false);
    currentModel = models.getCurrentModel;
    return FutureBuilder<List<ApiModel>>(
      future: models.getAllModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return snapshot.data == null || snapshot.data!.isEmpty
            ? const SizedBox.shrink()
            : FittedBox(
                child: DropdownButton(
                    dropdownColor: scaffoldBackgroundColor,
                    items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem<String>(
                        value: snapshot.data![index].id,
                        child: Text(
                          snapshot.data![index].id,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    value: currentModel,
                    onChanged: (value) {
                      setState(() {
                        currentModel = value.toString();
                      });
                      models.setCurrentModel(value.toString());
                    }),
              );
      },
    );
  }
}
