namespace poapp.db;
using { Currency, cuid } from '@sap/cds/common';
using { poapp.reuse as common } from './reuse';
context master {
    entity BusinessPartners {
        key NODE_KEY     : common.Guid;
            BP_ROLE      : String(2);
            EMAIL        : common.Email;
            MOBILE       : common.PhoneNumber;
            FAX          : String(32);
            WEB          : String(255);
            BP_ID        : common.Guid @(title: '{i18n>BP_ID}');
            COMPANY_NAME : String(255) @(title: '{i18n>COMPANY_NAME}');
            ADDRESS_GUID : Association to Addresses;
    }

    entity Addresses : common.Address {
        key NODE_KEY     : common.Guid;
            ADDRESS_TYPE : String(44);
            VAL_START    : Date;
            VAL_END      : Date;
            LATITUDE     : Decimal;
            LONGITUDE    : Decimal;
            // Unmanaged Association
            bp           : Association to one BusinessPartners
                               on bp.ADDRESS_GUID = $self;
    }

    entity Products {
        key NODE_KEY       : common.Guid;
            PRODUCT_ID     : String(28);
            TYPE_CODE      : String(2);
            CATEGORY       : String(32);
            DESCRIPTION    : String(255);
            TAX_TARIF_CODE : Integer;
            MEASURE_UNIT   : String(2);
            WEIGHT_MEASURE : Decimal(5, 2);
            WEIGHT_UNIT    : String(2);
            CURRENCY_CODE  : String(4);
            PRICE          : Decimal(15, 2);
            WIDTH          : Decimal(5, 2);
            HEIGHT         : Decimal(5, 2);
            DEPTH          : Decimal(5, 2);
            DIM_UNIT       : String(2);
            // Managed Association
            SUPPLIER_GUID  : Association to BusinessPartners;
    }

    entity Employees : cuid {
        nameFirst     : common.Names;
        nameLast      : common.Names;
        nameInitials  : common.Names;
        nameMiddle    : common.Names;
        gender        : common.Gender;
        language      : String(2);
        phoneNumber   : common.PhoneNumber;
        email         : common.Email;
        loginName     : String(16);
        currency      : Currency;
        salary        : common.AmountT;
        accountNumber : String(16);
        bankId        : String(12);
        bankName      : common.Names;
    }
}

context transaction {
    entity PurchaseOrders : common.Amount {
        key NODE_KEY         : common.Guid;
            PO_ID            : String(40) @(title: '{i18n>PO_ID}');
            PARTNER_GUID     : Association to master.BusinessPartners;
            LIFECYCLE_STATUS : String(1) @(title: '{i18n>LIFECYCLE_STATUS}');
            OVERALL_STATUS   : String(1) @(title: '{i18n>OVERALL_STATUS}');
            // Unmanaged Association
            Items            : Association to many PurchaseItems
                                   on Items.PARENT_KEY = $self;
    }

    entity PurchaseItems : common.Amount {
        key NODE_KEY     : common.Guid;
            PARENT_KEY   : Association to PurchaseOrders;
            PO_ITEMS_POS : Integer;
            PRODUCT_GUID : Association to master.Products;
    }
}