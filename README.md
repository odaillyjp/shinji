# ライブラリ Shinji 概要

旧漢字と新漢字の相互変換を行う機能を追加するライブラリです。

## インストール

    $ gem install shinji

## 追加されるメソッド

- **String#shinji**  
文字列の中に含まれる旧漢字を新漢字に変換した文字列を返します。
- **String#kyuji**  
文字列の中に含まれる新漢字を旧漢字に変換した文字列を返します。

## 使用例

```ruby
require 'shinji'

puts "舊漢字を新漢字に變換します。".shinji
# => 旧漢字を新漢字に変換します。
puts "旧漢字を新漢字に変換します。".kyuji
# => 舊漢字を新漢字に變換します。
```

## 参考

旧漢字と新漢字については、以下の資料を参考しています。  
  
「常用漢字表」（平成22年内閣告示第2号）  
[http://www.bunka.go.jp/kokugo_nihongo/kokujikunrei_h221130.html](http://www.bunka.go.jp/kokugo_nihongo/kokujikunrei_h221130.html)

