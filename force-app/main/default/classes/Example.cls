public with sharing class Example {
    
    public void registerAccountData(Contact c) {
        THINKA_Integrator integ = new THINKA_Integrator();
        integ.userInfoReg(c.phone, c.name, '', c.Account.BillingAddress, '', '', '', '');
    }
}
