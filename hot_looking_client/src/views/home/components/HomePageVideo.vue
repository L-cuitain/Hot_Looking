<template>
  <div class="newsBanner" v-if="playList">
    <div class="container">
      <div class="section">
        <!--        标题-->
        <h2 class="title">
          <RouterLink to="/videos"
            >视频
            <span class="pm_3">
              <svg
                t="1645494758486"
                class="title_icon"
                viewBox="0 0 1024 1024"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
                p-id="3356"
              >
                <path
                  d="M409.307429 167.789714l304.274285 302.08a61.878857 61.878857 0 0 1 18.285715 45.494857 61.878857 61.878857 0 0 1-18.285715 45.494858l-304.274285 302.08c-24.283429 24.137143-64.073143 24.283429-88.502858 0.146285l0.438858 0.438857-2.925715-3.072a61.659429 61.659429 0 0 1 0.146286-80.310857l3.510857-3.803428 262.729143-260.827429L321.974857 254.537143a61.908114 61.908114 0 0 1-3.657143-84.114286l2.925715-3.218286 3.510857-3.218285c24.576-20.48 61.586286-19.017143 84.553143 3.803428z"
                  p-id="3357"
                ></path>
              </svg> </span
          ></RouterLink>
        </h2>

        <div class="video_showcase">
          <!--        视频展示-->
          <div class="video_player_container">
            <div class="video_player_embed">
              <iframe
                :src="topVideo"
                allowfullscreen="true"
                width="100%"
                height="100%"
                ref="playVideo"
              ></iframe>
            </div>
          </div>
          <!--        视频列表-->
          <el-row :gutter="24">
            <el-col :span="6" v-for="item in playList" :key="item.hcId">
              <div class="video_showcase_list" @click="showPlay(item.url)">
                <div class="lick-current" style="outline: none">
                  <div
                    class="slick-item"
                    tabindex="-1"
                    style="width: 100%; display: inline-block"
                  >
                    <a href="#">
                      <img
                        :src="item.img"
                        alt=""
                        style="width: 100%; height: 7.86rem"
                      />
                      <div class="video_img_content originalVideo_img">
                        <img
                          class="originalVideo_img_play"
                          src="https://static.gcores.com/assets/329f5b87faae769cf9be29484d015dcd.png"
                          alt="play"
                        />
                      </div>
                    </a>
                  </div>

                  <div class="video_text">
                    <p>{{ item.lName }}</p>
                    <h2>{{ item.title }}</h2>
                  </div>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>

        <RouterLink to="/videos" class="load_link">
          <button class="load_more">加载更多</button>
        </RouterLink>
      </div>
    </div>
  </div>
</template>

<script>
import { getPlayVideo } from "../../../api/home";

import { ref } from "vue";

export default {
  name: "HomeMainVideo",
  setup() {
    const { playList, topVideo } = usePlayVideo();
    //获取dom节点
    const playVideo = ref(null);
    //获取视频地址
    const showPlay = (url) => {
      playVideo.value.src = url;
    };
    return { playList, showPlay, playVideo, topVideo };
  },
};

function usePlayVideo() {
  const playList = ref();
  const topVideo = ref();
  const getData = () => {
    getPlayVideo().then((data) => {
      playList.value = data.result;
      topVideo.value = data.result[0].url;
    });
  };
  getData();
  return { playList, topVideo };
}
</script>

<style scoped>
.newsBanner {
  padding: 1.875rem 0;
  overflow: hidden;
}

.video_player_container {
  position: relative;
  padding-bottom: 56.25%;
  margin: 0 15px;
  color: #fff;
  background: rgba(0, 0, 0, 0.2);
}

.video_player_embed {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.video_showcase_list {
  float: left;
  height: 11.25rem;
  margin-top: 1.875rem;
  padding: 0 15px;
}

.video_showcase {
  width: 100%;
  margin-bottom: 5rem;
}

.slick-item {
  position: relative;
  display: block;
  height: 7.62rem;
  border-radius: 4px;
  overflow: hidden;
}

.slick-item > a {
  display: block;
  width: 100%;
  height: 100%;
}

.video_img_content {
  display: flex;
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.06);
  color: #fff;
  border-radius: 4px;
  opacity: 0.8;
}

.slick-item > a:hover .video_img_content {
  opacity: 1;
}

.video_img_content:hover {
  opacity: 1;
}

.originalVideo_img {
  position: absolute;
  top: 25%;
  left: 38%;
  display: block;
  width: 3.75rem;
  height: 3.75rem;
  object-fit: cover;
}

.originalVideo_img_play {
  width: 100%;
  height: 100%;
}

.video_text p {
  color: #ff3d1d;
  margin: 10px 0 0;
  font-size: 0.875rem;
}

.video_text h2 {
  color: #323232;
  line-height: 1.3em;
  max-height: 2.6em;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
  margin: 10px 0 0;
  font-size: 0.875rem;
}

.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}
</style>
