trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> ltask = new List<Task>();
    
    for(Opportunity opp : Trigger.New){
        if(opp.StageName == 'Closed Won'){
            Task tsk = new Task(
            	Subject = 'Follow Up Test Task',
                WhatId = opp.Id
            );
            ltask.add(tsk);
        }
    }
    if(ltask.size() > 0){
        insert ltask;
    }
}