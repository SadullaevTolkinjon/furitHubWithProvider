import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Yummpage extends StatefulWidget {
  const Yummpage({Key? key}) : super(key: key);

  @override
  State<Yummpage> createState() => _YummpageState();
}

class _YummpageState extends State<Yummpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box("yummy").listenable(),
          builder: (context, box, index) {
            var data = box.values.toList();
            String selected = data.toList().toString();
            String selectable = '';
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Text(selectable),
                    ),
                    Container(
                      child: SelectableText(
                        selected,
                        onSelectionChanged:
                            (TextSelection, SelectionChangedCause) {
                          setState(() {
                            selectable = selected.substring(
                                TextSelection.start, TextSelection.end);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
