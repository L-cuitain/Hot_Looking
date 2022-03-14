<template>
  <div class="globalActions">
    <div>
      <div class="globalActions_item">
        <div @click="upTop">
          <svg
            t="1645515111573"
            class="icon"
            viewBox="0 0 1024 1024"
            version="1.1"
            xmlns="http://www.w3.org/2000/svg"
            p-id="5608"
            width="20"
            height="20"
          >
            <path
              d="M573.056 272l308.8 404.608A76.8 76.8 0 0 1 820.736 800H203.232a76.8 76.8 0 0 1-61.056-123.392L450.976 272a76.8 76.8 0 0 1 122.08 0z"
              p-id="5609"
            ></path>
          </svg>
        </div>
        <p class="up_hover">回到顶部</p>
      </div>
      <div class="globalActions_item" v-if="isLogin">
        <RouterLink to="/login">
          <svg
            t="1646818797445"
            class="icon"
            viewBox="0 0 1024 1024"
            version="1.1"
            xmlns="http://www.w3.org/2000/svg"
            p-id="1286"
            width="20"
            height="20"
          >
            <path
              d="M511.500975 977.900039c-218.273684 0-395.22807 12.246082-395.228071-127.650682 0-115.135127 69.454347-213.982066 187.603587-279.044991 58.126472-32.017466 135.645068 25.370448 207.624484 25.370449 82.069708 0 166.325146-54.264016 229.501754-16.168421C845.847953 643.632904 906.729045 731.301676 906.729045 850.249357c0 139.896764-176.954386 127.650682-395.22807 127.650682zM511.500975 551.922027c-140.00655 0-253.504873-113.498324-253.504874-253.504873S371.494425 44.912281 511.500975 44.912281s253.504873 113.498324 253.504873 253.504873-113.498324 253.504873-253.504873 253.504873z"
              fill="#E61D15"
              p-id="1287"
            ></path>
          </svg>
        </RouterLink>
        <p class="up_hover">登录</p>
      </div>
      <div class="globalActions_item" v-else>
        <RouterLink :to="`/users/${user.profile.uId}`">
          <img
            :src="user.profile.avatar"
            alt=""
            style="width: 100%; height: 100%"
          />
        </RouterLink>
        <p class="up_hover">{{ user.profile.name }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { useStore } from "vuex";

export default {
  name: "AppBackTop",
  props: ["scrollTop"],
  setup(props, { emit }) {
    const store = useStore();
    const user = store.state.user;
    //是否登录
    const isLogin = ref(user.profile.token === "");
    //点击回到顶部
    const upTop = () => {
      emit("goTop");
    };
    return { upTop, isLogin, user };
  },
};
</script>

<style scoped>
.globalActions {
  position: fixed;
  right: calc(1.125rem + 0.83333vw);
  bottom: calc(1.125rem + 0.83333vw);
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  width: 2.5rem;
  z-index: 1030;
}

.globalActions_item {
  position: relative;
  display: block;
  line-height: 1;
  text-align: center;
  width: 2.5rem;
  margin-top: 4px;
}

.globalActions_item > div {
  display: flex;
  margin: 0 auto;
  height: 2.5rem;
  align-items: center;
  justify-content: center;
  font-size: 1.00625rem;
  background: #fff;
  color: #5a5a5a;
  cursor: pointer;
  box-shadow: 0 0 8px rgb(0 0 0 / 10%);
}

.globalActions_item > a {
  display: flex;
  margin: 0 auto;
  height: 2.5rem;
  align-items: center;
  justify-content: center;
  font-size: 1.00625rem;
  background: #fff;
  color: #5a5a5a;
  cursor: pointer;
  box-shadow: 0 0 8px rgb(0 0 0 / 10%);
}

.up_hover {
  position: absolute;
  opacity: 0;
  font-size: 0.76562rem;
  padding: 6px 0.875rem;
  right: 50px;
  top: 31%;
  transform: translateY(-50%);
  transition: opacity 0.5s ease;
  background: #5a5a5a;
  color: #fff;
  border-radius: 4px;
  white-space: nowrap;
}

.globalActions_item > div:hover + .up_hover {
  opacity: 1;
}

.globalActions_item > a:hover + .up_hover {
  opacity: 1;
}
</style>
