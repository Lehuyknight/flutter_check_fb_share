import 'package:flutter_train/app/data/provider/storage/storage_provider.dart';

class StorageRepository {
  StorageProvider storageProvider;
  StorageRepository({required this.storageProvider});

  bool isFirstTime() {
    return storageProvider.isFirstTime();
  }

  void beYourFirstTime() {
    storageProvider.firstTime();
  }
}
