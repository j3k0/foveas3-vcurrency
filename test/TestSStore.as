package {

    import fovea.vcurrency.*;
    import fovea.vstore.*;

    public class TestSStore {

        public static function get product1():SProduct {
            return new SProduct(
                new SProductId("product1"),
                "product1-title",
                "product1-description",
                new SCost(10, new VCurrencyCode("gold")));
        }

        public static function run():void {

            assert.test("SStore.SStore");
            assert.equals("Builds an empty store",
                0, new SStore().stock.length);

            assert.test("SStore.add");
            assert.equals("Adds an item to the stock",
                1, new SStore().add(product1).stock.length);
            assert.equals("Adds THE item to the stock",
                "product1-title",
                new SStore().add(product1)
                .stock.find(new SProductId("product1"))
                .localizedTitle);
        }
    }
}
// vim: ts=4:sw=4:et:
