<template>
  <div class="news_nav">
    <el-row :gutter="24">
      <el-col :span="16">
        <!--      轮播图-->
        <Carousel :data="news" />
      </el-col>
      <el-col :span="8">
        <!--      最热资讯-->
        <div class="hotOriginals am_card">
          <h2 class="am_card_header">本周最热</h2>
          <div class="am_card_inner">
            <ul class="sideOriginals">
              <li v-for="item in hotNews" :key="item.hcId">
                <RouterLink
                  :to="`/news/detail/${item.hcId}`"
                  class="sideOriginal-title a_cover"
                >
                  <div class="sideOriginal_content">
                    <h3>{{ item.title }}</h3>
                    <p>
                      <span class="mr_2">{{ item.likes }} 喜欢</span>•<span
                        class="ml_2"
                        >{{ item.cCount }} 评论</span
                      >
                    </p>
                  </div>
                </RouterLink>
              </li>
            </ul>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { getTopNews, getHotNews } from "../../../api/news";
import { ref } from "vue";
import Carousel from "../../../components/Carousel";

export default {
  name: "NewsPageNav",
  components: {
    Carousel,
  },
  setup() {
    const { news } = useCarouselNew();
    const { hotNews } = useCardNew();
    return { news, hotNews };
  },
};

//获取资讯页最新资讯
function useCarouselNew() {
  const news = ref();
  const getData = () => {
    getTopNews().then((data) => {
      news.value = data.result;
    });
  };
  getData();
  return { news };
}

//获取资讯页最热资讯
function useCardNew() {
  const hotNews = ref();
  const getData = () => {
    getHotNews().then((data) => {
      hotNews.value = data.result;
    });
  };
  getData();

  return { hotNews };
}
</script>

<style scoped>
.hotOriginals {
  margin: 0;
  display: flex;
  flex-direction: column;
}

.am_card {
  width: 100%;
  margin-bottom: 30px;
  overflow: hidden;
  background: #fff;
  border-radius: 4px;
}

.am_card_header {
  padding: 0 1.25rem;
  border-bottom: 1px solid #e6e6e6;
  line-height: 3.625rem;
  font-size: 1.125rem;
  font-weight: 700;
  margin-bottom: 0;
}

.am_card_inner {
  height: 361px;
  flex: 1 1 auto;
  overflow-y: auto;
  padding: 1.25rem;
  box-sizing: border-box;
}

.sideOriginals {
  padding-left: 0;
  list-style: none;
}
.sideOriginals li {
  display: list-item;
  text-align: -webkit-match-parent;
}

.sideOriginal-title {
  display: flex;
  margin-bottom: 16px;
  padding-bottom: 16px;
  border-bottom: 1px solid #f0f0f0;
}

.sideOriginal_content {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.sideOriginal_content > h3 {
  font-size: 0.875rem;
  margin-bottom: 0.5rem;
  font-weight: 600;
  line-height: 1.3;
}

.sideOriginal_content > p {
  margin: 0;
  font-size: 0.75rem;
  color: #8e8e93;
}
</style>
