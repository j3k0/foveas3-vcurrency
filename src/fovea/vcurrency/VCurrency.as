package fovea.vcurrency {

    // A type of virtual currency
    public class VCurrency {

        private var _code:VCurrencyCode;
        private var _localizableTitle:String;

        public function VCurrency(code:VCurrencyCode, localizableTitle:String) {
            _code = code;
            _localizableTitle = localizableTitle;
        }

        public function get code():VCurrencyCode {
            return _code;
        }

        public function get localizableTitle():String {
            return _localizableTitle;
        }
    }
}
// vim: ts=4:sw=4:et:
