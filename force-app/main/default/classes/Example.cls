public with sharing class Example {

    /**
     * シンカCTIに更新情報を連携する
     */
    public static void registerContactOnThinka(Contact rec) {
        // 住所用意
        String addr = rec.MailingPostalCode;
        addr += rec.MailingCountry;
        addr += rec.MailingState;
        addr += rec.MailingCity;
        addr += rec.MailingStreet;
        // 自由項目
        THINKA_JSONGenerator gen = new THINKA_JSONGenerator().setRecord(rec).setFields(new List<String>{'id', 'LastName', 'Birthdate', 'Description'});
        String infoJSON = gen.generateJSON();
        // シンカCTIにデータを連携
        THINKA_Integrator integrator = new THINKA_Integrator();
        THINKA_IntegrateDTO result = integrator.userInfoReg(rec.Phone, rec.LastName, '', addr, '', String.valueOf(rec.Birthdate), rec.Description, infoJSON);
        if (result.isSuccess) {
            // 正常終了
        } else {
            // 異常終了
            System.debug(result.msg);
        }
    }

    /**
     * シンカCTIの顧客情報をキーワード検索する
     */
    public static void searchUser(String searchText) {
        THINKA_Integrator integrator = new THINKA_Integrator();
        THINKA_IntegrateDTO result = integrator.userSearch(searchText, 0, 100);
        if (result.isSuccess) {
            // 正常終了
            System.debug(result.data);
        } else {
            // 異常終了
            System.debug(result.msg);
        }
    }

    /**
     * 着信履歴を検索する
     */
    @future(callout=true)
    public static void historySearch(String searchText) {
        THINKA_Integrator integrator = new THINKA_Integrator();
        THINKA_IntegrateDTO result = integrator.historySearch(searchText, 0, 100);
    }
}
