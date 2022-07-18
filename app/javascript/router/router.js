import Vue from 'vue';
import Router from 'vue-router';
import VueGtag from 'vue-gtag';

import Top from '../pages/TheTop.vue';
import Help from '../pages/TheHelp.vue';
import Term from '../pages/TheTerm.vue';
import PrivacyPolicy from '../pages/PrivacyPolicy.vue';
import Result from '../pages/TheResult.vue';
import Dragon from '../pages/TheDragon.vue';
import User from '../pages/TheUser.vue';
import PreviousResults from '../pages/PreviousResults.vue';
import PreviousShow from '../pages/PreviousShow.vue';
import NotFound from '../pages/shared/NotFound.vue';

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: Top,
      name: "Top",
    },
    {
      path: "/help",
      component: Help,
      name: "Help",
    },
    {
      path: "/term",
      component: Term,
      name: "Term",
    },
    {
      path: "/privacypolicy",
      component: PrivacyPolicy,
      name: "PrivacyPolicy",
    },
    {
      path: "/result",
      component: Result,
      name: "Result",
    },
    {
      path: "/dragons/:id",
      component: Dragon,
      name: "Dragon",
    },
    {
      path: "/users/:id",
      component: User,
      name: "User",
    },
    {
      path: "/previous",
      component: PreviousResults,
      name: "PreviousResults",
    },
    {
      path: "/previous/:id",
      component: PreviousShow,
      name: "PreviousShow",
    },
    {
      name: "NotFound",
      path: "*",
      component: NotFound,
      meta: { title: "お探しのページは見つかりませんでした" },
    },
  ],
  scrollBehavior(to, from, savedPosition){
    return { x: 0, y: 0}
  },
})

Vue.use(
  VueGtag,
  {
    config: { id: 'G-KGY5NNL00D' },
    appName: 'dratter',
    pageTrackerScreenviewEnabled: true,
  },
  router
);
router.afterEach((to, from) => {
  if (location.origin.includes('https://www.dragon-twitter-analysis.com'))
  gtag('config', 'G-KGY5NNL00D', { 'page_path': to.path });
})
export default router
