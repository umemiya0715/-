<template>
  <div class="container mx-auto my-4 term-font text-white px-10 lg:px-60 lg:py-20">
    <div class="text-center text-4xl font-bold my-10">
      プライバシーポリシー
    </div>
    <div class="grid grid-rows-1">
      <p>ドラッター（以下，「当事務局」といいます。）は，本ウェブサイト上で提供するサービス（以下,「本サービス」といいます。）における，ユーザーの個人情報の取扱いについて，以下のとおりプライバシーポリシー（以下，「本ポリシー」といいます。）を定めます。</p>

      <div class="text-2xl font-bold mt-10 mb-5">第1条（取得する情報）</div>
      <p>本サービスはユーザーから以下の情報を取得します。</p>
      <ol class="ml-5 list-decimal">
        <li>外部サービスのプライバシー設定によりお客様が連携先に開示を認めた情報</li>
        <li>Cookie(クッキー)を用いて生成された識別情報</li>
        <li>OSが生成するID、端末の種類、端末識別子等のお客様が利用するOSや端末に関する情報</li>
        <li>当社ウェブサイトの滞在時間、入力履歴、購買履歴等の当社ウェブサイトにおけるお客様の行動履歴</li>
        <li>当社アプリの起動時間、入力履歴、購買履歴等の当社アプリの利用履歴</li>
      </ol>

      <div class="text-2xl font-bold mt-10 mb-5">第2条（情報を利用する目的）</div>
      <p>本サービスは、ユーザーから取得した情報を以下の目的のために利用します。</p>
      <ol class="ml-5 list-decimal">
        <li>当社サービスに関する登録の受付、お客様の本人確認、認証のため</li>
        <li>お客様の当社サービスの利用履歴を管理するため</li>
        <li>ユーザーの行動履歴を分析し、本サービスの維持改善に役立てるため</li>
        <li>市場分析、マーケティングのため</li>
        <li>ユーザーのお問い合わせに対応するため</li>
        <li>本サービスの規約や法令に違反する行為に対応するため</li>
        <li>本サービスの変更、提供中止、終了、契約解除をご連絡するため</li>
        <li>本サービスの規約の変更等を通知するため</li>
        <li>以上の他、サービスの提供、維持、保護及び改善のため</li>
      </ol>

      <div class="text-2xl font-bold mt-10 mb-5">第3条（第三者提供）</div>
      <p>本サービスは、ユーザーから取得する情報のうち、個人データ（個人情報保護法第２条第６項）に該当するものついては、あらかじめユーザーの同意を得ずに、第三者（日本国外にある者を含みます。）に提供しません。</p>
      <p>但し、次の場合は除きます。</p>
      <ol class="ml-5 list-decimal">
        <li>個人データの取扱いを外部に委託する場合</li>
        <li>本サービスが買収された場合</li>
        <li>事業パートナーと共同利用する場合（具体的な共同利用がある場合は、その内容を別途公表します。）</li>
        <li>その他、法律によって合法的に第三者提供が許されている場合</li>
      </ol>

      <div class="text-2xl font-bold mt-10 mb-5">第4条（アクセス解析ツール）</div>
      <p>本サービスは、ユーザーのアクセス解析のために、「Googleアナリティクス」を利用しています。</p>
      <p>Googleアナリティクスは、トラフィックデータの収集のためにCookieを使用しています。トラフィックデータは匿名で収集されており、個人を特定するものではありません。Cookieを無効にすれば、これらの情報の収集を拒否することができます。詳しくはお使いのブラウザの設定をご確認ください。</p>
      <p>Googleアナリティクスについて、詳しくは以下からご確認ください。</p>
      <p>https://marketingplatform.google.com/about/analytics/terms/jp/</p>

      <div class="text-2xl font-bold mt-10 mb-5">第5条（プライバシーポリシーの変更）</div>
      <p>本サービスは、必要に応じて、このプライバシーポリシーの内容を変更します。</p>

      <div class="text-2xl font-bold mt-10 mb-5">第6条（お問い合わせ）</div>
      <p>お問い合わせの際は、公式アカウントのメッセージにて承ります。</p>

      <div class="my-20 text-center">以上</div>
      <div class="container text-center term-font">
        <router-link to="/">トップページに戻る</router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "PrivacyPolicy",
  data() {
    return {
      title: "プライバシーポリシー"
    }
  }
}
</script>

<style scoped>
</style>
