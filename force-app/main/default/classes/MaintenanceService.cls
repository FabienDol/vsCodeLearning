public with sharing class MaintenanceService {

    // méthode pour créer une maintenance en db
    public static Maintenance__c newMaintenance(Maintenance__c maintenance) {
        insert maintenance;
        return maintenance;
    }

    // methode pour terminer une maintenance en db avec un objet et un String
    public static Boolean endMaintenance(Maintenance__c maintenance, String status){
        return endMaintenance(maintenance.Id, status);
    }

    // idem ci-dessus, avec un Id et String
    public static Boolean endMaintenance(Id maintenanceId, String status){
        // recrée un objet pour pouvoir le mettre a jour (toujours comme ça pour une requete DML [insert, update])
        Maintenance__c maintenance = new Maintenance__c(Id = maintenanceId);
        
        // set endDate__c     
        maintenance.endDate__c = Date.today();
        maintenance.Status__c = status;

        try {
            Database.SaveResult result = Database.update(maintenance);
            if(result.isSuccess()){
                return true;
            } else {
                return false;
            }

        } catch(Exception e) {
            System.debug(e.getMessage());
            return false;
        }
    }
}
