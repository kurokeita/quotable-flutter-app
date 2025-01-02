import 'package:flutter/material.dart';
import 'package:quotable/ui/bottom_sheets/quotes_list/quotes_list_sheet_model.dart';
import 'package:quotable/ui/components/quotes/quote_tile.component.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QuotesListSheet extends StackedView<QuotesListSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  const QuotesListSheet(
      {super.key, required this.completer, required this.request});

  @override
  Widget builder(
      BuildContext context, QuotesListSheetModel viewModel, Widget? child) {
    final quotes = viewModel.quotes;
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      minChildSize: 0.25,
      maxChildSize: 0.9,
      snap: true,
      snapSizes: const [0.25, 0.5, 0.75, 0.9],
      builder: (context, scrollController) => Container(
        color: ColorScheme.of(context).surface,
        child: ListView.builder(
          controller: scrollController,
          itemCount: viewModel.quotes.length,
          itemBuilder: (context, index) {
            return QuoteTile(
                quote: quotes[index],
                isFavorite: true,
                onPressed: () async =>
                    await viewModel.deleteQuote(quotes[index]));
          },
        ),
      ),
    );
  }

  @override
  QuotesListSheetModel viewModelBuilder(BuildContext context) =>
      QuotesListSheetModel();

  @override
  void onViewModelReady(QuotesListSheetModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchQuotes();
  }
}
