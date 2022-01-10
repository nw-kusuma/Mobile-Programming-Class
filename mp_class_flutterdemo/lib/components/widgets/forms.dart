import 'package:flutter/material.dart';


// Widget buildDropDownField(
//   List<DropdownMenuItem<T>> items,
//   int index,
// ){
//   return Padding(
//     padding: const EdgeInsets.only(top: 5.0, bottom:10.0),
//     child: DropdownButtonFormField(
//       items: items,
//       value: items[index],
//       onChanged: (value){},
//     ),
//   );
// }

Widget buildTextFormField(
  TextEditingController _controller,
  TextInputType _keyType,
  String _label,
  String _hint,
  IconData _icon, 
{ 
  bool isPrefix = false,
  bool autoFocus = false,
  TextCapitalization caps = TextCapitalization.none,
}){
  // controller.addListener(() => setState(() {}));
  return Padding (
    padding: EdgeInsets.only(top: 5.0, bottom:10.0),
    child: TextFormField(
      autofocus: autoFocus,
      controller: _controller,
      keyboardType: _keyType,
      textCapitalization: caps,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)),
        hintText: _hint,
        labelText: _label,
        prefixIcon: isPrefix ? Icon(_icon) : null,
        suffixIcon: !isPrefix ? Icon(_icon) : null,
        // suffixIcon: controller.text.isEmpty
        //   ? Icon(icon)
        //   : IconButton(
        //       icon: Icon(Icons.close),
        //       onPressed: () => controller.clear(),
        //     ),
      ),
      // onChanged: (value) {},
    ),
  );
}