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
    const sql = "select\n" +
        "hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,c.colTitle,c.colSummary,c.colNum,COUNT(hcc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "     hot_con hc Left JOIN hc_comment hcc on hc.hcId = hcc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where c.colId=?\n" +
        "group by hc.hcId , hc.releaseTime , hc.likes\n" +
        "order by likes desc\n" +
        "limit 12 offset ?;";
    return await query(sql,[colId,offsetNum]);
}
//获取专题详情总数量
module.exports.getDetailALlTotal = async (colId) => {
    const sql = "select COUNT(hot_con.hcId) total from hot_con where colId=?;";
    return await query(sql,[colId]);
}

//获取专题详情资讯
module.exports.getDetailNewsList = async (colId,offsetNum) => {
    const sql = "select\n" +
        "     hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,c.colTitle,c.colSummary,c.colNum,COUNT(nc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment nc on hc.hcId = nc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where hc.category = 'news' and  c.colId=?\n" +
        "group by hc.hcId , hc.releaseTime\n" +
        "order by hc.releaseTime limit 12 offset ?;";
    return await query(sql,[colId,offsetNum]);
}

//获取专题详情资讯数量
module.exports.getDetailNewsTotal = async (colId) => {
    const sql = "select COUNT(*) total from hot_con where category = 'news' and colId=?;";
    return await query(sql,colId);
}

//获取专题详情文章
module.exports.getDetailArticlesList = async (colId,offsetNum) => {
    const sql = "select\n" +
        "     hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,c.colTitle,c.colSummary,c.colNum,COUNT(ac.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment ac on hc.hcId = ac.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where hc.category = 'articles' and c.colId=?\n" +
        "group by hc.hcId , hc.releaseTime\n" +
        "order by hc.releaseTime limit 12 offset ?;";
    return await query(sql,[colId,offsetNum]);
}
//获取专题详情文章数量
module.exports.getDetailArticlesTotal = async (colId) => {
    const sql = "select COUNT(*) total from hot_con where category = 'articles' and colId=?;";
    return await query(sql,colId);
}

//获取专题详情视频
module.exports.getDetailVideosList = async (colId,offsetNum) => {
    const sql = "select\n" +
        "     hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment vc on hc.hcId = vc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where hc.category = 'videos' and c.colId=?\n" +
        "group by hc.hcId , hc.releaseTime\n" +
        "order by hc.releaseTime limit 12 offset ?;";
    return await query(sql,[colId,offsetNum]);
}
//获取专题详情视频数量
module.exports.getDetailVideosTotal = async (colId) => {
    const sql = "select COUNT(*) total from hot_con where category = 'videos' and colId=?;";
    return await query(sql,colId);
}