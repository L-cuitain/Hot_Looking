//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取文章和视频列表
 * @param current
 * @returns {*|Promise}
 */
export function getAVAll(current) {
  return request("/top/list", "get", { current });
}
