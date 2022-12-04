import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universities_app/models/app_model.dart';
import 'package:universities_app/routes/route_list.dart';
import 'package:universities_app/widgets/common_widgets.dart';

class UniversitiesListView extends StatefulWidget {
  const UniversitiesListView({Key? key}) : super(key: key);

  @override
  State<UniversitiesListView> createState() => _UniversitiesListViewState();
}

class _UniversitiesListViewState extends State<UniversitiesListView> {
  final _controller = ScrollController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        print("PAGINATE!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (_, appModel, __) {
        final items = appModel.universitiesList;
        if (appModel.searchingUniversities) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return ListView.builder(
          controller: _controller,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final university = items[index];
            return Card(
              child: ListTile(
                minLeadingWidth: 0,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CommonWidgets.avatarUniversity(
                      context,
                      university.image,
                    ),
                  ),
                ),
                title: Text(university.name),
                onTap: () => Navigator.of(context).pushNamed(
                  RouteList.universityDetail,
                  arguments: university,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
