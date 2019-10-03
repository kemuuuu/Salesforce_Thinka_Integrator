public with sharing class Scheduler implements Schedulable {
    public void execute(SchedulableContext sc) {
        Example.historySearch('2019-09-26');
    }
}
