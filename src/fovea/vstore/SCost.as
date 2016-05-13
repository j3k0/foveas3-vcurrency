package fovea.vstore {

    import fovea.vcurrency.VMoney;
    import fovea.vcurrency.VCurrencyCode;

    public class SCost extends VMoney {
        public function SCost(amount:Number, code:VCurrencyCode) {
            super(amount, code);
        }
    }
}
// vim: ts=4:sw=4:et:
