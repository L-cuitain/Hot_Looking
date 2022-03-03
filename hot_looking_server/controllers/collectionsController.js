const { getCollectionsAll , getCollectionsTotal} = require("../models/collectionsModel");

//查询所有专题
module.exports.getCollectionList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getCollectionsTotal();
    //请求资讯分页数据
    const data = await getCollectionsAll(offsetNum);
    //封装参数
    const collections = {
        colList: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取专题页成功",
        result: collections
    }
}