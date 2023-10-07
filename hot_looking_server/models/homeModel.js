const { query } = require('../db/query');

//获取首页专题
module.exports.getCollection = async () => {
    const sql = "select * from collections order by colTime desc limit 0,4;";
    return await query(sql);
}

//查询首页订阅数最多的专题
module.exports.getCollectionByNum = async () => {
    const sql = "select * from collections order by colNum desc limit 0,1";
    return await query(sql);
}

//查询推荐视频
module.exports.getVideoByNum = async () => {
    const sql = "select * from hot_con where category = 'videos' and review = 1 order by likes desc limit 0,3;";
    return await query(sql);
}

//查询首页推荐资讯
module.exports.getNewsByComment = async () => {
    const sql = "select\n" +
        "       n.hcId,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(c.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con n Left JOIN hc_comment c on n.hcId = c.hcId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "where n.category = 'news' and review = 1\n" +
        "group by n.hcId\n" +
        "order by COUNT(c.content) desc limit 0,3;";
    return await query(sql);
}

//查询首页最新资讯
module.exports.getNewsByRTime = async () => {
    const sql = "select\n" +
        "       n.hcId,n.img,n.title,n.releaseTime,n.likes,COUNT(c.content) 'cCount'\n" +
        "from\n" +
        "    hot_con n Left JOIN hc_comment c on n.hcId = c.hcId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "where n.category = 'news' and review = 1\n" +
        "group by n.hcId , n.releaseTime\n" +
        "order by n.releaseTime desc limit 0,5;";
    return await query(sql);
}

//查询首页最新文章和视频
module.exports.getAVByRTime = async () => {
    const sql = "select va.hcId , va.category , l.lId ,l.lName,va.img,va.title,va.summary,va.releaseTime,va.likes,COUNT(vc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from hot_con va Left JOIN hc_comment vc on va.hcId = vc.hcId\n" +
        "            Left JOIN users u on va.uId = u.uId\n" +
        "            Left JOIN label l  on va.lId = l.lId\n" +
        "where va.review = 1 and va.category = 'videos' or va.category = 'articles'\n" +
        "group by va.hcId,va.releaseTime\n" +
        "order by releaseTime desc limit 12 offset 5;";
    return await query(sql);
}

//查询首页播放视频列表
module.exports.getIframeByRTime = async () => {
    const sql = "select\n" +
        "       v.hcId,l.lName,v.img,v.title,v.summary,v.releaseTime,v.url\n" +
        "from\n" +
        "    hot_con v Left JOIN hc_comment vc on v.hcId = vc.hcId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "where v.category = 'videos' and review = 1\n" +
        "group by v.hcId,v.releaseTime\n" +
        "order by v.releaseTime limit 0,4;";

    return await query(sql);
}