import { LightningElement ,wire,api} from 'lwc';
import getCustomerList from '@salesforce/apex/reservationManagerController.getCustomerList';

export default class CustomerList extends LightningElement {

    @api sObject ='Lead';
    customers;
    errorMsg;
    @wire(getCustomerList,{sObject: '$sObject'})
    wiredCustomerData({error, data}){
        if(data)
        {
            this.customers = data;
        }
        if(error)
        {
            this.errorMsg = error;
        }
    }



    customers = [
        {
            "name": "Test 1",
            "email": "test1@example.com",
            "city": "NY",
            "state": "NY",
            "status": "Open",
            "Id": "0000000"
        },
        {
            "name": "Test 2",
            "email": "test2@example.com",
            "city": "NY",
            "state": "NY",
            "status": "Open",
            "Id": "0000001"
        },
        {
            "name": "Test 3",
            "email": "test3@example.com",
            "city": "NY",
            "state": "NY",
            "status": "Open",
            "Id": "0000002"
        }
    ];



}