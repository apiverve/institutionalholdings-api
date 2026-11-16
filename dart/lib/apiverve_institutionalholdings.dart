/// Institutional Holdings API client for Dart/Flutter
///
/// Institutional Holdings returns SEC Form 13F holdings: every position a fund manager reported for a quarter, with shares, value, portfolio weight, put/call, discretion and voting authority, plus the quarter-over-quarter change on every position. Look up a manager by CIK or name, or reverse it and list every institution holding a ticker or CUSIP.
///
/// For more information, visit: https://apiverve.com/marketplace/institutionalholdings?utm_source=dart&utm_medium=referral&utm_content=readme
library apiverve_institutionalholdings;

export 'src/client.dart';
export 'src/models.dart';
