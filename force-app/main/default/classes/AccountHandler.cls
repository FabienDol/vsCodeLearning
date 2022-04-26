public with sharing class AccountHandler {
    public AccountHandler() {

    }

    public static void insertAccount (Integer accountsNumber) {

        List<Account> addAccounts = new List<Account>();
        Integer counter = 1;

        while (counter <= accountsNumber){

        Account acc = new Account();
        acc.Name = 'Acme Inc ' + counter;
        acc.AccountNumber =  'A000' + counter;
        counter++;
        }

        insertAccount(2);

        insert addAccounts;

    }

}
