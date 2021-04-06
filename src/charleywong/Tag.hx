package charleywong;

using Lambda;

typedef TagData = {
    public var name:MultiLangString;
    @:optional public var description:MultiLangString;
    @:optional public var inherits:Array<TagId>;
}

abstract TagId(String) from String to String {
    public var id(get, never):String;
    function get_id() return this;

    public var name(get, never):MultiLangString;
    function get_name() return Tag.tags[this].name;

    public var description(get, never):Null<MultiLangString>;
    function get_description() return Tag.tags[this].description;

    public var inherits(get, never):Array<TagId>;
    function get_inherits() return switch (Tag.tags[this].inherits) {
        case null: [];
        case tags: tags;
    };
}

class Tag {
    #if sys
    static function main():Void {
        var ids = [for (tid => t in tags) tid.id];
        ids.sort(Reflect.compare);
        var schema = {
            "$id": "Tag.json",
            "type": "string",
            "enum": ids
        };
        sys.io.File.saveContent("data/schema/Tag.json", haxe.Json.stringify(schema, null, "  "));
    }
    #end

    static public var tags(get, null):Map<TagId, TagData>;
    static public function get_tags() return tags != null ? tags : tags = {
        var m = new Map();
        for (tName in Type.getClassFields(Tag))
        if (tName != "tags")
        {
            var f = Reflect.field(Tag, tName);
            if (Reflect.isFunction(f)) continue;
            m[tName] = f;
        }
        m;
    }

    static public function expend(ts:Array<TagId>):Array<TagId> {
        var r = new Map();
        for (t in ts) {
            r[t.id] = t;
            if (t.inherits != null)
                expend(t.inherits).iter(function(t) r[t.id] = t);
        }
        return r.array();
    }

    static public final closed:TagData = {
        name: {
            en: "closed",
            zh: "已結業"
        }
    }

    static public final shop:TagData = {
        name: {
            en: "shop",
            zh: "店鋪",
        }
    }

    static public final organization:TagData = {
        name: {
            en: "organization",
            zh: "組織",
        }
    }

    static public final publicfigure:TagData = {
        name: {
            en: "public figure",
            zh: "知名人士",
        }
    }

    static public final studyRoom:TagData = {
        name: {
            en: "study room",
            zh: "自修室",
        }
    }

    static public final partyRoom:TagData = {
        name: {
            en: "party room",
            zh: "派對埸地",
        }
    }

    static public final tutoring:TagData = {
        name: {
            en: "tutoring",
            zh: "補習",
        }
    }

    static public final lawyer:TagData = {
        name: {
            en: "lawyer",
            zh: "律師",
        }
    }

    static public final media:TagData = {
        name: {
            en: "media",
            zh: "媒體",
        }
    }

    static public final wedding:TagData = {
        name: {
            en: "wedding",
            zh: "婚禮",
        }
    }

    static public final hardware:TagData = {
        name: {
            en: "hardware",
            zh: "五金",
        },
        inherits: ["shop"]
    }

    static public final clothing:TagData = {
        name: {
            en: "clothing",
            zh: "衣物",
        },
        inherits: ["shop"]
    }

    static public final burger:TagData = {
        name: {
            en: "burger",
            zh: "漢堡包",
        }
    }

    static public final eyewear:TagData = {
        name: {
            en: "eyewear",
            zh: "眼鏡",
        },
        inherits: ["shop"]
    }

    static public final animal:TagData = {
        name: {
            en: "animal",
            zh: "動物",
        },
    }

    static public final footwear:TagData = {
        name: {
            en: "footwear",
            zh: "鞋類",
        },
        inherits: ["clothing"]
    }

    static public final printing:TagData = {
        name: {
            en: "printing",
            zh: "印刷",
        },
        inherits: ["shop"]
    }

    static public final printing3d:TagData = {
        name: {
            en: "3D printing",
            zh: "3D列印",
        },
        inherits: ["shop"]
    }

    static public final currency:TagData = {
        name: {
            en: "currency",
            zh: "貨幣",
        }
    }

    static public final currencyExchange:TagData = {
        name: {
            en: "currency exchange",
            zh: "外幣找換",
        }
    }

    static public final bridal:TagData = {
        name: {
            en: "bridal",
            zh: "婚紗/禮服",
        },
        inherits: [
            "wedding",
            "shop",
            "clothing",
        ]
    }

    static public final florist:TagData = {
        name: {
            en: "florist",
            zh: "花店/花匠",
        }
    };

    static public final artist:TagData = {
        name: {
            en: "artist",
            zh: "藝術家",
        },
        inherits: ["publicfigure"]
    };

    static public final tattoo:TagData = {
        name: {
            en: "tattoo",
            zh: "紋身",
        }
    }

    static public final handyman:TagData = {
        name: {
            en: "handyman",
            zh: "水電工人",
        },
        inherits: ["shop"]
    }

    static public final salon:TagData = {
        name: {
            en: "barber/hair salon",
            zh: "剪髮/理髮/沙龍",
        }
    }

    static public final book:TagData = {
        name: {
            en: "book",
            zh: "書籍",
        },
    };

    static public final sport:TagData = {
        name: {
            en: "sport",
            zh: "運動",
        },
    };

    static public final fitness:TagData = {
        name: {
            en: "fitness",
            zh: "健身",
        },
        inherits: ["sport"]
    };

    static public final instantChickenBreast:TagData = {
        name: {
            en: "instant chicken breast",
            zh: "即食雞胸"
        },
        inherits: ["food"]
    }

    static public final music:TagData = {
        name: {
            en: "music",
            zh: "音樂",
        }
    };

    static public final photography:TagData = {
        name: {
            en: "photography",
            zh: "攝影",
        }
    }

    static public final camera:TagData = {
        name: {
            en: "camera",
            zh: "相機",
        },
        inherits: ["photography"]
    }

    static public final photographer:TagData = {
        name: {
            en: "photographer/videographer",
            zh: "攝影師",
        },
        inherits: ["photography", "artist"]
    };

    static public final emcee:TagData = {
        name: {
            en: "MC",
            zh: "司儀",
        }
    }

    static public final makeup:TagData = {
        name: {
            en: "makeup",
            zh: "化妝",
        }
    }

    static public final nail:TagData = {
        name: {
            en: "nail",
            zh: "美甲",
        },
        inherits: ["makeup"]
    }

    static public final food:TagData = {
        name: {
            en: "food & beverage",
            zh: "食物/飲品/菜",
        }
    }

    static public final alcoholic:TagData = {
        name: {
            en: "alcoholic drinks",
            zh: "酒",
        },
        inherits: ["food"]
    }

    static public final baby:TagData = {
        name: {
            en: "baby goods",
            zh: "母嬰用品",
        }
    }

    static public final accessories:TagData = {
        name: {
            en: "accessories",
            zh: "飾物",
        },
        inherits: ["shop"]
    }

    static public final transport:TagData = {
        name: {
            en: "transport",
            zh: "運輸",
        }
    }

    static public final yacht:TagData = {
        name: {
            en: "yacht",
            zh: "遊艇"
        },
        inherits: [
            "transport"
        ]
    }

    static public final courier:TagData = {
        name: {
            en: "courier",
            zh: "速遞",
        },
        inherits: ["transport"]
    }

    static public final foodDelivery:TagData = {
        name: {
            en: "food delivery",
            zh: "送外賣",
        },
        inherits: ["transport"]
    }

    static public final homeMover:TagData = {
        name: {
            en: "home mover",
            zh: "搬屋",
        },
        inherits: ["transport"]
    }

    static public final technology:TagData = {
        name: {
            en: "technology",
            zh: "科技",
        }
    }

    static public final electricalAppliances:TagData = {
        name: {
            en: "electrical appliances",
            zh: "電器"
        },
        inherits: ["technology", "shop"]
    }

    static public final computer:TagData = {
        name: {
            en: "computer",
            zh: "電腦",
        },
        inherits: ["technology", "shop"]
    }

    static public final phone:TagData = {
        name: {
            en: "phone",
            zh: "電話",
        },
        inherits: ["technology", "shop"]
    }

    static public final webdev:TagData = {
        name: {
            en: "web design/development",
            zh: "網頁設計/開發",
        },
        inherits: ["technology", "shop"]
    }

    static public final mobiledev:TagData = {
        name: {
            en: "mobile app design/development",
            zh: "手機應用程式設計/開發",
        },
        inherits: ["technology", "shop"]
    }

    static public final advertisingAgency:TagData = {
        name: {
            en: "advertising agency",
            zh: "廣告代理",
        },
        inherits: ["shop"]
    }

    static public final medical:TagData = {
        name: {
            en: "medical",
            zh: "醫療",
        }
    }

    static public final dental:TagData = {
        name: {
            en: "dental care/dentist",
            zh: "牙齒護理/牙醫"
        },
        inherits: [
            "medical"
        ]
    };

    static public final chineseMedicinePractitioner:TagData = {
        name: {
            en: "Chinese medicine practitioner",
            zh: "中醫"
        },
        inherits: [
            "medical"
        ]
    };

    static public final pharmacy:TagData = {
        name: {
            en: "pharmacy",
            zh: "藥房",
        },
        inherits: [
            "medical"
        ]
    }

    static public final automobile:TagData = {
        name: {
            en: "automobile",
            zh: "汽車",
        },
        inherits: [
            "transport",
            "shop"
        ]
    }

    static public final furniture:TagData = {
        name: {
            en: "furniture",
            zh: "傢俬",
        }
    }

    static public final bakingSupplies:TagData = {
        name: {
            en: "baking supplies",
            zh: "烘焙材料",
        }
    }

    static public final interior:TagData = {
        name: {
            en: "interior design",
            zh: "室內裝修設計",
        },
        inherits: ["shop"]
    }

    static public final adult:TagData = {
        name: {
            en: "adult only / sex",
            zh: "十八禁/成人"
        }
    };

    static public final antique:TagData = {
        name: {
            en: "antique",
            zh: "古董"
        },
        inherits: ["shop"]
    };

    static public final job:TagData = {
        name: {
            en: "job hunting/career coaching",
            zh: "搵工/職業指導"
        }
    }

    static public final woodworking:TagData = {
        name: {
            en: "woodworking/carpentry",
            zh: "木工"
        },
        inherits: ["shop"]
    }

    static public final videoGame:TagData = {
        name: {
            en: "video game",
            zh: "電子遊戲"
        }
    }

    static public final tabletopGame:TagData = {
        name: {
            en: "tabletop game",
            zh: "桌上遊戲"
        }
    }

    static public final toy:TagData = {
        name: {
            en: "toy",
            zh: "玩具"
        }
    }

    static public final gun:TagData = {
        name: {
            en: "gun",
            zh: "槍"
        },
        inherits: [
            "sport"
        ]
    }

    static public final drivingInstructor:TagData = {
        name: {
            en: "driving instructor",
            zh: "教車師傅"
        },
        inherits: [
            "shop"
        ]
    }

    static public final skincare:TagData = {
        name: {
            en: "skincare",
            zh: "護膚品"
        }
    }

    static public final japanese:TagData = {
        name: {
            en: "japanese",
            zh: "日本/日式"
        }
    }

    static public final noodle:TagData = {
        name: {
            en: "noodle",
            zh: "麵"
        },
        inherits: [
            "food"
        ]
    }

    static public final sushi:TagData = {
        name: {
            en: "sushi",
            zh: "壽司"
        },
        inherits: [
            "japanese",
            "food"
        ]
    }

    static public final bar:TagData = {
        name: {
            en: "bar",
            zh: "酒吧"
        },
        inherits: [
            "food"
        ]
    }

    static public final vegeterian:TagData = {
        name: {
            en: "vegeterian",
            zh: "蛋奶素"
        }
    }

    static public final handcraft:TagData = {
        name: {
            en: "handcraft",
            zh: "手造"
        }
    }

    static public final thai:TagData = {
        name: {
            en: "thai",
            zh: "泰國/泰式"
        }
    }

    static public final korean:TagData = {
        name: {
            en: "korean",
            zh: "韓國/韓式"
        }
    }

    static public final taiwanese:TagData = {
        name: {
            en: "taiwanese",
            zh: "台灣/台式"
        }
    }

    static public final farm:TagData = {
        name: {
            en: "farm",
            zh: "農場"
        }
    }

    static public final cake:TagData = {
        name: {
            en: "cake",
            zh: "蛋糕"
        },
        inherits: [
            "food"
        ]
    }

    static public final hotpot:TagData = {
        name: {
            en: "hotpot",
            zh: "火鍋/雞煲"
        },
        inherits: [
            "food"
        ]
    }

    static public final cafe:TagData = {
        name: {
            en: "cafe",
            zh: "咖啡店"
        },
        inherits: [
            "food"
        ]
    }

    static public final foodStore:TagData = {
        name: {
            en: "food store",
            zh: "食材店"
        },
        inherits: [
            "food",
            "shop"
        ]
    }

    static public final hiking:TagData = {
        name: {
            en: "hiking",
            zh: "行山"
        },
        inherits: [
            "sport"
        ]
    }

    static public final pizza:TagData = {
        name: {
            en: "pizza",
            zh: "薄餅"
        },
        inherits: [
            "food"
        ]
    }

    static public final cooking:TagData = {
        name: {
            en: "cooking",
            zh: "烹飪"
        }
    }

    static public final hkbaseDirectory:TagData = {
        name: {
            en: "HKBASE directory",
            zh: "香港永續經濟聯會企業名冊"
        }
    }

    static public final removed:TagData = {
        name: {
            en: "removed",
            zh: "已移除"
        }
    }
}