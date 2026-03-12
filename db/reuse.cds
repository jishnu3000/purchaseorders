namespace poapp.reuse ;
using { Currency } from '@sap/cds/common';
// Reusable Types
type Guid : UUID ;
type PhoneNumber : String(32);
type Names : String(64);
type PostalN : String(12);
type Email : String(255);
// Enumerator
type Gender : String(1) enum {
    male = 'M';
    female = 'F';
    undisclosed = 'U';
}
// Reusable Type for Amount
type AmountT : Decimal(10,2) @( 
    Semantics.amount.currencyCode: 'CURRENCY_CODE',
    sap.unit : 'CURRENCY_CODE'
 );
// Reusable Aspect
aspect Amount : {
    CURRENCY : Currency ;
    GROSS_AMOUNT : AmountT @(title: '{i18n>GROSS_AMOUNT}');
    NET_AMOUNT : AmountT @(title: '{i18n>NET_AMOUNT}');
    TAX_AMOUNT : AmountT @(title: '{i18n>TAX_AMOUNT}');
}
// Reusable Aspect
aspect Address {
    STREET   : Guid;
    POSTAL   : PostalN;
    CITY     : Names;
    COUNTRY  : Names;
    BUILDING : Names;
}