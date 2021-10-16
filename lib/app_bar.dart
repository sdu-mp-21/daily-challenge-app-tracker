import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GeneralAppBar extends StatelessWidget with PreferredSizeWidget {
  const GeneralAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange.shade300,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        tooltip: 'Show the Menu',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is should display the Menu')));
        },
      ),
      actions: [
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('This is should display the account info')));
            },
            icon: const Icon(Icons.account_circle))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
