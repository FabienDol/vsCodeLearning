// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

AccountHandler.insertAccount(3);

Algo01.getAccounts();

GenerateData.init();


Maintenance__c maintenance = new Maintenance__c(
    startdate__c = date.newInstance(2022, 07, 01),
    endDate__c = date.newInstance(2023, 01, 01), 
    Boat__c = [SELECT Id FROM Boat__c LIMIT 1]?.Id, //Id de Boat
    Description__c = 'Premiere maintenance'
);

// équivalent pour trouver un Id : 
/*List<Boat__c> boats = new List<Boat__c>();
boats = [SELECT Id FROM Boat__c];
Id boatId = boats.get(0);
boatId = boats[0];*/

// insérer la maintenance en db
Maintenance__C newMaintenance = MaintenanceService.newMaintenance(maintenance);

System.debug(newMaintenance);

// requete un Id
Maintenance__c maintenanceToEnd = [SELECT Id FROM Maintenance__c LIMIT 1];
// clos une maintenance
String status = 'Abandonné';
Boolean isSuccess = MaintenanceService.endMaintenance(maintenanceToEnd, status);
System.debug('maintenanceToEnd : ' + maintenanceToEnd);
System.debug('isSuccess : ' + isSuccess);


System.debug(SoqlTest.getBoatsByType('Jet Ski'));


List<Boat__c> jetSkiList = BoatsSelector.selectByType('Jet Ski');
System.debug(JSON.serializePretty(jetSkiList));

Set<Id> idSet = new Set<Id>{'a057Q000000n5z4QAA', 'a057Q000000n5ywQAA'};
List<Boat__c> returnedList = BoatsSelector.selectById(idSet);
System.debug(JSON.serializePretty(returnedList));

Set<String> stringSet = new Set<String>{'Chala', 'Anatolian'};
List<Boat__c> returnedList = BoatsSelector.selectByName(stringSet);
System.debug(JSON.serializePretty(returnedList));

Set<Id> idSet = new Set<Id>{'a057Q000000n5z4QAA', 'a057Q000000n5ywQAA'};
List<Boat__c> returnedList = BoatsSelector.selectByIdWithMaintenances(idSet);
System.debug(JSON.serializePretty(returnedList));