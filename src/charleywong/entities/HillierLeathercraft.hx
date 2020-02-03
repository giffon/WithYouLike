package charleywong.entities;

class HillierLeathercraft implements Entity {
    public final id = "HillierLeathercraft";
    public final name = [
        en => "Hillier Leathercraft"
    ];
    public final webpages:Array<WebPage> = [
        {
            url: "http://hillierleather.com"
        },
        {
            url: "https://www.facebook.com/HillierLeathercraft/",
            meta: [
                "id" => "349930218534454",
                "about" => "皮革製品的獨一無二並不只是因為全人手縫制或度身訂造，\n而是每件皮具都會受用家的使用習慣而呈現出不同程度色澤及外型變化。\n\n我們希望在用家上看到皮革各種年月之變化。",
                "categories" => [
                    "Product/service",
                    "Event"
                ],
                "email" => "info@hillierleather.com",
                "tel" => "54053980"
            ]
        }
    ];
    public final posts:Array<Post> = [
        {
            url: "https://www.facebook.com/HillierLeathercraft/photos/a.350014358526040/1096393463888122/"
        }
    ];
    public final tags:Array<Tag> = [
        accessories
    ];
}

