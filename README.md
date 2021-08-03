# FiveMinsTracker



## Database

PostgreSQL을 사용

### Entity Table

- Italic체 + 밑줄 친 것이 primary key 

###### User

| *<u>user_id</u>* | nickname | login  |
| ---------------- | -------- | ------ |
| `Int`            | `String` | `Bool` |


###### Habits

| *<u>habit_id</u>* | habit_name | alarm_time | public | user_id |
| ----------------- | ---------- | ---------- | ------ | ------- |
| `Int`             | `String`   | `Date`     | `Bool` | `Int`   |

###### CheckLists

| *<u>checklist_id</u>* | checklist_name | is_checked | habit_id |
| --------------------- | -------------- | ---------- | -------- |
| `Int`                 | `String`       | `Bool`     | `Int`    |

###### DoneLists

| *<u>done_date</u>* | short_description | habit_id |
| ------------------ | ----------------- | -------- |
| `Date`             | `String`          | `Int`    |

###### Likes

| *<u>likes_id</u>* | habit_id | User_id |
| ----------------- | -------- | ------- |
| `Int`             | `Int`    | `Int`   |


### 

### Relationship

###### do : `User` do `Habits`

###### report : `Habits` report  `DoneList`

###### have: `Habits` have  `CheckList`

###### likes : `User` likes  `Habits`



## Server

`Vapor`와 `Heroku` 사용
