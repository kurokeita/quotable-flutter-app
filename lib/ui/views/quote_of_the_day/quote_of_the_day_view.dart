import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:quotable/ui/components/layout/app_bar.dart';
import 'package:quotable/ui/views/quote_of_the_day/quote_of_the_day_card.dart';

import 'quote_of_the_day_viewmodel.dart';

class QuoteOfTheDayView extends StatelessWidget {
  const QuoteOfTheDayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuoteOfTheDayViewModel>.nonReactive(
      builder: (context, viewModel, child) {
        return Scaffold(
            appBar: const CustomAppBar(
              title: Text('Quote of the Day'),
              centerTitle: true,
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: RefreshIndicator(
                child: const CustomScrollView(slivers: [
                  SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(children: <Widget>[
                        Expanded(child: Center(child: QuoteOfTheDayCard()))
                      ]))
                ]),
                onRefresh: () async => _onRefresh(viewModel)));
      },
      viewModelBuilder: () => QuoteOfTheDayViewModel(),
    );
  }

  void _onRefresh(QuoteOfTheDayViewModel viewModel) async {
    await viewModel.refresh();
  }
}
