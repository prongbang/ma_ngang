import 'package:flutter/material.dart';
import 'package:ma_ngang/domain/chapter/chapter_repository.dart';
import 'package:ma_ngang/model/chapter.dart';

class ChapterStatefulWidget extends StatefulWidget {
  ChapterStatefulWidget({Key key, this.title, this.jsonPath}) : super(key: key);

  final String title;
  final String jsonPath;

  @override
  State<StatefulWidget> createState() => ChapterState();
}

class ChapterState extends State<ChapterStatefulWidget> {
  ChapterRepository mChapterRepository;

  ChapterState() {
    mChapterRepository = ChapterRepository();
  }

  @override
  Widget build(BuildContext context) {
    print(mChapterRepository.getChapterByPath(
        DefaultAssetBundle.of(context), widget.jsonPath));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Chapter>>(
        future: mChapterRepository.getChapterByPath(
            DefaultAssetBundle.of(context), widget.jsonPath),
        builder: (context, result) {
          if (result.hasError) print(result.error);
          return result.hasData
              ? ChapterList(chapter: result.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ChapterList extends StatelessWidget {
  final List<Chapter> chapter;

  ChapterList({Key key, this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      primary: false,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: new SliverGrid.count(
            crossAxisSpacing: 5.0,
            crossAxisCount: 2,
            children: List.generate(chapter.length, (index) {
              return Center(
                child: GestureDetector(
                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => ChapterStatefulWidget(
//                            title: chapter[index].name,
//                            jsonPath: chapter[index].json,
//                          ),
//                        ),
//                      );
                    },
                    child: Card(child: Column(
                      children: <Widget>[
                        Image.network(chapter[index].pages[0].thumbUrl,
                            fit: BoxFit.contain),
                        Text(chapter[index].chapter)
                      ],
                    ),)
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
