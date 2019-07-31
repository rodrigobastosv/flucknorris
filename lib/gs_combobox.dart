import 'package:flucknorris/with_label.dart';
import 'package:flutter/material.dart';

class GSCombobox<T extends WithLabel> extends StatefulWidget {
  GSCombobox({
    @required this.labelText,
    this.values,
    this.onChanged,
    Key key
  }): super(key: key);

  final String labelText;
  List<T> values;
  Function onChanged;

  void setValues(List<T> values) {
    this.values = values;
  }

  void setOnChanged(Function onChanged) {
    this.onChanged = onChanged;
  }

  T getSelectedValue() {
    return state.getSelectedItem();
  }

  _GSComboboxState state = _GSComboboxState();

  @override
  State<StatefulWidget> createState() => state;
}

class _GSComboboxState<T extends WithLabel> extends State<GSCombobox<T>> {
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  dynamic _currentValue;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentValue = _dropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      value: _currentValue,
      items: _dropDownMenuItems,
      onChanged: changedDropDownItem,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  T getSelectedItem() {
    return widget.values.firstWhere((v) => v.getLabel() == _currentValue);
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    final List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[];
    for (T value in widget.values) {
      items.add(
        DropdownMenuItem<String>(
          value: value.getLabel(),
          child: Text(value.getLabel()),
        ),
      );
    }
    return items;
  }

  void changedDropDownItem(dynamic selectedValue) {
    setState(() {
      _currentValue = selectedValue;
    });
    widget.onChanged();
  }
}
