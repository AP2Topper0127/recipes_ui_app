import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vikings/menu/food_menu_data.dart';
import 'package:flutter_vikings/menu/views/widgets/menu_list_item.dart';
import 'package:flutter_vikings/menu/views/widgets/menu_list_item_wrapper.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({Key? key}) : super(key: key);

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  final scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);

  @override
  Widget build(BuildContext context) {
    print('rebuilt!');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desserts'),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (UserScrollNotification notification) {
          if (notification.direction == ScrollDirection.forward) {
            scrollDirectionNotifier.value = ScrollDirection.forward;
          } else if (notification.direction == ScrollDirection.reverse) {
            scrollDirectionNotifier.value = ScrollDirection.reverse;
          }
          return true;
        },
        child: ListView.separated(
          padding: EdgeInsets.only(
            left: 17,
            right: 17,
            top: 20,
            bottom: MediaQuery.of(context).padding.bottom + 20,
          ),
          itemCount: FoodMenuData.dessertMenu.length,
          cacheExtent: 0,
          separatorBuilder: (context, i) => const SizedBox(height: 20),
          itemBuilder: (context, i) {
            return ValueListenableBuilder(
              valueListenable: scrollDirectionNotifier,
              child: MenuListItem(FoodMenuData.dessertMenu[i]),
              builder: (context, ScrollDirection scrollDirection, child) {
                return MenuListItemWrapper(
                  scrollDirection: scrollDirection,
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
