import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/core/user_details/cubit/cubit/user_details_cubit.dart';
import 'package:newseniiorcompaniion/features/profile/cubit/profile_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newseniiorcompaniion/features/settings/cubit/settings_cubit.dart';

class ProfilePictureWidget extends StatelessWidget {
  ProfilePictureWidget({super.key, required this.profilePicUrl});
  final String profilePicUrl;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.profilePicUrl != current.profilePicUrl,
      builder: (contextP, stateP) {
        return Center(
          child: BlocBuilder<AppBloc, AppState>(
            builder: (contextA, stateA) {
              return Stack(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: stateA.user.role == "CR"
                        ? mainOrange.withOpacity(0.3)
                        : mainBlue.withOpacity(0.3),
                    child: profilePicUrl != ""
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              profilePicUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.person,
                              color: Colors.grey[800],
                              size: 70.0,
                            ),
                          ),
                  ),
                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc) {
                              return SafeArea(
                                child: Container(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading:
                                              const Icon(Icons.photo_library),
                                          title: const Text('Gallery'),
                                          onTap: () async {
                                            final pickedFile =
                                                await _picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (pickedFile != null) {
                                              contextP
                                                  .read<SettingsCubit>()
                                                  .profilePictureUpload(
                                                      File(pickedFile.path));
                                            }

                                            Navigator.of(context).pop();
                                          }),
                                      ListTile(
                                        leading: const Icon(Icons.photo_camera),
                                        title: const Text('Camera'),
                                        onTap: () async {
                                          final pickedFile =
                                              await _picker.pickImage(
                                                  source: ImageSource.camera);
                                          if (pickedFile != null) {
                                            contextP
                                                .read<SettingsCubit>()
                                                .profilePictureUpload(
                                                    File(pickedFile.path));
                                          }

                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: stateA.user.role == "CR" ? mainOrange : mainBlue,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
