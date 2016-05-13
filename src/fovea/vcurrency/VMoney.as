package fovea.vcurrency {

    // An amount of virtual currency
    public class VMoney {
        private var _amount:Number;
        private var _code:VCurrencyCode;
        public function VMoney(amount:Number, code:VCurrencyCode) {
            _amount = amount;
            _code = code;
        }

        public function toJSON():Object {
            return {
                code: code.code,
                amount: amount
            };
        }

        public static function fromJSON(obj:Object):VMoney {
            return new VMoney(obj.amount, new VCurrencyCode(obj.code));
        }

        public function equals(other:VMoney):Boolean {
            return code.equals(other.code) && amount == other.amount;
        }

        public function get amount():Number { return _amount; }
        public function get code():VCurrencyCode { return _code; }
    }
}
// vim: ts=4:sw=4:et:
