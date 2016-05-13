package fovea.vcurrency {

    public class VCurrencyOffer {

        private var _cost:String; // TODO, figure this out
        private var _value:VMoney;
        private var _localizableTitle:String;
        private var _localizableDescription:String;

        public function VCurrencyOffer(cost:String, value:VMoney, localizableTitle:String, localizableDescription:String) {
            _cost = cost;
            _value = value;
            _localizableTitle = localizableTitle;
            _localizableDescription = localizableDescription;
        }

        public function get value():VMoney {
            return _value;
        }

        public function get cost():String { // TODO
            return _cost;
        }

        public function get localizableTitle():String {
            return _localizableTitle;
        }
        public function get localizableDescription():String {
            return _localizableDescription;
        }
    }
}
// vim: ts=4:sw=4:et:
