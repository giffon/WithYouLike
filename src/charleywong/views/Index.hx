package charleywong.views;

import charleywong.browser.SearchBar;
import charleywong.EntityIndex;

class Index extends View {
    override public function description() return "一個開放源碼同開放數據嘅黃色經濟圈資料庫.";
    override function canonical() return ServerMain.domain;
    override public function render() {
        return super.render();
    }

    override function ogMeta() return jsx('
        <Fragment>
            <meta name="twitter:card" content="summary_large_image" />
            ${super.ogMeta()}
            <meta property="og:type" content="website" />
            <meta property="og:image" content=${Path.join([ServerMain.domain, R("/images/charley-meta.jpg")])} />
            <meta property="og:image:width" content="1200" />
            <meta property="og:image:height" content="630" />
        </Fragment>
    ');

    static public function searchForm(defaultQuery:String, autoFocus:Bool) return jsx('
        <div
            className="search-bar"
            data-default-query=${defaultQuery}
            data-auto-focus=${autoFocus}
        >
            <SearchBar
                defaultQuery=${defaultQuery}
                autoFocus=${autoFocus}
            />
        </div>
    ');

    override function bodyContent() {
        return jsx('
            <Fragment>
                <br/><br/><br/><br/>
                <div className="container max-w-screen-lg mx-auto px-4">
                    <div className="container-search">
                        <div className="relative">
                            <a href="/">
                                <img className="h-auto logo-c p-4 w-40 sm:w-48" src=${R("/images/charley-600-w.png")} alt="Charley Wong 和你查" width="1060" height="1060" />
                            </a>
                        </div>
                        <br/><br/><br/><br/>
                        <div className="flex flex-wrap justify-center">
                            <div className="py-5 px-4 md:p-12 lg:w-2/3">
                                <h2 className="text-xl md:text-3xl">今日想Charley幫你查咩?</h2>
                                ${searchForm("", true)}
                                <div className="p-1 color_black_o60 container-tags">
                                    <ul className="tags inline">
                                        <li><a href="/search/japanese%20food">日本菜</a></li>
                                        <li><a href="/search/coffee">咖啡</a></li>
                                        <li><a href="/search/burger">漢堡</a></li>
                                        <li><a href="/search/soap">番梘</a></li>
                                        <li><a href="/search/搬屋">搬屋</a></li>
                                        <li><a href=${"/" + HkbaseDirectoryView.path}>HKBASE企業名冊</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div className="py-4 md:p-12">
                            <p className="text-center">"一日一黃店 世界更美妙" - Charley</p>
                        </div>
                    </div>
                </div>
            </Fragment>
        ');
    }
}