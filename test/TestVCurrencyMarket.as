package {

    import fovea.vcurrency.*;

    public class TestVCurrencyMarket {

        private static function get gold():VCurrencyCode {
            return new VCurrencyCode("gold");
        }
        private static function get silver():VCurrencyCode {
            return new VCurrencyCode("silver");
        }
        private static function get copper():VCurrencyCode {
            return new VCurrencyCode("copper");
        }

        public static function run():void {
            assert.test("VCurrencyMarket.VCurrencyMarket()");
            assert.ok("Builds an empty VCurrencyMarket",
                new VCurrencyMarket());
        }
    }
}
// vim: ts=4:sw=4:et:
