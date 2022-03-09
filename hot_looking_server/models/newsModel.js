const {query} = require("../db/query");

// 查询最新资讯
module.exports.getNewsByRTime = async () => {
    const sql = "select\n" +
        "       n.nId,n.category,n.img,n.releaseTime,n.contentImg\n" +
        "from\n" +
        "    news n order by releaseTime desc limit 0,3;";

    return await query(sql);
}

//查询最热资讯
module.exports.getNewsByLikes = async () => {
    const sql = "select n.nId,n.title,n.likes , COUNT(nc.content) 'cCount'\n" +
        "from news n Left JOIN news_comment nc on n.nId = nc.nId\n" +
        "group by n.nId , n.likes\n" +
        "order by n.likes desc limit 0,5;";
    return await query(sql);
}

//查询资讯列表
module.exports.getNewsAll = async (offsetNum) => {
    const sql = "select\n" +
        "       n.nId,l.lId,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(c.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    news n Left JOIN news_comment c on n.nId = c.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "group by n.nId\n" +
        "limit 12 offset ?;";
    return await query(sql,offsetNum);
}

//查询资讯数量
module.exports.getNewsByCount = async () => {
    const sql = "select COUNT(*) total from news;";
    return await query(sql);
}

