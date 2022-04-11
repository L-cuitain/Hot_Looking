<template>
  <div class="pageHeader">
    <div class="pageHeader_bg"></div>
    <div class="pageHeader_cover"></div>
    <div class="pageHeader_inner" v-if="specifyCollection">
      <div class="pageHeader_body">
        <div class="container">
          <h3 class="mb_3">{{ specifyCollection.colTitle }}</h3>
          <p>{{ specifyCollection.colSummary }}</p>
        </div>
      </div>
      <div class="pageHeader_footer_container">
        <div class="pageHeader_footer">
          <div class="pageHeader_actions">
            <span
              >{{ specifyCollection.colNum }} 人已订阅<button
                class="btn btn-ellipse ml_3"
                :class="isTrue ? 'btn_active' : 'btn_light'"
                type="button"
                @click="handleSubscription"
              >
                {{ isTrue ? "已订阅" : "订阅" }}
              </button></span
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";
import { getSpecifyCollection } from "@/api/collections";
import { useRoute } from "vue-router";
import { ElMessage } from "element-plus";
import { useStore } from "vuex";
import { getIsSubCol, getAddUserCol, getCancelUserCol } from "@/api/login";

export default {
  name: "CollectionsDetailPageNav",
  setup() {
    const store = useStore();
    const user = store.state.user;

    const router = useRoute();
    const colId = router.params.id;
    //判断登录状态
    let timer;
    const isLogin = ref(user.profile.token === "");
    const isTrue = ref(false);

    onMounted(() => {
      getIsSubCol(user.profile.uId, colId).then((data) => {
        if (data.result.length > 0 && data.result[0].subInfo === "已订阅") {
          isTrue.value = true;
        } else {
          isTrue.value = false;
        }
      });
    });

    const { specifyCollection } = useSpecify(colId);
    //订阅
    const handleSubscription = () => {
      //判断登录状态
      if (isLogin.value) {
        //防抖
        if (timer) {
          clearTimeout();
        }
        //如果未登录 弹框提醒
        timer = setTimeout(() => {
          ElMessage({
            showClose: true,
            message: "您需要登录才能订阅",
            type: "error",
          });
        }, 600);
      } else {
        if (isTrue.value) {
          getCancelUserCol(user.profile.uId, colId);
          isTrue.value = false;
        } else {
          ElMessage({
            showClose: true,
            message: "订阅成功",
            type: "success",
          });
          getAddUserCol(user.profile.uId, colId);
          isTrue.value = true;
        }
      }
    };
    return { colId, specifyCollection, handleSubscription, isTrue };
  },
};

function useSpecify(colId) {
  const specifyCollection = ref();
  const getData = () => {
    getSpecifyCollection(colId).then((data) => {
      specifyCollection.value = data.result[0];
    });
  };
  getData();
  return { specifyCollection };
}
</script>

<style scoped>
h3 {
  line-height: 1.3;
  font-size: 1.53125rem;
  font-weight: 600;
}

.pageHeader {
  position: relative;
  box-sizing: content-box;
  color: #fff;
  background-color: #878787;
  overflow: hidden;
}

.pageHeader_bg {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background-image: url("https://image.gcores.com/60177d4d-e7d3-4462-9e9f-5c711eff552d.png?x-oss-process=image/resize,limit_1,m_fixed,w_200,h_200/quality,q_90/bright,-20/blur,r_50,s_50/format,jpg");
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: cover;
}

.pageHeader_cover {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.06);
}

.pageHeader_inner {
  position: relative;
  margin: 0 10px;
}

.pageHeader_body {
  position: relative;
}

.container {
  display: flex;
  min-height: 13.125rem;
  padding-top: 1.25rem;
  padding-bottom: 1.25rem;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.pageHeader_footer_container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
}

.pageHeader_footer {
  position: relative;
  height: 65px;
}

.pageHeader_actions {
  right: 0;
  position: absolute;
  bottom: 15px;
  line-height: 35px;
}

.pageHeader_actions span {
  font-family: PingFangSC, Open Sans, Helvetica Neue, Arial, Hiragino Sans GB,
    Microsoft YaHei, WenQuanYi Micro Hei, sans-serif;
  font-size: 0.875rem;
  font-weight: 400;
}

.btn_light {
  color: #212529;
  background-color: #f8f9fa;
  border-color: #f8f9fa;
}

.btn_light:hover {
  color: #212529;
  background-color: #e2e6ea;
  border-color: #dae0e5;
}

.btn_active {
  background-color: #c7ccd2;
  border-color: #c7ccd2;
  color: #fff;
}

.btn:not(:disabled):not(.disabled) {
  cursor: pointer;
}

.btn-ellipse {
  border-radius: 1.28571em;
}

.gtabs > ul {
  display: flex;
  overflow-x: auto;
  margin: 0;
  padding-left: 0;
  list-style: none;
}

.gtabs li:first-child {
  margin-left: -1.5625rem;
}

li {
  display: list-item;
  text-align: -webkit-match-parent;
}

.gtabs li a {
  padding: 0 1.5625rem;
  display: inline-block;
}

.gtabs .gtab_text {
  position: relative;
  display: inline-block;
  padding: 20px 4px;
  color: #fff;
  border-bottom: 3px solid transparent;
}

.is_active .gtab_text {
  border-bottom: 2px solid #fff;
}
</style>
