<template>
  <div class="login">
    <div class="sessionPage">
      <div>
        <RouterLink to="/home" class="sessionPage_logo">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            version="1.1"
            id="Layer_1"
            x="0px"
            y="0px"
            width="286px"
            height="39px"
            viewBox="0 0 286 39"
            enable-background="new 0 0 286 39"
            xml:space="preserve"
          >
            <image
              id="image0"
              width="286"
              height="39"
              x="0"
              y="0"
              href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAR4AAAAnCAMAAADuFdc1AAAABGdBTUEAALGPC/xhBQAAACBjSFJN AAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAAANlBMVEX///8AAABFRkdFRkdF RkdFRkdFRkdFRkdFRkdFRkdFRkdFRkdFRkdFRkdFRkdFRkdFRkf////h5HwBAAAAEHRSTlMAAER3 IlVmu8yZETOI3e6qSID9RwAAAAFiS0dEAIgFHUgAAAAJcEhZcwAABFwAAARcAXRhQL8AAAAHdElN RQfmAwkMFAloCfHwAAAJwnpUWHRSYXcgcHJvZmlsZSB0eXBlIHhtcAAAeJztXVuyozgM/dcqegnE NjYsJzfAX1fN5yx/jmQILwMG7lSZKk9qcnOJbenoYcmSu5v+/fsP/fnz5+WqwpL+6M5VrrAvq+2P LZ1RhVW2tM7WttWNUm338/PTKYXntTX8pHS6NI0uTOMKozG2sjWZyr0dJpbavU1bGoufWFBrTFJK d7ot3vrjKv12lcVE2zAx+1IF/24/tnWavyOmAG6M7ZgP/fZffIcLJ+MyePbDM8x3hirKyjRlQYqZ 65w80qVqtVUN+HlprSs8cbrGs5cuda0rrbRRHzxVusAzqzr8rPH+0oZUIw/f/EjewfTipRie/wyQ CrxY/S6VMcaOAEkQ+i8ZZOUMXoV+A1Tn5D/VOgxSrfDthH7NL+FH4V3hvSG/iGqcdtASy8VVAAdJ 8fcjL0uOwA6UB9UoW7PsCCrtbAsW+wEQvAJtiJo5hKTfK6j9a6E11sUalHDUjtrEZ6jENoBbgeeC AUIJBWvVk6JDWgXMrQPkDkD40wZZ2qC7mr7mYf6iNQ9YVgc0WEBuyn5G7fE4vJeYV9qG8AZdQSKe 4muLYkjALF/TwOtAlq4KGQs2U6IBYc+oamdM6aw3hj2itEeVdwsHc8OYrlRigJ1IClsHL+/FwoZb vIPqD/HFC4XcaOCLjqWxx5dfnnmiSA0ZuJI9y1E/6cgE5+RkGwG7FU8+43PDnIEcMb3lZvHdMsTk sGXwZlFCcuwyquRFO/vR7XTDpXLtVdh8jf5uqA6LVqXEFJ6GnU6rWn9EKRMytKYTzV1pjP+pW62I t0veKmXbbPAZysZnxA3h6A3mCvXTPynwWvHiF6Nx1QNO+gBl/fjXlBtmggLccDTR2I7fEn62uFks fIYj3oGgcFcvuZEocpGb1aK0ycl6r35zTIYVQ8f9UsyTFhIFxQ0/JkbD9JIDHtzDfMBqjc8KzhNc 4LvMECo5CXEb0MJTwGc9hlLOqZgcNhNsM8T7jCRPi51mywO3INJKQl9ohr2+YQkZkYRhb7O288Jd ypbCU8/w4hekEC+D4ON48TNpOfVY9KqbCn+YsRlFYrU1KIvuamtlkEFttfid874d2Qxz6LqeDoQd z8VcQTvC3tZQ6EVXNBRS0E7IjpPNStj9LsRpnJagLVE2Rl9+hYhtJI4nmujrIk9+BbrjXwGtXfOv qfbojn8FLHv0L2RyNUcOHhivs1+zoxLHrF5n5zhZb4SbvnbGz/qF7vvZoffH+hkLnMTPPnIAxYHp jJ7mUHdkFCtuzwbF8XEcrmjkIF5L07E+F9kwyC0O91KfldPKifbNARo0G07rdAtTbZgun49AoAUH H3+mHUeSH7qXiMqp9c3xn89tWLCVgx+yR936ETih1CTFpbfGGK7G8EkKqn1JevriKogkz05zCaiB icAIkaSCP+SOJZJ5/Iafio9ZWkom35x1j/4e39RP5JOIdiWbGp9T/cRZgUpGeP5DiiDGgrNkqWu8 83GzAX98PKrwCeB4B8enCpwX/Aw/HRarBRx/qvA/REArUEHejpVBhpVX+xofoHzCC321Yzw48ANe gIP3BOOPENjRLB+lGq4q4aEVnZR4Bu1wpQ1QFSsET6FVTNX4bomjoxh+IqwM6XEtagZAd+Bf3zId zMG9IraRazsmXcodx9IL1+QkwBNHeJje5HTaizIw2I8Nk1tBW9A7cNXRGGhuDdeNgY7px0mO5lCc gxOWLInx2BtXEaD+2Btc7IwW6Tud8zV8wjIv1qCRrZWte15M2aqlUEQxZcrtJrmoM21MoKIF2svp BN13Dm/vfBR9SUXxkmOsoF1yDHwPGzLe1kkiV80RQJzgJZGKP1UwfzgHPnFFnvsS0I/EMH4BwxwB 3XOMEQlFOoYvB73EPepVOWhm2ZccYzRUuucYo1/QPceIyLODZsHcsEqc2F2rupEkhYec97/Ds0is /9EvlKFm0GZ+dcX/9qs1J/xvyCEN0iyYBQIPHyashB5xSglMSL043bIciErJJiUMiNs6y9lkwWkN p7lLCKf9j7agRPtfX46lkANe8T8KOeAV/6NTVf4dchRywCv+RyEHvOJ/dP48HfY/On+ePrSj/QAo rZ6WPRAkAwkinQ2EQeMtuMii/PGbqfijJZSqpNHEgAsMghyslkTVd5k78AXDmDenKNCR5a5+J/cN AgfQJScDIzRyci+9Ce5HV9IburO9TrVLX/UKRBxxLqY44UPNhkAnml1ZFRa6pu6ltumqupfa3o0i Z5x52CFvF8ciSmP7zjwEU7qbzQ6kIo5Zy2w2XJChMxWZSUFmRZ7uZrND/KMz0XQvmNLdbHaIbnQ3 m1V9MKW72eyO9wdMcCebHUbQ3Wx2J8+eDg5XZibjvqUfbmZWx6WfRbVotpsa2c+IN7RrpfANYXvx 9vdVYr1uksLStRx2nsKWcrlik/5umWzKvdTl6E41lHcOfFdysZNbPupqNXQNLbpoGIQmJVG6XxP1 VTC6VBNd8WMdXamJrsrE0l+bGbptNl1kuMr07svEZX/FsI83pPna5Ge8vrQ18IgAnLasBm+yH751 OEzUTnZBecktyP7znOwwm5bTj4CVdZgsRdLdmD6SpQ26gWklpAbVGAleczJs2dvDwyC/F8MmV2dK zef+l0TwFkbJZSbeJD7jnbDl8GF0cGObUkEcqx0HzE9ZGSM5HJuB/mpSwd7tnJSfQ9uTjqBNiMIL KEBV+w1ia0qY5Exrk/bb4tbskstZyJI7v+RvO7MbLu87x6YVKzu69/q/FjoDJnlo18GkBy2yKf4M aJE1tmdAi7eyB0C76jJJQvsd/08DWmSF/RnQIiujz4AWa2WPgHbNZRKF9hv+nwq04FnkqdAOb9Y9 CVrkTZZnQLviMslCu+//6UCLvMrwDGiR99ieAS3Gyh4D7bzLJAztrv+nBO2wK/okaJG97GdAi7yk 8wxoZ10maWj3/D8taJF/OOcZ0A7/2NmToEXePX4GtHMukzi0O/6fGrTI+0fPgBZ5k+UZ0A4vnz4J Wm5mpgotNzMThZabmalCy83MRKHlZmaq0HIzM1VouZmZKLTczEwVWm5mJgotNzNThZabmalCy83M RKHlZmaq0HIzM1FouZmZKrTczEwVWm5mJgotNzNThZabmalCy83MRKHlZmaq0HIzM1FouZmZKrTc zEwVWm5mJgotNzNThZabmYlCy83MVKHlZmaq0HIzM1FouZmZKrTczEwUWm5mpgotNzNThZabmYlC y83MVKHlZmaq0HIzM1FouZmZKrTczEwUWm5mpgotNzOH1qH+6M5V/b9p8MN/Db8q+C//t4b/ORfn lNKdbuk/bMVeZxkJ5ecAAAABb3JOVAHPoneaAAACMElEQVRo3u2a7RaCIAyGE1QUlbj/q+2UaePT gSzr6P6JY+x9cgnC7XbZhjH+MVaZVoN7HLY3PGCsXp1ajrE2PBCzfWFqzGlHDIaUAPFw/TFu4WHg nv60Ch2xrn27Rb1WE+GBuO0L0+NOB8RgaAk78PRbSXSSCI8eCuFBSMjFsxl64UOApyuDByUhD0+D 0TwS4QEJ7sCDk5CHZ0KJlkR4VF0AD1JCDp4BFVq3RHje7rvwYCXk4OG42JwKz5piPh6sBEI8ggzP Ul7keAQxnlEAM+q9AzfGRDz6jsEDRwD2VTws7CysQGZO9uQ8CY9uEHjcEfypxCT8KR4lLzwRPHN5 XXhAn87o3xyER1iLV2P2fSAeYS4EJmlOfb+FJ2oH4lFVVUOP0bx28ZSQ8D94nk29FaG78MAetQIu kw3v3Hieazhjod3Cy9Pjeb1S78BHTU6HE+N5TXWk0n47PZ45Xug71rfw/Oq8Z4kHy+sAPD87a37H C5SXi+dki4olnr+8LjxLm7e8LjxLm7e8Ljyrp6+8fhNPH37N0eHxlVc+npgEwm/NPR0eT3nl44lJ IN7IIcLjKS8SPFkbOQwXuyHE45ZXGh6shKxNZIUJPX8tp8Ij7V3gNDxYCVl4UI+m89dTFI/z+yfi wUnIO4IgEezdh6csnmrchQcnIfN8z7AdvHFTKovHKq9EPCgJ2afDho0DIMpDpzAeq7xS8SAk7Dhb WLX3MP6OS19ChfGY5ZWMZ1PCjOYBxkqYM55pivAAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDMt MDlUMTI6MjA6MDkrMDA6MDBsRo8qAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAzLTA5VDEyOjIw OjA5KzAwOjAwHRs3lgAAABN0RVh0ZGM6Zm9ybWF0AGltYWdlL3BuZ/+5Gz4AAAAVdEVYdHBob3Rv c2hvcDpDb2xvck1vZGUAM1YCs0AAAAAddEVYdHRpZmY6WFJlc29sdXRpb24ANzIwMDAwLzEwMDAw LW98QAAAAB10RVh0dGlmZjpZUmVzb2x1dGlvbgA3MjAwMDAvMTAwMDCsShlnAAAAFHRFWHR4bXA6 Q29sb3JTcGFjZQA2NTUzNTtUTfIAAAAodEVYdHhtcDpDcmVhdGVEYXRlADIwMjItMDItMjNUMDg6 MjA6NDArMDg6MDAhJAtaAAAAMXRFWHR4bXA6Q3JlYXRvclRvb2wAQWRvYmUgUGhvdG9zaG9wIEND IDIwMTcgKFdpbmRvd3Mpq6lDKAAAACp0RVh0eG1wOk1ldGFkYXRhRGF0ZQAyMDIyLTAyLTIzVDA5 OjM2OjI0KzA4OjAwilg/SwAAACh0RVh0eG1wOk1vZGlmeURhdGUAMjAyMi0wMi0yM1QwOTozNjoy NCswODowMLb8bPUAAAAXdEVYdHhtcDpQaXhlbFhEaW1lbnNpb24AMjg2f8GchAAAABZ0RVh0eG1w OlBpeGVsWURpbWVuc2lvbgAzORdxlw4AAAA+dEVYdHhtcE1NOkRlcml2ZWRGcm9tAHhtcC5kaWQ6 YTQ4NTBlNDItNWZkMC02NzQ2LWE1ZDQtMzg5Mjk5YTJmMGNkSNMdoAAAAEt0RVh0eG1wTU06RG9j dW1lbnRJRABhZG9iZTpkb2NpZDpwaG90b3Nob3A6ZjZiNTliMGUtOTQ0OC0xMWVjLThjMDgtYzdk OWEzN2Q4ZDE5D2Cr2gAAAD10RVh0eG1wTU06SW5zdGFuY2VJRAB4bXAuaWlkOjc3ODJmY2UxLTIx MTktMDc0YS1iYmM0LWEzNTQzNDUyYWM5Oahy2cgAAABFdEVYdHhtcE1NOk9yaWdpbmFsRG9jdW1l bnRJRAB4bXAuZGlkOmE0ODUwZTQyLTVmZDAtNjc0Ni1hNWQ0LTM4OTI5OWEyZjBjZH5uj4MAAAAA SUVORK5CYII="
            />
          </svg>
        </RouterLink>
        <div class="stepsModal_step">
          <el-tabs v-model="activeName" class="tabs">
            <el-tab-pane label="登录" name="Login"
              ><LoginPageLog
            /></el-tab-pane>
            <el-tab-pane label="注册" name="Register"
              ><LoginPageRes @tabChange="handleTabChange"
            /></el-tab-pane>
          </el-tabs>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import LoginPageLog from "@/views/login/components/LoginPageLog";
import LoginPageRes from "@/views/login/components/LoginPageRes";

export default {
  name: "LoginPage",
  components: {
    LoginPageLog,
    LoginPageRes,
  },
  setup() {
    const activeName = ref("Login");

    const handleTabChange = (tabName) => {
      activeName.value = tabName;
    };
    return { activeName, handleTabChange };
  },
};
</script>

<style scoped>
.login {
  width: 100%;
  height: 100%;
  padding: 0 0 0 20vw;
  background: url("../../assets/img.png");
  background-size: 1500px;
}

.sessionPage {
  display: flex;
  min-height: 100vh;
  padding: 100px 20px;
  position: relative;
  top: -5vh;
}

.sessionPage > div {
  max-width: 100%;
}

.sessionPage_logo {
  display: block;
  margin-bottom: 25px;
  color: #fff;
  opacity: 0.8;
  font-size: 30px;
}

.sessionPage .stepsModal_step {
  width: 430px;
  opacity: 1;
}

.stepsModal_step {
  position: relative;
  width: 500px;
  max-width: 100%;
  border-radius: 4px;
  background: #fff;
  padding: 2.5rem 4.375rem;
  opacity: 0;
  transition: opacity 0.8s ease;
}

:deep(.el-tabs__header) {
  margin-bottom: 30px;
}

:deep(.el-tabs__nav) {
  width: 100%;
}

:deep(.el-tabs__item) {
  width: 50%;
  color: #f56c6c;
  font-size: 20px;
  font-weight: 600;
  padding: 0;
  text-align: center;
}

:deep(.el-tabs__active-bar) {
  width: 145px;
  background-color: #323232;
}
</style>
