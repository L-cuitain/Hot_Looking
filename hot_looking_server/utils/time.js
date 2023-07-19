const moment = require("moment");
moment.locale('zh-cn');

//转换相对时间
module.exports.getTimeForNow = (data) => {
    data.forEach((item) => {
        item.releaseTime = moment(item.releaseTime).startOf('day').fromNow()
    })
}

//转换年月日
module.exports.getTimeHMS = (data) => {
    data.forEach((item) => {
        item.commentTime = moment(item.commentTime).format('LL')
    })
}

//获取内容发布的当前时间
module.exports.getRTForNow = () => {
    const releaseTime = moment().format("YYYY-MM-DD HH:mm:ss");
    return releaseTime;
}