import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_with_api/controller/category_controller.dart';
import 'package:news_app_with_api/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class CAtegoryScreen extends StatelessWidget {

  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Consumer<CategoryController>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: provider.categoryList.length,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleTextStyle: const TextStyle(
                  color: Color(0xff6A3DE8),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              title: const Text("Categories"),
              bottom: TabBar(
                labelStyle: const TextStyle(
                    color: Color(0xff6A3DE8),
                    fontWeight: FontWeight.w600),
                labelColor: Colors.white,
                unselectedLabelColor: const Color(0xff6A3DE8),
                indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 5),
                unselectedLabelStyle: const TextStyle(
                    color: Color(0xff6A3DE8),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                overlayColor:  const MaterialStatePropertyAll(
                    Colors.white),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    color: const Color(0xff6A3DE8),
                    borderRadius: BorderRadius.circular(10)),
                isScrollable: true,
                tabs: List.generate(provider.categoryList.length,
                      (index) => Tab(
                    text: provider.categoryList[index],
                  ),
                ),
                onTap: (value) {
                  provider.onTap(index: value);
                },
              ),
            ),
            body: provider.isLoading == true ? Center(
                child: LottieBuilder.asset(
                  "assets/animations/Animation - 1702395258490 (2).json",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ))
                : Padding(padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                    title: provider.newsModel.articles?[index].title.toString()
                        ?? "",
                    description: provider.newsModel.articles?[index].description
                        .toString() ?? "",
                    date: provider.newsModel.articles?[index].publishedAt,
                    imageUrl: provider.newsModel.articles?[index].urlToImage
                        .toString() ?? "",
                    contant: provider.newsModel.articles?[index].content
                        .toString() ?? "",
                    sourceName: provider.newsModel.articles?[index].source?.name
                        .toString() ??
                        "",
                    url: provider.newsModel.articles?[index].url
                        .toString() ??
                        "",
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    height: 20,
                  ),
                  itemCount: provider.newsModel.articles?.length ?? 0),
            ),
          ),
        );
      },
    );
  }
}
