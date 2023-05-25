trigger AccountExtensoTrigger on Account (before insert, before update) {
    for(Account acc : Trigger.New){
        acc.Valor_Extenso__c = AccountHandler.geraExtenso(acc.Valor_Medio__c);
    }
}