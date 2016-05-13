package fovea.vcurrency {

    // Code for a virtual currency
    public class VCurrencyCode {
        private var _code:String;
        public function VCurrencyCode(code:String) {
            _code = code;
        }
        public function get code():String {
            return _code;
        }
        public function equals(other:VCurrencyCode):Boolean {
            return code == other.code;
        }
    }
}
// vim: ts=4:sw=4:et:
