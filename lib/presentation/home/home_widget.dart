import 'package:flutter/material.dart';
import 'package:ma_ngang/domain/category/category_repository.dart';
import 'package:ma_ngang/model/category.dart';
import 'package:ma_ngang/presentation/chapter/chapter_widget.dart';
import 'package:ma_ngang/utils/navigator_util.dart';

class HomeStatefulWidget extends StatefulWidget {
  HomeStatefulWidget({Key key, this.title}) : super(key: key);

  String title;

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeStatefulWidget> {

  CategoryRepository mCategoryRepository;

  _HomeState() {
    mCategoryRepository = CategoryRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Category>>(
        future: mCategoryRepository.getCategory(DefaultAssetBundle.of(context)),
        builder: (context, result) {
          if (result.hasError) print(result.error);
          return result.hasData
              ? CategoryList(category: result.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


class CategoryList extends StatelessWidget {
  final List<Category> category;

  CategoryList({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      primary: false,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverGrid.count(
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: List.generate(category.length, (index) {
              return Center(
                child:GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterStatefulWidget(
                            title: category[index].name,
                            jsonPath: category[index].json,
                          ),
                        ),
                      );
                    },
                    child:
                    Card(child: Image.network(category[index].cover))
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
