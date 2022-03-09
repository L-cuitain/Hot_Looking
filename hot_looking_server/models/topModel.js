const {query} = require("../db/query");

//查找所有最新文章与视频
module.exports.getAVALl = async (offsetNum) => {
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
        "order by releaseTime desc limit 12 offset ?;";

    return await query(sql,offsetNum);
}

//查找最新文章和最新视频总数量
module.exports.getAVTotal = async () => {
    const sql = "select SUM(v.count + a.count) total from (select COUNT(*) count from videos) v , (select COUNT(*) count from articles) a;\n";
    return await query(sql);
}