import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di.dart';
import '../../github_repos.dart';
import 'widgets/item_pull_request_widget.dart';
import 'widgets/widgets.dart';

class PullRequestsScreen extends StatefulWidget {
  const PullRequestsScreen({super.key});

  @override
  State<PullRequestsScreen> createState() => _PullRequestsScreenState();
}

class _PullRequestsScreenState extends State<PullRequestsScreen> {
  final _controller = Locator.get<GithubFeaturesController>();

  @override
  void initState() {
    super.initState();
    _controller.pullRequestCubit.getOpenedPullRequests();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _controller.backToRepos(context),
          ),
          title: Text(
            _controller.pullRequestCubit.repo!.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: BlocBuilder<PullRequestCubit, PullRequestState>(
          bloc: _controller.pullRequestCubit,
          builder: (context, state) => Column(
            children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 8),
                color: Theme.of(context).colorScheme.onSecondary.withAlpha(100),
                child: Row(
                  children: [
                    TextButtonWidget(
                      onPressed: () => _controller.pullRequestCubit
                          .setPullRequestType(PullRequestType.opened),
                      text: '${state.pullsOpened.length} opened',
                      color: state.pullType == PullRequestType.opened
                          ? Theme.of(context).colorScheme.surface
                          : Theme.of(context).colorScheme.tertiary,
                    ),
                    const Text(
                      '/',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButtonWidget(
                      onPressed: () => _controller.pullRequestCubit
                          .setPullRequestType(PullRequestType.closed),
                      text: '${state.pullsClosed.length} closed',
                      color: state.pullType == PullRequestType.closed
                          ? Theme.of(context).colorScheme.surface
                          : Theme.of(context).colorScheme.tertiary,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Builder(
                  builder: (context) {
                    if (state is PullRequestCompleted) {
                      return ListView.separated(
                        padding: const EdgeInsets.only(top: 24),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ItemPullRequestWidget(
                          pull: state.pullType == PullRequestType.opened
                              ? state.pullsOpened[index]
                              : state.closed[index],
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                          height: 1,
                          indent: 16,
                        ),
                        itemCount: state.pullType == PullRequestType.opened
                            ? state.pullsOpened.length
                            : state.pullsClosed.length,
                      );
                    } else if (state is PullRequestLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Center(
                      child: Text('Não foi possível carregar os dados'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
