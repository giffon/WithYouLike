package charleywong.entities;

class SonyaTravelPhotography implements Entity {
    public final id = "sonya.travel.photography";
    public final name = [
        en => "Sonya Travel & Photography"
    ];
    public final webpages:Array<WebPage> = [
        {
            url: "https://www.facebook.com/sonya.travel.photography/",
            meta: [
                "id" => "456115987855255",
                "about" => "旅遊人、非牟利組織 『i-Action』 創辦人、『輕背包』合夥人；前空姐、記者、NGO工作者；遊歷70+ 國家，愛以不同身份看世界、用照片說故事。\n\n邀稿／講座／合作，請PM或電郵 sonyafock@gmail.com :)",
                "categories" => [
                    "Personal blog"
                ]
            ]
        }
    ];
    public final posts:Array<Post> = [
        {
            url: "https://www.facebook.com/sonya.travel.photography/posts/1712749298858578"
        },
        {
            url: "https://www.facebook.com/sonya.travel.photography/posts/1887986504668189"
        }
    ];
    public final tags:Array<Tag> = [
        media,
        photographer
    ];
}

