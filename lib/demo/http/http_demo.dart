import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpDemo  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*fetchPosts()
      .then((value) => print(value));//value: fetchPosts的返回值*/

    /*final post = {
      'title': 'hello',
      'description': 'nice to meet you.'
    };
    print(post['title']);
    print(post['description']);

    final postJson = json.encode(post);//使用import 'dart:convert';将map转换成json
    print(postJson);

    final postJsonConverted = json.decode(postJson);//将json转换成map
    print(postJsonConverted['title']);
    print(postJsonConverted['description']);
    print(postJsonConverted is Map);

    final postModel = Post.fromJson(postJsonConverted);
    print('title: ${postModel.title}, description: ${postModel.description}');
    
    print('${json.encode(postModel)}');//encode方法自动调用Post的toJson方法*/
  }

  Future<List<Post>> fetchPosts() async{
    //var url = 'https://example.com/whatsit/create';
    var url = 'https://resources.ninghao.net/demo/posts.json';
    //var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    var response = await http.get(url);

    //print('Response status: ${response.statusCode}');//response.statusCode :相应状态码
    //print('Response body: ${response.body}');

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);

      List<Post> posts = responseBody['posts']
      .map<Post>((item) => Post.fromJson(item))
      .toList();

      return posts;
    }else{
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      //snapshot里会有future的数据
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //data: null 代表还没有数据, 此时connectionState: ConnectionState.waiting 表示等待
        //data中有数据后，connectionState: ConnectionState.done 表示完成
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');

        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }

        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(//leading :头部
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
      this.id,
      this.title,
      this.description,
      this.author,
      this.imageUrl
      );

  //将一个map数据转换成post数据
  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  //返回map对象
  Map toJson() => {
    'title' : title,
    'description' : description,
  };
}
