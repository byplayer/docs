# 事前準備

ruby 1.9.1をインストール

gem install eventmachine

TCStrageを使う場合は、TCとRubyのTCバインディングも入れておく。

    gem install roma-commons-xxx.gem --local
    gem install roma-client-xxx.gem --local
    gem install roma.gem --local


# お試し利用
ルーティングテーブルを作成
    mkdir rttable
    rttable
    mkroute localhost_12000 localhost_12001 --enabled_repeathost

    romad localhost -p 12000 -d --enabled_repeathost -nromatest
    romad localhost -p 12001 -d --enabled_repeathost -nromatest

    -p はポート番号
    -d はデーモンモード
    --enabled_repeathost は他のホストのROMAとの連携をしないようにするオプション

    romad localhost -p 12003 -d -jlocalhost_12000  -n romatest


ステータス確認
    telnet localhost 12000
    stat

データをセットして取ってみる
    telnet localhost 12000
    set foo 0 0 3<return>
    bar<return>

    get foo<retnr>
    bar
    END

もちろん別ポートのROMAとも連携している
    telnet localhost 12001
    get foo<retnr>
    bar
    END

 romadの終了
    プロセスを１つずつkill

または、
    telnet localhost 12000
    balse


# 複数サーバで連携
ルーティングテーブルを作成。複数サーバ分をまとめて1台で作る。
romaを起動するホストをroma01, roma02, roma03だとすると

    mkroute roma01_12000 roma01_12001 roma02_12000 roma02_12001 roma03_12000 roma03_12001

roma01_*, roma02_*, roma03_*のファイルは、それぞれ該当のホストへコピー

連携するromaに名前をつけておく
今回は、romatest

    # roma01
    romad roma01 -p 12000 -d -n romatest
    romad roma01 -p 12001 -d -n romatest

    # roma02
    romad roma02 -p 12000 -d -n romatest
    romad roma02 -p 12001 -d -n romatest

    # roma03
    romad roma03 -p 12000 -d -n romatest
    romad roma03 -p 12001 -d -n romatest

# TCバインディングと設定変更

# 既存のものにジョイン
    romad localhost -p 12003 -d -jroma01_12000  -n romatest
