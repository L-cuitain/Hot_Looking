const {query} = require("../db/query");

//查找专题列表
module.exports.getArticlesAll = async (offsetNum) => {
    const sql = "select\n" +
        "       a.aId , l.lId ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(a.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "group by a.aId\n" +
        "limit 12 offset ?;";
    return await query(sql,offsetNum);
}

//获取专题总数
module.exports.getArticlesTotal = async () => {
    const sql = "select COUNT(*) total from collections;";
    return await query(sql);
}