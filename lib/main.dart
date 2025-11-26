import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hymnum/core/data/local_db.dart';
import 'package:hymnum/features/musics/data/repos/music_repo.dart';
import 'package:hymnum/features/musics/presentation/viewmodels/music_viewmodel.dart';
import 'package:hymnum/features/repertory/data/repos/repertory_repo.dart';
import 'package:hymnum/features/repertory/domain/repertory_music_service.dart';
import 'package:hymnum/features/repertory/presentation/viewmodels/repertory_viewmodel.dart';

import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Database localDB = await LocalDB.instance.database;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      MultiProvider(
        providers: [
          // REPERTORIES
          ChangeNotifierProvider(
            create: (context) => RepertoryViewmodel(RepertoryRepo(localDB)),
          ),
          Provider(create: (context) => RepertoryMusicService(localDB)),
          Provider(create: (context) => MusicRepo(localDB)),
          ChangeNotifierProxyProvider<MusicRepo, MusicViewmodel>(
            create: (context) => MusicViewmodel(context.read<MusicRepo>()),
            update: (context, value, previous) =>
                previous ?? MusicViewmodel(value),
          ),
        ],
        child: App(),
      ),
    );
  });
}
