import 'package:flutter/material.dart';
import 'package:mvvm_try/model/book_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  BookModel bookModel = BookModel();
  Work work = Work();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book'),
      ),
      body: ListView(
        children: [
          ListView.builder(itemBuilder: (context, index) {})
        ],
      ),
    );
  }
}
