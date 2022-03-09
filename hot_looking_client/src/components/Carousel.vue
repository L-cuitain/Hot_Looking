<template>
  <el-carousel
    height="420px"
    class="main_carousel"
    :interval="5000"
    arrow="always"
    v-if="data"
  >
    <el-carousel-item v-for="item in data" :key="item">
      <RouterLink
        :to="
          item.category === 'video'
            ? `/videos/detail/${item.vId}`
            : `/news/detail/${item.nId}`
        "
        class="a_cover"
      >
        <img :src="item.contentImg" alt="" style="width: 100%; height: 100%" />
      </RouterLink>
    </el-carousel-item>
  </el-carousel>
</template>

<script>
export default {
  name: "Carousel",
  props: ["data"],
};
</script>

<style scoped>
.el-carousel__item {
  border-radius: 10px;
}

.el-carousel__item h3 {
  color: #475669;
  font-size: 18px;
  opacity: 0.75;
  line-height: 420px;
  margin: 0;
  text-align: center;
  border-radius: 10px;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.main_carousel {
  flex: 0 0 100%;
  max-width: 100%;
  margin-bottom: 30px;
  box-sizing: border-box;
}
</style>
