public with sharing class SB_OpportunityController {
  @AuraEnabled(cacheable=true)
  public static List<Opportunity> getCloseWonOpportunityRecords() {
    return [SELECT Id, Name, Amount, CloseDate FROM Opportunity WHERE StageName = 'Closed Won'];
  }
}