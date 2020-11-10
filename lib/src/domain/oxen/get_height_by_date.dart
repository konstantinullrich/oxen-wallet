import 'package:intl/intl.dart';

final dateFormat = DateFormat('yyyy-MM');
final dates = {
  '2018-06': 21165,
  '2018-07': 42676,
  '2018-08': 64919,
  '2018-09': 87176,
  '2018-10': 108688,
  '2018-11': 130936,
  '2018-12': 152453,
  '2019-01': 174681,
  '2019-02': 196907,
  '2019-03': 217018,
  '2019-04': 239354,
  '2019-05': 260947,
  '2019-06': 283215,
  '2019-07': 304759,
  '2019-08': 326680,
  '2019-09': 348927,
  '2019-10': 370534,
  '2019-11': 392808,
  '2019-12': 414271,
  '2020-01': 436563
};

int getHeightByDate({DateTime date}) {
  final raw = '${date.year}-${date.month}';
  var endHeight = dates[raw] ?? 0;
  var preLastYear = date.year;
  var preLastMonth = date.month - 1;

  if (endHeight <= 0) {
    endHeight = dates.values.toList()[dates.length - 1];
    final preLastDate =
        dateFormat.parse(dates.keys.elementAt(dates.keys.length - 2));
    preLastYear = preLastDate.year;
    preLastMonth = preLastDate.month;
  } else {
    preLastYear = date.year;
    preLastMonth = date.month - 1;
  }

  if (preLastMonth <= 0) {
    preLastMonth = 12;
    preLastYear -= 1;
  }

  final startRaw = '$preLastYear-$preLastMonth';
  final startHeight = dates[startRaw];
  final diff = endHeight - startHeight;
  final heightPerDay = diff / 30;
  final daysHeight = date.day * heightPerDay.round();
  final height = endHeight + daysHeight;

  return height;
}
