package charleywong.entities;

class Nsquarecoffeebar implements Entity {
    public final id = "nsquare.coffeebar";
    public final name = [
        en => "Nsquare.coffeebar"
    ];
    public final webpages:Array<WebPage> = [
        {
            url: "https://www.facebook.com/nsquare.coffeebar/",
            meta: [
                "id" => "245810922792141",
                "about" => "Single Origin Coffee Bar est. 2018",
                "categories" => [
                    "Coffee shop"
                ],
                "addr" => "& square Coffee Bar, Zero Carbon Building, 8 Sheung Yuet Road, Kowloon Bay",
                "area" => "Hong Kong",
                "email" => "nsquarecoffeebar@gmail.com"
            ]
        },
        {
            url: "https://www.instagram.com/nsquare.coffeebar/"
        }
    ];
    public final posts:Array<Post> = [
        {
            url: "https://www.facebook.com/nsquare.coffeebar/photos/a.255308811842352/432312730808625/"
        },
        {
            url: "https://www.facebook.com/nsquare.coffeebar/photos/a.255308811842352/431617294211502/"
        }
    ];
    public final tags:Array<Tag> = [
        food
    ];
}

