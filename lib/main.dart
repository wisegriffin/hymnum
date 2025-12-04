import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hymnum/core/application/services/music_service.dart';
import 'package:hymnum/core/application/services/repertoire_service.dart';
import 'package:hymnum/shared/data/local_db.dart';
import 'package:hymnum/features/musics/data/repos/music_repo.dart';
import 'package:hymnum/presentation/music/viewmodels/music_viewmodel.dart';
import 'package:hymnum/features/repertory/domain/repertory_music_service.dart';
import 'package:hymnum/presentation/repertoire/viewmodels/repertoire_viewmodel.dart';

import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Database localDB = await LocalDB.instance.database;

  //! Turning obsolete in Android 16, adaptable apps are the standard. 
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      MultiProvider(
        providers: [
          // REPERTORIES
          ChangeNotifierProvider(
            create: (context) => RepertoireViewmodel(RepertoireService()),
          ),
          Provider(create: (context) => RepertoryMusicService(localDB)),
          Provider(create: (context) => MusicRepo(localDB)),
          ChangeNotifierProxyProvider<MusicService, MusicViewmodel>(
            create: (context) => MusicViewmodel(context.read<MusicService>()),
            update: (context, value, previous) =>
                previous ?? MusicViewmodel(value),
          ),
        ],
        child: App(),
      ),
    );
  });
}
