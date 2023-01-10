## ドラッター(Dratter)
サービスURL:https://www.dragon-twitter-analysis.com/

## サービス概要
Twitterのツイートを感情分析することで、<br>
そのアカウントを使う人がどんな人なのかを事前に知ることができる、<br>
SNSリテラシー向上サービスです。<br>

## アップデート情報(2022年10月22日時点 v1.3.3)
 - READMEの修正。
 - gem(nokogiri)のバージョン修正。
 - resultsのvcrカセットを追跡対象から除外。

## ターゲットユーザー
Twitter上での人間関係や運用方法を考え直したい人<br>
ドラゴンや龍が好き人<br>

## ユーザーが抱える課題
1.自分のツイートが自他にどのような影響や印象を与えているかを知りたい。<br>
2.Twitterを運用していきたいが、いいねの数に振り回されたくない。<br>
3.他のアカウントを使う人がどんな人なのかを先に知ることで、<br>
  SNS上の人間関係や運用上での悩みを減らしたい。<br>

## 解決方法
Twitter APIや感情分析を用いて、各アカウントで呟く人の感情に<br>
どのような傾向があるのかを計測してドラゴンに例える。<br>
(ポジティブかネガティブか、その感情が自分に向いているか他人に向いているかで判断)<br>
診断したアカウントの周囲に対する傾向を知ることで、対象のアカウントの運用方法や付合い方がわかる。<br>

## 使用技術
バックエンド
 - Ruby(3.1.2)
 - Rails(7.0.3.1)

フロントエンド
 - HTML
 - CSS
 - TailwindCSS(2.2.17)
 - JavaScript
 - Vue.js(2.6.14)

インフラ
 - heroku
 - MySQL(8.0.30)

## 画面遷移図
https://www.figma.com/file/U2deMhVqwmZKrfl8Nyt0Xb/Dratter%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0%3A1

## ER図
https://drive.google.com/file/d/12vdTI5Zrdz6FWTw0iU4mwWwk-rRkb_SA/view?usp=sharing
