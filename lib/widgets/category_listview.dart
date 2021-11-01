import 'package:flutter/material.dart';

import 'widgets.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  final List<String> categories = [
    'All Products',
    'Popular',
    'Recent',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(
                () {
                  selectedCategoryIndex = index;
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategoryIndex
                    ? Colors.blueAccent
                    : Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: CustomText(
                    text: categories[index],
                    color: index == selectedCategoryIndex
                        ? Colors.white
                        : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
