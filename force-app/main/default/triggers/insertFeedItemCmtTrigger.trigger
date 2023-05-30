trigger insertFeedItemCmtTrigger on Contact (after insert,after Update,before Delete) {
    if(trigger.isInsert || trigger.isupdate){
        insertFeedItemCmtTriggerHandler.insertFeedMessage(trigger.New);
    }
    else if(trigger.isdelete){
        insertFeedItemCmtTriggerHandler.deleteContact(trigger.old);
    }

}