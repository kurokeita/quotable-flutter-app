import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/components/quote_card.component.dart';

import 'quote_of_the_day_viewmodel.dart';

class QuoteOfTheDayView extends StackedView<QuoteOfTheDayViewModel> {
  const QuoteOfTheDayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QuoteOfTheDayViewModel viewModel,
    Widget? child,
  ) {
    final quote = viewModel.quote;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Quote of the Day'),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
            child: Center(
                child: viewModel.isBusy || quote == null
                    ? const CircularProgressIndicator()
                    : QuoteCard(
                        quote: quote,
                        isFavorite: viewModel.isFavorite,
                        onPressed: () => viewModel.toggleFavorite(),
                      ))));
  }

  @override
  QuoteOfTheDayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QuoteOfTheDayViewModel();

  @override
  void onViewModelReady(QuoteOfTheDayViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchQuote();
  }
}
