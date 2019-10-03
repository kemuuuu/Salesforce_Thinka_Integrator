public with sharing class THINKA_IntegrateController {
    
    @AuraEnabled
    public static string registerOnThinka(string recordId){
        Contact rec = [
                        SELECT 
                            id, 
                            MailingPostalCode, 
                            MailingCountry, 
                            MailingState, 
                            MailingCity, 
                            MailingStreet, 
                            Phone, 
                            LastName,
                            Birthdate, 
                            Description 
                        FROM Contact 
                        WHERE Id = :recordId ];
        // 住所用意
        String addr = rec.MailingPostalCode;
        addr += rec.MailingCountry;
        addr += rec.MailingState;
        addr += rec.MailingCity;
        addr += rec.MailingStreet;
        // シンカCTIにデータを連携
        THINKA_Integrator integrator = new THINKA_Integrator();
        THINKA_IntegrateDTO result = integrator.userInfoReg(rec.Phone, rec.LastName, '', addr, '', String.valueOf(rec.Birthdate), rec.Description, '');
        if (result.isSuccess) {
            // 正常終了
            return '';
        } else {
            // 異常終了
            System.debug(result.msg);
        }
        return result.msg;
    }
}
