public without sharing class sendTextMassageController {

	@auraenabled	
    public static boolean createNotes( SObject  noteObject){
        try {      
            upsert as user noteObject;
            return true;
        }catch(Exception e){
            return false;
        }
	}

    @auraenabled	
    public static List<Notes__c> getNotesByShareId(String shareId){
        try {      
            return [Select Id, Name, CreatedDate, Message__c from Notes__c Where NoteShareId__c = : shareId];
        }catch(Exception e){
            return null;
        }
	}

    @auraenabled(cacheable=true)
    public static List<Notes__c> getNotes(){
        try {      
            return [Select Id, Name, CreatedDate, Message__c, Account__c, Type__c, Residence_Address_Requested__c, Statute__c, Jurisdiction__c, Proposed_Use__c from Notes__c Order By CreatedDate DESC];
        }catch(Exception e){
            return null;
        }
	}

    @AuraEnabled
    public static Boolean deleteNote(String noteId){
        try{
            Notes__c noteObj = new Notes__c();
            noteObj.Id = noteId;
            delete noteObj;
            //delete [Select Id from Notes__c Where Id = : noteId];
            return true;
        }catch(Exception e){
            return false;
        }
    }
}