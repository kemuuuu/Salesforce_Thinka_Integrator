public with sharing class THINKA_Integrator {

    private String sig;
    private String userId = System.label.THINKA_ID;
    private String userSecret = System.label.THINKA_SECRET;
    private THINKA_IntegrateDTO result;

    /**
     * コンストラクタ
     * sig(THINKA認証情報)生成
     */
    public THINKA_Integrator() {
        sig = EncodingUtil.convertToHex(Crypto.generateDigest('md5', Blob.valueOf(userId+'+'+userSecret))).mid(4,16);
    }

    /**
     * 顧客検索(キーワード検索)
     * @param searchText 検索文字列
     * @param offset
     * @param maxcount 読み取り最大件数
     * @return 取得したレコードのJSONリスト
     */
    public THINKA_IntegrateDTO userSearch(String searchText, Integer offset, Integer maxCount) {
        // 処理結果初期化
        result = new THINKA_IntegrateDTO();
        // 送信データ作成
        String payload = '';
        payload += 'method=' + urlEncodeUtf8('User.search');
        payload += '&id=' + urlEncodeUtf8(userId);
        payload += '&sig=' + sig;
        payload += '&s_text=' + urlEncodeUtf8(searchText);
        payload += '&offset=' + String.valueOf(offset);
        payload += '&max_cnt=' + String.valueOf(maxCount);
        // Httpリクエスト
        String data = basicThinkaCallout('application/x-www-form-urlencoded', payload);
        // レスポンス解析
        if (data == null) {
            result.isSuccess = false;
            result.msg = 'データがありません';
        } else {
            result.isSuccess = true;
            result.data = generateThinkaDataList(data);
        }
        return result;
    }

    /**
     * 顧客情報取得(電話番号検索)
     * @param tel 取得対象の電話番号
     * @return 項目ごとのJSONのリスト。は？ てなる
     */
    public THINKA_IntegrateDTO userInfoGet(String tel) {
        // 処理結果初期化
        result = new THINKA_IntegrateDTO();
        // 送信データ作成
        String payload = '';
        payload += 'method=' + urlEncodeUtf8('UserInfo.get');
        payload += '&id=' + urlEncodeUtf8(userId);
        payload += '&sig=' + sig;
        payload += '&tel=' + urlEncodeUtf8(tel);
        // Httpリクエスト
        String data = basicThinkaCallout('application/x-www-form-urlencoded', payload);
        if (data == null) {
            result.isSuccess = false;
            result.msg = 'データがありません';
        } else {
            result.isSuccess = true;
            result.data = generateThinkaDataList(data);
        }
        return result;
    }

    /**
     * 顧客情報登録
     * @param tel 電話番号
     * @param name 名前
     * @param kana 名前カナ
     * @param addr 住所
     * @param sex 性別
     * @param d_o_b 誕生日
     * @param status 顧客状態
     * @param info_json 自由登録項目
     */
    public THINKA_IntegrateDTO userInfoReg(String tel, String name, String name_kana, String addr, String sex, String d_o_b, String status, String info_json) {
        // 処理結果初期化
        result = new THINKA_IntegrateDTO();
        // 送信データ作成
        String payload = '';
        payload += 'method=' + urlEncodeUtf8('UserInfo.reg');
        payload += '&id=' + urlEncodeUtf8(userId);
        payload += '&sig=' + sig;
        payload += '&tel=' + urlEncodeUtf8(tel);
        if (name != '') payload += '&name=' + urlEncodeUtf8(name);
        if (name_kana != '') payload += '&name_kana=' + urlEncodeUtf8(name_kana);
        if (addr != '') payload += '&addr=' + urlEncodeUtf8(addr);
        if (sex != '') payload += '&sex=' + urlEncodeUtf8(sex);
        if (d_o_b != '') payload += '&d_o_b=' + urlEncodeUtf8(d_o_b);
        if (status != '') payload += '&status=' + urlEncodeUtf8(status);
        if (info_json != '') payload += '&info_json=' + urlEncodeUtf8(info_json);
        // Httpリクエスト
        basicThinkaCallout('application/x-www-form-urlencoded', payload);
        result.isSuccess = true;
        return result;
    }

    /**
     * 顧客情報削除
     * @param tel 削除対象データの電話番号
     */
    public THINKA_IntegrateDTO userInfoDel(String tel) {
        // 処理結果初期化
        result = new THINKA_IntegrateDTO();
        // 送信データ作成
        String payload = '';
        payload += 'method=' + urlEncodeUtf8('UserInfo.del');
        payload += '&id=' + urlEncodeUtf8(userId);
        payload += '&sig=' + sig;
        payload += '&tel=' + urlEncodeUtf8(tel);
        // Httpリクエスト
        basicThinkaCallout('application/x-www-form-urlencoded', payload);
        result.isSuccess = true;
        return result;
    }

    /**
     * 着信履歴検索(キーワード検索)
     * @param searchText 検索文字列
     * @param offset
     * @param maxcount 読み取り最大件数
     * @return 取得したレコードのJSONリスト
     */
    public THINKA_IntegrateDTO historySearch(String searchText, Integer offset, Integer maxCount) {
        // 処理結果初期化
        result = new THINKA_IntegrateDTO();
        // 送信データ作成
        String payload = '';
        payload += 'method=' + urlEncodeUtf8('Hist.search');
        payload += '&id=' + urlEncodeUtf8(userId);
        payload += '&sig=' + sig;
        payload += '&s_text=' + urlEncodeUtf8(searchText);
        payload += '&offset=' + String.valueOf(offset);
        payload += '&max_cnt=' + String.valueOf(maxCount);
        // Httpリクエスト
        String data = basicThinkaCallout('application/x-www-form-urlencoded', payload);
        if (data == null) {
            result.isSuccess = false;
            result.msg = 'データがありません';
        } else {
            result.isSuccess = true;
            result.data = generateThinkaDataList(data);
        }
        return result;
    }

    /**
     * 着信履歴登録
     * @param tel 電話番号
     * @param tel_recv 自番号
     * @param call_time 着信日時 yyyy-MM-dd HH:mm:ss
     * @param type in | out
     */
    public THINKA_IntegrateDTO historyReg(String tel, String tel_recv, String call_time, String type) {
        // 処理結果初期化
        result = new THINKA_IntegrateDTO();
        // 送信データ作成
        String payload = '';
        payload += 'method=' + urlEncodeUtf8('Hist.reg');
        payload += '&id=' + urlEncodeUtf8(userId);
        payload += '&sig=' + sig;
        payload += '&tel=' + urlEncodeUtf8(tel);
        payload += '&tel_recv=' + urlEncodeUtf8(tel_recv);
        payload += '&call_time=' + urlEncodeUtf8(call_time);
        payload += '&type=' + urlEncodeUtf8(type);
        // Httpリクエスト
        basicThinkaCallout('application/x-www-form-urlencoded', payload);
        result.isSuccess = true;
        return result;
    }

    /**
     * 電話メモ取得
     * @param tel 電話番号
     */
    public THINKA_IntegrateDTO telMemoGet(String tel) {
        // 処理結果初期化
        result = new THINKA_IntegrateDTO();
        // 送信データ作成
        String payload = '';
        payload += 'method=' + urlEncodeUtf8('TelMemo.get');
        payload += '&id=' + urlEncodeUtf8(userId);
        payload += '&sig=' + sig;
        payload += '&tel=' + urlEncodeUtf8(tel);
        // Httpリクエスト
        String data = basicThinkaCallout('application/x-www-form-urlencoded', payload);
        if (data == null) {
            result.isSuccess = false;
            result.msg = 'データがありません';
        } else {
            result.isSuccess = true;
            result.data = generateThinkaDataList(data);
        }
        return result;
    }

    /**
     * HTTP Request Util
     * @param contentType HTTPヘッダーに含めるContent-Type
     * @param payload 送信するURLEncode済みデータ
     * @return レスポンスJSON
     */
    private String basicThinkaCallout(String contentType, String payload){
        String retData;
        try {
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://n.thincacti.com/WebAPI/');
            req.setMethod('POST');
            req.setHeader('Content-Type', contentType);
            req.setBody(payload);
            Http http = new Http();
            HTTPResponse res = http.send(req);

            if (res.getStatusCode() == 200) {
                // レスポンスJSON取得
                String resJSON = res.getBody();                
                // THINKA api レスポンスコード
                Map<String, Object> resMap = (Map<String, Object>)JSON.deserializeUntyped(resJSON);
                Integer resp_code = Integer.valueOf(resMap.get('resp_code'));
                if (resp_code == 400) throw new ThinkaException('method, id, sigが未設定 もしくは IDが不正 もしくはデータが不正');
                else if (resp_code == 401) throw new ThinkaException('sigが不正');
                else if (resp_code == 404) throw new ThinkaException('methodが不正');
                // レスポンスデータ取得
                retData = JSON.serialize(resMap.get('resp_data'));
            } else {
                throw new ThinkaException('HTTPリクエストが異常終了');
            }
        } catch(Exception e) {
            result.isSuccess = false;
            result.msg = e.getMessage();
            System.debug('Exception Cause: ' + e.getCause());
            System.debug('Exception Line number: ' + e.getLineNumber());
            System.debug('Exception Message: ' + e.getMessage());
        }
        return retData;
    }

    /**
     * レスポンスデータから取得したレコードをJSONのリストに変換する
     * @param data ThinkaApiからのレスポンスデータ
     */
    private List<String> generateThinkaDataList(String data) {
        Map<String, Object> dataMap = (Map<String, Object>)JSON.deserializeUntyped(data);
        List<String> records = new List<String>();
        Integer count = 1;
        do {
            Object record = dataMap.get(String.valueOf(count));
            if (record == null) {
                break;
            } else {
                records.add(JSON.serialize(record));
                count++;
            }
        } while (true);
        return records;
    }

    private String urlEncodeUtf8(String target) {
        return EncodingUtil.urlEncode(target, 'UTF-8');
    }

    private class ThinkaException extends Exception {}

}
