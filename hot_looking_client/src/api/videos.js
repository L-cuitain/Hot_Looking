//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取视频列表
 * @param current
 * @returns {*|Promise}
 */
export function getVideosAll(current) {
  return request("/videos/list", "get", { current });
}
