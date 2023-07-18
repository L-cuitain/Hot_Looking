<template>
  <AppLayout>
    <Suspense>
      <div class="articlePage" v-if="content">
        <div class="articlePage_header articlePage_header-row">
          <div class="articlePage_header_image">
            <img :src="content.contentImg" alt="" />
          </div>
          <div class="articlePage_header_content">
            <div class="articlePage_header_content_inner story_container">
              <div class="originalPage_category">
                <RouterLink :to="`/category/${content.lId}`">{{
                  content.lName
                }}</RouterLink>
              </div>
              <div class="originalPage_titleGroup">
                <h1 class="originalPage_title">{{ content.title }}</h1>
                <p class="originalPage_desc">
                  {{ content.summary }}
                </p>
              </div>
              <div class="originalPage_userInfo">
                <RouterLink
                  class="avatar avatar-md"
                  :to="`/users/${content.uId}`"
                  ><img class="avatar_img" :src="content.avatar" />
                  <div class="avatar_text">
                    <span class="mr_2">{{ content.name }}</span>
                  </div></RouterLink
                ><span class="mr_2 u_color-gray-info">{{
                  content.releaseTime
                }}</span>
              </div>
            </div>
          </div>
        </div>
        <div class="articlePage_body">
          <div class="articlePage_content">
            <div class="story_container story_enableImagePos">
              <div class="story story-show">
                <span>{{ content.content }}</span>
              </div>
            </div>
          </div>
          <div class="story_container">
            <div class="mt_5 justify-content-between d-flex">
              <div class="text_nowrap">
                <a
                  @click="isLikes"
                  class="o_vote o_vote-up mr_3 originalButton"
                  role="button"
                  tabindex="0"
                  target="_blank"
                  ref="likesButton"
                  :style="{ color: isTrue ? '#ec625c' : '#5a5a5a' }"
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
import AppLayout from "../../components/App/AppLayout";
import AppFooter from "@/components/App/AppFooter";
import Comments from "@/components/Comments";
import { ref, reactive, onMounted } from "vue";
import { useRoute } from "vue-router";
import { ElMessage } from "element-plus";
import { getArticleContent, getAComment } from "@/api/detail";
import { getUserIsLikes, getUserLikes, getUserDisLikes } from "@/api/login";
import { useStore } from "vuex";

export default {
  name: "ArticlesDetailPage",
  components: {
    AppLayout,
    Comments,
    AppFooter,
  },
  setup() {
    const store = useStore();
    const user = store.state.user;
    //获取路由id
    const route = useRoute();
    const aId = route.params.id;
    //判断登录状态
    let timer;
    const isLogin = ref(user.profile.token === "");
    const likesButton = ref();
    //是否点赞
    let isTrue = ref(false);
    const page = ref(1);
    const comment = reactive({
      list: [],
      total: 0,
    });

    onMounted(() => {
      if (!isLogin.value) {
        getUserIsLikes(aId, user.profile.uId).then((data) => {
          isTrue.value = data.result === 1;
          if (isTrue.value) {
            likesButton.value.style.color = "#ec625c";
          } else {
            likesButton.value.style.color = "#5a5a5a";
          }
        });
      }
    });

    //获取请求内容
    const { content } = useArticleContent(aId);
    let { getData } = useArticleComment(comment);
    getData(aId, page.value);

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
        isTrue.value = !isTrue.value;
        if (isTrue.value) {
          //点赞
          getUserLikes(aId, user.profile.uId);
          likesButton.value.style.color = "#ec625c";
        } else {
          //取消点赞
          getUserDisLikes(aId, user.profile.uId);
          likesButton.value.style.color = "#5a5a5a";
        }
      }
    };

    //加载更多评论
    const handleLoadMore = () => {
      page.value = page.value + 1;
      getData(aId, page.value);
    };

    //重新加载
    const isReLoad = () => {
      comment.list = [];
      comment.total = 0;
      getData(aId, page.value);
    };

    return {
      aId,
      isLikes,
      content,
      comment,
      handleLoadMore,
      likesButton,
      isReLoad,
      isTrue,
    };
  },
};

//获取文章内容
function useArticleContent(aId) {
  const content = ref();
  const getData = () => {
    getArticleContent(aId).then((data) => {
      content.value = data.result[0];
    });
  };
  getData();
  return { content };
}

//获取文章评论
function useArticleComment(comment) {
  const getData = (aId, current) => {
    getAComment(aId, current).then((data) => {
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
.articlePage_header-row {
  padding: 0 3.75rem;
  display: flex;
  flex-direction: row-reverse;
  margin-top: 1.625rem;
  margin-bottom: 2.625rem;
  transition-property: height, opacity;
  transition-duration: 0.8s, 1.2s;
}
.articlePage_header,
.articlePage_header > * {
  transition-property: height, opacity;
  transition-duration: 0.8s, 1.2s;
}

.articlePage_body {
  margin-bottom: 1.65rem;
}

.articlePage_header_image {
  position: relative;
  display: flex;
  align-items: center;
  margin-bottom: 0;
  justify-content: flex-start;
  width: 50%;
  flex: 1 1 auto;
  background-color: #e5e4e5;
}

.articlePage_header_image > img {
  max-width: 100%;
  display: block;
  border-radius: 4px;
  background-color: #fff;
  object-fit: cover;
}

.articlePage_header_content {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  padding-right: 5.625rem;
  padding-left: 0;
  width: 50%;
  flex: 1 1 auto;
}

.articlePage_header_content_inner {
  width: 60%;
  padding: 0;
  margin: 0;
  max-width: 100%;
}

.originalPage_category {
  color: #ff3d1d;
  margin: 0 0 20px;
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

.originalPage_desc,
.originalPage_title {
  display: block;
  width: 100%;
  border: 0;
  padding: 0;
  resize: none;
  background: transparent;
}

.originalPage_desc {
  font-size: 1rem;
  color: #5a5a5a;
}

.originalPage_desc,
.originalPage_title {
  display: block;
  width: 100%;
  border: 0;
  padding: 0;
  resize: none;
  background: transparent;
}

.originalPage_userInfo {
  display: flex;
  align-items: center;
  font-size: 14px;
}

.avatar-md {
  font-size: 0.875rem;
  --avatar-size: 2.75rem;
  line-height: 1.375rem;
}

.avatar {
  display: inline-flex;
  align-items: center;
  word-break: break-all;
  font-size: 0.75rem;
  --avatar-size: 2.25rem;
  line-height: 1.125rem;
}

.u_color-gray-info {
  color: #8e8e93;
}

.avatar_text {
  margin-left: 1em;
}

.avatar-md .avatar_img {
  width: 2.75rem;
  height: 2.75rem;
}

.avatar_img img,
img.avatar_img {
  border-radius: 50%;
  background: #dcdcdc;
}

.articlePage_content {
  position: relative;
  display: flex;
  align-items: stretch;
}

.articlePage_content .story_container {
  position: relative;
}

.story_container.story_enableImagePos {
  width: 860px;
  padding-left: 100px;
  padding-right: 100px;
}

.story_enableImagePos {
  padding: 0 250px;
}

.story_container {
  width: 690px;
  padding-left: 15px;
  padding-right: 15px;
  max-width: 100%;
  margin: 0 auto;
}

.story {
  font-size: 18px;
  line-height: 1.8;
  word-break: break-all;
  word-wrap: break-word;
  text-align: justify;
  color: #464646;
}

.story span {
  line-height: 65px;
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
</style>
