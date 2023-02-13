<template>
  <div class="nav">
    <div class="container">
      <el-row :gutter="24">
        <el-col :span="16">
          <!--      轮播图-->
          <Carousel class="p_2" :data="hotVideo" />
        </el-col>
        <el-col :span="8">
          <!--        推荐专题  -->
          <div class="commend commend_topics">
            <RouterLink
              :to="`/collections/detail/${item.colId}`"
              v-for="item in hotCollection"
              :key="item.colId"
            >
              <div class="collectionEntry_inner">
                <div class="collectionEntry_label">推荐专题</div>
              </div>
              <img
                class="commend_topics_img"
                :src="item.colImg"
                alt=""
                style="width: 100%; height: 100%; object-fit: cover"
            /></RouterLink>
          </div>
        </el-col>
      </el-row>
      <!--        推荐文章/视频/资讯-->
      <el-row :gutter="24">
        <el-col :span="8" v-for="item in hotNews" :key="item.nId">
          <div class="commend commend_info">
            <div class="commend_info_img">
              <RouterLink
                :to="`/news/detail/${item.nId}`"
                class="a_cover"
                v-if="item.category === 'new'"
              >
                <img
                  :src="item.img"
                  alt=""
                  style="width: 100%; height: 100%; object-fit: cover"
                />
              </RouterLink>
              <RouterLink
                :to="`/articles/detail/${item.nId}`"
                class="a_cover"
                v-if="item.category === 'article'"
              >
                <img
                  :src="item.img"
                  alt=""
                  style="width: 100%; height: 100%; object-fit: cover"
                />
              </RouterLink>
              <RouterLink
                :to="`/videos/detail/${item.nId}`"
                class="a_cover"
                v-if="item.category === 'video'"
              >
                <img
                  :src="item.img"
                  alt=""
                  style="width: 100%; height: 100%; object-fit: cover"
                />
              </RouterLink>
            </div>
            <div class="commend_info_card">
              <div class="commend_info_category">
                <RouterLink :to="`/category/${item.lId}`">{{
                  item.lName
                }}</RouterLink>
              </div>
              <div class="commend_info_content">
                <RouterLink
                  :to="`/news/detail/${item.nId}`"
                  class="a_cover"
                  v-if="item.category === 'new'"
                >
                  <h3>{{ item.title }}</h3>
                  <p>{{ item.summary }}</p>
                </RouterLink>
                <RouterLink
                  :to="`/articles/detail/${item.nId}`"
                  class="a_cover"
                  v-if="item.category === 'article'"
                >
                  <h3>{{ item.title }}</h3>
                  <p>{{ item.summary }}</p>
                </RouterLink>
                <RouterLink
                  :to="`/videos/detail/${item.nId}`"
                  class="a_cover"
                  v-if="item.category === 'video'"
                >
                  <h3>{{ item.title }}</h3>
                  <p>{{ item.summary }}</p>
                </RouterLink>
              </div>
              <div class="commend_info_btm">
                <RouterLink
                  :to="`/users/${item.uId}`"
                  class="commend_info_btm_user"
                >
                  <img :src="item.avatar" alt="" />
                  <div class="avatar_text">
                    <h3>{{ item.name }}</h3>
                    <div>{{ item.releaseTime }}</div>
                  </div>
                </RouterLink>
                <div class="commend_info_btm_comment">
                  <svg
                    t="1645747616378"
                    class="home_nav_icon"
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
                    class="home_nav_icon"
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
  </div>
</template>

<script>
import { ref } from "vue";
import { getHotNews, getHotVideo, getHotCollection } from "@/api/label";
import Carousel from "@/components/Carousel";

export default {
  name: "CategoryPageNav",
  components: {
    Carousel,
  },
  props: ["lId"],
  setup(props) {
    const { hotVideo } = useHotVideo(props.lId);
    const { hotCollection } = useHotCollection(props.lId);
    const { hotNews } = useHotNews(props.lId);

    return { hotVideo, hotCollection, hotNews };
  },
};
//获取最热视频
function useHotVideo(lId) {
  const hotVideo = ref();
  const getData = () => {
    getHotVideo(lId).then((data) => {
      hotVideo.value = data.result;
    });
  };

  getData();

  return { hotVideo };
}

//获取推荐专题
function useHotCollection(lId) {
  const hotCollection = ref();
  const getData = () => {
    getHotCollection(lId).then((data) => {
      hotCollection.value = data.result;
    });
  };

  getData();

  return { hotCollection };
}

//获取最热资讯
function useHotNews(lId) {
  const hotNews = ref();
  const getData = () => {
    getHotNews(lId).then((data) => {
      hotNews.value = data.result;
    });
  };
  getData();
  return { hotNews };
}
</script>

<style scoped>
.nav {
  background-color: #f7f7f8;
  padding: 20px 0 10px 0;
}

.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}

.commend {
  background-color: #fff;
  border-radius: 10px;
  margin-left: 15px;
  margin-right: 15px;
  box-sizing: border-box;
  margin-bottom: 30px;
  overflow: hidden;
}

.commend_topics {
  position: relative;
  height: 420px;
}

.commend_topics a {
  display: block;
  width: 100%;
  height: 100%;
}

.commend_topics_img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.commend_info_img {
  position: relative;
  display: block;
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: cover;
  height: 12rem;
  background-color: #fff;
}

.commend_info_card {
  padding: 1.25rem;
}

.commend_info_category {
  font-size: 0.75rem;
  line-height: 1.1;
  color: #ff3d1d;
}

.commend_info_content {
  margin: 1.06667em 0 0;
  overflow: hidden;
}

.commend_info_content h3 {
  font-size: 1.125rem;
  line-height: 1.4rem;
  max-height: 2.8rem;
  height: 2.8rem;
  overflow: hidden;
  text-overflow: ellipsis;
  margin: 0;
}

.commend_info_content p {
  margin: 0.85714rem 0 0;
  color: #5a5a5a;
  height: 4.5rem;
  text-overflow: ellipsis;
  font-size: 0.675rem;
  line-height: 1.5em;
  max-height: 4.5em;
  overflow: hidden;
}

.commend_info_btm {
  display: flex;
  margin: 1.675rem 0 0;
  font-size: 0.92857em;
  line-height: 2.30769em;
  white-space: nowrap;
  justify-content: space-between;
}

.commend_info_btm_user {
  display: inline-flex;
  font-size: 10px;
  line-height: 16px;
}

.commend_info_btm_user > img {
  width: 26px;
  height: 26px;
  margin: 3px 0;
  border-radius: 50%;
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

.commend_info_btm_comment > span {
  vertical-align: -3%;
}

.collectionEntry_inner {
  position: absolute;
  flex-direction: column;
  justify-content: space-between;
  width: 100%;
  height: 100%;
  padding: 10px;
  background: transparent;
  display: block;
}

.collectionEntry_inner:hover {
  cursor: pointer;
  background: rgba(0, 0, 0, 0.1);
}

.collectionEntry_label {
  display: inline-block;
  padding: 5px 13px;
  border-radius: 9999px;
  background: rgba(0, 0, 0, 0.5);
  color: #fff;
  font-size: 12px;
}

.home_nav_icon {
  width: 14px;
  height: 20px;
  margin: 9px;
  vertical-align: -41%;
}
</style>
