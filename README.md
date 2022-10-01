# Task_Time
<img width="1436" alt="top_page" src="https://user-images.githubusercontent.com/103346206/192193381-d2c8c489-b93f-497b-99da-7df9cbc4acf2.png">. 
<img width="1436" alt="task_lists" src="https://user-images.githubusercontent.com/103346206/192193686-f4ed7bbc-f085-4cb5-bf5d-821354d5baf7.png">. 
<img width="1438" alt="mypage" src="https://user-images.githubusercontent.com/103346206/192193821-c55f4fae-4800-45ac-bd1e-9ebfb4c12775.png">. 



## サイト概要
### サイトテーマ
<.勉強、仕事そして、プライベートでのタスクを管理し、記録するアプリケーションです。.>

### テーマを選んだ理由
<.勉強習慣を確立するために勉強のタスクを自分自身で管理するためのアプリを作成しようと思い、このテーマを選びました。また、ただタスクを記録し管理するだけだと勉強意欲向上やモチベーションが上がらず、このアプリすら使わなくなる恐れがあるため、少しでも楽しくタスクを記録できるアプリを作成するためにゲーム要素を加えました。さらには、幅広い方に使っていただくために勉強だけでなく、仕事やプライベートなどで使用していただける要素に作成しました。.>

## URL: http://34.233.175.176/
【管理者アカウント】
メールアドレス：admin@admin.com  
パスワード：adminadmin

【会員テストアカウント】  
1)  メールアドレス： sasai@sasai.com  
パスワード：  sasaisasai
2)  メールアドレス： sato@sato.com  
パスワード：  satosato
3)  メールアドレス： kato@kato.com  
パスワード：  katokato
4)  メールアドレス： matsumoto@matsumoto.com  
パスワード：  matsumotomatsumoto

### ターゲットユーザ
・勉強を習慣したい方  
・タスクワークに慣れていない方  
・勉強のモチベーションを上げたい方  


## 主な利用シーン
・勉強、仕事とプライベートをタスク化する時. 
Ex）プライベートの場合、「筋トレ　1日10回」等  
・勉強等でモチベーションが上がらない時  

## 設計書
・[画面遷移図](https://app.diagrams.net/#G14FvTt1XZYmvv6UqIOIXSuHBhvN4GMqe5)  
・[テーブル提議書](https://docs.google.com/spreadsheets/d/1nofpEUcKz5oA7co8C4JOU-B0dAHgzcbl/edit#gid=1711571761)  
・[ER図](https://app.diagrams.net/#G1FpkioD-yJzAodXQwFFvwIYPfuId17EQM)

## 機能一覧
* ログイン機能（会員・管理者）
    * 日本語化（devise-i18n） 
* ページネーション機能（kaminari）
    * タスク・フォロー・フォロワー・会員等の一覧ページに実装
* フォロー/フォロワー機能
* 管理者機能
    * 会員退会機能（論理削除）
* 投稿機能
    * カレンダー機能（タスクをカレンダーで管理）
* コード解析（Rubocop）

## フロントエンド
* Bootstrap 4.5  
* JavaScript、jQuery

## バックエンド
* Ruby 3.1.2
* Rails  6.1.6.1  
  
## 開発環境
・ OS：Linux(CentOS)　　  
・言語：HTML,CSS,JavaScript,Ruby,SQL　　    
・フレームワーク：Ruby on Rails.   
・JSライブラリ：jQuery   
・IDE：Cloud9. 

## 本番環境
・AWS（EC2、RDS for MySQL、EIP、Route53）.  
・Nginx、Puma

## テスト
* [テスト仕様書](https://docs.google.com/spreadsheets/d/1BJ00L3PLijLij4F0HFMXfPaGjsCOOtZO/edit#gid=2072448154)

## 使用素材
*　[Pixabay](https://pixabay.com/ja/)
