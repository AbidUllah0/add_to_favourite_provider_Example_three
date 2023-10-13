import 'package:flutter/material.dart';

class AddFavouriteWithoutProvider extends StatefulWidget {
  const AddFavouriteWithoutProvider({super.key});

  @override
  State<AddFavouriteWithoutProvider> createState() =>
      _AddFavouriteWithoutProviderState();
}

class _AddFavouriteWithoutProviderState
    extends State<AddFavouriteWithoutProvider> {
  List<int> _selectedItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add To Favourite ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    _selectedItem.add(index);
                    setState(() {});
                  },
                  title: Text('Item $index'.toString()),
                  trailing: Icon(_selectedItem.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_outline),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
