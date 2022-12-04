import 'package:flutter/material.dart';
import 'package:universities_app/extensions/context_extensions.dart';
import 'package:universities_app/generated/l10n.dart';
import 'package:universities_app/pages/universities/universities_grid_view.dart';
import 'package:universities_app/pages/universities/universities_list_view.dart';
import 'package:universities_app/widgets/scaffold_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isListView = true;

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.primaryColorDark,
      title: Text(S.of(context).universities, textAlign: TextAlign.start),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            child: isListView
                ? const Icon(Icons.grid_view_rounded)
                : const Icon(Icons.list),
            onTap: () => setState(() {
              isListView = !isListView;
            }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildAppBar(),
      bodyIntoContainer: false,
      minimum: EdgeInsets.zero,
      titleAppBar: Text(S.of(context).universities),
      child: isListView
          ? const UniversitiesListView()
          : const UniversitiesGridView(),
    );
  }
}
