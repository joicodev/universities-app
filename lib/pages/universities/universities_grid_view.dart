import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universities_app/extensions/context_extensions.dart';
import 'package:universities_app/models/app_model.dart';
import 'package:universities_app/routes/route_list.dart';
import 'package:universities_app/utils/styles.dart';
import 'package:universities_app/widgets/common_widgets.dart';

class UniversitiesGridView extends StatefulWidget {
  const UniversitiesGridView({Key? key}) : super(key: key);

  @override
  State<UniversitiesGridView> createState() => _UniversitiesGridViewState();
}

class _UniversitiesGridViewState extends State<UniversitiesGridView> {
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

        return GridView.builder(
          controller: _controller,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                context.orientation == Orientation.landscape ? 4 : 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final university = items[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                child: Stack(
                  children: [
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: CommonWidgets.avatarUniversity(
                        context,
                        university.image,
                      ),
                    ),
                    Center(
                      child: Text(
                        university.name,
                        textAlign: TextAlign.center,
                        style: AppStyles.textStyleCustom(
                          context,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
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
