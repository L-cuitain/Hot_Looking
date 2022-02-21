<template>
  <div class="main">
<!--    导航-->
    <div class="nav">
      <div class="container">
        <div class="row">
          <!--      轮播图-->
          <el-carousel height="420px" class="main_carousel" :interval="5000" arrow="always">
            <el-carousel-item v-for="item in 4" :key="item">
              <h3>{{ item }}</h3>
            </el-carousel-item>
          </el-carousel>
          <!--        推荐专题  -->
          <div class="commend commend_topics">
            <a href="#"></a>
          </div>
        </div>
<!--        推荐资讯-->
        <div class="row">
          <div class="commend commend_info">
            <div class="commend_info_img">图片</div>
            <div class="commend_info_card">
              <div class="commend_info_category">分类</div>
              <div class="commend_info_content">
                <h3>这是标题</h3>
                <p>这是标题内容</p>
              </div>
              <div class="commend_info_btm">
                <div class="commend_info_btm_user">
                  <img src="@/assets/logo/热瞩H.png" alt="">
                  <div class="avatar_text">
                    <h3>用户名</h3>
                    <div>4小时前</div>
                  </div>
                </div>
                <div class="commend_info_btm_comment">
                  <span class="mr_3"><el-icon><Pointer /></el-icon> 15</span>
                  <span><el-icon><ChatDotSquare /></el-icon> 10</span>
                </div>
              </div>
            </div>
          </div>
          <div class="commend commend_info">
            <div class="commend_info_img">图片</div>
            <div class="commend_info_card">
              <div class="commend_info_category">分类</div>
              <div class="commend_info_content">
                <h3>这是标题</h3>
                <p>这是标题内容</p>
              </div>
              <div class="commend_info_btm">
                <div class="commend_info_btm_user">
                  <img src="@/assets/logo/热瞩H.png" alt="">
                  <div class="avatar_text">
                    <h3>用户名</h3>
                    <div>4小时前</div>
                  </div>
                </div>
                <div class="commend_info_btm_comment">
                  <span class="mr_3"><el-icon><Pointer /></el-icon> 15</span>
                  <span><el-icon><ChatDotSquare /></el-icon> 10</span>
                </div>
              </div>
            </div>
          </div>
          <div class="commend commend_info">
            <div class="commend_info_img">图片</div>
            <div class="commend_info_card">
              <div class="commend_info_category">分类</div>
              <div class="commend_info_content">
                <h3>这是标题</h3>
                <p>这是标题内容</p>
              </div>
              <div class="commend_info_btm">
                <div class="commend_info_btm_user">
                  <img src="@/assets/logo/热瞩H.png" alt="">
                  <div class="avatar_text">
                    <h3>用户名</h3>
                    <div>4小时前</div>
                  </div>
                </div>
                <div class="commend_info_btm_comment">
                  <span class="mr_3"><el-icon><Pointer /></el-icon> 15</span>
                  <span><el-icon><ChatDotSquare /></el-icon> 10</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ChatDotSquare , Pointer } from '@element-plus/icons-vue';

export default {
  name: "MainPage",
  components:{
    ChatDotSquare,
    Pointer
  }
}
</script>

<style scoped>
.main{
  overflow: hidden;
}
.nav{
  background-color: #f7f7f8;
  padding: 20px 0 30px 0;
}

.el-carousel__item{
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

.main_carousel{
  flex: 0 0 66.66667%;
  max-width: 66.66667%;
  margin-bottom: 30px;
  box-sizing: border-box;
  padding-left: 15px;
  padding-right: 15px;
}

.container{
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}

.commend{
  background-color: #fff;
  border-radius: 10px;
  margin-left: 15px;
  margin-right: 15px;
  box-sizing: border-box;
  margin-bottom: 30px;
  overflow: hidden;
}

.commend_topics{
  flex: 0 0 30%;
  max-width: 30%;
  height: 420px;
}

.row{
  display: flex;
  flex-wrap: wrap;
  padding-left: -15px;
  padding-right: -15px;
}

.commend_info{
  flex: 0 0 30.6%;
  max-width: 30.6%;
  height: 400px;
}

.commend_info_img{
  position: relative;
  display: block;
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: cover;
  padding-bottom: 46.85185%;
  background-color: #fff;
}

.commend_info_card{
  padding: 1.25rem;
}

.commend_info_category{
  font-size: .75rem;
  line-height: 1.1;
  color: #ff3d1d;
}

.commend_info_content{
  margin: 1.06667em 0 0;
  overflow: hidden;
}

.commend_info_content>h3{
  font-size: 1.125rem;
  line-height: 1.4rem;
  max-height: 2.8rem;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
  margin: 0;
}

.commend_info_content>p{
  margin: 0.85714em 0 0;
  color:#5a5a5a;
  font-size: .875rem;
  line-height: 1.5em;
  max-height: 4.5em;
  overflow: hidden;
}

.commend_info_btm{
  display: flex;
  margin: 2.875rem 0 0;
  font-size: .92857em;
  line-height: 2.30769em;
  white-space: nowrap;
  justify-content: space-between;
}

.commend_info_btm_user{
  display: inline-flex;
  font-size: 10px;
  line-height: 16px;
}

.commend_info_btm_user>img{
  width: 26px;
  height: 26px;
  border-radius: 50%;
}

.avatar_text{
  margin-left: 1em;
}

.avatar_text>h3{
  margin: 0;
}

.avatar_text>div{
  color:#8e8e93;
}

.commend_info_btm_comment>span{
  vertical-align: -3%;
}

.mr_3{
  margin-right: 1rem
}
</style>