コード銀行：英語でプリーズ！
====

使用例
`./english.rb english/testdata.in.txt`


## 解答
[answer_q1381.txt](answer_q1381.txt) を参照してください。


## 問題文

###【英語でプリーズ！】

与えられた整数値を、英語に変換するプログラムを作成してください。

たとえば"123"なら"One Hundred Twenty Three"、"-50000"のような負の数は、"Negative Fifty Thousand"のように出力してください。

必要な英単語は1つのファイルにまとめてご用意しましたので、それをご活用ください（詳細は【解答方法】の項目をご覧ください）。

###【入力】

入力はテキストファイルで用意されています。これを標準入力から読み込んでください。

入力ファイルの1行目には入力データ数N（1≦N≦100）が与えられます。

2行目以降のN行分の整数値を英語に変換してください。

ただし、入力データは符号付き32bit整数の範囲で収まるものに限ります。

###【出力】

標準出力に、変換後の英語を出力してください（入力データ毎に改行してください）。

アルファベットの大文字・小文字は問いません。

###【入出力例】
- sample.in.txt

      7
      123
      4567
      89012
      0
      -34
      -5678901
      1111111111


- sample.out.txt

      One Hundred Twenty Three
      Four Thousand Five Hundred Sixty Seven
      Eighty Nine Thousand Twelve
      Zero
      Negative Thirty Four
      Negative Five Million Six Hundred Seventy Eight Thousand Nine Hundred One
      One Billion One Hundred Eleven Million One Hundred Eleven Thousand One Hundred Eleven

###【解答方法】

まずは[english.zip]をダウンロードし、展開してください。中には5つのファイルが含まれています。


answer_q1381.txt: 解答用テキストファイルです
sample.in.txt: 入力サンプルです
sample.out.txt: サンプルの解答です
testdata.in.txt: これを入力ファイルとして解答してください
words.txt: 英単語のデータファイルです（プログラム作成時にご利用ください）


answer_q1381.txtに必要事項を記入し、テキストファイルのままアップロードしてください。

※answer_q1381.txt以外のファイルをzipに固めてアップロードした場合は評価対象外となります。

###【注意】

・出力結果に誤りがある場合は大幅に減点されます

・問題本文だけでなく「解答評価のポイント」「その他注意事項」をよくお読みください


## 【出題URL】
[https://codeiq.jp/q/1381](https://codeiq.jp/q/1381)

## Author
[MotokiMiyahara](https://github.com/MotokiMiyahara/)


