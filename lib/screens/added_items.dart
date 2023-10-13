import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class AddedItems extends StatefulWidget {
  const AddedItems({super.key});

  @override
  State<AddedItems> createState() => _AddedItemsState();
}

class _AddedItemsState extends State<AddedItems> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          'Added Items ',
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
              itemCount: provider.selectedItem.length,
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
