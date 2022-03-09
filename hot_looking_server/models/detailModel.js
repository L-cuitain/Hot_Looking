const {query} = require("../db/query");

//根据资讯id查询资讯内容
module.exports.getNewsByNId = async (nId) => {
    const sql = "select\n" +
        "     n.nId , n.category,l.lId ,l.lName,n.contentImg,n.title,n.summary,n.releaseTime,n.content,n.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    news n Left JOIN news_comment nc on n.nId = nc.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "            Left JOIN collections c on n.colId = c.colId\n" +
        "where n.nId=?;";

    return await query(sql,nId);
}

//获取本周最热文章
module.exports.getHotArticlesByWeek = async () => {
    const sql = "select\n" +
        "     a.aId,a.img,a.title,a.releaseTime,a.likes,COUNT(ac.content) 'cCount'\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "group by a.aId , a.likes\n" +
        "order by a.likes limit 0,10;";
    return await query(sql);
}

//根据资讯id查询评论
module.exports.getCommentByNid = async (nId,offsetNum) => {
    const sql = "select nc.nId , u.avatar , u.name , nc.commentTime , nc.content from users u , news_comment nc where u.uId = nc.uId and nc.nId = ? order by commentTime desc limit 10 offset ?;\n";
    return await query(sql,[nId,offsetNum]);
}

//根据资讯id查询评论数量
module.exports.getCommentTotal = async (nId) => {
    const sql = "select COUNT(*) total from news_comment where nId = ?;\n";
    return await query(sql,nId);
}

// 根据文章id查询文章
module.exports.getArticleByAId = async (aId) => {
    const sql = "select\n" +
        "     a.aId , a.category,l.lId ,l.lName,a.contentImg,a.title,a.summary,a.releaseTime,a.content,a.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "            Left JOIN collections c on a.colId = c.colId\n" +
        "where a.aId=?;";
    return await query(sql,aId);
}

// 根据文章id查询文章评论
module.exports.getCommentByAid = async (aId,offsetNum) => {
    const sql = "select ac.aId , u.avatar , u.name , ac.commentTime , ac.content from articles_comment ac , users u where u.uId = ac.uId and ac.aId=? order by commentTime desc limit 10 offset ?;\n";
    return await query(sql,[aId,offsetNum]);
}

// 查询文章评论数量
module.exports.getACommentTotal = async (aId) => {
    const sql = "select COUNT(*) total from articles_comment where aId=?;";
    return await query(sql,aId);
}

// 根据视频id查询视频
module.exports.getVideoByVId = async (vId) => {
    const sql = "select\n" +
        "     v.vId , v.category,l.lId ,l.lName ,v.url,v.contentImg,v.title,v.summary,v.releaseTime,v.content,v.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "            Left JOIN collections c on v.colId = c.colId\n" +
        "where v.vId=?;";
    return await query(sql,vId);
}
// 根据视频id查询视频评论
module.exports.getCommentByVid = async (vId,offsetNum) => {
    const sql = "select vc.vId , u.avatar , u.name , vc.commentTime , vc.content from videos_comment vc , users u where u.uId = vc.uId and vc.vId=? order by commentTime desc limit 10 offset ?;\n";
    return await query(sql,[vId,offsetNum]);
}
// 查询视频评论内容
module.exports.getVCommentTotal = async (vId) => {
    const sql = "select COUNT(*) total from videos_comment where vId=?;";
    return await query(sql,vId);
}
