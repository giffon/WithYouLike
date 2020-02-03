package charleywong.entities;

class DrCareAi implements Entity {
    public final id = "DrCareAi";
    public final name = [
        zh => "隨行醫生",
        en => "Dr Care"
    ];
    public final webpages:Array<WebPage> = [
        {
            url: "http://www.drcare.ai"
        },
        {
            url: "https://www.facebook.com/DrCareAi/",
            meta: [
                "id" => "2076696632356020",
                "about" => "每個人都需要一個醫護助理。\n我們創造的隨行醫生Carey是每個人的守護天使， 在人遇到困難時、生病時可以快速及時地得到幫助； 平日閒時亦可以和她聊天。 https://m.me/drcareai",
                "categories" => [
                    "Doctor",
                    "Healthcare administrator",
                    "Media/news company"
                ],
                "email" => "info@asiabots.com",
                "tel" => "35983639"
            ]
        }
    ];
    public final posts:Array<Post> = [
        {
            url: "https://www.facebook.com/DrCareAi/photos/a.2123527274339622/3438761559482847/"
        },
        {
            url: "https://www.facebook.com/DrCareAi/photos/a.2123527274339622/3391299547562382/"
        }
    ];
    public final tags:Array<Tag> = [
        medical,
        artist
    ];
}

