const { getAVALl , getAVTotal } = require("../models/topModel");

//获取最新文章与最新视频列表
module.exports.getAVList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getAVTotal();
    //请求资讯分页数据
    const data = await getAVALl(offsetNum);
    //封装参数
    const top = {
        avList: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取最新列表成功",
        result: top
    }
}