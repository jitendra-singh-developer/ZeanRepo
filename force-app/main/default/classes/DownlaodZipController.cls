public with sharing class DownlaodZipController {
    @AuraEnabled
    public static Map<String,Object> getRelatedFiles(String recordId){
        Map<String,Object> response = new Map<String,Object>();
        Set<Id> contentDocIds = new Set<Id>();
        String contentVersionIds = '';

        for(ContentDocumentLink cdl: [SELECT ContentDocumentId 
                                      FROM ContentDocumentLink
                                      WHERE LinkedEntityId=:recordId]){
                                            contentDocIds.add(cdl.ContentDocumentId);
        }
        
        if(contentDocIds.size()>0){
            for(ContentVersion cv: [SELECT Id 
                                    FROM ContentVersion 
                                    WHERE ContentDocumentId IN:contentDocIds 
                                    AND isLatest=true]){
                                        contentVersionIds += cv.Id+'/';
            }
            response.put('contentVersionIds', contentVersionIds);                     
        }
        else{
            response.put('contentVersionIds', null);  
        }
        return response;
    }
}