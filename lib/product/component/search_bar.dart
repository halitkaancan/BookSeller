import 'package:flutter/material.dart';

import 'general_color.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorLightWhite1(),
      child: Row(
        children: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.filter_list),
        ],
      ),
    );
  }
}
