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

//查询所有管理员的uId
module.exports.getAllAdmin = async () => {
    const sql = "select uId from users where category='管理员';";
    return await query(sql);
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

//内容点赞数增加
module.exports.getConAddLikes = async (hcId) => {
    const sql = "update hot_con set likes=likes+1 where hcId=?;";
    return await query(sql,[hcId]);
}

//内容点赞数减少
module.exports.getConReduceLikes = async (hcId) => {
    const sql = "update hot_con set likes=likes-1 where hcId=?;";
    return await query(sql,[hcId]);
}

//查询用户是否点赞
module.exports.getUserLike = async (hcId,uId) => {
    const sql = "select `like` from users_like ul where hcId=? and uId=?;";
    return await query(sql,[hcId,uId]);
}

//用户添加点赞信息
module.exports.addUserLike = async (hcId,uId,like) => {
    const sql = "insert into users_like (hcId, uId, `like`) VALUES (?, ?, ?);";
    return await query(sql,[hcId,uId,like]);
}

//用户进行点赞
module.exports.setUserLike = async (hcId,uId) => {
    const sql = "update users_like set `like`=1 where hcId=? and uId=?;";
    return await query(sql,[hcId,uId]);
}

//用户取消点赞
module.exports.setUserDislike = async (hcId,uId) => {
    const sql = "update users_like set `like`=0 where hcId=? and uId=?;";
    return await query(sql,[hcId,uId]);
}


//用户资讯评论
module.exports.addConComment = async (hcId,uId,content,commentTime) => {
    const sql = "insert into hc_comment(hcId, uId, content, commentTime) VALUES (?,?,?,?);";
    return await query(sql,[hcId,uId,content,commentTime]);
}

//查询用户详情
module.exports.findUserDetail = async (uId) => {
    const sql = "select name,avatar,category from users where uId=?;";
    return await query(sql,uId);
}

//查询用户主页投稿的文章
module.exports.findUserCon = async (uId,offsetNum) => {
    const sql = "select\n" +
        "     hc.hcId , hc.category ,l.lName,hc.img,hc.title,hc.summary,hc.releaseTime,hc.likes,hc.review,c.colTitle,c.colSummary,c.colNum,COUNT(vc.content) 'cCount',u.name,u.avatar\n" +
        "from\n" +
        "    hot_con hc Left JOIN hc_comment vc on hc.hcId = vc.hcId\n" +
        "            Left JOIN users u on hc.uId = u.uId\n" +
        "            Left JOIN label l  on hc.lId = l.lId\n" +
        "            Left JOIN collections c on hc.colId = c.colId\n" +
        "where u.uId = ? and hc.review = 1\n" +
        "group by hc.hcId , hc.releaseTime\n" +
        "order by releaseTime desc\n" +
        "limit 9 offset ?;";
    return await query(sql , [uId,offsetNum]);
}

//查询用户主页投稿文章的数量
module.exports.findUserConTotal = async (uId) => {
    const sql = "select COUNT(hc.hcId) total from hot_con hc where review = 1 and uId = ?;";
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

//用户投稿
module.exports.addHotCon = async (form) => {
    const { hcId , img , title , summary , content , contentImg , url , releaseTime , category , uId , label } = form;
    const sql = "insert into hot_con(hcId,img,title,summary,content,contentImg,url,releaseTime,category,uId,lId) VALUES (?,?,?,?,?,?,?,?,?,?,?);"
    return await query(sql,[hcId , img , title , summary , content , contentImg , url , releaseTime , category , uId , label]);
}

//审核员与文章id进行关联
module.exports.addAdminAndHc = async (hcId,uId) => {
    const sql = "insert into admin_review(hcId, uId) values (?,?);";
    return await query(sql,[hcId,uId]);
}

//查询管理员需审核的文章id
module.exports.getAdminHcId = async (uId,offsetNum) => {
    const sql = "select adr.hcId , hc.title,hc.category from hot_con hc , admin_review adr where adr.uId = ? and adr.hcId = hc.hcId limit 6 offset ?;";
    return await query(sql,[uId,offsetNum]);
}

//查询管理员审核文章数量
module.exports.getAdminHcIdTotal = async(uId) => {
    const sql = "select Count(*) total from admin_review where uId = ?;";
    return await query(sql,[uId]);
}

//查询用户待审核待文章id
module.exports.getUserHcIdByReview = async (uId,offsetNum) => {
    const sql = "select hc.hcId, hc.title , hc.category from hot_con hc , users u where u.uId = ? and hc.review = 0 and hc.uId = u.uId limit 6 offset ?;";
    return await query(sql,[uId,offsetNum]);
}

//查询用户待审核文章数量
module.exports.getUserTotalByReview = async(uId) => {
    const sql = "select Count(*) total from hot_con hc , users u where u.uId = ? and hc.review = 0 and hc.uId = u.uId;";
    return await query(sql,[uId]);
}