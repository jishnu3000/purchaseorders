using CatalogService as service from '../../srv/cat-service';
annotate service.PurchaseOrderSrv with @(
    UI.SelectionFields : [
        PO_ID,
        GROSS_AMOUNT,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.BP_ID
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : LST,
            Criticality : LSC
        },
        {
            $Type : 'UI.DataField',
            Value : OST,
            Criticality : OSC
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY
        }
    ],
        UI.HeaderInfo : {
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title : {
            Label : 'Purchase Order ID',
            Value : PO_ID
        },
        Description : {
            Label : 'Company Name',
            Value : PARTNER_GUID.COMPANY_NAME
        },
        ImageUrl : 'https://www.freepnglogos.com/uploads/ibm-logo-png/ibm-logo-the-evolution-and-role-information-systems-24.png'
    },
        UI.Facets               : [
            {
                $Type : 'UI.CollectionFacet',
                Label : 'Purchase Order Details',
                Facets: [
                    {
                        $Type : 'UI.ReferenceFacet',
                        Label : 'More details about the purhcase order',
                        Target: '@UI.FieldGroup#MoreInfo'
                    },
                    {
                        $Type : 'UI.ReferenceFacet',
                        Label : 'Amount details of purchase order',
                        Target: '@UI.FieldGroup#AmountDet'
                    }
                ]
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'PUrchase Items',
                Target : 'Items/@UI.LineItem'
            }
    ],
        UI.FieldGroup #MoreInfo : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: PO_ID
            },
            {
                $Type: 'UI.DataField',
                Value: PARTNER_GUID_NODE_KEY
            },
            {
                $Type      : 'UI.DataField',
                Value      : LST,
                Criticality: LSC
            },
            {
                $Type      : 'UI.DataField',
                Value      : OST,
                Criticality: OSC
            }
        ]
    },
        UI.FieldGroup #AmountDet : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: GROSS_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: CURRENCY_code
            }
        ]
    }
);

annotate service.PurchaseItemSrv with @( 
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEMS_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        }
    ],
    UI.HeaderInfo : {
        TypeName : ' Purchase Item',
        TypeNamePlural : 'Purchase Items',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ITEMS_POS
        },
        Description : {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION
        },
        ImageUrl : 'https://www.freepnglogos.com/uploads/ibm-logo-png/ibm-logo-the-evolution-and-role-information-systems-24.png'
    },
UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Purchase Item Collection',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Price Details',
                    Target : '@UI.FieldGroup#PriceDetails'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Product Details',
                    Target : '@UI.FieldGroup#ProductDetails'
                }
            ]
        }
    ],
    UI.FieldGroup #PriceDetails : {
        Data : [
       {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        }
        ]
    },
    UI.FieldGroup #ProductDetails : {
        Data : [
       {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.PRODUCT_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.CATEGORY,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.PRICE,
        },
       {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DIM_UNIT,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.WEIGHT_UNIT,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.WEIGHT_MEASURE,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.HEIGHT,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DEPTH,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.WIDTH,
        }
        ]
    }
 )