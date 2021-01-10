# 最近の変更
2021年1月に下記の設定を行いました。  
- 「タンパク質」「脂質」「炭水化物」の入力項目を削除した。  
- 投稿詳細画面にページビュー数を表示した。

上記の設定を実装した理由としましては、下記の2点です。
- 入力項目が多すぎて使いづらいというお声を頂いたため。
- 自分の頑張りが多くの人に見られているとわかれば、よりモチベーションにつながると考えたため。

# 概要
私自身「減量が続かない」という悩みを抱えていた経験から、「減量を継続して成功させたい」ユーザー様のためのアプリを開発しました。    
自らこのアプリを使い、2ヶ月で４キロの減量に成功しました。
 
![PFCMASTERメイン画面](https://user-images.githubusercontent.com/60293887/97381551-aa284580-190c-11eb-9d19-cd793b98c516.png)


#### URL
http://pfcmaster.work/
#### テストアカウント
最初に出てくる画面の「かんたんログイン」をクリックして頂くと、ゲストユーザーとしてログインできます。

# 機能一覧
- ユーザー新規登録, 編集機能
- ログイン・ログアウト機能, 簡単ログイン機能
- 食事記録(食べもの, カロリー, タンパク質, 脂質, 炭水化物, 体重, 文章, 写真)の投稿, 編集, 削除機能
- コメント機能(Ajaxで非同期化)
- いいね機能(Ajaxで非同期化)
- 自動計算機能(ユーザーの体重・体脂肪率から1日のカロリー目安を自動計算)
- グラフ機能(1日ごとの摂取カロリーや体重の推移が確認できるグラフ/ 今日あと何キロカロリー摂取してよいかわかるグラフ)
- フォロー機能
- ページネーション機能
- カレンダー機能（記録した日がわかるカレンダー/ 食べものとカロリーが確認できる）

# 使用言語・使用技術一覧
#### フロントサイド
- Haml  
- Scss  
- jQuery  
- boostrap4  

#### バックエンド
- Ruby 2.5.1  
- Rails 5.2.4.3 

#### ユーザー管理
- devise

#### 画像
- carrierwave

#### グラフ
- chart.js

#### サーバー
- Nginx

#### データベース
- MySQL 5.6.47  

#### テスト
- RSpec

#### インフラ・開発環境
- AWS（VPC, EC2, RDS, IAM, Route53, S3）
- Capistrano
- Docker
- CircleCI

# AWSインフラ構成図
<img src="https://user-images.githubusercontent.com/60293887/97389159-16ab4080-191d-11eb-9348-77b81e2aee13.png">

# ER図  
<img src="https://user-images.githubusercontent.com/60293887/94326084-d59dd480-ffdc-11ea-8f68-b6584a5eb849.png">

# 工夫した点
「どうしたら減量の食事管理を続けやすくなるか？」という問いから逆算して作成しました。

### 「1日何キロカロリー食べればいいかわからない」→「今日あと何キロカロリー食べてもよいかわかる」グラフを実装
新規登録の段階で体重と体脂肪率を入力すると1日の摂取カロリー目安が自動計算されます。
<img src="https://user-images.githubusercontent.com/60293887/97382095-f0ca6f80-190d-11eb-9104-f1a109d116b1.png">

「今日あと何キロカロリー食べても大丈夫か」がわかるグラフを実装しました。  
これによりカロリーコントロールしやすくなると考えました。
<img src="https://user-images.githubusercontent.com/60293887/97382438-c1683280-190e-11eb-832c-3e560c337502.png">

### 「減量が順調に進んでいるのかわからない」→進捗がわかるように「1日ごとのカロリー量・体重を目で終える」グラフを実装
頑張りが目に見えるカタチで確認できるとモチベーションが保ちやすくなると考えました。  
<img src="https://user-images.githubusercontent.com/60293887/97382724-5703c200-190f-11eb-9dc8-fd8f481e8c6e.png">
