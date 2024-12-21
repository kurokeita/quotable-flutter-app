import 'package:flutter/material.dart';
import 'package:quotable/ui/components/quote_card.component.dart';
import 'package:quotable/ui/views/quote_of_the_day/quote_of_the_day_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class QuoteOfTheDayCard extends StackedHookView<QuoteOfTheDayViewModel> {
  const QuoteOfTheDayCard({Key? key}) : super(key: key, reactive: true);

  @override
  Widget builder(
    BuildContext context,
    QuoteOfTheDayViewModel model,
  ) {
    final quote = model.quote;

    return quote == null || model.busy(model.quote)
        ? const CircularProgressIndicator()
        : QuoteCard(
            quote: quote,
            isFavorite: model.isFavorite,
            onPressed: () => model.toggleFavorite(),
          );
  }
}
