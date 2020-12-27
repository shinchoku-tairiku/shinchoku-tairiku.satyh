# shinchoku-tairiku.satyh

進捗大陸で使用された SATySFi クラスライブラリ

- [進捗大陸06](../../tree/book06)
- [進捗大陸05](../../tree/book05)

## インストール

opam と Satyrographos でインストールできます。satyrographos-repo にはアップロードされていません。

```
git clone git://github.com/shinchoku-tairiku/shinchoku-tairiku.satyh
cd shinchoku-tairiku.satyh
opam pin add satysfi-class-shinchoku-tairiku .
satyrographos install
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

以下を事前にインストールしてください。

- `opam`
- `opam` によってインストールされた `satysfi`
- `opam` によってインストールされた `satyrographos`
- (テストの実行のみ) [`diff-pdf`](https://github.com/vslavik/diff-pdf)

### クラスライブラリの開発

`src/` 以下を編集し、以下のコマンドを実行すると、更新されたクラスライブラリがインストールされます。

```
make install
```

テストは `test` ディレクトリ以下にあります。以下のコマンドで実行できます。

```
make test
```

`build.sh` で各テストケースのビルド結果 (`${TESTCASE}_actual.pdf`) を生成し、`check.sh` で期待する内容 (`${TESTCASE}_expected.pdf`) と一致するかどうかを確認します。`build.sh` の実行には `satysfi` コマンドが、`check.sh` の実行には `diff-pdf` コマンドがそれぞれ必要です。`check.sh` によって `${TESTCASE}_actual.pdf` と `${TESTCASE}_expected.pdf` との差分 `${TESTCASE}_diff.pdf` が生成されます。

何らかの変更によってテストケースが通らなくなったときは、`${TESTCASE}_actual.pdf` と `${TESTCASE}_diff.pdf` を確認して、問題なさそうであれば `update.sh ${TESTCASE}` を実行して期待する出力結果を更新します。


### マニュアルの執筆

`doc/` 以下を編集し、以下のコマンドでビルドします。結果が `doc/manual.pdf` に出力されます。

```
make doc
```

## 標準ライブラリをコピーして編集したもの

見た目などの理由で標準ライブラリの関数を再実装しています

- `src/itemize.satyh`

## 謝辞

この設定ファイルはSATySFiの標準ライブラリ・先人たちのコード片を大量に集めてきています。
先人たちに感謝します。
