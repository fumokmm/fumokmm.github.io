---
title: Gradleのタスク間の処理順序
display_order: 20
created: 2021-05-08
updated: 2021-05-08
---
- とあるタスクAとタスクBがあったとき、この二つのタスクの実行時の依存関係を定義したい時があります。
- 例えばJavaのビルドなどで、Jarを作る前にはコンパイルが終わっている前提であるとかです。
- そんな時、Gradleでは[dependsOn](#depends-on)を使います。
