public with sharing class reservationManagerController {

    @AuraEnabled(cacheable=true)
    public static List<customerServices.Customer> getCustomerList(String sObjectType){
        List<customerServices.Customer> customers  = new List<customerServices.Customer>();
        if(sObjectType == 'Lead')
        {
            for(Lead l : [Select Id, name, email, city, state, status from Lead WHERE status IN ('Open - Not Contacted','New - Not Contacted','New') WITH SECURITY_ENFORCED LIMIT 5])
            {
                customerServices.Customer cust = new customerServices.Customer(l.name, l.email, l.city, l.state, l.status, l.Id);
                customers.add(cust);
            }
        }
        if(sObjectType == 'Contact')
        {
            for(Contact c : [Select Id, name, email, MailingCity, MailingState, Reservation_Status__c from Contact WHERE Reservation_Status__c IN ('Open - Not Contacted','New - Not Contacted','New') WITH SECURITY_ENFORCED LIMIT 5])
            {
                customerServices.Customer cust = new customerServices.Customer(c.name, c.email, c.MailingCity, c.MailingState, c.Reservation_Status__c, c.Id);
                customers.add(cust);
            }
        }
        return customers;
    }
}
