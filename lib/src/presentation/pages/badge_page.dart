import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/data/models/badge_model.dart';

import '../../utils/helper/secure_storage/secure_storage.dart';
import '../blocs/badge/badge_bloc.dart';

class BadgePage extends StatefulWidget {
  const BadgePage({super.key});

  @override
  State<BadgePage> createState() => _BadgePageState();
}

class _BadgePageState extends State<BadgePage> {
  @override
  void initState() {
    Future.microtask(() => BlocProvider.of<GetBadgeBloc>(context)
        .add(const BadgeEvent.getBadge()));
    super.initState();
  }

  Future<String> getBadgeImage(BadgeModel badge) {
    final StorageHelper storage = StorageHelper();
    return storage.read('token').then((value) {
      return "${badge.badgeurl}?token=$value";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lencana'),
      ),
      body: BlocBuilder<GetBadgeBloc, BadgeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (badge) {
              badge as List<BadgeModel>;
              if (badge.isEmpty) {
                return const Center(
                  child: Text('Belum ada lencana'),
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: badge.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                onTap: () {},
                                leading: FutureBuilder(
                                  future: getBadgeImage(badge[index]),
                                  builder: (context, snapshot) {
                                    return snapshot.hasData
                                        ? Image.network(
                                            snapshot.data.toString(),
                                          )
                                        : const Icon(Icons.error);
                                  },
                                ),
                                title: Text(badge[index].name ?? ""),
                                subtitle: Text(badge[index].description ?? ""),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            orElse: () {
              return const Center(
                child: Text('Gagal memuat lencana'),
              );
            },
          );
        },
      ),
    );
  }
}
