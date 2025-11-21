import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      InventoryBloc,
      InventoryState,
      (List<ModelCategory>?, String?)
    >(
      selector: (state) => state is InventoryLoaded
          ? (state.dataCategory, state.idBranch)
          : (null, null),
      builder: (context, state) {
        if (state.$1 == null) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: const SpinKitThreeBounce(color: Colors.blue, size: 15.0),
          );
        }
        final dataCategory = state.$1!
            .where((data) => data.getidBranch == state.$2)
            .toList();
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: ListView.builder(
            itemCount: dataCategory.length,
            itemBuilder: (context, index) {
              final category = dataCategory[index];
              return ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0, 0.02, 0.98, 1],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Material(
                  color: index % 2 == 0
                      ? const Color.fromARGB(255, 235, 235, 235)
                      : const Color.fromARGB(255, 221, 221, 221),
                  child: InkWell(
                    onTap: () {
                      context.read<InventoryBloc>().add(
                        InventorySelectedCategory(selectedCategory: category),
                      );
                    },
                    child: Dismissible(
                      key: Key(category.getidCategory),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: EdgeInsets.only(right: 10),
                        color: Colors.redAccent,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        final result = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Konfirmasi", style: lv2TextStyle),
                            content: Text(
                              "Hapus Kategori ${category.getnameCategory}?",
                              style: lv1TextStyle,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("Batal", style: lv1TextStyle),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<InventoryBloc>().add(
                                    InventoryDeleteCategory(
                                      id: category.getidCategory,
                                    ),
                                  );
                                  Navigator.pop(context, true);
                                },
                                child: Text("Hapus", style: lv1TextStyle),
                              ),
                            ],
                          ),
                        );

                        if (result == true) {
                          return true;
                        }

                        return false;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 10,
                          bottom: 10,
                        ),

                        child: Text(
                          category.getnameCategory,
                          style: lv1TextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
