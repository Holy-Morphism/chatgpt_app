import 'package:chatgptapp/widgets/drop_down.dart';
import 'package:chatgptapp/widgets/model.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Services {
  static Future<void> bottomSheet(BuildContext context) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(child: TxtStyle(label: 'Chosen Model : ')),
                Flexible(
                  flex: 2,
                  child: DropDown(),
                ),
              ],
            ),
          );
        });
  }
}
