# ♻️IndicatorSample
### 概要
インジケータを使用しやすいようにUIKitのみで作成しました

### モチベーション
- サードパーティ製のインジケータ機能からの脱却
- 臨機応変にインジケータ内に文字を表示させたい
- 正方形に角丸のシンプルな形式で、インジケータ作動中は、ユーザー操作を不可にしたい

### 使用方法
①UIViewController内で使用しやすいようにextensionを作成し、extension内でリポジトリ内にある通りのコードを作成
②インジケータの下に表示したい文字のタイプを指定するための文字列を渡す(アカウントの登録中やデータ読み込み中等の文字を入れるとUX向上？)

### イメージ
| TypeA | TypeB |
|:---:  | :---: |
| ![Screen Shot 2023-06-10 at 22 23 50](https://github.com/ShoheiTakino/IndicatorSample/assets/104742356/68359caf-d205-4656-a1e4-c40578e2cf70) | ![Screen Shot 2023-06-10 at 22 23 57](https://github.com/ShoheiTakino/IndicatorSample/assets/104742356/a5e5568a-8427-4569-952b-51c3d66327f7) |


### その他
- インジケータの大きさは、画面サイズに応じて正方形にするべきであると思うため固定で数字を入れずに比率でインジケータと背景を設定すべき(警告でメモしている箇所)
