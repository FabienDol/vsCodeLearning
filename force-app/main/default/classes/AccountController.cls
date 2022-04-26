public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts() {
        List<Account> listAccount = [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes' WITH SECURITY_ENFORCED];
        return listAccount;
    }
}