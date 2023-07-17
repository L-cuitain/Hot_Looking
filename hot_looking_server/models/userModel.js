const {query} = require("../db/query");

//根据账号/密码登录
module.exports.logByAcPw = async (name,password) => {
    const sql = "select * from users where account=? and password=?;";
    return await query(sql,[name,password]);
}

//根据用户名或账号查询用户
module.exports.getUserByNC = async (name,account) => {
    const sql = "select * from users where name=? or account=?;";
    return await query(sql,[name,account]);
}

//根据用户名/账号/密码注册
module.exports.resByNaAcPw = async (name,account,password,category) => {
    const sql = "insert into users(name, account, password,category) VALUES (?,?,?,?);";
    return await query(sql,[name,account,password,category]);
}

//查询用户是否订阅专题
module.exports.isSubCol = async (uId,colId) => {
    const sql = "select subInfo from users_sub where uId=? and colId=?;";
    return await query(sql,[uId,colId]);
}

//添加用户订阅
module.exports.addUserCol = async (uId,colId) => {
    const sql = "insert into users_sub(uId, colId) VALUES (?,?);";
    return await query(sql,[uId,colId]);
}

//添加订阅人数
module.exports.addColNum = async (colId) => {
    const sql = "update collections set colNum=colNum+1 where colId = ?;";
    return await query(sql,colId);
}

//确认订阅人数
module.exports.confirmUserCol = async (colId) => {
    const sql = "update users_sub set subInfo='已订阅' where uId=1 and colId=?;";
    return await query(sql,colId);
}

//减少订阅人数
module.exports.reduceColNum = async (colId) => {
    const sql = "update collections set colNum=colNum-1 where colId = ?;";
    return await query(sql,colId);
}

//取消用户订阅
module.exports.cancelUserCol = async (uId,colId) => {
    const sql = "update users_sub set subInfo='未订阅' where uId=? and colId=?;";
    return await query(sql,[uId,colId]);
}

//用户资讯点赞
module.exports.getNewsLikes = async (num,nId) => {
    const sql = "update hot_con set likes=likes+? where category = 'news' and hcId=?;";
    return await query(sql,[num,nId]);
}

//用户文章点赞
module.exports.getArticlesLikes = async (num,aId) => {
    const sql = "update hot_con set likes=likes+? where category = 'articles' and hcId=?;";
    return await query(sql,[num,aId]);
}

//用户视频点赞
module.exports.getVideosLikes = async (num,vId) => {
    const sql = "update hot_con set likes=likes+? where category = 'videos' and hcId=?;";
    return await query(sql,[num,vId]);
}

//用户资讯评论
module.exports.addNewsComment = async (nId,uId,content,commentTime) => {
    const sql = "insert into hc_comment(hcId, uId, content, commentTime) VALUES (?,?,?,?);";
    return await query(sql,[nId,uId,content,commentTime]);
}

//用户文章评论
module.exports.addArticlesComment = async (aId,uId,content,commentTime) => {
    const sql = "insert into hc_comment(hcId, uId, content, commentTime) VALUES (?,?,?,?);";
    return await query(sql,[aId,uId,content,commentTime]);
}

//用户视频评论
module.exports.addVideosComment = async (vId,uId,content,commentTime) => {
    const sql = "insert into hc_comment(hcId, uId, content, commentTime) VALUES (?,?,?,?);";
    return await query(sql,[vId,uId,content,commentTime]);
}

//查询用户详情
module.exports.findUserDetail = async (uId) => {
    const sql = "select name,avatar from users where uId=?;";
    return await query(sql,uId);
}

//查询用户主页投稿的文章
module.exports.findUserCon = async (uId,offsetNum) => {
    const sql = "select\n" +
        "     hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment vc on hc.hcId = vc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where u.uId = ?\n" +
        "group by hc.hcId , hc.releaseTime\n" +
        "order by releaseTime desc\n" +
        "limit 9 offset ?;";
    return await query(sql , [uId,offsetNum]);
}

//查询用户主页投稿文章的数量
module.exports.findUserConTotal = async (uId) => {
    const sql = "select COUNT(hc.hcId) total from hot_con hc where uId = ?;";
    return await query(sql,[uId]);
}

//查询用户主页订阅列表
module.exports.findUserCol = async (uId,offsetNum) => {
    const sql = "select col.colId , col.colTitle from users u , users_sub us , collections col where u.uId = us.uId and us.colId = col.colId and u.uId=? and us.subInfo='已订阅' limit 6 offset ?;\n";
    return await query(sql,[uId,offsetNum]);
}

//查询用户主页订阅列表数量
module.exports.findUserColTotal = async (uId) => {
    const sql = "select COUNT(*) total from users_sub where uId=? and subInfo='已订阅';";
    return await query(sql,uId);
}