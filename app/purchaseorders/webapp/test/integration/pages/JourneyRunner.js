sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"purchaseorders/test/integration/pages/PurchaseOrderSrvList",
	"purchaseorders/test/integration/pages/PurchaseOrderSrvObjectPage",
	"purchaseorders/test/integration/pages/PurchaseItemSrvObjectPage"
], function (JourneyRunner, PurchaseOrderSrvList, PurchaseOrderSrvObjectPage, PurchaseItemSrvObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('purchaseorders') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrderSrvList: PurchaseOrderSrvList,
			onThePurchaseOrderSrvObjectPage: PurchaseOrderSrvObjectPage,
			onThePurchaseItemSrvObjectPage: PurchaseItemSrvObjectPage
        },
        async: true
    });

    return runner;
});

