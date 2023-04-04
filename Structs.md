# Structs
* [Vector2](#vector2)
* [WorldObject](#worldobject)
* [NetAvatar](#netavatar)
* [Tile](#tile)
* [InventoryItem](#inventoryitem)
* [GamePacket](#gamepacket)
* [ItemInfo](#iteminfo)
* [VariantList](#variantlist)
* [world](#world)
* [httpRequestInfo](#httprequestinfo)
* [httpResponseInfo](#httpresponseinfo)
* [flagType](#flagtype)

## Vector2
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `x` | Position x |
| Number | `y` | Position y |

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
| Boolean | `Mod` | Is Mods |
| Number | `gems` | Gems Amount (for local player) |
| Boolean | `guest` | Is guest |

 ## Tile
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `fg` | Foreground block's ID |
| Number | `bg` | Background block's ID |
| Number | `x`  | Position x |
| Number | `y`  | Position y |
| flagType | `flags` | Tile's flags  |
| Number | `flags1` | Tile's flags 1 |
| Number | `flags2` | Tile's flags 2 |

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
| Number | `growTime` | Item growtime |
| Number | `breakHits` | Item breakhits |

## VariantList
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `get(0)` | Variant function name |
| String | `get(1)` | Param 1 |
| String | `get(2)` | Param 2 |
| String | `get(3)` | Param 3 |
| String | `get(4)` | Param 4 |
| String | `get(5)` | Param 5 |


## world
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `name` |  World Name |
| int | `width` | World Width |
| int | `height` | World Height |
| int | `timer` | world timer (minute) |
| table | `access` | World Access List (uid) |
| [Vector2](#vector2) | `maindoor` | World Main Door pos ( white door) |

## httpRequestInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `url` |  Request URL |
| String | `userAgent` | User Agent |
| String | `postData` | Post Data |
| Boolean | `json` | Json Request |
| Enum | `method` | Request Method [POST,GET,DELETE] |

## httpResponseInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `body` |  Response Body |
| int | `httpCode` | Response Http Code |
| Boolean | `success` | checks the request is successful/fail |
| String | `failInfo` | Curl Error Message |


## flagType
| Name |
|:-----|
| PUBLIC |
| LOCKED | 
| NONE | 
| WATER |
| SEED | 
| RED | 
| PUBLIC | 
| MAX | 
| GREEN | 
| GLUE | 
| FLIPPED |
| FIRE | 
| BLUE |

Credit [Arky](https://github.com/arky-arky/teohook-scripting-wrapper)
