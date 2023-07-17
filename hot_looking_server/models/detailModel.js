const {query} = require("../db/query");

//根据资讯id查询资讯内容
module.exports.getNewsByNId = async (nId) => {
    const sql = "select\n" +
        "     hc.hcId , hc.category,l.lId ,l.lName,hc.contentImg,hc.title,hc.summary,hc.releaseTime,hc.content,hc.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment nc on hc.hcId = nc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where hc.category = 'news' and hc.hcId=?;";

    return await query(sql,nId);
}

//获取本周最热文章
module.exports.getHotArticlesByWeek = async () => {
    const sql = "select\n" +
        "     hc.hcId,hc.img,hc.title,hc.releaseTime,hc.likes,COUNT(ac.content) 'cCount'\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment ac on hc.hcId = ac.hcId\n" +
        "where hc.category = 'articles'\n" +
        "group by hc.hcId , hc.likes\n" +
        "order by hc.likes limit 0,10;";
    return await query(sql);
}

//根据资讯id查询评论
module.exports.getCommentByNid = async (nId,offsetNum) => {
    const sql = "select nc.hcId , u.avatar , u.name , nc.commentTime , nc.content from users u , hc_comment nc where u.uId = nc.uId and nc.hcId = ? order by commentTime desc limit 10 offset ?;";
    return await query(sql,[nId,offsetNum]);
}

//根据资讯id查询评论数量
module.exports.getCommentTotal = async (nId) => {
    const sql = "select COUNT(*) total from hc_comment where hcId = ?;";
    return await query(sql,nId);
}

// 根据文章id查询文章
module.exports.getArticleByAId = async (aId) => {
    const sql = "select\n" +
        "     hc.hcId , hc.category,l.lId ,l.lName,hc.contentImg,hc.title,hc.summary,hc.releaseTime,hc.content,hc.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment ac on hc.hcId = ac.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where hc.category = 'articles' and hc.hcId=?;";
    return await query(sql,aId);
}

// 根据文章id查询文章评论
module.exports.getCommentByAid = async (aId,offsetNum) => {
    const sql = "select ac.hcId , u.avatar , u.name , ac.commentTime , ac.content from hc_comment ac , users u where u.uId = ac.uId and ac.hcId=? order by commentTime desc limit 10 offset ?;";
    return await query(sql,[aId,offsetNum]);
}

// 查询文章评论数量
module.exports.getACommentTotal = async (aId) => {
    const sql = "select COUNT(*) from hc_comment where hcId=?;";
    return await query(sql,aId);
}

// 根据视频id查询视频
module.exports.getVideoByVId = async (vId) => {
    const sql = "select\n" +
        "     hc.hcId , hc.category,l.lId ,l.lName ,hc.url,hc.contentImg,hc.title,hc.summary,hc.releaseTime,hc.content,hc.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment vc on hc.hcId = vc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where hc.category='videos' and hc.hcId=?;";
    return await query(sql,vId);
}
// 根据视频id查询视频评论
module.exports.getCommentByVid = async (vId,offsetNum) => {
    const sql = "select vc.hcId , u.avatar , u.name , vc.commentTime , vc.content from hc_comment vc , users u where u.uId = vc.uId and vc.hcId=? order by commentTime desc limit 10 offset ?;";
    return await query(sql,[vId,offsetNum]);
}
// 查询视频评论内容
module.exports.getVCommentTotal = async (vId) => {
    const sql = "select COUNT(*) total from hc_comment where hcId=?;";
    return await query(sql,vId);
}
