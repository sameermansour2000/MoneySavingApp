import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  const CustomSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 34, ),
      child: SearchBar(
       onChanged: onChanged,
        hintText: "Search",
        onSubmitted: (String value) {
          print(value);
        },
        leading: Icon(Icons.search),
       constraints: BoxConstraints(
         maxWidth: MediaQuery.of(context).size.width,
       minHeight: 47,
       ),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(

        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(color: Colors.white, width: 0.0),
        ),
      ),
      ),
    );
  }
}
