---
title: AccessでVBAコードを使ってテーブルリンクを再作成する方法
display_order: 20
created: 2020-10-14
updated: 2020-10-15
---
Accessでテーブルリンクを作成する場合、ローカルPCに設定したDSNを使って設定したりできますが、  
個人的に使うような用途以外で、複数人のPCで利用するようなAccessファイルを作成した場合に、  
あちらのPCにDNS設定が入っていないから動かないといったような事が起こり問題となることがあります。  
個別にDSN設定をしてもらえる場合はまだいいですが、そうでない場合、  
以下に示すようなVBAコードでDSNなしのテーブルリンク設定をすることができます。  
(SQL Serverへのテーブルリンクを想定しています)
