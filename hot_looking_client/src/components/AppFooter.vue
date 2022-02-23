<template>
  <div class="footer">
    <div class="container">
      <div class="footer_logo">
        <img src="@/assets/logo/热瞩logo-白底.png" alt="">
      </div>
        <el-row :gutter="20">
          <el-col :span="16">
            <div class="footer_title"></div>
            <div class="footer_info">热瞩：拥有影视，生活，游戏方面的新闻资讯类平台</div>
          </el-col>
          <el-col :span="8">
            <div class="footer_title"></div>
            <div class="footer_info footer_text">项目构建：Zermetre</div>
          </el-col>
        </el-row>
    </div>
  </div>
</template>

<script>
export default {
  name: "AppFooter"
}
</script>

<style scoped>
.footer{
  padding: 3.9375rem 0;
  background: #f2f2f3;
  color: #323232;
}

.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}

.footer_logo{
  margin-bottom: 1.875rem;
}

.footer_title{
  margin-bottom: 1.25rem;
  border-bottom: 1px solid #b4b4b4;
}
.footer_info{
  font-size: .76562rem;
  color: #5a5a5a;
  line-height: 2.1;
}

.footer_text{
  text-align: right;
}
</style>