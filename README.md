# arkmanager auto shutdown tool
Ark: Survival EvolvedのLinuxサーバーのツールである[arkmanager](https://github.com/arkmanager/ark-server-tools)を使用してサーバーを立ち上げ、プレイヤーが遊んでいなければ自動でサーバーを停止させるツールです。  

# 概要
arkmanagerの機能でサーバーの状態を監視し、プレイヤーがいなくなった場合には自動的にサーバーを停止させます。  
初回接続が行われるまでは30分間、プレイヤーが接続した後には5分間誰も接続していなければ、サーバーを停止させます。  

# 使い方
arkmanagerでのサーバーの設定後、autodown_start.shを実行。  
サーバーの起動から監視までを開始します。  
サーバーの監視はバックグラウンドで行われます。  
