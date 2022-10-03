class PullRequestEntity {
  final int id;
  final String title;
  final String? body;

  PullRequestEntity({
    required this.id,
    required this.title,
    this.body,
  });
}
