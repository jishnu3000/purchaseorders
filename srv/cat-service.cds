using { poapp.db as database } from '../db/datamodel';
// using { CDSViews } from '../db/cdsviews';

service CatalogService @(path: 'CatalogService') {
    entity BusinessPartnerSrv as projection on database.master.BusinessPartners ;

    entity AddressSrv as projection on database.master.Addresses ;

    entity EmployeeSrv as projection on database.master.Employees ;

    entity ProductSrv as projection on database.master.Products;

    @odata.draft.enabled
    entity PurchaseOrderSrv as projection on database.transaction.PurchaseOrders {
        *,
        case OVERALL_STATUS
            when 'N' then 'New'
            when 'P' then 'Paid'
            when 'C' then 'Cancelled'
            else 'Completed'
        end as OST : String(15) @(title : '{i18n>OVERALL_STATUS}'),
        case OVERALL_STATUS
            when 'N' then 3
            when 'P' then 2
            when 'C' then 1
            else 3
            end as OSC : Integer,
        case LIFECYCLE_STATUS
            when 'N' then 'Not Started'
            when 'P' then 'Pending'
            when 'D' then 'Delivered'
            else 'Returned'
        end as LST : String(15) @(title : '{i18n>LIFECYCLE_STATUS}'),
        case LIFECYCLE_STATUS
            when 'N' then 3
            when 'P' then 1
            when 'D' then 2
            else 3
        end as LSC : Integer,
        // case CURRENCY
        //     when 'EUR' then 'Euro'
        //     else ''
        // end as currency: String(15) @(title: '{i18n>CURRENCY}')
    } actions {
        // Instance bounded function
        function largestOrder() returns array of PurchaseOrderSrv ;

        // Instance bounded action
        @cds.odata.bindingparameter.name: 'DP'
        @Common.SideEffects : {
            TargetProperties : ['DP/GROSS_AMOUNT']
        }
        action discountPrice() ;
    }; 
    entity PurchaseItemSrv as projection on database.transaction.PurchaseItems ;

    // Declaration of Function
    function getEmployeeInfo() returns array of  String ;

    function getPurchaseOrderInfo() returns array of String;

    // Declare Action
    action createEmployee(
        currency_code : String,
        ID : UUID,
        accountNumber : String,
        bankId : String,
        bankName : String,
        email : String,
        phoneNumber : String,
        nameFirst : String,
        gender : String,
        language : String,
        nameLast : String,
        loginName : String,
        nameMiddle : String,
        salary : Decimal(10,2),
        nameInitials : String
    ) returns array of EmployeeSrv;

    action createAddress(
        ADDRESS_TYPE : String,
        VAL_START    : Date,
        VAL_END      : Date,
        LATITUDE     : Decimal,
        LONGITUDE    : Decimal,
        STREET   : UUID,
        POSTAL   : String,
        CITY     : String,
        COUNTRY  : String,
        BUILDING : String,
    ) returns array of AddressSrv;
}

// service MyService {
//     entity POWorklistSrv as projection on CDSViews.POWorklist;
// }