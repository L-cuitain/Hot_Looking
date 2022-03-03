const { query } = require('../db/query');

//获取所有标签
module.exports.getLabel = async () => {
    const sql = "select * from label";
    return await query(sql);
}