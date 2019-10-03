@IsTest
public with sharing class THINKA_Integrator_test {
    @IsTest
    static void test_1() {
        THINKA_Integrator integ = new THINKA_Integrator();
        Test.startTest();
        integ.userSearch('09011111111', 0, 100);
        integ.userInfoGet('');
        integ.userInfoReg('','','','','','','','');
        integ.userInfoDel('');
        integ.historySearch('', 0, 100);
        integ.historyReg('','','','');
        integ.telMemoGet('');
        Test.stopTest();
    }
    @IsTest
    static void test_2() {
        Account a = new Account(name='ds');
        insert a;
        THINKA_JSONGenerator gen = new THINKA_JSONGenerator().setRecord(a).setFields(new List<String>{'id','name'});
        String infoJSON = gen.generateJSON();
    }
}
