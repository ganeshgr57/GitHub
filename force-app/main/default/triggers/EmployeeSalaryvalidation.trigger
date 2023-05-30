trigger EmployeeSalaryvalidation on Employee__c (before insert,before update){
    if(trigger.isinsert)
    {
    for(Employee__c Emp : trigger.new)
    {
        if(Emp.Salary__c==0 || Emp.Salary__c==Null)
          Emp.adderror('You can not create new record without salary');
    }
    }
    if(trigger.isupdate)
    {
    for(Employee__c Emp : trigger.new)
    {
        if(Emp.Salary__c==0 || Emp.Salary__c==Null)
          Emp.adderror('You can not update existing record without salary');
    }
    }

}