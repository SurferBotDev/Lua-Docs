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
* [hookType](#hooktype)
* [tileExtra](#tileextra)

## Vector2
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `x` | X position |
| Number | `y` | Y position |

## WorldObject
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Item ID of the object |
| Number | `uid` | Index of the object |
| [Vector2](#vector2) | `pos` | Position of the object |
| Number | `count` | Item count of the object |
| Number | `flags` | Flags of the object |
 
 ## NetAvatar
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `name` | Player's name |
| String | `country` | Player's flag id |
| [Vector2](#vector2) | `pos`  | Player's position |
| Number | `netid` | Player's netID |
| Number | `userid` | Player's userID |
| Number | `buildRange` | Player's buildRange |
| Number | `punchRange` | Player's punchRange |
| Boolean | `Mod` | Indicates whether the player is a mod |
| Number | `gems` | Gems Amount |
| Boolean | `guest` | Indicates whether the player is a guest |
| Number | `slot` | Inventory slot count (backpack) |
| Number | `level` | Player's level |
| Boolean | `supporter` |  Indicates whether the player is a supporter |
| String | `guestInfo` |  guestInfo (session information) |
| Table | `proxy` |  proxy information { hostname, username, password } |


 ## Tile
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `fg` | Foreground ID of the Tile |
| Number | `bg` | Background ID of the Tile |
| Number | `x`  | x position of the Tile |
| Number | `y`  | y position of the Tile |
| [flagType](#flagtype) | `flags` | Flags of the Tile  |
| [tile Extra](#tileextra) | `extra` | Extra Information of the Tile  |


 ## InventoryItem
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Item ID |
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
| String | `[0]` | Variant function name |
| String | `[1]` | Param 1 |
| String | `[2]` | Param 2 |
| String | `[3]` | Param 3 |
| String | `[4]` | Param 4 |
| String | `[5]` | Param 5 |

## world
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `name` |  World Name |
| int | `width` | World Width |
| int | `height` | World Height |
| int | `timer` | World timer (in minutes) |
| table [int] | `access` | World access list (uid) |
| [Vector2](#vector2) | `maindoor` | Main door position of the world (white door)|

## httpRequestInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `url` |  Request URL |
| String | `userAgent` | User Agent |
| String | `postData` | Post Data |
| Boolean | `json` | Json Request |
| Enum | `method` | Request Method [POST,GET,DELETE,PUT,HEAD,PATCH] |
| String | `proxy` | Proxy information (e.g., http://user:password@proxy:port) |

## httpResponseInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `body` |  Response Body |
| int | `httpCode` | Response HTTP code |
| Boolean | `success` | Indicates whether the request was successful or failed|
| String | `failInfo` | CURL error message |

## flagType
| Name |
|:-----|
| PUBLIC |
| LOCKED | 
| NONE | 
| WATER |
| SEED | 
| RED | 
| OPEN | 
| MAX | 
| GREEN | 
| GLUE | 
| FLIPPED |
| FIRE | 
| BLUE |


## hookType
| Name |
|:-----|
| varlist |
| moderatorJoined | 
| gamePacket | 

# tileExtra
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `extraType` |  Extra Type ; e.g.,VipEntrance,Vending |

## VipEntrance
| Type | Name | Description|
|:-----|:----:|:-----------|
| table [int] | `accessList` |  Access List |
| Boolean | `public` | Indicates if the VIP entrance is public |

## Vending
| Type | Name | Description|
|:-----|:----:|:-----------|
| int | `itemID` | ItemID On The Vending Machine |
| int | `price` | Price On The Vending Machine |
| Boolean | `each` | Indicates whether the item is sold per unit or each|

## WorldLock
| Type | Name | Description|
|:-----|:----:|:-----------|
| table [int] | `accessList` |  Access List |
| Boolean | `public` | Indicates if the World Lock is public |
| int | `timer` | Timer value for the lock in miniutes |

## Lock
| Type | Name | Description|
|:-----|:----:|:-----------|
| table [int] | `accessList` |  Access List |
| Boolean | `public` | Indicates if the Lock is public |

## Provider
| Type | Name | Description|
|:-----|:----:|:-----------|
| Boolean | `ready` |  Indicates if the provider is ready to be Collect|
| int | `time` | Growth time; e.g., check -> (provider time > growth = readyToHarvest) |
| int | `currentTime` | Current time when the Provider object is created |

## Seed
| Type | Name | Description|
|:-----|:----:|:-----------|
| Boolean | `ready` |  Indicates if the provider is ready to be harvest|
| int | `time` | Growth time; e.g., check -> (seed time > growth = readyToHarvest ) |
| int | `count` | fruit count; only visual, not the actual amount |
| int | `currentTime` | Current time when the Seed object is created |

## GeigerCharger
| Type | Name | Description|
|:-----|:----:|:-----------|
| Boolean | `ready` |  Indicates if the Charger is ready to be Collect|
| int | `time` | Growth time; e.g., check -> (charger time > 3600 = readyToHarvest ) |
| int | `currentTime` | Current time when the GeigerCharger object is created |


## Sign
| Type | Name | Description|
|:-----|:----:|:-----------|
| string | `label` | Label of the Sign |

## Door
| Type | Name | Description|
|:-----|:----:|:-----------|
| string | `label` | Label of the door |

