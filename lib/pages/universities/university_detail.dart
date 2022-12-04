import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:universities_app/extensions/context_extensions.dart';
import 'package:universities_app/generated/l10n.dart';
import 'package:universities_app/models/app_model.dart';
import 'package:universities_app/models/entities/university.dart';
import 'package:universities_app/utils/styles.dart';
import 'package:universities_app/widgets/common_widgets.dart';
import 'package:universities_app/widgets/scaffold_base.dart';

class UniversityDetailPage extends StatefulWidget {
  final University university;

  const UniversityDetailPage(this.university, {Key? key}) : super(key: key);

  @override
  State<UniversityDetailPage> createState() => _UniversityDetailPageState();
}

class _UniversityDetailPageState extends State<UniversityDetailPage> {
  final TextEditingController _controller = TextEditingController();

  Widget _buttonUpdatePhoto() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
          onTap: () async {
            final image = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );

            if (image == null) return;
            File(image.path).readAsBytes().then((imageTemp) {
              widget.university.image = imageTemp;
              Provider.of<AppModel>(
                context,
                listen: false,
              ).updateUniversityPhoto(widget.university);
              setState(() {});
            });
          },
        ),
      ),
    );
  }

  Widget _inputQuantityStudents() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        maxLength: 3,
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primaryColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primaryColorLight,
              width: 1.0,
            ),
          ),
          hintText: S.of(context).studentsQuantityLabel,
        ),
      ),
    );
  }

  @override
  void initState() {
    _controller.text = '${widget.university.students}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      canPop: true,
      bodyIntoContainer: false,
      minimum: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                CommonWidgets.avatarUniversity(
                  context,
                  widget.university.image,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    right: 15,
                  ),
                  child: _buttonUpdatePhoto(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    widget.university.name,
                    style: AppStyles.textStyleCustom(
                      context,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.university.webPages[0],
                    style: AppStyles.textStyleCustom(
                      context,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, size: 20),
                      Text(
                        widget.university.country,
                        style: AppStyles.textStyleCustom(
                          context,
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  _inputQuantityStudents(),
                  CommonWidgets.textButton(
                    context,
                    ButtonArgs(
                      onPressed: () {
                        widget.university.students =
                            int.parse(_controller.text);
                        Provider.of<AppModel>(
                          context,
                          listen: false,
                        ).updateStudentsQuantity(widget.university);
                      },
                      nameButton: S.of(context).buttonUpdate,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
