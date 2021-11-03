import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tasky/data_layer/model/categories.dart';
import 'package:tasky/data_layer/web_service/category_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Categories> categories = [];

  @override
  void initState() {
    super.initState();
    CategoryApi().getCategories().then((value) => categories.addAll(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: CategoryApi().getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, i) =>
                    Column(
                      children: [
                        Text(
                          categories[i].name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 160.0,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                Container(
                                  width: 120.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: categories[i].subCategories[index].image,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    placeholder: (context , url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url ,error) => const Icon(Icons.error),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              width: 5.0,
                            ),
                            itemCount: categories[i].subCategories.length,
                          ),
                        )
                      ],
                    ),
                separatorBuilder: (_, index) =>
                const SizedBox(
                  height: 20.0,
                ),
                itemCount: categories.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
