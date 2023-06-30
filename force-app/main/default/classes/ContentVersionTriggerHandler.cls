public class ContentVersionTriggerHandler {
    
    public static void createContentLink(List<ContentVersion> contentVersionList) {
        List<ContentDocumentLink> contentDocLinkList = new List<ContentDocumentLink>();
        if(contentVersionList.size() > 0){
            for(ContentVersion conVer : contentVersionList){
                ContentDocumentLink cdl = new ContentDocumentLink();
                cdl.ContentDocumentId = conVer.ContentDocumentId;
                cdl.LinkedEntityId = conVer.Guest_Record_File_Uploaded__c;
                cdl.ShareType = 'V';
                contentDocLinkList.add(cdl);
            }
            if(contentDocLinkList.size() > 0){
                insert contentDocLinkList;
            }
        }  
  
    }
}