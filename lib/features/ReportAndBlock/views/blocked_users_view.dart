// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/gen/assets.gen.dart';
import 'package:atma_paylas_app/repositories/block_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class BlockedUsersView extends StatelessWidget {
  const BlockedUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Engellenen Kullanıcılar'),
      ),
      body: ListenableBuilder(
        listenable: GetIt.instance<BlockRepository>(),
        builder: (context, widget) {
          return FutureBuilder(
            future: GetIt.instance<BlockRepository>().blockedUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator.adaptive();
              }

              if (snapshot.data?.isEmpty ?? true) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.people_alt_outlined,
                        size: 100,
                        color: Color(AppColors.primaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          'Engellenen Kullanıcı Bulunamadı.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: snapshot.data?[index].profileImage == null
                            ? AssetImage(Assets.images.persondemo.path) as ImageProvider
                            : NetworkImage(snapshot.data![index].profileImage!),
                      ),
                      title: Text(snapshot.data![index].username),
                      subtitle: Text(snapshot.data![index].userLocatedCity),
                      trailing: IconButton(
                        onPressed: () async {
                          await GetIt.instance<BlockRepository>()
                              .removeBlockUser(snapshot.data![index].id)
                              .then((value) {
                            value.fold(
                              (l) => EasyLoading.showToast,
                              (r) => EasyLoading.showToast,
                            );
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
