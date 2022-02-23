<template>
  <div class="newsBanner">
    <div class="container">
      <div class="section">
        <!--        标题-->
        <h2 class="title">
          <a href="#"
            >视频
            <span class="pm_3">
              <svg
                t="1645494758486"
                class="icon"
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
          ></a>
        </h2>

        <div class="video_showcase">
          <!--        视频展示-->
          <div class="video_player_container">
            <div class="video_player_embed">
              <iframe
                src=""
                allowfullscreen="true"
                width="100%"
                height="100%"
              ></iframe>
            </div>
          </div>
          <!--        视频列表-->
          <div class="video_showcase_list">
            <div
              class="slick-slide lick-current"
              style="outline: none; width: 260px"
            >
              <div
                class="slick-item"
                tabindex="-1"
                style="width: 100%; display: inline-block"
              >
                <div class="video_img_content">
                  <a href="#" class="originalVideo_img">
                    <img
                      class="originalVideo_img_play"
                      src="https://static.gcores.com/assets/329f5b87faae769cf9be29484d015dcd.png"
                      alt="play"
                    />
                  </a>
                </div>
              </div>
              <div class="video_text">
                <p>组织</p>
                <h2>标题</h2>
              </div>
            </div>
          </div>
          <div class="video_showcase_list">
            <div
              class="slick-slide lick-current"
              style="outline: none; width: 260px"
            >
              <div
                class="slick-item"
                tabindex="-1"
                style="width: 100%; display: inline-block"
              >
                <div class="video_img_content">
                  <a href="#" class="originalVideo_img">
                    <img
                      class="originalVideo_img_play"
                      src="https://static.gcores.com/assets/329f5b87faae769cf9be29484d015dcd.png"
                      alt="play"
                    />
                  </a>
                </div>
              </div>
              <div class="video_text">
                <p>组织</p>
                <h2>标题</h2>
              </div>
            </div>
          </div>
          <div class="video_showcase_list">
            <div
              class="slick-slide lick-current"
              style="outline: none; width: 260px"
            >
              <div
                class="slick-item"
                tabindex="-1"
                style="width: 100%; display: inline-block"
              >
                <div class="video_img_content">
                  <a href="#" class="originalVideo_img">
                    <img
                      class="originalVideo_img_play"
                      src="https://static.gcores.com/assets/329f5b87faae769cf9be29484d015dcd.png"
                      alt="play"
                    />
                  </a>
                </div>
              </div>
              <div class="video_text">
                <p>组织</p>
                <h2>标题</h2>
              </div>
            </div>
          </div>
          <div class="video_showcase_list">
            <div
              class="slick-slide lick-current"
              style="outline: none; width: 260px"
            >
              <div
                class="slick-item"
                tabindex="-1"
                style="width: 100%; display: inline-block"
              >
                <div class="video_img_content">
                  <a href="#" class="originalVideo_img">
                    <img
                      class="originalVideo_img_play"
                      src="https://static.gcores.com/assets/329f5b87faae769cf9be29484d015dcd.png"
                      alt="play"
                    />
                  </a>
                </div>
              </div>
              <div class="video_text">
                <p>组织</p>
                <h2>标题</h2>
              </div>
            </div>
          </div>
        </div>

        <button class="load_more">加载更多</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeMainVideo",
};
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
  height: 180px;
  margin-top: 1.875rem;
}

.video_showcase {
  width: 100%;
  height: 53.5rem;
}

.slick-item {
  position: relative;
  display: block;
  height: 0;
  padding-bottom: 46.56489%;
  border-radius: 4px;
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
}

.originalVideo_img {
  position: relative;
  display: block;
  height: 0;
  padding-bottom: 20.56489%;
}

.originalVideo_img_play {
  width: 3.75rem;
  height: 3.75rem;
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
