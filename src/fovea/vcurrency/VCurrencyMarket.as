package fovea.vcurrency {
    public class VCurrencyMarket {

        private var _offers:Vector.<VCurrencyOffer>;

        public function VCurrencyMarket(offers:Vector.<VCurrencyOffer> = null) {
            _offers = offers || new Vector.<VCurrencyOffer>();
        }

        public function get offers():Vector.<VCurrencyOffer> {
            return _offers;
        }
    }
}
// vim: ts=4:sw=4:et:
