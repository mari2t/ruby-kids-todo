# MakeLog

## 2024/1/6

1. settingsのeditページ作成
2. localhost:3000/rails/info/routes でルーティング設定を確認できる
3. SQLiteの中身の確認(Settingsテーブルのseedが反映されていないようだったので確認)
   1. rails db
   2. SELECT * FROM settings; ※コロンを忘れずに、Shift+Insertでペースト
   3. 出力　1||||||ｓ|||||0||2024-01-05 10:40:38.670922|2024-01-05 11:55:19.094200
   4. 反映されていない？上書きされた？で空の状態が判明
   5. .quitで終了

## 2024/1/5

1. settingsのコントローラ作成。rails generate controller Settings
2. settingsという名前は特定の名前と被りそうだから次回は避けた方が良いかも?
3. コントローラーのファイル名は複数形にする
4. @setting変数がnilというエラーのためseedファイルに追記
5. 初期データをデータベースにロードする　bin/rails db:seed
6. localhost:3000/settingでRouting Error

## 2024/1/4

1. controller と view を作成。コマンドで二つ同時に作成される。  
   （例）rails generate controller Tasks
2. サーバー立ち上げは rails s でも可能
3. フォーマッターを導入。rbファイルとerbファイル用。1時間くらいかかったけど見やすくなった ;^_^ =3

## 2024/1/3

1. DB を変更したので変更手順メモ
   1. マイグレーションファイルの生成  
      rails generate migration RemoveEmojiFromTasks emoji:string  
      rails generate migration RenameDisplayInHiraganaInSettings
   2. マイグレーションファイルの編集  
      生成されたファイルに対して適宜変更する部分のコードを追記
   3. rails db:migrate

## 2024/1/1

1. 作成
2. PlanLog に概要、仕様、DB 等書いていく
3. model 作成。下記は Task テーブル。  
   rails generate model Task title:string content:text deadline:date emoji:string completed:boolean completion_date:date
4. マイグレーションファイルはテーブルごとに作成した。（可読性、独立性、ロールバックのしやすさ等）
5. テーブル作成後、rails db:migrate で schema.rb が作成された。
