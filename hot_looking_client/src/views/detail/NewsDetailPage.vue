<template>
  <AppLayout>
    <Suspense>
      <div class="new_page">
        <!--      内容-->
        <div class="list_container container">
          <div class="newsPage_main">
            <div class="newsPage_inner">
              <div class="newsPage_content" v-if="content">
                <div class="mb_5">
                  <img class="newPage_cover" :src="content.contentImg" alt="" />
                </div>
                <div class="originalPage_titleGroup">
                  <h1 class="originalPage_title">
                    {{ content.title }}
                  </h1>
                  <p class="originalPage_desc">{{ content.summary }}</p>
                </div>
                <div class="originalPage_userInfo">
                  <a class="avatar avatar-md" href="#">
                    <img class="avatar_img" :src="content.avatar" alt="" />
                    <div class="avatar_text">
                      <span class="mr_2">{{ content.name }}</span>
                    </div>
                  </a>
                  <span class="mr_2 u_color-gray-info">{{
                    content.commentTime
                  }}</span>
                  <span
                    ><span class="mr_1">发布于</span
                    ><RouterLink
                      class="u_color-category"
                      :to="`/category/${content.lId}`"
                      >{{ content.lName }}</RouterLink
                    ></span
                  >
                </div>
                <div class="newsPage_story">
                  <div class="newsPage_news">
                    <div class="story">
                      <div class="story_block">
                        <span>{{ content.content }}</span>
                      </div>
                    </div>
                    <div class="mt_5 justify-content-between d-flex">
                      <div class="text_nowrap">
                        <a
                          @click="isLikes"
                          class="o_vote o_vote-up mr_3 originalButton"
                          role="button"
                          tabindex="0"
                          target="_blank"
                          ref="likesButton"
                        >
                          <svg
                            aria-hidden="true"
                            focusable="false"
                            data-prefix="gfas"
                            data-icon="thumbs-up"
                            class="svg-inline--fa o_vote_icon o_vote_icon-withNumber"
                            role="img"
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 14 13"
                          >
                            <path
                              fill="currentColor"
                              d="M7.71164516,0.875163593 C8.04335755,0.52512827 8.5809604,0.52512827 8.91839197,0.869230791 C9.12428242,1.08281167 9.21007011,1.38538457 9.15287831,1.68202468 L8.60955629,4.39924803 L11.8408925,4.39924803 C13.070516,4.39924803 13.899797,5.70446449 13.419386,6.87915931 L11.5549336,11.3940217 C11.3719198,11.8271162 10.9601389,12.1118907 10.5026046,12.1118907 L5.35534334,12.1118907 C4.72623363,12.1118907 4.21150751,11.5779386 4.21150751,10.9253303 L4.21150751,4.99846104 C4.21150751,4.68402253 4.33161027,4.38144963 4.5432199,4.16193595 L7.71164516,0.875163593 Z M1.92383584,12.1118907 C1.29472613,12.1118907 0.78,11.5779386 0.78,10.9253303 L0.78,6.17908866 C0.78,5.52648043 1.29472613,4.99252824 1.92383584,4.99252824 C2.55294554,4.99252824 3.06767167,5.52648043 3.06767167,6.17908866 L3.06767167,10.9253303 C3.06767167,11.5779386 2.55294554,12.1118907 1.92383584,12.1118907 Z"
                            ></path>
                          </svg>
                          <span class="o_vote_num">{{ content.likes }}</span>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="newsPage_r" v-if="hotweek">
                <div class="hotOriginals am_card am_card-bg">
                  <h2 class="hotOriginals_header am_card_header">本周最热</h2>
                  <div class="hotOriginals_body am_card_inner">
                    <ul class="sideOriginals">
                      <li v-for="item in hotweek" :key="item.aId">
                        <RouterLink
                          :to="`/articles/detail/${item.aId}`"
                          class="sideOriginal"
                        >
                          <img :src="item.img" alt="" />
                          <div class="sideOriginal_content">
                            <h3>
                              {{ item.title }}
                            </h3>
                            <p>
                              <span class="mr_2">{{ item.likes }} 喜欢</span
                              >•<span class="ml_2">{{ item.cCount }} 评论</span>
                            </p>
                          </div>
                        </RouterLink>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--      评论-->
        <Comments
          :comment="comment"
          @loadMore="handleLoadMore"
          @reloading="isReLoad"
          v-if="comment"
        />
      </div>
    </Suspense>
    <AppFooter />
  </AppLayout>
</template>

<script>
import AppLayout from "@/components/App/AppLayout";
import AppFooter from "@/components/App/AppFooter";
import Comments from "@/components/Comments";
import { ref, reactive } from "vue";
import { useRoute } from "vue-router";
import { ElMessage } from "element-plus";
import { getNewsContent, getHotArticles, getComment } from "@/api/detail";

export default {
  name: "NewsDetail",
  components: { AppFooter, AppLayout, Comments },
  setup() {
    //获取路由id
    const route = useRoute();
    const nId = route.params.id;
    //判断登录状态
    let timer;
    const isLogin = ref(true);
    const likesButton = ref();
    let isTrue = true;
    const page = ref(1);
    const comment = reactive({
      list: [],
      total: 0,
    });

    //获取资讯内容
    const { content } = useNewsContent(nId);
    const { hotweek } = useHotWeek();
    const { getData } = useComment(comment);
    getData(nId, page.value);

    //判断是否登录
    const isLikes = () => {
      //判断登录状态
      if (isLogin.value) {
        //防抖
        if (timer) {
          clearTimeout(timer);
        }
        //如果未登录 则弹框提醒未登录
        timer = setTimeout(() => {
          ElMessage({
            showClose: true,
            message: "您需要登录才能点赞",
            type: "error",
          });
        }, 600);
      } else {
        if (isTrue) {
          //点赞
          likesButton.value.style.color = "#ec625c";
          isTrue = false;
        } else {
          //取消点赞
          likesButton.value.style.color = "#5a5a5a";
          isTrue = true;
        }
      }
    };

    //加载更多评论
    const handleLoadMore = () => {
      page.value = page.value + 1;
      getData(nId, page.value);
    };

    //重新加载
    const isReLoad = () => {
      comment.list = [];
      comment.total = 0;
      getData(nId, page.value);
    };

    return {
      isLogin,
      isLikes,
      comment,
      hotweek,
      content,
      likesButton,
      handleLoadMore,
      isReLoad,
    };
  },
};

//获取资讯内容
function useNewsContent(nId) {
  const content = ref();
  const getData = () => {
    getNewsContent(nId).then((data) => {
      content.value = data.result[0];
    });
  };

  getData();
  return { content };
}

//获取每周最热
function useHotWeek() {
  const hotweek = ref();
  const getData = () => {
    getHotArticles().then((data) => {
      hotweek.value = data.result;
    });
  };

  getData();
  return { hotweek };
}

//获取评论内容
function useComment(comment) {
  const getData = (nId, current) => {
    getComment(nId, current).then((data) => {
      data.result.list.forEach((item) => {
        comment.list.push(item);
      });

      comment.total = data.result.total;
    });
  };
  return { getData };
}
</script>

<style scoped>
.container {
  width: 100%;
  padding-right: 30px;
  padding-left: 30px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}

.list_container {
  padding-bottom: 0;
}

.newsPage_main {
  padding-bottom: 3.125rem;
}

.newsPage_inner {
  display: flex;
}

.newsPage_content {
  width: 70%;
}

.newsPage_r {
  width: 30%;
  margin-left: 30px;
  flex: 0 0 auto;
}

.newPage_cover {
  display: block;
  width: 100%;
  background: #dcdcdc;
  border-radius: 4px;
  vertical-align: middle;
}

.originalPage_titleGroup {
  margin-bottom: 2em;
}

.originalPage_title {
  font-size: 32px;
  font-weight: 600;
  color: #323232;
  line-height: 1.375em;
  margin-bottom: 12px;
}

.originalPage_desc {
  font-size: 1rem;
  color: #5a5a5a;
  margin-top: 0;
  margin-bottom: 1rem;
}

.originalPage_userInfo {
  display: flex;
  align-items: center;
  font-size: 14px;
  margin-bottom: 36px;
}

.avatar {
  display: inline-flex;
  align-items: center;
  word-break: break-all;
  font-size: 0.75rem;
  --avatar-size: 2.25rem;
  line-height: 1.125rem;
}

.avatar-md {
  font-size: 0.875rem;
  --avatar-size: 2.75rem;
  line-height: 1.375rem;
}

.avatar-md .avatar_img {
  width: 2.75rem;
  height: 2.75rem;
  border-radius: 50%;
  background: #dcdcdc;
}

.avatar_text {
  margin-left: 1em;
}

.u_color-gray-info {
  color: #8e8e93;
}
.u_color-category,
.u_color-notification {
  color: #ff3d1d;
}

.newsPage_story {
  display: flex;
  flex: 1 1 auto;
  align-items: stretch;
}

.newsPage_news {
  flex: 0 1 auto;
  width: 100%;
}

.story {
  font-size: 18px;
  line-height: 1.8;
  word-break: break-all;
  word-wrap: break-word;
  text-align: justify;
  color: #464646;
}

.story_block {
  margin: 40px 0;
}

.d-flex {
  display: flex;
}

.justify-content-between {
  justify-content: space-between;
}

.text_nowrap {
  white-space: nowrap;
}

a[role="button"] {
  cursor: pointer;
}

.originalButton {
  display: inline-block;
  padding: 0 1.71429em;
  height: 3.2em;
  border-radius: 9999px;
  font-size: 0.9375rem;
  line-height: 3.2em;
  text-align: center;
  font-weight: 600;
  background: #f6f6f6;
  color: #5a5a5a;
}

.svg-inline--fa,
svg:not(:root).svg-inline--fa {
  overflow: visible;
}

.o_vote_icon-withNumber {
  margin-right: 8px;
}

.svg-inline--fa {
  display: inline-block;
  font-size: inherit;
  height: 1em;
  vertical-align: -0.125em;
}
.am_card.am_card-bg {
  background: #f6f6f6;
}
.hotOriginals {
  margin: 0;
  display: flex;
  flex-direction: column;
}

.hotOriginals_header {
  flex: 0 0 auto;
}
.am_card_header {
  padding: 0 1.25rem;
  border-bottom: 1px solid #e6e6e6;
  line-height: 3.625rem;
  font-size: 1.125rem;
  font-weight: 700;
  margin-bottom: 0;
}

.hotOriginals_body {
  flex: 1 1 auto;
  overflow-y: auto;
  padding-right: 20px;
}

.am_card_block,
.am_card_inner {
  padding: 1.25rem;
}

.sideOriginals {
  padding-left: 0;
  list-style: none;
}

.sideOriginal {
  display: flex;
  margin-bottom: 2.5rem;
}

.sideOriginal_content {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.sideOriginal > img {
  flex: 0 0 auto;
  object-fit: cover;
  margin-right: 10px;
  width: 6.875rem;
  height: 4.6875rem;
  border-radius: 4px;
}

.sideOriginal_content > h3 {
  font-size: 0.875rem;
}

.sideOriginal_content > p {
  margin: 0;
  font-size: 0.75rem;
  color: #8e8e93;
}
</style>
