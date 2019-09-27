public with sharing class Example {
    /**
     * シンカCTIに更新情報を連携する
     */
    public void registerContactOnThinka(Contact rec) {
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
        } else {
            // 異常終了
            System.debug(result.msg);
        }
    }
}
