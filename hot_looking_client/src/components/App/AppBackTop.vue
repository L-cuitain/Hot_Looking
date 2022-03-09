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
    </div>
  </div>
</template>

<script>
export default {
  name: "AppBackTop",
  props: ["scrollTop"],
  setup(props, { emit }) {
    const upTop = () => {
      emit("goTop");
    };
    return { upTop };
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
</style>
