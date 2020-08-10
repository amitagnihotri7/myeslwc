public with sharing class customerServices {

    public class Customer
    {
        @AuraEnabled
        public String name {get;set;}

        @AuraEnabled
        public String email {get; set;}
        
        @AuraEnabled
        public String city {get; set;}

        @AuraEnabled
        public String state {get; set;}

        @AuraEnabled
        public String status {get; set;}

        @AuraEnabled 
        public String Id {get;set;} 

        public Customer(String name, String email, String city, String state, String status, String custId)
        {
            this.name = name;
            if (String.isNotEmpty(email))
                this.email = email;
            if(String.isNotEmpty(city))
                this.city = city;
            if(String.isNotEmpty(state))
                this.state = state;
            if(String.isNotEmpty(status))
                this.status = status;
            if(String.isNotEmpty(custId))
                this.Id = custId;
        }
    }
}