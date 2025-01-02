import 'package:flutter/material.dart';
import 'package:quotable/app/app.bottomsheets.dart';
import 'package:quotable/app/app.locator.dart';
import 'package:quotable/ui/components/layout/app_bar.dart';
import 'package:quotable/ui/components/layout/scaffold_with_blur_overlay.dart';
import 'package:quotable/ui/views/quote_of_the_day/quote_of_the_day_card.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'quote_of_the_day_viewmodel.dart';

class QuoteOfTheDayView extends StatelessWidget {
  final _bottomSheetService = locator<BottomSheetService>();
  final _blurNotifier = ValueNotifier<bool>(false);

  QuoteOfTheDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuoteOfTheDayViewModel>.nonReactive(
      builder: (context, viewModel, child) {
        return LayoutWithBlurOverlay(
          blurNotifier: _blurNotifier,
          scaffold: Scaffold(
            appBar: CustomAppBar(
              title: GestureDetector(
                onTap: () async {
                  _blurNotifier.value = true;

                  await _bottomSheetService.showCustomSheet(
                    variant: BottomSheetType.quotesList,
                    title: 'Saved quotes',
                    isScrollControlled: true,
                    barrierColor: Colors.black.withAlpha(128),
                    useRootNavigator: true,
                  );

                  _blurNotifier.value = false;
                },
                child: const Text('Quote of the Day'),
              ),
              centerTitle: true,
            ),
            backgroundColor: ColorScheme.of(context).surface,
            body: RefreshIndicator(
                child: const CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: QuoteOfTheDayCard(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: () async => _onRefresh(viewModel)),
          ),
        );
      },
      viewModelBuilder: () => QuoteOfTheDayViewModel(),
    );
  }

  void _onRefresh(QuoteOfTheDayViewModel viewModel) async {
    await viewModel.refresh();
  }
}
