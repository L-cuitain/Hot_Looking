const {query} = require("../db/query");

//根据标签id查询3篇最热视频
module.exports.getVideoByLikes = async (lId) => {
    const sql = "select l.lName , v.hcId , v.contentImg from label l , hot_con v where v.category = 'videos' and v.review = 1 and l.lId = v.lId and l.lId = ? order by v.likes desc limit 0,3;";
    return await query(sql,[lId]);
}

//根据标签id查询3篇最热文章
module.exports.getHotByLabel = async (lId) => {
    const sql = "select hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,COUNT(ac.content) 'cCount',u.name,u.avatar\n" +
        "from hot_con hc Left JOIN hc_comment ac on hc.hcId = ac.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "where l.lId=? and hc.review = 1\n" +
        "group by hc.hcId,hc.likes\n" +
        "order by hc.likes desc\n" +
        "limit 0,3;";
    return await query(sql,[lId]);
}

//根据标签id查询推荐专题
module.exports.getCollectionByLabel = async (lId) => {
    const sql = "select l.lName , col.colImg , col.colNum from label l , collections col where l.lId = col.lId and l.lId=? order by col.colNum desc limit 0,1;\n";
    return await query(sql,lId);
}


//查找标签对应的所有数据
module.exports.getListByLabel = async (lId,offsetNum) => {
    const sql = "select hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,COUNT(ac.content) 'cCount',u.name,u.avatar\n" +
        "from hot_con hc LEFT JOIN hc_comment ac on hc.hcId = ac.hcId\n" +
        "            LEFT JOIN users u on hc.uId = u.uId\n" +
        "            LEFT JOIN label l  on hc.lId = l.lId\n" +
        "where hc.lId=? and hc.review = 1\n" +
        "group by hc.hcId\n" +
        "limit 12 offset ?;";
    return await query(sql,[lId,offsetNum]);
}

//根据标签id查询列表总数量
module.exports.getTotalByLabel = async (lId) => {
    const sql = "select COUNT(hcId) total from hot_con where lId = ? and review = 1;";
    return await query(sql,[lId]);
}

//根据标签id查询资讯列表
module.exports.getNewsListByLabel = async (lId,offsetNum) => {
    const sql = "select\n" +
        "       hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,COUNT(nc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment nc on hc.hcId = nc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "where hc.category = 'news' and hc.review = 1 and l.lId=?\n" +
        "group by hc.hcId , hc.releaseTime\n" +
        "order by hc.releaseTime limit 12 offset ?;";
    return await query(sql , [lId,offsetNum]);
}

//根据标签id查询资讯列表数量
module.exports.getNewsCountByLabel = async (lId) => {
    const sql = "select COUNT(*) total from hot_con where category = 'news' and review = 1 and lId=?;";
    return await query(sql,lId);
}

//根据标签id查询视频列表
module.exports.getVideosListByLabel = async (lId,offsetNum) => {
    const sql = "select\n" +
        "       hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,COUNT(vc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment vc on hc.hcId = vc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "where hc.category = 'videos' and hc.review = 1 and l.lId=?\n" +
        "group by hc.hcId , hc.releaseTime\n" +
        "order by hc.releaseTime limit 12 offset ?;";
    return await query(sql , [lId,offsetNum]);
}

//根据标签id查询视频列表数量
module.exports.getVideosCountByLabel = async (lId) => {
    const sql = "select COUNT(*) total from hot_con where category = 'videos' and review = 1 and lId='L01';";
    return await query(sql,lId);
}

//根据标签id查询文章列表
module.exports.getArticlesListByLabel = async (lId,offsetNum) => {
    const sql = "select\n" +
        "       hc.hcId , hc.category ,l.lName,hc.img,hc.title , hc.summary,hc.releaseTime,hc.likes,COUNT(ac.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment ac on hc.hcId = ac.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "where hc.category = 'articles' and hc.review = 1 and l.lId=?\n" +
        "group by hc.hcId , hc.releaseTime\n" +
        "order by hc.releaseTime limit 12 offset ?;";
    return await query(sql , [lId,offsetNum]);
}

//根据标签id查询文章列表数量
module.exports.getArticlesCountByLabel = async (lId) => {
    const sql = "select COUNT(*) total from hot_con where category = 'articles' and review = 1 and lId=?;";
    return await query(sql,lId);
}