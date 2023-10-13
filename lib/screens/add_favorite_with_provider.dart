import 'package:add_favourite_provider3/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'added_items.dart';

class AddFavouriteWithProvider extends StatefulWidget {
  const AddFavouriteWithProvider({super.key});

  @override
  State<AddFavouriteWithProvider> createState() =>
      _AddFavouriteWithProviderState();
}

class _AddFavouriteWithProviderState extends State<AddFavouriteWithProvider> {
  @override
  Widget build(BuildContext context) {
    //used without consumer
    //final provider = Provider.of<FavouriteProvider>(context, listen: false);
    print('build');
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
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddedItems(),
                ),
              );
            },
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }

                        //without consumer
                        //provider.addItem(value);
                      },
                      title: Text('Item $index'.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
