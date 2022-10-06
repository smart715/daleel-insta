import 'package:injectable/injectable.dart';
import 'package:insta_daleel/commons/errors/exceptions.dart';
import 'package:insta_daleel/commons/network/network_info.dart';
import 'package:insta_daleel/data/datasources/remote_datasource.dart';
import 'package:insta_daleel/data/dtos/user_profile_dto.dart';
import 'package:insta_daleel/domain/entities/history_note.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';
import 'package:insta_daleel/domain/repositories/repository.dart';

@LazySingleton(as: Repository)
class RepositoryImpl extends Repository {
  final NetworkInfo networkInfo;
  RemoteDataSource remoteDataSource;
  RepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<UserProfile> signIn(String phone, String password) async {
    try {
      if (await networkInfo.isConnected) {
        final p = (await remoteDataSource.signIn(phone, password));
        return p.toDomain();
      } else {
        throw ServerException(errorMessage: "Check Internet Connectivity");
      }
    } catch (e) {
      throw ServerException(errorMessage: "Check Internet Connectivity");
    }
  }

  @override
  Future<UserProfile> updateProfile(UserProfile profile) async {
    try {
      if (await networkInfo.isConnected) {
        final p = (await remoteDataSource
            .updateProfile(UserProfileDto.fromDomain(profile)));
        return profile;
      } else {
        throw ServerException(errorMessage: "Check Internet Connectivity");
      }
    } catch (e) {
      throw ServerException(errorMessage: "Check Internet Connectivity");
    }
  }

  @override
  UserProfile getUserProfile() {
    try {
      final p = (remoteDataSource.getCachedProfile());
      if (p != null) {
        return p.toDomain();
      } else {
        throw ServerException(errorMessage: "Profile has not been cached");
      }
    } catch (e) {
      throw ServerException(errorMessage: "Check Internet Connectivity");
    }
  }

  @override
  Future<List<HistoryNote>> getHistory() async {
    try {
      final p = (remoteDataSource.getCachedProfile());
      if (p != null) {
        final historyList = (await remoteDataSource.getHistory(p.id))
            .map((e) => e.toDomain())
            .toList();
        return historyList;
      } else {
        throw ServerException(errorMessage: "Profile has not been cached");
      }
    } catch (e) {
      throw ServerException(errorMessage: "Check Internet Connectivity");
    }
  }
}
