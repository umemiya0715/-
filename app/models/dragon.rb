class Dragon < ActiveHash::Base
  self.data = [
    { id: 1, name: 'レッドドラゴン', image: 'redDragon.png', explanation: '炎のように熱く燃えるヤツ',
    personality:
    'このドラゴンが心の中に住んでるあなたは、正に心が燃えている真っ最中。<br>
     何事にも精力的に取り組めており、周囲への影響力も大きいあなたは辺りを照らす炎のよう。<br>
     ', advise: '' },
    { id: 2, name: 'イエロードラゴン', image: 'yellowDragon.png', explanation: 'おしゃれで見栄っ張りな王様',
    personality:
    'このドラゴンが心の中に住んでるあなたは、誰かに自分を認めてほしい気持ちが強いかも。<br>
     色々とおしゃれして見た目を良くしようとしているけど、あまり結果には結びついてはいない様子<br>。
    ', advise: '' },
    { id: 3, name: 'グリーンドラゴン', image: 'greenDragon.png', explanation: '悠然と構える長老',
    personality:
    'このドラゴンが心の中に住んでるあなたは、'
    , advise: '' },
    { id: 4, name: 'ホワイトドラゴン', image: 'whiteDragon.png', explanation: '凍てつくほどクール',
    personality:
    '',advise: '' },
    { id: 5, name: 'グレードラゴン', image: 'grayDragon.png', explanation: '毒々しさMAX' ,
    personality:
    '', advise: '' },
    { id: 6, name: 'ブルードラゴン', image: 'blueDragon.png', explanation: '怒らすと怖い海の主',
    personality:
    '', advise: '' },
    { id: 7, name: 'パープルドラゴン', image: 'purpleDragon.png', explanation: '気まぐれな構ってちゃん',
    personality:
    '', advise: '' },
    { id: 8, name: 'ブラックドラゴン', image: 'blackDragon.png', explanation: '病みがちな闇の竜',
    personality:
    '', advise: '' }
  ]
end