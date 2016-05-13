package fovea.vcurrency {

    public class VWallet {

        private var _money:Vector.<VMoney>;

        public function VWallet(v:Vector.<VMoney> = null) {
            _money = v || new Vector.<VMoney>();
        }

        public function get money():Vector.<VMoney> { return _money; }
        public function getMoneyIn(code:VCurrencyCode):VMoney {
            for (var i:int = 0; i <  _money.length; ++i)
                if (_money[i].code.equals(code))
                    return _money[i];
            return new VMoney(0, code);
        }

        /** Returns a new VWallet with more money in it.
         *
         * @param money a positive amount of money.
         */
        public function add(money:VMoney):VWallet {
            if (money.amount < 0) return null;
            return _add(money);
        }

        /** Like 'add' but allows negative amounts.
         * used by 'sub' to substract from existing VMoney.
         */
        private function _add(money:VMoney):VWallet {
            if (money.amount == 0) return this;
            var ret:Vector.<VMoney> = new Vector.<VMoney>();
            var found:Boolean = false;
            for (var i:int = 0; i <  _money.length; ++i) {
                if (_money[i].code.equals(money.code)) {
                    ret.push(new VMoney(_money[i].amount + money.amount, money.code));
                    found = true;
                }
                else {
                    ret.push(_money[i]);
                }
            }
            if (!found)
                ret.push(money);
            return new VWallet(ret);
        }

        /** Returns a new VWallet with less money in it.
         * Returns null if there isn't enough money available.
         *
         * @param money a positive amount of money.
         */
        public function sub(money:VMoney):VWallet {
            if (!has(money)) return null;
            return _add(new VMoney(-money.amount, money.code));
        }

        /** Check if there is enough money available.
         *
         * Returns true if the wallet contains at least the given amount.
         *
         * @param money a positive amount of money.
         */
        public function has(money:VMoney):Boolean {
            if (money.amount < 0) return false;
            return getMoneyIn(money.code).amount >= money.amount;
        }

        public function contains(other:VWallet):Boolean {
            for (var i:int = 0; i <  other._money.length; ++i) {
                if (!has(other._money[i]))
                    return false;
            }
            return true;
        }

        public function equals(other:VWallet):Boolean {
            return this.contains(other) && other.contains(this);
        }

        public function toJSON():Object {
            var ret:Object = { money: [] };
            for (var i:int = 0; i < _money.length; ++i)
                ret.money.push(_money[i].toJSON());
            return ret;
        }

        public static function fromJSON(obj:Object):VWallet {
            if (!obj || !obj.money)
                return new VWallet();
            var v:Vector.<VMoney> = new Vector.<VMoney>(obj.money.length);
            for (var i:int = 0; i < obj.money.length; ++i)
                v[i] = VMoney.fromJSON(obj.money[i]);
            return new VWallet(v);
        }
    }
}
// vim: ts=4:sw=4:et:
