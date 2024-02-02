# README

## Overview

子供用TODOアプリです。  
This is a TODO application for children.

## Example

### ![example1.png](/app/assets/images/example1.png "example1.png")

### ![example2.png](/app/assets/images/example2.png "example2.png")

### ![example3.png](/app/assets/images/example3.png "example3.png")

## Features

- Ruby on Rails

## Creation Date

2024/1/27

## Log

- [設計ログ](./PlanLog.md)
- [作成ログ](./MakeLog.md)
- [作成後ログ](./MadeLog.md)

## Purpose of creation

1. やることについて、子供自身が予定を立てたり実行する習慣をつけさせたい
2. 実行後の振り返りをしたりコメントを付けたい
3. Ruby on Rails のアプリをつくってみたい

## Specification

1. やること（TODO） 設定
   1. 今日の やること を作成できる。
   2. やること は 1 日に最大 10 個まで登録できる。
2. 今日の やること画面
   1. やること のチェックができ、状況を把握することができる。
   2. やること が完了すると ごほうび ボタンが押せるようになる。 ごほうび ボタンを押すと特定のページが開く。
3. これまでの やること画面
   1. これまでの やること を見ることができる。
   2. 日ごとにコメントを書くことができる。
4. アプリの設定画面
   1. ごほうび ボタンの URL を設定できる。
   2. 背景等の設定をする。
   3. 設定画面はランダムな1桁の掛け算を解かないとアクセスできない。
