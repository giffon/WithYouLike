package charleywong.entities;

class Butleung implements Entity {
    public final id = "butleung";
    public final name = [
        zh => "不良姑娘"
    ];
    public final webpages:Array<WebPage> = [
        {
            url: "https://www.facebook.com/butleung/",
            meta: [
                "id" => "456550791198758",
                "about" => "2015年畢業\n打滾三年後辭職去了世界的另一面\n2019年再度回歸...\n\n\nSee more",
                "categories" => [
                    "Personal blog"
                ]
            ]
        }
    ];
    public final posts:Array<Post> = [
        {
            url: "https://www.facebook.com/butleung/posts/1375518509301977"
        },
        {
            url: "https://www.facebook.com/butleung/posts/1242540535933109"
        }
    ];
    public final tags:Array<Tag> = [
        artist,
        medical
    ];
}

