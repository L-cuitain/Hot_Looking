const {query} = require("../db/query");

//查找专题列表
module.exports.getCollectionsAll = async (offsetNum) => {
    const sql = "select colId , colImg from collections limit 12 offset ?;";

    return await query(sql,offsetNum);
}

//获取专题总数
module.exports.getCollectionsTotal = async () => {
    const sql = "select COUNT(*) total from collections;";
    return await query(sql);
}

//根据专题id查询指定专题
module.exports.getCollectionByColId = async (colId) => {
    const sql = "select * from collections where colId=?;";
    return await query(sql,colId);
}

//获取专题详情总列表
module.exports.getDetailAllList = async (colId,offsetNum) => {
    const sql = "(select\n" +
        "     n.nId , n.category, l.lId ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    news n Left JOIN news_comment nc on n.nId = nc.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "            Left JOIN collections c on n.colId = c.colId\n" +
        "where c.colId=?\n" +
        "group by n.nId\n" +
        ") UNION DISTINCT\n" +
        "(select\n" +
        "     a.aId , a.category,l.lId ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "            Left JOIN collections c on a.colId = c.colId\n" +
        "where c.colId=?\n" +
        "group by a.aId\n" +
        ") UNION DISTINCT\n" +
        "(select\n" +
        "     v.vId , v.category,l.lId ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "            Left JOIN collections c on v.colId = c.colId\n" +
        "where c.colId=?\n" +
        "group by v.vId , v.releaseTime\n" +
        ")\n" +
        "order by likes desc\n" +
        "limit 12 offset ?;";
    return await query(sql,[colId,colId,colId,offsetNum]);
}
//获取专题详情总数量
module.exports.getDetailALlTotal = async (colId) => {
    const sql = "select SUM(a.count + n.count + v.count) total from (select COUNT(*) count from news where colId=?) n , (select COUNT(*) count from articles where colId=?) a , (select COUNT(*) count from videos where colId=?) v;\n";
    return await query(sql,[colId,colId,colId]);
}

//获取专题详情资讯
module.exports.getDetailNewsList = async (colId,offsetNum) => {
    const sql = "select\n" +
        "     n.nId , n.category,l.lId ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    news n Left JOIN news_comment nc on n.nId = nc.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "            Left JOIN collections c on n.colId = c.colId\n" +
        "where c.colId=?\n" +
        "group by n.nId , n.releaseTime\n" +
        "order by n.releaseTime desc limit 12 offset ?;";
    return await query(sql,[colId,offsetNum]);
}

//获取专题详情资讯数量
module.exports.getDetailNewsTotal = async (colId) => {
    const sql = "select COUNT(*) total from news where colId=?;";
    return await query(sql,colId);
}

//获取专题详情文章
module.exports.getDetailArticlesList = async (colId,offsetNum) => {
    const sql = "select\n" +
        "     a.aId , a.category,l.lId ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "            Left JOIN collections c on a.colId = c.colId\n" +
        "where c.colId=?\n" +
        "group by a.aId , a.releaseTime\n" +
        "order by a.releaseTime desc limit 12 offset ?;";
    return await query(sql,[colId,offsetNum]);
}
//获取专题详情文章数量
module.exports.getDetailArticlesTotal = async (colId) => {
    const sql = "select COUNT(*) total from articles where colId=?;";
    return await query(sql,colId);
}

//获取专题详情视频
module.exports.getDetailVideosList = async (colId,offsetNum) => {
    const sql = "select\n" +
        "     v.vId , v.category,l.lId ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.uId,u.name,u.avatar\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "            Left JOIN collections c on v.colId = c.colId\n" +
        "where c.colId=?\n" +
        "group by v.vId , v.releaseTime\n" +
        "order by v.releaseTime desc limit 12 offset ?;";
    return await query(sql,[colId,offsetNum]);
}
//获取专题详情视频数量
module.exports.getDetailVideosTotal = async (colId) => {
    const sql = "select COUNT(*) total from videos where colId=?;";
    return await query(sql,colId);
}