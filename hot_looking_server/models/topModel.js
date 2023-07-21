const {query} = require("../db/query");

//查找所有最新文章与视频
module.exports.getAVALl = async (offsetNum) => {
    const sql = "select va.hcId , va.category ,l.lName,va.img,va.title,va.summary,va.releaseTime,va.likes,COUNT(vc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from hot_con va Left JOIN hc_comment vc on va.hcId = vc.hcId\n" +
        "            Left JOIN users u on va.uId = u.uId\n" +
        "            Left JOIN label l  on va.lId = l.lId\n" +
        "where va.review = 1 and va.category = 'videos' or va.category = 'articles'\n" +
        "group by va.hcId,va.releaseTime\n" +
        "order by releaseTime desc limit 12 offset ?;";

    return await query(sql,offsetNum);
}

//查找最新文章和最新视频总数量
module.exports.getAVTotal = async () => {
    const sql = "select SUM(v.count + a.count) total from (select COUNT(*) count from hot_con where category = 'videos' and review = 1) v , (select COUNT(*) count from hot_con where category = 'articles' and review = 1) a;";
    return await query(sql);
}