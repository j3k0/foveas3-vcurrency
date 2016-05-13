package fovea.vstore {

    public class SStore {

        private var _stock:SInventory;

        public function SStore(stock:SInventory = null) {
            _stock = stock || new SInventory();
        }

        public function get stock():SInventory {
            return _stock;
        }

        public function add(product:SProduct):SStore {
            return new SStore(stock.add(product));
        }
    }
}
// vim: ts=4:sw=4:et:
