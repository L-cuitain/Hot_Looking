<template>
  <div class="newsBanner">
    <div class="container">
      <div class="section">
        <!--        标题-->
        <h2 class="title">
          <RouterLink to="/news"
            >资讯
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

        <!--        列表-->
        <div class="news_list">
          <el-row :gutter="24">
            <el-col :span="4" v-for="item in news" :key="item.nId">
              <div class="slick_item">
                <a href="#" class="news">
                  <div class="news_imgArea">
                    <img :src="item.img" alt="" />
                    <div class="news_imgArea_cover"></div>
                  </div>
                  <div class="news_content">
                    <h3>{{ item.title }}</h3>
                  </div>
                  <div class="news_meta">
                    <span class="mr_3">11小时前</span>
                    <span
                      >{{ item.likes
                      }}<!-- -->
                      喜欢 •
                      <!-- -->
                      <!-- -->{{ item.cCount
                      }}<!-- -->
                      评论</span
                    >
                  </div>
                </a>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { getUpNews } from "../../../api/home";

export default {
  name: "HomeMainInfo",
  setup() {
    const { news } = useUpNews();
    return { news };
  },
};

function useUpNews() {
  const news = ref();

  const getData = () => {
    getUpNews().then((data) => {
      news.value = data.result;
    });
  };
  getData();
  return { news };
}
</script>

<style scoped>
.newsBanner {
  padding: 1.875rem 0;
  overflow: hidden;
}

.el-col-4 {
  max-width: 19.6666666667%;
  flex: 0 0 19.6666666667%;
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
  padding: 0 15px;
}

.news_imgArea {
  position: relative;
  border-radius: 4px;
  overflow: hidden;
  height: 6.96rem;
}

.news_imgArea > img {
  width: 100%;
  height: 100%;
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
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.news_meta {
  padding-top: 20px;
  line-height: 1;
  font-size: 0.75rem;
  white-space: nowrap;
  color: #8e8e93;
}
</style>
