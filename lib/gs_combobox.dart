import 'package:flucknorris/with_label.dart';
import 'package:flutter/material.dart';

class GSCombobox<T extends WithLabel> extends StatefulWidget {
  GSCombobox(
      {@required this.labelText,
      this.itemBuilder,
      this.values,
      this.firstSelected = false,
      this.allowClear = true,
      this.onChanged,
      Key key})
      : super(key: key);

  final String labelText;
  final bool firstSelected;
  final bool allowClear;
  final Function itemBuilder;
  List<T> values;
  Function onChanged;

  void setValues(List<T> values) {
    this.values = values;
  }

  void setOnChanged(Function onChanged) {
    this.onChanged = onChanged;
  }

  bool hasSelectedValue() {
    return getSelectedValue() != null;
  }

  T getSelectedValue() {
    return values.firstWhere((o) => o.getLabel() == state._currentValue, orElse: () => null);
  }

  _GSComboboxState state = _GSComboboxState();

  @override
  State<StatefulWidget> createState() => state;
}

class _GSComboboxState<T extends WithLabel> extends State<GSCombobox<T>> {
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentValue;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    if (widget.firstSelected && widget.values.isNotEmpty) {
      _currentValue = _dropDownMenuItems[1].value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownButtonFormField<dynamic>(
          value: _currentValue,
          items: _dropDownMenuItems,
          onChanged: changedDropDownItem,
          decoration: InputDecoration(
              labelText: widget.labelText,
              border: OutlineInputBorder(),
              suffixIcon: widget.allowClear && _currentValue != ''
                  ? _buildClearIcon()
                  : null),
        ),
        _buildNoValues(),
      ],
    );
  }

  Widget _buildNoValues() {
    return widget.values.isEmpty
        ? Text(
            'Error text',
            style: TextStyle(color: Color.fromRGBO(255, 0, 0, 0.5)),
          )
        : Container();
  }

  Widget _buildClearIcon() {
    return GestureDetector(
      onTap: _resetSelectedValue,
      child: Icon(Icons.close),
    );
  }

  void _resetSelectedValue() {
    setState(() {
      _currentValue = '';
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    final List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[];
    items.add(DropdownMenuItem<String>(
      value: '',
      child: Text(''),
    ));
    for (T value in widget.values) {
      items.add(
        DropdownMenuItem<String>(
          value: value.getLabel(),
          child: widget.itemBuilder != null
              ? widget.itemBuilder(value)
              : Text(value.getLabel()),
        ),
      );
    }
    return items;
  }

  void changedDropDownItem(dynamic selectedValue) {
    setState(() {
      _currentValue = selectedValue;
      widget.onChanged();
    });
  }
}
