package charleywong.entities;

class A4weekly implements Entity {
    public final id = "A4weekly";
    public final name = [
        zh => "A4上的飛行週記"
    ];
    public final webpages:Array<WebPage> = [
        {
            url: "https://www.facebook.com/A4weekly/",
            meta: [
                "id" => "243487246164261",
                "about" => "分享飛行趣事，只求大家看得開心，\n大家不妨分享在飛機上的有趣事情\n讓我在A4紙上活靈活現地呈現出來！",
                "categories" => [
                    "Blogger"
                ]
            ]
        }
    ];
    public final posts:Array<Post> = [
        {
            url: "https://www.facebook.com/A4weekly/photos/a.243487722830880/680673955778919/"
        },
        {
            url: "https://www.facebook.com/A4weekly/photos/a.243487722830880/653814801798168/"
        }
    ];
    public final tags:Array<Tag> = [
        artist,
        book
    ];
}

