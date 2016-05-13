package fovea.vstore {

    public class SProduct {

        private var _id:SProductId;
        private var _localizedTitle:String;
        private var _localizedDescription:String;
        private var _cost:SCost;

        public function SProduct(id:SProductId, localizedTitle:String, localizedDescription:String, cost:SCost) {
            _id = id;
            _localizedTitle = localizedTitle;
            _localizedDescription = localizedDescription;
            _cost = cost;
        }

        public function equals(other:SProduct):Boolean {
            return this === other || (
                id.equals(other.id) &&
                localizedTitle == other.localizedTitle &&
                localizedDescription == other.localizedDescription &&
                cost.equals(other.cost));
        }

        public function toJSON():Object {
            return {
                id: id.value,
                localizedTitle: localizedTitle,
                localizedDescription: localizedDescription,
                cost: cost.toJSON()
            };
        }

        public function get id():SProductId { return _id; }

        public function get localizedTitle():String { return _localizedTitle; }

        public function get localizedDescription():String { return _localizedDescription; }

        public function get cost():SCost { return _cost; }
    }
}
// vim: ts=4:sw=4:et:
