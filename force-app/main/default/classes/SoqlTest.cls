public with sharing class SoqlTest {
    public SoqlTest() {

    }

    // liste de tous les bateaux qui ont un certain type
    public static List<Boat__c> getBoatsByType(String boatType) {

        List<Boat__c> boatsList = [SELECT Name, BoatType__c
        FROM Boat__c
        WHERE BoatType__r.Name = ':boatType'];

        System.debug('boatsList' + boatsList);

        return boatsList;

    }
    





    // liste de tous les bateaux avec les maintenances associées






    // récup tous les bateaux de type jetski







    // Map<String, Integer> qui représente le nb de bateaux par type





    // récupérer tous les bateaux avec le nom du contact parent, le nom du compte parent,
    // et les maintenances associées mais uniquement celles traitées











    // récup tous les contacts du compte associé au bateau "Strathgordon"



}
