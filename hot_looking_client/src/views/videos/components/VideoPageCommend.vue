<template>
  <div class="video_commend">
    <div class="container">
      <!--        标题-->
      <h2 class="title">
        <span> 推荐 </span>
      </h2>
      <!--        视频列表-->
      <el-row :gutter="24">
        <el-col :span="6" v-for="item in playList" :key="item.hcId">
          <div class="video_showcase_list">
            <div class="lick-current" style="outline: none; width: 260px">
              <div
                class="slick-item"
                tabindex="-1"
                style="width: 100%; display: inline-block"
              >
                <RouterLink :to="`/videos/detail/${item.hcId}`">
                  <img
                    :src="item.img"
                    alt=""
                    style="width: 100%; height: 7.86rem; object-fit: cover"
                  />
                  <div class="video_img_content originalVideo_img">
                    <img
                      class="originalVideo_img_play"
                      src="https://static.gcores.com/assets/329f5b87faae769cf9be29484d015dcd.png"
                      alt="play"
                    />
                  </div>
                </RouterLink>
              </div>

              <div class="video_text">
                <RouterLink :to="`/category/${item.lId}`">
                  <p>{{ item.lName }}</p>
                </RouterLink>
                <RouterLink :to="`/videos/detail/${item.hcId}`">
                  <h2>{{ item.title }}</h2>
                </RouterLink>
              </div>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import { getPlayVideo } from "../../../api/home";
import { ref } from "vue";

export default {
  name: "VideoPageCommend",
  setup() {
    const { playList } = usePlayVideo();

    return { playList };
  },
};

function usePlayVideo() {
  const playList = ref();
  const getData = () => {
    getPlayVideo().then((data) => {
      playList.value = data.result;
    });
  };
  getData();
  return { playList };
}
</script>

<style scoped>
.video_commend {
  padding: 1.875rem 0;
  overflow: hidden;
  background-color: #f7f7f8;
}

.video_showcase_list {
  height: 11.25rem;
}

.title {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 1.125rem;
  font-weight: 600;
  line-height: 1;
  margin: 0 0 1rem;
  color: #323232;
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
