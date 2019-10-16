public with sharing class THINKA_JSONGenerator {

    final String startObj = '{';
    final String endObj = '}';
    final String colon = ':';
    final String doubleQuote = '\"';
    final string comma = ',';

    SObject record;
    List<String> fields;
    Map<String,String> infoJsonMap;

    public THINKA_JSONGenerator() {
        fields = new List<String>();
        infoJsonMap = new Map<String, String>();
    }

    public THINKA_JSONGenerator setRecord(SObject record) {
        this.record = record;
        return this;
    }

    public THINKA_JSONGenerator setFields(List<String> fields) {
        this.fields = fields;
        return this;
    }

    public string generateJSON() {
        String jsonStr = '';
        // BEGIN depth1
        jsonStr += startObj;
        for (Integer i=0; i<fields.size(); i++) {
            // 対象項目名
            String fieldName = this.fields.get(i);
            // 初回以外はカンマを先頭につける
            if (jsonStr != startObj) jsonStr += comma;
            // カラム番号
            jsonStr += doubleQuote + String.valueOf(i+1) + doubleQuote;
            jsonStr += colon;
            // BEGIN depth2
            jsonStr += startObj;
            jsonStr += doubleQuote + fieldName + doubleQuote;
            jsonStr += colon;
            jsonStr += doubleQuote + record.get(fieldName) + doubleQuote;
            // END depth2
            jsonStr += endObj;
        }
        // END depth1
        jsonStr += endObj;
        return jsonStr;
    }
}
