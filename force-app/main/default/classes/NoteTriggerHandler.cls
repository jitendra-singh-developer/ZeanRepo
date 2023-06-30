public without sharing class NoteTriggerHandler {
    
    public static void createPlatformEvent(){
        Notes_Platform__e np = new Notes_Platform__e();
        np.Notes_Message__c = 'Test Message';
        Database.SaveResult res = EventBus.publish(np);
        System.debug('np ==> ' + np);
        System.debug('res ==> ' + res);
        
    }
    
    
    public static void sendMessage(List<Notes__c> notes){
        System.debug('notes'+ notes);
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for(Notes__c note : notes){
            
          	      	List<String> address = new List<String>();
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setSubject(note.Subject__c);
            		String msg = note.Message__c;
                    mail.setplaintextbody(msg);
            		address.add(note.Email__c);
                    mail.setToAddresses(address);
                    emailList.add(mail);
        }
        if(!emailList.isEmpty()){
            System.debug('emailList'+ emailList);
            Messaging.sendEmail(emailList);
        }
    }
}