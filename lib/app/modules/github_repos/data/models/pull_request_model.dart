import '../../domain/domain.dart';

class PullRequestModel {
  final int id;
  final String title;
  final String? body;

  PullRequestModel({
    required this.id,
    required this.title,
    this.body,
  });

  factory PullRequestModel.fromJson(Map<String, dynamic> json) =>
      PullRequestModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  PullRequestEntity toEntity() => PullRequestEntity(
        id: id,
        title: title,
        body: body,
      );
}
