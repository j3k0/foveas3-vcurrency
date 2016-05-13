package fovea.vstore {

    // Immutable collection of products
    public class SInventory {

        private var _products:Vector.<SProduct>;

        public function SInventory(products:Vector.<SProduct> = null) {
            _products = products || new Vector.<SProduct>();
        }

        public function get length():int {
            return _products.length;
        }

        public function find(id:SProductId):SProduct {
            for (var i:int = 0; i < _products.length; ++i) {
                if (_products[i].id.equals(id))
                    return _products[i];
            }
            return null;
        }

        public function forEach(cb:Function):void {
            for (var i:int = 0; i < _products.length; ++i) {
                cb(_products[i]);
            }
        }

        public function map(cb:Function):Array {
            var ret:Array = [];
            for (var i:int = 0; i < _products.length; ++i) {
                ret.push(cb(_products[i]));
            }
            return ret;
        }

        public function add(product:SProduct):SInventory {
            var ret:Vector.<SProduct> = new Vector.<SProduct>();
            var found:Boolean = false;
            forEach(function(p:SProduct):void {
                if (p.id.equals(product.id)) {
                    found = true;
                    ret.push(product);
                }
                else {
                    ret.push(p);
                }
            });
            if (!found) {
                ret.push(product);
            }
            return new SInventory(ret);
        }
    }
}
// vim: ts=4:sw=4:et:
