import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_with_api/model/news_model.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;
  var baseUrl = "https://newsapi.org";
///TO PROCESS API AND GET RESPONSE

  fetchData() async {
    isLoading = true;
    final url = "$baseUrl/v2/top-headlines?country=in&apiKey=49fe83b5cf85471f8bd4d35ff3f208a5";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);

    Map<String, dynamic> decodedData = {}; // map for storing response body
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  // Function to launch a URL
  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1,mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1,mode: LaunchMode.inAppWebView);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
    notifyListeners();
  }
 ///to share news
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }
}
