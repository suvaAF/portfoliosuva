import 'dart:convert';

import 'package:portfoliosuva/config/constants.dart';
import 'package:portfoliosuva/models/blog_model.dart';


class ApiProvider{
 
  Future<List<Blog>> getBlogs() async {
    var http;
    final response = await http.get(Constants.BLOG_API);
    if(response.statusCode==200){
      List blogs = json.decode(utf8.decode(response.bodyBytes))['response'];
      final results= blogs.map((blog)=>Blog.fromJson(blog)).toList();
      return results;
    }else{
      return null;
    }
  }
}