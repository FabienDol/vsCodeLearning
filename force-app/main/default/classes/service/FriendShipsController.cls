public with sharing class FriendShipsController {

    @AuraEnabled
    public static List<Boat__c> getAllBoats(){
        try {
            return [SELECT Id, Name FROM Boat__c ];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
