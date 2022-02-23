<template>
  <div class="newsBanner">
    <div class="container">
      <div class="section">
        <!--        标题-->
        <h2 class="title">
          <a href="#"
            >资讯
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

        <!--        列表-->
        <div class="news_list">
          <div class="slick_item">
            <a href="#" class="news">
              <div class="news_imgArea">
                <div class="news_imgArea_cover"></div>
              </div>
              <div class="news_content">
                <h3>这是标题</h3>
              </div>
              <div class="news_meta">
                <span class="mr_3">11小时前</span>
                <span
                  >15<!-- -->
                  喜欢 •
                  <!-- -->
                  <!-- -->8<!-- -->
                  评论</span
                >
              </div>
            </a>
          </div>
          <div class="slick_item">
            <a href="#" class="news">
              <div class="news_imgArea">
                <div class="news_imgArea_cover"></div>
              </div>
              <div class="news_content">
                <h3>这是标题</h3>
              </div>
              <div class="news_meta">
                <span class="mr_3">11小时前</span>
                <span
                  >15<!-- -->
                  喜欢 •
                  <!-- -->
                  <!-- -->8<!-- -->
                  评论</span
                >
              </div>
            </a>
          </div>
          <div class="slick_item">
            <a href="#" class="news">
              <div class="news_imgArea">
                <div class="news_imgArea_cover"></div>
              </div>
              <div class="news_content">
                <h3>这是标题</h3>
              </div>
              <div class="news_meta">
                <span class="mr_3">11小时前</span>
                <span
                  >15<!-- -->
                  喜欢 •
                  <!-- -->
                  <!-- -->8<!-- -->
                  评论</span
                >
              </div>
            </a>
          </div>
          <div class="slick_item">
            <a href="#" class="news">
              <div class="news_imgArea">
                <div class="news_imgArea_cover"></div>
              </div>
              <div class="news_content">
                <h3>这是标题</h3>
              </div>
              <div class="news_meta">
                <span class="mr_3">11小时前</span>
                <span
                  >15<!-- -->
                  喜欢 •
                  <!-- -->
                  <!-- -->8<!-- -->
                  评论</span
                >
              </div>
            </a>
          </div>
          <div class="slick_item">
            <a href="#" class="news">
              <div class="news_imgArea">
                <div class="news_imgArea_cover"></div>
              </div>
              <div class="news_content">
                <h3>这是标题</h3>
              </div>
              <div class="news_meta">
                <span class="mr_3">11小时前</span>
                <span
                  >15<!-- -->
                  喜欢 •
                  <!-- -->
                  <!-- -->8<!-- -->
                  评论</span
                >
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeMainInfo",
};
</script>

<style scoped>
.newsBanner {
  padding: 1.875rem 0;
  overflow: hidden;
}

.slick_item {
  float: left;
  width: 228px;
  padding-left: 15px;
  padding-right: 15px;
}

.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}

.news {
  display: block;
}

.news_list {
  overflow: hidden;
  margin: 0;
  padding: 0;
}

.news_imgArea {
  position: relative;
  padding-bottom: 53.92157%;
  border-radius: 4px;
  overflow: hidden;
  background-color: #5a5a5a;
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: cover;
  background-image: url(https://image.gcores.com/b18a2bf8-0d61-46b4-9867-9d7c3c202baa.jpg?x-oss-process=image/resize,limit_1,m_fill,w_408,h_220/quality,q_90);
}

.news_imgArea_cover {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.1);
}

.news_imgArea_cover:hover {
  background: rgba(0, 0, 0, 0);
}

.news_content h3 {
  margin: 14px 0 0;
  padding: 0;
  color: #323232;
  font-size: 13px;
  line-height: 1.4em;
  height: 2.8em;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}

.news_meta {
  line-height: 1;
  font-size: 0.75rem;
  white-space: nowrap;
  color: #8e8e93;
}
</style>
