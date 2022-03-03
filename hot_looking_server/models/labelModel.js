const {query} = require("../db/query");

//根据标签id查询3篇最热视频
module.exports.getVideoByLikes = async (lId) => {
    const sql = "select l.lName , v.vId , v.contentImg from label l , videos v where l.lId = v.lId and l.lId = ? order by v.likes desc limit 0,3;\n";
    return await query(sql,[lId]);
}

//根据标签id查询3篇最热文章
module.exports.getHotByLabel = async (lId) => {
    const sql = "(select\n" +
        "       n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(nc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    news n Left JOIN news_comment nc on n.nId = nc.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by n.nId)\n" +
        "UNION DISTINCT\n" +
        "(select\n" +
        "       v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(vc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by v.vId)\n" +
        "UNION DISTINCT\n" +
        "(select\n" +
        "       a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by a.aId)\n" +
        "order by likes desc\n" +
        "limit 0,3;";
    return await query(sql,[lId,lId,lId]);
}

//根据标签id查询推荐专题
module.exports.getCollectionByLabel = async (lId) => {
    const sql = "select l.lName , col.colImg , col.colNum from label l , collections col where l.lId = col.lId and l.lId=? order by col.colNum desc limit 0,1;\n";
    return await query(sql,lId);
}


//查找标签对应的所有数据
module.exports.getListByLabel = async (lId,offsetNum) => {
    const sql = "(select\n" +
        "       n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(nc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    news n Left JOIN news_comment nc on n.nId = nc.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by n.nId)\n" +
        "UNION DISTINCT\n" +
        "(select\n" +
        "       v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(vc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by v.vId)\n" +
        "UNION DISTINCT\n" +
        "(select\n" +
        "       a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by a.aId)\n" +
        "limit 12 offset ?;";
    return await query(sql,[lId,lId,lId,offsetNum]);
}

//根据标签id查询列表总数量
module.exports.getTotalByLabel = async (lId) => {
    const sql = "select SUM(n.count+v.count+a.count) total from (select COUNT(*) count from news where lId=?) n , (select COUNT(*) count from videos where lId=?) v , (select COUNT(*) count from articles where lId=?) a;\n";
    return await query(sql,[lId,lId,lId]);
}

//根据标签id查询资讯列表
module.exports.getNewsListByLabel = async (lId,offsetNum) => {
    const sql = "select\n" +
        "       n.nId , n.category ,l.lName,n.img,n.title,n.summary,n.releaseTime,n.likes,COUNT(nc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    news n Left JOIN news_comment nc on n.nId = nc.nId\n" +
        "            Left JOIN users u on n.uId = u.uId\n" +
        "            Left JOIN label l  on n.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by n.nId\n" +
        "limit 12 offset ?;";
    return await query(sql , [lId,offsetNum]);
}

//根据标签id查询资讯列表数量
module.exports.getNewsCountByLabel = async (lId) => {
    const sql = "select COUNT(*) total from news where lId=?;";
    return await query(sql,lId);
}

//根据标签id查询视频列表
module.exports.getVideosListByLabel = async (lId,offsetNum) => {
    const sql = "select\n" +
        "       v.vId , v.category ,l.lName,v.img,v.title,v.summary,v.releaseTime,v.likes,COUNT(vc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    videos v Left JOIN videos_comment vc on v.vId = vc.vId\n" +
        "            Left JOIN users u on v.uId = u.uId\n" +
        "            Left JOIN label l  on v.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by v.vId\n" +
        "limit 12 offset ?;";
    return await query(sql , [lId,offsetNum]);
}

//根据标签id查询视频列表数量
module.exports.getVideosCountByLabel = async (lId) => {
    const sql = "select COUNT(*) total from videos where lId=?;";
    return await query(sql,lId);
}

//根据标签id查询文章列表
module.exports.getArticlesListByLabel = async (lId,offsetNum) => {
    const sql = "select\n" +
        "       a.aId , a.category ,l.lName,a.img,a.title,a.summary,a.releaseTime,a.likes,COUNT(ac.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    articles a Left JOIN articles_comment ac on a.aId = ac.aId\n" +
        "            Left JOIN users u on a.uId = u.uId\n" +
        "            Left JOIN label l  on a.lId = l.lId\n" +
        "where l.lId=?\n" +
        "group by a.aId\n" +
        "limit 12 offset ?;";
    return await query(sql , [lId,offsetNum]);
}

//根据标签id查询文章列表数量
module.exports.getArticlesCountByLabel = async (lId) => {
    const sql = "select COUNT(*) total from articles where lId=?;";
    return await query(sql,lId);
}