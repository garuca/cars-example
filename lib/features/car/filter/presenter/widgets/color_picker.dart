import 'package:cars/features/car/filter/color/domain/entities/color.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final ColorPickerController? controller;

  const ColorPicker({Key? key, this.controller}) : super(key: key);

  @override
  ColorPickerState createState() => ColorPickerState();
}

class ColorPickerState extends State<ColorPicker> {
  Map<String, Color> colors = {
    '1': Colors.white,
    '2': const Color(0xFFd8dae1),
    '3': Colors.black,
    '4': const Color(0xFFfc4a40)
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildElement(ColorCustom colorCustom) {
      return GestureDetector(
        onTap: () {
          setState(() {
            if (widget.controller!.selects!
                .contains(int.parse(colorCustom.colorId!))) {
              widget.controller!.selects!
                  .remove(int.parse(colorCustom.colorId!));
            } else {
              widget.controller!.selects!.add(int.parse(colorCustom.colorId!));
            }
          });
        },
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: colors[colorCustom.colorId],
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFFDDDDDD),
                            width: 1,
                            style: BorderStyle.solid)),
                  ),
                  Visibility(
                    visible: widget.controller!.selects!
                        .contains(int.parse(colorCustom.colorId!)),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color(0xFF0065FF),
                              width: 2,
                              style: BorderStyle.solid)),
                      child: const Center(
                        child: Icon(Icons.check,
                            size: 16, color: Color(0xFF0065FF)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                colorCustom.name!,
                style: const TextStyle(fontSize: 16, color: Color(0xFF768095)),
              ),
            ],
          ),
        ),
      );
    }

    SliverGrid _buildContent(List<ColorCustom> colors) {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 5,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return _buildElement(widget.controller!.colors![index]);
          },
          childCount: colors.length,
        ),
      );
    }

    return _buildContent(widget.controller!.colors!);
  }
}

class ColorPickerController {
  final List<ColorCustom>? colors;
  List<int>? selects;

  ColorPickerController({this.colors, this.selects}) {
    selects ??= [];
  }
}
