const {query} = require("../db/query");

// 查询最新资讯
module.exports.getNewsByRTime = async () => {
    const sql = "select\n" +
        "       n.hcId,n.img,n.releaseTime,n.contentImg\n" +
        "from\n" +
        "    hot_con n where category = 'news' order by releaseTime desc limit 0,3;";

    return await query(sql);
}

//查询最热资讯
module.exports.getNewsByLikes = async () => {
    const sql = "select n.hcId,n.title,n.likes , COUNT(nc.content) 'cCount'\n" +
        "from hot_con n Left JOIN hc_comment nc on n.hcId = nc.hcId\n" +
        "where n.category = 'news'\n" +
        "group by n.hcId , n.likes\n" +
        "order by n.likes desc limit 0,5;";
    return await query(sql);
}

//查询资讯列表
module.exports.getNewsAll = async (offsetNum) => {
    const sql = "select\n" +
        "       n.hcId,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(c.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con n Left JOIN hc_comment c on n.hcId = c.hcId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "where n.category = 'news'\n" +
        "group by n.hcId\n" +
        "limit 12 offset ?;";
    return await query(sql,offsetNum);
}

//查询资讯数量
module.exports.getNewsByCount = async () => {
    const sql = "select COUNT(*) total from hot_con where category = 'news';";
    return await query(sql);
}

