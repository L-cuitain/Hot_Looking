const { getVideosAll , getVideosTotal } = require("../models/videosModel");
const {getTimeForNow} = require("../utils/time");

//获取视频列表
module.exports.getVideosList = async (ctx) => {
    const result = ctx.query;
    //请求参数
    const offsetNum = (result.current-1) * 12;
    //请求资讯总数量
    const count = await getVideosTotal();
    //请求资讯分页数据
    const data = await getVideosAll(offsetNum);
    getTimeForNow(data);
    //封装参数
    const videos = {
        videosList: data,
        total: count[0].total,
        pageSize: 12,
        pageNum: result.current
    }

    ctx.body = {
        code: 200,
        message: "获取视频页列表成功",
        result: videos
    }
}