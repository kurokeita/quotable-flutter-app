import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.bottomsheets.dart';
import 'package:stacked_app/app/app.dialogs.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/models/quote.model.dart';
import 'package:stacked_app/services/api_service.dart';
import 'package:stacked_app/services/database_service.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

class QuoteListViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dbService = locator<DatabaseService>();

  final List<Quote> _quotes = [];

  List<Quote> get quotes => _quotes;

  Future<void> fetchQuotes() async {
    _dbService.listTables();
    final newQuotes = await _apiService.fetchQuotes();

    for (var q in newQuotes) {
      if (!_quotes.contains(q)) {
        _quotes.add(q);
      }
    }

    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Number of quotes: ${_quotes.length}',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
