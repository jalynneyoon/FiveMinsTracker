# FiveMinsTracker

작은 일부터 시작할 수 있게끔 돕는 습관 관리 앱을 개발하고 있습니다.

## 기획의도

- 저는 일을 하기 싫을 때 아주 작은 과제를 만들어 그것만 하겠다는 마음가짐으로 시작합니다. 예를 들어 운동을 해야 하면 운동복을 입고 나가기만 하자고 생각합니다. 저는 이에 착안하여 5분이라는 짧은 시간제한을 두어 가벼운 마음으로 원하는 바를 시작할 수 있는 앱을 기획하였습니다.


## Database

PostgreSQL을 사용

### Entity Table

- Italic체 + 밑줄 친 것이 primary key 

###### User

| *<u>user_id</u>* | nickname | login  |
| ---------------- | -------- | ------ |
| `UUID`            | `String` | `Bool` |


###### Habits

| *<u>habit_id</u>* | habit_name | alarm_time | public | user_id |
| ----------------- | ---------- | ---------- | ------ | ------- |
| `UUID`             | `String`   | `Date`     | `Bool` | `UUID`   |

###### CheckLists

| *<u>checklist_id</u>* | checklist_name | is_checked | habit_id |
| --------------------- | -------------- | ---------- | -------- |
| `UUID`                 | `String`       | `Bool`     | `UUID`    |

###### DoneLists

| *<u>donelist_id</u>* |  done_date         | short_description | habit_id |
| -------------------- | ------------------ | ----------------- | -------- |
| `UUID`                | `Date`             | `String`          | `UUID`    |

###### Likes

| *<u>likes_id</u>* | habit_id | User_id |
| ----------------- | -------- | ------- |
| `UUID`             | `Int`    | `UUID`   |


### 

### Relationship

###### do : `User` do `Habits`

###### report : `Habits` report  `DoneList`

###### have: `Habits` have  `CheckList`

###### likes : `User` likes  `Habits`



## Server

- `Vapor`와 `Heroku` 사용
- 서버 Repository : https://github.com/dmsgk/FMT-Server
