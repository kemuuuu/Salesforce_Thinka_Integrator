# SalesforceシンカCTI連携
## 準備
1. カスタム表示ラベルを2つ用意してください。 

|名前|値|
|:----|:----|
|THINKA_ID|シンカCTIの顧客ID|
|THINKA_SECRET|シンカCTIのSecretLetter|

2. 下記キャプチャを参考に「リモートサイトの設定」をしてください。
  
![リモートサイトの設定](./remote_site_setting.png)

3. ソースを環境にアップロードしてください。

## 使い方
連携クラスのインスタンスを生成して
```Apex
THINKA_Integrator integrator = new THINKA_Integrator();
```
使いたいメソッドを呼び出します。
```Apex
integrator.userSearch('山田', 0, 100);
```
結果はすべて THINAK_IntegrateDTO のインスタンスで返されます。
```Apex:THINKA_IntegrateDTO
public with sharing class THINKA_IntegrateDTO {
    public Boolean isSuccess = true;
    public String msg;
    public List<String> data;
}
```
