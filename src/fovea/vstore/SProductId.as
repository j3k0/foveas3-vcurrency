package fovea.vstore {

    /** Product identifier */
    public class SProductId {

        private var _value:String;

        public function SProductId(value:String) {
            _value = value;
        }

        public function get value():String { return _value; }

        public function equals(other:SProductId):Boolean {
            return other.value == value;
        }
    }
}
// vim: ts=4:sw=4:et:
