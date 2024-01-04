// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/city_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class ProfileEditView extends StatefulHookConsumerWidget {
  const ProfileEditView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends ConsumerState<ProfileEditView> {
  @override
  Widget build(BuildContext context) {
    var cities = <String>[]; // Şehir listesi
    var districts = <String>[]; // İlçe listesi
    final nameController = useTextEditingController();
    final surnameController = useTextEditingController();
    final usernameController = useTextEditingController();
    final images = useState<File?>(null);
    final selectedCity = useState<String?>(null);
    final selectedDistrict = useState<String?>(null);
    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          images.value = File(pickedFile.path);
        });
      }
    }

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: CustomFilledButton(
            text: 'Uygula ve Devam Et',
            onTap: () async {
              if (images.value != null) {
                await GetIt.instance<UserRepository>()
                    .editUserProfile(
                      usernameController.value.text.isEmpty ? null : usernameController.value.text,
                      nameController.value.text.isEmpty ? null : nameController.value.text,
                      surnameController.value.text.isEmpty ? null : surnameController.value.text,
                      selectedCity.value,
                      selectedDistrict.value,
                    )
                    .then((value) async => GetIt.instance<UserRepository>().editUserProfilePhoto(images.value));
              } else {
                await GetIt.instance<UserRepository>().editUserProfile(
                  usernameController.value.text.isEmpty ? null : usernameController.value.text,
                  nameController.value.text.isEmpty ? null : nameController.value.text,
                  surnameController.value.text.isEmpty ? null : surnameController.value.text,
                  selectedCity.value,
                  selectedDistrict.value,
                );
              }
              await UserRepository().getMyUserProfile().then((value) {
                value.fold(
                  (l) {
                    Log.error(l);
                    GetIt.instance<UserRepository>().user = null;
                  },
                  (r) {
                    Log.success(r.runtimeType);
                    GetIt.instance<UserRepository>().user = r;
                  },
                );
              }).then((value) async {
                await GetIt.instance<FeedRepository>().clearFreeListingFeeds();
                await GetIt.instance<FeedRepository>().clearMostViewedFeeds();
                await GetIt.instance<FeedRepository>().clearTradableListingFeeds();

                AutoRouter.of(context).back();
              });
            },
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Profil Düzenle',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w, bottom: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 80.r,
                      width: 80.r,
                      child: Bounceable(
                        onTap: pickImage,
                        child: images.value == null
                            ? CircleAvatar(
                                backgroundColor: Color(AppColors.primaryLightColor),
                                backgroundImage: GetIt.instance<UserRepository>().user?.image != null
                                    ? NetworkImage(GetIt.instance<UserRepository>().user?.image ?? 'impossible')
                                    : null,
                                child: GetIt.instance<UserRepository>().user?.image != null
                                    ? null
                                    : const Icon(Icons.person, color: Color(AppColors.primaryColor)),
                              )
                            : CircleAvatar(
                                backgroundColor: Color(AppColors.primaryLightColor),
                                backgroundImage: FileImage(images.value!),
                                child: GetIt.instance<UserRepository>().user?.image != null
                                    ? null
                                    : const Icon(Icons.person, color: Color(AppColors.primaryColor)),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    'Fotoğrafı Düzenle',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(AppColors.primaryColor),
                      fontFamily: 'Rubik',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              ProfileTextfield(
                controller: nameController,
                text: 'Ad',
                hintText: GetIt.instance<UserRepository>().user?.name ?? '',
              ),
              SizedBox(
                height: 24.h,
              ),
              ProfileTextfield(
                controller: surnameController,
                text: 'Soyad',
                hintText: GetIt.instance<UserRepository>().user?.surname ?? '',
              ),
              SizedBox(
                height: 24.h,
              ),
              ProfileTextfield(
                controller: usernameController,
                text: 'Kullanıcı Adı',
                hintText: GetIt.instance<UserRepository>().user?.username ?? '',
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'İl',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(AppColors.primaryTextColor),
                ),
              ),
              SizedBox(height: 10),
              FutureBuilder(
                future: GetIt.instance<CityRepository>().getCities(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Hata'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    snapshot.data!.fold((l) => null, (r) => cities = r);
                    return SizedBox(
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(AppColors.primaryTextColor),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        isExpanded: true,
                        hint: Text(GetIt.instance<UserRepository>().user?.userLocatedCity ?? 'Şehir Seçiniz'),
                        value: selectedCity.value,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCity.value = newValue!;
                            selectedDistrict.value = null;
                          });
                        },
                        items: cities.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Semt',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(AppColors.primaryTextColor),
                ),
              ),
              FutureBuilder(
                future: GetIt.instance<CityRepository>().getDistricts(selectedCity.value ?? 'İstanbul'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Hata'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    snapshot.data!.fold((l) => null, (r) => districts = r);
                    return SizedBox(
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(AppColors.primaryTextColor),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        isExpanded: true,
                        hint: Text(GetIt.instance<UserRepository>().user?.userLocatedDistrict ?? 'Semt Seçiniz'),
                        value: selectedDistrict.value,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDistrict.value = newValue!;
                          });
                        },
                        items: districts.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              SizedBox(
                height: 48.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextfield extends StatelessWidget {
  const ProfileTextfield({
    required this.text,
    required this.hintText,
    super.key,
    this.controller,
  });
  final String text;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(AppColors.primaryTextColor),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
