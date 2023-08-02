
import '../constants/iso_codes.dart';

class CountryISOCodes {
  CountryISOCodes._internal();

  static final _instance = CountryISOCodes._internal();

  factory CountryISOCodes() => _instance;

  final Map<String, String> _isoCodes = isoCodes;

  String getIsoCodeFromCountryName(String? countryName) {
    return _isoCodes[countryName] ?? "US";
  }
}