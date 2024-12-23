import 'package:flutter/material.dart';
import 'package:quotable/models/quote.model.dart';
import 'package:quotable/ui/components/quote_card.component.dart';
import 'package:quotable/ui/views/quote_of_the_day/quote_of_the_day_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class QuoteOfTheDayCard extends StackedHookView<QuoteOfTheDayViewModel> {
  const QuoteOfTheDayCard({Key? key}) : super(key: key, reactive: true);

  @override
  Widget builder(
    BuildContext context,
    QuoteOfTheDayViewModel model,
  ) {
    final quote = model.quote ?? QuoteOfTheDay.placeholder();

    return Skeletonizer(
      enabled: model.busy(quote),
      enableSwitchAnimation: true,
      child: QuoteCard(
        quote: quote.quote,
        isFavorite: quote.isSaved,
        onPressed: () => model.toggleFavorite(),
      ),
    );
  }
}
