<template>
  <div class="newsBanner">
    <div class="container">
      <div class="section">
        <!--        标题-->
        <h2 class="title">
          <a href="#"
            >专题
            <span class="pm_3">
              <svg
                t="1645494758486"
                class="icon"
                viewBox="0 0 1024 1024"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
                p-id="3356"
              >
                <path
                  d="M409.307429 167.789714l304.274285 302.08a61.878857 61.878857 0 0 1 18.285715 45.494857 61.878857 61.878857 0 0 1-18.285715 45.494858l-304.274285 302.08c-24.283429 24.137143-64.073143 24.283429-88.502858 0.146285l0.438858 0.438857-2.925715-3.072a61.659429 61.659429 0 0 1 0.146286-80.310857l3.510857-3.803428 262.729143-260.827429L321.974857 254.537143a61.908114 61.908114 0 0 1-3.657143-84.114286l2.925715-3.218286 3.510857-3.218285c24.576-20.48 61.586286-19.017143 84.553143 3.803428z"
                  p-id="3357"
                ></path>
              </svg> </span
          ></a>
        </h2>
        <!--      专题列表-->
        <div class="topics_list row">
          <div class="topics_item"><a href="#"></a></div>
          <div class="topics_item"><a href="#"></a></div>
          <div class="topics_item"><a href="#"></a></div>
          <div class="topics_item"><a href="#"></a></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeMainTopic",
};
</script>

<style scoped>
.newsBanner {
  background-color: #fcfcfc;
  padding: 1.875rem 0;
  overflow: hidden;
}

.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}

.topics_list {
  overflow: hidden;
  margin: 0;
  padding: 0;
}

.topics_item {
  flex: 0 0 25%;
  max-width: 25%;
  padding-left: 15px;
  padding-right: 15px;
}

.topics_item a {
  display: block;
  padding-bottom: 119.84733%;
  height: 0;
  position: relative;
  overflow: hidden;
  background-color: #5a5a5a;
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: cover;
  border-radius: 4px;
  background-image: url(https://image.gcores.com/255d17a0-0342-429d-8202-d3493da1fc5b.jpg?x-oss-process=image/resize,limit_1,m_fill,w_524,h_632/quality,q_90);
}
</style>
