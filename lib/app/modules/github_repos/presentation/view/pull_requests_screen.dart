import 'package:flutter/material.dart';

import '../../../../di/di.dart';
import '../../github_repos.dart';

class PullRequestsScreen extends StatefulWidget {
  const PullRequestsScreen({super.key});

  @override
  State<PullRequestsScreen> createState() => _PullRequestsScreenState();
}

class _PullRequestsScreenState extends State<PullRequestsScreen> {
  final _controller = Locator.get<GithubReposController>();

  @override
  void initState() {
    super.initState();
    _controller.pullRequestCubit.getPullRequestsFromApi();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _controller.backToPulls(context),
          ),
          title: Text(
            _controller.pullRequestCubit.repo!.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).colorScheme.onSecondary.withAlpha(160),
            )
          ],
        ),
      );
}
