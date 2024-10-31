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
* [maladyType](#maladytype)
* [googleStatus](#googlestatus)
* [loginStatus](#ubiloginstatus)  
* [ubiLoginStatus](#Loginstatus)
* [tileExtra](#tileextra)

## Vector2
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `x` | X coordinate |
| Number | `y` | Y coordinate |

## WorldObject
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Unique identifier of the item |
| Number | `uid` | Unique index of the object |
| [Vector2](#vector2) | `pos` | Position of the object |
| Number | `count` | Quantity of the item |
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
| Number | `flags` |  Player's flags   |
| Number | `level` | Player's level |
| Boolean | `mod` | Indicates whether the player is a mod |
-- Local| ----- | ------
| Number | `gems` | Gem count |
| Number | `slot` | Inventory slot count (backpack size) |
| Number | `playTime` | Total playtime |
| Number | `createDate` | Account creation date (Unix timestamp) |
| Boolean | `supporter` |  Indicates if the bot is a supporter |
| String | `proxy` |  proxy information (user:pass:ip:port) |
| String | `mac` |  MAC address  |
| String | `growid` | growid |
| [loginStatus](#loginstatus) | `tokenStatus` |  Token Information   |
| [ubiLoginStatus](#ubiloginstatus)  | `ticketStatus` |  Ticket(UBI) Information   |
| [googleStatus](#googlestatus) | `googleStatus` |  Google Status Information   |
| String | `token` |  L-Token   |
| String | `recoveryMail` |  Recovery email for Google   |
| String | `accountCreateUrl` |  Account creation URL |
| String | `accountCreateCookie` |  Required cookie for account creation (growtopia_game_session) |
| String | `malady` |  Malady Status |
| Number | `earnedGems` |  Total Earned Gems |
| String | `steamToken` |  Steam Token |
| String | `ubiTicket` |  Ubi Token |
| String | `steamName` |  Steam username |
| Number | `onlineTime` | Online time in seconds |



 ## Tile
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `fg` |Foreground item ID |
| Number | `bg` | Background item ID |
| Number | `x`  | Tile's X position |
| Number | `y`  |Tile's Y positione |
| [flagType](#flagtype) | `flags` | 	Tile flags  |
| [tile Extra](#tileextra) | `extra` |	Extra tile information |


 ## InventoryItem
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Item ID |
| Number | `count` | Item count |
| Boolean | `equipped` |  |


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

| Type    | Name          | Description     |
|:-------:|:-------------:|:---------------:|
| String  | `name`        | Item name       |
| Number  | `id`          | Item ID         |
| Number  | `rarity`      | Item rarity     |
| Number  | `growTime`    | Item grow time  |
| Number  | `breakHits`   | Item break hits |
| Number  | `dropChance`  | Item drop chance|
| Number  | `itemCategory`| Item category   |
| Number  | `level `  | Required Level |
| Bool  | `untradeable `  | Indicates if the item is untradeable


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
| String | `name` |  World name |
| Number | `width` | World width |
| Number | `height` | World height |
| Number | `timer` | World timer (in minutes) |
| table | `access` | World access list (user IDs) |
| [Vector2](#vector2) | `maindoor` | Main door position (white door) |
| [NPC](#npc) | `npcs` | List of NPCs in the world |

## httpRequestInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `url` |  Request URL |
| String | `userAgent` | User Agent |
| String | `postData` | Post Data |
| Boolean | `json` | Indicates if the request is JSON |
| Enum | `method` | Request Method [POST,GET,DELETE,PUT,HEAD,PATCH] |
| String | `proxy` | Proxy information (e.g., http://user:password@proxy:port) |

## httpResponseInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `body` |  Response body |
| Number | `httpCode` | HTTP status code |
| Boolean | `success` | Indicates if the request was successful |
| String | `failInfo` | Error information |

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
| gameMessage | 

## Npc
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `name` |  NPC ID |
| String | `type` | NPC Type |
| String | `event` | NPC Event |
| Number | `startX` | Start X of NPC |
| Number | `startY` | Start Y of NPC |
| Number | `destX` | Destination X of NPC |
| Number | `destY` | Destination Y oF NPC |

## maladyType
```c++
enum class maladyType {
    no_value = -1,
    none = 0,
    torn_punching_muscle = 1 << 0,
    ecto_bones = 1 << 1,
    lupus = 1 << 2,
    fatty_liver = 1 << 3,
    chaos_infection = 1 << 4,
    moldy_guts = 1 << 5,
    chicken_feet = 1 << 6,
    brainworms = 1 << 7,
    grumbleteeth = 1 << 8,
    broken_heart = 1 << 9,
    gem_cuts = 1 << 10,
    recovering = 1 << 11
};
```

## googleStatus
```c++
enum class googleStatus {
	not_started,
	success,
	processing,
	wrong_password,
	two_factor,
	blocked,
	error,
	growtopiaError,
	path_not_found,
	timeout,
	account_not_found,
	wrong_id,
	please_try_login_again
};
```

## loginStatus
```c++
enum class loginStatus  {
	NONE,
	SUCCESS,
	FAILED,
	BAD_GATEWAY,
	BLOCKED,
	WRONG_PASSWORD,
	REQUIRED_2FA,
	TICKET_EXPIRED,
	STEAM_NOT_LINKED,
	RATE_LIMIT,
	CAPTCHA
};
```

## ubiLoginStatus
```c++
enum class ubiLoginStatus {
	NONE,
	SUCCESS,
	FAILED,
	BLOCKED,
	WRONG_PASSWORD,
	WRONG_SECRET_KEY,
};
```

# tileExtra
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `extraType` |  Extra Type ; e.g.,VipEntrance,Vending |

## VipEntrance
| Type | Name | Description|
|:-----|:----:|:-----------|
| table [Number] | `accessList` |  Access List |
| Boolean | `public` | Indicates if the VIP entrance is public |

## Vending
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `itemID` | Item ID on the vending machine |
| Number | `price` |  Price on the vending machine|
| Boolean | `each` |  Indicates if the item is sold per unit or each |

## WorldLock
| Type | Name | Description|
|:-----|:----:|:-----------|
| table [Number] | `accessList` |  Access List |
| Boolean | `public` | Indicates if the world lock is public |
| Number | `timer` | Timer value for the lock in miniutes |

## Lock
| Type | Name | Description|
|:-----|:----:|:-----------|
| table [Number] | `accessList` |  Access List |
| Boolean | `public` | Indicates if the Lock is public |

## Provider
| Type | Name | Description|
|:-----|:----:|:-----------|
| Boolean | `ready` |  Indicates if the provider is ready to be Collect|
| Number | `time` | Growth time; e.g., check -> (provider time > growth = readyToHarvest) |
| Number | `currentTime` | Current time when the Provider object is created |

## Seed
| Type | Name | Description|
|:-----|:----:|:-----------|
| Boolean | `ready` |  Indicates if the provider is ready to be harvest|
| Number | `time` | Growth time; e.g., check -> (seed time > growth = readyToHarvest ) |
| Number | `count` | fruit count; only visual, not the actual amount |
| Number | `currentTime` | Current time when the Seed object is created |

## GeigerCharger
| Type | Name | Description|
|:-----|:----:|:-----------|
| Boolean | `ready` |  Indicates if the Charger is ready to be Collect|
| Number | `time` | Growth time; e.g., check -> (charger time > 3600 = readyToHarvest ) |
| Number | `currentTime` | Current time when the GeigerCharger object is created |


## Sign
| Type | Name | Description|
|:-----|:----:|:-----------|
| string | `label` | Label of the Sign |

## Door
| Type | Name | Description|
|:-----|:----:|:-----------|
| string | `label` | Label of the door |

## SurgeonStation
| Type | Name | Description|
|:-----|:----:|:-----------|
| bool | `enabled` |  |
| bool | `outOfOrder` |  |
| string | `malady` | Malady Type |