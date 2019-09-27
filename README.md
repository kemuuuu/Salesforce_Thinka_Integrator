# SalesforceシンカCTI連携
## 準備
1. カスタム表示ラベルを2つ用意  

|名前|値|
|:----|:----|
|THINKA_ID|シンカCTIの顧客ID|
|THINKA_SECRET|シンカCTIのSecretLetter|

2. 下記キャプチャを参考に「リモートサイトの設定」  
  
![リモートサイトの設定](./remote_site_setting.png)

3. ソースを環境にアップロード  

## 使い方
連携クラスのインスタンスを生成して
```Apex
THINKA_Integrator integrator = new THINKA_Integrator();
```
使いたいメソッドを呼び出す。
```Apex
integrator.userSearch('山田', 0, 100);
```
結果はすべて THINKA_IntegrateDTO のインスタンスで返される。
```Apex:THINKA_IntegrateDTO
public with sharing class THINKA_IntegrateDTO {
    public Boolean isSuccess = true;
    public String msg;
    public List<String> data;
}
```
