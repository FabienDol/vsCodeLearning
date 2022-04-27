public with sharing class BoatsSelector {

        public static List<Boat__c> selectByType(String type) {

            return [SELECT Id FROM Boat__c WHERE  BoatType__r.Name = :type WITH SECURITY_ENFORCED];

        }


        public static List<Boat__c> selectById(Set<Id> idSet) {

            return [SELECT Id, Name FROM Boat__c WHERE Id IN :idSet WITH SECURITY_ENFORCED];

        }


        public static List<Boat__c> selectByName(Set<String> nameSet) {

            return [SELECT Id, Name FROM Boat__c WHERE Name IN :nameSet WITH SECURITY_ENFORCED];

        }

        public static List<Boat__c> selectByIdWithMaintenances(Set<Id> idSet) {

            return [SELECT Id, (SELECT Id FROM maintenances__r) FROM Boat__c WHERE Id IN :idSet WITH SECURITY_ENFORCED];

        }

}
