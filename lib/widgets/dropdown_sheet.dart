import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farsight_vendor_app/widgets/no_scroll_glow.dart';

class DropdownSheet<T> extends StatefulWidget {
  final T? value;
  final String label;
  final bool isLoading;
  final bool isDisabled;
  final List<T> options;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;

  final String hintText;
  final String searchHintText;
  final String disabledHintText;

  const DropdownSheet({
    key,
    required this.label,
    required this.value,
    required this.options,
    required this.getLabel,
    required this.onChanged,
    this.isLoading = false,
    this.isDisabled = false,
    this.hintText = '',
    this.searchHintText = '',
    this.disabledHintText = '',
  }) : super(key: key);

  @override
  State<DropdownSheet<T>> createState() => _DropdownSheetState<T>();
}

class _DropdownSheetState<T> extends State<DropdownSheet<T>> {
  bool isSearching = false;
  List<T> dataToRender = <T>[];
  double height = Get.size.height;
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the selected value's label.
    if (widget.value != null) {
      _valueController.text = widget.getLabel(widget.value!);
    } else {
      _valueController.text = '';
    }
  }

  @override
  void dispose() {
    _valueController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;

    // Update the controller value when the selected option changes.
    if (widget.value != null) {
      _valueController.text = widget.getLabel(widget.value!);
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        _valueController.text = '';
      });
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          controller: _valueController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Select ${widget.label.toLowerCase()}';
            }
            return null;
          },
        ),
        Material(
          child: InkWell(
            onTap: widget.isLoading || widget.isDisabled
                ? null
                : () {
                    setState(() {
                      _searchController.clear();
                      dataToRender = widget.options;
                    });
                    if (widget.value != null) {
                      _valueController.text = widget.getLabel(widget.value!);
                    }
                    renderDropdownSheet();
                  },
            child: Container(
              height: 56,
              width: Get.size.width,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: widget.value == null
                      ? Colors.grey.shade500
                      : const Color.fromARGB(255, 5, 5, 5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width - 100,
                    child: widget.value == null
                        ? Text(
                            widget.isDisabled
                                ? widget.disabledHintText.isEmpty
                                    ? 'Disabled'
                                    : widget.disabledHintText
                                : widget.hintText.isEmpty
                                    ? 'Select ${widget.label.toLowerCase()}'
                                    : widget.hintText,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          )
                        : Text(
                            widget.getLabel(widget.value!),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  widget.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : widget.isDisabled
                          ? Icon(
                              Icons.info_outline_rounded,
                              color: Colors.grey.shade500,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey.shade500,
                            ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 10,
          child: Container(
            color: const Color(0xfff7f7f7),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  renderDropdownSheet() async {
    await Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: height * 0.6,
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      dataToRender = widget.options
                          .where((element) => widget
                              .getLabel(element)
                              .trim()
                              .toLowerCase()
                              .contains(
                                  _searchController.text.trim().toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: widget.searchHintText.isEmpty
                        ? 'Search'
                        : widget.searchHintText,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                      onPressed: () {
                        _searchController.clear();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: NoScrollGlow(
                    child: dataToRender.isEmpty
                        ? const Center(
                            child: Text('No options found'),
                          )
                        : ListView.builder(
                            itemCount: dataToRender.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                selected: widget.value == dataToRender[index],
                                title: Text(
                                  widget.getLabel(dataToRender[index]),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                onTap: () {
                                  widget.onChanged(dataToRender[index]);
                                  _valueController.text =
                                      widget.getLabel(dataToRender[index]);
                                  _searchController.clear();
                                  navigator!.pop();
                                },
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      barrierColor: Colors.black.withOpacity(0.7),
    );
  }
}
