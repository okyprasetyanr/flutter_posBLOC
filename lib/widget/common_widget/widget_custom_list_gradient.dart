import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget customListGradient<T>({
  List<T>? data,
  Function(T data)? getId,
  Function(T data)? getName,
  Function(T selectedData)? selectedData,
  Function(T deleteData)? deleteData,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: ListView.builder(
      itemCount: data!.length,
      itemBuilder: (context, index) {
        final dataIndex = data[index];
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
                selectedData!(dataIndex);
              },
              child: deleteData != null
                  ? Dismissible(
                      key: Key(getId!(dataIndex)),
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
                              "Hapus Kategori ${getName(dataIndex)}?",
                              style: lv1TextStyle,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("Batal", style: lv1TextStyle),
                              ),
                              TextButton(
                                onPressed: () {
                                  deleteData!(dataIndex);
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

                        child: Text(getName!(dataIndex), style: lv1TextStyle),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 10,
                        bottom: 10,
                      ),

                      child: Text(getName!(dataIndex), style: lv1TextStyle),
                    ),
            ),
          ),
        );
      },
    ),
  );
}
