package {

    import fovea.vcurrency.*;

    public class TestVWallet {

        private static function get gold():VCurrencyCode {
            return new VCurrencyCode("gold");
        }
        private static function get silver():VCurrencyCode {
            return new VCurrencyCode("silver");
        }
        private static function get copper():VCurrencyCode {
            return new VCurrencyCode("copper");
        }

        private static function wallet(g:int = -1, s:int = -1, c:int = -1):VWallet {
            var ret:VWallet = new VWallet();
            if (g >= 0)
                ret = ret.add(new VMoney(g, gold));
            if (s >= 0)
                ret = ret.add(new VMoney(s, silver));
            if (c >= 0)
                ret = ret.add(new VMoney(c, copper));
            return ret;
        }

        public static function run():void {
            assert.test("VWallet.VWallet()");
            assert.ok("Builds an empty VWallet",
                new VWallet());

            assert.test("VWallet.add()");
            var added:VWallet;

            assert.equals("Refuses negative amounts",
                null, new VWallet().add(new VMoney(-1, gold)));

            added = new VWallet().add(new VMoney(3, gold));
            assert.equals("Appends non-existing currency",
                1, added.money.length);
            assert.equals("Appends non-existing currency",
                3, added.money[0].amount);

            added = added.add(new VMoney(5, gold));
            assert.equals("Adds to an existing currency",
                1, added.money.length);
            assert.equals("Adds to an existing currency",
                8, added.money[0].amount);

            assert.test("VWallet.getMoneyIn()");
            var w:VWallet = wallet(7, 3);
            assert.equals("Retrieves money in the right currency",
                7, w.getMoneyIn(gold).amount);
            assert.equals("Retrieves money in the right currency",
                3, w.getMoneyIn(silver).amount);
            assert.equals("Returns empty money if currency isn't found",
                0, w.getMoneyIn(copper).amount);

            assert.test("VWallet.has()");
            assert.ok("Always true for amount 0",
                w.has(new VMoney(0, copper)));
            assert.ok("Always true for amount 0",
                w.has(new VMoney(0, silver)));
            assert.ok("True for exact amount",
                w.has(new VMoney(3, silver)));
            assert.ok("False for insufficient funds",
                !w.has(new VMoney(4, silver)));

            assert.test("VWallet.sub()");
            var subed:VWallet = new VWallet()
              .add(new VMoney(3, silver))
              .add(new VMoney(7, gold));

            assert.equals("Refuses negative amounts",
                null, subed.sub(new VMoney(-1, gold)));

            assert.equals("Substracts from an existing currency",
                1, subed.sub(new VMoney(6, gold)).getMoneyIn(gold).amount);
            assert.equals("Substracts from an existing currency",
                0, subed.sub(new VMoney(7, gold)).getMoneyIn(gold).amount);
            assert.equals("Refuses insufficient funds",
                null, subed.sub(new VMoney(8, gold)));

            assert.test("VWallet.contains()");
            assert.ok("An empty wallet contains an empty wallet",
                wallet().contains(wallet()));
            assert.ok("A wallet with something in it contains an empty wallet",
                wallet(1).contains(wallet()));
            assert.ok("A wallet with 1 gold does not contain a wallet with 2 gold",
                !wallet(1).contains(wallet(2)));
            assert.ok("A Wallet with 1 gold and 1 silver contains a wallet with 1 silver",
                wallet(1,1,0).contains(wallet(0,1)));
            assert.ok("A wallet with 2 gold contains a wallet with 2 gold",
                wallet(2).contains(wallet(2,0)));
            assert.ok("A wallet with 2 gold doen not contain a wallet with 2 gold and 1 silver",
                !wallet(2).contains(wallet(2,1)));

            assert.test("VWallet.equals()");
            assert.ok("Empty == Empty", wallet().equals(wallet()));
            assert.ok("1 Gold != Empty", !wallet(1).equals(wallet()));
            assert.ok("1 Gold != 1 Gold + 1 Silver", !wallet(1).equals(wallet(1,1)));
            assert.ok("X == X", wallet(1,2,3).equals(wallet(1,2,3)));
            assert.ok("Y != X", !wallet(1,2,2).equals(wallet(1,2,3)));

            assert.test("VWallet.toJSON()");
            assert.equals("Empty == { money:[] }",
                0, new VWallet().toJSON().money.length);
            assert.equals("x Gold == { money:[{...}] }",
                1, wallet(4).toJSON().money.length);

            assert.test("VWallet.fromJSON()");
            var x:VWallet = wallet(19,8,0);
            assert.ok("X == fromJSON(toJSON(X))",
                x.equals(VWallet.fromJSON(x.toJSON())));
            assert.ok("Empty == fromJSON(<invalid>)",
                wallet().equals(VWallet.fromJSON({a:1})));
        }
    }
}
// vim: ts=4:sw=4:et:
