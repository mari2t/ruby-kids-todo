# MakeLog

## 2024/1/21

1. 過去のTODOの日にちでの一括削除
   1. tasks_controllerにdef destroy_by_dateを追加
   2. past_tasks.html.erbに<%= link_to 'この日のタスクを削除'～を追加
   3. routes.rbにdestroy_by_dateを追記
   4. linkだとdestroy出来なかった（Getを送信していた）がbuttonにしたら出来た。
2. 1/15に発生した更新後inputやbuttonが残ってしまうエラーの原因が判明。  
   past*tasks.html.erbのファイル名にhtmlが抜けていたからだった。  
   1でpast_tasksのビューファイル名を手打ちしようと思ってよく見たときにファイル名にhtmlが抜けていたので気が付いた。  
   試しにapplication.jsのimport "@hotwired/turbo-rails"; を戻してhtmlをファイル名から抜いてみたらエラーが再現し、  
   htmlをファイル名に追記したらエラーが出なかった。原因がわかってよかった (;^*^=3
3. 2でapplication.jsのimport "@hotwired/turbo-rails"; を戻したけど、戻した方がページの移り変わりが早くなった。

## 2024/1/20

1. 過去のTODOの日にちでの一括削除
   1. gem 'kaminari' (Gemfileに追記)
   2. bundle install

## 2024/1/19

1. 設定で背景の画像変更をできるようにした。
2. 画像の課題
   1. 一枚絵を表示しているのでいままでのやることページが長くなると画像が荒くなる
   2. 画像によっては一部文字が全く見えない
3. 画像の課題解決候補
   1. ページネーション実装
   2. 過去のTODOの日にちでの一括削除
   3. CSS整備（無駄に長くなってしまった）

## 2024/1/18

1. アプリタイトルからルートへのリンク貼り
2. 設定によって背景色が変わるように変更

## 2024/1/17

1. コメント追加及び編集後いままでのやることページの上にinputやbuttonが残った状態に対応（引き続き）
   1. Javascriptがあると影響するということで消してみた→影響なし
   2. application.jsのimport "@hotwired/turbo-rails"; を削除→エラーが消えた
2. 上記変更による変更事象  
   削除前：turbo.es2017-esm.js:520 Fetch finished loading: GET  
   削除後：Navigated to http://localhost:3000/

## 2024/1/16

1. コメント追加及び編集後いままでのやることページの上にinputやbuttonが残った状態に対応
   1. rails c → Comment.all.each { |comment| puts comment }でデータを確認。→おかしいところはない
   2. rails routesでルート確認。→リダイレクトのルーティングはOK
   3. task.rbに不要なコメントとの関連付けがあったので削除→影響なし
2. エラー整理
   1. commentを作成か更新するとinput及びbuttonが残ってしまう。
   2. このエラーが起きると、他のページへ遷移するとそのページのHTML+past_taskのHTMLが表示される。  
      ページ遷移するとinput及びbuttonは消える。
   3. commentを更新するたびに更新回数n回分past_taskのHTMLが表示される。

## 2024/1/15

1. いままでのやることページを最新日の日付順で並べるようにした
2. コメント追加及び編集後いままでのやることページの上にinputやbuttonが残った状態に対応中。

## 2024/1/14

1. comment機能作成
2. 設定画面はランダムな数式を解かないとアクセスできない、を実現すべくapplication.jsに関数追加
3. 関数が読み込めなかったのでグローバルスコープに置いた  
   修正前：function mathChallenge()  
   修正後：window.mathChallenge = function ()

## 2024/1/13

1. @を付けるとビューで使える変数になる。
2. 未完了のタスク表示をTrueにしても表示されない。
   1. Setting.last.show_uncompleted_todosの値が間違っている？  
      →rails console→Setting.allで確認した。  
      Settingsには一つのレコードしかなくshow_uncompleted_todosの値は指定の値になっていた。
   2. 未完了のタスクが無いから表示されない？  
      →rails console→Tasks.allで確認した。未完了のタスクが無かった…。  
      と思ったけどrailsでのコンソール出力は初期設定だと11レコードの制限があるらしい。  
      →Task.all.each { |task| puts task }で一つずつすべてのタスクを表示したら  
      未完了のタスクがあった。
   3. 解決！completion_date が今日以前の日付を取得していたが、  
      未完了だとcompletion_dateがnillになっていたので取得できていなかった。
3. これまでのやることの日付ごとのグループがおかしい。  
   〇　group_by { |task| task.completion_date }  
   ✕　group_by { |task| task.created_at.to_date } ※.to_dateで日付型にする

## 2024/1/10

1. settingのshow_uncompleted_todosによって画面表示を変更出来るように修正中

## 2024/1/9

1. きょうのやることに今日作ったタスクを表示するようにコントローラーを設定
2. これまでのやることに日付事グループして表示するように設定

## 2024/1/8

1. きょうのタスクを10個に制限
2. ごほうびにリンクを追加
3. app/views/layouts/application.html.erbにてヘッダーを設定
4. いままでのやることページを追加

## 2024/1/7

1. seedファイルの確認
   1. bin/rails db:seed　で確認→エラーなし
   2. rails console→Setting.allでSettingsのデータを確認したところ二つidがあり、  
      一つ目が空データで二つ目がseedファイルで更新されていた。
2. Setting.first.destroy で空データを削除。seedファイルの設定が表示された。  
   更新もできる状態。
3. seedファイル作成前にデータがあった、または Setting.createを使用しているから等が原因だったみたい。  
   createの代わりに既存レコードを更新するfind_or_create_byというのもある。  
   ただ、今回はこれでいったん進める。

## 2024/1/6

1. settingsのeditページ作成
2. localhost:3000/rails/info/routes でルーティング設定を確認できる
3. SQLiteの中身の確認(Settingsテーブルのseedが反映されていないようだったので確認)
   1. rails db
   2. SELECT \* FROM settings; ※コロンを忘れずに、Shift+Insertでペースト
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
3. フォーマッターを導入。rbファイルとerbファイル用。1時間くらいかかったけど見やすくなった ;^\_^ =3

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
