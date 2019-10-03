public with sharing class THINKA_JSONGenerator {

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
        JSONGenerator gen = JSON.createGenerator(false);
        for (Integer i=0; i<fields.size(); i++) {
            String fieldName = this.fields.get(i);
            // BEGIN depth1
            gen.writeStartObject();
            gen.writeFieldName(String.valueOf(i));
            // BEGIN depth2
            gen.writeStartObject();
            gen.writeStringField(fieldName, String.valueOf(record.get(fieldName)));
            // END depth2
            gen.writeEndObject();
            // END depth1
            gen.writeEndObject();
        }
        String ret = gen.getAsString();
        System.debug(ret);
        return ret;
    }
}
