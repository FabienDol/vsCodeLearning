public with sharing class Algo01 {
    

    public Algo01() {


    }


    public static List<Account> getAccounts() {

        List<Account> accountList = new List<Account>();

        accountList = [SELECT Id,Name FROM Account WITH SECURITY_ENFORCED ORDER BY CreatedDate Asc];

        System.debug(accountList);

        return accountList;
    }

    // Map<String, List<Account>> getAccountsGroupByType();

    // List<Account> getAccountsByType(String type);

}
