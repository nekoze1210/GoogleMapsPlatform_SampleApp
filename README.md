# 明日から使える Google Maps Platform 入門 サンプルコード

## サンプルプロジェクトのセットアップ

```
docker-compose build
docker-compose up -d
docker-compose run web rails db:create
```

## API 仕様

### GET /api/maps/reverse

#### 概要

逆ジオコーディング API
送られてきた緯度経度を元に住所情報を返却する

#### input

- latlng 緯度と経度をカンマ区切りで結合した文字列(例: 35.681236,139.767125)

#### output

サンプル

```json
{
  "address_components": [
    {
      "long_name": "東京駅",
      "short_name": "東京駅",
      "types": [
        "establishment",
        "point_of_interest",
        "subway_station",
        "train_station",
        "transit_station"
      ]
    },
    {
      "long_name": "１丁目",
      "short_name": "１丁目",
      "types": ["political", "sublocality", "sublocality_level_3"]
    },
    {
      "long_name": "丸の内",
      "short_name": "丸の内",
      "types": ["political", "sublocality", "sublocality_level_2"]
    },
    {
      "long_name": "千代田区",
      "short_name": "千代田区",
      "types": ["locality", "political"]
    },
    {
      "long_name": "東京都",
      "short_name": "東京都",
      "types": ["administrative_area_level_1", "political"]
    },
    {
      "long_name": "日本",
      "short_name": "JP",
      "types": ["country", "political"]
    }
  ],
  "formatted_address": "日本、東京都千代田区丸の内１丁目 東京駅",
  "geometry": {
    "location": {
      "lat": 35.68123620000001,
      "lng": 139.7671248
    },
    "location_type": "GEOMETRIC_CENTER",
    "viewport": {
      "northeast": {
        "lat": 35.68258518029151,
        "lng": 139.7684737802915
      },
      "southwest": {
        "lat": 35.67988721970851,
        "lng": 139.7657758197085
      }
    }
  },
  "place_id": "ChIJC3Cf2PuLGGAROO00ukl8JwA",
  "plus_code": {
    "compound_code": "MQJ8+FR 日本、東京",
    "global_code": "8Q7XMQJ8+FR"
  },
  "types": [
    "establishment",
    "point_of_interest",
    "subway_station",
    "train_station",
    "transit_station"
  ]
}
```

### GET /api/maps/autocomplete

#### 概要

オートコンプリート API
送られてきたキーワードを元に住所情報の検索結果を返却する

#### input

- input 文字列型の検索キーワード
- location 優先(中心)的に検索したい位置
  - 逆ジオ API の input と同じフォーマットの文字列

#### output

```json
[
  {
    "place_id": "GoogleMapが管理しているPlaceID",
    "description": "検索候補の住所"
  },
  ...
]
```

## フロントエンドの編集箇所

ルート直下の `public` ディレクトリ内にある index.html を使用します。

```
...
├── public
│   ├── index.html
...
```
