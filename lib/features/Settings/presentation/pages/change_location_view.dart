import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/city_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ChangeLocationView extends StatefulHookConsumerWidget {
  const ChangeLocationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangeLocationViewState();
}

class _ChangeLocationViewState extends ConsumerState<ChangeLocationView> {
  @override
  Widget build(BuildContext context) {
    List<String> cities = []; // Şehir listesi
    List<String> districts = []; // İlçe listesi
    final selectedCity = useState<String?>(null);
    final selectedDistrict = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Konum Değiştir',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black, fontFamily: 'Rubik'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yeni konumunuzu seçip devam edebilirsiniz',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: Color(AppColors.primaryTextColor)),
            ),
            SizedBox(
              height: 48.h,
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
                      items: districts.isNotEmpty
                          ? districts.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                          : [
                              DropdownMenuItem<String>(
                                value: 'Semt Seçiniz',
                                child: Text('Semt Seçiniz'),
                              )
                            ],
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
            CustomFilledButton(
                text: 'Uygula ve Devam Et',
                onTap: () {
                  GetIt.instance<UserRepository>()
                      .editUserProfile(null, null, null, selectedCity.value, selectedDistrict.value)
                      .then((value) {
                    value.fold((l) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l))),
                        (r) => context.router.pop());
                  });
                })
          ],
        ),
      ),
    );
  }
}
