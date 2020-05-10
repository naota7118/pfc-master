# PFC MASTER DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|username|string|null: false|

### Association
- has_many :posts
- has_many :comments
- has_many :posts, through: :comments

## postsテーブル
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
|date|date||
|user_id|integer|null: false, foreignkey: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many  :tags,  through:  :posts_tags


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreignkey: true|
|user_id|integer|null: false, foreignkey: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many  :tags,  through:  :posts_tags