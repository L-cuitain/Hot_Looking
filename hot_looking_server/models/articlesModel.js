const {query} = require("../db/query");

//查找文章列表
module.exports.getArticlesAll = async (offsetNum) => {
    const sql = "select\n" +
        "       a.hcId,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(a.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con a Left JOIN hc_comment ac on a.hcId = ac.hcId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "where a.category = 'articles'\n" +
        "group by a.hcId\n" +
        "limit 12 offset ?;";
    return await query(sql,offsetNum);
}

//获取文章总数
module.exports.getArticlesTotal = async () => {
    const sql = "select COUNT(*) total from hot_con where category = 'articles';";
    return await query(sql);
}