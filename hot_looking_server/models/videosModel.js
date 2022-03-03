const {query} = require("../db/query");

//查找视频列表
module.exports.getVideosAll = async (offsetNum) => {
    const sql = "select\n" +
        "       v.vId,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(v.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "group by v.vId\n" +
        "limit 12 offset ?;";
    return await query(sql,offsetNum);
}

//获取视频总数
module.exports.getVideosTotal = async () => {
    const sql = "select COUNT(*) total from videos;";
    return await query(sql);
}