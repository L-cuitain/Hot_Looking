create database Hot_Info;

use Hot_Info;


-- 用户表
drop table if exists `users`;
create table `users`(
    `uId` INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '用户id',
    `avatar` VARCHAR(255) DEFAULT 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png' COMMENT '用户头像',
    `name` VARCHAR(40) NOT NULL COMMENT '用户名称',
    `account` VARCHAR(50) NOT NULL COMMENT '用户账号',
    `password` VARCHAR(100) NOT NULL COMMENT '用户密码'
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 用户订阅表
drop table if exists `users_sub`;
create table `users_sub`(
  `uId` INT NOT NULL COMMENT '用户id',
  `colId` VARCHAR(40) NOT NULL COMMENT '专题id',
  `subInfo` VARCHAR(20) NOT NULL DEFAULT '已订阅' COMMENT '订阅信息',
  PRIMARY KEY (uId,colId),
  FOREIGN KEY (uId) REFERENCES users (uId)
);

-- 资讯表
drop table if exists `news`;
create table `news`(
    `nId` VARCHAR(40) NOT NULL PRIMARY KEY COMMENT '资讯id',
    `img` VARCHAR(255) NOT NULL COMMENT '资讯图片',
    `title` VARCHAR(100) NOT NULL COMMENT '资讯标题',
    `summary` VARCHAR(120) NOT NULL COMMENT '资讯摘要',
    `content` VARCHAR(10000) COMMENT '资讯内容',
    `contentImg` VARCHAR(255) NOT NULL COMMENT '资讯内容图片',
    `releaseTime` DATETIME NOT NULL COMMENT '发布时间',
    `likes` INT DEFAULT 0 COMMENT '点赞数',
    `category` VARCHAR(40) NOT NULL DEFAULT 'new' COMMENT '所属类别',
    `uId` INT NOT NULL COMMENT '用户id(发布者)',
    `lId` VARCHAR(40) NOT NULL COMMENT '标签id',
    `colId` VARCHAR(40) COMMENT '专题id',
    FOREIGN KEY (uId) REFERENCES users (uId),
    FOREIGN KEY (lId) REFERENCES label (lId),
    FOREIGN KEY (colId) REFERENCES collections (colId)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 资讯评论表
drop table if exists `news_comment`;
create table `news_comment`(
  `nId` VARCHAR(40) NOT NULL COMMENT '评论的资讯id',
  `uId` INT NOT NULL COMMENT '用户id',
  `content` VARCHAR(100) DEFAULT '失踪人口回归' NOT NULL COMMENT '评论内容',
  `commentTime` DATETIME DEFAULT '2022-02-18 19:20:23' NOT NULL COMMENT '评论时间',
  FOREIGN KEY (nId) REFERENCES news (nId),
  FOREIGN KEY (uId) REFERENCES users (uId)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 文章表
drop table if exists `articles`;
create table `articles`(
    `aId` VARCHAR(40) NOT NULL PRIMARY KEY COMMENT '文章id',
    `img` VARCHAR(255) NOT NULL COMMENT '文章封面',
    `title` VARCHAR(100) NOT NULL COMMENT '文章标题',
    `summary` VARCHAR(120) NOT NULL COMMENT '文章摘要',
    `content` VARCHAR(10000) COMMENT '文章内容',
    `contentImg` VARCHAR(255) NOT NULL COMMENT '文章内容图片',
    `releaseTime` DATETIME NOT NULL COMMENT '发布时间',
    `likes` INT DEFAULT 0 COMMENT '点赞数',
    `category` VARCHAR(40) NOT NULL DEFAULT 'article' COMMENT '所属类别',
    `uId` INT NOT NULL COMMENT '用户id(发布者)',
    `lId` VARCHAR(40) NOT NULL COMMENT '标签id',
    `colId` VARCHAR(40) COMMENT '专题id',
    FOREIGN KEY (uId) REFERENCES users (uId),
    FOREIGN KEY (lId) REFERENCES label (lId),
    FOREIGN KEY (colId) REFERENCES collections (colId)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 文章评论表
drop table if exists `articles_comment`;
create table `articles_comment`(
  `aId` VARCHAR(40) NOT NULL COMMENT '评论的文章id',
  `uId` INT NOT NULL COMMENT '用户id',
  `content` VARCHAR(100) DEFAULT '加油呀，期待更多的文章' NOT NULL COMMENT '评论内容',
  `commentTime` DATETIME DEFAULT '2022-02-18 19:20:23' NOT NULL COMMENT '评论时间',
  FOREIGN KEY (aId) REFERENCES articles (aId),
  FOREIGN KEY (uId) REFERENCES users (uId)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 视频表
drop table if exists `videos`;
create table `videos`(
    `vId` VARCHAR(40) NOT NULL PRIMARY KEY COMMENT '视频id',
    `img` VARCHAR(255) NOT NULL COMMENT '视频封面',
    `title` VARCHAR(100) NOT NULL COMMENT '视频标题',
    `summary` VARCHAR(255) NOT NULL COMMENT '视频摘要',
    `content` VARCHAR(255) NOT NULL COMMENT '视频文章',
    `contentImg` VARCHAR(255) NOT NULL COMMENT '视频图片',
    `url` VARCHAR(255) NOT NULL COMMENT '视频地址',
    `releaseTime` DATETIME NOT NULL COMMENT '发布时间',
    `likes` INT DEFAULT 0 COMMENT '点赞数',
    `category` VARCHAR(40) NOT NULL DEFAULT 'video' COMMENT '所属类别',
    `uId` INT NOT NULL COMMENT '用户id(发布者)',
    `lId` VARCHAR(40) NOT NULL COMMENT '标签id',
    `colId` VARCHAR(40) COMMENT '专题id',
    FOREIGN KEY (uId) REFERENCES users (uId),
    FOREIGN KEY (lId) REFERENCES label (lId),
    FOREIGN KEY (colId) REFERENCES collections (colId)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 视频评论表
drop table if exists `videos_comment`;
create table `videos_comment`(
  `vId` VARCHAR(40) NOT NULL COMMENT '评论的视频id',
  `uId` INT NOT NULL COMMENT '用户id',
  `content` VARCHAR(100) DEFAULT '学到了' NOT NULL COMMENT '评论内容',
  `commentTime` DATETIME DEFAULT '2022-02-18 19:20:23' NOT NULL COMMENT '评论时间',
  FOREIGN KEY (vId) REFERENCES videos (vId),
  FOREIGN KEY (uId) REFERENCES users (uId)
)ENGINE=INNODB DEFAULT CHARSET=utf8;



-- 专题表
drop table if exists `collections`;
create table `collections`(
    `colId` VARCHAR(40) NOT NULL PRIMARY KEY COMMENT '专题id',
    `colImg` VARCHAR(255) NOT NULL COMMENT '专题图片',
    `colTitle` VARCHAR(100) NOT NULL COMMENT '专题标题',
    `colSummary` VARCHAR(255) NOT NULL COMMENT '专题摘要',
    `colTime` DATETIME NOT NULL COMMENT '专题创建时间',
    `colNum` INT DEFAULT 0 COMMENT '订阅人数',
    `lId` VARCHAR(40) NOT NULL COMMENT '标签id',
    FOREIGN KEY (lId) REFERENCES label (lId)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 标签表
drop table if exists `label`;
create table `label`(
    `lId` VARCHAR(40) NOT NULL COMMENT '标签id',
    `lName` VARCHAR(50) NOT NULL COMMENT '标签名称',
    PRIMARY KEY (lId)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 添加用户
insert into users(name,account,password) VALUES ('张三','12345','1234');
insert into users(name,account,password) VALUES ('admin','5134235','1234');
insert into users(name,account,password) VALUES ('里斯','63234532','1234');
insert into users(name,account,password) VALUES ('火车王','2353243','1234');
insert into users(name,account,password) VALUES ('王武','6423532','1234');
insert into users(name,account,password) VALUES ('找刘','2324325','1234');
insert into users(name,account,password) VALUES ('枸杞子','7435432','1234');
insert into users(name,account,password) VALUES ('前锋萨','3535432','1234');
insert into users(name,account,password) VALUES ('广大色','7435562','1234');
insert into users(name,account,password) VALUES ('还堵车','5433432','1234');
insert into users(name,account,password) VALUES ('话费单','8433432','1234');
insert into users(name,account,password) VALUES ('亚热带','3445432','1234');
insert into users(name,account,password) VALUES ('嘎粉','6425432','1234');
insert into users(name,account,password) VALUES ('霍尔瓦特','1427432','1234');
insert into users(name,account,password) VALUES ('呢认同','2245432','1234');
insert into users(name,account,password) VALUES ('i与','6325432','1234');
insert into users(name,account,password) VALUES ('清道夫','8575432','1234');
insert into users(name,account,password) VALUES ('去嘎','8995432','1234');
insert into users(name,account,password) VALUES ('特旺','2345432','1234');
insert into users(name,account,password) VALUES ('hired','1325432','1234');

-- 添加资讯
insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N001',
'https://image.gcores.com/61e0a5ad-d0c8-47b0-9cd4-e0031c9a5dd5.jpeg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'乐博睿酒馆之新闻慢递第十四期','新闻慢递将不定期汇总TRPG和桌面游戏等相关新闻、旧闻和梗图，传递资讯之余博大家一笑，如有新闻价值，纯属巧合。',
'12月20日是D20日！（大概因为12月是December吧。）这样一年就有两个TRPG节日了，一个是3月4日的主持人节，一个就是12月20日的D20日。
为了庆祝这一节日，WOTC在官网发布了免费模组供玩家下载。
WOTC精选了D&D核心套装里的内容，组成了这个模组，里面包含生物、预设角色卡、魔法物品等信息，很适合让新人入坑。
',
'https://image.gcores.com/61e0a5ad-d0c8-47b0-9cd4-e0031c9a5dd5.jpeg',
'2022-02-23 09:21:20',
421,1,'L01','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N002',
'https://image.gcores.com/dc25d3b3-cb94-4fb3-82c4-171a30e10b96.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'戏剧影像与互动电影批判','西方电影的发展多受到20世纪初叶美术革命的影响，而我国电影发展则与传统曲艺有着更紧密的不可分割关系',
'有别于西方戏剧影像，东方戏曲影像陷溺于另一种美学困境。二者都是早期电影艺术发展的重要脉络，但彼此的形态结构均不相同。针对这种考察讨论，我国戏曲电影就是一个完美样本。
诸如日韩、东南亚、西亚也有本土戏剧电影或曲艺电影（尤其日本的戏剧影像展在国内很受欢迎），但它们都不如中国戏曲片在表意特征上与西方戏剧影像差别显著。戏曲片伴随着中国电影的诞生，我国第一部电影便是任庆泰拍摄、谭鑫培出演的《定军山》。因此，从各个角度来说，戏曲都是中国人长期以来理解电影的有效方式。遗憾的是，如此历史悠久的影像表现形式，经过一百多年的摸索，仍在美学内核和艺术创造力上存在着重大缺陷。
',
'https://image.gcores.com/dc25d3b3-cb94-4fb3-82c4-171a30e10b96.jpg',
'2022-02-24 06:45:35',
75,1,'L05','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N003',
'https://image.gcores.com/35f4ca15-5ead-42bb-9c51-0e3dd4db029f.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'宫崎英高再创新高：《艾尔登法环》媒体评分汇总','2月25日不见不散',
'随着由 FromSoftware 开发、万代南梦宫游戏发行的《艾尔登法环》 动作 RPG 游戏将于本周五解锁，评分聚合网站 MetaCritic 也整合了各家媒体的评分。截至发稿前，本作的平均分为97分(满分100分) ，创下了宫崎英高所制作游戏的全新记录，也让其获得了 MetaCritic “必玩”殊荣的游戏之一。
',
'https://image.gcores.com/35f4ca15-5ead-42bb-9c51-0e3dd4db029f.jpg',
'2022-02-24 07:15:20',
2,1,'L02','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N004',
'https://image.gcores.com/ff593813-25cc-479c-9e7d-3439ba3a67eb.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'V社上线Steam Deck游戏库检查工具','每天都会持续测试和支持更多游戏',
'随着首批 Steam Deck 将于本月发货，V社于今日上线了 Steam Deck 游戏库检查工具，让玩家一目了然查看已购游戏兼容性。需要注意的是，本次游戏的验证和提示并不影响玩家随心所欲的在 Steam Deck 游玩任何游戏。与之相反，兼容性认证系统的目的也是让玩家可轻松获得精彩非凡的游戏体验，允许用户在下载和运行游戏前便知晓兼容程度如何。
',
'https://image.gcores.com/ff593813-25cc-479c-9e7d-3439ba3a67eb.png',
'2022-02-24 08:12:42',
64,3,'L03','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N005',
'https://image.gcores.com/702e954e-1450-45fc-a64b-8e21ea51f992.jpg?x-oss-process=image/resize,limit_1,m_fill,w_1500,h_840/quality,q_90',
'“现在几点钟了？”——《困在时间里的父亲》，一部披着悬疑片外皮的家庭片',
'阿尔兹海默症，患者若找唯一的形容词，或许便只有“混乱感”',
'在电影市场被好莱坞三段式影片和漫威超英主题公园式的影片几乎抢占殆尽的背景下，有人不卑不亢地交出了一部内核古朴的文艺长片：《困在时间里的父亲》。该片由导演佛罗莱恩·泽勒的同名舞台剧改编，安东尼·霍普金斯主演同名角色。
电影的故事内核并不复杂：一位患有阿尔兹海默症（下文简称为AD）的老人安东尼在晚年受疾病影响，在妄想中，把过去不同时间不同地点的回忆进行了拼接，最终陷入到空间与时间相消弭带来的痛苦中。他无法适应丢失记忆能力和自理能力的自己，将自己的公寓、女儿的公寓、养老院三者的空间相混淆，构建了一个脑中的空间。
虽然这些年有关AD主题的电影并不鲜见，但该片却凭借其出彩之处于同类型片中脱颖而出：这是一部披着悬疑片外皮的家庭片。
',
'https://image.gcores.com/702e954e-1450-45fc-a64b-8e21ea51f992.jpg',
'2022-02-24 10:15:24',
83,4,'L05','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N006',
'https://image.gcores.com/af27e17c-bee5-4a58-8ae2-87f1d0f0e8ef.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'NETFLIX与法国电影协会缔结合作协议',
'每年投资额下限4500万美元，院线窗口期15个月',
'NETFLIX与法国电影协会达成一项为期三年的协议，每年投资至少4500万美元，用来制作在法国院线上映的法国本土电影或欧洲产电影。
此前，根据法国相关法律，NETFLIX已与法国视听监管机构CSA签署协议，将其在法国年收入的五分之一（2.25亿美元）用于制作法国本土影视内容，而用于投资院线电影的金额占年收入4%。此次与法国电影协会达成的协议，可以视为对CSA协议的落实。
根据协议，NETFLIX投资的所有法国电影或在法国上映的欧洲电影，必须在法国影院首映，然后可以在15个月的窗口期之后，在NETFLIX法国区独家上架7个月。
在NETFLIX与法国电影协会的协议中，还包含了扶持独立电影的条款。NETFLIX必须落实，在每年投向法国和欧洲院线电影的资金中，至少有17%的金额，用于投资成本低于400万欧元的独立电影，且需要在预融资阶段对不低于10部电影进行投资。
',
'https://image.gcores.com/af27e17c-bee5-4a58-8ae2-87f1d0f0e8ef.jpg',
'2022-02-23 12:54:35',
46,5,'L05','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N007',
'https://image.gcores.com/b8fa4b8f-f59c-4839-b5cb-a2f9e9175343.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'GOG：无官方支持Steam Deck计划，可在设备安装Windows游玩','首批Steam Deck将于2月底出货',
'CD Projekt Red 母公司旗下无 DRM 数字分销平台 GOG 于近日表示，官方并没有支持V社旗下 Steam Deck 的计划。话虽如此，有鉴于设备的开放架构，据他们所知玩家可以安装 Windows ，从而游玩 GOG 的游戏。
需要注意的是，由于 Steam Deck 的内置系统 SteamOS 是基于 Arch Linux 开发，因此玩家还可以通过名为 Lutris 的开源平台游玩  GOG 游戏。此外，GOG 的不少用户一直希望公司能将 GOG  Galaxy 带入 Linux ，因此今后也不排除能在 SteamOS 中原生运行。
随着首批 Steam Deck 将于本月底发货，相应的游戏验证项目的工作和测试也在展开。截止发稿前，共有645款游戏经过V社认证可以在 Steam Deck 游玩，而包括 Linus Tech Tips 在内的知名博主对其的初步评价也相当之高。
',
'https://image.gcores.com/b8fa4b8f-f59c-4839-b5cb-a2f9e9175343.jpg',
'2022-02-22 08:34:12',
91,6,'L03','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N008',
'https://image.gcores.com/6fcb41a3-0c98-46a3-aef5-c2ab27f11249.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'到底啥味？可口可乐推出太空科幻口味“星光”','想象不出来',
'可口可乐推出了“Coca-Cola Creations”系列产品，第一款口味名为“星光”（starlight）。目前该口味已经在2月21日于美国上市。
与一贯具体的“樱桃”“香草”等口味不同，“星光”听起来非常抽象。该产品有普通和无糖两种选择，官方表示“星光”的灵感来自太空，能让人联想到篝火边观星的感觉，还能让人们联想到太空的凉意。
官方称，“星光”的创作灵感是，在宇宙的某个地方、在具有无限可能性的世界里，可能存在另一种可口可乐，以另一种方式使人们紧密相连。他们计划在今年推出更多限量版的可口可乐创意产品。
',
'https://image.gcores.com/6fcb41a3-0c98-46a3-aef5-c2ab27f11249.jpg',
'2022-02-21 19:42:18',
41,7,'L04','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N009',
'https://image.gcores.com/1de3bf2f-48fc-4aae-9477-9f96a7d1d69f.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'育碧公布《彩虹六号》电竞路线图，世界杯延期至2023年','国际锦标赛第1阶段将于5月开赛',
'育碧于现已公布《彩虹六号》的最新电竞路线图，揭晓第7年度以及之后的规划。除了为广大社群推出的《彩虹六号：围攻行动》内容与更新以及以电竞为重的新游戏功能之外，开发团队也带来了全球巡回赛以及世界杯的最新计划，详情如下：
添加观察者栏位，提升在线对战的实况品质
这项功能将于今年春天游戏第 7 年第 2 季推出，团队很兴奋能宣布将有 3 个额外观察者栏位会加入自订在线游戏，最多共有 4 个专属的观察者栏位。由于竞技巡回赛有重要的一环是在赛季期间以在线方式进行，团队一直在寻找能够让在线赛事享有与线下（LAN）赛事相同实况品质的方式。有了这些额外字段，不论是地区联赛、当地比赛，还是由第三方比赛筹划者规划的赛事，粉丝都能更清楚了解任何在线赛事的对战过程。
',
'https://image.gcores.com/1de3bf2f-48fc-4aae-9477-9f96a7d1d69f.jpg',
'2022-02-21 14:32:24',
28,8,'L01','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N010',
'https://image.gcores.com/7a3fe253-54e0-436b-9750-31dc036ccfb2.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'第40届香港电影金像奖公布提名名单，《智齿》成获奖热门','林家栋获影帝双提',
'近日，第40届香港电影金像奖提名名单正式公布。犯罪悬疑片《智齿》获得包括最佳电影、最佳导演等14个大奖的提名，成为获奖热门。最佳电影将在《怒火·重案》《梅艳芳》《智齿》《妈妈的神奇小子》《浊水漂流》争夺最佳电影。
老牌演员林家栋凭借在电影《手卷烟》、《智齿》中的出色表现，获得最佳男主角奖双提名。而此前呼声颇高的《怒火·重案》主演谢霆锋和《拆弹专家2》主演刘德华，却没有获得该奖项的提名。
',
'https://image.gcores.com/7a3fe253-54e0-436b-9750-31dc036ccfb2.jpg',
'2022-02-22 15:42:23',
982,8,'L05','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N011',
'https://image.gcores.com/de2a26f4-aa63-48ab-a39f-cb205aea73d7.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'第72届柏林国际电影节公布获奖名单','《阿尔卡拉斯》获得最佳影片金熊奖',
'北京时间2月17日，第72届柏林国际电影节获奖名单出炉， 卡拉·西蒙凭借《阿尔卡拉斯》获得最佳影片金熊奖， 洪尚秀凭借《小说家的电影》获得评审团大奖， 克莱尔·德尼凭借《双刃剑》斩获最佳导演奖，由于最佳男女主角奖合二为一，今年的最佳主角奖由《库尔纳兹诉小布什》的主演梅尔滕·卡普坦获得。
',
'https://image.gcores.com/de2a26f4-aa63-48ab-a39f-cb205aea73d7.jpg',
'2022-02-22 16:31:42',
52,9,'L05','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N012',
'https://image.gcores.com/415a03d8-b32b-48b3-8597-abd99a797d83.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'倒计时结束！卡普空正式公布《街头霸王6》','Lets Go！',
'随着 CAPCOM PRO TOUR 2021 Season Final 比赛的结束，此前的神秘倒计时网站归零，《街头霸王6》正式公开！官方将于今年夏季带来有关《街霸6》的更多消息。同时，作为《街霸》系列35周年纪念，还会同时推出复古格斗游戏合集《CAPCOM FIGHTING COLLECTION》。其中除了《街霸》相关作品外，将有第一次移植到家用机的《赤色大地（Warzard）》以及《恶魔战士（Vampire）》系列全5作等。该合集收录了10款卡普空对战格斗游戏，将于2022年6月24日登陆PS4、Nintendo Switch、Steam及Xbox One。
',
'https://image.gcores.com/415a03d8-b32b-48b3-8597-abd99a797d83.jpg',
'2022-02-23 11:42:24',
532,10,'L01','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N013',
'https://image.gcores.com/9ca1b238-5d49-41b0-b1d8-e09b8df5aab5.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'瑞恩·雷诺兹主演科幻电影《亚当计划》放出首支片段','3月11日登陆 Netflix 流媒体平台',
'
昨晚，由肖恩·利维执导、瑞恩·雷诺兹主演的科幻电影《亚当计划》放出首支片段，本片预计将于今年3月11日登陆 Netflix 流媒体平台。
 《亚当计划》原剧本故事由T·S·诺林于2012年10月完成，当时暂定名为《我们的名字叫亚当》（Our Name Is Adam）。派拉蒙影业曾对这一剧本表达过兴趣，并希望汤姆·克鲁斯担任主演。其后，Netflix 于2020年7月获得了这一剧本，并确定将由肖恩·利维担任导演、瑞恩·雷诺兹担任主演。此外，佐伊·索尔达娜、马克·鲁弗洛、詹妮弗·加纳等人亦将参演本片。
',
'https://image.gcores.com/9ca1b238-5d49-41b0-b1d8-e09b8df5aab5.jpg',
'2022-02-22 11:23:52',
14,10,'L05','COL003');                                                                       ;

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N014',
'https://image.gcores.com/b8fa4b8f-f59c-4839-b5cb-a2f9e9175343.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'先睹为快！SIE公布PlayStation VR2外观设计','我觉得看着还不错',
'SIE 在今晚公布了 PlayStation VR2 的外观设计，据介绍其设计语言为“球状”外观，圆球形状代表了玩家在进入 VR 世界时所感受到的360°视角。同时，官方针对人体工程学有了进一步的设计与测试，能够确保玩家在游玩体验时获得最佳舒适感以至于忘记了设备本身。可调整眼罩与全新的镜头调整罗盘以及可调整的双眼与镜头距离都能让所有玩家都可以获得最舒适的游玩体验。
',
'https://image.gcores.com/b8fa4b8f-f59c-4839-b5cb-a2f9e9175343.jpg',
'2022-02-23 13:41:56',
69,10,'L03','COL001');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N015',
'https://image.gcores.com/8372fbc0-3e03-4770-9d31-f35e46087d60.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'万智牌最新密室珍藏：神河相关产品开始预售','最重要的街霸当然值得单独宣传，在“等等”当中威世智也安排了众多神河相关的密室珍藏',
'这一期密室珍藏的头牌自然是与街霸联动的产品，但除此之外，威世智也为神河这个日式环境准备了其他七款收藏（剁手）佳品。
1.赛博地套装
这次的密室珍藏中推出了艺术家Ben Schnuck描绘的符合神河赛博空间感觉的合成器浪潮风格大画基本地。

2.“和风”掩蔽地套装
在此次神河环境推出的“和风”基本地的基础上，威世智也邀请日本艺术家们以洛温环境的掩蔽地为题创作了符合神河风格的一套五张掩蔽地。
',
'https://image.gcores.com/8372fbc0-3e03-4770-9d31-f35e46087d60.jpg',
'2022-02-22 16:31:52',
37,11,'L04','COL001');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N016',
'https://image.gcores.com/ec6688fc-1739-449f-8fae-9847fc22691a.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'因不当言论，职业玩家遭解约丨格斗游戏资讯一周回顾','170cm以下：？？？',
'因发表不当言论，《铁拳》职业女玩家遭俱乐部解约
日本《铁拳》职业女玩家Tanukana近期因发表不当言论遭俱乐部解约。事情起因是其在直播中谈到她以前被外卖小哥搭讪，但因对方身高太矮，所以拒绝了对方。Tanukana随后继续说出了“身高低于170cm的男性是没有人权的，低于170cm的人应该考虑做增高手术”等不当言论。
',
'https://image.gcores.com/ec6688fc-1739-449f-8fae-9847fc22691a.jpg',
'2022-02-23 15:47:39',
145,12,'L02','COL002');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N017',
'https://image.gcores.com/1a1547f4-3acd-408d-a9ea-105e6f5c36a9.jpeg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'2022年2月第三周手办模型情报总汇','本周有假面骑士、数码暴龙、勇者莱汀等手办模型情报',
'1RIOBOT 勇者莱汀
由千值练出品的RIOBOT 勇者莱汀 成品玩具，于2月14号正式开启预定，无比例，全高约18cm，售价22000円(含税)，预计8月发售。

异度神剑2 尼娅
由GSC出品的异度神剑2 尼娅 手办模型，于2月15号正式开启预定，1/7比例，全高约31cm，售价26000円(含税)，预计23年6月发售。

心跳文艺部 莫妮卡 黏土人
由GSC出品的心跳文艺部 莫妮卡 黏土人，于2月15号正式开启预定，无比例，全高约10cm，售价6900円(含税)，预计10月发售。
',
'https://image.gcores.com/1a1547f4-3acd-408d-a9ea-105e6f5c36a9.jpeg',
'2022-02-23 10:12:21',
78,12,'L04','COL002');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N018',
'https://image.gcores.com/fba0a97e-bc8b-4fbd-8d3e-15dde80994ee.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《师父》即将加入中文配音，将于下周公开更多消息','及豪华版的额外礼物',
'武术题材动作游戏《师父》已在本月初发售并受到广大玩家和媒体的一致好评。今日开发商 Sloclap 在游戏的官方推特上宣布，游戏即将加入中文配音，并将于下周公开更多消息，另外也将会为购买了《师父》豪华版的玩家带来新的礼物。
',
'https://image.gcores.com/fba0a97e-bc8b-4fbd-8d3e-15dde80994ee.jpg',
'2022-02-22 12:52:12',
94,13,'L01','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N019',
'https://image.gcores.com/cea0cbb9-6316-4cd8-8aa2-147d89cc951c.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'下周节目预告2.21~2.27','硬货节目不老少',
'大家好！下周节目如图所示。下周依然是干货节目满满的一周，2月大作自然是《艾尔登法环》了，而我们还将为大家继续放出该游戏的相关内容。而除此之外，还会有《游戏茶话会》、《苏联美学》、《动视暴雪的前世今生》的最新一集。大巴老师为我们也开了全新系列节目，喜欢《九怨》的朋友们不容错过。
除此之外，还会有《天天ACG》和《游戏新闻》的相关节目，祝大家周末愉快！
',
'https://image.gcores.com/cea0cbb9-6316-4cd8-8aa2-147d89cc951c.jpg',
'2022-02-20 20:23:52',
56,14,'L02','COL003');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N020',
'https://image.gcores.com/ad2dca00-f2e2-4c8b-83ea-f763ad951965.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'支持光追：卡普空宣布《生化危机7》、《生化危机2：重制版》及《生化危机3：重制版》即将迎来次世代版','此前的玩家可获免费升级',
'卡普空于今日通过社交媒体宣布，《生化危机7》、《生化危机2：重制版》及《生化危机3：重制版》将以次世代版形式登录 PlayStation 5 、Xbox Series X|S 及 Steam  。在次世代版中，由“RE ENGINE”制作的系列杰作将进化至一个新的层次，在新版本中均可支持光线追踪、高帧率和 3D AUDIO 等。',
'https://image.gcores.com/ad2dca00-f2e2-4c8b-83ea-f763ad951965.jpg',
'2022-02-23 09:21:20',
34,15,'L01','COL004');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N021',
'https://image.gcores.com/8a2e828c-c177-45e2-8cca-261b4e156021.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《蜡笔小新 我与博士的暑假～永不结束的七日之旅～》中文版将于5月4日发售','预购特典、中文官网同步公开',
'代理商杰仕登宣布，由 Millennium Kitchen 开发、Neos Corporation 发行，在日本发售便受到广大回响以及好评的 Nintendo Switch 冒险游戏《蜡笔小新 我与博士的暑假 ～永不结束的七日之旅～》，其收录中文配音的完全中文版发售日，确定将订为5月4日。同时，官方也同步揭晓亚洲中文版独家预购特典以及中文官网信息。
',
'https://image.gcores.com/8a2e828c-c177-45e2-8cca-261b4e156021.jpg',
'2022-02-20 21:24:30',
23,16,'L01','COL004');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N022',
'https://image.gcores.com/fa1944f1-c90d-4643-8f7e-bef9449331fa.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'又来神秘新作！日本一新作宣传网页公开','会是什么题材呢',
'2月21日，日本一公开了新作的宣传页面，目前还未公布新作详情。
宣传页为点阵风格的界面，玩家可操纵人物在看似研究设施中的场景里移动和探索，很多物体都可点击探索。
宣传页预计每天都会更新，详情请期待续报。
',
'https://image.gcores.com/fa1944f1-c90d-4643-8f7e-bef9449331fa.jpg',
'2022-02-20 14:43:24',
27,17,'L04','COL005');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N023',
'https://image.gcores.com/b19e292c-6b44-45db-a09f-46276a46bb23.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'J. K. 罗琳搭档斯蒂芬·弗雷，BBC纪录片《神奇动物：自然历史》发布预告','2月27日上线',
'由 J. K. 罗琳搭档斯蒂芬·弗雷主持的 BBC 纪录片《神奇动物：自然历史》发布正式预告，将于2月27日上线。
《神奇动物：自然历史》预告
本片由 J. K. 罗琳与斯蒂芬·弗雷共同录制，他们将共同探索魔法世界中，那些神奇动物背后的灵感来源，以及它们与“麻瓜世界”中动物的相似之处。
斯蒂芬·弗雷此前曾录制过《哈利·波特》有声书，在《神奇动物：自然历史》中他将踏上一段梦幻之旅，与地球上存在的神奇动物们近距离接触。
',
'https://image.gcores.com/b19e292c-6b44-45db-a09f-46276a46bb23.jpg',
'2022-02-19 23:14:24',
29,18,'L05','COL005');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N024',
'https://image.gcores.com/95c5cbe9-687a-4c4a-a600-76921a0a4744.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《McPixel》系列新作《像素哥3》将于2022年登陆PC等多个平台','是的，没有《像素哥2》',
'由独立游戏开发者 Sos Sosowski 创作，Devolver Digital 发行的“Devolver”风游戏《像素哥3》将于2022年登陆PC及其它平台。前作《像素哥》于2012年发售，并在 Steam 上获得了特别好评（86%）”的玩家评价。此次发售的《像素哥3》的最低配置要求为1995年发售的奔腾四处理器。
',
'https://image.gcores.com/95c5cbe9-687a-4c4a-a600-76921a0a4744.png',
'2022-02-19 20:34:16',
12,19,'L01','COL006');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N025',
'https://image.gcores.com/897578a1-8df6-4d9a-b623-13fa71768a00.gif?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'Epic游戏用户数超5亿，官方展望元宇宙和2022年新兴趋势','元宇宙生态系统',
'随着元宇宙概念成为了下一个风口，Epic 于近日在其官网发文展望了元宇宙和2022年可能迎来的最大科技热潮。同时，官方还揭晓了一些2021年的统计数据，揭示实时3D技术的应用热潮。据悉，Epic 游戏的注册账户现已经超过5亿，《堡垒之夜》、《火箭联盟》和 Epic 游戏商城中的好友关系达27亿条。 详情如下：
建立元宇宙生态系统
越来越多的人已开始在社交环境中享受虚拟世界的乐趣。他们不仅仅是在这些世界中玩游戏，也在以新方式体验音乐，观看电影，探索艺术，与朋友闲度时光。要确切描绘元宇宙的形态，现在仍为时过早，但 Epic 认为，它是一个共享的3D社交世界，具有持久性、可探索性、可调节性和商业性。它将由所熟知的互联网演变而来，而实时3D技术将构建起它的基础。
',
'https://image.gcores.com/897578a1-8df6-4d9a-b623-13fa71768a00.gif',
'2022-02-20 13:42:21',
21,19,'L02','COL006');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N026',
'https://image.gcores.com/c974f0a3-51d1-4535-90fe-d2aee86de6cd.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'在极简网络世界中穿梭时间，《Time Rift》现已发售','新游戏来啦~',
'大家好呀，你们萌萌的小发行独立方舟又带来新游戏啦~这次是一款快节奏的休闲小游戏《Time Rift时空裂隙》。这一款巧妙地融合了射击、解谜、操作、屏幕卷轴等元素的快节奏动作解密游戏。游戏通过极其简单的“网络世界”和独特的讲述方式，给玩家呈现了一个惊险刺激又重峦叠嶂的黑客故事。虽然游戏体量不大，但独特的游戏设计和玩法，相信会给大家带来不一样的体验。
',
'https://image.gcores.com/c974f0a3-51d1-4535-90fe-d2aee86de6cd.jpg',
'2022-02-21 08:22:31',
22,16,'L01','COL007');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N027',
'https://image.gcores.com/a5cac383-5b96-4f08-8f38-e3c80f3b5fed.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'爱情电影《花束般的恋爱》将于2月22日登陆内地院线','本片此前于去年1月29日在日本公映',
'本片由日剧大神级编导土井裕泰担任导演，坂元裕二担任编剧，这是两人继《四重奏》之后首度合作的全新作品。其他演员阵容还包括小田切让、押井守、清原果耶、小林薰等人。
《花束般的恋爱》讲述的是一对男女在东京明大前站错过了最后一部电车而偶然相遇开始的故事。志同道合的男女主人公，瞬间坠入爱河，大学毕业后一边做自由职业者一边开始同居，影片展现了他们在迷茫前行时的模样。
',
'https://image.gcores.com/a5cac383-5b96-4f08-8f38-e3c80f3b5fed.jpg',
'2022-02-21 13:42:22',
94,17,'L05','COL007');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N028',
'https://image.gcores.com/d5b84d3d-1ad2-4529-97c2-9327aee9b2ba.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'新版《蝙蝠侠》正式确定将于3月18日登录内地院线','本片将于3月4日登录北美院线',
'今天下午，根据官方消息，马特·里夫斯执导、罗伯特·帕丁森主演的新版《蝙蝠侠》确定将于3月18日登录内地院线。
此次的《新蝙蝠侠》由《猩球崛起》《科洛弗档案》导演马特·里夫斯执导，罗伯特·帕丁森将在本片中饰演“蝙蝠侠”布鲁斯·韦恩，“猫女”赛琳娜·凯尔将由佐伊·克罗维兹饰演，保罗·达诺则将饰演“谜语人”，科林·法瑞尔将饰演“企鹅人”，安迪·瑟金斯将饰演韦恩家管家阿福，杰弗里·怀特则将饰演戈登警长。另外，彼得·萨斯加德、约翰·特托罗、巴里·基奥恩等人亦将出演本片。
',
'https://image.gcores.com/d5b84d3d-1ad2-4529-97c2-9327aee9b2ba.jpg',
'2022-02-21 15:47:56',
86,20,'L05','COL008');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N029',
'https://image.gcores.com/bb0672c5-cdce-43ab-90a7-ee401fa6d489.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《神秘海域》真人电影确定将于3月14日登录内地院线','本片即将于2月18日登录北美院线',
'今天下午，根据官方消息，由汤姆·赫兰德、马克·沃尔伯格等人主演的《神秘海域》真人版电影正式确定，将于今年3月14日登录内地院线。
《神秘海域》真人电影由鲁本·弗雷斯彻执导。据悉，本片将扩充《神秘海域3》中曾提到过的，内森·德雷克与他的导师维克托·苏利文初次相遇的故事。汤姆·赫兰德在本片中所饰演的德雷克年龄设定为24岁，而马克·沃尔伯格则将出演德雷克的导师维克托·苏利文。
',
'https://image.gcores.com/bb0672c5-cdce-43ab-90a7-ee401fa6d489.jpg',
'2022-02-22 19:39:45',
42,20,'L05','COL008');

insert into news(nId,img,title,summary,content,contentImg,releaseTime,likes,uId,lId,colId) VALUES (
'N030',
'https://image.gcores.com/5c130142-0948-4fc1-9a80-c92d51a88b73.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'Lifetap Studios发布新游戏《The Brew Barons》','红猪模拟器！',
'Lifetap Studios宣布将于2022年第三或第四季度推出新游戏《The Brew Barons》，游戏背景发生在一个极度疑似亚得里亚海沿岸的小镇。小镇平静祥和被一群试图在此地垄断酿酒行业的空贼打破，玩家作为一名酿酒师驾驶水上飞机在该区域探险、建设、销售与运输自己的佳酿，并以此将空贼驱逐出他们的占领区，恢复地区的和平。
',
'https://image.gcores.com/5c130142-0948-4fc1-9a80-c92d51a88b73.jpg',
'2022-02-21 16:43:32',
68,14,'L01','COL009');





-- 添加视频
insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime,likes , uId, lId,colId) VALUES (
'V001',
'https://img2.tapimg.com/video/cover/9599e0e568a7a646859b0dbfe6dc9c81.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'无喷笔旧化《变形金刚》小号手闪电',
'本来想叫无上色的，但是还是有一点点上了色的地方就算了',
'预涂装分色这次做的还挺好，不像大黄蜂那个需要自己补色一大堆。但是预涂装导致很多水口没有办法打磨否则就会磨掉漆面，如若想认真制作的话还是需要完全重新上色。本期视频展示的是不需要那么多时间精力，也无需很多经济投入但是成效很好的做旧方法。',
'https://img2.tapimg.com/video/cover/9599e0e568a7a646859b0dbfe6dc9c81.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5167',
'2022-02-21 16:43:32',
12,1,'L04','COL003');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime ,likes, uId, lId,colId) VALUES (
'V002',
'https://img2.tapimg.com/video/cover/b9c5c58267b34c532c39b82579dca6e7.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'混剪丨2022北京冬奥会精彩回顾',
'“热爱无分胜负”',
'看冬奥会有感，做了这个混剪。',
'https://img2.tapimg.com/video/cover/b9c5c58267b34c532c39b82579dca6e7.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5166',
'2022-02-22 14:56:29',
45,2,'L02','COL003');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime,likes , uId, lId,colId) VALUES (
'V003',
'https://img2.tapimg.com/video/cover/c2218f98778d881a7e084543f93e0482.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'体验与拆解只要百元的“PS5手柄”',
'虽然它很便宜，但是',
'这一次是买到这样的一款手柄，外观做了很大的致敬，所以做了一点研究。',
'https://img2.tapimg.com/video/cover/c2218f98778d881a7e084543f93e0482.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5158',
'2022-02-21 11:43:52',
26,3,'L02','COL003');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime,likes , uId, lId) VALUES (
'V004',
'https://img2.tapimg.com/video/cover/1017303b8613d41f31f42a2c04ccbbae.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'我尝了尝约翰·罗梅罗的《大刀》',
'John Romero had made himself his bitch',
'《大刀》是游戏历史上的一个灾难，巨大的投入和极少的产出，加上它的传奇制作人，让游戏直到现在都还在被批判着。而它的作者，约翰·罗梅罗，却是曾经缔造了《德军总部》《毁灭战士》《雷神之锤》这些经典IP的传奇人物。一个有着这么多好作品支持的制作人，做出的一款失败之作真的一文不值吗？  ',
'https://img2.tapimg.com/video/cover/1017303b8613d41f31f42a2c04ccbbae.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5155',
'2022-02-23 10:13:33',
49,4,'L02');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime ,likes , uId, lId) VALUES (
'V005',
'https://img2.tapimg.com/video/cover/543519b0c9f51f68ef1b965da8be444f.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'译介丨《邪恶冥刻》，不止是卡牌游戏',
'可能是2021年最奇特的独立游戏（之一）',
'一期久违的《优秀游戏设计》，翻译自油管频道 "Snoman Gaming"，原视频标题 "Inscryption: Dismantling a Genre"，发布于2022年2月13日。',
'https://img2.tapimg.com/video/cover/543519b0c9f51f68ef1b965da8be444f.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5154',
'2022-02-20 06:23:52',
67,5,'L01');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime ,likes , uId, lId) VALUES (
'V006',
'https://img2.tapimg.com/video/cover/faf5c11d90757e22caaba74ac3f455d3.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'译介丨游戏开发知识分享：计算机架构的伟大想法UC Berkeley CS61C (1/27)',
'Lecture 1 - Intro, Number Representation',
'这次译制了UC Berkeley CS 61C，至此，Berkeley经典61ABC系列，全都译制更新在机核网，希望各位机核的玩家，既能满足游戏的需求，也能间接满足学业的需求。
CS61C这门课是关于什么的?
本课程涵盖的主题包括C语言和汇编语言编程，高级程序翻译成机器语言，计算机组织，缓存，性能测量，并行性，CPU设计，仓库规模计算，以及相关主题。',
'https://img2.tapimg.com/video/cover/faf5c11d90757e22caaba74ac3f455d3.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5140',
'2022-02-21 13:13:34',
89,6,'L04');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , likes , uId, lId) VALUES (
'V007',
'https://img2.tapimg.com/video/cover/a2438c5800dcd7fcb3de6a22316df8e2.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'雷蛇Xbox手柄充电底座全花色大开箱',
'附带Xbox手柄充电全攻略，如果你有Xbox手柄就一定要看',
'如果你有xbox手柄，那你知道使用干电池其实很「伤」手柄吗？经常玩游戏的话，请对你的手柄好一点，给它一个值得的充电套装伴侣。',
'https://img2.tapimg.com/video/cover/a2438c5800dcd7fcb3de6a22316df8e2.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5156',
'2022-02-20 08:25:12',
90,7,'L02');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V008',
'https://img2.tapimg.com/video/cover/3f171bf18c6f52aecfcd0bd4802991bd.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'“手感”是怎样炼成的：聊聊好的“游戏手感”需要具备哪些特质',
'从理论到实践再到放弃',
'说回正题，手感，是游戏玩家们另一个持久讨论的玄学话题，和之前打击感不同，这期我们从人类的认知系统讲起，看看一个好的手感需要具备哪些特质。本期是我蓄谋已久的一篇，中间改改停停也是折腾了很久，希望大家喜欢~  ',
'https://img2.tapimg.com/video/cover/3f171bf18c6f52aecfcd0bd4802991bd.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5134',
'2022-02-21 18:48:39',
8,'L04');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V009',
'https://img2.tapimg.com/video/cover/1a7db18f05a9a377900527d4f360d6c7.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'即兴舞蹈丨用《最终幻想XV》的音乐即兴练习一下',
'好久不练舞，即兴一下',
'最近经常听很多《最终幻想》里下村阳子老师的钢琴曲，作为一名已经转换就业方向，且长期不练功的舞蹈专业的艺术生，在重新回到舞房开始临时代课后难得完全静下心听音乐，不自控的想要即兴一段。',
'https://img2.tapimg.com/video/cover/1a7db18f05a9a377900527d4f360d6c7.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5132',
'2022-02-20 18:29:47',
9,'L02');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V010',
'https://img2.tapimg.com/video/cover/e96b812b2320888dae539d375d72fc96.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'译介丨击败顶尖人类玩家！Gran Turismo Sophy AI诞生的幕后故事',
'最新一期《Nature》封面文章的幕后故事',
'在最新一期《Nature》杂志中，索尼AI发布的论文登上了封面，论文中介绍了Gran Turismo Sophy，一个可以自我学习以在比赛中达到人类顶尖玩家水平，并懂得如何保持赛车礼仪的AI。而本视频就是它诞生的幕后故事。',
'https://img2.tapimg.com/video/cover/e96b812b2320888dae539d375d72fc96.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5105',
'2022-02-22 13:24:46',
10,'L03');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V011',
'https://img2.tapimg.com/video/cover/d9ff987052b46b5adb1687bd6bee007a.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'玩游戏画设计丨怎么能画一张《镜之边缘》风格气氛图？',
'结合官方讲座分享心得，童叟无欺',
'这一集的《玩游戏聊设计》改成了《玩游戏画设计》。这个系列主要想试试在玩游戏后我们能不能通过玩游戏学到美学知识，从而创作出相对应风格的作品。一是我们可以更深入地了解到一些游戏背后的美学逻辑；第二是很多喜欢绘画但是基础相对薄弱的同学，如果他们想去创作一些同人，是否可以通过观看这个系列，更加了解游戏的内在美学，帮助他们创作更顺利？',
'https://img2.tapimg.com/video/cover/d9ff987052b46b5adb1687bd6bee007a.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5094',
'2022-02-21 14:26:39',
11,'L04');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V012',
'https://img2.tapimg.com/video/cover/69fcf001db5874960ddf4410697de8b2.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'打造电视剧版《猎魔人》狼学派徽章',
'关于凯尔莫罕各流派猎魔人如何过年这件事……',
'“豹学派猎魔人源流考”。',
'https://img2.tapimg.com/video/cover/69fcf001db5874960ddf4410697de8b2.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5086',
'2022-02-22 13:53:02',
12,'L02');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V013',
'https://img2.tapimg.com/video/cover/88da38af20b3fb56d65eacdf2ecb46ee.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'读书分享｜《三只忧伤的老虎》：超高难度的“整活”文学',
'内容包括情节概括、阅读建议、书中有趣的细节和特点等等，不敢说是解读，只能说给大家提供一些阅读参考～',
'预涂装分色这次做的还挺好，不像大黄蜂那个需要自己补色一大堆。但是预涂装导致很多水口没有办法打磨否则就会磨掉漆面，如若想认真制作的话还是需要完全重新上色。本期视频展示的是不需要那么多时间精力，也无需很多经济投入但是成效很好的做旧方法。',
'https://img2.tapimg.com/video/cover/88da38af20b3fb56d65eacdf2ecb46ee.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5081',
'2022-02-20 15:33:28',
13,'L02');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V014',
'https://img2.tapimg.com/video/cover/9da982cad646cb116baa2d138dc6fcd6.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'JOYTOY版《战锤40K》不败者战术铠甲体感',
'【单车小可爱】799元值吗？',
'单车的《战锤40K》18/系列也是顺利连载起来了，未来每个月都有新品体感分享，愿请各位去她的B站账号上多多支持！Kazuya也期待以后继续有机会与单车共同创作，联合投稿！',
'https://img2.tapimg.com/video/cover/9da982cad646cb116baa2d138dc6fcd6.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5040',
'2022-02-21 11:23:32',
14,'L04');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V015',
'https://img2.tapimg.com/video/cover/32e60f7425c86e87757826ae45cfab7b.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'万代拼装部PG版RX-178高达MKⅡ白兔介绍!',
'【虾米大模王】来自20年前的感动~',
'一如高达MK-II的登场，是象征UC纪元进入新世代的标志。虾米大模王频道与Kazuya的合作内容维度也进入了新的篇章，未来内容敬请期待！',
'https://img2.tapimg.com/video/cover/32e60f7425c86e87757826ae45cfab7b.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5039',
'2022-02-20 12:13:32',
15,'L02');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V016',
'https://img2.tapimg.com/video/cover/c99d3684b538ebd1c083bfbfd1a11eff.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'还原度挺高！开箱《刺猬索尼克》绿色山丘乐高套组',
'“拼乐高是一件痛苦的事情”',
'又到了“上班拼乐高”的时间，这次我们拿到了前不久推出的乐高《刺猬索尼克》绿色山丘套组。作为一款乐高Ideas产品，这个套组究竟能否让你找回游戏里的感觉？一起来看看！ ',
'https://img2.tapimg.com/video/cover/c99d3684b538ebd1c083bfbfd1a11eff.jpg',
'https://www.taptap.com/video/2405453/embed?thumb=https%3A%2F%2Fimg2.tapimg.com%2Fvideo%2Fcover%2Fc99d3684b538ebd1c083bfbfd1a11eff.jpg%3FimageView2%2F0%2Fw%2F1080%2Fh%2F9999%2Fq%2F80%2Fformat%2Fjpg%2Finterlace%2F1%2Fignore-error%2F1',
'2022-02-21 11:23:52',
16,'L02');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V017',
'https://img2.tapimg.com/video/cover/ad1884bab383530d8784d5f2b2c293e9.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'硬盘也能玩RGB灯！希捷 X《光环》联名外置硬盘开箱+评测',
'就问到底有多少士官长信仰套装',
'《光环》20周年的限定产品真是太多啦！开也开不完。今天继续为大家带来一连串的开箱+评测。',
'https://img2.tapimg.com/video/cover/ad1884bab383530d8784d5f2b2c293e9.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5046',
'2022-02-23 12:13:22',
17,'L03');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V018',
'https://img2.tapimg.com/video/cover/da52251dda19d9ac07d64164a49390d1.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'打造全球唯一金属制《战神》满级利维坦之斧',
'天下第一',
'我做的第一把武器就是《战神》的利维坦，这次经过一年的设计制作终于做出了全球唯一一把金属满级利维坦之斧，总料80公斤的黄铜，加上弹簧钢、红花梨木、银线、玻璃、树脂。',
'https://img2.tapimg.com/video/cover/da52251dda19d9ac07d64164a49390d1.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5027',
'2022-02-22 16:53:22',
18,'L03');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V019',
'https://img2.tapimg.com/video/cover/ab43a862d4a987538a0bdd72682b17e8.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'车辙记丨飞度：我们要大笑，要做梦，要与众不同…',
'迷人的不是回忆，而是有你的过去',
'时代有很多角落，没人关心角落里发生了什么。那里有很多人，很多事随着时代发展而湮灭。我们走近，只发现地上有车轮碾过的痕迹，还有这本《车辙记》…… ',
'https://img2.tapimg.com/video/cover/ab43a862d4a987538a0bdd72682b17e8.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5036',
'2022-02-22 13:35:26',
19,'L02');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , uId, lId) VALUES (
'V020',
'https://img2.tapimg.com/video/cover/12324d10e027cab7d305b75454bf358a.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'弯刀下的十字架，浅谈巴尔干半岛的哈吉杜克',
'动荡的“火药桶”',
'哈吉杜克是巴尔干半岛基督徒反抗奥斯曼土耳其的绿林好汉，与哥萨克不一样，并没有形成相应的政权，只能是呈现散兵游击队的形式对抗，其中哈吉杜克的组成可以分为塞尔维亚人、黑山人、保加利亚人、罗马尼亚人等等。这个视频原先是在B站上有投稿，详细的内容可以在专栏搜索弯刀与十字架。',
'https://img2.tapimg.com/video/cover/12324d10e027cab7d305b75454bf358a.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5019',
'2022-02-21 06:23:36',
20,'L05');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , likes , uId, lId) VALUES (
'V021',
'https://image.gcores.com/e0ec56af-4461-434e-84c4-759a7d85f4a6.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《GT赛车7》针对自适应扳机做的设计可能会有多惊艳？',
'DS5手柄的浪漫跑车之旅（预测）',
'赶在《GT7》发售之前终于做完了，还有两天就要发售了，超期待。
AE86分别用DS5手柄和DS4手柄的两次对比在B站。',
'https://image.gcores.com/e0ec56af-4461-434e-84c4-759a7d85f4a6.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5206',
'2022-02-24 09:44:32',
145,20,'L01');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , likes , uId, lId) VALUES (
'V022',
'https://image.gcores.com/8c51cf1c-8d50-4c68-8abc-54bdbc6b8883.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'我为什么如此喜欢《Cloudpunk》',
'安利一款美术和氛围拉满的游戏',
'开场读诗的灵感来源于之前看过的霍普画作赏析视频，音乐也是一样的，视频作者在开头引用了《普鲁夫洛克情歌》。后来玩《2077》，其中一个结局在神舆里又听到了这首诗，感觉很有缘，也很对味，于是我也用了。',
'https://image.gcores.com/8c51cf1c-8d50-4c68-8abc-54bdbc6b8883.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5136',
'2022-02-24 11:25:14',
120,20,'L01');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , likes , uId, lId) VALUES (
'V023',
'https://image.gcores.com/7eea3418-34a7-49bb-8753-435c3dac49c2.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'2021年度EMO音乐个人不负责任指南（上）',
'在EMO成为流行词之后的时代听EMO',
'去年的年度推荐都以在B站用电台形式直播分享，同时邀请了也几位朋友一起闲扯聊聊， EMO BOY们充满怀旧和感伤的一期推荐。',
'https://image.gcores.com/7eea3418-34a7-49bb-8753-435c3dac49c2.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5185',
'2022-02-24 11:25:14',
89,18,'L05');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , likes , uId, lId) VALUES (
'V024',
'https://image.gcores.com/a8b5dc34-afd8-47e8-8487-70b2f7d73433.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《让子弹飞》“鸿门宴”英文本地化全解析，探索本地化消除文化隔阂的作用',
'翻越文化隔阂的译',
'本地化这种翻译，就是翻越文化隔阂的译。',
'https://image.gcores.com/a8b5dc34-afd8-47e8-8487-70b2f7d73433.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=5026',
'2022-02-24 11:25:14',
89,18,'L05');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , likes , uId, lId) VALUES (
'V025',
'https://image.gcores.com/bff3c7a8-5ff6-4700-938d-9c669a5258e3.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'原创动态漫画丨《另一个故事》来自*无神论者*的辩论！',
'个人原创的动态漫画！*无神论者*和众神信徒的辩论！究竟谁能拿下这局呢！',
'个人原创动态漫画，大学生一枚，如有不足请多多包涵！ ',
'https://image.gcores.com/bff3c7a8-5ff6-4700-938d-9c669a5258e3.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=4942',
'2022-02-23 13:14:44',
101,17,'L06');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , likes , uId, lId) VALUES (
'V026',
'https://image.gcores.com/813ba69f-b180-444c-ad48-33078abdbb15.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'献给中国读者：《紫与黑》作者K.J.帕克独家访谈',
'一个坏老头的内心戏到底有多丰富——他可以用影分身自己采访自己',
'K.J.帕克老先生生活在英国乡间，日常养猪、养牛、耕种、打铁、冶金，用他自己的话说，写中世纪的故事，那中世纪的人如何生活就必须了如指掌。虽然写的是奇幻，但奇幻更要求一点一滴都真实可信。',
'https://image.gcores.com/813ba69f-b180-444c-ad48-33078abdbb15.jpg',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=4870',
'2022-02-24 14:24:56',
158,11,'L06');

insert into videos (vId,img,title, summary, content,contentImg, url, releaseTime , likes , uId, lId) VALUES (
'V027',
'https://image.gcores.com/07d91459-1217-40b5-92df-49de59995376.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'书单分享丨几本神神鬼鬼奇奇怪怪的书',
'年底扫屋整理之第一期',
'接下来的一个月，我会在打扫卫生与整理书架中度过，所以大家可能会看到我接二连三的做书单视频，单部作品的精读可能会少些，年后会多起来的～',
'https://image.gcores.com/07d91459-1217-40b5-92df-49de59995376.png',
'https://www.gcores.com/gapi/v1/partner/taptap-player?id=4942',
'2022-02-22 15:34:45',
139,14,'L06');




-- 添加文章
insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A001',
'https://image.gcores.com/c9ddf309-f9c0-4fb4-b2f6-b9ada23c1d34.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'本地化博士生经验分享丨游戏科研和打游戏，还真不是一回事儿',
'游戏本地化博士生科研压力的一场“宣泄”',
'
大家好！笔者是游戏本地化（中英翻译）方向的海外在读博士研究生一枚，博士期间的主要研究方向是游戏直播和游戏俚语。本硕背景都是中英翻译，硕士论文曾与《守望先锋》相关，咸鱼时间也有《守望先锋》社群的网络资讯翻译及独立小游戏的翻译经历。
平时总借着机核看到各位大佬的第一手经验分享，以及扒一扒游戏相关的汉化文献。从最初的门外汉、普普通通游戏玩家，到硕士中后期逐步开始确定做游戏科研，再到如今读博第二年以研究者身份深入阅读游戏文献，几乎没有时间精力打游戏…… 这一段科研的历程也逐渐让我意识到，游戏科研和打游戏其实是两个截然不同的事情。
所以，这次也借着发帖的契机，介绍一下本人现阶段对游戏本地化科研的理解，希望能通过此贴结识更多优秀的游戏的从业者，拓展自己的视野。如有疑问或不恰当之处，也欢迎交流与指正。
细说游戏科研（game studies）这一概念，其实相当繁复错杂。各种学者对其从不同角度进行介绍，比如Mäyrä在2008年出版的满满一大本An Introduction to Game Studies（游戏科研导论），就详细解释了“什么是游戏科研”，“游戏发展史”，以及“如何开启游戏科研项目”等内容。
如果大部头的文章实在难以理解的话，用大白话来解释，与游戏相关的科研，其实都可以统归为game studies。但科研，往往都是着眼于细节的。所以，与游戏相关的实践中环环相扣的每一环，在条件允许的情况下，都可以搬到科研的平台上，被拆分，研究，再重组，如游戏的软件环境、图像设计、出版发行等。科研重点之多，融合内容之杂，也可想而知。当然，这就实践赋予科研的意（泪）义（水）。
',
'https://image.gcores.com/48a09e6a-503a-4d14-9be5-e4bd297f2411.png',
'2022-01-19 08:19:32',
23,6,'L02'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A002',
'https://image.gcores.com/9cf82f65-67d2-45c0-b7ed-f55563f27e1c.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《超级少女 明日之姝》：Tom King用8期漫画，展现了超级少女的独特魅力',
'真正的勇气',
'
最近，由知名美漫编剧Tom King（《蝙蝠侠》V3、《奇迹先生》、《幻视》、《罗夏》）创作，漫画家Bilquis Evely绘制线稿，漫画家Mattheus Lopes负责上色的漫画Supergirl: Woman of Tomorrow出版了第八期，也就是这个短篇连载的最后一期。我认为这是Tom King从业以来创作的最出色的故事。在这个故事里，Tom King塑造了一个有别于以往形象的超女Kara——她不是那个甜美可爱的美国甜心，而是一个坚韧而刚强，久经考验的战士。
在这个故事里，Tom King通篇通过女孩Ruthye的视角叙事，同时，他浪漫抒情的语言风格在这个故事里体现得淋漓尽致，与其说是在写漫画剧本（script），不如说他这是在写散文（prose）。Bilquis Evely细腻的笔触，非常活灵活现地传递了角色的情绪，而她绘画宏大场面的能力同样非常出色。Mattheus Lopes用色一方面足够大胆，让人眼前一亮，但是又能很好地融合和升华Bilquis的线稿，不喧宾夺主，这是非常难能可贵的“一加一大于二”的效果。这样的黄金组合，共同创作的漫画自然是精品，值得我们细细品鉴。接下来就从剧情聊起，谈谈这部优秀的漫画。
这个故事开始于一个遥远星球：在火红的夕阳下，一位农夫被另一人残忍地刺死，倒在他辛苦耕作了一天的田地里。一个女孩姗姗来迟：这个女孩名叫Ruthye，死去的农夫是她的父亲。因为自己和家人都无力报仇，Ruthye下定决心，雇佣赏金猎人抓捕Krem。Ruthye苦苦寻找，最终在小酒馆偶遇了一个替她打抱不平的金发女子，她同意了Ruthye的请求，带着她一起去寻找仇人。但是Ruthye并不知道，眼前的这位金发女子名叫Kara，是著名的氪星最后之女——Supergirl，而她们相遇的这一天是Kara的21岁生日。
',
'https://image.gcores.com/6c1e8b4d-627a-4731-b85f-d7b78d4c6a01.jpg',
'2022-01-20 18:42:22',
54,7,'L05'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A003',
'https://image.gcores.com/8548004b-cdd0-459c-a5b1-c609aeca56ce.jpeg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'轻科幻丨稻草人',
'可能是个赛博朋克故事',
'
雨下了三个小时，我盯着单向玻璃的另一侧，长时间的站立和潮湿的天气让双腿开始疼痛，像有人把刀片插进了膝盖的缝隙。
在这里的第四年我开始害怕面对镜子，像是曾经那些民间传说里的怪物。现在是第六年，一开始的不安变成了好奇，期待着精神还会出现怎样的变化，上司向我推荐了他的心理医生，并反复强调了那个我负担不起的价格，在这个过程中他满足了自身对社会地位的需求，从这个角度上说，他的心理医生的确很有效。
而我只需要将镜子里的自己与单向玻璃后的犯人区分开。
我有一个司机朋友，马路上遍地跑的自动驾驶汽车让他看起来像一头濒危的奶牛，他向我借了不少钱维修他的车，在一次与保险公司的广告灯牌亲密接触后又向我借了不少钱维修他自己。在一半内脏与两只手和一条腿被替换成义体后他不得不卖掉自己的车以赔偿保险公司投入的广告费用。现在他由肉体、机械、一份稳定的工作和脚踏实地的债务关系组成。上一次我们喝酒的时候他花光了身上带的每一分钱，庆祝他离婚，他说的话加起来只有两个笑话和一首诗。我没有记住那两个关于车的俚俗笑话，那首诗也只记住了两句。
“你的灵魂将感到茕茕孑立，置身于阴沉的墓碑的愁绪。你的邻居谁也不会来探寻，你秘而未宣的忌辰……”
之后的每个下雨天我都会想起这句我并不想记住的诗，那个人的形象开始在我的脑海里随着一次次的试图回忆而被金属和机械所替代。
雨越下越大，现代科技可以延长寿命，制造出仿生人，却仍旧无法解决城市的排水问题。公共交通按照经验来看此时应该已经完全瘫痪，上一场暴雨后地下铁的灯箱进水漏电，导致三人触电死亡，尸体在暴雨后的一周，积水完全排空后才被发现，人体长时间浸水后像是散发着蛋白质与油脂腐烂恶臭的白色蠕虫。雨声让我开始反胃，酸液狠狠刮过食道。
',
'https://image.gcores.com/4b4c42a6-b561-49f3-9dcb-2fc35f9eca07.jpeg',
'2022-01-20 15:43:52',
72,7,'L06'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A004',
'https://image.gcores.com/3f0be036-c021-4799-8054-8cec2093f7b3.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'轻奇幻丨龙穴精锐（4）',
'说来可能你们不信，我已经死了。',
'
原本我以为，又将在吵闹中虚度一个平淡下午，坐等等太阳落山冒险者们偃旗息鼓。
虽然偶尔有缺乏职业道德与人性良知，企图深夜摸进山洞的无耻小人。但那已与我们无关，等待他们的是山洞里上夜班的龙牙卫兵。期待留个全尸只是虚幻的美好愿望，肉酱和烂泥会是次日我们清理龙穴时的沉重负担。纵然我在墙上用多种语言写下不要夜袭否则后果自负的真诚建议，然而仍有人置若罔闻，丝毫不为清理战场的劳动者考虑考虑。
一个小个子骷髅骑着马驱散了笼罩在我们头顶的这片祥和安逸。他是队里唯一的矮人，作为特别优待老大允许他骑乘一只矮脚骷髅马外出巡逻，与山下的前哨沟通联络。
“头儿！头儿！”矮脚马仿佛生了两个脑袋，四四方方骷髅头颤巍巍向我们奔来，边缘锐利的方下巴上挂着一团好似胡须的枯黄毛发。他兴奋的一面从马上滚下来，一面迫不及待叫嚷道：“人，是人！有人来了，我没有看错！四个人，一个使匕首的、一个法师、俩战士！”
“他说的对，我刚才就瞅见了。这帮孙子不讲武德，在山下的迷宫侧面挖了个洞直奔龙穴。看手法是老手，肯定来过不少次。”
',
'https://image.gcores.com/df645370-9bd7-451a-b6cc-1aa16c594dbd.png',
'2022-01-21 23:42:12',
89,8,'L06'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A005',
'https://image.gcores.com/3b20973c-0731-4f9e-acb1-f22b0a891b12.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'译介丨《光辉之书》故事选读：言语卷',
'翻译自Gershom Scholem编辑的《光辉之书》基础阅读故事集',
'
《光辉之书》是犹太神秘主义卡巴拉（Kabalah）的重要典籍，在犹太教中被称作zohar ha kadosh，神圣的光辉，被奉为第三圣典，与圣经（Tanakh）和塔木德（Talmud）平行。在流行文化与所谓的神秘学中不乏对这本书的想象和过度关切，这是从文艺复兴以来第一批挪用和改造卡巴拉的神秘学从业者开始的。与此相对的是，在犹太教启蒙运动Haskala后，犹太教学术界和理性主义的犹太教信徒激烈的反对这部书，认为它是素来自居理性的犹太教的污点，是乡野迷信的集大成。
Gershom Scholem是德国犹太人学者中的叛逆者，他出身于德国资产阶级的父辈对犹太教不屑一顾，他则部分出于叛逆心理投入了犹太教中，专研被父辈蔑视的神秘主义文本，还是战前率先进行''aliya迁徙的人物。他是第一批将犹太教神秘主义与卡巴拉引入正规学术研究范畴的人，当年希伯来大学开设世界上第一个以犹太神秘主义为主题的课程时，他是唯一的讲师，因为这门课程就是他设立的。他的动机和另一位从事哈西德（Hasid）研究的德国犹太哲学家马丁布伯（Martin Buber）不同，后者意欲将哈西德理解为神学实践的典范，以之引导那个时代对身份充满迷茫与困惑的德国犹太人，而他则是对神秘主义有极大的兴趣而投身这项不被看好的研究。
毫无疑问，作为卡巴拉最重要的典籍，对zohar的研究是他研究中的重点，他曾在青少年时期自主阅读zohar，其博士毕业论文就是对zohar的讨论。为了将光辉之书的内容以更简洁的形式呈现给初学者，让初学者能接触到一些基本的内容，Gershom编撰了一部小册子，名为《光辉之书》的基础阅读内容。这个小册子的主体内容是他选择的《光辉之书》的小故事，通过这些故事至少可以让初学者感受到《光辉之书》的独特气质，而且故事总是比理论更易读。
',
'https://image.gcores.com/3b20973c-0731-4f9e-acb1-f22b0a891b12.jpg',
'2022-01-22 14:51:26',
57,9,'L06'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A006',
'https://image.gcores.com/d4d30c9e-b180-4dda-817d-54324a8df4b6.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'漫长的回归：写在《GT赛车7》发售之前',
'跨越了5年的拼图',
'
第一个就来这个，惊不惊喜？
实际上，这是很多新朋友在关心的门槛问题。也是虽然《GT7》还没发售，但由于《极限竞速 地平线》最近两作的火爆出圈，近期在各个社区已经在蔓延的话题。其实这里包含了另一个话题：《GT》这样的刷圈游戏到底在玩什么？
首先要新朋友了解一件事：虽然《GT》是老招牌，但这是一个很“闷”的游戏。虽然都是赛车主题，但《GT》和《极限竞速 地平线》这两个游戏追求愉快体验的反馈机制并不相同。
《极限竞速 地平线》系列的出色是毋庸置疑的，尤其是有中文语音的系列第一作和最新作，沉浸感更佳。如果你喜欢放松休闲的沙盒赛车，兼带做些任务，快速上手进行竞速追逐。肝一肝收集车款，《极限竞速 地平线》就是目前的最佳选择。有谁不喜欢伴着音乐一边和NPC斗嘴一边兜风游车河呢？
但《GT》和《极限竞速》正统作品的魅力，和一些沙盒赛车爱好者的主张相反，恰恰来源于“过时的”封闭环境。因为环境封闭，所以结果可量化，竞技环境更纯粹。玩家的乐趣来源于，在统一规格环境下的竞技和自我精进。当然，物理上两类作品也完全不是一个概念。一旦经历完游戏入门时的“苦行”，能够掌握游戏的物理基础，对自己的成长和极限有所认知。那么玩家就会“知味”，从而体会到大量的乐趣。
',
'https://image.gcores.com/8204bd03-c20e-4148-ad21-4390bce16755.jpg',
'2022-01-18 23:49:34',
86,9,'L02'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A007',
'https://image.gcores.com/8559ba3d-b667-4643-af35-c4ef726d3b8d.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'插画丨从对From Software的追随，到个人创作',
'分享一些《艾尔登法环》主题的同人画，和我的个人项目《SORALIS》的概念插画',
'
在编辑这篇文章时媒体评测也刚好解禁了，真的十分感动，可能以后很长一段时间都见不到如此高质量的史诗奇幻类游戏作品了。
我在2014年第一次接触到《血源诅咒》时就非常喜欢From Software的风格，其之后的作品，包括《Deracine》也都通关了。也就是从那个时候开始决定进入游戏行业。
这次也趁机分享一下我的个人项目《SORALIS》的概念插画，也受到了很多我喜爱的游戏与电影的影响，希望有朝一日能有机会做出来。
',
'https://image.gcores.com/d6820068-6d4d-45d7-9730-e702a5913f5c.jpg',
'2022-02-21 13:35:53',
92,10,'L03'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A008',
'https://image.gcores.com/573695ec-743e-4ec0-a552-3ef5b9af04cf.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'原创故事丨“送一次别”',
'送别告别',
'
当我提纸袋走向导诊台时，导诊屏幕告诉我，“您的探视对象已经在昨天出院了。”
坐车坐昏头的，没反应过来：“我来看第300号病房的病人。”
“第300号病房的病人已经在昨天出院了。”
我立刻发消息问候他：“Lz你活着回来啦？”然后按电梯。
“护士小姐，他的病好了吗？”
同屏幕说悄悄话的护士被吓了一跳，“医生为他介绍了良好的疗养环境，请放心，他一定能成功康复！”
Lz变成这样我要负很大责任。
有一天我去他家疯到很晚，我们照旧话题往奇怪的地方扯，他还讲了怪谈。
',
'https://image.gcores.com/e7ae341e-f147-4f02-b4de-e27882c08cda.png',
'2022-01-17 13:21:37',
87,10,'L06'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A009',
'https://image.gcores.com/dc25d3b3-cb94-4fb3-82c4-171a30e10b96.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'戏剧影像与互动电影批判（中）',
'西方电影的发展多受到20世纪美术革命的影响，而我国电影发展则与传统曲艺有着更紧密的关系',
'
有别于西方戏剧影像，东方戏曲影像陷溺于另一种美学困境。二者都是早期电影艺术发展的重要脉络，但彼此的形态结构均不相同。针对这种考察讨论，我国戏曲电影就是一个完美样本。
诸如日韩、东南亚、西亚也有本土戏剧电影或曲艺电影（尤其日本的戏剧影像展在国内很受欢迎），但它们都不如中国戏曲片在表意特征上与西方戏剧影像差别显著。戏曲片伴随着中国电影的诞生，我国第一部电影便是任庆泰拍摄、谭鑫培出演的《定军山》。因此，从各个角度来说，戏曲都是中国人长期以来理解电影的有效方式。遗憾的是，如此历史悠久的影像表现形式，经过一百多年的摸索，仍在美学内核和艺术创造力上存在着重大缺陷。
最初电影传入中国，被国人称为“影戏”，实际上是个很形象的名字，暗含着早期观众将电影当作舞台戏的浅显认知。作为新生媒介，那时海内外对电影的理解都很有限，基本以奇观展示节目来对待。影戏被穿插在戏曲、杂耍和其他舞台表演之中，作为某一环的短小节目上演，当然人们很快便知道电影的潜力远不止于此。但是在当时，几十秒或几分钟的影片仍只能用来作为展示性娱乐。据中国首篇影评记载，“近有美国电光影戏，制同影灯而奇妙幻化皆出人意料之外者……旋见现一影，两西女作跳舞状，黄发蓬蓬，憨态可掬。又一影，两西人作角抵戏。又一影，为俄国两公主双双对舞，旁有一人奏乐应之。又一影，一女子在盆中洗浴……”。电影最初无论在国内还是国外，其中一个重要内容就是布景中的单一情境演出。
',
'https://image.gcores.com/712c86f6-3642-431d-9776-e11853f4f1ce.jpg',
'2022-02-21 17:23:46',
832,11,'L05'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A010',
'https://image.gcores.com/1e9332dc-398f-4488-8212-881f1bb98518.JPG?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'入门性价比之选：HORI 新款APEX方向盘开箱',
'不要错过“机核XHORI”独家优惠！',
'
来自 HORI 的新款 APEX 方向盘（APEX SPF-004A）国行版即将上市，定价928元。对于想要尝试通过方向盘来游玩竞速类游戏的朋友来说，该产品是个不错的入门选择。相比老款 APEX 方向盘，新款产品能够支持 PS5 原生游戏，同时支持游玩 PS4 与 PC 上的游戏内容（老款只能在PS5上玩PS4游戏）。
最重要的全新功能则是通过官方定制的专属 App 可以实现方向盘死区控制、方向盘与与踏板的线性/灵敏度细节调整以及180°或270°操控区域回转角度的选择及部分按键自定义等功能。而且为了针对不同平台的使用习惯或者不同游戏的游玩场景，全新 APEX 方向盘还可以存储4种自定义模式，并在游玩时随时通过方向盘上的开关进行切换，而不用再次开启自定义 APP。新款 APEX 方向盘支持桌面背夹与桌面脚垫吸附两种安装方式，可以适配多种桌面及游玩环境。
新款 APEX 方向盘将于2月25日在 HORI 天猫旗舰店开启预售，前三名使用口令“机核XHORI”联系HORI天猫旗舰店客服的用户，可以在下单方向盘后免费获得市场价448元 AIR HIGH GRADE 耳机一副！（活动赠品耳机将随方向盘一同发货）
',
'https://image.gcores.com/a40ad4f9-fa69-4afe-a50d-5c4baffa5a4f.JPG',
'2022-01-20 18:43:28',
134,11,'L03'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A011',
'https://image.gcores.com/c8cdd90f-b9e2-443b-a246-f134d6010f40.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'轻科幻丨乌托邦',
'但现在，这个名字属于我。',
'
我推开了窗户。
明媚的阳光迎着我涌进屋子，等我的眼睛适应了光明，周围的景象终于清晰地呈现在我眼前。
昏暗的房间里散乱地堆着几件简陋的家具，唯一的光源只有窗外的阳光，但被窗口限制的阳光只是在地上划地为牢般圈出一小块空间，其余地方仍是黑暗。
窗玻璃上映出我的面容，那是一张朴素的脸，因为面无表情而显得有些呆滞。我的头上不知从何时起就一直戴着一顶黑色的鸭舌帽，但是我已经不记得是为什么而戴上它的了。
望着这些一成不变的景物，一个疑问从我的心中升起。
我是什么？
被这个想法驱使着，我重新坐回窗前的桌子，继续拿起笔在纸上堆砌着不明所以的公式。
敲门声打断了我的思绪，我迎来了不速之客。门口站着三两个人，从制服上看，应该是警察。
为首的男人脸上露出金属色条纹，那是经过人体改造的痕迹。他举起右手臂上的个人终端，将警察证投影在我面前。
“这位公民朋友，据调查你与神经网络里的一段异常数据有所关联，给我看看你的脑机接口，只要两分钟就行。”
声音低沉又苍老，想必对方已上了年纪。我顺从地转过身，露出接口，但背后却传来“啧”的一声。
“探长，这人的接口类型太老了，现在手头没有能用的。”
我回头看去，一个相对年轻一点的警员手捧一块半透明的平板电脑，末端伸出三条形态各异的数据线。
那个被叫探长的男人低头沉思片刻，略带歉意的看向我：“不好意思，事态紧急，今晚请和我们去警局过夜。”
',
'https://image.gcores.com/99875570-4c73-42da-98ca-547dc2f607ac.jpg',
'2022-01-15 17:31:47',
158,12,'L06'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A012',
'https://image.gcores.com/bc5aa497-fc8b-456d-a4ec-971b4035c501.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'戏剧影像与互动电影批判（上）',
'目前市面上几乎所有的戏剧影像都是一场美学灾难，因为镜头越对其拼尽全力地表现，就越放大了连续的物理时空与断续的影像时空的不可调和性。',
'
通常戏剧影像与演出录制、室内综艺等归并到「舞台影像」这一类别中，而「舞台影像」又会和赛事转播、新闻现场报道和私人视频等一起划归到「现场影像」之下。于是，「现场影像」显现出复杂的类型构成，它产生自分类学，但又因过于包罗万象几乎无法通过分类学去考察。「现场影像」包含了一些纪录属性，又因有别于纪录片的延绵性和缜密性，在过程上是散漫的而不是凝结的，往往不等同于普遍意义上的纪录电影。另一方面，「现场影像」又常常体现出比纪录片更坚固的随机性与客观性，更能贴近现实世界的真实片段。
然而，「现场影像」终究是对不在场的妥协，是对切身体验的扬弃（扬于信息传播，弃于临场感受），此类表现形式被迫过滤掉了审美的关键环节，即直接感知经验，也就是在场性。因为我们受制于现实世界的物理法则，无法亲临每一次现场事件，如此「现场影像」便有了存在价值。当我们观看足球比赛或突发事件录像时，自然而然获得了影像所提供的核心目的——信息的即时性传播与获取。它们得以形成感知意义的前提，是偶发性和自然产生的叙事功能，以及最重要的，影像本身极其微弱的美学价值。
也就是说，那些非精心设计的、只具有少量美学属性或艺术结构成分的影像，才适合被单纯视为一种信息发送机制，同时又不会破坏影像这一媒介的本质属性。我们不妨将这些具有感知意义的构型称为「理性影像」。其中不仅包括体育比赛、现场新闻报道，以及捕捉到生活意外性的私人视频，同时还包括电影、电视剧和电子游戏。与之相对的，便是作为艺术创作成果的戏剧影像，其不仅窃取了戏剧本身的美学果实，同时又没有形成新的表达维度。当戏剧影像面向大众时，它最大价值是针对投资人而非大众的，这类产品揭示了制作方对扩大潜在商业利益的追求，却在根本上造成了大众审美的矮化和退步。
',
'https://image.gcores.com/26b56e04-1879-4563-89c2-74e0fc3f53f6.jpg',
'2022-01-22 19:38:56',
178,13,'L05'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A013',
'https://image.gcores.com/9521c106-8caa-4c70-a7d7-3dc2a4c60050.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'译介丨《光辉之书》故事选读：荒野卷',
'翻译自Gershom Scholem编辑的《光辉之书》基础阅读故事集',
'
光辉之书》是犹太神秘主义卡巴拉（Kabalah）的重要典籍，在犹太教中被称作zohar ha kadosh，神圣的光辉，被奉为第三圣典，与圣经（Tanakh）和塔木德（Talmud）平行。在流行文化与所谓的神秘学中不乏对这本书的想象和过度关切，这是从文艺复兴以来第一批挪用和改造卡巴拉的神秘学从业者开始的。与此相对的是，在犹太教启蒙运动Haskala后，犹太教学术界和理性主义的犹太教信徒激烈的反对这部书，认为它是素来自居理性的犹太教的污点，是乡野迷信的集大成。
Gershom Scholem是德国犹太人学者中的叛逆者，他出身于德国资产阶级的父辈对犹太教不屑一顾，他则部分出于叛逆心理投入了犹太教中，专研被父辈蔑视的神秘主义文本，还是战前率先进行''aliya迁徙的人物。他是第一批将犹太教神秘主义与卡巴拉引入正规学术研究范畴的人，当年希伯来大学开设世界上第一个以犹太神秘主义为主题的课程时，他是唯一的讲师，因为这门课程就是他设立的。他的动机和另一位从事哈西德（Hasid）研究的德国犹太哲学家马丁布伯（Martin Buber）不同，后者意欲将哈西德理解为神学实践的典范，以之引导那个时代对身份充满迷茫与困惑的德国犹太人，而他则是对神秘主义有极大的兴趣而投身这项不被看好的研究。
毫无疑问，作为卡巴拉最重要的典籍，对zohar的研究是他研究中的重点，他曾在青少年时期自主阅读zohar，其博士毕业论文就是对zohar的讨论。为了将光辉之书的内容以更简洁的形式呈现给初学者，让初学者能接触到一些基本的内容，Gershom编撰了一部小册子，名为《光辉之书》的基础阅读内容。这个小册子的主体内容是他选择的《光辉之书》的小故事，通过这些故事至少可以让初学者感受到《光辉之书》的独特气质，而且故事总是比理论更易读。
',
'https://image.gcores.com/9521c106-8caa-4c70-a7d7-3dc2a4c60050.jpg',
'2021-12-13 15:37:48',
167,13,'L06'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A014',
'https://image.gcores.com/7ab5529b-fb27-4640-a07b-a7680901fbce.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《存在主义咖啡馆》读书笔记丨如何活着：我们缘何需要存在主义？',
'这一次，我们来聊聊存在主义……',
'
这篇文章便是关于以上提及的真实性、自欺、自由等概念的。文章的主要内容基于我阅读莎拉·贝克韦尔的《存在主义咖啡馆》一书的读书笔记，其中也夹杂着一些我自身的思考与感悟。文章的脉络可以说是存在主义系谱学与存在主义者群像剧的结合。
“呵，存在主义？老掉牙的东西了！”一位略懂哲学史的朋友可能会轻蔑地答道，然后关掉窗口，不再读下去。的确，在法国等西欧国家，存在主义者的思想似乎已经变成陈列于博物馆中的陈旧古董，后人隔着玻璃窗回顾着这段往昔的峥嵘岁月，但毫无亲近它们的欲望。在西方，它们逐渐让位于结构主义者、后结构主义者、解构主义者和后现代主义者等新一代的哲学思潮。但是在更东边的地方，例如捷克，又或者更东边的中国，一切才方兴未艾。这么说一方面的原因是存在主义在中国民间的影响力与当年在欧洲社会的影响力无法相提并论，另一方面的原因则是中国的现代社会及生活在其中的人们，迫切地需要这种一种思想，在其面临精神困境时，能够让他们更游刃有余地面对与处理。
存在主义的思想来源主要有三：克尔凯郭尔、尼采、现象学。前两者强烈地影响了存在主义，现象学则为其提供了基本的研究方法。
克尔凯郭尔直接为存在主义提供了其名称的由来，他用“存在的”（existential）一词来表示与人类存在问题有关的思想，为其注入新的含义。尼采的“系谱学”，即一种对于文化历史的深度批判，帮助我们更好地理解现今的人类社会及其历史路径，也为其注入了一种反叛精神。二者作为存在主义的先驱，为“存在”提供了新的定义，即选择、行动和自我肯定，倡导了一种反抗精神，并加深了人们对于人生的苦难的认识。
',
'https://image.gcores.com/fdb96ccd-c675-48c0-936a-9711b0b859af.jpg',
'2022-12-14 14:26:43',
192,14,'L06'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A015',
'https://image.gcores.com/2b160852-eb74-47f1-9df0-cb28e4c9d539.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'终生嗜好 Vol.35丨CCS铁块系列真盖塔',
'CCS铁块系列第三弹！',
'
真盖塔，玩《超级机器人大战》的朋友肯定不陌生，我个人常年将这台拥有三位驾驶员的超级系机体作为重点培养对象，驰骋战场。CCS铁块的企划团队应该也抱有这份钢之魂，公布的机体都是《机战》系列的人气机体，虽然目前看来都是超级系为主，还都是毁天灭地的机体。关于《盖塔机器人》或者《真盖塔 世界最后之日》机核的朋友应该很熟悉了，受限于篇幅我就不在此赘述了，大家可以在机核站内看看栗子頭的溯源文章《合体机器人的元祖——变形！盖塔机器人！》，了解一下石川贤老师的心路历程。我自己则计划今年来北京找栗子頭录一期关于盖塔系机器人的电台节目。
盖塔的IP商品颇为丰富，由于机体的设计经典仿佛永远不会过时，在过去几十年各大厂牌都先后出过很多这台机体的模玩。我自己则是2008年夏天买过一个，就是海洋堂转轮科技37号产品，山口式真盖塔。当时还是大学生的我，暑假回国休息觉得国内物价真便宜啊，就开始报复性消费了，好在海洋堂的商品当时也便宜，我才买得起。
',
'https://image.gcores.com/df569bf7-8825-4806-b38f-8284d3939bb3.jpg',
'2021-11-18 17:26:34',
243,13,'L04'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A016',
'https://image.gcores.com/703fecf6-bf12-4585-b0bc-79badde98269.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'浅析《明日方舟》的关卡结构设计方法',
'不仅是关于《明日方舟》关卡设计，更是可活用于其他游戏关卡设计的方法',
'
本文对《明日方舟》关卡创作爱好者来说，可以作为设计可玩性更高的关卡的方向参考。即使非《明日方舟》玩家也可以一窥其设计核心思路——给予玩家连续的目标引导。不过阅读本文仍需要一些《明日方舟》战斗机制基础知识，还请谅解。
关卡设计出来到底还是要交给玩家游玩的，想提升可玩性，还得从玩家的视角进行思考。在此，我们首先将所有关卡分为“阵线类”与“游击类”两个大类：
在一段时间的部署操作后，相对长时间不对干员进行部署操作，则为“阵线类”关卡。考虑到大部分“阵线类”关卡常有需要单切的目标，因此将除了诸如“突袭 5-3”、“诸事不顺”这类难以形成稳定阵线的关卡归类为“游击类”外，余下的皆算作“阵线类关卡”。而本文主要谈论包涵内容更多的“阵线类”关卡。
许多关卡都由猎犬作为第一个怪出场，猎犬的高移速减少了其受高台击杀的可能性。其各种变体，如爪兽持有“抵抗”、磨砻与变异沙地兽会分裂、深池侦察犬持有“折射”都旨在强化其保持移动速度进行冲线，也就是后移先锋的部署位置。
举一个有助于理解“猎狗”内核，帮助你灵活安排开局的例子：暗潮钳兽。
',
'https://image.gcores.com/1d27b8fa-34a5-423e-9b0d-18f8f386b2b6.jpg',
'2021-12-20 18:21:45',
287,14,'L01'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A017',
'https://image.gcores.com/754693f0-5a9b-4e01-8a47-381bf38d5439.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'Happy开学季！PlayStation双肩背包回归！',
'包袋限时9折，更多特惠不要错过！',
'
诚意满满，追加了整个PlayStation联名系列一件9折的限时特惠！
彩色拼接T恤经典抢手，轻薄拼接风衣可以收纳成一个小包包，拼接半开风衣&梭织运动裤穿一身拉风到爆，还有容量和用料都足够强大的波士顿训练包，还有哪款你还未收入囊中？别等了，就现在！
',
'https://image.gcores.com/9cd48911-c2b6-4e32-a8a9-5bbfb4951f4d.jpg',
'2021-12-14 17:34:56',
52,14,'L04'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A018',
'https://image.gcores.com/dbf6aeec-4dc8-40e8-b7dc-b1757455e7c4.png?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'《OPUS 龙脉常歌》简评：袅袅歌声飘散于宇宙天地人间',
'后半部有剧透，在意还请慎入',
'
“透过故事创造一种独特、感动人心的体验，为自己与别人带来幸福。”来自中国台湾的制作组Sigono（信革数位） 秉持着此宗旨，在几年的时间内接连推出一系列独立佳作，其中最为人知的当属旗下《OPUS》系列，发售已逾数月的系列最新作《OPUS：龙脉常歌》在Steam上收获了约4000条如潮好评。作为一款带有资源管理和探索要素的剧情向游戏，《OPUS：龙脉常歌》的一些情节时隔许久仍令我记忆犹新。在这款游戏里，不仅有着广袤无垠的宇宙，还有着独属于人与人之间的温暖，这些情感，让星海也变得不再孤独。
如果你有兴趣，不妨与我一同品鉴这出浪漫的太空歌剧——《OPUS：龙脉常歌》。
',
'https://image.gcores.com/ce8a4127-5f90-422c-bfcf-6956c61b459b.png',
'2022-02-13 21:54:25',
246,15,'L01'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A019',
'https://image.gcores.com/0800a65e-5356-4c4c-ab0e-7756f78d1874.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'用相机记录生活丨我的2021映像',
'生活，与感受生活',
'
各位好久不见，今年的映像总结终于来啦~ 疫情走过两年时间，工作生活基本回到正轨，唯有戴口罩作为日常留在了身边，今年没怎么犯过鼻炎，想来是这个缘故。
上了一年班，感知着时间确实比上学快了不少。简单回想，一天和一天的差异也只在节假日或是日程变化的节点上停留。同样是上班，早晨醒来分不清今天是昨天还是明天，这样的体验确实慢慢变得陌生，大概是另段旋律闯进了日常，和我的生活叠加成了复调，变得期待每一天。
好像是年初开了摄影集的专题，各路大神的投稿看得眼花缭乱，发文量也远超前两年之和。慢慢看来，确实感受到自己拍摄上可观的进步空间（笑）。总的来说，我的总结还是相当个人的碎碎念合集，写的过程能勾起些回忆，看过笑过，就很好。
去年底从奶奶家拿来了爷爷从前用的一台旁轴和一台双反，周末拆开看了看。旁轴相机取景框内侧零件已经起皮掉件，几个玻璃零件早就晃晃悠悠，没法固定。双反的取景器则已经布满霉点，幸好眼镜布还擦得掉，除开皮质外表面有些损伤，主要问题是内部反光镜片的锈迹相当严重，一时也不知道怎么去除，自然也不知能否再用起来。
',
'https://image.gcores.com/60916c3e-7082-43e4-831f-10ad2534d7a7.jpg',
'2022-01-12 16:21:49',
63,15,'L02'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A020',
'https://image.gcores.com/3752057a-8fdb-4fe7-a669-38c789309770.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'译介丨游戏论文《制造游戏感》',
'Designing Game Feel. A Survey',
'
制作游戏感（Designing Game Feel）就是制作持续地交互体验所带来的感官冲击。在本文中，我们将通过对相关领域的学术研究和出版物的调查，来全面概述游戏设计这一领域的研究现状。我们分析了超过200个相关文献，并根据内容对其进行了分类。
“physicality”、“amplification”、“support”是导致玩家不同体验最重要的三个因素。在这三个决定因素中相关素材的一致性、可玩性和个性对三个决定因素起到了润色作用。
调整游戏对象的物理属性可以创造一致性、可预测性，而由此产生的动作会影响到许多其他设计方面。“juicing”是一种强化润色的行为，它通过传达游戏事件的重要性来提供清晰的反馈，一致性会使游戏按照玩家的意图行事。这三种设计意图是设计师控制互动细节并预测玩家反应的主要手段。
需要强调的是相关基础理论框架及专业术语的定义偏差，可能导致从业者和研究人员对游戏感的理解有所不同。
将游戏感作为研究主题进行探索的起点是Steve Swink的同名著作，Steve将游戏感定义为在虚拟的空间中指挥虚拟的角色，并通过优化加强二者的交互【1】。并进一步扩展了这一定义，称游戏可以传达5种体验：
',
'https://image.gcores.com/b49f1d6d-ab5c-4b40-bad6-bdc1e1998812.jpg',
'2022-01-15 09:27:48',
86,16,'L04'
);

insert into articles (aId,img, title, summary, content,contentImg, releaseTime, likes, uId, lId) VALUES (
'A021',
'https://image.gcores.com/177d6ceb-e97e-4f40-be83-f6cad2a28768.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90',
'漫谈：独立音乐及其历史与理念',
'当我们谈论独立音乐的时候，我们在谈论什么？',
'
 “独立音乐”是近年来国内流行音乐领域最热门的词语之一，几乎每个乐迷就会把它挂在嘴边，仿佛是个新的音乐人，便会被贴上“独立”的标签。这样说或许稍微夸张，但我去年竟然在某头部的偶像选秀节目中，也看到了“独立音乐人”的身影。稍显遗憾的是，在独立音乐从地下走进主流视野的过程里，中文领域鲜有人去讨论它作为词语的使用范畴。
这篇文章的原稿是我为知乎快闪课堂所做的一次关于独立音乐的分享，其中一个部分即在尝试分析当下“独立音乐”的概念。然而，想要界定任何词语的准确意思都非常的困难。它会随着时间依据大众的使用而发生变化，有时候甚至获得完全相反的意思。例如成语“空穴来风”，我们现在通常用它来指消息和传说毫无根据，但它原本的意思却是“有孔洞便会进风”，从而比喻传言有根据。
好在“独立音乐”一词从诞生以来到现在，并没有发生如此夸张的变化。不过它确实在不同的时间阶段有着不同的指代，在不同的国家和地区也有着不同的指代。比如，在美国和中国，因为我们对“主流音乐”的定义和理解存在差异，导致“独立音乐”也有着不同的含义。
尽管个人认为，大多数时候没有必要去纠结音乐风格和流派的定义问题，因为流行音乐专有名词无一不是实践出真知。但为方便讨论和减少误解，还是有必要偶尔认真。把模糊地带厘清之后，说不定能帮助新的东西（如音乐风格和场景）从新的空间里生长出来。
',
'https://image.gcores.com/69cd53f1-64a6-40e7-81a4-8b7af4194dac.jpg',
'2022-01-15 11:34:28',
653,17,'L02'
);


-- 添加资讯评论
insert into news_comment (nId, uId) VALUES ('N001',1);
insert into news_comment (nId, uId) VALUES ('N001',2);
insert into news_comment (nId, uId) VALUES ('N001',3);
insert into news_comment (nId, uId) VALUES ('N001',4);
insert into news_comment (nId, uId) VALUES ('N001',5);
insert into news_comment (nId, uId) VALUES ('N001',6);
insert into news_comment (nId, uId) VALUES ('N001',7);
insert into news_comment (nId, uId) VALUES ('N001',8);
insert into news_comment (nId, uId) VALUES ('N001',9);
insert into news_comment (nId, uId) VALUES ('N001',10);
insert into news_comment (nId, uId) VALUES ('N001',11);
insert into news_comment (nId, uId) VALUES ('N001',12);
insert into news_comment (nId, uId) VALUES ('N001',13);
insert into news_comment (nId, uId) VALUES ('N001',14);
insert into news_comment (nId, uId) VALUES ('N001',15);
insert into news_comment (nId, uId) VALUES ('N001',16);
insert into news_comment (nId, uId) VALUES ('N001',17);
insert into news_comment (nId, uId) VALUES ('N001',18);
insert into news_comment (nId, uId) VALUES ('N001',19);
insert into news_comment (nId, uId) VALUES ('N001',20);
insert into news_comment (nId, uId) VALUES ('N002',1);
insert into news_comment (nId, uId) VALUES ('N002',2);
insert into news_comment (nId, uId) VALUES ('N002',3);
insert into news_comment (nId, uId) VALUES ('N002',4);
insert into news_comment (nId, uId) VALUES ('N002',5);
insert into news_comment (nId, uId) VALUES ('N002',6);
insert into news_comment (nId, uId) VALUES ('N002',7);
insert into news_comment (nId, uId) VALUES ('N002',8);
insert into news_comment (nId, uId) VALUES ('N002',9);
insert into news_comment (nId, uId) VALUES ('N002',10);
insert into news_comment (nId, uId) VALUES ('N002',11);
insert into news_comment (nId, uId) VALUES ('N002',12);
insert into news_comment (nId, uId) VALUES ('N002',13);
insert into news_comment (nId, uId) VALUES ('N002',14);
insert into news_comment (nId, uId) VALUES ('N002',15);
insert into news_comment (nId, uId) VALUES ('N002',16);
insert into news_comment (nId, uId) VALUES ('N002',17);
insert into news_comment (nId, uId) VALUES ('N002',18);
insert into news_comment (nId, uId) VALUES ('N002',19);
insert into news_comment (nId, uId) VALUES ('N002',20);
insert into news_comment (nId, uId) VALUES ('N003',1);
insert into news_comment (nId, uId) VALUES ('N003',2);
insert into news_comment (nId, uId) VALUES ('N003',3);
insert into news_comment (nId, uId) VALUES ('N003',4);
insert into news_comment (nId, uId) VALUES ('N003',5);
insert into news_comment (nId, uId) VALUES ('N004',1);
insert into news_comment (nId, uId) VALUES ('N004',2);
insert into news_comment (nId, uId) VALUES ('N004',3);
insert into news_comment (nId, uId) VALUES ('N004',4);
insert into news_comment (nId, uId) VALUES ('N004',5);
insert into news_comment (nId, uId) VALUES ('N004',6);
insert into news_comment (nId, uId) VALUES ('N005',1);
insert into news_comment (nId, uId) VALUES ('N005',2);
insert into news_comment (nId, uId) VALUES ('N005',3);
insert into news_comment (nId, uId) VALUES ('N005',4);
insert into news_comment (nId, uId) VALUES ('N005',5);
insert into news_comment (nId, uId) VALUES ('N006',1);
insert into news_comment (nId, uId) VALUES ('N006',2);
insert into news_comment (nId, uId) VALUES ('N006',3);
insert into news_comment (nId, uId) VALUES ('N006',4);
insert into news_comment (nId, uId) VALUES ('N006',5);
insert into news_comment (nId, uId) VALUES ('N007',1);
insert into news_comment (nId, uId) VALUES ('N007',2);
insert into news_comment (nId, uId) VALUES ('N007',3);
insert into news_comment (nId, uId) VALUES ('N007',4);
insert into news_comment (nId, uId) VALUES ('N007',5);



-- 添加文章评论
insert into articles_comment (aId, uId) VALUES ('A001',1);
insert into articles_comment (aId, uId) VALUES ('A001',2);
insert into articles_comment (aId, uId) VALUES ('A001',3);
insert into articles_comment (aId, uId) VALUES ('A001',4);
insert into articles_comment (aId, uId) VALUES ('A001',5);
insert into articles_comment (aId, uId) VALUES ('A001',6);
insert into articles_comment (aId, uId) VALUES ('A001',7);
insert into articles_comment (aId, uId) VALUES ('A001',8);
insert into articles_comment (aId, uId) VALUES ('A001',9);
insert into articles_comment (aId, uId) VALUES ('A001',10);
insert into articles_comment (aId, uId) VALUES ('A001',11);
insert into articles_comment (aId, uId) VALUES ('A001',12);
insert into articles_comment (aId, uId) VALUES ('A001',13);
insert into articles_comment (aId, uId) VALUES ('A001',14);
insert into articles_comment (aId, uId) VALUES ('A001',15);
insert into articles_comment (aId, uId) VALUES ('A001',16);
insert into articles_comment (aId, uId) VALUES ('A001',17);
insert into articles_comment (aId, uId) VALUES ('A001',18);
insert into articles_comment (aId, uId) VALUES ('A001',19);
insert into articles_comment (aId, uId) VALUES ('A001',20);
insert into articles_comment (aId, uId) VALUES ('A002',1);
insert into articles_comment (aId, uId) VALUES ('A002',2);
insert into articles_comment (aId, uId) VALUES ('A002',3);
insert into articles_comment (aId, uId) VALUES ('A002',4);
insert into articles_comment (aId, uId) VALUES ('A002',5);
insert into articles_comment (aId, uId) VALUES ('A002',6);
insert into articles_comment (aId, uId) VALUES ('A002',7);
insert into articles_comment (aId, uId) VALUES ('A002',8);
insert into articles_comment (aId, uId) VALUES ('A002',9);
insert into articles_comment (aId, uId) VALUES ('A002',10);
insert into articles_comment (aId, uId) VALUES ('A002',11);
insert into articles_comment (aId, uId) VALUES ('A002',12);
insert into articles_comment (aId, uId) VALUES ('A002',13);
insert into articles_comment (aId, uId) VALUES ('A002',14);
insert into articles_comment (aId, uId) VALUES ('A002',15);
insert into articles_comment (aId, uId) VALUES ('A002',16);
insert into articles_comment (aId, uId) VALUES ('A002',17);
insert into articles_comment (aId, uId) VALUES ('A002',18);
insert into articles_comment (aId, uId) VALUES ('A002',19);
insert into articles_comment (aId, uId) VALUES ('A002',20);
insert into articles_comment (aId, uId) VALUES ('A003',1);
insert into articles_comment (aId, uId) VALUES ('A003',2);
insert into articles_comment (aId, uId) VALUES ('A003',3);
insert into articles_comment (aId, uId) VALUES ('A003',4);
insert into articles_comment (aId, uId) VALUES ('A003',5);
insert into articles_comment (aId, uId) VALUES ('A004',1);
insert into articles_comment (aId, uId) VALUES ('A004',2);
insert into articles_comment (aId, uId) VALUES ('A004',3);
insert into articles_comment (aId, uId) VALUES ('A004',4);
insert into articles_comment (aId, uId) VALUES ('A004',5);
insert into articles_comment (aId, uId) VALUES ('A004',6);
insert into articles_comment (aId, uId) VALUES ('A005',1);
insert into articles_comment (aId, uId) VALUES ('A005',2);
insert into articles_comment (aId, uId) VALUES ('A005',3);
insert into articles_comment (aId, uId) VALUES ('A005',4);
insert into articles_comment (aId, uId) VALUES ('A005',5);
insert into articles_comment (aId, uId) VALUES ('A006',1);
insert into articles_comment (aId, uId) VALUES ('A006',2);
insert into articles_comment (aId, uId) VALUES ('A006',3);
insert into articles_comment (aId, uId) VALUES ('A006',4);
insert into articles_comment (aId, uId) VALUES ('A006',5);
insert into articles_comment (aId, uId) VALUES ('A007',1);
insert into articles_comment (aId, uId) VALUES ('A007',2);
insert into articles_comment (aId, uId) VALUES ('A007',3);
insert into articles_comment (aId, uId) VALUES ('A007',4);
insert into articles_comment (aId, uId) VALUES ('A007',5);


-- 添加视频资讯
insert into videos_comment (vId, uId) VALUES ('V001',1);
insert into videos_comment (vId, uId) VALUES ('V001',2);
insert into videos_comment (vId, uId) VALUES ('V001',3);
insert into videos_comment (vId, uId) VALUES ('V001',4);
insert into videos_comment (vId, uId) VALUES ('V001',5);
insert into videos_comment (vId, uId) VALUES ('V001',6);
insert into videos_comment (vId, uId) VALUES ('V001',7);
insert into videos_comment (vId, uId) VALUES ('V001',8);
insert into videos_comment (vId, uId) VALUES ('V001',9);
insert into videos_comment (vId, uId) VALUES ('V001',10);
insert into videos_comment (vId, uId) VALUES ('V001',11);
insert into videos_comment (vId, uId) VALUES ('V001',12);
insert into videos_comment (vId, uId) VALUES ('V001',13);
insert into videos_comment (vId, uId) VALUES ('V001',14);
insert into videos_comment (vId, uId) VALUES ('V001',15);
insert into videos_comment (vId, uId) VALUES ('V001',16);
insert into videos_comment (vId, uId) VALUES ('V001',17);
insert into videos_comment (vId, uId) VALUES ('V001',18);
insert into videos_comment (vId, uId) VALUES ('V001',19);
insert into videos_comment (vId, uId) VALUES ('V001',20);
insert into videos_comment (vId, uId) VALUES ('V002',1);
insert into videos_comment (vId, uId) VALUES ('V002',2);
insert into videos_comment (vId, uId) VALUES ('V002',3);
insert into videos_comment (vId, uId) VALUES ('V002',4);
insert into videos_comment (vId, uId) VALUES ('V002',5);
insert into videos_comment (vId, uId) VALUES ('V002',6);
insert into videos_comment (vId, uId) VALUES ('V002',7);
insert into videos_comment (vId, uId) VALUES ('V002',8);
insert into videos_comment (vId, uId) VALUES ('V002',9);
insert into videos_comment (vId, uId) VALUES ('V002',10);
insert into videos_comment (vId, uId) VALUES ('V002',11);
insert into videos_comment (vId, uId) VALUES ('V002',12);
insert into videos_comment (vId, uId) VALUES ('V002',13);
insert into videos_comment (vId, uId) VALUES ('V002',14);
insert into videos_comment (vId, uId) VALUES ('V002',15);
insert into videos_comment (vId, uId) VALUES ('V002',16);
insert into videos_comment (vId, uId) VALUES ('V002',17);
insert into videos_comment (vId, uId) VALUES ('V002',18);
insert into videos_comment (vId, uId) VALUES ('V002',19);
insert into videos_comment (vId, uId) VALUES ('V002',20);
insert into videos_comment (vId, uId) VALUES ('V003',1);
insert into videos_comment (vId, uId) VALUES ('V003',2);
insert into videos_comment (vId, uId) VALUES ('V003',3);
insert into videos_comment (vId, uId) VALUES ('V003',4);
insert into videos_comment (vId, uId) VALUES ('V003',5);
insert into videos_comment (vId, uId) VALUES ('V004',1);
insert into videos_comment (vId, uId) VALUES ('V004',2);
insert into videos_comment (vId, uId) VALUES ('V004',3);
insert into videos_comment (vId, uId) VALUES ('V004',4);
insert into videos_comment (vId, uId) VALUES ('V004',5);
insert into videos_comment (vId, uId) VALUES ('V004',6);
insert into videos_comment (vId, uId) VALUES ('V005',1);
insert into videos_comment (vId, uId) VALUES ('V005',2);
insert into videos_comment (vId, uId) VALUES ('V005',3);
insert into videos_comment (vId, uId) VALUES ('V005',4);
insert into videos_comment (vId, uId) VALUES ('V005',5);
insert into videos_comment (vId, uId) VALUES ('V006',1);
insert into videos_comment (vId, uId) VALUES ('V006',2);
insert into videos_comment (vId, uId) VALUES ('V006',3);
insert into videos_comment (vId, uId) VALUES ('V006',4);
insert into videos_comment (vId, uId) VALUES ('V006',5);
insert into videos_comment (vId, uId) VALUES ('V007',1);
insert into videos_comment (vId, uId) VALUES ('V007',2);
insert into videos_comment (vId, uId) VALUES ('V007',3);
insert into videos_comment (vId, uId) VALUES ('V007',4);
insert into videos_comment (vId, uId) VALUES ('V007',5);


-- 添加标签
insert into label(lId,lName) VALUES ('L01','游戏');
insert into label(lId,lName) VALUES ('L02','生活');
insert into label(lId,lName) VALUES ('L03','科技');
insert into label(lId,lName) VALUES ('L04','设计');
insert into label(lId,lName) VALUES ('L05','影视');
insert into label(lId,lName) VALUES ('L06','故事');

-- 添加专题
insert into collections(colId,colImg,colTitle,colSummary,colTime,colNum,lId) VALUES ('COL001','https://image.gcores.com/f0eb9c74-5fad-4a5b-a93c-92537b73d66f.jpg','读者们的原创故事·轻奇幻','不可名状之怪异与最深的恐惧','2022-02-23 17:22:30',2053,'L06');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL002','https://image.gcores.com/95bfaac7-eb02-41ba-9706-dfbd9eb9f7f0.jpeg','手工大佬们的作品合集：将想象中的事物带入现实','自制模型，自制道具，以及更多','2022-02-23 17:24:30',3224,'L04');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL003','https://image.gcores.com/4dfaf7fe-c244-45a2-945a-0c6f81c4e64a.jpg','在此与你分享开箱的快乐','开箱，是世界上最快乐的事之一！','2022-02-23 17:27:30',7123,'L02');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL004','https://image.gcores.com/731d56ba-2637-4d9d-ac69-d99e7e08d149.jpg','CRPG BOOK 翻译计划','Felipe Pepe 与一群玩家希望能整理并收藏所有电脑 RPG 游戏内容，收集并整理成电子数位辞典“The CRPG Book Project”。','2022-02-23 17:40:30',254,'L06');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL005','https://image.gcores.com/255d17a0-0342-429d-8202-d3493da1fc5b.jpg','机动战士高达：从动画聊到模型','有多少人因为高达爱上了机器人动画和玩胶？','2022-02-23 17:50:30',1324,'L05');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL006','https://image.gcores.com/881075d6-327b-4b4b-b95d-dce8595df8d1.jpg','读神话','机核上各国神话传说相关内容汇总','2022-02-23 18:12:30',87,'L06');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL007','https://image.gcores.com/691353c5-ee67-4c3e-8c3a-3e92fc9e2fda.jpeg','像素的艺术','分享对像素风格的热爱','2022-02-23 18:32:30',42,'L04');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL008','https://image.gcores.com/2c2ccbc9-57e9-4128-9e18-8adf30a061cc.jpg','素未谋面的无数作者共同创作的神秘组织：SCP 基金会专题','Secure，Contain，Protect——SCP','2022-02-23 18:42:30',675,'L06');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL009','https://image.gcores.com/d79b62a6-c785-4ca6-9ac4-a9008871fb33.jpg','两次世界大战的武备','爱好者众多的著名兵器与千奇百怪的非正常军武','2022-02-23 18:52:30',92,'L03');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL010','https://image.gcores.com/e6b1d086-966f-43f7-a1e4-fe07d511b708.jpg','喝点什么？那些有关酒的文章','“都在酒里！”','2022-02-23 19:12:30',382,'L02');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL011','https://image.gcores.com/2c7f5e0a-a891-48da-9a54-7e2bf4e9a08e.jpg','银屏系漫游指南','这里没有答案，只有热爱','2022-02-23 19:22:42',964,'L05');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL012','https://image.gcores.com/898d56c0-b26a-4dd5-8914-c8322f95dcfb.jpg','硬件：除了聊游戏，我们也来聊聊玩游戏的物质基础','灯条是好还是不好呢','2022-02-23 19:32:30',213,'L01');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL013','https://image.gcores.com/75a6a025-601b-434e-9093-1a7857c7b0f6.jpg','《极乐迪斯科》：来自苏联的最后一封信','在瑞瓦肖，我们停下来思考这个世界的荒谬与温暖','2022-02-23 19:52:10',425,'L06');
insert into collections(colId,colImg,colTitle, colSummary,colTime,colNum,lId) VALUES ('COL014','https://image.gcores.com/a509f972-0787-4ae6-aede-0afbe677d023.jpg','对MGS和小岛秀夫的爱，沉淀在多年的时光里','MGS 始终代表着一种无可替代的叙事风格和深邃宏大的世界观。这一切，都与那个正在主持《死亡搁浅》的男子不可分割。','2022-02-23 20:12:19',712,'L01');

-- 添加用户订阅
insert into users_sub(uId, colId) VALUES (1,'COL006');
insert into users_sub(uId, colId) VALUES (2,'COL003');
insert into users_sub(uId, colId) VALUES (1,'COL002');
insert into users_sub(uId, colId) VALUES (4,'COL008');
insert into users_sub(uId, colId) VALUES (3,'COL001');
insert into users_sub(uId, colId) VALUES (7,'COL002');
insert into users_sub(uId, colId) VALUES (5,'COL012');
insert into users_sub(uId, colId) VALUES (4,'COL002');
insert into users_sub(uId, colId) VALUES (11,'COL013');
insert into users_sub(uId, colId) VALUES (12,'COL009');
insert into users_sub(uId, colId) VALUES (2,'COL010');
insert into users_sub(uId, colId) VALUES (6,'COL004');
insert into users_sub(uId, colId) VALUES (7,'COL005');
insert into users_sub(uId, colId) VALUES (19,'COL004');
insert into users_sub(uId, colId) VALUES (18,'COL012');



# 查询所有标签
select * from label;

# 根据日期查询5条专题
select * from collections order by colTime desc limit 0,4;

# 查询订阅数最多的专题
select * from collections order by colNum desc limit 0,1;

# 查询首页推荐视频
select * from videos order by likes desc limit 0,3;

# 查询首页推荐资讯
select
       n.nId,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(c.content) 'cCount',u.name,u.avatar
from
    news n Left JOIN news_comment c on n.nId = c.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
group by n.nId
order by COUNT(c.content) desc limit 0,3;

# 查询首页最新资讯
select
       n.nId,n.img,n.title,n.releaseTime,n.likes,COUNT(c.content) 'cCount'
from
    news n Left JOIN news_comment c on n.nId = c.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
group by n.nId , n.releaseTime
order by n.releaseTime desc limit 0,5;

# 查询最新视频
select
       v.vId,l.lName,v.img,v.title,v.summary,v.releaseTime,v.url
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
group by v.vId,v.releaseTime
order by v.releaseTime limit 0,4;

# 查询最新文章
select
       a.aId,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
group by a.aId,a.releaseTime
order by a.releaseTime desc;

# 查询首页最新文章与最新视频
(select
       v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(vc.content) 'cCount',u.uId,u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
group by v.vId,v.releaseTime)
UNION DISTINCT
(select
       a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.uId,u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
group by a.aId,a.releaseTime)
order by releaseTime desc limit 12 offset 0;

# 查询首页最新文章与最新视频数量
select SUM(v.count + a.count) total from (select COUNT(*) count from videos) v , (select COUNT(*) count from articles) a;
select COUNT(*) from videos v;
select COUNT(*) from articles a;

# 渲染资讯页最新资讯
select
       n.nId,n.img,n.releaseTime,n.contentImg
from
    news n order by releaseTime desc limit 0,3;

# 渲染资讯页最热资讯
select n.nId,n.title,n.likes , COUNT(nc.content) 'cCount'
from news n Left JOIN news_comment nc on n.nId = nc.nId
group by n.nId , n.likes
order by n.likes desc limit 0,5;

# 渲染资讯页列表
select
       n.nId,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(c.content) 'cCount',u.name,u.avatar
from
    news n Left JOIN news_comment c on n.nId = c.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
group by n.nId
limit 12 offset 12;

# 查看资讯列表总数量
select COUNT(*) total from news;

# 获取一页专题
select colId , colImg from collections limit 12 offset 0;

# 获取专题总数
select COUNT(*) total from collections;

# 获取所有文章
select
       a.aId,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(a.content) 'cCount',u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
group by a.aId
limit 12 offset 0;

# 获取文章总数
select COUNT(*) total from articles;

# 获取视频列表
select
       v.vId,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(v.content) 'cCount',u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
group by v.vId
limit 12 offset 0;

# 获取视频总数量
select COUNT(*) total from videos;


# 根据lId查询各类型全部数据
(select
       n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(nc.content) 'cCount',u.name,u.avatar
from
    news n Left JOIN news_comment nc on n.nId = nc.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
where l.lId='L01'
group by n.nId)
UNION DISTINCT
(select
       v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(vc.content) 'cCount',u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
where l.lId='L01'
group by v.vId)
UNION DISTINCT
(select
       a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
where l.lId='L01'
group by a.aId)
limit 12 offset 0;


# 根据标签id查询列表数量
select SUM(n.count+v.count+a.count) total from (select COUNT(*) count from news where lId='L01') n , (select COUNT(*) count from videos where lId='L01') v , (select COUNT(*) count from articles where lId='L01') a;

# 根据标签id查询3篇最热视频
select l.lName , v.vId , v.contentImg from label l , videos v where l.lId = v.lId and l.lId = 'L06' order by v.likes desc limit 0,3;

# 根据标签id查询3篇最热文章
(select
       n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(nc.content) 'cCount',u.name,u.avatar
from
    news n Left JOIN news_comment nc on n.nId = nc.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
where l.lId='L02'
group by n.nId)
UNION DISTINCT
(select
       v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(vc.content) 'cCount',u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
where l.lId='L02'
group by v.vId)
UNION DISTINCT
(select
       a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
where l.lId='L02'
group by a.aId)
order by likes desc
limit 0,3;


# 根据标签查询推荐专题
select l.lName , col.colImg , col.colNum from label l , collections col where l.lId = col.lId and l.lId='L02' order by col.colNum desc limit 0,1;


# 根据标签id查询资讯列表
select
       n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(nc.content) 'cCount',u.name,u.avatar
from
    news n Left JOIN news_comment nc on n.nId = nc.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
where l.lId='L01'
group by n.nId , n.releaseTime
order by n.releaseTime limit 12 offset 0;

# 根据标签id查询资讯列表数量
select COUNT(*) total from news where lId='L01';

# 根据标签id查询视频列表
select
       v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(vc.content) 'cCount',u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
where l.lId='L01'
group by v.vId , v.releaseTime
order by v.releaseTime limit 12 offset 0;

# 根据标签id查询视频列表数量
select COUNT(*) total from videos where lId='L01';

# 根据标签id查询文章列表
select
       a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
where l.lId='L02'
group by a.aId , a.releaseTime
order by a.releaseTime limit 12 offset 0;

# 根据标签id查询文章列表数量
select COUNT(*) total from articles where lId='L01';

# 根据专题id查询专题
select * from collections where colId='COL001';




# 根据专题id查询资讯列表
select
     n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.name,u.avatar
from
    news n Left JOIN news_comment nc on n.nId = nc.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
            Left JOIN collections c on n.colId = c.colId
where c.colId='COL001'
group by n.nId , n.releaseTime
order by n.releaseTime limit 12 offset 0;
# 根据专题id查询资讯数量
select COUNT(*) total from news where colId='COL001';

# 根据专题id查询文章列表
select
     a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
            Left JOIN collections c on a.colId = c.colId
where c.colId='COL001'
group by a.aId , a.releaseTime
order by a.releaseTime limit 12 offset 0;
# 根据专题id查询文章数量
select COUNT(*) total from articles where colId='COL001';

# 根据专题id查询视频列表
select
     v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
            Left JOIN collections c on v.colId = c.colId
where c.colId='COL001'
group by v.vId , v.releaseTime
order by v.releaseTime limit 12 offset 0;
# 根据专题id查询视频数量
select COUNT(*) total from videos where colId='COL001';

# 根据专题id查询列表
(select
     n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.name,u.avatar
from
    news n Left JOIN news_comment nc on n.nId = nc.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
            Left JOIN collections c on n.colId = c.colId
where c.colId='COL001'
group by n.nId
) UNION DISTINCT
(select
     a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
            Left JOIN collections c on a.colId = c.colId
where c.colId='COL001'
group by a.aId
) UNION DISTINCT
(select
     v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
            Left JOIN collections c on v.colId = c.colId
where c.colId='COL001'
group by v.vId , v.releaseTime
)
order by likes desc
limit 12 offset 0;
# 根据专题id查询列表数量
select SUM(a.count + n.count + v.count) total from (select COUNT(*) count from news where colId='COL001') n , (select COUNT(*) count from articles where colId='COL001') a , (select COUNT(*) count from videos where colId='COL001') v;




# 根据资讯id查询资讯内容
select
     n.nId , n.category,l.lId ,l.lName,n.contentImg,n.title,n.summary,n.releaseTime,n.content,n.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.uId,u.name,u.avatar
from
    news n Left JOIN news_comment nc on n.nId = nc.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
            Left JOIN collections c on n.colId = c.colId
where n.nId='N001';

# 根据资讯id查询资讯评论
select nc.nId , u.avatar , u.name , nc.commentTime , nc.content from users u , news_comment nc where u.uId = nc.uId and nc.nId = 'N001' order by commentTime desc limit 10 offset 0;

# 查询资讯评论数量
select COUNT(*) total from news_comment where nId = 'N001';

# 查询本周最热文章
select
     a.aId,a.img,a.title,a.releaseTime,a.likes,COUNT(ac.content) 'cCount'
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
group by a.aId , a.likes
order by a.likes limit 0,10;


# 根据文章id查询文章
select
     a.aId , a.category,l.lId ,l.lName,a.contentImg,a.title,a.summary,a.releaseTime,a.content,a.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.uId,u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
            Left JOIN collections c on a.colId = c.colId
where a.aId='A001';

# 根据文章id查询文章评论
select ac.aId , u.avatar , u.name , ac.commentTime , ac.content from articles_comment ac , users u where u.uId = ac.uId and ac.aId='A001' order by commentTime desc limit 10 offset 0;

# 查询文章评论数量
select COUNT(*) total from articles_comment where aId='A014';


# 根据视频id查询视频
select
     v.vId , v.category,l.lId ,l.lName ,v.url,v.contentImg,v.title,v.summary,v.releaseTime,v.content,v.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.uId,u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
            Left JOIN collections c on v.colId = c.colId
where v.vId='V001';

# 根据视频id查询视频评论
select vc.vId , u.avatar , u.name , vc.commentTime , vc.content from videos_comment vc , users u where u.uId = vc.uId and vc.vId='V001' order by commentTime desc limit 10 offset 0;

# 查询视频评论数量
select COUNT(*) total from videos_comment where vId='V001';

# 根据账号 / 密码 登录
select * from users where account='12345' and password='1234';

# 根据用户名 / 账号 / 密码 注册
insert into users(name, account, password) VALUES ('halo','842493','1234');



# 根据用户id与订阅id查询是否订阅
select subInfo from users_sub where uId=1 and colId='COL001';

# 添加用户订阅
insert into users_sub(uId, colId) VALUES (18,'COL002');

# 添加订阅人数
update collections set colNum=colNum+1 where colId = 'COL001';

# 确认用户订阅
update users_sub set subInfo='已订阅' where uId=1 and colId='COL001';

# 减少订阅人数
update collections set colNum=colNum-1 where colId = 'COL001';

# 取消用户订阅
update users_sub set subInfo='未订阅' where uId=1 and colId='COL001';

# 查询用户订阅列表
select col.colImg from users u , users_sub us , collections col where u.uId = us.uId and us.colId = col.colId and u.uId=1;

# 用户点赞
update news set likes=likes+1 where nId='N001';
update videos set likes=likes+1 where vId='V001';
update articles set likes=likes+1 where aId='A001';

# 用户评论
insert into news_comment(nId, uId, content, commentTime) VALUES ('N001',1,'1234213','2022/3/11 08:34:04');

select * from articles_comment where aId='A001' order by commentTime desc;

# 查询用户详情
select name,avatar from users where uId=1;

# 查询用户投稿的文章
(select
     n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.name,u.avatar
from
    news n Left JOIN news_comment nc on n.nId = nc.nId
            Left JOIN users u on n.uId = u.uId
            Left JOIN label l  on n.lId = l.lId
            Left JOIN collections c on n.colId = c.colId
where u.uId = 1
group by n.nId
) UNION DISTINCT
(select
     a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.name,u.avatar
from
    articles a Left JOIN articles_comment ac on a.aId = ac.aId
            Left JOIN users u on a.uId = u.uId
            Left JOIN label l  on a.lId = l.lId
            Left JOIN collections c on a.colId = c.colId
where u.uId = 1
group by a.aId
) UNION DISTINCT
(select
     v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.name,u.avatar
from
    videos v Left JOIN videos_comment vc on v.vId = vc.vId
            Left JOIN users u on v.uId = u.uId
            Left JOIN label l  on v.lId = l.lId
            Left JOIN collections c on v.colId = c.colId
where u.uId = 1
group by v.vId , v.releaseTime
)
order by releaseTime desc
limit 0,8;

# 查询用户投稿的文章数量
select SUM(n.count + a.count + v.count) total from (select COUNT(*) count from news where uId=1) n ,  (select COUNT(*) count from articles where uId=1) a ,  (select COUNT(*) count from videos where uId=1) v;

# 查询用户订阅数量
select COUNT(*) total from users_sub where uId=1 and subInfo='已订阅';

select col.colId , col.colTitle from users u , users_sub us , collections col where u.uId = us.uId and us.colId = col.colId and u.uId=1 and us.subInfo='已订阅' limit 6 offset 0;

select * from users where name='张三' or account='51342354213123';