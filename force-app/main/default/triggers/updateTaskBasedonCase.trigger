trigger updateTaskBasedonCase on Account (after insert, after update) {
    
     Set<Id> accIds = new Set<Id>();
     Set<case> caseIds = new Set<case>();
     List<Task> updatetsk = new List<Task>();

     for(Account accObj : Trigger.new)
     {
        //if(accObj.NumberofLocations__c == 0)
           accIds.add(accObj.Id);
     }
     
     List<Case> csList = [Select Id, accountID, Subject from Case where accountId In : accIds AND Subject = 'Test InsertCase&Task' LIMIT 1];
     
     for(Case csObj : csList)
     {
        if(csObj.Subject == 'Test InsertCase&Task')
           caseIds.add(csObj);
     }
     
     List<Task> tskList = [Select ID, Status from task where whatId IN : caseIds /*AND Status = 'Open'*/];
     
     for(Task tskObj : tskList)
     {
         tskObj.Status = 'Completed';
         updatetsk.add(tskObj);
     }
     
         update updatetsk;

}