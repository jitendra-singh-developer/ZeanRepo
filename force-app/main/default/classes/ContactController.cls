public without sharing class ContactController {
    @auraenabled
    public static List<Contact> getContacts(Id recordId){
        return [SELECT Id, FirstName, LastName, Phone, Email from Contact Where AccountId = : recordId];
    }

    @auraenabled
    public static List<Contact> getContactRecords(){
        return [SELECT Id, FirstName, LastName, Name, Phone, Email, CreatedDate, LastModifiedDate from Contact Limit 10];
    }
}