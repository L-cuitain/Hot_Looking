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
