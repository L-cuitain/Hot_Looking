const { query } = require('../db/query');

//获取首页专题
module.exports.getCollection = async () => {
    const sql = "select * from collections order by colTime desc limit 0,4";
    return await query(sql);
}

//查询首页订阅数最多的专题
module.exports.getCollectionByNum = async () => {
    const sql = "select * from collections order by colNum desc limit 0,1";
    return await query(sql);
}

//查询推荐视频
module.exports.getVideoByNum = async () => {
    const sql = "select * from videos order by likes desc limit 0,3";
    return await query(sql);
}

//查询首页推荐资讯
module.exports.getNewsByComment = async () => {
    const sql = "select\n" +
        "       n.nId,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(c.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    news n Left JOIN news_comment c on n.nId = c.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "group by n.nId\n" +
        "order by COUNT(c.content) desc limit 0,3;";
    return await query(sql);
}

//查询首页最新资讯
module.exports.getNewsByRTime = async () => {
    const sql = "select\n" +
        "       n.nId,n.img,n.title,n.releaseTime,n.likes,COUNT(c.content) 'cCount'\n" +
        "from\n" +
        "    news n Left JOIN news_comment c on n.nId = c.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "group by n.nId , n.releaseTime\n" +
        "order by n.releaseTime limit 0,5;";
    return await query(sql);
}

//查询首页最新文章和视频
module.exports.getAVByRTime = async () => {
    const sql = "(select\n" +
        "       v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(vc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "group by v.vId,v.releaseTime)\n" +
        "UNION DISTINCT\n" +
        "(select\n" +
        "       a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "group by a.aId,a.releaseTime)\n" +
        "order by releaseTime limit 0,12;";
    return await query(sql);
}

//查询首页播放视频列表
module.exports.getIframeByRTime = async () => {
    const sql = "select\n" +
        "       v.vId,l.lName,v.img,v.title,v.summary,v.releaseTime,v.url\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "group by v.vId,v.releaseTime\n" +
        "order by v.releaseTime limit 0,4;";

    return await query(sql);
}