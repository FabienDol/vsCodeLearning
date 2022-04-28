public with sharing class FriendShipsController {

    @AuraEnabled
    public static List<Boat__c> getAllBoats(){
        try {
            return [SELECT Id, Name FROM Boat__c WITH SECURITY_ENFORCED];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<BoatType__c> getAllBoatsWithTypes(){
        try {
            return [SELECT Name, (SELECT Name FROM Boats__r) FROM BoatType__c WITH SECURITY_ENFORCED];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Boat__c> getAllBoatsWithMaintenances(){
        try {
            return [SELECT Name, (SELECT startDate__c FROM maintenances__r) FROM Boat__c WITH SECURITY_ENFORCED];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}
