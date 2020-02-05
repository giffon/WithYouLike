package charleywong.entities;

class Overpowerpchk implements Entity {
    public final id = "overpowerpchk";
    public final name = [
        en => "O.P PC Supply",
        zh => "奧鉑性價電腦器材"
    ];
    public final webpages:Array<WebPage> = [
        {
            url: "http://overpowerpc.com"
        },
        {
            url: "https://www.facebook.com/overpowerpchk/",
            meta: [
                "id" => "523403478185633",
                "about" => "O.P. - 源於英文電競術語 OverPower，即強得不合理之意。 O.P.為預算有限，本地學生入門級別電競玩家與及預算用家提供一個耐用，極高性能價格比之電競系統平台。",
                "categories" => [
                    "Electronics",
                    "Computers (brand)"
                ],
                "email" => "info@bsdahk.com",
                "tel" => "66938953"
            ]
        }
    ];
    public final posts:Array<Post> = [
        {
            url: "https://www.facebook.com/overpowerpchk/posts/729865797539399"
        },
        {
            url: "https://www.facebook.com/overpowerpchk/photos/a.551549418704372/705917279934251/"
        },
        {
            url: "https://www.facebook.com/overpowerpchk/posts/694152854444027"
        },
        {
            url: "https://www.facebook.com/overpowerpchk/posts/618385665354080"
        }
    ];
    public final tags:Array<Tag> = [
        computer,
        shop
    ];
}

