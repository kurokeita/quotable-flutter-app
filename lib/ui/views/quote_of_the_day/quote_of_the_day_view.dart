import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/views/quote_of_the_day/quote_of_the_day_card.dart';

import 'quote_of_the_day_viewmodel.dart';

class QuoteOfTheDayView extends StatelessWidget {
  const QuoteOfTheDayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuoteOfTheDayViewModel>.nonReactive(
      builder: (context, viewModel, child) {
        viewModel.fetchQuote();
        return Scaffold(
            appBar: AppBar(
              title: const Text('Quote of the Day'),
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
