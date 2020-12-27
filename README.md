# shinchoku-tairiku.satyh

進捗大陸で使用された SATySFi クラスライブラリ

- [進捗大陸06](../../tree/book06)
- [進捗大陸05](../../tree/book05)

## インストール

opam でインストールできます。satyrographos-repo にはアップロードされていません。

```
git clone git://github.com/shinchoku-tairiku/shinchoku-tairiku.satyh
cd shinchoku-tairiku.satyh
opam pin add satysfi-class-shinchoku-tairiku .
```

## 使い方

```
@require: class-shinchoku-tairiku/shinchoku-tairiku

document '<
  +p{
    satysfi-class-shinchoku-tairikuはサークル進捗大陸で使用しているクラスライブラリです。
  }
> '<
  +chapter?*{章タイトル}{謎の名言}<
    +p{
      これは章
    }
    +section{セクション}<
      +p{
        これはセクション
      }
      +subsection{サブセクション}<
        +p{
          これはサブセクション
        }
      >
    >
  >
>
```

その他のコマンドは `doc/` 以下をご覧ください。

## 開発方法

事前に Docker をインストールしてください。

### クラスライブラリの開発

`src/` 以下を編集し、以下のコマンドを実行してください。クラスライブラリおよびその依存パッケージが `.satysfi` ディレクトリにインストールされます。

```
make .satysfi
```

その後は後述するマニュアルのビルドをして生成された PDF を確認してください。

クラスライブラリを変更したあとは `make clean` して再度 `make .satysfi` を実行してください。

### マニュアルの開発

`doc/` 以下を編集し、以下のコマンドでビルドします。結果が `doc/manual.pdf` に出力されます。

```
make doc
```

1回目はフォントのダウンロードなどがあるため時間がかかりますが、2回目以降はスキップされます。

### テスト

テストは `test` ディレクトリ以下にあります。

```
make test
```

で実行できます。実行には以下が必要です。

- `satysfi-class-shinchoku-tairiku` のインストール
- `satysfi` コマンド
- `diff-pdf` コマンド

`build.sh` で各テストケースの出力 (PDF) を取得し、`check.sh` で期待する結果と一致するかどうかを確認します。`build.sh` の実行には `satysfi` コマンドが、`check.sh` の実行には `diff-pdf` コマンドがそれぞれ必要です。

何らかの変更によってテストケースが通らなくなったときは、`${TESTCASE}_actual.pdf` と `${TESTCASE}_diff.pdf` を確認して、問題なさそうであれば `update.sh ${TESTCASE}` を実行して期待する出力結果を更新します。

## 標準ライブラリをコピーして編集したもの

見た目などの理由で標準ライブラリの関数を再実装しています

- `src/itemize.satyh`

## 謝辞

この設定ファイルはSATySFiの標準ライブラリ・先人たちのコード片を大量に集めてきています。
先人たちに感謝します。
