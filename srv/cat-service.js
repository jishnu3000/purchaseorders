const { data } = require("@sap/cds/lib/dbs/cds-deploy");
const INSERT = require("@sap/cds/lib/ql/INSERT");
const { request } = require("node:http");

module.exports = cds.service.impl( async function() {
    
    // step-1: Get the Employee Object
    let { EmployeeSrv, PurchaseOrderSrv, ProductSrv } = this.entities ;
    
    // Define generic handler to perform pre-checks or validation on any service
    this.before('UPDATE', EmployeeSrv, (request, respone) =>{
        console.log("Salary : ", request.data.salary) ;
        if (parseFloat(request.data.salary) >= 50000) {
            request.error(500, "Please get the approval from your line manager!")
        }
    })

    this.before('UPDATE', ProductSrv, (request, respone) =>{
        console.log("Price : ", request.data.PRICE) ;
        if (parseFloat(request.data.PRICE) >= 1000) {
            request.error(500, "Please get the approval from your line manager!")
        }
    })
    
    this.on('getEmployeeInfo', async(request, response) =>{
        try {
            const transaction = cds.tx(request);
            const response = await transaction.read(EmployeeSrv).orderBy({
                salary : 'desc'
            }).limit(10) ;
            return response ;
        } catch (error) {
            return "Error : " + error.toString();
        }
    });

    this.on('getPurchaseOrderInfo', async(request, response) => {
        try {
            const transaction = cds.tx(request);
            const response = await transaction.read(PurchaseOrderSrv).orderBy({
                GROSS_AMOUNT : 'desc'
            }).limit(10) ;
            return response ;
        } catch (error){
            return "Error : " + error.toString();
        }
    })

    this.on('createEmployee', async(request, response) => {
        const dataset = request.data ;
        let returndata = await cds.tx(request).run([
            INSERT.into(EmployeeSrv).entries(dataset)
        ]).then((resolve, reject)=>{
            if (typeof(resolve) !== undefined) {
                return request.data;
            } else {
                request.error(500, "Error in creation of Employee");
            }
        }).catch(err => {
            request.error(500, "There is an error : " + err.toString());
        });

        return returndata;
    })

    this.on('createAddress', async(request, response) => {
        const dataset = request.data;
        let returndata = await cds.tx(request).run([
            INSERT.into(EmployeeSrv).entries(dataset)
        ]).then((resolve, reject)=>{
            if (typeof(resolve) !== undefined) {
                return request.data;
            } else {
                request.error(500, "Error in creation of Employee");
            }
        }).catch(err => {
            request.error(500, "There is an error : " + err.toString());
        });

        return returndata;
    })

    this.on('largestOrder', async(request, response) => {
        try {
            const transaction = cds.tx(request) ;
            const reply = await transaction.read(PurchaseOrderSrv).orderBy({
                GROSS_AMOUNT : 'desc'
            }).limit(1) ;
            return reply ;
        } catch (error) {
            return "Error : " + error.toString();
        }
    })

    this.on('discountPrice',async(request, response) => {
        try {
            const ID = request.params[0] ;
            const transaction = cds.tx(request) ;
            await transaction.update(PurchaseOrderSrv).with({
                GROSS_AMOUNT : {
                    '-=' : 1000
                },
                NET_AMOUNT : {
                    '-=' : 800
                },
                TAX_AMOUNT : {
                    '-=' : 200
                }
            }).where(ID) ;
        } catch (error) {
            return "Error : " + error.toString();
        }
    })
})