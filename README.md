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

| *<u>habit_id</u>* | habit_name | alarm_time | public |
| ----------------- | ---------- | ---------- | ------ |
| `Int`             | `String`   | `Date`     | `Bool` |

###### CheckLists

| *<u>checklist_id</u>* | checklist_name | is_checked |
| --------------------- | -------------- | ---------- |
| `Int`                 | `String`       | `Bool`     |

###### DoneLists

| *<u>done_date</u>* | short_description |
| ------------------ | ----------------- |
| `Date`             | `String`          |

###### Likes

| *<u>likes_id</u>* | habit_id |
| ----------------- | -------- |
| `Int`             | `Int`    |

### Relationship

###### `User` do `Habits`

###### `Habits` have  `DoneList`

###### `Habits` have  `CheckList`

###### `Habits` have  `Likes`

###### `Users` have  `Likes`

