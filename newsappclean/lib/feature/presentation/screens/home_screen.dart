import 'package:flutter/material.dart';
import 'package:newsappclean/feature/data/datasources/remote_datasource.dart';
import 'package:newsappclean/feature/data/models/articles_model.dart';
import 'package:newsappclean/feature/presentation/widgets/article_card.dart';
import 'package:newsappclean/feature/presentation/widgets/article_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<List<Articles>>(
          future: fetchApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return FirstItemWidget(article: snapshot.data![4]);
                  } else {
                    return ListItemWidget(article: snapshot.data![index]);
                  }
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 2,
                ),
                itemCount: snapshot.data!.length,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
