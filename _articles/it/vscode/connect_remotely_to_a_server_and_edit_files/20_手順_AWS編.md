---
chapter_no: 20
chapter_title: 手順（AWS編）
created: 2022-12-21
updated: 2022-12-21
---
### 1. 前提
- Visual Studio Codeはインストール済みである。
- AWS EC2でサーバ(Amazon Linux)を立て終わっている。
  - プライベートキーファイル(pem)をゲット済みである。

### 2. Remote Developmentを導入する	
- `表示 -> 拡張機能`で`Remote Development`を検索しインストールします。
<p class="center size-6" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20221221/20221221185409.png)  
</p>

### 3. Windowsの場合
- SSHエージェントを有効化しておく必要があります。
- PowerShellを管理者権限で実行し、以下を入力します。
```output
> Set-Service ssh-agent -StartupType Automatic
> Start-Service ssh-agent
```
- `ssa-agent`が起動しているを確認します。
```output
> Get-Service ssh-agent

Status   Name               DisplayName
------   ----               -----------
Running  ssh-agent          OpenSSH Authentication Agent
```

### 4. SSHエージェントの設定

#### コンフィグファイルを開く
- Visual Studio Code上で`F1`を押し、`Remote-SSH:Open Configuration File...`を開きます。
- コンフィグファイルが複数表示された場合は、自分の環境に合わせて選択してください。
- 私の自分の環境では、`C:\Users\fumo\.ssh\config`でした。（ユーザ配下に.sshを作成）

### コンフィグファイルを編集する

```:C:\Users\fumo\.ssh\config
Host {em{AWS_Server1}em}
    HostName {em{xxx.xxx.xxx.xxx}em}
    IdentityFile {em{"C:\Users\fumo\.ssh\Server1-key.pem"}em}
    User {em{ec2-user}em}
```
- Hostは認識しやすい名前を指定します。
- HostNameはサーバの`パブリック IPv4 アドレス`を指定します。
- IdentityFileには`pem`ファイルへのパスを指定します。
- AWS EC2なのでユーザ名は`ec2-user`でOKです。

### 5. SSH接続する
- Visual Studio Code上で`F1`を押し、`Remote-SSH:Connect to Host...`を開きます。
- コンフィグファイルで指定したホストが出てくると思うので、それを選択します。
- `Select the platform of the remote host "ホスト名"`と出てきたら、`Linux`を選択します。
- Visual Studio Codeのウィンドウ左下が`>< SSH: ホスト名`となったら接続成功しています。
<p class="center size-2" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20221221/20221221185413.png)  
</p>

### 6. 操作など

#### 以後簡単に接続する
- サイドバーの`Remote Explorer`を選択し、種類から`Remote`を選択すると、`SSH`というカテゴリがあります。
- そちらを開くと、ホストが出てきますので、そこで接続などができるようになります。
<p class="center size-5" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20221221/20221221185416.png)  
</p>

#### コマンド実行（ターミナル）
- `Ctrl + @`でターミナルを開くと、AWS EC2のコンソールへと繋がりますので、お好きなコマンドを実行できます。
<p class="center size-6" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20221221/20221221185420.png)  
</p>

#### Visual Studio Codeのファイルエクスプローラでファイル編集する
- サイドバーで`Explorer`を選択し、`Open Folder`で`ec2-user`のhomeディレクトリ(`/home/ec2-user/`)などを開いてファイル編集可能です。
<p class="center size-6" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20221221/20221221185424.png)  
</p>
- `File -> Auto Save`とかをONにしておくとかなり便利です。

以上