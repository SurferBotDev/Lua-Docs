# Structs
* [WorldObject](#worldobject)
* [NetAvatar](#netavatar)
* [Tile](#tile)
* [InventoryItem](#inventoryitem)
* [GamePacket](#gamepacket)
* [ItemInfo](#iteminfo)

## WorldObject
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Object's item ID |
| Number | `uid` | Object's index |
| [Vector2](#vector2) | `pos` | Object's position |
| Number | `count` | Object's item count |
| Number | `flags` | Object's flags |
 
 ## NetAvatar
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `name` | Player's name |
| String | `country` | Player's flag id |
| [Vector2](#vector2) | `pos`  | Player's position |
| [Vector2](#vector2) | `size` | Player's size |
| Number | `netid` | Player's netID |
| Number | `userid` | Player's userID |
| Bool | `Mod` | Is Mods |

 ## Tile
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `header.fg` | Foreground block's ID |
| Number | `header.bg` | Background block's ID |
| [Vector2](#vector2) | `pos` |Tile's position |
| Number | `header.flags1` | Tile's flags |
| Number | `header.flags2` | Tile's flags |

 ## InventoryItem
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Item's ID |
| Number | `count` | Item count |


## GamePacket
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `type` | Packet type |
| Number | ` objtype` |  |
| Number | `count1 ` |  |
| Number | `count2 ` |  |
| Number | `netid ` | Packet netID |
| Number | `item ` |  |
| Number | `flags ` | Packet flags |
| Number | `float_var` |  |
| Number | `int_data` |  |
| Number | `pos_x` |  |
| Number | `pos_y` |  |
| Number | `pos2_x` |  |
| Number | `pos2_y` |  |
| Number | `int_x` |  |
| Number | `int_y` |  |


## ItemInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `name` | Item name |
| Number | `id` | Item ID |
| Number | `rarity` | Item rarity |
| Number | `growtime` | Item growtime |
| Number | `breakhits` | Item breakhits |




Credit [Arky](https://github.com/arky-arky/teohook-scripting-wrapper)
