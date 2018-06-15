# テーブル定義

### `fitbit_accounts`

| column name | data type | limit | memo |
|:--|:--|:--|:--|
| id | int | - | auto increment |
| client_id | varchar | 255 | OAuth 2.0 client ID |
| client_secret | varchar | 255 | Client secret |
| scopes | varchar | 255 | Scopes |
| user_id | varchar| 255 | Fitbit api user |
| token | varchar | 1024 | Access token |
| refresh_token | varchar | 1024 | Refresh token |
| status | integer | - | 0: inactive, 1: active |
