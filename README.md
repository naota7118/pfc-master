# #DB設計

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

# Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :posts, through: :comments, dependent: :destroy
- has_many :posts, through: :likes, :dependent: :destroy

# postsテーブル
|Column|Type|Options|
|------|----|-------|
|food|text|null: false|
|calorie|integer|null: false|
|protein|integer||
|fat|integer||
|carbo|integer||
|weight|integer||
|text|text||
|image|string||
|date|date|
|user_id|integer|null: false, foreign_key: true|

# Association
- belongs_to :user
- has_many :images, dependent: destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

# Association
- belongs_to :user
- belongs_to :post


# likesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

# Association
- belongs_to :user
- belongs_to :post

# imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null, false|
|post_id|integer|null: false, foreign_key: true|

# Association
- belongs_to :user
- belongs_to :post