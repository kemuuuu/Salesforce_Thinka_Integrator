@IsTest
public with sharing class THINKA_Integrator_test {
    @IsTest
    static void test_1(){
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
}
