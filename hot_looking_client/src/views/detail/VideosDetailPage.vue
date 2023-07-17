<template>
  <AppLayout>
    <Suspense>
      <div class="video_page" v-if="content">
        <div class="videoPage_header gnav_next">
          <div class="videoPage_header_mask">
            <div class="container">
              <div class="videoEmbedPlayer_container">
                <div class="videoEmbedPlayer_embed">
                  <iframe
                    allowfullscreen="true"
                    frameborder="0"
                    framespacing="0"
                    border="0"
                    width="100%"
                    height="100%"
                    :src="content.url"
                  ></iframe>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="articlePage_body">
          <div class="story_container">
            <div class="mb_5">
              <p class="text-center u_fontSize-lg">参与者</p>
              <div class="text-center">
                <RouterLink
                  :to="`/users/${content.uId}`"
                  class="avatar avatar-lg avatar-v avatar-noBold mx-3 mb-3"
                  ><img class="avatar_img" :src="content.avatar" />
                  <div class="avatar_text">
                    <h3>{{ content.name }}</h3>
                  </div></RouterLink
                >
              </div>
            </div>
            <div class="originalPage_titleGroup originalPage_titleGroup-center">
              <h1 class="originalPage_title">
                {{ content.title }}
              </h1>
              <p class="originalPage_desc">{{ content.summary }}</p>
            </div>
            <p class="u_color-gray-desc text-center">
              <span class="mr_2">{{ content.releaseTime }}</span
              >发布于<RouterLink
                class="ml_1 u_color-category"
                :to="`/category/${content.lId}`"
                >{{ content.lName }}</RouterLink
              >
            </p>
          </div>
          <div class="articlePage_content">
            <div class="story_container story_enableImagePos">
              <div class="story story-show">
                <span>{{ content.content }}</span>
              </div>
            </div>
          </div>
          <div class="story_container mt_3">
            <div class="mt_5 justify-content-center d-flex">
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
import { reactive, ref } from "vue";
import { useRoute } from "vue-router";
import { ElMessage } from "element-plus";
import { getVideosContent, getVComment } from "@/api/detail";
import Comments from "@/components/Comments";
import { useStore } from "vuex";
import { getUserLikes } from "@/api/login";

export default {
  name: "VideosDetailPage",
  components: {
    AppLayout,
    AppFooter,
    Comments,
  },
  setup() {
    const store = useStore();
    const user = store.state.user;
    //获取路由id
    const route = useRoute();
    const vId = route.params.id;
    //判断登录状态
    let timer;
    const isLogin = ref(user.profile.token === "");
    const likesButton = ref();
    let isTrue = true;
    const page = ref(1);
    const comment = reactive({
      list: [],
      total: 0,
    });

    //获取请求内容
    const { content } = useVideoContent(vId);
    const { getData } = useVideoComment(comment);
    getData(vId, page.value);

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
          getUserLikes(content.value.category, 1, vId);
        } else {
          //取消点赞
          likesButton.value.style.color = "#5a5a5a";
          isTrue = true;
          getUserLikes(content.value.category, 1, vId);
        }
      }
    };

    //加载更多评论
    const handleLoadMore = () => {
      page.value = page.value + 1;
      getData(vId, page.value);
    };

    //重新加载
    const isReLoad = () => {
      comment.list = [];
      comment.total = 0;
      getData(vId, page.value);
    };

    return {
      vId,
      isLikes,
      content,
      comment,
      handleLoadMore,
      isReLoad,
      likesButton,
    };
  },
};

//获取视频内容
function useVideoContent(vId) {
  const content = ref();
  const getData = () => {
    getVideosContent(vId).then((data) => {
      content.value = data.result[0];
    });
  };
  getData();
  return { content };
}

//获取视频评论
function useVideoComment(comment) {
  const getData = (vId, current) => {
    getVComment(vId, current).then((data) => {
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
.gnav_next {
  padding-top: 60px;
}

.videoPage_header {
  position: relative;
  background: #323232;
  padding-bottom: 56.25%;
  overflow: hidden;
  margin-bottom: 3.125rem;
}

.videoPage_header_mask {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: cover;
  background-image: url(https://image.gcores.com/3c029db9-da73-4281-9753-05c870c17e46.jpg?x-oss-process=image/resize,limit_1,m_fixed,w_200,h_200/quality,q_90/bright,-20/blur,r_50,s_50/format,jpg);
}

.videoPage_header .container {
  padding: 20px 15px 50px;
  position: relative;
  z-index: 1;
  max-width: 1140px;
  margin: 0 15px;
}

.videoEmbedPlayer_container {
  position: relative;
  padding-bottom: 56.25%;
  color: #fff;
  background: rgba(0, 0, 0, 0.2);
}
.videoEmbedPlayer_embed {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.articlePage_body {
  padding-bottom: 2.625rem;
}

.story_container {
  width: 690px;
  padding-left: 15px;
  padding-right: 15px;
  max-width: 100%;
  margin: 0 auto;
}

.u_fontSize-lg {
  font-size: 1.00625rem;
}

.text-center {
  text-align: center;
  margin-bottom: 1rem;
  font-weight: 400;
  line-height: 1.5;
  font-family: PingFangSC, Open Sans, Helvetica Neue, Arial, Hiragino Sans GB,
    Microsoft YaHei, WenQuanYi Micro Hei, sans-serif;
}

.avatar-lg.avatar-v {
  width: 4.6875rem;
}

.avatar-v {
  flex-direction: column;
  text-align: center;
}

.avatar-lg {
  font-size: 0.875rem;
  --avatar-size: 3.4375rem;
  line-height: 1.71875rem;
}

.avatar {
  display: inline-flex;
  align-items: center;
  word-break: break-all;
  font-size: 0.75rem;
  --avatar-size: 2.25rem;
  line-height: 1.125rem;
}

.avatar-v .avatar_img {
  margin-bottom: 10px;
}

.avatar-lg .avatar_img {
  width: 3.4375rem;
  height: 3.4375rem;
}

.avatar_img img,
img.avatar_img {
  border-radius: 50%;
  background: #dcdcdc;
}

.avatar-noBold h3 {
  font-weight: 400;
}

.avatar h3 {
  margin: 0;
  font-size: 0.85rem;
  line-height: inherit;
}

.originalPage_titleGroup-center,
.originalPage_titleGroup-center .originalPage_desc,
.originalPage_titleGroup-center .originalPage_title {
  text-align: center;
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
  margin-bottom: 1rem;
}

.u_color-gray-desc {
  color: #5a5a5a;
  margin-bottom: 1rem;
  font-family: PingFangSC, Open Sans, Helvetica Neue, Arial, Hiragino Sans GB,
    Microsoft YaHei, WenQuanYi Micro Hei, sans-serif;
  font-size: 0.875rem;
  font-weight: 400;
  line-height: 1.5;
}

.u_color-category {
  color: #ff3d1d;
}
.articlePage_content {
  position: relative;
  display: flex;
  align-items: stretch;
}

.articlePage_content .story_container {
  position: relative;
  width: 1100px;
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
  font-size: 17px;
  line-height: 2;
  word-break: break-all;
  word-wrap: break-word;
  text-align: justify;
  color: #464646;
}

.story_container {
  width: 630px;
  padding-left: 15px;
  padding-right: 15px;
  max-width: 100%;
  margin: 0 auto;
}

.justify-content-center {
  display: flex;
  justify-content: center;
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
