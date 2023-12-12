import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_try/model/post_model.dart';
import 'package:mvvm_try/view_model/post_view_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel> postList = [];
  PostViewModel postViewModel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 150,
            child: FutureBuilder(
                future: postViewModel.fetchPostModel(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        size: 40,
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.body!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Text(
                                snapshot.data!.title.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
