public without sharing class ContentDocumentController {

    @AuraEnabled
    public static List<ContentDocument> getUploadedFiels(String recordId){
        List<ContentDocumentLink> lstOfContentDocument = [Select Id, ContentDocumentId from ContentDocumentLink Where LinkedEntityId = : recordId];
        if(lstOfContentDocument.size() > 0){
            Set<Id> setOfCDIds = new Set<Id>();
            for(ContentDocumentLink cdl : lstOfContentDocument){
                setOfCDIds.add(cdl.ContentDocumentId);
            }
            return [SELECT Id, CreatedById, CreatedDate, Title, PublishStatus, ParentId, FileType, FileExtension, ContentSize, Description FROM ContentDocument Where Id IN : setOfCDIds ];

        }
         return [SELECT Id, CreatedById, CreatedDate, Title, PublishStatus, ParentId, FileType, FileExtension, ContentSize, Description FROM ContentDocument ];
    }

    @AuraEnabled
    public static Boolean updateUploadedFile(String contentDocumentId, String fileName, String description){
        if(contentDocumentId != null){
             ContentDocument newDocument = new ContentDocument();
             newDocument.Id = contentDocumentId;
             newDocument.Title = fileName;
             newDocument.Description = description;
             try{
                 update newDocument;
                 return true;
             }catch(Exception e){
                 return false;
             }
        }
        return false;
    }
}