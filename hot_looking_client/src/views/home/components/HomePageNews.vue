<template>
  <div class="newsBanner">
    <div class="container">
      <div class="section">
        <!--        标题-->
        <h2 class="title">
          <RouterLink to="/top"
            >最新
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
        <div class="list_row">
          <el-row :gutter="24">
            <el-col :span="6" v-for="item in UpAV" :key="item.vId">
              <div class="news news_info">
                <div class="news_info_img">
                  <img :src="item.img" alt="" />
                  <RouterLink
                    class="news_info_img_video_cover"
                    :to="`/videos/detail/${item.vId}`"
                    v-if="item.category === 'video'"
                  >
                    <span class="original_imgArea_info">
                      <svg
                        aria-hidden="true"
                        focusable="false"
                        data-prefix="gfas"
                        data-icon="film"
                        class="svg-inline--fa mr-2"
                        role="img"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 13 9"
                      >
                        <path
                          fill="currentColor"
                          d="M1.5,0.1875 L10.75,0.1875 C11.5784271,0.1875 12.25,0.859072875 12.25,1.6875 L12.25,7.4375 C12.25,8.26592712 11.5784271,8.9375 10.75,8.9375 L1.5,8.9375 C0.671572875,8.9375 1.01453063e-16,8.26592712 0,7.4375 L0,1.6875 C-1.01453063e-16,0.859072875 0.671572875,0.1875 1.5,0.1875 Z M5.07652687,2.61388888 C4.81088494,2.46419381 4.59375,2.5866716 4.59375,2.88606174 L4.59375,6.06393826 C4.59375,6.3633284 4.81088494,6.48580619 5.07652687,6.33611112 L7.89451855,4.74734512 C8.16016048,4.59747779 8.16016048,4.35252221 7.89451855,4.20282714 L5.07652687,2.61388888 Z"
                        ></path>
                      </svg>
                    </span>
                  </RouterLink>

                  <RouterLink
                    class="news_info_img_article_cover"
                    :to="`/articles/detail/${item.vId}`"
                    v-if="item.category === 'article'"
                  >
                    <p>{{ item.summary }}</p>
                  </RouterLink>
                </div>
                <div class="news_info_card">
                  <div class="news_info_category">
                    <RouterLink :to="`/category/${item.lId}`">
                      {{ item.lName }}
                    </RouterLink>
                  </div>
                  <div class="news_info_content">
                    <RouterLink
                      :to="
                        item.category === 'video'
                          ? `/videos/detail/${item.vId}`
                          : `/articles/detail/${item.vId}`
                      "
                    >
                      <h3>{{ item.title }}</h3>
                    </RouterLink>
                  </div>
                  <div class="news_info_btm">
                    <RouterLink
                      :to="`/users/${item.uId}`"
                      class="news_info_btm_user"
                    >
                      <img :src="item.avatar" alt="" />
                      <div class="avatar_text">
                        <h3>{{ item.name }}</h3>
                        <div>{{ item.releaseTime }}</div>
                      </div>
                    </RouterLink>
                    <div class="news_info_btm_comment">
                      <svg
                        t="1645747616378"
                        class="home_news_icon"
                        viewBox="0 0 1024 1024"
                        version="1.1"
                        xmlns="http://www.w3.org/2000/svg"
                        p-id="3359"
                      >
                        <path
                          d="M857.28 344.992h-264.832c12.576-44.256 18.944-83.584 18.944-118.208 0-78.56-71.808-153.792-140.544-143.808-60.608 8.8-89.536 59.904-89.536 125.536v59.296c0 76.064-58.208 140.928-132.224 148.064l-117.728-0.192A67.36 67.36 0 0 0 64 483.04V872c0 37.216 30.144 67.36 67.36 67.36h652.192a102.72 102.72 0 0 0 100.928-83.584l73.728-388.96a102.72 102.72 0 0 0-100.928-121.824zM128 872V483.04c0-1.856 1.504-3.36 3.36-3.36H208v395.68H131.36A3.36 3.36 0 0 1 128 872z m767.328-417.088l-73.728 388.96a38.72 38.72 0 0 1-38.048 31.488H272V476.864a213.312 213.312 0 0 0 173.312-209.088V208.512c0-37.568 12.064-58.912 34.72-62.176 27.04-3.936 67.36 38.336 67.36 80.48 0 37.312-9.504 84-28.864 139.712a32 32 0 0 0 30.24 42.496h308.512a38.72 38.72 0 0 1 38.048 45.888z"
                          p-id="3360"
                        ></path>
                      </svg>
                      <span class="mr_3"> {{ item.likes }} </span>
                      <svg
                        t="1645695264067"
                        class="home_news_icon"
                        viewBox="0 0 1024 1024"
                        version="1.1"
                        xmlns="http://www.w3.org/2000/svg"
                        p-id="2093"
                      >
                        <path
                          d="M878.3 98.2H145.7c-44.7 0-81 36.3-81 81V714c0 44.7 36.3 81 81 81h192.8l149.2 121.8c7.4 6 16.3 9 25.3 9 8.9 0 17.9-3 25.2-9l150-121.8h190c44.7 0 81-36.3 81-81V179.2c0.1-44.7-36.3-81-80.9-81z m1 615.8c0 0.5-0.5 1-1 1H674.1c-9.2 0-18.1 3.2-25.2 9L513.1 834.2 378.1 724c-7.1-5.8-16.1-9-25.3-9H145.7c-0.5 0-1-0.5-1-1V179.2c0-0.5 0.5-1 1-1h732.5c0.5 0 1 0.5 1 1V714z"
                          p-id="2094"
                        ></path>
                        <path
                          d="M322.1 447.6m-50 0a50 50 0 1 0 100 0 50 50 0 1 0-100 0Z"
                          p-id="2095"
                        ></path>
                        <path
                          d="M513.1 447.6m-50 0a50 50 0 1 0 100 0 50 50 0 1 0-100 0Z"
                          p-id="2096"
                        ></path>
                        <path
                          d="M704.3 447.6m-50 0a50 50 0 1 0 100 0 50 50 0 1 0-100 0Z"
                          p-id="2097"
                        ></path>
                      </svg>
                      <span> {{ item.cCount }} </span>
                    </div>
                  </div>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
        <RouterLink to="/top" class="load_link">
          <button class="load_more">加载更多</button>
        </RouterLink>
      </div>
    </div>
  </div>
</template>

<script>
import { getUpAV } from "../../../api/home";
import { ref } from "vue";

export default {
  name: "HomeMainNews",
  setup() {
    const { UpAV } = useUpAV();
    return { UpAV };
  },
};

function useUpAV() {
  const UpAV = ref();
  const getData = () => {
    getUpAV().then((data) => {
      UpAV.value = data.result;
    });
  };

  getData();
  return { UpAV };
}
</script>

<style scoped>
.newsBanner {
  background-color: #fcfcfc;
  padding: 1.875rem 0;
  overflow: hidden;
}

.news {
  background-color: #fff;
  border-radius: 10px;
  box-sizing: border-box;
  margin-bottom: 30px;
  overflow: hidden;
}

.list_row {
  padding: 0 15px;
}

.news_info_img {
  position: relative;
  display: block;
  height: 7.625rem;
}
.news_info_img img {
  width: 100%;
  height: 100%;
}

.news_info_img_article_cover {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: flex;
  margin: 0;
  padding: 1.42857em;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.06);
  font-weight: 600;
}

.news_info_img_video_cover {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: flex;
  margin: 0;
  padding: 1.42857em;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.06);
  font-weight: 600;
}

.news_info_img_article_cover p {
  display: none;
  font-size: 0.875rem;
}

.news_info_img_article_cover:hover {
  background: rgba(0, 0, 0, 0.4);
  color: #f7f3f0;
}

.news_info_img_article_cover:hover p {
  display: block;
}

.original_imgArea_info {
  position: absolute;
  left: 8px;
  top: 10px;
  width: 20px;
  font-size: 12px;
  line-height: 1;
  color: #fff;
}

.news_info_card {
  padding: 1.25rem;
}

.news_info_category {
  font-size: 0.75rem;
  line-height: 1.1;
  color: #ff3d1d;
}

.news_info_content {
  margin: 1.06667em 0 0;
  overflow: hidden;
}

.news_info_content h3 {
  font-size: 1rem;
  line-height: 1.4rem;
  max-height: 2.8rem;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  margin: 0;
  font-weight: 600;
  height: 3.57143em;
}

.news_info_content > p {
  margin: 0.85714em 0 0;
  color: #5a5a5a;
  font-size: 0.875rem;
  line-height: 1.5em;
  max-height: 4.5em;
  overflow: hidden;
}

.news_info_btm {
  display: flex;
  margin: 2.875rem 0 0;
  font-size: 0.92857em;
  line-height: 2.30769em;
  white-space: nowrap;
  justify-content: space-between;
}

.news_info_btm_user {
  display: inline-flex;
  font-size: 10px;
  line-height: 16px;
}

.news_info_btm_user > img {
  width: 26px;
  height: 26px;
  margin: 4px 0;
  border-radius: 50%;
}

.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}

.avatar_text {
  margin-left: 1em;
}

.avatar_text > h3 {
  margin: 0;
}

.avatar_text > div {
  color: #8e8e93;
}

.news_info_btm_comment > span {
  vertical-align: -3%;
}

.home_news_icon {
  width: 14px;
  height: 20px;
  margin: 7px;
}
</style>
