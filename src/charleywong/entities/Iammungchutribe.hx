package charleywong.entities;

class Iammungchutribe implements Entity {
    public final id = "iammungchutribe";
    public final name = [
        en => "Mung Chu Tribe",
        zh => "矇豬部落"
    ];
    public final webpages:Array<WebPage> = [
        {
            url: "https://www.facebook.com/iammungchutribe/",
            meta: [
                "id" => "1539189899630402",
                "about" => "一群矇豬眼族人在地球的生活點滴\n\n咩都畫, 無主題, 無重點, 求其畫, 得閒會露吓丁丁...\n\n\n\n\nSee more",
                "categories" => [
                    "Just for fun"
                ]
            ]
        },
        {
            url: "https://www.instagram.com/mungchutribe/"
        }
    ];
    public final posts:Array<Post> = [
        {
            url: "https://www.facebook.com/iammungchutribe/photos/a.1539195826296476/1709005245982199/"
        },
        {
            url: "https://www.facebook.com/iammungchutribe/posts/2394031090812941"
        },
        {
            url: "https://www.facebook.com/iammungchutribe/posts/2369625733253477"
        }
    ];
    public final tags:Array<Tag> = [
        artist
    ];
}

