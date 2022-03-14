<template>
  <div class="originalPage_comments">
    <div class="comments">
      <div class="commentsMana">
        <h3 class="commentsMana_title">评论区</h3>
        <div class="commentsMana_input_container">
          <img
            src="https://alioss.gcores.com/page_resources/misc/avatar-default.png"
            class="commentsMana_input_authorThumb rounded-circle"
          />
          <div class="commentsMana_input_wrapper" @click="handleInput">
            <textarea
              class="commentsMana_input_text"
              :placeholder="textPlaceHolder"
              :disabled="isLogin"
              v-model="commentTextarea"
              ref="textRef"
            ></textarea>
          </div>
          <button
            class="btn btn-primary btn-ellipse commentsMana_input_btn"
            :disabled="send"
            type="button"
            @click="handleConfirm"
          >
            发送
          </button>
        </div>
        <p class="commentsMana_sortTabs">
          <span
            >共
            <!-- -->{{ comment.total
            }}<!-- -->
            条<!-- -->评论</span
          >
        </p>
        <div v-if="comment.total !== 0">
          <ul class="list_unstyled comments">
            <li
              class="comment media"
              v-for="item in comment.list"
              :key="item.nId"
            >
              <!--              头像-->
              <div class="comment_avatar d-flex">
                <a class="avatar avatar-md" href="#">
                  <img class="avatar_img" :src="item.avatar" alt="" />
                </a>
              </div>
              <!--              评论内容-->
              <div class="media-body">
                <p class="comment_name">
                  <a href="#">
                    <strong>{{ item.name }}</strong>
                  </a>
                  <small>・{{ item.commentTime }}</small>
                </p>
                <p class="comment_body">
                  <span>{{ item.content }}</span>
                </p>
              </div>
            </li>
          </ul>
        </div>
        <div>
          <button
            class="loadMoreButton u_plainButton"
            type="button"
            :disabled="isClick"
            @click="handleLoadMore"
          >
            {{ loadMoreBtn }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, watch, onMounted } from "vue";
import { useRoute } from "vue-router";
import { ElMessage } from "element-plus";
import { useStore } from "vuex";
import { getUserComment } from "@/api/login";

export default {
  name: "Comments",
  props: ["comment"],
  emits: ["loadMore", "reloading"],
  setup(props, { emit }) {
    let timer;
    const store = useStore();
    const user = store.state.user;
    const route = useRoute();
    const id = route.params.id;
    const isLogin = ref(user.profile.token === "");
    const textPlaceHolder = ref("");
    const send = ref(true);
    const commentTextarea = ref("");
    const textRef = ref();
    const loadMoreBtn = ref("已显示全部内容");
    const isClick = ref(true);
    //判断是否登录
    onMounted(() => {
      if (isLogin.value) {
        textPlaceHolder.value = "您需要登录才能评论";
      } else {
        textPlaceHolder.value = "有什么想说的...";
      }
    });

    //文本域点击事件
    const handleInput = () => {
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
            message: "您需要登录才能评论",
            type: "error",
          });
        }, 600);
      }
    };

    //监听文本域
    watch(commentTextarea, () => {
      //判断文本域是否有内容
      if (commentTextarea.value) {
        textRef.value.style.height = "200px";
        send.value = false;
      } else {
        textRef.value.style.height = "0px";
        send.value = true;
      }
    });

    //判断评论是否加载完毕
    watch(
      props.comment,
      () => {
        if (props.comment.total !== props.comment.list.length) {
          isClick.value = false;
          loadMoreBtn.value = "加载更多";
        } else {
          isClick.value = true;
          loadMoreBtn.value = "已显示全部内容";
        }
      },
      { immediate: true }
    );

    //点击加载更多事件
    const handleLoadMore = () => {
      isClick.value = true;
      loadMoreBtn.value = "加载中";
      emit("loadMore");
    };

    //点击发布
    const handleConfirm = () => {
      //判断是否有内容
      if (commentTextarea.value) {
        getUserComment(
          id,
          user.profile.uId,
          commentTextarea.value,
          new Date().toLocaleString()
        ).then((data) => {
          commentTextarea.value = "";
          emit("reloading");
          ElMessage({
            showClose: true,
            message: data.message,
            type: "success",
          });
        });
      }
    };

    return {
      isLogin,
      send,
      textRef,
      commentTextarea,
      handleInput,
      loadMoreBtn,
      handleLoadMore,
      isClick,
      textPlaceHolder,
      handleConfirm,
    };
  },
};
</script>

<style scoped>
.originalPage_comments {
  padding: 3.75rem 0;
  margin: 0 auto;
  background: #f7f7f8;
}

.originalPage_comments .commentsMana {
  width: 800px;
  max-width: 100%;
  padding: 0 15px;
  margin: 0 auto;
}

.commentsMana {
  margin-top: 50px;
  font-size: 15px;
  color: #323232;
}

.commentsMana_title {
  font-size: inherit;
  font-weight: 600;
  margin: 0 0 22px;
  color: #323232;
}

.commentsMana_input_container {
  display: flex;
  align-items: flex-start;
  position: relative;
  margin: 8px 0;
}

.commentsMana_input_authorThumb {
  flex: 0 0 auto;
  width: 2.93333em;
  height: 2.93333em;
  margin-right: 1.06667em;
}
.rounded-circle {
  border-radius: 50%;
}

.commentsMana_input_wrapper {
  margin-right: 1.06667em;
}

.commentsMana_input_wrapper {
  flex: 1 1 auto;
  overflow: hidden;
}

.commentsMana_input_text {
  display: block;
  width: 100%;
  height: 0;
  min-height: 2.93333em;
  line-height: 1.46667em;
  padding: 0.73333em 16px;
  resize: none;
  transition: all 0.2s ease-in-out;
  border-radius: 25px;
  background: #e5e6e6;
  border: none;
  color: #464646;
  overflow: hidden;
}

.btn-primary {
  background-color: #323232;
  border-color: #323232;
  color: #fff;
}

.btn-primary:disabled {
  background-color: #323232;
  border-color: #323232;
  color: #fff;
}

.btn:disabled {
  opacity: 0.65;
}

.commentsMana_input_btn {
  flex: 0 0 auto;
  height: 2.93333em;
  line-height: 2.93333em;
  padding-top: 0;
  padding-bottom: 0;
  font-size: inherit;
}

.btn-ellipse {
  border-radius: 1.28571em;
}

textarea {
  margin: 0;
  font-family: inherit;
  font-size: inherit;
  line-height: inherit;
  border: solid 0px;
  outline: none;
}
.commentsMana_sortTabs {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  margin: 30px 0;
  border-bottom: 1px solid #e6e6e6;
  padding-bottom: 18px;
  color: #323232;
  font-weight: 600;
}

.list_unstyled {
  padding-left: 0;
  list-style: none;
}

.comments {
  margin-top: 20px;
}

.comment,
.comments li {
  margin-bottom: 20px;
}

.media {
  display: flex;
  align-items: flex-start;
}
.comment_avatar {
  margin-right: 1.06667em;
}

.d-flex {
  display: flex !important;
}

.media-body {
  flex: 1;
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

.avatar-md .avatar_img {
  width: 2.75rem;
  height: 2.75rem;
}

.avatar .avatar_img {
  width: 2.25rem;
  height: 2.25rem;
}
.avatar_img img,
img.avatar_img {
  border-radius: 50%;
  background: #dcdcdc;
}

.comment p,
.comments li p {
  margin: 12px 0;
}

.comment_name {
  margin: 0.97778em;
  color: #5a5a5a;
}

.comment_name small {
  color: #8e8e93;
}

.small,
small {
  font-size: 80%;
  font-weight: 400;
}

.comment_name strong {
  color: #323232;
}

b,
strong {
  font-weight: 700;
}

element.style {
}
.comment p,
.comments li p {
  margin: 12px 0;
}
.comment_body {
  color: #464646;
  word-break: break-all;
}

.loadMoreButton.disabled,
.loadMoreButton[disabled] {
  cursor: default;
  opacity: 0.7;
}

.loadMoreButton {
  display: block;
  width: 100%;
  max-width: 100%;
  margin: 30px auto 0;
  border-radius: 4px;
  padding: 15px 0;
  background: #f6f6f6;
  border: none;
  user-select: none;
  font-size: 13px;
  line-height: 1;
  text-align: center;
  white-space: nowrap;
  color: #8e8e93;
  letter-spacing: 2px;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
}
.u_plainButton {
  border: none;
  background: #e5e6e6;
  color: inherit;
  font-weight: 400;
  outline: none;
}
</style>
